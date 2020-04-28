#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
int main()
{
    //exec:replace the content of current process
    //can differ father and son processes
    //used in shell
    

    //int execl(const char *path,const char *arg,...);
    //int execlp(const char *file,const char *arg,...);file:seek file name  in PATH
    //exec when succeed,EOF when failed;
   
    if(execl("/bin/ls","ls","-a","-l","/etc",NULL)<0){
        perror("execl:");
    }
    if(execlp("ls","ls","-a","-l","/etc",NULL)<0){
        perror("execlp:");
    }


    //int execv(const char *path,char *const argv[]);
    //int execvp(const char *file,char *const argv[]);
    
    char *arg[]={"ls","-a","-l","/etc",NULL};
    if(execv("/bin/ls",arg)<0){
        perror("execv:");
    }
    if(execvp("ls",arg)<0){
        perror("execvp:");
    }

    //int system(const char *command):return the return of command
    //current process will wait until the command end
    return 0;
}

