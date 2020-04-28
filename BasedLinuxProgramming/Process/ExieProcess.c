#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    //void exit(int status);   will fflush
    //void _exit(int status);  won't fflush,use carefully
    printf("this process will exit");
    exit(0);
    printf("never be displayed");
    return 0;
}

