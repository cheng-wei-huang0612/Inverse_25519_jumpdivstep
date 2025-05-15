/* -------------------------------------------------------------
 * single_test_vs.c  ——  update_VS_mont 單筆測試
 * ------------------------------------------------------------- */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <gmp.h>
#include "big30.h"
#include "big30_mpz.h"
// big30_t P = {
//     0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff,
//     0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
//     0x00007fff
// };

/* 目標函式：參考 C 版與 AArch64 ASM 版 */
extern void gmp_update_VS_mont(big30_t *V, big30_t *S,
                               const int64_t *uuvvrrss);
extern void update_VS_mont    (big30_t *V, big30_t *S,
                               const int64_t *uuvvrrss);

/* -------------------------------------------------------------
 * 手動測資（可自行修改字串即可換測資）
 * ------------------------------------------------------------- */
// #define STR_V  "37620192916892967665112509054281599188718979465864298684806981345437189877408"
// #define STR_S  "32844599011566537666173553334539134761200497489524940500580708454075866613200"
// #define STR_U  "-494254824848555173"
// #define STR_VV "-345576069978545525"
// #define STR_R  "-423651074464645961"
// #define STR_SS "-483263725180254040"

// #define STR_V  "35692880567230725376068949609126876490301001071866808068209620559442512513959"
// #define STR_S  "7906403403303938599846707249508729410289980083297927307200159067272552735036"
// #define STR_U  "439596219076538230"
// #define STR_VV "-675421451772031644"
// #define STR_R  "-199271630711200283"
// #define STR_SS "-154286722336619991"



#define STR_V  "1766847064778384329583297500742918515827483896875618958121606201292619776"
#define STR_S  "1766847064778384329583297500742918515827483896875618958121606201292619777"
#define STR_U  "-1"
#define STR_VV "0"
#define STR_R  "0"
#define STR_SS "0"

/* ------------------------------------------------------------- */

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
    /* ------------ 1. 轉成 mpz ---------------------------------- */
    mpz_t mpV, mpS, mpu, mpv, mpr, mps;
    mpz_inits(mpV, mpS, mpu, mpv, mpr, mps, NULL);

    mpz_set_str_checked(mpV, STR_V);
    mpz_set_str_checked(mpS, STR_S);
    mpz_set_str_checked(mpu, STR_U);
    mpz_set_str_checked(mpv, STR_VV);
    mpz_set_str_checked(mpr, STR_R);
    mpz_set_str_checked(mps, STR_SS);

    /* ------------ 2. 轉 big30 與 int64 -------------------------- */
    big30_t V0, S0;
    big30_from_mpz(&V0, mpV);
    big30_from_mpz(&S0, mpS);

    int64_t uvrs[4] = {
        mpz_get_si(mpu), mpz_get_si(mpv),
        mpz_get_si(mpr), mpz_get_si(mps)
    };

    /* ------------ 3. 呼叫兩版本 -------------------------------- */
    big30_t V_asm = V0, S_asm = S0;
    big30_t V_ref = V0, S_ref = S0;

    update_VS_mont(&V_asm, &S_asm, uvrs);        /* ASM 被測 */
    gmp_update_VS_mont(&V_ref, &S_ref, uvrs);    /* 參考 C */

    /* ------------ 4. 轉回 mpz 比對 ----------------------------- */
    mpz_t mpV_asm, mpS_asm, mpV_ref, mpS_ref;
    mpz_inits(mpV_asm, mpS_asm, mpV_ref, mpS_ref, NULL);

    mpz_from_big30(mpV_asm, &V_asm);
    mpz_from_big30(mpS_asm, &S_asm);
    mpz_from_big30(mpV_ref, &V_ref);
    mpz_from_big30(mpS_ref, &S_ref);

    int okV = (mpz_cmp(mpV_asm, mpV_ref) == 0);
    int okS = (mpz_cmp(mpS_asm, mpS_ref) == 0);

    /* ------------ 5. Sage 驗算式 --------------------------------
      目標： (u*V + v*S) * (2^(-60) mod P) mod P == V_ref
              (r*V + s*S) * (2^(-60) mod P) mod P == S_ref            */
    gmp_printf("\n# ----- Sage quick-check -------------------------\n");
    gmp_printf("sage: P = 2**255 - 19\n");
    gmp_printf("sage: k = inverse_mod(2^60, P)\n");
    
    gmp_printf("sage: ((%Zd)*(%Zd) + (%Zd)*(%Zd)) * k %% P == (%Zd)\n",
              mpu, mpV, mpv, mpS, mpV_ref);
    
    gmp_printf("sage: ((%Zd)*(%Zd) + (%Zd)*(%Zd)) * k %% P == (%Zd)\n",
              mpr, mpV, mps, mpS, mpS_ref);
    // puts(okV && okS ? "\nsingle_test_vs PASSED"
    //                 : "\nsingle_test_vs FAILED");
    puts(okV && okS ? 
"\n"
"    ___    ___     ___     ___     ___     ___      _       _    \n"
"   | _ \\  /   \\   / __|   / __|   | __|   |   \\    | |     | |   \n"
"   |  _/  | - |   \\__ \\   \\__ \\   | _|    | |) |   |_|     |_|   \n"
"  _|_|_   |_|_|   |___/   |___/   |___|   |___/   _(_)_   _(_)_  \n"
"_| \"\"\" |_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_| \"\"\" |_| \"\"\" | \n"
"\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-' "
:
"\n"
"    ___    ___     ___     _       ___     ___      _       _    \n"
"   | __|  /   \\   |_ _|   | |     | __|   |   \\    | |     | |   \n"
"   | _|   | - |    | |    | |__   | _|    | |) |   |_|     |_|   \n"
"  _|_|_   |_|_|   |___|   |____|  |___|   |___/   _(_)_   _(_)_  \n"
"_| \"\"\" |_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_| \"\"\" |_| \"\"\" | \n"
"\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-' "
);




    /* ------------ 6. limb 印出 --------------------------------- */
    puts("\n--- Input --------------------------------------------------");
    print_big30("V0", &V0);
    print_big30("S0", &S0);

    puts("\n--- After update_VS_mont (ASM) ----------------------------");
    print_big30("V_asm", &V_asm);
    print_big30("S_asm", &S_asm);

    puts("\n--- After gmp_update_VS_mont (reference) ------------------");
    print_big30("V_ref", &V_ref);
    print_big30("S_ref", &S_ref);

    mpz_clears(mpV, mpS, mpu, mpv, mpr, mps,
               mpV_asm, mpS_asm, mpV_ref, mpS_ref, NULL);
    return okV && okS ? EXIT_SUCCESS : EXIT_FAILURE;
}

