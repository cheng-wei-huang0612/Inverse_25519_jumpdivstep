#include "crypto_asm_hidden.h"
// linker define ge25519_multi_scalarmult_process
// linker use EC2D0 EC2D1 EC2D2 EC2D3 mask63
// linker use twoexp8_p0
// linker use twoexp8_p123
// linker use twoexp8_p4

#define EC2D0 CRYPTO_SHARED_NAMESPACE(EC2D0)
#define EC2D1 CRYPTO_SHARED_NAMESPACE(EC2D1)
#define EC2D2 CRYPTO_SHARED_NAMESPACE(EC2D2)
#define EC2D3 CRYPTO_SHARED_NAMESPACE(EC2D3)
#define mask63 CRYPTO_SHARED_NAMESPACE(mask63)
#define twoexp8_p0 CRYPTO_SHARED_NAMESPACE(twoexp8_p0)
#define twoexp8_p123 CRYPTO_SHARED_NAMESPACE(twoexp8_p123)
#define twoexp8_p4 CRYPTO_SHARED_NAMESPACE(twoexp8_p4)

	.p2align 5
	ASM_HIDDEN _CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process)
	.globl _CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process)
	ASM_HIDDEN CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process)
	.globl CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process)
	
_CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process):
CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_process):

	movq	%rsp,%r11
	andq 	$-32,%rsp
	subq  	$632,%rsp 

	movq	%r11,0(%rsp)
	movq	%r12,8(%rsp)
	movq	%r13,16(%rsp)
	movq	%r14,24(%rsp)
	movq	%r15,32(%rsp)
	movq	%rbx,40(%rsp)
	movq	%rbp,48(%rsp)

	// p1p1 to 0	
	movq	$0,%rax
	movq	$1,%rbx
	
	movq	%rax,144(%rsp)
	movq	%rax,152(%rsp)
	movq	%rax,160(%rsp)
	movq	%rax,168(%rsp)
	
	movq	%rbx,176(%rsp)
	movq	%rax,184(%rsp)
	movq	%rax,192(%rsp)
	movq	%rax,200(%rsp)
	
	movq	%rbx,208(%rsp)
	movq	%rax,216(%rsp)
	movq	%rax,224(%rsp)
	movq	%rax,232(%rsp)	

	movq	%rbx,240(%rsp)
	movq	%rax,248(%rsp)
	movq	%rax,256(%rsp)
	movq	%rax,264(%rsp)
	
	movq	%rdi,56(%rsp)
	movq	%rsi,64(%rsp)
	movq	%rdx,72(%rsp)
	movq	%rcx,80(%rsp)
	movq	%rax,88(%rsp)
	
	movq	$128,%rdx	
	mulx	%r8,%r8,%r9
	movq	%r8,96(%rsp)	

	movq	$255,104(%rsp) 
	
	addq	104(%rsp),%rsi
	movq	%rsi,112(%rsp)
	
