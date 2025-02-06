
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

# qhasm: stack64 caller_r11_stack

# qhasm: stack64 caller_r12_stack

# qhasm: stack64 caller_r13_stack

# qhasm: stack64 caller_r14_stack

# qhasm: stack64 caller_r15_stack

# qhasm: stack64 caller_rbp_stack

# qhasm: stack64 caller_rbx_stack

# qhasm: stack64 input_2_save

# qhasm: int64 r4

# qhasm: int64 r5

# qhasm: int64 r6

# qhasm: int64 r7

# qhasm: int64 r8

# qhasm: int64 rax

# qhasm: int64 rdx

# qhasm: int64 x0

# qhasm: int64 x1

# qhasm: int64 x2

# qhasm: int64 x3

# qhasm: int64 c

# qhasm: int64 zero

# qhasm: int64 i38

# qhasm: enter fpmul25519
.p2align 5
.global _fpmul25519
.global fpmul25519
_fpmul25519:
fpmul25519:
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

# qhasm:   r4 = 0
# asm 1: mov  $0,>r4=int64#4
# asm 2: mov  $0,>r4=%rcx
mov  $0,%rcx

# qhasm:   r5 = 0
# asm 1: mov  $0,>r5=int64#5
# asm 2: mov  $0,>r5=%r8
mov  $0,%r8

# qhasm:   r6 = 0
# asm 1: mov  $0,>r6=int64#6
# asm 2: mov  $0,>r6=%r9
mov  $0,%r9

# qhasm:   r7 = 0
# asm 1: mov  $0,>r7=int64#8
# asm 2: mov  $0,>r7=%r10
mov  $0,%r10

# qhasm:   x0 = *(uint64 *)(input_0 + 0)
# asm 1: movq   0(<input_0=int64#1),>x0=int64#9
# asm 2: movq   0(<input_0=%rdi),>x0=%r11
movq   0(%rdi),%r11

