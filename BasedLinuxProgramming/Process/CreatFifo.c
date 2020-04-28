#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <fcntl.h>

int main()
{
    //int mkfifo(path,mode);return 0/EOF && set errno
    if(mkfifo("myfifo",0666) < 0){
        perror("mkfifo");
        exit(-1);
    }
    return 0;
}

