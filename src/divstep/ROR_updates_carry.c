/*  ROR_updates_carry.c
 *  目的：驗證 AArch64 單獨的 ROR 指令是否會改動 Carry
 *  編譯：clang -O0 -std=gnu11 ROR_updates_carry.c -o ROR_updates_carry
 */
#include <stdio.h>
#include <stdint.h>

int main(void)
{
    unsigned long nzcv_before, nzcv_after;

    __asm__ volatile(
        /* 1) 先把 C 清 0（N=0,Z=1,C=0,V=0）----------------------- */
        "adds     x2,  xzr, xzr          \n"   /* 0 + 0 → Z=1, C=0 */

        /* 2) 讀 NZCV → before ------------------------------------- */
        "mrs      %0,  nzcv              \n"

        /* 3) 準備要旋轉的值：x3 = 1 (LSB=1) ---------------------- */
        "mov      x3,  #1                \n"

        /* 4) 執行 ROR  (alias of EXTR) --------------------------- */
        "ror      x2,  x3,  #1           \n"   /* 0x...0001 → 0x8000… */

        /* 5) 再讀 NZCV → after ----------------------------------- */
        "mrs      %1,  nzcv              \n"
        : "=&r"(nzcv_before), "=&r"(nzcv_after)
        :
        : "x2", "x3", "cc"
    );

    uint32_t b = (uint32_t)(nzcv_before >> 28);
    uint32_t a = (uint32_t)(nzcv_after  >> 28);

    printf("Before (after ADDS) : N=%u  Z=%u  C=%u  V=%u\n",
           (b>>3)&1, (b>>2)&1, (b>>1)&1, b&1);
    printf("After  (after ROR ) : N=%u  Z=%u  C=%u  V=%u\n",
           (a>>3)&1, (a>>2)&1, (a>>1)&1, a&1);

    printf("\nC flag changed?  %s\n",
           (((b ^ a) >> 1) & 1) ? "YES ❌ (被改動)" : "NO ✅ (保持不變)");

    return 0;
}

