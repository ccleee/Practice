#include <stdio.h>
#define SIZE 12
int main(int argc, char*argv[])
{
    //get by line
    //gets:uncertain size,not safe,may cause buffer overrun
    //fgets:returned when get (size-1) characters or meet'\n'(always include'\0')
    char buf[SIZE];
    fgets(buf,SIZE,stdin);
    printf("%s",buf);

    //put by line
    //input until meet EOF and puts will append '/n' while fputs dosen't 
    puts("hello world");

    FILE *fp;
    char buf2[]="hello world";
    if((fp = fopen(argv[1],"a+"))==NULL){
        perror("fopen:");
        return -1;
    }
    fputs(buf2,fp);
    return 0;
}

