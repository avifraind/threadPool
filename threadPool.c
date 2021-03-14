/*
 * avraham fraind 311519441 LATE-SUBMISSION
 */

#include <stdio.h>
#include <pthread.h>
#include "threadPool.h"

ThreadPool* tpCreate(int numOfThreads) {
    ThreadPool   *threadPool;
    pthread_t  thread;
    size_t     i;

    if (numOfThreads == 0)
        return NULL;

    threadPool             = calloc(1, sizeof(*threadPool));
    if (threadPool == NULL)
        return NULL;
    threadPool->num_of_threads = numOfThreads;
    threadPool->no_more_insert = false;
    threadPool->stop = false;
    if (pthread_mutex_init(&(threadPool->work_mtx), NULL)) {
        perror("Error in system call");
        return NULL;
    }
    if (pthread_cond_init(&(threadPool->work_conditional), NULL)) {
        perror("Error in system call");
        return NULL;
    }
    if (pthread_cond_init(&(threadPool->working_conditional), NULL)) {
        perror("Error in system call");
        return NULL;
    }
    if (pthread_cond_init(&(threadPool->finish_conditional), NULL)) {
        perror("Error in system call");
        return NULL;
    }
    threadPool->my_queue = osCreateQueue();
    if (threadPool->my_queue == NULL) {
        perror("Error in system call");
        return NULL;
    }

    for (i = 0; i < numOfThreads; i++) {
        if (pthread_create(&thread, NULL, tpThreadWorkFunction, threadPool)) {
            perror("Error in system call");
            return NULL;
        }
        pthread_detach(thread);
    }

    return threadPool;
}

void tpDestroy(ThreadPool* threadPool, int shouldWaitForTasks) {

    pthread_mutex_lock(&(threadPool->work_mtx));

    if (shouldWaitForTasks != 0) {
        tpWaitToEmptyQueue(threadPool);
    }

    threadPool->stop = true;
    osDestroyQueue(threadPool->my_queue);
    pthread_cond_broadcast(&(threadPool->work_conditional));
    pthread_mutex_unlock(&(threadPool->work_mtx));

    tpWaitToFinishThreads(threadPool);

    pthread_mutex_destroy(&(threadPool->work_mtx));
    pthread_cond_destroy(&(threadPool->work_conditional));
    pthread_cond_destroy(&(threadPool->working_conditional));

    free(threadPool);
}
void tpWaitToFinishThreads(ThreadPool *threadPool) {
    if (threadPool == NULL)
        return;

    pthread_mutex_lock(&(threadPool->work_mtx));
    while (1) {
        if ((!threadPool->stop && threadPool->num_of_working_threads != 0) || (threadPool->stop && threadPool->num_of_threads != 0)) {
            pthread_cond_wait(&(threadPool->working_conditional), &(threadPool->work_mtx));
        } else {
            break;
        }
    }
    pthread_mutex_unlock(&(threadPool->work_mtx));
}

void tpWaitToEmptyQueue(ThreadPool *threadPool) {
    if (!osIsQueueEmpty(threadPool->my_queue)) {
        threadPool->no_more_insert = true;
        pthread_cond_broadcast(&(threadPool->work_conditional));
        pthread_cond_wait(&(threadPool->finish_conditional), &(threadPool->work_mtx));
    }
}

int tpInsertTask(ThreadPool* threadPool, void (*computeFunc) (void *), void* param) {
    DataStruct *task;

    if (threadPool == NULL)
        return false;
    pthread_mutex_lock(&(threadPool->work_mtx));

    if (threadPool->stop == true || threadPool->no_more_insert == true) {
        pthread_mutex_unlock(&(threadPool->work_mtx));
        return false;
    }

    task = tpCreateDataStruct(computeFunc, param);
    if (task == NULL)
        return false;


    osEnqueue(threadPool->my_queue, task);

    pthread_cond_broadcast(&(threadPool->work_conditional));
    pthread_mutex_unlock(&(threadPool->work_mtx));

    return true;
}



DataStruct* tpCreateDataStruct(thread_task_t func, void* arg) {
    DataStruct* task;

    if (func == NULL) {
        return NULL;
    }

    task = malloc(sizeof(*task));
    if (task == NULL) {
        perror("Error in system call");
        return NULL;
    }
    task->arg = arg;
    task->func = func;
    return task;
}

void tpDestroyDataStruct(DataStruct* task) {
    if (task == NULL) {
        return;
    }
    free(task);
}

void *tpThreadWorkFunction(void* arg) {
    ThreadPool* threadPool = arg;

    while (1) {
        tpWaitForTask(threadPool);

        if (threadPool->stop)
            break;

        tpDoTask(threadPool);

        tpAfterDoingTask(threadPool);
    }

    threadPool->num_of_threads--;
    pthread_cond_signal(&(threadPool->working_conditional));
    pthread_mutex_unlock(&(threadPool->work_mtx));
    return NULL;
}

void tpWaitForTask(ThreadPool *threadPool) {
    pthread_mutex_lock(&(threadPool->work_mtx));

    while (osIsQueueEmpty(threadPool->my_queue) && !threadPool->stop)
        pthread_cond_wait(&(threadPool->work_conditional), &(threadPool->work_mtx));
}

void tpDoTask(ThreadPool *threadPool) {
    DataStruct *task;

    task = osDequeue(threadPool->my_queue);
    threadPool->num_of_working_threads++;
    if (osIsQueueEmpty(threadPool->my_queue)) {
        pthread_cond_broadcast(&(threadPool->finish_conditional));
    }
    pthread_mutex_unlock(&(threadPool->work_mtx));

    if (task != NULL) {
        task->func(task->arg);
        tpDestroyDataStruct(task);
    }
}

void tpAfterDoingTask(ThreadPool *threadPool) {
    pthread_mutex_lock(&(threadPool->work_mtx));
    threadPool->num_of_working_threads--;

    if (!threadPool->stop && threadPool->num_of_working_threads == 0 && osIsQueueEmpty(threadPool->my_queue))
        pthread_cond_signal(&(threadPool->working_conditional));
    pthread_mutex_unlock(&(threadPool->work_mtx));
}

