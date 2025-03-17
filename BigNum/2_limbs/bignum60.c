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

// 大整數結構：包含 2 個 32 位 limb
// 實際上只用它們的低 30 bits，最高 2 bits 盡量避免溢位/混淆
typedef struct {
    int32_t limb[LIMBS];
} big60_t;


typedef struct {
    int32_t limb[2*LIMBS];
} big120_t;



// 將一個 64-bit (int64_t) x 存入 big60_t 的二補數表示中。
// 假設 x 理論上應該在 [-2^59, 2^59) 區間內，但即使超出也會自動 mod 2^60。
void big60_from_int64(int64_t x, big60_t *r) {

    int32_t limb0;
    int32_t limb1; 

    limb0 = x & (((int64_t)1 << 30) - 1);
    x = x >> 30;
    limb1 = x; 

    r->limb[0] = limb0;
    r->limb[1] = limb1;
}

int64_t int64_from_big60(big60_t *r){
    int64_t recombine = 0;

    recombine += (r->limb[1]);
    recombine <<= 30;
    recombine += (r->limb[0]);

    return recombine;
}

void big60_add(const big60_t *a, const big60_t *b, big60_t *r) {
    int32_t limb0;
    int32_t limb1; 

    limb0 = (a->limb[0]) + (b->limb[0]);
    limb1 = (a->limb[1]) + (b->limb[1]);

    // carry 
    limb1 += (limb0>>30);
    limb0 &= ((int32_t) 1 << 30) - 1;

    r->limb[0] = limb0;
    r->limb[1] = limb1;
}

// do a - b
void big60_sub(const big60_t *a, const big60_t *b, big60_t *r) {
    int32_t limb0;
    int32_t limb1; 

    limb0 = (a->limb[0]) - (b->limb[0]);
    limb1 = (a->limb[1]) - (b->limb[1]);

    // borrow 
    limb1 -= ((limb0 >> 31) & ((int32_t)1));
    limb0 += ((limb0 >> 31) & ((int32_t)1 << 30));

    r->limb[0] = limb0;
    r->limb[1] = limb1;

}

void mpz_from_big60(const big60_t *a, mpz_t rop){
    mpz_set_ui(rop, 0);
    mpz_t tmp; 
    mpz_init(tmp);

    mpz_set_si(tmp, a->limb[1]);
    mpz_mul_2exp(tmp, tmp, 30);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[0]);
    mpz_add(rop, rop, tmp);

    mpz_clear(tmp);
}

void mpz_from_big120(const big120_t *a, mpz_t rop){
    mpz_set_ui(rop, 0);
    mpz_t tmp; 
    mpz_init(tmp);

    mpz_set_si(tmp, a->limb[3]);
    mpz_mul_2exp(tmp, tmp, 90);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[2]);
    mpz_mul_2exp(tmp, tmp, 60);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[1]);
    mpz_mul_2exp(tmp, tmp, 30);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[0]);
    mpz_add(rop, rop, tmp);

    mpz_clear(tmp);
}

