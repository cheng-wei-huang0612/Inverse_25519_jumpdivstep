	.arch armv8.4-a+fp16+sb+ssbs
	.build_version macos,  15, 0
; GNU C17 (Homebrew GCC 14.2.0_1) version 14.2.0 (aarch64-apple-darwin24)
;	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -fPIC -mmacosx-version-min=15.0.0 -mlittle-endian -mabi=lp64 -mcpu=apple-m1 -O3 -fopt-info-all
	.text
	.align	2
	.p2align 5,,15
	.globl _update_VS_mont
_update_VS_mont:
LFB3917:
	stp	d8, d9, [sp, -288]!	;,,,
LCFI0:
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	mvni	v6.2s, 0xc0, lsl 24	; tmp1199
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	adrp	x3, lC0@PAGE	; tmp1931,
; update_VS_mont_neon.c:11: ){
	stp	d10, d11, [sp, 16]	;,,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	adrp	x10, lC2@PAGE	; tmp1951,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	add	x9, x1, 8	; tmp1914, tmp1912,
; update_VS_mont_neon.c:11: ){
	stp	d12, d13, [sp, 32]	;,,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	add	x8, x1, 12	; tmp1916, tmp1912,
	add	x7, x1, 16	; tmp1918, tmp1912,
; update_VS_mont_neon.c:11: ){
	stp	d14, d15, [sp, 48]	;,,
LCFI1:
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	add	x6, x1, 20	; tmp1920, tmp1912,
	add	x5, x1, 24	; tmp1922, tmp1912,
; update_VS_mont_neon.c:51:     uint32x2_t vec_u0_r0 = {(*u) & ((1ULL << 30)-1), (*r) & ((1ULL << 30)-1)};
	ldp	q14, q31, [x2]	; MEM <vector(2) long long int> [(int64_t *)uuvvrrss_232(D)], MEM <vector(2) long long int> [(int64_t *)uuvvrrss_232(D) + 16B],* uuvvrrss
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	add	x4, x1, 28	; tmp1924, tmp1912,
	add	x2, x1, 32	; tmp1926, tmp1912,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	ld1r	{v28.2s}, [x0]	; tmp1147, V_425(D)->limb[0]
	ld1r	{v11.2s}, [x1]	; tmp1488, S_427(D)->limb[0]
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	ldr	q25, [x3, #lC0@PAGEOFF]	; tmp1164,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:961:   return __a * __b;
	adrp	x3, lC1@PAGE	; tmp1932,
; update_VS_mont_neon.c:299:         vec_S[i] =  vdup_n_u32(S->limb[i]);
	ldp	s17, s9, [x1, 4]	; _2395, _2403,
; update_VS_mont_neon.c:51:     uint32x2_t vec_u0_r0 = {(*u) & ((1ULL << 30)-1), (*r) & ((1ULL << 30)-1)};
	zip1	v26.2d, v14.2d, v31.2d	; vect__2.75, MEM <vector(2) long long int> [(int64_t *)uuvvrrss_232(D)], MEM <vector(2) long long int> [(int64_t *)uuvvrrss_232(D) + 16B]
	zip2	v14.2d, v14.2d, v31.2d	; vect__2.87, MEM <vector(2) long long int> [(int64_t *)uuvvrrss_232(D)], MEM <vector(2) long long int> [(int64_t *)uuvvrrss_232(D) + 16B]
; update_VS_mont_neon.c:24:         vec_V[i] =  vdup_n_u32(V->limb[i]);
	ldp	s21, s31, [x0, 4]	; _3673, _3681,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:961:   return __a * __b;
	ldr	d16, [x3, #lC1@PAGEOFF]	; tmp1193,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	mov	x3, x1	; tmp1912, S
; update_VS_mont_neon.c:51:     uint32x2_t vec_u0_r0 = {(*u) & ((1ULL << 30)-1), (*r) & ((1ULL << 30)-1)};
	xtn	v24.2s, v26.2d	; vect__3.76_3707, vect__2.75
; update_VS_mont_neon.c:52:     uint32x2_t vec_u1_r1 = {((*u) >> 30) & ((1ULL << 30)-1), ((*r) >> 30) & ((1ULL << 30)-1)};
	shrn	v27.2s, v26.2d, 30	; vect__9.79_579, vect__2.75,
; update_VS_mont_neon.c:325:     uint32x2_t vec_v1_s1 = {((*v) >> 30) & ((1ULL << 30)-1), ((*s) >> 30) & ((1ULL << 30)-1)};
	shrn	v30.2s, v14.2d, 30	; vect__77.91_3494, vect__2.87,
; update_VS_mont_neon.c:53:     uint32x2_t vec_uhat_rhat = {(*u) >> 63, (*r) >> 63};
	cmlt	v26.2d, v26.2d, #0	; vect__14.81_3560, vect__2.75
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d8, [x10, #lC2@PAGEOFF]	; tmp1950,
; update_VS_mont_neon.c:324:     uint32x2_t vec_v0_s0 = {(*v) & ((1ULL << 30)-1), (*s) & ((1ULL << 30)-1)};
	xtn	v29.2s, v14.2d	; vect__71.88_575, vect__2.87
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v17.2s, v17.s[0]	; tmp1489, _2395
	dup	v21.2s, v21.s[0]	; tmp1148, _3673
	dup	v31.2s, v31.s[0]	; tmp1149, _3681
; update_VS_mont_neon.c:299:         vec_S[i] =  vdup_n_u32(S->limb[i]);
	ldp	s7, s0, [x1, 12]	; _2411, _2419,
; update_VS_mont_neon.c:51:     uint32x2_t vec_u0_r0 = {(*u) & ((1ULL << 30)-1), (*r) & ((1ULL << 30)-1)};
	and	v24.8b, v24.8b, v6.8b	; vect__3.76_3707, vect__3.76_3707,
; update_VS_mont_neon.c:52:     uint32x2_t vec_u1_r1 = {((*u) >> 30) & ((1ULL << 30)-1), ((*r) >> 30) & ((1ULL << 30)-1)};
	and	v19.8b, v27.8b, v6.8b	; vect__9.79_579, vect__9.79_579,
; update_VS_mont_neon.c:325:     uint32x2_t vec_v1_s1 = {((*v) >> 30) & ((1ULL << 30)-1), ((*s) >> 30) & ((1ULL << 30)-1)};
	and	v30.8b, v30.8b, v6.8b	; vect__77.91_3494, vect__77.91_3494,
; update_VS_mont_neon.c:326:     uint32x2_t vec_vhat_shat = {(*v) >> 63, (*s) >> 63};
	cmlt	v14.2d, v14.2d, #0	; vect__82.93_3520, vect__2.87
; update_VS_mont_neon.c:53:     uint32x2_t vec_uhat_rhat = {(*u) >> 63, (*r) >> 63};
	xtn	v26.2s, v26.2d	; vect__15.82, vect__14.81_3560
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v9.2s, v9.s[0]	; tmp1490, _2403
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umull	v23.2d, v28.2s, v19.2s	; _3253, tmp1147, vect__10.80
; update_VS_mont_neon.c:51:     uint32x2_t vec_u0_r0 = {(*u) & ((1ULL << 30)-1), (*r) & ((1ULL << 30)-1)};
	mov	v1.8b, v24.8b	; vect__4.77, vect__3.76_3707
; update_VS_mont_neon.c:324:     uint32x2_t vec_v0_s0 = {(*v) & ((1ULL << 30)-1), (*s) & ((1ULL << 30)-1)};
	and	v24.8b, v29.8b, v6.8b	; vect__71.88_575, vect__71.88_575,
; update_VS_mont_neon.c:325:     uint32x2_t vec_v1_s1 = {((*v) >> 30) & ((1ULL << 30)-1), ((*s) >> 30) & ((1ULL << 30)-1)};
	str	d30, [sp, 96]	; vect__77.91_3494, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v7.2s, v7.s[0]	; tmp1491, _2411
; update_VS_mont_neon.c:24:         vec_V[i] =  vdup_n_u32(V->limb[i]);
	ldp	s29, s15, [x0, 12]	; _3689, _3697,
; update_VS_mont_neon.c:326:     uint32x2_t vec_vhat_shat = {(*v) >> 63, (*s) >> 63};
	xtn	v14.2s, v14.2d	; vect__83.94, vect__82.93_3520
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umull	v30.2d, v28.2s, v1.2s	; _3555, tmp1147, vect__4.77
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v28.8b, v26.8b, v28.8b	; _352, vect__15.82, tmp1147
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umull	v27.2d, v11.2s, v24.2s	; _2277, tmp1488, vect__72.89
	str	d24, [sp, 80]	; vect__72.89, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v12.16b, v23.16b, v25.16b	; _3255, _3253, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v23.2d, v23.2d, 30	; _3259, _3253,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d28, [sp, 200]	; _352, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v29.2s, v29.s[0]	; tmp1150, _3689
	dup	v15.2s, v15.s[0]	; tmp1151, _3697
; update_VS_mont_neon.c:24:         vec_V[i] =  vdup_n_u32(V->limb[i]);
	ldp	s28, s5, [x0, 20]	; _3705, _3713,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v13.16b, v30.16b, v25.16b	; _3557, _3555, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v30.2d, v30.2d, 30	; _3561, _3555,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v18.16b, v27.16b, v25.16b	; _2279, _2277, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v27.2d, v27.2d, 30	; _2283, _2277,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v23.2d, v21.2s, v19.2s	; _3267, tmp1148, vect__10.80
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v12.2s, v12.2d	; _3256, _3255
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v30.2d, v21.2s, v1.2s	; _3569, tmp1148, vect__4.77
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v13.2s, v13.2d	; _3558, _3557
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v22.2s, v28.s[0]	; tmp1152, _3705
; update_VS_mont_neon.c:24:         vec_V[i] =  vdup_n_u32(V->limb[i]);
	ldp	s28, s20, [x0, 28]	; _3721, _1,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v18.2s, v18.2d	; _2280, _2279
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v27.2d, v17.2s, v24.2s	; _2291, tmp1489, vect__72.89
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v10.2s, v5.s[0]	; tmp1153, _3713
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v21.8b, v26.8b, v21.8b	; _2718, vect__15.82, tmp1148
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:961:   return __a * __b;
	mul	v24.2s, v13.2s, v16.2s	; _433, _3558, tmp1193
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v3.16b, v30.16b, v25.16b	; _3571, _3569, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v30.2d, v30.2d, 30	; _3575, _3569,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	stp	d19, d10, [sp, 104]	; vect__10.80, tmp1153,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v28.2s, v28.s[0]	; tmp1154, _3721
	dup	v20.2s, v20.s[0]	; tmp1155, _1
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d21, [sp, 208]	; _2718, %sfp
	and	v2.8b, v24.8b, v6.8b	; _433, _433,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v24.2d, v23.2d, 30	; _3273, _3267,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	stp	d22, d28, [sp, 128]	; tmp1152, tmp1154,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:961:   return __a * __b;
	mul	v28.2s, v18.2s, v16.2s	; _503, _2280, tmp1193
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	mov	v22.8b, v19.8b	; vect__10.80, vect__10.80
	umlal	v30.2d, v31.2s, v1.2s	; _3583, tmp1149, vect__4.77
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	str	d20, [sp, 144]	; tmp1155, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v3.2s, v3.2d	; _3572, _3571
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v23.16b, v23.16b, v25.16b	; _3269, _3267, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v24.2d, v31.2s, v19.2s	; _3281, tmp1149, vect__10.80
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v31.8b, v26.8b, v31.8b	; _2729, vect__15.82, tmp1149
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umull	v20.2d, v8.2s, v2.2s	; _408, tmp1950, _434
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v5.8b, v28.8b, v6.8b	; _503, _503,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v23.2s, v23.2d	; _3270, _3269
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v19.2d, v30.2d, 30	; _3589, _3583,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v30.16b, v30.16b, v25.16b	; _3585, _3583, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v10.2d, v24.2d, 30	; _3287, _3281,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v24.16b, v24.16b, v25.16b	; _3283, _3281, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umull	v21.2d, v8.2s, v5.2s	; _506, tmp1952, _504
	umlal	v19.2d, v29.2s, v1.2s	; _3597, tmp1150, vect__4.77
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v30.2s, v30.2d	; _3586, _3585
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v10.2d, v29.2s, v22.2s	; _3295, tmp1150, vect__10.80
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v29.8b, v26.8b, v29.8b	; _2740, vect__15.82, tmp1150
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v24.2s, v24.2d	; _3284, _3283
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v28.2d, v21.2d, 30	; _327, _506,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v21.16b, v21.16b, v25.16b	; _323, _506, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	stp	d31, d29, [sp, 216]	; _2729, _2740,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v31.2d, v20.2d, 30	; _413, _408,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v20.16b, v20.16b, v25.16b	; _409, _408, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v4.2d, v10.2d, 30	; _3301, _3295,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v10.16b, v10.16b, v25.16b	; _3297, _3295, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v28.2d, v6.2s, v5.2s	; _2198, tmp1199, _504
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v21.2s, v21.2d	; _324, _323
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v31.2d, v6.2s, v2.2s	; _3476, tmp1199, _434
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v20.2s, v20.2d	; _410, _409
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v4.2d, v15.2s, v22.2s	; _3301, tmp1151, vect__10.80
	ldr	d22, [sp, 128]	; tmp1152, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v21.2s, v21.2s, v18.2s	; _325, _324, _2280
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v18.16b, v27.16b, v25.16b	; _2293, _2291, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v20.2s, v20.2s, v13.2s	; _412, _410, _3558
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v13.2d, v19.2d, 30	; _3603, _3597,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v8.16b, v28.16b, v25.16b	; _2200, _2198, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v27.2d, v27.2d, 30	; _2297, _2291,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v29.16b, v31.16b, v25.16b	; _3478, _3476, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v31.2d, v31.2d, 30	; _3482, _3476,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v18.2s, v18.2d	; _2294, _2293
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v28.2d, v28.2d, 30	; _2204, _2198,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v13.2d, v15.2s, v1.2s	; _3611, tmp1151, vect__4.77
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v19.16b, v19.16b, v25.16b	; _3599, _3597, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v8.2s, v8.2d	; _2201, _2200
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v31.2d, v6.2s, v2.2s	; _3489, tmp1199, _434
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v29.2s, v29.2d	; _3479, _3478
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v28.2d, v6.2s, v5.2s	; _2211, tmp1199, _504
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v19.2s, v19.2d	; _3600, _3599
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v18.2s, v8.2s, v18.2s	; _2202, _2201, _2294
	add	v29.2s, v29.2s, v3.2s	; _3480, _3479, _3572
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v3.2s, v10.2d	; _3298, _3297
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d10, [sp, 80]	; vect__72.89, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v18.2s, v21.2s, 30	; _2092, _325,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v21.8b, v11.8b, v14.8b	; _266, tmp1488, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v29.2s, v20.2s, 30	; _3370, _412,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	str	d3, [sp, 192]	; _3298, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v20.16b, v31.16b, v25.16b	; _3491, _3489, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d3, [sp, 96]	; vect__78.92, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v31.2d, v31.2d, 30	; _3495, _3489,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v27.2d, v9.2s, v10.2s	; _2305, tmp1490, vect__72.89
	mov	v10.16b, v4.16b	; _3309, _3301
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d21, [sp, 248]	; _266, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v21.2d, v13.2d, 30	; _3617, _3611,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v4.8b, v26.8b, v15.8b	; _2751, vect__15.82, tmp1151
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v20.2s, v20.2d	; _3492, _3491
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v13.16b, v13.16b, v25.16b	; _3613, _3611, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v31.2d, v6.2s, v2.2s	; _3502, tmp1199, _434
	umull	v15.2d, v11.2s, v3.2s	; _1975, tmp1488, vect__78.92
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v11.8b, v29.8b, v6.8b	; _3380, _3380,
	str	d4, [sp, 232]	; _2751, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v21.2d, v22.2s, v1.2s	; _3617, tmp1152, vect__4.77
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v20.2s, v20.2s, v30.2s	; _3493, _3492, _3586
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v4.8b, v18.8b, v6.8b	; _2102, _2102,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v13.2s, v13.2d	; _3614, _3613
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v12.2s, v11.2s, v12.2s	; _3257, _3380, _3256
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v11.2d, v28.2d, 30	; _2217, _2211,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v20.2s, v29.2s, 30	; _3384, _3370,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v30.16b, v15.16b, v25.16b	; _1977, _1975, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v15.2d, v15.2d, 30	; _1981, _1975,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	mov	v22.16b, v21.16b	; _3625, _3617
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v8.2d, v31.2d, 30	; _3508, _3502,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v11.2d, v6.2s, v5.2s	; _2224, tmp1199, _504
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v21.8b, v12.8b, v6.8b	; _3142, _3142,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v15.2d, v17.2s, v3.2s	; _1989, tmp1489, vect__78.92
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v17.8b, v17.8b, v14.8b	; _1440, tmp1489, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v30.2s, v30.2d	; _1978, _1977
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v3.2d, v27.2d, 30	; _2311, _2305,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:961:   return __a * __b;
	mul	v29.2s, v21.2s, v16.2s	; _461, _3142, tmp1193
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v27.16b, v27.16b, v25.16b	; _2307, _2305, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v8.2d, v6.2s, v2.2s	; _3515, tmp1199, _434
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d17, [sp, 256]	; _1440, %sfp
	and	v17.8b, v20.8b, v6.8b	; _3394, _3394,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v4.2s, v4.2s, v30.2s	; _1979, _2102, _1978
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v30.16b, v28.16b, v25.16b	; _2213, _2211, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d28, [sp, 80]	; vect__72.89, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v27.2s, v27.2d	; _2308, _2307
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v29.8b, v29.8b, v6.8b	; _461, _461,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v17.2s, v12.2s, 30	; _2720, _3257,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v30.2s, v30.2d	; _2214, _2213
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v12.8b, v4.8b, v6.8b	; _1864, _1864,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v3.2d, v7.2s, v28.2s	; _2319, tmp1491, vect__72.89
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v28.16b, v11.16b, v25.16b	; _2226, _2224, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d29, [sp, 72]	; _461, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v29.16b, v31.16b, v25.16b	; _3504, _3502, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:961:   return __a * __b;
	mul	v16.2s, v12.2s, v16.2s	; _293, _1864, tmp1193
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v30.2s, v30.2s, v27.2s	; _2215, _2214, _2308
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v27.2d, v11.2d, 30	; _2230, _2224,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v17.2s, v17.2s, v23.2s	; _3146, _2720, _3270
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v23.2s, v0.s[0]	; tmp1492, _2419
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d0, [x10, #lC2@PAGEOFF]	; tmp1979,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v29.2s, v29.2d	; _3505, _3504
	xtn	v28.2s, v28.2d	; _2227, _2226
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v30.2s, v18.2s, 30	; _2106, _2092,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v31.16b, v3.16b, v25.16b	; _2321, _2319, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v11.2d, v3.2d, 30	; _2325, _2319,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v27.2d, v6.2s, v5.2s	; _2237, tmp1199, _504
	str	d23, [sp, 152]	; tmp1492, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v16.8b, v16.8b, v6.8b	; _293, _293,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v3.2d, v15.2d, 30	; _1995, _1989,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v29.2s, v29.2s, v19.2s	; _3506, _3505, _3600
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	mov	v19.8b, v23.8b	; tmp1492, tmp1492
	ldp	d18, d23, [sp, 72]	; _462, vect__72.89,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v31.2s, v31.2d	; _2322, _2321
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v15.16b, v15.16b, v25.16b	; _1991, _1989, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d16, [sp, 88]	; _293, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v29.2s, v20.2s, 30	; _3398, _3384,
	add	v31.2s, v28.2s, v31.2s	; _2228, _2227, _2322
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v15.2s, v15.2d	; _1992, _1991
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umull	v16.2d, v0.2s, v18.2s	; _382, tmp1979, _462
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v0.8b, v9.8b, v14.8b	; _1451, tmp1490, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v11.2d, v19.2s, v23.2s	; _2333, tmp1492, vect__72.89
; update_VS_mont_neon.c:299:         vec_S[i] =  vdup_n_u32(S->limb[i]);
	ldp	s20, s19, [x1, 20]	; _2427, _2435,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v28.2d, v27.2d, 30	; _2243, _2237,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v27.16b, v27.16b, v25.16b	; _2239, _2237, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v31.2s, v30.2s, 30	; _2120, _2106,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v30.8b, v30.8b, v6.8b	; _2116, _2106,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v28.2d, v6.2s, v5.2s	; _2250, tmp1199, _504
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v23.16b, v16.16b, v25.16b	; _383, _382, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v16.2d, v16.2d, 30	; _455, _382,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v30.2s, v4.2s, 30	; _3051, _1979,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v20.2s, v20.s[0]	; tmp1493, _2427
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d4, [x10, #lC2@PAGEOFF]	; tmp1990,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v27.2s, v27.2d	; _2240, _2239
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v19.2s, v19.s[0]	; tmp1494, _2435
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v16.2d, v6.2s, v18.2s	; _3062, tmp1199, _462
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v23.2s, v23.2d	; _384, _383
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d18, [sp, 96]	; vect__78.92, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v23.2s, v23.2s, v21.2s	; _385, _384, _3142
	add	v30.2s, v30.2s, v15.2s	; _1868, _3051, _1992
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v15.8b, v17.8b, v6.8b	; _3156, _3156,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v3.2d, v9.2s, v18.2s	; _2003, tmp1490, vect__78.92
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v21.16b, v16.16b, v25.16b	; _3064, _3062, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v16.2d, v16.2d, 30	; _3068, _3062,
	ushr	v18.2d, v8.2d, 30	; _3521, _3515,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v8.16b, v8.16b, v25.16b	; _3517, _3515, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v21.2s, v21.2d	; _3065, _3064
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v18.2d, v6.2s, v2.2s	; _3528, tmp1199, _434
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v8.2s, v8.2d	; _3518, _3517
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v21.2s, v23.2s, 30	; _354, _385,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldp	d9, d23, [sp, 72]	; _462, vect__72.89,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v8.2s, v8.2s, v13.2s	; _3519, _3518, _3614
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v16.2d, v6.2s, v9.2s	; _3075, tmp1199, _462
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v9.2d, v11.2d, 30	; _2339, _2333,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v21.2s, v21.2s, v15.2s	; _2956, _354, _3156
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d15, [sp, 96]	; vect__78.92, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v11.16b, v11.16b, v25.16b	; _2335, _2333, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v8.2s, v29.2s, 30	; _3412, _3398,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v29.8b, v29.8b, v6.8b	; _3408, _3398,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v9.2d, v20.2s, v23.2s	; _2347, tmp1493, vect__72.89
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v23.2d, v3.2d, 30	; _2009, _2003,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v11.2s, v11.2d	; _2336, _2335
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v3.16b, v3.16b, v25.16b	; _2005, _2003, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v29.2s, v29.2s, v24.2s	; _3285, _3408, _3284
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v24.2d, v18.2d, 30	; _3534, _3528,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v18.16b, v18.16b, v25.16b	; _3530, _3528, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v23.2d, v7.2s, v15.2s	; _2017, tmp1491, vect__78.92
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v7.8b, v7.8b, v14.8b	; _1462, tmp1491, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v27.2s, v27.2s, v11.2s	; _2241, _2240, _2336
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v3.2s, v3.2d	; _2006, _2005
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v29.2s, v17.2s, 30	; _3160, _3146,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v24.2d, v6.2s, v2.2s	; _3541, tmp1199, _434
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v17.2d, v22.2d, 30	; _3631, _3625,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v18.2s, v18.2d	; _3531, _3530
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	stp	d0, d7, [sp, 264]	; _1451, _1462,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d0, [sp, 88]	; _295, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v27.2s, v31.2s, 30	; _2134, _2120,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v31.8b, v31.8b, v6.8b	; _2130, _2120,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d7, [sp, 112]	; tmp1153, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v31.2s, v31.2s, v3.2s	; _2007, _2130, _2006
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldp	d11, d3, [sp, 72]	; _462, vect__72.89,
	umull	v13.2d, v4.2s, v0.2s	; _531, tmp1990, _295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v4.2d, v16.2d, 30	; _3081, _3075,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v16.16b, v16.16b, v25.16b	; _3077, _3075, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v17.2d, v7.2s, v1.2s	; _3639, tmp1153, vect__4.77
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v7.2d, v28.2d, 30	; _2256, _2250,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v28.16b, v28.16b, v25.16b	; _2252, _2250, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v31.2s, v30.2s, 30	; _1882, _1868,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v4.2d, v6.2s, v11.2s	; _3088, tmp1199, _462
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v11.16b, v22.16b, v25.16b	; _3627, _3625, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d22, [sp, 128]	; tmp1152, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v16.2s, v16.2d	; _3078, _3077
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v30.8b, v30.8b, v6.8b	; _1878, _1868,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v15.2d, v13.2d, 30	; _298, _531,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v13.16b, v13.16b, v25.16b	; _533, _531, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v7.2d, v6.2s, v5.2s	; _2256, tmp1199, _504
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v28.2s, v28.2d	; _2253, _2252
	xtn	v11.2s, v11.2d	; _3628, _3627
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v15.2d, v6.2s, v0.2s	; _1784, tmp1199, _295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v13.2s, v13.2d	; _296, _533
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v18.2s, v18.2s, v11.2s	; _3532, _3531, _3628
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v11.2d, v9.2d, 30	; _2353, _2347,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	str	q7, [sp, 160]	; _2256, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v7.16b, v10.16b, v25.16b	; _3311, _3309, tmp1164
	and	v9.16b, v9.16b, v25.16b	; _2349, _2347, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v13.2s, v13.2s, v12.2s	; _297, _296, _1864
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v12.8b, v29.8b, v6.8b	; _3170, _3170,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v18.2s, v8.2s, 30	; _3426, _3412,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v11.2d, v19.2s, v3.2s	; _2361, tmp1494, vect__72.89
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v3.2d, v15.2d, 30	; _1790, _1784,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v15.16b, v15.16b, v25.16b	; _1786, _1784, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v12.2s, v12.2s, v16.2s	; _3079, _3170, _3078
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v16.8b, v8.8b, v6.8b	; _3422, _3422,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v8.2d, v10.2d, 30	; _3315, _3309,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	ldr	d10, [sp, 192]	; _3298, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v9.2s, v9.2d	; _2350, _2349
	xtn	v7.2s, v7.2d	; _3312, _3311
	xtn	v15.2s, v15.2d	; _1787, _1786
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v12.2s, v21.2s, 30	; _2970, _2956,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	mov	v0.16b, v8.16b	; _3315, _3315
	ldr	d8, [sp, 104]	; vect__10.80, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v28.2s, v28.2s, v9.2s	; _2254, _2253, _2350
	add	v16.2s, v16.2s, v10.2s	; _3299, _3422, _3298
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v10.2d, v4.2d, 30	; _3094, _3088,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d9, [sp, 72]	; _462, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v4.16b, v4.16b, v25.16b	; _3090, _3088, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v15.2s, v13.2s, 30	; _3023, _297,
	usra	v28.2s, v27.2s, 30	; _2148, _2134,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v27.8b, v27.8b, v6.8b	; _2144, _2134,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v16.2s, v29.2s, 30	; _3174, _3160,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v0.2d, v22.2s, v8.2s	; _3315, tmp1152, vect__10.80
	ldr	d8, [sp, 88]	; _295, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v4.2s, v4.2d	; _3091, _3090
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v29.8b, v21.8b, v6.8b	; _2956, _2956,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v10.2d, v6.2s, v9.2s	; _3101, tmp1199, _462
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v22.8b, v26.8b, v22.8b	; _2762, vect__15.82, tmp1152
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v15.2s, v15.2s, v30.2s	; _1678, _3023, _1878
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v3.2d, v6.2s, v8.2s	; _1797, tmp1199, _295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v13.8b, v16.8b, v6.8b	; _3184, _3184,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v8.2s, v13.2s, v4.2s	; _3092, _3184, _3091
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d13, [sp, 96]	; vect__78.92, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v4.8b, v18.8b, v6.8b	; _3436, _3436,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	str	q0, [sp, 176]	; _3315, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v0.8b, v29.8b	; _2966, _2956
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v29.2d, v23.2d, 30	; _2023, _2017,
; update_VS_mont_neon.c:299:         vec_S[i] =  vdup_n_u32(S->limb[i]);
	ldp	s9, s21, [x1, 28]	; _2443, _69,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v23.16b, v23.16b, v25.16b	; _2019, _2017, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d22, [sp, 240]	; _2762, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v4.2s, v4.2s, v7.2s	; _3313, _3436, _3312
	usra	v8.2s, v12.2s, 30	; _2984, _2970,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v12.8b, v12.8b, v6.8b	; _2970, _2970,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v23.2s, v23.2d	; _2020, _2019
; update_VS_mont_neon.c:299:         vec_S[i] =  vdup_n_u32(S->limb[i]);
	str	s21, [sp, 192]	; _69, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v4.2s, v16.2s, 30	; _3188, _3174,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v9.2s, v9.s[0]	; tmp1495, _2443
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d21, [sp, 152]	; tmp1492, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v16.2d, v11.2d, 30	; _2367, _2361,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v11.16b, v11.16b, v25.16b	; _2363, _2361, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v23.2s, v27.2s, v23.2s	; _2021, _2144, _2020
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d12, [sp, 128]	; _2970, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d27, [sp, 136]	; tmp1154, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v11.2s, v11.2d	; _2364, _2363
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v23.2s, v31.2s, 30	; _1896, _1882,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v31.8b, v31.8b, v6.8b	; _1892, _1882,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v29.2d, v21.2s, v13.2s	; _2031, tmp1492, vect__78.92
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v13.2d, v24.2d, 30	; _3547, _3541,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v24.16b, v24.16b, v25.16b	; _3543, _3541, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v22.8b, v21.8b, v14.8b	; _1473, tmp1492, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v13.2d, v6.2s, v2.2s	; _444, tmp1199, _434
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v30.2s, v24.2d	; _3544, _3543
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v24.2d, v17.2d, 30	; _3645, _3639,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d22, [sp, 280]	; _1473, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v17.16b, v17.16b, v25.16b	; _3641, _3639, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v24.2d, v27.2s, v1.2s	; _3645, tmp1154, vect__4.77
	movi	v27.2s, 0x7f, msl 8	; tmp2303
	mov	v7.16b, v24.16b	; _3653, _3645
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v24.2s, v17.2d	; _3642, _3641
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v17.2d, v13.2d, 30	; _436, _444,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v13.16b, v13.16b, v25.16b	; _446, _444, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v24.2s, v30.2s, v24.2s	; _3545, _3544, _3642
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	ldp	q30, q21, [sp, 160]	; _2263, _3323,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v17.2d, v27.2s, v2.2s	; _395, tmp2303, _434
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v27.16b, v7.16b, v25.16b	; _3655, _3653, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v13.2s, v13.2d	; _441, _446
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v2.2d, v7.2d, 30	; _3659, _3653,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v24.2s, v18.2s, 30	; _3440, _3426,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v27.2s, v27.2d	; _3656, _3655
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v18.2d, v10.2d, 30	; _3107, _3101,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v10.16b, v10.16b, v25.16b	; _3103, _3101, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v12.2d, v30.2d, 30	; _2269, _2263,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v30.16b, v30.16b, v25.16b	; _2265, _2263, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v13.2s, v13.2s, v27.2s	; _406, _441, _3656
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v27.2d, v3.2d, 30	; _1803, _1797,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v3.16b, v3.16b, v25.16b	; _1799, _1797, tmp1164
	and	v7.16b, v21.16b, v25.16b	; _3325, _3323, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v10.2s, v10.2d	; _3104, _3103
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v12.2d, v6.2s, v5.2s	; _317, tmp1199, _504
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v30.2s, v30.2d	; _2266, _2265
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v13.2s, v24.2s, 30	; _3454, _3440,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v3.2s, v3.2d	; _1800, _1799
	xtn	v7.2s, v7.2d	; _3326, _3325
	str	d30, [sp, 152]	; _2266, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d30, [sp, 144]	; tmp1155, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v31.2s, v31.2s, v3.2s	; _1801, _1892, _1800
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldp	d3, d22, [sp, 104]	; vect__10.80, tmp1153,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v31.2s, v15.2s, 30	; _1692, _1678,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v15.8b, v15.8b, v6.8b	; _1688, _1678,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v2.2d, v30.2s, v1.2s	; _414, tmp1155, vect__4.77
	ldr	d1, [sp, 104]	; vect__10.80, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v30.2d, v21.2d, 30	; _3329, _3323,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v21.8b, v24.8b, v6.8b	; _3450, _3450,
	and	v24.8b, v4.8b, v6.8b	; _3198, _3198,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v24.2s, v24.2s, v10.2s	; _3105, _3198, _3104
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v10.2d, v29.2d, 30	; _2037, _2031,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v30.2d, v22.2s, v1.2s	; _3337, tmp1153, vect__10.80
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v1.8b, v26.8b, v22.8b	; _2773, vect__15.82, tmp1153
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d22, [sp, 136]	; tmp1154, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v29.16b, v29.16b, v25.16b	; _2033, _2031, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v24.2s, v8.2s, 30	; _2998, _2984,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d1, [sp, 160]	; _2773, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d1, [sp, 80]	; vect__72.89, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v29.2s, v29.2d	; _2034, _2033
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v16.2d, v9.2s, v1.2s	; _2375, tmp1495, vect__72.89
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v1.2s, v21.2s, v7.2s	; _3327, _3450, _3326
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d21, [sp, 72]	; _462, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v7.8b, v8.8b, v6.8b	; _2994, _2994,
	and	v8.8b, v26.8b, v22.8b	; _481, vect__15.82, tmp1154
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v1.2s, v4.2s, 30	; _3202, _3188,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d8, [sp, 136]	; _481, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v18.2d, v6.2s, v21.2s	; _3114, tmp1199, _462
	mov	v21.16b, v27.16b	; _1803, _1803
	ldr	d27, [sp, 88]	; _295, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v8.8b, v1.8b, v6.8b	; _3212, _3212,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v21.2d, v6.2s, v27.2s	; _1803, tmp1199, _295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	ldr	d27, [sp, 152]	; _2266, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v4.16b, v18.16b, v25.16b	; _3116, _3114, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v18.2d, v18.2d, 30	; _3120, _3114,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v4.2s, v4.2d	; _3117, _3116
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v27.2s, v27.2s, v11.2s	; _2267, _2266, _2364
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v11.16b, v30.16b, v25.16b	; _3339, _3337, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	str	q21, [sp, 112]	; _1803, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v30.2d, v30.2d, 30	; _3343, _3337,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	ldr	s21, [sp, 192]	;, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v8.2s, v8.2s, v4.2s	; _3118, _3212, _3117
	usra	v27.2s, v28.2s, 30	; _2162, _2148,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v28.8b, v28.8b, v6.8b	; _2158, _2148,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v30.2d, v22.2s, v3.2s	; _3351, tmp1154, vect__10.80
	ldr	d3, [sp, 96]	; vect__78.92, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v11.2s, v11.2d	; _3340, _3339
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v8.2s, v24.2s, 30	; _3012, _2998,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v24.8b, v24.8b, v6.8b	; _3008, _2998,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:10782:   return (uint32x2_t) {__a, __a};
	dup	v21.2s, v21.s[0]	; tmp1496, _69
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v29.2s, v28.2s, v29.2s	; _2035, _2158, _2034
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	movi	v28.2s, 0x7f, msl 8	; tmp2292
	umlal	v10.2d, v20.2s, v3.2s	; _2045, tmp1493, vect__78.92
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v20.8b, v20.8b, v14.8b	; _1484, tmp1493, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v3.2d, v16.2d, 30	; _2381, _2375,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v16.16b, v16.16b, v25.16b	; _2377, _2375, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v29.2s, v23.2s, 30	; _1910, _1896,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d20, [sp, 152]	; _1484, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d20, [sp, 72]	; _462, %sfp
	umlal	v18.2d, v6.2s, v20.2s	; _3127, tmp1199, _462
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v20.2d, v12.2d, 30	; _509, _317,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v12.16b, v12.16b, v25.16b	; _512, _317, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v20.2d, v28.2s, v5.2s	; _306, tmp2292, _504
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v28.8b, v23.8b, v6.8b	; _1896, _1896,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v12.2s, v12.2d	; _513, _512
	xtn	v23.2s, v16.2d	; _2378, _2377
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ldr	q16, [sp, 112]	; _1810, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v22.8b, v28.8b	; _1906, _1896
	and	v28.8b, v13.8b, v6.8b	; _3464, _3464,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v12.2s, v12.2s, v23.2s	; _515, _513, _2378
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v23.8b, v27.8b, v6.8b	; _2162, _2162,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v4.2d, v16.2d, 30	; _1816, _1810,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v28.2s, v28.2s, v11.2s	; _3341, _3464, _3340
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v11.16b, v17.16b, v25.16b	; _397, _395, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v12.2s, v27.2s, 30	; _2176, _2162,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldp	d5, d27, [sp, 80]	; vect__72.89, _295,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v17.2d, v17.2d, 30	; _401, _395,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v28.2s, v1.2s, 30	; _3216, _3202,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v1.16b, v2.16b, v25.16b	; _416, _414, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v11.2s, v11.2d	; _398, _397
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v2.2d, v2.2d, 30	; _420, _414,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v17.16b, v17.16b, v25.16b	; _402, _401, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v3.2d, v21.2s, v5.2s	; _328, tmp1496, vect__72.89
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v5.16b, v16.16b, v25.16b	; _1812, _1810, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v4.2d, v6.2s, v27.2s	; _1823, tmp1199, _295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v2.16b, v2.16b, v25.16b	; _437, _420, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v17.2s, v17.2d	; _403, _402
	xtn	v27.2s, v5.2d	; _1813, _1812
	xtn	v5.2s, v1.2d	; _417, _416
	xtn	v16.2s, v2.2d	; _439, _437
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v27.2s, v22.2s, v27.2s	; _1814, _1906, _1813
	add	v11.2s, v11.2s, v5.2s	; _399, _398, _417
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v5.2d, v10.2d, 30	; _2051, _2045,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v10.16b, v10.16b, v25.16b	; _2047, _2045, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v17.2s, v17.2s, v16.2s	; _532, _403, _439
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v16.2d, v30.2d, 30	; _3357, _3351,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v27.2s, v31.2s, 30	; _1706, _1692,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v31.8b, v31.8b, v6.8b	; _1692, _1692,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v10.2s, v10.2d	; _2048, _2047
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v11.2s, v13.2s, 30	; _3468, _3454,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v13.16b, v30.16b, v25.16b	; _3353, _3351, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v1.8b, v31.8b	; _1702, _1692
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	mov	v31.16b, v5.16b	; _2051, _2051
	ldr	d5, [sp, 72]	; _462, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v30.2s, v23.2s, v10.2s	; _2049, _2172, _2048
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v10.16b, v20.16b, v25.16b	; _307, _306, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldp	d2, d23, [sp, 96]	; vect__78.92, vect__10.80,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v20.2d, v20.2d, 30	; _311, _306,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d22, [sp, 144]	; tmp1155, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v10.2s, v10.2d	; _308, _307
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v30.2s, v29.2s, 30	; _1924, _1910,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v29.8b, v29.8b, v6.8b	; _1920, _1910,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v20.16b, v20.16b, v25.16b	; _312, _311, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v31.2d, v19.2s, v2.2s	; _2051, tmp1494, vect__78.92
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v19.8b, v19.8b, v14.8b	; _1495, tmp1494, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v16.2d, v22.2s, v23.2s	; _449, tmp1155, vect__10.80
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v23.16b, v3.16b, v25.16b	; _329, _328, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v3.2d, v3.2d, 30	; _332, _328,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v20.2s, v20.2d	; _314, _312
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d19, [sp, 192]	; _1495, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v19.2s, v13.2d	; _3354, _3353
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v13.8b, v11.8b, v6.8b	; _393, _393,
	and	v22.8b, v22.8b, v26.8b	; _346, tmp1155, vect__15.82
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v23.2s, v23.2d	; _330, _329
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v3.16b, v3.16b, v25.16b	; _508, _332, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v13.2s, v13.2s, v19.2s	; _3355, _393, _3354
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v19.2d, v18.2d, 30	; _3133, _3127,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v18.16b, v18.16b, v25.16b	; _3129, _3127, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v10.2s, v10.2s, v23.2s	; _310, _308, _330
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d23, [sp, 88]	; _295, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v3.2s, v3.2d	; _322, _508
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v19.2d, v6.2s, v5.2s	; _375, tmp1199, _462
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v13.2s, v28.2s, 30	; _3230, _3216,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v18.2s, v18.2d	; _3130, _3129
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v28.8b, v28.8b, v6.8b	; _3226, _3216,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v5.2d, v4.2d, 30	; _1829, _1823,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v4.16b, v4.16b, v25.16b	; _1825, _1823, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v10.2s, v12.2s, 30	; _2190, _2176,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v12.8b, v12.8b, v6.8b	; _2186, _2176,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v20.2s, v20.2s, v3.2s	; _3027, _314, _322
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d3, [sp, 88]	; _295, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v28.2s, v28.2s, v18.2s	; _3131, _3226, _3130
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v18.8b, v8.8b, v6.8b	; _3022, _3022,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v5.2d, v6.2s, v23.2s	; _1836, tmp1199, _295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v23.2d, v31.2d, 30	; _2065, _2059,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v4.2s, v4.2d	; _1826, _1825
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v31.16b, v31.16b, v25.16b	; _2061, _2059, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v17.2s, v13.2s, 30	; _300, _3230,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v13.8b, v13.8b, v6.8b	; _3240, _3230,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v28.2s, v8.2s, 30	; _3026, _3012,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v8.16b, v19.16b, v25.16b	; _377, _375, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v23.2d, v9.2s, v2.2s	; _2073, tmp1495, vect__78.92
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v9.8b, v9.8b, v14.8b	; _550, tmp1495, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v29.2s, v29.2s, v4.2s	; _1827, _1920, _1826
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v31.2s, v31.2d	; _2062, _2061
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	movi	v4.2s, 0x7f, msl 8	; tmp2302
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v19.2d, v19.2d, 30	; _381, _375,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d9, [sp, 176]	; _550, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v9.2s, v8.2d	; _378, _377
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	ldr	d8, [sp, 72]	; _462, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v31.2s, v12.2s, v31.2s	; _2063, _2186, _2062
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v12.2d, v5.2d, 30	; _1842, _1836,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v5.16b, v5.16b, v25.16b	; _1838, _1836, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v29.2s, v27.2s, 30	; _1720, _1706,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v27.8b, v27.8b, v6.8b	; _1716, _1706,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v13.2s, v13.2s, v9.2s	; _379, _3240, _378
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v9.16b, v16.16b, v25.16b	; _450, _449, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v31.2s, v30.2s, 30	; _1938, _1924,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v30.8b, v30.8b, v6.8b	; _1934, _1924,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v5.2s, v5.2d	; _1839, _1838
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v16.2d, v16.2d, 30	; _391, _449,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v19.2d, v4.2s, v8.2s	; _368, tmp2302, _462
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v8.16b, v23.16b, v25.16b	; _2075, _2073, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	ldr	d4, [sp, 128]	; _2902, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v23.2d, v23.2d, 30	; _2079, _2073,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v9.2s, v9.2d	; _452, _450
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v12.2d, v6.2s, v3.2s	; _1849, tmp1199, _295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v13.2s, v28.2s, 30	; _3040, _3026,
	add	v30.2s, v30.2s, v5.2s	; _1840, _1934, _1839
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v16.16b, v16.16b, v25.16b	; _387, _391, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v8.2s, v8.2d	; _2076, _2075
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v28.8b, v28.8b, v6.8b	; _3036, _3026,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v23.2d, v21.2s, v2.2s	; _302, tmp1496, vect__78.92
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	movi	v2.2s, 0x13	; tmp2300
	usra	v9.2s, v11.2s, 30	; _534, _3468,
	usra	v30.2s, v29.2s, 30	; _1734, _1720,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v29.8b, v29.8b, v6.8b	; _1730, _1720,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v16.2s, v16.2d	; _388, _387
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v5.2s, v0.2s, v2.2s	; _2894, _2966, tmp2300
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v2.8b, v21.8b, v14.8b	; _260, tmp1496, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v21.8b, v1.8b	; _1624, _1702
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	str	d2, [sp, 72]	; _260, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	movi	v2.2s, 0x13	; tmp2289
	usra	v4.2s, v5.2s, 30	; _2902, _2894,
	mov	v5.8b, v7.8b	; _2910, _2994
	add	v17.2s, v17.2s, v9.2s	; _3244, _300, _534
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v9.2d, v19.2d, 30	; _370, _368,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v19.16b, v19.16b, v25.16b	; _465, _368, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v11.2s, v15.2s, v2.2s	; _1616, _1688, tmp2289
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v9.16b, v9.16b, v25.16b	; _371, _370, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v19.2s, v19.2d	; _466, _465
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v5.2s, v4.2s, 30	; _2910, _2902,
	mov	v4.8b, v24.8b	; _2918, _3008
	usra	v21.2s, v11.2s, 30	; _1624, _1616,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v11.8b, v10.8b, v6.8b	; _518, _518,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v9.2s, v9.2d	; _372, _371
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v11.2s, v11.2s, v8.2s	; _2077, _518, _2076
	mov	v8.8b, v27.8b	; _1632, _1716
	usra	v4.2s, v5.2s, 30	; _2918, _2910,
	mov	v5.8b, v29.8b	; _1640, _1730
	add	v9.2s, v9.2s, v16.2s	; _2883, _372, _388
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v16.8b, v17.8b, v6.8b	; _457, _457,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v8.2s, v21.2s, 30	; _1632, _1624,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v21.2d, v12.2d, 30	; _1855, _1849,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v12.16b, v12.16b, v25.16b	; _1851, _1849, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v11.2s, v31.2s, 30	; _1952, _1938,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v31.8b, v31.8b, v6.8b	; _1948, _1938,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v16.2s, v16.2s, v19.2s	; _369, _457, _466
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v19.8b, v13.8b, v6.8b	; _3050, _3050,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v21.2d, v6.2s, v3.2s	; _287, tmp1199, _295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v12.2s, v12.2d	; _1852, _1851
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v5.2s, v8.2s, 30	; _1640, _1632,
	mov	v8.8b, v18.8b	; _2926, _3022
	usra	v16.2s, v13.2s, 30	; _3054, _3040,
	add	v31.2s, v31.2s, v12.2s	; _1853, _1948, _1852
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v12.16b, v23.16b, v25.16b	; _303, _302, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v23.2d, v23.2d, 30	; _523, _302,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v8.2s, v4.2s, 30	; _2926, _2918,
	usra	v20.2s, v11.2s, 30	; _3041, _1952,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v11.8b, v11.8b, v6.8b	; _1962, _1952,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v31.2s, v30.2s, 30	; _1748, _1734,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v12.2s, v12.2d	; _520, _303
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v30.8b, v30.8b, v6.8b	; _1744, _1734,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v23.16b, v23.16b, v25.16b	; _527, _523, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	movi	v6.2s, 0x7f, msl 8	; tmp2291
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v13.2d, v21.2d, 30	; _292, _287,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v21.16b, v21.16b, v25.16b	; _288, _287, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v12.2s, v10.2s, 30	; _3037, _2190,
	mov	v10.8b, v30.8b	; _1648, _1744
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4088:   return __builtin_aarch64_umlalv2si_uuuu (__a, __b, __c);
	umlal	v13.2d, v6.2s, v3.2s	; _542, tmp2291, _295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v21.2s, v21.2d	; _289, _288
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v10.2s, v5.2s, 30	; _1648, _1640,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v5.2s, v23.2d	; _528, _527
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v23.8b, v28.8b	; _2934, _3036
	add	v12.2s, v20.2s, v12.2s	; _1966, _3041, _3037
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v20.16b, v13.16b, v25.16b	; _280, _542, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21456:   return __builtin_aarch64_lshrv2di_uus (__a, __b);
	ushr	v13.2d, v13.2d, 30	; _536, _542,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v23.2s, v8.2s, 30	; _2934, _2926,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v8.2s, v16.2s, 30	; _469, _3054,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v16.2s, #192, lsl #24	; _471
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v20.2s, v20.2d	; _282, _280
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1143:   return __a & __b;
	and	v13.16b, v13.16b, v25.16b	; _283, _536, tmp1164
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v8.2s, v17.2s, 30	; _2887, _3244,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v17.8b, v12.8b	; _525, _1966
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v12.2s, v12.2s, 30	; _299, _1966,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:4751:   return __builtin_aarch64_xtnv2di_uu (__a);
	xtn	v13.2s, v13.2d	; _284, _283
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v4.8b, v23.8b	; _2934, _2934
	add	v23.2s, v11.2s, v21.2s	; _291, _1962, _289
	mov	v11.8b, v19.8b	; _2942, _3050
	mov	v21.8b, v16.8b	; _363, _471
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v17.2s, #192, lsl #24	; _525
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v13.2s, v13.2s, v5.2s	; _3009, _284, _528
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v5.8b, v2.8b	; tmp2299, tmp2289
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v23.2s, v31.2s, 30	; _1762, _1748,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v31.2s, #192, lsl #24	; _1758
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v11.2s, v4.2s, 30	; _2942, _2934,
	add	v8.2s, v8.2s, v9.2s	; _366, _2887, _2883
	add	v17.2s, v17.2s, v20.2s	; _535, _525, _282
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	mov	v9.8b, v6.8b	; tmp2301, tmp2291
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v4.8b, v14.8b	; _994, vect__83.94
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v25.8b, v31.8b	; _1656, _1758
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v20.2s, v6.2s, v8.2s	; _775, tmp2301, _366
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v17.2s, v23.2s, 30	; _1776, _1762,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v23.2s, #192, lsl #24	; _1772
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v25.2s, v10.2s, 30	; _1656, _1648,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	movi	v10.2s, 0x80, lsl 8	; tmp2095
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v21.2s, v11.2s, 30	; _363, _2942,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v4.2s, #192, lsl #24	; _994
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v11.8b, v23.8b	; _1664, _1772
	usra	v12.2s, v17.2s, 30	; _3013, _1776,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v17.2s, #192, lsl #24	; _539
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v11.2s, v25.2s, 30	; _1664, _1656,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v21.2s, v21.2s, 30	; _364, _363,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v25.8b, v17.8b	; _276, _539
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v21.2s, v20.2s, v21.2s	; _474, _775, _364
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v20.2s, v12.2s, v13.2s	; _540, _3013, _3009
	usra	v25.2s, v11.2s, 30	; _276, _1664,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	ldr	d11, [sp, 200]	; _352, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21365:   return (int32x2_t) __builtin_aarch64_ashrv2si (__a, __b);
	cmlt	v21.2s, v21.2s, #0	; _475, _474
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v13.2s, v25.2s, 30	; _277, _276,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v25.2s, v6.2s, v20.2s	; _779, tmp2290, _540
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	ldr	d6, [x10, #lC2@PAGEOFF]	; tmp2097,
	and	v12.8b, v21.8b, v2.8b	; _358, _475, tmp2299
	and	v21.8b, v21.8b, v10.8b	; _360, _475, tmp2095
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v25.2s, v25.2s, v13.2s	; _544, _779, _277
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	ldr	d13, [sp, 128]	; _2980, %sfp
	add	v12.2s, v12.2s, v0.2s	; _359, _358, _2966
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v21.2s, v8.2s, v21.2s	; _362, _366, _360
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v2.8b, v26.8b, v6.8b	; _350, vect__15.82, tmp2097
	and	v6.8b, v14.8b, v6.8b	; _553, vect__83.94, tmp2099
	and	v14.8b, v14.8b, v9.8b	; _558, vect__83.94, tmp2287
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21365:   return (int32x2_t) __builtin_aarch64_ashrv2si (__a, __b);
	cmlt	v25.2s, v25.2s, #0	; _545, _544
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v13.2s, v12.2s, 30	; _2980, _359,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v2.2s, v2.2s, v11.2s	; _2873, _350, _352
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v12.2s, #192, lsl #24	; _2784
	and	v5.8b, v25.8b, v5.8b	; _546, _545, tmp2288
	and	v25.8b, v25.8b, v10.8b	; _273, _545, tmp2107
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v2.2s, v2.2s, v12.2s	; _353, _2873, _2784
	ldp	d11, d12, [sp, 248]	; _266, _1440,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v7.2s, v13.2s, 30	; _2802, _2788,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v3.8b, v13.8b	; _2798, _2788
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	ldr	d13, [sp, 208]	; _2718, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v5.2s, v5.2s, v15.2s	; _548, _546, _1688
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v25.2s, v20.2s, v25.2s	; _274, _540, _273
	sub	v6.2s, v6.2s, v11.2s	; _2999, _553, _266
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v11.8b, v26.8b, v9.8b	; _344, vect__15.82, tmp2298
	bic	v26.2s, #192, lsl #24	; _954
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v9.2s, v4.2s, v12.2s	; _2985, _994, _1440
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v1.2s, v5.2s, 30	; _1510, _548,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v5.2s, #192, lsl #24	; _1506
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v24.2s, v7.2s, 30	; _2816, _2802,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v3.2s, #192, lsl #24	; _2798
	bic	v7.2s, #192, lsl #24	; _2812
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v8.2s, v26.2s, v13.2s	; _2859, _954, _2718
	ldp	d13, d15, [sp, 216]	; _2729, _2740,
	add	v5.2s, v6.2s, v5.2s	; _267, _2999, _1506
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v20.8b, v1.8b	; _1520, _1510
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v27.2s, v1.2s, 30	; _1524, _1510,
	usra	v18.2s, v24.2s, 30	; _2830, _2816,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v24.2s, #192, lsl #24	; _2826
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v12.2s, v26.2s, v15.2s	; _2831, _954, _2740
	ldr	d15, [sp, 232]	; _2751, %sfp
	sub	v10.2s, v26.2s, v13.2s	; _2845, _954, _2729
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v6.2s, v5.2s, 31	; _1343, _267,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	ldp	d0, d13, [sp, 264]	; _1451, _1462,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v20.2s, #192, lsl #24	; _1520
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v29.2s, v27.2s, 30	; _1538, _1524,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v27.2s, #192, lsl #24	; _1534
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v15.2s, v26.2s, v15.2s	; _2817, _954, _2751
	sub	v20.2s, v20.2s, v6.2s	; _2995, _1520, _1343
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v28.2s, v18.2s, 30	; _2844, _2830,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v18.2s, #192, lsl #24	; _2840
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v13.2s, v4.2s, v13.2s	; _2957, _994, _1462
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v6.2s, v6.2s, 30	; _1351, _1343,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	stp	d11, d15, [sp, 80]	; _344, _2817,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v11.2s, v4.2s, v0.2s	; _2971, _994, _1451
	add	v20.2s, v9.2s, v20.2s	; _1346, _2985, _2995
	ldr	d0, [sp, 240]	; _2762, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v6.2s, v6.2s, v5.2s	; _1353, _1351, _267
	usra	v30.2s, v29.2s, 30	; _1552, _1538,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	ldr	d15, [sp, 280]	; _1473, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v29.2s, #192, lsl #24	; _1548
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v5.2s, v20.2s, 31	; _1357, _1346,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v19.2s, v28.2s, 30	; _2858, _2844,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v28.2s, #192, lsl #24	; _2854
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v0.2s, v26.2s, v0.2s	; _2803, _954, _2762
	sub	v27.2s, v27.2s, v5.2s	; _2981, _1534, _1357
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v5.2s, v5.2s, 30	; _1365, _1357,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v15.2s, v4.2s, v15.2s	; _2952, _994, _1473
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v31.2s, v30.2s, 30	; _1566, _1552,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v30.2s, #192, lsl #24	; _1562
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	str	d0, [sp, 96]	; _2803, %sfp
	ldr	d0, [sp, 152]	; _1484, %sfp
	add	v27.2s, v11.2s, v27.2s	; _1360, _2971, _2981
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v16.2s, v19.2s, 30	; _2872, _2858,
	add	v5.2s, v5.2s, v20.2s	; _1367, _1365, _1346
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v19.2s, #192, lsl #24	; _2868
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v20.2s, v27.2s, 31	; _1375, _1360,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v23.2s, v31.2s, 30	; _1580, _1566,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v31.2s, #192, lsl #24	; _1576
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v0.2s, v4.2s, v0.2s	; _275, _994, _1484
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v21.2s, v16.2s, 30	; _2886, _2872,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v29.2s, v29.2s, v20.2s	; _2967, _1548, _1375
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v20.2s, v20.2s, 30	; _1383, _1375,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	str	d0, [sp, 112]	; _275, %sfp
	ldr	d0, [sp, 160]	; _2773, %sfp
	add	v29.2s, v13.2s, v29.2s	; _1378, _2957, _2967
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v17.2s, v23.2s, 30	; _1594, _1580,
	add	v20.2s, v20.2s, v27.2s	; _1385, _1383, _1360
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v21.2s, #192, lsl #24	; _355
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v27.2s, v29.2s, 31	; _1389, _1378,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v0.2s, v26.2s, v0.2s	; _2789, _954, _2773
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v25.2s, v17.2s, 30	; _1608, _1594,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v30.2s, v30.2s, v27.2s	; _2953, _1562, _1389
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v27.2s, v27.2s, 30	; _1397, _1389,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	str	d0, [sp, 104]	; _2789, %sfp
	ldr	d0, [sp, 192]	; _1495, %sfp
	add	v30.2s, v15.2s, v30.2s	; _1392, _2952, _2953
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v27.2s, v27.2s, v29.2s	; _1399, _1397, _1378
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v25.2s, #192, lsl #24	; _269
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v0.2s, v4.2s, v0.2s	; _3132, _994, _1495
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v25.2s, v25.2s, v14.2s	; _560, _269, _558
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	str	d0, [sp, 144]	; _3132, %sfp
	ldr	d0, [sp, 136]	; _481, %sfp
	sub	v26.2s, v26.2s, v0.2s	; _294, _954, _481
	str	d26, [sp, 128]	; _294, %sfp
	ldr	d26, [sp, 176]	; _550, %sfp
	sub	v4.2s, v4.2s, v26.2s	; _3106, _994, _550
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v26.2s, v2.2s, 31	; _2621, _353,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v3.2s, v3.2s, v26.2s	; _2869, _2798, _2621
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v26.2s, v26.2s, 30	; _2629, _2621,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	str	d4, [sp, 136]	; _3106, %sfp
	movi	v4.2s, 0x7f, msl 8	; tmp2297
	add	v3.2s, v8.2s, v3.2s	; _2624, _2859, _2869
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v26.2s, v26.2s, v2.2s	; _2631, _2629, _353
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	ldr	d2, [sp, 72]	; _260, %sfp
	add	v1.2s, v22.2s, v4.2s	; _867, _346, tmp2297
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v8.2s, v3.2s, 31	; _2635, _2624,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v9.2s, v2.2s, v4.2s	; _3067, _260, tmp2286
	sub	v7.2s, v7.2s, v8.2s	; _2855, _2812, _2635
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v8.2s, v8.2s, 30	; _2643, _2635,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v7.2s, v10.2s, v7.2s	; _2638, _2845, _2855
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v8.2s, v8.2s, v3.2s	; _2645, _2643, _2624
	movi	v3.2s, 0x13	; tmp2296
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v11.2s, v7.2s, 31	; _2653, _2638,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v4.8b, v8.8b	; _2572, _2645
	add	v10.2s, v26.2s, v3.2s	; _2564, _2631, tmp2296
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v24.2s, v24.2s, v11.2s	; _2841, _2826, _2653
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v11.2s, v11.2s, 30	; _2661, _2653,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v4.2s, v10.2s, 30	; _2572, _2564,
	add	v10.2s, v6.2s, v3.2s	; _1286, _1353, tmp2285
	add	v11.2s, v11.2s, v7.2s	; _2663, _2661, _2638
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v7.8b, v16.8b	; _2882, _2872
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v24.2s, v12.2s, v24.2s	; _2656, _2831, _2841
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v12.8b, v5.8b	; _1294, _1367
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v7.2s, #192, lsl #24	; _2882
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v16.8b, v11.8b	; _2580, _2663
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v13.2s, v24.2s, 31	; _2667, _2656,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v12.2s, v10.2s, 30	; _1294, _1286,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v10.8b, v7.8b	; _2882, _2882
	mov	v7.8b, v23.8b	; _1590, _1580
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	ldp	d23, d0, [sp, 88]	; _2817, _2803,
	sub	v18.2s, v18.2s, v13.2s	; _2827, _2840, _2667
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v13.2s, v13.2s, 30	; _2675, _2667,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v16.2s, v4.2s, 30	; _2580, _2572,
	mov	v4.8b, v20.8b	; _1302, _1385
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v7.2s, #192, lsl #24	; _1590
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v13.2s, v13.2s, v24.2s	; _2677, _2675, _2656
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v18.2s, v23.2s, v18.2s	; _2670, _2817, _2827
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v23.8b, v17.8b	; _1604, _1594
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	ldr	d17, [sp, 80]	; _344, %sfp
	usra	v4.2s, v12.2s, 30	; _1302, _1294,
	mov	v29.8b, v13.8b	; _2588, _2677
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v24.2s, v18.2s, 31	; _2685, _2670,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v23.2s, #192, lsl #24	; _1604
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v21.2s, v21.2s, v17.2s	; _345, _355, _344
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v17.2s, v30.2s, 31	; _1407, _1392,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v29.2s, v16.2s, 30	; _2588, _2580,
	mov	v16.8b, v27.8b	; _1310, _1399
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v28.2s, v28.2s, v24.2s	; _2813, _2854, _2685
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v24.2s, v24.2s, 30	; _2693, _2685,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v31.2s, v31.2s, v17.2s	; _278, _1576, _1407
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v17.2s, v17.2s, 30	; _1415, _1407,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v16.2s, v4.2s, 30	; _1310, _1302,
	sub	v15.2s, v21.2s, v22.2s	; _3055, _345, _346
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v28.2s, v0.2s, v28.2s	; _2688, _2803, _2813
	ldr	d0, [sp, 112]	; _275, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v24.2s, v24.2s, v18.2s	; _2695, _2693, _2670
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	movi	v22.2s, 0x13	; tmp2295
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v17.2s, v17.2s, v30.2s	; _1417, _1415, _1392
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v18.2s, v28.2s, 31	; _2699, _2688,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v30.8b, v24.8b	; _2596, _2695
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v31.2s, v0.2s, v31.2s	; _1410, _275, _278
	ldr	d0, [sp, 104]	; _2789, %sfp
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v14.8b, v17.8b	; _1318, _1417
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v19.2s, v19.2s, v18.2s	; _2799, _2868, _2699
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v18.2s, v18.2s, 30	; _2707, _2699,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v30.2s, v29.2s, 30	; _2596, _2588,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v29.2s, v31.2s, 31	; _1421, _1410,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v14.2s, v16.2s, 30	; _1318, _1310,
	sub	v16.2s, v25.2s, v2.2s	; _552, _560, _260
	add	v18.2s, v18.2s, v28.2s	; _2709, _2707, _2688
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v19.2s, v0.2s, v19.2s	; _2702, _2789, _2799
	sub	v7.2s, v7.2s, v29.2s	; _547, _1590, _1421
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v29.2s, v29.2s, 30	; _1429, _1421,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v12.8b, v18.8b	; _2604, _2709
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v28.2s, v19.2s, 31	; _343, _2702,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v29.2s, v29.2s, v31.2s	; _1431, _1429, _1410
	usra	v12.2s, v30.2s, 30	; _2604, _2596,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	ldr	d30, [sp, 128]	; _294, %sfp
	sub	v10.2s, v10.2s, v28.2s	; _2785, _2882, _343
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v28.2s, v28.2s, 30	; _485, _343,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v4.8b, v29.8b	; _1326, _1431
	add	v28.2s, v28.2s, v19.2s	; _488, _485, _2702
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v10.2s, v30.2s, v10.2s	; _483, _294, _2785
	ldp	d30, d0, [sp, 136]	; _3106, _3132,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v4.2s, v14.2s, 30	; _1326, _1318,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v14.2s, v10.2s, 31	; _690, _483,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v7.2s, v7.2s, v0.2s	; _1424, _547, _3132
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v19.2s, v14.2s, 30	; _28, _690,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v21.2s, v14.2s, v21.2s	; _281, _690, _345
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v31.2s, v7.2s, 31	; _565, _1424,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v19.2s, v19.2s, v10.2s	; _562, _28, _483
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v23.2s, v23.2s, v31.2s	; _3119, _1604, _565
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v31.2s, v31.2s, 30	; _555, _565,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v23.2s, v30.2s, v23.2s	; _257, _3106, _3119
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v31.2s, v31.2s, v7.2s	; _557, _555, _1424
	mov	v7.8b, v28.8b	; _2612, _488
	mov	v3.8b, v31.8b	; _1334, _557
	usra	v7.2s, v12.2s, 30	; _2612, _2604,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v12.2s, v23.2s, 31	; _840, _257,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v3.2s, v4.2s, 30	; _1334, _1326,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	movi	v4.2s, 0x7f, msl 8	; tmp2282
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21055:   return (uint32x2_t) __builtin_aarch64_ashlv2si ((int32x2_t) __a, __b);
	shl	v30.2s, v12.2s, 30	; _832, _840,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v25.2s, v12.2s, v25.2s	; _3080, _840, _560
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v30.2s, v30.2s, v23.2s	; _830, _832, _257
	mov	v23.8b, v19.8b	; _491, _562
	usra	v23.2s, v7.2s, 30	; _491, _2612,
	mov	v10.8b, v23.8b	; _491, _491
	mov	v23.8b, v30.8b	; _256, _830
	usra	v23.2s, v3.2s, 30	; _256, _1334,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v10.2s, v10.2s, 30	; _493, _491,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v1.2s, v1.2s, v10.2s	; _290, _867, _493
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	movi	v10.2s, 0x80, lsl 8	; tmp2159
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21393:   return __builtin_aarch64_lshrv2si_uus (__a, __b);
	ushr	v23.2s, v23.2s, 30	; _563, _256,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v1.2s, v1.2s, v21.2s	; _334, _290, _281
	sub	v9.2s, v9.2s, v23.2s	; _3093, _3067, _563
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21365:   return (int32x2_t) __builtin_aarch64_ashrv2si (__a, __b);
	cmlt	v1.2s, v1.2s, #0	; _335, _334
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	add	v21.2s, v9.2s, v25.2s	; _571, _3093, _3080
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v25.8b, v1.8b, v22.8b	; _337, _335, tmp2295
	and	v1.8b, v1.8b, v10.8b	; _339, _335, tmp2159
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21365:   return (int32x2_t) __builtin_aarch64_ashrv2si (__a, __b);
	cmlt	v21.2s, v21.2s, #0	; _249, _571
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v26.2s, v25.2s, v26.2s	; _338, _337, _2631
	add	v14.2s, v1.2s, v14.2s	; _2753, _339, _690
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v23.8b, v21.8b, v22.8b	; _250, _249, tmp2284
	and	v21.8b, v21.8b, v10.8b	; _253, _249, tmp2160
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v8.2s, v26.2s, 30	; _2458, _338,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v26.2s, #192, lsl #24	; _2454
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v23.2s, v23.2s, v6.2s	; _251, _250, _1353
	add	v21.2s, v21.2s, v12.2s	; _2742, _253, _840
	usra	v5.2s, v23.2s, 30	; _1180, _251,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v23.2s, #192, lsl #24	; _1176
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v11.2s, v8.2s, 30	; _2472, _2458,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v8.2s, #192, lsl #24	; _2468
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v23.2s, v23.2s, v26.2s	; _1103, _1176, _2454
	usra	v20.2s, v5.2s, 30	; _1194, _1180,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v5.2s, #192, lsl #24	; _1190
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v13.2s, v11.2s, 30	; _2486, _2472,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v11.2s, #192, lsl #24	; _2482
	mov	v26.8b, v23.8b	; _992, _1103
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v25.2s, v5.2s, v8.2s	; _1112, _1190, _2468
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v26.2s, #192, lsl #24	; _992
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v27.2s, v20.2s, 30	; _1208, _1194,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v20.2s, #192, lsl #24	; _1204
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v25.2s, v23.2s, 30	; _975, _1103,
	usra	v24.2s, v13.2s, 30	; _2500, _2486,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v13.2s, #192, lsl #24	; _2496
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v12.2s, v26.2s, v22.2s	; _197, _992, tmp2283
	add	v23.2s, v20.2s, v11.2s	; _1121, _1204, _2482
	usra	v17.2s, v27.2s, 30	; _1222, _1208,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v27.2s, #192, lsl #24	; _1218
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v23.2s, v25.2s, 30	; _407, _975,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v25.2s, #192, lsl #24	; _935
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v18.2s, v24.2s, 30	; _2514, _2500,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v24.2s, #192, lsl #24	; _2510
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v27.2s, v27.2s, v13.2s	; _1130, _1218, _2496
	mov	v20.8b, v25.8b	; _189, _935
	usra	v29.2s, v17.2s, 30	; _1236, _1222,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v17.2s, #192, lsl #24	; _1232
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v27.2s, v23.2s, 30	; _1024, _407,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v23.2s, #192, lsl #24	; _1020
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v20.2s, v12.2s, 30	; _189, _197,
	usra	v28.2s, v18.2s, 30	; _2528, _2514,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v18.2s, #192, lsl #24	; _2524
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v24.2s, v17.2s, v24.2s	; _1139, _1232, _2510
	mov	v13.8b, v23.8b	; _181, _1020
	usra	v31.2s, v29.2s, 30	; _1250, _1236,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v29.2s, #192, lsl #24	; _1246
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v24.2s, v27.2s, 30	; _1038, _1024,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v27.2s, #192, lsl #24	; _1034
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v13.2s, v20.2s, 30	; _181, _189,
	usra	v19.2s, v28.2s, 30	; _2542, _2528,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v28.2s, #192, lsl #24	; _2538
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v20.2s, v29.2s, v18.2s	; _1148, _1246, _2524
	mov	v17.8b, v27.8b	; _173, _1034
	usra	v30.2s, v31.2s, 30	; _1264, _1250,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v31.2s, #192, lsl #24	; _1260
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v20.2s, v24.2s, 30	; _1052, _1038,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v24.2s, #192, lsl #24	; _1048
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v17.2s, v13.2s, 30	; _173, _181,
	usra	v15.2s, v19.2s, 30	; _543, _2542,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v19.2s, #192, lsl #24	; _2552
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v29.2s, v31.2s, v28.2s	; _1157, _1260, _2538
	mov	v18.8b, v24.8b	; _165, _1048
	usra	v16.2s, v30.2s, 30	; _272, _1264,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v30.2s, #192, lsl #24	; _1274
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v29.2s, v20.2s, 30	; _1066, _1052,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v20.2s, #192, lsl #24	; _1062
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v18.2s, v17.2s, 30	; _165, _173,
	sub	v31.2s, v15.2s, v14.2s	; _2556, _543, _2753
	add	v30.2s, v30.2s, v19.2s	; _1166, _1274, _2552
	mov	v28.8b, v20.8b	; _157, _1062
	sub	v16.2s, v16.2s, v21.2s	; _1278, _272, _2742
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v31.2s, #192, lsl #24	; _497
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v30.2s, v29.2s, 30	; _1080, _1066,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v29.2s, #192, lsl #24	; _1076
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v28.2s, v18.2s, 30	; _157, _165,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v16.2s, #192, lsl #24	; _567
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v19.8b, v29.8b	; _100, _1076
	add	v31.2s, v31.2s, v16.2s	; _246, _497, _567
	usra	v19.2s, v28.2s, 30	; _100, _157,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	mov	v28.8b, v30.8b	; _1090, _1080
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v31.2s, v30.2s, 30	; _1094, _1080,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v28.2s, #192, lsl #24	; _1090
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v21.8b, v28.8b	; _240, _1090
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v31.2s, #192, lsl #24	; _244
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v21.2s, v19.2s, 30	; _240, _100,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	mov	v30.8b, v31.8b	; _2731, _244
	usra	v30.2s, v21.2s, 30	; _2731, _240,
	sub	v30.2s, v4.2s, v30.2s	; _578, tmp2282, _2731
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:21365:   return (int32x2_t) __builtin_aarch64_ashrv2si (__a, __b);
	cmlt	v30.2s, v30.2s, #0	; _238, _578
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	and	v22.8b, v30.8b, v22.8b	; _573, _238, tmp2281
	and	v30.8b, v30.8b, v10.8b	; _576, _238, tmp2171
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	add	v22.2s, v22.2s, v26.2s	; _574, _573, _992
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1647:   return __a - __b;
	sub	v31.2s, v31.2s, v30.2s	; _239, _244, _576
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	mov	v30.8b, v28.8b	; _1090, _1090
	usra	v25.2s, v22.2s, 30	; _649, _574,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v22.2s, #192, lsl #24	; _653
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	str	s22, [x0]	; _653, V_425(D)->limb[0]
	st1	{v22.s}[1], [x3], 4	; _653,, S_427(D)->limb[0]
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v23.2s, v25.2s, 30	; _635, _649,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v25.2s, #192, lsl #24	; _639
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	str	s25, [x0, 4]	; _639, V_425(D)->limb[1]
	st1	{v25.s}[1], [x3]	; _639,, S_427(D)->limb[1]
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v27.2s, v23.2s, 30	; _621, _635,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v23.2s, #192, lsl #24	; _625
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	str	s23, [x0, 8]	; _625, V_425(D)->limb[2]
	st1	{v23.s}[1], [x9]	; _625,, S_427(D)->limb[2]
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v24.2s, v27.2s, 30	; _607, _621,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v27.2s, #192, lsl #24	; _611
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	str	s27, [x0, 12]	; _611, V_425(D)->limb[3]
	st1	{v27.s}[1], [x8]	; _611,, S_427(D)->limb[3]
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v20.2s, v24.2s, 30	; _593, _607,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v24.2s, #192, lsl #24	; _597
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	str	s24, [x0, 16]	; _597, V_425(D)->limb[4]
	st1	{v24.s}[1], [x7]	; _597,, S_427(D)->limb[4]
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v29.2s, v20.2s, 30	; _271, _593,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v20.2s, #192, lsl #24	; _473
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	str	s20, [x0, 20]	; _473, V_425(D)->limb[5]
	st1	{v20.s}[1], [x6]	; _473,, S_427(D)->limb[5]
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v30.2s, v29.2s, 30	; _1090, _271,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v29.2s, #192, lsl #24	; _223
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	str	s29, [x0, 24]	; _223, V_425(D)->limb[6]
	st1	{v29.s}[1], [x5]	; _223,, S_427(D)->limb[6]
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:289:   return __a + __b;
	usra	v31.2s, v30.2s, 30	; _205, _219,
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v30.2s, #192, lsl #24	; _209
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	str	s30, [x0, 28]	; _209, V_425(D)->limb[7]
	st1	{v30.s}[1], [x4]	; _209,, S_427(D)->limb[7]
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:1073:   return __a & __b;
	bic	v31.2s, #192, lsl #24	; _583
; /opt/homebrew/Cellar/gcc/14.2.0_1/lib/gcc/current/gcc/aarch64-apple-darwin24/14/include/arm_neon.h:2720:   return __aarch64_vget_lane_any (__a, __b);
	str	s31, [x0, 32]	; _583, V_425(D)->limb[8]
	st1	{v31.s}[1], [x2]	; _583,, S_427(D)->limb[8]
; update_VS_mont_neon.c:611: }
	ldp	d10, d11, [sp, 16]	;,,
	ldp	d12, d13, [sp, 32]	;,,
	ldp	d14, d15, [sp, 48]	;,,
	ldp	d8, d9, [sp], 288	;,,,
LCFI2:
	ret	
LFE3917:
	.literal16
	.align	4
lC0:
	.xword	1073741823
	.xword	1073741823
	.const
	.align	3
lC1:
	.word	678152731
	.word	678152731
	.align	3
lC2:
	.word	1073741805
	.word	1073741805
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x3
	.ascii "zR\0"
	.uleb128 0x1
	.sleb128 -8
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x10
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB3917-.
	.set L$set$2,LFE3917-LFB3917
	.quad L$set$2
	.uleb128 0
	.byte	0x4
	.set L$set$3,LCFI0-LFB3917
	.long L$set$3
	.byte	0xe
	.uleb128 0x120
	.byte	0x5
	.uleb128 0x48
	.uleb128 0x24
	.byte	0x5
	.uleb128 0x49
	.uleb128 0x23
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0x5
	.uleb128 0x4a
	.uleb128 0x22
	.byte	0x5
	.uleb128 0x4b
	.uleb128 0x21
	.byte	0x5
	.uleb128 0x4c
	.uleb128 0x20
	.byte	0x5
	.uleb128 0x4d
	.uleb128 0x1f
	.byte	0x5
	.uleb128 0x4e
	.uleb128 0x1e
	.byte	0x5
	.uleb128 0x4f
	.uleb128 0x1d
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0x6
	.uleb128 0x49
	.byte	0x6
	.uleb128 0x48
	.byte	0x6
	.uleb128 0x4e
	.byte	0x6
	.uleb128 0x4f
	.byte	0x6
	.uleb128 0x4c
	.byte	0x6
	.uleb128 0x4d
	.byte	0x6
	.uleb128 0x4a
	.byte	0x6
	.uleb128 0x4b
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE1:
	.ident	"GCC: (Homebrew GCC 14.2.0_1) 14.2.0"
	.subsections_via_symbols