# qhasm:   rax = *(uint64 *)(input_1 + 0)
# asm 1: movq   0(<input_1=int64#2),>rax=int64#7
# asm 2: movq   0(<input_1=%rsi),>rax=%rax
movq   0(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x0
# asm 1: mul  <x0=int64#9
# asm 2: mul  <x0=%r11
mul  %r11

# qhasm:   r0 = rax
# asm 1: mov  <rax=int64#7,>r0=int64#10
# asm 2: mov  <rax=%rax,>r0=%r12
mov  %rax,%r12

# qhasm:   r1 = rdx
# asm 1: mov  <rdx=int64#3,>r1=int64#11
# asm 2: mov  <rdx=%rdx,>r1=%r13
mov  %rdx,%r13

# qhasm:   rax = *(uint64 *)(input_1 + 8)
# asm 1: movq   8(<input_1=int64#2),>rax=int64#7
# asm 2: movq   8(<input_1=%rsi),>rax=%rax
movq   8(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x0
# asm 1: mul  <x0=int64#9
# asm 2: mul  <x0=%r11
mul  %r11

# qhasm:   carry? r1 += rax
# asm 1: add  <rax=int64#7,<r1=int64#11
# asm 2: add  <rax=%rax,<r1=%r13
add  %rax,%r13

# qhasm:   r2 = 0
# asm 1: mov  $0,>r2=int64#12
# asm 2: mov  $0,>r2=%r14
mov  $0,%r14

# qhasm:   r2 += rdx + carry
# asm 1: adc <rdx=int64#3,<r2=int64#12
# asm 2: adc <rdx=%rdx,<r2=%r14
adc %rdx,%r14

# qhasm:   rax = *(uint64 *)(input_1 + 16)
# asm 1: movq   16(<input_1=int64#2),>rax=int64#7
# asm 2: movq   16(<input_1=%rsi),>rax=%rax
movq   16(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x0
# asm 1: mul  <x0=int64#9
# asm 2: mul  <x0=%r11
mul  %r11

# qhasm:   carry? r2 += rax
# asm 1: add  <rax=int64#7,<r2=int64#12
# asm 2: add  <rax=%rax,<r2=%r14
add  %rax,%r14

# qhasm:   r3 = 0
# asm 1: mov  $0,>r3=int64#13
# asm 2: mov  $0,>r3=%r15
mov  $0,%r15

# qhasm:   r3 += rdx + carry
# asm 1: adc <rdx=int64#3,<r3=int64#13
# asm 2: adc <rdx=%rdx,<r3=%r15
adc %rdx,%r15

# qhasm:   rax = *(uint64 *)(input_1 + 24)
# asm 1: movq   24(<input_1=int64#2),>rax=int64#7
# asm 2: movq   24(<input_1=%rsi),>rax=%rax
movq   24(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x0
# asm 1: mul  <x0=int64#9
# asm 2: mul  <x0=%r11
mul  %r11

# qhasm:   carry? r3 += rax
# asm 1: add  <rax=int64#7,<r3=int64#13
# asm 2: add  <rax=%rax,<r3=%r15
add  %rax,%r15

# qhasm:   r4 += rdx + carry
# asm 1: adc <rdx=int64#3,<r4=int64#4
# asm 2: adc <rdx=%rdx,<r4=%rcx
adc %rdx,%rcx

# qhasm:   x1 = *(uint64 *)(input_0 + 8)
# asm 1: movq   8(<input_0=int64#1),>x1=int64#9
# asm 2: movq   8(<input_0=%rdi),>x1=%r11
movq   8(%rdi),%r11

# qhasm:   rax = *(uint64 *)(input_1 + 0)
# asm 1: movq   0(<input_1=int64#2),>rax=int64#7
# asm 2: movq   0(<input_1=%rsi),>rax=%rax
movq   0(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x1
# asm 1: mul  <x1=int64#9
# asm 2: mul  <x1=%r11
mul  %r11

# qhasm:   carry? r1 += rax
# asm 1: add  <rax=int64#7,<r1=int64#11
# asm 2: add  <rax=%rax,<r1=%r13
add  %rax,%r13

# qhasm:   c = 0
# asm 1: mov  $0,>c=int64#14
# asm 2: mov  $0,>c=%rbx
mov  $0,%rbx

# qhasm:   c += rdx + carry
# asm 1: adc <rdx=int64#3,<c=int64#14
# asm 2: adc <rdx=%rdx,<c=%rbx
adc %rdx,%rbx

# qhasm:   rax = *(uint64 *)(input_1 + 8)
# asm 1: movq   8(<input_1=int64#2),>rax=int64#7
# asm 2: movq   8(<input_1=%rsi),>rax=%rax
movq   8(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x1
# asm 1: mul  <x1=int64#9
# asm 2: mul  <x1=%r11
mul  %r11

# qhasm:   carry? r2 += rax
# asm 1: add  <rax=int64#7,<r2=int64#12
# asm 2: add  <rax=%rax,<r2=%r14
add  %rax,%r14

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
adc $0,%rdx

# qhasm:   carry? r2 += c
# asm 1: add  <c=int64#14,<r2=int64#12
# asm 2: add  <c=%rbx,<r2=%r14
add  %rbx,%r14

# qhasm:   c = 0
# asm 1: mov  $0,>c=int64#14
# asm 2: mov  $0,>c=%rbx
mov  $0,%rbx

# qhasm:   c += rdx + carry
# asm 1: adc <rdx=int64#3,<c=int64#14
# asm 2: adc <rdx=%rdx,<c=%rbx
adc %rdx,%rbx

# qhasm:   rax = *(uint64 *)(input_1 + 16)
# asm 1: movq   16(<input_1=int64#2),>rax=int64#7
# asm 2: movq   16(<input_1=%rsi),>rax=%rax
movq   16(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x1
# asm 1: mul  <x1=int64#9
# asm 2: mul  <x1=%r11
mul  %r11

# qhasm:   carry? r3 += rax 
# asm 1: add  <rax=int64#7,<r3=int64#13
# asm 2: add  <rax=%rax,<r3=%r15
add  %rax,%r15

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
adc $0,%rdx

# qhasm:   carry? r3 += c
# asm 1: add  <c=int64#14,<r3=int64#13
# asm 2: add  <c=%rbx,<r3=%r15
add  %rbx,%r15

# qhasm:   c = 0
# asm 1: mov  $0,>c=int64#14
# asm 2: mov  $0,>c=%rbx
mov  $0,%rbx

# qhasm:   c += rdx + carry
# asm 1: adc <rdx=int64#3,<c=int64#14
# asm 2: adc <rdx=%rdx,<c=%rbx
adc %rdx,%rbx

# qhasm:   rax = *(uint64 *)(input_1 + 24)
# asm 1: movq   24(<input_1=int64#2),>rax=int64#7
# asm 2: movq   24(<input_1=%rsi),>rax=%rax
movq   24(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x1
# asm 1: mul  <x1=int64#9
# asm 2: mul  <x1=%r11
mul  %r11

# qhasm:   carry? r4 += rax
# asm 1: add  <rax=int64#7,<r4=int64#4
# asm 2: add  <rax=%rax,<r4=%rcx
add  %rax,%rcx

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
adc $0,%rdx

# qhasm:   carry? r4 += c
# asm 1: add  <c=int64#14,<r4=int64#4
# asm 2: add  <c=%rbx,<r4=%rcx
add  %rbx,%rcx

# qhasm:   r5 += rdx + carry
# asm 1: adc <rdx=int64#3,<r5=int64#5
# asm 2: adc <rdx=%rdx,<r5=%r8
adc %rdx,%r8

# qhasm:   x2 = *(uint64 *)(input_0 + 16)
# asm 1: movq   16(<input_0=int64#1),>x2=int64#9
# asm 2: movq   16(<input_0=%rdi),>x2=%r11
movq   16(%rdi),%r11

# qhasm:   rax = *(uint64 *)(input_1 + 0)
# asm 1: movq   0(<input_1=int64#2),>rax=int64#7
# asm 2: movq   0(<input_1=%rsi),>rax=%rax
movq   0(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x2
# asm 1: mul  <x2=int64#9
# asm 2: mul  <x2=%r11
mul  %r11

# qhasm:   carry? r2 += rax
# asm 1: add  <rax=int64#7,<r2=int64#12
# asm 2: add  <rax=%rax,<r2=%r14
add  %rax,%r14

# qhasm:   c = 0
# asm 1: mov  $0,>c=int64#14
# asm 2: mov  $0,>c=%rbx
mov  $0,%rbx

# qhasm:   c += rdx + carry
# asm 1: adc <rdx=int64#3,<c=int64#14
# asm 2: adc <rdx=%rdx,<c=%rbx
adc %rdx,%rbx

# qhasm:   rax = *(uint64 *)(input_1 + 8)
# asm 1: movq   8(<input_1=int64#2),>rax=int64#7
# asm 2: movq   8(<input_1=%rsi),>rax=%rax
movq   8(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x2
# asm 1: mul  <x2=int64#9
# asm 2: mul  <x2=%r11
mul  %r11

# qhasm:   carry? r3 += rax
# asm 1: add  <rax=int64#7,<r3=int64#13
# asm 2: add  <rax=%rax,<r3=%r15
add  %rax,%r15

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
adc $0,%rdx

# qhasm:   carry? r3 += c
# asm 1: add  <c=int64#14,<r3=int64#13
# asm 2: add  <c=%rbx,<r3=%r15
add  %rbx,%r15

# qhasm:   c = 0
# asm 1: mov  $0,>c=int64#14
# asm 2: mov  $0,>c=%rbx
mov  $0,%rbx

# qhasm:   c += rdx + carry
# asm 1: adc <rdx=int64#3,<c=int64#14
# asm 2: adc <rdx=%rdx,<c=%rbx
adc %rdx,%rbx

# qhasm:   rax = *(uint64 *)(input_1 + 16)
# asm 1: movq   16(<input_1=int64#2),>rax=int64#7
# asm 2: movq   16(<input_1=%rsi),>rax=%rax
movq   16(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x2
# asm 1: mul  <x2=int64#9
# asm 2: mul  <x2=%r11
mul  %r11

# qhasm:   carry? r4 += rax
# asm 1: add  <rax=int64#7,<r4=int64#4
# asm 2: add  <rax=%rax,<r4=%rcx
add  %rax,%rcx

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
adc $0,%rdx

# qhasm:   carry? r4 += c
# asm 1: add  <c=int64#14,<r4=int64#4
# asm 2: add  <c=%rbx,<r4=%rcx
add  %rbx,%rcx

# qhasm:   c = 0
# asm 1: mov  $0,>c=int64#14
# asm 2: mov  $0,>c=%rbx
mov  $0,%rbx

# qhasm:   c += rdx + carry
# asm 1: adc <rdx=int64#3,<c=int64#14
# asm 2: adc <rdx=%rdx,<c=%rbx
adc %rdx,%rbx

# qhasm:   rax = *(uint64 *)(input_1 + 24)
# asm 1: movq   24(<input_1=int64#2),>rax=int64#7
# asm 2: movq   24(<input_1=%rsi),>rax=%rax
movq   24(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x2
# asm 1: mul  <x2=int64#9
# asm 2: mul  <x2=%r11
mul  %r11

# qhasm:   carry? r5 += rax
# asm 1: add  <rax=int64#7,<r5=int64#5
# asm 2: add  <rax=%rax,<r5=%r8
add  %rax,%r8

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
adc $0,%rdx

# qhasm:   carry? r5 += c
# asm 1: add  <c=int64#14,<r5=int64#5
# asm 2: add  <c=%rbx,<r5=%r8
add  %rbx,%r8

# qhasm:   r6 += rdx + carry
# asm 1: adc <rdx=int64#3,<r6=int64#6
# asm 2: adc <rdx=%rdx,<r6=%r9
adc %rdx,%r9

# qhasm:   x3 = *(uint64 *)(input_0 + 24)
# asm 1: movq   24(<input_0=int64#1),>x3=int64#1
# asm 2: movq   24(<input_0=%rdi),>x3=%rdi
movq   24(%rdi),%rdi

# qhasm:   rax = *(uint64 *)(input_1 + 0)
# asm 1: movq   0(<input_1=int64#2),>rax=int64#7
# asm 2: movq   0(<input_1=%rsi),>rax=%rax
movq   0(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x3
# asm 1: mul  <x3=int64#1
# asm 2: mul  <x3=%rdi
mul  %rdi

# qhasm:   carry? r3 += rax
# asm 1: add  <rax=int64#7,<r3=int64#13
# asm 2: add  <rax=%rax,<r3=%r15
add  %rax,%r15

# qhasm:   c = 0
# asm 1: mov  $0,>c=int64#9
# asm 2: mov  $0,>c=%r11
mov  $0,%r11

# qhasm:   c += rdx + carry
# asm 1: adc <rdx=int64#3,<c=int64#9
# asm 2: adc <rdx=%rdx,<c=%r11
adc %rdx,%r11

# qhasm:   rax = *(uint64 *)(input_1 + 8)
# asm 1: movq   8(<input_1=int64#2),>rax=int64#7
# asm 2: movq   8(<input_1=%rsi),>rax=%rax
movq   8(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x3
# asm 1: mul  <x3=int64#1
# asm 2: mul  <x3=%rdi
mul  %rdi

# qhasm:   carry? r4 += rax
# asm 1: add  <rax=int64#7,<r4=int64#4
# asm 2: add  <rax=%rax,<r4=%rcx
add  %rax,%rcx

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
adc $0,%rdx

# qhasm:   carry? r4 += c
# asm 1: add  <c=int64#9,<r4=int64#4
# asm 2: add  <c=%r11,<r4=%rcx
add  %r11,%rcx

# qhasm:   c = 0
# asm 1: mov  $0,>c=int64#9
# asm 2: mov  $0,>c=%r11
mov  $0,%r11

# qhasm:   c += rdx + carry
# asm 1: adc <rdx=int64#3,<c=int64#9
# asm 2: adc <rdx=%rdx,<c=%r11
adc %rdx,%r11

# qhasm:   rax = *(uint64 *)(input_1 + 16)
# asm 1: movq   16(<input_1=int64#2),>rax=int64#7
# asm 2: movq   16(<input_1=%rsi),>rax=%rax
movq   16(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x3
# asm 1: mul  <x3=int64#1
# asm 2: mul  <x3=%rdi
mul  %rdi

# qhasm:   carry? r5 += rax
# asm 1: add  <rax=int64#7,<r5=int64#5
# asm 2: add  <rax=%rax,<r5=%r8
add  %rax,%r8

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
adc $0,%rdx

# qhasm:   carry? r5 += c
# asm 1: add  <c=int64#9,<r5=int64#5
# asm 2: add  <c=%r11,<r5=%r8
add  %r11,%r8

# qhasm:   c = 0
# asm 1: mov  $0,>c=int64#9
# asm 2: mov  $0,>c=%r11
mov  $0,%r11

# qhasm:   c += rdx + carry
# asm 1: adc <rdx=int64#3,<c=int64#9
# asm 2: adc <rdx=%rdx,<c=%r11
adc %rdx,%r11

# qhasm:   rax = *(uint64 *)(input_1 + 24)
# asm 1: movq   24(<input_1=int64#2),>rax=int64#7
# asm 2: movq   24(<input_1=%rsi),>rax=%rax
movq   24(%rsi),%rax

# qhasm:   (uint128) rdx rax = rax * x3
# asm 1: mul  <x3=int64#1
# asm 2: mul  <x3=%rdi
mul  %rdi

# qhasm:   carry? r6 += rax
# asm 1: add  <rax=int64#7,<r6=int64#6
# asm 2: add  <rax=%rax,<r6=%r9
add  %rax,%r9

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
adc $0,%rdx

# qhasm:   carry? r6 += c
# asm 1: add  <c=int64#9,<r6=int64#6
# asm 2: add  <c=%r11,<r6=%r9
add  %r11,%r9

# qhasm:   r7 += rdx + carry
# asm 1: adc <rdx=int64#3,<r7=int64#8
# asm 2: adc <rdx=%rdx,<r7=%r10
adc %rdx,%r10

# qhasm:   rax = r4
# asm 1: mov  <r4=int64#4,>rax=int64#7
# asm 2: mov  <r4=%rcx,>rax=%rax
mov  %rcx,%rax

# qhasm:   (uint128) rdx rax = rax * *(uint64 *)&const_38
mulq  const_38

# qhasm:   r4 = rax
# asm 1: mov  <rax=int64#7,>r4=int64#1
# asm 2: mov  <rax=%rax,>r4=%rdi
mov  %rax,%rdi

# qhasm:   rax = r5
# asm 1: mov  <r5=int64#5,>rax=int64#7
# asm 2: mov  <r5=%r8,>rax=%rax
mov  %r8,%rax

# qhasm:   r5 = rdx
# asm 1: mov  <rdx=int64#3,>r5=int64#2
# asm 2: mov  <rdx=%rdx,>r5=%rsi
mov  %rdx,%rsi

# qhasm:   (uint128) rdx rax = rax * *(uint64 *)&const_38
mulq  const_38

# qhasm:   carry? r5 += rax
# asm 1: add  <rax=int64#7,<r5=int64#2
# asm 2: add  <rax=%rax,<r5=%rsi
add  %rax,%rsi

# qhasm:   rax = r6
# asm 1: mov  <r6=int64#6,>rax=int64#7
# asm 2: mov  <r6=%r9,>rax=%rax
mov  %r9,%rax

# qhasm:   r6 = 0
# asm 1: mov  $0,>r6=int64#4
# asm 2: mov  $0,>r6=%rcx
mov  $0,%rcx

# qhasm:   r6 += rdx + carry
# asm 1: adc <rdx=int64#3,<r6=int64#4
# asm 2: adc <rdx=%rdx,<r6=%rcx
adc %rdx,%rcx

# qhasm:   (uint128) rdx rax = rax * *(uint64 *)&const_38
mulq  const_38

# qhasm:   carry? r6 += rax
# asm 1: add  <rax=int64#7,<r6=int64#4
# asm 2: add  <rax=%rax,<r6=%rcx
add  %rax,%rcx

# qhasm:   rax = r7
# asm 1: mov  <r7=int64#8,>rax=int64#7
# asm 2: mov  <r7=%r10,>rax=%rax
mov  %r10,%rax

# qhasm:   r7 = 0
# asm 1: mov  $0,>r7=int64#5
# asm 2: mov  $0,>r7=%r8
mov  $0,%r8

# qhasm:   r7 += rdx + carry
# asm 1: adc <rdx=int64#3,<r7=int64#5
# asm 2: adc <rdx=%rdx,<r7=%r8
adc %rdx,%r8

# qhasm:   (uint128) rdx rax = rax * *(uint64 *)&const_38
mulq  const_38

# qhasm:   carry? r7 += rax
# asm 1: add  <rax=int64#7,<r7=int64#5
# asm 2: add  <rax=%rax,<r7=%r8
add  %rax,%r8

# qhasm:   r8 = 0
# asm 1: mov  $0,>r8=int64#6
# asm 2: mov  $0,>r8=%r9
mov  $0,%r9

# qhasm:   r8 += rdx + carry
# asm 1: adc <rdx=int64#3,<r8=int64#6
# asm 2: adc <rdx=%rdx,<r8=%r9
adc %rdx,%r9

# qhasm:   carry? r0 += r4
# asm 1: add  <r4=int64#1,<r0=int64#10
# asm 2: add  <r4=%rdi,<r0=%r12
add  %rdi,%r12

# qhasm:   carry? r1 += r5 + carry
# asm 1: adc <r5=int64#2,<r1=int64#11
# asm 2: adc <r5=%rsi,<r1=%r13
adc %rsi,%r13

# qhasm:   carry? r2 += r6 + carry
# asm 1: adc <r6=int64#4,<r2=int64#12
# asm 2: adc <r6=%rcx,<r2=%r14
adc %rcx,%r14

# qhasm:   carry? r3 += r7 + carry
# asm 1: adc <r7=int64#5,<r3=int64#13
# asm 2: adc <r7=%r8,<r3=%r15
adc %r8,%r15

# qhasm:   zero = 0
# asm 1: mov  $0,>zero=int64#1
# asm 2: mov  $0,>zero=%rdi
mov  $0,%rdi

# qhasm:   r8 += zero + carry
# asm 1: adc <zero=int64#1,<r8=int64#6
# asm 2: adc <zero=%rdi,<r8=%r9
adc %rdi,%r9

# qhasm:   r8 *= 38
# asm 1: imulq  $38,<r8=int64#6,>r8=int64#2
# asm 2: imulq  $38,<r8=%r9,>r8=%rsi
imulq  $38,%r9,%rsi

# qhasm:   carry? r0 += r8
# asm 1: add  <r8=int64#2,<r0=int64#10
# asm 2: add  <r8=%rsi,<r0=%r12
add  %rsi,%r12

# qhasm:   carry? r1 += zero + carry
# asm 1: adc <zero=int64#1,<r1=int64#11
# asm 2: adc <zero=%rdi,<r1=%r13
adc %rdi,%r13

# qhasm:   carry? r2 += zero + carry
# asm 1: adc <zero=int64#1,<r2=int64#12
# asm 2: adc <zero=%rdi,<r2=%r14
adc %rdi,%r14

# qhasm:   carry? r3 += zero + carry
# asm 1: adc <zero=int64#1,<r3=int64#13
# asm 2: adc <zero=%rdi,<r3=%r15
adc %rdi,%r15

# qhasm:   zero += zero + carry
# asm 1: adc <zero=int64#1,<zero=int64#1
# asm 2: adc <zero=%rdi,<zero=%rdi
adc %rdi,%rdi

# qhasm:   zero *= 38
# asm 1: imulq  $38,<zero=int64#1,>zero=int64#1
# asm 2: imulq  $38,<zero=%rdi,>zero=%rdi
imulq  $38,%rdi,%rdi

# qhasm:   r0 += zero
# asm 1: add  <zero=int64#1,<r0=int64#10
# asm 2: add  <zero=%rdi,<r0=%r12
add  %rdi,%r12

# qhasm:   zero = 0
# asm 1: mov  $0,>zero=int64#1
# asm 2: mov  $0,>zero=%rdi
mov  $0,%rdi

# qhasm:   i38 = 19
# asm 1: mov  $19,>i38=int64#2
# asm 2: mov  $19,>i38=%rsi
mov  $19,%rsi

# qhasm:   carry? r3 reset bit 63 
# asm 1: btr  $63,<r3=int64#13
# asm 2: btr  $63,<r3=%r15
btr  $63,%r15

# qhasm:   zero = i38 if carry
# asm 1: cmovc <i38=int64#2,<zero=int64#1
# asm 2: cmovc <i38=%rsi,<zero=%rdi
cmovc %rsi,%rdi

# qhasm:   carry? r0 += zero
# asm 1: add  <zero=int64#1,<r0=int64#10
# asm 2: add  <zero=%rdi,<r0=%r12
add  %rdi,%r12

# qhasm:   carry? r1 += 0 + carry
# asm 1: adc $0,<r1=int64#11
# asm 2: adc $0,<r1=%r13
adc $0,%r13

# qhasm:   carry? r2 += 0 + carry
# asm 1: adc $0,<r2=int64#12
# asm 2: adc $0,<r2=%r14
adc $0,%r14

# qhasm:   r3 += 0 + carry
# asm 1: adc $0,<r3=int64#13
# asm 2: adc $0,<r3=%r15
adc $0,%r15

# qhasm:   x0 = r0
# asm 1: mov  <r0=int64#10,>x0=int64#1
# asm 2: mov  <r0=%r12,>x0=%rdi
mov  %r12,%rdi

# qhasm:   x1 = r1
# asm 1: mov  <r1=int64#11,>x1=int64#2
# asm 2: mov  <r1=%r13,>x1=%rsi
mov  %r13,%rsi

# qhasm:   x2 = r2
# asm 1: mov  <r2=int64#12,>x2=int64#3
# asm 2: mov  <r2=%r14,>x2=%rdx
mov  %r14,%rdx

# qhasm:   x3 = r3
# asm 1: mov  <r3=int64#13,>x3=int64#4
# asm 2: mov  <r3=%r15,>x3=%rcx
mov  %r15,%rcx

# qhasm:   r4 = 9223372036854775807
# asm 1: mov  $9223372036854775807,>r4=int64#5
# asm 2: mov  $9223372036854775807,>r4=%r8
mov  $9223372036854775807,%r8

# qhasm:   carry? r0 -= 18446744073709551597
# asm 1: sub  $18446744073709551597,<r0=int64#10
# asm 2: sub  $18446744073709551597,<r0=%r12
sub  $18446744073709551597,%r12

# qhasm:   carry? r1 -= 18446744073709551615 - carry
# asm 1: sbb  $18446744073709551615,<r1=int64#11
# asm 2: sbb  $18446744073709551615,<r1=%r13
sbb  $18446744073709551615,%r13

# qhasm:   carry? r2 -= 18446744073709551615 - carry
# asm 1: sbb  $18446744073709551615,<r2=int64#12
# asm 2: sbb  $18446744073709551615,<r2=%r14
sbb  $18446744073709551615,%r14

# qhasm:   carry? r3 -= r4 - carry
# asm 1: sbb  <r4=int64#5,<r3=int64#13
# asm 2: sbb  <r4=%r8,<r3=%r15
sbb  %r8,%r15

# qhasm:   r0 = x0 if carry
# asm 1: cmovc <x0=int64#1,<r0=int64#10
# asm 2: cmovc <x0=%rdi,<r0=%r12
cmovc %rdi,%r12

# qhasm:   r1 = x1 if carry
# asm 1: cmovc <x1=int64#2,<r1=int64#11
# asm 2: cmovc <x1=%rsi,<r1=%r13
cmovc %rsi,%r13

# qhasm:   r2 = x2 if carry
# asm 1: cmovc <x2=int64#3,<r2=int64#12
# asm 2: cmovc <x2=%rdx,<r2=%r14
cmovc %rdx,%r14

# qhasm:   r3 = x3 if carry
# asm 1: cmovc <x3=int64#4,<r3=int64#13
# asm 2: cmovc <x3=%rcx,<r3=%r15
cmovc %rcx,%r15

# qhasm: input_2 = input_2_save
# asm 1: movq <input_2_save=stack64#8,>input_2=int64#1
# asm 2: movq <input_2_save=56(%rsp),>input_2=%rdi
movq 56(%rsp),%rdi

# qhasm: *(uint64 *)(input_2 + 8) = r1
# asm 1: movq   <r1=int64#11,8(<input_2=int64#1)
# asm 2: movq   <r1=%r13,8(<input_2=%rdi)
movq   %r13,8(%rdi)

# qhasm: *(uint64 *)(input_2 + 16) = r2
# asm 1: movq   <r2=int64#12,16(<input_2=int64#1)
# asm 2: movq   <r2=%r14,16(<input_2=%rdi)
movq   %r14,16(%rdi)

# qhasm: *(uint64 *)(input_2 + 24) = r3
# asm 1: movq   <r3=int64#13,24(<input_2=int64#1)
# asm 2: movq   <r3=%r15,24(<input_2=%rdi)
movq   %r15,24(%rdi)

# qhasm: *(uint64 *)(input_2 + 0) = r0
# asm 1: movq   <r0=int64#10,0(<input_2=int64#1)
# asm 2: movq   <r0=%r12,0(<input_2=%rdi)
movq   %r12,0(%rdi)

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
