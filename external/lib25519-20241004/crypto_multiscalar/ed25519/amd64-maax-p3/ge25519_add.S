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
	subq  	$216,%rsp 	

	movq	%r11,0(%rsp)
	movq	%r12,8(%rsp)
	movq	%r13,16(%rsp)
	movq	%r14,24(%rsp)
	movq	%r15,32(%rsp)
	movq	%rbx,40(%rsp)
	movq	%rbp,48(%rsp)

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
	xorq    %r13,%r13
	movq    56(%rsp),%rdx    

	mulx    120(%rsp),%r8,%r9
	mulx    128(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    136(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    144(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    64(%rsp),%rdx
	   
	mulx    120(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    128(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    136(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    144(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    72(%rsp),%rdx
	    
	mulx    120(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    128(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    136(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    144(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    80(%rsp),%rdx
	    
	mulx    120(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    128(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    136(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    144(%rsp),%rbx,%rbp
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

	// store
	movq 	%r8,56(%rsp)
	movq 	%r9,64(%rsp)
	movq 	%r10,72(%rsp)
	movq 	%r11,80(%rsp)

	// mul
	xorq    %r13,%r13
	movq    88(%rsp),%rdx    

	mulx    152(%rsp),%r8,%r9
	mulx    160(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    168(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    176(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    96(%rsp),%rdx
	   
	mulx    152(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    160(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    168(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    176(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    104(%rsp),%rdx
	    
	mulx    152(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    160(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    168(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    176(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    112(%rsp),%rdx
	    
	mulx    152(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    160(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    168(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    176(%rsp),%rbx,%rbp
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
	xorq    %r13,%r13
	movq    96(%rsi),%rdx    

	mulx    96(%rcx),%r8,%r9
	mulx    104(%rcx),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    112(%rcx),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    120(%rcx),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    104(%rsi),%rdx
	   
	mulx    96(%rcx),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    104(%rcx),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    112(%rcx),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    120(%rcx),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    112(%rsi),%rdx
	    
	mulx    96(%rcx),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    104(%rcx),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    112(%rcx),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    120(%rcx),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    120(%rsi),%rdx
	    
	mulx    96(%rcx),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    104(%rcx),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    112(%rcx),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    120(%rcx),%rbx,%rbp
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

	// store
	movq 	%r8,184(%rsp)
	movq 	%r9,192(%rsp)
	movq 	%r10,200(%rsp)
	movq 	%r11,208(%rsp)

	// mul
	xorq    %r13,%r13
	movq    EC2D0(%rip),%rdx    

	mulx    184(%rsp),%r8,%r9
	mulx    192(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    200(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    208(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    EC2D1(%rip),%rdx
	   
	mulx    184(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    192(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    200(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    208(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    EC2D2(%rip),%rdx
	    
	mulx    184(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    192(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    200(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    208(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    EC2D3(%rip),%rdx
	    
	mulx    184(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    192(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    200(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    208(%rsp),%rbx,%rbp
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

	// store
	movq 	%r8,184(%rsp)
	movq 	%r9,192(%rsp)
	movq 	%r10,200(%rsp)
	movq 	%r11,208(%rsp)

	// mul
	xorq    %r13,%r13
	movq    64(%rsi),%rdx    

	mulx    64(%rcx),%r8,%r9
	mulx    72(%rcx),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    80(%rcx),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    88(%rcx),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    72(%rsi),%rdx
	   
	mulx    64(%rcx),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    72(%rcx),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    80(%rcx),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    88(%rcx),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    80(%rsi),%rdx
	    
	mulx    64(%rcx),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    72(%rcx),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    80(%rcx),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    88(%rcx),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    88(%rsi),%rdx
	    
	mulx    64(%rcx),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    72(%rcx),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    80(%rcx),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    88(%rcx),%rbx,%rbp
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
	xorq    %r13,%r13
	movq    64(%rsp),%rdx    

	mulx    160(%rsp),%r8,%r9
	mulx    168(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    176(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    184(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    72(%rsp),%rdx
	   
	mulx    160(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    168(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    176(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    184(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    80(%rsp),%rdx
	    
	mulx    160(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    168(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    176(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    184(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    88(%rsp),%rdx
	    
	mulx    160(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    168(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    176(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    184(%rsp),%rbx,%rbp
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

	movq    %r8,0(%rdi)
	movq    %r9,8(%rdi)
	movq    %r10,16(%rdi)
	movq    %r11,24(%rdi)

	// mul
	xorq    %r13,%r13
	movq    96(%rsp),%rdx    

	mulx    128(%rsp),%r8,%r9
	mulx    136(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    144(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    152(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    104(%rsp),%rdx
	   
	mulx    128(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    136(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    144(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    152(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    112(%rsp),%rdx
	    
	mulx    128(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    136(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    144(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    152(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    120(%rsp),%rdx
	    
	mulx    128(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    136(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    144(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    152(%rsp),%rbx,%rbp
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

	movq    %r8,32(%rdi)
	movq    %r9,40(%rdi)
	movq    %r10,48(%rdi)
	movq    %r11,56(%rdi)

	// mul
	xorq    %r13,%r13
	movq    96(%rsp),%rdx    

	mulx    160(%rsp),%r8,%r9
	mulx    168(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    176(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    184(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    104(%rsp),%rdx
	   
	mulx    160(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    168(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    176(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    184(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    112(%rsp),%rdx
	    
	mulx    160(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    168(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    176(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    184(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    120(%rsp),%rdx
	    
	mulx    160(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    168(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    176(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    184(%rsp),%rbx,%rbp
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

	movq    %r8,64(%rdi)
	movq    %r9,72(%rdi)
	movq    %r10,80(%rdi)
	movq    %r11,88(%rdi)

	// mul
	xorq    %r13,%r13
	movq    64(%rsp),%rdx    

	mulx    128(%rsp),%r8,%r9
	mulx    136(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    144(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    152(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    72(%rsp),%rdx
	   
	mulx    128(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    136(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    144(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    152(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    80(%rsp),%rdx
	    
	mulx    128(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    136(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    144(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    152(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    88(%rsp),%rdx
	    
	mulx    128(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    136(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    144(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    152(%rsp),%rbx,%rbp
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
