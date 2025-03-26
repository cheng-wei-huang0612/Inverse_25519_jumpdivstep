#include <stdio.h>
#include <stdint.h>
#include <stdlib.h> // rand(), srand()
#include <string.h>
#include <time.h>   // time()
#include <gmp.h>
   

#define LIMBS 4          // 先用 2 個 limb，總計 2*30 = 60 bits
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

// Assembly code to compute F' = u*F + v*G and G' = r*F + s*G mod 2^122
extern void linear_comb(
    big30long_t *resultF, big30long_t *resultG,
    const big30_t *F, const big30_t *G,
    const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
);


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
    for (int i = 0; i < (2-1); i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    // The final signed part goes to limb[LIMBS-1]
    rop->limb[2-1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}


void int64_from_small30(int64_t *rop, small30_t *op){
    
    *rop = (int64_t)(int32_t)(op->limb[1]);
    *rop = *rop << 30;
    *rop = *rop + op->limb[0];


}
void int64_from_mpz(const mpz_t op, int64_t *rop)
{

    // 先把 mpz_t 轉成 small30_t
    small30_t tmp30;
    small30_from_mpz(op, &tmp30);

    // 再把 small30_t 轉成 int64_t
    int64_from_small30(rop, &tmp30);
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



// Assembly code to compute F' = u*F + v*G and G' = r*F + s*G mod 2^122
void gmp_linear_comb(
    big30long_t *resultF, big30long_t *resultG,
    const big30_t *F, const big30_t *G,
    const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
) {
    // 1. 先準備 GMP 變數
    mpz_t mpF, mpG, mpu, mpv, mpr, mps, mpSum, mpTmp;
    mpz_inits(mpF, mpG, mpu, mpv, mpr, mps, mpSum, mpTmp, NULL);

    // 2. 將 (F, G, u, v) 轉成 mpz
    mpz_from_big30(mpF, F);
    mpz_from_big30(mpG, G);
    mpz_set_si(mpu, *u);
    mpz_set_si(mpv, *v);
    mpz_set_si(mpr, *r);
    mpz_set_si(mps, *s);

    //gmp_printf("mpu = %Zd\n",mpu);
    //gmp_printf("mpF = %Zd\n",mpF);
    //gmp_printf("mpv = %Zd\n",mpv);
    //gmp_printf("mpG = %Zd\n",mpG);

    // 3. 做運算：sum = (F * u) + (G * v)
    mpz_mul(mpSum, mpF, mpu);
    mpz_mul(mpTmp, mpG, mpv);
    mpz_add(mpSum, mpSum, mpTmp);

    // 4. 將 mpSum 轉回 big30long_t (每個 limb 30 bits)

    big30long_from_mpz(mpSum, resultF);

    mpz_mul(mpSum, mpF, mpr);
    mpz_mul(mpTmp, mpG, mps);
    mpz_add(mpSum, mpSum, mpTmp);

    big30long_from_mpz(mpSum, resultG);
    // 5. 清理 GMP 變數
    mpz_clears(mpF, mpG, mpu, mpv, mpr, mps, mpSum, mpTmp, NULL);
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

void random_gmp_in_range(mpz_t rop, gmp_randstate_t rstate, int bits) {
    // 1) 在 [0, 2^(bits+1)) 產生隨機整數
    mpz_urandomb(rop, rstate, bits + 1);

    // 2) shift = 2^bits
    mpz_t shift;
    mpz_init(shift);
    mpz_setbit(shift, bits);

    // 3) rop -= shift => 使 rop 落在 [-2^bits, 2^bits)
    mpz_sub(rop, rop, shift);

    mpz_clear(shift);
}


int main(){
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, (unsigned long) time(NULL));
    printf("Hello\n\n");

    big30_t F, G;
    //small30_t u, v, r, s;
    int64_t u, v, r, s;
    big30long_t resultF, resultG, asm_resultF, asm_resultG;
    for (int i = 0; i<LIMBS+2; i++){
        asm_resultF.limb[i] = 0;
        asm_resultG.limb[i] = 0;
    }

    mpz_t mpF, mpG, mpu, mpv, mpr, mps, mpR, mpS, mpASMR, mpASMS; 
    mpz_inits(mpF, mpG, mpu, mpv, mpr, mps, mpR, mpS, mpASMR, mpASMS, NULL);

    // 比方說，我想生成 [-2^61, 2^61) 的亂數：
    random_gmp_in_range(mpF, rstate, 121);
    random_gmp_in_range(mpG, rstate, 121);
    random_gmp_in_range(mpu, rstate, 61);
    random_gmp_in_range(mpv, rstate, 61);
    random_gmp_in_range(mpr, rstate, 61);
    random_gmp_in_range(mps, rstate, 61);

    mpz_set_str(mpF, "-1909170671966816274958804570106612566", 10);
    mpz_set_str(mpG, "-2553126723145237962503599023929624582", 10);
    mpz_set_str(mpu, "-685498195466894834", 10);
    mpz_set_str(mpv, "-682692460663655927", 10);
    mpz_set_str(mpr, "-684196370423833798", 10);
    mpz_set_str(mps, "2143746906747658530", 10);


    big30_from_mpz(mpF, &F);
    big30_from_mpz(mpG, &G);
    int64_from_mpz(mpu, &u);
    int64_from_mpz(mpv, &v);
    int64_from_mpz(mpr, &r);
    int64_from_mpz(mps, &s);
    // gmp_printf("mpF = %Zd\n", mpF);
    // gmp_printf("mpG = %Zd\n", mpG);
    // gmp_printf("mpu = %Zd\n", mpu);
    // gmp_printf("mpv = %Zd\n", mpv);
    // gmp_printf("mpr = %Zd\n", mpr);
    // gmp_printf("mps = %Zd\n", mps);
    
    mpz_t mp2p62, mp2p122,mptmp;
    mpz_inits(mp2p122,mp2p62,mptmp,NULL);
    mpz_set_si(mp2p62, 1);
    mpz_mul_2exp(mp2p62,mp2p62, 62);
    mpz_set_si(mp2p122, 1);
    mpz_mul_2exp(mp2p122,mp2p122, 122);

    printf("    Given    F = [limb0 = %d, limb1 = %d, limb2 = %d, limb3 = %d]\n", F.limb[0], F.limb[1], F.limb[2], F.limb[3]);
    gmp_printf("               = %Zd\n",mpF);
    mpz_add(mptmp,mpF,mp2p122);
    mpz_mod(mptmp, mptmp, mp2p122);
    gmp_printf("    unsigned F = %Zd\n\n",mptmp);
    printf("    Given    G = [limb0 = %d, limb1 = %d, limb2 = %d, limb3 = %d]\n", G.limb[0], G.limb[1], G.limb[2], G.limb[3]);
    gmp_printf("               = %Zd\n",mpG);
    mpz_add(mptmp,mpG,mp2p122);
    mpz_mod(mptmp, mptmp, mp2p122);
    gmp_printf("    unsigned G = %Zd\n\n",mptmp);
    small30_t small30u;
    small30_t small30v;
    small30_t small30r;
    small30_t small30s;
    small30_from_mpz(mpu, &small30u);
    printf("    Given    u = [limb0 = %d, limb1 = %d]\n", small30u.limb[0], small30u.limb[1]);
    gmp_printf("               = %Zd\n",mpu);
    gmp_printf("(Sage: %Zd == %d + (2**30) * %d)\n",mpu, small30u.limb[0], small30u.limb[1]);
    mpz_add(mptmp,mpu,mp2p62);
    mpz_mod(mptmp, mptmp, mp2p62);
    gmp_printf("    unsigned u = %Zd\n\n",mptmp);
    small30_from_mpz(mpv, &small30v);
    printf("    Given    v = [limb0 = %d, limb1 = %d]\n", small30v.limb[0], small30v.limb[1]);
    gmp_printf("               = %Zd\n",mpv);
    mpz_add(mptmp,mpv,mp2p62);
    mpz_mod(mptmp, mptmp, mp2p62);
    gmp_printf("    unsigned v = %Zd\n\n",mptmp);

    small30_from_mpz(mpr, &small30r);
    printf("    Given    r = [limb0 = %d, limb1 = %d]\n", small30r.limb[0], small30r.limb[1]);
    gmp_printf("               = %Zd\n",mpr);
    mpz_add(mptmp,mpr,mp2p62);
    mpz_mod(mptmp, mptmp, mp2p62);
    gmp_printf("    unsigned r = %Zd\n\n",mptmp);

    small30_from_mpz(mps, &small30s);
    printf("    Given    s = [limb0 = %d, limb1 = %d]\n", small30s.limb[0], small30s.limb[1]);
    gmp_printf("               = %Zd\n",mps);
    mpz_add(mptmp,mps,mp2p62);
    mpz_mod(mptmp, mptmp, mp2p62);
    gmp_printf("    unsigned s = %Zd\n\n",mptmp);
    printf("\n");

    printf("before asm\n");
    linear_comb(&asm_resultF, &asm_resultG, &F, &G, &u, &v, &r, &s);
    printf("asm complete\n");
    mpz_from_big30long(mpASMR, &asm_resultF);
    mpz_from_big30long(mpASMS, &asm_resultG);
    printf("    asm_result_F = [limb0 = %d, limb1 = %d, limb2 = %d, limb3 = %d,\n"
           "                    limb4 = %d, limb5 = %d]\n\n", asm_resultF.limb[0], asm_resultF.limb[1], asm_resultF.limb[2], asm_resultF.limb[3], asm_resultF.limb[4], asm_resultF.limb[5]);
    gmp_printf("                 = %Zd\n\n", mpASMR);
    printf("    asm_result_F = [limb0 = %u, limb1 = %u, limb2 = %u, limb3 = %u,\n"
           "                    limb4 = %u, limb5 = %u]\n\n", asm_resultF.limb[0], asm_resultF.limb[1], asm_resultF.limb[2], asm_resultF.limb[3], asm_resultF.limb[4], asm_resultF.limb[5]);
    gmp_printf("                 = %Zd\n\n", mpASMR);
    printf("    asm_result_G = [limb0 = %d, limb1 = %d, limb2 = %d, limb3 = %d,\n"
           "                    limb4 = %d, limb5 = %d]\n\n", asm_resultG.limb[0], asm_resultG.limb[1], asm_resultG.limb[2], asm_resultG.limb[3], asm_resultG.limb[4], asm_resultG.limb[5]);
    gmp_printf("                 = %Zd\n\n", mpASMS);
    printf("    asm_result_G = [limb0 = %u, limb1 = %u, limb2 = %u, limb3 = %u,\n"
           "                    limb4 = %u, limb5 = %u]\n\n", asm_resultG.limb[0], asm_resultG.limb[1], asm_resultG.limb[2], asm_resultG.limb[3], asm_resultG.limb[4], asm_resultG.limb[5]);
    gmp_printf("                 = %Zd\n\n", mpASMS);
    printf("\n");

    gmp_linear_comb(&resultF, &resultG, &F, &G, &u, &v, &r, &s);
    mpz_from_big30long(mpR, &resultF);
    mpz_from_big30long(mpS, &resultG);
    printf("correct_result_F = [limb0 = %d, limb1 = %d, limb2 = %d, limb3 = %d,\n"
           "                    limb4 = %d, limb5 = %d]\n\n", resultF.limb[0], resultF.limb[1], resultF.limb[2], resultF.limb[3], resultF.limb[4], resultF.limb[5]);
    gmp_printf("                 = %Zd\n\n", mpR);
    printf("correct_result_g = [limb0 = %d, limb1 = %d, limb2 = %d, limb3 = %d,\n"
           "                    limb4 = %d, limb5 = %d]\n\n", resultG.limb[0], resultG.limb[1], resultG.limb[2], resultG.limb[3], resultG.limb[4], resultG.limb[5]);
    gmp_printf("                 = %Zd\n\n", mpS);

    gmp_printf("\nsage: (%Zd) == (%Zd)\n ", mpR, mpASMR);
    gmp_printf("\nsage: (%Zd) == (%Zd)\n ", mpS, mpASMS);


    gmp_printf("\nsage: (((%Zd) * (%Zd)) + ((%Zd) * (%Zd)) - (%Zd)) %% (2^122) == 0\n", mpu, mpF, mpv, mpG, mpR);
    gmp_printf("\nsage: (((%Zd) * (%Zd)) + ((%Zd) * (%Zd)) - (%Zd)) %% (2^122) == 0\n", mpr, mpF, mps, mpG, mpS);

    



    mpz_clears(mpF, mpG, mpu, mpv, mpR, NULL);
    printf("\n\nByeBye\n");
    return 0;
}

