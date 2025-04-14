#include "crypto_asm_hidden.h"
#include "consts_namespace.h"

// 8-way Montgomery ladder

	.p2align 6

ASM_HIDDEN _CRYPTO_SHARED_NAMESPACE(mladder_8x1)
.globl _CRYPTO_SHARED_NAMESPACE(mladder_8x1)
ASM_HIDDEN CRYPTO_SHARED_NAMESPACE(mladder_8x1)
.globl CRYPTO_SHARED_NAMESPACE(mladder_8x1)
_CRYPTO_SHARED_NAMESPACE(mladder_8x1):
CRYPTO_SHARED_NAMESPACE(mladder_8x1):

	movq 	%rsp,%r8
	andq 	$-64,%rsp
	subq 	$1024,%rsp

	vmovdqa64 vec0(%rip),%zmm0
	vmovdqa64 vec1(%rip),%zmm1

	// X2 ← 1
	vmovdqa64 %zmm1,%zmm10
	vmovdqa64 %zmm0,%zmm11
	vmovdqa64 %zmm0,%zmm12
	vmovdqa64 %zmm0,%zmm13
	vmovdqa64 %zmm0,%zmm14

	// Z2 ← 0
	vmovdqa64 %zmm0,%zmm15
	vmovdqa64 %zmm0,%zmm16
	vmovdqa64 %zmm0,%zmm17
	vmovdqa64 %zmm0,%zmm18
	vmovdqa64 %zmm0,%zmm19

	// Z3 ← 1
	vmovdqa64 %zmm1,%zmm25
	vmovdqa64 %zmm0,%zmm26
	vmovdqa64 %zmm0,%zmm27
	vmovdqa64 %zmm0,%zmm28
	vmovdqa64 %zmm0,%zmm29

	// X3 ← XP, X1 ← XP
	vmovdqa64 0(%rsi),%zmm20
	vmovdqa64 %zmm20,64(%rsp)
	vmovdqa64 64(%rsi),%zmm21
	vmovdqa64 %zmm21,128(%rsp)
	vmovdqa64 128(%rsi),%zmm22
	vmovdqa64 %zmm22,192(%rsp)
	vmovdqa64 192(%rsi),%zmm23
	vmovdqa64 %zmm23,256(%rsp)
	vmovdqa64 256(%rsi),%zmm24
	vmovdqa64 %zmm24,320(%rsp)

	movq    $192,%r9
	movb    $62,%cl

	vmovdqa64 vec0(%rip),%zmm0
	vmovdqa64 sixtytwo(%rip),%zmm1
	vmovdqa64 %zmm1,896(%rsp)
	vmovdqa64 %zmm0,960(%rsp)

	movq    %rdx,%rax

