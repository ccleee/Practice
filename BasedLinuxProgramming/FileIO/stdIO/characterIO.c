#include <stdio.h>

int main(int argc,char*argv[])
{
    //input by characters
    printf("get by character\n");
    int ch1;
    ch1 = fgetc(stdin);
    printf("%c\n",ch1);
    
    //input by character from file
    FILE *fp1;
    int ch2,count=0;
    if((fp1 = fopen(argv[1],"r"))==NULL){
        perror("fopen");
        return -1;
    }
    while ((ch2 = fgetc(fp1))!=EOF){
        count++;
    }
    printf("total %d bytes\n",count);

    //output by characters
    fputc('a',stdout);
    putchar('\n');
    //output by characters from file
    FILE *fp2;
    int ch3;
    if((fp2 = fopen(argv[2],"w"))==NULL){
        perror("fopen:");
        return -1;
    }
    for(ch3='a';ch3<='z';ch3++){
        fputc(ch3,fp2);
    }

    return 0;
}

