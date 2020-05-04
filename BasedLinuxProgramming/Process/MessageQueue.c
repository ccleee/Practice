#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
typedef struct{
    long mtype;
    char mtext[64];
}MSG;
#define LEN (sizeof(MSG)-sizeof(long))
int main(){
   
    //msgget int msgget(key_t key,int msgflag) return id/EOF
    int msgid;
    key_t key;
    MSG buf1,buf2;

    if((key = ftok(".",'b')) == -1){
        perror("key:");
        exit(-1);
    }
    
    if((msgid = msgget(key,IPC_CREAT|0666)) < 0){
        perror("msgget");
        exit(-1);
    }

    buf1.mtype = 100;
    fgets(buf1.mtext,64,stdin);
    
    //megsnd(int msgid,const void *msgp,size_t size,int msflag);
    //return 0/-1
    //msgflag:0/IPC_NOWAIT(return -1,set errno)
    
    msgsnd(msgid,&buf1,LEN,0);
    
    //int msgrcv(int msgid,void *msgp,size_t,long msgtype,int msgflag);
    //msgtype:0:get the first message;-1:get by priority
    
    if(msgrcv(msgid,&buf2,LEN,200,0) < 0){
        perror("msgrcv:");
        exit(-1);
    }

    //int msgctl(int msgid,int cmd,struct msqid_ds *buf);return 0/-1
    //cmd:IPC_STATE/IPC_SET/IPC_RMID
    return 0;
}
