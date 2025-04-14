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

	sub	sp, sp, #640
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
	stp	x27, xzr, [sp, #184]
	stp	xzr, xzr, [sp, #200]
	stp	x27, xzr, [sp, #216]
	stp	xzr, xzr, [sp, #232]
	stp	x27, xzr, [sp, #248]
	stp	xzr, xzr, [sp, #264]
	
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
	
	/* p1p1 to p2 */
	
	// mul
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]
	ldp	x7, x16, [sp, #248]
	ldp	x17, x27, [sp, #264]

        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x8, x8, x7
	adcs	x9, x9, x4
	adcs	x10, x10, x5
	adc	x11, x11, xzr
        
	stp	x8, x9, [sp, #280]
	stp	x10, x11, [sp, #296]
	       
	// mul
	ldp	x3, x4, [sp, #184]
	ldp	x5, x6, [sp, #200]
	ldp	x7, x16, [sp, #216]
	ldp	x17, x27, [sp, #232]

        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x8, x8, x7
	adcs	x9, x9, x4
	adcs	x10, x10, x5
	adc	x11, x11, xzr
        
	stp	x8, x9, [sp, #312]
	stp	x10, x11, [sp, #328]
	
	// mul
	ldp	x3, x4, [sp, #184]
	ldp	x5, x6, [sp, #200]
	ldp	x7, x16, [sp, #248]
	ldp	x17, x27, [sp, #264]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x3, x8, x7
	adcs	x4, x9, x4
	adcs	x5, x10, x5
	adc	x6, x11, xzr
	
	/* dbl p1p1 */
	
	// square	
        mul	x9, x4, x3        
        umulh	x10, x4, x3
        mul	x1, x5, x3
        adds	x10, x10, x1        
        umulh	x11, x5, x3
        mul	x1, x6, x3
        adcs	x11, x11, x1              
        umulh	x12, x6, x3
        adc 	x12, x12, xzr

        mul	x27, x5, x4        
        umulh	x7, x5, x4
        mul	x1, x6, x4
        adds	x7, x7, x1               
        umulh	x1, x6, x4
        adc 	x1, x1, xzr        
        adds	x11, x11, x27
        adcs	x12, x12, x7
        
        mul	x27, x6, x5                     
        umulh	x14, x6, x5        
        adcs	x13, x1, x27
        adc 	x14, x14, xzr
        
        adds	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adcs	x12, x12, x12
        adcs	x13, x13, x13
        adcs	x14, x14, x14
        cset	x15, cs
        
        mul	x8, x3, x3
        umulh	x1, x3, x3
        adds	x9, x9, x1
        
        mul	x1, x4, x4
        adcs	x10, x10, x1
        umulh	x27, x4, x4        
        adcs	x11, x11, x27
        
        mul	x1, x5, x5
        adcs	x12, x12, x1
        umulh	x27, x5, x5        
        adcs	x13, x13, x27
        
        mul	x1, x6, x6
        adcs	x14, x14, x1
        umulh	x27, x6, x6        
        adc 	x15, x15, x27

        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr

	// double
        adds	x8, x8, x8
        adcs	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adc	x7, x7, x7        
	
	stp	x8, x9, [sp, #456]
	stp	x10, x11, [sp, #472]
	str	x7, [sp, #488]		
	
	// square
	ldp	x3, x4, [sp, #312]
	ldp	x5, x6, [sp, #328]	
	
        mul	x9, x4, x3        
        umulh	x10, x4, x3
        mul	x1, x5, x3
        adds	x10, x10, x1        
        umulh	x11, x5, x3
        mul	x1, x6, x3
        adcs	x11, x11, x1              
        umulh	x12, x6, x3
        adc 	x12, x12, xzr

        mul	x27, x5, x4        
        umulh	x7, x5, x4
        mul	x1, x6, x4
        adds	x7, x7, x1               
        umulh	x1, x6, x4
        adc 	x1, x1, xzr        
        adds	x11, x11, x27
        adcs	x12, x12, x7
        
        mul	x27, x6, x5                     
        umulh	x14, x6, x5        
        adcs	x13, x1, x27
        adc 	x14, x14, xzr
        
        adds	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adcs	x12, x12, x12
        adcs	x13, x13, x13
        adcs	x14, x14, x14
        cset	x15, cs
        
        mul	x8, x3, x3
        umulh	x1, x3, x3
        adds	x9, x9, x1
        
        mul	x1, x4, x4
        adcs	x10, x10, x1
        umulh	x27, x4, x4        
        adcs	x11, x11, x27
        
        mul	x1, x5, x5
        adcs	x12, x12, x1
        umulh	x27, x5, x5        
        adcs	x13, x13, x27
        
        mul	x1, x6, x6
        adcs	x14, x14, x1
        umulh	x27, x6, x6        
        adc 	x15, x15, x27

        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr
	
	stp	x8, x9, [sp, #416]
	stp	x10, x11, [sp, #432]
	str	x7, [sp, #448]
	
 	// square
	ldp	x3, x4, [sp, #280]
	ldp	x5, x6, [sp, #296]	
	
        mul	x9, x4, x3        
        umulh	x10, x4, x3
        mul	x1, x5, x3
        adds	x10, x10, x1        
        umulh	x11, x5, x3
        mul	x1, x6, x3
        adcs	x11, x11, x1              
        umulh	x12, x6, x3
        adc 	x12, x12, xzr

        mul	x27, x5, x4        
        umulh	x7, x5, x4
        mul	x1, x6, x4
        adds	x7, x7, x1               
        umulh	x1, x6, x4
        adc 	x1, x1, xzr        
        adds	x11, x11, x27
        adcs	x12, x12, x7
        
        mul	x27, x6, x5                     
        umulh	x14, x6, x5        
        adcs	x13, x1, x27
        adc 	x14, x14, xzr
        
        adds	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adcs	x12, x12, x12
        adcs	x13, x13, x13
        adcs	x14, x14, x14
        cset	x15, cs
        
        mul	x8, x3, x3
        umulh	x1, x3, x3
        adds	x9, x9, x1
        
        mul	x1, x4, x4
        adcs	x10, x10, x1
        umulh	x27, x4, x4        
        adcs	x11, x11, x27
        
        mul	x1, x5, x5
        adcs	x12, x12, x1
        umulh	x27, x5, x5        
        adcs	x13, x13, x27
        
        mul	x1, x6, x6
        adcs	x14, x14, x1
        umulh	x27, x6, x6        
        adc 	x15, x15, x27

        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x12, x15, x18
        adc 	x12, x12, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x12, x12, xzr

	// neg	    
        subs	x3, x22, x8
        sbcs	x4, x23, x9
        sbcs	x5, x23, x10
        sbcs	x6, x23, x11
        sbc	x7, x24, x12
        
	// add	
	ldp	x13, x14, [sp, #416]
	ldp	x15, x16, [sp, #432]
	ldr	x17, [sp, #448]
	
        adds	x8, x3, x13
        adcs	x9, x4, x14
        adcs	x10, x5, x15
        adcs	x11, x6, x16
        adc	x12, x7, x17
	
	ldp	x13, x14, [sp, #456]
	ldp	x15, x16, [sp, #472]
	ldr	x17, [sp, #488]	
		
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
 
	stp	x13, x14, [sp, #248]
	stp	x15, x16, [sp, #264]

	// reduce	           
	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr        
        
	stp	x8, x9, [sp, #184]
	stp	x10, x11, [sp, #200]
        
	// sub	
	ldp	x13, x14, [sp, #416]
	ldp	x15, x16, [sp, #432]
	ldr	x17, [sp, #448]
       	
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
        
	stp	x3, x4, [sp, #216]
	stp	x5, x6, [sp, #232]	
	
	// add
	ldp	x3, x4, [sp, #280]
	ldp	x5, x6, [sp, #296]	
	ldp	x13, x14, [sp, #312]
	ldp	x15, x16, [sp, #328]
	    
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
        mul	x9, x4, x3        
        umulh	x10, x4, x3
        mul	x1, x5, x3
        adds	x10, x10, x1        
        umulh	x11, x5, x3
        mul	x1, x6, x3
        adcs	x11, x11, x1              
        umulh	x12, x6, x3
        adc 	x12, x12, xzr

        mul	x27, x5, x4        
        umulh	x7, x5, x4
        mul	x1, x6, x4
        adds	x7, x7, x1               
        umulh	x1, x6, x4
        adc 	x1, x1, xzr        
        adds	x11, x11, x27
        adcs	x12, x12, x7
        
        mul	x27, x6, x5                     
        umulh	x14, x6, x5        
        adcs	x13, x1, x27
        adc 	x14, x14, xzr
        
        adds	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adcs	x12, x12, x12
        adcs	x13, x13, x13
        adcs	x14, x14, x14
        cset	x15, cs
        
        mul	x8, x3, x3
        umulh	x1, x3, x3
        adds	x9, x9, x1
        
        mul	x1, x4, x4
        adcs	x10, x10, x1
        umulh	x27, x4, x4        
        adcs	x11, x11, x27
        
        mul	x1, x5, x5
        adcs	x12, x12, x1
        umulh	x27, x5, x5        
        adcs	x13, x13, x27
        
        mul	x1, x6, x6
        adcs	x14, x14, x1
        umulh	x27, x6, x6        
        adc 	x15, x15, x27

        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x12, x15, x18
        adc 	x12, x12, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x12, x12, xzr
        
        // add
	ldp	x13, x14, [sp, #216]
	ldp	x15, x16, [sp, #232]
	
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
	
	stp	x8, x9, [sp, #152]
	stp	x10, x11, [sp, #168]
	
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
		
	/* p1p1 to p3 */
	
	// mul
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]
	ldp	x7, x16, [sp, #248]
	ldp	x17, x27, [sp, #264]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr

	stp	x8, x9, [sp, #280]
	stp	x10, x11, [sp, #296]
	str	x7, [sp, #312]
	       
	// mul
	ldp	x3, x4, [sp, #184]
	ldp	x5, x6, [sp, #200]
	ldp	x7, x16, [sp, #216]	
	ldp	x17, x27, [sp, #232]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr

	stp	x8, x9, [sp, #320]
	stp	x10, x11, [sp, #336]
	str	x7, [sp, #352]
	
	// mul
	ldp	x3, x4, [sp, #184]
	ldp	x5, x6, [sp, #200]
	ldp	x7, x16, [sp, #248]
	ldp	x17, x27, [sp, #264]	
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x8, x8, x7
	adcs	x9, x9, x4
	adcs	x10, x10, x5
	adc	x11, x11, xzr        

	stp	x8, x9, [sp, #360]
	stp	x10, x11, [sp, #376]	
		
	// mul
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]
	ldp	x7, x16, [sp, #216]	
	ldp	x17, x27, [sp, #232]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x8, x8, x7
	adcs	x9, x9, x4
	adcs	x10, x10, x5
	adc	x11, x11, xzr

	stp	x8, x9, [sp, #400]
	stp	x10, x11, [sp, #416]
	
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
	
	/* pnielsadd p1p1 */
	
	// add
	ldp	x3, x4, [sp, #320]
	ldp	x5, x6, [sp, #336]	
	ldr	x7, [sp, #352]
	ldp	x13, x14, [sp, #280]
	ldp	x15, x16, [sp, #296]	
	ldr	x17, [sp, #312]	
	
        adds	x8, x3, x13
        adcs	x9, x4, x14
        adcs	x10, x5, x15
        adcs	x11, x6, x16
        adc	x12, x7, x17
        
	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr

	stp	x8, x9, [sp, #480]
	stp	x10, x11, [sp, #496]	

	// sub	
        adds	x3, x3, x22
        adcs	x4, x4, x23
        adcs	x5, x5, x23
        adcs	x6, x6, x23
        adc	x7, x7, x24
        
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
	
	// mul
	ldp	x7, x16, [x0, #0]	
	ldp	x17, x27, [x0, #16]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr      

	stp	x8, x9, [sp, #440]
	stp	x10, x11, [sp, #456]
	str	x7, [sp, #472]	
        
	// mul
	ldp	x3, x4, [x0, #32]
	ldp	x5, x6, [x0, #48]	
	ldp	x7, x16, [sp, #480]
	ldp	x17, x27, [sp, #496]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x12, x15, x18
        adc 	x12, x12, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x12, x12, xzr       
        
	// add
	ldp	x13, x14, [sp, #440]
	ldp	x15, x16, [sp, #456]	
	ldr	x17, [sp, #472]
		
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
	
	stp	x3, x4, [sp, #216]
	stp	x5, x6, [sp, #232]
        
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
	
	stp	x8, x9, [sp, #152]
	stp	x10, x11, [sp, #168]      
        
	// mul
	ldp	x3, x4, [x0, #96]
	ldp	x5, x6, [x0, #112]
	ldp	x7, x16, [sp, #400]	
	ldp	x17, x27, [sp, #416]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr      

	stp	x8, x9, [sp, #440]
	stp	x10, x11, [sp, #456]
	str	x7, [sp, #472]		
        
	// mul
	ldp	x3, x4, [x0, #64]
	ldp	x5, x6, [x0, #80]
	ldp	x7, x16, [sp, #360]	
	ldp	x17, x27, [sp, #376]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x12, x15, x18
        adc 	x12, x12, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x12, x12, xzr

        // double
        adds	x8, x8, x8
        adcs	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adc	x12, x12, x12	        
	
	// add
	ldp	x13, x14, [sp, #440]
	ldp	x15, x16, [sp, #456]	
	ldr	x17, [sp, #472]
		
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
	
	stp	x3, x4, [sp, #184]
	stp	x5, x6, [sp, #200] 	
        
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
	
	stp	x8, x9, [sp, #248]
	stp	x10, x11, [sp, #264]
	
	b	.L6
		
.L5:		
	mov	w15, wzr
	sub	w15, w15, w14
	lsr	w15, w15, #1
	mov	x9, #128
	mul	x15, x15, x9
	add	x0, x0, x15
	
	/* pnielssub p1p1 */
               
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
	
	add	x28, sp, 512
	stp	x7, x8, [x28, #0]
	stp	x9, x10, [x28, #16]
	
	// add
	ldp	x3, x4, [sp, #320]
	ldp	x5, x6, [sp, #336]	
	ldr	x7, [sp, #352]
	ldp	x13, x14, [sp, #280]
	ldp	x15, x16, [sp, #296]	
	ldr	x17, [sp, #312]	
	
        adds	x8, x3, x13
        adcs	x9, x4, x14
        adcs	x10, x5, x15
        adcs	x11, x6, x16
        adc	x12, x7, x17
        
	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr

	stp	x8, x9, [sp, #480]
	stp	x10, x11, [sp, #496]	

	// sub	
        adds	x3, x3, x22
        adcs	x4, x4, x23
        adcs	x5, x5, x23
        adcs	x6, x6, x23
        adc	x7, x7, x24
        
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
	
	// mul
	ldp	x7, x16, [x0, #32]	
	ldp	x17, x27, [x0, #48]	
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr      

	stp	x8, x9, [sp, #440]
	stp	x10, x11, [sp, #456]
	str	x7, [sp, #472]		
        
	// mul
	ldp	x3, x4, [x0, #0]
	ldp	x5, x6, [x0, #16]	
	ldp	x7, x16, [sp, #480]
	ldp	x17, x27, [sp, #496]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x12, x15, x18
        adc 	x12, x12, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x12, x12, xzr  

	// add
	ldp	x13, x14, [sp, #440]
	ldp	x15, x16, [sp, #456]	
	ldr	x17, [sp, #472]
		
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
	
	stp	x3, x4, [sp, #216]
	stp	x5, x6, [sp, #232]
        
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
	
	stp	x8, x9, [sp, #152]
	stp	x10, x11, [sp, #168]       
        
	// mul
	ldp	x7, x16, [sp, #400]	
	ldp	x17, x27, [sp, #416]	
	add	x28, sp, #512	
	ldp	x3, x4, [x28, #0]
	ldp	x5, x6, [x28, #16]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr      

	stp	x8, x9, [sp, #440]
	stp	x10, x11, [sp, #456]
	str	x7, [sp, #472]	
        
	// mul
	ldp	x3, x4, [x0, #64]
	ldp	x5, x6, [x0, #80]
	ldp	x7, x16, [sp, #360]	
	ldp	x17, x27, [sp, #376]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x12, x15, x18
        adc 	x12, x12, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x12, x12, xzr
        
        // double
        adds	x8, x8, x8
        adcs	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adc	x12, x12, x12       
	
	// add
	ldp	x13, x14, [sp, #440]
	ldp	x15, x16, [sp, #456]	
	ldr	x17, [sp, #472]
		
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
	
	stp	x3, x4, [sp, #184]
	stp	x5, x6, [sp, #200]		
        
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
	
	stp	x8, x9, [sp, #248]
	stp	x10, x11, [sp, #264]	
	
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
	/* p1p1 to p3 */
	
	// mul
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]
	ldp	x7, x16, [sp, #248]
	ldp	x17, x27, [sp, #264]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr
        
	stp	x8, x9, [sp, #280]
	stp	x10, x11, [sp, #296]
	str	x7, [sp, #312]
	       
	// mul
	ldp	x3, x4, [sp, #184]
	ldp	x5, x6, [sp, #200]
	ldp	x7, x16, [sp, #216]	
	ldp	x17, x27, [sp, #232]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x12, x15, x18
        adc 	x12, x12, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x12, x12, xzr

	stp	x8, x9, [sp, #320]
	stp	x10, x11, [sp, #336]
	str	x12, [sp, #352]
	
	/* p3 to cached add/sub */	
	
	// add
	ldp	x13, x14, [sp, #280]
	ldp	x15, x16, [sp, #296]	
	ldr	x17, [sp, #312]
		
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
	
	add	x28, sp, #544	
	stp	x3, x4, [x28, #0]
	stp	x5, x6, [x28, #16]
        
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
	
	add	x28, sp, #512	
	stp	x8, x9, [x28, #0]
	stp	x10, x11, [x28, #16]
	
	// mul
	ldp	x3, x4, [sp, #184]
	ldp	x5, x6, [sp, #200]
	ldp	x7, x16, [sp, #248]
	ldp	x17, x27, [sp, #264]	
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x8, x8, x7
	adcs	x9, x9, x4
	adcs	x10, x10, x5
	adc	x11, x11, xzr        

	/* p3 to cached: assign to third fe */
	
	add	x28, sp, #576	
	stp	x8, x9, [x28, #0]
	stp	x10, x11, [x28, #16]
		
	// mul
	ldp	x3, x4, [sp, #152]
	ldp	x5, x6, [sp, #168]
	ldp	x7, x16, [sp, #216]	
	ldp	x17, x27, [sp, #232]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x3, x8, x7
	adcs	x4, x9, x4
	adcs	x5, x10, x5
	adc	x6, x11, xzr
	
	/* p3 to cached: multiply the fourth fe  */
	
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
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x8, x8, x7
	adcs	x9, x9, x4
	adcs	x10, x10, x5
	adc	x11, x11, xzr
	
	add	x28, sp, #608	
	stp	x8, x9, [x28, #0]
	stp	x10, x11, [x28, #16]
	
	/* p1p1 to p3 */
	
	ldr	x0, [sp, #96]
	
	// mul
	ldp	x3, x4, [x0, #0]
	ldp	x5, x6, [x0, #16]
	ldp	x7, x16, [x0, #96]
	ldp	x17, x27, [x0, #112]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr
        
	stp	x8, x9, [sp, #280]
	stp	x10, x11, [sp, #296]
	str	x7, [sp, #312]
	       
	// mul
	ldp	x3, x4, [x0, #32]
	ldp	x5, x6, [x0, #48]
	ldp	x7, x16, [x0, #64]	
	ldp	x17, x27, [x0, #80]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr

	stp	x8, x9, [sp, #320]
	stp	x10, x11, [sp, #336]
	str	x7, [sp, #352]
	
	// mul
	ldp	x3, x4, [x0, #32]
	ldp	x5, x6, [x0, #48]
	ldp	x7, x16, [x0, #96]
	ldp	x17, x27, [x0, #112]	
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x8, x8, x7
	adcs	x9, x9, x4
	adcs	x10, x10, x5
	adc	x11, x11, xzr        

	stp	x8, x9, [sp, #360]
	stp	x10, x11, [sp, #376]	
		
	// mul
	ldp	x3, x4, [x0, #0]
	ldp	x5, x6, [x0, #16]
	ldp	x7, x16, [x0, #64]	
	ldp	x17, x27, [x0, #80]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x1, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x1
        mul	x1, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x1
        mul	x1, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x1
        mul	x1, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x1        
        cset	x16, cs
        adds	x11, x11, x6
        adc 	x7, x7, x16

	cmn	x11, x11
	adc	x7, x7, x7
	mul	x7, x7, x19        

	bic	x11, x11, x21
	adds	x8, x8, x7
	adcs	x9, x9, x4
	adcs	x10, x10, x5
	adc	x11, x11, xzr

	stp	x8, x9, [sp, #400]
	stp	x10, x11, [sp, #416]
	
	/* pnielsadd p1p1 */

	// add
	ldp	x3, x4, [sp, #320]
	ldp	x5, x6, [sp, #336]	
	ldr	x7, [sp, #352]
	ldp	x13, x14, [sp, #280]
	ldp	x15, x16, [sp, #296]	
	ldr	x17, [sp, #312]	
	
        adds	x8, x3, x13
        adcs	x9, x4, x14
        adcs	x10, x5, x15
        adcs	x11, x6, x16
        adc	x12, x7, x17
        
	cmn	x11, x11
	adc	x12, x12, x12
	mul	x12, x12, x19        

	bic	x11, x11, x21
	adds	x8, x8, x12
	adcs	x9, x9, xzr
	adcs	x10, x10, xzr
	adc	x11, x11, xzr

	stp	x8, x9, [sp, #480]
	stp	x10, x11, [sp, #496]	

	// sub	
        adds	x3, x3, x22
        adcs	x4, x4, x23
        adcs	x5, x5, x23
        adcs	x6, x6, x23
        adc	x7, x7, x24
        
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
	
	// mul
	add	x28, sp, #512	
	ldp	x7, x16, [x28, #0]
	ldp	x17, x27, [x28, #16]	
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr      

	stp	x8, x9, [sp, #440]
	stp	x10, x11, [sp, #456]
	str	x7, [sp, #472]	
        
	// mul
	add	x28, sp, #544	
	ldp	x3, x4, [x28, #0]
	ldp	x5, x6, [x28, #16]
	ldp	x7, x16, [sp, #480]
	ldp	x17, x27, [sp, #496]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x12, x15, x18
        adc 	x12, x12, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x12, x12, xzr       
        
	// add
	ldp	x13, x14, [sp, #440]
	ldp	x15, x16, [sp, #456]	
	ldr	x17, [sp, #472]
		
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
	
	stp	x3, x4, [x0, #64]
	stp	x5, x6, [x0, #80]
        
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
	
	stp	x8, x9, [x0, #0]
	stp	x10, x11, [x0, #16]      
        
	// mul
	ldp	x7, x16, [sp, #400]	
	ldp	x17, x27, [sp, #416]	
	add	x28, sp, #608	
	ldp	x3, x4, [x28, #0]
	ldp	x5, x6, [x28, #16]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x7, x15, x18
        adc 	x7, x7, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x7, x7, xzr      

	stp	x8, x9, [sp, #440]
	stp	x10, x11, [sp, #456]
	str	x7, [sp, #472]		
        
	// mul
	ldp	x7, x16, [sp, #360]	
	ldp	x17, x27, [sp, #376]	
	add	x28, sp, #576	
	ldp	x3, x4, [x28, #0]
	ldp	x5, x6, [x28, #16]	
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x1, x4, x7
        adds	x9, x9, x1		
        umulh	x10, x4, x7
        mul	x1, x5, x7
        adcs	x10, x10, x1		
        umulh	x11, x5, x7
        mul	x1, x6, x7
        adcs	x11, x11, x1		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x1, x4, x16
        adds	x7, x7, x1
        umulh	x15, x4, x16
        mul	x1, x5, x16
        adcs	x15, x15, x1		
        umulh	x14, x5, x16
        mul	x1, x6, x16
        adcs	x14, x14, x1
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x1, x4, x17
        adds	x7, x7, x1        
        umulh	x16, x4, x17
        mul	x1, x5, x17
        adcs	x16, x16, x1		        
        umulh	x15, x5, x17
        mul	x1, x6, x17
        adcs	x15, x15, x1        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x1, x4, x27
        adds	x7, x7, x1
        umulh	x16, x4, x27
        mul	x1, x5, x27
        adcs	x16, x16, x1
        umulh	x17, x5, x27
        mul	x1, x6, x27
        adcs	x17, x17, x1
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x3, x12, x18
        umulh	x4, x12, x18
        mul	x1, x13, x18
        adds	x4, x4, x1
        umulh	x5, x13, x18
        mul	x1, x14, x18
        adcs	x5, x5, x1
        umulh	x6, x14, x18
        mul	x1, x15, x18
        adcs	x6, x6, x1
        umulh	x12, x15, x18
        adc 	x12, x12, xzr        
        adds	x8, x8, x3
        adcs	x9, x9, x4
        adcs	x10, x10, x5
        adcs	x11, x11, x6
        adc 	x12, x12, xzr

        // double
        adds	x8, x8, x8
        adcs	x9, x9, x9
        adcs	x10, x10, x10
        adcs	x11, x11, x11
        adc	x12, x12, x12	        
	
	// add
	ldp	x13, x14, [sp, #440]
	ldp	x15, x16, [sp, #456]	
	ldr	x17, [sp, #472]
		
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
	
	stp	x3, x4, [x0, #32]
	stp	x5, x6, [x0, #48] 	
        
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
	
	stp	x8, x9, [x0, #96]
	stp	x10, x11, [x0, #112]
		
	ldp	x29, x30, [sp, #80]
	ldp	x27, x28, [sp, #64]	
	ldp	x25, x26, [sp, #48]	
	ldp	x23, x24, [sp, #32]
	ldp	x21, x22, [sp, #16]	
	ldp	x19, x20, [sp, #0]
	add	sp, sp, #640

	ret
.section	.note.GNU-stack,"",@progbits
