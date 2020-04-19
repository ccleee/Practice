#include <stdio.h>
#include <string.h>
#include <errno.h>
int main(int argc, char*argv[]){
    FILE *fp;
    if ((fp = fopen("testx.txt","r+"))==NULL){
        perror("fopen");
        printf("fopen:%s\n",strerror(errno));
        return -1;
    }   
    return 0;
}   


