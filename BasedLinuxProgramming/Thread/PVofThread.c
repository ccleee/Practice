#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <semaphore.h>
char buf[32];
sem_t sem_r,sem_w;
void *function(void *arg);
int main(void)
{
    //PV
    //int sem_init(sem_t *sem,int pshared,unsigned int val);return 0 when succeed;
    //int sem_wait;int sem_post;return 0;
    pthread_t a_thread;

    if(sem_init(&sem_r,0,0) < 0){
        perror("sem_r_init:");
        exit(-1);
    }
    if(sem_init(&sem_w,0,1) < 0){
        perror("sem_w_init:");
        exit(-1);
    }
    if(pthread_create(&a_thread,NULL,function,NULL)!=0){
        perror("pthread_create:");
        exit(-1);
    }
    printf("input 'quit' to exit\n");
    do{
        sem_wait(&sem_w);
        fgets(buf,32,stdin);
        sem_post(&sem_r);
    }while(strncmp(buf,"quit",4)!=0);
    return 0;
}
void *function(void *arg){
    while(1){
        sem_wait(&sem_r);
        printf("you enter %d characters\n",strlen(buf));
        sem_post(&sem_w);
    }
}

