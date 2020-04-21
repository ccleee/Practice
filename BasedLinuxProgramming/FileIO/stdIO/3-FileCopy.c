#include <stdio.h>
#define N 64
//use objectI/O to copy from file to file
int main(int argc, char*argv[])
{   int n;
    char buf[N];
    FILE *fps,*fpd;
    if(argc < 3){
        printf("Usage:%s <src_file> <dst_file>\n",argv[0]);
        return -1;
    } 
    if((fps = fopen(argv[1],"r"))==NULL){
        perror("fopen src file:");
        return -1;
    }
    if((fpd = fopen(argv[2],"w"))==NULL){
        perror("fopen dst file:");
        return -1;
    }
    while((n = fread(buf,1,N,fps))>0){
        fwrite(buf,1,n,fpd);
    }    
    //remenber to close the opened fie
    fclose(fps);
    fclose(fpd);
    return 0;
}

