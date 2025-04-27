
# qhasm: int64 input_0

# qhasm: int64 input_1

# qhasm: int64 input_2

# qhasm: int64 input_3

# qhasm: int64 input_4

# qhasm: int64 input_5

# qhasm: stack64 input_6

# qhasm: stack64 input_7

# qhasm: int64 caller_r11

# qhasm: int64 caller_r12

# qhasm: int64 caller_r13

# qhasm: int64 caller_r14

# qhasm: int64 caller_r15

# qhasm: int64 caller_rbx

# qhasm: int64 caller_rbp

# qhasm: const64 const_38=38	
.p2align 5
const_38: .quad 38

# qhasm: int64 r0

# qhasm: int64 r1

# qhasm: int64 r2

# qhasm: int64 r3

# qhasm: int64 mulzero

# qhasm: int64 muli38

# qhasm: int64 mulx0

# qhasm: int64 mulx1

# qhasm: int64 mulx2

# qhasm: int64 mulx3

# qhasm: int64 mulx4

# qhasm: stack64 caller_r11_stack

# qhasm: stack64 caller_r12_stack

# qhasm: stack64 caller_r13_stack

# qhasm: stack64 caller_r14_stack

# qhasm: stack64 caller_r15_stack

# qhasm: stack64 caller_rbp_stack

# qhasm: stack64 caller_rbx_stack

# qhasm: stack64 input_0_save

# qhasm: stack64 input_1_save

# qhasm: stack64 input_2_save

# qhasm: enter fpadd25519
.p2align 5
.global _fpadd25519
.global fpadd25519
_fpadd25519:
fpadd25519:
mov %rsp,%r11
and $31,%r11
add $64,%r11
sub %r11,%rsp

# qhasm: caller_r11_stack = caller_r11
# asm 1: movq <caller_r11=int64#9,>caller_r11_stack=stack64#1
# asm 2: movq <caller_r11=%r11,>caller_r11_stack=0(%rsp)
movq %r11,0(%rsp)

# qhasm: caller_r12_stack = caller_r12
# asm 1: movq <caller_r12=int64#10,>caller_r12_stack=stack64#2
# asm 2: movq <caller_r12=%r12,>caller_r12_stack=8(%rsp)
movq %r12,8(%rsp)

# qhasm: caller_r13_stack = caller_r13
# asm 1: movq <caller_r13=int64#11,>caller_r13_stack=stack64#3
# asm 2: movq <caller_r13=%r13,>caller_r13_stack=16(%rsp)
movq %r13,16(%rsp)

# qhasm: caller_r14_stack = caller_r14
# asm 1: movq <caller_r14=int64#12,>caller_r14_stack=stack64#4
# asm 2: movq <caller_r14=%r14,>caller_r14_stack=24(%rsp)
movq %r14,24(%rsp)

# qhasm: caller_r15_stack = caller_r15
# asm 1: movq <caller_r15=int64#13,>caller_r15_stack=stack64#5
# asm 2: movq <caller_r15=%r15,>caller_r15_stack=32(%rsp)
movq %r15,32(%rsp)

# qhasm: caller_rbx_stack = caller_rbx
# asm 1: movq <caller_rbx=int64#14,>caller_rbx_stack=stack64#6
# asm 2: movq <caller_rbx=%rbx,>caller_rbx_stack=40(%rsp)
movq %rbx,40(%rsp)

# qhasm: caller_rbp_stack = caller_rbp
# asm 1: movq <caller_rbp=int64#15,>caller_rbp_stack=stack64#7
# asm 2: movq <caller_rbp=%rbp,>caller_rbp_stack=48(%rsp)
movq %rbp,48(%rsp)

# qhasm: input_2_save = input_2
# asm 1: movq <input_2=int64#3,>input_2_save=stack64#8
# asm 2: movq <input_2=%rdx,>input_2_save=56(%rsp)
movq %rdx,56(%rsp)

# qhasm: r0 = mem64[ input_0 + 0 ]
# asm 1: movq   0(<input_0=int64#1),>r0=int64#3
# asm 2: movq   0(<input_0=%rdi),>r0=%rdx
movq   0(%rdi),%rdx

# qhasm: r1 = mem64[ input_0 + 8 ]
# asm 1: movq   8(<input_0=int64#1),>r1=int64#4
# asm 2: movq   8(<input_0=%rdi),>r1=%rcx
movq   8(%rdi),%rcx

# qhasm: r2 = mem64[ input_0 +16 ]
# asm 1: movq   16(<input_0=int64#1),>r2=int64#5
# asm 2: movq   16(<input_0=%rdi),>r2=%r8
movq   16(%rdi),%r8

