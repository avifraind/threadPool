#ifndef __THREAD_POOL__
#define __THREAD_POOL__

#include <sys/types.h>
#include <stdbool.h>
#include <stdlib.h>
#include "osqueue.h"
typedef void (*thread_task_t)(void *arg);

typedef struct thread_pool
{
    struct os_queue* my_queue;
    pthread_mutex_t  work_mtx;
    pthread_cond_t   work_conditional;
    pthread_cond_t   working_conditional;
    pthread_cond_t   finish_conditional;
    size_t           num_of_working_threads;
    size_t           num_of_threads;
    bool             stop;
    bool             no_more_insert;
}ThreadPool;

typedef struct data_struct
{
    thread_task_t      func;
    void              *arg;
}DataStruct;


ThreadPool* tpCreate(int numOfThreads);

void tpDestroy(ThreadPool* threadPool, int shouldWaitForTasks);

int tpInsertTask(ThreadPool* threadPool, void (*computeFunc) (void *), void* param);

void tpWaitToFinishThreads(ThreadPool *threadPool);

void tpWaitToEmptyQueue(ThreadPool *threadPool);

DataStruct* tpCreateDataStruct(thread_task_t func, void* arg);

void tpDestroyDataStruct(DataStruct* task);

void *tpThreadWorkFunction(void* arg);

void tpDoTask(ThreadPool *threadPool);

void tpAfterDoingTask(ThreadPool *threadPool);

void tpWaitForTask(ThreadPool *threadPool);

#endif