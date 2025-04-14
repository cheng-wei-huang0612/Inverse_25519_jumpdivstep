#ifndef crypto_asm_rodata_h
#define crypto_asm_rodata_h

#ifdef __APPLE__
#define ASM_RODATA
// .static_data would make sense but breaks macos assembler for nG/*/*s2n*
#else
#define ASM_RODATA .section .rodata
#endif

#endif
