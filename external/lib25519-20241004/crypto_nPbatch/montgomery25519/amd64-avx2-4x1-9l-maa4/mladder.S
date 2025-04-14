#include "crypto_asm_hidden.h"
#include "consts_namespace.h"

// 4-way Montgomery ladder, 9-limb implementation

	.p2align 5

ASM_HIDDEN _CRYPTO_SHARED_NAMESPACE(mladder_4x1)
.globl _CRYPTO_SHARED_NAMESPACE(mladder_4x1)
ASM_HIDDEN CRYPTO_SHARED_NAMESPACE(mladder_4x1)
.globl CRYPTO_SHARED_NAMESPACE(mladder_4x1)
_CRYPTO_SHARED_NAMESPACE(mladder_4x1):
CRYPTO_SHARED_NAMESPACE(mladder_4x1):

	movq 	%rsp,%r8
	andq 	$-32,%rsp
	subq 	$3456,%rsp

	vmovdqa    vec0(%rip),%ymm0
	vmovdqa    vec1(%rip),%ymm1

	// X1 ← XP,X3 ← XP
	vmovdqa    0(%rsi),%ymm2
	vmovdqa    %ymm2,96(%rsp)
	vmovdqa    %ymm2,960(%rsp)

	vmovdqa    32(%rsi),%ymm2
	vmovdqa    %ymm2,128(%rsp)
	vmovdqa    %ymm2,992(%rsp)

	vmovdqa    64(%rsi),%ymm2
	vmovdqa    %ymm2,160(%rsp)
	vmovdqa    %ymm2,1024(%rsp)

	vmovdqa    96(%rsi),%ymm2
	vmovdqa    %ymm2,192(%rsp)
	vmovdqa    %ymm2,1056(%rsp)

	vmovdqa    128(%rsi),%ymm2
	vmovdqa    %ymm2,224(%rsp)
	vmovdqa    %ymm2,1088(%rsp)

	vmovdqa    160(%rsi),%ymm2
	vmovdqa    %ymm2,256(%rsp)
	vmovdqa    %ymm2,1120(%rsp)

	vmovdqa    192(%rsi),%ymm2
	vmovdqa    %ymm2,288(%rsp)
	vmovdqa    %ymm2,1152(%rsp)

	vmovdqa    224(%rsi),%ymm2
	vmovdqa    %ymm2,320(%rsp)
	vmovdqa    %ymm2,1184(%rsp)

	vmovdqa    256(%rsi),%ymm2
	vmovdqa    %ymm2,352(%rsp)
	vmovdqa    %ymm2,1216(%rsp)

	// X2 ← 1
	vmovdqa    %ymm1,384(%rsp)
	vmovdqa    %ymm0,416(%rsp)
	vmovdqa    %ymm0,448(%rsp)
	vmovdqa    %ymm0,480(%rsp)
	vmovdqa    %ymm0,512(%rsp)
	vmovdqa    %ymm0,544(%rsp)
	vmovdqa    %ymm0,576(%rsp)
	vmovdqa    %ymm0,608(%rsp)
	vmovdqa    %ymm0,640(%rsp)

	// Z2 ← 0
	vmovdqa    %ymm0,672(%rsp)
	vmovdqa    %ymm0,704(%rsp)
	vmovdqa    %ymm0,736(%rsp)
	vmovdqa    %ymm0,768(%rsp)
	vmovdqa    %ymm0,800(%rsp)
	vmovdqa    %ymm0,832(%rsp)
	vmovdqa    %ymm0,864(%rsp)
	vmovdqa    %ymm0,896(%rsp)
	vmovdqa    %ymm0,928(%rsp)

	// Z3 ← 1
	vmovdqa    %ymm1,1248(%rsp)
	vmovdqa    %ymm0,1280(%rsp)
	vmovdqa    %ymm0,1312(%rsp)
	vmovdqa    %ymm0,1344(%rsp)
	vmovdqa    %ymm0,1376(%rsp)
	vmovdqa    %ymm0,1408(%rsp)
	vmovdqa    %ymm0,1440(%rsp)
	vmovdqa    %ymm0,1472(%rsp)
	vmovdqa    %ymm0,1504(%rsp)

	movq    $96,%r9
	movb    $62,%cl

	vmovdqa    vec0(%rip),%ymm0
	vmovdqa    sixtytwo(%rip),%ymm1
	vmovdqa    %ymm1,0(%rsp)
	vmovdqa    %ymm0,32(%rsp)
	
	movq    %rdx,%rax

	// Montgomery ladder loop
.L1:
	addq    %r9,%rax
	
	vmovdqa    0(%rax),%ymm0
	vmovdqa    %ymm0,64(%rsp)
	
	movq    %rdx,%rax

