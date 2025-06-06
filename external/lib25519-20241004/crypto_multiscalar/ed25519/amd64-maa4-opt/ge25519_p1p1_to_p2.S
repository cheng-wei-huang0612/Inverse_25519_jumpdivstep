#include "crypto_asm_hidden.h"
// linker define ge25519_p1p1_to_p2
// linker use mask63

#define mask63 CRYPTO_SHARED_NAMESPACE(mask63)

	.p2align 5
	ASM_HIDDEN _CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2)
	.globl _CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2)
	ASM_HIDDEN CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2)
	.globl CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2)

_CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2):
CRYPTO_SHARED_NAMESPACE(ge25519_p1p1_to_p2):

	movq	%rsp,%r11
	subq  	$56,%rsp 

	movq	%r11,0(%rsp)
	movq	%r12,8(%rsp)
	movq	%r13,16(%rsp)
	movq	%r14,24(%rsp)
	movq	%r15,32(%rsp)
	movq	%rbx,40(%rsp)
	movq	%rbp,48(%rsp)

	/* p1p1 to p2 */	
	
	// mul
	movq    8(%rsi),%rax
	mulq    120(%rsi) 
	movq    %rax,%r8
	xorq    %r9,%r9
	movq    %rdx,%r10
	xorq    %r11,%r11

	movq    16(%rsi),%rax
	mulq    112(%rsi) 
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    24(%rsi),%rax
	mulq    104(%rsi) 
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    16(%rsi),%rax
	mulq    120(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	movq    %rdx,%r12
	xorq    %r13,%r13

	movq    24(%rsi),%rax
	mulq    112(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %r10
	imul    $38,%r11,%r11
	movq    %rax,%r10
	addq    %rdx,%r11

	movq    24(%rsi),%rax
	mulq    120(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %rdx
	movq    %rax,%r14
	movq    %rdx,%r15

	movq    $38,%rax
	mulq    %r12
	imul    $38,%r13,%r13
	movq    %rax,%r12
	addq    %rdx,%r13

	movq    0(%rsi),%rax
	mulq    120(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    8(%rsi),%rax
	mulq    112(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    16(%rsi),%rax
	mulq    104(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    24(%rsi),%rax
	mulq    96(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    $38,%rax
	mulq    %r8
	imul    $38,%r9,%r9
	movq    %rax,%r8
	addq    %rdx,%r9

	movq    0(%rsi),%rax
	mulq    96(%rsi) 
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    0(%rsi),%rax
	mulq    104(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    8(%rsi),%rax
	mulq    96(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    0(%rsi),%rax
	mulq    112(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    8(%rsi),%rax
	mulq    104(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    16(%rsi),%rax
	mulq    96(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	addq    %r9,%r10
	adcq    $0,%r11

	addq    %r11,%r12
	adcq    $0,%r13

	addq    %r13,%r14
	adcq    $0,%r15

	shld    $1,%r14,%r15
	andq    mask63(%rip),%r14
	imul    $19,%r15,%r15

	addq    %r15,%r8
	adcq    $0,%r10
	adcq    $0,%r12
	adcq    $0,%r14

	movq    %r8,0(%rdi)
	movq    %r10,8(%rdi)
	movq    %r12,16(%rdi)
	movq    %r14,24(%rdi)

	// mul
	movq    40(%rsi),%rax
	mulq    88(%rsi) 
	movq    %rax,%r8
	xorq    %r9,%r9
	movq    %rdx,%r10
	xorq    %r11,%r11

	movq    48(%rsi),%rax
	mulq    80(%rsi) 
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    56(%rsi),%rax
	mulq    72(%rsi) 
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    48(%rsi),%rax
	mulq    88(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	movq    %rdx,%r12
	xorq    %r13,%r13

	movq    56(%rsi),%rax
	mulq    80(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %r10
	imul    $38,%r11,%r11
	movq    %rax,%r10
	addq    %rdx,%r11

	movq    56(%rsi),%rax
	mulq    88(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %rdx
	movq    %rax,%r14
	movq    %rdx,%r15

	movq    $38,%rax
	mulq    %r12
	imul    $38,%r13,%r13
	movq    %rax,%r12
	addq    %rdx,%r13

	movq    32(%rsi),%rax
	mulq    88(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    40(%rsi),%rax
	mulq    80(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    48(%rsi),%rax
	mulq    72(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    56(%rsi),%rax
	mulq    64(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    $38,%rax
	mulq    %r8
	imul    $38,%r9,%r9
	movq    %rax,%r8
	addq    %rdx,%r9

	movq    32(%rsi),%rax
	mulq    64(%rsi) 
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    32(%rsi),%rax
	mulq    72(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    40(%rsi),%rax
	mulq    64(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    32(%rsi),%rax
	mulq    80(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    40(%rsi),%rax
	mulq    72(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    48(%rsi),%rax
	mulq    64(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	addq    %r9,%r10
	adcq    $0,%r11

	addq    %r11,%r12
	adcq    $0,%r13

	addq    %r13,%r14
	adcq    $0,%r15

	shld    $1,%r14,%r15
	andq    mask63(%rip),%r14
	imul    $19,%r15,%r15

	addq    %r15,%r8
	adcq    $0,%r10
	adcq    $0,%r12
	adcq    $0,%r14

	movq    %r8,32(%rdi)
	movq    %r10,40(%rdi)
	movq    %r12,48(%rdi)
	movq    %r14,56(%rdi)

	// mul
	movq    40(%rsi),%rax
	mulq    120(%rsi) 
	movq    %rax,%r8
	xorq    %r9,%r9
	movq    %rdx,%r10
	xorq    %r11,%r11

	movq    48(%rsi),%rax
	mulq    112(%rsi) 
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    56(%rsi),%rax
	mulq    104(%rsi) 
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    48(%rsi),%rax
	mulq    120(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	movq    %rdx,%r12
	xorq    %r13,%r13

	movq    56(%rsi),%rax
	mulq    112(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %r10
	imul    $38,%r11,%r11
	movq    %rax,%r10
	addq    %rdx,%r11

	movq    56(%rsi),%rax
	mulq    120(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %rdx
	movq    %rax,%r14
	movq    %rdx,%r15

	movq    $38,%rax
	mulq    %r12
	imul    $38,%r13,%r13
	movq    %rax,%r12
	addq    %rdx,%r13

	movq    32(%rsi),%rax
	mulq    120(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    40(%rsi),%rax
	mulq    112(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    48(%rsi),%rax
	mulq    104(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    56(%rsi),%rax
	mulq    96(%rsi) 
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    $38,%rax
	mulq    %r8
	imul    $38,%r9,%r9
	movq    %rax,%r8
	addq    %rdx,%r9

	movq    32(%rsi),%rax
	mulq    96(%rsi) 
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    32(%rsi),%rax
	mulq    104(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    40(%rsi),%rax
	mulq    96(%rsi) 
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    32(%rsi),%rax
	mulq    112(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    40(%rsi),%rax
	mulq    104(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    48(%rsi),%rax
	mulq    96(%rsi) 
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	addq    %r9,%r10
	adcq    $0,%r11

	addq    %r11,%r12
	adcq    $0,%r13

	addq    %r13,%r14
	adcq    $0,%r15

	shld    $1,%r14,%r15
	andq    mask63(%rip),%r14
	imul    $19,%r15,%r15

	addq    %r15,%r8
	adcq    $0,%r10
	adcq    $0,%r12
	adcq    $0,%r14

	movq    %r8,64(%rdi)
	movq    %r10,72(%rdi)
	movq    %r12,80(%rdi)
	movq    %r14,88(%rdi)	

	movq 	 0(%rsp),%r11
	movq 	 8(%rsp),%r12
	movq 	16(%rsp),%r13
	movq 	24(%rsp),%r14
	movq 	32(%rsp),%r15
	movq 	40(%rsp),%rbx
	movq 	48(%rsp),%rbp

	movq 	%r11,%rsp

	ret
.section	.note.GNU-stack,"",@progbits
