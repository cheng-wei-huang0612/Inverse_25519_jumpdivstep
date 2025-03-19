
#include<stdio.h>
#include"mybig30.h"


int main(void){

    for(int i = 0; i < 9; i++){
        printf("P.limb[%d] = %d\n", i, P.limb[i]);
        printf("P.limb[%d] = %X\n", i, P.limb[i]);
    }
    return 0;
}