.L1:
	movq	88(%rsp),%rax	
	cmpq	$0,%rax
	je	.L2
	
	/* p1p1 to p2 */	
	
	// mul
	movq    144(%rsp),%rdx

	mulx    240(%rsp),%r8,%r9
	mulx    248(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    256(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    264(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    152(%rsp),%rdx    

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    160(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    168(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r15
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

	movq    %r8,272(%rsp)
	movq    %r9,280(%rsp)
	movq    %r10,288(%rsp)
	movq    %r11,296(%rsp)

	// mul
	movq    176(%rsp),%rdx

	mulx    208(%rsp),%r8,%r9
	mulx    216(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    224(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    232(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    184(%rsp),%rdx    

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    192(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    200(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r15
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

	movq    %r8,304(%rsp)
	movq    %r9,312(%rsp)
	movq    %r10,320(%rsp)
	movq    %r11,328(%rsp)

	// mul
	movq    176(%rsp),%rdx

	mulx    240(%rsp),%r8,%r9
	mulx    248(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    256(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    264(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    184(%rsp),%rdx    

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    192(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    200(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r15
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

	movq    %r8,336(%rsp)
	movq    %r9,344(%rsp)
	movq    %r10,352(%rsp)
	movq    %r11,360(%rsp)
	
	/* dbl p1p1 */
	
	// square
	movq    336(%rsp),%rdx
	    
	mulx    344(%rsp),%r9,%r10
	mulx    352(%rsp),%rcx,%r11
	addq    %rcx,%r10

	mulx    360(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    344(%rsp),%rdx

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%r13
	addq    %rcx,%rbx
	adcq    $0,%r13

	addq    %rax,%r11
	adcq    %rbx,%r12

	movq    352(%rsp),%rdx

	mulx    360(%rsp),%rax,%r14

	adcq    %rax,%r13
	adcq    $0,%r14

	movq    $0,%r15
	shld    $1,%r14,%r15
	shld    $1,%r13,%r14
	shld    $1,%r12,%r13
	shld    $1,%r11,%r12
	shld    $1,%r10,%r11
	shld    $1,%r9,%r10
	shlq    $1,%r9

	movq    336(%rsp),%rdx
	mulx    %rdx,%r8,%rax
	addq    %rax,%r9

	movq    344(%rsp),%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r10
	adcq    %rbx,%r11

	movq    352(%rsp),%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r12
	adcq    %rbx,%r13

	movq    360(%rsp),%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r14
	adcq    %rbx,%r15

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
	
	// double
	addq    %r8,%r8
	adcq 	%r9,%r9
	adcq	%r10,%r10
	adcq 	%r11,%r11
	adcq 	%rcx,%rcx	
	
	movq    %r8,448(%rsp)
	movq    %r9,456(%rsp)
	movq    %r10,464(%rsp)
	movq    %r11,472(%rsp)
	movq    %rcx,480(%rsp)	

	// square
	movq    304(%rsp),%rdx
	    
	mulx    312(%rsp),%r9,%r10
	mulx    320(%rsp),%rcx,%r11
	addq    %rcx,%r10

	mulx    328(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    312(%rsp),%rdx

	mulx    320(%rsp),%rax,%rbx
	mulx    328(%rsp),%rcx,%r13
	addq    %rcx,%rbx
	adcq    $0,%r13

	addq    %rax,%r11
	adcq    %rbx,%r12

	movq    320(%rsp),%rdx

	mulx    328(%rsp),%rax,%r14

	adcq    %rax,%r13
	adcq    $0,%r14

	movq    $0,%r15
	shld    $1,%r14,%r15
	shld    $1,%r13,%r14
	shld    $1,%r12,%r13
	shld    $1,%r11,%r12
	shld    $1,%r10,%r11
	shld    $1,%r9,%r10
	shlq    $1,%r9

	movq    304(%rsp),%rdx
	mulx    %rdx,%r8,%rax
	addq    %rax,%r9

	movq    312(%rsp),%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r10
	adcq    %rbx,%r11

	movq    320(%rsp),%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r12
	adcq    %rbx,%r13

	movq    328(%rsp),%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r14
	adcq    %rbx,%r15

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

	movq    %r8,408(%rsp)
	movq    %r9,416(%rsp)
	movq    %r10,424(%rsp)
	movq    %r11,432(%rsp)
	movq    %rcx,440(%rsp)
	
	// square
	movq    272(%rsp),%rdx
	    
	mulx    280(%rsp),%r9,%r10
	mulx    288(%rsp),%rcx,%r11
	addq    %rcx,%r10

	mulx    296(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    280(%rsp),%rdx

	mulx    288(%rsp),%rax,%rbx
	mulx    296(%rsp),%rcx,%r13
	addq    %rcx,%rbx
	adcq    $0,%r13

	addq    %rax,%r11
	adcq    %rbx,%r12

	movq    288(%rsp),%rdx

	mulx    296(%rsp),%rax,%r14

	adcq    %rax,%r13
	adcq    $0,%r14

	movq    $0,%r15
	shld    $1,%r14,%r15
	shld    $1,%r13,%r14
	shld    $1,%r12,%r13
	shld    $1,%r11,%r12
	shld    $1,%r10,%r11
	shld    $1,%r9,%r10
	shlq    $1,%r9

	movq    272(%rsp),%rdx
	mulx    %rdx,%r8,%rax
	addq    %rax,%r9

	movq    280(%rsp),%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r10
	adcq    %rbx,%r11

	movq    288(%rsp),%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r12
	adcq    %rbx,%r13

	movq    296(%rsp),%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r14
	adcq    %rbx,%r15

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
	
	movq    %r8,368(%rsp)
	movq    %r9,376(%rsp)
	movq    %r10,384(%rsp)
	movq    %r11,392(%rsp)
	movq    %rcx,400(%rsp)	
	
	// neg
	movq    twoexp8_p0(%rip),%r12
	movq    twoexp8_p123(%rip),%r13
	movq    twoexp8_p123(%rip),%r14
	movq    twoexp8_p123(%rip),%rax
	movq    twoexp8_p4(%rip),%rbx

	subq    %r8,%r12
	sbbq    %r9,%r13
	sbbq    %r10,%r14
	sbbq    %r11,%rax
	sbbq    %rcx,%rbx
	
	// add
	addq    408(%rsp),%r12
	adcq    416(%rsp),%r13
	adcq    424(%rsp),%r14
	adcq    432(%rsp),%rax
	adcq    440(%rsp),%rbx
	
	movq    %r12,%r8
	movq    %r13,%r9
	movq    %r14,%r10
	movq    %rax,%r11
	movq    %rbx,%rcx		

	shld    $1,%rax,%rbx
	andq	mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax
	
	movq    %r12,176(%rsp)
	movq    %r13,184(%rsp)
	movq    %r14,192(%rsp)
	movq    %rax,200(%rsp)
	
	// sub
	subq    448(%rsp),%r8
	sbbq    456(%rsp),%r9
	sbbq    464(%rsp),%r10
	sbbq    472(%rsp),%r11
	sbbq    480(%rsp),%rcx

	shld    $1,%r11,%rcx
	andq	mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq    %r8,240(%rsp)
	movq    %r9,248(%rsp)
	movq    %r10,256(%rsp)
	movq    %r11,264(%rsp)		
	
	// neg
	movq    twoexp8_p0(%rip),%r8
	movq    twoexp8_p123(%rip),%r9
	movq    twoexp8_p123(%rip),%r10
	movq    twoexp8_p123(%rip),%r11
	movq    twoexp8_p4(%rip),%rax	
	
	subq    408(%rsp),%r8
	sbbq    416(%rsp),%r9
	sbbq    424(%rsp),%r10
	sbbq    432(%rsp),%r11
	sbbq    440(%rsp),%rax
	
	// sub
	subq    368(%rsp),%r8
	sbbq    376(%rsp),%r9
	sbbq    384(%rsp),%r10
	sbbq    392(%rsp),%r11
	sbbq    400(%rsp),%rax	

	shld    $1,%r11,%rax
	andq	mask63(%rip),%r11

	imul    $19,%rax,%rax
	addq    %rax,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq    %r8,208(%rsp)
	movq    %r9,216(%rsp)
	movq    %r10,224(%rsp)
	movq    %r11,232(%rsp)

	// add
	movq    272(%rsp),%rbx
	movq    280(%rsp),%rbp
	movq    288(%rsp),%rcx
	movq    296(%rsp),%rsi

	addq    304(%rsp),%rbx
	adcq    312(%rsp),%rbp
	adcq    320(%rsp),%rcx
	adcq    328(%rsp),%rsi

	movq    $0,%rdx
	movq    $38,%rax
	cmovae  %rdx,%rax
	
	addq    %rax,%rbx
	adcq    %rdx,%rbp
	adcq    %rdx,%rcx
	adcq    %rdx,%rsi
	
	cmovc   %rax,%rdx
	addq    %rdx,%rbx

	// square
	movq    %rbx,%rdx
	    
	mulx    %rbp,%r9,%r10
	mulx    %rcx,%r8,%r11
	addq    %r8,%r10

	mulx    %rsi,%r8,%r12
	adcq    %r8,%r11
	adcq    $0,%r12

	movq    %rbp,%rdx

	mulx    %rcx,%rax,%r8
	mulx    %rsi,%rdx,%r13
	addq    %rdx,%r8
	adcq    $0,%r13

	addq    %rax,%r11
	adcq    %r8,%r12

	movq    %rcx,%rdx

	mulx    %rsi,%rax,%r14

	adcq    %rax,%r13
	adcq    $0,%r14

	movq    $0,%r15
	shld    $1,%r14,%r15
	shld    $1,%r13,%r14
	shld    $1,%r12,%r13
	shld    $1,%r11,%r12
	shld    $1,%r10,%r11
	shld    $1,%r9,%r10
	shlq    $1,%r9

	movq    %rbx,%rdx
	mulx    %rdx,%r8,%rax
	addq    %rax,%r9

	movq    %rbp,%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r10
	adcq    %rbx,%r11

	movq    %rcx,%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r12
	adcq    %rbx,%r13

	movq    %rsi,%rdx
	mulx    %rdx,%rax,%rbx
	adcq    %rax,%r14
	adcq    %rbx,%r15

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

	// add
	addq    208(%rsp),%r8
	adcq    216(%rsp),%r9
	adcq    224(%rsp),%r10
	adcq    232(%rsp),%r11
	adcq    $0,%rcx	

	shld    $1,%r11,%rcx
	andq	mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq    %r8,144(%rsp)
	movq    %r9,152(%rsp)
	movq    %r10,160(%rsp)
	movq    %r11,168(%rsp)
	
.L2:		
	movq	$0,120(%rsp)
	movq	112(%rsp),%rsi
	movq	%rsi,128(%rsp)	
	
.L3:   
	movb	0(%rsi),%r14b
	cmpb	$0,%r14b
	jne	.L4
	
	addq	$256,%rsi
	movq	%rsi,128(%rsp)
	movq	120(%rsp),%rcx
	addq	$1,%rcx
	movq	%rcx,120(%rsp)		
	cmpq	80(%rsp),%rcx	
	jl	.L3
	
	movq	112(%rsp),%rsi
	decq	%rsi
	movq	%rsi,112(%rsp)
	movq	104(%rsp),%rax
	decq	%rax	
	movq	%rax,104(%rsp)	
	cmpq	$0,%rax	
	jge	.L1
	
	jmp	.L8	
.L4:	
	movq	$1,88(%rsp)
	movb	%r14b,136(%rsp)	
	
	/* p1p1 to p3 */
	
	// mul
	movq    144(%rsp),%rdx

	mulx    240(%rsp),%r8,%r9
	mulx    248(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    256(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    264(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    152(%rsp),%rdx    

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    160(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    168(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r15
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

	movq    %r8,272(%rsp)
	movq    %r9,280(%rsp)
	movq    %r10,288(%rsp)
	movq    %r11,296(%rsp)
	movq    %rcx,304(%rsp)

	// mul
	movq    176(%rsp),%rdx

	mulx    208(%rsp),%r8,%r9
	mulx    216(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    224(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    232(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    184(%rsp),%rdx    

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    192(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    200(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r15
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

	movq    %r8,312(%rsp)
	movq    %r9,320(%rsp)
	movq    %r10,328(%rsp)
	movq    %r11,336(%rsp)
	movq    %rcx,344(%rsp)	

	// mul
	movq    176(%rsp),%rdx

	mulx    240(%rsp),%r8,%r9
	mulx    248(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    256(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    264(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    184(%rsp),%rdx    

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    192(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    200(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r15
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

	movq    %r8,352(%rsp)
	movq    %r9,360(%rsp)
	movq    %r10,368(%rsp)
	movq    %r11,376(%rsp)
	
	// mul
	movq    144(%rsp),%rdx

	mulx    208(%rsp),%r8,%r9
	mulx    216(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    224(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    232(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    152(%rsp),%rdx    

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    160(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    168(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r15
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

	movq    %r8,392(%rsp)
	movq    %r9,400(%rsp)
	movq    %r10,408(%rsp)
	movq    %r11,416(%rsp)
	
	movq	72(%rsp),%rdi
	movq	96(%rsp),%rdx	
	mulx	120(%rsp),%r13,%r15
	addq	%r13,%rdi
	
	movb	136(%rsp),%r14b	
	cmpb	$0,%r14b
	jl	.L5	
		
	shrb	$1,%r14b
	movzbq	%r14b,%r14
	imul	$128,%r14,%r14
	addq	%r14,%rdi

	/* pnielsadd p1p1 */
	
	movq	312(%rsp),%r8
	movq	320(%rsp),%r9
	movq	328(%rsp),%r10
	movq	336(%rsp),%r11
	movq	344(%rsp),%rax	
	
	// copy
	movq	%r8,%r12
	movq	%r9,%r13
	movq	%r10,%r14
	movq	%r11,%r15
	movq	%rax,%rbx	
	
	// sub
	addq    twoexp8_p0(%rip),%r8
	adcq    twoexp8_p123(%rip),%r9
	adcq    twoexp8_p123(%rip),%r10
	adcq    twoexp8_p123(%rip),%r11
	adcq    twoexp8_p4(%rip),%rax
		
	subq 	272(%rsp),%r8
	sbbq 	280(%rsp),%r9
	sbbq 	288(%rsp),%r10
	sbbq 	296(%rsp),%r11
	sbbq 	304(%rsp),%rax

	shld    $1,%r11,%rax
	andq    mask63(%rip),%r11

	imul    $19,%rax,%rax
	addq    %rax,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq   %r8,432(%rsp)
	movq   %r9,440(%rsp)
	movq   %r10,448(%rsp)
	movq   %r11,456(%rsp)
	
	// add
	addq 	272(%rsp),%r12
	adcq 	280(%rsp),%r13
	adcq 	288(%rsp),%r14
	adcq 	296(%rsp),%r15
	adcq 	304(%rsp),%rbx	

	shld    $1,%r15,%rbx
	andq    mask63(%rip),%r15

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%r15	
	
	movq   %r12,472(%rsp)
	movq   %r13,480(%rsp)
	movq   %r14,488(%rsp)
	movq   %r15,496(%rsp)
	
	// mul
	movq    0(%rdi),%rdx

	mulx    432(%rsp),%r8,%r9
	mulx    440(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    448(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    456(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    8(%rdi),%rdx    

	mulx    432(%rsp),%rax,%rbx
	mulx    440(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    448(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    456(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    16(%rdi),%rdx

	mulx    432(%rsp),%rax,%rbx
	mulx    440(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    448(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    456(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    24(%rdi),%rdx

	mulx    432(%rsp),%rax,%rbx
	mulx    440(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    448(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    456(%rsp),%rcx,%r15
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

	movq    %r8,432(%rsp)
	movq    %r9,440(%rsp)
	movq    %r10,448(%rsp)
	movq    %r11,456(%rsp)
	movq    %rcx,464(%rsp)

	// mul
	movq    32(%rdi),%rdx

	mulx    472(%rsp),%r8,%r9
	mulx    480(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    488(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    496(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    40(%rdi),%rdx    

	mulx    472(%rsp),%rax,%rbx
	mulx    480(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    488(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    496(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    48(%rdi),%rdx

	mulx    472(%rsp),%rax,%rbx
	mulx    480(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    488(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    496(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    56(%rdi),%rdx

	mulx    472(%rsp),%rax,%rbx
	mulx    480(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    488(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    496(%rsp),%rcx,%r15
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

	// add
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%rax
	movq 	%rcx,%rbx	

	addq 	432(%rsp),%r8
	adcq 	440(%rsp),%r9
	adcq 	448(%rsp),%r10
	adcq 	456(%rsp),%r11
	adcq 	464(%rsp),%rcx	
	
	shld    $1,%r11,%rcx
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq   %r8,208(%rsp)
	movq   %r9,216(%rsp)
	movq   %r10,224(%rsp)
	movq   %r11,232(%rsp)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
		
	subq 	432(%rsp),%r12
	sbbq 	440(%rsp),%r13
	sbbq 	448(%rsp),%r14
	sbbq 	456(%rsp),%rax
	sbbq 	464(%rsp),%rbx
	
	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax	

	movq   %r12,144(%rsp)
	movq   %r13,152(%rsp)
	movq   %r14,160(%rsp)
	movq   %rax,168(%rsp)

	// mul	
	movq    96(%rdi),%rdx

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    408(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    416(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    104(%rdi),%rdx    

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    112(%rdi),%rdx

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    120(%rdi),%rdx

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r15
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

	movq    %r8,432(%rsp)
	movq    %r9,440(%rsp)
	movq    %r10,448(%rsp)
	movq    %r11,456(%rsp)	
	movq    %rcx,464(%rsp)	

	// mul	
	movq    64(%rdi),%rdx

	mulx    352(%rsp),%r8,%r9
	mulx    360(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    368(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    376(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    72(%rdi),%rdx    

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    368(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    376(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    80(%rdi),%rdx

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    368(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    376(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    88(%rdi),%rdx

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    368(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    376(%rsp),%rcx,%r15
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

	// double
	addq 	%r8,%r8
	adcq 	%r9,%r9
	adcq 	%r10,%r10
	adcq 	%r11,%r11
	adcq 	%rcx,%rcx	
	
	// add
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%rax
	movq 	%rcx,%rbx	

	addq 	432(%rsp),%r8
	adcq 	440(%rsp),%r9
	adcq 	448(%rsp),%r10
	adcq 	456(%rsp),%r11
	adcq 	464(%rsp),%rcx	

	shld    $1,%r11,%rcx
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq   %r8,176(%rsp)
	movq   %r9,184(%rsp)
	movq   %r10,192(%rsp)
	movq   %r11,200(%rsp)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
	
	subq 	432(%rsp),%r12
	sbbq 	440(%rsp),%r13
	sbbq 	448(%rsp),%r14
	sbbq 	456(%rsp),%rax
	sbbq 	464(%rsp),%rbx	

	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax
		
	movq   %r12,240(%rsp)
	movq   %r13,248(%rsp)
	movq   %r14,256(%rsp)
	movq   %rax,264(%rsp)
	
	jmp	.L6
	
.L5:		
	movb	$0,%r15b
	subb	%r14b,%r15b
	shrb	$1,%r15b
	movzbq	%r15b,%r15
	imul	$128,%r15,%r15	
	addq	%r15,%rdi	

	/* pnielssub p1p1 */
	
	// neg
	movq    $0,%r8
	movq    $0,%r9
	movq    $0,%r10
	movq    $0,%r11

	subq    96(%rdi),%r8
	sbbq    104(%rdi),%r9
	sbbq    112(%rdi),%r10
	sbbq    120(%rdi),%r11

	movq    $0,%rdx
	movq    $38,%rax
	cmovae %rdx,%rax

	subq    %rax,%r8
	sbbq    %rdx,%r9
	sbbq    %rdx,%r10
	sbbq    %rdx,%r11

	cmovc   %rax,%rdx
	subq    %rdx,%r8

	movq    %r8,504(%rsp)
	movq    %r9,512(%rsp)
	movq    %r10,520(%rsp)
	movq    %r11,528(%rsp)

	movq	312(%rsp),%r8
	movq	320(%rsp),%r9
	movq	328(%rsp),%r10
	movq	336(%rsp),%r11
	movq	344(%rsp),%rax	
	
	// copy
	movq	%r8,%r12
	movq	%r9,%r13
	movq	%r10,%r14
	movq	%r11,%r15
	movq	%rax,%rbx	
	
	// sub
	addq    twoexp8_p0(%rip),%r8
	adcq    twoexp8_p123(%rip),%r9
	adcq    twoexp8_p123(%rip),%r10
	adcq    twoexp8_p123(%rip),%r11
	adcq    twoexp8_p4(%rip),%rax
		
	subq 	272(%rsp),%r8
	sbbq 	280(%rsp),%r9
	sbbq 	288(%rsp),%r10
	sbbq 	296(%rsp),%r11
	sbbq 	304(%rsp),%rax

	shld    $1,%r11,%rax
	andq    mask63(%rip),%r11

	imul    $19,%rax,%rax
	addq    %rax,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq   %r8,432(%rsp)
	movq   %r9,440(%rsp)
	movq   %r10,448(%rsp)
	movq   %r11,456(%rsp)
	
	// add
	addq 	272(%rsp),%r12
	adcq 	280(%rsp),%r13
	adcq 	288(%rsp),%r14
	adcq 	296(%rsp),%r15
	adcq 	304(%rsp),%rbx	

	shld    $1,%r15,%rbx
	andq    mask63(%rip),%r15

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%r15	
	
	movq   %r12,472(%rsp)
	movq   %r13,480(%rsp)
	movq   %r14,488(%rsp)
	movq   %r15,496(%rsp)
	
	// mul
	movq    32(%rdi),%rdx

	mulx    432(%rsp),%r8,%r9
	mulx    440(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    448(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    456(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    40(%rdi),%rdx    

	mulx    432(%rsp),%rax,%rbx
	mulx    440(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    448(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    456(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    48(%rdi),%rdx

	mulx    432(%rsp),%rax,%rbx
	mulx    440(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    448(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    456(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    56(%rdi),%rdx

	mulx    432(%rsp),%rax,%rbx
	mulx    440(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    448(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    456(%rsp),%rcx,%r15
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

	movq    %r8,432(%rsp)
	movq    %r9,440(%rsp)
	movq    %r10,448(%rsp)
	movq    %r11,456(%rsp)
	movq    %rcx,464(%rsp)

	// mul
	movq    0(%rdi),%rdx

	mulx    472(%rsp),%r8,%r9
	mulx    480(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    488(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    496(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    8(%rdi),%rdx    

	mulx    472(%rsp),%rax,%rbx
	mulx    480(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    488(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    496(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    16(%rdi),%rdx

	mulx    472(%rsp),%rax,%rbx
	mulx    480(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    488(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    496(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    24(%rdi),%rdx

	mulx    472(%rsp),%rax,%rbx
	mulx    480(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    488(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    496(%rsp),%rcx,%r15
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

	// add
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%rax
	movq 	%rcx,%rbx	

	addq 	432(%rsp),%r8
	adcq 	440(%rsp),%r9
	adcq 	448(%rsp),%r10
	adcq 	456(%rsp),%r11
	adcq 	464(%rsp),%rcx
	
	shld    $1,%r11,%rcx
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq   %r8,208(%rsp)
	movq   %r9,216(%rsp)
	movq   %r10,224(%rsp)
	movq   %r11,232(%rsp)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
	
	subq 	432(%rsp),%r12
	sbbq 	440(%rsp),%r13
	sbbq 	448(%rsp),%r14
	sbbq 	456(%rsp),%rax
	sbbq 	464(%rsp),%rbx
	
	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax	
	
	movq   %r12,144(%rsp)
	movq   %r13,152(%rsp)
	movq   %r14,160(%rsp)
	movq   %rax,168(%rsp)

	// mul	
	movq    504(%rsp),%rdx

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    408(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    416(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    512(%rsp),%rdx    

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    520(%rsp),%rdx

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    528(%rsp),%rdx

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r15
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

	movq    %r8,432(%rsp)
	movq    %r9,440(%rsp)
	movq    %r10,448(%rsp)
	movq    %r11,456(%rsp)	
	movq    %rcx,464(%rsp)		

	// mul	
	movq    64(%rdi),%rdx

	mulx    352(%rsp),%r8,%r9
	mulx    360(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    368(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    376(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    72(%rdi),%rdx    

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    368(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    376(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    80(%rdi),%rdx

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    368(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    376(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    88(%rdi),%rdx

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    368(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    376(%rsp),%rcx,%r15
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

	// double
	addq 	%r8,%r8
	adcq 	%r9,%r9
	adcq 	%r10,%r10
	adcq 	%r11,%r11
	adcq 	%rcx,%rcx	
	
	// add
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%rax
	movq 	%rcx,%rbx	

	addq 	432(%rsp),%r8
	adcq 	440(%rsp),%r9
	adcq 	448(%rsp),%r10
	adcq 	456(%rsp),%r11
	adcq 	464(%rsp),%rcx	

	shld    $1,%r11,%rcx
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq   %r8,176(%rsp)
	movq   %r9,184(%rsp)
	movq   %r10,192(%rsp)
	movq   %r11,200(%rsp)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
	
	subq 	432(%rsp),%r12
	sbbq 	440(%rsp),%r13
	sbbq 	448(%rsp),%r14
	sbbq 	456(%rsp),%rax
	sbbq 	464(%rsp),%rbx	

	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax
		
	movq   %r12,240(%rsp)
	movq   %r13,248(%rsp)
	movq   %r14,256(%rsp)
	movq   %rax,264(%rsp)
		
.L6:	
	movq	128(%rsp),%rsi
	addq	$256,%rsi
	movq	%rsi,128(%rsp)
	movq	120(%rsp),%rcx
	addq	$1,%rcx
	movq	%rcx,120(%rsp)		
	cmpq	80(%rsp),%rcx
	jl	.L3

.L7:
	movq	112(%rsp),%rsi
	decq	%rsi
	movq	%rsi,112(%rsp)
	movq	104(%rsp),%rax
	decq	%rax	
	movq	%rax,104(%rsp)	
	cmpq	$0,%rax	
	jge	.L1	
	
.L8:
	/* p1p1 to p3 */

	// mul
	movq    144(%rsp),%rdx

	mulx    240(%rsp),%r8,%r9
	mulx    248(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    256(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    264(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    152(%rsp),%rdx    

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    160(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    168(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r15
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

	movq    %r8,272(%rsp)
	movq    %r9,280(%rsp)
	movq    %r10,288(%rsp)
	movq    %r11,296(%rsp)
	movq    %rcx,304(%rsp)

	// mul
	movq    176(%rsp),%rdx

	mulx    208(%rsp),%r8,%r9
	mulx    216(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    224(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    232(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    184(%rsp),%rdx    

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    192(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    200(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r15
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

	movq    %r8,312(%rsp)
	movq    %r9,320(%rsp)
	movq    %r10,328(%rsp)
	movq    %r11,336(%rsp)
	movq    %rcx,344(%rsp)
	
	/* p3 to cached add/sub */
	
	// add
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%rax
	movq 	%rcx,%rbx	

	addq 	272(%rsp),%r8
	adcq 	280(%rsp),%r9
	adcq 	288(%rsp),%r10
	adcq 	296(%rsp),%r11
	adcq 	304(%rsp),%rcx
	
	shld    $1,%r11,%rcx
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq   %r8,536(%rsp)
	movq   %r9,544(%rsp)
	movq   %r10,552(%rsp)
	movq   %r11,560(%rsp)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
	
	subq 	272(%rsp),%r12
	sbbq 	280(%rsp),%r13
	sbbq 	288(%rsp),%r14
	sbbq 	296(%rsp),%rax
	sbbq 	304(%rsp),%rbx
	
	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax	
	
	movq   %r12,504(%rsp)
	movq   %r13,512(%rsp)
	movq   %r14,520(%rsp)
	movq   %rax,528(%rsp)		

	// mul
	movq    176(%rsp),%rdx

	mulx    240(%rsp),%r8,%r9
	mulx    248(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    256(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    264(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    184(%rsp),%rdx    

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    192(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    200(%rsp),%rdx

	mulx    240(%rsp),%rax,%rbx
	mulx    248(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    256(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    264(%rsp),%rcx,%r15
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
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	/* p3 to cached: assign to third fe */
	movq    %r8,568(%rsp)
	movq    %r9,576(%rsp)
	movq    %r10,584(%rsp)
	movq    %r11,592(%rsp)

	// mul
	movq    144(%rsp),%rdx

	mulx    208(%rsp),%r8,%r9
	mulx    216(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    224(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    232(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    152(%rsp),%rdx    

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    160(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    168(%rsp),%rdx

	mulx    208(%rsp),%rax,%rbx
	mulx    216(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    224(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    232(%rsp),%rcx,%r15
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
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,392(%rsp)
	movq    %r9,400(%rsp)
	movq    %r10,408(%rsp)
	movq    %r11,416(%rsp)
	
	/* p3 to cached: multiply the fourth fes  */
		
	// mul
	movq    EC2D0(%rip),%rdx

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    408(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    416(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    EC2D1(%rip),%rdx    

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    EC2D2(%rip),%rdx

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    EC2D3(%rip),%rdx

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r15
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
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,600(%rsp)
	movq    %r9,608(%rsp)
	movq    %r10,616(%rsp)
	movq    %r11,624(%rsp)	
	
	/* p1p1 to p3 */
	
	movq	56(%rsp),%rdi
	
	// mul
	movq    0(%rdi),%rdx

	mulx    96(%rdi),%r8,%r9
	mulx    104(%rdi),%rcx,%r10
	addq    %rcx,%r9

	mulx    112(%rdi),%rcx,%r11
	adcq    %rcx,%r10

	mulx    120(%rdi),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    8(%rdi),%rdx    

	mulx    96(%rdi),%rax,%rbx
	mulx    104(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    120(%rdi),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    16(%rdi),%rdx

	mulx    96(%rdi),%rax,%rbx
	mulx    104(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    120(%rdi),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    24(%rdi),%rdx

	mulx    96(%rdi),%rax,%rbx
	mulx    104(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    120(%rdi),%rcx,%r15
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

	movq    %r8,272(%rsp)
	movq    %r9,280(%rsp)
	movq    %r10,288(%rsp)
	movq    %r11,296(%rsp)
	movq    %rcx,304(%rsp)

	// mul
	movq    32(%rdi),%rdx

	mulx    64(%rdi),%r8,%r9
	mulx    72(%rdi),%rcx,%r10
	addq    %rcx,%r9

	mulx    80(%rdi),%rcx,%r11
	adcq    %rcx,%r10

	mulx    88(%rdi),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    40(%rdi),%rdx    

	mulx    64(%rdi),%rax,%rbx
	mulx    72(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    80(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    88(%rdi),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    48(%rdi),%rdx

	mulx    64(%rdi),%rax,%rbx
	mulx    72(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    80(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    88(%rdi),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    56(%rdi),%rdx

	mulx    64(%rdi),%rax,%rbx
	mulx    72(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    80(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    88(%rdi),%rcx,%r15
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

	movq    %r8,312(%rsp)
	movq    %r9,320(%rsp)
	movq    %r10,328(%rsp)
	movq    %r11,336(%rsp)
	movq    %rcx,344(%rsp)	

	// mul
	movq    32(%rdi),%rdx

	mulx    96(%rdi),%r8,%r9
	mulx    104(%rdi),%rcx,%r10
	addq    %rcx,%r9

	mulx    112(%rdi),%rcx,%r11
	adcq    %rcx,%r10

	mulx    120(%rdi),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    40(%rdi),%rdx    

	mulx    96(%rdi),%rax,%rbx
	mulx    104(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    120(%rdi),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    48(%rdi),%rdx

	mulx    96(%rdi),%rax,%rbx
	mulx    104(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    120(%rdi),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    56(%rdi),%rdx

	mulx    96(%rdi),%rax,%rbx
	mulx    104(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    112(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    120(%rdi),%rcx,%r15
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
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,352(%rsp)
	movq    %r9,360(%rsp)
	movq    %r10,368(%rsp)
	movq    %r11,376(%rsp)

	// mul
	movq    0(%rdi),%rdx

	mulx    64(%rdi),%r8,%r9
	mulx    72(%rdi),%rcx,%r10
	addq    %rcx,%r9

	mulx    80(%rdi),%rcx,%r11
	adcq    %rcx,%r10

	mulx    88(%rdi),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    8(%rdi),%rdx    

	mulx    64(%rdi),%rax,%rbx
	mulx    72(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    80(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    88(%rdi),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    16(%rdi),%rdx

	mulx    64(%rdi),%rax,%rbx
	mulx    72(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    80(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    88(%rdi),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    24(%rdi),%rdx

	mulx    64(%rdi),%rax,%rbx
	mulx    72(%rdi),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    80(%rdi),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    88(%rdi),%rcx,%r15
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
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,392(%rsp)
	movq    %r9,400(%rsp)
	movq    %r10,408(%rsp)
	movq    %r11,416(%rsp)
	
	/* pnielsadd p1p1 */
	
	movq	56(%rsp),%rdi
	
	movq	312(%rsp),%r8
	movq	320(%rsp),%r9
	movq	328(%rsp),%r10
	movq	336(%rsp),%r11
	movq	344(%rsp),%rax	
	
	// copy
	movq	%r8,%r12
	movq	%r9,%r13
	movq	%r10,%r14
	movq	%r11,%r15
	movq	%rax,%rbx	
	
	// sub
	addq    twoexp8_p0(%rip),%r8
	adcq    twoexp8_p123(%rip),%r9
	adcq    twoexp8_p123(%rip),%r10
	adcq    twoexp8_p123(%rip),%r11
	adcq    twoexp8_p4(%rip),%rax
		
	subq 	272(%rsp),%r8
	sbbq 	280(%rsp),%r9
	sbbq 	288(%rsp),%r10
	sbbq 	296(%rsp),%r11
	sbbq 	304(%rsp),%rax

	shld    $1,%r11,%rax
	andq    mask63(%rip),%r11

	imul    $19,%rax,%rax
	addq    %rax,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq   %r8,432(%rsp)
	movq   %r9,440(%rsp)
	movq   %r10,448(%rsp)
	movq   %r11,456(%rsp)
	
	// add
	addq 	272(%rsp),%r12
	adcq 	280(%rsp),%r13
	adcq 	288(%rsp),%r14
	adcq 	296(%rsp),%r15
	adcq 	304(%rsp),%rbx	

	shld    $1,%r15,%rbx
	andq    mask63(%rip),%r15

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%r15	
	
	movq   %r12,472(%rsp)
	movq   %r13,480(%rsp)
	movq   %r14,488(%rsp)
	movq   %r15,496(%rsp)
	
	// mul
	movq    504(%rsp),%rdx

	mulx    432(%rsp),%r8,%r9
	mulx    440(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    448(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    456(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    512(%rsp),%rdx    

	mulx    432(%rsp),%rax,%rbx
	mulx    440(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    448(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    456(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    520(%rsp),%rdx

	mulx    432(%rsp),%rax,%rbx
	mulx    440(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    448(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    456(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    528(%rsp),%rdx

	mulx    432(%rsp),%rax,%rbx
	mulx    440(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    448(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    456(%rsp),%rcx,%r15
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

	movq    %r8,432(%rsp)
	movq    %r9,440(%rsp)
	movq    %r10,448(%rsp)
	movq    %r11,456(%rsp)
	movq    %rcx,464(%rsp)	

	// mul
	movq    536(%rsp),%rdx

	mulx    472(%rsp),%r8,%r9
	mulx    480(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    488(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    496(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    544(%rsp),%rdx    

	mulx    472(%rsp),%rax,%rbx
	mulx    480(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    488(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    496(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    552(%rsp),%rdx

	mulx    472(%rsp),%rax,%rbx
	mulx    480(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    488(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    496(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    560(%rsp),%rdx

	mulx    472(%rsp),%rax,%rbx
	mulx    480(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    488(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    496(%rsp),%rcx,%r15
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

	// add
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%rax
	movq 	%rcx,%rbx	

	addq 	432(%rsp),%r8
	adcq 	440(%rsp),%r9
	adcq 	448(%rsp),%r10
	adcq 	456(%rsp),%r11
	adcq 	464(%rsp),%rcx
	
	shld    $1,%r11,%rcx
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq   %r8,64(%rdi)
	movq   %r9,72(%rdi)
	movq   %r10,80(%rdi)
	movq   %r11,88(%rdi)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
		
	subq 	432(%rsp),%r12
	sbbq 	440(%rsp),%r13
	sbbq 	448(%rsp),%r14
	sbbq 	456(%rsp),%rax
	sbbq 	464(%rsp),%rbx
	
	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax	

	movq   %r12,0(%rdi)
	movq   %r13,8(%rdi)
	movq   %r14,16(%rdi)
	movq   %rax,24(%rdi)

	// mul	
	movq    600(%rsp),%rdx

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    408(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    416(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    608(%rsp),%rdx    

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    616(%rsp),%rdx

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    624(%rsp),%rdx

	mulx    392(%rsp),%rax,%rbx
	mulx    400(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    408(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    416(%rsp),%rcx,%r15
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

	movq    %r8,432(%rsp)
	movq    %r9,440(%rsp)
	movq    %r10,448(%rsp)
	movq    %r11,456(%rsp)	
	movq    %rcx,464(%rsp)		

	// mul	
	movq    568(%rsp),%rdx

	mulx    352(%rsp),%r8,%r9
	mulx    360(%rsp),%rcx,%r10
	addq    %rcx,%r9

	mulx    368(%rsp),%rcx,%r11
	adcq    %rcx,%r10

	mulx    376(%rsp),%rcx,%r12
	adcq    %rcx,%r11
	adcq    $0,%r12

	movq    576(%rsp),%rdx    

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    368(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    376(%rsp),%rcx,%r13
	adcq    %rcx,%rsi
	adcq    $0,%r13

	addq    %rax,%r9
	adcq    %rbx,%r10
	adcq    %rbp,%r11
	adcq    %rsi,%r12
	adcq    $0,%r13

	movq    584(%rsp),%rdx

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    368(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    376(%rsp),%rcx,%r14
	adcq    %rcx,%rsi
	adcq    $0,%r14

	addq    %rax,%r10
	adcq    %rbx,%r11
	adcq    %rbp,%r12
	adcq    %rsi,%r13
	adcq    $0,%r14

	movq    592(%rsp),%rdx

	mulx    352(%rsp),%rax,%rbx
	mulx    360(%rsp),%rcx,%rbp
	addq    %rcx,%rbx

	mulx    368(%rsp),%rcx,%rsi
	adcq    %rcx,%rbp

	mulx    376(%rsp),%rcx,%r15
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

	// double
	addq 	%r8,%r8
	adcq 	%r9,%r9
	adcq 	%r10,%r10
	adcq 	%r11,%r11
	adcq 	%rcx,%rcx	
	
	// add
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%rax
	movq 	%rcx,%rbx	

	addq 	432(%rsp),%r8
	adcq 	440(%rsp),%r9
	adcq 	448(%rsp),%r10
	adcq 	456(%rsp),%r11
	adcq 	464(%rsp),%rcx

	shld    $1,%r11,%rcx
	andq    mask63(%rip),%r11

	imul    $19,%rcx,%rcx
	addq    %rcx,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq   %r8,32(%rdi)
	movq   %r9,40(%rdi)
	movq   %r10,48(%rdi)
	movq   %r11,56(%rdi)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
	
	subq 	432(%rsp),%r12
	sbbq 	440(%rsp),%r13
	sbbq 	448(%rsp),%r14
	sbbq 	456(%rsp),%rax
	sbbq 	464(%rsp),%rbx	

	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax
		
	movq   %r12,96(%rdi)
	movq   %r13,104(%rdi)
	movq   %r14,112(%rdi)
	movq   %rax,120(%rdi)	
	
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
