#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <time.h>
int main(int argc,char*argv[])
{
    //int chmod,fchmod  return 0 when succeed,root&owner have the power
   
    //int stat/lstat(arr of link file)/fstat:get file atrribute,return 0 when s
    
    //struct state:st_mode(&0170000)->filetype,macros->permissoin;
    //st_uid,st_gif,st_mtime,st_size...
    
    struct stat buf;
    int n;

    if(argc < 2){
        printf("Usage:%s <file>\n",argv[0]);
        return -1;
    }
    if(lstat(argv[1],&buf) < 0){
        perror("lstat:");
        return -1;    
    }
    switch(buf.st_mode & S_IFMT){
    case S_IFREG:
        printf("-");
        break;   
    case S_IFDIR:
        printf("d");
        break;
    }

    for(n=8;n>=0;n--){
        if(buf.st_mode & (1<<n)){
            switch(n % 3){
            case 2:
                printf("r");
                break;
            case 1:
                printf("w");
                break;
            case 0:
                printf("x");
                break;
            }
        }
         else{
                printf("-");
            }
    }
    struct tm *tp;
    printf(" %lu",buf.st_size);
    tp = localtime(&buf.st_mtime);
    printf(" %d-%02d-%02d",tp->tm_year+1900,tp->tm_mon+1,tp->tm_mday);
    printf(" %s\n",argv[1]);
    
    return 0;
}

