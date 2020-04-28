#include <stdio.h>

//share lib:
//export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
//add config file:/etc/ld.so.conf.d/*.conf
void hello(void);
int main()
{
    hello();
    return 0;
}