# qhasm: r3 = mem64[ input_0 +24 ]
# asm 1: movq   24(<input_0=int64#1),>r3=int64#1
# asm 2: movq   24(<input_0=%rdi),>r3=%rdi
movq   24(%rdi),%rdi

# qhasm: carry? r0 += mem64[ input_1 + 0]
# asm 1: addq 0(<input_1=int64#2),<r0=int64#3
# asm 2: addq 0(<input_1=%rsi),<r0=%rdx
addq 0(%rsi),%rdx

# qhasm: carry? r1 += mem64[ input_1 + 8] + carry
# asm 1: adcq 8(<input_1=int64#2),<r1=int64#4
# asm 2: adcq 8(<input_1=%rsi),<r1=%rcx
adcq 8(%rsi),%rcx

# qhasm: carry? r2 += mem64[ input_1 +16] + carry
# asm 1: adcq 16(<input_1=int64#2),<r2=int64#5
# asm 2: adcq 16(<input_1=%rsi),<r2=%r8
adcq 16(%rsi),%r8

# qhasm: r3 += mem64[ input_1 +24] + carry
# asm 1: adcq 24(<input_1=int64#2),<r3=int64#1
# asm 2: adcq 24(<input_1=%rsi),<r3=%rdi
adcq 24(%rsi),%rdi

# qhasm:   mulzero = 0
# asm 1: mov  $0,>mulzero=int64#2
# asm 2: mov  $0,>mulzero=%rsi
mov  $0,%rsi

# qhasm:   muli38 = 19
# asm 1: mov  $19,>muli38=int64#6
# asm 2: mov  $19,>muli38=%r9
mov  $19,%r9

# qhasm:   carry? r3 reset bit 63 
# asm 1: btr  $63,<r3=int64#1
# asm 2: btr  $63,<r3=%rdi
btr  $63,%rdi

# qhasm:   mulzero = muli38 if carry
# asm 1: cmovc <muli38=int64#6,<mulzero=int64#2
# asm 2: cmovc <muli38=%r9,<mulzero=%rsi
cmovc %r9,%rsi

# qhasm:   carry? r0 += mulzero
# asm 1: add  <mulzero=int64#2,<r0=int64#3
# asm 2: add  <mulzero=%rsi,<r0=%rdx
add  %rsi,%rdx

# qhasm:   carry? r1 += 0 + carry
# asm 1: adc $0,<r1=int64#4
# asm 2: adc $0,<r1=%rcx
adc $0,%rcx

# qhasm:   carry? r2 += 0 + carry
# asm 1: adc $0,<r2=int64#5
# asm 2: adc $0,<r2=%r8
adc $0,%r8

# qhasm:   r3 += 0 + carry
# asm 1: adc $0,<r3=int64#1
# asm 2: adc $0,<r3=%rdi
adc $0,%rdi

# qhasm:   mulx0 = r0
# asm 1: mov  <r0=int64#3,>mulx0=int64#2
# asm 2: mov  <r0=%rdx,>mulx0=%rsi
mov  %rdx,%rsi

# qhasm:   mulx1 = r1
# asm 1: mov  <r1=int64#4,>mulx1=int64#6
# asm 2: mov  <r1=%rcx,>mulx1=%r9
mov  %rcx,%r9

# qhasm:   mulx2 = r2
# asm 1: mov  <r2=int64#5,>mulx2=int64#7
# asm 2: mov  <r2=%r8,>mulx2=%rax
mov  %r8,%rax

# qhasm:   mulx3 = r3
# asm 1: mov  <r3=int64#1,>mulx3=int64#8
# asm 2: mov  <r3=%rdi,>mulx3=%r10
mov  %rdi,%r10

# qhasm:   mulx4 = 9223372036854775807
# asm 1: mov  $9223372036854775807,>mulx4=int64#9
# asm 2: mov  $9223372036854775807,>mulx4=%r11
mov  $9223372036854775807,%r11

# qhasm:   carry? r0 -= 18446744073709551597
# asm 1: sub  $18446744073709551597,<r0=int64#3
# asm 2: sub  $18446744073709551597,<r0=%rdx
sub  $18446744073709551597,%rdx

# qhasm:   carry? r1 -= 18446744073709551615 - carry
# asm 1: sbb  $18446744073709551615,<r1=int64#4
# asm 2: sbb  $18446744073709551615,<r1=%rcx
sbb  $18446744073709551615,%rcx

