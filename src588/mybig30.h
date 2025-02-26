#ifndef MYBIG30_H
#define MYBIG30_H

#include <stdint.h>

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

/* 如果要使用 GMP 來測試，就可宣告一個函式把 big30_9 decode 成 mpz_t */
#ifdef __cplusplus
extern "C" {
#endif

void uint256_to_big30_9(big30_9 *rop, const uint256_t *x);
void big30_9_to_uint256(uint256_t *rop, const big30_9 *x);




#ifdef USE_GMP
#include <gmp.h>
void big30_9_to_mpz(mpz_t rop, const big30_9 *x);
#endif


void big30_9_add_mod(big30_9 *out, const big30_9 *x, const big30_9 *y);
void big30_9_sub_mod(big30_9 *out, const big30_9 *x, const big30_9 *y);
void big30_9_mul_mod(big30_9 *out, const big30_9 *x, const big30_9 *y);
void big30_9_from_int64(big30_9 *out, int64_t val);

#ifdef __cplusplus
}
#endif

#endif /* MYBIG30_H */
