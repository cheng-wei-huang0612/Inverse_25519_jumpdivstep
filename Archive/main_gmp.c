#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>

/*
  對應你的 Python 腳本:
    P = 2^255 - 19
    B = 1 << 30
    M = 678152731  (== (-P^{-1}) mod B)
    r = 9
    R = B^r = 2^(30*r)
    R_square = R^2 mod P

  MontMul(A, u) 做 A*u / R mod P (總共執行 r 輪)
    for i in range(r):
        l = ((A % B) * M) % B
        A = (A + l * P) // B
    return A
*/

#define B   ((mp_limb_t)1 << 30) // 2^30
#define M   (678152731UL)        // (-P^{-1}) mod B
#define R_EXP (9)                // r = 9 => R = B^9 = 2^(30*9) = 2^270

// 全域的 mpz_t P, R, R_square (你可自行改為函式內部, 這裡圖方便)
static mpz_t P, R, R_square;

// MontMul: 計算 A * u / R (mod P)
// 傳回結果放到 mpz_t ret 中
static void MontMul(mpz_t ret, const mpz_t A, const mpz_t u) {
    // 先做一個臨時乘積 T = A * u
    // (若 u 只是小於 2^60，你可以先轉成 mpz_t; 不過保險做法為 mpz 皆可)
    mpz_t T, tmp;
    mpz_inits(T, tmp, NULL);

    // T = A * u
    mpz_mul(T, A, u);

    // r = 9 輪
    for(int i = 0; i < R_EXP; i++){
        // l = ((T % B) * M) % B
        // 先取得 T mod B => T mod 2^30 => mpz_mod_2exp(tmp, T, 30)
        mpz_mod_2exp(tmp, T, 30);

        // tmp *= M
        mpz_mul_ui(tmp, tmp, M);

        // tmp mod B => 再對 tmp 取 2^30
        mpz_mod_2exp(tmp, tmp, 30);

        // T = (T + tmp*P) // B
        mpz_addmul(T, tmp, P);       // T = T + tmp*P
        // 相當於 T >>= 30
        mpz_fdiv_q_2exp(T, T, 30);  
    }

    // 此時 T 就是 A*u / R mod P (但可能需要一次條件式減法以確保 < P)
    // 可能 T <= 2P, 只需比較一次
    if(mpz_cmp(T, P) >= 0){
        mpz_sub(T, T, P);
    }

    mpz_set(ret, T);

    mpz_clears(T, tmp, NULL);
}


int main(void){
    // 初始化 GMP 亂數狀態
    gmp_randstate_t state;
    gmp_randinit_default(state);
    // 以 time(NULL) 當 seed (非安全隨機, 只做測試)
    gmp_randseed_ui(state, (unsigned long)time(NULL));

    // 初始化 P = 2^255 - 19
    mpz_init(P);
    mpz_set_ui(P, 1);
    mpz_mul_2exp(P, P, 255); // P = 1 << 255
    mpz_sub_ui(P, P, 19);    // P = (1<<255) - 19

    // 初始化 R = B^r = 2^(30*r) 
    // 透過位移做: R = 1 << (30*r)
    mpz_init(R);
    mpz_set_ui(R, 1);
    mpz_mul_2exp(R, R, 30 * R_EXP);

    // R_square = (R^2) mod P
    mpz_init(R_square);
    mpz_mul(R_square, R, R);
    mpz_mod(R_square, R_square, P);

    // 測試 1000 次
    int num_tests = 1000;

    mpz_t A, u, Mont, Mont_result, Correct;
    mpz_inits(A, u, Mont, Mont_result, Correct, NULL);

    for(int i = 0; i < num_tests; i++){
        // A in [0, P-1]
        mpz_urandomm(A, state, P);  // 0 <= A < P

        // u in [0, 2^60 - 1]
        // mpz_urandomb(u, state, 60); => 取得 60 bits random
        mpz_urandomb(u, state, 60);

        // Mont = MontMul(A, u) => A*u / R mod P
        MontMul(Mont, A, u);

        // Mont_result = MontMul(Mont, R_square) => (A*u / R)* (R^2) / R = A*u mod P
        MontMul(Mont_result, Mont, R_square);

        // Correct = (A * u) mod P
        mpz_mul(Correct, A, u);
        mpz_mod(Correct, Correct, P);

        // 比對
        if(mpz_cmp(Mont_result, Correct) != 0){
            gmp_printf("Mismatch!\n");
            gmp_printf("  A        = %Zd\n", A);
            gmp_printf("  u        = %Zd\n", u);
            gmp_printf("  Mont     = %Zd\n", Mont);
            gmp_printf("  MontRes  = %Zd\n", Mont_result);
            gmp_printf("  Correct  = %Zd\n", Correct);
            break;
        }
        // else you can print "OK" or do nothing
    }

    gmp_printf("Finished %d tests. If no Mismatch, everything is correct.\n", num_tests);

    // 清理
    mpz_clears(A, u, Mont, Mont_result, Correct, NULL);
    mpz_clears(P, R, R_square, NULL);
    gmp_randclear(state);

    return 0;
}

