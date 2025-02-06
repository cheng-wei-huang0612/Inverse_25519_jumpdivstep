
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

# qhasm: int64 m

# qhasm: int64 f

# qhasm: int64 g

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: int64 uvrs

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 mnew

# qhasm: int64 z

# qhasm: int64 loop

# qhasm: int64 rax

# qhasm: int64 rdx

# qhasm: int64 t0

# qhasm: int64 t1

# qhasm: int64 t2

# qhasm: int64 h

# qhasm: int64 oldg

# qhasm: int64 i

# qhasm: int64 f0

# qhasm: int64 g0

# qhasm: int64 m1

# qhasm: stack64 stack_0

# qhasm: enter innerloop15x1000
.p2align 5
.global _innerloop15x1000
.global innerloop15x1000
_innerloop15x1000:
innerloop15x1000:
mov %rsp,%r11
and $31,%r11
add $64,%r11
sub %r11,%rsp

# qhasm: fuv = input_0
# asm 1: mov  <input_0=int64#1,>fuv=int64#1
# asm 2: mov  <input_0=%rdi,>fuv=%rdi
mov  %rdi,%rdi

# qhasm: grs = input_1
# asm 1: mov  <input_1=int64#2,>grs=int64#2
# asm 2: mov  <input_1=%rsi,>grs=%rsi
mov  %rsi,%rsi

# qhasm: z = 0
# asm 1: xor  >z=int64#3,>z=int64#3
# asm 2: xor  >z=%rdx,>z=%rdx
xor  %rdx,%rdx

# qhasm: stack_0 = z
# asm 1: movq <z=int64#3,>stack_0=stack64#1
# asm 2: movq <z=%rdx,>stack_0=0(%rsp)
movq %rdx,0(%rsp)

# qhasm: m = 1
# asm 1: mov  $1,>m=int64#3
# asm 2: mov  $1,>m=%rdx
mov  $1,%rdx

# qhasm: i = 1000
# asm 1: mov  $1000,>i=int64#4
# asm 2: mov  $1000,>i=%rcx
mov  $1000,%rcx

# qhasm: m1 = -1
# asm 1: mov  $-1,>m1=int64#5
# asm 2: mov  $-1,>m1=%r8
mov  $-1,%r8

# qhasm: stack64 stack_r11

# qhasm: stack_r11 = caller_r11
# asm 1: movq <caller_r11=int64#9,>stack_r11=stack64#2
# asm 2: movq <caller_r11=%r11,>stack_r11=8(%rsp)
movq %r11,8(%rsp)

# qhasm: stack64 stack_r12

# qhasm: stack_r12 = caller_r12
# asm 1: movq <caller_r12=int64#10,>stack_r12=stack64#3
# asm 2: movq <caller_r12=%r12,>stack_r12=16(%rsp)
movq %r12,16(%rsp)

# qhasm: stack64 stack_r13

# qhasm: stack_r13 = caller_r13
# asm 1: movq <caller_r13=int64#11,>stack_r13=stack64#4
# asm 2: movq <caller_r13=%r13,>stack_r13=24(%rsp)
movq %r13,24(%rsp)

# qhasm: stack64 stack_r14

# qhasm: stack_r14 = caller_r14
# asm 1: movq <caller_r14=int64#12,>stack_r14=stack64#5
# asm 2: movq <caller_r14=%r14,>stack_r14=32(%rsp)
movq %r14,32(%rsp)

# qhasm: stack64 stack_r15

# qhasm: stack_r15 = caller_r15
# asm 1: movq <caller_r15=int64#13,>stack_r15=stack64#6
# asm 2: movq <caller_r15=%r15,>stack_r15=40(%rsp)
movq %r15,40(%rsp)

# qhasm: stack64 stack_rbx

# qhasm: stack_rbx = caller_rbx
# asm 1: movq <caller_rbx=int64#14,>stack_rbx=stack64#7
# asm 2: movq <caller_rbx=%rbx,>stack_rbx=48(%rsp)
movq %rbx,48(%rsp)

# qhasm: stack64 stack_rbp

# qhasm: stack_rbp = caller_rbp
# asm 1: movq <caller_rbp=int64#15,>stack_rbp=stack64#8
# asm 2: movq <caller_rbp=%rbp,>stack_rbp=56(%rsp)
movq %rbp,56(%rsp)

