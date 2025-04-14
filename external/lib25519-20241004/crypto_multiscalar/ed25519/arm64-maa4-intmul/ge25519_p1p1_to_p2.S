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

        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x30, x4, x7
        adds	x9, x9, x30
        umulh	x10, x4, x7
        mul	x30, x5, x7
        adcs	x10, x10, x30
        umulh	x11, x5, x7
        mul	x30, x6, x7
        adcs	x11, x11, x30
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x30, x4, x16
        adds	x7, x7, x30
        umulh	x15, x4, x16
        mul	x30, x5, x16
        adcs	x15, x15, x30		
        umulh	x14, x5, x16
        mul	x30, x6, x16
        adcs	x14, x14, x30
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x30, x4, x17
        adds	x7, x7, x30      
        umulh	x16, x4, x17
        mul	x30, x5, x17
        adcs	x16, x16, x30		        
        umulh	x15, x5, x17
        mul	x30, x6, x17
        adcs	x15, x15, x30        
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x30, x4, x27
        adds	x7, x7, x30
        umulh	x16, x4, x27
        mul	x30, x5, x27
        adcs	x16, x16, x30
        umulh	x17, x5, x27
        mul	x30, x6, x27
        adcs	x17, x17, x30
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x30, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x30
        mul	x30, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x30
        mul	x30, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x30
        mul	x30, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x30        
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
        
	stp	x8, x9, [x0, #0]
	stp	x10, x11, [x0, #16]
    
	// mul
	ldp	x3, x4, [x1, #32]
	ldp	x5, x6, [x1, #48]
	ldp	x7, x16, [x1, #64]
	ldp	x17, x27, [x1, #80]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x30, x4, x7
        adds	x9, x9, x30		
        umulh	x10, x4, x7
        mul	x30, x5, x7
        adcs	x10, x10, x30		
        umulh	x11, x5, x7
        mul	x30, x6, x7
        adcs	x11, x11, x30		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x30, x4, x16
        adds	x7, x7, x30
        umulh	x15, x4, x16
        mul	x30, x5, x16
        adcs	x15, x15, x30		
        umulh	x14, x5, x16
        mul	x30, x6, x16
        adcs	x14, x14, x30
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x30, x4, x17
        adds	x7, x7, x30     
        umulh	x16, x4, x17
        mul	x30, x5, x17
        adcs	x16, x16, x30		        
        umulh	x15, x5, x17
        mul	x30, x6, x17
        adcs	x15, x15, x30       
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x30, x4, x27
        adds	x7, x7, x30
        umulh	x16, x4, x27
        mul	x30, x5, x27
        adcs	x16, x16, x30
        umulh	x17, x5, x27
        mul	x30, x6, x27
        adcs	x17, x17, x30
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x30, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x30
        mul	x30, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x30
        mul	x30, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x30
        mul	x30, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x30        
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
        
	stp	x8, x9, [x0, #32]
	stp	x10, x11, [x0, #48]
	
	// mul
	ldp	x3, x4, [x1, #32]
	ldp	x5, x6, [x1, #48]
	ldp	x7, x16, [x1, #96]
	ldp	x17, x27, [x1, #112]
	
        mul	x8, x3, x7
        umulh	x9, x3, x7
        mul	x30, x4, x7
        adds	x9, x9, x30	
        umulh	x10, x4, x7
        mul	x30, x5, x7
        adcs	x10, x10, x30		
        umulh	x11, x5, x7
        mul	x30, x6, x7
        adcs	x11, x11, x30		
        umulh	x12, x6, x7
        adc 	x12, x12, xzr

        mul	x28, x3, x16
        umulh	x7, x3, x16
        mul	x30, x4, x16
        adds	x7, x7, x30
        umulh	x15, x4, x16
        mul	x30, x5, x16
        adcs	x15, x15, x30		
        umulh	x14, x5, x16
        mul	x30, x6, x16
        adcs	x14, x14, x30
        umulh	x13, x6, x16
        adc 	x13, x13, xzr
        adds	x9, x9, x28
        adcs	x10, x10, x7
        adcs	x11, x11, x15
        adcs	x12, x12, x14
        adc 	x13, x13, xzr
        
        mul	x28, x3, x17
        umulh	x7, x3, x17
        mul	x30, x4, x17
        adds	x7, x7, x30     
        umulh	x16, x4, x17
        mul	x30, x5, x17
        adcs	x16, x16, x30		        
        umulh	x15, x5, x17
        mul	x30, x6, x17
        adcs	x15, x15, x30       
        umulh	x14, x6, x17
        adc 	x14, x14, xzr
        adds	x10, x10, x28
        adcs	x11, x11, x7
        adcs	x12, x12, x16
        adcs	x13, x13, x15
        adc 	x14, x14, xzr
        
        mul	x28, x3, x27
        umulh	x7, x3, x27
        mul	x30, x4, x27
        adds	x7, x7, x30
        umulh	x16, x4, x27
        mul	x30, x5, x27
        adcs	x16, x16, x30
        umulh	x17, x5, x27
        mul	x30, x6, x27
        adcs	x17, x17, x30
        umulh	x15, x6, x27
        adc 	x15, x15, xzr        
        adds	x11, x11, x28
        adcs	x12, x12, x7
        adcs	x13, x13, x16
        adcs	x14, x14, x17
        adc 	x15, x15, xzr
	
        mul	x30, x12, x18
	umulh	x4, x12, x18         
        adds	x8, x8, x30
        mul	x30, x13, x18
	umulh	x5, x13, x18        
        adcs 	x9, x9, x30
        mul	x30, x14, x18
        umulh	x6, x14, x18        
        adcs 	x10, x10, x30
        mul	x30, x15, x18
        umulh	x7, x15, x18        
        adcs 	x11, x11, x30       
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
