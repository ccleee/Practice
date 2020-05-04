#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
int main(int argc,char *argv[])
{
    //key_t ftok(const cahr*path,int proj_id); return key/EOF
    //pro_id!=0
    key_t key;

    if((key = ftok(".",'a')) == -1){
        perror("key:");
        exit(-1);
    }
    
    //int shmget(key_t key,int size,int shmflag);return id/EOF
    //shmflag: IPC_CREATE | 0666
    int shmid1;
    if((shmid1 = shmget(IPC_PRIVATE,512,0666)) < 0){
        perror("shmget1:");
        exit(-1);
    }
    int shmid2;
    if((shmid2 = shmget(key,1024,IPC_CREAT|0666)) < 0){
        perror("shmget2:");
        exit(-1);
    }
    
    //void *shmat(int shmid,const void*shamaddr,int shmflg);return address\(void*)-1
    //shmaddr:NULL
    //shmflg:0/SHM_RDONLY
    
    char *addr;
    if((addr = (char*)shmat(shmid1,NULL,0)) == (char*)-1){
        perror("shmat:");
        exit(-1);
    }
    fgets(addr,64,stdin);
    
    //int shmdt(void *shmaddr);return 0/EOF
    
    //int shmctl(int shmid,int cmd,struct shmid_ds*buf);
    //cmd:IPC_STAT|IPC_SET|IPC_RMID;
    //buf:save set remove :shm atrribute (struct)
    //do remove when nattach==0
    return 0;

}

