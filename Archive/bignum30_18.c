#include "bignum30_18.h"
#include <string.h> // for memset
#include <stdio.h>
#include <stdlib.h> // for rand

// 清 0
void bignum30_18_clear(bignum30_18 *x){
    memset(x->limb, 0, sizeof(x->limb));
}

// 以 64 位元整數初始化
void bignum30_18_set_u64(bignum30_18 *x, uint64_t val){
    bignum30_18_clear(x);
    x->limb[0] = (uint32_t)(val & 0x3FFFFFFF);  // 取低 30 bits
    val >>= 30;
    if(val){
        x->limb[1] = (uint32_t)(val & 0x3FFFFFFF);
        val >>= 30;
        if(val){
            x->limb[2] = (uint32_t)(val & 0x3FFFFFFF);
        }
    }
}

// 拷貝
void bignum30_18_copy(bignum30_18 *dst, const bignum30_18 *src){
    memcpy(dst->limb, src->limb, sizeof(dst->limb));
}

// 比較
int bignum30_18_cmp(const bignum30_18 *a, const bignum30_18 *b){
    for(int i = NLIMBS_30 - 1; i >= 0; i--){
        if(a->limb[i] < b->limb[i]) return -1;
        if(a->limb[i] > b->limb[i]) return  1;
    }
    return 0;
}

// 加
uint32_t bignum30_18_add(bignum30_18 *dst, const bignum30_18 *a, const bignum30_18 *b){
    uint64_t carry = 0;
    for(int i=0; i<NLIMBS_30; i++){
        uint64_t tmp = (uint64_t)a->limb[i] + (uint64_t)b->limb[i] + carry;
        dst->limb[i] = (uint32_t)(tmp & 0x3FFFFFFF);
        carry = tmp >> BITS_PER_LIMB; 
    }
    return (uint32_t)carry;
}

// 減
uint32_t bignum30_18_sub(bignum30_18 *dst, const bignum30_18 *a, const bignum30_18 *b){
    int64_t borrow = 0;
    for(int i=0; i<NLIMBS_30; i++){
        int64_t tmp = (int64_t)a->limb[i] - (int64_t)b->limb[i] - borrow;
        dst->limb[i] = (uint32_t)(tmp & 0x3FFFFFFF);
        borrow = (tmp < 0) ? 1 : 0;
    }
    return (uint32_t)borrow;
}

// 左移 (假設 shiftBits 為 30 的整數倍)
void bignum30_18_shl(bignum30_18 *x, int shiftBits){
    int limbsShift = shiftBits / BITS_PER_LIMB;
    if(limbsShift <= 0) return;
    // 從最高位往後搬
    for(int i=NLIMBS_30-1; i>=limbsShift; i--){
        x->limb[i] = x->limb[i-limbsShift];
    }
    // 前面補0
    for(int i=0; i<limbsShift; i++){
        x->limb[i] = 0;
    }
}

// naive 乘法 O(n^2)
void bignum30_18_mul(bignum30_18 *dst, const bignum30_18 *a, const bignum30_18 *b){
    bignum30_18 temp;
    bignum30_18_clear(&temp);

    for(int i=0; i<NLIMBS_30; i++){
        uint64_t carry = 0;
        for(int j=0; j + i<NLIMBS_30; j++){
            uint64_t tmp = (uint64_t)temp.limb[i+j] 
                         + (uint64_t)a->limb[i]*(uint64_t)b->limb[j]
                         + carry;
            temp.limb[i+j] = (uint32_t)(tmp & 0x3FFFFFFF);
            carry = tmp >> BITS_PER_LIMB;
        }
    }
    bignum30_18_copy(dst, &temp);
}

// naive 取模
void bignum30_18_mod(bignum30_18 *dst, const bignum30_18 *m){
    while(bignum30_18_cmp(dst, m) >= 0){
        bignum30_18_sub(dst, dst, m);
    }
}

// 產生 bits
void bignum30_18_randbits(bignum30_18 *x, int bits){
    bignum30_18_clear(x);
    int total = 0, idx = 0;
    uint64_t chunk = 0;
    int chunkBits = 0;

    while(total < bits){
        // rand() typically ~31 bits
        uint32_t r = (uint32_t)rand();
        chunk |= ((uint64_t)r << chunkBits);
        chunkBits += 31;
        while(chunkBits >= BITS_PER_LIMB && idx < NLIMBS_30){
            x->limb[idx] = (uint32_t)(chunk & 0x3FFFFFFF);
            chunk >>= BITS_PER_LIMB;
            chunkBits -= BITS_PER_LIMB;
            idx++;
        }
        total += 31;
    }
}

// 以16進位印出
void bignum30_18_printhex(const bignum30_18 *x){
    int i = NLIMBS_30 - 1;
    while(i>0 && x->limb[i] == 0) i--;
    printf("%x", x->limb[i]); // 不加前導0
    i--;
    for(; i>=0; i--){
        printf("%07x", x->limb[i]); 
    }
}

/* -------------------------
   與 GMP 互轉的函式
   ------------------------- */

void bignum30_18_to_mpz(const bignum30_18 *src, mpz_t dst){
    // 直接從最低 limb 開始組合
    mpz_set_ui(dst, 0);
    // 我們可以一 limb limb 地往 mpz_t 裡加
    for(int i=NLIMBS_30-1; i>=0; i--){
        // 先左移 30 bits
        mpz_mul_2exp(dst, dst, BITS_PER_LIMB);
        // 再加上 src->limb[i]
        mpz_add_ui(dst, dst, src->limb[i]);
    }
}

void bignum30_18_from_mpz(bignum30_18 *dst, const mpz_t src){
    bignum30_18_clear(dst);

    // 我們要從最高位 -> 低位 取? 
    // mpz_export()也可直接做；這裡做最簡單 parse 之:
    // 反方向: 不斷 % 2^30 => limb[0], 再右移 30 bits => limb[1], ...
    // 直到 18 limbs or mpz==0

    mpz_t tmp;
    mpz_init_set(tmp, src);

    for(int i=0; i<NLIMBS_30; i++){
        // dst->limb[i] = tmp % 2^30
        uint64_t part = mpz_get_ui(tmp) & 0x3FFFFFFF; // 取低 30 bits
        dst->limb[i] = (uint32_t)part;
        // tmp >>= 30
        mpz_fdiv_q_2exp(tmp, tmp, BITS_PER_LIMB);

        if(mpz_cmp_ui(tmp, 0) == 0) break;
    }

    mpz_clear(tmp);
}

