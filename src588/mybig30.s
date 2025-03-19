	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 2
	.globl	_uint256_to_big30_9             ; -- Begin function uint256_to_big30_9
	.p2align	2
_uint256_to_big30_9:                    ; @uint256_to_big30_9
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	str	x0, [sp, #48]
	str	x1, [sp, #40]
	ldr	x8, [sp, #40]
	ldr	x8, [x8]
	stur	x8, [x29, #-40]
	ldr	x8, [sp, #40]
	ldr	x8, [x8, #8]
	stur	x8, [x29, #-32]
	ldr	x8, [sp, #40]
	ldr	x8, [x8, #16]
	stur	x8, [x29, #-24]
	ldr	x8, [sp, #40]
	ldr	x8, [x8, #24]
	stur	x8, [x29, #-16]
	str	wzr, [sp, #36]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #36]
	subs	w8, w8, #9
	cset	w8, ge
	tbnz	w8, #0, LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	x8, [x29, #-40]
	and	x8, x8, #0x3fffffff
	ldr	x9, [sp, #48]
	ldrsw	x10, [sp, #36]
                                        ; kill: def $w8 killed $w8 killed $x8
	str	w8, [x9, x10, lsl #2]
	ldur	x8, [x29, #-40]
	str	x8, [sp, #24]
	ldur	x8, [x29, #-32]
	str	x8, [sp, #16]
	ldur	x8, [x29, #-24]
	str	x8, [sp, #8]
	ldur	x8, [x29, #-16]
	str	x8, [sp]
	ldr	x9, [sp, #24]
	ldr	x8, [sp, #16]
	lsl	x8, x8, #34
	orr	x8, x8, x9, lsr #30
	stur	x8, [x29, #-40]
	ldr	x9, [sp, #16]
	ldr	x8, [sp, #8]
	lsl	x8, x8, #34
	orr	x8, x8, x9, lsr #30
	stur	x8, [x29, #-32]
	ldr	x9, [sp, #8]
	ldr	x8, [sp]
	lsl	x8, x8, #34
	orr	x8, x8, x9, lsr #30
	stur	x8, [x29, #-24]
	ldr	x8, [sp]
	lsr	x8, x8, #30
	stur	x8, [x29, #-16]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #36]
	add	w8, w8, #1
	str	w8, [sp, #36]
	b	LBB0_1
LBB0_4:
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB0_6
	b	LBB0_5
LBB0_5:
	bl	___stack_chk_fail
LBB0_6:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_big30_9_to_uint256             ; -- Begin function big30_9_to_uint256
	.p2align	2
_big30_9_to_uint256:                    ; @big30_9_to_uint256
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	str	x0, [sp, #56]
	str	x1, [sp, #48]
	movi.2d	v0, #0000000000000000
	stur	q0, [x29, #-48]
	stur	q0, [x29, #-32]
	mov	w8, #8                          ; =0x8
	str	w8, [sp, #44]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #44]
	subs	w8, w8, #0
	cset	w8, lt
	tbnz	w8, #0, LBB1_4
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	x8, [x29, #-48]
	str	x8, [sp, #32]
	ldur	x8, [x29, #-40]
	str	x8, [sp, #24]
	ldur	x8, [x29, #-32]
	str	x8, [sp, #16]
	ldur	x8, [x29, #-24]
	str	x8, [sp, #8]
	ldr	x9, [sp, #8]
	ldr	x8, [sp, #16]
	lsr	x8, x8, #34
	orr	x8, x8, x9, lsl #30
	stur	x8, [x29, #-24]
	ldr	x9, [sp, #16]
	ldr	x8, [sp, #24]
	lsr	x8, x8, #34
	orr	x8, x8, x9, lsl #30
	stur	x8, [x29, #-32]
	ldr	x9, [sp, #24]
	ldr	x8, [sp, #32]
	lsr	x8, x8, #34
	orr	x8, x8, x9, lsl #30
	stur	x8, [x29, #-40]
	ldr	x8, [sp, #32]
	lsl	x8, x8, #30
	stur	x8, [x29, #-48]
	ldr	x8, [sp, #48]
	ldrsw	x9, [sp, #44]
	ldr	w8, [x8, x9, lsl #2]
                                        ; kill: def $x8 killed $w8
	and	x9, x8, #0x3fffffff
	ldur	x8, [x29, #-48]
	orr	x8, x8, x9
	stur	x8, [x29, #-48]
	b	LBB1_3
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #44]
	subs	w8, w8, #1
	str	w8, [sp, #44]
	b	LBB1_1
LBB1_4:
	ldur	x8, [x29, #-48]
	ldr	x9, [sp, #56]
	str	x8, [x9]
	ldur	x8, [x29, #-40]
	ldr	x9, [sp, #56]
	str	x8, [x9, #8]
	ldur	x8, [x29, #-32]
	ldr	x9, [sp, #56]
	str	x8, [x9, #16]
	ldur	x8, [x29, #-24]
	ldr	x9, [sp, #56]
	str	x8, [x9, #24]
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB1_6
	b	LBB1_5
LBB1_5:
	bl	___stack_chk_fail
LBB1_6:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_mpz_t_from_uint256_t           ; -- Begin function mpz_t_from_uint256_t
	.p2align	2
_mpz_t_from_uint256_t:                  ; @mpz_t_from_uint256_t
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	mov	x1, #0                          ; =0x0
	bl	___gmpz_set_ui
	mov	w8, #3                          ; =0x3
	str	w8, [sp, #12]
	b	LBB2_1
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	subs	w8, w8, #0
	cset	w8, lt
	tbnz	w8, #0, LBB2_4
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldur	x0, [x29, #-8]
	ldur	x1, [x29, #-8]
	mov	x2, #64                         ; =0x40
	bl	___gmpz_mul_2exp
	ldur	x0, [x29, #-8]
	ldur	x1, [x29, #-8]
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	ldr	x2, [x8, x9, lsl #3]
	bl	___gmpz_add_ui
	b	LBB2_3
LBB2_3:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB2_1
LBB2_4:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_uint256_t_from_mpz_t           ; -- Begin function uint256_t_from_mpz_t
	.p2align	2
_uint256_t_from_mpz_t:                  ; @uint256_t_from_mpz_t
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	str	x0, [sp, #32]
	str	x1, [sp, #24]
	ldr	x1, [sp, #24]
	sub	x0, x29, #24
	bl	___gmpz_init_set
	str	wzr, [sp, #20]
	b	LBB3_1
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #20]
	subs	w8, w8, #4
	cset	w8, ge
	tbnz	w8, #0, LBB3_4
	b	LBB3_2
LBB3_2:                                 ;   in Loop: Header=BB3_1 Depth=1
	sub	x0, x29, #24
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	___gmpz_get_ui
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [sp, #32]
	ldrsw	x9, [sp, #20]
	str	x0, [x8, x9, lsl #3]
	mov	x0, x1
	mov	x2, #64                         ; =0x40
	bl	___gmpz_tdiv_q_2exp
	b	LBB3_3
LBB3_3:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB3_1
LBB3_4:
	sub	x0, x29, #24
	bl	___gmpz_clear
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB3_6
	b	LBB3_5
LBB3_5:
	bl	___stack_chk_fail
LBB3_6:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_mpz_t_from_big30_9_t           ; -- Begin function mpz_t_from_big30_9_t
	.p2align	2
_mpz_t_from_big30_9_t:                  ; @mpz_t_from_big30_9_t
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	str	x0, [sp, #32]
	str	x1, [sp, #24]
	sub	x0, x29, #24
	bl	___gmpz_init
	ldr	x0, [sp, #32]
	ldr	x8, [sp, #24]
	ldrsw	x1, [x8, #32]
	bl	___gmpz_set_si
	mov	w8, #7                          ; =0x7
	str	w8, [sp, #20]
	b	LBB4_1
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #20]
	subs	w8, w8, #0
	cset	w8, lt
	tbnz	w8, #0, LBB4_4
	b	LBB4_2
LBB4_2:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	x0, [sp, #32]
	ldr	x1, [sp, #32]
	mov	x2, #30                         ; =0x1e
	bl	___gmpz_mul_2exp
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #20]
	ldr	w8, [x8, x9, lsl #2]
	mov	x1, x8
	sub	x0, x29, #24
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	___gmpz_set_ui
	ldr	x2, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x0, [sp, #32]
	ldr	x1, [sp, #32]
	bl	___gmpz_add
	b	LBB4_3
LBB4_3:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #20]
	subs	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB4_1
LBB4_4:
	sub	x0, x29, #24
	bl	___gmpz_clear
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB4_6
	b	LBB4_5
LBB4_5:
	bl	___stack_chk_fail
LBB4_6:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_big30_9_t_from_mpz_t           ; -- Begin function big30_9_t_from_mpz_t
	.p2align	2
_big30_9_t_from_mpz_t:                  ; @big30_9_t_from_mpz_t
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	str	x0, [sp, #48]
	str	x1, [sp, #40]
	ldr	x1, [sp, #40]
	sub	x0, x29, #24
	bl	___gmpz_init_set
	sub	x0, x29, #40
	bl	___gmpz_init
	str	wzr, [sp, #36]
	b	LBB5_1
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #36]
	subs	w8, w8, #8
	cset	w8, ge
	tbnz	w8, #0, LBB5_4
	b	LBB5_2
LBB5_2:                                 ;   in Loop: Header=BB5_1 Depth=1
	sub	x0, x29, #40
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	sub	x1, x29, #24
	str	x1, [sp, #16]                   ; 8-byte Folded Spill
	mov	x2, #30                         ; =0x1e
	str	x2, [sp, #24]                   ; 8-byte Folded Spill
	bl	___gmpz_fdiv_r_2exp
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	___gmpz_get_ui
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]
	ldrsw	x10, [sp, #36]
	mov	x8, x0
	str	w8, [x9, x10, lsl #2]
	mov	x0, x1
	bl	___gmpz_fdiv_q_2exp
	b	LBB5_3
LBB5_3:                                 ;   in Loop: Header=BB5_1 Depth=1
	ldr	w8, [sp, #36]
	add	w8, w8, #1
	str	w8, [sp, #36]
	b	LBB5_1
LBB5_4:
	sub	x0, x29, #24
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	___gmpz_get_si
	ldr	x9, [sp, #48]
	mov	x8, x0
	str	w8, [x9, #32]
	sub	x0, x29, #40
	bl	___gmpz_clear
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	___gmpz_clear
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB5_6
	b	LBB5_5
LBB5_5:
	bl	___stack_chk_fail
LBB5_6:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__data
	.globl	_P                              ; @P
	.p2align	2, 0x0
_P:
	.long	1073741805                      ; 0x3fffffed
	.long	1073741823                      ; 0x3fffffff
	.long	1073741823                      ; 0x3fffffff
	.long	1073741823                      ; 0x3fffffff
	.long	1073741823                      ; 0x3fffffff
	.long	1073741823                      ; 0x3fffffff
	.long	1073741823                      ; 0x3fffffff
	.long	1073741823                      ; 0x3fffffff
	.long	32767                           ; 0x7fff

	.globl	_inv600                         ; @inv600
	.p2align	2, 0x0
_inv600:
	.long	148717694                       ; 0x8dd407e
	.long	362871198                       ; 0x15a0f99e
	.long	1014254742                      ; 0x3c744c96
	.long	713844979                       ; 0x2a8c68f3
	.long	23794832                        ; 0x16b1490
	.long	745310520                       ; 0x2c6c8938
	.long	98310229                        ; 0x5dc1855
	.long	911248164                       ; 0x36508b24
	.long	17513                           ; 0x4469

.subsections_via_symbols
