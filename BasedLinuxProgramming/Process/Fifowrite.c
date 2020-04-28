#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <fcntl.h>
#define N 32
int main()
{
    char buf[N];
    int pfd;

    if ((pfd = open("myfifo",O_WRONLY)) < 0){
       perror("open:");
       exit(-1);
    }
    while(1){
        fgets(buf,N,stdin);
        if(strncmp("quit",buf,4)==0){
             break;
        }
        write(pfd,buf,N);
    }
    close(pfd);
    return 0;
}

