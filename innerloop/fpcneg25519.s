
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

# qhasm: int64 p

# qhasm: int64 v0

# qhasm: int64 v1

# qhasm: int64 v2

# qhasm: int64 v3

# qhasm: int64 f3

# qhasm: int64 delta

# qhasm: int64 count

# qhasm: int64 flag

# qhasm: int64 t0

# qhasm: int64 t1

# qhasm: int64 t2

# qhasm: int64 t3

# qhasm: int64 t4

# qhasm: stack64 caller_r11_stack

# qhasm: stack64 caller_r12_stack

# qhasm: stack64 caller_r13_stack

# qhasm: stack64 caller_r14_stack

# qhasm: stack64 caller_r15_stack

# qhasm: stack64 caller_rbp_stack

# qhasm: stack64 caller_rbx_stack

# qhasm: enter fpcneg25519
.p2align 5
.global _fpcneg25519
.global fpcneg25519
_fpcneg25519:
fpcneg25519:
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

# qhasm: p = input_0
# asm 1: mov  <input_0=int64#1,>p=int64#1
# asm 2: mov  <input_0=%rdi,>p=%rdi
mov  %rdi,%rdi

# qhasm: f3 = input_1
# asm 1: mov  <input_1=int64#2,>f3=int64#2
# asm 2: mov  <input_1=%rsi,>f3=%rsi
mov  %rsi,%rsi

# qhasm: v0 = mem64[ p + 0]
# asm 1: movq   0(<p=int64#1),>v0=int64#3
# asm 2: movq   0(<p=%rdi),>v0=%rdx
movq   0(%rdi),%rdx

# qhasm: v1 = mem64[ p + 8]
# asm 1: movq   8(<p=int64#1),>v1=int64#4
# asm 2: movq   8(<p=%rdi),>v1=%rcx
movq   8(%rdi),%rcx

# qhasm: v2 = mem64[ p +16]
# asm 1: movq   16(<p=int64#1),>v2=int64#5
# asm 2: movq   16(<p=%rdi),>v2=%r8
movq   16(%rdi),%r8

# qhasm: v3 = mem64[ p +24]
# asm 1: movq   24(<p=int64#1),>v3=int64#6
# asm 2: movq   24(<p=%rdi),>v3=%r9
movq   24(%rdi),%r9

# qhasm: t0 = -38
# asm 1: mov  $-38,>t0=int64#7
# asm 2: mov  $-38,>t0=%rax
mov  $-38,%rax

# qhasm: t1 = -1
# asm 1: mov  $-1,>t1=int64#8
# asm 2: mov  $-1,>t1=%r10
mov  $-1,%r10

# qhasm: t2 = -1
# asm 1: mov  $-1,>t2=int64#9
# asm 2: mov  $-1,>t2=%r11
mov  $-1,%r11

# qhasm: t3 = -1
# asm 1: mov  $-1,>t3=int64#10
# asm 2: mov  $-1,>t3=%r12
mov  $-1,%r12

# qhasm: carry? t0 -= v0
# asm 1: sub  <v0=int64#3,<t0=int64#7
# asm 2: sub  <v0=%rdx,<t0=%rax
sub  %rdx,%rax

# qhasm: carry? t1 -= v1 - carry
# asm 1: sbb  <v1=int64#4,<t1=int64#8
# asm 2: sbb  <v1=%rcx,<t1=%r10
sbb  %rcx,%r10

# qhasm: carry? t2 -= v2 - carry
# asm 1: sbb  <v2=int64#5,<t2=int64#9
# asm 2: sbb  <v2=%r8,<t2=%r11
sbb  %r8,%r11

# qhasm: t3 -= v3 - carry
# asm 1: sbb  <v3=int64#6,<t3=int64#10
# asm 2: sbb  <v3=%r9,<t3=%r12
sbb  %r9,%r12

# qhasm: carry? t3 reset bit 63
# asm 1: btr  $63,<t3=int64#10
# asm 2: btr  $63,<t3=%r12
btr  $63,%r12

# qhasm: t4 = 0
# asm 1: mov  $0,>t4=int64#11
# asm 2: mov  $0,>t4=%r13
mov  $0,%r13

# qhasm: t4 += 0 + carry
# asm 1: adc $0,<t4=int64#11
# asm 2: adc $0,<t4=%r13
adc $0,%r13

# qhasm: t4 *= 19
# asm 1: imulq  $19,<t4=int64#11,>t4=int64#11
# asm 2: imulq  $19,<t4=%r13,>t4=%r13
imulq  $19,%r13,%r13

# qhasm: carry? t0 += t4
# asm 1: add  <t4=int64#11,<t0=int64#7
# asm 2: add  <t4=%r13,<t0=%rax
add  %r13,%rax

# qhasm: carry? t1 += 0 + carry
# asm 1: adc $0,<t1=int64#8
# asm 2: adc $0,<t1=%r10
adc $0,%r10

# qhasm: carry? t2 += 0 + carry
# asm 1: adc $0,<t2=int64#9
# asm 2: adc $0,<t2=%r11
adc $0,%r11