.L1:
	addq    %r9,%rax
	vmovdqa64 0(%rax),%zmm30
	vmovdqa64 %zmm30,0(%rsp)
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

	// T1 ← X2 + Z2
	vpaddq	  %zmm15,%zmm10,%zmm0
	vpaddq	  %zmm16,%zmm11,%zmm1
	vpaddq	  %zmm17,%zmm12,%zmm2
	vpaddq	  %zmm18,%zmm13,%zmm3
	vpaddq	  %zmm19,%zmm14,%zmm4

	vpsrlq    $52,%zmm3,%zmm31
	vpaddq    %zmm31,%zmm4,%zmm4
	vpandq    vecmask52(%rip),%zmm3,%zmm3

	vpsrlq    $47,%zmm4,%zmm31
	vpandq    vecmask47(%rip),%zmm4,%zmm4
	vpmadd52luq  vec19(%rip),%zmm31,%zmm0

	vpsrlq    $52,%zmm0,%zmm31
	vpaddq    %zmm31,%zmm1,%zmm1
	vpandq    vecmask52(%rip),%zmm0,%zmm0

	vpsrlq    $52,%zmm1,%zmm31
	vpaddq    %zmm31,%zmm2,%zmm2
	vpandq    vecmask52(%rip),%zmm1,%zmm1

	vpsrlq    $52,%zmm2,%zmm31
	vpaddq    %zmm31,%zmm3,%zmm3
	vpandq    vecmask52(%rip),%zmm2,%zmm2

	vpsrlq    $52,%zmm3,%zmm31
	vpaddq    %zmm31,%zmm4,%zmm4
	vpandq    vecmask52(%rip),%zmm3,%zmm3

	// T2 ← X2 - Z2
	vpaddq    vec2p0(%rip),%zmm10,%zmm10
	vpaddq    vec2p123(%rip),%zmm11,%zmm11
	vpaddq    vec2p123(%rip),%zmm12,%zmm12
	vpaddq    vec2p123(%rip),%zmm13,%zmm13
	vpaddq    vec2p4(%rip),%zmm14,%zmm14

	vpsubq	  %zmm15,%zmm10,%zmm10
	vpsubq	  %zmm16,%zmm11,%zmm11
	vpsubq	  %zmm17,%zmm12,%zmm12
	vpsubq	  %zmm18,%zmm13,%zmm13
	vpsubq	  %zmm19,%zmm14,%zmm14

	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm14
	vpandq    vecmask52(%rip),%zmm13,%zmm13

	vpsrlq    $47,%zmm14,%zmm31
	vpandq    vecmask47(%rip),%zmm14,%zmm14
	vpmadd52luq  vec19(%rip),%zmm31,%zmm10

	vpsrlq    $52,%zmm10,%zmm31
	vpaddq    %zmm31,%zmm11,%zmm11
	vpandq    vecmask52(%rip),%zmm10,%zmm10

	vpsrlq    $52,%zmm11,%zmm31
	vpaddq    %zmm31,%zmm12,%zmm12
	vpandq    vecmask52(%rip),%zmm11,%zmm11

	vpsrlq    $52,%zmm12,%zmm31
	vpaddq    %zmm31,%zmm13,%zmm13
	vpandq    vecmask52(%rip),%zmm12,%zmm12

	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm14
	vpandq    vecmask52(%rip),%zmm13,%zmm13

	// T3 ← X3 + Z3
	vpaddq	  %zmm20,%zmm25,%zmm15
	vpaddq	  %zmm21,%zmm26,%zmm16
	vpaddq	  %zmm22,%zmm27,%zmm17
	vpaddq	  %zmm23,%zmm28,%zmm18
	vpaddq	  %zmm24,%zmm29,%zmm19

	vpsrlq    $52,%zmm18,%zmm31
	vpaddq    %zmm31,%zmm19,%zmm19
	vpandq    vecmask52(%rip),%zmm18,%zmm18

	vpsrlq    $47,%zmm19,%zmm31
	vpandq    vecmask47(%rip),%zmm19,%zmm19
	vpmadd52luq  vec19(%rip),%zmm31,%zmm15

	vpsrlq    $52,%zmm15,%zmm31
	vpaddq    %zmm31,%zmm16,%zmm16
	vpandq    vecmask52(%rip),%zmm15,%zmm15

	vpsrlq    $52,%zmm16,%zmm31
	vpaddq    %zmm31,%zmm17,%zmm17
	vpandq    vecmask52(%rip),%zmm16,%zmm16

	vpsrlq    $52,%zmm17,%zmm31
	vpaddq    %zmm31,%zmm18,%zmm18
	vpandq    vecmask52(%rip),%zmm17,%zmm17

	vpsrlq    $52,%zmm18,%zmm31
	vpaddq    %zmm31,%zmm19,%zmm19
	vpandq    vecmask52(%rip),%zmm18,%zmm18

	// T4 ← X3 - Z3
	vpaddq    vec2p0(%rip),%zmm20,%zmm20
	vpaddq    vec2p123(%rip),%zmm21,%zmm21
	vpaddq    vec2p123(%rip),%zmm22,%zmm22
	vpaddq    vec2p123(%rip),%zmm23,%zmm23
	vpaddq    vec2p4(%rip),%zmm24,%zmm24

	vpsubq	  %zmm25,%zmm20,%zmm5
	vpsubq	  %zmm26,%zmm21,%zmm6
	vpsubq	  %zmm27,%zmm22,%zmm7
	vpsubq	  %zmm28,%zmm23,%zmm8
	vpsubq	  %zmm29,%zmm24,%zmm9

	vpsrlq    $52,%zmm8,%zmm31
	vpaddq    %zmm31,%zmm9,%zmm9
	vpandq    vecmask52(%rip),%zmm8,%zmm8

	vpsrlq    $47,%zmm9,%zmm31
	vpandq    vecmask47(%rip),%zmm9,%zmm9
	vpmadd52luq  vec19(%rip),%zmm31,%zmm5

	vpsrlq    $52,%zmm5,%zmm31
	vpaddq    %zmm31,%zmm6,%zmm6
	vpandq    vecmask52(%rip),%zmm5,%zmm5

	vpsrlq    $52,%zmm6,%zmm31
	vpaddq    %zmm31,%zmm7,%zmm7
	vpandq    vecmask52(%rip),%zmm6,%zmm6

	vpsrlq    $52,%zmm7,%zmm31
	vpaddq    %zmm31,%zmm8,%zmm8
	vpandq    vecmask52(%rip),%zmm7,%zmm7

	vpsrlq    $52,%zmm8,%zmm31
	vpaddq    %zmm31,%zmm9,%zmm9
	vpandq    vecmask52(%rip),%zmm8,%zmm8

	// Z3 ← T2 · T3
	vpxorq    %zmm20,%zmm20,%zmm20
	vpxorq    %zmm21,%zmm21,%zmm21
	vpxorq    %zmm22,%zmm22,%zmm22
	vpxorq    %zmm23,%zmm23,%zmm23
	vpxorq    %zmm24,%zmm24,%zmm24
	vpxorq    %zmm25,%zmm25,%zmm25
	vpxorq    %zmm26,%zmm26,%zmm26
	vpxorq    %zmm27,%zmm27,%zmm27
	vpxorq    %zmm28,%zmm28,%zmm28
	vpxorq    %zmm29,%zmm29,%zmm29

	vpmadd52luq  %zmm10,%zmm15,%zmm20
	vpmadd52huq  %zmm10,%zmm15,%zmm21

	vpmadd52luq  %zmm10,%zmm16,%zmm21
	vpmadd52huq  %zmm10,%zmm16,%zmm22
	vpmadd52luq  %zmm11,%zmm15,%zmm21
	vpmadd52huq  %zmm11,%zmm15,%zmm22

	vpmadd52luq  %zmm10,%zmm17,%zmm22
	vpmadd52huq  %zmm10,%zmm17,%zmm23
	vpmadd52luq  %zmm11,%zmm16,%zmm22
	vpmadd52huq  %zmm11,%zmm16,%zmm23
	vpmadd52luq  %zmm12,%zmm15,%zmm22
	vpmadd52huq  %zmm12,%zmm15,%zmm23

	vpmadd52luq  %zmm10,%zmm18,%zmm23
	vpmadd52huq  %zmm10,%zmm18,%zmm24
	vpmadd52luq  %zmm11,%zmm17,%zmm23
	vpmadd52huq  %zmm11,%zmm17,%zmm24
	vpmadd52luq  %zmm12,%zmm16,%zmm23
	vpmadd52huq  %zmm12,%zmm16,%zmm24
	vpmadd52luq  %zmm13,%zmm15,%zmm23
	vpmadd52huq  %zmm13,%zmm15,%zmm24

	vpmadd52luq  %zmm10,%zmm19,%zmm24
	vpmadd52huq  %zmm10,%zmm19,%zmm25
	vpmadd52luq  %zmm11,%zmm18,%zmm24
	vpmadd52huq  %zmm11,%zmm18,%zmm25
	vpmadd52luq  %zmm12,%zmm17,%zmm24
	vpmadd52huq  %zmm12,%zmm17,%zmm25
	vpmadd52luq  %zmm13,%zmm16,%zmm24
	vpmadd52huq  %zmm13,%zmm16,%zmm25
	vpmadd52luq  %zmm14,%zmm15,%zmm24
	vpmadd52huq  %zmm14,%zmm15,%zmm25

	vpmadd52luq  %zmm11,%zmm19,%zmm25
	vpmadd52huq  %zmm11,%zmm19,%zmm26
	vpmadd52luq  %zmm12,%zmm18,%zmm25
	vpmadd52huq  %zmm12,%zmm18,%zmm26
	vpmadd52luq  %zmm13,%zmm17,%zmm25
	vpmadd52huq  %zmm13,%zmm17,%zmm26
	vpmadd52luq  %zmm14,%zmm16,%zmm25
	vpmadd52huq  %zmm14,%zmm16,%zmm26

	vpmadd52luq  %zmm12,%zmm19,%zmm26
	vpmadd52huq  %zmm12,%zmm19,%zmm27
	vpmadd52luq  %zmm13,%zmm18,%zmm26
	vpmadd52huq  %zmm13,%zmm18,%zmm27
	vpmadd52luq  %zmm14,%zmm17,%zmm26
	vpmadd52huq  %zmm14,%zmm17,%zmm27

	vpmadd52luq  %zmm13,%zmm19,%zmm27
	vpmadd52huq  %zmm13,%zmm19,%zmm28
	vpmadd52luq  %zmm14,%zmm18,%zmm27
	vpmadd52huq  %zmm14,%zmm18,%zmm28

	vpmadd52luq  %zmm14,%zmm19,%zmm28
	vpmadd52huq  %zmm14,%zmm19,%zmm29

	vpsrlq    $52,%zmm25,%zmm31
	vpaddq    %zmm31,%zmm26,%zmm26
	vpandq    vecmask52(%rip),%zmm25,%zmm25
	vpmadd52luq  vec608(%rip),%zmm25,%zmm20
	vpmadd52huq  vec608(%rip),%zmm25,%zmm21

	vpsrlq    $52,%zmm26,%zmm31
	vpaddq    %zmm31,%zmm27,%zmm27
	vpandq    vecmask52(%rip),%zmm26,%zmm26
	vpmadd52luq  vec608(%rip),%zmm26,%zmm21
	vpmadd52huq  vec608(%rip),%zmm26,%zmm22

	vpsrlq    $52,%zmm27,%zmm31
	vpaddq    %zmm31,%zmm28,%zmm28
	vpandq    vecmask52(%rip),%zmm27,%zmm27
	vpmadd52luq  vec608(%rip),%zmm27,%zmm22
	vpmadd52huq  vec608(%rip),%zmm27,%zmm23

	vpsrlq    $52,%zmm28,%zmm31
	vpaddq    %zmm31,%zmm29,%zmm29
	vpandq    vecmask52(%rip),%zmm28,%zmm28
	vpmadd52luq  vec608(%rip),%zmm28,%zmm23
	vpmadd52huq  vec608(%rip),%zmm28,%zmm24

	vpmadd52luq  vec608(%rip),%zmm29,%zmm24

	vmovdqa64 %zmm20,384(%rsp)
	vmovdqa64 %zmm21,448(%rsp)
	vmovdqa64 %zmm22,512(%rsp)
	vmovdqa64 %zmm23,576(%rsp)
	vmovdqa64 %zmm24,640(%rsp)

	// X3 ← T1 · T4
	vpxorq    %zmm20,%zmm20,%zmm20
	vpxorq    %zmm21,%zmm21,%zmm21
	vpxorq    %zmm22,%zmm22,%zmm22
	vpxorq    %zmm23,%zmm23,%zmm23
	vpxorq    %zmm24,%zmm24,%zmm24
	vpxorq    %zmm25,%zmm25,%zmm25
	vpxorq    %zmm26,%zmm26,%zmm26
	vpxorq    %zmm27,%zmm27,%zmm27
	vpxorq    %zmm28,%zmm28,%zmm28
	vpxorq    %zmm29,%zmm29,%zmm29

	vpmadd52luq  %zmm0,%zmm5,%zmm20
	vpmadd52huq  %zmm0,%zmm5,%zmm21

	vpmadd52luq  %zmm0,%zmm6,%zmm21
	vpmadd52huq  %zmm0,%zmm6,%zmm22
	vpmadd52luq  %zmm1,%zmm5,%zmm21
	vpmadd52huq  %zmm1,%zmm5,%zmm22

	vpmadd52luq  %zmm0,%zmm7,%zmm22
	vpmadd52huq  %zmm0,%zmm7,%zmm23
	vpmadd52luq  %zmm1,%zmm6,%zmm22
	vpmadd52huq  %zmm1,%zmm6,%zmm23
	vpmadd52luq  %zmm2,%zmm5,%zmm22
	vpmadd52huq  %zmm2,%zmm5,%zmm23

	vpmadd52luq  %zmm0,%zmm8,%zmm23
	vpmadd52huq  %zmm0,%zmm8,%zmm24
	vpmadd52luq  %zmm1,%zmm7,%zmm23
	vpmadd52huq  %zmm1,%zmm7,%zmm24
	vpmadd52luq  %zmm2,%zmm6,%zmm23
	vpmadd52huq  %zmm2,%zmm6,%zmm24
	vpmadd52luq  %zmm3,%zmm5,%zmm23
	vpmadd52huq  %zmm3,%zmm5,%zmm24

	vpmadd52luq  %zmm0,%zmm9,%zmm24
	vpmadd52huq  %zmm0,%zmm9,%zmm25
	vpmadd52luq  %zmm1,%zmm8,%zmm24
	vpmadd52huq  %zmm1,%zmm8,%zmm25
	vpmadd52luq  %zmm2,%zmm7,%zmm24
	vpmadd52huq  %zmm2,%zmm7,%zmm25
	vpmadd52luq  %zmm3,%zmm6,%zmm24
	vpmadd52huq  %zmm3,%zmm6,%zmm25
	vpmadd52luq  %zmm4,%zmm5,%zmm24
	vpmadd52huq  %zmm4,%zmm5,%zmm25

	vpmadd52luq  %zmm1,%zmm9,%zmm25
	vpmadd52huq  %zmm1,%zmm9,%zmm26
	vpmadd52luq  %zmm2,%zmm8,%zmm25
	vpmadd52huq  %zmm2,%zmm8,%zmm26
	vpmadd52luq  %zmm3,%zmm7,%zmm25
	vpmadd52huq  %zmm3,%zmm7,%zmm26
	vpmadd52luq  %zmm4,%zmm6,%zmm25
	vpmadd52huq  %zmm4,%zmm6,%zmm26

	vpmadd52luq  %zmm2,%zmm9,%zmm26
	vpmadd52huq  %zmm2,%zmm9,%zmm27
	vpmadd52luq  %zmm3,%zmm8,%zmm26
	vpmadd52huq  %zmm3,%zmm8,%zmm27
	vpmadd52luq  %zmm4,%zmm7,%zmm26
	vpmadd52huq  %zmm4,%zmm7,%zmm27

	vpmadd52luq  %zmm3,%zmm9,%zmm27
	vpmadd52huq  %zmm3,%zmm9,%zmm28
	vpmadd52luq  %zmm4,%zmm8,%zmm27
	vpmadd52huq  %zmm4,%zmm8,%zmm28

	vpmadd52luq  %zmm4,%zmm9,%zmm28
	vpmadd52huq  %zmm4,%zmm9,%zmm29

	vpsrlq    $52,%zmm25,%zmm31
	vpaddq    %zmm31,%zmm26,%zmm26
	vpandq    vecmask52(%rip),%zmm25,%zmm25
	vpmadd52luq  vec608(%rip),%zmm25,%zmm20
	vpmadd52huq  vec608(%rip),%zmm25,%zmm21

	vpsrlq    $52,%zmm26,%zmm31
	vpaddq    %zmm31,%zmm27,%zmm27
	vpandq    vecmask52(%rip),%zmm26,%zmm26
	vpmadd52luq  vec608(%rip),%zmm26,%zmm21
	vpmadd52huq  vec608(%rip),%zmm26,%zmm22

	vpsrlq    $52,%zmm27,%zmm31
	vpaddq    %zmm31,%zmm28,%zmm28
	vpandq    vecmask52(%rip),%zmm27,%zmm27
	vpmadd52luq  vec608(%rip),%zmm27,%zmm22
	vpmadd52huq  vec608(%rip),%zmm27,%zmm23

	vpsrlq    $52,%zmm28,%zmm31
	vpaddq    %zmm31,%zmm29,%zmm29
	vpandq    vecmask52(%rip),%zmm28,%zmm28
	vpmadd52luq  vec608(%rip),%zmm28,%zmm23
	vpmadd52huq  vec608(%rip),%zmm28,%zmm24

	vpmadd52luq  vec608(%rip),%zmm29,%zmm24

	// conditional select 
	vmovdqa64 896(%rsp),%zmm31
	vpsrlq    %xmm31,%zmm30,%zmm30
	vpandq    vec1(%rip),%zmm30,%zmm25

	vpxorq    960(%rsp),%zmm25,%zmm30
	vmovdqa64 %zmm25,960(%rsp)

	vpsubq    one(%rip),%zmm31,%zmm31
	vmovdqa64 %zmm31,896(%rsp)

	vmovdqa64 vec0(%rip),%zmm31
	vpsubq    %zmm30,%zmm31,%zmm31

	vpxorq	  %zmm15,%zmm0,%zmm25
	vpxorq	  %zmm16,%zmm1,%zmm26
	vpxorq	  %zmm17,%zmm2,%zmm27
	vpxorq	  %zmm18,%zmm3,%zmm28
	vpxorq	  %zmm19,%zmm4,%zmm29

	vpandq	  %zmm31,%zmm25,%zmm25
	vpandq	  %zmm31,%zmm26,%zmm26
	vpandq	  %zmm31,%zmm27,%zmm27
	vpandq	  %zmm31,%zmm28,%zmm28
	vpandq	  %zmm31,%zmm29,%zmm29

	vpxorq	  %zmm0,%zmm25,%zmm0
	vpxorq	  %zmm1,%zmm26,%zmm1
	vpxorq	  %zmm2,%zmm27,%zmm2
	vpxorq	  %zmm3,%zmm28,%zmm3
	vpxorq	  %zmm4,%zmm29,%zmm4

	vpxorq	  %zmm5,%zmm10,%zmm25
	vpxorq	  %zmm6,%zmm11,%zmm26
	vpxorq	  %zmm7,%zmm12,%zmm27
	vpxorq	  %zmm8,%zmm13,%zmm28
	vpxorq	  %zmm9,%zmm14,%zmm29

	vpandq	  %zmm31,%zmm25,%zmm25
	vpandq	  %zmm31,%zmm26,%zmm26
	vpandq	  %zmm31,%zmm27,%zmm27
	vpandq	  %zmm31,%zmm28,%zmm28
	vpandq	  %zmm31,%zmm29,%zmm29

	vpxorq	  %zmm10,%zmm25,%zmm5
	vpxorq	  %zmm11,%zmm26,%zmm6
	vpxorq	  %zmm12,%zmm27,%zmm7
	vpxorq	  %zmm13,%zmm28,%zmm8
	vpxorq	  %zmm14,%zmm29,%zmm9

	// T2 ← T2^2
	vpxorq    %zmm10,%zmm10,%zmm10
	vpxorq    %zmm11,%zmm11,%zmm11
	vpxorq    %zmm12,%zmm12,%zmm12
	vpxorq    %zmm13,%zmm13,%zmm13
	vpxorq    %zmm14,%zmm14,%zmm14
	vpxorq    %zmm15,%zmm15,%zmm15
	vpxorq    %zmm16,%zmm16,%zmm16
	vpxorq    %zmm17,%zmm17,%zmm17
	vpxorq    %zmm18,%zmm18,%zmm18
	vpxorq    %zmm19,%zmm19,%zmm19

	vpmadd52luq  %zmm5,%zmm5,%zmm10
	vpmadd52huq  %zmm5,%zmm5,%zmm11

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm5,%zmm6,%zmm31
	vpmadd52huq  %zmm5,%zmm6,%zmm12
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm11,%zmm11
	vpaddq       %zmm12,%zmm12,%zmm12

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm5,%zmm7,%zmm31
	vpmadd52huq  %zmm5,%zmm7,%zmm13
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm12,%zmm12
	vpaddq       %zmm13,%zmm13,%zmm13
	vpmadd52luq  %zmm6,%zmm6,%zmm12
	vpmadd52huq  %zmm6,%zmm6,%zmm13

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm5,%zmm8,%zmm31
	vpmadd52huq  %zmm5,%zmm8,%zmm14
	vpmadd52luq  %zmm6,%zmm7,%zmm31
	vpmadd52huq  %zmm6,%zmm7,%zmm14
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm13,%zmm13
	vpaddq       %zmm14,%zmm14,%zmm14

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm5,%zmm9,%zmm31
	vpmadd52huq  %zmm5,%zmm9,%zmm15
	vpmadd52luq  %zmm6,%zmm8,%zmm31
	vpmadd52huq  %zmm6,%zmm8,%zmm15
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm14,%zmm14
	vpaddq       %zmm15,%zmm15,%zmm15
	vpmadd52luq  %zmm7,%zmm7,%zmm14
	vpmadd52huq  %zmm7,%zmm7,%zmm15

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm6,%zmm9,%zmm31
	vpmadd52huq  %zmm6,%zmm9,%zmm16
	vpmadd52luq  %zmm7,%zmm8,%zmm31
	vpmadd52huq  %zmm7,%zmm8,%zmm16
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm15,%zmm15
	vpaddq       %zmm16,%zmm16,%zmm16

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm7,%zmm9,%zmm31
	vpmadd52huq  %zmm7,%zmm9,%zmm17
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm16,%zmm16
	vpaddq       %zmm17,%zmm17,%zmm17
	vpmadd52luq  %zmm8,%zmm8,%zmm16
	vpmadd52huq  %zmm8,%zmm8,%zmm17

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm8,%zmm9,%zmm31
	vpmadd52huq  %zmm8,%zmm9,%zmm18
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm17,%zmm17
	vpaddq       %zmm18,%zmm18,%zmm18

	vpmadd52luq  %zmm9,%zmm9,%zmm18
	vpmadd52huq  %zmm9,%zmm9,%zmm19

	vpsrlq    $52,%zmm15,%zmm31
	vpaddq    %zmm31,%zmm16,%zmm16
	vpandq    vecmask52(%rip),%zmm15,%zmm15
	vpmadd52luq  vec608(%rip),%zmm15,%zmm10
	vpmadd52huq  vec608(%rip),%zmm15,%zmm11

	vpsrlq    $52,%zmm16,%zmm31
	vpaddq    %zmm31,%zmm17,%zmm17
	vpandq    vecmask52(%rip),%zmm16,%zmm16
	vpmadd52luq  vec608(%rip),%zmm16,%zmm11
	vpmadd52huq  vec608(%rip),%zmm16,%zmm12

	vpsrlq    $52,%zmm17,%zmm31
	vpaddq    %zmm31,%zmm18,%zmm18
	vpandq    vecmask52(%rip),%zmm17,%zmm17
	vpmadd52luq  vec608(%rip),%zmm17,%zmm12
	vpmadd52huq  vec608(%rip),%zmm17,%zmm13

	vpsrlq    $52,%zmm18,%zmm31
	vpaddq    %zmm31,%zmm19,%zmm19
	vpandq    vecmask52(%rip),%zmm18,%zmm18
	vpmadd52luq  vec608(%rip),%zmm18,%zmm13
	vpmadd52huq  vec608(%rip),%zmm18,%zmm14

	vpmadd52luq  vec608(%rip),%zmm19,%zmm14

	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm14
	vpandq    vecmask52(%rip),%zmm13,%zmm13

	vpsrlq    $47,%zmm14,%zmm31
	vpandq    vecmask47(%rip),%zmm14,%zmm14
	vpmadd52luq  vec19(%rip),%zmm31,%zmm10

	vpsrlq    $52,%zmm10,%zmm31
	vpaddq    %zmm31,%zmm11,%zmm11
	vpandq    vecmask52(%rip),%zmm10,%zmm5

	vpsrlq    $52,%zmm11,%zmm31
	vpaddq    %zmm31,%zmm12,%zmm12
	vpandq    vecmask52(%rip),%zmm11,%zmm6

	vpsrlq    $52,%zmm12,%zmm31
	vpaddq    %zmm31,%zmm13,%zmm13
	vpandq    vecmask52(%rip),%zmm12,%zmm7

	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm9
	vpandq    vecmask52(%rip),%zmm13,%zmm8

	// T1 ← T1^2
	vpxorq    %zmm10,%zmm10,%zmm10
	vpxorq    %zmm11,%zmm11,%zmm11
	vpxorq    %zmm12,%zmm12,%zmm12
	vpxorq    %zmm13,%zmm13,%zmm13
	vpxorq    %zmm14,%zmm14,%zmm14
	vpxorq    %zmm15,%zmm15,%zmm15
	vpxorq    %zmm16,%zmm16,%zmm16
	vpxorq    %zmm17,%zmm17,%zmm17
	vpxorq    %zmm18,%zmm18,%zmm18
	vpxorq    %zmm19,%zmm19,%zmm19

	vpmadd52luq  %zmm0,%zmm0,%zmm10
	vpmadd52huq  %zmm0,%zmm0,%zmm11

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm0,%zmm1,%zmm31
	vpmadd52huq  %zmm0,%zmm1,%zmm12
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm11,%zmm11
	vpaddq       %zmm12,%zmm12,%zmm12

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm0,%zmm2,%zmm31
	vpmadd52huq  %zmm0,%zmm2,%zmm13
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm12,%zmm12
	vpaddq       %zmm13,%zmm13,%zmm13
	vpmadd52luq  %zmm1,%zmm1,%zmm12
	vpmadd52huq  %zmm1,%zmm1,%zmm13

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm0,%zmm3,%zmm31
	vpmadd52huq  %zmm0,%zmm3,%zmm14
	vpmadd52luq  %zmm1,%zmm2,%zmm31
	vpmadd52huq  %zmm1,%zmm2,%zmm14
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm13,%zmm13
	vpaddq       %zmm14,%zmm14,%zmm14

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm0,%zmm4,%zmm31
	vpmadd52huq  %zmm0,%zmm4,%zmm15
	vpmadd52luq  %zmm1,%zmm3,%zmm31
	vpmadd52huq  %zmm1,%zmm3,%zmm15
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm14,%zmm14
	vpaddq       %zmm15,%zmm15,%zmm15
	vpmadd52luq  %zmm2,%zmm2,%zmm14
	vpmadd52huq  %zmm2,%zmm2,%zmm15

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm1,%zmm4,%zmm31
	vpmadd52huq  %zmm1,%zmm4,%zmm16
	vpmadd52luq  %zmm2,%zmm3,%zmm31
	vpmadd52huq  %zmm2,%zmm3,%zmm16
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm15,%zmm15
	vpaddq       %zmm16,%zmm16,%zmm16

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm2,%zmm4,%zmm31
	vpmadd52huq  %zmm2,%zmm4,%zmm17
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm16,%zmm16
	vpaddq       %zmm17,%zmm17,%zmm17
	vpmadd52luq  %zmm3,%zmm3,%zmm16
	vpmadd52huq  %zmm3,%zmm3,%zmm17

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm3,%zmm4,%zmm31
	vpmadd52huq  %zmm3,%zmm4,%zmm18
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm17,%zmm17
	vpaddq       %zmm18,%zmm18,%zmm18

	vpmadd52luq  %zmm4,%zmm4,%zmm18
	vpmadd52huq  %zmm4,%zmm4,%zmm19

	vpsrlq    $52,%zmm15,%zmm31
	vpaddq    %zmm31,%zmm16,%zmm16
	vpandq    vecmask52(%rip),%zmm15,%zmm15
	vpmadd52luq  vec608(%rip),%zmm15,%zmm10
	vpmadd52huq  vec608(%rip),%zmm15,%zmm11

	vpsrlq    $52,%zmm16,%zmm31
	vpaddq    %zmm31,%zmm17,%zmm17
	vpandq    vecmask52(%rip),%zmm16,%zmm16
	vpmadd52luq  vec608(%rip),%zmm16,%zmm11
	vpmadd52huq  vec608(%rip),%zmm16,%zmm12

	vpsrlq    $52,%zmm17,%zmm31
	vpaddq    %zmm31,%zmm18,%zmm18
	vpandq    vecmask52(%rip),%zmm17,%zmm17
	vpmadd52luq  vec608(%rip),%zmm17,%zmm12
	vpmadd52huq  vec608(%rip),%zmm17,%zmm13

	vpsrlq    $52,%zmm18,%zmm31
	vpaddq    %zmm31,%zmm19,%zmm19
	vpandq    vecmask52(%rip),%zmm18,%zmm18
	vpmadd52luq  vec608(%rip),%zmm18,%zmm13
	vpmadd52huq  vec608(%rip),%zmm18,%zmm14

	vpmadd52luq  vec608(%rip),%zmm19,%zmm14

	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm14
	vpandq    vecmask52(%rip),%zmm13,%zmm13

	vpsrlq    $47,%zmm14,%zmm31
	vpandq    vecmask47(%rip),%zmm14,%zmm14
	vpmadd52luq  vec19(%rip),%zmm31,%zmm10

	vpsrlq    $52,%zmm10,%zmm31
	vpaddq    %zmm31,%zmm11,%zmm11
	vpandq    vecmask52(%rip),%zmm10,%zmm0

	vpsrlq    $52,%zmm11,%zmm31
	vpaddq    %zmm31,%zmm12,%zmm12
	vpandq    vecmask52(%rip),%zmm11,%zmm1

	vpsrlq    $52,%zmm12,%zmm31
	vpaddq    %zmm31,%zmm13,%zmm13
	vpandq    vecmask52(%rip),%zmm12,%zmm2

	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm4
	vpandq    vecmask52(%rip),%zmm13,%zmm3

	// T3 ← X3 + Z3
	vpaddq	  384(%rsp),%zmm20,%zmm25
	vpaddq	  448(%rsp),%zmm21,%zmm26
	vpaddq	  512(%rsp),%zmm22,%zmm27
	vpaddq	  576(%rsp),%zmm23,%zmm28
	vpaddq	  640(%rsp),%zmm24,%zmm29

	vpsrlq    $52,%zmm28,%zmm31
	vpaddq    %zmm31,%zmm29,%zmm29
	vpandq    vecmask52(%rip),%zmm28,%zmm28

	vpsrlq    $47,%zmm29,%zmm31
	vpandq    vecmask47(%rip),%zmm29,%zmm29
	vpmadd52luq  vec19(%rip),%zmm31,%zmm25

	vpsrlq    $52,%zmm25,%zmm31
	vpaddq    %zmm31,%zmm26,%zmm26
	vpandq    vecmask52(%rip),%zmm25,%zmm25

	vpsrlq    $52,%zmm26,%zmm31
	vpaddq    %zmm31,%zmm27,%zmm27
	vpandq    vecmask52(%rip),%zmm26,%zmm26

	vpsrlq    $52,%zmm27,%zmm31
	vpaddq    %zmm31,%zmm28,%zmm28
	vpandq    vecmask52(%rip),%zmm27,%zmm27

	vpsrlq    $52,%zmm28,%zmm31
	vpaddq    %zmm31,%zmm29,%zmm29
	vpandq    vecmask52(%rip),%zmm28,%zmm28

	// Z3 ← X3 - Z3
	vpaddq    vec2p0(%rip),%zmm20,%zmm20
	vpaddq    vec2p123(%rip),%zmm21,%zmm21
	vpaddq    vec2p123(%rip),%zmm22,%zmm22
	vpaddq    vec2p123(%rip),%zmm23,%zmm23
	vpaddq    vec2p4(%rip),%zmm24,%zmm24

	vpsubq	  384(%rsp),%zmm20,%zmm20
	vpsubq	  448(%rsp),%zmm21,%zmm21
	vpsubq	  512(%rsp),%zmm22,%zmm22
	vpsubq	  576(%rsp),%zmm23,%zmm23
	vpsubq	  640(%rsp),%zmm24,%zmm24

	vpsrlq    $52,%zmm23,%zmm31
	vpaddq    %zmm31,%zmm24,%zmm24
	vpandq    vecmask52(%rip),%zmm23,%zmm23

	vpsrlq    $47,%zmm24,%zmm31
	vpandq    vecmask47(%rip),%zmm24,%zmm24
	vpmadd52luq  vec19(%rip),%zmm31,%zmm20

	vpsrlq    $52,%zmm20,%zmm31
	vpaddq    %zmm31,%zmm21,%zmm21
	vpandq    vecmask52(%rip),%zmm20,%zmm20

	vpsrlq    $52,%zmm21,%zmm31
	vpaddq    %zmm31,%zmm22,%zmm22
	vpandq    vecmask52(%rip),%zmm21,%zmm21

	vpsrlq    $52,%zmm22,%zmm31
	vpaddq    %zmm31,%zmm23,%zmm23
	vpandq    vecmask52(%rip),%zmm22,%zmm22

	vpsrlq    $52,%zmm23,%zmm31
	vpaddq    %zmm31,%zmm24,%zmm24
	vpandq    vecmask52(%rip),%zmm23,%zmm23

	// Z3 ← Z3^2
	vpxorq    %zmm10,%zmm10,%zmm10
	vpxorq    %zmm11,%zmm11,%zmm11
	vpxorq    %zmm12,%zmm12,%zmm12
	vpxorq    %zmm13,%zmm13,%zmm13
	vpxorq    %zmm14,%zmm14,%zmm14
	vpxorq    %zmm15,%zmm15,%zmm15
	vpxorq    %zmm16,%zmm16,%zmm16
	vpxorq    %zmm17,%zmm17,%zmm17
	vpxorq    %zmm18,%zmm18,%zmm18
	vpxorq    %zmm19,%zmm19,%zmm19

	vpmadd52luq  %zmm20,%zmm20,%zmm10
	vpmadd52huq  %zmm20,%zmm20,%zmm11

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm20,%zmm21,%zmm31
	vpmadd52huq  %zmm20,%zmm21,%zmm12
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm11,%zmm11
	vpaddq       %zmm12,%zmm12,%zmm12

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm20,%zmm22,%zmm31
	vpmadd52huq  %zmm20,%zmm22,%zmm13
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm12,%zmm12
	vpaddq       %zmm13,%zmm13,%zmm13
	vpmadd52luq  %zmm21,%zmm21,%zmm12
	vpmadd52huq  %zmm21,%zmm21,%zmm13

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm20,%zmm23,%zmm31
	vpmadd52huq  %zmm20,%zmm23,%zmm14
	vpmadd52luq  %zmm21,%zmm22,%zmm31
	vpmadd52huq  %zmm21,%zmm22,%zmm14
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm13,%zmm13
	vpaddq       %zmm14,%zmm14,%zmm14

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm20,%zmm24,%zmm31
	vpmadd52huq  %zmm20,%zmm24,%zmm15
	vpmadd52luq  %zmm21,%zmm23,%zmm31
	vpmadd52huq  %zmm21,%zmm23,%zmm15
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm14,%zmm14
	vpaddq       %zmm15,%zmm15,%zmm15
	vpmadd52luq  %zmm22,%zmm22,%zmm14
	vpmadd52huq  %zmm22,%zmm22,%zmm15

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm21,%zmm24,%zmm31
	vpmadd52huq  %zmm21,%zmm24,%zmm16
	vpmadd52luq  %zmm22,%zmm23,%zmm31
	vpmadd52huq  %zmm22,%zmm23,%zmm16
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm15,%zmm15
	vpaddq       %zmm16,%zmm16,%zmm16

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm22,%zmm24,%zmm31
	vpmadd52huq  %zmm22,%zmm24,%zmm17
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm16,%zmm16
	vpaddq       %zmm17,%zmm17,%zmm17
	vpmadd52luq  %zmm23,%zmm23,%zmm16
	vpmadd52huq  %zmm23,%zmm23,%zmm17

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm23,%zmm24,%zmm31
	vpmadd52huq  %zmm23,%zmm24,%zmm18
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm17,%zmm17
	vpaddq       %zmm18,%zmm18,%zmm18

	vpmadd52luq  %zmm24,%zmm24,%zmm18
	vpmadd52huq  %zmm24,%zmm24,%zmm19

	vpsrlq    $52,%zmm15,%zmm31
	vpaddq    %zmm31,%zmm16,%zmm16
	vpandq    vecmask52(%rip),%zmm15,%zmm15
	vpmadd52luq  vec608(%rip),%zmm15,%zmm10
	vpmadd52huq  vec608(%rip),%zmm15,%zmm11

	vpsrlq    $52,%zmm16,%zmm31
	vpaddq    %zmm31,%zmm17,%zmm17
	vpandq    vecmask52(%rip),%zmm16,%zmm16
	vpmadd52luq  vec608(%rip),%zmm16,%zmm11
	vpmadd52huq  vec608(%rip),%zmm16,%zmm12

	vpsrlq    $52,%zmm17,%zmm31
	vpaddq    %zmm31,%zmm18,%zmm18
	vpandq    vecmask52(%rip),%zmm17,%zmm17
	vpmadd52luq  vec608(%rip),%zmm17,%zmm12
	vpmadd52huq  vec608(%rip),%zmm17,%zmm13

	vpsrlq    $52,%zmm18,%zmm31
	vpaddq    %zmm31,%zmm19,%zmm19
	vpandq    vecmask52(%rip),%zmm18,%zmm18
	vpmadd52luq  vec608(%rip),%zmm18,%zmm13
	vpmadd52huq  vec608(%rip),%zmm18,%zmm14

	vpmadd52luq  vec608(%rip),%zmm19,%zmm14

	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm14
	vpandq    vecmask52(%rip),%zmm13,%zmm13

	vpsrlq    $47,%zmm14,%zmm31
	vpandq    vecmask47(%rip),%zmm14,%zmm14
	vpmadd52luq  vec19(%rip),%zmm31,%zmm10

	vpsrlq    $52,%zmm10,%zmm31
	vpaddq    %zmm31,%zmm11,%zmm11
	vpandq    vecmask52(%rip),%zmm10,%zmm20

	vpsrlq    $52,%zmm11,%zmm31
	vpaddq    %zmm31,%zmm12,%zmm12
	vpandq    vecmask52(%rip),%zmm11,%zmm21

	vpsrlq    $52,%zmm12,%zmm31
	vpaddq    %zmm31,%zmm13,%zmm13
	vpandq    vecmask52(%rip),%zmm12,%zmm22

	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm24
	vpandq    vecmask52(%rip),%zmm13,%zmm23

	vmovdqa64 %zmm20,384(%rsp)
	vmovdqa64 %zmm21,448(%rsp)
	vmovdqa64 %zmm22,512(%rsp)
	vmovdqa64 %zmm23,576(%rsp)
	vmovdqa64 %zmm24,640(%rsp)

	// X3 ← T3^2
	vpxorq    %zmm20,%zmm20,%zmm20
	vpxorq    %zmm21,%zmm21,%zmm21
	vpxorq    %zmm22,%zmm22,%zmm22
	vpxorq    %zmm23,%zmm23,%zmm23
	vpxorq    %zmm24,%zmm24,%zmm24
	vpxorq    %zmm15,%zmm15,%zmm15
	vpxorq    %zmm16,%zmm16,%zmm16
	vpxorq    %zmm17,%zmm17,%zmm17
	vpxorq    %zmm18,%zmm18,%zmm18
	vpxorq    %zmm19,%zmm19,%zmm19

	vpmadd52luq  %zmm25,%zmm25,%zmm20
	vpmadd52huq  %zmm25,%zmm25,%zmm21

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm25,%zmm26,%zmm31
	vpmadd52huq  %zmm25,%zmm26,%zmm22
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm21,%zmm21
	vpaddq       %zmm22,%zmm22,%zmm22

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm25,%zmm27,%zmm31
	vpmadd52huq  %zmm25,%zmm27,%zmm23
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm22,%zmm22
	vpaddq       %zmm23,%zmm23,%zmm23
	vpmadd52luq  %zmm26,%zmm26,%zmm22
	vpmadd52huq  %zmm26,%zmm26,%zmm23

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm25,%zmm28,%zmm31
	vpmadd52huq  %zmm25,%zmm28,%zmm24
	vpmadd52luq  %zmm26,%zmm27,%zmm31
	vpmadd52huq  %zmm26,%zmm27,%zmm24
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm23,%zmm23
	vpaddq       %zmm24,%zmm24,%zmm24

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm25,%zmm29,%zmm31
	vpmadd52huq  %zmm25,%zmm29,%zmm15
	vpmadd52luq  %zmm26,%zmm28,%zmm31
	vpmadd52huq  %zmm26,%zmm28,%zmm15
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm24,%zmm24
	vpaddq       %zmm15,%zmm15,%zmm15
	vpmadd52luq  %zmm27,%zmm27,%zmm24
	vpmadd52huq  %zmm27,%zmm27,%zmm15

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm26,%zmm29,%zmm31
	vpmadd52huq  %zmm26,%zmm29,%zmm16
	vpmadd52luq  %zmm27,%zmm28,%zmm31
	vpmadd52huq  %zmm27,%zmm28,%zmm16
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm15,%zmm15
	vpaddq       %zmm16,%zmm16,%zmm16

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm27,%zmm29,%zmm31
	vpmadd52huq  %zmm27,%zmm29,%zmm17
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm16,%zmm16
	vpaddq       %zmm17,%zmm17,%zmm17
	vpmadd52luq  %zmm28,%zmm28,%zmm16
	vpmadd52huq  %zmm28,%zmm28,%zmm17

	vpxorq       %zmm31,%zmm31,%zmm31
	vpmadd52luq  %zmm28,%zmm29,%zmm31
	vpmadd52huq  %zmm28,%zmm29,%zmm18
	vpaddq       %zmm31,%zmm31,%zmm31
	vpaddq       %zmm31,%zmm17,%zmm17
	vpaddq       %zmm18,%zmm18,%zmm18

	vpmadd52luq  %zmm29,%zmm29,%zmm18
	vpmadd52huq  %zmm29,%zmm29,%zmm19

	vpsrlq    $52,%zmm15,%zmm31
	vpaddq    %zmm31,%zmm16,%zmm16
	vpandq    vecmask52(%rip),%zmm15,%zmm15
	vpmadd52luq  vec608(%rip),%zmm15,%zmm20
	vpmadd52huq  vec608(%rip),%zmm15,%zmm21

	vpsrlq    $52,%zmm16,%zmm31
	vpaddq    %zmm31,%zmm17,%zmm17
	vpandq    vecmask52(%rip),%zmm16,%zmm16
	vpmadd52luq  vec608(%rip),%zmm16,%zmm21
	vpmadd52huq  vec608(%rip),%zmm16,%zmm22

	vpsrlq    $52,%zmm17,%zmm31
	vpaddq    %zmm31,%zmm18,%zmm18
	vpandq    vecmask52(%rip),%zmm17,%zmm17
	vpmadd52luq  vec608(%rip),%zmm17,%zmm22
	vpmadd52huq  vec608(%rip),%zmm17,%zmm23

	vpsrlq    $52,%zmm18,%zmm31
	vpaddq    %zmm31,%zmm19,%zmm19
	vpandq    vecmask52(%rip),%zmm18,%zmm18
	vpmadd52luq  vec608(%rip),%zmm18,%zmm23
	vpmadd52huq  vec608(%rip),%zmm18,%zmm24

	vpmadd52luq  vec608(%rip),%zmm19,%zmm24

	vmovdqa64 %zmm22,704(%rsp)
	vmovdqa64 %zmm23,768(%rsp)
	vmovdqa64 %zmm24,832(%rsp)

	// X2 ← T1 · T2
	vpxorq    %zmm10,%zmm10,%zmm10
	vpxorq    %zmm11,%zmm11,%zmm11
	vpxorq    %zmm12,%zmm12,%zmm12
	vpxorq    %zmm13,%zmm13,%zmm13
	vpxorq    %zmm14,%zmm14,%zmm14
	vpxorq    %zmm25,%zmm25,%zmm25
	vpxorq    %zmm26,%zmm26,%zmm26
	vpxorq    %zmm27,%zmm27,%zmm27
	vpxorq    %zmm28,%zmm28,%zmm28
	vpxorq    %zmm29,%zmm29,%zmm29

	vpmadd52luq  %zmm0,%zmm5,%zmm10
	vpmadd52huq  %zmm0,%zmm5,%zmm11

	vpmadd52luq  %zmm0,%zmm6,%zmm11
	vpmadd52huq  %zmm0,%zmm6,%zmm12
	vpmadd52luq  %zmm1,%zmm5,%zmm11
	vpmadd52huq  %zmm1,%zmm5,%zmm12

	vpmadd52luq  %zmm0,%zmm7,%zmm12
	vpmadd52huq  %zmm0,%zmm7,%zmm13
	vpmadd52luq  %zmm1,%zmm6,%zmm12
	vpmadd52huq  %zmm1,%zmm6,%zmm13
	vpmadd52luq  %zmm2,%zmm5,%zmm12
	vpmadd52huq  %zmm2,%zmm5,%zmm13

	vpmadd52luq  %zmm0,%zmm8,%zmm13
	vpmadd52huq  %zmm0,%zmm8,%zmm14
	vpmadd52luq  %zmm1,%zmm7,%zmm13
	vpmadd52huq  %zmm1,%zmm7,%zmm14
	vpmadd52luq  %zmm2,%zmm6,%zmm13
	vpmadd52huq  %zmm2,%zmm6,%zmm14
	vpmadd52luq  %zmm3,%zmm5,%zmm13
	vpmadd52huq  %zmm3,%zmm5,%zmm14

	vpmadd52luq  %zmm0,%zmm9,%zmm14
	vpmadd52huq  %zmm0,%zmm9,%zmm25
	vpmadd52luq  %zmm1,%zmm8,%zmm14
	vpmadd52huq  %zmm1,%zmm8,%zmm25
	vpmadd52luq  %zmm2,%zmm7,%zmm14
	vpmadd52huq  %zmm2,%zmm7,%zmm25
	vpmadd52luq  %zmm3,%zmm6,%zmm14
	vpmadd52huq  %zmm3,%zmm6,%zmm25
	vpmadd52luq  %zmm4,%zmm5,%zmm14
	vpmadd52huq  %zmm4,%zmm5,%zmm25

	vpmadd52luq  %zmm1,%zmm9,%zmm25
	vpmadd52huq  %zmm1,%zmm9,%zmm26
	vpmadd52luq  %zmm2,%zmm8,%zmm25
	vpmadd52huq  %zmm2,%zmm8,%zmm26
	vpmadd52luq  %zmm3,%zmm7,%zmm25
	vpmadd52huq  %zmm3,%zmm7,%zmm26
	vpmadd52luq  %zmm4,%zmm6,%zmm25
	vpmadd52huq  %zmm4,%zmm6,%zmm26

	vpmadd52luq  %zmm2,%zmm9,%zmm26
	vpmadd52huq  %zmm2,%zmm9,%zmm27
	vpmadd52luq  %zmm3,%zmm8,%zmm26
	vpmadd52huq  %zmm3,%zmm8,%zmm27
	vpmadd52luq  %zmm4,%zmm7,%zmm26
	vpmadd52huq  %zmm4,%zmm7,%zmm27

	vpmadd52luq  %zmm3,%zmm9,%zmm27
	vpmadd52huq  %zmm3,%zmm9,%zmm28
	vpmadd52luq  %zmm4,%zmm8,%zmm27
	vpmadd52huq  %zmm4,%zmm8,%zmm28

	vpmadd52luq  %zmm4,%zmm9,%zmm28
	vpmadd52huq  %zmm4,%zmm9,%zmm29

	vpsrlq    $52,%zmm25,%zmm31
	vpaddq    %zmm31,%zmm26,%zmm26
	vpandq    vecmask52(%rip),%zmm25,%zmm25
	vpmadd52luq  vec608(%rip),%zmm25,%zmm10
	vpmadd52huq  vec608(%rip),%zmm25,%zmm11

	vpsrlq    $52,%zmm26,%zmm31
	vpaddq    %zmm31,%zmm27,%zmm27
	vpandq    vecmask52(%rip),%zmm26,%zmm26
	vpmadd52luq  vec608(%rip),%zmm26,%zmm11
	vpmadd52huq  vec608(%rip),%zmm26,%zmm12

	vpsrlq    $52,%zmm27,%zmm31
	vpaddq    %zmm31,%zmm28,%zmm28
	vpandq    vecmask52(%rip),%zmm27,%zmm27
	vpmadd52luq  vec608(%rip),%zmm27,%zmm12
	vpmadd52huq  vec608(%rip),%zmm27,%zmm13

	vpsrlq    $52,%zmm28,%zmm31
	vpaddq    %zmm31,%zmm29,%zmm29
	vpandq    vecmask52(%rip),%zmm28,%zmm28
	vpmadd52luq  vec608(%rip),%zmm28,%zmm13
	vpmadd52huq  vec608(%rip),%zmm28,%zmm14

	vpmadd52luq  vec608(%rip),%zmm29,%zmm14

	// T3 ← T1 - T2
	vpaddq    vec2p0(%rip),%zmm0,%zmm0
	vpaddq    vec2p123(%rip),%zmm1,%zmm1
	vpaddq    vec2p123(%rip),%zmm2,%zmm2
	vpaddq    vec2p123(%rip),%zmm3,%zmm3
	vpaddq    vec2p4(%rip),%zmm4,%zmm4

	vpsubq	  %zmm5,%zmm0,%zmm0
	vpsubq	  %zmm6,%zmm1,%zmm1
	vpsubq	  %zmm7,%zmm2,%zmm2
	vpsubq	  %zmm8,%zmm3,%zmm3
	vpsubq	  %zmm9,%zmm4,%zmm4

	vpsrlq    $52,%zmm3,%zmm31
	vpaddq    %zmm31,%zmm4,%zmm4
	vpandq    vecmask52(%rip),%zmm3,%zmm3

	vpsrlq    $47,%zmm4,%zmm31
	vpandq    vecmask47(%rip),%zmm4,%zmm4
	vpmadd52luq  vec19(%rip),%zmm31,%zmm0

	vpsrlq    $52,%zmm0,%zmm31
	vpaddq    %zmm31,%zmm1,%zmm1
	vpandq    vecmask52(%rip),%zmm0,%zmm0

	vpsrlq    $52,%zmm1,%zmm31
	vpaddq    %zmm31,%zmm2,%zmm2
	vpandq    vecmask52(%rip),%zmm1,%zmm1

	vpsrlq    $52,%zmm2,%zmm31
	vpaddq    %zmm31,%zmm3,%zmm3
	vpandq    vecmask52(%rip),%zmm2,%zmm2

	vpsrlq    $52,%zmm3,%zmm31
	vpaddq    %zmm31,%zmm4,%zmm4
	vpandq    vecmask52(%rip),%zmm3,%zmm3

	// T4 ← ((A2)/4) · T3
	// T4 ← T4 + T2
	vpxorq    %zmm15,%zmm15,%zmm15
	vpmadd52luq  veca24(%rip),%zmm0,%zmm5
	vpmadd52huq  veca24(%rip),%zmm0,%zmm6
	vpmadd52luq  veca24(%rip),%zmm1,%zmm6
	vpmadd52huq  veca24(%rip),%zmm1,%zmm7
	vpmadd52luq  veca24(%rip),%zmm2,%zmm7
	vpmadd52huq  veca24(%rip),%zmm2,%zmm8
	vpmadd52luq  veca24(%rip),%zmm3,%zmm8
	vpmadd52huq  veca24(%rip),%zmm3,%zmm9
	vpmadd52luq  veca24(%rip),%zmm4,%zmm9
	vpmadd52huq  veca24(%rip),%zmm4,%zmm15

	vpmadd52luq  vec608(%rip),%zmm15,%zmm5

	vpsrlq    $52,%zmm8,%zmm31
	vpaddq    %zmm31,%zmm9,%zmm9
	vpandq    vecmask52(%rip),%zmm8,%zmm8

	vpsrlq    $47,%zmm9,%zmm31
	vpandq    vecmask47(%rip),%zmm9,%zmm9
	vpmadd52luq  vec19(%rip),%zmm31,%zmm5

	vpsrlq    $52,%zmm5,%zmm31
	vpaddq    %zmm31,%zmm6,%zmm6
	vpandq    vecmask52(%rip),%zmm5,%zmm5

	vpsrlq    $52,%zmm6,%zmm31
	vpaddq    %zmm31,%zmm7,%zmm7
	vpandq    vecmask52(%rip),%zmm6,%zmm6

	vpsrlq    $52,%zmm7,%zmm31
	vpaddq    %zmm31,%zmm8,%zmm8
	vpandq    vecmask52(%rip),%zmm7,%zmm7

	vpsrlq    $52,%zmm8,%zmm31
	vpaddq    %zmm31,%zmm9,%zmm9
	vpandq    vecmask52(%rip),%zmm8,%zmm8

	// Z2 ← T3 · T4
	vpxorq    %zmm15,%zmm15,%zmm15
	vpxorq    %zmm16,%zmm16,%zmm16
	vpxorq    %zmm17,%zmm17,%zmm17
	vpxorq    %zmm18,%zmm18,%zmm18
	vpxorq    %zmm19,%zmm19,%zmm19
	vpxorq    %zmm25,%zmm25,%zmm25
	vpxorq    %zmm26,%zmm26,%zmm26
	vpxorq    %zmm27,%zmm27,%zmm27
	vpxorq    %zmm28,%zmm28,%zmm28
	vpxorq    %zmm29,%zmm29,%zmm29

	vpmadd52luq  %zmm0,%zmm5,%zmm15
	vpmadd52huq  %zmm0,%zmm5,%zmm16

	vpmadd52luq  %zmm0,%zmm6,%zmm16
	vpmadd52huq  %zmm0,%zmm6,%zmm17
	vpmadd52luq  %zmm1,%zmm5,%zmm16
	vpmadd52huq  %zmm1,%zmm5,%zmm17

	vpmadd52luq  %zmm0,%zmm7,%zmm17
	vpmadd52huq  %zmm0,%zmm7,%zmm18
	vpmadd52luq  %zmm1,%zmm6,%zmm17
	vpmadd52huq  %zmm1,%zmm6,%zmm18
	vpmadd52luq  %zmm2,%zmm5,%zmm17
	vpmadd52huq  %zmm2,%zmm5,%zmm18

	vpmadd52luq  %zmm0,%zmm8,%zmm18
	vpmadd52huq  %zmm0,%zmm8,%zmm19
	vpmadd52luq  %zmm1,%zmm7,%zmm18
	vpmadd52huq  %zmm1,%zmm7,%zmm19
	vpmadd52luq  %zmm2,%zmm6,%zmm18
	vpmadd52huq  %zmm2,%zmm6,%zmm19
	vpmadd52luq  %zmm3,%zmm5,%zmm18
	vpmadd52huq  %zmm3,%zmm5,%zmm19

	vpmadd52luq  %zmm0,%zmm9,%zmm19
	vpmadd52huq  %zmm0,%zmm9,%zmm25
	vpmadd52luq  %zmm1,%zmm8,%zmm19
	vpmadd52huq  %zmm1,%zmm8,%zmm25
	vpmadd52luq  %zmm2,%zmm7,%zmm19
	vpmadd52huq  %zmm2,%zmm7,%zmm25
	vpmadd52luq  %zmm3,%zmm6,%zmm19
	vpmadd52huq  %zmm3,%zmm6,%zmm25
	vpmadd52luq  %zmm4,%zmm5,%zmm19
	vpmadd52huq  %zmm4,%zmm5,%zmm25

	vpmadd52luq  %zmm1,%zmm9,%zmm25
	vpmadd52huq  %zmm1,%zmm9,%zmm26
	vpmadd52luq  %zmm2,%zmm8,%zmm25
	vpmadd52huq  %zmm2,%zmm8,%zmm26
	vpmadd52luq  %zmm3,%zmm7,%zmm25
	vpmadd52huq  %zmm3,%zmm7,%zmm26
	vpmadd52luq  %zmm4,%zmm6,%zmm25
	vpmadd52huq  %zmm4,%zmm6,%zmm26

	vpmadd52luq  %zmm2,%zmm9,%zmm26
	vpmadd52huq  %zmm2,%zmm9,%zmm27
	vpmadd52luq  %zmm3,%zmm8,%zmm26
	vpmadd52huq  %zmm3,%zmm8,%zmm27
	vpmadd52luq  %zmm4,%zmm7,%zmm26
	vpmadd52huq  %zmm4,%zmm7,%zmm27

	vpmadd52luq  %zmm3,%zmm9,%zmm27
	vpmadd52huq  %zmm3,%zmm9,%zmm28
	vpmadd52luq  %zmm4,%zmm8,%zmm27
	vpmadd52huq  %zmm4,%zmm8,%zmm28

	vpmadd52luq  %zmm4,%zmm9,%zmm28
	vpmadd52huq  %zmm4,%zmm9,%zmm29

	vpsrlq    $52,%zmm25,%zmm31
	vpaddq    %zmm31,%zmm26,%zmm26
	vpandq    vecmask52(%rip),%zmm25,%zmm25
	vpmadd52luq  vec608(%rip),%zmm25,%zmm15
	vpmadd52huq  vec608(%rip),%zmm25,%zmm16

	vpsrlq    $52,%zmm26,%zmm31
	vpaddq    %zmm31,%zmm27,%zmm27
	vpandq    vecmask52(%rip),%zmm26,%zmm26
	vpmadd52luq  vec608(%rip),%zmm26,%zmm16
	vpmadd52huq  vec608(%rip),%zmm26,%zmm17

	vpsrlq    $52,%zmm27,%zmm31
	vpaddq    %zmm31,%zmm28,%zmm28
	vpandq    vecmask52(%rip),%zmm27,%zmm27
	vpmadd52luq  vec608(%rip),%zmm27,%zmm17
	vpmadd52huq  vec608(%rip),%zmm27,%zmm18

	vpsrlq    $52,%zmm28,%zmm31
	vpaddq    %zmm31,%zmm29,%zmm29
	vpandq    vecmask52(%rip),%zmm28,%zmm28
	vpmadd52luq  vec608(%rip),%zmm28,%zmm18
	vpmadd52huq  vec608(%rip),%zmm28,%zmm19

	vpmadd52luq  vec608(%rip),%zmm29,%zmm19

	// Z3 ← Z3 · X1
	vmovdqa64 64(%rsp),%zmm0
	vmovdqa64 128(%rsp),%zmm1
	vmovdqa64 192(%rsp),%zmm2
	vmovdqa64 256(%rsp),%zmm3
	vmovdqa64 320(%rsp),%zmm4

	vmovdqa64 384(%rsp),%zmm5
	vmovdqa64 448(%rsp),%zmm6
	vmovdqa64 512(%rsp),%zmm7
	vmovdqa64 576(%rsp),%zmm8
	vmovdqa64 640(%rsp),%zmm9

	vpxorq    %zmm25,%zmm25,%zmm25
	vpxorq    %zmm26,%zmm26,%zmm26
	vpxorq    %zmm27,%zmm27,%zmm27
	vpxorq    %zmm28,%zmm28,%zmm28
	vpxorq    %zmm29,%zmm29,%zmm29
	vpxorq    %zmm30,%zmm30,%zmm30
	vpxorq    %zmm31,%zmm31,%zmm31
	vpxorq    %zmm22,%zmm22,%zmm22
	vpxorq    %zmm23,%zmm23,%zmm23
	vpxorq    %zmm24,%zmm24,%zmm24

	vpmadd52luq  %zmm0,%zmm5,%zmm25
	vpmadd52huq  %zmm0,%zmm5,%zmm26

	vpmadd52luq  %zmm0,%zmm6,%zmm26
	vpmadd52huq  %zmm0,%zmm6,%zmm27
	vpmadd52luq  %zmm1,%zmm5,%zmm26
	vpmadd52huq  %zmm1,%zmm5,%zmm27

	vpmadd52luq  %zmm0,%zmm7,%zmm27
	vpmadd52huq  %zmm0,%zmm7,%zmm28
	vpmadd52luq  %zmm1,%zmm6,%zmm27
	vpmadd52huq  %zmm1,%zmm6,%zmm28
	vpmadd52luq  %zmm2,%zmm5,%zmm27
	vpmadd52huq  %zmm2,%zmm5,%zmm28

	vpmadd52luq  %zmm0,%zmm8,%zmm28
	vpmadd52huq  %zmm0,%zmm8,%zmm29
	vpmadd52luq  %zmm1,%zmm7,%zmm28
	vpmadd52huq  %zmm1,%zmm7,%zmm29
	vpmadd52luq  %zmm2,%zmm6,%zmm28
	vpmadd52huq  %zmm2,%zmm6,%zmm29
	vpmadd52luq  %zmm3,%zmm5,%zmm28
	vpmadd52huq  %zmm3,%zmm5,%zmm29

	vpmadd52luq  %zmm0,%zmm9,%zmm29
	vpmadd52huq  %zmm0,%zmm9,%zmm30
	vpmadd52luq  %zmm1,%zmm8,%zmm29
	vpmadd52huq  %zmm1,%zmm8,%zmm30
	vpmadd52luq  %zmm2,%zmm7,%zmm29
	vpmadd52huq  %zmm2,%zmm7,%zmm30
	vpmadd52luq  %zmm3,%zmm6,%zmm29
	vpmadd52huq  %zmm3,%zmm6,%zmm30
	vpmadd52luq  %zmm4,%zmm5,%zmm29
	vpmadd52huq  %zmm4,%zmm5,%zmm30

	vpmadd52luq  %zmm1,%zmm9,%zmm30
	vpmadd52huq  %zmm1,%zmm9,%zmm31
	vpmadd52luq  %zmm2,%zmm8,%zmm30
	vpmadd52huq  %zmm2,%zmm8,%zmm31
	vpmadd52luq  %zmm3,%zmm7,%zmm30
	vpmadd52huq  %zmm3,%zmm7,%zmm31
	vpmadd52luq  %zmm4,%zmm6,%zmm30
	vpmadd52huq  %zmm4,%zmm6,%zmm31

	vpmadd52luq  %zmm2,%zmm9,%zmm31
	vpmadd52huq  %zmm2,%zmm9,%zmm22
	vpmadd52luq  %zmm3,%zmm8,%zmm31
	vpmadd52huq  %zmm3,%zmm8,%zmm22
	vpmadd52luq  %zmm4,%zmm7,%zmm31
	vpmadd52huq  %zmm4,%zmm7,%zmm22

	vpmadd52luq  %zmm3,%zmm9,%zmm22
	vpmadd52huq  %zmm3,%zmm9,%zmm23
	vpmadd52luq  %zmm4,%zmm8,%zmm22
	vpmadd52huq  %zmm4,%zmm8,%zmm23

	vpmadd52luq  %zmm4,%zmm9,%zmm23
	vpmadd52huq  %zmm4,%zmm9,%zmm24

	vpsrlq    $52,%zmm30,%zmm0
	vpaddq    %zmm0,%zmm31,%zmm31
	vpandq    vecmask52(%rip),%zmm30,%zmm30
	vpmadd52luq  vec608(%rip),%zmm30,%zmm25
	vpmadd52huq  vec608(%rip),%zmm30,%zmm26

	vpsrlq    $52,%zmm31,%zmm0
	vpaddq    %zmm0,%zmm22,%zmm22
	vpandq    vecmask52(%rip),%zmm31,%zmm31
	vpmadd52luq  vec608(%rip),%zmm31,%zmm26
	vpmadd52huq  vec608(%rip),%zmm31,%zmm27

	vpsrlq    $52,%zmm22,%zmm0
	vpaddq    %zmm0,%zmm23,%zmm23
	vpandq    vecmask52(%rip),%zmm22,%zmm22
	vpmadd52luq  vec608(%rip),%zmm22,%zmm27
	vpmadd52huq  vec608(%rip),%zmm22,%zmm28

	vpsrlq    $52,%zmm23,%zmm0
	vpaddq    %zmm0,%zmm24,%zmm24
	vpandq    vecmask52(%rip),%zmm23,%zmm23
	vpmadd52luq  vec608(%rip),%zmm23,%zmm28
	vpmadd52huq  vec608(%rip),%zmm23,%zmm29

	vpmadd52luq  vec608(%rip),%zmm24,%zmm29

	vmovdqa64 704(%rsp),%zmm22
	vmovdqa64 768(%rsp),%zmm23
	vmovdqa64 832(%rsp),%zmm24

	vmovdqa64 0(%rsp),%zmm30

	subb      $1,%cl
	cmpb      $0,%cl
	jge       .L2

	vmovdqa64 sixtythree(%rip),%zmm0
	vmovdqa64 %zmm0,896(%rsp)
	movb      $63,%cl
	subq      $64,%r9
	cmpq      $0,%r9
	jge       .L1

	// store X2
	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm14
	vpandq    vecmask52(%rip),%zmm13,%zmm13

	vpsrlq    $47,%zmm14,%zmm31
	vpandq    vecmask47(%rip),%zmm14,%zmm14
	vpmadd52luq  vec19(%rip),%zmm31,%zmm10

	vpsrlq    $52,%zmm10,%zmm31
	vpaddq    %zmm31,%zmm11,%zmm11
	vpandq    vecmask52(%rip),%zmm10,%zmm10

	vpsrlq    $52,%zmm11,%zmm31
	vpaddq    %zmm31,%zmm12,%zmm12
	vpandq    vecmask52(%rip),%zmm11,%zmm11

	vpsrlq    $52,%zmm12,%zmm31
	vpaddq    %zmm31,%zmm13,%zmm13
	vpandq    vecmask52(%rip),%zmm12,%zmm12

	vpsrlq    $52,%zmm13,%zmm31
	vpaddq    %zmm31,%zmm14,%zmm14
	vpandq    vecmask52(%rip),%zmm13,%zmm13

	vmovdqa64  %zmm10,0(%rdi)
	vmovdqa64  %zmm11,64(%rdi)
	vmovdqa64  %zmm12,128(%rdi)
	vmovdqa64  %zmm13,192(%rdi)
	vmovdqa64  %zmm14,256(%rdi)

	// store Z2
	vpsrlq    $52,%zmm18,%zmm31
	vpaddq    %zmm31,%zmm19,%zmm19
	vpandq    vecmask52(%rip),%zmm18,%zmm18

	vpsrlq    $47,%zmm19,%zmm31
	vpandq    vecmask47(%rip),%zmm19,%zmm19
	vpmadd52luq  vec19(%rip),%zmm31,%zmm15

	vpsrlq    $52,%zmm15,%zmm31
	vpaddq    %zmm31,%zmm16,%zmm16
	vpandq    vecmask52(%rip),%zmm15,%zmm15

	vpsrlq    $52,%zmm16,%zmm31
	vpaddq    %zmm31,%zmm17,%zmm17
	vpandq    vecmask52(%rip),%zmm16,%zmm16

	vpsrlq    $52,%zmm17,%zmm31
	vpaddq    %zmm31,%zmm18,%zmm18
	vpandq    vecmask52(%rip),%zmm17,%zmm17

	vpsrlq    $52,%zmm18,%zmm31
	vpaddq    %zmm31,%zmm19,%zmm19
	vpandq    vecmask52(%rip),%zmm18,%zmm18

	vmovdqa64  %zmm15,320(%rdi)
	vmovdqa64  %zmm16,384(%rdi)
	vmovdqa64  %zmm17,448(%rdi)
	vmovdqa64  %zmm18,512(%rdi)
	vmovdqa64  %zmm19,576(%rdi)

	movq 	  %r8,%rsp

	ret
.section	.note.GNU-stack,"",@progbits
