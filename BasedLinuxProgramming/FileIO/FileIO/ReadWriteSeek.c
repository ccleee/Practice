#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
int main(int argc,char *argv[])
{
    //read: ssize_t read(int fd,void *buf,size_t count);
    //return number of bytes read when succeed,EOF when failed,0 when meet  end;
    int fd,n,total = 0;
    char buf[64];
    if(argc<3){
        printf("Usage:%s <file1> <file2>\n",argv[0]);
        return -1;
    }
    if((fd = open(argv[1],O_RDONLY)) < 0){
        perror("open");
    }
    while((n = read(fd,buf,64))>0){
        total += n;
    }

    //ssize_t write(int fd,void *buff,size_t count);
    //return real count when succeed
    int fd2;
    char buf2[20];
    if((fd2 = open(argv[2],O_WRONLY|O_CREAT|O_APPEND,0666))<0){
        perror("open2:");
        return -1;
    }
    while(fgets(buf2,20,stdin)!=NULL){
        if(strcmp(buf2,"quit\n")==0)  break;
        write(fd2,buf2,strlen(buf));
    }

    //off_t lseek(int fd,off_t offset,int whence);
    //return current r/w location,EOF when failed;
    return 0;
}

