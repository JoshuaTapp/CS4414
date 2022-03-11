#include "pool.h"

Task::Task() {
    //pthread_cond_init(&this->task_cv, NULL);
}

Task::~Task() {
    //pthread_cond_signal(); // TODO: Is this even neccessary?
    //pthread_cond_destroy(&this->task_cv);
}

ThreadPool::ThreadPool(int num_threads) {
    // initialize synch tools
    sem_init(&pool_sema, 1, num_threads);

    this->worker_queue = WorkerQueue();
    this->name_map = NameMap();
    
    /*
    // Initialize thread array
    pthread_t *ptids = new pthread_t[num_threads];
    for(int i = 0; i < num_threads; ++i) {
        pthread_t t = 0;
        ptids[i] = t;
    }

    while(1) {
        sem_wait(&pool_sema);
        pthread_mutex_lock(&queue_lock);
        if(task_queue.empty()) {
           Task* t;

        }

    }
    */

}

void ThreadPool::SubmitTask(const std::string &name, Task* task) {
    int success = this->worker_queue.enqueueTask(task);
    if(success) {
        this->name_map.addToMap(name, task);
    }
}

void ThreadPool::WaitForTask(const std::string &name) {
}

void ThreadPool::Stop() {
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
    if(&task_queue.back() == &task) {       // make sure task was actually pushed on queue.
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

}