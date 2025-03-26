#include <stdio.h>
#include <stdint.h>
#include <stdlib.h> // rand(), srand()
#include <string.h>
#include <time.h>   // time()
#include <gmp.h>
   

#define LIMBS 9          // 先用 2 個 limb，總計 2*30 = 60 bits
#define BIG30_SHIFT  30
#define NUM_RANDOM_TEST 100000

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
// 用來執行一次測試：比較組合語言版 (linear_comb) 與 GMP 版 (gmp_linear_comb) 的結果
// 回傳：0 => 成功, 1 => 失敗
int run_test(
    const mpz_t mpF,
    const mpz_t mpG,
    const mpz_t mpu,
    const mpz_t mpv,
    const mpz_t mpr,
    const mpz_t mps
) {

    //printf("testing on numbers:\n");
    //gmp_printf("F = %Zd\n",mpF);
    // 1. 先把資料轉成 big30_t / int64_t 等
    big30_t F, G;
    big30long_t resultF, resultG;
    big30long_t asm_resultF, asm_resultG;
    int64_t u, v, r, s;

    // 初始化
    for (int i = 0; i < (LIMBS+2); i++){
        asm_resultF.limb[i] = 0;
        asm_resultG.limb[i] = 0;
        resultF.limb[i] = 0;
        resultG.limb[i] = 0;
    }

    big30_from_mpz(mpF, &F);
    big30_from_mpz(mpG, &G);
    int64_from_mpz(mpu, &u);
    int64_from_mpz(mpv, &v);
    int64_from_mpz(mpr, &r);
    int64_from_mpz(mps, &s);

    // 2. 呼叫組合語言版本
    linear_comb(&asm_resultF, &asm_resultG, &F, &G, &u, &v, &r, &s);
    
    // 3. 呼叫 GMP 版本
    gmp_linear_comb(&resultF, &resultG, &F, &G, &u, &v, &r, &s);
    
    // 4. 轉回 mpz 比較
    mpz_t mpASMF, mpASMG, mpCorrectF, mpCorrectG;
    mpz_inits(mpASMF, mpASMG, mpCorrectF, mpCorrectG, NULL);
    
    mpz_from_big30long(mpASMF, &asm_resultF);
    mpz_from_big30long(mpASMG, &asm_resultG);
    mpz_from_big30long(mpCorrectF, &resultF);
    mpz_from_big30long(mpCorrectG, &resultG);
    //gmp_printf("mpASMF = %Zd\n",mpASMF);
    //gmp_printf("mpCorrectF = %Zd\n",mpCorrectF);

    // 因為是 mod 2^122 運算，可將結果帶回 [-2^121, 2^121) 來比較
    // 或直接比對 mpASMF == mpCorrectF (mod 2^122)
    // 這裡做直接比對是否相等即可（若要模比較，可自行調整）
    int fail_flag = 0;
    if (mpz_cmp(mpASMF, mpCorrectF) != 0) {
        fail_flag = 1;
    }
    if (mpz_cmp(mpASMG, mpCorrectG) != 0) {
        fail_flag = 1;
    }

    mpz_clears(mpASMF, mpASMG, mpCorrectF, mpCorrectG, NULL);
    return fail_flag;
}

