#include "crypto_asm_hidden.h"
// linker define ge25519_multi_scalarmult_precompute
// linker use EC2D0 EC2D1 EC2D2 EC2D3 mask63
// linker use twoexp8_p0
// linker use twoexp8_p123
// linker use twoexp8_p4

/* Assembly for the precomputaion phase used in multi-scalar multiplication. */

#define EC2D0 CRYPTO_SHARED_NAMESPACE(EC2D0)
#define EC2D1 CRYPTO_SHARED_NAMESPACE(EC2D1)
#define EC2D2 CRYPTO_SHARED_NAMESPACE(EC2D2)
#define EC2D3 CRYPTO_SHARED_NAMESPACE(EC2D3)
#define mask63 CRYPTO_SHARED_NAMESPACE(mask63)
#define twoexp8_p0 CRYPTO_SHARED_NAMESPACE(twoexp8_p0)
#define twoexp8_p123 CRYPTO_SHARED_NAMESPACE(twoexp8_p123)
#define twoexp8_p4 CRYPTO_SHARED_NAMESPACE(twoexp8_p4)

	.p2align 5
	ASM_HIDDEN _CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_precompute)
	.globl _CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_precompute)
	ASM_HIDDEN CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_precompute)
	.globl CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_precompute)
	
_CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_precompute):
CRYPTO_SHARED_NAMESPACE(ge25519_multi_scalarmult_precompute):

	movq	%rsp,%r11
	andq	$-32,%rsp	
	subq  	$432,%rsp

	movq	%r11,0(%rsp)
	movq	%r12,8(%rsp)
	movq	%r13,16(%rsp)
	movq	%r14,24(%rsp)
	movq	%r15,32(%rsp)
	movq	%rbx,40(%rsp)
	movq	%rbp,48(%rsp)
	
	decq	%rdx
	movq	%rdx,56(%rsp)

	movq	0(%rsi),%r8
	movq	8(%rsi),%r9
	movq	16(%rsi),%r10
	movq	24(%rsi),%r11

	movq	%r8,0(%rdi)
	movq	%r9,8(%rdi)
	movq	%r10,16(%rdi)
	movq	%r11,24(%rdi)

	movq	32(%rsi),%r8
	movq	40(%rsi),%r9
	movq	48(%rsi),%r10
	movq	56(%rsi),%r11

	movq	%r8,32(%rdi)
	movq	%r9,40(%rdi)
	movq	%r10,48(%rdi)
	movq	%r11,56(%rdi)

	movq	64(%rsi),%r8
	movq	72(%rsi),%r9
	movq	80(%rsi),%r10
	movq	88(%rsi),%r11

	movq	%r8,64(%rdi)
	movq	%r9,72(%rdi)
	movq	%r10,80(%rdi)
	movq	%r11,88(%rdi)

	movq	96(%rsi),%r8
	movq	104(%rsi),%r9
	movq	112(%rsi),%r10
	movq	120(%rsi),%r11

	movq	%r8,96(%rdi)
	movq	%r9,104(%rdi)
	movq	%r10,112(%rdi)
	movq	%r11,120(%rdi)

	/* dbl p1p1 */

	// square
	xorq    %r13,%r13
	movq    32(%rdi),%rdx
	    
	mulx    40(%rdi),%r9,%r10

	mulx    48(%rdi),%rcx,%r11
	adcx    %rcx,%r10
	    
	mulx    56(%rdi),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	movq    40(%rdi),%rdx
	xorq    %r14,%r14
	    
	mulx    48(%rdi),%rcx,%rdx
	adcx    %rcx,%r11
	adox    %rdx,%r12
	    
	movq    40(%rdi),%rdx
	mulx    56(%rdi),%rcx,%rdx
	adcx    %rcx,%r12
	adox    %rdx,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    48(%rdi),%rdx
	    
	mulx    56(%rdi),%rcx,%r14
	adcx    %rcx,%r13
	adcx    %r15,%r14

	shld    $1,%r14,%r15
	shld    $1,%r13,%r14
	shld    $1,%r12,%r13
	shld    $1,%r11,%r12
	shld    $1,%r10,%r11
	shld    $1,%r9,%r10
	shlq    $1,%r9
	     
	xorq    %rdx,%rdx
	movq    32(%rdi),%rdx
	mulx    %rdx,%r8,%rdx
	adcx    %rdx,%r9

	movq    40(%rdi),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r10
	adcx    %rdx,%r11

	movq    48(%rdi),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r12
	adcx    %rdx,%r13

	movq    56(%rdi),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r14
	adcx    %rdx,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	movq    %r8,104(%rsp)
	movq    %r9,112(%rsp)
	movq    %r10,120(%rsp)
	movq    %r11,128(%rsp)
	movq    %r15,136(%rsp)	

	// square
	xorq    %r13,%r13
	movq    0(%rdi),%rdx
	    
	mulx    8(%rdi),%r9,%r10

	mulx    16(%rdi),%rcx,%r11
	adcx    %rcx,%r10
	    
	mulx    24(%rdi),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	movq    8(%rdi),%rdx
	xorq    %r14,%r14
	    
	mulx    16(%rdi),%rcx,%rdx
	adcx    %rcx,%r11
	adox    %rdx,%r12
	    
	movq    8(%rdi),%rdx
	mulx    24(%rdi),%rcx,%rdx
	adcx    %rcx,%r12
	adox    %rdx,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    16(%rdi),%rdx
	    
	mulx    24(%rdi),%rcx,%r14
	adcx    %rcx,%r13
	adcx    %r15,%r14

	shld    $1,%r14,%r15
	shld    $1,%r13,%r14
	shld    $1,%r12,%r13
	shld    $1,%r11,%r12
	shld    $1,%r10,%r11
	shld    $1,%r9,%r10
	shlq    $1,%r9
	     
	xorq    %rdx,%rdx
	movq    0(%rdi),%rdx
	mulx    %rdx,%r8,%rdx
	adcx    %rdx,%r9

	movq    8(%rdi),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r10
	adcx    %rdx,%r11

	movq    16(%rdi),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r12
	adcx    %rdx,%r13

	movq    24(%rdi),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r14
	adcx    %rdx,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15
	
	movq    %r8,64(%rsp)
	movq    %r9,72(%rsp)
	movq    %r10,80(%rsp)
	movq    %r11,88(%rsp)
	movq    %r15,96(%rsp)		

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
	sbbq    %r15,%rbx
	
	// add
	addq    104(%rsp),%r12
	adcq    112(%rsp),%r13
	adcq    120(%rsp),%r14
	adcq    128(%rsp),%rax
	adcq    136(%rsp),%rbx
	
	movq    %r12,%r8
	movq    %r13,%r9
	movq    %r14,%r10
	movq    %rax,%r11
	movq    %rbx,%r15	
	
	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax	
	
	movq    %r12,296(%rsp)
	movq    %r13,304(%rsp)
	movq    %r14,312(%rsp)
	movq    %rax,320(%rsp)
	
	// sub
	subq    $2,%r8
	sbbq    $0,%r9
	sbbq    $0,%r10
	sbbq    $0,%r11
	sbbq    $0,%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq    %r8,360(%rsp)
	movq    %r9,368(%rsp)
	movq    %r10,376(%rsp)
	movq    %r11,384(%rsp)				

	// neg
	movq    twoexp8_p0(%rip),%r12
	movq    twoexp8_p123(%rip),%r13
	movq    twoexp8_p123(%rip),%r14
	movq    twoexp8_p123(%rip),%r15
	movq    twoexp8_p4(%rip),%rbx	

	subq    104(%rsp),%r12
	sbbq    112(%rsp),%r13
	sbbq    120(%rsp),%r14
	sbbq    128(%rsp),%r15
	sbbq    136(%rsp),%rbx
	
	// sub
	subq    64(%rsp),%r12
	sbbq    72(%rsp),%r13
	sbbq    80(%rsp),%r14
	sbbq    88(%rsp),%r15
	sbbq    96(%rsp),%rbx
	
	shld    $1,%r15,%rbx
	andq    mask63(%rip),%r15

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%r15			

	movq    %r12,328(%rsp)
	movq    %r13,336(%rsp)
	movq    %r14,344(%rsp)
	movq    %r15,352(%rsp)

	movq	0(%rdi),%r8
	movq	8(%rdi),%r9
	movq	16(%rdi),%r10
	movq	24(%rdi),%r11	
	
	// add
	addq	32(%rdi),%r8
	adcq	40(%rdi),%r9
	adcq	48(%rdi),%r10
	adcq	56(%rdi),%r11
	
	movq    $0,%rdx
	movq    $38,%rax
	cmovae  %rdx,%rax
	
	addq    %rax,%r8
	adcq    %rdx,%r9
	adcq    %rdx,%r10
	adcq    %rdx,%r11
	
	cmovc   %rax,%rdx
	addq    %rdx,%r8

	movq    %r8,104(%rsp)
	movq    %r9,112(%rsp)
	movq    %r10,120(%rsp)
	movq    %r11,128(%rsp)

	// square
	xorq    %r13,%r13
	movq    104(%rsp),%rdx
	    
	mulx    112(%rsp),%r9,%r10

	mulx    120(%rsp),%rcx,%r11
	adcx    %rcx,%r10
	    
	mulx    128(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	movq    112(%rsp),%rdx
	xorq    %r14,%r14
	    
	mulx    120(%rsp),%rcx,%rdx
	adcx    %rcx,%r11
	adox    %rdx,%r12
	    
	movq    112(%rsp),%rdx
	mulx    128(%rsp),%rcx,%rdx
	adcx    %rcx,%r12
	adox    %rdx,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    120(%rsp),%rdx
	    
	mulx    128(%rsp),%rcx,%r14
	adcx    %rcx,%r13
	adcx    %r15,%r14

	shld    $1,%r14,%r15
	shld    $1,%r13,%r14
	shld    $1,%r12,%r13
	shld    $1,%r11,%r12
	shld    $1,%r10,%r11
	shld    $1,%r9,%r10
	shlq    $1,%r9
	     
	xorq    %rdx,%rdx
	movq    104(%rsp),%rdx
	mulx    %rdx,%r8,%rdx
	adcx    %rdx,%r9

	movq    112(%rsp),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r10
	adcx    %rdx,%r11

	movq    120(%rsp),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r12
	adcx    %rdx,%r13

	movq    128(%rsp),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r14
	adcx    %rdx,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	// add
	addq    328(%rsp),%r8
	adcq    336(%rsp),%r9
	adcq    344(%rsp),%r10
	adcq    352(%rsp),%r11
	adcq    $0,%r15	
	
	shld    $1,%r11,%r15
	andq	mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq    %r8,264(%rsp)
	movq    %r9,272(%rsp)
	movq    %r10,280(%rsp)
	movq    %r11,288(%rsp)
	
	/* p1p1 to p3 */

	// mul
	xorq    %r13,%r13
	movq    264(%rsp),%rdx    

	mulx    360(%rsp),%r8,%r9
	mulx    368(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    376(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    384(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    272(%rsp),%rdx
	   
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    280(%rsp),%rdx
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    288(%rsp),%rdx
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	movq    %r8,64(%rsp)
	movq    %r9,72(%rsp)
	movq    %r10,80(%rsp)
	movq    %r11,88(%rsp)
	movq    %r15,96(%rsp)

	// mul
	xorq    %r13,%r13
	movq    296(%rsp),%rdx    

	mulx    328(%rsp),%r8,%r9
	mulx    336(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    344(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    352(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    304(%rsp),%rdx
	   
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    312(%rsp),%rdx
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    320(%rsp),%rdx
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	movq    %r8,104(%rsp)
	movq    %r9,112(%rsp)
	movq    %r10,120(%rsp)
	movq    %r11,128(%rsp)
	movq    %r15,136(%rsp)	

	// mul
	xorq    %r13,%r13
	movq    296(%rsp),%rdx    

	mulx    360(%rsp),%r8,%r9
	mulx    368(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    376(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    384(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    304(%rsp),%rdx
	   
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    312(%rsp),%rdx
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    320(%rsp),%rdx
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,144(%rsp)
	movq    %r9,152(%rsp)
	movq    %r10,160(%rsp)
	movq    %r11,168(%rsp)

	// mul
	xorq    %r13,%r13
	movq    264(%rsp),%rdx    

	mulx    328(%rsp),%r8,%r9
	mulx    336(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    344(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    352(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    272(%rsp),%rdx
	   
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    280(%rsp),%rdx
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    288(%rsp),%rdx
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,184(%rsp)
	movq    %r9,192(%rsp)
	movq    %r10,200(%rsp)
	movq    %r11,208(%rsp)
	
	movq	$0,424(%rsp)
	
.L:	
	/* add p1p1 */
	
	movq	104(%rsp),%r8
	movq	112(%rsp),%r9
	movq	120(%rsp),%r10
	movq	128(%rsp),%r11
	movq	136(%rsp),%rax	
	
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
	
	subq 	64(%rsp),%r8
	sbbq 	72(%rsp),%r9
	sbbq 	80(%rsp),%r10
	sbbq 	88(%rsp),%r11
	sbbq 	96(%rsp),%rax	

	shld    $1,%r11,%rax
	andq    mask63(%rip),%r11

	imul    $19,%rax,%rax
	addq    %rax,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq   %r8,216(%rsp)
	movq   %r9,224(%rsp)
	movq   %r10,232(%rsp)
	movq   %r11,240(%rsp)
	
	// add
	addq 	64(%rsp),%r12
	adcq 	72(%rsp),%r13
	adcq 	80(%rsp),%r14
	adcq 	88(%rsp),%r15
	adcq 	96(%rsp),%rbx	

	shld    $1,%r15,%rbx
	andq    mask63(%rip),%r15

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%r15	
	
	movq   %r12,256(%rsp)
	movq   %r13,264(%rsp)
	movq   %r14,272(%rsp)
	movq   %r15,280(%rsp)
	
	movq    32(%rdi),%rdx
	movq    40(%rdi),%r8
	movq    48(%rdi),%r9
	movq    56(%rdi),%rax

	movq  	%rdx,%r10
	movq  	%r8,%r11
	movq  	%r9,%r12
	movq  	%rax,%r13

	// sub
	subq 	0(%rdi),%rdx
	sbbq 	8(%rdi),%r8
	sbbq 	16(%rdi),%r9
	sbbq 	24(%rdi),%rax

	movq  	$0,%r14
	movq  	$38,%r15
	cmovae  %r14,%r15

	subq 	%r15,%rdx
	sbbq  	%r14,%r8
	sbbq  	%r14,%r9
	sbbq  	%r14,%rax

	cmovc 	%r15,%r14
	subq 	%r14,%rdx
	
	movq 	%rdx,288(%rsp)
	movq 	%r8,296(%rsp)
	movq 	%r9,304(%rsp)
	movq 	%rax,312(%rsp)	

	// add
	addq 	0(%rdi),%r10
	adcq 	8(%rdi),%r11
	adcq 	16(%rdi),%r12
	adcq 	24(%rdi),%r13

	movq 	$0,%r14
	movq 	$38,%r15
	cmovae  %r14,%r15

	addq 	%r15,%r10
	adcq	%r14,%r11
	adcq	%r14,%r12
	adcq	%r14,%r13

	cmovc 	%r15,%r14
	addq 	%r14,%r10

	movq 	%r10,320(%rsp)
	movq 	%r11,328(%rsp)
	movq 	%r12,336(%rsp)
	movq 	%r13,344(%rsp)	
	
	// mul
	xorq    %r13,%r13
	movq    216(%rsp),%rdx    

	mulx    288(%rsp),%r8,%r9
	mulx    296(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    304(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    312(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    224(%rsp),%rdx
	   
	mulx    288(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    296(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    304(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    312(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    232(%rsp),%rdx
	    
	mulx    288(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    296(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    304(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    312(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    240(%rsp),%rdx
	    
	mulx    288(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    296(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    304(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    312(%rsp),%rbx,%rbp
	adcx    %rbx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rbx,%r13
	adcx    %rbx,%r9
	adox    %r13,%r10

	mulx    %r14,%rbx,%r14
	adcx    %rbx,%r10
	adox    %r14,%r11

	mulx    %r15,%rbx,%r15
	adcx    %rbx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	movq 	%r8,216(%rsp)
	movq 	%r9,224(%rsp)
	movq 	%r10,232(%rsp)
	movq 	%r11,240(%rsp)
	movq 	%r15,248(%rsp)	

	// mul
	xorq    %r13,%r13
	movq    256(%rsp),%rdx    

	mulx    320(%rsp),%r8,%r9
	mulx    328(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    336(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    344(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    264(%rsp),%rdx
	   
	mulx    320(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    328(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    336(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    344(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    272(%rsp),%rdx
	    
	mulx    320(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    328(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    336(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    344(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    280(%rsp),%rdx
	    
	mulx    320(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    328(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    336(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    344(%rsp),%rbx,%rbp
	adcx    %rbx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rbx,%r13
	adcx    %rbx,%r9
	adox    %r13,%r10

	mulx    %r14,%rbx,%r14
	adcx    %rbx,%r10
	adox    %r14,%r11

	mulx    %r15,%rbx,%r15
	adcx    %rbx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	// copy
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%rax
	movq 	%r15,%rbx	

	// add
	addq 	216(%rsp),%r8
	adcq 	224(%rsp),%r9
	adcq 	232(%rsp),%r10
	adcq 	240(%rsp),%r11
	adcq 	248(%rsp),%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq    %r8,320(%rsp)
	movq    %r9,328(%rsp)
	movq    %r10,336(%rsp)
	movq    %r11,344(%rsp)	
	
	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx	
	
	subq 	216(%rsp),%r12
	sbbq 	224(%rsp),%r13
	sbbq 	232(%rsp),%r14
	sbbq 	240(%rsp),%rax
	sbbq 	248(%rsp),%rbx
	
	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax

	movq    %r12,256(%rsp)
	movq    %r13,264(%rsp)
	movq    %r14,272(%rsp)
	movq    %rax,280(%rsp)	
	
	// mul
	xorq    %r13,%r13
	movq    184(%rsp),%rdx    

	mulx    96(%rdi),%r8,%r9
	mulx    104(%rdi),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    112(%rdi),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    120(%rdi),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    192(%rsp),%rdx
	   
	mulx    96(%rdi),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    104(%rdi),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    112(%rdi),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    120(%rdi),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    200(%rsp),%rdx
	    
	mulx    96(%rdi),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    104(%rdi),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    112(%rdi),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    120(%rdi),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    208(%rsp),%rdx
	    
	mulx    96(%rdi),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    104(%rdi),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    112(%rdi),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    120(%rdi),%rbx,%rbp
	adcx    %rbx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rbx,%r13
	adcx    %rbx,%r9
	adox    %r13,%r10

	mulx    %r14,%rbx,%r14
	adcx    %rbx,%r10
	adox    %r14,%r11

	mulx    %r15,%rbx,%r15
	adcx    %rbx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15
	
	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq 	%r8,384(%rsp)
	movq 	%r9,392(%rsp)
	movq 	%r10,400(%rsp)
	movq 	%r11,408(%rsp)

	// mul
	xorq    %r13,%r13
	movq    EC2D0(%rip),%rdx    

	mulx    384(%rsp),%r8,%r9
	mulx    392(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    400(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    408(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    EC2D1(%rip),%rdx
	   
	mulx    384(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    EC2D2(%rip),%rdx
	    
	mulx    384(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    EC2D3(%rip),%rdx
	    
	mulx    384(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rbx,%r13
	adcx    %rbx,%r9
	adox    %r13,%r10

	mulx    %r14,%rbx,%r14
	adcx    %rbx,%r10
	adox    %r14,%r11

	mulx    %r15,%rbx,%r15
	adcx    %rbx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	movq 	%r8,384(%rsp)
	movq 	%r9,392(%rsp)
	movq 	%r10,400(%rsp)
	movq 	%r11,408(%rsp)
	movq 	%r15,416(%rsp)

	// mul
	xorq    %r13,%r13
	movq    144(%rsp),%rdx    

	mulx    64(%rdi),%r8,%r9
	mulx    72(%rdi),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    80(%rdi),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    88(%rdi),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    152(%rsp),%rdx
	   
	mulx    64(%rdi),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    72(%rdi),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    80(%rdi),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    88(%rdi),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    160(%rsp),%rdx
	    
	mulx    64(%rdi),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    72(%rdi),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    80(%rdi),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    88(%rdi),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    168(%rsp),%rdx
	    
	mulx    64(%rdi),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    72(%rdi),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    80(%rdi),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    88(%rdi),%rbx,%rbp
	adcx    %rbx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rbx,%r13
	adcx    %rbx,%r9
	adox    %r13,%r10

	mulx    %r14,%rbx,%r14
	adcx    %rbx,%r10
	adox    %r14,%r11

	mulx    %r15,%rbx,%r15
	adcx    %rbx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	// double
	addq    %r8,%r8
	adcq 	%r9,%r9
	adcq	%r10,%r10
	adcq 	%r11,%r11
	adcq 	%r15,%r15	

	// copy
	movq 	%r8,%r12
	movq 	%r9,%r13
	movq 	%r10,%r14
	movq 	%r11,%rax
	movq 	%r15,%rbx	

	// add
	addq 	384(%rsp),%r8
	adcq 	392(%rsp),%r9
	adcq 	400(%rsp),%r10
	adcq 	408(%rsp),%r11
	adcq 	416(%rsp),%r15	

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq    %r8,288(%rsp)
	movq    %r9,296(%rsp)
	movq    %r10,304(%rsp)
	movq    %r11,312(%rsp)		
	
	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
	
	subq 	384(%rsp),%r12
	sbbq 	392(%rsp),%r13
	sbbq 	400(%rsp),%r14
	sbbq 	408(%rsp),%rax
	sbbq 	416(%rsp),%rbx	

	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax

	movq    %r12,352(%rsp)
	movq    %r13,360(%rsp)
	movq    %r14,368(%rsp)
	movq    %rax,376(%rsp)	
	
	/* p1p1 to p3 */

	// mul
	xorq    %r13,%r13
	movq    256(%rsp),%rdx    

	mulx    352(%rsp),%r8,%r9
	mulx    360(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    368(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    376(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    264(%rsp),%rdx
	   
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    272(%rsp),%rdx
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    280(%rsp),%rdx
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,128(%rdi)
	movq    %r9,136(%rdi)
	movq    %r10,144(%rdi)
	movq    %r11,152(%rdi)

	// mul
	xorq    %r13,%r13
	movq    288(%rsp),%rdx    

	mulx    320(%rsp),%r8,%r9
	mulx    328(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    336(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    344(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    296(%rsp),%rdx
	   
	mulx    320(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    304(%rsp),%rdx
	    
	mulx    320(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    312(%rsp),%rdx
	    
	mulx    320(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,160(%rdi)
	movq    %r9,168(%rdi)
	movq    %r10,176(%rdi)
	movq    %r11,184(%rdi)
	
	// mul
	xorq    %r13,%r13
	movq    288(%rsp),%rdx    

	mulx    352(%rsp),%r8,%r9
	mulx    360(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    368(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    376(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    296(%rsp),%rdx
	   
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    304(%rsp),%rdx
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    312(%rsp),%rdx
	    
	mulx    352(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    360(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    368(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    376(%rsp),%rcx,%rbp
	adcx    %rcx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,192(%rdi)
	movq    %r9,200(%rdi)
	movq    %r10,208(%rdi)
	movq    %r11,216(%rdi)
	
	// mul
	xorq    %r13,%r13
	movq    256(%rsp),%rdx    

	mulx    320(%rsp),%r8,%r9
	mulx    328(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    336(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    344(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    264(%rsp),%rdx
	   
	mulx    320(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    272(%rsp),%rdx
	    
	mulx    320(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    280(%rsp),%rdx
	    
	mulx    320(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    328(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    336(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    344(%rsp),%rcx,%rbp
	adcx    %rcx,%r14
	adox    %rbp,%r15			
	adcx    %rax,%r15

	xorq    %rbp,%rbp
	movq    $38,%rdx

	mulx    %r12,%rax,%r12 
	adcx    %rax,%r8
	adox    %r12,%r9

	mulx    %r13,%rcx,%r13
	adcx    %rcx,%r9
	adox    %r13,%r10

	mulx    %r14,%rcx,%r14
	adcx    %rcx,%r10
	adox    %r14,%r11

	mulx    %r15,%rcx,%r15
	adcx    %rcx,%r11
	adox    %rbp,%r15
	adcx    %rbp,%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11

	movq    %r8,224(%rdi)
	movq    %r9,232(%rdi)
	movq    %r10,240(%rdi)
	movq    %r11,248(%rdi)
	
	addq	$128,%rdi
	
	movq	424(%rsp),%r8
	incq	%r8	
	movq	%r8,424(%rsp)	

	cmpq	56(%rsp),%r8	
	jl	.L

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