# qhasm: carry? t3 += 0 + carry
# asm 1: adc $0,<t3=int64#10
# asm 2: adc $0,<t3=%r12
adc $0,%r12

# qhasm: carry? f3 test bit 63
# asm 1: bt  $63,<f3=int64#2
# asm 2: bt  $63,<f3=%rsi
bt  $63,%rsi

# qhasm: v0 = t0 if carry
# asm 1: cmovc <t0=int64#7,<v0=int64#3
# asm 2: cmovc <t0=%rax,<v0=%rdx
cmovc %rax,%rdx

# qhasm: v1 = t1 if carry
# asm 1: cmovc <t1=int64#8,<v1=int64#4
# asm 2: cmovc <t1=%r10,<v1=%rcx
cmovc %r10,%rcx

# qhasm: v2 = t2 if carry
# asm 1: cmovc <t2=int64#9,<v2=int64#5
# asm 2: cmovc <t2=%r11,<v2=%r8
cmovc %r11,%r8

# qhasm: v3 = t3 if carry
# asm 1: cmovc <t3=int64#10,<v3=int64#6
# asm 2: cmovc <t3=%r12,<v3=%r9
cmovc %r12,%r9

# qhasm: t0 = v0
# asm 1: mov  <v0=int64#3,>t0=int64#2
# asm 2: mov  <v0=%rdx,>t0=%rsi
mov  %rdx,%rsi

# qhasm: t1 = v1
# asm 1: mov  <v1=int64#4,>t1=int64#7
# asm 2: mov  <v1=%rcx,>t1=%rax
mov  %rcx,%rax

# qhasm: t2 = v2
# asm 1: mov  <v2=int64#5,>t2=int64#8
# asm 2: mov  <v2=%r8,>t2=%r10
mov  %r8,%r10

# qhasm: t3 = v3
# asm 1: mov  <v3=int64#6,>t3=int64#9
# asm 2: mov  <v3=%r9,>t3=%r11
mov  %r9,%r11

# qhasm: t4 = 9223372036854775807
# asm 1: mov  $9223372036854775807,>t4=int64#10
# asm 2: mov  $9223372036854775807,>t4=%r12
mov  $9223372036854775807,%r12

# qhasm: carry? t0 -= 18446744073709551597
# asm 1: sub  $18446744073709551597,<t0=int64#2
# asm 2: sub  $18446744073709551597,<t0=%rsi
sub  $18446744073709551597,%rsi

# qhasm: carry? t1 -= 18446744073709551615 - carry
# asm 1: sbb  $18446744073709551615,<t1=int64#7
# asm 2: sbb  $18446744073709551615,<t1=%rax
sbb  $18446744073709551615,%rax

# qhasm: carry? t2 -= 18446744073709551615 - carry
# asm 1: sbb  $18446744073709551615,<t2=int64#8
# asm 2: sbb  $18446744073709551615,<t2=%r10
sbb  $18446744073709551615,%r10

# qhasm: carry? t3 -= t4 - carry
# asm 1: sbb  <t4=int64#10,<t3=int64#9
# asm 2: sbb  <t4=%r12,<t3=%r11
sbb  %r12,%r11

# qhasm: v0 = t0 if !carry
# asm 1: cmovae <t0=int64#2,<v0=int64#3
# asm 2: cmovae <t0=%rsi,<v0=%rdx
cmovae %rsi,%rdx

# qhasm: v1 = t1 if !carry
# asm 1: cmovae <t1=int64#7,<v1=int64#4
# asm 2: cmovae <t1=%rax,<v1=%rcx
cmovae %rax,%rcx

# qhasm: v2 = t2 if !carry
# asm 1: cmovae <t2=int64#8,<v2=int64#5
# asm 2: cmovae <t2=%r10,<v2=%r8
cmovae %r10,%r8

# qhasm: v3 = t3 if !carry
# asm 1: cmovae <t3=int64#9,<v3=int64#6
# asm 2: cmovae <t3=%r11,<v3=%r9
cmovae %r11,%r9

# qhasm: mem64[p + 0 ] = v0
# asm 1: movq   <v0=int64#3,0(<p=int64#1)
# asm 2: movq   <v0=%rdx,0(<p=%rdi)
movq   %rdx,0(%rdi)

# qhasm: mem64[p + 8 ] = v1
# asm 1: movq   <v1=int64#4,8(<p=int64#1)
# asm 2: movq   <v1=%rcx,8(<p=%rdi)
movq   %rcx,8(%rdi)

# qhasm: mem64[p +16 ] = v2
# asm 1: movq   <v2=int64#5,16(<p=int64#1)
# asm 2: movq   <v2=%r8,16(<p=%rdi)
movq   %r8,16(%rdi)

# qhasm: mem64[p +24 ] = v3
# asm 1: movq   <v3=int64#6,24(<p=int64#1)
# asm 2: movq   <v3=%r9,24(<p=%rdi)
movq   %r9,24(%rdi)

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
