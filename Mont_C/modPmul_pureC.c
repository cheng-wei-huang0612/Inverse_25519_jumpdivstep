#include "big30.h"
#include <stdio.h>
#include <stdint.h>


void modPmul(big30_t *rop, int64_t *u, big30_t *A){
    // Parse the number u into small30_t
    uint64_t u0, u1, uhat;
    u0 = *u & (((int64_t)1<<30)-1);
    u1 = (*u >> 30) & (((int64_t)1<<32)-1);
    uhat = - (u1 >> 31); // -1 if u < 0;
    
    // u <- sign(u) x u 
    // u ^ maskEffect + 1 

    u0 = u0 ^ ((((uint64_t)1 << 30) - 1) & (uhat));
    u0 += 1 & (uhat);
    u1 = u1 ^ ((((uint64_t)1 << 32) - 1) & (uhat));

    uint64_t carry = 0;
    carry = u0 >> 30;
    u0 &= (((uint64_t)1 << 30)-1);
    u1 += carry;
    u1 &= (((uint64_t)1 << 32)-1);

    

    // M = -P^-1 mod B (B = 2^30)
    uint64_t M = 678152731;
    uint32_t tmp[11]; 
    for (int i = 0; i < 11; i++){
        tmp[i] = 0;
    }


    // Debug:
    //printf("u0 = %llu\n",u0);
    //printf("u1 = %llu\n",u1);
    //printf("uhat = %lld\n", uhat);

    // u0 * A 
    uint64_t prod = 0;

    for (int i = 0; i < 9; i++){

    prod += (uint64_t)(A->limb[i]) * u0;
    tmp[i] += prod & ((1<<30)-1);
    prod >>= 30;

    }

    tmp[9] += prod & (((uint64_t)1<<32)-1);

    



    
    

    // l0
    uint64_t l0 = (uint64_t)(tmp[0]) * (uint64_t)M;
    l0 = l0 & ((1<<30) - 1);
    //printf("l0 = %llu\n", l0);

    // tmp = (tmp + l0*P) / B 
    

    
    tmp[0] = tmp[0] + ((l0 * (uint64_t)P.limb[0]) & ((1<<30)-1));

    //printf("%u\n",tmp[0]);
    
    for (int i=1;i<9;i++){
        tmp[i] +=  ((l0 * (uint64_t)P.limb[i]) & (((uint64_t)1<<30)-1)) ;
        tmp[i] += ((l0 * (uint64_t)P.limb[i-1]) >> 30);
    }

    tmp[9] = tmp[9] + ((l0 * (uint64_t)P.limb[8]) >> 30);


    // carry propogation

    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }


    //printf("It should be zero:%u\n",tmp[0]);
    
    for (int i = 0; i<9; i++){
        tmp[i] = tmp[i+1];
    }
    tmp[9] = 0;


    // += u1 * A 
    // since we have shifted right a word, the u1 * A is added from tmp[0]

    tmp[0] += ((uint64_t)(A->limb[0]) * u1) & ((1<<30)-1);
    for (int i = 1; i<9; i++){
        tmp[i] += ((uint64_t)(A->limb[i]) * u1) & ((1<<30)-1);
        tmp[i] += (((uint64_t)(A->limb[i-1]) * u1) >> 30) ;
    }
    tmp[9] += (((uint64_t)(A->limb[8]) * u1) >> 30) ;

    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }




    // l1 
    uint64_t l1 = (uint64_t)(tmp[0]) * (uint64_t)M;
    l1 = l1 & ((1<<30) - 1);
    //printf("l1 = %llu\n", l1);

    // tmp = (tmp + l0*P) / B 
    
    tmp[0] = tmp[0] + ((l1 * (uint64_t)P.limb[0]) & ((1<<30)-1));

    //printf("%u\n",tmp[0]);
    
    for (int i=1;i<9;i++){
        tmp[i] += ((l1 * (uint64_t)P.limb[i]) & (((uint64_t)1<<30)-1));
        tmp[i] += ((l1 * (uint64_t)P.limb[i-1]) >> 30);
    }

    tmp[9] = tmp[9] + ((l1 * (uint64_t)P.limb[8]) >> 30);

    //printf("%u\n",tmp[1]);

    //tmp_printf(tmp);
    // carry propogation
    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }


    //tmp_printf(tmp);
    //printf("It should be zero:%u\n",tmp[0]);
    
    for (int i = 0; i<9; i++){
        tmp[i] = tmp[i+1];
    }
    tmp[9] = 0;

    // Reduction P once:
    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;
    
    // tmp + 19
    uint32_t tmp2[9];
    for (int i=0; i<9; i++) {tmp2[i] = tmp[i];};
    tmp2[0] += 19; 
    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp2[i] >> 30;
        tmp2[i] = tmp2[i] & (((uint64_t)1<<30) -1);

        tmp2[i+1] += carry; 
    }

    // (tmp + 19) >= 2^255 iff tmp[8] >= 32768
    uint64_t reductionhat;
    reductionhat =  - ((32768 - tmp2[8]) >> 31);
    // printf("reductionhat = %lld\n",reductionhat);

    tmp[0] += ((uint32_t)reductionhat) & 19;
    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp2[i] >> 30;
        tmp2[i] = tmp2[i] & (((uint64_t)1<<30) -1);

        tmp2[i+1] += carry; 
    }

    tmp[8] -= ((uint32_t)reductionhat) & 32768;

    

    // result <- sign(u) x result 
    //
    // tmp = \pm tmp
    
    uint32_t MASK_effect = ((1<<30) - 1);

    for (int i = 0; i < 8; i++) {
        tmp[i] = tmp[i] ^ ((uint32_t)uhat & MASK_effect);
    }
    tmp[8] = tmp[8] ^ ( (uint32_t)uhat );

    tmp[0] = tmp[0] + (uhat >> 63);

    // tmp += P

    for (int i = 0; i < 9; i++) {
        tmp[i] = tmp[i] + ((uint32_t)uhat & P.limb[i]);
    }
    
    // carry propogation
    carry = 0;
    for (int i = 0; i<8; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }

    

    for (int i = 0; i<9; i++){
        rop->limb[i] = tmp[i];
    }


}

