#include "pool.h"

Task::Task() {
    pthread_cond_init(&this->task_cv, NULL);
}

Task::~Task() {
    pthread_cond_destroy(&this->task_cv);
}

void* WorkerThread(void* args) {
    ThreadPool* pool = (ThreadPool*) args;
    
    while(!pool->stop) {
        //printf("Starting Task\n");
        Task* task = pool->worker_queue->dequeueTask();
        pthread_mutex_init(&task->task_lock, NULL);
        
        task->Run();

        pthread_mutex_lock(&task->task_lock);
        task->finished = true;

        pthread_cond_signal(&task->task_cv);

        while(task->waited_on) {
            pthread_cond_wait(&task->task_cv, &task->task_lock);
        }
        delete task;
    }
    sem_post(&pool->threads_done);
    return NULL;
}

ThreadPool::ThreadPool(int num_threads) {
    pthread_mutex_init(&this->thread_lock, NULL);
    pthread_mutex_lock(&this->thread_lock);
    
    sem_init(&this->threads_done, 1, num_threads);
    this->worker_queue = new WorkerQueue();
    this->name_map = new NameMap();
    this->num_threads = num_threads;
    
    // Initialize thread array
    ptids = new pthread_t[num_threads];
    pthread_mutex_unlock(&this->thread_lock);
    int rtn;
    for(int i = 0; i < num_threads; ++i) {
        rtn = pthread_create(&this->ptids[i], NULL, &WorkerThread, (void*) this);
        if(rtn) {
            printf("Failed pthread_create: %i\n", rtn);
            exit(-1);
        }
        sem_wait(&this->threads_done);
    }
    pthread_mutex_unlock(&this->thread_lock);
    

}

void ThreadPool::SubmitTask(const std::string &name, Task* task) {
    int success = this->worker_queue->enqueueTask(task);
    if(success) {
        this->name_map->addToMap(name, task);
    }
}

void ThreadPool::WaitForTask(const std::string &name) {
    Task* task = this->name_map->getTask(name);
    if(task != nullptr) {
        pthread_mutex_lock(&task->task_lock);
        task->waited_on = true;
        while(!task->finished) {
            pthread_cond_wait(&task->task_cv, &task->task_lock);
        }
        task->waited_on = false;
        pthread_cond_signal(&task->task_cv);
        pthread_mutex_unlock(&task->task_lock); 
    }
}

void ThreadPool::Stop() {


    pthread_mutex_lock(&this->thread_lock);
    this->stop = true;
    delete this->name_map;
    delete this->worker_queue;


    for(int i = 0; i < num_threads; ++i) {
        sem_wait(&this->threads_done);
        if(pthread_join(ptids[i], NULL)) {
            printf("pthread_join() failed\n");
        }
    }

   
    delete [] this->ptids;
    pthread_mutex_unlock(&this->thread_lock);

}


WorkerQueue::WorkerQueue() {
    pthread_mutex_init(&queue_lock, NULL);
    pthread_cond_init(&work_ready, NULL);
}
    
WorkerQueue::~WorkerQueue() {
    pthread_mutex_destroy(&queue_lock);
    pthread_cond_destroy(&work_ready);
}

Task* WorkerQueue::dequeueTask() {
    Task* task = nullptr;
    pthread_mutex_lock(&queue_lock);
    while(task_queue.empty()) {
        pthread_cond_wait(&work_ready, &queue_lock);
    }
    task = task_queue.front();
    task_queue.pop_front();
    pthread_mutex_unlock(&queue_lock);
    return task;
}

bool WorkerQueue::enqueueTask(Task* task) {
    bool success = false;
    pthread_mutex_lock(&queue_lock);
    task_queue.push_back(task);
    if(task_queue.back() == task) {       // make sure task was actually pushed on queue.
        success = true;
        pthread_cond_signal(&work_ready);   // ! NOTE: might have to remove this if I get an error
    }
    pthread_mutex_unlock(&queue_lock);
    return success;
}


NameMap::NameMap() {
    pthread_mutex_init(&map_lock, NULL);
}

NameMap::~NameMap() {
    pthread_mutex_destroy(&map_lock);
}

void NameMap::addToMap(std::string name, Task* task) {
    pthread_mutex_lock(&map_lock);
    this->name_map.emplace(std::pair(name, task));
    pthread_mutex_unlock(&map_lock);

}

Task* NameMap::getTask(std::string name) {
    pthread_mutex_lock(&map_lock);
    auto it = this->name_map.find(name);
    if(it != this->name_map.end()) {
        return it->second;
    }
    pthread_mutex_unlock(&map_lock);

    return nullptr;
}

