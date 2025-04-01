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

    // u = u_tuda(u0 and u1) + uhat * (-2^60)
    uint64_t u0, u1;
    uint32_t uhat;
    u0 = *u & (((int64_t)1<<30)-1);
    u1 = (*u >> 30) & (((int64_t)1<<30)-1);
    uhat =  (*u >> 63); // -1 if u < 0;

    //printf("uhat = %d\n",uhat);
    
    // M = -P^-1 mod B (B = 2^30)
    uint64_t M = 678152731;
    uint32_t tmp[11]; 
    for (int i = 0; i < 11; i++){
        tmp[i] = 0;
    }
    uint64_t carry = 0;
    uint64_t prod = 0;


    // u0 * A 
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
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }

    tmp[8] -= ((uint32_t)reductionhat) & 32768;

    // result += uhat(P-A)

    // Compute P - A , store them in tmp3
    uint32_t tmp3[11] = {0};
    for (int i = 0; i < 9; i++)
    {
        tmp3[i] = P.limb[i] - A->limb[i];
    }

    // for (int i = 0; i < 9; i++)
    // {
    //     printf("tmp3[%d] = %d\n",i,tmp3[i]);
    // }

    // Borrow propagation
    uint32_t borrow = 0;
    for (int i = 0; i < 8; i++)
    {   
        borrow = tmp3[i] >> 31;
        tmp3[i+1] = tmp3[i+1] - borrow;
        tmp3[i+0] = tmp3[i+0] + (borrow << 30);
    }

    // for (int i = 0; i < 9; i++)
    // {
    //     printf("tmp3[%d] = %d\n",i,tmp3[i]);
    // }
    //tmp_print_to_mpz(tmp3);
    

    // result += uhat(P-A)
    // tmp += uhat & tmp3

    for (int i = 0; i < 9; i++)
    {
        tmp[i] += ((uint32_t)uhat & tmp3[i]);
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

