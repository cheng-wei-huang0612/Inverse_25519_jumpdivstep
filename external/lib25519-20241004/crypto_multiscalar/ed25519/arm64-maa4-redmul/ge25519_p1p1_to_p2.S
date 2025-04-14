#include "crypto_asm_hidden.h"
// linker define ge25519_p1p1_to_p2

	.p2align 4
	ASM_HIDDEN _CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2)
	.globl _CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2)
	ASM_HIDDEN CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2)
	.globl CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2)

_CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2):
CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2):

	sub	sp, sp, #96
	stp	x19, x20, [sp, #0]
	stp	x21, x22, [sp, #16]
	stp	x23, x24, [sp, #32]
	stp	x25, x26, [sp, #48]
	stp	x27, x28, [sp, #64]
	stp	x29, x30, [sp, #80]
	
	mov	x19, #19
	mov	x21, #0x8000000000000000	
	
	/* p1p1 to p2 */
	
	// mul
	ldp	x3, x4, [x1, #0]
	ldp	x5, x6, [x1, #16]
	ldp	x7, x16, [x1, #96]
	ldp	x17, x27, [x1, #112]

	mul	x8, x4, x27
	mul	x30, x5, x17
	adds	x8, x8, x30
	cset	x9, cs
	mul	x30, x6, x16
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x3, x27
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x4, x17
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x5, x16
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x6, x7
	adds	x10, x8, x30
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x30, x3, x7
	adds	x8, x8, x30
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x30, x6, x17
	adds	x10, x10, x30
	cset	x11, cs
	umulh	x30, x4, x27
	adds	x10, x10, x30
	adc	x11, x11, xzr
	umulh	x30, x5, x17
	adds	x10, x10, x30
	adc	x11, x11, xzr
	umulh	x30, x6, x16
	adds	x12, x10, x30
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x30, x3, x16
	adds	x10, x10, x30
	adc	x11, x11, xzr
	mul	x30, x4, x7
	adds	x10, x10, x30
	adc	x11, x11, xzr
	umulh	x30, x3, x7
	adds	x10, x10, x30
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x30, x5, x27
	adds	x12, x12, x30
	cset	x13, cs
	umulh	x30, x6, x17
	adds	x14, x12, x30
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x30, x3, x17
	adds	x12, x12, x30
	adc	x13, x13, xzr
	mul	x30, x4, x16
	adds	x12, x12, x30
	adc	x13, x13, xzr
	mul	x30, x5, x7
	adds	x12, x12, x30
	adc	x13, x13, xzr
	umulh	x30, x3, x16
	adds	x12, x12, x30
	adc	x13, x13, xzr
	umulh	x30, x4, x7
	adds	x12, x12, x30
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x30, x3, x27
	adds	x14, x14, x30
	adc	x15, x15, xzr	
	mul	x30, x4, x17
	adds	x14, x14, x30
	adc	x15, x15, xzr
	mul	x30, x5, x16
	adds	x14, x14, x30
	adc	x15, x15, xzr
	mul	x30, x6, x7
	adds	x14, x14, x30
	adc	x15, x15, xzr
	umulh	x30, x3, x17
	adds	x14, x14, x30
	adc	x15, x15, xzr
	umulh	x30, x4, x16
	adds	x14, x14, x30
	adc	x15, x15, xzr
	umulh	x30, x5, x7
	adds	x14, x14, x30
	adc	x15, x15, xzr
	
	adds	x10, x10, x9
	adcs	x12, x12, x11
	adcs	x14, x14, x13
	adc	x15, x15, xzr
	
	cmn	x14, x14
	adc	x15, x15, x15
	mul	x15, x15, x19

	bic	x14, x14, x21
	adds	x8, x8, x15
	adcs	x9, x10, xzr
	adcs	x10, x12, xzr
	adc	x11, x14, xzr
        
	stp	x8, x9, [x0, #0]
	stp	x10, x11, [x0, #16]
    
	// mul
	ldp	x3, x4, [x1, #32]
	ldp	x5, x6, [x1, #48]
	ldp	x7, x16, [x1, #64]
	ldp	x17, x27, [x1, #80]
	
	mul	x8, x4, x27
	mul	x30, x5, x17
	adds	x8, x8, x30
	cset	x9, cs
	mul	x30, x6, x16
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x3, x27
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x4, x17
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x5, x16
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x6, x7
	adds	x10, x8, x30
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x30, x3, x7
	adds	x8, x8, x30
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x30, x6, x17
	adds	x10, x10, x30
	cset	x11, cs
	umulh	x30, x4, x27
	adds	x10, x10, x30
	adc	x11, x11, xzr
	umulh	x30, x5, x17
	adds	x10, x10, x30
	adc	x11, x11, xzr
	umulh	x30, x6, x16
	adds	x12, x10, x30
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x30, x3, x16
	adds	x10, x10, x30
	adc	x11, x11, xzr
	mul	x30, x4, x7
	adds	x10, x10, x30
	adc	x11, x11, xzr
	umulh	x30, x3, x7
	adds	x10, x10, x30
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x30, x5, x27
	adds	x12, x12, x30
	cset	x13, cs
	umulh	x30, x6, x17
	adds	x14, x12, x30
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x30, x3, x17
	adds	x12, x12, x30
	adc	x13, x13, xzr
	mul	x30, x4, x16
	adds	x12, x12, x30
	adc	x13, x13, xzr
	mul	x30, x5, x7
	adds	x12, x12, x30
	adc	x13, x13, xzr
	umulh	x30, x3, x16
	adds	x12, x12, x30
	adc	x13, x13, xzr
	umulh	x30, x4, x7
	adds	x12, x12, x30
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x30, x3, x27
	adds	x14, x14, x30
	adc	x15, x15, xzr	
	mul	x30, x4, x17
	adds	x14, x14, x30
	adc	x15, x15, xzr
	mul	x30, x5, x16
	adds	x14, x14, x30
	adc	x15, x15, xzr
	mul	x30, x6, x7
	adds	x14, x14, x30
	adc	x15, x15, xzr
	umulh	x30, x3, x17
	adds	x14, x14, x30
	adc	x15, x15, xzr
	umulh	x30, x4, x16
	adds	x14, x14, x30
	adc	x15, x15, xzr
	umulh	x30, x5, x7
	adds	x14, x14, x30
	adc	x15, x15, xzr
	
	adds	x10, x10, x9
	adcs	x12, x12, x11
	adcs	x14, x14, x13
	adc	x15, x15, xzr
	
	cmn	x14, x14
	adc	x15, x15, x15
	mul	x15, x15, x19

	bic	x14, x14, x21
	adds	x8, x8, x15
	adcs	x9, x10, xzr
	adcs	x10, x12, xzr
	adc	x11, x14, xzr
        
	stp	x8, x9, [x0, #32]
	stp	x10, x11, [x0, #48]
	
	// mul
	ldp	x3, x4, [x1, #32]
	ldp	x5, x6, [x1, #48]
	ldp	x7, x16, [x1, #96]
	ldp	x17, x27, [x1, #112]
	
	mul	x8, x4, x27
	mul	x30, x5, x17
	adds	x8, x8, x30
	cset	x9, cs
	mul	x30, x6, x16
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x3, x27
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x4, x17
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x5, x16
	adds	x8, x8, x30
	adc	x9, x9, xzr
	umulh	x30, x6, x7
	adds	x10, x8, x30
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x30, x3, x7
	adds	x8, x8, x30
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x30, x6, x17
	adds	x10, x10, x30
	cset	x11, cs
	umulh	x30, x4, x27
	adds	x10, x10, x30
	adc	x11, x11, xzr
	umulh	x30, x5, x17
	adds	x10, x10, x30
	adc	x11, x11, xzr
	umulh	x30, x6, x16
	adds	x12, x10, x30
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x30, x3, x16
	adds	x10, x10, x30
	adc	x11, x11, xzr
	mul	x30, x4, x7
	adds	x10, x10, x30
	adc	x11, x11, xzr
	umulh	x30, x3, x7
	adds	x10, x10, x30
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x30, x5, x27
	adds	x12, x12, x30
	cset	x13, cs
	umulh	x30, x6, x17
	adds	x14, x12, x30
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x30, x3, x17
	adds	x12, x12, x30
	adc	x13, x13, xzr
	mul	x30, x4, x16
	adds	x12, x12, x30
	adc	x13, x13, xzr
	mul	x30, x5, x7
	adds	x12, x12, x30
	adc	x13, x13, xzr
	umulh	x30, x3, x16
	adds	x12, x12, x30
	adc	x13, x13, xzr
	umulh	x30, x4, x7
	adds	x12, x12, x30
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x30, x3, x27
	adds	x14, x14, x30
	adc	x15, x15, xzr	
	mul	x30, x4, x17
	adds	x14, x14, x30
	adc	x15, x15, xzr
	mul	x30, x5, x16
	adds	x14, x14, x30
	adc	x15, x15, xzr
	mul	x30, x6, x7
	adds	x14, x14, x30
	adc	x15, x15, xzr
	umulh	x30, x3, x17
	adds	x14, x14, x30
	adc	x15, x15, xzr
	umulh	x30, x4, x16
	adds	x14, x14, x30
	adc	x15, x15, xzr
	umulh	x30, x5, x7
	adds	x14, x14, x30
	adc	x15, x15, xzr
	
	adds	x10, x10, x9
	adcs	x12, x12, x11
	adcs	x14, x14, x13
	adc	x15, x15, xzr
	
	cmn	x14, x14
	adc	x15, x15, x15
	mul	x15, x15, x19

	bic	x14, x14, x21
	adds	x8, x8, x15
	adcs	x9, x10, xzr
	adcs	x10, x12, xzr
	adc	x11, x14, xzr
	      
	stp	x8, x9, [x0, #64]
	stp	x10, x11, [x0, #80]
	
	ldp	x29, x30, [sp, #80]
	ldp	x27, x28, [sp, #64]	
	ldp	x25, x26, [sp, #48]	
	ldp	x23, x24, [sp, #32]
	ldp	x21, x22, [sp, #16]	
	ldp	x19, x20, [sp, #0]
	add	sp, sp, #96	
	
	ret
.section	.note.GNU-stack,"",@progbits
