#include <stdio.h>

int main()
{
    //size_t fread (void *ptr,size_t size,size_t n,FILE *fp)
    //return actual size of read
    char s[10]={0};
    FILE *fp;
    if((fp = fopen("test1.txt","a+"))==NULL){
        perror("fopen");
        return -1;
    }
    if(fread(s,sizeof(char),9,fp)<0){
        perror("fread");
        return -1;
    }

    /* for(int i=0;i<36;i++){ */
    /*     printf("%d: %p: ",i,&s[i]); */
    /*     printf("%c\n",s[i]); */
    /* } */
    printf("%s\n",s);
    fclose(fp);
    //sizee_t fwrite(const void *ptr,size_t size,size_t n,FILE *fp)
    struct student{
        int no;
        char name[8];
        float score;
    }s2[]={{1,"Zhang",97},{2,"Wang",95}};
    if((fp = fopen("test2.txt","w+"))==NULL){
        perror("fopen");
        return -1;
    }
    if((fwrite(s2,sizeof(struct student),2,fp))!=2){
        perror("fwrite:");
        return -1;
    }
    //remenber to rewind
    rewind(fp);
    struct student s3[2];
    if(fread(s3,sizeof(struct student),2,fp)<0){
        perror("fread");
        return -1;
    }
    printf("fread:\n");
    for(int i=0;i<2;i++){
         printf("%d\n",s3[i].no);
         puts(s3[i].name);
         printf("%f\n",s3[i].score);
    }

    fclose(fp);
    return 0;
}

