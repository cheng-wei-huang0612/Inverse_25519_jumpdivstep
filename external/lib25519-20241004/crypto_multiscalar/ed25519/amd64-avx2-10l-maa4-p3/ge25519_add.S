#include "crypto_asm_hidden.h"
#include "consts_namespace.h"

// ge25519_add

	.p2align 5
ASM_HIDDEN _CRYPTO_NAMESPACE(ge25519_add)
.globl _CRYPTO_NAMESPACE(ge25519_add)
ASM_HIDDEN CRYPTO_NAMESPACE(ge25519_add)
.globl CRYPTO_NAMESPACE(ge25519_add)
_CRYPTO_NAMESPACE(ge25519_add):
CRYPTO_NAMESPACE(ge25519_add):

	movq 	%rsp,%r11
	andq 	$-32,%rsp
	subq  	$1120,%rsp

	movq	%r11,0(%rsp)
	movq	%r12,8(%rsp)
	movq	%r13,16(%rsp)
	movq	%r14,24(%rsp)
	movq	%r15,32(%rsp)
	movq	%rbx,40(%rsp)
	movq	%rbp,48(%rsp)

	movq 	%rdx,%rcx
	
	/* ge25519_add_p1p1 */

	// load
	movq    32(%rsi),%rdx
	movq    40(%rsi),%r8
	movq    48(%rsi),%r9
	movq    56(%rsi),%rax

	// copy
	movq 	%rdx,%r10
	movq  	%r8,%r11
	movq  	%r9,%r12
	movq 	%rax,%r13

	// sub
	subq 	0(%rsi),%rdx
	sbbq 	8(%rsi),%r8
	sbbq 	16(%rsi),%r9
	sbbq 	24(%rsi),%rax

	movq 	$0,%r14
	movq 	$38,%r15
	cmovae  %r14,%r15

	subq    %r15,%rdx
	sbbq 	%r14,%r8
	sbbq 	%r14,%r9
	sbbq  	%r14,%rax
	
	cmovc 	%r15,%r14
	subq 	%r14,%rdx

	// add
	addq 	0(%rsi),%r10
	adcq 	8(%rsi),%r11
	adcq 	16(%rsi),%r12
	adcq 	24(%rsi),%r13

	movq 	$0,%r14
	movq 	$38,%r15
	cmovae  %r14,%r15

	addq 	%r15,%r10
	adcq	%r14,%r11
	adcq	%r14,%r12
	adcq	%r14,%r13

	cmovc 	%r15,%r14
	addq 	%r14,%r10

	// store
	movq 	%rdx,56(%rsp)
	movq 	%r8,64(%rsp)
	movq 	%r9,72(%rsp)
	movq 	%rax,80(%rsp)

	// store
	movq 	%r10,88(%rsp)
	movq 	%r11,96(%rsp)
	movq 	%r12,104(%rsp)
	movq 	%r13,112(%rsp)

	// load
	movq    32(%rcx),%rdx
	movq    40(%rcx),%r8
	movq    48(%rcx),%r9
	movq    56(%rcx),%rax

	// copy
	movq  	%rdx,%r10
	movq  	%r8,%r11
	movq  	%r9,%r12
	movq  	%rax,%r13

	// sub
	subq 	0(%rcx),%rdx
	sbbq 	8(%rcx),%r8
	sbbq 	16(%rcx),%r9
	sbbq 	24(%rcx),%rax

	movq  	$0,%r14
	movq  	$38,%r15
	cmovae  %r14,%r15

	subq 	%r15,%rdx
	sbbq  	%r14,%r8
	sbbq  	%r14,%r9
	sbbq  	%r14,%rax

	cmovc 	%r15,%r14
	subq 	%r14,%rdx

	// add
	addq 	0(%rcx),%r10
	adcq 	8(%rcx),%r11
	adcq 	16(%rcx),%r12
	adcq 	24(%rcx),%r13

	movq 	$0,%r14
	movq 	$38,%r15
	cmovae  %r14,%r15

	addq 	%r15,%r10
	adcq	%r14,%r11
	adcq	%r14,%r12
	adcq	%r14,%r13

	cmovc 	%r15,%r14
	addq 	%r14,%r10

	// store
	movq 	%rdx,120(%rsp)
	movq 	%r8,128(%rsp)
	movq 	%r9,136(%rsp)
	movq 	%rax,144(%rsp)

	// store
	movq 	%r10,152(%rsp)
	movq 	%r11,160(%rsp)
	movq 	%r12,168(%rsp)
	movq 	%r13,176(%rsp)

	// mul
	movq    64(%rsp),%rax
	mulq    144(%rsp)
	movq    %rax,%r8
	xorq    %r9,%r9
	movq    %rdx,%r10
	xorq    %r11,%r11

	movq    72(%rsp),%rax
	mulq    136(%rsp)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    80(%rsp),%rax
	mulq    128(%rsp)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    72(%rsp),%rax
	mulq    144(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	movq    %rdx,%r12
	xorq    %r13,%r13

	movq    80(%rsp),%rax
	mulq    136(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %r10
	imul    $38,%r11,%r11
	movq    %rax,%r10
	addq    %rdx,%r11

	movq    80(%rsp),%rax
	mulq    144(%rsp)
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

	movq    56(%rsp),%rax
	mulq    144(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    64(%rsp),%rax
	mulq    136(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    72(%rsp),%rax
	mulq    128(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    80(%rsp),%rax
	mulq    120(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    $38,%rax
	mulq    %r8
	imul    $38,%r9,%r9
	movq    %rax,%r8
	addq    %rdx,%r9

	movq    56(%rsp),%rax
	mulq    120(%rsp)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    56(%rsp),%rax
	mulq    128(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    64(%rsp),%rax
	mulq    120(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    56(%rsp),%rax
	mulq    136(%rsp)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    64(%rsp),%rax
	mulq    128(%rsp)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    72(%rsp),%rax
	mulq    120(%rsp)
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

	// store
	movq 	%r8,56(%rsp)
	movq 	%r10,64(%rsp)
	movq 	%r12,72(%rsp)
	movq 	%r14,80(%rsp)

	// mul
	movq    96(%rsp),%rax
	mulq    176(%rsp)
	movq    %rax,%r8
	xorq    %r9,%r9
	movq    %rdx,%r10
	xorq    %r11,%r11

	movq    104(%rsp),%rax
	mulq    168(%rsp)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    112(%rsp),%rax
	mulq    160(%rsp)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    104(%rsp),%rax
	mulq    176(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	movq    %rdx,%r12
	xorq    %r13,%r13

	movq    112(%rsp),%rax
	mulq    168(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %r10
	imul    $38,%r11,%r11
	movq    %rax,%r10
	addq    %rdx,%r11

	movq    112(%rsp),%rax
	mulq    176(%rsp)
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

	movq    88(%rsp),%rax
	mulq    176(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    96(%rsp),%rax
	mulq    168(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    104(%rsp),%rax
	mulq    160(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    112(%rsp),%rax
	mulq    152(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    $38,%rax
	mulq    %r8
	imul    $38,%r9,%r9
	movq    %rax,%r8
	addq    %rdx,%r9

	movq    88(%rsp),%rax
	mulq    152(%rsp)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    88(%rsp),%rax
	mulq    160(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    96(%rsp),%rax
	mulq    152(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    88(%rsp),%rax
	mulq    168(%rsp)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    96(%rsp),%rax
	mulq    160(%rsp)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    104(%rsp),%rax
	mulq    152(%rsp)
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

	// copy
	movq 	%r8,%r9
	movq 	%r10,%r11
	movq 	%r12,%r13
	movq 	%r14,%r15

	// add
	addq 	56(%rsp),%r9
	adcq 	64(%rsp),%r11
	adcq 	72(%rsp),%r13
	adcq 	80(%rsp),%r15

	movq 	$0,%rdx
	movq 	$38,%rax
	cmovae  %rdx,%rax

	addq  	%rax,%r9
	adcq	%rdx,%r11
	adcq	%rdx,%r13
	adcq 	%rdx,%r15

	cmovc 	%rax,%rdx
	addq	%rdx,%r9

	// sub
	subq 	56(%rsp),%r8
	sbbq 	64(%rsp),%r10
	sbbq 	72(%rsp),%r12
	sbbq 	80(%rsp),%r14

	movq 	$0,%rdx
	mov  	$38,%rax
	cmovae  %rdx,%rax

	subq 	%rax,%r8
	sbbq 	%rdx,%r10
	sbbq 	%rdx,%r12
	sbbq 	%rdx,%r14

	cmovc 	%rax,%rdx
	subq 	%rdx,%r8

	// store
	movq    %r8,64(%rsp)
	movq    %r10,72(%rsp)
	movq    %r12,80(%rsp)
	movq    %r14,88(%rsp)

	// store
	movq    %r9,128(%rsp)
	movq    %r11,136(%rsp)
	movq    %r13,144(%rsp)
	movq    %r15,152(%rsp)

	// mul
	movq    104(%rsi),%rax
	mulq    120(%rcx)
	movq    %rax,%r8
	xorq    %r9,%r9
	movq    %rdx,%r10
	xorq    %r11,%r11

	movq    112(%rsi),%rax
	mulq    112(%rcx)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    120(%rsi),%rax
	mulq    104(%rcx)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    112(%rsi),%rax
	mulq    120(%rcx)
	addq    %rax,%r10
	adcq    $0,%r11
	movq    %rdx,%r12
	xorq    %r13,%r13

	movq    120(%rsi),%rax
	mulq    112(%rcx)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %r10
	imul    $38,%r11,%r11
	movq    %rax,%r10
	addq    %rdx,%r11

	movq    120(%rsi),%rax
	mulq    120(%rcx)
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

	movq    96(%rsi),%rax
	mulq    120(%rcx)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    104(%rsi),%rax
	mulq    112(%rcx)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    112(%rsi),%rax
	mulq    104(%rcx)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    120(%rsi),%rax
	mulq    96(%rcx)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    $38,%rax
	mulq    %r8
	imul    $38,%r9,%r9
	movq    %rax,%r8
	addq    %rdx,%r9

	movq    96(%rsi),%rax
	mulq    96(%rcx)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    96(%rsi),%rax
	mulq    104(%rcx)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    104(%rsi),%rax
	mulq    96(%rcx)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    96(%rsi),%rax
	mulq    112(%rcx)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    104(%rsi),%rax
	mulq    104(%rcx)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    112(%rsi),%rax
	mulq    96(%rcx)
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

	// store
	movq 	%r8,184(%rsp)
	movq 	%r10,192(%rsp)
	movq 	%r12,200(%rsp)
	movq 	%r14,208(%rsp)

	// mul
	movq    EC2D1(%rip),%rax
	mulq    208(%rsp)
	movq    %rax,%r8
	xorq    %r9,%r9
	movq    %rdx,%r10
	xorq    %r11,%r11

	movq    EC2D2(%rip),%rax
	mulq    200(%rsp)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    EC2D3(%rip),%rax
	mulq    192(%rsp)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    EC2D2(%rip),%rax
	mulq    208(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	movq    %rdx,%r12
	xorq    %r13,%r13

	movq    EC2D3(%rip),%rax
	mulq    200(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %r10
	imul    $38,%r11,%r11
	movq    %rax,%r10
	addq    %rdx,%r11

	movq    EC2D3(%rip),%rax
	mulq    208(%rsp)
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

	movq    EC2D0(%rip),%rax
	mulq    208(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    EC2D1(%rip),%rax
	mulq    200(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    EC2D2(%rip),%rax
	mulq    192(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    EC2D3(%rip),%rax
	mulq    184(%rsp)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    $38,%rax
	mulq    %r8
	imul    $38,%r9,%r9
	movq    %rax,%r8
	addq    %rdx,%r9

	movq    EC2D0(%rip),%rax
	mulq    184(%rsp)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    EC2D0(%rip),%rax
	mulq    192(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    EC2D1(%rip),%rax
	mulq    184(%rsp)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    EC2D0(%rip),%rax
	mulq    200(%rsp)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    EC2D1(%rip),%rax
	mulq    192(%rsp)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    EC2D2(%rip),%rax
	mulq    184(%rsp)
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

	// store
	movq 	%r8,184(%rsp)
	movq 	%r10,192(%rsp)
	movq 	%r12,200(%rsp)
	movq 	%r14,208(%rsp)

	// mul
	movq    72(%rsi),%rax
	mulq    88(%rcx)
	movq    %rax,%r8
	xorq    %r9,%r9
	movq    %rdx,%r10
	xorq    %r11,%r11

	movq    80(%rsi),%rax
	mulq    80(%rcx)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    88(%rsi),%rax
	mulq    72(%rcx)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    80(%rsi),%rax
	mulq    88(%rcx)
	addq    %rax,%r10
	adcq    $0,%r11
	movq    %rdx,%r12
	xorq    %r13,%r13

	movq    88(%rsi),%rax
	mulq    80(%rcx)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    $38,%rax
	mulq    %r10
	imul    $38,%r11,%r11
	movq    %rax,%r10
	addq    %rdx,%r11

	movq    88(%rsi),%rax
	mulq    88(%rcx)
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

	movq    64(%rsi),%rax
	mulq    88(%rcx)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    72(%rsi),%rax
	mulq    80(%rcx)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    80(%rsi),%rax
	mulq    72(%rcx)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    88(%rsi),%rax
	mulq    64(%rcx)
	addq    %rax,%r14
	adcq    $0,%r15
	addq    %rdx,%r8
	adcq    $0,%r9

	movq    $38,%rax
	mulq    %r8
	imul    $38,%r9,%r9
	movq    %rax,%r8
	addq    %rdx,%r9

	movq    64(%rsi),%rax
	mulq    64(%rcx)
	addq    %rax,%r8
	adcq    $0,%r9
	addq    %rdx,%r10
	adcq    $0,%r11

	movq    64(%rsi),%rax
	mulq    72(%rcx)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    72(%rsi),%rax
	mulq    64(%rcx)
	addq    %rax,%r10
	adcq    $0,%r11
	addq    %rdx,%r12
	adcq    $0,%r13

	movq    64(%rsi),%rax
	mulq    80(%rcx)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    72(%rsi),%rax
	mulq    72(%rcx)
	addq    %rax,%r12
	adcq    $0,%r13
	addq    %rdx,%r14
	adcq    $0,%r15

	movq    80(%rsi),%rax
	mulq    64(%rcx)
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

	// double
	addq    %r8,%r8
	adcq 	%r10,%r10
	adcq	%r12,%r12
	adcq 	%r14,%r14

	movq  	$0,%rdx
	movq  	$38,%rcx
	cmovae	%rdx,%rcx

	addq  	%rcx,%r8
	adcq 	%rdx,%r10
	adcq 	%rdx,%r12
	adcq 	%rdx,%r14

	cmovc 	%rcx,%rdx
	addq  	%rdx,%r8
	
	// copy
	movq 	%r8,%r9
	movq 	%r10,%r11
	movq 	%r12,%r13
	movq 	%r14,%r15

	// add
	addq 	184(%rsp),%r9
	adcq 	192(%rsp),%r11
	adcq 	200(%rsp),%r13
	adcq 	208(%rsp),%r15

	movq 	$0,%rdx
	movq 	$38,%rax
	cmovae  %rdx,%rax

	addq  	%rax,%r9
	adcq	%rdx,%r11
	adcq	%rdx,%r13
	adcq 	%rdx,%r15

	cmovc 	%rax,%rdx
	addq	%rdx,%r9

	// sub
	subq 	184(%rsp),%r8
	sbbq 	192(%rsp),%r10
	sbbq 	200(%rsp),%r12
	sbbq 	208(%rsp),%r14

	movq 	$0,%rdx
	mov  	$38,%rax
	cmovae  %rdx,%rax

	subq 	%rax,%r8
	sbbq 	%rdx,%r10
	sbbq 	%rdx,%r12
	sbbq 	%rdx,%r14

	cmovc 	%rax,%rdx
	subq 	%rdx,%r8

	// store
	movq    %r9,96(%rsp)
	movq    %r11,104(%rsp)
	movq    %r13,112(%rsp)
	movq    %r15,120(%rsp)

	// store
	movq    %r8,160(%rsp)
	movq    %r10,168(%rsp)
	movq    %r12,176(%rsp)
	movq    %r14,184(%rsp)
	
	/* p1p1 to p3 */

	// convert to 10x4 form
	vmovdqa   64(%rsp),%ymm8
	vmovdqa   96(%rsp),%ymm9
	vmovdqa   96(%rsp),%ymm10
	vmovdqa   64(%rsp),%ymm11

	vpunpcklqdq    %ymm9,%ymm8,%ymm12
	vpunpckhqdq    %ymm9,%ymm8,%ymm13
	vpunpcklqdq    %ymm11,%ymm10,%ymm14
	vpunpckhqdq    %ymm11,%ymm10,%ymm15

	vpermq    $68,%ymm14,%ymm7
	vpblendd  $240,%ymm7,%ymm12,%ymm1
	vpermq    $68,%ymm15,%ymm7
	vpblendd  $240,%ymm7,%ymm13,%ymm3
	vpermq    $238,%ymm12,%ymm7
	vpblendd  $240,%ymm14,%ymm7,%ymm5
	vpermq    $238,%ymm13,%ymm7
	vpblendd  $240,%ymm15,%ymm7,%ymm7

	vpand     pmask1(%rip),%ymm1,%ymm0

	vpand     pmask2(%rip),%ymm1,%ymm11
	vpsrlq    $26,%ymm11,%ymm11

	vpand     pmask3(%rip),%ymm1,%ymm2
	vpsrlq    $51,%ymm2,%ymm2
	vpand     pmask4(%rip),%ymm3,%ymm9
	vpsllq    $13,%ymm9,%ymm9
	vpor      %ymm9,%ymm2,%ymm2

	vpand     pmask5(%rip),%ymm3,%ymm12
	vpsrlq    $13,%ymm12,%ymm12

	vpand     pmask6(%rip),%ymm3,%ymm4
	vpsrlq    $38,%ymm4,%ymm4

	vpand     pmask7(%rip),%ymm5,%ymm13

	vpand     pmask8(%rip),%ymm5,%ymm6
	vpsrlq    $25,%ymm6,%ymm6

	vpand     pmask9(%rip),%ymm5,%ymm14
	vpsrlq    $51,%ymm14,%ymm14
	vpand     pmask10(%rip),%ymm7,%ymm9
	vpsllq    $13,%ymm9,%ymm9
	vpor      %ymm9,%ymm14,%ymm14

	vpand     pmask11(%rip),%ymm7,%ymm8
	vpsrlq    $12,%ymm8,%ymm8

	vpand     pmask12(%rip),%ymm7,%ymm15
	vpsrlq    $38,%ymm15,%ymm15

	vmovdqa   %ymm0,480(%rsp)
	vmovdqa   %ymm11,512(%rsp)
	vmovdqa   %ymm2,544(%rsp)
	vmovdqa   %ymm12,576(%rsp)
	vmovdqa   %ymm4,608(%rsp)
	vmovdqa   %ymm13,640(%rsp)
	vmovdqa   %ymm6,672(%rsp)
	vmovdqa   %ymm14,704(%rsp)
	vmovdqa   %ymm8,736(%rsp)
	vmovdqa   %ymm15,768(%rsp)

	// convert to 10x4 form
	vmovdqa   160(%rsp),%ymm8
	vmovdqa   128(%rsp),%ymm9
	vmovdqa   160(%rsp),%ymm10
	vmovdqa   128(%rsp),%ymm11

	vpunpcklqdq    %ymm9,%ymm8,%ymm12
	vpunpckhqdq    %ymm9,%ymm8,%ymm13
	vpunpcklqdq    %ymm11,%ymm10,%ymm14
	vpunpckhqdq    %ymm11,%ymm10,%ymm15

	vpermq    $68,%ymm14,%ymm7
	vpblendd  $240,%ymm7,%ymm12,%ymm10
	vpermq    $68,%ymm15,%ymm7
	vpblendd  $240,%ymm7,%ymm13,%ymm11
	vpermq    $238,%ymm12,%ymm7
	vpblendd  $240,%ymm14,%ymm7,%ymm12
	vpermq    $238,%ymm13,%ymm7
	vpblendd  $240,%ymm15,%ymm7,%ymm13

	vpand     pmask1(%rip),%ymm10,%ymm0

	vpand     pmask2(%rip),%ymm10,%ymm1
	vpsrlq    $26,%ymm1,%ymm1

	vpand     pmask3(%rip),%ymm10,%ymm2
	vpsrlq    $51,%ymm2,%ymm2
	vpand     pmask4(%rip),%ymm11,%ymm3
	vpsllq    $13,%ymm3,%ymm3
	vpor      %ymm3,%ymm2,%ymm2

	vpand     pmask5(%rip),%ymm11,%ymm3
	vpsrlq    $13,%ymm3,%ymm3

	vpand     pmask6(%rip),%ymm11,%ymm4
	vpsrlq    $38,%ymm4,%ymm4

	vpand     pmask7(%rip),%ymm12,%ymm5

	vpand     pmask8(%rip),%ymm12,%ymm6
	vpsrlq    $25,%ymm6,%ymm6

	vpand     pmask9(%rip),%ymm12,%ymm7
	vpsrlq    $51,%ymm7,%ymm7
	vpand     pmask10(%rip),%ymm13,%ymm8
	vpsllq    $13,%ymm8,%ymm8
	vpor      %ymm8,%ymm7,%ymm7

	vpand     pmask11(%rip),%ymm13,%ymm8
	vpsrlq    $12,%ymm8,%ymm8

	vpand     pmask12(%rip),%ymm13,%ymm9
	vpsrlq    $38,%ymm9,%ymm9

	vmovdqa   %ymm0,800(%rsp)
	vmovdqa   %ymm1,832(%rsp)
	vmovdqa   %ymm2,864(%rsp)
	vmovdqa   %ymm3,896(%rsp)
	vmovdqa   %ymm4,928(%rsp)
	vmovdqa   %ymm5,960(%rsp)
	vmovdqa   %ymm6,992(%rsp)
	vmovdqa   %ymm7,1024(%rsp)
	vmovdqa   %ymm8,1056(%rsp)
	vmovdqa   %ymm9,1088(%rsp)

	// mul4x1
	vmovdqa   512(%rsp),%ymm11
	vmovdqa   576(%rsp),%ymm12
	vmovdqa   640(%rsp),%ymm13
	vmovdqa   704(%rsp),%ymm14
	vmovdqa   768(%rsp),%ymm15

	vpaddq    %ymm11,%ymm11,%ymm11
	vpaddq    %ymm12,%ymm12,%ymm12
	vpaddq    %ymm13,%ymm13,%ymm13
	vpaddq    %ymm14,%ymm14,%ymm14
	vpaddq    %ymm15,%ymm15,%ymm15

	vpmuludq  vec19(%rip),%ymm1,%ymm1
	vpmuludq  vec19(%rip),%ymm2,%ymm2
	vpmuludq  vec19(%rip),%ymm3,%ymm3
	vpmuludq  vec19(%rip),%ymm4,%ymm4
	vpmuludq  vec19(%rip),%ymm5,%ymm5
	vpmuludq  vec19(%rip),%ymm6,%ymm6
	vpmuludq  vec19(%rip),%ymm7,%ymm7
	vpmuludq  vec19(%rip),%ymm8,%ymm8
	vpmuludq  vec19(%rip),%ymm9,%ymm9

	vpmuludq  %ymm15,%ymm1,%ymm0
	vpmuludq  %ymm14,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  %ymm13,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  %ymm12,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  %ymm11,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  736(%rsp),%ymm2,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  672(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  608(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  544(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  768(%rsp),%ymm2,%ymm1
	vpmuludq  736(%rsp),%ymm3,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  704(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  672(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  640(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  608(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  576(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  544(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  %ymm15,%ymm3,%ymm2
	vpmuludq  %ymm14,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm12,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  736(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  672(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  608(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  832(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  768(%rsp),%ymm4,%ymm3
	vpmuludq  736(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  704(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  672(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  640(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  608(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  %ymm15,%ymm5,%ymm4
	vpmuludq  %ymm14,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  %ymm13,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  736(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  672(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  832(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  896(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  768(%rsp),%ymm6,%ymm5
	vpmuludq  736(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  704(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  672(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  %ymm15,%ymm7,%ymm6
	vpmuludq  %ymm14,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  736(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  832(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  896(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  960(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  768(%rsp),%ymm8,%ymm7
	vpmuludq  736(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  %ymm15,%ymm9,%ymm8
	vpmuludq  832(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  896(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  960(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  1024(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vmovdqa   480(%rsp),%ymm11
	vmovdqa   512(%rsp),%ymm12
	vmovdqa   544(%rsp),%ymm13
	vmovdqa   576(%rsp),%ymm14
	vmovdqa   608(%rsp),%ymm15
	vmovdqa   640(%rsp),%ymm9

	vpmuludq  800(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  864(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  800(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  896(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  864(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  832(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  800(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  832(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  800(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  928(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  864(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  800(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  960(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  928(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  896(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  864(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  832(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  800(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  992(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  928(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  864(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  1024(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  992(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  960(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  928(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  896(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  864(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  1056(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  992(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  928(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  928(%rsp),%ymm9,%ymm9
	vpmuludq  1088(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  1056(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  1024(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  992(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  960(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vmovdqa   672(%rsp),%ymm11
	vmovdqa   704(%rsp),%ymm12
	vmovdqa   736(%rsp),%ymm13
	vmovdqa   768(%rsp),%ymm14

	vpmuludq  800(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  832(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  800(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  864(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  800(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  896(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  864(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  832(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  800(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm8

	vpsrlq    $25,%ymm9,%ymm10
	vpmuludq  vec19(%rip),%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm9

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm2

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm3

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask26(%rip),%ymm4,%ymm4

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm6

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm7

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm8

	// get back to 4x4 form
	vpand     upmask1(%rip),%ymm0,%ymm10
	vpand     upmask2(%rip),%ymm1,%ymm11
	vpsllq    $26,%ymm11,%ymm11
	vpor      %ymm10,%ymm11,%ymm10
	vpand     upmask3(%rip),%ymm2,%ymm11
	vpsllq    $51,%ymm11,%ymm11
	vpor      %ymm10,%ymm11,%ymm10

	vpand     upmask4(%rip),%ymm2,%ymm11
	vpsrlq    $13,%ymm11,%ymm11
	vpand     upmask2(%rip),%ymm3,%ymm12
	vpsllq    $13,%ymm12,%ymm12
	vpor      %ymm11,%ymm12,%ymm11
	vpand     upmask1(%rip),%ymm4,%ymm12
	vpsllq    $38,%ymm12,%ymm12
	vpor      %ymm11,%ymm12,%ymm11

	vpand     upmask2(%rip),%ymm5,%ymm12
	vpand     upmask1(%rip),%ymm6,%ymm13
	vpsllq    $25,%ymm13,%ymm13
	vpor      %ymm12,%ymm13,%ymm12
	vpand     upmask3(%rip),%ymm7,%ymm13
	vpsllq    $51,%ymm13,%ymm13
	vpor      %ymm12,%ymm13,%ymm12

	vpand     upmask5(%rip),%ymm7,%ymm13
	vpsrlq    $13,%ymm13,%ymm13
	vpand     upmask1(%rip),%ymm8,%ymm14
	vpsllq    $12,%ymm14,%ymm14
	vpor      %ymm13,%ymm14,%ymm13
	vpand     upmask1(%rip),%ymm9,%ymm14
	vpsllq    $38,%ymm14,%ymm14
	vpor      %ymm13,%ymm14,%ymm13

	vpunpcklqdq    %ymm11,%ymm10,%ymm2
	vpunpckhqdq    %ymm11,%ymm10,%ymm3
	vpunpcklqdq    %ymm13,%ymm12,%ymm4
	vpunpckhqdq    %ymm13,%ymm12,%ymm5

	vpermq    $68,%ymm4,%ymm7
	vpblendd  $240,%ymm7,%ymm2,%ymm10
	vpermq    $68,%ymm5,%ymm7
	vpblendd  $240,%ymm7,%ymm3,%ymm11
	vpermq    $238,%ymm2,%ymm7
	vpblendd  $240,%ymm4,%ymm7,%ymm12
	vpermq    $238,%ymm3,%ymm7
	vpblendd  $240,%ymm5,%ymm7,%ymm13

	vmovdqa   %ymm10,0(%rdi)
	vmovdqa   %ymm11,32(%rdi)
	vmovdqa   %ymm12,64(%rdi)
	vmovdqa   %ymm13,96(%rdi)

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
