#include "big60.h"
#include <stdint.h>

// 將一個 64-bit (int64_t) x 存入 big60_t 的二補數表示中。
// 假設 x 理論上應該在 [-2^59, 2^59) 區間內，但即使超出也會自動 mod 2^60。
void big60_from_int64(int64_t x, big60_t *r) {
    int32_t limb0;
    int32_t limb1; 

    limb0 = x & (((int64_t)1 << 30) - 1);
    x = x >> 30;
    limb1 = (int32_t)x; 

    r->limb[0] = limb0;
    r->limb[1] = limb1;
}

// 從 big60_t 取回一個 64-bit 整數
int64_t int64_from_big60(const big60_t *r) {
    int64_t recombine = 0;

    // 先放高 limb
    recombine += (int64_t)(r->limb[1]);
    recombine <<= 30;
    // 再放低 limb
    recombine += (int64_t)(r->limb[0]);

    return recombine;
}

// a + b (mod 2^60)，結果存入 r
void big60_add(const big60_t *a, const big60_t *b, big60_t *r) {
    int32_t limb0;
    int32_t limb1; 

    limb0 = a->limb[0] + b->limb[0];
    limb1 = a->limb[1] + b->limb[1];

    // 30-bit carry
    limb1 += (limb0 >> 30);
    limb0 &= ((int32_t)1 << 30) - 1;

    r->limb[0] = limb0;
    r->limb[1] = limb1;
}

// a - b (mod 2^60)，結果存入 r
void big60_sub(const big60_t *a, const big60_t *b, big60_t *r) {
    int32_t limb0;
    int32_t limb1; 

    limb0 = a->limb[0] - b->limb[0];
    limb1 = a->limb[1] - b->limb[1];

    // 30-bit borrow
    limb1 -= ((limb0 >> 31) & 1);
    limb0 += ((limb0 >> 31) & ((int32_t)1 << 30));

    r->limb[0] = limb0;
    r->limb[1] = limb1;
}

