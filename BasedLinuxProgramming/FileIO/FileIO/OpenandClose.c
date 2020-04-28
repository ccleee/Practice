#include <stdio.h>
#include<fcntl.h>
#include<errno.h>
#include<unistd.h>
int main()
{
    //open:return FID when succeed,EOF when failed,can't create device file
    int fd1;
    if((fd1 = open("1.txt",O_WRONLY|O_CREAT|O_TRUNC,0666))<0){
        perror("open:");
        return -1;
    }
    int fd2;
    if((fd2 = open("2.txt",O_RDONLY|O_CREAT|O_EXCL))<0){
        if(errno == EEXIST){
            perror("exist error");
        }
        else{
            perror("other error");
        }
    }

    //close:int close(int fd);return 0 when succeed
    close(fd1);
    close(fd2);
    return 0;
}

