#include <stdio.h>

int main(int argc, char*argv[]){
    FILE *fp;
    if ((fp = fopen("test.txt","w+"))==NULL){
        printf("fopen error\n");
        return -1;
    }
    printf("fopen succeed\n");
    return 0;
}

