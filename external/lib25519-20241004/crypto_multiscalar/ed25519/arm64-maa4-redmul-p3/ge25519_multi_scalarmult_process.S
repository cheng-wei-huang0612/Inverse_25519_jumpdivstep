#include "crypto_asm_hidden.h"
// linker define ge25519_multi_scalarmult_process

/* Assembly for multi scalar multiplication */

	.p2align 4
	ASM_HIDDEN _CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process)
	.globl _CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process)
	ASM_HIDDEN CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process)
	.globl CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process)
	
_CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process):
CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process):

	sub	sp, sp, #560
	stp	x19, x20, [sp, #0]
	stp	x21, x22, [sp, #16]
	stp	x23, x24, [sp, #32]
	stp	x25, x26, [sp, #48]
	stp	x27, x28, [sp, #64]
	stp	x29, x30, [sp, #80]
	
	mov	x18, #38
	lsr	x19, x18, #1
	mov	x21, #0x8000000000000000
	movz	x22, #0xED00
	movk	x22, #0xFFFF, lsl 16
	movk	x22, #0xFFFF, lsl 32
	movk	x22, #0xFFFF, lsl 48	
	mov	x23, #-1	
	mov	x24, #0x7F
	
	mov	x27, #1
	stp	xzr, xzr, [sp, #152]
	stp	xzr, xzr, [sp, #168]
	stp	x27, xzr, [sp, #192]
	stp	xzr, xzr, [sp, #208]
	stp	x27, xzr, [sp, #232]
	stp	xzr, xzr, [sp, #248]
	stp	xzr, xzr, [sp, #264]
	stp	xzr, xzr, [sp, #280]
	
	str	x0, [sp, #96]
	str	x1, [sp, #104]
	str	x2, [sp, #112]
	str	x3, [sp, #120]

	mov	x25, xzr
	
	mov	x26, #128 
	mul	x26, x26, x4

	mov	x30, #255
	
	add	x29, x1, x30
		
.L1:
	cmp	x25, xzr
	beq	.L2
	
	/* dbl p1p1 */
	
	// square
	ldp	x3, x4, [sp, #232]
	ldp	x5, x6, [sp, #248]
			
	mul	x8, x4, x6
	adds	x8, x8, x8
	cset	x9, cs
	mul	x1, x5, x5
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x6
	adds	x8, x8, x1
	adc	x9, x9, xzr
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x5
	adds	x8, x8, x1
	adc	x9, x9, xzr
	adds	x10, x8, x1
	adc	x9, x9, xzr
	
	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10
	
	mul	x1, x3, x3
	adds	x8, x8, x1
	adc	x9, x9, xzr	

	mul	x10, x5, x6
	adds	x10, x10, x10
	cset	x11, cs
	umulh	x1, x5, x5
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x4, x6
	adds	x10, x10, x1
	adc	x11, x11, xzr
	adds	x12, x10, x1
	adc	x11, x11, xzr
	
	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12
	
	mul	x1, x3, x4
	adds	x10, x10, x1
	adc	x11, x11, xzr
	adds	x10, x10, x1
	adc	x11, x11, xzr	
	umulh	x1, x3, x3
	adds	x10, x10, x1
	adcs	x11, x11, xzr
	
	mul	x12, x6, x6
	cset	x13, cs
	umulh	x1, x5, x6
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x14, x12, x1
	adc	x13, x13, xzr	
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x5
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x12, x12, x1
	adc	x13, x13, xzr	
	mul	x1, x4, x4
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x4
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x12, x12, x1
	adc	x13, x13, xzr

	umulh	x15, x6, x6
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x6
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x4, x5
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x5
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x4
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x7, x15, xzr

	// double
        adds	x8, x8, x8
        adcs	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adc	x7, x7, x7        
	
	add	x28, sp, #504
	stp	x8, x9, [x28, #0]
	stp	x10, x11, [x28, #16]
	str	x7, [x28, #32]
	
	// square
	ldp	x3, x4, [sp, #192]
	ldp	x5, x6, [sp, #208]	
	
	mul	x8, x4, x6
	adds	x8, x8, x8
	cset	x9, cs
	mul	x1, x5, x5
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x6
	adds	x8, x8, x1
	adc	x9, x9, xzr
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x5
	adds	x8, x8, x1
	adc	x9, x9, xzr
	adds	x10, x8, x1
	adc	x9, x9, xzr
	
	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10
	
	mul	x1, x3, x3
	adds	x8, x8, x1
	adc	x9, x9, xzr	

	mul	x10, x5, x6
	adds	x10, x10, x10
	cset	x11, cs
	umulh	x1, x5, x5
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x4, x6
	adds	x10, x10, x1
	adc	x11, x11, xzr
	adds	x12, x10, x1
	adc	x11, x11, xzr
	
	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12
	
	mul	x1, x3, x4
	adds	x10, x10, x1
	adc	x11, x11, xzr
	adds	x10, x10, x1
	adc	x11, x11, xzr	
	umulh	x1, x3, x3
	adds	x10, x10, x1
	adcs	x11, x11, xzr
	
	mul	x12, x6, x6
	cset	x13, cs
	umulh	x1, x5, x6
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x14, x12, x1
	adc	x13, x13, xzr	
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x5
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x12, x12, x1
	adc	x13, x13, xzr	
	mul	x1, x4, x4
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x4
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x12, x12, x1
	adc	x13, x13, xzr

	umulh	x15, x6, x6
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x6
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x4, x5
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x5
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x4
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x7, x15, xzr
	
	stp	x8, x9, [sp, #464]
	stp	x10, x11, [sp, #480]
	str	x7, [sp, #496]
	
 	// square
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]	
	
	mul	x8, x4, x6
	adds	x8, x8, x8
	cset	x9, cs
	mul	x1, x5, x5
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x6
	adds	x8, x8, x1
	adc	x9, x9, xzr
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x5
	adds	x8, x8, x1
	adc	x9, x9, xzr
	adds	x10, x8, x1
	adc	x9, x9, xzr
	
	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10
	
	mul	x1, x3, x3
	adds	x8, x8, x1
	adc	x9, x9, xzr	

	mul	x10, x5, x6
	adds	x10, x10, x10
	cset	x11, cs
	umulh	x1, x5, x5
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x4, x6
	adds	x10, x10, x1
	adc	x11, x11, xzr
	adds	x12, x10, x1
	adc	x11, x11, xzr
	
	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12
	
	mul	x1, x3, x4
	adds	x10, x10, x1
	adc	x11, x11, xzr
	adds	x10, x10, x1
	adc	x11, x11, xzr	
	umulh	x1, x3, x3
	adds	x10, x10, x1
	adcs	x11, x11, xzr
	
	mul	x12, x6, x6
	cset	x13, cs
	umulh	x1, x5, x6
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x14, x12, x1
	adc	x13, x13, xzr	
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x5
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x12, x12, x1
	adc	x13, x13, xzr	
	mul	x1, x4, x4
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x4
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x12, x12, x1
	adc	x13, x13, xzr

	umulh	x15, x6, x6
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x6
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x4, x5
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x5
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x4
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x12, x15, xzr
	
	// neg	    
        subs	x3, x22, x8
        sbcs	x4, x23, x9
        sbcs	x5, x23, x10
        sbcs	x6, x23, x11
        sbc	x7, x24, x12
        
	// add	
	ldp	x13, x14, [sp, #464]
	ldp	x15, x16, [sp, #480]
	ldr	x17, [sp, #496]
	
        adds	x8, x3, x13
        adcs	x9, x4, x14
        adcs	x10, x5, x15
        adcs	x11, x6, x16
        adc	x12, x7, x17

	// sub	
	add	x28, sp, #504	
	ldp	x13, x14, [x28, #0]
	ldp	x15, x16, [x28, #16]
	ldr	x17, [x28, #32]	
	
        subs	x13, x8, x13
        sbcs	x14, x9, x14
        sbcs	x15, x10, x15
        sbcs	x16, x11, x16
        sbc	x17, x12, x17
        
	cmn	x16, x16
	adc	x17, x17, x17
	mul	x17, x17, x19        

	bic	x16, x16, x21
	adds	x13, x13, x17
	adcs	x14, x14, xzr
	adcs	x15, x15, xzr
	adc	x16, x16, xzr        
 
	stp	x13, x14, [sp, #392]
	stp	x15, x16, [sp, #408]

	// reduce	           
	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr        
        
	stp	x8, x9, [sp, #328]
	stp	x10, x11, [sp, #344]
        
	// sub	
	ldp	x13, x14, [sp, #464]
	ldp	x15, x16, [sp, #480]
	ldr	x17, [sp, #496]
       	
        subs	x3, x3, x13
        sbcs	x4, x4, x14
        sbcs	x5, x5, x15
        sbcs	x6, x6, x16
        sbc	x7, x7, x17
        
	cmn	x6, x6
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x6, x6, x21
	adds	x3, x3, x7
	adcs	x4, x4, xzr
	adcs	x5, x5, xzr
	adc	x6, x6, xzr        
        
	stp	x3, x4, [sp, #360]
	stp	x5, x6, [sp, #376]	
	
	// add
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]	
	ldp	x13, x14, [sp, #192]
	ldp	x15, x16, [sp, #208]
	    
        adds	x3, x13, x3
        adcs	x4, x14, x4
        adcs	x5, x15, x5
        adcs	x6, x16, x6
        
        csel	x28, x18, xzr, cs
        adds	x3, x3, x28
        adcs	x4, x4, xzr
        adcs	x5, x5, xzr
        adcs	x6, x6, xzr
        
        csel	x28, x18, xzr, cs
        add	x3, x3, x28
        
	// square
	mul	x8, x4, x6
	adds	x8, x8, x8
	cset	x9, cs
	mul	x1, x5, x5
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x6
	adds	x8, x8, x1
	adc	x9, x9, xzr
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x5
	adds	x8, x8, x1
	adc	x9, x9, xzr
	adds	x10, x8, x1
	adc	x9, x9, xzr
	
	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10
	
	mul	x1, x3, x3
	adds	x8, x8, x1
	adc	x9, x9, xzr	

	mul	x10, x5, x6
	adds	x10, x10, x10
	cset	x11, cs
	umulh	x1, x5, x5
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x4, x6
	adds	x10, x10, x1
	adc	x11, x11, xzr
	adds	x12, x10, x1
	adc	x11, x11, xzr
	
	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12
	
	mul	x1, x3, x4
	adds	x10, x10, x1
	adc	x11, x11, xzr
	adds	x10, x10, x1
	adc	x11, x11, xzr	
	umulh	x1, x3, x3
	adds	x10, x10, x1
	adcs	x11, x11, xzr
	
	mul	x12, x6, x6
	cset	x13, cs
	umulh	x1, x5, x6
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x14, x12, x1
	adc	x13, x13, xzr	
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x5
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x12, x12, x1
	adc	x13, x13, xzr	
	mul	x1, x4, x4
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x4
	adds	x12, x12, x1
	adc	x13, x13, xzr
	adds	x12, x12, x1
	adc	x13, x13, xzr

	umulh	x15, x6, x6
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x6
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x4, x5
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x5
	adds	x14, x14, x1
	adc	x15, x15, xzr
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x4
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x12, x15, xzr
        
        // add
	ldp	x13, x14, [sp, #360]
	ldp	x15, x16, [sp, #376]
	
        adds	x8, x8, x13
        adcs	x9, x9, x14
        adcs	x10, x10, x15
        adcs	x11, x11, x16
        adc	x12, x12, xzr
	
	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19       

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr		
	
	stp	x8, x9, [sp, #296]
	stp	x10, x11, [sp, #312]
	
	/* p1p1 to p3 */
	
	// mul
	ldp	x3, x4, [sp, #296]
	ldp	x5, x6, [sp, #312]
	ldp	x7, x16, [sp, #392]
	ldp	x17, x27, [sp, #408]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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

	stp	x8, x9, [sp, #152]
	stp	x10, x11, [sp, #168]
	       
	// mul
	ldp	x3, x4, [sp, #328]
	ldp	x5, x6, [sp, #344]
	ldp	x7, x16, [sp, #360]	
	ldp	x17, x27, [sp, #376]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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

	stp	x8, x9, [sp, #192]
	stp	x10, x11, [sp, #208]
	
	// mul
	ldp	x3, x4, [sp, #328]
	ldp	x5, x6, [sp, #344]
	ldp	x7, x16, [sp, #392]
	ldp	x17, x27, [sp, #408]	
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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

	stp	x8, x9, [sp, #232]
	stp	x10, x11, [sp, #248]	
		
	// mul
	ldp	x3, x4, [sp, #296]
	ldp	x5, x6, [sp, #312]
	ldp	x7, x16, [sp, #360]	
	ldp	x17, x27, [sp, #376]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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

	stp	x8, x9, [sp, #264]
	stp	x10, x11, [sp, #280]
	
.L2:		
	str	xzr, [sp, #128]
	mov	x1, x29
	str	x1, [sp, #136]
	
.L3:	
	ldrsb	w14, [x1, #0]
	
	cmp	w14, wzr
	bne	.L4
	
	add	x1, x1, #256
	str	x1, [sp, #136]
	ldr	x3, [sp, #128]
	add	x3, x3, #1
	str	x3, [sp, #128]
	ldr	x4, [sp, #120]	
	cmp	x3, x4
	blt	.L3
	
	sub	x29, x29, #1
	sub	x30, x30, #1
	cmp	x30, xzr
	bge	.L1	
	
	b	.L8
		
.L4:	
	mov	x25, #1
	strb	w14, [sp, #144]
	
	ldr	x0, [sp, #112]
	ldr	x9, [sp, #128]
		
	mul	x8, x26, x9
	add	x0, x0, x8
	
	ldrsb	w14, [sp, #144]
	cmp	w14, wzr
	blt	.L5	
		
	lsr	w14, w14, #1
	mov	x9, #128
	mul	x14, x14, x9
	add	x0, x0, x14
	
	/* add p1p1 */

	// sub	
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]	
	ldp	x11, x12, [sp, #192]
	ldp	x13, x14, [sp, #208]
	
        subs	x7, x11, x3
        sbcs	x8, x12, x4
        sbcs	x9, x13, x5
        sbcs	x10, x14, x6
        
        csel	x27, xzr, x18, cs
        subs	x7, x7, x27
        sbcs	x8, x8, xzr
        sbcs	x9, x9, xzr
        sbcs	x10, x10, xzr
        
        csel	x27, xzr, x18, cs
        sub	x7, x7, x27		
	
	stp	x7, x8, [sp, #296]
	stp	x9, x10, [sp, #312]
	
	// add
        adds	x3, x3, x11
        adcs	x4, x4, x12
        adcs	x5, x5, x13
        adcs	x6, x6, x14
        
        csel	x27, x18, xzr, cs
        adds	x3, x3, x27
        adcs	x4, x4, xzr
        adcs	x5, x5, xzr
        adcs	x6, x6, xzr
        
        csel	x27, x18, xzr, cs
        add	x3, x3, x27		

	stp	x3, x4, [sp, #336]
	stp	x5, x6, [sp, #352]
	
	// add
	ldp	x3, x4, [x0, #0]
	ldp	x5, x6, [x0, #16]	
	ldp	x7, x8, [x0, #32]
	ldp	x9, x10, [x0, #48]
		
        adds	x13, x7, x3
        adcs	x14, x8, x4
        adcs	x15, x9, x5
        adcs	x16, x10, x6
        
        csel	x27, x18, xzr, cs
        adds	x13, x13, x27
        adcs	x14, x14, xzr
        adcs	x15, x15, xzr
        adcs	x16, x16, xzr
        
        csel	x27, x18, xzr, cs
        add	x13, x13, x27 	

	stp	x13, x14, [sp, #400]
	stp	x15, x16, [sp, #416]
	
	// sub	
        subs	x3, x7, x3
        sbcs	x4, x8, x4
        sbcs	x5, x9, x5
        sbcs	x6, x10, x6
        
        csel	x27, xzr, x18, cs
        subs	x3, x3, x27
        sbcs	x4, x4, xzr
        sbcs	x5, x5, xzr
        sbcs	x6, x6, xzr
        
        csel	x27, xzr, x18, cs
        sub	x3, x3, x27
	
	// mul
	ldp	x7, x16, [sp, #296]
	ldp	x17, x27, [sp, #312]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x7, x15, xzr      

	stp	x8, x9, [sp, #296]
	stp	x10, x11, [sp, #312]
	str	x7, [sp, #328]	
        
	// mul
	ldp	x3, x4, [sp, #336]
	ldp	x5, x6, [sp, #352]	
	ldp	x7, x16, [sp, #400]
	ldp	x17, x27, [sp, #416]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x12, x15, xzr       
        
	// add
	ldp	x13, x14, [sp, #296]
	ldp	x15, x16, [sp, #312]	
	ldr	x17, [sp, #328]
		
        adds	x3, x8, x13
        adcs	x4, x9, x14
        adcs	x5, x10, x15
        adcs	x6, x11, x16
        adc	x7, x12, x17

	cmn	x6, x6
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x6, x6, x21
	adds	x3, x3, x7
	adcs	x4, x4, xzr
	adcs	x5, x5, xzr
	adc	x6, x6, xzr		
	
	stp	x3, x4, [sp, #400]
	stp	x5, x6, [sp, #416]
        
	// sub
        adds	x8, x8, x22
        adcs	x9, x9, x23
        adcs	x10, x10, x23
        adcs	x11, x11, x23
        adc	x12, x12, x24
        
        subs	x8, x8, x13
        sbcs	x9, x9, x14
        sbcs	x10, x10, x15
        sbcs	x11, x11, x16
        sbc	x12, x12, x17        

	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr		
	
	stp	x8, x9, [sp, #336]
	stp	x10, x11, [sp, #352]      
        
	// mul
	ldp	x3, x4, [x0, #96]
	ldp	x5, x6, [x0, #112]
	ldp	x7, x16, [sp, #264]	
	ldp	x17, x27, [sp, #280]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x10, x10, x9
	adcs	x12, x12, x11
	adcs	x14, x14, x13
	adc	x15, x15, xzr
	
	cmn	x14, x14
	adc	x15, x15, x15
	mul	x15, x15, x19

	bic	x14, x14, x21
	adds	x3, x8, x15
	adcs	x4, x10, xzr
	adcs	x5, x12, xzr
	adc	x6, x14, xzr              

	// mul		
	movz	x7, #0xF146
	movk	x7, #0x26B2, lsl 16
	movk	x7, #0x9B94, lsl 32
	movk	x7, #0xEBD6, lsl 48
	
	movz	x16, #0xB156
	movk	x16, #0x8283, lsl 16
	movk	x16, #0x149A, lsl 32
	movk	x16, #0x0E0, lsl 48
	
	movz	x17, #0xD130
	movk	x17, #0xEEF3, lsl 16
	movk	x17, #0x80F2, lsl 32
	movk	x17, #0x198E, lsl 48
	
	movz	x27, #0xFCE7
	movk	x27, #0x56DF, lsl 16
	movk	x27, #0xD9DC, lsl 32
	movk	x27, #0xA406, lsl 48

	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x7, x15, xzr

	stp	x8, x9, [sp, #296]
	stp	x10, x11, [sp, #312]
	str	x7, [sp, #328]
        
	// mul
	ldp	x3, x4, [x0, #64]
	ldp	x5, x6, [x0, #80]
	ldp	x7, x16, [sp, #232]	
	ldp	x17, x27, [sp, #248]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x12, x15, xzr

        // double
        adds	x8, x8, x8
        adcs	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adc	x12, x12, x12	        
	
	// add
	ldp	x13, x14, [sp, #296]
	ldp	x15, x16, [sp, #312]	
	ldr	x17, [sp, #328]
		
        adds	x3, x8, x13
        adcs	x4, x9, x14
        adcs	x5, x10, x15
        adcs	x6, x11, x16
        adc	x7, x12, x17

	cmn	x6, x6
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x6, x6, x21
	adds	x3, x3, x7
	adcs	x4, x4, xzr
	adcs	x5, x5, xzr
	adc	x6, x6, xzr		
	
	stp	x3, x4, [sp, #368]
	stp	x5, x6, [sp, #384] 	
        
	// sub
        adds	x8, x8, x22
        adcs	x9, x9, x23
        adcs	x10, x10, x23
        adcs	x11, x11, x23
        adc	x12, x12, x24
        
        subs	x8, x8, x13
        sbcs	x9, x9, x14
        sbcs	x10, x10, x15
        sbcs	x11, x11, x16
        sbc	x12, x12, x17        

	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr		
	
	stp	x8, x9, [sp, #432]
	stp	x10, x11, [sp, #448]
	
	/* p1p1 to p3 */
	
	// mul
	ldp	x3, x4, [sp, #336]
	ldp	x5, x6, [sp, #352]
	ldp	x7, x16, [sp, #432]
	ldp	x17, x27, [sp, #448]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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
        
	stp	x8, x9, [sp, #152]
	stp	x10, x11, [sp, #168]
	       
	// mul
	ldp	x3, x4, [sp, #368]
	ldp	x5, x6, [sp, #384]
	ldp	x7, x16, [sp, #400]	
	ldp	x17, x27, [sp, #416]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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

	stp	x8, x9, [sp, #192]
	stp	x10, x11, [sp, #208]
	
	// mul
	ldp	x3, x4, [sp, #368]
	ldp	x5, x6, [sp, #384]
	ldp	x7, x16, [sp, #432]
	ldp	x17, x27, [sp, #448]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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

	stp	x8, x9, [sp, #232]
	stp	x10, x11, [sp, #248]
		
	// mul
	ldp	x3, x4, [sp, #336]
	ldp	x5, x6, [sp, #352]
	ldp	x7, x16, [sp, #400]	
	ldp	x17, x27, [sp, #416]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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
	
	stp	x8, x9, [sp, #264]
	stp	x10, x11, [sp, #280]
	
	b	.L6
		
.L5:		
	mov	w15, wzr
	sub	w15, w15, w14
	lsr	w15, w15, #1
	mov	x9, #128
	mul	x15, x15, x9
	add	x0, x0, x15
	
	/* sub p1p1 */
               
	// neg	
	ldp	x7, x8, [x0, #0]
	ldp	x9, x10, [x0, #16]
	    
        subs	x7, xzr, x7
        sbcs	x8, xzr, x8
        sbcs	x9, xzr, x9
        sbcs	x10, xzr, x10
        
        csel	x28, xzr, x18, cs
        subs	x7, x7, x28
        sbcs	x8, x8, xzr
        sbcs	x9, x9, xzr
        sbcs	x10, x10, xzr
        
        csel	x28, xzr, x18, cs
        sub	x7, x7, x28
	
	stp	x7, x8, [sp, #464]
	stp	x9, x10, [sp, #480]
	
	// neg
	ldp	x7, x8, [x0, #96]
	ldp	x9, x10, [x0, #112]
	    
        subs	x7, xzr, x7
        sbcs	x8, xzr, x8
        sbcs	x9, xzr, x9
        sbcs	x10, xzr, x10
        
        csel	x28, xzr, x18, cs
        subs	x7, x7, x28
        sbcs	x8, x8, xzr
        sbcs	x9, x9, xzr
        sbcs	x10, x10, xzr
        
        csel	x28, xzr, x18, cs
        sub	x7, x7, x28
	
	add	x28, sp, 496
	stp	x7, x8, [x28, #0]
	stp	x9, x10, [x28, #16]	

	// sub	
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]	
	ldp	x11, x12, [sp, #192]
	ldp	x13, x14, [sp, #208]
	
        subs	x7, x11, x3
        sbcs	x8, x12, x4
        sbcs	x9, x13, x5
        sbcs	x10, x14, x6
        
        csel	x27, xzr, x18, cs
        subs	x7, x7, x27
        sbcs	x8, x8, xzr
        sbcs	x9, x9, xzr
        sbcs	x10, x10, xzr
        
        csel	x27, xzr, x18, cs
        sub	x7, x7, x27		
	
	stp	x7, x8, [sp, #296]
	stp	x9, x10, [sp, #312]
	
	// add
        adds	x3, x3, x11
        adcs	x4, x4, x12
        adcs	x5, x5, x13
        adcs	x6, x6, x14
        
        csel	x27, x18, xzr, cs
        adds	x3, x3, x27
        adcs	x4, x4, xzr
        adcs	x5, x5, xzr
        adcs	x6, x6, xzr
        
        csel	x27, x18, xzr, cs
        add	x3, x3, x27		

	stp	x3, x4, [sp, #336]
	stp	x5, x6, [sp, #352]
	
	// add
	ldp	x3, x4, [sp, #464]
	ldp	x5, x6, [sp, #480]	
	ldp	x7, x8, [x0, #32]
	ldp	x9, x10, [x0, #48]
		
        adds	x13, x7, x3
        adcs	x14, x8, x4
        adcs	x15, x9, x5
        adcs	x16, x10, x6
        
        csel	x27, x18, xzr, cs
        adds	x13, x13, x27
        adcs	x14, x14, xzr
        adcs	x15, x15, xzr
        adcs	x16, x16, xzr
        
        csel	x27, x18, xzr, cs
        add	x13, x13, x27 	

	stp	x13, x14, [sp, #400]
	stp	x15, x16, [sp, #416]	
	
	// sub	
        subs	x3, x7, x3
        sbcs	x4, x8, x4
        sbcs	x5, x9, x5
        sbcs	x6, x10, x6
        
        csel	x27, xzr, x18, cs
        subs	x3, x3, x27
        sbcs	x4, x4, xzr
        sbcs	x5, x5, xzr
        sbcs	x6, x6, xzr
        
        csel	x27, xzr, x18, cs
        sub	x3, x3, x27
	
	// mul
	ldp	x7, x16, [sp, #296]
	ldp	x17, x27, [sp, #312]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x7, x15, xzr      

	stp	x8, x9, [sp, #296]
	stp	x10, x11, [sp, #312]
	str	x7, [sp, #328]		
        
	// mul
	ldp	x3, x4, [sp, #336]
	ldp	x5, x6, [sp, #352]	
	ldp	x7, x16, [sp, #400]
	ldp	x17, x27, [sp, #416]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x12, x15, xzr  

	// add
	ldp	x13, x14, [sp, #296]
	ldp	x15, x16, [sp, #312]	
	ldr	x17, [sp, #328]
		
        adds	x3, x8, x13
        adcs	x4, x9, x14
        adcs	x5, x10, x15
        adcs	x6, x11, x16
        adc	x7, x12, x17

	cmn	x6, x6
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x6, x6, x21
	adds	x3, x3, x7
	adcs	x4, x4, xzr
	adcs	x5, x5, xzr
	adc	x6, x6, xzr		
	
	stp	x3, x4, [sp, #400]
	stp	x5, x6, [sp, #416]
        
	// sub
        adds	x8, x8, x22
        adcs	x9, x9, x23
        adcs	x10, x10, x23
        adcs	x11, x11, x23
        adc	x12, x12, x24
        
        subs	x8, x8, x13
        sbcs	x9, x9, x14
        sbcs	x10, x10, x15
        sbcs	x11, x11, x16
        sbc	x12, x12, x17        

	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr		
	
	stp	x8, x9, [sp, #336]
	stp	x10, x11, [sp, #352]       
        
	// mul
	ldp	x7, x16, [sp, #264]	
	ldp	x17, x27, [sp, #280]	
	add	x28, sp, #496	
	ldp	x3, x4, [x28, #0]
	ldp	x5, x6, [x28, #16]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x10, x10, x9
	adcs	x12, x12, x11
	adcs	x14, x14, x13
	adc	x15, x15, xzr
	
	cmn	x14, x14
	adc	x15, x15, x15
	mul	x15, x15, x19

	bic	x14, x14, x21
	adds	x3, x8, x15
	adcs	x4, x10, xzr
	adcs	x5, x12, xzr
	adc	x6, x14, xzr              
	
	// mul		
	movz	x7, #0xF146
	movk	x7, #0x26B2, lsl 16
	movk	x7, #0x9B94, lsl 32
	movk	x7, #0xEBD6, lsl 48
	
	movz	x16, #0xB156
	movk	x16, #0x8283, lsl 16
	movk	x16, #0x149A, lsl 32
	movk	x16, #0x0E0, lsl 48
	
	movz	x17, #0xD130
	movk	x17, #0xEEF3, lsl 16
	movk	x17, #0x80F2, lsl 32
	movk	x17, #0x198E, lsl 48
	
	movz	x27, #0xFCE7
	movk	x27, #0x56DF, lsl 16
	movk	x27, #0xD9DC, lsl 32
	movk	x27, #0xA406, lsl 48

	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x7, x15, xzr

	stp	x8, x9, [sp, #296]
	stp	x10, x11, [sp, #312]
	str	x7, [sp, #328]	
        
	// mul
	ldp	x3, x4, [x0, #64]
	ldp	x5, x6, [x0, #80]
	ldp	x7, x16, [sp, #232]	
	ldp	x17, x27, [sp, #248]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x12, x15, xzr
        
        // double
        adds	x8, x8, x8
        adcs	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adc	x12, x12, x12       
	
	// add
	ldp	x13, x14, [sp, #296]
	ldp	x15, x16, [sp, #312]	
	ldr	x17, [sp, #328]
		
        adds	x3, x8, x13
        adcs	x4, x9, x14
        adcs	x5, x10, x15
        adcs	x6, x11, x16
        adc	x7, x12, x17

	cmn	x6, x6
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x6, x6, x21
	adds	x3, x3, x7
	adcs	x4, x4, xzr
	adcs	x5, x5, xzr
	adc	x6, x6, xzr		
	
	stp	x3, x4, [sp, #368]
	stp	x5, x6, [sp, #384]		
        
	// sub
        adds	x8, x8, x22
        adcs	x9, x9, x23
        adcs	x10, x10, x23
        adcs	x11, x11, x23
        adc	x12, x12, x24
        
        subs	x8, x8, x13
        sbcs	x9, x9, x14
        sbcs	x10, x10, x15
        sbcs	x11, x11, x16
        sbc	x12, x12, x17        

	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr		
	
	stp	x8, x9, [sp, #432]
	stp	x10, x11, [sp, #448]
	
	/* p1p1 to p3 */
	
	// mul
	ldp	x3, x4, [sp, #336]
	ldp	x5, x6, [sp, #352]
	ldp	x7, x16, [sp, #432]
	ldp	x17, x27, [sp, #448]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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
        
	stp	x8, x9, [sp, #152]
	stp	x10, x11, [sp, #168]
	       
	// mul
	ldp	x3, x4, [sp, #368]
	ldp	x5, x6, [sp, #384]
	ldp	x7, x16, [sp, #400]	
	ldp	x17, x27, [sp, #416]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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

	stp	x8, x9, [sp, #192]
	stp	x10, x11, [sp, #208]
	
	// mul
	ldp	x3, x4, [sp, #368]
	ldp	x5, x6, [sp, #384]
	ldp	x7, x16, [sp, #432]
	ldp	x17, x27, [sp, #448]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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

	stp	x8, x9, [sp, #232]
	stp	x10, x11, [sp, #248]
		
	// mul
	ldp	x3, x4, [sp, #336]
	ldp	x5, x6, [sp, #352]
	ldp	x7, x16, [sp, #400]	
	ldp	x17, x27, [sp, #416]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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
	
	stp	x8, x9, [sp, #264]
	stp	x10, x11, [sp, #280]
	
.L6:
	ldr	x1, [sp, #136]
	add	x1, x1, #256
	str	x1, [sp, #136]
	ldr	x3, [sp, #128]
	add	x3, x3, #1
	str	x3, [sp, #128]
	ldr	x4, [sp, #120]
	cmp	x3, x4
	blt	.L3

.L7:
	sub	x29, x29, #1
	sub	x30, x30, #1
	cmp	x30, xzr
	bge	.L1
	
.L8:	
	ldr	x0, [sp, #96]

	/* add p1p1 */

	// sub	
	ldp	x3, x4, [x0, #0]
	ldp	x5, x6, [x0, #16]	
	ldp	x11, x12, [x0, #32]
	ldp	x13, x14, [x0, #48]
	
        subs	x7, x11, x3
        sbcs	x8, x12, x4
        sbcs	x9, x13, x5
        sbcs	x10, x14, x6
        
        csel	x27, xzr, x18, cs
        subs	x7, x7, x27
        sbcs	x8, x8, xzr
        sbcs	x9, x9, xzr
        sbcs	x10, x10, xzr
        
        csel	x27, xzr, x18, cs
        sub	x7, x7, x27		
	
	stp	x7, x8, [sp, #296]
	stp	x9, x10, [sp, #312]
	
	// add
        adds	x3, x3, x11
        adcs	x4, x4, x12
        adcs	x5, x5, x13
        adcs	x6, x6, x14
        
        csel	x27, x18, xzr, cs
        adds	x3, x3, x27
        adcs	x4, x4, xzr
        adcs	x5, x5, xzr
        adcs	x6, x6, xzr
        
        csel	x27, x18, xzr, cs
        add	x3, x3, x27		

	stp	x3, x4, [sp, #336]
	stp	x5, x6, [sp, #352]
	
	// add
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]	
	ldp	x7, x8, [sp, #192]
	ldp	x9, x10, [sp, #208]
		
        adds	x13, x7, x3
        adcs	x14, x8, x4
        adcs	x15, x9, x5
        adcs	x16, x10, x6
        
        csel	x27, x18, xzr, cs
        adds	x13, x13, x27
        adcs	x14, x14, xzr
        adcs	x15, x15, xzr
        adcs	x16, x16, xzr
        
        csel	x27, x18, xzr, cs
        add	x13, x13, x27 	

	stp	x13, x14, [sp, #400]
	stp	x15, x16, [sp, #416]	
	
	// sub		
        subs	x3, x7, x3
        sbcs	x4, x8, x4
        sbcs	x5, x9, x5
        sbcs	x6, x10, x6
        
        csel	x27, xzr, x18, cs
        subs	x3, x3, x27
        sbcs	x4, x4, xzr
        sbcs	x5, x5, xzr
        sbcs	x6, x6, xzr
        
        csel	x27, xzr, x18, cs
        sub	x3, x3, x27
	
	// mul
	ldp	x7, x16, [sp, #296]
	ldp	x17, x27, [sp, #312]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x7, x15, xzr      

	stp	x8, x9, [sp, #296]
	stp	x10, x11, [sp, #312]
	str	x7, [sp, #328]	
        
	// mul
	ldp	x3, x4, [sp, #336]
	ldp	x5, x6, [sp, #352]	
	ldp	x7, x16, [sp, #400]
	ldp	x17, x27, [sp, #416]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x12, x15, xzr       
        
	// add
	ldp	x13, x14, [sp, #296]
	ldp	x15, x16, [sp, #312]	
	ldr	x17, [sp, #328]
		
        adds	x3, x8, x13
        adcs	x4, x9, x14
        adcs	x5, x10, x15
        adcs	x6, x11, x16
        adc	x7, x12, x17

	cmn	x6, x6
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x6, x6, x21
	adds	x3, x3, x7
	adcs	x4, x4, xzr
	adcs	x5, x5, xzr
	adc	x6, x6, xzr		
	
	stp	x3, x4, [sp, #400]
	stp	x5, x6, [sp, #416]
        
	// sub
        adds	x8, x8, x22
        adcs	x9, x9, x23
        adcs	x10, x10, x23
        adcs	x11, x11, x23
        adc	x12, x12, x24
        
        subs	x8, x8, x13
        sbcs	x9, x9, x14
        sbcs	x10, x10, x15
        sbcs	x11, x11, x16
        sbc	x12, x12, x17        

	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr		
	
	stp	x8, x9, [sp, #336]
	stp	x10, x11, [sp, #352]      
        
	// mul
	ldp	x3, x4, [x0, #96]
	ldp	x5, x6, [x0, #112]
	ldp	x7, x16, [sp, #264]	
	ldp	x17, x27, [sp, #280]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x10, x10, x9
	adcs	x12, x12, x11
	adcs	x14, x14, x13
	adc	x15, x15, xzr
	
	cmn	x14, x14
	adc	x15, x15, x15
	mul	x15, x15, x19

	bic	x14, x14, x21
	adds	x3, x8, x15
	adcs	x4, x10, xzr
	adcs	x5, x12, xzr
	adc	x6, x14, xzr              

	// mul	
	movz	x7, #0xF146
	movk	x7, #0x26B2, lsl 16
	movk	x7, #0x9B94, lsl 32
	movk	x7, #0xEBD6, lsl 48
	
	movz	x16, #0xB156
	movk	x16, #0x8283, lsl 16
	movk	x16, #0x149A, lsl 32
	movk	x16, #0x0E0, lsl 48
	
	movz	x17, #0xD130
	movk	x17, #0xEEF3, lsl 16
	movk	x17, #0x80F2, lsl 32
	movk	x17, #0x198E, lsl 48
	
	movz	x27, #0xFCE7
	movk	x27, #0x56DF, lsl 16
	movk	x27, #0xD9DC, lsl 32
	movk	x27, #0xA406, lsl 48

	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x7, x15, xzr

	stp	x8, x9, [sp, #296]
	stp	x10, x11, [sp, #312]
	str	x7, [sp, #328]
        
	// mul
	ldp	x3, x4, [x0, #64]
	ldp	x5, x6, [x0, #80]
	ldp	x7, x16, [sp, #232]	
	ldp	x17, x27, [sp, #248]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	
	adds	x9, x10, x9
	adcs	x10, x12, x11
	adcs	x11, x14, x13
	adc	x12, x15, xzr

        // double
        adds	x8, x8, x8
        adcs	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adc	x12, x12, x12	        
	
	// add
	ldp	x13, x14, [sp, #296]
	ldp	x15, x16, [sp, #312]	
	ldr	x17, [sp, #328]
		
        adds	x3, x8, x13
        adcs	x4, x9, x14
        adcs	x5, x10, x15
        adcs	x6, x11, x16
        adc	x7, x12, x17

	cmn	x6, x6
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x6, x6, x21
	adds	x3, x3, x7
	adcs	x4, x4, xzr
	adcs	x5, x5, xzr
	adc	x6, x6, xzr		
	
	stp	x3, x4, [sp, #368]
	stp	x5, x6, [sp, #384] 	
        
	// sub
        adds	x8, x8, x22
        adcs	x9, x9, x23
        adcs	x10, x10, x23
        adcs	x11, x11, x23
        adc	x12, x12, x24
        
        subs	x8, x8, x13
        sbcs	x9, x9, x14
        sbcs	x10, x10, x15
        sbcs	x11, x11, x16
        sbc	x12, x12, x17        

	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr		
	
	stp	x8, x9, [sp, #432]
	stp	x10, x11, [sp, #448]
	
	/* p1p1 to p3 */
	
	// mul
	ldp	x3, x4, [sp, #336]
	ldp	x5, x6, [sp, #352]
	ldp	x7, x16, [sp, #432]
	ldp	x17, x27, [sp, #448]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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
	ldp	x3, x4, [sp, #368]
	ldp	x5, x6, [sp, #384]
	ldp	x7, x16, [sp, #400]	
	ldp	x17, x27, [sp, #416]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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
	ldp	x3, x4, [sp, #368]
	ldp	x5, x6, [sp, #384]
	ldp	x7, x16, [sp, #432]
	ldp	x17, x27, [sp, #448]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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
		
	// mul
	ldp	x3, x4, [sp, #336]
	ldp	x5, x6, [sp, #352]
	ldp	x7, x16, [sp, #400]	
	ldp	x17, x27, [sp, #416]
	
	mul	x8, x4, x27
	mul	x1, x5, x17
	adds	x8, x8, x1
	cset	x9, cs
	mul	x1, x6, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x3, x27
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x4, x17
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x5, x16
	adds	x8, x8, x1
	adc	x9, x9, xzr
	umulh	x1, x6, x7
	adds	x10, x8, x1
	adc	x9, x9, xzr

	mul	x8, x18, x10
	umulh	x10, x18, x10
	mul	x9, x18, x9
	add	x9, x9, x10

	mul	x1, x3, x7
	adds	x8, x8, x1
	adc	x9, x9, xzr
	
	mul	x10, x5, x27
	mul	x1, x6, x17
	adds	x10, x10, x1
	cset	x11, cs
	umulh	x1, x4, x27
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x5, x17
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x6, x16
	adds	x12, x10, x1
	adc	x11, x11, xzr

	mul	x10, x18, x12
	umulh	x12, x18, x12
	mul	x11, x18, x11
	add	x11, x11, x12

	mul	x1, x3, x16
	adds	x10, x10, x1
	adc	x11, x11, xzr
	mul	x1, x4, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr
	umulh	x1, x3, x7
	adds	x10, x10, x1
	adc	x11, x11, xzr

	mul	x12, x6, x27
	umulh	x1, x5, x27
	adds	x12, x12, x1
	cset	x13, cs
	umulh	x1, x6, x17
	adds	x14, x12, x1
	adc	x13, x13, xzr
	
	mul	x12, x18, x14
	umulh	x14, x18, x14
	mul	x13, x18, x13
	add	x13, x13, x14
	
	mul	x1, x3, x17
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x4, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	mul	x1, x5, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x3, x16
	adds	x12, x12, x1
	adc	x13, x13, xzr
	umulh	x1, x4, x7
	adds	x12, x12, x1
	adc	x13, x13, xzr
	
	umulh	x15, x6, x27
	
	mul	x14, x18, x15
	umulh	x15, x18, x15
	
	mul	x1, x3, x27
	adds	x14, x14, x1
	adc	x15, x15, xzr	
	mul	x1, x4, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x5, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	mul	x1, x6, x7
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x3, x17
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x4, x16
	adds	x14, x14, x1
	adc	x15, x15, xzr
	umulh	x1, x5, x7
	adds	x14, x14, x1
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
	
	stp	x8, x9, [x0, #96]
	stp	x10, x11, [x0, #112]
		
	ldp	x29, x30, [sp, #80]
	ldp	x27, x28, [sp, #64]	
	ldp	x25, x26, [sp, #48]	
	ldp	x23, x24, [sp, #32]
	ldp	x21, x22, [sp, #16]	
	ldp	x19, x20, [sp, #0]
	add	sp, sp, #560

	ret
.section	.note.GNU-stack,"",@progbits
