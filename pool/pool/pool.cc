#include "pool.h"

Task::Task() {
    pthread_cond_init(&this->task_cv, NULL);
}

Task::~Task() {
    pthread_cond_destroy(&this->task_cv);
}

void* WorkerThread(void* args) {
    ThreadPool* params = (ThreadPool*) args;
    Task* task;
    pthread_mutex_lock(&params->thread_lock);
    while(!params->stop) {
        pthread_mutex_unlock(&params->thread_lock);

        //printf("Starting Task\n");
        task = params->worker_queue->dequeueTask();
        task->Run();
        task->finished = 1;
        pthread_cond_signal(&task->task_cv); 

        // TODO: signal for any task waiting
        delete task;
        pthread_mutex_lock(&params->thread_lock);
    }
    pthread_mutex_unlock(&params->thread_lock);

    return NULL;
}

ThreadPool::ThreadPool(int num_threads) {
    pthread_mutex_init(&this->thread_lock, NULL);
    this->worker_queue = new WorkerQueue();
    this->name_map = new NameMap();
    this->num_threads = num_threads;
    
    // Initialize thread array
    ptids = new pthread_t[num_threads];
    
    int rtn;
    for(int i = 0; i < num_threads; ++i) {
        rtn = pthread_create(&this->ptids[i], NULL, &WorkerThread, (void*) this);
        if(rtn){
            printf("Failed pthread_create: %i\n", rtn);
            exit(-1);

        }
    }
}

void ThreadPool::SubmitTask(const std::string &name, Task* task) {
    int success = this->worker_queue->enqueueTask(task);
    if(success) {
        this->name_map->addToMap(name, task);
    }
}

void ThreadPool::WaitForTask(const std::string &name) {
    pthread_mutex_t fakeLock;
    pthread_mutex_init(&fakeLock, NULL);
    pthread_mutex_lock(&fakeLock);
    Task* task = this->name_map->getTask(name);
    if(task != nullptr) {
        while(task->finished) {
            pthread_cond_wait(&task->task_cv, &fakeLock);
        }
    }
    pthread_mutex_unlock(&fakeLock);

    
}

void ThreadPool::Stop() {
    pthread_mutex_lock(&this->thread_lock);
    this->stop = true;
    pthread_mutex_unlock(&this->thread_lock);

    for (int i = 0; i < num_threads; ++i) {
      pthread_join(this->ptids[i], NULL);
    }
    delete this->worker_queue;
    delete this->name_map;
    delete [] this->ptids;
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

}

Task* NameMap::getTask(std::string name) {
    auto it = this->name_map.find(name);
    if(it != this->name_map.end()) {
        return it->second;
    }
    return nullptr;
}

