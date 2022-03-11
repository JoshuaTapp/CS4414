#ifndef POOL_H_
#include <string>
#include <pthread.h>
#include <deque>
#include <map>
#include <semaphore.h>

class Task {
public:
    pthread_cond_t task_cv;
    int finished = 0;
    Task();
    virtual ~Task();

    virtual void Run() = 0;  // implemented by subclass
};

// class to handle queue and write/read safety
class WorkerQueue {    
public:
    pthread_mutex_t queue_lock;
    pthread_cond_t work_ready;
    std::deque<Task*> task_queue;

    WorkerQueue();
    
    ~WorkerQueue();

    Task* dequeueTask();

    bool enqueueTask(Task* task);
};

class NameMap {
public:
    std::map<std::string, Task*> name_map;
    pthread_mutex_t map_lock;

    NameMap();
    ~NameMap();
    void addToMap(std::string name, Task* task);
    Task* getTask(std::string name);
};

class ThreadPool {
public:
    pthread_mutex_t thread_lock;
    WorkerQueue* worker_queue;
    NameMap* name_map;
    pthread_t *ptids;
    int num_threads;
    bool stop = false;

    ThreadPool(int num_threads);

    // Submit a task with a particular name.
    void SubmitTask(const std::string &name, Task *task);
 
    // Wait for a task by name, if it hasn't been waited for yet. Only returns after the task is completed.
    void WaitForTask(const std::string &name);

    // Stop all threads. All tasks must have been waited for before calling this.
    // You may assume that SubmitTask() is not caled after this is called.
    void Stop();
};

struct thread_args {
    ThreadPool* pool; 

    thread_args(ThreadPool* tp) : pool(tp) {}
};
#endif
