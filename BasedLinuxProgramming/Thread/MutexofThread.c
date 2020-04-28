#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>

pthread_mutex_t lock;
int value1,value2,count;
void *function(void *arg);
int main()
{
    //int pthread_mutex_init(pthread_mutex_t *mutex,const pthread_mutexattr_t *attr);
    //int pthread_mutex_lock/unlock:remenber unlock
    //return 0/errno;
    
    pthread_t a_thread;
    if(pthread_mutex_init(&lock,NULL)!=0){
        perror("pthread_mutex_init:");
        exit(-1);
    }
    if(pthread_create(&a_thread,NULL,function,NULL) < 0){
        perror("pthread_create:");
        exit(-1);
    }
    while(1);{
        count++;
#ifdef _LOCK_
    pthread_mutex_lock(&lock);
#endif
    value1 = count;
    //usleep(100);
    value2 = count;
#ifdef _LOCK_
    pthread_mutex_unlock(&lock);
#endif
    }
    return 0;
}

void *function(void *arg){
    while(1){
#ifdef _LOCK_
        pthread_mutex_lock(&lock);
#endif
        if(value1!=value2){
           printf("value1:%d value2:%d\n",value1,value2);
           usleep(1000000);
        }
#ifdef _LOCK_
        pthread_mutex_unlock(&lock);
#endif
    }   
}

