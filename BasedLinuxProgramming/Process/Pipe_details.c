#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>

int main()
{   
    int count = 0; 
    int pfd[2];
    char buf[1024];

    if(pipe(pfd) < 0){
        perror("piep:");
        exit(-1);
    }
    while(1){
        write(pfd[1],buf,1024);
        printf("wrote %dk byete\n",++count);
    }
    return 0;

}

