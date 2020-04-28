#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <fcntl.h>
#define N 32

int main()
{
    int pfd;
    char buf[N];
    if((pfd = open("myfifo",O_RDONLY)) < 0){
        perror("open:");
        exit(-1);
    }
    while(read(pfd,buf,N) > 0){
        fputs(buf,stdout);
    }
    close(pfd);
    return 0;
}