void big60_mul(const big60_t *a, const big60_t *b, big120_t *r) {
    int32_t limb0 = 0;
    int32_t limb1 = 0;
    int32_t limb2 = 0;
    int32_t limb3 = 0;

    uint64_t temp, temp_low;

    int32_t a0, a1, b0, b1, a_hat, b_hat;
    a0 = a->limb[0];
    a1 = a->limb[1];
    a_hat = -((uint32_t)a->limb[1] >> 31);
    b0 = b->limb[0];
    b1 = b->limb[1];
    b_hat = -((uint32_t)b->limb[1] >> 31);

    temp = (uint64_t)(uint32_t)a0 * (uint64_t)(uint32_t)b0;
    printf("Sage: %u * %u == %llu\n", a0, b0, temp);
    temp_low = temp & (((uint64_t)1<<30) - 1);
    limb0 += temp_low;
    temp >>= 30; 
    limb1 += temp;
    printf("limb0 = %d\n", limb0);
    printf("limb1 = %d\n", limb1);
    printf("limb2 = %d\n", limb2);
    printf("limb3 = %d\n", limb3);
    printf("-------------------------- behaves as expected\n\n");

    temp = (uint64_t)(uint32_t)a0 * (uint64_t)(uint32_t)b1;
    printf("Sage: %u * %u == %llu\n", a0, b1, temp);
    temp_low = temp & (((uint64_t)1<<30) - 1);
    limb1 += temp_low;
    temp >>= 30; 
    limb2 += temp;
    printf("limb0 = %d\n", limb0);
    printf("limb1 = %d\n", limb1);
    printf("limb2 = %d\n", limb2);
    printf("limb3 = %d\n", limb3);

    temp = (uint64_t)(uint32_t)a1 * (uint64_t)(uint32_t)b0;
    printf("Sage: %u * %u == %llu\n", a1, b0, temp);
    temp_low = temp & (((uint64_t)1<<30) - 1);
    limb1 += temp_low;
    temp >>= 30; 
    limb2 += temp;

    temp = (uint64_t)(uint32_t)a1 * (uint64_t)(uint32_t)b1;
    printf("Sage: %u * %u == %llu\n", a1, b1, temp);
    temp_low = temp & (((uint64_t)1<<30) - 1);
    limb2 += temp_low;
    temp >>= 30;
    limb3 += temp;


    // Carry propagation
    limb1 += ((uint32_t)limb0>>30);
    limb0 &= ((int32_t) 1 << 30) - 1;

    limb2 += ((uint32_t)limb1>>30);
    limb1 &= ((int32_t) 1 << 30) - 1;

    limb3 += ((uint32_t)limb2>>30);
    limb2 &= ((int32_t) 1 << 30) - 1;

    big120_t temp_big;
    temp_big.limb[0] = limb0;
    temp_big.limb[1] = limb1;
    temp_big.limb[2] = limb2;
    temp_big.limb[3] = limb3;


    mpz_t mptemp;
    mpz_init(mptemp);

    //mpz_from_big120(&temp_big, mptemp);

    mpz_set_ui(mptemp, 0);
    mpz_t tmp; 
    mpz_init(tmp);

    mpz_set_ui(tmp, (uint32_t)a->limb[3]);
    mpz_mul_2exp(tmp, tmp, 90);
    mpz_add(mptemp, mptemp, tmp);

    mpz_set_ui(tmp, (uint32_t)a->limb[2]);
    mpz_mul_2exp(tmp, tmp, 60);
    mpz_add(mptemp, mptemp, tmp);

    mpz_set_ui(tmp, (uint32_t)a->limb[1]);
    mpz_mul_2exp(tmp, tmp, 30);
    mpz_add(mptemp, mptemp, tmp);

    mpz_set_ui(tmp, (uint32_t)a->limb[0]);
    mpz_add(mptemp, mptemp, tmp);

    mpz_clear(tmp);

    uint64_t aint = ((uint64_t)(uint32_t)a->limb[0]) + ((uint64_t)(uint32_t)a->limb[1] << 30);
    uint64_t bint = ((uint64_t)(uint32_t)b->limb[0]) + ((uint64_t)(uint32_t)b->limb[1] << 30);
    //printf("a(unsigned) = %llu\n", aint);
    //printf("b(unsigned) = %llu\n", bint);
    gmp_printf("Sage: ((%llu * %llu) - %Zd)", aint, bint,mptemp);
    


    // Minus a_hat & b(unsigned)
    int32_t bx4_0, bx4_1;
    bx4_0 = (b0 << 2) & (((int32_t)1 << 30) - 1);
    bx4_1 = ((uint32_t)b0 >> 28) + (b1<<2);

    limb2 = limb2 - (a_hat & bx4_0);
    limb3 = limb3 - (a_hat & bx4_1);

    limb3 -= ((limb2 >> 31) & ((int32_t)1));
    limb2 += ((limb2 >> 31) & ((int32_t)1 << 30));


    // Minus b_hat & a(unsigned)
    int32_t ax4_0, ax4_1;
    ax4_0 = (a0 << 2) & (((int32_t)1 << 30) - 1);
    ax4_1 = ((uint32_t)a0 >> 28) + (a1<<2);

    limb2 = limb2 - (b_hat & ax4_0);
    limb3 = limb3 - (b_hat & ax4_1);

    limb3 -= ((limb2 >> 31) & ((int32_t)1));
    limb2 += ((limb2 >> 31) & ((int32_t)1 << 30));


    r->limb[0] = limb0;
    r->limb[1] = limb1;
    r->limb[2] = limb2;
    r->limb[3] = limb3;

}



