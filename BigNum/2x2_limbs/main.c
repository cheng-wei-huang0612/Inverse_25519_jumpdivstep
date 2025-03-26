//gcc bignum60.c \
//    -I/opt/homebrew/include \
//    -L/opt/homebrew/lib \
//    -lgmp \
//    -o bignum60 && ./bignum60
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h> // rand(), srand()
#include <time.h>   // time()
#include <gmp.h>
   

#define LIMBS 2          // 先用 2 個 limb，總計 2*30 = 60 bits
#define BIG30_SHIFT  30

typedef struct {
    uint32_t limb[LIMBS]; // 最多9 limbs（F, G）
} big30_t;

typedef struct {
    uint32_t limb[2]; // u, v 兩個 limbs
} small30_t;

typedef struct {
    uint32_t limb[LIMBS + 2]; // 最多11 limbs uF + vG
} big30long_t;

// Compute u*F + v*G mod 2^122
extern void muladd(
    big30long_t *result,
    const big30_t *F, const big30_t *G,
    const small30_t *u, const small30_t *v
);

// 將 big30_t 轉換成 mpz_t
void mpz_from_small30(mpz_t rop, const small30_t *x) {
    mpz_set_ui(rop, 0);
    mpz_t tmp; 
    mpz_init(tmp);

    for(int i=1; i>=0;i--){

    mpz_set_si(tmp, (int32_t)x->limb[i]);
    mpz_mul_2exp(rop, rop, 30);
    mpz_add(rop, rop, tmp);

    }
}

// 將 big30_t 轉換成 mpz_t
void mpz_from_big30(mpz_t rop, const big30_t *x) {
    mpz_set_ui(rop, 0);
    mpz_t tmp; 
    mpz_init(tmp);

    for(int i=(LIMBS-1); i>=0;i--){

    mpz_set_si(tmp, (int32_t)x->limb[i]);
    mpz_mul_2exp(rop, rop, 30);
    mpz_add(rop, rop, tmp);

    }
}


void mpz_from_big30long(mpz_t rop, const big30long_t *x){
    mpz_set_ui(rop, 0);
    mpz_t tmp; 
    mpz_init(tmp);

    for(int i=(LIMBS+1); i>=0;i--){

    mpz_set_si(tmp, (int32_t)x->limb[i]);
    mpz_mul_2exp(rop, rop, 30);
    mpz_add(rop, rop, tmp);
    }
}