.L2:
	/* 
	 * Montgomery ladder step
	 *
	 * T1 ← X2 + Z2
	 * T2 ← X2 - Z2
	 * T3 ← X3 + Z3
	 * T4 ← X3 - Z3
	 * Z3 ← T2 · T3
	 * X3 ← T1 · T4
	 *
	 * bit ← n[i]
	 * select ← bit ⊕ prevbit
	 * prevbit ← bit
	 * CSelect(T1,T3,select): if (select == 1) {T1 = T3}
	 * CSelect(T2,T4,select): if (select == 1) {T2 = T4}
	 *
	 * T2 ← T2^2
	 * T1 ← T1^2
	 * T3 ← X3 + Z3
	 * Z3 ← X3 - Z3
	 * Z3 ← Z3^2
	 * X3 ← T3^2
	 * T3 ← T1 - T2
	 * T4 ← ((A + 2)/4) · T3
	 * T4 ← T4 + T2
	 * X2 ← T1 · T2
	 * Z2 ← T3 · T4
	 * Z3 ← Z3 · X1
	 *
	 */

	// X2
	vmovdqa   384(%rsp),%ymm10
	vmovdqa   416(%rsp),%ymm11
	vmovdqa   448(%rsp),%ymm12
	vmovdqa   480(%rsp),%ymm13
	vmovdqa   512(%rsp),%ymm5
	vmovdqa   544(%rsp),%ymm6
	vmovdqa   576(%rsp),%ymm7
	vmovdqa   608(%rsp),%ymm8
	vmovdqa   640(%rsp),%ymm9

	// copy X2
	vmovdqa   %ymm10,%ymm0
	vmovdqa   %ymm11,%ymm1	
	vmovdqa   %ymm12,%ymm2
	vmovdqa   %ymm13,%ymm3
	vmovdqa   %ymm5,%ymm4
	vmovdqa   %ymm6,%ymm14
	vmovdqa   %ymm7,%ymm15

	// T1 ← X2 + Z2
	vpaddq	  672(%rsp),%ymm10,%ymm10
	vpaddq	  704(%rsp),%ymm11,%ymm11
	vpaddq	  736(%rsp),%ymm12,%ymm12
	vpaddq	  768(%rsp),%ymm13,%ymm13
	vpaddq	  800(%rsp),%ymm5,%ymm5
	vpaddq	  832(%rsp),%ymm6,%ymm6
	vpaddq	  864(%rsp),%ymm7,%ymm7
	vpaddq	  896(%rsp),%ymm8,%ymm8
	vpaddq	  928(%rsp),%ymm9,%ymm9
	
	vmovdqa   %ymm10,1536(%rsp)
	vmovdqa   %ymm11,1568(%rsp)
	vmovdqa   %ymm12,1600(%rsp)
	vmovdqa   %ymm13,1632(%rsp)
	vmovdqa   %ymm5,1664(%rsp)
	vmovdqa   %ymm6,1696(%rsp)
	vmovdqa   %ymm7,1728(%rsp)
	vmovdqa   %ymm8,1760(%rsp)
	vmovdqa   %ymm9,1792(%rsp)

	// remaining X2
	vmovdqa   608(%rsp),%ymm10
	vmovdqa   640(%rsp),%ymm11

	// T2 ← X2 - Z2
	vpaddq    vec2p0(%rip),%ymm0,%ymm0
	vpaddq    vec2p1_7(%rip),%ymm1,%ymm1
	vpaddq    vec2p1_7(%rip),%ymm2,%ymm2
	vpaddq    vec2p1_7(%rip),%ymm3,%ymm3
	vpaddq    vec2p1_7(%rip),%ymm4,%ymm4
	vpaddq    vec2p1_7(%rip),%ymm14,%ymm14
	vpaddq    vec2p1_7(%rip),%ymm15,%ymm15
	vpaddq    vec2p1_7(%rip),%ymm10,%ymm10
	vpaddq    vec2p8(%rip),%ymm11,%ymm11

	vpsubq	  672(%rsp),%ymm0,%ymm0
	vpsubq	  704(%rsp),%ymm1,%ymm1
	vpsubq	  736(%rsp),%ymm2,%ymm2
	vpsubq	  768(%rsp),%ymm3,%ymm3
	vpsubq	  800(%rsp),%ymm4,%ymm4
	vpsubq	  832(%rsp),%ymm14,%ymm14
	vpsubq	  864(%rsp),%ymm15,%ymm15
	vpsubq	  896(%rsp),%ymm10,%ymm10
	vpsubq	  928(%rsp),%ymm11,%ymm11
	
	vpsrlq    $29,%ymm4,%ymm5
	vpaddq    %ymm5,%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm4,%ymm4
		
	vpsrlq    $29,%ymm0,%ymm5
	vpaddq    %ymm5,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0
	
	vpsrlq    $29,%ymm14,%ymm5
	vpaddq    %ymm5,%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm14	

	vpsrlq    $29,%ymm1,%ymm5
	vpaddq    %ymm5,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1
	
	vpsrlq    $29,%ymm15,%ymm5
	vpaddq    %ymm5,%ymm10,%ymm10
	vpand     vecmask29(%rip),%ymm15,%ymm15	

	vpsrlq    $29,%ymm2,%ymm5
	vpaddq    %ymm5,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2
	
	vpsrlq    $29,%ymm10,%ymm5
	vpaddq    %ymm5,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10	

	vpsrlq    $29,%ymm3,%ymm5
	vpaddq    %ymm5,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3
	
	vpsrlq    $23,%ymm11,%ymm5
	vpmuludq  vec19(%rip),%ymm5,%ymm5
	vpaddq    %ymm5,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm11,%ymm11	

	vpsrlq    $29,%ymm4,%ymm5
	vpaddq    %ymm5,%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm4,%ymm4
	
	vpsrlq    $29,%ymm0,%ymm5
	vpaddq    %ymm5,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0	
	
	vmovdqa   %ymm0,1824(%rsp)
	vmovdqa   %ymm1,1856(%rsp)
	vmovdqa   %ymm2,1888(%rsp)
	vmovdqa   %ymm3,1920(%rsp)
	vmovdqa   %ymm4,1952(%rsp)
	vmovdqa   %ymm14,1984(%rsp)
	vmovdqa   %ymm15,2016(%rsp)
	vmovdqa   %ymm10,2048(%rsp)
	vmovdqa   %ymm11,2080(%rsp)

	// X3
	vmovdqa   960(%rsp),%ymm10
	vmovdqa   992(%rsp),%ymm11
	vmovdqa   1024(%rsp),%ymm12
	vmovdqa   1056(%rsp),%ymm13
	vmovdqa   1088(%rsp),%ymm0
	vmovdqa   1120(%rsp),%ymm1
	vmovdqa   1152(%rsp),%ymm2
	vmovdqa   1184(%rsp),%ymm14
	vmovdqa   1216(%rsp),%ymm15

	// copy X3
	vmovdqa   %ymm14,%ymm3	
	vmovdqa   %ymm15,%ymm4

	// T3 ← X3 + Z3
	vpaddq	  1248(%rsp),%ymm10,%ymm10
	vpaddq	  1280(%rsp),%ymm11,%ymm11
	vpaddq	  1312(%rsp),%ymm12,%ymm12
	vpaddq	  1344(%rsp),%ymm13,%ymm13
	vpaddq	  1376(%rsp),%ymm0,%ymm0
	vpaddq	  1408(%rsp),%ymm1,%ymm1
	vpaddq	  1440(%rsp),%ymm2,%ymm2
	vpaddq	  1472(%rsp),%ymm14,%ymm14
	vpaddq	  1504(%rsp),%ymm15,%ymm15
	
	vmovdqa   %ymm10,2112(%rsp)
	vmovdqa   %ymm11,2144(%rsp)
	vmovdqa   %ymm12,2176(%rsp)
	vmovdqa   %ymm13,2208(%rsp)
	vmovdqa   %ymm0,2240(%rsp)
	vmovdqa   %ymm1,2272(%rsp)
	vmovdqa   %ymm2,2304(%rsp)
	vmovdqa   %ymm14,2336(%rsp)
	vmovdqa   %ymm15,2368(%rsp)

	// remaining X3
	vmovdqa   960(%rsp),%ymm10
	vmovdqa   992(%rsp),%ymm11
	vmovdqa   1024(%rsp),%ymm12
	vmovdqa   1056(%rsp),%ymm13
	vmovdqa   1088(%rsp),%ymm0
	vmovdqa   1120(%rsp),%ymm1
	vmovdqa   1152(%rsp),%ymm2

	// T4 ← X3 - Z3
	vpaddq    vec2p0(%rip),%ymm10,%ymm10
	vpaddq    vec2p1_7(%rip),%ymm11,%ymm11
	vpaddq    vec2p1_7(%rip),%ymm12,%ymm12
	vpaddq    vec2p1_7(%rip),%ymm13,%ymm13
	vpaddq    vec2p1_7(%rip),%ymm0,%ymm0
	vpaddq    vec2p1_7(%rip),%ymm1,%ymm1
	vpaddq    vec2p1_7(%rip),%ymm2,%ymm2
	vpaddq    vec2p1_7(%rip),%ymm3,%ymm3
	vpaddq    vec2p8(%rip),%ymm4,%ymm4

	vpsubq	  1248(%rsp),%ymm10,%ymm10
	vpsubq	  1280(%rsp),%ymm11,%ymm11
	vpsubq	  1312(%rsp),%ymm12,%ymm12
	vpsubq	  1344(%rsp),%ymm13,%ymm13
	vpsubq	  1376(%rsp),%ymm0,%ymm0
	vpsubq	  1408(%rsp),%ymm1,%ymm1
	vpsubq	  1440(%rsp),%ymm2,%ymm2
	vpsubq	  1472(%rsp),%ymm3,%ymm3
	vpsubq	  1504(%rsp),%ymm4,%ymm4
	
	vpsrlq    $29,%ymm0,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0
	
	vpsrlq    $29,%ymm10,%ymm15
	vpaddq    %ymm15,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10
	
	vpsrlq    $29,%ymm1,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1	

	vpsrlq    $29,%ymm11,%ymm15
	vpaddq    %ymm15,%ymm12,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11
	
	vpsrlq    $29,%ymm2,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2	

	vpsrlq    $29,%ymm12,%ymm15
	vpaddq    %ymm15,%ymm13,%ymm13
	vpand     vecmask29(%rip),%ymm12,%ymm12
	
	vpsrlq    $29,%ymm3,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3	

	vpsrlq    $29,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpand     vecmask29(%rip),%ymm13,%ymm13

	vpsrlq    $29,%ymm0,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0
	
	vpsrlq    $23,%ymm4,%ymm15
	vpmuludq  vec19(%rip),%ymm15,%ymm15
	vpaddq    %ymm15,%ymm10,%ymm10
	vpand     vecmask23(%rip),%ymm4,%ymm4	

	vpsrlq    $29,%ymm1,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1
	
	vpsrlq    $29,%ymm10,%ymm15
	vpaddq    %ymm15,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10
	
	vmovdqa   %ymm10,2400(%rsp)
	vmovdqa   %ymm11,2432(%rsp)
	vmovdqa   %ymm12,2464(%rsp)
	vmovdqa   %ymm13,2496(%rsp)
	vmovdqa   %ymm0,2528(%rsp)
	vmovdqa   %ymm1,2560(%rsp)
	vmovdqa   %ymm2,2592(%rsp)
	vmovdqa   %ymm3,2624(%rsp)
	vmovdqa   %ymm4,2656(%rsp)
	
	vmovdqa   1664(%rsp),%ymm5

	// X3 ← T1 · T4
	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,2688(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2720(%rsp)

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2752(%rsp)

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2784(%rsp)

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2816(%rsp)

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2848(%rsp)

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2880(%rsp)

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2912(%rsp)

	vpmuludq  %ymm9,%ymm4,%ymm15
	vmovdqa   %ymm15,2944(%rsp)

	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm11,%ymm1,%ymm1
	vpaddq    %ymm12,%ymm2,%ymm2
	vpaddq    %ymm13,%ymm3,%ymm3
	vpaddq    1536(%rsp),%ymm5,%ymm5
	vpaddq    1568(%rsp),%ymm6,%ymm6
	vpaddq    1600(%rsp),%ymm7,%ymm7
	vpaddq    1632(%rsp),%ymm8,%ymm8

	vpmuludq  1536(%rsp),%ymm10,%ymm15
	vmovdqa   %ymm15,2976(%rsp)
	vpaddq    2688(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3200(%rsp)

	vpmuludq  1568(%rsp),%ymm10,%ymm15
	vpmuludq  1536(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3008(%rsp)
	vpaddq    2720(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3232(%rsp)

	vpmuludq  1600(%rsp),%ymm10,%ymm15
	vpmuludq  1568(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1536(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3040(%rsp)
	vpaddq    2752(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3264(%rsp)

	vpmuludq  1632(%rsp),%ymm10,%ymm15
	vpmuludq  1600(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1568(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1536(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3072(%rsp)
	vpaddq    2784(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3296(%rsp)

	vpmuludq  1632(%rsp),%ymm11,%ymm15
	vpmuludq  1600(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1568(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3104(%rsp)
	vpaddq    2816(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3328(%rsp)

	vpmuludq  1632(%rsp),%ymm12,%ymm15
	vpmuludq  1600(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3136(%rsp)
	vpaddq    2848(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3360(%rsp)

	vpmuludq  1632(%rsp),%ymm13,%ymm15
	vmovdqa   %ymm15,3168(%rsp)
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3392(%rsp)

	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,3424(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm10

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm11

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm12

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm13

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm0

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm1

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm2

	vpmuludq  %ymm9,%ymm4,%ymm3

	vmovdqa   3424(%rsp),%ymm9

	vpsubq    3200(%rsp),%ymm9,%ymm9
	vpsubq    3232(%rsp),%ymm10,%ymm10
	vpsubq    3264(%rsp),%ymm11,%ymm11
	vpsubq    3296(%rsp),%ymm12,%ymm12
	vpsubq    3328(%rsp),%ymm13,%ymm13
	vpsubq    3360(%rsp),%ymm0,%ymm0
	vpsubq    3392(%rsp),%ymm1,%ymm1
	vpsubq    2912(%rsp),%ymm2,%ymm2
	vpsubq    2944(%rsp),%ymm3,%ymm3

	vpaddq    3104(%rsp),%ymm9,%ymm9
	vpaddq    3136(%rsp),%ymm10,%ymm10
	vpaddq    3168(%rsp),%ymm11,%ymm11
	vpaddq    2688(%rsp),%ymm13,%ymm13
	vpaddq    2720(%rsp),%ymm0,%ymm0
	vpaddq    2752(%rsp),%ymm1,%ymm1
	vpaddq    2784(%rsp),%ymm2,%ymm2
	vpaddq    2816(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm0,%ymm14
	vpaddq    %ymm14,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0
	vpmuludq  vec1216(%rip),%ymm0,%ymm0
	vpaddq    2976(%rsp),%ymm0,%ymm0

	vpsrlq    $29,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1
	vpmuludq  vec1216(%rip),%ymm1,%ymm1
	vpaddq    3008(%rsp),%ymm1,%ymm1

	vpsrlq    $29,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2
	vpmuludq  vec1216(%rip),%ymm2,%ymm2
	vpaddq    3040(%rsp),%ymm2,%ymm2

	vpsrlq    $29,%ymm3,%ymm14
	vpaddq    2848(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm3,%ymm3
	vpmuludq  vec1216(%rip),%ymm3,%ymm3
	vpaddq    3072(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm4
	vpmuludq  vec1216(%rip),%ymm4,%ymm4
	vpaddq    %ymm9,%ymm4,%ymm4

	vpsrlq    $29,%ymm15,%ymm14
	vpaddq    2912(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm15,%ymm5
	vpmuludq  vec1216(%rip),%ymm5,%ymm5
	vpaddq    %ymm10,%ymm5,%ymm5

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2944(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm6
	vpmuludq  vec1216(%rip),%ymm6,%ymm6
	vpaddq    %ymm11,%ymm6,%ymm6

	vpsrlq    $29,%ymm15,%ymm8
	vpand     vecmask29(%rip),%ymm15,%ymm7

	vpmuludq  vec1216(%rip),%ymm7,%ymm7
	vpaddq    %ymm12,%ymm7,%ymm7
	vpmuludq  vec1216(%rip),%ymm8,%ymm8
	vpaddq    %ymm13,%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm10,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vmovdqa   %ymm0,960(%rsp)
	vmovdqa   %ymm1,992(%rsp)
	vmovdqa   %ymm2,1024(%rsp)
	vmovdqa   %ymm3,1056(%rsp)
	vmovdqa   %ymm4,1088(%rsp)
	vmovdqa   %ymm5,1120(%rsp)
	vmovdqa   %ymm6,1152(%rsp)
	vmovdqa   %ymm7,1184(%rsp)
	vmovdqa   %ymm8,1216(%rsp)

	// Z3 ← T2 · T3
	vmovdqa   1824(%rsp),%ymm10
	vmovdqa   1856(%rsp),%ymm11
	vmovdqa   1888(%rsp),%ymm12
	vmovdqa   1920(%rsp),%ymm13
	vmovdqa   1952(%rsp),%ymm0
	vmovdqa   1984(%rsp),%ymm1
	vmovdqa   2016(%rsp),%ymm2
	vmovdqa   2048(%rsp),%ymm3
	vmovdqa   2080(%rsp),%ymm4

	vmovdqa   2240(%rsp),%ymm5
	vmovdqa   2272(%rsp),%ymm6
	vmovdqa   2304(%rsp),%ymm7
	vmovdqa   2336(%rsp),%ymm8
	vmovdqa   2368(%rsp),%ymm9

	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,2688(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2720(%rsp)

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2752(%rsp)

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2784(%rsp)

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2816(%rsp)

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2848(%rsp)

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2880(%rsp)

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2912(%rsp)

	vpmuludq  %ymm9,%ymm4,%ymm15
	vmovdqa   %ymm15,2944(%rsp)

	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm11,%ymm1,%ymm1
	vpaddq    %ymm12,%ymm2,%ymm2
	vpaddq    %ymm13,%ymm3,%ymm3
	vpaddq    2112(%rsp),%ymm5,%ymm5
	vpaddq    2144(%rsp),%ymm6,%ymm6
	vpaddq    2176(%rsp),%ymm7,%ymm7
	vpaddq    2208(%rsp),%ymm8,%ymm8

	vpmuludq  2112(%rsp),%ymm10,%ymm15
	vmovdqa   %ymm15,2976(%rsp)
	vpaddq    2688(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3200(%rsp)

	vpmuludq  2144(%rsp),%ymm10,%ymm15
	vpmuludq  2112(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3008(%rsp)
	vpaddq    2720(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3232(%rsp)

	vpmuludq  2176(%rsp),%ymm10,%ymm15
	vpmuludq  2144(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  2112(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3040(%rsp)
	vpaddq    2752(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3264(%rsp)

	vpmuludq  2208(%rsp),%ymm10,%ymm15
	vpmuludq  2176(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  2144(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  2112(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3072(%rsp)
	vpaddq    2784(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3296(%rsp)

	vpmuludq  2208(%rsp),%ymm11,%ymm15
	vpmuludq  2176(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  2144(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3104(%rsp)
	vpaddq    2816(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3328(%rsp)

	vpmuludq  2208(%rsp),%ymm12,%ymm15
	vpmuludq  2176(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3136(%rsp)
	vpaddq    2848(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3360(%rsp)

	vpmuludq  2208(%rsp),%ymm13,%ymm15
	vmovdqa   %ymm15,3168(%rsp)
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3392(%rsp)

	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,3424(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm10

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm11

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm12

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm13

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm0

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm1

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm2

	vpmuludq  %ymm9,%ymm4,%ymm3

	vmovdqa   3424(%rsp),%ymm9

	vpsubq    3200(%rsp),%ymm9,%ymm9
	vpsubq    3232(%rsp),%ymm10,%ymm10
	vpsubq    3264(%rsp),%ymm11,%ymm11
	vpsubq    3296(%rsp),%ymm12,%ymm12
	vpsubq    3328(%rsp),%ymm13,%ymm13
	vpsubq    3360(%rsp),%ymm0,%ymm0
	vpsubq    3392(%rsp),%ymm1,%ymm1
	vpsubq    2912(%rsp),%ymm2,%ymm2
	vpsubq    2944(%rsp),%ymm3,%ymm3

	vpaddq    3104(%rsp),%ymm9,%ymm9
	vpaddq    3136(%rsp),%ymm10,%ymm10
	vpaddq    3168(%rsp),%ymm11,%ymm11
	vpaddq    2688(%rsp),%ymm13,%ymm13
	vpaddq    2720(%rsp),%ymm0,%ymm0
	vpaddq    2752(%rsp),%ymm1,%ymm1
	vpaddq    2784(%rsp),%ymm2,%ymm2
	vpaddq    2816(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm0,%ymm14
	vpaddq    %ymm14,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0
	vpmuludq  vec1216(%rip),%ymm0,%ymm0
	vpaddq    2976(%rsp),%ymm0,%ymm0

	vpsrlq    $29,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1
	vpmuludq  vec1216(%rip),%ymm1,%ymm1
	vpaddq    3008(%rsp),%ymm1,%ymm1

	vpsrlq    $29,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2
	vpmuludq  vec1216(%rip),%ymm2,%ymm2
	vpaddq    3040(%rsp),%ymm2,%ymm2

	vpsrlq    $29,%ymm3,%ymm14
	vpaddq    2848(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm3,%ymm3
	vpmuludq  vec1216(%rip),%ymm3,%ymm3
	vpaddq    3072(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm4
	vpmuludq  vec1216(%rip),%ymm4,%ymm4
	vpaddq    %ymm9,%ymm4,%ymm4

	vpsrlq    $29,%ymm15,%ymm14
	vpaddq    2912(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm15,%ymm5
	vpmuludq  vec1216(%rip),%ymm5,%ymm5
	vpaddq    %ymm10,%ymm5,%ymm5

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2944(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm6
	vpmuludq  vec1216(%rip),%ymm6,%ymm6
	vpaddq    %ymm11,%ymm6,%ymm6

	vpsrlq    $29,%ymm15,%ymm8
	vpand     vecmask29(%rip),%ymm15,%ymm7

	vpmuludq  vec1216(%rip),%ymm7,%ymm7
	vpaddq    %ymm12,%ymm7,%ymm7
	vpmuludq  vec1216(%rip),%ymm8,%ymm8
	vpaddq    %ymm13,%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm10,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vmovdqa   %ymm0,1248(%rsp)
	vmovdqa   %ymm1,1280(%rsp)
	vmovdqa   %ymm2,1312(%rsp)
	vmovdqa   %ymm3,1344(%rsp)
	vmovdqa   %ymm4,1376(%rsp)
	vmovdqa   %ymm5,1408(%rsp)
	vmovdqa   %ymm6,1440(%rsp)
	vmovdqa   %ymm7,1472(%rsp)
	vmovdqa   %ymm8,1504(%rsp)

	// conditional select 
	vmovdqa   0(%rsp),%ymm10
	vmovdqa   64(%rsp),%ymm11
	vpsrlq    %xmm10,%ymm11,%ymm11
	vpand     vec1(%rip),%ymm11,%ymm12

	vpxor     32(%rsp),%ymm12,%ymm11
	vmovdqa   %ymm12,32(%rsp)

	vpsubq    one(%rip),%ymm10,%ymm10
	vmovdqa   %ymm10,0(%rsp)

	vmovdqa   vec0(%rip),%ymm10
	vpsubq    %ymm11,%ymm10,%ymm10

	vmovdqa   1536(%rsp),%ymm0
	vmovdqa   1568(%rsp),%ymm1
	vmovdqa   1600(%rsp),%ymm2
	vmovdqa   1632(%rsp),%ymm3
	vmovdqa   1664(%rsp),%ymm4
	vmovdqa   1696(%rsp),%ymm5
	vmovdqa   1728(%rsp),%ymm6
	vmovdqa   1760(%rsp),%ymm7
	vmovdqa   1792(%rsp),%ymm8

	vpxor	  2112(%rsp),%ymm0,%ymm0
	vpxor	  2144(%rsp),%ymm1,%ymm1
	vpxor	  2176(%rsp),%ymm2,%ymm2
	vpxor	  2208(%rsp),%ymm3,%ymm3
	vpxor	  2240(%rsp),%ymm4,%ymm4
	vpxor	  2272(%rsp),%ymm5,%ymm5
	vpxor	  2304(%rsp),%ymm6,%ymm6
	vpxor	  2336(%rsp),%ymm7,%ymm7
	vpxor	  2368(%rsp),%ymm8,%ymm8

	vpand	  %ymm10,%ymm0,%ymm0
	vpand	  %ymm10,%ymm1,%ymm1
	vpand	  %ymm10,%ymm2,%ymm2
	vpand	  %ymm10,%ymm3,%ymm3
	vpand	  %ymm10,%ymm4,%ymm4
	vpand	  %ymm10,%ymm5,%ymm5
	vpand	  %ymm10,%ymm6,%ymm6
	vpand	  %ymm10,%ymm7,%ymm7
	vpand	  %ymm10,%ymm8,%ymm8

	vpxor	  1536(%rsp),%ymm0,%ymm0
	vpxor	  1568(%rsp),%ymm1,%ymm1
	vpxor	  1600(%rsp),%ymm2,%ymm2
	vpxor	  1632(%rsp),%ymm3,%ymm3
	vpxor	  1664(%rsp),%ymm4,%ymm4
	vpxor	  1696(%rsp),%ymm5,%ymm5
	vpxor	  1728(%rsp),%ymm6,%ymm6
	vpxor	  1760(%rsp),%ymm7,%ymm7
	vpxor	  1792(%rsp),%ymm8,%ymm8

	vmovdqa   %ymm0,1536(%rsp)
	vmovdqa   %ymm1,1568(%rsp)
	vmovdqa   %ymm2,1600(%rsp)
	vmovdqa   %ymm3,1632(%rsp)
	vmovdqa   %ymm4,1664(%rsp)
	vmovdqa   %ymm5,1696(%rsp)
	vmovdqa   %ymm6,1728(%rsp)
	vmovdqa   %ymm7,1760(%rsp)
	vmovdqa   %ymm8,1792(%rsp)

	vmovdqa   1824(%rsp),%ymm0
	vmovdqa   1856(%rsp),%ymm1
	vmovdqa   1888(%rsp),%ymm2
	vmovdqa   1920(%rsp),%ymm3
	vmovdqa   1952(%rsp),%ymm4
	vmovdqa   1984(%rsp),%ymm5
	vmovdqa   2016(%rsp),%ymm6
	vmovdqa   2048(%rsp),%ymm7
	vmovdqa   2080(%rsp),%ymm8

	vpxor	  2400(%rsp),%ymm0,%ymm0
	vpxor	  2432(%rsp),%ymm1,%ymm1
	vpxor	  2464(%rsp),%ymm2,%ymm2
	vpxor	  2496(%rsp),%ymm3,%ymm3
	vpxor	  2528(%rsp),%ymm4,%ymm4
	vpxor	  2560(%rsp),%ymm5,%ymm5
	vpxor	  2592(%rsp),%ymm6,%ymm6
	vpxor	  2624(%rsp),%ymm7,%ymm7
	vpxor	  2656(%rsp),%ymm8,%ymm8

	vpand	  %ymm10,%ymm0,%ymm0
	vpand	  %ymm10,%ymm1,%ymm1
	vpand	  %ymm10,%ymm2,%ymm2
	vpand	  %ymm10,%ymm3,%ymm3
	vpand	  %ymm10,%ymm4,%ymm4
	vpand	  %ymm10,%ymm5,%ymm5
	vpand	  %ymm10,%ymm6,%ymm6
	vpand	  %ymm10,%ymm7,%ymm7
	vpand	  %ymm10,%ymm8,%ymm8

	vpxor	  1824(%rsp),%ymm0,%ymm0
	vpxor	  1856(%rsp),%ymm1,%ymm1
	vpxor	  1888(%rsp),%ymm2,%ymm2
	vpxor	  1920(%rsp),%ymm3,%ymm3
	vpxor	  1952(%rsp),%ymm4,%ymm4
	vpxor	  1984(%rsp),%ymm5,%ymm5
	vpxor	  2016(%rsp),%ymm6,%ymm6
	vpxor	  2048(%rsp),%ymm7,%ymm7
	vpxor	  2080(%rsp),%ymm8,%ymm8

	// T2 ← T2^2
	vpmuludq  %ymm1,%ymm8,%ymm15
	vpmuludq  %ymm2,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm3,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm4,%ymm5,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm9

	vpmuludq  %ymm2,%ymm8,%ymm15
	vpmuludq  %ymm3,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm4,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm5,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm10

	vpsrlq    $29,%ymm9,%ymm14
	vpaddq    %ymm14,%ymm10,%ymm10
	vpand     vecmask29(%rip),%ymm9,%ymm9

	vpmuludq  vec1216(%rip),%ymm9,%ymm9
	vpmuludq  %ymm0,%ymm0,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9

	vpmuludq  %ymm3,%ymm8,%ymm15
	vpmuludq  %ymm4,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm11

	vpsrlq    $29,%ymm10,%ymm14
	vpaddq    %ymm14,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10

	vpmuludq  vec1216(%rip),%ymm10,%ymm10
	vpmuludq  %ymm0,%ymm1,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm10,%ymm10
	vpmuludq  %ymm4,%ymm8,%ymm15
	vpmuludq  %ymm5,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm12

	vpsrlq    $29,%ymm11,%ymm14
	vpaddq    %ymm14,%ymm12,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11
	vpmuludq  vec1216(%rip),%ymm11,%ymm11
	vpmuludq  %ymm0,%ymm2,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm1,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm11,%ymm11
	vpmuludq  %ymm5,%ymm8,%ymm15
	vpmuludq  %ymm6,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm13

	vpsrlq    $29,%ymm12,%ymm14
	vpaddq    %ymm14,%ymm13,%ymm13
	vpand     vecmask29(%rip),%ymm12,%ymm12

	vpmuludq  vec1216(%rip),%ymm12,%ymm12
	vpmuludq  %ymm0,%ymm3,%ymm15
	vpmuludq  %ymm1,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm12,%ymm12

	vmovdqa   %ymm11,2688(%rsp)

	vpmuludq  %ymm6,%ymm8,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm14

	vpsrlq    $29,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm13,%ymm13

	vpmuludq  vec1216(%rip),%ymm13,%ymm13
	vpmuludq  %ymm0,%ymm4,%ymm15
	vpmuludq  %ymm1,%ymm3,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm2,%ymm2,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm13,%ymm13

	vmovdqa   %ymm12,2720(%rsp)

	vpmuludq  %ymm7,%ymm8,%ymm15
	vpsllq    $1,%ymm15,%ymm15

	vpsrlq    $29,%ymm14,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm14

	vpmuludq  vec1216(%rip),%ymm14,%ymm14
	vpmuludq  %ymm0,%ymm5,%ymm12
	vpmuludq  %ymm1,%ymm4,%ymm11
	vpaddq    %ymm11,%ymm12,%ymm12
	vpmuludq  %ymm2,%ymm3,%ymm11
	vpaddq    %ymm11,%ymm12,%ymm12
	vpsllq    $1,%ymm12,%ymm12
	vpaddq    %ymm12,%ymm14,%ymm14

	vmovdqa   %ymm13,2752(%rsp)

	vpmuludq  %ymm8,%ymm8,%ymm11

	vpsrlq    $29,%ymm15,%ymm12
	vpaddq    %ymm12,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm15,%ymm15

	vpmuludq  vec1216(%rip),%ymm15,%ymm15
	vpmuludq  %ymm0,%ymm6,%ymm12
	vpmuludq  %ymm1,%ymm5,%ymm13
	vpaddq    %ymm12,%ymm13,%ymm13
	vpmuludq  %ymm2,%ymm4,%ymm12
	vpaddq    %ymm12,%ymm13,%ymm13
	vpsllq    $1,%ymm13,%ymm13
	vpmuludq  %ymm3,%ymm3,%ymm12
	vpaddq    %ymm12,%ymm13,%ymm13
	vpaddq    %ymm13,%ymm15,%ymm15

	vmovdqa   %ymm14,2784(%rsp)

	vpsrlq    $29,%ymm11,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11

	vpmuludq  vec1216(%rip),%ymm11,%ymm11
	vpmuludq  %ymm0,%ymm7,%ymm13
	vpmuludq  %ymm1,%ymm6,%ymm14
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm2,%ymm5,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm3,%ymm4,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpsllq    $1,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm11,%ymm11

	vpmuludq  vec1216(%rip),%ymm12,%ymm12
	vpmuludq  %ymm0,%ymm8,%ymm13
	vpmuludq  %ymm1,%ymm7,%ymm14
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm2,%ymm6,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm3,%ymm5,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpsllq    $1,%ymm14,%ymm14
	vpmuludq  %ymm4,%ymm4,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm12,%ymm12

	vmovdqa   2752(%rsp),%ymm4
	vpsrlq    $29,%ymm4,%ymm5
	vpaddq    2784(%rsp),%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm9,%ymm14
	vpaddq    %ymm14,%ymm10,%ymm1
	vpand     vecmask29(%rip),%ymm9,%ymm0

	vpsrlq    $29,%ymm5,%ymm6
	vpaddq    %ymm15,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm14
	vpaddq    2688(%rsp),%ymm14,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm7
	vpaddq    %ymm11,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm14
	vpaddq    2720(%rsp),%ymm14,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm8
	vpaddq    %ymm12,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpsllq    $1,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpsllq    $3,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm14
	vpaddq    %ymm14,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vmovdqa   %ymm0,1824(%rsp)
	vmovdqa   %ymm1,1856(%rsp)
	vmovdqa   %ymm2,1888(%rsp)
	vmovdqa   %ymm3,1920(%rsp)
	vmovdqa   %ymm4,1952(%rsp)
	vmovdqa   %ymm5,1984(%rsp)
	vmovdqa   %ymm6,2016(%rsp)
	vmovdqa   %ymm7,2048(%rsp)
	vmovdqa   %ymm8,2080(%rsp)

	// T1 ← T1^2
	vmovdqa   1536(%rsp),%ymm0
	vmovdqa   1568(%rsp),%ymm1
	vmovdqa   1600(%rsp),%ymm2
	vmovdqa   1632(%rsp),%ymm3
	vmovdqa   1664(%rsp),%ymm4
	vmovdqa   1696(%rsp),%ymm5
	vmovdqa   1728(%rsp),%ymm6
	vmovdqa   1760(%rsp),%ymm7
	vmovdqa   1792(%rsp),%ymm8

	vpmuludq  %ymm1,%ymm8,%ymm15
	vpmuludq  %ymm2,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm3,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm4,%ymm5,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm9

	vpmuludq  %ymm2,%ymm8,%ymm15
	vpmuludq  %ymm3,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm4,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm5,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm10

	vpsrlq    $29,%ymm9,%ymm14
	vpaddq    %ymm14,%ymm10,%ymm10
	vpand     vecmask29(%rip),%ymm9,%ymm9

	vpmuludq  vec1216(%rip),%ymm9,%ymm9
	vpmuludq  %ymm0,%ymm0,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9

	vpmuludq  %ymm3,%ymm8,%ymm15
	vpmuludq  %ymm4,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm11

	vpsrlq    $29,%ymm10,%ymm14
	vpaddq    %ymm14,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10

	vpmuludq  vec1216(%rip),%ymm10,%ymm10
	vpmuludq  %ymm0,%ymm1,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm10,%ymm10
	vpmuludq  %ymm4,%ymm8,%ymm15
	vpmuludq  %ymm5,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm12

	vpsrlq    $29,%ymm11,%ymm14
	vpaddq    %ymm14,%ymm12,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11
	vpmuludq  vec1216(%rip),%ymm11,%ymm11
	vpmuludq  %ymm0,%ymm2,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm1,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm11,%ymm11
	vpmuludq  %ymm5,%ymm8,%ymm15
	vpmuludq  %ymm6,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm13

	vpsrlq    $29,%ymm12,%ymm14
	vpaddq    %ymm14,%ymm13,%ymm13
	vpand     vecmask29(%rip),%ymm12,%ymm12

	vpmuludq  vec1216(%rip),%ymm12,%ymm12
	vpmuludq  %ymm0,%ymm3,%ymm15
	vpmuludq  %ymm1,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm12,%ymm12

	vmovdqa   %ymm11,2688(%rsp)

	vpmuludq  %ymm6,%ymm8,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm14

	vpsrlq    $29,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm13,%ymm13

	vpmuludq  vec1216(%rip),%ymm13,%ymm13
	vpmuludq  %ymm0,%ymm4,%ymm15
	vpmuludq  %ymm1,%ymm3,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm2,%ymm2,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm13,%ymm13

	vmovdqa   %ymm12,2720(%rsp)

	vpmuludq  %ymm7,%ymm8,%ymm15
	vpsllq    $1,%ymm15,%ymm15

	vpsrlq    $29,%ymm14,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm14

	vpmuludq  vec1216(%rip),%ymm14,%ymm14
	vpmuludq  %ymm0,%ymm5,%ymm12
	vpmuludq  %ymm1,%ymm4,%ymm11
	vpaddq    %ymm11,%ymm12,%ymm12
	vpmuludq  %ymm2,%ymm3,%ymm11
	vpaddq    %ymm11,%ymm12,%ymm12
	vpsllq    $1,%ymm12,%ymm12
	vpaddq    %ymm12,%ymm14,%ymm14

	vmovdqa   %ymm13,2752(%rsp)

	vpmuludq  %ymm8,%ymm8,%ymm11

	vpsrlq    $29,%ymm15,%ymm12
	vpaddq    %ymm12,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm15,%ymm15

	vpmuludq  vec1216(%rip),%ymm15,%ymm15
	vpmuludq  %ymm0,%ymm6,%ymm12
	vpmuludq  %ymm1,%ymm5,%ymm13
	vpaddq    %ymm12,%ymm13,%ymm13
	vpmuludq  %ymm2,%ymm4,%ymm12
	vpaddq    %ymm12,%ymm13,%ymm13
	vpsllq    $1,%ymm13,%ymm13
	vpmuludq  %ymm3,%ymm3,%ymm12
	vpaddq    %ymm12,%ymm13,%ymm13
	vpaddq    %ymm13,%ymm15,%ymm15

	vmovdqa   %ymm14,2784(%rsp)

	vpsrlq    $29,%ymm11,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11

	vpmuludq  vec1216(%rip),%ymm11,%ymm11
	vpmuludq  %ymm0,%ymm7,%ymm13
	vpmuludq  %ymm1,%ymm6,%ymm14
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm2,%ymm5,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm3,%ymm4,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpsllq    $1,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm11,%ymm11

	vpmuludq  vec1216(%rip),%ymm12,%ymm12
	vpmuludq  %ymm0,%ymm8,%ymm13
	vpmuludq  %ymm1,%ymm7,%ymm14
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm2,%ymm6,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm3,%ymm5,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpsllq    $1,%ymm14,%ymm14
	vpmuludq  %ymm4,%ymm4,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm12,%ymm12

	vmovdqa   2752(%rsp),%ymm4
	vpsrlq    $29,%ymm4,%ymm5
	vpaddq    2784(%rsp),%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm9,%ymm14
	vpaddq    %ymm14,%ymm10,%ymm1
	vpand     vecmask29(%rip),%ymm9,%ymm0

	vpsrlq    $29,%ymm5,%ymm6
	vpaddq    %ymm15,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm14
	vpaddq    2688(%rsp),%ymm14,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm7
	vpaddq    %ymm11,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm14
	vpaddq    2720(%rsp),%ymm14,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm8
	vpaddq    %ymm12,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpsllq    $1,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpsllq    $3,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm14
	vpaddq    %ymm14,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vmovdqa   %ymm0,1536(%rsp)
	vmovdqa   %ymm1,1568(%rsp)
	vmovdqa   %ymm2,1600(%rsp)
	vmovdqa   %ymm3,1632(%rsp)
	vmovdqa   %ymm4,1664(%rsp)
	vmovdqa   %ymm5,1696(%rsp)
	vmovdqa   %ymm6,1728(%rsp)
	vmovdqa   %ymm7,1760(%rsp)
	vmovdqa   %ymm8,1792(%rsp)

	// X3
	vmovdqa   960(%rsp),%ymm9
	vmovdqa   992(%rsp),%ymm10
	vmovdqa   1024(%rsp),%ymm11
	vmovdqa   1056(%rsp),%ymm12
	vmovdqa   1088(%rsp),%ymm13
	vmovdqa   1120(%rsp),%ymm14
	vmovdqa   1152(%rsp),%ymm15
	vmovdqa   1184(%rsp),%ymm7
	vmovdqa   1216(%rsp),%ymm8

	// copy X3
	vmovdqa   %ymm9,%ymm0
	vmovdqa   %ymm10,%ymm1
	vmovdqa   %ymm11,%ymm2
	vmovdqa   %ymm12,%ymm3
	vmovdqa   %ymm13,%ymm4
	vmovdqa   %ymm14,%ymm5
	vmovdqa   %ymm15,%ymm6

	// T3 ← X3 + Z3
	vpaddq	  1248(%rsp),%ymm9,%ymm9
	vpaddq	  1280(%rsp),%ymm10,%ymm10
	vpaddq	  1312(%rsp),%ymm11,%ymm11
	vpaddq	  1344(%rsp),%ymm12,%ymm12
	vpaddq	  1376(%rsp),%ymm13,%ymm13
	vpaddq	  1408(%rsp),%ymm14,%ymm14
	vpaddq	  1440(%rsp),%ymm15,%ymm15
	vpaddq	  1472(%rsp),%ymm7,%ymm7
	vpaddq	  1504(%rsp),%ymm8,%ymm8

	vmovdqa   %ymm9,2112(%rsp)
	vmovdqa   %ymm10,2144(%rsp)
	vmovdqa   %ymm11,2176(%rsp)
	vmovdqa   %ymm12,2208(%rsp)
	vmovdqa   %ymm13,2240(%rsp)
	vmovdqa   %ymm14,2272(%rsp)
	vmovdqa   %ymm15,2304(%rsp)
	vmovdqa   %ymm7,2336(%rsp)
	vmovdqa   %ymm8,2368(%rsp)

	// remaining X3
	vmovdqa   1184(%rsp),%ymm7
	vmovdqa   1216(%rsp),%ymm8

	// Z3 ← X3 - Z3
	vpaddq    vec2p0(%rip),%ymm0,%ymm0
	vpaddq    vec2p1_7(%rip),%ymm1,%ymm1
	vpaddq    vec2p1_7(%rip),%ymm2,%ymm2
	vpaddq    vec2p1_7(%rip),%ymm3,%ymm3
	vpaddq    vec2p1_7(%rip),%ymm4,%ymm4
	vpaddq    vec2p1_7(%rip),%ymm5,%ymm5
	vpaddq    vec2p1_7(%rip),%ymm6,%ymm6
	vpaddq    vec2p1_7(%rip),%ymm7,%ymm7
	vpaddq    vec2p8(%rip),%ymm8,%ymm8

	vpsubq	  1248(%rsp),%ymm0,%ymm0
	vpsubq	  1280(%rsp),%ymm1,%ymm1
	vpsubq	  1312(%rsp),%ymm2,%ymm2
	vpsubq	  1344(%rsp),%ymm3,%ymm3
	vpsubq	  1376(%rsp),%ymm4,%ymm4
	vpsubq	  1408(%rsp),%ymm5,%ymm5
	vpsubq	  1440(%rsp),%ymm6,%ymm6
	vpsubq	  1472(%rsp),%ymm7,%ymm7
	vpsubq	  1504(%rsp),%ymm8,%ymm8
	
	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm10
	vpmuludq  vec19(%rip),%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0	

	// Z3 ← Z3^2
	vpmuludq  %ymm1,%ymm8,%ymm15
	vpmuludq  %ymm2,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm3,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm4,%ymm5,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm9

	vpmuludq  %ymm2,%ymm8,%ymm15
	vpmuludq  %ymm3,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm4,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm5,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm10

	vpsrlq    $29,%ymm9,%ymm14
	vpaddq    %ymm14,%ymm10,%ymm10
	vpand     vecmask29(%rip),%ymm9,%ymm9

	vpmuludq  vec1216(%rip),%ymm9,%ymm9
	vpmuludq  %ymm0,%ymm0,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9

	vpmuludq  %ymm3,%ymm8,%ymm15
	vpmuludq  %ymm4,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm11

	vpsrlq    $29,%ymm10,%ymm14
	vpaddq    %ymm14,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10

	vpmuludq  vec1216(%rip),%ymm10,%ymm10
	vpmuludq  %ymm0,%ymm1,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm10,%ymm10
	vpmuludq  %ymm4,%ymm8,%ymm15
	vpmuludq  %ymm5,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm12

	vpsrlq    $29,%ymm11,%ymm14
	vpaddq    %ymm14,%ymm12,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11
	vpmuludq  vec1216(%rip),%ymm11,%ymm11
	vpmuludq  %ymm0,%ymm2,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm1,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm11,%ymm11
	vpmuludq  %ymm5,%ymm8,%ymm15
	vpmuludq  %ymm6,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm13

	vpsrlq    $29,%ymm12,%ymm14
	vpaddq    %ymm14,%ymm13,%ymm13
	vpand     vecmask29(%rip),%ymm12,%ymm12

	vpmuludq  vec1216(%rip),%ymm12,%ymm12
	vpmuludq  %ymm0,%ymm3,%ymm15
	vpmuludq  %ymm1,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm12,%ymm12

	vmovdqa   %ymm11,2688(%rsp)

	vpmuludq  %ymm6,%ymm8,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm14

	vpsrlq    $29,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm13,%ymm13

	vpmuludq  vec1216(%rip),%ymm13,%ymm13
	vpmuludq  %ymm0,%ymm4,%ymm15
	vpmuludq  %ymm1,%ymm3,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm2,%ymm2,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm13,%ymm13

	vmovdqa   %ymm12,2720(%rsp)

	vpmuludq  %ymm7,%ymm8,%ymm15
	vpsllq    $1,%ymm15,%ymm15

	vpsrlq    $29,%ymm14,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm14

	vpmuludq  vec1216(%rip),%ymm14,%ymm14
	vpmuludq  %ymm0,%ymm5,%ymm12
	vpmuludq  %ymm1,%ymm4,%ymm11
	vpaddq    %ymm11,%ymm12,%ymm12
	vpmuludq  %ymm2,%ymm3,%ymm11
	vpaddq    %ymm11,%ymm12,%ymm12
	vpsllq    $1,%ymm12,%ymm12
	vpaddq    %ymm12,%ymm14,%ymm14

	vmovdqa   %ymm13,2752(%rsp)

	vpmuludq  %ymm8,%ymm8,%ymm11

	vpsrlq    $29,%ymm15,%ymm12
	vpaddq    %ymm12,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm15,%ymm15

	vpmuludq  vec1216(%rip),%ymm15,%ymm15
	vpmuludq  %ymm0,%ymm6,%ymm12
	vpmuludq  %ymm1,%ymm5,%ymm13
	vpaddq    %ymm12,%ymm13,%ymm13
	vpmuludq  %ymm2,%ymm4,%ymm12
	vpaddq    %ymm12,%ymm13,%ymm13
	vpsllq    $1,%ymm13,%ymm13
	vpmuludq  %ymm3,%ymm3,%ymm12
	vpaddq    %ymm12,%ymm13,%ymm13
	vpaddq    %ymm13,%ymm15,%ymm15

	vmovdqa   %ymm14,2784(%rsp)

	vpsrlq    $29,%ymm11,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11

	vpmuludq  vec1216(%rip),%ymm11,%ymm11
	vpmuludq  %ymm0,%ymm7,%ymm13
	vpmuludq  %ymm1,%ymm6,%ymm14
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm2,%ymm5,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm3,%ymm4,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpsllq    $1,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm11,%ymm11

	vpmuludq  vec1216(%rip),%ymm12,%ymm12
	vpmuludq  %ymm0,%ymm8,%ymm13
	vpmuludq  %ymm1,%ymm7,%ymm14
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm2,%ymm6,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm3,%ymm5,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpsllq    $1,%ymm14,%ymm14
	vpmuludq  %ymm4,%ymm4,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm12,%ymm12

	vmovdqa   2752(%rsp),%ymm4
	vpsrlq    $29,%ymm4,%ymm5
	vpaddq    2784(%rsp),%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm9,%ymm14
	vpaddq    %ymm14,%ymm10,%ymm1
	vpand     vecmask29(%rip),%ymm9,%ymm0

	vpsrlq    $29,%ymm5,%ymm6
	vpaddq    %ymm15,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm14
	vpaddq    2688(%rsp),%ymm14,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm7
	vpaddq    %ymm11,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm14
	vpaddq    2720(%rsp),%ymm14,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm8
	vpaddq    %ymm12,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpsllq    $1,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpsllq    $3,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm14
	vpaddq    %ymm14,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vmovdqa   %ymm0,1248(%rsp)
	vmovdqa   %ymm1,1280(%rsp)
	vmovdqa   %ymm2,1312(%rsp)
	vmovdqa   %ymm3,1344(%rsp)
	vmovdqa   %ymm4,1376(%rsp)
	vmovdqa   %ymm5,1408(%rsp)
	vmovdqa   %ymm6,1440(%rsp)
	vmovdqa   %ymm7,1472(%rsp)
	vmovdqa   %ymm8,1504(%rsp)

	// X3 ← T3^2
	vmovdqa   2112(%rsp),%ymm0
	vmovdqa   2144(%rsp),%ymm1
	vmovdqa   2176(%rsp),%ymm2
	vmovdqa   2208(%rsp),%ymm3
	vmovdqa   2240(%rsp),%ymm4
	vmovdqa   2272(%rsp),%ymm5
	vmovdqa   2304(%rsp),%ymm6
	vmovdqa   2336(%rsp),%ymm7
	vmovdqa   2368(%rsp),%ymm8

	vpmuludq  %ymm1,%ymm8,%ymm15
	vpmuludq  %ymm2,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm3,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm4,%ymm5,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm9

	vpmuludq  %ymm2,%ymm8,%ymm15
	vpmuludq  %ymm3,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm4,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm5,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm10

	vpsrlq    $29,%ymm9,%ymm14
	vpaddq    %ymm14,%ymm10,%ymm10
	vpand     vecmask29(%rip),%ymm9,%ymm9

	vpmuludq  vec1216(%rip),%ymm9,%ymm9
	vpmuludq  %ymm0,%ymm0,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9

	vpmuludq  %ymm3,%ymm8,%ymm15
	vpmuludq  %ymm4,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm11

	vpsrlq    $29,%ymm10,%ymm14
	vpaddq    %ymm14,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10

	vpmuludq  vec1216(%rip),%ymm10,%ymm10
	vpmuludq  %ymm0,%ymm1,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm10,%ymm10
	vpmuludq  %ymm4,%ymm8,%ymm15
	vpmuludq  %ymm5,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm6,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm12

	vpsrlq    $29,%ymm11,%ymm14
	vpaddq    %ymm14,%ymm12,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11
	vpmuludq  vec1216(%rip),%ymm11,%ymm11
	vpmuludq  %ymm0,%ymm2,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm1,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm11,%ymm11
	vpmuludq  %ymm5,%ymm8,%ymm15
	vpmuludq  %ymm6,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm13

	vpsrlq    $29,%ymm12,%ymm14
	vpaddq    %ymm14,%ymm13,%ymm13
	vpand     vecmask29(%rip),%ymm12,%ymm12

	vpmuludq  vec1216(%rip),%ymm12,%ymm12
	vpmuludq  %ymm0,%ymm3,%ymm15
	vpmuludq  %ymm1,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm12,%ymm12

	vmovdqa   %ymm11,2688(%rsp)

	vpmuludq  %ymm6,%ymm8,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm7,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm14

	vpsrlq    $29,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm13,%ymm13

	vpmuludq  vec1216(%rip),%ymm13,%ymm13
	vpmuludq  %ymm0,%ymm4,%ymm15
	vpmuludq  %ymm1,%ymm3,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpsllq    $1,%ymm15,%ymm15
	vpmuludq  %ymm2,%ymm2,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm13,%ymm13

	vmovdqa   %ymm12,2720(%rsp)

	vpmuludq  %ymm7,%ymm8,%ymm15
	vpsllq    $1,%ymm15,%ymm15

	vpsrlq    $29,%ymm14,%ymm11
	vpaddq    %ymm11,%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm14

	vpmuludq  vec1216(%rip),%ymm14,%ymm14
	vpmuludq  %ymm0,%ymm5,%ymm12
	vpmuludq  %ymm1,%ymm4,%ymm11
	vpaddq    %ymm11,%ymm12,%ymm12
	vpmuludq  %ymm2,%ymm3,%ymm11
	vpaddq    %ymm11,%ymm12,%ymm12
	vpsllq    $1,%ymm12,%ymm12
	vpaddq    %ymm12,%ymm14,%ymm14

	vmovdqa   %ymm13,2752(%rsp)

	vpmuludq  %ymm8,%ymm8,%ymm11

	vpsrlq    $29,%ymm15,%ymm12
	vpaddq    %ymm12,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm15,%ymm15

	vpmuludq  vec1216(%rip),%ymm15,%ymm15
	vpmuludq  %ymm0,%ymm6,%ymm12
	vpmuludq  %ymm1,%ymm5,%ymm13
	vpaddq    %ymm12,%ymm13,%ymm13
	vpmuludq  %ymm2,%ymm4,%ymm12
	vpaddq    %ymm12,%ymm13,%ymm13
	vpsllq    $1,%ymm13,%ymm13
	vpmuludq  %ymm3,%ymm3,%ymm12
	vpaddq    %ymm12,%ymm13,%ymm13
	vpaddq    %ymm13,%ymm15,%ymm15

	vmovdqa   %ymm14,2784(%rsp)

	vpsrlq    $29,%ymm11,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11

	vpmuludq  vec1216(%rip),%ymm11,%ymm11
	vpmuludq  %ymm0,%ymm7,%ymm13
	vpmuludq  %ymm1,%ymm6,%ymm14
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm2,%ymm5,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm3,%ymm4,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpsllq    $1,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm11,%ymm11

	vpmuludq  vec1216(%rip),%ymm12,%ymm12
	vpmuludq  %ymm0,%ymm8,%ymm13
	vpmuludq  %ymm1,%ymm7,%ymm14
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm2,%ymm6,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpmuludq  %ymm3,%ymm5,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpsllq    $1,%ymm14,%ymm14
	vpmuludq  %ymm4,%ymm4,%ymm13
	vpaddq    %ymm13,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm12,%ymm12

	vmovdqa   2752(%rsp),%ymm4
	vpsrlq    $29,%ymm4,%ymm5
	vpaddq    2784(%rsp),%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm9,%ymm14
	vpaddq    %ymm14,%ymm10,%ymm1
	vpand     vecmask29(%rip),%ymm9,%ymm0

	vpsrlq    $29,%ymm5,%ymm6
	vpaddq    %ymm15,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm14
	vpaddq    2688(%rsp),%ymm14,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm7
	vpaddq    %ymm11,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm14
	vpaddq    2720(%rsp),%ymm14,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm8
	vpaddq    %ymm12,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpsllq    $1,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpsllq    $3,%ymm14,%ymm14
	vpaddq    %ymm14,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm14
	vpaddq    %ymm14,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vmovdqa   %ymm0,960(%rsp)
	vmovdqa   %ymm1,992(%rsp)
	vmovdqa   %ymm2,1024(%rsp)
	vmovdqa   %ymm3,1056(%rsp)
	vmovdqa   %ymm4,1088(%rsp)
	vmovdqa   %ymm5,1120(%rsp)
	vmovdqa   %ymm6,1152(%rsp)
	vmovdqa   %ymm7,1184(%rsp)
	vmovdqa   %ymm8,1216(%rsp)

	// T3 ← T1 - T2
	vmovdqa   1536(%rsp),%ymm10
	vmovdqa   1568(%rsp),%ymm11
	vmovdqa   1600(%rsp),%ymm12
	vmovdqa   1632(%rsp),%ymm13
	vmovdqa   1664(%rsp),%ymm0
	vmovdqa   1696(%rsp),%ymm1
	vmovdqa   1728(%rsp),%ymm2
	vmovdqa   1760(%rsp),%ymm3
	vmovdqa   1792(%rsp),%ymm4

	vpaddq    vec2p0(%rip),%ymm10,%ymm10
	vpaddq    vec2p1_7(%rip),%ymm11,%ymm11
	vpaddq    vec2p1_7(%rip),%ymm12,%ymm12
	vpaddq    vec2p1_7(%rip),%ymm13,%ymm13
	vpaddq    vec2p1_7(%rip),%ymm0,%ymm0
	vpaddq    vec2p1_7(%rip),%ymm1,%ymm1
	vpaddq    vec2p1_7(%rip),%ymm2,%ymm2
	vpaddq    vec2p1_7(%rip),%ymm3,%ymm3
	vpaddq    vec2p8(%rip),%ymm4,%ymm4

	vpsubq	  1824(%rsp),%ymm10,%ymm10
	vpsubq	  1856(%rsp),%ymm11,%ymm11
	vpsubq	  1888(%rsp),%ymm12,%ymm12
	vpsubq	  1920(%rsp),%ymm13,%ymm13
	vpsubq	  1952(%rsp),%ymm0,%ymm0
	vpsubq	  1984(%rsp),%ymm1,%ymm1
	vpsubq	  2016(%rsp),%ymm2,%ymm2
	vpsubq	  2048(%rsp),%ymm3,%ymm3
	vpsubq	  2080(%rsp),%ymm4,%ymm4
	
	vpsrlq    $29,%ymm10,%ymm5
	vpaddq    %ymm5,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10

	vpsrlq    $29,%ymm11,%ymm5
	vpaddq    %ymm5,%ymm12,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11

	vpsrlq    $29,%ymm12,%ymm5
	vpaddq    %ymm5,%ymm13,%ymm13
	vpand     vecmask29(%rip),%ymm12,%ymm12

	vpsrlq    $29,%ymm13,%ymm5
	vpaddq    %ymm5,%ymm0,%ymm0
	vpand     vecmask29(%rip),%ymm13,%ymm13

	vpsrlq    $29,%ymm0,%ymm5
	vpaddq    %ymm5,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm1,%ymm5
	vpaddq    %ymm5,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm2,%ymm5
	vpaddq    %ymm5,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm3,%ymm5
	vpaddq    %ymm5,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm4,%ymm5
	vpmuludq  vec19(%rip),%ymm5,%ymm5
	vpaddq    %ymm5,%ymm10,%ymm10
	vpand     vecmask23(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm10,%ymm5
	vpaddq    %ymm5,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10	

	vmovdqa   %ymm10,2112(%rsp)
	vmovdqa   %ymm11,2144(%rsp)
	vmovdqa   %ymm12,2176(%rsp)
	vmovdqa   %ymm13,2208(%rsp)
	vmovdqa   %ymm0,2240(%rsp)
	vmovdqa   %ymm1,2272(%rsp)
	vmovdqa   %ymm2,2304(%rsp)
	vmovdqa   %ymm3,2336(%rsp)
	vmovdqa   %ymm4,2368(%rsp)

	// T4 ← ((A2)/4) · T3
	vpmuludq  veca24(%rip),%ymm10,%ymm10
	vpmuludq  veca24(%rip),%ymm11,%ymm11
	vpmuludq  veca24(%rip),%ymm12,%ymm12
	vpmuludq  veca24(%rip),%ymm13,%ymm13
	vpmuludq  veca24(%rip),%ymm0,%ymm0
	vpmuludq  veca24(%rip),%ymm1,%ymm1
	vpmuludq  veca24(%rip),%ymm2,%ymm2
	vpmuludq  veca24(%rip),%ymm3,%ymm3
	vpmuludq  veca24(%rip),%ymm4,%ymm4

	// T4 ← T4 + T2
	vpaddq	  1824(%rsp),%ymm10,%ymm10
	vpaddq	  1856(%rsp),%ymm11,%ymm11
	vpaddq	  1888(%rsp),%ymm12,%ymm12
	vpaddq	  1920(%rsp),%ymm13,%ymm13
	vpaddq	  1952(%rsp),%ymm0,%ymm0
	vpaddq	  1984(%rsp),%ymm1,%ymm1
	vpaddq	  2016(%rsp),%ymm2,%ymm2
	vpaddq	  2048(%rsp),%ymm3,%ymm3
	vpaddq	  2080(%rsp),%ymm4,%ymm4

	vpsrlq    $29,%ymm10,%ymm15
	vpaddq    %ymm15,%ymm11,%ymm11
	vpand     vecmask29(%rip),%ymm10,%ymm10

	vpsrlq    $29,%ymm11,%ymm15
	vpaddq    %ymm15,%ymm12,%ymm12
	vpand     vecmask29(%rip),%ymm11,%ymm11

	vpsrlq    $29,%ymm12,%ymm15
	vpaddq    %ymm15,%ymm13,%ymm13
	vpand     vecmask29(%rip),%ymm12,%ymm12

	vpsrlq    $29,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpand     vecmask29(%rip),%ymm13,%ymm13

	vpsrlq    $29,%ymm0,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm1,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm2,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm3,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm4,%ymm15
	vpmuludq  vec19(%rip),%ymm15,%ymm15
	vpaddq    %ymm15,%ymm10,%ymm10
	vpand     vecmask23(%rip),%ymm4,%ymm4

	// Z2 ← T3 · T4
	vmovdqa   2240(%rsp),%ymm5
	vmovdqa   2272(%rsp),%ymm6
	vmovdqa   2304(%rsp),%ymm7
	vmovdqa   2336(%rsp),%ymm8
	vmovdqa   2368(%rsp),%ymm9

	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,2688(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2720(%rsp)

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2752(%rsp)

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2784(%rsp)

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2816(%rsp)

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2848(%rsp)

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2880(%rsp)

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2912(%rsp)

	vpmuludq  %ymm9,%ymm4,%ymm15
	vmovdqa   %ymm15,2944(%rsp)

	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm11,%ymm1,%ymm1
	vpaddq    %ymm12,%ymm2,%ymm2
	vpaddq    %ymm13,%ymm3,%ymm3
	vpaddq    2112(%rsp),%ymm5,%ymm5
	vpaddq    2144(%rsp),%ymm6,%ymm6
	vpaddq    2176(%rsp),%ymm7,%ymm7
	vpaddq    2208(%rsp),%ymm8,%ymm8

	vpmuludq  2112(%rsp),%ymm10,%ymm15
	vmovdqa   %ymm15,2976(%rsp)
	vpaddq    2688(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3200(%rsp)

	vpmuludq  2144(%rsp),%ymm10,%ymm15
	vpmuludq  2112(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3008(%rsp)
	vpaddq    2720(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3232(%rsp)

	vpmuludq  2176(%rsp),%ymm10,%ymm15
	vpmuludq  2144(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  2112(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3040(%rsp)
	vpaddq    2752(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3264(%rsp)

	vpmuludq  2208(%rsp),%ymm10,%ymm15
	vpmuludq  2176(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  2144(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  2112(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3072(%rsp)
	vpaddq    2784(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3296(%rsp)

	vpmuludq  2208(%rsp),%ymm11,%ymm15
	vpmuludq  2176(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  2144(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3104(%rsp)
	vpaddq    2816(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3328(%rsp)

	vpmuludq  2208(%rsp),%ymm12,%ymm15
	vpmuludq  2176(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3136(%rsp)
	vpaddq    2848(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3360(%rsp)

	vpmuludq  2208(%rsp),%ymm13,%ymm15
	vmovdqa   %ymm15,3168(%rsp)
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3392(%rsp)

	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,3424(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm10

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm11

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm12

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm13

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm0

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm1

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm2

	vpmuludq  %ymm9,%ymm4,%ymm3

	vmovdqa   3424(%rsp),%ymm9

	vpsubq    3200(%rsp),%ymm9,%ymm9
	vpsubq    3232(%rsp),%ymm10,%ymm10
	vpsubq    3264(%rsp),%ymm11,%ymm11
	vpsubq    3296(%rsp),%ymm12,%ymm12
	vpsubq    3328(%rsp),%ymm13,%ymm13
	vpsubq    3360(%rsp),%ymm0,%ymm0
	vpsubq    3392(%rsp),%ymm1,%ymm1
	vpsubq    2912(%rsp),%ymm2,%ymm2
	vpsubq    2944(%rsp),%ymm3,%ymm3

	vpaddq    3104(%rsp),%ymm9,%ymm9
	vpaddq    3136(%rsp),%ymm10,%ymm10
	vpaddq    3168(%rsp),%ymm11,%ymm11
	vpaddq    2688(%rsp),%ymm13,%ymm13
	vpaddq    2720(%rsp),%ymm0,%ymm0
	vpaddq    2752(%rsp),%ymm1,%ymm1
	vpaddq    2784(%rsp),%ymm2,%ymm2
	vpaddq    2816(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm0,%ymm14
	vpaddq    %ymm14,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0
	vpmuludq  vec1216(%rip),%ymm0,%ymm0
	vpaddq    2976(%rsp),%ymm0,%ymm0

	vpsrlq    $29,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1
	vpmuludq  vec1216(%rip),%ymm1,%ymm1
	vpaddq    3008(%rsp),%ymm1,%ymm1

	vpsrlq    $29,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2
	vpmuludq  vec1216(%rip),%ymm2,%ymm2
	vpaddq    3040(%rsp),%ymm2,%ymm2

	vpsrlq    $29,%ymm3,%ymm14
	vpaddq    2848(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm3,%ymm3
	vpmuludq  vec1216(%rip),%ymm3,%ymm3
	vpaddq    3072(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm4
	vpmuludq  vec1216(%rip),%ymm4,%ymm4
	vpaddq    %ymm9,%ymm4,%ymm4

	vpsrlq    $29,%ymm15,%ymm14
	vpaddq    2912(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm15,%ymm5
	vpmuludq  vec1216(%rip),%ymm5,%ymm5
	vpaddq    %ymm10,%ymm5,%ymm5

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2944(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm6
	vpmuludq  vec1216(%rip),%ymm6,%ymm6
	vpaddq    %ymm11,%ymm6,%ymm6

	vpsrlq    $29,%ymm15,%ymm8
	vpand     vecmask29(%rip),%ymm15,%ymm7

	vpmuludq  vec1216(%rip),%ymm7,%ymm7
	vpaddq    %ymm12,%ymm7,%ymm7
	vpmuludq  vec1216(%rip),%ymm8,%ymm8
	vpaddq    %ymm13,%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm10,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vmovdqa   %ymm0,672(%rsp)
	vmovdqa   %ymm1,704(%rsp)
	vmovdqa   %ymm2,736(%rsp)
	vmovdqa   %ymm3,768(%rsp)
	vmovdqa   %ymm4,800(%rsp)
	vmovdqa   %ymm5,832(%rsp)
	vmovdqa   %ymm6,864(%rsp)
	vmovdqa   %ymm7,896(%rsp)
	vmovdqa   %ymm8,928(%rsp)

	// X2 ← T1 · T2
	vmovdqa   1824(%rsp),%ymm10
	vmovdqa   1856(%rsp),%ymm11
	vmovdqa   1888(%rsp),%ymm12
	vmovdqa   1920(%rsp),%ymm13
	vmovdqa   1952(%rsp),%ymm0
	vmovdqa   1984(%rsp),%ymm1
	vmovdqa   2016(%rsp),%ymm2
	vmovdqa   2048(%rsp),%ymm3
	vmovdqa   2080(%rsp),%ymm4

	vmovdqa   1664(%rsp),%ymm5
	vmovdqa   1696(%rsp),%ymm6
	vmovdqa   1728(%rsp),%ymm7
	vmovdqa   1760(%rsp),%ymm8
	vmovdqa   1792(%rsp),%ymm9

	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,2688(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2720(%rsp)

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2752(%rsp)

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2784(%rsp)

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2816(%rsp)

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2848(%rsp)

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2880(%rsp)

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2912(%rsp)

	vpmuludq  %ymm9,%ymm4,%ymm15
	vmovdqa   %ymm15,2944(%rsp)

	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm11,%ymm1,%ymm1
	vpaddq    %ymm12,%ymm2,%ymm2
	vpaddq    %ymm13,%ymm3,%ymm3
	vpaddq    1536(%rsp),%ymm5,%ymm5
	vpaddq    1568(%rsp),%ymm6,%ymm6
	vpaddq    1600(%rsp),%ymm7,%ymm7
	vpaddq    1632(%rsp),%ymm8,%ymm8

	vpmuludq  1536(%rsp),%ymm10,%ymm15
	vmovdqa   %ymm15,2976(%rsp)
	vpaddq    2688(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3200(%rsp)

	vpmuludq  1568(%rsp),%ymm10,%ymm15
	vpmuludq  1536(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3008(%rsp)
	vpaddq    2720(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3232(%rsp)

	vpmuludq  1600(%rsp),%ymm10,%ymm15
	vpmuludq  1568(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1536(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3040(%rsp)
	vpaddq    2752(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3264(%rsp)

	vpmuludq  1632(%rsp),%ymm10,%ymm15
	vpmuludq  1600(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1568(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1536(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3072(%rsp)
	vpaddq    2784(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3296(%rsp)

	vpmuludq  1632(%rsp),%ymm11,%ymm15
	vpmuludq  1600(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1568(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3104(%rsp)
	vpaddq    2816(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3328(%rsp)

	vpmuludq  1632(%rsp),%ymm12,%ymm15
	vpmuludq  1600(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3136(%rsp)
	vpaddq    2848(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3360(%rsp)

	vpmuludq  1632(%rsp),%ymm13,%ymm15
	vmovdqa   %ymm15,3168(%rsp)
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3392(%rsp)

	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,3424(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm10

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm11

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm12

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm13

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm0

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm1

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm2

	vpmuludq  %ymm9,%ymm4,%ymm3

	vmovdqa   3424(%rsp),%ymm9

	vpsubq    3200(%rsp),%ymm9,%ymm9
	vpsubq    3232(%rsp),%ymm10,%ymm10
	vpsubq    3264(%rsp),%ymm11,%ymm11
	vpsubq    3296(%rsp),%ymm12,%ymm12
	vpsubq    3328(%rsp),%ymm13,%ymm13
	vpsubq    3360(%rsp),%ymm0,%ymm0
	vpsubq    3392(%rsp),%ymm1,%ymm1
	vpsubq    2912(%rsp),%ymm2,%ymm2
	vpsubq    2944(%rsp),%ymm3,%ymm3

	vpaddq    3104(%rsp),%ymm9,%ymm9
	vpaddq    3136(%rsp),%ymm10,%ymm10
	vpaddq    3168(%rsp),%ymm11,%ymm11
	vpaddq    2688(%rsp),%ymm13,%ymm13
	vpaddq    2720(%rsp),%ymm0,%ymm0
	vpaddq    2752(%rsp),%ymm1,%ymm1
	vpaddq    2784(%rsp),%ymm2,%ymm2
	vpaddq    2816(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm0,%ymm14
	vpaddq    %ymm14,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0
	vpmuludq  vec1216(%rip),%ymm0,%ymm0
	vpaddq    2976(%rsp),%ymm0,%ymm0

	vpsrlq    $29,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1
	vpmuludq  vec1216(%rip),%ymm1,%ymm1
	vpaddq    3008(%rsp),%ymm1,%ymm1

	vpsrlq    $29,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2
	vpmuludq  vec1216(%rip),%ymm2,%ymm2
	vpaddq    3040(%rsp),%ymm2,%ymm2

	vpsrlq    $29,%ymm3,%ymm14
	vpaddq    2848(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm3,%ymm3
	vpmuludq  vec1216(%rip),%ymm3,%ymm3
	vpaddq    3072(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm4
	vpmuludq  vec1216(%rip),%ymm4,%ymm4
	vpaddq    %ymm9,%ymm4,%ymm4

	vpsrlq    $29,%ymm15,%ymm14
	vpaddq    2912(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm15,%ymm5
	vpmuludq  vec1216(%rip),%ymm5,%ymm5
	vpaddq    %ymm10,%ymm5,%ymm5

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2944(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm6
	vpmuludq  vec1216(%rip),%ymm6,%ymm6
	vpaddq    %ymm11,%ymm6,%ymm6

	vpsrlq    $29,%ymm15,%ymm8
	vpand     vecmask29(%rip),%ymm15,%ymm7

	vpmuludq  vec1216(%rip),%ymm7,%ymm7
	vpaddq    %ymm12,%ymm7,%ymm7
	vpmuludq  vec1216(%rip),%ymm8,%ymm8
	vpaddq    %ymm13,%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm10,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vmovdqa   %ymm0,384(%rsp)
	vmovdqa   %ymm1,416(%rsp)
	vmovdqa   %ymm2,448(%rsp)
	vmovdqa   %ymm3,480(%rsp)
	vmovdqa   %ymm4,512(%rsp)
	vmovdqa   %ymm5,544(%rsp)
	vmovdqa   %ymm6,576(%rsp)
	vmovdqa   %ymm7,608(%rsp)
	vmovdqa   %ymm8,640(%rsp)

	// Z3 ← Z3 · X1
	vmovdqa   96(%rsp),%ymm10
	vmovdqa   128(%rsp),%ymm11
	vmovdqa   160(%rsp),%ymm12
	vmovdqa   192(%rsp),%ymm13
	vmovdqa   224(%rsp),%ymm0
	vmovdqa   256(%rsp),%ymm1
	vmovdqa   288(%rsp),%ymm2
	vmovdqa   320(%rsp),%ymm3
	vmovdqa   352(%rsp),%ymm4

	vmovdqa   1376(%rsp),%ymm5
	vmovdqa   1408(%rsp),%ymm6
	vmovdqa   1440(%rsp),%ymm7
	vmovdqa   1472(%rsp),%ymm8
	vmovdqa   1504(%rsp),%ymm9

	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,2688(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2720(%rsp)

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2752(%rsp)

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2784(%rsp)

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2816(%rsp)

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2848(%rsp)

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2880(%rsp)

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,2912(%rsp)

	vpmuludq  %ymm9,%ymm4,%ymm15
	vmovdqa   %ymm15,2944(%rsp)

	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm11,%ymm1,%ymm1
	vpaddq    %ymm12,%ymm2,%ymm2
	vpaddq    %ymm13,%ymm3,%ymm3
	vpaddq    1248(%rsp),%ymm5,%ymm5
	vpaddq    1280(%rsp),%ymm6,%ymm6
	vpaddq    1312(%rsp),%ymm7,%ymm7
	vpaddq    1344(%rsp),%ymm8,%ymm8

	vpmuludq  1248(%rsp),%ymm10,%ymm15
	vmovdqa   %ymm15,2976(%rsp)
	vpaddq    2688(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3200(%rsp)

	vpmuludq  1280(%rsp),%ymm10,%ymm15
	vpmuludq  1248(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3008(%rsp)
	vpaddq    2720(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3232(%rsp)

	vpmuludq  1312(%rsp),%ymm10,%ymm15
	vpmuludq  1280(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1248(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3040(%rsp)
	vpaddq    2752(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3264(%rsp)

	vpmuludq  1344(%rsp),%ymm10,%ymm15
	vpmuludq  1312(%rsp),%ymm11,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1280(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1248(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3072(%rsp)
	vpaddq    2784(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3296(%rsp)

	vpmuludq  1344(%rsp),%ymm11,%ymm15
	vpmuludq  1312(%rsp),%ymm12,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  1280(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3104(%rsp)
	vpaddq    2816(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3328(%rsp)

	vpmuludq  1344(%rsp),%ymm12,%ymm15
	vpmuludq  1312(%rsp),%ymm13,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vmovdqa   %ymm15,3136(%rsp)
	vpaddq    2848(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3360(%rsp)

	vpmuludq  1344(%rsp),%ymm13,%ymm15
	vmovdqa   %ymm15,3168(%rsp)
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vmovdqa   %ymm15,3392(%rsp)

	vpmuludq  %ymm5,%ymm0,%ymm15
	vmovdqa   %ymm15,3424(%rsp)

	vpmuludq  %ymm6,%ymm0,%ymm15
	vpmuludq  %ymm5,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm10

	vpmuludq  %ymm7,%ymm0,%ymm15
	vpmuludq  %ymm6,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm11

	vpmuludq  %ymm8,%ymm0,%ymm15
	vpmuludq  %ymm7,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm12

	vpmuludq  %ymm9,%ymm0,%ymm15
	vpmuludq  %ymm8,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm5,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm13

	vpmuludq  %ymm9,%ymm1,%ymm15
	vpmuludq  %ymm8,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm6,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm0

	vpmuludq  %ymm9,%ymm2,%ymm15
	vpmuludq  %ymm8,%ymm3,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm15
	vpmuludq  %ymm7,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm1

	vpmuludq  %ymm9,%ymm3,%ymm15
	vpmuludq  %ymm8,%ymm4,%ymm14
	vpaddq    %ymm14,%ymm15,%ymm2

	vpmuludq  %ymm9,%ymm4,%ymm3

	vmovdqa   3424(%rsp),%ymm9

	vpsubq    3200(%rsp),%ymm9,%ymm9
	vpsubq    3232(%rsp),%ymm10,%ymm10
	vpsubq    3264(%rsp),%ymm11,%ymm11
	vpsubq    3296(%rsp),%ymm12,%ymm12
	vpsubq    3328(%rsp),%ymm13,%ymm13
	vpsubq    3360(%rsp),%ymm0,%ymm0
	vpsubq    3392(%rsp),%ymm1,%ymm1
	vpsubq    2912(%rsp),%ymm2,%ymm2
	vpsubq    2944(%rsp),%ymm3,%ymm3
	vpaddq    3104(%rsp),%ymm9,%ymm9
	vpaddq    3136(%rsp),%ymm10,%ymm10
	vpaddq    3168(%rsp),%ymm11,%ymm11
	vpaddq    2688(%rsp),%ymm13,%ymm13
	vpaddq    2720(%rsp),%ymm0,%ymm0
	vpaddq    2752(%rsp),%ymm1,%ymm1
	vpaddq    2784(%rsp),%ymm2,%ymm2
	vpaddq    2816(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm0,%ymm14
	vpaddq    %ymm14,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0
	vpmuludq  vec1216(%rip),%ymm0,%ymm0
	vpaddq    2976(%rsp),%ymm0,%ymm0

	vpsrlq    $29,%ymm1,%ymm14
	vpaddq    %ymm14,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1
	vpmuludq  vec1216(%rip),%ymm1,%ymm1
	vpaddq    3008(%rsp),%ymm1,%ymm1

	vpsrlq    $29,%ymm2,%ymm14
	vpaddq    %ymm14,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2
	vpmuludq  vec1216(%rip),%ymm2,%ymm2
	vpaddq    3040(%rsp),%ymm2,%ymm2

	vpsrlq    $29,%ymm3,%ymm14
	vpaddq    2848(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm3,%ymm3
	vpmuludq  vec1216(%rip),%ymm3,%ymm3
	vpaddq    3072(%rsp),%ymm3,%ymm3

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2880(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm4
	vpmuludq  vec1216(%rip),%ymm4,%ymm4
	vpaddq    %ymm9,%ymm4,%ymm4

	vpsrlq    $29,%ymm15,%ymm14
	vpaddq    2912(%rsp),%ymm14,%ymm14
	vpand     vecmask29(%rip),%ymm15,%ymm5
	vpmuludq  vec1216(%rip),%ymm5,%ymm5
	vpaddq    %ymm10,%ymm5,%ymm5

	vpsrlq    $29,%ymm14,%ymm15
	vpaddq    2944(%rsp),%ymm15,%ymm15
	vpand     vecmask29(%rip),%ymm14,%ymm6
	vpmuludq  vec1216(%rip),%ymm6,%ymm6
	vpaddq    %ymm11,%ymm6,%ymm6

	vpsrlq    $29,%ymm15,%ymm8
	vpand     vecmask29(%rip),%ymm15,%ymm7

	vpmuludq  vec1216(%rip),%ymm7,%ymm7
	vpaddq    %ymm12,%ymm7,%ymm7
	vpmuludq  vec1216(%rip),%ymm8,%ymm8
	vpaddq    %ymm13,%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $29,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $23,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpaddq    %ymm10,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vmovdqa   %ymm0,1248(%rsp)
	vmovdqa   %ymm1,1280(%rsp)
	vmovdqa   %ymm2,1312(%rsp)
	vmovdqa   %ymm3,1344(%rsp)
	vmovdqa   %ymm4,1376(%rsp)
	vmovdqa   %ymm5,1408(%rsp)
	vmovdqa   %ymm6,1440(%rsp)
	vmovdqa   %ymm7,1472(%rsp)
	vmovdqa   %ymm8,1504(%rsp)

	subb      $1,%cl
	cmpb      $0,%cl
	jge       .L2
	
	vmovdqa   sixtythree(%rip),%ymm0
	vmovdqa   %ymm0,0(%rsp)
	movb      $63,%cl
	subq      $32,%r9
	cmpq      $0,%r9
	jge       .L1

	// reduce X2
	vmovdqa   384(%rsp),%ymm0
	vmovdqa   416(%rsp),%ymm1
	vmovdqa   448(%rsp),%ymm2
	vmovdqa   480(%rsp),%ymm3
	vmovdqa   512(%rsp),%ymm4
	vmovdqa   544(%rsp),%ymm5
	vmovdqa   576(%rsp),%ymm6
	vmovdqa   608(%rsp),%ymm7
	vmovdqa   640(%rsp),%ymm8

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $23,%ymm8,%ymm10
	vpmuludq  vec19(%rip),%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	// store X2
	vmovdqa   %ymm0,0(%rdi)
	vmovdqa   %ymm1,32(%rdi)
	vmovdqa   %ymm2,64(%rdi)
	vmovdqa   %ymm3,96(%rdi)
	vmovdqa   %ymm4,128(%rdi)
	vmovdqa   %ymm5,160(%rdi)
	vmovdqa   %ymm6,192(%rdi)
	vmovdqa   %ymm7,224(%rdi)
	vmovdqa   %ymm8,256(%rdi)

	// reduce Z2
	vmovdqa   672(%rsp),%ymm0
	vmovdqa   704(%rsp),%ymm1
	vmovdqa   736(%rsp),%ymm2
	vmovdqa   768(%rsp),%ymm3
	vmovdqa   800(%rsp),%ymm4
	vmovdqa   832(%rsp),%ymm5
	vmovdqa   864(%rsp),%ymm6
	vmovdqa   896(%rsp),%ymm7
	vmovdqa   928(%rsp),%ymm8

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	vpsrlq    $29,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask29(%rip),%ymm1,%ymm1

	vpsrlq    $29,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask29(%rip),%ymm2,%ymm2

	vpsrlq    $29,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask29(%rip),%ymm3,%ymm3

	vpsrlq    $29,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask29(%rip),%ymm4,%ymm4

	vpsrlq    $29,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask29(%rip),%ymm5,%ymm5

	vpsrlq    $29,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask29(%rip),%ymm6,%ymm6

	vpsrlq    $29,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask29(%rip),%ymm7,%ymm7

	vpsrlq    $23,%ymm8,%ymm10
	vpmuludq  vec19(%rip),%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask23(%rip),%ymm8,%ymm8

	vpsrlq    $29,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask29(%rip),%ymm0,%ymm0

	// store Z2
	vmovdqa   %ymm0,288(%rdi)
	vmovdqa   %ymm1,320(%rdi)
	vmovdqa   %ymm2,352(%rdi)
	vmovdqa   %ymm3,384(%rdi)
	vmovdqa   %ymm4,416(%rdi)
	vmovdqa   %ymm5,448(%rdi)
	vmovdqa   %ymm6,480(%rdi)
	vmovdqa   %ymm7,512(%rdi)
	vmovdqa   %ymm8,544(%rdi)

	movq 	  %r8,%rsp

	ret
.section	.note.GNU-stack,"",@progbits
