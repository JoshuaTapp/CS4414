#include "pool.h"

Task::Task() {
    // * sema that signals the task is done, shared btw procs    
    if(sem_init(&this->done, 0, 0) == -1) {
        printf("Task Semaphore failed to intialize");
    }       
}

Task::~Task() {
    sem_destroy(&this->done);
}

ThreadPool::ThreadPool(int num_threads) {

    // * All the lovely mutexes for each need
    pthread_mutex_init(&this->threadpool_mutex, NULL);
    pthread_mutex_lock(&this->threadpool_mutex);

    pthread_mutex_init(&this->queue_mutex, NULL);
    pthread_mutex_init(&this->map_mutex, NULL);


    // * Semaphore to control access to name_map
    sem_init(&this->map_write, 0, 1);

    // * CVs
    pthread_cond_init(&this->task_avail, NULL);

    // * pthread_ids for the thread workers
    this->ptids = new pthread_t[num_threads];

    // * allow ThreadPool's threads to run
    stop_threads = false;
    this->num_threads = num_threads;

    // * create threads with their worker
    int rtn;
    for(int i = 0; i < num_threads; ++i) {
        rtn = pthread_create(&this->ptids[i], NULL, &WorkerThread, (void*) this);
        if(rtn) {
            printf("Failed pthread_create: %i\n", rtn);
            exit(-1);
        }
    }
    pthread_mutex_unlock(&this->threadpool_mutex);
}



void ThreadPool::SubmitTask(const std::string &name, Task* task) {
    // * add task to queue safely
    pthread_mutex_lock(&this->queue_mutex);
    this->task_queue.push_back(task);
    pthread_mutex_unlock(&this->queue_mutex);
    
    // * signal to threads that task is available
    pthread_cond_signal(&this->task_avail); 

    // * add {name, task} to map safely
    sem_wait(&this->map_write);
    this->name_map.emplace(name, task);
    sem_post(&this->map_write);
}

/*
    * Returns Task pointer from queue safely
    * When Stop() is called, returns nullptr
*/

Task* ThreadPool::GetTask() {
    pthread_mutex_lock(&this->queue_mutex);
    
    Task* task = nullptr;

    // * Wait for work if queue is empty
    while(task_queue.empty()) {
        pthread_cond_wait(&this->task_avail, &this->queue_mutex);
    }

    // * dequeue a task from task_queue
    task = this->task_queue.front();
    this->task_queue.pop_front();
    
    pthread_mutex_unlock(&this->queue_mutex);

    return task;
}

/*
    * Uses the Task's semaphore to wait until the task is done.
    * The if cond only execute if the Task has not been started
    * or the task is currently running when called.
*/
void ThreadPool::WaitForTask(const std::string &name) {
    Task* task = this->GetTaskFromMap(name);
    // * if this fails, the task is already done.
    if(task != nullptr) {
        // * Will only continue when task is done
        sem_wait(&task->done);
        sem_post(&task->done);
        delete task;
    }

    // * Now remove this entry from the name_map
    pthread_mutex_lock(&this->map_mutex);
    this->name_map.erase(name);
    pthread_mutex_unlock(&this->map_mutex);
}

Task* ThreadPool::GetTaskFromMap(const std::string &name) {

    sem_wait(&this->map_write);
    auto it = this->name_map.find(name);
    sem_post(&this->map_write);
    if(it != this->name_map.end()) {
        return it->second;
    }
    else return nullptr;
}


void ThreadPool::Stop() {
    
    pthread_mutex_lock(&this->threadpool_mutex);
    // * Tell threads to finish their current task
    this->stop_threads = true;
    pthread_mutex_unlock(&this->threadpool_mutex);

    // * Place null items on stack to get threads unstuck in GetTask()
    for(int i = 0; i < this->num_threads; ++i) {
        this->SubmitTask("", nullptr);
    }
    
    // * now that all threads are finished, join them
    for(int i = 0; i < this->num_threads; ++i) {
        if(pthread_join(this->ptids[i], NULL)) {
            printf("pthread_join() failed\n");
        }
    }
    
    // * Delete the things currently on Heap
    delete [] this->ptids;
    pthread_mutex_destroy(&this->threadpool_mutex);
    pthread_mutex_destroy(&this->queue_mutex);
    pthread_mutex_destroy(&this->map_mutex);
    pthread_cond_destroy(&this->task_avail);
    sem_destroy(&this->map_write);
}

/*
    * This is the function the threads within the thread pool
    * will execute. The function runs 
*/
void* ThreadPool::WorkerThread(void* args) {
    ThreadPool* pool = (ThreadPool*) args;

    while(true) { // ? What should be in here? a variable, or handle stop elsewhere?
        // * get task using thread safe method
        Task* task = pool->GetTask();   

        // * run task using the Task's implementation
        // * if we have a nullptr, then Stop() has been called.
        if(task != nullptr) {
            task->Run();     
            // * task->done = 1 now, WaitForTask() can proceed
            sem_post(&task->done);                 
        }
        else break;
        
                
              
        pthread_mutex_lock(&pool->threadpool_mutex);
        if(pool->stop_threads) break;
        pthread_mutex_unlock(&pool->threadpool_mutex);
    }
    return NULL;
}