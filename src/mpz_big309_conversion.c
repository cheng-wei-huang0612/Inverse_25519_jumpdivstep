#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>
#include "mybig30.h"

/**
 * Each big30_9 limb covers 30 bits.
 * The array has 9 limbs in total.
 */
#define BIG30_SHIFT  30

/**
 * Convert a big30_9 structure to an mpz_t value.
 *
 * Explanation:
 *  1) We set the mpz_t 'rop' to the highest limb (limb[8]) with sign.
 *  2) Then, for i = 7 down to 0, we shift 'rop' left by 30 bits and add the current limb.
 */
void mpz_t_from_big30_9_t(mpz_t rop, const big30_9 *x)
{
    mpz_t temp;
    mpz_init(temp);

    // Initialize rop with the signed value from the top limb
    mpz_set_si(rop, (int32_t)(x->limb[8]));

    // Multiply by 2^30 and add each lower limb in descending order
    for (int i = 7; i >= 0; i--) {
        mpz_mul_2exp(rop, rop, BIG30_SHIFT);
        mpz_set_ui(temp, (unsigned long)x->limb[i]);
        mpz_add(rop, rop, temp);
    }

    mpz_clear(temp);
}

/**
 * Convert an mpz_t value to a big30_9 structure.
 *
 * Explanation:
 *  1) We create a copy of 'op' into 'tmp'.
 *  2) For i = 0..7, extract the lowest 30 bits (using mpz_mod_2exp),
 *     store them in rop->limb[i], then divide 'tmp' by 2^30.
 *  3) The remaining part in 'tmp' is placed into rop->limb[8] as a signed integer.
 */
void big30_9_t_from_mpz_t(big30_9 *rop, const mpz_t op)
{
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract 8 lower limbs, each 30 bits
    for (int i = 0; i < 8; i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }

    // The final signed part goes to limb[8]
    rop->limb[8] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}





int big30_9_cmp(const big30_9 *a, const big30_9 *b) {
    for (int i = 0; i < 9; i++) {
        if (a->limb[i] != b->limb[i]) {
            return 0;  // 不同
        }
    }
    return 1; // 完全相同
}

void print_big30_9(const big30_9 *x, const char *label) {
    printf("%s = [", label);
    for (int i = 0; i < 9; i++) {
        printf("%d", x->limb[i]);
        if (i < 8) {
            printf(", ");
        }
    }
    printf("]\n");
}

big30_9 random_big30_9(void) {
    big30_9 r;
    // 每個 limb 只取 30 bits => mask = (1u << 30) - 1 = 1073741823 (0x3FFFFFFF)
    const unsigned long mask30 = 0x3FFFFFFF;

    // limb[0..7] 取 30 bits
    for (int i = 0; i < 8; i++) {
        unsigned long rnd = (unsigned long)rand();
        r.limb[i] = (int32_t)(rnd & mask30);
    }
    // limb[8] 也取 30 bits，但可能做簡單的正負擴充:
    //   1/2 機率讓它變負 (用最高一 bit 當 sign)
    {
        unsigned long rnd = (unsigned long)rand() & mask30;
        // 讓最高 bit 決定正負
        if (rnd & (1UL << 29)) {
            // 視作負值
            // 先把 rnd 保持 30 bits => cast int32_t
            int32_t tmp = (int32_t)(rnd & 0x3FFFFFFF);
            // 再看需不需要 sign-extend => 其實 C 自動會把 int32_t 當成有符號
            // 但要確保 bit 29 為 sign bit => 產生負數
            // 做法:  tmp |= (1 << 30) 也可, 不過會超過 30bits
            // 這裡直接手動置為負
            if (tmp > 0) tmp = -tmp;
            r.limb[8] = tmp;
        } else {
            // 視作正值
            r.limb[8] = (int32_t)rnd;
        }
    }

    return r;
}

