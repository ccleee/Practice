#include <stdio.h>
#include <signal.h>
#include <unistd.h>

void handler(int signo);
int main()
{
    //int kill(pid_t pid,int sig);pid==0:same group;pid == -1:all
    //int raise(int sig);to current process
    //return 0/EOF
    

    //int alarm(unsigned int seconds);return remained time of last alarm
    //seconds == 0 : cancel the alarm
    alarm(3);
    pause();
    printf("I have been waken up!\n");

    //int pause(void); block until signal comes;return -1,errno:4:EINTR
    
    //void(*signal(int signo,void(*handler)(int)))(int); return signo/SIG_ERR
    //handler:SIG_IGN,SIG_DEL
    signal(SIGINT,handler);
    signal(SIGQUIT,handler);
    while(1) pause();
    return 0;
}

void handler(int signo){
    if(signo == SIGINT){
        printf("I have a SIGINT");
    }
    if(signo == SIGQUIT){
        printf("I have a SIGQUIT");
    }
}
