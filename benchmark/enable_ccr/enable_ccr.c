#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/smp.h>

static void enable_ccr(void *info)
{
#ifdef __aarch64__
    /* 1) 允許 EL0 存取 PMU */
    asm volatile("msr PMUSERENR_EL0, %0" : : "r"(1));
    /* 2) 啟動 PMU (bit0)；可選 bit2 先歸零 cycle counter */
    asm volatile("msr PMCR_EL0, %0" : : "r"(1));
    /* 3) 使能 cycle counter (bit31) */
    asm volatile("msr PMCNTENSET_EL0, %0" : : "r"(0x80000000));
#else
    /* 32‑bit ARM （留作參考） */
    asm volatile("mcr p15, 0, %0, c9, c14, 0" :: "r"(1));
    asm volatile("mcr p15, 0, %0, c9, c12, 0" :: "r"(1 | 16));
    asm volatile("mcr p15, 0, %0, c9, c12, 1" :: "r"(0x8000000f));
#endif
}

static int __init ccr_init(void)
{
    on_each_cpu(enable_ccr, NULL, 1);
    pr_info("Userspace access to CCR enabled\n");
    return 0;
}

static void __exit ccr_exit(void)
{
    /* 不做 disable，系統通常無需回復 */
    pr_info("CCR module unloaded\n");
}

module_init(ccr_init);
module_exit(ccr_exit);
MODULE_LICENSE("GPL");

