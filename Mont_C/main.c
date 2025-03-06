#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>  // 在 naive_mul_mod 中使用
#include "bignum30_18.h"

/*
  這裡與之前相同，但 naive_mul_mod() 改成用 GMP 做 (A×u) mod P。
  其他邏輯(如 MontMul, init P/R^2) 照舊維持多 limb 實作。
*/

static bignum30_18 bigP;   // P = 2^255 - 19
static bignum30_18 bigR;   // R = 2^(30*9)
static bignum30_18 bigR2;  // R^2 mod P

#define B   ((uint64_t)1 << 30) 
#define MVAL 678152731UL
#define R_EXP 9

// 我們也在此維護一個 GMP mpz_t P 以供 naive_mul_mod() 用
static mpz_t GMP_P;

// 初始化 bigP = 2^255 - 19 (教學採「硬編 limb」或多次 shift)
// 這裡演示直接「手動」設定 limb[8] = 1<<15 => 2^255, 再減 19。
static void init_P(void){
    // 2^255 => limb[8] = 1 << 15
    bignum30_18 temp;
    bignum30_18_clear(&temp);
    temp.limb[8] = (1U << 15);

    // bigP = temp - 19
    bignum30_18_copy(&bigP, &temp);

    bignum30_18 carry19;
    bignum30_18_set_u64(&carry19, 19ULL);
    bignum30_18_sub(&bigP, &bigP, &carry19);

    // 建立 GMP_P
    mpz_init(GMP_P);
    bignum30_18_to_mpz(&bigP, GMP_P);
}

// 初始化 R = 1 << (30*9), R^2 mod P
static void init_Rs(void){
    // bigR
    bignum30_18_clear(&bigR);
    // 2^(30*9) => 2^270 => limb[9] = 1  (index=9在 0..17之間)
    bigR.limb[9] = 1;

    // bigR2 = (2^540) mod P
    // 我們用多次左移 + mod 方式
    bignum30_18 temp;
    bignum30_18_clear(&temp);
    temp.limb[0] = 1; // 1

    for(int i=0; i<540; i++){
        // 左移 1 bit
        uint64_t carry = 0;
        for(int j=0; j<NLIMBS_30; j++){
            uint64_t x = ((uint64_t)temp.limb[j] << 1) + carry;
            temp.limb[j] = (uint32_t)(x & 0x3FFFFFFF);
            carry = x >> BITS_PER_LIMB;
        }
        // mod P
        bignum30_18_mod(&temp, &bigP);
    }
    bignum30_18_copy(&bigR2, &temp);
}

/*
  MontMul: 計算 (A×u)/R mod P
  r=9, B=2^30, M=678152731
*/
static void MontMul(bignum30_18 *res, const bignum30_18 *A, const bignum30_18 *u){
    // T = A×u
    bignum30_18 T;
    bignum30_18_mul(&T, A, u);

    // 進行 9 輪
    for(int i=0; i<R_EXP; i++){
        // l = ((T % B)* M) % B
        uint64_t t0 = (uint64_t)T.limb[0];
        uint64_t l = (t0 * (uint64_t)MVAL) & 0x3FFFFFFF;

        // l*P
        bignum30_18 tmpP;
        bignum30_18_clear(&tmpP);

        uint64_t carry = 0;
        for(int j=0; j<NLIMBS_30; j++){
            __uint128_t mulres = (__uint128_t)bigP.limb[j] * l + carry;
            tmpP.limb[j] = (uint32_t)((uint64_t)mulres & 0x3FFFFFFF);
            carry = (uint64_t)(mulres >> BITS_PER_LIMB);
        }

        // T += tmpP
        bignum30_18_add(&T, &T, &tmpP);

        // T >>= 30 (limb shift)
        for(int j=0; j<NLIMBS_30-1; j++){
            T.limb[j] = T.limb[j+1];
        }
        T.limb[NLIMBS_30-1] = 0;
    }

    // compare & sub P
    if(bignum30_18_cmp(&T, &bigP) >= 0){
        bignum30_18_sub(&T, &T, &bigP);
    }
    bignum30_18_copy(res, &T);
}


/*
  naive_mul_mod: (A×u) mod P
  這裡允許使用 GMP
*/
static void naive_mul_mod(bignum30_18 *res, const bignum30_18 *A, const bignum30_18 *u){
    // 1) 把 A, u 轉成 GMP
    mpz_t mpA, mpU, mpR;
    mpz_inits(mpA, mpU, mpR, NULL);

    bignum30_18_to_mpz(A, mpA);
    bignum30_18_to_mpz(u, mpU);

    // 2) mpR = (mpA * mpU) mod GMP_P
    mpz_mul(mpR, mpA, mpU);
    mpz_mod(mpR, mpR, GMP_P);

    // 3) 再轉回 bignum30_18
    bignum30_18_from_mpz(res, mpR);

    mpz_clears(mpA, mpU, mpR, NULL);
}


int main(void){
    srand((unsigned)time(NULL));

    // 初始化 P, R, R^2
    init_P();
    init_Rs();

    int num_tests = 10000;
    printf("Start testing MontMul with GMP-based naive_mul_mod in %d random tests...\n", num_tests);

    for(int i=0; i<num_tests; i++){
        // A in [0, P)
        bignum30_18 A;
        bignum30_18_randbits(&A, 255); 
        bignum30_18_mod(&A, &bigP);

        // u in [0, 2^60)
        bignum30_18 u;
        bignum30_18_randbits(&u, 60);

        // Mont = MontMul(A, u) => (A*u)/R mod P
        bignum30_18 Mont;
        MontMul(&Mont, &A, &u);

        // Mont_result = MontMul(Mont, R^2) => (A*u) mod P
        bignum30_18 Mont_result;
        MontMul(&Mont_result, &Mont, &bigR2);

        // Correct = (A*u) mod P (via GMP)
        bignum30_18 Correct;
        naive_mul_mod(&Correct, &A, &u);

        // 比較
        if(bignum30_18_cmp(&Mont_result, &Correct) != 0){
            printf("Mismatch at test #%d!\n", i);
            printf(" A          = 0x"); bignum30_18_printhex(&A);      printf("\n");
            printf(" u          = 0x"); bignum30_18_printhex(&u);      printf("\n");
            printf(" Mont       = 0x"); bignum30_18_printhex(&Mont);    printf("\n");
            printf(" MontResult = 0x"); bignum30_18_printhex(&Mont_result); printf("\n");
            printf(" Correct    = 0x"); bignum30_18_printhex(&Correct); printf("\n");
            return 1;
        }
    }

    printf("All %d tests passed. No mismatch.\n", num_tests);

    // 清理 mpz_t GMP_P
    mpz_clear(GMP_P);

    return 0;
}