int main(){
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, (unsigned long) time(NULL));

    printf("=== Test linear_comb() with corner cases and 100 random tests ===\n\n");

    // ----------------------------------------------
    // (A) 先測試一些 corner cases
    // ----------------------------------------------
    // 你可以依照需求，隨意增減此處的 corner case
    // 下面示範幾種極端或特殊情況：
    struct {
        const char* F_str;
        const char* G_str;
        const char* u_str;
        const char* v_str;
        const char* r_str;
        const char* s_str;
    } corner_cases[] = {
        // 1. 全部皆 0
        {"0", "0", "0", "0", "0", "0"},
        // 2. F, G 為 2^121 - 1,  u, v, r, s = 0
        {"2596148429267413814265248164610047",  // (2^121 - 1)
         "2596148429267413814265248164610047",  
         "0", "0", "0", "0"},
        // 3. F, G 為 -2^121,  u, v, r, s = 1
        {"-2596148429267413814265248164610048", // -2^121
         "-2596148429267413814265248164610048",
         "1", "1", "1", "1"},
        // 4. F= some negative, G=some positive, u= -1, v= 1, r=2, s= -2
        {"-1000000000000", "1234567890123", "-1", "1", "2", "-2"},
        // 5. 大負數 * 大負數 => 大正 (ex: F= -2^120, u= -2^60)
        {"-1298074214633706907132624082305024",  // -2^120
         "42", // small
         "-1152921504606846976", // -2^60
         "1",
         "-42",
         "999999999999"},
    };

    int num_corner = sizeof(corner_cases)/sizeof(corner_cases[0]);
    int fail_count = 0;
    int total_test_count = 0;

    for(int i=0; i<num_corner; i++){
        mpz_t mpF, mpG, mpu, mpv, mpr, mps;
        mpz_inits(mpF, mpG, mpu, mpv, mpr, mps, NULL);

        // 轉成 mpz
        mpz_set_str(mpF, corner_cases[i].F_str, 10);
        mpz_set_str(mpG, corner_cases[i].G_str, 10);
        mpz_set_str(mpu, corner_cases[i].u_str, 10);
        mpz_set_str(mpv, corner_cases[i].v_str, 10);
        mpz_set_str(mpr, corner_cases[i].r_str, 10);
        mpz_set_str(mps, corner_cases[i].s_str, 10);

        // 執行測試
        int fail_flag = run_test(mpF, mpG, mpu, mpv, mpr, mps);
        total_test_count++;
        if(fail_flag){
            fail_count++;
            printf("Corner case #%d FAILED!\n", i);
            gmp_printf(" F=%Zd\n G=%Zd\n u=%Zd, v=%Zd, r=%Zd, s=%Zd\n", mpF, mpG, mpu, mpv, mpr, mps);
        } else {
            printf("Corner case #%d PASSED!\n", i);
        }

        mpz_clears(mpF, mpG, mpu, mpv, mpr, mps, NULL);
    }

    // ----------------------------------------------
    // (B) 再做 100 次隨機測試
    // ----------------------------------------------
    // 範圍設定：
    //  F, G 在 [-2^121, 2^121)
    //  u, v, r, s 在 [-2^61,  2^61)
    //  這裡你可自行調整
    for(int i=0; i<NUM_RANDOM_TEST; i++){
        mpz_t mpF, mpG, mpu, mpv, mpr, mps;
        mpz_inits(mpF, mpG, mpu, mpv, mpr, mps, NULL);

        random_gmp_in_range(mpF, rstate, 271);
        random_gmp_in_range(mpG, rstate, 271);
        random_gmp_in_range(mpu, rstate, 61);
        random_gmp_in_range(mpv, rstate, 61);
        random_gmp_in_range(mpr, rstate, 61);
        random_gmp_in_range(mps, rstate, 61);

        

        int fail_flag = run_test(mpF, mpG, mpu, mpv, mpr, mps);
        total_test_count++;
        if(fail_flag){
            fail_count++;
            printf("Random test #%d FAILED!\n", i);
            gmp_printf(" F=%Zd\n G=%Zd\n u=%Zd, v=%Zd, r=%Zd, s=%Zd\n", mpF, mpG, mpu, mpv, mpr, mps);
            // 如果想在失敗時結束，可加 break;
        }

        mpz_clears(mpF, mpG, mpu, mpv, mpr, mps, NULL);
    }

    // ----------------------------------------------
    // (C) 統計與結果輸出
    // ----------------------------------------------
    printf("\n========================================\n");
    printf("Total Tests : %d\n", total_test_count);
    printf("Fail  Tests : %d\n", fail_count);
    if(fail_count == 0){
        printf("ALL TESTS PASSED!\n");
    } else {
        printf("SOME TESTS FAILED.\n");
    }
    printf("========================================\n\n");

    gmp_randclear(rstate);
    return 0;
}