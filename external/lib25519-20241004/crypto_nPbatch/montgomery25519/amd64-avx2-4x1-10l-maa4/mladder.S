#include "crypto_asm_hidden.h"
#include "consts_namespace.h"

// 4-way Montgomery ladder, 10-limb implementation

	.p2align 5

ASM_HIDDEN _CRYPTO_SHARED_NAMESPACE(mladder_4x1)
.globl _CRYPTO_SHARED_NAMESPACE(mladder_4x1)
ASM_HIDDEN CRYPTO_SHARED_NAMESPACE(mladder_4x1)
.globl CRYPTO_SHARED_NAMESPACE(mladder_4x1)
_CRYPTO_SHARED_NAMESPACE(mladder_4x1):
CRYPTO_SHARED_NAMESPACE(mladder_4x1):

	movq 	%rsp,%r8
	andq 	$-32,%rsp
	subq 	$2976,%rsp

	vmovdqa    vec0(%rip),%ymm0
	vmovdqa    vec1(%rip),%ymm1

	// X1 ← XP,X3 ← XP
	vmovdqa    0(%rsi),%ymm2
	vmovdqa    %ymm2,96(%rsp)
	vmovdqa    %ymm2,1056(%rsp)

	vmovdqa    32(%rsi),%ymm2
	vmovdqa    %ymm2,128(%rsp)
	vmovdqa    %ymm2,1088(%rsp)

	vmovdqa    64(%rsi),%ymm2
	vmovdqa    %ymm2,160(%rsp)
	vmovdqa    %ymm2,1120(%rsp)

	vmovdqa    96(%rsi),%ymm2
	vmovdqa    %ymm2,192(%rsp)
	vmovdqa    %ymm2,1152(%rsp)

	vmovdqa    128(%rsi),%ymm2
	vmovdqa    %ymm2,224(%rsp)
	vmovdqa    %ymm2,1184(%rsp)

	vmovdqa    160(%rsi),%ymm2
	vmovdqa    %ymm2,256(%rsp)
	vmovdqa    %ymm2,1216(%rsp)

	vmovdqa    192(%rsi),%ymm2
	vmovdqa    %ymm2,288(%rsp)
	vmovdqa    %ymm2,1248(%rsp)

	vmovdqa    224(%rsi),%ymm2
	vmovdqa    %ymm2,320(%rsp)
	vmovdqa    %ymm2,1280(%rsp)

	vmovdqa    256(%rsi),%ymm2
	vmovdqa    %ymm2,352(%rsp)
	vmovdqa    %ymm2,1312(%rsp)

	vmovdqa    288(%rsi),%ymm2
	vmovdqa    %ymm2,384(%rsp)
	vmovdqa    %ymm2,1344(%rsp)

	// X2 ← 1
	vmovdqa    %ymm1,416(%rsp)
	vmovdqa    %ymm0,448(%rsp)
	vmovdqa    %ymm0,480(%rsp)
	vmovdqa    %ymm0,512(%rsp)
	vmovdqa    %ymm0,544(%rsp)
	vmovdqa    %ymm0,576(%rsp)
	vmovdqa    %ymm0,608(%rsp)
	vmovdqa    %ymm0,640(%rsp)
	vmovdqa    %ymm0,672(%rsp)
	vmovdqa    %ymm0,704(%rsp)

	// Z2 ← 0
	vmovdqa    %ymm0,736(%rsp)
	vmovdqa    %ymm0,768(%rsp)
	vmovdqa    %ymm0,800(%rsp)
	vmovdqa    %ymm0,832(%rsp)
	vmovdqa    %ymm0,864(%rsp)
	vmovdqa    %ymm0,896(%rsp)
	vmovdqa    %ymm0,928(%rsp)
	vmovdqa    %ymm0,960(%rsp)
	vmovdqa    %ymm0,992(%rsp)
	vmovdqa    %ymm0,1024(%rsp)

	// Z3 ← 1
	vmovdqa    %ymm1,1376(%rsp)
	vmovdqa    %ymm0,1408(%rsp)
	vmovdqa    %ymm0,1440(%rsp)
	vmovdqa    %ymm0,1472(%rsp)
	vmovdqa    %ymm0,1504(%rsp)
	vmovdqa    %ymm0,1536(%rsp)
	vmovdqa    %ymm0,1568(%rsp)
	vmovdqa    %ymm0,1600(%rsp)
	vmovdqa    %ymm0,1632(%rsp)
	vmovdqa    %ymm0,1664(%rsp)

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
	vmovdqa   416(%rsp),%ymm10
	vmovdqa   448(%rsp),%ymm11
	vmovdqa   480(%rsp),%ymm12
	vmovdqa   512(%rsp),%ymm13
	vmovdqa   544(%rsp),%ymm14
	vmovdqa   576(%rsp),%ymm15
	vmovdqa   608(%rsp),%ymm6
	vmovdqa   640(%rsp),%ymm7
	vmovdqa   672(%rsp),%ymm8
	vmovdqa   704(%rsp),%ymm9

	// copy X2
	vmovdqa   %ymm10,%ymm0
	vmovdqa   %ymm11,%ymm1
	vmovdqa   %ymm12,%ymm2
	vmovdqa   %ymm13,%ymm3
	vmovdqa   %ymm14,%ymm4
	vmovdqa   %ymm15,%ymm5

	// T1 ← X2 + Z2
	vpaddq	  736(%rsp),%ymm10,%ymm10
	vpaddq	  768(%rsp),%ymm11,%ymm11
	vpaddq	  800(%rsp),%ymm12,%ymm12
	vpaddq	  832(%rsp),%ymm13,%ymm13
	vpaddq	  864(%rsp),%ymm14,%ymm14
	vpaddq	  896(%rsp),%ymm15,%ymm15
	vpaddq	  928(%rsp),%ymm6,%ymm6
	vpaddq	  960(%rsp),%ymm7,%ymm7
	vpaddq	  992(%rsp),%ymm8,%ymm8
	vpaddq	  1024(%rsp),%ymm9,%ymm9

	vmovdqa   %ymm10,1696(%rsp)
	vmovdqa   %ymm11,1728(%rsp)
	vmovdqa   %ymm12,1760(%rsp)
	vmovdqa   %ymm13,1792(%rsp)
	vmovdqa   %ymm14,1824(%rsp)
	vmovdqa   %ymm15,1856(%rsp)
	vmovdqa   %ymm6,1888(%rsp)
	vmovdqa   %ymm7,1920(%rsp)
	vmovdqa   %ymm8,1952(%rsp)
	vmovdqa   %ymm9,1984(%rsp)

	// remaining X2
	vmovdqa   608(%rsp),%ymm6
	vmovdqa   640(%rsp),%ymm7
	vmovdqa   672(%rsp),%ymm8
	vmovdqa   704(%rsp),%ymm9

	// T2 ← X2 - Z2
	vpaddq    vec2p0(%rip),%ymm0,%ymm0
	vpaddq    vec2p13579(%rip),%ymm1,%ymm1
	vpaddq    vec2p2468(%rip),%ymm2,%ymm2
	vpaddq    vec2p13579(%rip),%ymm3,%ymm3
	vpaddq    vec2p2468(%rip),%ymm4,%ymm4
	vpaddq    vec2p13579(%rip),%ymm5,%ymm5
	vpaddq    vec2p2468(%rip),%ymm6,%ymm6
	vpaddq    vec2p13579(%rip),%ymm7,%ymm7
	vpaddq    vec2p2468(%rip),%ymm8,%ymm8
	vpaddq    vec2p13579(%rip),%ymm9,%ymm9

	vpsubq	  736(%rsp),%ymm0,%ymm0
	vpsubq	  768(%rsp),%ymm1,%ymm1
	vpsubq	  800(%rsp),%ymm2,%ymm2
	vpsubq	  832(%rsp),%ymm3,%ymm3
	vpsubq	  864(%rsp),%ymm4,%ymm4
	vpsubq	  896(%rsp),%ymm5,%ymm5
	vpsubq	  928(%rsp),%ymm6,%ymm6
	vpsubq	  960(%rsp),%ymm7,%ymm7
	vpsubq	  992(%rsp),%ymm8,%ymm8
	vpsubq	  1024(%rsp),%ymm9,%ymm9

	vmovdqa   %ymm0,2016(%rsp)
	vmovdqa   %ymm1,2048(%rsp)
	vmovdqa   %ymm2,2080(%rsp)
	vmovdqa   %ymm3,2112(%rsp)
	vmovdqa   %ymm4,2144(%rsp)
	vmovdqa   %ymm5,2176(%rsp)
	vmovdqa   %ymm6,2208(%rsp)
	vmovdqa   %ymm7,2240(%rsp)
	vmovdqa   %ymm8,2272(%rsp)
	vmovdqa   %ymm9,2304(%rsp)

	// X3
	vmovdqa   1056(%rsp),%ymm10
	vmovdqa   1088(%rsp),%ymm11
	vmovdqa   1120(%rsp),%ymm12
	vmovdqa   1152(%rsp),%ymm13
	vmovdqa   1184(%rsp),%ymm14
	vmovdqa   1216(%rsp),%ymm15
	vmovdqa   1248(%rsp),%ymm6
	vmovdqa   1280(%rsp),%ymm7
	vmovdqa   1312(%rsp),%ymm8
	vmovdqa   1344(%rsp),%ymm9

	// copy X3
	vmovdqa   %ymm10,%ymm0
	vmovdqa   %ymm11,%ymm1
	vmovdqa   %ymm12,%ymm2
	vmovdqa   %ymm13,%ymm3
	vmovdqa   %ymm14,%ymm4
	vmovdqa   %ymm15,%ymm5

	// T3 ← X3 + Z3
	vpaddq	  1376(%rsp),%ymm10,%ymm10
	vpaddq	  1408(%rsp),%ymm11,%ymm11
	vpaddq	  1440(%rsp),%ymm12,%ymm12
	vpaddq	  1472(%rsp),%ymm13,%ymm13
	vpaddq	  1504(%rsp),%ymm14,%ymm14
	vpaddq	  1536(%rsp),%ymm15,%ymm15
	vpaddq	  1568(%rsp),%ymm6,%ymm6
	vpaddq	  1600(%rsp),%ymm7,%ymm7
	vpaddq	  1632(%rsp),%ymm8,%ymm8
	vpaddq	  1664(%rsp),%ymm9,%ymm9

	vmovdqa   %ymm10,2336(%rsp)
	vmovdqa   %ymm11,2368(%rsp)
	vmovdqa   %ymm12,2400(%rsp)
	vmovdqa   %ymm13,2432(%rsp)
	vmovdqa   %ymm14,2464(%rsp)
	vmovdqa   %ymm15,2496(%rsp)
	vmovdqa   %ymm6,2528(%rsp)
	vmovdqa   %ymm7,2560(%rsp)
	vmovdqa   %ymm8,2592(%rsp)
	vmovdqa   %ymm9,2624(%rsp)

	// remaining X3
	vmovdqa   1248(%rsp),%ymm6
	vmovdqa   1280(%rsp),%ymm7
	vmovdqa   1312(%rsp),%ymm8
	vmovdqa   1344(%rsp),%ymm9

	// T4 ← X3 - Z3
	vpaddq    vec2p0(%rip),%ymm0,%ymm0
	vpaddq    vec2p13579(%rip),%ymm1,%ymm1
	vpaddq    vec2p2468(%rip),%ymm2,%ymm2
	vpaddq    vec2p13579(%rip),%ymm3,%ymm3
	vpaddq    vec2p2468(%rip),%ymm4,%ymm4
	vpaddq    vec2p13579(%rip),%ymm5,%ymm5
	vpaddq    vec2p2468(%rip),%ymm6,%ymm6
	vpaddq    vec2p13579(%rip),%ymm7,%ymm7
	vpaddq    vec2p2468(%rip),%ymm8,%ymm8
	vpaddq    vec2p13579(%rip),%ymm9,%ymm9

	vpsubq	  1376(%rsp),%ymm0,%ymm0
	vpsubq	  1408(%rsp),%ymm1,%ymm1
	vpsubq	  1440(%rsp),%ymm2,%ymm2
	vpsubq	  1472(%rsp),%ymm3,%ymm3
	vpsubq	  1504(%rsp),%ymm4,%ymm4
	vpsubq	  1536(%rsp),%ymm5,%ymm5
	vpsubq	  1568(%rsp),%ymm6,%ymm6
	vpsubq	  1600(%rsp),%ymm7,%ymm7
	vpsubq	  1632(%rsp),%ymm8,%ymm8
	vpsubq	  1664(%rsp),%ymm9,%ymm9

	vmovdqa   %ymm0,2656(%rsp)
	vmovdqa   %ymm1,2688(%rsp)
	vmovdqa   %ymm2,2720(%rsp)
	vmovdqa   %ymm3,2752(%rsp)
	vmovdqa   %ymm4,2784(%rsp)
	vmovdqa   %ymm5,2816(%rsp)
	vmovdqa   %ymm6,2848(%rsp)
	vmovdqa   %ymm7,2880(%rsp)
	vmovdqa   %ymm8,2912(%rsp)
	vmovdqa   %ymm9,2944(%rsp)

	// X3 ← T1 · T4	
	vmovdqa   1728(%rsp),%ymm11
	vmovdqa   1792(%rsp),%ymm12
	vmovdqa   1856(%rsp),%ymm13
	vmovdqa   1920(%rsp),%ymm14
	vmovdqa   1984(%rsp),%ymm15	
	
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
	vpmuludq  1952(%rsp),%ymm2,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  1888(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  1824(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  1760(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  1984(%rsp),%ymm2,%ymm1
	vpmuludq  1952(%rsp),%ymm3,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1920(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1888(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1856(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1824(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1792(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1760(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  %ymm15,%ymm3,%ymm2
	vpmuludq  %ymm14,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm12,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  1952(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  1888(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  1824(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2688(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  1984(%rsp),%ymm4,%ymm3
	vpmuludq  1952(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1920(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1888(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1856(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1824(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  %ymm15,%ymm5,%ymm4
	vpmuludq  %ymm14,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  %ymm13,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  1952(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  1888(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2688(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2752(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  1984(%rsp),%ymm6,%ymm5
	vpmuludq  1952(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  1920(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  1888(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  %ymm15,%ymm7,%ymm6
	vpmuludq  %ymm14,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  1952(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2688(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2752(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2816(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  1984(%rsp),%ymm8,%ymm7
	vpmuludq  1952(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  %ymm15,%ymm9,%ymm8
	vpmuludq  2688(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2752(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2816(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2880(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vmovdqa   1696(%rsp),%ymm11
	vmovdqa   1728(%rsp),%ymm12
	vmovdqa   1760(%rsp),%ymm13
	vmovdqa   1792(%rsp),%ymm14
	vmovdqa   1824(%rsp),%ymm15
	vmovdqa   1856(%rsp),%ymm9

	vpmuludq  2656(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  2720(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2656(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  2752(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2720(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2688(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2656(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  2688(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2656(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  2784(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2720(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2656(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  2816(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2784(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2752(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2720(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2688(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2656(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  2848(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2784(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2720(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2880(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2848(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2816(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2784(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2752(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2720(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  2912(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2848(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2784(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  2784(%rsp),%ymm9,%ymm9
	vpmuludq  2944(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2912(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2880(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2848(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2816(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vmovdqa   1888(%rsp),%ymm11
	vmovdqa   1920(%rsp),%ymm12
	vmovdqa   1952(%rsp),%ymm13
	vmovdqa   1984(%rsp),%ymm14

	vpmuludq  2656(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2688(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2656(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  2720(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2656(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  2752(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2720(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2688(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2656(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm15

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm11

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm14

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm12

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm6

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm13

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm8

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm15,%ymm15
	vpand     vecmask26(%rip),%ymm4,%ymm7

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm3
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm15,%ymm10
	vpaddq    %ymm10,%ymm11,%ymm5
	vpand     vecmask25(%rip),%ymm15,%ymm9

	vmovdqa   %ymm0,1056(%rsp)
	vmovdqa   %ymm3,1088(%rsp)
	vmovdqa   %ymm12,1120(%rsp)
	vmovdqa   %ymm13,1152(%rsp)
	vmovdqa   %ymm7,1184(%rsp)
	vmovdqa   %ymm9,1216(%rsp)
	vmovdqa   %ymm5,1248(%rsp)
	vmovdqa   %ymm14,1280(%rsp)
	vmovdqa   %ymm6,1312(%rsp)
	vmovdqa   %ymm8,1344(%rsp)

	// Z3 ← T2 · T3
	vmovdqa   2368(%rsp),%ymm1
	vmovdqa   2400(%rsp),%ymm2
	vmovdqa   2432(%rsp),%ymm3
	vmovdqa   2464(%rsp),%ymm4
	vmovdqa   2496(%rsp),%ymm5
	vmovdqa   2528(%rsp),%ymm6
	vmovdqa   2560(%rsp),%ymm7
	vmovdqa   2592(%rsp),%ymm8
	vmovdqa   2624(%rsp),%ymm9

	vmovdqa   2048(%rsp),%ymm11
	vmovdqa   2112(%rsp),%ymm12
	vmovdqa   2176(%rsp),%ymm13
	vmovdqa   2240(%rsp),%ymm14
	vmovdqa   2304(%rsp),%ymm15

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
	vpmuludq  2272(%rsp),%ymm2,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  2208(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  2144(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  2080(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  2304(%rsp),%ymm2,%ymm1
	vpmuludq  2272(%rsp),%ymm3,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2240(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2208(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2176(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2144(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2112(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2080(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  %ymm15,%ymm3,%ymm2
	vpmuludq  %ymm14,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm12,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2272(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2208(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2144(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2368(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  2304(%rsp),%ymm4,%ymm3
	vpmuludq  2272(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2240(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2208(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2176(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2144(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  %ymm15,%ymm5,%ymm4
	vpmuludq  %ymm14,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  %ymm13,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2272(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2208(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2368(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2432(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  2304(%rsp),%ymm6,%ymm5
	vpmuludq  2272(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2240(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2208(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  %ymm15,%ymm7,%ymm6
	vpmuludq  %ymm14,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2272(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2368(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2432(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2496(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2304(%rsp),%ymm8,%ymm7
	vpmuludq  2272(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  %ymm15,%ymm9,%ymm8
	vpmuludq  2368(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2432(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2496(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2560(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vmovdqa   2016(%rsp),%ymm11
	vmovdqa   2048(%rsp),%ymm12
	vmovdqa   2080(%rsp),%ymm13
	vmovdqa   2112(%rsp),%ymm14
	vmovdqa   2144(%rsp),%ymm15
	vmovdqa   2176(%rsp),%ymm9

	vpmuludq  2336(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  2400(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2336(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  2432(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2400(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2368(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2336(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  2368(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2336(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  2464(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2400(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2336(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  2496(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2464(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2432(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2400(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2368(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2336(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  2528(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2464(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2400(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2560(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2528(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2496(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2464(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2432(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2400(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  2592(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2528(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2464(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  2464(%rsp),%ymm9,%ymm9
	vpmuludq  2624(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2592(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2560(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2528(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2496(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vmovdqa   2208(%rsp),%ymm11
	vmovdqa   2240(%rsp),%ymm12
	vmovdqa   2272(%rsp),%ymm13
	vmovdqa   2304(%rsp),%ymm14

	vpmuludq  2336(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2368(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2336(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  2400(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2336(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  2432(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2400(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2368(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2336(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm15

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm11

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm14

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm12

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm6

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm13

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm8

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm15,%ymm15
	vpand     vecmask26(%rip),%ymm4,%ymm7

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm3
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm15,%ymm10
	vpaddq    %ymm10,%ymm11,%ymm5
	vpand     vecmask25(%rip),%ymm15,%ymm9

	vmovdqa   %ymm0,1376(%rsp)
	vmovdqa   %ymm3,1408(%rsp)
	vmovdqa   %ymm12,1440(%rsp)
	vmovdqa   %ymm13,1472(%rsp)
	vmovdqa   %ymm7,1504(%rsp)
	vmovdqa   %ymm9,1536(%rsp)
	vmovdqa   %ymm5,1568(%rsp)
	vmovdqa   %ymm14,1600(%rsp)
	vmovdqa   %ymm6,1632(%rsp)
	vmovdqa   %ymm8,1664(%rsp)
	
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

	vmovdqa   1696(%rsp),%ymm0
	vmovdqa   1728(%rsp),%ymm1
	vmovdqa   1760(%rsp),%ymm2
	vmovdqa   1792(%rsp),%ymm3
	vmovdqa   1824(%rsp),%ymm4
	vmovdqa   1856(%rsp),%ymm5
	vmovdqa   1888(%rsp),%ymm6
	vmovdqa   1920(%rsp),%ymm7
	vmovdqa   1952(%rsp),%ymm8
	vmovdqa   1984(%rsp),%ymm9

	vpxor	  2336(%rsp),%ymm0,%ymm0
	vpxor	  2368(%rsp),%ymm1,%ymm1
	vpxor	  2400(%rsp),%ymm2,%ymm2
	vpxor	  2432(%rsp),%ymm3,%ymm3
	vpxor	  2464(%rsp),%ymm4,%ymm4
	vpxor	  2496(%rsp),%ymm5,%ymm5
	vpxor	  2528(%rsp),%ymm6,%ymm6
	vpxor	  2560(%rsp),%ymm7,%ymm7
	vpxor	  2592(%rsp),%ymm8,%ymm8
	vpxor	  2624(%rsp),%ymm9,%ymm9

	vpand	  %ymm10,%ymm0,%ymm0
	vpand	  %ymm10,%ymm1,%ymm1
	vpand	  %ymm10,%ymm2,%ymm2
	vpand	  %ymm10,%ymm3,%ymm3
	vpand	  %ymm10,%ymm4,%ymm4
	vpand	  %ymm10,%ymm5,%ymm5
	vpand	  %ymm10,%ymm6,%ymm6
	vpand	  %ymm10,%ymm7,%ymm7
	vpand	  %ymm10,%ymm8,%ymm8
	vpand	  %ymm10,%ymm9,%ymm9

	vpxor	  1696(%rsp),%ymm0,%ymm0
	vpxor	  1728(%rsp),%ymm1,%ymm1
	vpxor	  1760(%rsp),%ymm2,%ymm2
	vpxor	  1792(%rsp),%ymm3,%ymm3
	vpxor	  1824(%rsp),%ymm4,%ymm4
	vpxor	  1856(%rsp),%ymm5,%ymm5
	vpxor	  1888(%rsp),%ymm6,%ymm6
	vpxor	  1920(%rsp),%ymm7,%ymm7
	vpxor	  1952(%rsp),%ymm8,%ymm8
	vpxor	  1984(%rsp),%ymm9,%ymm9

	vmovdqa   %ymm0,1696(%rsp)
	vmovdqa   %ymm1,1728(%rsp)
	vmovdqa   %ymm2,1760(%rsp)
	vmovdqa   %ymm3,1792(%rsp)
	vmovdqa   %ymm4,1824(%rsp)
	vmovdqa   %ymm5,1856(%rsp)
	vmovdqa   %ymm6,1888(%rsp)
	vmovdqa   %ymm7,1920(%rsp)
	vmovdqa   %ymm8,1952(%rsp)
	vmovdqa   %ymm9,1984(%rsp)

	vmovdqa   2016(%rsp),%ymm0
	vmovdqa   2048(%rsp),%ymm3
	vmovdqa   2080(%rsp),%ymm12
	vmovdqa   2112(%rsp),%ymm13
	vmovdqa   2144(%rsp),%ymm7
	vmovdqa   2176(%rsp),%ymm9
	vmovdqa   2208(%rsp),%ymm5
	vmovdqa   2240(%rsp),%ymm14
	vmovdqa   2272(%rsp),%ymm6
	vmovdqa   2304(%rsp),%ymm8

	vpxor	  2656(%rsp),%ymm0,%ymm0
	vpxor	  2688(%rsp),%ymm3,%ymm3
	vpxor	  2720(%rsp),%ymm12,%ymm12
	vpxor	  2752(%rsp),%ymm13,%ymm13
	vpxor	  2784(%rsp),%ymm7,%ymm7
	vpxor	  2816(%rsp),%ymm9,%ymm9
	vpxor	  2848(%rsp),%ymm5,%ymm5
	vpxor	  2880(%rsp),%ymm14,%ymm14
	vpxor	  2912(%rsp),%ymm6,%ymm6
	vpxor	  2944(%rsp),%ymm8,%ymm8

	vpand	  %ymm10,%ymm0,%ymm0
	vpand	  %ymm10,%ymm3,%ymm3
	vpand	  %ymm10,%ymm12,%ymm12
	vpand	  %ymm10,%ymm13,%ymm13
	vpand	  %ymm10,%ymm7,%ymm7
	vpand	  %ymm10,%ymm9,%ymm9
	vpand	  %ymm10,%ymm5,%ymm5
	vpand	  %ymm10,%ymm14,%ymm14
	vpand	  %ymm10,%ymm6,%ymm6
	vpand	  %ymm10,%ymm8,%ymm8

	vpxor	  2016(%rsp),%ymm0,%ymm0
	vpxor	  2048(%rsp),%ymm3,%ymm3
	vpxor	  2080(%rsp),%ymm12,%ymm12
	vpxor	  2112(%rsp),%ymm13,%ymm13
	vpxor	  2144(%rsp),%ymm7,%ymm7
	vpxor	  2176(%rsp),%ymm9,%ymm9
	vpxor	  2208(%rsp),%ymm5,%ymm5
	vpxor	  2240(%rsp),%ymm14,%ymm14
	vpxor	  2272(%rsp),%ymm6,%ymm6
	vpxor	  2304(%rsp),%ymm8,%ymm8

	vmovdqa   %ymm12,2080(%rsp)
	vmovdqa   %ymm13,2112(%rsp)
	vmovdqa   %ymm7,2144(%rsp)
	vmovdqa   %ymm9,2176(%rsp)
	vmovdqa   %ymm5,2208(%rsp)
	vmovdqa   %ymm14,2240(%rsp)
	vmovdqa   %ymm6,2272(%rsp)
	vmovdqa   %ymm8,2304(%rsp)

	// T2 ← T2^2
	vpmuludq  vec19(%rip),%ymm5,%ymm2
	vpmuludq  vec19(%rip),%ymm6,%ymm6
	vpmuludq  vec38(%rip),%ymm9,%ymm1
	vpmuludq  vec38(%rip),%ymm14,%ymm4
	vpmuludq  vec38(%rip),%ymm8,%ymm8

	vpaddq    %ymm0,%ymm0,%ymm10
	vpaddq    %ymm3,%ymm3,%ymm11
	vpaddq    %ymm12,%ymm12,%ymm12
	vpaddq    %ymm13,%ymm13,%ymm13
	vpaddq    %ymm7,%ymm7,%ymm7
	vpaddq    %ymm9,%ymm9,%ymm9
	vpaddq    %ymm5,%ymm5,%ymm5
	vpaddq    %ymm14,%ymm14,%ymm14

	vpmuludq  %ymm0,%ymm0,%ymm0
	vpmuludq  %ymm11,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm12,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm13,%ymm4,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm7,%ymm2,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  2176(%rsp),%ymm1,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0

	vpmuludq  2208(%rsp),%ymm1,%ymm1
	vpmuludq  %ymm3,%ymm10,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  2080(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  %ymm13,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  2144(%rsp),%ymm4,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1

	vpmuludq  2208(%rsp),%ymm2,%ymm2
	vpmuludq  2080(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm3,%ymm11,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm7,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm9,%ymm4,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2

	vpmuludq  2112(%rsp),%ymm10,%ymm3
	vpmuludq  2080(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  2144(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  %ymm9,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  2208(%rsp),%ymm4,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3

	vpmuludq  2240(%rsp),%ymm4,%ymm4
	vpmuludq  2144(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm11,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vmovdqa   2080(%rsp),%ymm15
	vpmuludq  %ymm15,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm9,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm5,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4

	vpmuludq  2176(%rsp),%ymm10,%ymm5
	vpmuludq  2144(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  2112(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  2208(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  %ymm6,%ymm14,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5

	vpmuludq  2272(%rsp),%ymm6,%ymm6
	vpmuludq  2208(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  %ymm11,%ymm9,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  2144(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  2112(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  %ymm14,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6

	vpmuludq  2240(%rsp),%ymm10,%ymm7
	vpmuludq  2208(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  2176(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  2144(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  2272(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7

	vpmuludq  2304(%rsp),%ymm8,%ymm8
	vpmuludq  2272(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  %ymm11,%ymm14,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  2208(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  %ymm13,%ymm9,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vmovdqa   2144(%rsp),%ymm15
	vpmuludq  %ymm15,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8

	vpmuludq  2144(%rsp),%ymm9,%ymm9
	vpmuludq  2304(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  2272(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  2240(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  2208(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm6

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm7

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm2

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm8

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm3

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm9

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask26(%rip),%ymm4,%ymm4

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vmovdqa   %ymm0,2016(%rsp)
	vmovdqa   %ymm1,2048(%rsp)
	vmovdqa   %ymm2,2080(%rsp)
	vmovdqa   %ymm3,2112(%rsp)
	vmovdqa   %ymm4,2144(%rsp)
	vmovdqa   %ymm5,2176(%rsp)
	vmovdqa   %ymm6,2208(%rsp)
	vmovdqa   %ymm7,2240(%rsp)
	vmovdqa   %ymm8,2272(%rsp)
	vmovdqa   %ymm9,2304(%rsp)

	// T1 ← T1^2
	vmovdqa   1696(%rsp),%ymm0
	vmovdqa   1728(%rsp),%ymm3
	vmovdqa   1760(%rsp),%ymm12
	vmovdqa   1792(%rsp),%ymm13
	vmovdqa   1824(%rsp),%ymm7
	vmovdqa   1856(%rsp),%ymm9
	vmovdqa   1888(%rsp),%ymm5
	vmovdqa   1920(%rsp),%ymm14
	vmovdqa   1952(%rsp),%ymm6
	vmovdqa   1984(%rsp),%ymm8

	vpmuludq  vec19(%rip),%ymm5,%ymm2
	vpmuludq  vec19(%rip),%ymm6,%ymm6
	vpmuludq  vec38(%rip),%ymm9,%ymm1
	vpmuludq  vec38(%rip),%ymm14,%ymm4
	vpmuludq  vec38(%rip),%ymm8,%ymm8

	vpaddq    %ymm0,%ymm0,%ymm10
	vpaddq    %ymm3,%ymm3,%ymm11
	vpaddq    %ymm12,%ymm12,%ymm12
	vpaddq    %ymm13,%ymm13,%ymm13
	vpaddq    %ymm7,%ymm7,%ymm7
	vpaddq    %ymm9,%ymm9,%ymm9
	vpaddq    %ymm5,%ymm5,%ymm5
	vpaddq    %ymm14,%ymm14,%ymm14

	vpmuludq  %ymm0,%ymm0,%ymm0
	vpmuludq  %ymm11,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm12,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm13,%ymm4,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm7,%ymm2,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  1856(%rsp),%ymm1,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0

	vpmuludq  1888(%rsp),%ymm1,%ymm1
	vpmuludq  %ymm3,%ymm10,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  1760(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  %ymm13,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  1824(%rsp),%ymm4,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1

	vpmuludq  1888(%rsp),%ymm2,%ymm2
	vpmuludq  1760(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm3,%ymm11,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm7,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm9,%ymm4,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2

	vpmuludq  1792(%rsp),%ymm10,%ymm3
	vpmuludq  1760(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  1824(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  %ymm9,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  1888(%rsp),%ymm4,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3

	vpmuludq  1920(%rsp),%ymm4,%ymm4
	vpmuludq  1824(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm11,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vmovdqa   1760(%rsp),%ymm15
	vpmuludq  %ymm15,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm9,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm5,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4

	vpmuludq  1856(%rsp),%ymm10,%ymm5
	vpmuludq  1824(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  1792(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  1888(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  %ymm6,%ymm14,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5

	vpmuludq  1952(%rsp),%ymm6,%ymm6
	vpmuludq  1888(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  %ymm11,%ymm9,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  1824(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  1792(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  %ymm14,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6

	vpmuludq  1920(%rsp),%ymm10,%ymm7
	vpmuludq  1888(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  1856(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  1824(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  1952(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7

	vpmuludq  1984(%rsp),%ymm8,%ymm8
	vpmuludq  1952(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  %ymm11,%ymm14,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  1888(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  %ymm13,%ymm9,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vmovdqa   1824(%rsp),%ymm15
	vpmuludq  %ymm15,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8

	vpmuludq  1824(%rsp),%ymm9,%ymm9
	vpmuludq  1984(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  1952(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  1920(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  1888(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm6

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm7

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm2

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm8

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm3

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm9

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask26(%rip),%ymm4,%ymm4

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vmovdqa   %ymm0,1696(%rsp)
	vmovdqa   %ymm1,1728(%rsp)
	vmovdqa   %ymm2,1760(%rsp)
	vmovdqa   %ymm3,1792(%rsp)
	vmovdqa   %ymm4,1824(%rsp)
	vmovdqa   %ymm5,1856(%rsp)
	vmovdqa   %ymm6,1888(%rsp)
	vmovdqa   %ymm7,1920(%rsp)
	vmovdqa   %ymm8,1952(%rsp)
	vmovdqa   %ymm9,1984(%rsp)

	// X3
	vmovdqa   1056(%rsp),%ymm1
	vmovdqa   1088(%rsp),%ymm2
	vmovdqa   1120(%rsp),%ymm4
	vmovdqa   1152(%rsp),%ymm10
	vmovdqa   1184(%rsp),%ymm11
	vmovdqa   1216(%rsp),%ymm15
	vmovdqa   1248(%rsp),%ymm5
	vmovdqa   1280(%rsp),%ymm14
	vmovdqa   1312(%rsp),%ymm6
	vmovdqa   1344(%rsp),%ymm8

	// copy X3
	vmovdqa   %ymm1,%ymm0
	vmovdqa   %ymm2,%ymm3
	vmovdqa   %ymm4,%ymm12
	vmovdqa   %ymm10,%ymm13
	vmovdqa   %ymm11,%ymm7
	vmovdqa   %ymm15,%ymm9

	// T3 ← X3 + Z3
	vpaddq	  1376(%rsp),%ymm1,%ymm1
	vpaddq	  1408(%rsp),%ymm2,%ymm2
	vpaddq	  1440(%rsp),%ymm4,%ymm4
	vpaddq	  1472(%rsp),%ymm10,%ymm10
	vpaddq	  1504(%rsp),%ymm11,%ymm11
	vpaddq	  1536(%rsp),%ymm15,%ymm15
	vpaddq	  1568(%rsp),%ymm5,%ymm5
	vpaddq	  1600(%rsp),%ymm14,%ymm14
	vpaddq	  1632(%rsp),%ymm6,%ymm6
	vpaddq	  1664(%rsp),%ymm8,%ymm8

	vmovdqa   %ymm1,2336(%rsp)
	vmovdqa   %ymm2,2368(%rsp)
	vmovdqa   %ymm4,2400(%rsp)
	vmovdqa   %ymm10,2432(%rsp)
	vmovdqa   %ymm11,2464(%rsp)
	vmovdqa   %ymm15,2496(%rsp)
	vmovdqa   %ymm5,2528(%rsp)
	vmovdqa   %ymm14,2560(%rsp)
	vmovdqa   %ymm6,2592(%rsp)
	vmovdqa   %ymm8,2624(%rsp)

	// remaining X3
	vmovdqa   1248(%rsp),%ymm5
	vmovdqa   1280(%rsp),%ymm14
	vmovdqa   1312(%rsp),%ymm6
	vmovdqa   1344(%rsp),%ymm8

	// Z3 ← X3 - Z3
	vpaddq    vec2p0(%rip),%ymm0,%ymm0
	vpaddq    vec2p13579(%rip),%ymm3,%ymm3
	vpaddq    vec2p2468(%rip),%ymm12,%ymm12
	vpaddq    vec2p13579(%rip),%ymm13,%ymm13
	vpaddq    vec2p2468(%rip),%ymm7,%ymm7
	vpaddq    vec2p13579(%rip),%ymm9,%ymm9
	vpaddq    vec2p2468(%rip),%ymm5,%ymm5
	vpaddq    vec2p13579(%rip),%ymm14,%ymm14
	vpaddq    vec2p2468(%rip),%ymm6,%ymm6
	vpaddq    vec2p13579(%rip),%ymm8,%ymm8

	vpsubq	  1376(%rsp),%ymm0,%ymm0
	vpsubq	  1408(%rsp),%ymm3,%ymm3
	vpsubq	  1440(%rsp),%ymm12,%ymm12
	vpsubq	  1472(%rsp),%ymm13,%ymm13
	vpsubq	  1504(%rsp),%ymm7,%ymm7
	vpsubq	  1536(%rsp),%ymm9,%ymm9
	vpsubq	  1568(%rsp),%ymm5,%ymm5
	vpsubq	  1600(%rsp),%ymm14,%ymm14
	vpsubq	  1632(%rsp),%ymm6,%ymm6
	vpsubq	  1664(%rsp),%ymm8,%ymm8

	vmovdqa   %ymm12,1440(%rsp)
	vmovdqa   %ymm13,1472(%rsp)
	vmovdqa   %ymm7,1504(%rsp)
	vmovdqa   %ymm9,1536(%rsp)
	vmovdqa   %ymm5,1568(%rsp)
	vmovdqa   %ymm14,1600(%rsp)
	vmovdqa   %ymm6,1632(%rsp)
	vmovdqa   %ymm8,1664(%rsp)

	// Z3 ← Z3^2
	vpmuludq  vec19(%rip),%ymm5,%ymm2
	vpmuludq  vec19(%rip),%ymm6,%ymm6
	vpmuludq  vec38(%rip),%ymm9,%ymm1
	vpmuludq  vec38(%rip),%ymm14,%ymm4
	vpmuludq  vec38(%rip),%ymm8,%ymm8

	vpaddq    %ymm0,%ymm0,%ymm10
	vpaddq    %ymm3,%ymm3,%ymm11
	vpaddq    %ymm12,%ymm12,%ymm12
	vpaddq    %ymm13,%ymm13,%ymm13
	vpaddq    %ymm7,%ymm7,%ymm7
	vpaddq    %ymm9,%ymm9,%ymm9
	vpaddq    %ymm5,%ymm5,%ymm5
	vpaddq    %ymm14,%ymm14,%ymm14

	vpmuludq  %ymm0,%ymm0,%ymm0
	vpmuludq  %ymm11,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm12,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm13,%ymm4,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm7,%ymm2,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  1536(%rsp),%ymm1,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0

	vpmuludq  1568(%rsp),%ymm1,%ymm1
	vpmuludq  %ymm3,%ymm10,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  1440(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  %ymm13,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  1504(%rsp),%ymm4,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1

	vpmuludq  1568(%rsp),%ymm2,%ymm2
	vpmuludq  1440(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm3,%ymm11,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm7,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm9,%ymm4,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2

	vpmuludq  1472(%rsp),%ymm10,%ymm3
	vpmuludq  1440(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  1504(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  %ymm9,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  1568(%rsp),%ymm4,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3

	vpmuludq  1600(%rsp),%ymm4,%ymm4
	vpmuludq  1504(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm11,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vmovdqa   1440(%rsp),%ymm15
	vpmuludq  %ymm15,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm9,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm5,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4

	vpmuludq  1536(%rsp),%ymm10,%ymm5
	vpmuludq  1504(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  1472(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  1568(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  %ymm6,%ymm14,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5

	vpmuludq  1632(%rsp),%ymm6,%ymm6
	vpmuludq  1568(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  %ymm11,%ymm9,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  1504(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  1472(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  %ymm14,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6

	vpmuludq  1600(%rsp),%ymm10,%ymm7
	vpmuludq  1568(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  1536(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  1504(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  1632(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7

	vpmuludq  1664(%rsp),%ymm8,%ymm8
	vpmuludq  1632(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  %ymm11,%ymm14,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  1568(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  %ymm13,%ymm9,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vmovdqa   1504(%rsp),%ymm15
	vpmuludq  %ymm15,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8

	vpmuludq  1504(%rsp),%ymm9,%ymm9
	vpmuludq  1664(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  1632(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  1600(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  1568(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm6

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm7

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm2

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm8

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm3

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm9

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask26(%rip),%ymm4,%ymm4

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vmovdqa   %ymm0,1376(%rsp)
	vmovdqa   %ymm1,1408(%rsp)
	vmovdqa   %ymm2,1440(%rsp)
	vmovdqa   %ymm3,1472(%rsp)
	vmovdqa   %ymm4,1504(%rsp)
	vmovdqa   %ymm5,1536(%rsp)
	vmovdqa   %ymm6,1568(%rsp)
	vmovdqa   %ymm7,1600(%rsp)
	vmovdqa   %ymm8,1632(%rsp)
	vmovdqa   %ymm9,1664(%rsp)

	// X3 ← T3^2
	vmovdqa   2336(%rsp),%ymm0
	vmovdqa   2368(%rsp),%ymm3
	vmovdqa   2400(%rsp),%ymm12
	vmovdqa   2432(%rsp),%ymm13
	vmovdqa   2464(%rsp),%ymm7
	vmovdqa   2496(%rsp),%ymm9
	vmovdqa   2528(%rsp),%ymm5
	vmovdqa   2560(%rsp),%ymm14
	vmovdqa   2592(%rsp),%ymm6
	vmovdqa   2624(%rsp),%ymm8

	vpmuludq  vec19(%rip),%ymm5,%ymm2
	vpmuludq  vec19(%rip),%ymm6,%ymm6
	vpmuludq  vec38(%rip),%ymm9,%ymm1
	vpmuludq  vec38(%rip),%ymm14,%ymm4
	vpmuludq  vec38(%rip),%ymm8,%ymm8

	vpaddq    %ymm0,%ymm0,%ymm10
	vpaddq    %ymm3,%ymm3,%ymm11
	vpaddq    %ymm12,%ymm12,%ymm12
	vpaddq    %ymm13,%ymm13,%ymm13
	vpaddq    %ymm7,%ymm7,%ymm7
	vpaddq    %ymm9,%ymm9,%ymm9
	vpaddq    %ymm5,%ymm5,%ymm5
	vpaddq    %ymm14,%ymm14,%ymm14

	vpmuludq  %ymm0,%ymm0,%ymm0
	vpmuludq  %ymm11,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm12,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm13,%ymm4,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  %ymm7,%ymm2,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0
	vpmuludq  2496(%rsp),%ymm1,%ymm15
	vpaddq    %ymm15,%ymm0,%ymm0

	vpmuludq  2528(%rsp),%ymm1,%ymm1
	vpmuludq  %ymm3,%ymm10,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  2400(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  %ymm13,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1
	vpmuludq  2464(%rsp),%ymm4,%ymm15
	vpaddq    %ymm15,%ymm1,%ymm1

	vpmuludq  2528(%rsp),%ymm2,%ymm2
	vpmuludq  2400(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm3,%ymm11,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm7,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2
	vpmuludq  %ymm9,%ymm4,%ymm15
	vpaddq    %ymm15,%ymm2,%ymm2

	vpmuludq  2432(%rsp),%ymm10,%ymm3
	vpmuludq  2400(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  2464(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  %ymm9,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3
	vpmuludq  2528(%rsp),%ymm4,%ymm15
	vpaddq    %ymm15,%ymm3,%ymm3

	vpmuludq  2560(%rsp),%ymm4,%ymm4
	vpmuludq  2464(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm11,%ymm13,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vmovdqa   2400(%rsp),%ymm15
	vpmuludq  %ymm15,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm9,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4
	vpmuludq  %ymm5,%ymm6,%ymm15
	vpaddq    %ymm15,%ymm4,%ymm4

	vpmuludq  2496(%rsp),%ymm10,%ymm5
	vpmuludq  2464(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  2432(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  2528(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5
	vpmuludq  %ymm6,%ymm14,%ymm15
	vpaddq    %ymm15,%ymm5,%ymm5

	vpmuludq  2592(%rsp),%ymm6,%ymm6
	vpmuludq  2528(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  %ymm11,%ymm9,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  2464(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  2432(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6
	vpmuludq  %ymm14,%ymm8,%ymm15
	vpaddq    %ymm15,%ymm6,%ymm6

	vpmuludq  2560(%rsp),%ymm10,%ymm7
	vpmuludq  2528(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  2496(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  2464(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7
	vpmuludq  2592(%rsp),%ymm8,%ymm15
	vpaddq    %ymm15,%ymm7,%ymm7

	vpmuludq  2624(%rsp),%ymm8,%ymm8
	vpmuludq  2592(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  %ymm11,%ymm14,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  2528(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vpmuludq  %ymm13,%ymm9,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8
	vmovdqa   2464(%rsp),%ymm15
	vpmuludq  %ymm15,%ymm15,%ymm15
	vpaddq    %ymm15,%ymm8,%ymm8

	vpmuludq  2464(%rsp),%ymm9,%ymm9
	vpmuludq  2624(%rsp),%ymm10,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  2592(%rsp),%ymm11,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  2560(%rsp),%ymm12,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9
	vpmuludq  2528(%rsp),%ymm13,%ymm15
	vpaddq    %ymm15,%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm6

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm7

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm2

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm8

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm3

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm9

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask26(%rip),%ymm4,%ymm4

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vmovdqa   %ymm0,1056(%rsp)
	vmovdqa   %ymm1,1088(%rsp)
	vmovdqa   %ymm2,1120(%rsp)
	vmovdqa   %ymm3,1152(%rsp)
	vmovdqa   %ymm4,1184(%rsp)
	vmovdqa   %ymm5,1216(%rsp)
	vmovdqa   %ymm6,1248(%rsp)
	vmovdqa   %ymm7,1280(%rsp)
	vmovdqa   %ymm8,1312(%rsp)
	vmovdqa   %ymm9,1344(%rsp)

	// T3 ← T1 - T2
	vmovdqa   1696(%rsp),%ymm0
	vmovdqa   1728(%rsp),%ymm1
	vmovdqa   1760(%rsp),%ymm2
	vmovdqa   1792(%rsp),%ymm3
	vmovdqa   1824(%rsp),%ymm4
	vmovdqa   1856(%rsp),%ymm5
	vmovdqa   1888(%rsp),%ymm6
	vmovdqa   1920(%rsp),%ymm7
	vmovdqa   1952(%rsp),%ymm8
	vmovdqa   1984(%rsp),%ymm9

	vpaddq    vec2p0(%rip),%ymm0,%ymm0
	vpaddq    vec2p13579(%rip),%ymm1,%ymm1
	vpaddq    vec2p2468(%rip),%ymm2,%ymm2
	vpaddq    vec2p13579(%rip),%ymm3,%ymm3
	vpaddq    vec2p2468(%rip),%ymm4,%ymm4
	vpaddq    vec2p13579(%rip),%ymm5,%ymm5
	vpaddq    vec2p2468(%rip),%ymm6,%ymm6
	vpaddq    vec2p13579(%rip),%ymm7,%ymm7
	vpaddq    vec2p2468(%rip),%ymm8,%ymm8
	vpaddq    vec2p13579(%rip),%ymm9,%ymm9

	vpsubq	  2016(%rsp),%ymm0,%ymm0
	vpsubq	  2048(%rsp),%ymm1,%ymm1
	vpsubq	  2080(%rsp),%ymm2,%ymm2
	vpsubq	  2112(%rsp),%ymm3,%ymm3
	vpsubq	  2144(%rsp),%ymm4,%ymm4
	vpsubq	  2176(%rsp),%ymm5,%ymm5
	vpsubq	  2208(%rsp),%ymm6,%ymm6
	vpsubq	  2240(%rsp),%ymm7,%ymm7
	vpsubq	  2272(%rsp),%ymm8,%ymm8
	vpsubq	  2304(%rsp),%ymm9,%ymm9

	vmovdqa   %ymm0,2336(%rsp)
	vmovdqa   %ymm1,2368(%rsp)
	vmovdqa   %ymm2,2400(%rsp)
	vmovdqa   %ymm3,2432(%rsp)
	vmovdqa   %ymm4,2464(%rsp)
	vmovdqa   %ymm5,2496(%rsp)
	vmovdqa   %ymm6,2528(%rsp)
	vmovdqa   %ymm7,2560(%rsp)
	vmovdqa   %ymm8,2592(%rsp)
	vmovdqa   %ymm9,2624(%rsp)

	// T4 ← ((A2)/4) · T3
	vpmuludq  veca24(%rip),%ymm0,%ymm0
	vpmuludq  veca24(%rip),%ymm1,%ymm1
	vpmuludq  veca24(%rip),%ymm2,%ymm2
	vpmuludq  veca24(%rip),%ymm3,%ymm3
	vpmuludq  veca24(%rip),%ymm4,%ymm4
	vpmuludq  veca24(%rip),%ymm5,%ymm5
	vpmuludq  veca24(%rip),%ymm6,%ymm6
	vpmuludq  veca24(%rip),%ymm7,%ymm7
	vpmuludq  veca24(%rip),%ymm8,%ymm8
	vpmuludq  veca24(%rip),%ymm9,%ymm9

	// T4 ← T4 + T2
	vpaddq	  2016(%rsp),%ymm0,%ymm0
	vpaddq	  2048(%rsp),%ymm1,%ymm1
	vpaddq	  2080(%rsp),%ymm2,%ymm2
	vpaddq	  2112(%rsp),%ymm3,%ymm3
	vpaddq	  2144(%rsp),%ymm4,%ymm4
	vpaddq	  2176(%rsp),%ymm5,%ymm5
	vpaddq	  2208(%rsp),%ymm6,%ymm6
	vpaddq	  2240(%rsp),%ymm7,%ymm7
	vpaddq	  2272(%rsp),%ymm8,%ymm8
	vpaddq	  2304(%rsp),%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm6

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm7

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm2

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm8

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm3

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm9

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpand     vecmask26(%rip),%ymm4,%ymm4

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm5

	vmovdqa   %ymm0,2656(%rsp)
	vmovdqa   %ymm1,2688(%rsp)
	vmovdqa   %ymm2,2720(%rsp)
	vmovdqa   %ymm3,2752(%rsp)
	vmovdqa   %ymm4,2784(%rsp)
	vmovdqa   %ymm5,2816(%rsp)
	vmovdqa   %ymm6,2848(%rsp)
	vmovdqa   %ymm7,2880(%rsp)
	vmovdqa   %ymm8,2912(%rsp)
	vmovdqa   %ymm9,2944(%rsp)

	// Z2 ← T3 · T4
	vmovdqa   2368(%rsp),%ymm11
	vmovdqa   2432(%rsp),%ymm12
	vmovdqa   2496(%rsp),%ymm13
	vmovdqa   2560(%rsp),%ymm14
	vmovdqa   2624(%rsp),%ymm15

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
	vpmuludq  2592(%rsp),%ymm2,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  2528(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  2464(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  2400(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  2624(%rsp),%ymm2,%ymm1
	vpmuludq  2592(%rsp),%ymm3,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2560(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2528(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2496(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2464(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2432(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2400(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  %ymm15,%ymm3,%ymm2
	vpmuludq  %ymm14,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm12,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2592(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2528(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2464(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2688(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  2624(%rsp),%ymm4,%ymm3
	vpmuludq  2592(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2560(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2528(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2496(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2464(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  %ymm15,%ymm5,%ymm4
	vpmuludq  %ymm14,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  %ymm13,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2592(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2528(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2688(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2752(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  2624(%rsp),%ymm6,%ymm5
	vpmuludq  2592(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2560(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2528(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  %ymm15,%ymm7,%ymm6
	vpmuludq  %ymm14,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2592(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2688(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2752(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2816(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2624(%rsp),%ymm8,%ymm7
	vpmuludq  2592(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  %ymm15,%ymm9,%ymm8
	vpmuludq  2688(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2752(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2816(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2880(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vmovdqa   2336(%rsp),%ymm11
	vmovdqa   2368(%rsp),%ymm12
	vmovdqa   2400(%rsp),%ymm13
	vmovdqa   2432(%rsp),%ymm14
	vmovdqa   2464(%rsp),%ymm15
	vmovdqa   2496(%rsp),%ymm9

	vpmuludq  2656(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  2720(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2656(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  2752(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2720(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2688(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2656(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  2688(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2656(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  2784(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2720(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2656(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  2816(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2784(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2752(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2720(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2688(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2656(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  2848(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2784(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2720(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2880(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2848(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2816(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2784(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2752(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2720(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  2912(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2848(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2784(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  2784(%rsp),%ymm9,%ymm9
	vpmuludq  2944(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2912(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2880(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2848(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2816(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vmovdqa   2528(%rsp),%ymm11
	vmovdqa   2560(%rsp),%ymm12
	vmovdqa   2592(%rsp),%ymm13
	vmovdqa   2624(%rsp),%ymm14

	vpmuludq  2656(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2688(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2656(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  2720(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2656(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  2752(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2720(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2688(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2656(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm15

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm11

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm14

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm12

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm6

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm13

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm8

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm15,%ymm15
	vpand     vecmask26(%rip),%ymm4,%ymm7

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm3
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm15,%ymm10
	vpaddq    %ymm10,%ymm11,%ymm5
	vpand     vecmask25(%rip),%ymm15,%ymm9

	vmovdqa   %ymm0,736(%rsp)
	vmovdqa   %ymm3,768(%rsp)
	vmovdqa   %ymm12,800(%rsp)
	vmovdqa   %ymm13,832(%rsp)
	vmovdqa   %ymm7,864(%rsp)
	vmovdqa   %ymm9,896(%rsp)
	vmovdqa   %ymm5,928(%rsp)
	vmovdqa   %ymm14,960(%rsp)
	vmovdqa   %ymm6,992(%rsp)
	vmovdqa   %ymm8,1024(%rsp)

	// X2 ← T1 · T2
	vmovdqa   2016(%rsp),%ymm0
	vmovdqa   2048(%rsp),%ymm1
	vmovdqa   2080(%rsp),%ymm2
	vmovdqa   2112(%rsp),%ymm3
	vmovdqa   2144(%rsp),%ymm4
	vmovdqa   2176(%rsp),%ymm5
	vmovdqa   2208(%rsp),%ymm6
	vmovdqa   2240(%rsp),%ymm7
	vmovdqa   2272(%rsp),%ymm8
	vmovdqa   2304(%rsp),%ymm9

	vmovdqa   1728(%rsp),%ymm11
	vmovdqa   1792(%rsp),%ymm12
	vmovdqa   1856(%rsp),%ymm13
	vmovdqa   1920(%rsp),%ymm14
	vmovdqa   1984(%rsp),%ymm15

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
	vpmuludq  1952(%rsp),%ymm2,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  1888(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  1824(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  1760(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  1984(%rsp),%ymm2,%ymm1
	vpmuludq  1952(%rsp),%ymm3,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1920(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1888(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1856(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1824(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1792(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1760(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  %ymm15,%ymm3,%ymm2
	vpmuludq  %ymm14,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm12,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  1952(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  1888(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  1824(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2048(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  1984(%rsp),%ymm4,%ymm3
	vpmuludq  1952(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1920(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1888(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1856(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1824(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  %ymm15,%ymm5,%ymm4
	vpmuludq  %ymm14,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  %ymm13,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  1952(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  1888(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2048(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2112(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  1984(%rsp),%ymm6,%ymm5
	vpmuludq  1952(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  1920(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  1888(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  %ymm15,%ymm7,%ymm6
	vpmuludq  %ymm14,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  1952(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2048(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2112(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2176(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  1984(%rsp),%ymm8,%ymm7
	vpmuludq  1952(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  %ymm15,%ymm9,%ymm8
	vpmuludq  2048(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2112(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2176(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2240(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vmovdqa   1696(%rsp),%ymm11
	vmovdqa   1728(%rsp),%ymm12
	vmovdqa   1760(%rsp),%ymm13
	vmovdqa   1792(%rsp),%ymm14
	vmovdqa   1824(%rsp),%ymm15
	vmovdqa   1856(%rsp),%ymm9

	vpmuludq  2016(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  2080(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  2016(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  2112(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2080(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2048(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  2016(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  2048(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  2016(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  2144(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2080(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  2016(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  2176(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2144(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2112(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2080(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2048(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  2016(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  2208(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2144(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  2080(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2240(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2208(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2176(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2144(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2112(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2080(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  2272(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2208(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2144(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  2144(%rsp),%ymm9,%ymm9
	vpmuludq  2304(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2272(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2240(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2208(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2176(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vmovdqa   1888(%rsp),%ymm11
	vmovdqa   1920(%rsp),%ymm12
	vmovdqa   1952(%rsp),%ymm13
	vmovdqa   1984(%rsp),%ymm14

	vpmuludq  2016(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  2048(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  2016(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  2080(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  2016(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  2112(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2080(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2048(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  2016(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm15

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm11

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm14

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm12

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm6

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm13

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm8

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm15,%ymm15
	vpand     vecmask26(%rip),%ymm4,%ymm7

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm3
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm15,%ymm10
	vpaddq    %ymm10,%ymm11,%ymm5
	vpand     vecmask25(%rip),%ymm15,%ymm9

	vmovdqa   %ymm0,416(%rsp)
	vmovdqa   %ymm3,448(%rsp)
	vmovdqa   %ymm12,480(%rsp)
	vmovdqa   %ymm13,512(%rsp)
	vmovdqa   %ymm7,544(%rsp)
	vmovdqa   %ymm9,576(%rsp)
	vmovdqa   %ymm5,608(%rsp)
	vmovdqa   %ymm14,640(%rsp)
	vmovdqa   %ymm6,672(%rsp)
	vmovdqa   %ymm8,704(%rsp)

	// Z3 ← Z3 · X1
	vmovdqa   1376(%rsp),%ymm0
	vmovdqa   1408(%rsp),%ymm1
	vmovdqa   1440(%rsp),%ymm2
	vmovdqa   1472(%rsp),%ymm3
	vmovdqa   1504(%rsp),%ymm4
	vmovdqa   1536(%rsp),%ymm5
	vmovdqa   1568(%rsp),%ymm6
	vmovdqa   1600(%rsp),%ymm7
	vmovdqa   1632(%rsp),%ymm8
	vmovdqa   1664(%rsp),%ymm9

	vmovdqa   128(%rsp),%ymm11
	vmovdqa   192(%rsp),%ymm12
	vmovdqa   256(%rsp),%ymm13
	vmovdqa   320(%rsp),%ymm14
	vmovdqa   384(%rsp),%ymm15

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
	vpmuludq  352(%rsp),%ymm2,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  288(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  224(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpmuludq  160(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  384(%rsp),%ymm2,%ymm1
	vpmuludq  352(%rsp),%ymm3,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  320(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  288(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  256(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  224(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  192(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  160(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  %ymm15,%ymm3,%ymm2
	vpmuludq  %ymm14,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm13,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  %ymm12,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  352(%rsp),%ymm4,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  288(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  224(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  1408(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  384(%rsp),%ymm4,%ymm3
	vpmuludq  352(%rsp),%ymm5,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  320(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  288(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  256(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  224(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  %ymm15,%ymm5,%ymm4
	vpmuludq  %ymm14,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  %ymm13,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  352(%rsp),%ymm6,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  288(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  1408(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  1472(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  384(%rsp),%ymm6,%ymm5
	vpmuludq  352(%rsp),%ymm7,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  320(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  288(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  %ymm15,%ymm7,%ymm6
	vpmuludq  %ymm14,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  352(%rsp),%ymm8,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  1408(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  1472(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  1536(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  384(%rsp),%ymm8,%ymm7
	vpmuludq  352(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  %ymm15,%ymm9,%ymm8
	vpmuludq  1408(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  1472(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  1536(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  1600(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vmovdqa   96(%rsp),%ymm11
	vmovdqa   128(%rsp),%ymm12
	vmovdqa   160(%rsp),%ymm13
	vmovdqa   192(%rsp),%ymm14
	vmovdqa   224(%rsp),%ymm15
	vmovdqa   256(%rsp),%ymm9

	vpmuludq  1376(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0

	vpmuludq  1440(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpmuludq  1376(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2

	vpmuludq  1472(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1440(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1408(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpmuludq  1376(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3

	vpmuludq  1408(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpmuludq  1376(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1

	vpmuludq  1504(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  1440(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpmuludq  1376(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4

	vpmuludq  1536(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  1504(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  1472(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  1440(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  1408(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5
	vpmuludq  1376(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm5,%ymm5

	vpmuludq  1568(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  1504(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpmuludq  1440(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  1600(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  1568(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  1536(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  1504(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  1472(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  1440(%rsp),%ymm9,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  1632(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  1568(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  1504(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  1504(%rsp),%ymm9,%ymm9
	vpmuludq  1664(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  1632(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  1600(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  1568(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  1536(%rsp),%ymm15,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vmovdqa   288(%rsp),%ymm11
	vmovdqa   320(%rsp),%ymm12
	vmovdqa   352(%rsp),%ymm13
	vmovdqa   384(%rsp),%ymm14

	vpmuludq  1376(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6

	vpmuludq  1408(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpmuludq  1376(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7

	vpmuludq  1440(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpmuludq  1376(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8

	vpmuludq  1472(%rsp),%ymm11,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  1440(%rsp),%ymm12,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  1408(%rsp),%ymm13,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpmuludq  1376(%rsp),%ymm14,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9

	vpsrlq    $25,%ymm5,%ymm10
	vpaddq    %ymm10,%ymm6,%ymm6
	vpand     vecmask25(%rip),%ymm5,%ymm15

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $26,%ymm6,%ymm10
	vpaddq    %ymm10,%ymm7,%ymm7
	vpand     vecmask26(%rip),%ymm6,%ymm11

	vpsrlq    $25,%ymm1,%ymm10
	vpaddq    %ymm10,%ymm2,%ymm2
	vpand     vecmask25(%rip),%ymm1,%ymm1

	vpsrlq    $25,%ymm7,%ymm10
	vpaddq    %ymm10,%ymm8,%ymm8
	vpand     vecmask25(%rip),%ymm7,%ymm14

	vpsrlq    $26,%ymm2,%ymm10
	vpaddq    %ymm10,%ymm3,%ymm3
	vpand     vecmask26(%rip),%ymm2,%ymm12

	vpsrlq    $26,%ymm8,%ymm10
	vpaddq    %ymm10,%ymm9,%ymm9
	vpand     vecmask26(%rip),%ymm8,%ymm6

	vpsrlq    $25,%ymm3,%ymm10
	vpaddq    %ymm10,%ymm4,%ymm4
	vpand     vecmask25(%rip),%ymm3,%ymm13

	vpsrlq    $25,%ymm9,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $1,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpsllq    $3,%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm8

	vpsrlq    $26,%ymm4,%ymm10
	vpaddq    %ymm10,%ymm15,%ymm15
	vpand     vecmask26(%rip),%ymm4,%ymm7

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm3
	vpand     vecmask26(%rip),%ymm0,%ymm0

	vpsrlq    $25,%ymm15,%ymm10
	vpaddq    %ymm10,%ymm11,%ymm5
	vpand     vecmask25(%rip),%ymm15,%ymm9

	vmovdqa   %ymm0,1376(%rsp)
	vmovdqa   %ymm3,1408(%rsp)
	vmovdqa   %ymm12,1440(%rsp)
	vmovdqa   %ymm13,1472(%rsp)
	vmovdqa   %ymm7,1504(%rsp)
	vmovdqa   %ymm9,1536(%rsp)
	vmovdqa   %ymm5,1568(%rsp)
	vmovdqa   %ymm14,1600(%rsp)
	vmovdqa   %ymm6,1632(%rsp)
	vmovdqa   %ymm8,1664(%rsp)

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
	vmovdqa   416(%rsp),%ymm0
	vmovdqa   448(%rsp),%ymm1
	vmovdqa   480(%rsp),%ymm2
	vmovdqa   512(%rsp),%ymm3
	vmovdqa   544(%rsp),%ymm4
	vmovdqa   576(%rsp),%ymm5
	vmovdqa   608(%rsp),%ymm6
	vmovdqa   640(%rsp),%ymm7
	vmovdqa   672(%rsp),%ymm8
	vmovdqa   704(%rsp),%ymm9

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

	vpsrlq    $25,%ymm9,%ymm10
	vpmuludq  vec19(%rip),%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm9

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

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
	vmovdqa   %ymm9,288(%rdi)

	// reduce Z2
	vmovdqa   736(%rsp),%ymm0
	vmovdqa   768(%rsp),%ymm1
	vmovdqa   800(%rsp),%ymm2
	vmovdqa   832(%rsp),%ymm3
	vmovdqa   864(%rsp),%ymm4
	vmovdqa   896(%rsp),%ymm5
	vmovdqa   928(%rsp),%ymm6
	vmovdqa   960(%rsp),%ymm7
	vmovdqa   992(%rsp),%ymm8
	vmovdqa   1024(%rsp),%ymm9

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

	vpsrlq    $25,%ymm9,%ymm10
	vpmuludq  vec19(%rip),%ymm10,%ymm10
	vpaddq    %ymm10,%ymm0,%ymm0
	vpand     vecmask25(%rip),%ymm9,%ymm9

	vpsrlq    $26,%ymm0,%ymm10
	vpaddq    %ymm10,%ymm1,%ymm1
	vpand     vecmask26(%rip),%ymm0,%ymm0

	// store Z2
	vmovdqa   %ymm0,320(%rdi)
	vmovdqa   %ymm1,352(%rdi)
	vmovdqa   %ymm2,384(%rdi)
	vmovdqa   %ymm3,416(%rdi)
	vmovdqa   %ymm4,448(%rdi)
	vmovdqa   %ymm5,480(%rdi)
	vmovdqa   %ymm6,512(%rdi)
	vmovdqa   %ymm7,544(%rdi)
	vmovdqa   %ymm8,576(%rdi)
	vmovdqa   %ymm9,608(%rdi)

	movq 	  %r8,%rsp
	
	ret
.section	.note.GNU-stack,"",@progbits
