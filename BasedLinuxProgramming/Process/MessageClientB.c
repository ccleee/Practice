#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>

#define N 64
#define LEN (sizeof(MSG)-sizeof(long))
#define typeA 100
#define typeB 200

typedef struct{
    long mtype;
    char mtext[N];
}MSG;
int main(){
    key_t key;
    int msgid;
    MSG buf;

    if((key = ftok(".",'c'))  == -1){
        perror("ftok:");
        exit(-1);
    }
    if((msgid = msgget(key,IPC_CREAT|0666)) < 0){
        perror("msgget:");
        exit(-1);
    }
    while(1){
        if((msgrcv(msgid,&buf,LEN,typeB,0)) < 0){
            perror("msgrcv:");
            exit(-1);
        }
        printf("receive:%s",buf.mtext);
        fputs("input your message:\n",stdout);
        buf.mtype = typeA;
        fgets(buf.mtext,N,stdin);
        msgsnd(msgid,&buf,LEN,0);
    }

    
    
    return 0;
}
