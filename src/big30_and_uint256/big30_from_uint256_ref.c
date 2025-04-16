#include "big30.h"
#include <stdio.h>


void big30_from_uint256(big30_t *rop, const uint256_t *op) {
    /* 先把 x->limb64[] 複製到暫存陣列 t[0..3]
     * t[0] = 最低位 64 bits, t[3] = 最高位 64 bits
     */
    uint64_t t[4];
    t[0] = op->limb64[0];
    t[1] = op->limb64[1];
    t[2] = op->limb64[2];
    t[3] = op->limb64[3];

    /*
     * 依序取出 9 組 30-bit
     * 這可把 256 bits 拆成 9 個 30-bit (總計 270 bits，可容納 256 bits)
     * rop->limb[i] 依序取 t[0] 的最低 30 bits
     */
    for(int i = 0; i < 9; i++) {
        /* 取出當前 t[0] 的最低 30 bits */
        rop->limb[i] = (uint32_t)(t[0] & 0x3FFFFFFF);

        /*
         * 下面直接展開「整個 256-bit (t[3]:t[2]:t[1]:t[0]) 向右移 30 bits」的步驟：
         * new_t[0] = (old_t[0] >> 30) | (old_t[1] << 34)
         * new_t[1] = (old_t[1] >> 30) | (old_t[2] << 34)
         * new_t[2] = (old_t[2] >> 30) | (old_t[3] << 34)
         * new_t[3] =  old_t[3] >> 30
         */
        uint64_t t0 = t[0];
        uint64_t t1 = t[1];
        uint64_t t2 = t[2];
        uint64_t t3 = t[3];

        t[0] = (t0 >> 30) | (t1 << 34);
        t[1] = (t1 >> 30) | (t2 << 34);
        t[2] = (t2 >> 30) | (t3 << 34);
        t[3] =  t3 >> 30;
    }
}


