#include "big30.h"
#include <stdio.h>



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

