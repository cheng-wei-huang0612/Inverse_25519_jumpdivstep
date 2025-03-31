#ifndef BIGNUM30_18_H
#define BIGNUM30_18_H

#include <stdint.h>
#include <stdbool.h>

// 每個 limb 只使用 30 bits
#define BITS_PER_LIMB 30

// 需要 18 limbs，可容納最高 540 bits
#define NLIMBS_30 18

// 定義結構
typedef struct {
    // limb[0] = 最低位 limb；limb[NLIMBS_30-1] = 最高位
    uint32_t limb[NLIMBS_30];
} bignum30_18;

/* -------------------------
   基礎函式介面
   ------------------------- */
// 1. 清 0
void bignum30_18_clear(bignum30_18 *x);

// 2. 以 64 位整數初始化
void bignum30_18_set_u64(bignum30_18 *x, uint64_t val);

// 3. 拷貝
void bignum30_18_copy(bignum30_18 *dst, const bignum30_18 *src);

// 4. 比較 (回傳 -1, 0, 1)
int bignum30_18_cmp(const bignum30_18 *a, const bignum30_18 *b);

// 5. 加 (dst = a + b)，回傳最後 carry (0 or 1)
uint32_t bignum30_18_add(bignum30_18 *dst, const bignum30_18 *a, const bignum30_18 *b);

// 6. 減 (dst = a - b)，回傳 borrow (0 or 1 => a<b)
uint32_t bignum30_18_sub(bignum30_18 *dst, const bignum30_18 *a, const bignum30_18 *b);

// 7. 左移 (預設 shiftBits = 30 的倍數)
void bignum30_18_shl(bignum30_18 *x, int shiftBits);

// 8. 乘法 (naive O(n^2)) => dst = a*b
void bignum30_18_mul(bignum30_18 *dst, const bignum30_18 *a, const bignum30_18 *b);

// 9. 取模 naive (dst = dst mod m)
void bignum30_18_mod(bignum30_18 *dst, const bignum30_18 *m);

// 10. 產生隨機 bits
void bignum30_18_randbits(bignum30_18 *x, int bits);

// 11. 以 16 進位印出 (debug)
void bignum30_18_printhex(const bignum30_18 *x);

/* -------------------------
   與 GMP 互轉
   ------------------------- */
#ifdef __cplusplus
extern "C" {
#endif

// 需要 <gmp.h>，這裡僅宣告
#include <gmp.h>

// 把 bignum30_18 轉成 mpz_t
void bignum30_18_to_mpz(const bignum30_18 *src, mpz_t dst);

// 把 mpz_t 轉成 bignum30_18 (只取低 540 bits)
void bignum30_18_from_mpz(bignum30_18 *dst, const mpz_t src);

#ifdef __cplusplus
}
#endif

#endif // BIGNUM30_18_H

