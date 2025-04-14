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
	subq  	$528,%rsp 

	movq	%r11,0(%rsp)
	movq	%r12,8(%rsp)
	movq	%r13,16(%rsp)
	movq	%r14,24(%rsp)
	movq	%r15,32(%rsp)
	movq	%rbx,40(%rsp)
	movq	%rbp,48(%rsp)
	
	movq	$0,%rax
	movq	$1,%rbx

	// p3 to 0	
	movq	%rax,144(%rsp)
	movq	%rax,152(%rsp)
	movq	%rax,160(%rsp)
	movq	%rax,168(%rsp)
	
	movq	%rbx,184(%rsp)
	movq	%rax,192(%rsp)
	movq	%rax,200(%rsp)
	movq	%rax,208(%rsp)
	
	movq	%rbx,224(%rsp)
	movq	%rax,232(%rsp)
	movq	%rax,240(%rsp)
	movq	%rax,248(%rsp)	

	movq	%rax,256(%rsp)
	movq	%rax,264(%rsp)
	movq	%rax,272(%rsp)
	movq	%rax,280(%rsp)
	
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
	
	/* dbl p1p1 */
	
	// square
	xorq    %r13,%r13
	movq    224(%rsp),%rdx
	    
	mulx    232(%rsp),%r9,%r10

	mulx    240(%rsp),%rcx,%r11
	adcx    %rcx,%r10
	    
	mulx    248(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	movq    232(%rsp),%rdx
	xorq    %r14,%r14
	    
	mulx    240(%rsp),%rcx,%rdx
	adcx    %rcx,%r11
	adox    %rdx,%r12
	    
	movq    232(%rsp),%rdx
	mulx    248(%rsp),%rcx,%rdx
	adcx    %rcx,%r12
	adox    %rdx,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    240(%rsp),%rdx
	    
	mulx    248(%rsp),%rcx,%r14
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
	movq    224(%rsp),%rdx
	mulx    %rdx,%r8,%rdx
	adcx    %rdx,%r9

	movq    232(%rsp),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r10
	adcx    %rdx,%r11

	movq    240(%rsp),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r12
	adcx    %rdx,%r13

	movq    248(%rsp),%rdx
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
	
	// double
	addq    %r8,%r8
	adcq 	%r9,%r9
	adcq	%r10,%r10
	adcq 	%r11,%r11
	adcq 	%r15,%r15
	
	movq    %r8,496(%rsp)
	movq    %r9,504(%rsp)
	movq    %r10,512(%rsp)
	movq    %r11,520(%rsp)
	movq    %r15,528(%rsp)
	
	// square
	xorq    %r13,%r13
	movq    184(%rsp),%rdx
	    
	mulx    192(%rsp),%r9,%r10

	mulx    200(%rsp),%rcx,%r11
	adcx    %rcx,%r10
	    
	mulx    208(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	movq    192(%rsp),%rdx
	xorq    %r14,%r14
	    
	mulx    200(%rsp),%rcx,%rdx
	adcx    %rcx,%r11
	adox    %rdx,%r12
	    
	movq    192(%rsp),%rdx
	mulx    208(%rsp),%rcx,%rdx
	adcx    %rcx,%r12
	adox    %rdx,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    200(%rsp),%rdx
	    
	mulx    208(%rsp),%rcx,%r14
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
	movq    184(%rsp),%rdx
	mulx    %rdx,%r8,%rdx
	adcx    %rdx,%r9

	movq    192(%rsp),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r10
	adcx    %rdx,%r11

	movq    200(%rsp),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r12
	adcx    %rdx,%r13

	movq    208(%rsp),%rdx
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

	movq    %r8,456(%rsp)
	movq    %r9,464(%rsp)
	movq    %r10,472(%rsp)
	movq    %r11,480(%rsp)
	movq    %r15,488(%rsp)
	
	// square
	xorq    %r13,%r13
	movq    144(%rsp),%rdx
	    
	mulx    152(%rsp),%r9,%r10

	mulx    160(%rsp),%rcx,%r11
	adcx    %rcx,%r10
	    
	mulx    168(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	movq    152(%rsp),%rdx
	xorq    %r14,%r14
	    
	mulx    160(%rsp),%rcx,%rdx
	adcx    %rcx,%r11
	adox    %rdx,%r12
	    
	movq    152(%rsp),%rdx
	mulx    168(%rsp),%rcx,%rdx
	adcx    %rcx,%r12
	adox    %rdx,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    160(%rsp),%rdx
	    
	mulx    168(%rsp),%rcx,%r14
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
	movq    144(%rsp),%rdx
	mulx    %rdx,%r8,%rdx
	adcx    %rdx,%r9

	movq    152(%rsp),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r10
	adcx    %rdx,%r11

	movq    160(%rsp),%rdx
	mulx    %rdx,%rcx,%rdx
	adcx    %rcx,%r12
	adcx    %rdx,%r13

	movq    168(%rsp),%rdx
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
	
	movq    %r8,416(%rsp)
	movq    %r9,424(%rsp)
	movq    %r10,432(%rsp)
	movq    %r11,440(%rsp)
	movq    %r15,448(%rsp)	
	
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
	addq    456(%rsp),%r12
	adcq    464(%rsp),%r13
	adcq    472(%rsp),%r14
	adcq    480(%rsp),%rax
	adcq    488(%rsp),%rbx
	
	movq    %r12,%r8
	movq    %r13,%r9
	movq    %r14,%r10
	movq    %rax,%r11
	movq    %rbx,%r15

	shld    $1,%rax,%rbx
	andq	mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax	
	
	movq    %r12,320(%rsp)
	movq    %r13,328(%rsp)
	movq    %r14,336(%rsp)
	movq    %rax,344(%rsp)

	// sub
	subq    496(%rsp),%r8
	sbbq    504(%rsp),%r9
	sbbq    512(%rsp),%r10
	sbbq    520(%rsp),%r11
	sbbq    528(%rsp),%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq    %r8,384(%rsp)
	movq    %r9,392(%rsp)
	movq    %r10,400(%rsp)
	movq    %r11,408(%rsp)
	
	// neg
	movq    twoexp8_p0(%rip),%r12
	movq    twoexp8_p123(%rip),%r13
	movq    twoexp8_p123(%rip),%r14
	movq    twoexp8_p123(%rip),%r15
	movq    twoexp8_p4(%rip),%rbx
	
	subq    456(%rsp),%r12
	sbbq    464(%rsp),%r13
	sbbq    472(%rsp),%r14
	sbbq    480(%rsp),%r15
	sbbq    488(%rsp),%rbx		

	// sub	
	subq    416(%rsp),%r12
	sbbq    424(%rsp),%r13
	sbbq    432(%rsp),%r14
	sbbq    440(%rsp),%r15
	sbbq    448(%rsp),%rbx	
	
	shld    $1,%r15,%rbx
	andq    mask63(%rip),%r15

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%r15
		
	movq    %r12,352(%rsp)
	movq    %r13,360(%rsp)
	movq    %r14,368(%rsp)
	movq    %r15,376(%rsp)

	// add
	movq    144(%rsp),%rbx
	movq    152(%rsp),%rbp
	movq    160(%rsp),%rcx
	movq    168(%rsp),%rsi

	addq    184(%rsp),%rbx
	adcq    192(%rsp),%rbp
	adcq    200(%rsp),%rcx
	adcq    208(%rsp),%rsi

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
	xorq    %r13,%r13
	movq    %rbx,%rdx
	    
	mulx    %rbp,%r9,%r10

	mulx    %rcx,%r8,%r11
	adcx    %r8,%r10
	    
	mulx    %rsi,%r8,%r12
	adcx    %r8,%r11
	adcx    %r13,%r12

	movq    %rbp,%rdx
	xorq    %r14,%r14
	    
	mulx    %rcx,%r8,%rdx
	adcx    %r8,%r11
	adox    %rdx,%r12
	    
	movq    %rbp,%rdx
	mulx    %rsi,%r8,%rdx
	adcx    %r8,%r12
	adox    %rdx,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    %rcx,%rdx
	    
	mulx    %rsi,%r8,%r14
	adcx    %r8,%r13
	adcx    %r15,%r14

	shld    $1,%r14,%r15
	shld    $1,%r13,%r14
	shld    $1,%r12,%r13
	shld    $1,%r11,%r12
	shld    $1,%r10,%r11
	shld    $1,%r9,%r10
	shlq    $1,%r9
	     
	xorq    %rdx,%rdx
	movq    %rbx,%rdx
	mulx    %rdx,%r8,%rdx
	adcx    %rdx,%r9

	movq    %rbp,%rdx
	mulx    %rdx,%rax,%rdx
	adcx    %rax,%r10
	adcx    %rdx,%r11

	movq    %rcx,%rdx
	mulx    %rdx,%rax,%rdx
	adcx    %rax,%r12
	adcx    %rdx,%r13

	movq    %rsi,%rdx
	mulx    %rdx,%rax,%rdx
	adcx    %rax,%r14
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
	addq    352(%rsp),%r8
	adcq    360(%rsp),%r9
	adcq    368(%rsp),%r10
	adcq    376(%rsp),%r11
	adcq    $0,%r15

	shld    $1,%r11,%r15
	andq	mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq    %r8,288(%rsp)
	movq    %r9,296(%rsp)
	movq    %r10,304(%rsp)
	movq    %r11,312(%rsp)
	
	/* p1p1 to p3 */
	
	// mul
	xorq    %r13,%r13
	movq    288(%rsp),%rdx    

	mulx    384(%rsp),%r8,%r9
	mulx    392(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    400(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    408(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    296(%rsp),%rdx
	   
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    304(%rsp),%rdx
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    312(%rsp),%rdx
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    408(%rsp),%rcx,%rbp
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
	andq	mask63(%rip),%r11

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
	movq    320(%rsp),%rdx    

	mulx    352(%rsp),%r8,%r9
	mulx    360(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    368(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    376(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    328(%rsp),%rdx
	   
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
	movq    336(%rsp),%rdx
	    
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
	movq    344(%rsp),%rdx
	    
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
	andq	mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	
	
	movq    %r8,184(%rsp)
	movq    %r9,192(%rsp)
	movq    %r10,200(%rsp)
	movq    %r11,208(%rsp)

	// mul
	xorq    %r13,%r13
	movq    320(%rsp),%rdx    

	mulx    384(%rsp),%r8,%r9
	mulx    392(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    400(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    408(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    328(%rsp),%rdx
	   
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    336(%rsp),%rdx
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    344(%rsp),%rdx
	    
	mulx    384(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    408(%rsp),%rcx,%rbp
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
	andq	mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	

	movq    %r8,224(%rsp)
	movq    %r9,232(%rsp)
	movq    %r10,240(%rsp)
	movq    %r11,248(%rsp)
	
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
	andq	mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11	

	movq    %r8,256(%rsp)
	movq    %r9,264(%rsp)
	movq    %r10,272(%rsp)
	movq    %r11,280(%rsp)
	
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

	/* add p1p1 */
	
	movq	184(%rsp),%r8
	movq	192(%rsp),%r9
	movq	200(%rsp),%r10
	movq	208(%rsp),%r11
	
	movq	%r8,%r12
	movq	%r9,%r13
	movq	%r10,%r14
	movq	%r11,%r15
	
	// sub
	subq 	144(%rsp),%r8
	sbbq 	152(%rsp),%r9
	sbbq 	160(%rsp),%r10
	sbbq 	168(%rsp),%r11

	movq 	$0,%rax
	movq 	$38,%rbx
	cmovae  %rax,%rbx

	subq    %rbx,%r8
	sbbq 	%rax,%r9
	sbbq 	%rax,%r10
	sbbq  	%rax,%r11
	
	cmovc 	%rbx,%rax
	subq 	%rax,%r8	
	
	movq   %r8,288(%rsp)
	movq   %r9,296(%rsp)
	movq   %r10,304(%rsp)
	movq   %r11,312(%rsp)
	
	// add
	addq 	144(%rsp),%r12
	adcq 	152(%rsp),%r13
	adcq 	160(%rsp),%r14
	adcq 	168(%rsp),%r15

	movq 	$0,%rax
	movq 	$38,%rbx
	cmovae  %rax,%rbx

	addq    %rbx,%r12
	adcq 	%rax,%r13
	adcq 	%rax,%r14
	adcq  	%rax,%r15
	
	cmovc 	%rbx,%rax
	addq 	%rax,%r12	
	
	movq   %r12,328(%rsp)
	movq   %r13,336(%rsp)
	movq   %r14,344(%rsp)
	movq   %r15,352(%rsp)
	
	movq    32(%rdi),%r8
	movq    40(%rdi),%r9
	movq    48(%rdi),%r10
	movq    56(%rdi),%r11

	movq  	%r8,%r12
	movq  	%r9,%r13
	movq  	%r10,%r14
	movq  	%r11,%r15

	// sub
	subq 	0(%rdi),%r8
	sbbq 	8(%rdi),%r9
	sbbq 	16(%rdi),%r10
	sbbq 	24(%rdi),%r11

	movq  	$0,%rax
	movq  	$38,%rbx
	cmovae  %rax,%rbx

	subq 	%rbx,%r8
	sbbq  	%rax,%r9
	sbbq  	%rax,%r10
	sbbq  	%rax,%r11

	cmovc 	%rbx,%rax
	subq 	%rax,%r8
	
	movq 	%r8,360(%rsp)
	movq 	%r9,368(%rsp)
	movq 	%r10,376(%rsp)
	movq 	%r11,384(%rsp)	

	// add
	addq 	0(%rdi),%r12
	adcq 	8(%rdi),%r13
	adcq 	16(%rdi),%r14
	adcq 	24(%rdi),%r15

	movq 	$0,%rax
	movq 	$38,%rbx
	cmovae  %rax,%rbx

	addq 	%rbx,%r12
	adcq	%rax,%r13
	adcq	%rax,%r14
	adcq	%rax,%r15

	cmovc 	%rbx,%rax
	addq 	%rax,%r12

	movq 	%r12,392(%rsp)
	movq 	%r13,400(%rsp)
	movq 	%r14,408(%rsp)
	movq 	%r15,416(%rsp)	
	
	// mul
	xorq    %r13,%r13
	movq    288(%rsp),%rdx    

	mulx    360(%rsp),%r8,%r9
	mulx    368(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    376(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    384(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    296(%rsp),%rdx
	   
	mulx    360(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    368(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    376(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    384(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    304(%rsp),%rdx
	    
	mulx    360(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    368(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    376(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    384(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    312(%rsp),%rdx
	    
	mulx    360(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    368(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    376(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    384(%rsp),%rbx,%rbp
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

	movq 	%r8,288(%rsp)
	movq 	%r9,296(%rsp)
	movq 	%r10,304(%rsp)
	movq 	%r11,312(%rsp)
	movq 	%r15,320(%rsp)

	// mul
	xorq    %r13,%r13
	movq    328(%rsp),%rdx    

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    408(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    416(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    336(%rsp),%rdx
	   
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    416(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    344(%rsp),%rdx
	    
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    416(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    352(%rsp),%rdx
	    
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    416(%rsp),%rbx,%rbp
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
	addq 	288(%rsp),%r8
	adcq 	296(%rsp),%r9
	adcq 	304(%rsp),%r10
	adcq 	312(%rsp),%r11
	adcq 	320(%rsp),%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq    %r8,392(%rsp)
	movq    %r9,400(%rsp)
	movq    %r10,408(%rsp)
	movq    %r11,416(%rsp)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx	
	
	subq 	288(%rsp),%r12
	sbbq 	296(%rsp),%r13
	sbbq 	304(%rsp),%r14
	sbbq 	312(%rsp),%rax
	sbbq 	320(%rsp),%rbx
	
	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax

	movq    %r12,328(%rsp)
	movq    %r13,336(%rsp)
	movq    %r14,344(%rsp)
	movq    %rax,352(%rsp)
	
	// mul
	xorq    %r13,%r13
	movq    256(%rsp),%rdx    

	mulx    96(%rdi),%r8,%r9
	mulx    104(%rdi),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    112(%rdi),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    120(%rdi),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    264(%rsp),%rdx
	   
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
	movq    272(%rsp),%rdx
	    
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
	movq    280(%rsp),%rdx
	    
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
	
	movq 	%r8,288(%rsp)
	movq 	%r9,296(%rsp)
	movq 	%r10,304(%rsp)
	movq 	%r11,312(%rsp)

	// mul
	xorq    %r13,%r13
	movq    EC2D0(%rip),%rdx    

	mulx    288(%rsp),%r8,%r9
	mulx    296(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    304(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    312(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    EC2D1(%rip),%rdx
	   
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
	movq    EC2D2(%rip),%rdx
	    
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
	movq    EC2D3(%rip),%rdx
	    
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

	movq 	%r8,288(%rsp)
	movq 	%r9,296(%rsp)
	movq 	%r10,304(%rsp)
	movq 	%r11,312(%rsp)
	movq 	%r15,320(%rsp)

	// mul
	xorq    %r13,%r13
	movq    224(%rsp),%rdx    

	mulx    64(%rdi),%r8,%r9
	mulx    72(%rdi),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    80(%rdi),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    88(%rdi),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    232(%rsp),%rdx
	   
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
	movq    240(%rsp),%rdx
	    
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
	movq    248(%rsp),%rdx
	    
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
	addq 	288(%rsp),%r8
	adcq 	296(%rsp),%r9
	adcq 	304(%rsp),%r10
	adcq 	312(%rsp),%r11
	adcq 	320(%rsp),%r15	

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

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
	
	subq 	288(%rsp),%r12
	sbbq 	296(%rsp),%r13
	sbbq 	304(%rsp),%r14
	sbbq 	312(%rsp),%rax
	sbbq 	320(%rsp),%rbx	

	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax

	movq    %r12,424(%rsp)
	movq    %r13,432(%rsp)
	movq    %r14,440(%rsp)
	movq    %rax,448(%rsp)
	
	/* p1p1 to p3 */
	
	// mul
	xorq    %r13,%r13
	movq    328(%rsp),%rdx    

	mulx    424(%rsp),%r8,%r9
	mulx    432(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    440(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    448(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    336(%rsp),%rdx
	   
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    344(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    352(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    448(%rsp),%rcx,%rbp
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
	movq    360(%rsp),%rdx    

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    408(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    416(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    368(%rsp),%rdx
	   
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    376(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    384(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    416(%rsp),%rcx,%rbp
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

	// mul
	xorq    %r13,%r13
	movq    360(%rsp),%rdx    

	mulx    424(%rsp),%r8,%r9
	mulx    432(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    440(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    448(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    368(%rsp),%rdx
	   
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    376(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    384(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    448(%rsp),%rcx,%rbp
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

	movq    %r8,224(%rsp)
	movq    %r9,232(%rsp)
	movq    %r10,240(%rsp)
	movq    %r11,248(%rsp)
	
	// mul
	xorq    %r13,%r13
	movq    328(%rsp),%rdx    

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    408(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    416(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    336(%rsp),%rdx
	   
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    344(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    352(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    416(%rsp),%rcx,%rbp
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

	movq    %r8,256(%rsp)
	movq    %r9,264(%rsp)
	movq    %r10,272(%rsp)
	movq    %r11,280(%rsp)
	
	jmp	.L6
	
.L5:		
	movb	$0,%r15b
	subb	%r14b,%r15b
	shrb	$1,%r15b
	movzbq	%r15b,%r15
	imul	$128,%r15,%r15	
	addq	%r15,%rdi	

	/* sub p1p1 */
	
	// neg
	movq    $0,%r8
	movq    $0,%r9
	movq    $0,%r10
	movq    $0,%r11

	subq    0(%rdi),%r8
	sbbq    8(%rdi),%r9
	sbbq    16(%rdi),%r10
	sbbq    24(%rdi),%r11

	movq    $0,%rdx
	movq    $38,%rax
	cmovae %rdx,%rax

	subq    %rax,%r8
	sbbq    %rdx,%r9
	sbbq    %rdx,%r10
	sbbq    %rdx,%r11

	cmovc   %rax,%rdx
	subq    %rdx,%r8

	movq    %r8,456(%rsp)
	movq    %r9,464(%rsp)
	movq    %r10,472(%rsp)
	movq    %r11,480(%rsp)
	
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

	movq    %r8,488(%rsp)
	movq    %r9,496(%rsp)
	movq    %r10,504(%rsp)
	movq    %r11,512(%rsp)
	
	movq	184(%rsp),%r8
	movq	192(%rsp),%r9
	movq	200(%rsp),%r10
	movq	208(%rsp),%r11
	
	movq	%r8,%r12
	movq	%r9,%r13
	movq	%r10,%r14
	movq	%r11,%r15
	
	// sub
	subq 	144(%rsp),%r8
	sbbq 	152(%rsp),%r9
	sbbq 	160(%rsp),%r10
	sbbq 	168(%rsp),%r11

	movq    $0,%rdx
	movq    $38,%rax
	cmovae %rdx,%rax

	subq    %rax,%r8
	sbbq    %rdx,%r9
	sbbq    %rdx,%r10
	sbbq    %rdx,%r11

	cmovc   %rax,%rdx
	subq    %rdx,%r8	
	
	movq   %r8,288(%rsp)
	movq   %r9,296(%rsp)
	movq   %r10,304(%rsp)
	movq   %r11,312(%rsp)
	
	// add
	addq 	144(%rsp),%r12
	adcq 	152(%rsp),%r13
	adcq 	160(%rsp),%r14
	adcq 	168(%rsp),%r15

	movq    $0,%rdx
	movq    $38,%rax
	cmovae %rdx,%rax

	addq    %rax,%r12
	adcq    %rdx,%r13
	adcq    %rdx,%r14
	adcq    %rdx,%r15

	cmovc   %rax,%rdx
	addq    %rdx,%r12	
	
	movq   %r12,328(%rsp)
	movq   %r13,336(%rsp)
	movq   %r14,344(%rsp)
	movq   %r15,352(%rsp)
	
	movq    32(%rdi),%r8
	movq    40(%rdi),%r9
	movq    48(%rdi),%r10
	movq    56(%rdi),%r11

	movq  	%r8,%r12
	movq  	%r9,%r13
	movq  	%r10,%r14
	movq  	%r11,%r15

	// sub
	subq 	456(%rsp),%r8
	sbbq 	464(%rsp),%r9
	sbbq 	472(%rsp),%r10
	sbbq 	480(%rsp),%r11

	movq    $0,%rdx
	movq    $38,%rax
	cmovae %rdx,%rax

	subq    %rax,%r8
	sbbq    %rdx,%r9
	sbbq    %rdx,%r10
	sbbq    %rdx,%r11

	cmovc   %rax,%rdx
	subq    %rdx,%r8
	
	movq 	%r8,360(%rsp)
	movq 	%r9,368(%rsp)
	movq 	%r10,376(%rsp)
	movq 	%r11,384(%rsp)	

	// add
	addq 	456(%rsp),%r12
	adcq 	464(%rsp),%r13
	adcq 	472(%rsp),%r14
	adcq 	480(%rsp),%r15

	movq    $0,%rdx
	movq    $38,%rax
	cmovae %rdx,%rax

	addq    %rax,%r12
	adcq    %rdx,%r13
	adcq    %rdx,%r14
	adcq    %rdx,%r15

	cmovc   %rax,%rdx
	addq    %rdx,%r12

	movq 	%r12,392(%rsp)
	movq 	%r13,400(%rsp)
	movq 	%r14,408(%rsp)
	movq 	%r15,416(%rsp)
	
	// mul
	xorq    %r13,%r13
	movq    288(%rsp),%rdx    

	mulx    360(%rsp),%r8,%r9
	mulx    368(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    376(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    384(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    296(%rsp),%rdx
	   
	mulx    360(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    368(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    376(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    384(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    304(%rsp),%rdx
	    
	mulx    360(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    368(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    376(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    384(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    312(%rsp),%rdx
	    
	mulx    360(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    368(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    376(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    384(%rsp),%rbx,%rbp
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

	movq 	%r8,288(%rsp)
	movq 	%r9,296(%rsp)
	movq 	%r10,304(%rsp)
	movq 	%r11,312(%rsp)
	movq 	%r15,320(%rsp)	

	// mul
	xorq    %r13,%r13
	movq    328(%rsp),%rdx    

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    408(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    416(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    336(%rsp),%rdx
	   
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    416(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    344(%rsp),%rdx
	    
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    416(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    352(%rsp),%rdx
	    
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    416(%rsp),%rbx,%rbp
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
	addq 	288(%rsp),%r8
	adcq 	296(%rsp),%r9
	adcq 	304(%rsp),%r10
	adcq 	312(%rsp),%r11
	adcq 	320(%rsp),%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq    %r8,392(%rsp)
	movq    %r9,400(%rsp)
	movq    %r10,408(%rsp)
	movq    %r11,416(%rsp)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx	
	
	subq 	288(%rsp),%r12
	sbbq 	296(%rsp),%r13
	sbbq 	304(%rsp),%r14
	sbbq 	312(%rsp),%rax
	sbbq 	320(%rsp),%rbx
	
	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax

	movq    %r12,328(%rsp)
	movq    %r13,336(%rsp)
	movq    %r14,344(%rsp)
	movq    %rax,352(%rsp)
	
	// mul
	xorq    %r13,%r13
	movq    256(%rsp),%rdx    

	mulx    488(%rsp),%r8,%r9
	mulx    496(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    504(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    512(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    264(%rsp),%rdx
	   
	mulx    488(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    496(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    504(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    512(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    272(%rsp),%rdx
	    
	mulx    488(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    496(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    504(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    512(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    280(%rsp),%rdx
	    
	mulx    488(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    496(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    504(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    512(%rsp),%rbx,%rbp
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
	
	movq 	%r8,288(%rsp)
	movq 	%r9,296(%rsp)
	movq 	%r10,304(%rsp)
	movq 	%r11,312(%rsp)

	// mul
	xorq    %r13,%r13
	movq    EC2D0(%rip),%rdx    

	mulx    288(%rsp),%r8,%r9
	mulx    296(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    304(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    312(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    EC2D1(%rip),%rdx
	   
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
	movq    EC2D2(%rip),%rdx
	    
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
	movq    EC2D3(%rip),%rdx
	    
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

	movq 	%r8,288(%rsp)
	movq 	%r9,296(%rsp)
	movq 	%r10,304(%rsp)
	movq 	%r11,312(%rsp)
	movq 	%r15,320(%rsp)

	// mul
	xorq    %r13,%r13
	movq    224(%rsp),%rdx    

	mulx    64(%rdi),%r8,%r9
	mulx    72(%rdi),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    80(%rdi),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    88(%rdi),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    232(%rsp),%rdx
	   
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
	movq    240(%rsp),%rdx
	    
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
	movq    248(%rsp),%rdx
	    
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
	addq 	288(%rsp),%r8
	adcq 	296(%rsp),%r9
	adcq 	304(%rsp),%r10
	adcq 	312(%rsp),%r11
	adcq 	320(%rsp),%r15	

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

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
	
	subq 	288(%rsp),%r12
	sbbq 	296(%rsp),%r13
	sbbq 	304(%rsp),%r14
	sbbq 	312(%rsp),%rax
	sbbq 	320(%rsp),%rbx	

	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax

	movq    %r12,424(%rsp)
	movq    %r13,432(%rsp)
	movq    %r14,440(%rsp)
	movq    %rax,448(%rsp)
		
	/* p1p1 to p3 */
	
	// mul
	xorq    %r13,%r13
	movq    328(%rsp),%rdx    

	mulx    424(%rsp),%r8,%r9
	mulx    432(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    440(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    448(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    336(%rsp),%rdx
	   
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    344(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    352(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    448(%rsp),%rcx,%rbp
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
	movq    360(%rsp),%rdx    

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    408(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    416(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    368(%rsp),%rdx
	   
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    376(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    384(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    416(%rsp),%rcx,%rbp
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

	// mul
	xorq    %r13,%r13
	movq    360(%rsp),%rdx    

	mulx    424(%rsp),%r8,%r9
	mulx    432(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    440(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    448(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    368(%rsp),%rdx
	   
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    376(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    384(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    448(%rsp),%rcx,%rbp
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

	movq    %r8,224(%rsp)
	movq    %r9,232(%rsp)
	movq    %r10,240(%rsp)
	movq    %r11,248(%rsp)
	
	// mul
	xorq    %r13,%r13
	movq    328(%rsp),%rdx    

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    408(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    416(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    336(%rsp),%rdx
	   
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    344(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    352(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    416(%rsp),%rcx,%rbp
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

	movq    %r8,256(%rsp)
	movq    %r9,264(%rsp)
	movq    %r10,272(%rsp)
	movq    %r11,280(%rsp)
		
.L6:	
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
	
	movq	56(%rsp),%rdi
	
	/* add p1p1 */
	
	movq	32(%rdi),%r8
	movq	40(%rdi),%r9
	movq	48(%rdi),%r10
	movq	56(%rdi),%r11
	
	movq	%r8,%r12
	movq	%r9,%r13
	movq	%r10,%r14
	movq	%r11,%r15
	
	// sub
	subq 	0(%rdi),%r8
	sbbq 	8(%rdi),%r9
	sbbq 	16(%rdi),%r10
	sbbq 	24(%rdi),%r11

	movq    $0,%rbx
	movq    $38,%rax
	cmovae  %rbx,%rax

	subq    %rax,%r8
	sbbq    %rbx,%r9
	sbbq    %rbx,%r10
	sbbq    %rbx,%r11

	cmovc   %rax,%rbx
	subq    %rbx,%r8	
	
	movq    %r8,288(%rsp)
	movq    %r9,296(%rsp)
	movq    %r10,304(%rsp)
	movq    %r11,312(%rsp)
	
	// add
	addq 	0(%rdi),%r12
	adcq 	8(%rdi),%r13
	adcq 	16(%rdi),%r14
	adcq 	24(%rdi),%r15

	movq    $0,%rbx
	movq    $38,%rax
	cmovae  %rbx,%rax

	addq    %rax,%r12
	adcq    %rbx,%r13
	adcq    %rbx,%r14
	adcq    %rbx,%r15

	cmovc   %rax,%rbx
	addq    %rbx,%r12	
	
	movq    %r12,328(%rsp)
	movq    %r13,336(%rsp)
	movq    %r14,344(%rsp)
	movq    %r15,352(%rsp)
	
	movq	184(%rsp),%r8
	movq	192(%rsp),%r9
	movq	200(%rsp),%r10
	movq	208(%rsp),%r11
	
	movq	%r8,%r12
	movq	%r9,%r13
	movq	%r10,%r14
	movq	%r11,%r15
	
	// sub
	subq 	144(%rsp),%r8
	sbbq 	152(%rsp),%r9
	sbbq 	160(%rsp),%r10
	sbbq 	168(%rsp),%r11

	movq    $0,%rbx
	movq    $38,%rax
	cmovae  %rbx,%rax

	subq    %rax,%r8
	sbbq    %rbx,%r9
	sbbq    %rbx,%r10
	sbbq    %rbx,%r11

	cmovc   %rax,%rbx
	subq    %rbx,%r8	
	
	movq    %r8,360(%rsp)
	movq    %r9,368(%rsp)
	movq    %r10,376(%rsp)
	movq    %r11,384(%rsp)
	
	// add
	addq 	144(%rsp),%r12
	adcq 	152(%rsp),%r13
	adcq 	160(%rsp),%r14
	adcq 	168(%rsp),%r15

	movq    $0,%rbx
	movq    $38,%rax
	cmovae  %rbx,%rax

	addq    %rax,%r12
	adcq    %rbx,%r13
	adcq    %rbx,%r14
	adcq    %rbx,%r15

	cmovc   %rax,%rbx
	addq    %rbx,%r12
	
	movq    %r12,392(%rsp)
	movq    %r13,400(%rsp)
	movq    %r14,408(%rsp)
	movq    %r15,416(%rsp)
	
	// mul
	xorq    %r13,%r13
	movq    288(%rsp),%rdx    

	mulx    360(%rsp),%r8,%r9
	mulx    368(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    376(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    384(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    296(%rsp),%rdx
	   
	mulx    360(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    368(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    376(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    384(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    304(%rsp),%rdx
	    
	mulx    360(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    368(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    376(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    384(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    312(%rsp),%rdx
	    
	mulx    360(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    368(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    376(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    384(%rsp),%rbx,%rbp
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

	movq 	%r8,288(%rsp)
	movq 	%r9,296(%rsp)
	movq 	%r10,304(%rsp)
	movq 	%r11,312(%rsp)
	movq 	%r15,320(%rsp)	
	
	// mul
	xorq    %r13,%r13
	movq    328(%rsp),%rdx    

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    408(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    416(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    336(%rsp),%rdx
	   
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r9
	adox    %rbp,%r10
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    416(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    344(%rsp),%rdx
	    
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    416(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    352(%rsp),%rdx
	    
	mulx    392(%rsp),%rbx,%rbp
	adcx    %rbx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rbx,%rbp
	adcx    %rbx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rbx,%rbp
	adcx    %rbx,%r13
	adox    %rbp,%r14
	    
	mulx    416(%rsp),%rbx,%rbp
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
	addq 	288(%rsp),%r8
	adcq 	296(%rsp),%r9
	adcq 	304(%rsp),%r10
	adcq 	312(%rsp),%r11
	adcq 	320(%rsp),%r15

	shld    $1,%r11,%r15
	andq    mask63(%rip),%r11

	imul    $19,%r15,%r15
	addq    %r15,%r8
	adcq    $0,%r9
	adcq    $0,%r10
	adcq    $0,%r11
	
	movq    %r8,392(%rsp)
	movq    %r9,400(%rsp)
	movq    %r10,408(%rsp)
	movq    %r11,416(%rsp)

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx	
	
	subq 	288(%rsp),%r12
	sbbq 	296(%rsp),%r13
	sbbq 	304(%rsp),%r14
	sbbq 	312(%rsp),%rax
	sbbq 	320(%rsp),%rbx
	
	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax

	movq    %r12,328(%rsp)
	movq    %r13,336(%rsp)
	movq    %r14,344(%rsp)
	movq    %rax,352(%rsp)
	
	// mul
	xorq    %r13,%r13
	movq    256(%rsp),%rdx    

	mulx    96(%rdi),%r8,%r9
	mulx    104(%rdi),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    112(%rdi),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    120(%rdi),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    264(%rsp),%rdx
	   
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
	movq    272(%rsp),%rdx
	    
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
	movq    280(%rsp),%rdx
	    
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
	
	movq 	%r8,288(%rsp)
	movq 	%r9,296(%rsp)
	movq 	%r10,304(%rsp)
	movq 	%r11,312(%rsp)

	// mul
	xorq    %r13,%r13
	movq    EC2D0(%rip),%rdx    

	mulx    288(%rsp),%r8,%r9
	mulx    296(%rsp),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    304(%rsp),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    312(%rsp),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    EC2D1(%rip),%rdx
	   
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
	movq    EC2D2(%rip),%rdx
	    
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
	movq    EC2D3(%rip),%rdx
	    
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

	movq 	%r8,288(%rsp)
	movq 	%r9,296(%rsp)
	movq 	%r10,304(%rsp)
	movq 	%r11,312(%rsp)
	movq 	%r15,320(%rsp)

	// mul
	xorq    %r13,%r13
	movq    224(%rsp),%rdx    

	mulx    64(%rdi),%r8,%r9
	mulx    72(%rdi),%rbx,%r10
	adcx    %rbx,%r9     

	mulx    80(%rdi),%rbx,%r11
	adcx    %rbx,%r10    

	mulx    88(%rdi),%rbx,%r12
	adcx    %rbx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    232(%rsp),%rdx
	   
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
	movq    240(%rsp),%rdx
	    
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
	movq    248(%rsp),%rdx
	    
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
	addq 	288(%rsp),%r8
	adcq 	296(%rsp),%r9
	adcq 	304(%rsp),%r10
	adcq 	312(%rsp),%r11
	adcq 	320(%rsp),%r15	

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

	// sub
	addq    twoexp8_p0(%rip),%r12
	adcq    twoexp8_p123(%rip),%r13
	adcq    twoexp8_p123(%rip),%r14
	adcq    twoexp8_p123(%rip),%rax
	adcq    twoexp8_p4(%rip),%rbx
	
	subq 	288(%rsp),%r12
	sbbq 	296(%rsp),%r13
	sbbq 	304(%rsp),%r14
	sbbq 	312(%rsp),%rax
	sbbq 	320(%rsp),%rbx	

	shld    $1,%rax,%rbx
	andq    mask63(%rip),%rax

	imul    $19,%rbx,%rbx
	addq    %rbx,%r12
	adcq    $0,%r13
	adcq    $0,%r14
	adcq    $0,%rax

	movq    %r12,424(%rsp)
	movq    %r13,432(%rsp)
	movq    %r14,440(%rsp)
	movq    %rax,448(%rsp)
				
	/* p1p1 to p3 */
	
	// mul
	xorq    %r13,%r13
	movq    328(%rsp),%rdx    

	mulx    424(%rsp),%r8,%r9
	mulx    432(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    440(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    448(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    336(%rsp),%rdx
	   
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    344(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    352(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    448(%rsp),%rcx,%rbp
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
	
	movq    %r8,0(%rdi)
	movq    %r9,8(%rdi)
	movq    %r10,16(%rdi)
	movq    %r11,24(%rdi)

	// mul
	xorq    %r13,%r13
	movq    360(%rsp),%rdx    

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    408(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    416(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    368(%rsp),%rdx
	   
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    376(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    384(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    416(%rsp),%rcx,%rbp
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
	
	movq    %r8,32(%rdi)
	movq    %r9,40(%rdi)
	movq    %r10,48(%rdi)
	movq    %r11,56(%rdi)

	// mul
	xorq    %r13,%r13
	movq    360(%rsp),%rdx    

	mulx    424(%rsp),%r8,%r9
	mulx    432(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    440(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    448(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    368(%rsp),%rdx
	   
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    376(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    448(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    384(%rsp),%rdx
	    
	mulx    424(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    432(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    440(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    448(%rsp),%rcx,%rbp
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

	movq    %r8,64(%rdi)
	movq    %r9,72(%rdi)
	movq    %r10,80(%rdi)
	movq    %r11,88(%rdi)
	
	// mul
	xorq    %r13,%r13
	movq    328(%rsp),%rdx    

	mulx    392(%rsp),%r8,%r9
	mulx    400(%rsp),%rcx,%r10
	adcx    %rcx,%r9     

	mulx    408(%rsp),%rcx,%r11
	adcx    %rcx,%r10    

	mulx    416(%rsp),%rcx,%r12
	adcx    %rcx,%r11
	adcx    %r13,%r12

	xorq    %r14,%r14
	movq    336(%rsp),%rdx
	   
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r9
	adox    %rbp,%r10
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	adcx    %r14,%r13

	xorq    %r15,%r15
	movq    344(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r10
	adox    %rbp,%r11
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    416(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	adcx    %r15,%r14

	xorq    %rax,%rax
	movq    352(%rsp),%rdx
	    
	mulx    392(%rsp),%rcx,%rbp
	adcx    %rcx,%r11
	adox    %rbp,%r12
	    
	mulx    400(%rsp),%rcx,%rbp
	adcx    %rcx,%r12
	adox    %rbp,%r13
	    
	mulx    408(%rsp),%rcx,%rbp
	adcx    %rcx,%r13
	adox    %rbp,%r14
	    
	mulx    416(%rsp),%rcx,%rbp
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
