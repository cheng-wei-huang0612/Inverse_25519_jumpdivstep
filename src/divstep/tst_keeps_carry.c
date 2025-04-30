/* tst_ror_tst_carry.c  :  驗證  TST  xA, xB, ROR #1  不改 C flag  */

#include <stdio.h>
#include <stdint.h>

int main(void)
{
    uint64_t nzcv_before, nzcv_after;

    /*
     * 1.  ADDS xzr,xzr,#0  → 把 C 清成 0      (N=0, Z=1, C=0, V=0)
     * 2.  MRS  nzcv_before
     * 3.  xA = -1   (全 1)           ; xB = 1 (LSB=1)
     * 4.  TST  xA, xB, ROR #1       ; 只該改 N,Z
     * 5.  MRS  nzcv_after
     */
    __asm__ volatile(
        "adds      x2, xzr, xzr          \n"   // C ← 0
        "mrs       %0,  nzcv             \n"   // 讀旗標 (before)
        "mov       x2,  -1               \n"   // x2 = xa = 0xFFFF...FFFF
        "mov       x3,  #1               \n"   // x3 = xb = 0x...0001
        "tst       x2,  x3,  ROR #1      \n"   // <<<< 被測指令
        "mrs       %1,  nzcv             \n"   // 讀旗標 (after)
        : "=&r"(nzcv_before), "=&r"(nzcv_after)   // 輸出
        :                                          // 無額外輸入
        : "x2", "x3", "cc"                        // clobber: 用到 x2,x3 以及 NZCV
    );

    /* 解析並列印旗標： bit[31:28] = N Z C V */
    uint32_t b = (uint32_t)(nzcv_before >> 28);
    uint32_t a = (uint32_t)(nzcv_after  >> 28);

    printf("Before  (after ADDS) : N=%u  Z=%u  C=%u  V=%u\n",
           (b>>3)&1, (b>>2)&1, (b>>1)&1, b&1);

    printf("After   (after TST ) : N=%u  Z=%u  C=%u  V=%u\n",
           (a>>3)&1, (a>>2)&1, (a>>1)&1, a&1);

    printf("\nC flag changed?  %s\n",
           (((b ^ a) >> 1) & 1) ? "YES ❌ (會被改)" : "NO ✅ (保持不變)");

    return 0;
}

