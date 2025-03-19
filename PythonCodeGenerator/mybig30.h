#ifndef MYBIG30_H
#define MYBIG30_H

#include <stdint.h>
#include <gmp.h>

/* 定義 big30_9，9 個 limb，每 limb 用 32 bits，但只佔 30 bits 有效 */
typedef struct {
    uint32_t limb[9];
} big30_9;

typedef struct 
{
    uint64_t limb64[4];
} uint256_t;


/* 宣告全域常數 P (2^255 - 19) 與 inv600 (2^600 在 mod P 下的反元素) */
extern big30_9 P;
extern big30_9 inv600;


void uint256_to_big30_9(big30_9 *rop, const uint256_t *x);
void big30_9_to_uint256(uint256_t *rop, const big30_9 *x);

void mpz_t_from_uint256_t(mpz_t rop, const uint256_t *x);
void uint256_t_from_mpz_t(uint256_t *rop, const mpz_t op);

void mpz_t_from_big30_9_t(mpz_t rop, const big30_9 *x);
void big30_9_t_from_mpz_t(big30_9 *rop, const mpz_t op);




#endif /* MYBIG30_H */