void small30_from_mpz(const mpz_t op, small30_t *rop){
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract lower limbs, each 30 bits
    for (int i = 0; i < (1); i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    // The final signed part goes to limb[LIMBS-1]
    rop->limb[1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}

void big30_from_mpz(const mpz_t op, big30_t *rop){
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract lower limbs, each 30 bits
    for (int i = 0; i < (LIMBS-1); i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    // The final signed part goes to limb[LIMBS-1]
    rop->limb[LIMBS-1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}

void big30long_from_mpz(const mpz_t op, big30long_t *rop){
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract lower limbs, each 30 bits
    for (int i = 0; i < (LIMBS+1); i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    // The final signed part goes to limb[LIMBS]
    rop->limb[LIMBS+1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}



void gmp_muladd(
    big30long_t *result,
    const big30_t *F, const big30_t *G,
    const small30_t *u, const small30_t *v
) {
    // 1. 先準備 GMP 變數
    mpz_t mpF, mpG, mpu, mpv, mpSum, mpTmp;
    mpz_inits(mpF, mpG, mpu, mpv, mpSum, mpTmp, NULL);

    // 2. 將 (F, G, u, v) 轉成 mpz
    mpz_from_big30(mpF, F);
    mpz_from_big30(mpG, G);
    mpz_from_small30(mpu, u);
    mpz_from_small30(mpv, v);

    //gmp_printf("mpu = %Zd\n",mpu);
    //gmp_printf("mpF = %Zd\n",mpF);
    //gmp_printf("mpv = %Zd\n",mpv);
    //gmp_printf("mpG = %Zd\n",mpG);

    // 3. 做運算：sum = (F * u) + (G * v)
    mpz_mul(mpSum, mpF, mpu);
    mpz_mul(mpTmp, mpG, mpv);
    mpz_add(mpSum, mpSum, mpTmp);

    // 4. 將 mpSum 轉回 big30long_t (每個 limb 30 bits)

    big30long_from_mpz(mpSum, result);

    // 5. 清理 GMP 變數
    mpz_clears(mpF, mpG, mpu, mpv, mpSum, mpTmp, NULL);
}



/**
 * random_gmp_in_range(rop, bits)
 * 
 * 產生一個亂數 mpz_t 整數，範圍為：
 *     [ -2^bits ,  2^bits )
 *
 * 算法步驟：
 * 1) 先在 [0, 2^(bits+1)) 中產生一個隨機整數。
 * 2) 再減去 2^bits，讓結果落在 [ -2^bits, 2^bits ).
 */
void random_gmp_in_range(mpz_t rop, unsigned long seed, int bits) {
    // 1. 初始化亂數狀態（示範用，每次呼叫皆重新初始化）
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, seed);

    // 2. 先在 [0, 2^(bits+1)) 產生隨機整數
    mpz_urandomb(rop, rstate, bits + 1);

    // 3. 建立 shift = 2^bits
    mpz_t shift;
    mpz_init(shift);
    mpz_set_ui(shift, 0);
    mpz_setbit(shift, bits); // shift = 1 << bits

    // 4. rop - shift => 使 rop 落入 [-2^bits, 2^bits)
    mpz_sub(rop, rop, shift);

    // 5. 清理
    mpz_clear(shift);
    gmp_randclear(rstate);
}


int main(){
    printf("Hello\n\n");

    big30_t F, G;
    small30_t u, v; 
    big30long_t result, asm_result;

    mpz_t mpF, mpG, mpu, mpv, mpR, mpASMR; 
    mpz_inits(mpF, mpG, mpu, mpv, mpR, mpASMR, NULL);

    // 比方說，我想生成 [-2^62, 2^62) 的亂數：
    random_gmp_in_range(mpF, (unsigned long)time(NULL), 62);
    random_gmp_in_range(mpG, (unsigned long)time(NULL), 62);
    random_gmp_in_range(mpu, (unsigned long)time(NULL), 62);
    random_gmp_in_range(mpv, (unsigned long)time(NULL), 62);

    //mpz_set_str(mpF, "123123", 10);
    //mpz_set_str(mpG, "-1231173049", 10);
    //mpz_set_str(mpu, "-1921504606846976", 10);
    //mpz_set_str(mpv, "-123327084932178490", 10);

    big30_from_mpz(mpF, &F);
    big30_from_mpz(mpG, &G);
    small30_from_mpz(mpu, &u);
    small30_from_mpz(mpv, &v);

    printf("    Given    F = [limb0 = %d, limb1 = %d]\n", F.limb[0], F.limb[1]);
    gmp_printf("               = %Zd\n",mpF);
    printf("    Given    G = [limb0 = %d, limb1 = %d]\n", G.limb[0], G.limb[1]);
    gmp_printf("               = %Zd\n",mpG);
    printf("    Given    u = [limb0 = %d, limb1 = %d]\n", u.limb[0], u.limb[1]);
    gmp_printf("               = %Zd\n",mpu);
    printf("    Given    v = [limb0 = %d, limb1 = %d]\n", v.limb[0], v.limb[1]);
    gmp_printf("               = %Zd\n",mpv);
    printf("\n");

    muladd(&asm_result, &F, &G, &u, &v);
    printf("    asm_result = [limb0 = %d, limb1 = %d, limb2 = %d, limb3 = %d]\n", asm_result.limb[0], asm_result.limb[1], asm_result.limb[2], asm_result.limb[3]);
    mpz_from_big30long(mpASMR, &asm_result);
    gmp_printf("               = %Zd\n", mpASMR);
    printf("\n");

    gmp_muladd(&result, &F, &G, &u, &v);
    mpz_from_big30long(mpR, &result);
    printf("correct_result = [limb0 = %d, limb1 = %d, limb2 = %d, limb3 = %d]\n", result.limb[0], result.limb[1], result.limb[2], result.limb[3]);
    gmp_printf("               = %Zd\n", mpR);

    gmp_printf("\nsage: ((%Zd * %Zd) + (%Zd * %Zd) - %Zd) %% (2^122) == 0\n", mpu, mpF, mpv, mpG, mpR);

    



    mpz_clears(mpF, mpG, mpu, mpv, mpR, NULL);
    printf("\n\nByeBye\n");
    return 0;
}


