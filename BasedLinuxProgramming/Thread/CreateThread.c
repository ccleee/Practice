#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

char message[32] = "hello world";
void *thread_func(void *arg);
int main()
{
    //int phtread_create:return 0 when secceed;errno when failed;
    //int pthread_join:return 0,return errno;HANG
    //void pthread_exit(void *retval);
    pthread_t a_thread;
    void *result;
    if(pthread_create(&a_thread,NULL,thread_func,NULL)!=0){
        perror("pthread_create:");
        exit(-1);
    }
    pthread_join(a_thread,&result);
    printf("result is %s\n",result);
    printf("message is %s\n",message);
    return 0;

}
void *thread_func(void *arg){
    sleep(1);
    strcpy(message,"marked by thread");
    pthread_exit("thank you for waiting fot me");
}
