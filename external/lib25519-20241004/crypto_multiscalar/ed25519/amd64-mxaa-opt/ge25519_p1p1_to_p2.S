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
	subq  	$64,%rsp 

	movq	%r11,0(%rsp)
	movq	%r12,8(%rsp)
	movq	%r13,16(%rsp)
	movq	%r14,24(%rsp)
	movq	%r15,32(%rsp)
	movq	%rbx,40(%rsp)
	movq	%rbp,48(%rsp)
	movq	%rdi,56(%rsp)	

	/* p1p1 to p2 */	
	
	// mul
	movq    0(%rsi),%rdx

	mulx    96(%rsi),%r8,%r9
	mulx    104(%rsi),%rcx,%r10
	addq    %rcx,%r9

	mulx    112(%rsi),%rcx,%r11
	adcq    %rcx,%r10

	mulx    120(%rsi),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    8(%rsi),%rdx    

	mulx    96(%rsi),%rax,%rbx
	mulx    104(%rsi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rsi),%rcx,%rdi
	adcq    %rcx,%rbp

	mulx    120(%rsi),%rcx,%r13
	adcq    %rcx,%rdi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rdi,%r12
	adcq    $0,%r13

	movq    16(%rsi),%rdx

	mulx    96(%rsi),%rax,%rbx
	mulx    104(%rsi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rsi),%rcx,%rdi
	adcq    %rcx,%rbp

	mulx    120(%rsi),%rcx,%r14
	adcq    %rcx,%rdi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rdi,%r13
	adcq    $0,%r14

	movq    24(%rsi),%rdx

	mulx    96(%rsi),%rax,%rbx
	mulx    104(%rsi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rsi),%rcx,%rdi
	adcq    %rcx,%rbp

	mulx    120(%rsi),%rcx,%r15
	adcq    %rcx,%rdi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rdi,%r14
	adcq    $0,%r15

	movq    $38,%rdx

	mulx    %r12,%r12,%rbx
	mulx    %r13,%r13,%rcx
	addq    %rbx,%r13

	mulx    %r14,%r14,%rbx
	adcq    %rcx,%r14

	mulx    %r15,%r15,%rcx
	adcq    %rbx,%r15
	adcq    $0,%rcx

	addq    %r12,%r8
	adcq    %r13,%r9
	adcq    %r14,%r10
	adcq    %r15,%r11
	adcq    $0,%rcx

	shld    $1,%r11,%rcx
	andq	mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq	56(%rsp),%rdi
	movq    %r8,0(%rdi)
	movq    %r9,8(%rdi)
	movq    %r10,16(%rdi)
	movq    %r11,24(%rdi)

	// mul
	movq    32(%rsi),%rdx

	mulx    64(%rsi),%r8,%r9
	mulx    72(%rsi),%rcx,%r10
	addq    %rcx,%r9

	mulx    80(%rsi),%rcx,%r11
	adcq    %rcx,%r10

	mulx    88(%rsi),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    40(%rsi),%rdx    

	mulx    64(%rsi),%rax,%rbx
	mulx    72(%rsi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    80(%rsi),%rcx,%rdi
	adcq    %rcx,%rbp

	mulx    88(%rsi),%rcx,%r13
	adcq    %rcx,%rdi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rdi,%r12
	adcq    $0,%r13

	movq    48(%rsi),%rdx

	mulx    64(%rsi),%rax,%rbx
	mulx    72(%rsi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    80(%rsi),%rcx,%rdi
	adcq    %rcx,%rbp

	mulx    88(%rsi),%rcx,%r14
	adcq    %rcx,%rdi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rdi,%r13
	adcq    $0,%r14

	movq    56(%rsi),%rdx

	mulx    64(%rsi),%rax,%rbx
	mulx    72(%rsi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    80(%rsi),%rcx,%rdi
	adcq    %rcx,%rbp

	mulx    88(%rsi),%rcx,%r15
	adcq    %rcx,%rdi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rdi,%r14
	adcq    $0,%r15

	movq    $38,%rdx

	mulx    %r12,%r12,%rbx
	mulx    %r13,%r13,%rcx
	addq    %rbx,%r13

	mulx    %r14,%r14,%rbx
	adcq    %rcx,%r14

	mulx    %r15,%r15,%rcx
	adcq    %rbx,%r15
	adcq    $0,%rcx

	addq    %r12,%r8
	adcq    %r13,%r9
	adcq    %r14,%r10
	adcq    %r15,%r11
	adcq    $0,%rcx

	shld    $1,%r11,%rcx
	andq	mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq	56(%rsp),%rdi
	movq    %r8,32(%rdi)
	movq    %r9,40(%rdi)
	movq    %r10,48(%rdi)
	movq    %r11,56(%rdi)

	// mul
	movq    32(%rsi),%rdx

	mulx    96(%rsi),%r8,%r9
	mulx    104(%rsi),%rcx,%r10
	addq    %rcx,%r9

	mulx    112(%rsi),%rcx,%r11
	adcq    %rcx,%r10

	mulx    120(%rsi),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    40(%rsi),%rdx    

	mulx    96(%rsi),%rax,%rbx
	mulx    104(%rsi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rsi),%rcx,%rdi
	adcq    %rcx,%rbp

	mulx    120(%rsi),%rcx,%r13
	adcq    %rcx,%rdi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rdi,%r12
	adcq    $0,%r13

	movq    48(%rsi),%rdx

	mulx    96(%rsi),%rax,%rbx
	mulx    104(%rsi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rsi),%rcx,%rdi
	adcq    %rcx,%rbp

	mulx    120(%rsi),%rcx,%r14
	adcq    %rcx,%rdi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rdi,%r13
	adcq    $0,%r14

	movq    56(%rsi),%rdx

	mulx    96(%rsi),%rax,%rbx
	mulx    104(%rsi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rsi),%rcx,%rdi
	adcq    %rcx,%rbp

	mulx    120(%rsi),%rcx,%r15
	adcq    %rcx,%rdi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rdi,%r14
	adcq    $0,%r15

	movq    $38,%rdx

	mulx    %r12,%r12,%rbx
	mulx    %r13,%r13,%rcx
	addq    %rbx,%r13

	mulx    %r14,%r14,%rbx
	adcq    %rcx,%r14

	mulx    %r15,%r15,%rcx
	adcq    %rbx,%r15
	adcq    $0,%rcx

	addq    %r12,%r8
	adcq    %r13,%r9
	adcq    %r14,%r10
	adcq    %r15,%r11
	adcq    $0,%rcx

	shld    $1,%r11,%rcx
	andq	mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq	56(%rsp),%rdi
	movq    %r8,64(%rdi)
	movq    %r9,72(%rdi)
	movq    %r10,80(%rdi)
	movq    %r11,88(%rdi)	

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
