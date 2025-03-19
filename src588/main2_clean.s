	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 2
	.globl	_cpt_inv                        ; -- Begin function cpt_inv
	.p2align	2
_cpt_inv:                               ; @cpt_inv
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #1408
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	str	x0, [sp, #848]
	str	x1, [sp, #840]
	str	wzr, [sp, #800]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #800]
	subs	w8, w8, #9
	cset	w8, ge
	tbnz	w8, #0, LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldrsw	x9, [sp, #800]
	adrp	x8, _P@GOTPAGE
	ldr	x8, [x8, _P@GOTPAGEOFF]
	ldr	w8, [x8, x9, lsl #2]
	ldrsw	x10, [sp, #800]
	add	x9, sp, #804
	str	w8, [x9, x10, lsl #2]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #800]
	add	w8, w8, #1
	str	w8, [sp, #800]
	b	LBB0_1
LBB0_4:
	ldr	x1, [sp, #848]
	add	x0, sp, #764
	bl	_uint256_to_big30_9
	mov	x8, #1                          ; =0x1
	str	x8, [sp, #752]
	str	xzr, [sp, #704]
	b	LBB0_5
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #704]
	subs	x8, x8, #9
	cset	w8, hs
	tbnz	w8, #0, LBB0_8
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_5 Depth=1
	ldr	x10, [sp, #704]
	add	x9, sp, #716
	mov	w8, #0                          ; =0x0
	str	w8, [x9, x10, lsl #2]
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_5 Depth=1
	ldr	x8, [sp, #704]
	add	x8, x8, #1
	str	x8, [sp, #704]
	b	LBB0_5
LBB0_8:
	str	xzr, [sp, #656]
	b	LBB0_9
LBB0_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #656]
	subs	x8, x8, #9
	cset	w8, hs
	tbnz	w8, #0, LBB0_12
	b	LBB0_10
LBB0_10:                                ;   in Loop: Header=BB0_9 Depth=1
	ldr	x10, [sp, #656]
	add	x9, sp, #668
	mov	w8, #0                          ; =0x0
	str	w8, [x9, x10, lsl #2]
	b	LBB0_11
LBB0_11:                                ;   in Loop: Header=BB0_9 Depth=1
	ldr	x8, [sp, #656]
	add	x8, x8, #1
	str	x8, [sp, #656]
	b	LBB0_9
LBB0_12:
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #668]
	str	wzr, [sp, #460]
	b	LBB0_13
LBB0_13:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_15 Depth 2
                                        ;       Child Loop BB0_17 Depth 3
	ldr	w8, [sp, #460]
	subs	w8, w8, #10
	cset	w8, ge
	tbnz	w8, #0, LBB0_24
	b	LBB0_14
LBB0_14:                                ;   in Loop: Header=BB0_13 Depth=1
	ldr	w8, [sp, #808]
                                        ; kill: def $x8 killed $w8
	str	x8, [sp, #648]
	ldr	w8, [sp, #768]
                                        ; kill: def $x8 killed $w8
	str	x8, [sp, #640]
	ldr	x8, [sp, #648]
	lsl	x8, x8, #30
	str	x8, [sp, #648]
	ldr	x8, [sp, #640]
	lsl	x8, x8, #30
	str	x8, [sp, #640]
	ldr	x8, [sp, #648]
	ldr	w9, [sp, #804]
                                        ; kill: def $x9 killed $w9
	add	x8, x8, x9
	str	x8, [sp, #648]
	ldr	x8, [sp, #640]
	ldr	w9, [sp, #764]
                                        ; kill: def $x9 killed $w9
	add	x8, x8, x9
	str	x8, [sp, #640]
	mov	x8, #1                          ; =0x1
	str	x8, [sp, #632]
	str	xzr, [sp, #624]
	str	xzr, [sp, #616]
	str	x8, [sp, #608]
	str	wzr, [sp, #456]
	b	LBB0_15
LBB0_15:                                ;   Parent Loop BB0_13 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_17 Depth 3
	ldr	w8, [sp, #456]
	subs	w8, w8, #3
	cset	w8, ge
	tbnz	w8, #0, LBB0_22
	b	LBB0_16
LBB0_16:                                ;   in Loop: Header=BB0_15 Depth=2
	ldr	x8, [sp, #648]
	and	x8, x8, #0xfffff
	mov	x9, #2199023255552              ; =0x20000000000
	subs	x8, x8, x9
	str	x8, [sp, #568]
	ldr	x8, [sp, #640]
	and	x8, x8, #0xfffff
	mov	x9, #4611686018427387904        ; =0x4000000000000000
	subs	x8, x8, x9
	str	x8, [sp, #560]
	str	wzr, [sp, #452]
	b	LBB0_17
LBB0_17:                                ;   Parent Loop BB0_13 Depth=1
                                        ;     Parent Loop BB0_15 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w8, [sp, #452]
	subs	w8, w8, #20
	cset	w8, ge
	tbnz	w8, #0, LBB0_20
	b	LBB0_18
LBB0_18:                                ;   in Loop: Header=BB0_17 Depth=3
	ldr	x8, [sp, #560]
	and	x8, x8, #0x1
	str	x8, [sp, #552]
	ldr	x8, [sp, #752]
	subs	x9, x8, #1
	ldr	x8, [sp, #552]
	bic	x8, x8, x9, asr #63
	str	x8, [sp, #512]
	ldr	x9, [sp, #512]
	mov	x8, #0                          ; =0x0
	subs	x9, x8, x9
	str	x9, [sp, #504]
	ldr	x9, [sp, #504]
	mvn	x9, x9
	str	x9, [sp, #496]
	ldr	x9, [sp, #568]
	subs	x9, x8, x9
	str	x9, [sp, #488]
	ldr	x9, [sp, #496]
	ldr	x10, [sp, #568]
	and	x9, x9, x10
	ldr	x10, [sp, #504]
	ldr	x11, [sp, #560]
	and	x10, x10, x11
	eor	x9, x9, x10
	str	x9, [sp, #480]
	ldr	x9, [sp, #504]
	ldr	x10, [sp, #488]
	and	x9, x9, x10
	ldr	x10, [sp, #496]
	ldr	x11, [sp, #560]
	and	x10, x10, x11
	eor	x9, x9, x10
	str	x9, [sp, #472]
	ldr	x9, [sp, #480]
	str	x9, [sp, #568]
	ldr	x9, [sp, #472]
	str	x9, [sp, #560]
	ldr	x9, [sp, #752]
	ldr	x10, [sp, #752]
	subs	x10, x8, x10
	eor	x9, x9, x10
	str	x9, [sp, #464]
	ldr	x9, [sp, #752]
	ldr	x10, [sp, #504]
	ldr	x11, [sp, #464]
	and	x10, x10, x11
	eor	x9, x9, x10
	str	x9, [sp, #752]
	ldr	x9, [sp, #552]
	subs	x8, x8, x9
	ldr	x9, [sp, #568]
	and	x8, x8, x9
	ldr	x9, [sp, #560]
	add	x8, x8, x9
	asr	x8, x8, #1
	str	x8, [sp, #560]
	ldr	x8, [sp, #752]
	add	x8, x8, #2
	str	x8, [sp, #752]
	b	LBB0_19
LBB0_19:                                ;   in Loop: Header=BB0_17 Depth=3
	ldr	w8, [sp, #452]
	add	w8, w8, #1
	str	w8, [sp, #452]
	b	LBB0_17
LBB0_20:                                ;   in Loop: Header=BB0_15 Depth=2
	ldr	x8, [sp, #568]
	add	x8, x8, #256, lsl #12           ; =1048576
	mov	x9, #2199023255552              ; =0x20000000000
	add	x8, x8, x9
	str	x8, [sp, #536]
	ldr	x8, [sp, #536]
	asr	x8, x8, #42
	str	x8, [sp, #536]
	ldr	x8, [sp, #568]
	add	x8, x8, #256, lsl #12           ; =1048576
	str	x8, [sp, #544]
	ldr	x8, [sp, #544]
	lsl	x8, x8, #22
	str	x8, [sp, #544]
	ldr	x8, [sp, #544]
	asr	x8, x8, #43
	str	x8, [sp, #544]
	ldr	x8, [sp, #560]
	add	x8, x8, #256, lsl #12           ; =1048576
	add	x8, x8, x9
	str	x8, [sp, #520]
	ldr	x8, [sp, #520]
	asr	x8, x8, #42
	str	x8, [sp, #520]
	ldr	x8, [sp, #560]
	add	x8, x8, #256, lsl #12           ; =1048576
	str	x8, [sp, #528]
	ldr	x8, [sp, #528]
	lsl	x8, x8, #22
	str	x8, [sp, #528]
	ldr	x8, [sp, #528]
	asr	x8, x8, #43
	str	x8, [sp, #528]
	sub	x0, x29, #56
	str	x0, [sp, #376]                  ; 8-byte Folded Spill
	bl	___gmpz_init
	sub	x0, x29, #88
	str	x0, [sp, #384]                  ; 8-byte Folded Spill
	bl	___gmpz_init
	sub	x0, x29, #168
	str	x0, [sp, #392]                  ; 8-byte Folded Spill
	bl	___gmpz_init
	ldr	x1, [sp, #648]
	sub	x0, x29, #40
	str	x0, [sp, #432]                  ; 8-byte Folded Spill
	bl	___gmpz_init_set_si
	ldr	x1, [sp, #640]
	sub	x0, x29, #72
	str	x0, [sp, #368]                  ; 8-byte Folded Spill
	bl	___gmpz_init_set_si
	ldr	x1, [sp, #544]
	sub	x0, x29, #104
	str	x0, [sp, #400]                  ; 8-byte Folded Spill
	bl	___gmpz_init_set_si
	ldr	x1, [sp, #536]
	sub	x0, x29, #120
	str	x0, [sp, #408]                  ; 8-byte Folded Spill
	bl	___gmpz_init_set_si
	ldr	x1, [sp, #528]
	sub	x0, x29, #136
	str	x0, [sp, #416]                  ; 8-byte Folded Spill
	bl	___gmpz_init_set_si
	ldr	x1, [sp, #520]
	sub	x0, x29, #152
	str	x0, [sp, #424]                  ; 8-byte Folded Spill
	bl	___gmpz_init_set_si
	ldr	x0, [sp, #392]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #400]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #432]                  ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x2, [sp, #368]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #392]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #408]                  ; 8-byte Folded Reload
	bl	___gmpz_addmul
	ldr	x0, [sp, #376]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #392]                  ; 8-byte Folded Reload
	mov	x2, #20                         ; =0x14
	str	x2, [sp, #360]                  ; 8-byte Folded Spill
	bl	___gmpz_fdiv_q_2exp
	ldr	x0, [sp, #392]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #416]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #432]                  ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x2, [sp, #368]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #392]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #424]                  ; 8-byte Folded Reload
	bl	___gmpz_addmul
	ldr	x2, [sp, #360]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #384]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #392]                  ; 8-byte Folded Reload
	bl	___gmpz_fdiv_q_2exp
	ldr	x0, [sp, #376]                  ; 8-byte Folded Reload
	bl	___gmpz_get_si
	mov	x8, x0
	ldr	x0, [sp, #384]                  ; 8-byte Folded Reload
	str	x8, [sp, #648]
	bl	___gmpz_get_si
	ldr	x16, [sp, #368]                 ; 8-byte Folded Reload
	ldr	x15, [sp, #376]                 ; 8-byte Folded Reload
	ldr	x14, [sp, #384]                 ; 8-byte Folded Reload
	ldr	x13, [sp, #392]                 ; 8-byte Folded Reload
	ldr	x12, [sp, #400]                 ; 8-byte Folded Reload
	ldr	x11, [sp, #408]                 ; 8-byte Folded Reload
	ldr	x10, [sp, #416]                 ; 8-byte Folded Reload
	ldr	x9, [sp, #424]                  ; 8-byte Folded Reload
	mov	x8, x0
	ldr	x0, [sp, #432]                  ; 8-byte Folded Reload
	str	x8, [sp, #640]
	mov	x8, sp
	str	x8, [sp, #440]                  ; 8-byte Folded Spill
	str	x16, [x8]
	str	x15, [x8, #8]
	str	x14, [x8, #16]
	str	x13, [x8, #24]
	str	x12, [x8, #32]
	str	x11, [x8, #40]
	str	x10, [x8, #48]
	str	x9, [x8, #56]
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8, #64]
	bl	___gmpz_clears
	ldr	x8, [sp, #544]
	ldr	x9, [sp, #632]
	mul	x8, x8, x9
	ldr	x9, [sp, #536]
	ldr	x10, [sp, #616]
	mul	x9, x9, x10
	add	x8, x8, x9
	str	x8, [sp, #600]
	ldr	x8, [sp, #528]
	ldr	x9, [sp, #632]
	mul	x8, x8, x9
	ldr	x9, [sp, #520]
	ldr	x10, [sp, #616]
	mul	x9, x9, x10
	add	x8, x8, x9
	str	x8, [sp, #584]
	ldr	x8, [sp, #544]
	ldr	x9, [sp, #624]
	mul	x8, x8, x9
	ldr	x9, [sp, #536]
	ldr	x10, [sp, #608]
	mul	x9, x9, x10
	add	x8, x8, x9
	str	x8, [sp, #592]
	ldr	x8, [sp, #528]
	ldr	x9, [sp, #624]
	mul	x8, x8, x9
	ldr	x9, [sp, #520]
	ldr	x10, [sp, #608]
	mul	x9, x9, x10
	add	x8, x8, x9
	str	x8, [sp, #576]
	ldr	x8, [sp, #600]
	str	x8, [sp, #632]
	ldr	x8, [sp, #584]
	str	x8, [sp, #616]
	ldr	x8, [sp, #592]
	str	x8, [sp, #624]
	ldr	x8, [sp, #576]
	str	x8, [sp, #608]
	b	LBB0_21
LBB0_21:                                ;   in Loop: Header=BB0_15 Depth=2
	ldr	w8, [sp, #456]
	add	w8, w8, #1
	str	w8, [sp, #456]
	b	LBB0_15
LBB0_22:                                ;   in Loop: Header=BB0_13 Depth=1
	mov	x8, sp
	str	x8, [sp, #128]                  ; 8-byte Folded Spill
	sub	x9, x29, #200
	str	x9, [sp, #168]                  ; 8-byte Folded Spill
	str	x9, [x8]
	sub	x9, x29, #216
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	str	x9, [x8, #8]
	sub	x9, x29, #232
	str	x9, [sp, #176]                  ; 8-byte Folded Spill
	str	x9, [x8, #16]
	sub	x9, x29, #248
	str	x9, [sp, #192]                  ; 8-byte Folded Spill
	str	x9, [x8, #24]
	add	x9, sp, #1160
	str	x9, [sp, #200]                  ; 8-byte Folded Spill
	str	x9, [x8, #32]
	add	x9, sp, #1144
	str	x9, [sp, #208]                  ; 8-byte Folded Spill
	str	x9, [x8, #40]
	add	x9, sp, #1128
	str	x9, [sp, #216]                  ; 8-byte Folded Spill
	str	x9, [x8, #48]
	add	x9, sp, #1112
	str	x9, [sp, #184]                  ; 8-byte Folded Spill
	str	x9, [x8, #56]
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8, #64]
	sub	x0, x29, #184
	str	x0, [sp, #224]                  ; 8-byte Folded Spill
	bl	___gmpz_inits
	ldr	x0, [sp, #224]                  ; 8-byte Folded Reload
	add	x1, sp, #804
	str	x1, [sp, #144]                  ; 8-byte Folded Spill
	bl	_mpz_t_from_big30_9_t
	ldr	x0, [sp, #160]                  ; 8-byte Folded Reload
	add	x1, sp, #764
	str	x1, [sp, #152]                  ; 8-byte Folded Spill
	bl	_mpz_t_from_big30_9_t
	ldr	x0, [sp, #192]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #632]
	bl	___gmpz_set_si
	ldr	x0, [sp, #200]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #624]
	bl	___gmpz_set_si
	ldr	x0, [sp, #208]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #616]
	bl	___gmpz_set_si
	ldr	x0, [sp, #216]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #608]
	bl	___gmpz_set_si
	ldr	x0, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #192]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #224]                  ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x2, [sp, #160]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #200]                  ; 8-byte Folded Reload
	bl	___gmpz_addmul
	ldr	x0, [sp, #168]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #184]                  ; 8-byte Folded Reload
	mov	x2, #60                         ; =0x3c
	str	x2, [sp, #136]                  ; 8-byte Folded Spill
	bl	___gmpz_fdiv_q_2exp
	ldr	x0, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #208]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #224]                  ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x2, [sp, #160]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #216]                  ; 8-byte Folded Reload
	bl	___gmpz_addmul
	ldr	x2, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #176]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #184]                  ; 8-byte Folded Reload
	bl	___gmpz_fdiv_q_2exp
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #168]                  ; 8-byte Folded Reload
	bl	_big30_9_t_from_mpz_t
	ldr	x0, [sp, #152]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #176]                  ; 8-byte Folded Reload
	bl	_big30_9_t_from_mpz_t
	ldr	x16, [sp, #160]                 ; 8-byte Folded Reload
	ldr	x15, [sp, #168]                 ; 8-byte Folded Reload
	ldr	x14, [sp, #176]                 ; 8-byte Folded Reload
	ldr	x13, [sp, #184]                 ; 8-byte Folded Reload
	ldr	x12, [sp, #192]                 ; 8-byte Folded Reload
	ldr	x11, [sp, #200]                 ; 8-byte Folded Reload
	ldr	x10, [sp, #208]                 ; 8-byte Folded Reload
	ldr	x9, [sp, #216]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #224]                  ; 8-byte Folded Reload
	mov	x8, sp
	str	x8, [sp, #232]                  ; 8-byte Folded Spill
	str	x16, [x8]
	str	x15, [x8, #8]
	str	x14, [x8, #16]
	str	x13, [x8, #24]
	str	x12, [x8, #32]
	str	x11, [x8, #40]
	str	x10, [x8, #48]
	str	x9, [x8, #56]
	str	xzr, [x8, #64]
	bl	___gmpz_clears
	mov	x8, sp
	str	x8, [sp, #240]                  ; 8-byte Folded Spill
	add	x9, sp, #1080
	str	x9, [sp, #272]                  ; 8-byte Folded Spill
	str	x9, [x8]
	add	x9, sp, #1064
	str	x9, [sp, #264]                  ; 8-byte Folded Spill
	str	x9, [x8, #8]
	add	x9, sp, #1048
	str	x9, [sp, #280]                  ; 8-byte Folded Spill
	str	x9, [x8, #16]
	add	x9, sp, #1032
	str	x9, [sp, #304]                  ; 8-byte Folded Spill
	str	x9, [x8, #24]
	add	x9, sp, #1016
	str	x9, [sp, #312]                  ; 8-byte Folded Spill
	str	x9, [x8, #32]
	add	x9, sp, #1000
	str	x9, [sp, #320]                  ; 8-byte Folded Spill
	str	x9, [x8, #40]
	add	x9, sp, #984
	str	x9, [sp, #328]                  ; 8-byte Folded Spill
	str	x9, [x8, #48]
	str	xzr, [x8, #56]
	add	x0, sp, #1096
	str	x0, [sp, #344]                  ; 8-byte Folded Spill
	bl	___gmpz_inits
	add	x0, sp, #968
	str	x0, [sp, #336]                  ; 8-byte Folded Spill
	bl	___gmpz_init
	ldr	x0, [sp, #336]                  ; 8-byte Folded Reload
	adrp	x1, _P@GOTPAGE
	ldr	x1, [x1, _P@GOTPAGEOFF]
	bl	_mpz_t_from_big30_9_t
	mov	x8, sp
	add	x9, sp, #936
	str	x9, [sp, #296]                  ; 8-byte Folded Spill
	str	x9, [x8]
	str	xzr, [x8, #8]
	add	x0, sp, #952
	str	x0, [sp, #288]                  ; 8-byte Folded Spill
	bl	___gmpz_inits
	ldr	x0, [sp, #344]                  ; 8-byte Folded Reload
	add	x1, sp, #716
	str	x1, [sp, #248]                  ; 8-byte Folded Spill
	bl	_mpz_t_from_big30_9_t
	ldr	x0, [sp, #264]                  ; 8-byte Folded Reload
	add	x1, sp, #668
	str	x1, [sp, #256]                  ; 8-byte Folded Spill
	bl	_mpz_t_from_big30_9_t
	ldr	x0, [sp, #304]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #632]
	bl	___gmpz_set_si
	ldr	x0, [sp, #312]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #624]
	bl	___gmpz_set_si
	ldr	x0, [sp, #320]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #616]
	bl	___gmpz_set_si
	ldr	x0, [sp, #328]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #608]
	bl	___gmpz_set_si
	ldr	x0, [sp, #288]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #304]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #344]                  ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x1, [sp, #288]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #336]                  ; 8-byte Folded Reload
	mov	x0, x1
	bl	___gmpz_mod
	ldr	x2, [sp, #264]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #296]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #312]                  ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x1, [sp, #296]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #336]                  ; 8-byte Folded Reload
	mov	x0, x1
	bl	___gmpz_mod
	ldr	x1, [sp, #288]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #296]                  ; 8-byte Folded Reload
	mov	x0, x1
	bl	___gmpz_add
	ldr	x0, [sp, #272]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #288]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #336]                  ; 8-byte Folded Reload
	bl	___gmpz_mod
	ldr	x0, [sp, #288]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #320]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #344]                  ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x1, [sp, #288]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #336]                  ; 8-byte Folded Reload
	mov	x0, x1
	bl	___gmpz_mod
	ldr	x2, [sp, #264]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #296]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #328]                  ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x1, [sp, #296]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #336]                  ; 8-byte Folded Reload
	mov	x0, x1
	bl	___gmpz_mod
	ldr	x1, [sp, #288]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #296]                  ; 8-byte Folded Reload
	mov	x0, x1
	bl	___gmpz_add
	ldr	x0, [sp, #280]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #288]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #336]                  ; 8-byte Folded Reload
	bl	___gmpz_mod
	ldr	x0, [sp, #248]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #272]                  ; 8-byte Folded Reload
	bl	_big30_9_t_from_mpz_t
	ldr	x0, [sp, #256]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #280]                  ; 8-byte Folded Reload
	bl	_big30_9_t_from_mpz_t
	ldr	x1, [sp, #264]                  ; 8-byte Folded Reload
	ldr	x17, [sp, #272]                 ; 8-byte Folded Reload
	ldr	x16, [sp, #280]                 ; 8-byte Folded Reload
	ldr	x15, [sp, #288]                 ; 8-byte Folded Reload
	ldr	x14, [sp, #296]                 ; 8-byte Folded Reload
	ldr	x13, [sp, #304]                 ; 8-byte Folded Reload
	ldr	x12, [sp, #312]                 ; 8-byte Folded Reload
	ldr	x11, [sp, #320]                 ; 8-byte Folded Reload
	ldr	x10, [sp, #328]                 ; 8-byte Folded Reload
	ldr	x9, [sp, #336]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #344]                  ; 8-byte Folded Reload
	mov	x8, sp
	str	x8, [sp, #352]                  ; 8-byte Folded Spill
	str	x1, [x8]
	str	x17, [x8, #8]
	str	x16, [x8, #16]
	str	x15, [x8, #24]
	str	x14, [x8, #32]
	str	x13, [x8, #40]
	str	x12, [x8, #48]
	str	x11, [x8, #56]
	str	x10, [x8, #64]
	str	x9, [x8, #72]
	str	xzr, [x8, #80]
	bl	___gmpz_clears
	b	LBB0_23
LBB0_23:                                ;   in Loop: Header=BB0_13 Depth=1
	ldr	w8, [sp, #460]
	add	w8, w8, #1
	str	w8, [sp, #460]
	b	LBB0_13
LBB0_24:
	mov	x8, sp
	add	x9, sp, #904
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	str	x9, [x8]
	add	x9, sp, #888
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	str	x9, [x8, #8]
	add	x9, sp, #872
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	str	x9, [x8, #16]
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8, #24]
	add	x0, sp, #920
	str	x0, [sp, #120]                  ; 8-byte Folded Spill
	bl	___gmpz_inits
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	add	x1, sp, #716
	bl	_mpz_t_from_big30_9_t
	ldr	x0, [sp, #96]                   ; 8-byte Folded Reload
	adrp	x1, _inv600@GOTPAGE
	ldr	x1, [x1, _inv600@GOTPAGEOFF]
	bl	_mpz_t_from_big30_9_t
	ldr	x0, [sp, #112]                  ; 8-byte Folded Reload
	adrp	x1, _P@GOTPAGE
	ldr	x1, [x1, _P@GOTPAGEOFF]
	bl	_mpz_t_from_big30_9_t
	ldr	x1, [sp, #88]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x2, [sp, #112]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #120]                  ; 8-byte Folded Reload
	mov	x0, x1
	bl	___gmpz_mod
	ldr	w8, [sp, #804]
	str	w8, [sp, #448]
	ldr	w8, [sp, #448]
	lsl	w8, w8, #2
	str	w8, [sp, #448]
	ldr	w8, [sp, #448]
	asr	w8, w8, #2
	str	w8, [sp, #448]
	ldrsw	x1, [sp, #448]
	add	x0, sp, #856
	str	x0, [sp, #104]                  ; 8-byte Folded Spill
	bl	___gmpz_init_set_si
	ldr	x2, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #120]                  ; 8-byte Folded Reload
	mov	x0, x1
	bl	___gmpz_mul
	ldr	x2, [sp, #112]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #120]                  ; 8-byte Folded Reload
	mov	x0, x1
	bl	___gmpz_mod
	ldr	x1, [sp, #120]                  ; 8-byte Folded Reload
	ldr	x0, [sp, #840]
	bl	_uint256_t_from_mpz_t
	ldur	x9, [x29, #-24]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB0_26
	b	LBB0_25
LBB0_25:
	bl	___stack_chk_fail
LBB0_26:
	add	sp, sp, #1408
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #272
	stp	x28, x27, [sp, #240]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #256]            ; 16-byte Folded Spill
	add	x29, sp, #256
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	stur	wzr, [x29, #-92]
	mov	x0, #0                          ; =0x0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	sub	x0, x29, #40
	str	x0, [sp, #80]                   ; 8-byte Folded Spill
	bl	___gmpz_init
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	adrp	x1, _P@GOTPAGE
	ldr	x1, [x1, _P@GOTPAGEOFF]
	bl	_mpz_t_from_big30_9_t
	mov	w8, #34464                      ; =0x86a0
	movk	w8, #1, lsl #16
	stur	w8, [x29, #-96]
	stur	wzr, [x29, #-100]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-100]
	mov	w9, #34464                      ; =0x86a0
	movk	w9, #1, lsl #16
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB1_7
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	add	x0, sp, #120
	str	x0, [sp, #40]                   ; 8-byte Folded Spill
	bl	_random_uint256_t
	sub	x0, x29, #56
	str	x0, [sp, #56]                   ; 8-byte Folded Spill
	bl	___gmpz_init
	ldr	x1, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #56]                   ; 8-byte Folded Reload
	bl	_mpz_t_from_uint256_t
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	___gmp_printf
	ldr	x1, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	bl	_uint256_t_from_mpz_t
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	add	x1, sp, #88
	str	x1, [sp, #48]                   ; 8-byte Folded Spill
	bl	_cpt_inv
	sub	x0, x29, #72
	str	x0, [sp, #64]                   ; 8-byte Folded Spill
	bl	___gmpz_init
	ldr	x1, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	bl	_mpz_t_from_uint256_t
	sub	x0, x29, #88
	str	x0, [sp, #72]                   ; 8-byte Folded Spill
	bl	___gmpz_init
	ldr	x1, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #64]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	bl	___gmpz_mul
	ldr	x1, [sp, #72]                   ; 8-byte Folded Reload
	mov	x0, x1
	sub	x2, x29, #40
	bl	___gmpz_mod
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	mov	x1, #1                          ; =0x1
	bl	___gmpz_cmp_ui
	subs	w8, w0, #0
	cset	w8, eq
	tbnz	w8, #0, LBB1_4
	b	LBB1_3
LBB1_3:
	ldur	w9, [x29, #-100]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	sub	x8, x29, #56
	str	x8, [x9, #8]
	sub	x8, x29, #72
	str	x8, [x9, #16]
	sub	x8, x29, #88
	str	x8, [x9, #24]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	___gmp_printf
	mov	w8, #1                          ; =0x1
	stur	w8, [x29, #-92]
	b	LBB1_8
LBB1_4:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	w9, [x29, #-100]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	sub	x8, x29, #56
	str	x8, [x9, #8]
	sub	x8, x29, #72
	str	x8, [x9, #16]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	___gmp_printf
	b	LBB1_5
LBB1_5:                                 ;   in Loop: Header=BB1_1 Depth=1
	sub	x0, x29, #88
	bl	___gmpz_clear
	sub	x0, x29, #72
	bl	___gmpz_clear
	sub	x0, x29, #56
	bl	___gmpz_clear
	b	LBB1_6
LBB1_6:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	w8, [x29, #-100]
	add	w8, w8, #1
	stur	w8, [x29, #-100]
	b	LBB1_1
LBB1_7:
	sub	x0, x29, #40
	bl	___gmpz_clear
	stur	wzr, [x29, #-92]
	b	LBB1_8
LBB1_8:
	ldur	w8, [x29, #-92]
	str	w8, [sp, #36]                   ; 4-byte Folded Spill
	ldur	x9, [x29, #-24]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB1_10
	b	LBB1_9
LBB1_9:
	bl	___stack_chk_fail
LBB1_10:
	ldr	w0, [sp, #36]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #256]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #240]            ; 16-byte Folded Reload
	add	sp, sp, #272
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function random_uint256_t
_random_uint256_t:                      ; @random_uint256_t
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	wzr, [x29, #-12]
	b	LBB2_1
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-12]
	subs	w8, w8, #4
	cset	w8, ge
	tbnz	w8, #0, LBB2_4
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	bl	_rand
	and	w9, w0, #0xffff
                                        ; implicit-def: $x8
	mov	x8, x9
	sxtw	x8, w8
	str	x8, [sp]                        ; 8-byte Folded Spill
	bl	_rand
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	and	w10, w0, #0xffff
                                        ; implicit-def: $x8
	mov	x8, x10
	sxtw	x8, w8
	orr	x8, x8, x9, lsl #16
	str	x8, [sp, #24]
	bl	_rand
	and	w9, w0, #0xffff
                                        ; implicit-def: $x8
	mov	x8, x9
	sxtw	x8, w8
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	_rand
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	and	w10, w0, #0xffff
                                        ; implicit-def: $x8
	mov	x8, x10
	sxtw	x8, w8
	orr	x8, x8, x9, lsl #16
	str	x8, [sp, #16]
	ldr	x9, [sp, #16]
	ldr	x8, [sp, #24]
	eor	x8, x8, x9, lsl #32
	ldur	x9, [x29, #-8]
	ldursw	x10, [x29, #-12]
	str	x8, [x9, x10, lsl #3]
	b	LBB2_3
LBB2_3:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldur	w8, [x29, #-12]
	add	w8, w8, #1
	stur	w8, [x29, #-12]
	b	LBB2_1
LBB2_4:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"mpX = %Zd\n"

l_.str.1:                               ; @.str.1
	.asciz	"Test %d FAILED:\n  x       = %Zd\n  inv(x)  = %Zd\n  product = %Zd (mod P, should be 1)\n"

l_.str.2:                               ; @.str.2
	.asciz	"Test %d passed. \nx = %Zd\nv = %Zd\n\n"

.subsections_via_symbols
