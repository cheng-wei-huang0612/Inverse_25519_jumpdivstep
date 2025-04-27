/* ------------------------------------------------------------------
 * single_test.c  ——  單筆手動測試 + Sage 輸出 + limb 列印
 * ------------------------------------------------------------------ */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <gmp.h>
#include "big30.h"
#include "big30_mpz.h"
#include "prg.h"

/* 供比較的兩個版本 */
extern void update_FG(big30_t *F, big30_t *G, const int64_t *uuvvrrss);
extern void gmp_update_FG(big30_t *F, big30_t *G, const int64_t *uuvvrrss);

/* ---------------------------- 測資 ----------------------------- */
#define STR_F  "0x7b18923489abcdef0123456789abcdef0fedcba9876543210"
#define STR_G  "0x1deadbeefcafebabe112233445566778899aabbccddeeff"
#define STR_U  "123456789012345"      /* |u| < 2^61 */
#define STR_V  "-98765432109876"
#define STR_R  "1122334455"
#define STR_S  "-9988776655"
/* -------------------------------------------------------------- */

static void mpz_set_str_checked(mpz_t z, const char *s)
{
    if (mpz_set_str(z, s, 0) != 0) {
        fprintf(stderr, "mpz_set_str failed on %s\n", s);
        exit(EXIT_FAILURE);
    }
}

static void print_big30(const char *tag, const big30_t *B)
{
    printf("    %s = [limb0 = %d, limb1 = %d, limb2 = %d, limb3 = %d\n"
           "           limb4 = %d, limb5 = %d, limb6 = %d, limb7 = %d\n"
           "           limb8 = %d]\n",
           tag,
           B->limb[0], B->limb[1], B->limb[2], B->limb[3],
           B->limb[4], B->limb[5], B->limb[6], B->limb[7], B->limb[8]);
}

int main(void)
{
    /* ---------- 1. 把字串測資轉為 mpz_t -------------------------- */
    mpz_t mpF, mpG, mpu, mpv, mpr, mps;
    mpz_inits(mpF, mpG, mpu, mpv, mpr, mps, NULL);

    mpz_set_str_checked(mpF, STR_F);
    mpz_set_str_checked(mpG, STR_G);
    mpz_set_str_checked(mpu, STR_U);
    mpz_set_str_checked(mpv, STR_V);
    mpz_set_str_checked(mpr, STR_R);
    mpz_set_str_checked(mps, STR_S);

    /* ---------- 2. 轉成 big30 與 int64 --------------------------- */
    big30_t F0, G0;
    big30_from_mpz(&F0, mpF);
    big30_from_mpz(&G0, mpG);

    int64_t uvrs[4] = {
        mpz_get_si(mpu),
        mpz_get_si(mpv),
        mpz_get_si(mpr),
        mpz_get_si(mps)
    };

    /* ---------- 3. 各跑一次 ------------------------------------- */
    big30_t F_asm = F0, G_asm = G0;
    big30_t F_ref = F0, G_ref = G0;

    update_FG(&F_asm, &G_asm, uvrs);       /* 你的 ASM */
    gmp_update_FG(&F_ref, &G_ref, uvrs);   /* 參考 C 版 */

    /* ---------- 4. 轉回 mpz_t 進行比較 -------------------------- */
    mpz_t mpF_out_asm, mpG_out_asm, mpF_out_ref, mpG_out_ref;
    mpz_inits(mpF_out_asm, mpG_out_asm, mpF_out_ref, mpG_out_ref, NULL);

    mpz_from_big30(mpF_out_asm, &F_asm);
    mpz_from_big30(mpG_out_asm, &G_asm);
    mpz_from_big30(mpF_out_ref, &F_ref);
    mpz_from_big30(mpG_out_ref, &G_ref);

    int okF = (mpz_cmp(mpF_out_asm, mpF_out_ref) == 0);
    int okG = (mpz_cmp(mpG_out_asm, mpG_out_ref) == 0);

    puts(okF && okG ? "\nsingle_test PASSED" : "\nsingle_test FAILED");

    /* ---------- 5. Sage 驗算用公式列印 --------------------------- */
    gmp_printf("\nsage: (((%Zd) * (%Zd) + (%Zd) * (%Zd))>>60) == (%Zd)\n",
               mpu, mpF, mpv, mpG, mpF_out_ref);
    gmp_printf("\nsage: (((%Zd) * (%Zd) + (%Zd) * (%Zd))>>60) == (%Zd)\n",
               mpr, mpF, mps, mpG, mpG_out_ref);

    /* ---------- 6. limb 逐項列印 ------------------------------- */
    puts("\n--- Input --------------------------------------------------");
    print_big30("F0", &F0);
    print_big30("G0", &G0);

    puts("\n--- After update_FG (ASM) ---------------------------------");
    print_big30("F_asm", &F_asm);
    print_big30("G_asm", &G_asm);

    puts("\n--- After gmp_update_FG (reference) -----------------------");
    print_big30("F_ref", &F_ref);
    print_big30("G_ref", &G_ref);

    /* ---------- 7. 收尾 ----------------------------------------- */
    mpz_clears(mpF, mpG, mpu, mpv, mpr, mps,
               mpF_out_asm, mpG_out_asm, mpF_out_ref, mpG_out_ref,
               NULL);
    return okF && okG ? EXIT_SUCCESS : EXIT_FAILURE;
}

