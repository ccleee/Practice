#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>
int main()
{
   // int pipe(int pfd[2]);return 0/EOF;pfd[0]:read;pfd[1]:write;
   pid_t pid1,pid2;
   char buf[32];
   int pfd[2];
   if(pipe(pfd)<0){
       perror("pipe:");
       exit(-1);
   }
   if((pid1 = fork()) < 0){
       perror("fork1");
       exit(-1);
   }
   else if(pid1==0){
       strcpy(buf,"I'm process1");
       write(pfd[1],buf,32);
       exit(0);
   }
   else{  //father process
       if((pid2 = fork()) < 0){
           perror("fork2");
           exit(-1);
       }
       else if(pid2==0){
           sleep(1);
           strcpy(buf,"I'm process2");
           write(pfd[1],buf,32);
           exit(0);
       }
       else{
           wait(NULL);
           read(pfd[0],buf,32);
           printf("%s",buf);
           wait(NULL);
           read(pfd[0],buf,32);
           printf("%s",buf);
       } 
   }
    return 0;
}

