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

static void corner_case_tests();
static void random_tests(int test_count);

int main(){
    printf("=== Test START ===\n\n");

    // 1) Corner Case 測試
    corner_case_tests();

    // 2) Random 測試
    int test_count = 10000; // 可以自己調整，這裡先示範 20 次
    random_tests(test_count);

    printf("\n=== Test END ===\n\n");
    return 0;
}

/*  Corner Case 測試:  
    這裡我們挑選一些特別的參數 (F, G, u, v)，
    例如：0, 最大正數, 最大負數, 以及組合邊界。
*/
static void corner_case_tests() {
    printf(">>> CORNER CASE TESTS <<<\n");

    // 宣告所需的 GMP 結構
    mpz_t mpF, mpG, mpu, mpv, mpR, mpASMR;
    mpz_inits(mpF, mpG, mpu, mpv, mpR, mpASMR, NULL);

    // 宣告你的 big30 / small30 結構
    big30_t F, G;
    small30_t u, v;
    big30long_t result, asm_result;

    // 列出一些 corner case
    // 你可依需求加入更多
    // 例如: 0, 2^62 - 1, -2^62, 還有一些你覺得有意義的邊界
    long long corner_values[] = {
        0LL,
        (1LL << 62) - 1,     // 2^62 - 1
        -(1LL << 62),       // -2^62
        12345LL,
        -12345LL,
    };
    int n_cases = sizeof(corner_values)/sizeof(corner_values[0]);

    for(int iF = 0; iF < n_cases; iF++){
        for(int iG = 0; iG < n_cases; iG++){
            for(int iU = 0; iU < n_cases; iU++){
                for(int iV = 0; iV < n_cases; iV++){
                    // 設定 GMP 變數
                    mpz_set_si(mpF, corner_values[iF]);
                    mpz_set_si(mpG, corner_values[iG]);
                    mpz_set_si(mpu, corner_values[iU]);
                    mpz_set_si(mpv, corner_values[iV]);

                    // 轉成 big30 / small30
                    big30_from_mpz(mpF, &F);
                    big30_from_mpz(mpG, &G);
                    small30_from_mpz(mpu, &u);
                    small30_from_mpz(mpv, &v);

                    // 執行組合語言/NEON 實作
                    muladd(&asm_result, &F, &G, &u, &v);

                    // 執行 GMP 實作
                    gmp_muladd(&result, &F, &G, &u, &v);

                    // 轉回 GMP 比較
                    mpz_from_big30long(mpASMR, &asm_result);
                    mpz_from_big30long(mpR, &result);

                    if(mpz_cmp(mpASMR, mpR) != 0){
                        // 顯示錯誤訊息
                        gmp_printf("ERROR in corner case:\n");
                        gmp_printf("F=%Zd, G=%Zd, u=%Zd, v=%Zd\n", mpF, mpG, mpu, mpv);
                        gmp_printf("asm_result  = %Zd\n", mpASMR);
                        gmp_printf("correct_res = %Zd\n", mpR);
                        goto END_CORNER; 
                    }
                }
            }
        }
    }

    printf("[Corner Case Tests] ALL PASSED!\n");

END_CORNER:
    mpz_clears(mpF, mpG, mpu, mpv, mpR, mpASMR, NULL);
}

/*  Random 測試:
    1) 亂數生成 [-2^62, 2^62) 的 F, G, u, v
    2) 執行 muladd 與 gmp_muladd
    3) 比較結果
*/
static void random_tests(int test_count) {
    printf("\n>>> RANDOM TESTS (count=%d) <<<\n", test_count);

    // 初始化 GMP 變數
    mpz_t mpF, mpG, mpu, mpv, mpR, mpASMR;
    mpz_inits(mpF, mpG, mpu, mpv, mpR, mpASMR, NULL);

    // big30 / small30 結構
    big30_t F, G;
    small30_t u, v;
    big30long_t result, asm_result;

    // 亂數種子
    srand((unsigned)time(NULL));

    for(int i = 1; i <= test_count; i++){
        // 產生隨機數 [-2^62, 2^62)
        random_gmp_in_range(mpF, rand(), 62);
        random_gmp_in_range(mpG, rand(), 62);
        random_gmp_in_range(mpu, rand(), 62);
        random_gmp_in_range(mpv, rand(), 62);

        // 轉成 big30 / small30
        big30_from_mpz(mpF, &F);
        big30_from_mpz(mpG, &G);
        small30_from_mpz(mpu, &u);
        small30_from_mpz(mpv, &v);

        // 組合語言/NEON 實作
        muladd(&asm_result, &F, &G, &u, &v);

        // GMP 實作
        gmp_muladd(&result, &F, &G, &u, &v);

        // 轉回 GMP 比較
        mpz_from_big30long(mpASMR, &asm_result);
        mpz_from_big30long(mpR, &result);

        if(mpz_cmp(mpASMR, mpR) != 0){
            gmp_printf("ERROR in random test #%d:\n", i);
            gmp_printf("F=%Zd, G=%Zd, u=%Zd, v=%Zd\n", mpF, mpG, mpu, mpv);
            gmp_printf("asm_result  = %Zd\n", mpASMR);
            gmp_printf("correct_res = %Zd\n", mpR);
            goto END_RANDOM;
        }
        else {
            // 你可以印一些成功訊息
            // printf("Test #%d PASSED\n", i);
        }
    }

    printf("[Random Tests] ALL PASSED!\n");

END_RANDOM:
    mpz_clears(mpF, mpG, mpu, mpv, mpR, mpASMR, NULL);
}
