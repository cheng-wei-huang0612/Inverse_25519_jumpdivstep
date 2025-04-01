	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 2
	.globl	_linear_comb                    ; -- Begin function linear_comb
	.p2align	2
_linear_comb:                           ; @linear_comb
	.cfi_startproc
; %bb.0:
Lloh0:
	adrp	x0, l_str@PAGE
Lloh1:
	add	x0, x0, l_str@PAGEOFF
	b	_puts
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_str:                                  ; @str
	.asciz	"the linear_comb function is executed!"

.subsections_via_symbols
