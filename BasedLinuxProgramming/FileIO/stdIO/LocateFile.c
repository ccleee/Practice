#include <stdio.h>

int main()
{
    //ftell:return the current read/write location of a file
    //fseek:whence:SEEK_SET,SEEK_CUR,SEEK_END
    //rewind:return the start location of a file
    
    //1.append 't' at the end of file
    FILE *fp = fopen("test.txt","r+");
    fseek(fp,0,SEEK_END);
    fputc('t',fp);

    //2.get the current length of a file
    fseek(fp,0,SEEK_END);
    printf("length is %ld\n",ftell(fp));
    return 0;
}

