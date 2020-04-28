#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <stdlib.h>
#include <sys/stat.h>
int main()
{
    pid_t pid;
    FILE *fp;
    time_t t;
    int i;

    if((pid = fork()) < 0){
        perror("fork:");
        return -1;
    }
    else if(pid > 0){
        exit(0);
    }
    setsid();
    umask(0);
    chdir("/tmp");
    for(i=0;i<getdtablesize();i++){
        close(i);
    }
    if((fp = fopen("time.log","a"))==NULL){
        perror("fopen:");
        exit(-1);
    }
    while(1){
        time(&t);
        fprintf(fp,"%s",ctime(&t));
        fflush(fp);
        sleep(1);
    }
    return 0;

}