# qhasm: loop1000:
._loop1000:

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm:   z = stack_0
# asm 1: movq <stack_0=stack64#1,>z=int64#6
# asm 2: movq <stack_0=0(%rsp),>z=%r9
movq 0(%rsp),%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#2,<fuv=int64#1),>h=int64#7
# asm 2: lea  (<grs=%rsi,<fuv=%rdi),>h=%rax
lea  (%rsi,%rdi),%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#2,>oldg=int64#8
# asm 2: mov  <grs=%rsi,>oldg=%r10
mov  %rsi,%r10

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#2
# asm 2: test  $1,<grs=%rsi
test  $1,%rsi

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#2,<h=int64#7
# asm 2: cmove <grs=%rsi,<h=%rax
cmove %rsi,%rax

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#3,<z=int64#6
# asm 2: cmovne <m=%rdx,<z=%r9
cmovne %rdx,%r9

# qhasm:   mnew = m + m1
# asm 1: lea  (<m=int64#3,<m1=int64#5),>mnew=int64#9
# asm 2: lea  (<m=%rdx,<m1=%r8),>mnew=%r11
lea  (%rdx,%r8),%r11

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#1,<grs=int64#2
# asm 2: sub  <fuv=%rdi,<grs=%rsi
sub  %rdi,%rsi

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#2
# asm 2: sar  $1,<grs=%rsi
sar  $1,%rsi

# qhasm:   m ^= m1
# asm 1: xor  <m1=int64#5,<m=int64#3
# asm 2: xor  <m1=%r8,<m=%rdx
xor  %r8,%rdx

# qhasm:                  signed<? z & z
# asm 1: test  <z=int64#6,<z=int64#6
# asm 2: test  <z=%r9,<z=%r9
test  %r9,%r9

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#8,<fuv=int64#1
# asm 2: cmovl <oldg=%r10,<fuv=%rdi
cmovl %r10,%rdi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#2
# asm 2: cmovge <h=%rax,<grs=%rsi
cmovge %rax,%rsi

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#9,<m=int64#3
# asm 2: cmovge <mnew=%r11,<m=%rdx
cmovge %r11,%rdx

# qhasm: =? i -= 1
# asm 1: dec <i=int64#4
# asm 2: dec <i=%rcx
dec %rcx
# comment:fp stack unchanged by jump

# qhasm: goto loop1000 if !=
jne ._loop1000

# qhasm: caller_r11 = stack_r11
# asm 1: movq <stack_r11=stack64#2,>caller_r11=int64#9
# asm 2: movq <stack_r11=8(%rsp),>caller_r11=%r11
movq 8(%rsp),%r11

# qhasm: caller_r12 = stack_r12
# asm 1: movq <stack_r12=stack64#3,>caller_r12=int64#10
# asm 2: movq <stack_r12=16(%rsp),>caller_r12=%r12
movq 16(%rsp),%r12

# qhasm: caller_r13 = stack_r13
# asm 1: movq <stack_r13=stack64#4,>caller_r13=int64#11
# asm 2: movq <stack_r13=24(%rsp),>caller_r13=%r13
movq 24(%rsp),%r13

# qhasm: caller_r14 = stack_r14
# asm 1: movq <stack_r14=stack64#5,>caller_r14=int64#12
# asm 2: movq <stack_r14=32(%rsp),>caller_r14=%r14
movq 32(%rsp),%r14

# qhasm: caller_r15 = stack_r15
# asm 1: movq <stack_r15=stack64#6,>caller_r15=int64#13
# asm 2: movq <stack_r15=40(%rsp),>caller_r15=%r15
movq 40(%rsp),%r15

# qhasm: caller_rbx = stack_rbx
# asm 1: movq <stack_rbx=stack64#7,>caller_rbx=int64#14
# asm 2: movq <stack_rbx=48(%rsp),>caller_rbx=%rbx
movq 48(%rsp),%rbx

# qhasm: caller_rbp = stack_rbp
# asm 1: movq <stack_rbp=stack64#8,>caller_rbp=int64#15
# asm 2: movq <stack_rbp=56(%rsp),>caller_rbp=%rbp
movq 56(%rsp),%rbp

# qhasm: return
add %r11,%rsp
ret
