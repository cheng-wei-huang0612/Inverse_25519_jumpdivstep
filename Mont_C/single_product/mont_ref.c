#include <stdio.h>
#include <stdint.h>
#include <stdlib.h> // rand(), srand()
#include <string.h>
#include <time.h>   // time()
#include <gmp.h>
   

#define LIMBS 9          // 先用 2 個 limb，總計 2*30 = 60 bits
#define BIG30_SHIFT  30


typedef struct {
    uint32_t limb[LIMBS]; // 最多9 limbs（F, G）
} big30_t;

typedef struct {
    uint32_t limb[2]; // u, v 兩個 limbs
} small30_t;

typedef struct {
    uint32_t limb[LIMBS + 2]; // 最多11 limbs uF + vG
} big30long_t;

// 將 big30_t 轉換成 mpz_t
void mpz_from_big30(mpz_t rop, const big30_t *x) {
    mpz_set_ui(rop, 0);
    mpz_t tmp; 
    mpz_init(tmp);

    for(int i=(LIMBS-1); i>=0;i--){

    mpz_set_si(tmp, (int32_t)x->limb[i]);
    mpz_mul_2exp(rop, rop, 30);
    mpz_add(rop, rop, tmp);

    }
}


void mpz_from_big30long(mpz_t rop, const big30long_t *x){
    mpz_set_ui(rop, 0);
    mpz_t tmp; 
    mpz_init(tmp);

    for(int i=(LIMBS+1); i>=0;i--){

    mpz_set_si(tmp, (int32_t)x->limb[i]);
    mpz_mul_2exp(rop, rop, 30);
    mpz_add(rop, rop, tmp);
    }
}