int main(){
    printf("Hello\n\n");

    // 先初始化 GMP 用到的變數
    mpz_t mpA, mpB, mpProd, mpR;
    mpz_init(mpA);
    mpz_init(mpB);
    mpz_init(mpProd);
    mpz_init(mpR);

    // ---------------------------
    // Corner Case 測試
    // ---------------------------
    printf("===== Corner Case Tests for big60_mul =====\n");

    // 根據需求自行增改
    struct {
        int64_t a;
        int64_t b;
    } corner_tests[] = {
        {0, 0},
        {1, 1},
        {-1, 1},
        {1, -1},
        { (1LL << 59), (1LL << 59) },
        {-(1LL << 59), (1LL << 59)},
        { (1LL << 59) - 1, -(1LL << 59) },
        { (1LL << 59), (1LL << 59) - 1 },
    };
    int num_corners = sizeof(corner_tests) / sizeof(corner_tests[0]);

    for(int i = 0; i < num_corners; i++){
        int64_t aa = corner_tests[i].a;
        int64_t bb = corner_tests[i].b;

        // 轉成 big60
        big60_t a_big, b_big;
        big120_t r_big;
        big60_from_int64(aa, &a_big);
        big60_from_int64(bb, &b_big);

        // 做乘法
        big60_mul(&a_big, &b_big, &r_big);

        // 用 GMP 算出正確答案
        mpz_set_si(mpA, aa);
        mpz_set_si(mpB, bb);
        mpz_mul(mpProd, mpA, mpB);

        // 從 r_big 組合出 mpR
        mpz_from_big120(&r_big, mpR);

        // 比對
        if(mpz_cmp(mpProd, mpR) == 0){
            printf("Corner Test #%d [a=%lld, b=%lld] : OK\n", i, (long long)aa, (long long)bb);
        } else {
            printf("Corner Test #%d [a=%lld, b=%lld] : MISMATCH!\n", i, (long long)aa, (long long)bb);
            gmp_printf("   GMP product = %Zd\n", mpProd);
            gmp_printf("   big60_mul   = %Zd\n", mpR);
        }
    }

    // ---------------------------
    // Random 測試
    // ---------------------------
    printf("\n===== Random Tests for big60_mul =====\n");

    srand((unsigned)time(NULL));
    int NUM_RANDOM_TESTS = 10; // 你想多一點就改大

    for(int i = 0; i < NUM_RANDOM_TESTS; i++){
        // 產生隨機 60-bit
        uint64_t rndA = (((uint64_t)rand() << 32) ^ rand()) & (((uint64_t)1 << 60) - 1);
        uint64_t rndB = (((uint64_t)rand() << 32) ^ rand()) & (((uint64_t)1 << 60) - 1);

        // 隨機決定正負
        int64_t signA = (rand() & 1) ? 1 : -1;
        int64_t signB = (rand() & 1) ? 1 : -1;
        int64_t aa = (int64_t)rndA * signA;
        int64_t bb = (int64_t)rndB * signB;

        // big60 轉換
        big60_t a_big, b_big;
        big120_t r_big;
        big60_from_int64(aa, &a_big);
        big60_from_int64(bb, &b_big);

        // 做乘法
        big60_mul(&a_big, &b_big, &r_big);

        // GMP 正確乘法
        mpz_set_si(mpA, aa);
        mpz_set_si(mpB, bb);
        mpz_mul(mpProd, mpA, mpB);

        // big120 -> mpz
        mpz_from_big120(&r_big, mpR);

        // 比對
        if(mpz_cmp(mpProd, mpR) == 0){
            printf("Random Test #%d: [a=%lld, b=%lld] OK\n", i, (long long)aa, (long long)bb);
        } else {
            printf("Random Test #%d: [a=%lld, b=%lld] MISMATCH!\n", i, (long long)aa, (long long)bb);
            gmp_printf("   GMP product = %Zd\n", mpProd);
            gmp_printf("   big60_mul   = %Zd\n", mpR);
        }
    }

    // ---------------------------
    // Specific 測試
    // ---------------------------
    printf("\n===== Specific Tests for big60_mul =====\n");
    int64_t a = -410274133133804733;
    int64_t b = -521455377973507695;

    a = -1;
    b = -1;
    big60_t a_big, b_big;
    big120_t r_big;

    big60_from_int64(a, &a_big);
    big60_from_int64(b, &b_big);
    
    big60_mul(&a_big, &b_big, &r_big);

    // GMP 正確乘法
    mpz_set_si(mpA, a);
    mpz_set_si(mpB, b);
    mpz_mul(mpProd, mpA, mpB);

    // big120 -> mpz
    mpz_from_big120(&r_big, mpR);

    gmp_printf("   GMP product = %Zd\n", mpProd);
    gmp_printf("   big60_mul   = %Zd\n", mpR);
    
    mpz_t diff, p92; 
    mpz_init(diff);
    mpz_init(p92);
    mpz_sub(diff, mpProd, mpR);
    gmp_printf("   Difference  = %Zd\n", diff);
    mpz_set_ui(p92, (uint32_t)1);
    mpz_mul_2exp(p92, p92, 92);
    gmp_printf("   2 ** 92     = %Zd\n", p92);

    

    

    // ---------------------------
    // 結束
    // ---------------------------
    mpz_clear(mpA);
    mpz_clear(mpB);
    mpz_clear(mpProd);
    mpz_clear(mpR);

    printf("\n\nByeBye\n");
    return 0;
}


