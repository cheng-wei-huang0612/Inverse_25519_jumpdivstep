#include "big30.h"
#include <stdio.h>
#include <gmp.h>



/**
 * gmp_double_mont():
 *   resultV = (u * V) * 2^{-60} mod P
 *   resultS = (r * V) * 2^{-60} mod P
 * 透過 GMP 先計算 u * V 與 r * V，再乘上 2^{-60} mod P。
 */
void gmp_double_mont(big30_t *resultV, big30_t *resultS,
    const big30_t *V,
    const int64_t *u, const int64_t *r) {
mpz_t mpP, mpu, mpr, mpV, mpinv2Pow60;
mpz_inits(mpP, mpu, mpr, mpV, mpinv2Pow60, NULL);

mpz_from_big30(mpP, &P);
mpz_set_ui(mpinv2Pow60, 1);
mpz_mul_2exp(mpinv2Pow60,mpinv2Pow60, 60);
mpz_invert(mpinv2Pow60, mpinv2Pow60, mpP);


mpz_from_big30(mpV, V);

mpz_set_si(mpu, *u);
mpz_set_si(mpr, *r);


mpz_mul(mpu, mpu, mpV);     // u * V
mpz_mul(mpr, mpr, mpV);     // r * V

mpz_mul(mpu, mpu, mpinv2Pow60);
mpz_mul(mpr, mpr, mpinv2Pow60);

mpz_mod(mpu, mpu, mpP);     // mod P
mpz_mod(mpr, mpr, mpP);

// 把得到的結果轉 big30_t 回傳
big30_from_mpz(resultV, mpu);
big30_from_mpz(resultS, mpr);

mpz_clears(mpP, mpu, mpr, mpV, mpinv2Pow60, NULL);

}