int main(void)
{
    srand((unsigned int)time(NULL));

    // 測試用 mpz_t
    mpz_t temp;
    mpz_init(temp);

    //--------------------------------------
    // 1) Corner cases
    //--------------------------------------
    // a) 全零
    {
        big30_9 zeroA = {0};
        big30_9 zeroB;
        mpz_t_from_big30_9_t(temp, &zeroA);
        big30_9_t_from_mpz_t(&zeroB, temp);

        printf("Test Zero:\n");
        if (!big30_9_cmp(&zeroA, &zeroB)) {
            printf("  Error! Zero mismatch.\n");
            print_big30_9(&zeroA, "zeroA");
            print_big30_9(&zeroB, "zeroB");
        } else {
            printf("  Passed.\n");
        }
    }

    // b) 最大正數 (假設 limb[8] >= 0, limb[0..7] = 2^30 - 1)
    {
        big30_9 maxPosA = {0};
        for (int i = 0; i < 8; i++) {
            maxPosA.limb[i] = (1 << 30) - 1;  // 0x3FFFFFFF
        }
        // limb[8] 設為某個正值 (例如 0 或 12345) 也可
        maxPosA.limb[8] =  0; // 這樣就是最高 30 bits = 0
        
        big30_9 maxPosB;
        mpz_t_from_big30_9_t(temp, &maxPosA);

        
        big30_9_t_from_mpz_t(&maxPosB, temp);
        






        printf("Test Max Positive-like:\n");
        if (!big30_9_cmp(&maxPosA, &maxPosB)) {
            printf("  Error! Max positive mismatch.\n");
            print_big30_9(&maxPosA, "maxPosA");
            print_big30_9(&maxPosB, "maxPosB");
        } else {
            printf("  Passed.\n");
        }
    }

    // c) 最小負數 (範例：limb[8] = -1，limb[0..7] = 0)
    {
        big30_9 negA = {0};
        negA.limb[8] = -1;
        big30_9 negB;
        mpz_t_from_big30_9_t(temp, &negA);
        big30_9_t_from_mpz_t(&negB, temp);

        printf("Test Negative corner:\n");
        if (!big30_9_cmp(&negA, &negB)) {
            printf("  Error! Negative corner mismatch.\n");
            print_big30_9(&negA, "negA");
            print_big30_9(&negB, "negB");
        } else {
            printf("  Passed.\n");
        }
    }

    // d) 一些小的正負值 (例如 1, -1, 2^30, -2^30, 2^31, -2^31, ...)
    //    這裡示範幾個
    {
        int64_t testVals[] = {1, -1, (1LL << 30), -(1LL << 30), (1LL << 31), -(1LL << 31), 0};
        printf("Test small int corner:\n");
        for (int i = 0; i < 7; i++) {
            // 做 big30_9 => mpz => big30_9
            big30_9 smallA = {0};
            // 把 testVals[i] 塞到 limb[8] (或者拆到 limb[0..7] 也可，但簡單起見只放 limb[8])
            smallA.limb[8] = (int32_t)testVals[i];

            big30_9 smallB;
            mpz_t_from_big30_9_t(temp, &smallA);
            big30_9_t_from_mpz_t(&smallB, temp);

            if (!big30_9_cmp(&smallA, &smallB)) {
                printf("  Error at value %lld!\n", (long long)testVals[i]);
                print_big30_9(&smallA, "smallA");
                print_big30_9(&smallB, "smallB");
            } else {
                printf("  Passed %lld.\n", (long long)testVals[i]);
            }
        }
    }

    //--------------------------------------
    // 2) Random cases
    //--------------------------------------
    printf("Test random big30_9 -> mpz -> big30_9\n");
    int numRandom = 1000;  // 您可自行調整測試筆數
    for (int i = 0; i < numRandom; i++) {
        big30_9 rA = random_big30_9();
        big30_9 rB;
        mpz_t_from_big30_9_t(temp, &rA);
        big30_9_t_from_mpz_t(&rB, temp);

        if (!big30_9_cmp(&rA, &rB)) {
            printf("  Random case #%d mismatch!\n", i);
            print_big30_9(&rA, "rA");
            print_big30_9(&rB, "rB");
        }

    }
    printf("Random test done.\n");

    mpz_clear(temp);




    //--
    // 3) Specific test 
    //--
    big30_9 F;
    F.limb[0] = 774951983;
    F.limb[1] = 202499996;
    F.limb[2] = 454394681;
    F.limb[3] = 908044846;
    F.limb[4] = 16858218;
    F.limb[5] = 561532266;
    F.limb[6] = 1073727851;
    F.limb[7] = 1073741823;
    F.limb[8] = -1;

    mpz_t mpF;
    mpz_init(mpF);

    //mpz_t_from_big30_9_t(mpF, &F);
    
    //mpz_t temp; 
    mpz_init(temp);

    printf("F.limb[8] = %d\n",F.limb[8]);
    mpz_set_si(mpF, (int32_t)F.limb[8]);



    gmp_printf("mpF = %Zd\n", mpF);

    return 0;
}

//void mpz_t_from_big30_9_t(mpz_t rop, const big30_9 *x)
//{
//    mpz_t temp;
//    mpz_init(temp);

    // Initialize rop with the signed value from the top limb
//    mpz_set_si(rop, x->limb[8]);

    // Multiply by 2^30 and add each lower limb in descending order
//    for (int i = 7; i >= 0; i--) {
//        mpz_mul_2exp(rop, rop, BIG30_SHIFT);
//        mpz_set_ui(temp, (unsigned long)x->limb[i]);
//        mpz_add(rop, rop, temp);
//    }
//
//    mpz_clear(temp);
//}
