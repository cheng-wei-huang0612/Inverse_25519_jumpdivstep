#include "big30.h"
#include <gmp.h>
#include <stdint.h>
#include <stdio.h>

/*
 * ---------------------------------------------------------
 * modPmul_ref.c
 *
 * 使用 GMP 做計算，作為參考版本
 * ---------------------------------------------------------
 */

void gmp_modPmul(big30_t *rop, int64_t *u, big30_t *A) {
    mpz_t mpu, mpA, mpP, mpProd;
    mpz_inits(mpu, mpA, mpP, mpProd, NULL);

    // 將 u, A, P 轉為 mpz
    mpz_set_si(mpu, *u);
    mpz_from_big30(mpA, A);
    mpz_from_big30(mpP, &P);

    // 先做乘法，然後 mod P
    mpz_mul(mpProd, mpu, mpA);
    mpz_mod(mpProd, mpProd, mpP);

    // 再把結果存回 rop
    big30_from_mpz(mpProd, rop);

    mpz_clears(mpu, mpA, mpP, mpProd, NULL);
}

