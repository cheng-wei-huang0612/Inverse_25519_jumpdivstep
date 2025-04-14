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
	subq  	$224,%rsp 	

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
	
	// convert to 5x4 form
	vmovdqa   64(%rsp),%ymm8
	vmovdqa   96(%rsp),%ymm9
	vmovdqa   96(%rsp),%ymm10
	vmovdqa   64(%rsp),%ymm11

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

	vpand     pmask1(%rip),%ymm10,%ymm5

	vpand     pmask2(%rip),%ymm10,%ymm6
	vpsrlq    $52,%ymm6,%ymm6
	vpand     pmask3(%rip),%ymm11,%ymm7
	vpsllq    $12,%ymm7,%ymm7
	vpor      %ymm7,%ymm6,%ymm6

	vpand     pmask4(%rip),%ymm11,%ymm7
	vpsrlq    $40,%ymm7,%ymm7
	vpand     pmask5(%rip),%ymm12,%ymm8
	vpsllq    $24,%ymm8,%ymm8
	vpor      %ymm8,%ymm7,%ymm7

	vpand     pmask6(%rip),%ymm12,%ymm8
	vpsrlq    $28,%ymm8,%ymm8
	vpand     pmask7(%rip),%ymm13,%ymm9
	vpsllq    $36,%ymm9,%ymm9
	vpor      %ymm9,%ymm8,%ymm8

	vpand     pmask8(%rip),%ymm13,%ymm9
	vpsrlq    $16,%ymm9,%ymm9

	// convert to 5x4 form
	vmovdqa   160(%rsp),%ymm0
	vmovdqa   128(%rsp),%ymm1
	vmovdqa   160(%rsp),%ymm2
	vmovdqa   128(%rsp),%ymm3

	vpunpcklqdq    %ymm1,%ymm0,%ymm12
	vpunpckhqdq    %ymm1,%ymm0,%ymm13
	vpunpcklqdq    %ymm3,%ymm2,%ymm14
	vpunpckhqdq    %ymm3,%ymm2,%ymm15

	vpermq    $68,%ymm14,%ymm0
	vpblendd  $240,%ymm0,%ymm12,%ymm10
	vpermq    $68,%ymm15,%ymm0
	vpblendd  $240,%ymm0,%ymm13,%ymm11
	vpermq    $238,%ymm12,%ymm0
	vpblendd  $240,%ymm14,%ymm0,%ymm12
	vpermq    $238,%ymm13,%ymm0
	vpblendd  $240,%ymm15,%ymm0,%ymm13

	vpand     pmask1(%rip),%ymm10,%ymm0

	vpand     pmask2(%rip),%ymm10,%ymm1
	vpsrlq    $52,%ymm1,%ymm1
	vpand     pmask3(%rip),%ymm11,%ymm2
	vpsllq    $12,%ymm2,%ymm2
	vpor      %ymm2,%ymm1,%ymm1

	vpand     pmask4(%rip),%ymm11,%ymm2
	vpsrlq    $40,%ymm2,%ymm2
	vpand     pmask5(%rip),%ymm12,%ymm3
	vpsllq    $24,%ymm3,%ymm3
	vpor      %ymm3,%ymm2,%ymm2

	vpand     pmask6(%rip),%ymm12,%ymm3
	vpsrlq    $28,%ymm3,%ymm3
	vpand     pmask7(%rip),%ymm13,%ymm4
	vpsllq    $36,%ymm4,%ymm4
	vpor      %ymm4,%ymm3,%ymm3

	vpand     pmask8(%rip),%ymm13,%ymm4
	vpsrlq    $16,%ymm4,%ymm4

	// mul4x1
	vpxorq    %ymm10,%ymm10,%ymm10
	vpxorq    %ymm11,%ymm11,%ymm11
	vpxorq    %ymm12,%ymm12,%ymm12
	vpxorq    %ymm13,%ymm13,%ymm13
	vpxorq    %ymm14,%ymm14,%ymm14
	vpxorq    %ymm15,%ymm15,%ymm15
	vpxorq    %ymm16,%ymm16,%ymm16
	vpxorq    %ymm17,%ymm17,%ymm17
	vpxorq    %ymm18,%ymm18,%ymm18
	vpxorq    %ymm19,%ymm19,%ymm19

	vpxorq    %ymm25,%ymm25,%ymm25
	vpxorq    %ymm26,%ymm26,%ymm26
	vpxorq    %ymm27,%ymm27,%ymm27
	vpxorq    %ymm28,%ymm28,%ymm28
	vpxorq    %ymm29,%ymm29,%ymm29
	vpxorq    %ymm30,%ymm30,%ymm30
	vpxorq    %ymm31,%ymm31,%ymm31

	vpmadd52luq  %ymm0,%ymm5,%ymm10
	vpmadd52huq  %ymm0,%ymm5,%ymm11

	vpmadd52luq  %ymm0,%ymm6,%ymm25
	vpmadd52huq  %ymm0,%ymm6,%ymm12
	vpmadd52luq  %ymm1,%ymm5,%ymm25
	vpmadd52huq  %ymm1,%ymm5,%ymm12

	vpaddq    %ymm25,%ymm11,%ymm11

	vpmadd52luq  %ymm0,%ymm7,%ymm26
	vpmadd52huq  %ymm0,%ymm7,%ymm13
	vpmadd52luq  %ymm1,%ymm6,%ymm26
	vpmadd52huq  %ymm1,%ymm6,%ymm13
	vpmadd52luq  %ymm2,%ymm5,%ymm26
	vpmadd52huq  %ymm2,%ymm5,%ymm13

	vpaddq    %ymm26,%ymm12,%ymm12

	vpmadd52luq  %ymm0,%ymm8,%ymm27
	vpmadd52huq  %ymm0,%ymm8,%ymm14
	vpmadd52luq  %ymm1,%ymm7,%ymm27
	vpmadd52huq  %ymm1,%ymm7,%ymm14
	vpmadd52luq  %ymm2,%ymm6,%ymm27
	vpmadd52huq  %ymm2,%ymm6,%ymm14
	vpmadd52luq  %ymm3,%ymm5,%ymm27
	vpmadd52huq  %ymm3,%ymm5,%ymm14

	vpaddq    %ymm27,%ymm13,%ymm13

	vpmadd52luq  %ymm0,%ymm9,%ymm28
	vpmadd52huq  %ymm0,%ymm9,%ymm15
	vpmadd52luq  %ymm1,%ymm8,%ymm28
	vpmadd52huq  %ymm1,%ymm8,%ymm15
	vpmadd52luq  %ymm2,%ymm7,%ymm28
	vpmadd52huq  %ymm2,%ymm7,%ymm15
	vpmadd52luq  %ymm3,%ymm6,%ymm28
	vpmadd52huq  %ymm3,%ymm6,%ymm15
	vpmadd52luq  %ymm4,%ymm5,%ymm28
	vpmadd52huq  %ymm4,%ymm5,%ymm15

	vpaddq    %ymm28,%ymm14,%ymm14

	vpmadd52luq  %ymm1,%ymm9,%ymm29
	vpmadd52huq  %ymm1,%ymm9,%ymm16
	vpmadd52luq  %ymm2,%ymm8,%ymm29
	vpmadd52huq  %ymm2,%ymm8,%ymm16
	vpmadd52luq  %ymm3,%ymm7,%ymm29
	vpmadd52huq  %ymm3,%ymm7,%ymm16
	vpmadd52luq  %ymm4,%ymm6,%ymm29
	vpmadd52huq  %ymm4,%ymm6,%ymm16

	vpaddq    %ymm29,%ymm15,%ymm15

	vpmadd52luq  %ymm2,%ymm9,%ymm30
	vpmadd52huq  %ymm2,%ymm9,%ymm17
	vpmadd52luq  %ymm3,%ymm8,%ymm30
	vpmadd52huq  %ymm3,%ymm8,%ymm17
	vpmadd52luq  %ymm4,%ymm7,%ymm30
	vpmadd52huq  %ymm4,%ymm7,%ymm17

	vpaddq    %ymm30,%ymm16,%ymm16

	vpmadd52luq  %ymm3,%ymm9,%ymm31
	vpmadd52huq  %ymm3,%ymm9,%ymm18
	vpmadd52luq  %ymm4,%ymm8,%ymm31
	vpmadd52huq  %ymm4,%ymm8,%ymm18

	vpaddq    %ymm31,%ymm17,%ymm17

	vpmadd52luq  %ymm4,%ymm9,%ymm18
	vpmadd52huq  %ymm4,%ymm9,%ymm19

	vpsrlq    $52,%ymm15,%ymm22
	vpaddq    %ymm22,%ymm16,%ymm16
	vpandq    vecmask52(%rip),%ymm15,%ymm15
	vpmadd52luq  vec608(%rip),%ymm15,%ymm10
	vpmadd52huq  vec608(%rip),%ymm15,%ymm11

	vpsrlq    $52,%ymm16,%ymm22
	vpaddq    %ymm22,%ymm17,%ymm17
	vpandq    vecmask52(%rip),%ymm16,%ymm16
	vpmadd52luq  vec608(%rip),%ymm16,%ymm11
	vpmadd52huq  vec608(%rip),%ymm16,%ymm12

	vpsrlq    $52,%ymm17,%ymm22
	vpaddq    %ymm22,%ymm18,%ymm18
	vpandq    vecmask52(%rip),%ymm17,%ymm17
	vpmadd52luq  vec608(%rip),%ymm17,%ymm12
	vpmadd52huq  vec608(%rip),%ymm17,%ymm13

	vpsrlq    $52,%ymm18,%ymm22
	vpaddq    %ymm22,%ymm19,%ymm19
	vpandq    vecmask52(%rip),%ymm18,%ymm18
	vpmadd52luq  vec608(%rip),%ymm18,%ymm13
	vpmadd52huq  vec608(%rip),%ymm18,%ymm14

	vpxorq    %ymm15,%ymm15,%ymm15
	vpmadd52luq  vec608(%rip),%ymm19,%ymm14
	vpmadd52huq  vec608(%rip),%ymm19,%ymm15

	vpmadd52luq  vec608(%rip),%ymm15,%ymm10

	vpsrlq    $52,%ymm13,%ymm22
	vpaddq    %ymm22,%ymm14,%ymm14
	vpandq    vecmask52(%rip),%ymm13,%ymm13

	vpsrlq    $47,%ymm14,%ymm22
	vpandq    vecmask47(%rip),%ymm14,%ymm14
	vpmadd52luq  vec19(%rip),%ymm22,%ymm10

	vpsrlq    $52,%ymm10,%ymm22
	vpaddq    %ymm22,%ymm11,%ymm11
	vpandq    vecmask52(%rip),%ymm10,%ymm10

	vpsrlq    $52,%ymm11,%ymm22
	vpaddq    %ymm22,%ymm12,%ymm12
	vpandq    vecmask52(%rip),%ymm11,%ymm11

	vpsrlq    $52,%ymm12,%ymm22
	vpaddq    %ymm22,%ymm13,%ymm13
	vpandq    vecmask52(%rip),%ymm12,%ymm12

	vpsrlq    $52,%ymm13,%ymm22
	vpaddq    %ymm22,%ymm14,%ymm14
	vpandq    vecmask52(%rip),%ymm13,%ymm13

	// get back to 4x4 form
	vpand     upmask1(%rip),%ymm10,%ymm0
	vpand     upmask2(%rip),%ymm11,%ymm1
	vpsllq    $52,%ymm1,%ymm1
	vpor      %ymm1,%ymm0,%ymm0

	vpand     upmask3(%rip),%ymm11,%ymm1
	vpsrlq    $12,%ymm1,%ymm1
	vpand     upmask4(%rip),%ymm12,%ymm2
	vpsllq    $40,%ymm2,%ymm2
	vpor      %ymm2,%ymm1,%ymm1

	vpand     upmask5(%rip),%ymm12,%ymm2
	vpsrlq    $24,%ymm2,%ymm2
	vpand     upmask6(%rip),%ymm13,%ymm3
	vpsllq    $28,%ymm3,%ymm3
	vpor      %ymm3,%ymm2,%ymm2

	vpand     upmask7(%rip),%ymm13,%ymm3
	vpsrlq    $36,%ymm3,%ymm3
	vpand     upmask1(%rip),%ymm14,%ymm4
	vpsllq    $16,%ymm4,%ymm4
	vpor      %ymm4,%ymm3,%ymm3

	vpunpcklqdq    %ymm1,%ymm0,%ymm12
	vpunpckhqdq    %ymm1,%ymm0,%ymm13
	vpunpcklqdq    %ymm3,%ymm2,%ymm14
	vpunpckhqdq    %ymm3,%ymm2,%ymm15

	vpermq    $68,%ymm14,%ymm7
	vpblendd  $240,%ymm7,%ymm12,%ymm0
	vpermq    $68,%ymm15,%ymm7
	vpblendd  $240,%ymm7,%ymm13,%ymm1
	vpermq    $238,%ymm12,%ymm7
	vpblendd  $240,%ymm14,%ymm7,%ymm2
	vpermq    $238,%ymm13,%ymm7
	vpblendd  $240,%ymm15,%ymm7,%ymm3

	vmovdqa   %ymm0,0(%rdi)
	vmovdqa   %ymm1,32(%rdi)
	vmovdqa   %ymm2,64(%rdi)
	vmovdqa   %ymm3,96(%rdi)	

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
