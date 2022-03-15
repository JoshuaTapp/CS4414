#ifndef POOL_H_
#include <string>
#include <pthread.h>
#include <deque>
#include <map>
#include <semaphore.h>


class Task {
public:
    sem_t done;     // * Used by WaitForTask to signal task is complete

    Task();
    virtual ~Task();

    virtual void Run() = 0;  // implemented by subclass
};

class ThreadPool {
public:
    // * array that holds all the pthread ids
    pthread_t *ptids;

    // * Mutexes for ThreadPool, Queue, and Map
    pthread_mutex_t threadpool_mutex;
    pthread_mutex_t queue_mutex;
    pthread_mutex_t map_mutex;

    // * CV for GetTask/SubmitTask when queue is empty
    pthread_cond_t task_avail;

    // * map_write acts like a lock
    sem_t map_write;

    // * stop_threads controls WorkerThreads
    bool stop_threads;
    int num_threads;

    std::deque<Task*> task_queue;
    std::map<std::string, Task*> name_map;


    ThreadPool(int num_threads);

    // Submit a task with a particular name.
    void SubmitTask(const std::string &name, Task *task);
 
    // Wait for a task by name, if it hasn't been waited for yet. Only returns after the task is completed.
    void WaitForTask(const std::string &name);

    // Stop all threads. All tasks must have been waited for before calling this.
    // You may assume that SubmitTask() is not caled after this is called.
    void Stop();

    // * Used by WaitForTask to convert name -> Task* safely
    Task* GetTaskFromMap(const std::string &name);

    // * Consumer of Tasks from task_queue    
    Task* GetTask();

    // * Function pointer that runs Tasks
    static void* WorkerThread(void* args);
};
#endif