void small30_from_mpz(const mpz_t op, small30_t *rop){
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract lower limbs, each 30 bits
    for (int i = 0; i < (2-1); i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    // The final signed part goes to limb[LIMBS-1]
    rop->limb[2-1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}



void int64_from_small30(int64_t *rop, small30_t *op){
    
    *rop = (int64_t)(int32_t)(op->limb[1]);
    *rop = *rop << 30;
    *rop = *rop + op->limb[0];

}

void int64_from_mpz(const mpz_t op, int64_t *rop)
{

    // 先把 mpz_t 轉成 small30_t
    small30_t tmp30;
    small30_from_mpz(op, &tmp30);

    // 再把 small30_t 轉成 int64_t
    int64_from_small30(rop, &tmp30);
}



void big30_from_mpz(const mpz_t op, big30_t *rop){
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract lower limbs, each 30 bits
    for (int i = 0; i < (LIMBS-1); i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    // The final signed part goes to limb[LIMBS-1]
    rop->limb[LIMBS-1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}

void big30long_from_mpz(const mpz_t op, big30long_t *rop){
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract lower limbs, each 30 bits
    for (int i = 0; i < (LIMBS+1); i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    // The final signed part goes to limb[LIMBS]
    rop->limb[LIMBS+1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}

/**
 * random_gmp_in_range(rop, bits)
 * 
 * 產生一個亂數 mpz_t 整數，範圍為：
 *     [ -2^bits ,  2^bits )
 *
 * 算法步驟：
 * 1) 先在 [0, 2^(bits+1)) 中產生一個隨機整數。
 * 2) 再減去 2^bits，讓結果落在 [ -2^bits, 2^bits ).
 */
void random_gmp_in_range(mpz_t rop, gmp_randstate_t rstate, int bits) {
    // 1) 在 [0, 2^(bits+1)) 產生隨機整數
    mpz_urandomb(rop, rstate, bits + 1);

    // 2) shift = 2^bits
    mpz_t shift;
    mpz_init(shift);
    mpz_setbit(shift, bits);

    // 3) rop -= shift => 使 rop 落在 [-2^bits, 2^bits)
    mpz_sub(rop, rop, shift);

    mpz_clear(shift);
}



big30_t P = {
    0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x00007fff
};

void gmp_modPmul(big30_t *rop, int64_t *u, big30_t *A){
    mpz_t mpu, mpA, mpP, mpProd; 
    mpz_inits(mpu, mpA, mpP, mpProd, NULL);
    mpz_set_si(mpu, *u);
    //gmp_printf("mpu = %Zd\n",mpu);
    mpz_from_big30(mpA, A);
    mpz_from_big30(mpP, &P);
    

    mpz_mul(mpProd, mpu, mpA);
    mpz_mod(mpProd, mpProd, mpP);

    // Debug
    // gmp_printf("sage: %Zd == ((%Zd) * (%Zd)) %% (%Zd)\n",mpProd, mpA, mpu, mpP);

    big30_from_mpz(mpProd, rop);
}

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
    // Parse the number u into small30_t
    uint64_t u0, u1, uhat;
    u0 = *u & (((int64_t)1<<30)-1);
    u1 = (*u >> 30) & (((int64_t)1<<32)-1);
    uhat = - (u1 >> 31); // -1 if u < 0;

    
    
    // M = -P^-1 mod B (B = 2^30)
    uint64_t carry = 0;
    uint64_t M = 678152731;
    uint32_t tmp[11]; 
    for (int i = 0; i < 11; i++){
        tmp[i] = 0;
    }


    // Debug:
    printf("u0 = %llu\n",u0);
    printf("u1 = %llu\n",u1);
    printf("uhat = %lld\n", uhat);

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
    printf("l0 = %llu\n", l0);

    // tmp = (tmp + l0*P) / B 
    
    prod = 0;

    for (int i = 0; i < 9; i++){
        prod += (l0 * (uint64_t)P.limb[i]);
        tmp[i] += prod & ((1<<30)-1);
        prod >>= 30;

    }
    tmp[9] += prod & (((uint64_t)1<<32)-1);
    

    printf("%u\n",tmp[0]);
    


    // carry propogation

    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }


    printf("It should be zero:%u\n",tmp[0]);
    
    for (int i = 0; i<9; i++){
        tmp[i] = tmp[i+1];
    }
    tmp[9] = 0;


    // += u1 * A 
    // since we have shifted right a word, the u1 * A is added from tmp[0]

    prod = 0;

    for (int i = 0; i < 9; i++){

    prod += (uint64_t)(A->limb[i]) * u1;
    tmp[i] += prod & ((1<<30)-1);
    prod >>= 30;

    }

    tmp[9] += prod & (((uint64_t)1<<32)-1);



    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }




    // l1 
    uint64_t l1 = (uint64_t)(tmp[0]) * (uint64_t)M;
    l1 = l1 & ((1<<30) - 1);
    printf("l1 = %llu\n", l1);

    // tmp = (tmp + l0*P) / B 
    
    prod = 0;

    for (int i = 0; i < 9; i++){
        prod += (l1 * (uint64_t)P.limb[i]);
        tmp[i] += prod & ((1<<30)-1);
        prod >>= 30;

    }
    tmp[9] += prod & (((uint64_t)1<<32)-1);




    //printf("%u\n",tmp[1]);

    tmp_printf(tmp);
    // carry propogation
    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp[i] >> 30;
        tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

        tmp[i+1] += carry; 
    }


    tmp_printf(tmp);
    printf("It should be zero:%u\n",tmp[0]);
    
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
    printf("reductionhat = %lld\n",reductionhat);
    
    tmp[0] += ((uint32_t)reductionhat) & 19;
    carry = 0;
    for (int i = 0; i<10; i++){
        carry = tmp2[i] >> 30;
        tmp2[i] = tmp2[i] & (((uint64_t)1<<30) -1);

        tmp2[i+1] += carry; 
    }

    tmp[8] -= ((uint32_t)reductionhat) & 32768;


    

    // // result <- sign(u) x result 
    // //
    // // tmp = \pm tmp
    
    // tmp_printf(tmp);
    // tmp_print_to_mpz(tmp);

    
    // uint32_t MASK_effect = ((1<<30) - 1);

    // for (int i = 0; i < 8; i++) {
    //     tmp[i] = tmp[i] ^ ((uint32_t)uhat & MASK_effect);
    // }
    // printf("uhat = %u\n",(uint32_t)uhat);
    // tmp[8] = tmp[8] ^ ( (uint32_t)uhat );

    // tmp[0] = tmp[0] + (uhat >> 63);

    // tmp_printf(tmp);
    // tmp_print_to_mpz(tmp);
    // // tmp += P

    // for (int i = 0; i < 9; i++) {
    //     tmp[i] = tmp[i] + ((uint32_t)uhat & P.limb[i]);
    // }
    // tmp_printf(tmp);
    // tmp_print_to_mpz(tmp);
    
    // // carry propogation
    // carry = 0;
    // for (int i = 0; i<8; i++){
    //     carry = tmp[i] >> 30;
    //     tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);

    //     tmp[i+1] += carry; 
    // }

    
    // tmp_printf(tmp);

    for (int i = 0; i<9; i++){
        rop->limb[i] = tmp[i];
    }


}


int main() {
    printf("hello world\n\n");
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, (unsigned long) time(NULL));

    mpz_t mpP;
    mpz_init(mpP);
    mpz_from_big30(mpP, &P);

    // for (int i = 0; i<9; i++){
    //     printf("P.limb[%d] = %d\n", i, P.limb[i]);
    // }


    mpz_t mpu, mpA, mpR, mpcorrectR; 
    mpz_inits(mpu, mpA, mpR, mpcorrectR, NULL);
    random_gmp_in_range(mpu, rstate, 60);
    random_gmp_in_range(mpA, rstate, 257);
    mpz_abs(mpA, mpA);
    mpz_set_str(mpu, "-784924700720898820", 10);
    mpz_set_str(mpA, "649706749237016359310912293812451764790252070619261955642710670344462641741", 10);



    int64_t u; 
    small30_t u_30;
    big30_t A, correctR, R;

    int64_from_mpz(mpu, &u);
    small30_from_mpz(mpu, &u_30);
    big30_from_mpz(mpA, &A);
    gmp_printf("   mpA = %Zd\n", mpA);
    printf("    Given    A = [limb0 = %u, limb1 = %u, limb2 = %u, limb3 = %u \n"
       "                  limb4 = %u, limb5 = %u, limb6 = %u, limb7 = %u \n"
       "                  limb8 = %u ]\n", 
       A.limb[0], A.limb[1], A.limb[2], A.limb[3], A.limb[4], A.limb[5], A.limb[6], A.limb[7], A.limb[8]);

    gmp_printf("   mpu = %Zd\n", mpu);
    printf("    Given    u = [limb0 = %d, limb1 = %d]\n",u_30.limb[0],u_30.limb[1]);
    modPmul(&R, &u, &A);
    mpz_from_big30(mpR, &R);

    gmp_printf("result = %Zd\n", mpR);

    mpz_mul_2exp(mpR, mpR, 60);
    mpz_mod(mpR, mpR, mpP);

    gmp_printf("result * 2^60 mod P = %Zd\n", mpR);

    gmp_modPmul(&correctR, &u, &A);
    mpz_from_big30(mpcorrectR, &correctR);


    gmp_printf("correct result = %Zd\n", mpcorrectR);

    gmp_printf("sage: (%Zd) == (%Zd)", mpR, mpcorrectR);


    
    printf("\n\nByeBye world");
    return 0;
}
