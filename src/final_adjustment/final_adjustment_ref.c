
#include <stdint.h>
#include "big30.h"
#include <stdio.h>

void sign_adjustment(big30_t *inv30, big30_t *F, big30_t *V) {
    int32_t diff = ((int32_t)F->limb[0]) ^ ((1<<30) - 1);
    int32_t mask = ~((diff | -diff) >> 31);

    // big30_9 inv30;
    uint32_t borrow = 0;

    for (int i = 0; i < 9; i++) {
        inv30->limb[i] = 0;
        inv30->limb[i] += mask & P.limb[i];
    }
    inv30->limb[0] += (mask & 18); // inv30 == 2^255 - 1, the borrow will never happen
                          
    for (int i = 0; i < 9; i++) {
        inv30->limb[i] -= mask & V->limb[i];
        inv30->limb[i] += (~mask) & V->limb[i];
    }

    // if mask is set, minus the inv30 by 18
    // else minus the inv30 by 0
    // turns out: minus the inv30 by (18 & mask) and propagate the borrow

    inv30->limb[0] -= (mask & 18);

    for (int i = 0; i < 8; i++) {
        borrow = (inv30->limb[i]) >> 31;
        inv30->limb[i+1] = (inv30->limb[i+1]) - borrow;
        inv30->limb[i] = (inv30->limb[i]) + (borrow << 30);
    }
}

void uint256_from_big30(uint256_t *rop, const big30_t *op) {
    // 暫存在 256-bit（t[0..3]）中，最後再存回 rop->limb64[]
    uint64_t t[4] = {0ULL, 0ULL, 0ULL, 0ULL};

    // 從最高 limb (x->limb[8]) 到最低 limb (x->limb[0])
    for (int i = 8; i >= 0; i--) {
        // 整個 t[3..0] << 30
        // new_t[3] = (old_t[3] << 30) | (old_t[2] >> (64-30))
        // new_t[2] = (old_t[2] << 30) | (old_t[1] >> (64-30))
        // ... 類似 shiftLeft30，這裡直接手動 inline

        uint64_t old0 = t[0];
        uint64_t old1 = t[1];
        uint64_t old2 = t[2];
        uint64_t old3 = t[3];

        t[3] = (old3 << 30) | (old2 >> 34);
        t[2] = (old2 << 30) | (old1 >> 34);
        t[1] = (old1 << 30) | (old0 >> 34);
        t[0] = (old0 << 30);

        // 再加上 x->limb[i] (最低 30 bits)，以 64-bit 來裝沒問題
        t[0] |= (uint64_t)op->limb[i] & 0x3FFFFFFF; 
    }

    // 將 t[0..3] 複製回 rop->limb64[0..3]
    rop->limb64[0] = t[0];
    rop->limb64[1] = t[1];
    rop->limb64[2] = t[2];
    rop->limb64[3] = t[3];
}


void final_adjustment(uint256_t *inv, big30_t *F, big30_t *V) {
    big30_t inv30;
    sign_adjustment(&inv30, F, V);
    uint256_from_big30(inv, &inv30);

}
