#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "osqueue.h"
#include "threadPool.h"


void hello (void* a)
{
    printf( "%d. ", (int*)a);
    printf("hello\n");
}
void hello2 (void* a)
{
    sleep(6);
    printf( "%d. ", (int*)a);
    printf("hello\n");
}
void hello3 (void* a)
{
    sleep(1);
    printf( "%d. ", (int*)a);
    printf("hello\n");
}
void main()
{
    int i;

    ThreadPool* tp = tpCreate(3);

    for(i=0; i<1; ++i)
    {
        // tpInsertTask(tp,hello,1);
        tpInsertTask(tp,hello2,2);
        tpInsertTask(tp,hello2,2);
        tpInsertTask(tp,hello3,3);
        tpInsertTask(tp,hello,1);
        tpInsertTask(tp,hello,1);
        tpInsertTask(tp,hello,1);
    }
    //pthread_join(tp->insertMissions,NULL);
    //sleep(10);
    tpDestroy(tp,1);

}