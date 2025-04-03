#include "big30.h"
#include <stdio.h>
#include <stdint.h>
void tmp_printf(uint32_t *tmp){
    printf("\n\n");
    for (int i=0; i<4; i++){
        printf("tmp[%d] = %d  ",i,tmp[i]); 
    }
    printf("\n");
    for (int i=4; i<8; i++){
        printf("tmp[%d] = %d  ",i,tmp[i]); 
    }
    printf("\n");
    for (int i=8; i<11; i++){
        printf("tmp[%d] = %d  ",i,tmp[i]); 
    }
    printf("\n");
    

    printf("\n");
}

void tmp_print_to_mpz(uint32_t *tmp){
    big30long_t num;

    for (int i = 0; i<11;i++){
        num.limb[i] = tmp[i];
    }

    mpz_t mpnum;
    mpz_init(mpnum);
    mpz_from_big30long(mpnum, &num);
    gmp_printf("tmp = %Zd\n", mpnum);
}

void modPmul(big30_t *rop, int64_t *u, big30_t *A){

    // Step 1: Parse u into u0, u1, uhat
    // u0 ← u & (2^30 - 1)
    // u1 ← (u >> 30) & (2^30 - 1)
    // uhat ← (u >> 63)   // -1 if u < 0, else 0
    uint64_t u0, u1;
    uint32_t uhat;
    u0 = *u & (((int64_t)1<<30)-1);
    u1 = (*u >> 30) & (((int64_t)1<<30)-1);
    uhat =  (*u >> 63); // -1 if u < 0;


    // Constants and buffer initialization
    // M = -P^-1 mod B (B = 2^30)
    uint32_t M = 678152731;
    uint32_t tmp[11] = {0}; 
    uint32_t carry = 0;
    uint32_t borrow = 0;
    uint64_t prod = 0;
    uint32_t reductionhat;



    // Step 2: tmp = u0 * A 
    prod = 0;
    for (int i = 0; i < 9; i++){
        prod += (uint64_t)(A->limb[i]) * u0;
        tmp[i] += prod & ((1<<30)-1);
        prod >>= 30;
    }
    tmp[9] += prod & (((uint64_t)1<<30)-1);



    // l0 = tmp[0] * M mod 2^30
    uint64_t l0 = (uint64_t)(tmp[0]) * (uint64_t)M;
    l0 = l0 & ((1<<30) - 1);


    // tmp = (tmp + l0*P) / B 
    // tmp = tmp + l0*P
    prod = 0;
    for (int i = 0; i < 9; i++){
        prod += (uint64_t)(P.limb[i]) * l0;
        tmp[i] += prod & ((1<<30)-1);
        prod >>= 30;
    }
    tmp[9] += prod & (((uint64_t)1<<30)-1);

    // carry propogation
    carry = 0;
    for (int i = 0; i < 9; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }


    // tmp = tmp / B
    for (int i = 0; i<9; i++){
        tmp[i] = tmp[i+1];
    }
    tmp[9] = 0;


    // tmp += u1 * A 
    prod = 0;
    for (int i = 0; i < 9; i++){
        prod += (uint64_t)(A->limb[i]) * u1;
        tmp[i] += prod & ((1<<30)-1);
        prod >>= 30;
    }
    tmp[9] += prod & (((uint64_t)1<<30)-1);

    
    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }

    
    
    
    // l1 = tmp[0] * M mod 2^30
    uint64_t l1 = (uint64_t)(tmp[0]) * (uint64_t)M;
    l1 = l1 & ((1<<30) - 1);
    
    
    // tmp = (tmp + l1*P) / B 
    // tmp = tmp + l1*P
    prod = 0;
    for (int i = 0; i < 9; i++){
        prod += (uint64_t)(P.limb[i]) * l1;
        tmp[i] += prod & ((1<<30)-1);
        prod >>= 30;
    }
    tmp[9] += prod & (((uint64_t)1<<30)-1);
    
    // carry propagation
    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        
        tmp[i+1] += carry; 
    }
    
    
    
    // tmp = tmp / B
    for (int i = 0; i<9; i++){
        tmp[i] = tmp[i+1];
    }
    tmp[9] = 0;
    
    
    
    
    
    
    // Reduction P once:
    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;
    
    uint32_t small_tmp = 19;
    for (int i = 0; i < 8; i++)
    {
        small_tmp += tmp[i];
        small_tmp >>= 30;
    }
    small_tmp += tmp[8];
    
    
    
    
    reductionhat =  - ((32767 - small_tmp) >> 31);
    
    
    printf("reductionhat = %u\n", reductionhat);
    
    
    tmp[0] += (reductionhat) & 19;
    tmp[8] -= (reductionhat) & 32768;


    
    
    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        
        tmp[i+1] += carry; 
    }
    
    
    
    
    
    
    



    // result += uhat & (P-A)


    for (int i = 0; i < 9; i++)
    {
        tmp[i] += (uhat & P.limb[i]);
        tmp[i] -= (uhat & (A->limb[i]));
    }


    for (int i = 0; i < 8; i++)
    {   
        borrow = tmp[i] >> 31;
        tmp[i+1] = tmp[i+1] - borrow;
        tmp[i+0] = tmp[i+0] + (borrow << 30);
    }




    // Final reduction P once:
    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    small_tmp = 19;
    for (int i = 0; i < 8; i++)
    {
        small_tmp += tmp[i];
        small_tmp >>= 30;
    }
    small_tmp += tmp[8];

    reductionhat =  - ((32767 - small_tmp) >> 31);
    

    tmp[0] += (reductionhat) & 19;
    tmp[8] -= (reductionhat) & 32768;
    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }

    

    for (int i = 0; i<9; i++){
        rop->limb[i] = tmp[i];
    }


}

