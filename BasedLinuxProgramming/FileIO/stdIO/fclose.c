#include <stdio.h>

int main(int argc, char*argv[]){
    FILE *fp;
    if ((fp = fopen("test.txt","w+"))==NULL){
        printf("fopen error\n");
        return -1;
    }
    if(fclose(fp)==0){
    printf("fclose succeed\n");
    }
    return 0;
}
