#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>
int main()
{
    //pid_t wait(int *status); return pid of son;one recycle one;
    //status save the return and end method of son process;
    //if status == NULL,refuse to receive the return parameter of the recycled process
    
    int status; 
    pid_t pid;

    if((pid = fork())<0){
        perror("fork:");
        exit(-1);
    }
    else if(pid == 0){
        sleep(1);
        exit(2);
    }
    else{
        wait(&status);
        printf("%x\n",status);
    }

    //int waitpid(pid,&status,options):return pid of son or 0(son desen't end);
    waitpid(pid,&status,0);
    waitpid(-1,&status,WNOHANG);
    return 0;
}