# qhasm:   carry? r2 -= 18446744073709551615 - carry
# asm 1: sbb  $18446744073709551615,<r2=int64#5
# asm 2: sbb  $18446744073709551615,<r2=%r8
sbb  $18446744073709551615,%r8

# qhasm:   carry? r3 -= mulx4 - carry
# asm 1: sbb  <mulx4=int64#9,<r3=int64#1
# asm 2: sbb  <mulx4=%r11,<r3=%rdi
sbb  %r11,%rdi

# qhasm:   r0 = mulx0 if carry
# asm 1: cmovc <mulx0=int64#2,<r0=int64#3
# asm 2: cmovc <mulx0=%rsi,<r0=%rdx
cmovc %rsi,%rdx

# qhasm:   r1 = mulx1 if carry
# asm 1: cmovc <mulx1=int64#6,<r1=int64#4
# asm 2: cmovc <mulx1=%r9,<r1=%rcx
cmovc %r9,%rcx

# qhasm:   r2 = mulx2 if carry
# asm 1: cmovc <mulx2=int64#7,<r2=int64#5
# asm 2: cmovc <mulx2=%rax,<r2=%r8
cmovc %rax,%r8

# qhasm:   r3 = mulx3 if carry
# asm 1: cmovc <mulx3=int64#8,<r3=int64#1
# asm 2: cmovc <mulx3=%r10,<r3=%rdi
cmovc %r10,%rdi

# qhasm: input_2 = input_2_save
# asm 1: movq <input_2_save=stack64#8,>input_2=int64#2
# asm 2: movq <input_2_save=56(%rsp),>input_2=%rsi
movq 56(%rsp),%rsi

# qhasm: *(uint64 *)(input_2 + 8) = r1
# asm 1: movq   <r1=int64#4,8(<input_2=int64#2)
# asm 2: movq   <r1=%rcx,8(<input_2=%rsi)
movq   %rcx,8(%rsi)

# qhasm: *(uint64 *)(input_2 + 16) = r2
# asm 1: movq   <r2=int64#5,16(<input_2=int64#2)
# asm 2: movq   <r2=%r8,16(<input_2=%rsi)
movq   %r8,16(%rsi)

# qhasm: *(uint64 *)(input_2 + 24) = r3
# asm 1: movq   <r3=int64#1,24(<input_2=int64#2)
# asm 2: movq   <r3=%rdi,24(<input_2=%rsi)
movq   %rdi,24(%rsi)

# qhasm: *(uint64 *)(input_2 + 0) = r0
# asm 1: movq   <r0=int64#3,0(<input_2=int64#2)
# asm 2: movq   <r0=%rdx,0(<input_2=%rsi)
movq   %rdx,0(%rsi)

# qhasm: caller_r11 = caller_r11_stack
# asm 1: movq <caller_r11_stack=stack64#1,>caller_r11=int64#9
# asm 2: movq <caller_r11_stack=0(%rsp),>caller_r11=%r11
movq 0(%rsp),%r11

# qhasm: caller_r12 = caller_r12_stack
# asm 1: movq <caller_r12_stack=stack64#2,>caller_r12=int64#10
# asm 2: movq <caller_r12_stack=8(%rsp),>caller_r12=%r12
movq 8(%rsp),%r12

# qhasm: caller_r13 = caller_r13_stack
# asm 1: movq <caller_r13_stack=stack64#3,>caller_r13=int64#11
# asm 2: movq <caller_r13_stack=16(%rsp),>caller_r13=%r13
movq 16(%rsp),%r13

# qhasm: caller_r14 = caller_r14_stack
# asm 1: movq <caller_r14_stack=stack64#4,>caller_r14=int64#12
# asm 2: movq <caller_r14_stack=24(%rsp),>caller_r14=%r14
movq 24(%rsp),%r14

# qhasm: caller_r15 = caller_r15_stack
# asm 1: movq <caller_r15_stack=stack64#5,>caller_r15=int64#13
# asm 2: movq <caller_r15_stack=32(%rsp),>caller_r15=%r15
movq 32(%rsp),%r15

# qhasm: caller_rbx = caller_rbx_stack
# asm 1: movq <caller_rbx_stack=stack64#6,>caller_rbx=int64#14
# asm 2: movq <caller_rbx_stack=40(%rsp),>caller_rbx=%rbx
movq 40(%rsp),%rbx

# qhasm: caller_rbp = caller_rbp_stack
# asm 1: movq <caller_rbp_stack=stack64#7,>caller_rbp=int64#15
# asm 2: movq <caller_rbp_stack=48(%rsp),>caller_rbp=%rbp
movq 48(%rsp),%rbp

# qhasm: return
add %r11,%rsp
ret
