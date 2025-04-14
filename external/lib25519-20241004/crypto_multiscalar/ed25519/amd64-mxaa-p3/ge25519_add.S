#include "crypto_asm_hidden.h"

#define mask63 CRYPTO_SHARED_NAMESPACE(mask63)
#define EC2D0 CRYPTO_SHARED_NAMESPACE(EC2D0)
#define EC2D1 CRYPTO_SHARED_NAMESPACE(EC2D1)
#define EC2D2 CRYPTO_SHARED_NAMESPACE(EC2D2)
#define EC2D3 CRYPTO_SHARED_NAMESPACE(EC2D3)

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
	subq  	$352,%rsp 	

	movq	%r11,0(%rsp)
	movq	%r12,8(%rsp)
	movq	%r13,16(%rsp)
	movq	%r14,24(%rsp)
	movq	%r15,32(%rsp)
	movq	%rbx,40(%rsp)
	movq	%rbp,48(%rsp)

	movq	64(%rsi),%r8
	movq	72(%rsi),%r9
	movq	80(%rsi),%r10
	movq	88(%rsi),%r11
	
	movq	%r8,216(%rsp)
	movq	%r9,224(%rsp)
	movq	%r10,232(%rsp)
	movq	%r11,240(%rsp)
	
	movq	96(%rsi),%r8
	movq	104(%rsi),%r9
	movq	112(%rsi),%r10
	movq	120(%rsi),%r11
	
	movq	%r8,256(%rsp)
	movq	%r9,264(%rsp)
	movq	%r10,272(%rsp)
	movq	%r11,280(%rsp)
	
	movq	64(%rdx),%r8
	movq	72(%rdx),%r9
	movq	80(%rdx),%r10
	movq	88(%rdx),%r11
	
	movq	%r8,288(%rsp)
	movq	%r9,296(%rsp)
	movq	%r10,304(%rsp)
	movq	%r11,312(%rsp)
	
	movq	96(%rdx),%r8
	movq	104(%rdx),%r9
	movq	112(%rdx),%r10
	movq	120(%rdx),%r11
	
	movq	%r8,320(%rsp)
	movq	%r9,328(%rsp)
	movq	%r10,336(%rsp)
	movq	%r11,344(%rsp)
	
	movq 	%rdx,%rcx	

	
	/* add p1p1 */

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
	movq    56(%rsp),%rdx

	mulx    120(%rsp),%r8,%r9
	mulx    128(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    136(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    144(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    64(%rsp),%rdx    

	mulx    120(%rsp),%rax,%rbx
	mulx    128(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    136(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    144(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    72(%rsp),%rdx

	mulx    120(%rsp),%rax,%rbx
	mulx    128(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    136(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    144(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    80(%rsp),%rdx

	mulx    120(%rsp),%rax,%rbx
	mulx    128(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    136(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    144(%rsp),%rcx,%r15
	adcq    %rcx,%rsi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rsi,%r14
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

	// store
	movq 	%r8,56(%rsp)
	movq 	%r9,64(%rsp)
	movq 	%r10,72(%rsp)
	movq 	%r11,80(%rsp)

	// mul
	movq    88(%rsp),%rdx

	mulx    152(%rsp),%r8,%r9
	mulx    160(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    168(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    176(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    96(%rsp),%rdx    

	mulx    152(%rsp),%rax,%rbx
	mulx    160(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    168(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    176(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    104(%rsp),%rdx

	mulx    152(%rsp),%rax,%rbx
	mulx    160(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    168(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    176(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    112(%rsp),%rdx

	mulx    152(%rsp),%rax,%rbx
	mulx    160(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    168(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    176(%rsp),%rcx,%r15
	adcq    %rcx,%rsi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rsi,%r14
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

	// copy
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%r15

	// add
	addq 	56(%rsp),%r12
	adcq 	64(%rsp),%r13
	adcq 	72(%rsp),%r14
	adcq 	80(%rsp),%r15

	movq 	$0,%rdx
	movq 	$38,%rax
	cmovae  %rdx,%rax

	addq  	%rax,%r12
	adcq	%rdx,%r13
	adcq	%rdx,%r14
	adcq 	%rdx,%r15

	cmovc 	%rax,%rdx
	addq	%rdx,%r12

	// sub
	subq 	56(%rsp),%r8
	sbbq 	64(%rsp),%r9
	sbbq 	72(%rsp),%r10
	sbbq 	80(%rsp),%r11

	movq 	$0,%rdx
	mov  	$38,%rax
	cmovae  %rdx,%rax

	subq 	%rax,%r8
	sbbq 	%rdx,%r9
	sbbq 	%rdx,%r10
	sbbq 	%rdx,%r11

	cmovc 	%rax,%rdx
	subq 	%rdx,%r8

	// store
	movq    %r8,64(%rsp)
	movq    %r9,72(%rsp)
	movq    %r10,80(%rsp)
	movq    %r11,88(%rsp)

	// store
	movq    %r12,128(%rsp)
	movq    %r13,136(%rsp)
	movq    %r14,144(%rsp)
	movq    %r15,152(%rsp)

	// mul
	movq    256(%rsp),%rdx

	mulx    320(%rsp),%r8,%r9
	mulx    328(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    336(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    344(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    264(%rsp),%rdx    

	mulx    320(%rsp),%rax,%rbx
	mulx    328(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    336(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    344(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    272(%rsp),%rdx

	mulx    320(%rsp),%rax,%rbx
	mulx    328(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    336(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    344(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    280(%rsp),%rdx

	mulx    320(%rsp),%rax,%rbx
	mulx    328(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    336(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    344(%rsp),%rcx,%r15
	adcq    %rcx,%rsi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rsi,%r14
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

	// store
	movq 	%r8,184(%rsp)
	movq 	%r9,192(%rsp)
	movq 	%r10,200(%rsp)
	movq 	%r11,208(%rsp)

	// mul
	movq    EC2D0(%rip),%rdx

	mulx    184(%rsp),%r8,%r9
	mulx    192(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    200(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    208(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    EC2D1(%rip),%rdx    

	mulx    184(%rsp),%rax,%rbx
	mulx    192(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    200(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    208(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    EC2D2(%rip),%rdx

	mulx    184(%rsp),%rax,%rbx
	mulx    192(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    200(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    208(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    EC2D3(%rip),%rdx

	mulx    184(%rsp),%rax,%rbx
	mulx    192(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    200(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    208(%rsp),%rcx,%r15
	adcq    %rcx,%rsi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rsi,%r14
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

	// store
	movq 	%r8,184(%rsp)
	movq 	%r9,192(%rsp)
	movq 	%r10,200(%rsp)
	movq 	%r11,208(%rsp)

	// mul
	movq    216(%rsp),%rdx

	mulx    288(%rsp),%r8,%r9
	mulx    296(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    304(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    312(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    224(%rsp),%rdx    

	mulx    288(%rsp),%rax,%rbx
	mulx    296(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    304(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    312(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    232(%rsp),%rdx

	mulx    288(%rsp),%rax,%rbx
	mulx    296(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    304(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    312(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    240(%rsp),%rdx

	mulx    288(%rsp),%rax,%rbx
	mulx    296(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    304(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    312(%rsp),%rcx,%r15
	adcq    %rcx,%rsi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rsi,%r14
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

	// double
	addq    %r8,%r8
	adcq 	%r9,%r9
	adcq	%r10,%r10
	adcq 	%r11,%r11

	movq  	$0,%rdx
	movq  	$38,%rcx
	cmovae	%rdx,%rcx

	addq  	%rcx,%r8
	adcq 	%rdx,%r9
	adcq 	%rdx,%r10
	adcq 	%rdx,%r11

	cmovc 	%rcx,%rdx
	addq  	%rdx,%r8
	
	// copy
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%r15

	// add
	addq 	184(%rsp),%r12
	adcq 	192(%rsp),%r13
	adcq 	200(%rsp),%r14
	adcq 	208(%rsp),%r15

	movq 	$0,%rdx
	movq 	$38,%rax
	cmovae  %rdx,%rax

	addq  	%rax,%r12
	adcq	%rdx,%r13
	adcq	%rdx,%r14
	adcq 	%rdx,%r15

	cmovc 	%rax,%rdx
	addq	%rdx,%r12

	// sub
	subq 	184(%rsp),%r8
	sbbq 	192(%rsp),%r9
	sbbq 	200(%rsp),%r10
	sbbq 	208(%rsp),%r11

	movq 	$0,%rdx
	mov  	$38,%rax
	cmovae  %rdx,%rax

	subq 	%rax,%r8
	sbbq 	%rdx,%r9
	sbbq 	%rdx,%r10
	sbbq 	%rdx,%r11

	cmovc 	%rax,%rdx
	subq 	%rdx,%r8

	// store
	movq    %r12,96(%rsp)
	movq    %r13,104(%rsp)
	movq    %r14,112(%rsp)
	movq    %r15,120(%rsp)

	// store
	movq    %r8,160(%rsp)
	movq    %r9,168(%rsp)
	movq    %r10,176(%rsp)
	movq    %r11,184(%rsp)
	
	/* p1p1 to p3 */

	// mul
	movq    64(%rsp),%rdx

	mulx    160(%rsp),%r8,%r9
	mulx    168(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    176(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    184(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    72(%rsp),%rdx    

	mulx    160(%rsp),%rax,%rbx
	mulx    168(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    176(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    184(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    80(%rsp),%rdx

	mulx    160(%rsp),%rax,%rbx
	mulx    168(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    176(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    184(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    88(%rsp),%rdx

	mulx    160(%rsp),%rax,%rbx
	mulx    168(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    176(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    184(%rsp),%rcx,%r15
	adcq    %rcx,%rsi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rsi,%r14
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

	movq    %r8,0(%rdi)
	movq    %r9,8(%rdi)
	movq    %r10,16(%rdi)
	movq    %r11,24(%rdi)

	// mul
	movq    96(%rsp),%rdx

	mulx    128(%rsp),%r8,%r9
	mulx    136(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    144(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    152(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    104(%rsp),%rdx    

	mulx    128(%rsp),%rax,%rbx
	mulx    136(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    144(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    152(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    112(%rsp),%rdx

	mulx    128(%rsp),%rax,%rbx
	mulx    136(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    144(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    152(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    120(%rsp),%rdx

	mulx    128(%rsp),%rax,%rbx
	mulx    136(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    144(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    152(%rsp),%rcx,%r15
	adcq    %rcx,%rsi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rsi,%r14
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

	movq    %r8,32(%rdi)
	movq    %r9,40(%rdi)
	movq    %r10,48(%rdi)
	movq    %r11,56(%rdi)

	// mul
	movq    96(%rsp),%rdx

	mulx    160(%rsp),%r8,%r9
	mulx    168(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    176(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    184(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    104(%rsp),%rdx    

	mulx    160(%rsp),%rax,%rbx
	mulx    168(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    176(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    184(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    112(%rsp),%rdx

	mulx    160(%rsp),%rax,%rbx
	mulx    168(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    176(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    184(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    120(%rsp),%rdx

	mulx    160(%rsp),%rax,%rbx
	mulx    168(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    176(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    184(%rsp),%rcx,%r15
	adcq    %rcx,%rsi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rsi,%r14
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

	movq    %r8,64(%rdi)
	movq    %r9,72(%rdi)
	movq    %r10,80(%rdi)
	movq    %r11,88(%rdi)

	// mul
	movq    64(%rsp),%rdx
	
	mulx    128(%rsp),%r8,%r9
	mulx    136(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    144(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    152(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    72(%rsp),%rdx    

	mulx    128(%rsp),%rax,%rbx
	mulx    136(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    144(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    152(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    80(%rsp),%rdx

	mulx    128(%rsp),%rax,%rbx
	mulx    136(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    144(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    152(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    88(%rsp),%rdx

	mulx    128(%rsp),%rax,%rbx
	mulx    136(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    144(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    152(%rsp),%rcx,%r15
	adcq    %rcx,%rsi
	adcq    $0,%r15

	addq    %rax,%r11
	adcq    %rbx,%r12
	adcq    %rbp,%r13
	adcq    %rsi,%r14
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

	movq    %r8,96(%rdi)
	movq    %r9,104(%rdi)
	movq    %r10,112(%rdi)
	movq    %r11,120(%rdi)

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
