
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

# qhasm: int64 FVGS

# qhasm: int64 uvrs

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 mnew

# qhasm: int64 z

# qhasm: int64 loop

# qhasm: int64 _m2p15

# qhasm: int64 _2p16

# qhasm: int64 _2p31

# qhasm: int64 _m2p32

# qhasm: int64 _m2p48

# qhasm: int64 _2p16a2p32

# qhasm: int64 rax

# qhasm: int64 rdx

# qhasm: int64 t0

# qhasm: int64 t1

# qhasm: int64 t2

# qhasm: int64 h

# qhasm: int64 oldg

# qhasm: int64 i

# qhasm: stack64 stack_r11

# qhasm: stack64 stack_r12

# qhasm: stack64 stack_r13

# qhasm: stack64 stack_r14

# qhasm: stack64 stack_r15

# qhasm: stack64 stack_rbx

# qhasm: stack64 stack_rbp

# qhasm: stack256 stack_m1

# qhasm: stack64 stack_m

# qhasm: stack64 stack_2p16a2p32

# qhasm: stack64 stack_m2p15

# qhasm: stack64 stack_2p16

# qhasm: stack64 stack_2p31

# qhasm: stack64 stack_m2p32

# qhasm: stack64 stack_m2p48

# qhasm: stack64 stack_FVGS

# qhasm: stack256 stack_fxgx

# qhasm: stack256 stack_uuss

# qhasm: stack256 stack_vvrr

# qhasm: stack256 stack_fygy

# qhasm: reg256 carryy

# qhasm: reg256 carryz

# qhasm: reg256 d0

# qhasm: reg256 d1

# qhasm: reg256 out0

# qhasm: reg256 FVGS0

# qhasm: reg256 GSFV0

# qhasm: reg256 out1

# qhasm: reg256 out1plus

# qhasm: reg256 FVGS1

# qhasm: reg256 GSFV1

# qhasm: reg256 out2

# qhasm: reg256 out2plus

# qhasm: reg256 FVGS2

# qhasm: reg256 GSFV2

# qhasm: reg256 out3

# qhasm: reg256 out3plus

# qhasm: reg256 FVGS3

# qhasm: reg256 GSFV3

# qhasm: reg256 out4

# qhasm: reg256 out4plus

# qhasm: reg256 FVGS4

# qhasm: reg256 GSFV4

# qhasm: reg256 out5

# qhasm: reg256 out5plus

# qhasm: reg256 FVGS5

# qhasm: reg256 GSFV5

# qhasm: reg256 out6

# qhasm: reg256 out6plus

# qhasm: reg256 FVGS6

# qhasm: reg256 GSFV6

# qhasm: reg256 out7

# qhasm: reg256 out7plus

# qhasm: reg256 FVGS7

# qhasm: reg256 GSFV7

# qhasm: reg256 out8

# qhasm: reg256 out8plus

# qhasm: reg256 FVGS8

# qhasm: reg256 GSFV8

# qhasm: reg256 out9

# qhasm: reg256 out9plus

# qhasm: reg256 out8plus2

# qhasm: reg256 out10

# qhasm: reg256 ta

# qhasm: reg256 tb

# qhasm: reg256 uuss

# qhasm: reg256 uuss0

# qhasm: reg256 uuss1

# qhasm: reg256 vvrr

# qhasm: reg256 vvrr0

# qhasm: reg256 vvrr1

# qhasm: reg256 _19x4

# qhasm: reg256 _0_19x4

# qhasm: reg256 _32767x4

# qhasm: reg256 _inv19_2p30x4

# qhasm: reg256 _2p30m1x4

# qhasm: reg256 _2p33x4

# qhasm: reg256 _2p48x4

# qhasm: reg256 _2p63x4

# qhasm: reg256 _2p63m2p33x4

# qhasm: stack256 stack_19x4

# qhasm: stack256 stack_0_19x4

# qhasm: stack256 stack_32767x4

# qhasm: stack256 stack_inv19_2p30x4

# qhasm: stack256 stack_2p30m1x4

# qhasm: stack256 stack_2p33x4

# qhasm: stack256 stack_2p48x4

# qhasm: stack256 stack_2p63x4

# qhasm: stack256 stack_2p63m2p33x4

# qhasm: enter innerloop60_transition
.p2align 5
.global _innerloop60_transition
.global innerloop60_transition
_innerloop60_transition:
innerloop60_transition:
mov %rsp,%r11
and $31,%r11
add $512,%r11
sub %r11,%rsp

# qhasm: stack_r11 = caller_r11
# asm 1: movq <caller_r11=int64#9,>stack_r11=stack64#1
# asm 2: movq <caller_r11=%r11,>stack_r11=384(%rsp)
movq %r11,384(%rsp)

# qhasm: stack_r12 = caller_r12
# asm 1: movq <caller_r12=int64#10,>stack_r12=stack64#2
# asm 2: movq <caller_r12=%r12,>stack_r12=392(%rsp)
movq %r12,392(%rsp)

# qhasm: stack_r13 = caller_r13
# asm 1: movq <caller_r13=int64#11,>stack_r13=stack64#3
# asm 2: movq <caller_r13=%r13,>stack_r13=400(%rsp)
movq %r13,400(%rsp)

# qhasm: stack_r14 = caller_r14
# asm 1: movq <caller_r14=int64#12,>stack_r14=stack64#4
# asm 2: movq <caller_r14=%r14,>stack_r14=408(%rsp)
movq %r14,408(%rsp)

# qhasm: stack_r15 = caller_r15
# asm 1: movq <caller_r15=int64#13,>stack_r15=stack64#5
# asm 2: movq <caller_r15=%r15,>stack_r15=416(%rsp)
movq %r15,416(%rsp)

# qhasm: stack_rbx = caller_rbx
# asm 1: movq <caller_rbx=int64#14,>stack_rbx=stack64#6
# asm 2: movq <caller_rbx=%rbx,>stack_rbx=424(%rsp)
movq %rbx,424(%rsp)

# qhasm: stack_rbp = caller_rbp
# asm 1: movq <caller_rbp=int64#15,>stack_rbp=stack64#7
# asm 2: movq <caller_rbp=%rbp,>stack_rbp=432(%rsp)
movq %rbp,432(%rsp)

# qhasm: stack_FVGS = input_0
# asm 1: movq <input_0=int64#1,>stack_FVGS=stack64#8
# asm 2: movq <input_0=%rdi,>stack_FVGS=440(%rsp)
movq %rdi,440(%rsp)

# qhasm: f = mem64[ input_0 + 32]
# asm 1: movq   32(<input_0=int64#1),>f=int64#3
# asm 2: movq   32(<input_0=%rdi),>f=%rdx
movq   32(%rdi),%rdx

# qhasm: g = mem64[ input_0 + 48]
# asm 1: movq   48(<input_0=int64#1),>g=int64#4
# asm 2: movq   48(<input_0=%rdi),>g=%rcx
movq   48(%rdi),%rcx

# qhasm: f <<= 30
# asm 1: shl  $30,<f=int64#3
# asm 2: shl  $30,<f=%rdx
shl  $30,%rdx

# qhasm: g <<= 30
# asm 1: shl  $30,<g=int64#4
# asm 2: shl  $30,<g=%rcx
shl  $30,%rcx

# qhasm: f += mem64[ input_0 + 0]
# asm 1: addq 0(<input_0=int64#1),<f=int64#3
# asm 2: addq 0(<input_0=%rdi),<f=%rdx
addq 0(%rdi),%rdx

# qhasm: g += mem64[ input_0 +16]
# asm 1: addq 16(<input_0=int64#1),<g=int64#4
# asm 2: addq 16(<input_0=%rdi),<g=%rcx
addq 16(%rdi),%rcx

# qhasm:                  m = -1
# asm 1: mov  $-1,>m=int64#1
# asm 2: mov  $-1,>m=%rdi
mov  $-1,%rdi

# qhasm: inplace stack_m1[0] = m
# asm 1: movq <m=int64#1,<stack_m1=stack256#1
# asm 2: movq <m=%rdi,<stack_m1=0(%rsp)
movq %rdi,0(%rsp)

# qhasm:                   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm: inplace stack_m1[1] = z
# asm 1: movq <z=int64#5,<stack_m1=stack256#1
# asm 2: movq <z=%r8,<stack_m1=8(%rsp)
movq %r8,8(%rsp)

# qhasm:            _m2p15 = -32768
# asm 1: mov  $-32768,>_m2p15=int64#5
# asm 2: mov  $-32768,>_m2p15=%r8
mov  $-32768,%r8

# qhasm:       stack_m2p15 = _m2p15
# asm 1: movq <_m2p15=int64#5,>stack_m2p15=stack64#9
# asm 2: movq <_m2p15=%r8,>stack_m2p15=448(%rsp)
movq %r8,448(%rsp)

# qhasm:             _2p16 = 65536
# asm 1: mov  $65536,>_2p16=int64#6
# asm 2: mov  $65536,>_2p16=%r9
mov  $65536,%r9

# qhasm:        stack_2p16 = _2p16
# asm 1: movq <_2p16=int64#6,>stack_2p16=stack64#10
# asm 2: movq <_2p16=%r9,>stack_2p16=456(%rsp)
movq %r9,456(%rsp)

# qhasm:             _2p31 = 2147483648
# asm 1: mov  $2147483648,>_2p31=int64#6
# asm 2: mov  $2147483648,>_2p31=%r9
mov  $2147483648,%r9

# qhasm:        stack_2p31 = _2p31     
# asm 1: movq <_2p31=int64#6,>stack_2p31=stack64#11
# asm 2: movq <_2p31=%r9,>stack_2p31=464(%rsp)
movq %r9,464(%rsp)

# qhasm:            _m2p32 = -4294967296
# asm 1: mov  $-4294967296,>_m2p32=int64#6
# asm 2: mov  $-4294967296,>_m2p32=%r9
mov  $-4294967296,%r9

# qhasm:       stack_m2p32 = _m2p32
# asm 1: movq <_m2p32=int64#6,>stack_m2p32=stack64#12
# asm 2: movq <_m2p32=%r9,>stack_m2p32=472(%rsp)
movq %r9,472(%rsp)

# qhasm:            _m2p48 = -281474976710656
# asm 1: mov  $-281474976710656,>_m2p48=int64#6
# asm 2: mov  $-281474976710656,>_m2p48=%r9
mov  $-281474976710656,%r9

# qhasm:       stack_m2p48 = _m2p48
# asm 1: movq <_m2p48=int64#6,>stack_m2p48=stack64#13
# asm 2: movq <_m2p48=%r9,>stack_m2p48=480(%rsp)
movq %r9,480(%rsp)

# qhasm:        _2p16a2p32 = 4295032832
# asm 1: mov  $4295032832,>_2p16a2p32=int64#6
# asm 2: mov  $4295032832,>_2p16a2p32=%r9
mov  $4295032832,%r9

# qhasm:   stack_2p16a2p32 = _2p16a2p32
# asm 1: movq <_2p16a2p32=int64#6,>stack_2p16a2p32=stack64#14
# asm 2: movq <_2p16a2p32=%r9,>stack_2p16a2p32=488(%rsp)
movq %r9,488(%rsp)

# qhasm: _19x4 = mem256[ input_1 +   0 ]
# asm 1: vmovupd   0(<input_1=int64#2),>_19x4=reg256#1
# asm 2: vmovupd   0(<input_1=%rsi),>_19x4=%ymm0
vmovupd   0(%rsi),%ymm0

# qhasm: stack_19x4 = _19x4
# asm 1: vmovapd <_19x4=reg256#1,>stack_19x4=stack256#2
# asm 2: vmovapd <_19x4=%ymm0,>stack_19x4=32(%rsp)
vmovapd %ymm0,32(%rsp)

# qhasm: _0_19x4 = mem256[ input_1 +  32 ]
# asm 1: vmovupd   32(<input_1=int64#2),>_0_19x4=reg256#1
# asm 2: vmovupd   32(<input_1=%rsi),>_0_19x4=%ymm0
vmovupd   32(%rsi),%ymm0

# qhasm: stack_0_19x4 = _0_19x4
# asm 1: vmovapd <_0_19x4=reg256#1,>stack_0_19x4=stack256#3
# asm 2: vmovapd <_0_19x4=%ymm0,>stack_0_19x4=64(%rsp)
vmovapd %ymm0,64(%rsp)

# qhasm: _32767x4 = mem256[ input_1 +  64 ]
# asm 1: vmovupd   64(<input_1=int64#2),>_32767x4=reg256#1
# asm 2: vmovupd   64(<input_1=%rsi),>_32767x4=%ymm0
vmovupd   64(%rsi),%ymm0

# qhasm: stack_32767x4 = _32767x4
# asm 1: vmovapd <_32767x4=reg256#1,>stack_32767x4=stack256#4
# asm 2: vmovapd <_32767x4=%ymm0,>stack_32767x4=96(%rsp)
vmovapd %ymm0,96(%rsp)

# qhasm: _inv19_2p30x4 = mem256[ input_1 +  96 ]
# asm 1: vmovupd   96(<input_1=int64#2),>_inv19_2p30x4=reg256#1
# asm 2: vmovupd   96(<input_1=%rsi),>_inv19_2p30x4=%ymm0
vmovupd   96(%rsi),%ymm0

# qhasm: stack_inv19_2p30x4 = _inv19_2p30x4
# asm 1: vmovapd <_inv19_2p30x4=reg256#1,>stack_inv19_2p30x4=stack256#5
# asm 2: vmovapd <_inv19_2p30x4=%ymm0,>stack_inv19_2p30x4=128(%rsp)
vmovapd %ymm0,128(%rsp)

# qhasm: _2p30m1x4 = mem256[ input_1 + 128 ]
# asm 1: vmovupd   128(<input_1=int64#2),>_2p30m1x4=reg256#1
# asm 2: vmovupd   128(<input_1=%rsi),>_2p30m1x4=%ymm0
vmovupd   128(%rsi),%ymm0

# qhasm: stack_2p30m1x4 = _2p30m1x4
# asm 1: vmovapd <_2p30m1x4=reg256#1,>stack_2p30m1x4=stack256#6
# asm 2: vmovapd <_2p30m1x4=%ymm0,>stack_2p30m1x4=160(%rsp)
vmovapd %ymm0,160(%rsp)

# qhasm: _2p33x4 = mem256[ input_1 + 160 ]
# asm 1: vmovupd   160(<input_1=int64#2),>_2p33x4=reg256#1
# asm 2: vmovupd   160(<input_1=%rsi),>_2p33x4=%ymm0
vmovupd   160(%rsi),%ymm0

# qhasm: stack_2p33x4 = _2p33x4
# asm 1: vmovapd <_2p33x4=reg256#1,>stack_2p33x4=stack256#7
# asm 2: vmovapd <_2p33x4=%ymm0,>stack_2p33x4=192(%rsp)
vmovapd %ymm0,192(%rsp)

# qhasm: _2p48x4 = mem256[ input_1 + 192 ]
# asm 1: vmovupd   192(<input_1=int64#2),>_2p48x4=reg256#1
# asm 2: vmovupd   192(<input_1=%rsi),>_2p48x4=%ymm0
vmovupd   192(%rsi),%ymm0

# qhasm: stack_2p48x4 = _2p48x4
# asm 1: vmovapd <_2p48x4=reg256#1,>stack_2p48x4=stack256#8
# asm 2: vmovapd <_2p48x4=%ymm0,>stack_2p48x4=224(%rsp)
vmovapd %ymm0,224(%rsp)

# qhasm: _2p63x4 = mem256[ input_1 + 224 ]
# asm 1: vmovupd   224(<input_1=int64#2),>_2p63x4=reg256#1
# asm 2: vmovupd   224(<input_1=%rsi),>_2p63x4=%ymm0
vmovupd   224(%rsi),%ymm0

# qhasm: stack_2p63x4 = _2p63x4
# asm 1: vmovapd <_2p63x4=reg256#1,>stack_2p63x4=stack256#9
# asm 2: vmovapd <_2p63x4=%ymm0,>stack_2p63x4=256(%rsp)
vmovapd %ymm0,256(%rsp)

# qhasm: _2p63m2p33x4 = mem256[ input_1 + 256 ]
# asm 1: vmovupd   256(<input_1=int64#2),>_2p63m2p33x4=reg256#1
# asm 2: vmovupd   256(<input_1=%rsi),>_2p63m2p33x4=%ymm0
vmovupd   256(%rsi),%ymm0

# qhasm: i = 12
# asm 1: mov  $12,>i=int64#2
# asm 2: mov  $12,>i=%rsi
mov  $12,%rsi

# qhasm: nop
nop

# qhasm: nop
nop

# qhasm: bigloop:
._bigloop:

# qhasm:   loop = 4
# asm 1: mov  $4,>loop=int64#6
# asm 2: mov  $4,>loop=%r9
mov  $4,%r9

# qhasm: loop15:
._loop15:

# qhasm:   fuv = f & ~ _m2p15
# asm 1: andn  <f=int64#3,<_m2p15=int64#5,>fuv=int64#7
# asm 2: andn  <f=%rdx,<_m2p15=%r8,>fuv=%rax
andn  %rdx,%r8,%rax

# qhasm:   grs = g & ~ _m2p15
# asm 1: andn  <g=int64#4,<_m2p15=int64#5,>grs=int64#8
# asm 2: andn  <g=%rcx,<_m2p15=%r8,>grs=%r10
andn  %rcx,%r8,%r10

# qhasm:   fuv |= stack_m2p32
# asm 1: orq  <stack_m2p32=stack64#12,<fuv=int64#7
# asm 2: orq  <stack_m2p32=472(%rsp),<fuv=%rax
orq  472(%rsp),%rax

# qhasm:   grs |= stack_m2p48
# asm 1: orq  <stack_m2p48=stack64#13,<grs=int64#8
# asm 2: orq  <stack_m2p48=480(%rsp),<grs=%r10
orq  480(%rsp),%r10

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = 0
# asm 1: xor  >z=int64#9,>z=int64#9
# asm 2: xor  >z=%r11,>z=%r11
xor  %r11,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = 0
# asm 1: xor  >z=int64#9,>z=int64#9
# asm 2: xor  >z=%r11,>z=%r11
xor  %r11,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = 0
# asm 1: xor  >z=int64#9,>z=int64#9
# asm 2: xor  >z=%r11,>z=%r11
xor  %r11,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = 0
# asm 1: xor  >z=int64#9,>z=int64#9
# asm 2: xor  >z=%r11,>z=%r11
xor  %r11,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = stack_m1[1]
# asm 1: movq <stack_m1=stack256#1,>z=int64#9
# asm 2: movq <stack_m1=8(%rsp),>z=%r11
movq 8(%rsp),%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   z = 0
# asm 1: xor  >z=int64#9,>z=int64#9
# asm 2: xor  >z=%r11,>z=%r11
xor  %r11,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#8,<fuv=int64#7),>h=int64#10
# asm 2: lea  (<grs=%r10,<fuv=%rax),>h=%r12
lea  (%r10,%rax),%r12

# qhasm:   mnew = -1
# asm 1: mov  $-1,>mnew=int64#11
# asm 2: mov  $-1,>mnew=%r13
mov  $-1,%r13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#8,>oldg=int64#12
# asm 2: mov  <grs=%r10,>oldg=%r14
mov  %r10,%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#8
# asm 2: test  $1,<grs=%r10
test  $1,%r10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#8,<h=int64#10
# asm 2: cmove <grs=%r10,<h=%r12
cmove %r10,%r12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#1,<z=int64#9
# asm 2: cmovne <m=%rdi,<z=%r11
cmovne %rdi,%r11

# qhasm:   mnew ^= m
# asm 1: xor  <m=int64#1,<mnew=int64#11
# asm 2: xor  <m=%rdi,<mnew=%r13
xor  %rdi,%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#8
# asm 2: sub  <fuv=%rax,<grs=%r10
sub  %rax,%r10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#8
# asm 2: sar  $1,<grs=%r10
sar  $1,%r10

# qhasm:   m -= 1
# asm 1: dec <m=int64#1
# asm 2: dec <m=%rdi
dec %rdi

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#9
# asm 2: cmp  $0,<z=%r11
cmp  $0,%r11

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#12,<fuv=int64#7
# asm 2: cmovl <oldg=%r14,<fuv=%rax
cmovl %r14,%rax

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#10,<grs=int64#8
# asm 2: cmovge <h=%r12,<grs=%r10
cmovge %r12,%r10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#1
# asm 2: cmovl <mnew=%r13,<m=%rdi
cmovl %r13,%rdi

# qhasm:   =? loop -= 1		
# asm 1: dec <loop=int64#6
# asm 2: dec <loop=%r9
dec %r9
# comment:fp stack unchanged by jump

# qhasm: goto lastloop if =
je ._lastloop

# qhasm: extract:
._extract:

# qhasm:   _2p16a2p32 = stack_2p16a2p32
# asm 1: movq <stack_2p16a2p32=stack64#14,>_2p16a2p32=int64#9
# asm 2: movq <stack_2p16a2p32=488(%rsp),>_2p16a2p32=%r11
movq 488(%rsp),%r11

# qhasm:   s = grs + _2p16a2p32
# asm 1: lea  (<grs=int64#8,<_2p16a2p32=int64#9),>s=int64#10
# asm 2: lea  (<grs=%r10,<_2p16a2p32=%r11),>s=%r12
lea  (%r10,%r11),%r12

# qhasm:   (int64) s >>= 33
# asm 1: sar  $33,<s=int64#10
# asm 2: sar  $33,<s=%r12
sar  $33,%r12

# qhasm:   t2 = g
# asm 1: mov  <g=int64#4,>t2=int64#11
# asm 2: mov  <g=%rcx,>t2=%r13
mov  %rcx,%r13

# qhasm:   g *= s  
# asm 1: imul  <s=int64#10,<g=int64#4
# asm 2: imul  <s=%r12,<g=%rcx
imul  %r12,%rcx

# qhasm:   v = fuv + _2p16a2p32
# asm 1: lea  (<fuv=int64#7,<_2p16a2p32=int64#9),>v=int64#9
# asm 2: lea  (<fuv=%rax,<_2p16a2p32=%r11),>v=%r11
lea  (%rax,%r11),%r11

# qhasm:   (int64) v >>= 33
# asm 1: sar  $33,<v=int64#9
# asm 2: sar  $33,<v=%r11
sar  $33,%r11

# qhasm:   t2 *= v
# asm 1: imul  <v=int64#9,<t2=int64#11
# asm 2: imul  <v=%r11,<t2=%r13
imul  %r11,%r13

# qhasm:   _2p16 = stack_2p16
# asm 1: movq <stack_2p16=stack64#10,>_2p16=int64#12
# asm 2: movq <stack_2p16=456(%rsp),>_2p16=%r14
movq 456(%rsp),%r14

# qhasm:   grs += _2p16
# asm 1: add  <_2p16=int64#12,<grs=int64#8
# asm 2: add  <_2p16=%r14,<grs=%r10
add  %r14,%r10

# qhasm:   (int64) grs >>= 17
# asm 1: sar  $17,<grs=int64#8
# asm 2: sar  $17,<grs=%r10
sar  $17,%r10

# qhasm:   r = (int16) grs
# asm 1: movsx <grs=int64#8w,>r=int64#8
# asm 2: movsx <grs=%r10w,>r=%r10
movsx %r10w,%r10

# qhasm:       rax = f
# asm 1: mov  <f=int64#3,>rax=int64#13
# asm 2: mov  <f=%rdx,>rax=%r15
mov  %rdx,%r15

# qhasm:       rax *= r
# asm 1: imul  <r=int64#8,<rax=int64#13
# asm 2: imul  <r=%r10,<rax=%r15
imul  %r10,%r15

# qhasm:   fuv += _2p16
# asm 1: add  <_2p16=int64#12,<fuv=int64#7
# asm 2: add  <_2p16=%r14,<fuv=%rax
add  %r14,%rax

# qhasm:   (int64) fuv >>= 17
# asm 1: sar  $17,<fuv=int64#7
# asm 2: sar  $17,<fuv=%rax
sar  $17,%rax

# qhasm:   u = (int16) fuv
# asm 1: movsx <fuv=int64#7w,>u=int64#7
# asm 2: movsx <fuv=%ax,>u=%rax
movsx %ax,%rax

# qhasm:        f *= u
# asm 1: imul  <u=int64#7,<f=int64#3
# asm 2: imul  <u=%rax,<f=%rdx
imul  %rax,%rdx

# qhasm:        f += t2
# asm 1: add  <t2=int64#11,<f=int64#3
# asm 2: add  <t2=%r13,<f=%rdx
add  %r13,%rdx

# qhasm:        g += rax
# asm 1: add  <rax=int64#13,<g=int64#4
# asm 2: add  <rax=%r15,<g=%rcx
add  %r15,%rcx

# qhasm:        (int64) f >>= 15
# asm 1: sar  $15,<f=int64#3
# asm 2: sar  $15,<f=%rdx
sar  $15,%rdx

# qhasm:        (int64) g >>= 15
# asm 1: sar  $15,<g=int64#4
# asm 2: sar  $15,<g=%rcx
sar  $15,%rcx

# qhasm:   =? loop - 3  
# asm 1: cmp  $3,<loop=int64#6
# asm 2: cmp  $3,<loop=%r9
cmp  $3,%r9
# comment:fp stack unchanged by jump

# qhasm:   goto first_loop if =
je ._first_loop

# qhasm:   t0 = stack_uuss[0]
# asm 1: movq <stack_uuss=stack256#10,>t0=int64#11
# asm 2: movq <stack_uuss=288(%rsp),>t0=%r13
movq 288(%rsp),%r13

# qhasm:   t0 *= u
# asm 1: imul  <u=int64#7,<t0=int64#11
# asm 2: imul  <u=%rax,<t0=%r13
imul  %rax,%r13

# qhasm:   t1 = stack_vvrr[2]
# asm 1: movq <stack_vvrr=stack256#11,>t1=int64#12
# asm 2: movq <stack_vvrr=336(%rsp),>t1=%r14
movq 336(%rsp),%r14

# qhasm:   t1 *= v
# asm 1: imul  <v=int64#9,<t1=int64#12
# asm 2: imul  <v=%r11,<t1=%r14
imul  %r11,%r14

# qhasm: int64 rtimesoldv

# qhasm: int64 stimesolds

# qhasm:   rtimesoldv = stack_vvrr[0]
# asm 1: movq <stack_vvrr=stack256#11,>rtimesoldv=int64#13
# asm 2: movq <stack_vvrr=320(%rsp),>rtimesoldv=%r15
movq 320(%rsp),%r15

# qhasm:   u *= rtimesoldv
# asm 1: imul  <rtimesoldv=int64#13,<u=int64#7
# asm 2: imul  <rtimesoldv=%r15,<u=%rax
imul  %r15,%rax

# qhasm:   stimesolds = stack_uuss[2]
# asm 1: movq <stack_uuss=stack256#10,>stimesolds=int64#14
# asm 2: movq <stack_uuss=304(%rsp),>stimesolds=%rbx
movq 304(%rsp),%rbx

# qhasm:   v *= stimesolds
# asm 1: imul  <stimesolds=int64#14,<v=int64#9
# asm 2: imul  <stimesolds=%rbx,<v=%r11
imul  %rbx,%r11

# qhasm:   rtimesoldv *= r
# asm 1: imul  <r=int64#8,<rtimesoldv=int64#13
# asm 2: imul  <r=%r10,<rtimesoldv=%r15
imul  %r10,%r15

# qhasm:   stimesolds *= s
# asm 1: imul  <s=int64#10,<stimesolds=int64#14
# asm 2: imul  <s=%r12,<stimesolds=%rbx
imul  %r12,%rbx

# qhasm:   r *= stack_uuss[0]
# asm 1: imulq <stack_uuss=stack256#10,<r=int64#8
# asm 2: imulq <stack_uuss=288(%rsp),<r=%r10
imulq 288(%rsp),%r10

# qhasm:   s *= stack_vvrr[2]
# asm 1: imulq <stack_vvrr=stack256#11,<s=int64#10
# asm 2: imulq <stack_vvrr=336(%rsp),<s=%r12
imulq 336(%rsp),%r12

# qhasm:   v += u
# asm 1: add  <u=int64#7,<v=int64#9
# asm 2: add  <u=%rax,<v=%r11
add  %rax,%r11

# qhasm:   u = t0 + t1
# asm 1: lea  (<t0=int64#11,<t1=int64#12),>u=int64#7
# asm 2: lea  (<t0=%r13,<t1=%r14),>u=%rax
lea  (%r13,%r14),%rax

# qhasm:   r += s
# asm 1: add  <s=int64#10,<r=int64#8
# asm 2: add  <s=%r12,<r=%r10
add  %r12,%r10

# qhasm:   s = rtimesoldv + stimesolds
# asm 1: lea  (<rtimesoldv=int64#13,<stimesolds=int64#14),>s=int64#10
# asm 2: lea  (<rtimesoldv=%r15,<stimesolds=%rbx),>s=%r12
lea  (%r15,%rbx),%r12
# comment:fp stack unchanged by fallthrough

# qhasm: first_loop:
._first_loop:

# qhasm:   inplace stack_vvrr[0] = v
# asm 1: movq <v=int64#9,<stack_vvrr=stack256#11
# asm 2: movq <v=%r11,<stack_vvrr=320(%rsp)
movq %r11,320(%rsp)

# qhasm:   inplace stack_uuss[0] = u
# asm 1: movq <u=int64#7,<stack_uuss=stack256#10
# asm 2: movq <u=%rax,<stack_uuss=288(%rsp)
movq %rax,288(%rsp)

# qhasm:   inplace stack_uuss[2] = s
# asm 1: movq <s=int64#10,<stack_uuss=stack256#10
# asm 2: movq <s=%r12,<stack_uuss=304(%rsp)
movq %r12,304(%rsp)

# qhasm:   inplace stack_vvrr[2] = r
# asm 1: movq <r=int64#8,<stack_vvrr=stack256#11
# asm 2: movq <r=%r10,<stack_vvrr=336(%rsp)
movq %r10,336(%rsp)
# comment:fp stack unchanged by jump

# qhasm: goto loop15 
jmp ._loop15

# qhasm: lastloop:
._lastloop:

# qhasm:   _2p16a2p32 = stack_2p16a2p32
# asm 1: movq <stack_2p16a2p32=stack64#14,>_2p16a2p32=int64#3
# asm 2: movq <stack_2p16a2p32=488(%rsp),>_2p16a2p32=%rdx
movq 488(%rsp),%rdx

# qhasm:   s = grs + _2p16a2p32
# asm 1: lea  (<grs=int64#8,<_2p16a2p32=int64#3),>s=int64#4
# asm 2: lea  (<grs=%r10,<_2p16a2p32=%rdx),>s=%rcx
lea  (%r10,%rdx),%rcx

# qhasm:   (int64) s >>= 33
# asm 1: sar  $33,<s=int64#4
# asm 2: sar  $33,<s=%rcx
sar  $33,%rcx

# qhasm:   v = fuv + _2p16a2p32
# asm 1: lea  (<fuv=int64#7,<_2p16a2p32=int64#3),>v=int64#3
# asm 2: lea  (<fuv=%rax,<_2p16a2p32=%rdx),>v=%rdx
lea  (%rax,%rdx),%rdx

# qhasm:   (int64) v >>= 33
# asm 1: sar  $33,<v=int64#3
# asm 2: sar  $33,<v=%rdx
sar  $33,%rdx

# qhasm:   t1 = stack_vvrr[2]
# asm 1: movq <stack_vvrr=stack256#11,>t1=int64#6
# asm 2: movq <stack_vvrr=336(%rsp),>t1=%r9
movq 336(%rsp),%r9

# qhasm:   t1 *= v
# asm 1: imul  <v=int64#3,<t1=int64#6
# asm 2: imul  <v=%rdx,<t1=%r9
imul  %rdx,%r9

# qhasm:   stimesolds = stack_uuss[2]
# asm 1: movq <stack_uuss=stack256#10,>stimesolds=int64#9
# asm 2: movq <stack_uuss=304(%rsp),>stimesolds=%r11
movq 304(%rsp),%r11

# qhasm:   v *= stimesolds
# asm 1: imul  <stimesolds=int64#9,<v=int64#3
# asm 2: imul  <stimesolds=%r11,<v=%rdx
imul  %r11,%rdx

# qhasm:   stimesolds *= s
# asm 1: imul  <s=int64#4,<stimesolds=int64#9
# asm 2: imul  <s=%rcx,<stimesolds=%r11
imul  %rcx,%r11

# qhasm:   _2p16 = stack_2p16
# asm 1: movq <stack_2p16=stack64#10,>_2p16=int64#10
# asm 2: movq <stack_2p16=456(%rsp),>_2p16=%r12
movq 456(%rsp),%r12

# qhasm:   grs += _2p16
# asm 1: add  <_2p16=int64#10,<grs=int64#8
# asm 2: add  <_2p16=%r12,<grs=%r10
add  %r12,%r10

# qhasm:   (int64) grs >>= 17
# asm 1: sar  $17,<grs=int64#8
# asm 2: sar  $17,<grs=%r10
sar  $17,%r10

# qhasm:   r = (int16) grs
# asm 1: movsx <grs=int64#8w,>r=int64#8
# asm 2: movsx <grs=%r10w,>r=%r10
movsx %r10w,%r10

# qhasm:   fuv += _2p16
# asm 1: add  <_2p16=int64#10,<fuv=int64#7
# asm 2: add  <_2p16=%r12,<fuv=%rax
add  %r12,%rax

# qhasm:   (int64) fuv >>= 17
# asm 1: sar  $17,<fuv=int64#7
# asm 2: sar  $17,<fuv=%rax
sar  $17,%rax

# qhasm:   u = (int16) fuv
# asm 1: movsx <fuv=int64#7w,>u=int64#7
# asm 2: movsx <fuv=%ax,>u=%rax
movsx %ax,%rax

# qhasm: FVGS = stack_FVGS
# asm 1: movq <stack_FVGS=stack64#8,>FVGS=int64#10
# asm 2: movq <stack_FVGS=440(%rsp),>FVGS=%r12
movq 440(%rsp),%r12

# qhasm:   t0 = stack_uuss[0]
# asm 1: movq <stack_uuss=stack256#10,>t0=int64#11
# asm 2: movq <stack_uuss=288(%rsp),>t0=%r13
movq 288(%rsp),%r13

# qhasm:   t0 *= u
# asm 1: imul  <u=int64#7,<t0=int64#11
# asm 2: imul  <u=%rax,<t0=%r13
imul  %rax,%r13

# qhasm:   rtimesoldv = stack_vvrr[0]
# asm 1: movq <stack_vvrr=stack256#11,>rtimesoldv=int64#12
# asm 2: movq <stack_vvrr=320(%rsp),>rtimesoldv=%r14
movq 320(%rsp),%r14

# qhasm:   u *= rtimesoldv
# asm 1: imul  <rtimesoldv=int64#12,<u=int64#7
# asm 2: imul  <rtimesoldv=%r14,<u=%rax
imul  %r14,%rax

# qhasm:   rtimesoldv *= r
# asm 1: imul  <r=int64#8,<rtimesoldv=int64#12
# asm 2: imul  <r=%r10,<rtimesoldv=%r14
imul  %r10,%r14

# qhasm:   s *= stack_vvrr[2]
# asm 1: imulq <stack_vvrr=stack256#11,<s=int64#4
# asm 2: imulq <stack_vvrr=336(%rsp),<s=%rcx
imulq 336(%rsp),%rcx

# qhasm:   r *= stack_uuss[0]
# asm 1: imulq <stack_uuss=stack256#10,<r=int64#8
# asm 2: imulq <stack_uuss=288(%rsp),<r=%r10
imulq 288(%rsp),%r10

# qhasm: FVGS0 = mem256[ FVGS +   0 ]
# asm 1: vmovupd   0(<FVGS=int64#10),>FVGS0=reg256#2
# asm 2: vmovupd   0(<FVGS=%r12),>FVGS0=%ymm1
vmovupd   0(%r12),%ymm1

# qhasm:   v += u
# asm 1: add  <u=int64#7,<v=int64#3
# asm 2: add  <u=%rax,<v=%rdx
add  %rax,%rdx

# qhasm:   u = t0 + t1
# asm 1: lea  (<t0=int64#11,<t1=int64#6),>u=int64#6
# asm 2: lea  (<t0=%r13,<t1=%r9),>u=%r9
lea  (%r13,%r9),%r9

# qhasm:   r += s
# asm 1: add  <s=int64#4,<r=int64#8
# asm 2: add  <s=%rcx,<r=%r10
add  %rcx,%r10

# qhasm:   s = rtimesoldv + stimesolds
# asm 1: lea  (<rtimesoldv=int64#12,<stimesolds=int64#9),>s=int64#4
# asm 2: lea  (<rtimesoldv=%r14,<stimesolds=%r11),>s=%rcx
lea  (%r14,%r11),%rcx

# qhasm: new uuss

# qhasm: new vvrr

# qhasm: uuss = u,uuss[1],0,0
# asm 1: vpinsrq $0x0,<u=int64#6,<uuss=reg256#3%128,<uuss=reg256#3%128
# asm 2: vpinsrq $0x0,<u=%r9,<uuss=%xmm2,<uuss=%xmm2
vpinsrq $0x0,%r9,%xmm2,%xmm2

# qhasm: vvrr = v,vvrr[1],0,0
# asm 1: vpinsrq $0x0,<v=int64#3,<vvrr=reg256#4%128,<vvrr=reg256#4%128
# asm 2: vpinsrq $0x0,<v=%rdx,<vvrr=%xmm3,<vvrr=%xmm3
vpinsrq $0x0,%rdx,%xmm3,%xmm3

# qhasm: uuss = uuss[0],s,0,0
# asm 1: vpinsrq $0x1,<s=int64#4,<uuss=reg256#3%128,<uuss=reg256#3%128
# asm 2: vpinsrq $0x1,<s=%rcx,<uuss=%xmm2,<uuss=%xmm2
vpinsrq $0x1,%rcx,%xmm2,%xmm2

# qhasm: vvrr = vvrr[0],r,0,0
# asm 1: vpinsrq $0x1,<r=int64#8,<vvrr=reg256#4%128,<vvrr=reg256#4%128
# asm 2: vpinsrq $0x1,<r=%r10,<vvrr=%xmm3,<vvrr=%xmm3
vpinsrq $0x1,%r10,%xmm3,%xmm3

# qhasm: GSFV0 = FVGS0[1,0]
# asm 1: vpermq $0x4e,<FVGS0=reg256#2,>GSFV0=reg256#5
# asm 2: vpermq $0x4e,<FVGS0=%ymm1,>GSFV0=%ymm4
vpermq $0x4e,%ymm1,%ymm4

# qhasm: uuss = uuss[0,0,1,1]
# asm 1: vpermq $0x50,<uuss=reg256#3,>uuss=reg256#3
# asm 2: vpermq $0x50,<uuss=%ymm2,>uuss=%ymm2
vpermq $0x50,%ymm2,%ymm2

# qhasm: vvrr = vvrr[0,0,1,1]
# asm 1: vpermq $0x50,<vvrr=reg256#4,>vvrr=reg256#4
# asm 2: vpermq $0x50,<vvrr=%ymm3,>vvrr=%ymm3
vpermq $0x50,%ymm3,%ymm3

# qhasm: _2p30m1x4 = stack_2p30m1x4
# asm 1: vmovapd <stack_2p30m1x4=stack256#6,>_2p30m1x4=reg256#6
# asm 2: vmovapd <stack_2p30m1x4=160(%rsp),>_2p30m1x4=%ymm5
vmovapd 160(%rsp),%ymm5

# qhasm: uuss0 = uuss & _2p30m1x4
# asm 1: vpand <uuss=reg256#3,<_2p30m1x4=reg256#6,>uuss0=reg256#7
# asm 2: vpand <uuss=%ymm2,<_2p30m1x4=%ymm5,>uuss0=%ymm6
vpand %ymm2,%ymm5,%ymm6

# qhasm: vvrr0 = vvrr & _2p30m1x4
# asm 1: vpand <vvrr=reg256#4,<_2p30m1x4=reg256#6,>vvrr0=reg256#8
# asm 2: vpand <vvrr=%ymm3,<_2p30m1x4=%ymm5,>vvrr0=%ymm7
vpand %ymm3,%ymm5,%ymm7

# qhasm: 4x ta = int32 uuss0 * int32 FVGS0
# asm 1: vpmuldq <uuss0=reg256#7,<FVGS0=reg256#2,>ta=reg256#9
# asm 2: vpmuldq <uuss0=%ymm6,<FVGS0=%ymm1,>ta=%ymm8
vpmuldq %ymm6,%ymm1,%ymm8

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV0
# asm 1: vpmuldq <vvrr0=reg256#8,<GSFV0=reg256#5,>tb=reg256#10
# asm 2: vpmuldq <vvrr0=%ymm7,<GSFV0=%ymm4,>tb=%ymm9
vpmuldq %ymm7,%ymm4,%ymm9

# qhasm: 4x out0 = ta + tb
# asm 1: vpaddq <ta=reg256#9,<tb=reg256#10,>out0=reg256#9
# asm 2: vpaddq <ta=%ymm8,<tb=%ymm9,>out0=%ymm8
vpaddq %ymm8,%ymm9,%ymm8

# qhasm: _inv19_2p30x4 = stack_inv19_2p30x4
# asm 1: vmovapd <stack_inv19_2p30x4=stack256#5,>_inv19_2p30x4=reg256#10
# asm 2: vmovapd <stack_inv19_2p30x4=128(%rsp),>_inv19_2p30x4=%ymm9
vmovapd 128(%rsp),%ymm9

# qhasm: _19x4 = stack_19x4
# asm 1: vmovapd <stack_19x4=stack256#2,>_19x4=reg256#11
# asm 2: vmovapd <stack_19x4=32(%rsp),>_19x4=%ymm10
vmovapd 32(%rsp),%ymm10

# qhasm: 4x d0 = int32 out0 * int32 _inv19_2p30x4
# asm 1: vpmuldq <out0=reg256#9,<_inv19_2p30x4=reg256#10,>d0=reg256#12
# asm 2: vpmuldq <out0=%ymm8,<_inv19_2p30x4=%ymm9,>d0=%ymm11
vpmuldq %ymm8,%ymm9,%ymm11

# qhasm: d0 &= _2p30m1x4
# asm 1: vpand <d0=reg256#12,<_2p30m1x4=reg256#6,<d0=reg256#12
# asm 2: vpand <d0=%ymm11,<_2p30m1x4=%ymm5,<d0=%ymm11
vpand %ymm11,%ymm5,%ymm11

# qhasm: reg256 d0x19

# qhasm: 4x d0x19 = int32 d0 * int32 _19x4
# asm 1: vpmuldq <d0=reg256#12,<_19x4=reg256#11,>d0x19=reg256#13
# asm 2: vpmuldq <d0=%ymm11,<_19x4=%ymm10,>d0x19=%ymm12
vpmuldq %ymm11,%ymm10,%ymm12

# qhasm: 4x out0 -= d0x19
# asm 1: vpsubq <d0x19=reg256#13,<out0=reg256#9,<out0=reg256#9
# asm 2: vpsubq <d0x19=%ymm12,<out0=%ymm8,<out0=%ymm8
vpsubq %ymm12,%ymm8,%ymm8

# qhasm: 4x carryy = out0 + stack_2p63x4
# asm 1: vpaddq <stack_2p63x4=stack256#9,<out0=reg256#9,>carryy=reg256#9
# asm 2: vpaddq <stack_2p63x4=256(%rsp),<out0=%ymm8,>carryy=%ymm8
vpaddq 256(%rsp),%ymm8,%ymm8

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#9,<carryy=reg256#9
# asm 2: vpsrlq $30,<carryy=%ymm8,<carryy=%ymm8
vpsrlq $30,%ymm8,%ymm8

# qhasm: 4x out8plus2 = d0 << 15
# asm 1: vpsllq $15,<d0=reg256#12,>out8plus2=reg256#12
# asm 2: vpsllq $15,<d0=%ymm11,>out8plus2=%ymm11
vpsllq $15,%ymm11,%ymm11

# qhasm: FVGS1 = mem256[ FVGS +  32 ]
# asm 1: vmovupd   32(<FVGS=int64#10),>FVGS1=reg256#13
# asm 2: vmovupd   32(<FVGS=%r12),>FVGS1=%ymm12
vmovupd   32(%r12),%ymm12

# qhasm: GSFV1 = FVGS1[1,0]
# asm 1: vpermq $0x4e,<FVGS1=reg256#13,>GSFV1=reg256#14
# asm 2: vpermq $0x4e,<FVGS1=%ymm12,>GSFV1=%ymm13
vpermq $0x4e,%ymm12,%ymm13

# qhasm: 4x ta = int32 uuss0 * int32 FVGS1
# asm 1: vpmuldq <uuss0=reg256#7,<FVGS1=reg256#13,>ta=reg256#15
# asm 2: vpmuldq <uuss0=%ymm6,<FVGS1=%ymm12,>ta=%ymm14
vpmuldq %ymm6,%ymm12,%ymm14

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV1
# asm 1: vpmuldq <vvrr0=reg256#8,<GSFV1=reg256#14,>tb=reg256#16
# asm 2: vpmuldq <vvrr0=%ymm7,<GSFV1=%ymm13,>tb=%ymm15
vpmuldq %ymm7,%ymm13,%ymm15

# qhasm: 4x out1plus = ta + tb
# asm 1: vpaddq <ta=reg256#15,<tb=reg256#16,>out1plus=reg256#15
# asm 2: vpaddq <ta=%ymm14,<tb=%ymm15,>out1plus=%ymm14
vpaddq %ymm14,%ymm15,%ymm14

# qhasm: 4x uuss1 = uuss unsigned>> 30
# asm 1: vpsrlq $30,<uuss=reg256#3,>uuss1=reg256#3
# asm 2: vpsrlq $30,<uuss=%ymm2,>uuss1=%ymm2
vpsrlq $30,%ymm2,%ymm2

# qhasm: 4x vvrr1 = vvrr unsigned>> 30
# asm 1: vpsrlq $30,<vvrr=reg256#4,>vvrr1=reg256#4
# asm 2: vpsrlq $30,<vvrr=%ymm3,>vvrr1=%ymm3
vpsrlq $30,%ymm3,%ymm3

# qhasm: 4x ta = int32 uuss1 * int32 FVGS0
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS0=reg256#2,>ta=reg256#2
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS0=%ymm1,>ta=%ymm1
vpmuldq %ymm2,%ymm1,%ymm1

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV0
# asm 1: vpmuldq <vvrr1=reg256#4,<GSFV0=reg256#5,>tb=reg256#5
# asm 2: vpmuldq <vvrr1=%ymm3,<GSFV0=%ymm4,>tb=%ymm4
vpmuldq %ymm3,%ymm4,%ymm4

# qhasm: 4x out1 = ta + tb
# asm 1: vpaddq <ta=reg256#2,<tb=reg256#5,>out1=reg256#2
# asm 2: vpaddq <ta=%ymm1,<tb=%ymm4,>out1=%ymm1
vpaddq %ymm1,%ymm4,%ymm1

# qhasm: 4x out1 += out1plus
# asm 1: vpaddq <out1=reg256#2,<out1plus=reg256#15,<out1=reg256#2
# asm 2: vpaddq <out1=%ymm1,<out1plus=%ymm14,<out1=%ymm1
vpaddq %ymm1,%ymm14,%ymm1

# qhasm: 4x out1 += carryy
# asm 1: vpaddq <out1=reg256#2,<carryy=reg256#9,<out1=reg256#2
# asm 2: vpaddq <out1=%ymm1,<carryy=%ymm8,<out1=%ymm1
vpaddq %ymm1,%ymm8,%ymm1

# qhasm: 4x d1 = int32 out1 * int32 _inv19_2p30x4
# asm 1: vpmuldq <out1=reg256#2,<_inv19_2p30x4=reg256#10,>d1=reg256#5
# asm 2: vpmuldq <out1=%ymm1,<_inv19_2p30x4=%ymm9,>d1=%ymm4
vpmuldq %ymm1,%ymm9,%ymm4

# qhasm: d1 &= _2p30m1x4
# asm 1: vpand <d1=reg256#5,<_2p30m1x4=reg256#6,<d1=reg256#5
# asm 2: vpand <d1=%ymm4,<_2p30m1x4=%ymm5,<d1=%ymm4
vpand %ymm4,%ymm5,%ymm4

# qhasm: reg256 d1x19

# qhasm: 4x d1x19 = int32 d1 * int32 _19x4
# asm 1: vpmuldq <d1=reg256#5,<_19x4=reg256#11,>d1x19=reg256#9
# asm 2: vpmuldq <d1=%ymm4,<_19x4=%ymm10,>d1x19=%ymm8
vpmuldq %ymm4,%ymm10,%ymm8

# qhasm: 4x out1 -= d1x19
# asm 1: vpsubq <d1x19=reg256#9,<out1=reg256#2,<out1=reg256#2
# asm 2: vpsubq <d1x19=%ymm8,<out1=%ymm1,<out1=%ymm1
vpsubq %ymm8,%ymm1,%ymm1

# qhasm: 4x carryy = out1 + _2p63m2p33x4 
# asm 1: vpaddq <out1=reg256#2,<_2p63m2p33x4=reg256#1,>carryy=reg256#2
# asm 2: vpaddq <out1=%ymm1,<_2p63m2p33x4=%ymm0,>carryy=%ymm1
vpaddq %ymm1,%ymm0,%ymm1

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#2,<carryy=reg256#2
# asm 2: vpsrlq $30,<carryy=%ymm1,<carryy=%ymm1
vpsrlq $30,%ymm1,%ymm1

# qhasm: 4x out9 = d1 << 15
# asm 1: vpsllq $15,<d1=reg256#5,>out9=reg256#5
# asm 2: vpsllq $15,<d1=%ymm4,>out9=%ymm4
vpsllq $15,%ymm4,%ymm4

# qhasm: FVGS2 = mem256[ FVGS +  64 ]
# asm 1: vmovupd   64(<FVGS=int64#10),>FVGS2=reg256#9
# asm 2: vmovupd   64(<FVGS=%r12),>FVGS2=%ymm8
vmovupd   64(%r12),%ymm8

# qhasm: GSFV2 = FVGS2[1,0]
# asm 1: vpermq $0x4e,<FVGS2=reg256#9,>GSFV2=reg256#10
# asm 2: vpermq $0x4e,<FVGS2=%ymm8,>GSFV2=%ymm9
vpermq $0x4e,%ymm8,%ymm9

# qhasm: 4x ta = int32 uuss1 * int32 FVGS1
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS1=reg256#13,>ta=reg256#11
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS1=%ymm12,>ta=%ymm10
vpmuldq %ymm2,%ymm12,%ymm10

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV1
# asm 1: vpmuldq <vvrr1=reg256#4,<GSFV1=reg256#14,>tb=reg256#13
# asm 2: vpmuldq <vvrr1=%ymm3,<GSFV1=%ymm13,>tb=%ymm12
vpmuldq %ymm3,%ymm13,%ymm12

# qhasm: 4x out2plus = ta + tb
# asm 1: vpaddq <ta=reg256#11,<tb=reg256#13,>out2plus=reg256#11
# asm 2: vpaddq <ta=%ymm10,<tb=%ymm12,>out2plus=%ymm10
vpaddq %ymm10,%ymm12,%ymm10

# qhasm: 4x ta = int32 uuss0 * int32 FVGS2
# asm 1: vpmuldq <uuss0=reg256#7,<FVGS2=reg256#9,>ta=reg256#13
# asm 2: vpmuldq <uuss0=%ymm6,<FVGS2=%ymm8,>ta=%ymm12
vpmuldq %ymm6,%ymm8,%ymm12

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV2
# asm 1: vpmuldq <vvrr0=reg256#8,<GSFV2=reg256#10,>tb=reg256#14
# asm 2: vpmuldq <vvrr0=%ymm7,<GSFV2=%ymm9,>tb=%ymm13
vpmuldq %ymm7,%ymm9,%ymm13

# qhasm: 4x out2 = ta + tb
# asm 1: vpaddq <ta=reg256#13,<tb=reg256#14,>out2=reg256#13
# asm 2: vpaddq <ta=%ymm12,<tb=%ymm13,>out2=%ymm12
vpaddq %ymm12,%ymm13,%ymm12

# qhasm: 4x out2 += out2plus
# asm 1: vpaddq <out2=reg256#13,<out2plus=reg256#11,<out2=reg256#13
# asm 2: vpaddq <out2=%ymm12,<out2plus=%ymm10,<out2=%ymm12
vpaddq %ymm12,%ymm10,%ymm12

# qhasm: 4x out2 += carryy
# asm 1: vpaddq <out2=reg256#13,<carryy=reg256#2,<out2=reg256#13
# asm 2: vpaddq <out2=%ymm12,<carryy=%ymm1,<out2=%ymm12
vpaddq %ymm12,%ymm1,%ymm12

# qhasm: 4x carryy = out2 + _2p63m2p33x4 
# asm 1: vpaddq <out2=reg256#13,<_2p63m2p33x4=reg256#1,>carryy=reg256#2
# asm 2: vpaddq <out2=%ymm12,<_2p63m2p33x4=%ymm0,>carryy=%ymm1
vpaddq %ymm12,%ymm0,%ymm1

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#2,<carryy=reg256#2
# asm 2: vpsrlq $30,<carryy=%ymm1,<carryy=%ymm1
vpsrlq $30,%ymm1,%ymm1

# qhasm: FVGS3 = mem256[ FVGS +  96 ]
# asm 1: vmovupd   96(<FVGS=int64#10),>FVGS3=reg256#11
# asm 2: vmovupd   96(<FVGS=%r12),>FVGS3=%ymm10
vmovupd   96(%r12),%ymm10

# qhasm: GSFV3 = FVGS3[1,0]
# asm 1: vpermq $0x4e,<FVGS3=reg256#11,>GSFV3=reg256#14
# asm 2: vpermq $0x4e,<FVGS3=%ymm10,>GSFV3=%ymm13
vpermq $0x4e,%ymm10,%ymm13

# qhasm: 4x ta = int32 uuss1 * int32 FVGS2
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS2=reg256#9,>ta=reg256#9
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS2=%ymm8,>ta=%ymm8
vpmuldq %ymm2,%ymm8,%ymm8

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV2
# asm 1: vpmuldq <vvrr1=reg256#4,<GSFV2=reg256#10,>tb=reg256#10
# asm 2: vpmuldq <vvrr1=%ymm3,<GSFV2=%ymm9,>tb=%ymm9
vpmuldq %ymm3,%ymm9,%ymm9

# qhasm: 4x out3plus = ta + tb
# asm 1: vpaddq <ta=reg256#9,<tb=reg256#10,>out3plus=reg256#9
# asm 2: vpaddq <ta=%ymm8,<tb=%ymm9,>out3plus=%ymm8
vpaddq %ymm8,%ymm9,%ymm8

# qhasm: 4x ta = int32 uuss0 * int32 FVGS3
# asm 1: vpmuldq <uuss0=reg256#7,<FVGS3=reg256#11,>ta=reg256#10
# asm 2: vpmuldq <uuss0=%ymm6,<FVGS3=%ymm10,>ta=%ymm9
vpmuldq %ymm6,%ymm10,%ymm9

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV3
# asm 1: vpmuldq <vvrr0=reg256#8,<GSFV3=reg256#14,>tb=reg256#15
# asm 2: vpmuldq <vvrr0=%ymm7,<GSFV3=%ymm13,>tb=%ymm14
vpmuldq %ymm7,%ymm13,%ymm14

# qhasm: 4x out3 = ta + tb
# asm 1: vpaddq <ta=reg256#10,<tb=reg256#15,>out3=reg256#10
# asm 2: vpaddq <ta=%ymm9,<tb=%ymm14,>out3=%ymm9
vpaddq %ymm9,%ymm14,%ymm9

# qhasm: 4x out3 += out3plus
# asm 1: vpaddq <out3=reg256#10,<out3plus=reg256#9,<out3=reg256#10
# asm 2: vpaddq <out3=%ymm9,<out3plus=%ymm8,<out3=%ymm9
vpaddq %ymm9,%ymm8,%ymm9

# qhasm: 4x out3 += carryy
# asm 1: vpaddq <out3=reg256#10,<carryy=reg256#2,<out3=reg256#10
# asm 2: vpaddq <out3=%ymm9,<carryy=%ymm1,<out3=%ymm9
vpaddq %ymm9,%ymm1,%ymm9

# qhasm: out2 &= _2p30m1x4
# asm 1: vpand <out2=reg256#13,<_2p30m1x4=reg256#6,<out2=reg256#13
# asm 2: vpand <out2=%ymm12,<_2p30m1x4=%ymm5,<out2=%ymm12
vpand %ymm12,%ymm5,%ymm12

# qhasm: 4x carryy = out3 + _2p63m2p33x4 
# asm 1: vpaddq <out3=reg256#10,<_2p63m2p33x4=reg256#1,>carryy=reg256#2
# asm 2: vpaddq <out3=%ymm9,<_2p63m2p33x4=%ymm0,>carryy=%ymm1
vpaddq %ymm9,%ymm0,%ymm1

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#2,<carryy=reg256#2
# asm 2: vpsrlq $30,<carryy=%ymm1,<carryy=%ymm1
vpsrlq $30,%ymm1,%ymm1

# qhasm: out3 &= _2p30m1x4
# asm 1: vpand <out3=reg256#10,<_2p30m1x4=reg256#6,<out3=reg256#10
# asm 2: vpand <out3=%ymm9,<_2p30m1x4=%ymm5,<out3=%ymm9
vpand %ymm9,%ymm5,%ymm9

# qhasm: mem256[ FVGS + 32 ] = out3
# asm 1: vmovupd   <out3=reg256#10,32(<FVGS=int64#10)
# asm 2: vmovupd   <out3=%ymm9,32(<FVGS=%r12)
vmovupd   %ymm9,32(%r12)

# qhasm: 4x ta = out3 << 30
# asm 1: vpsllq $30,<out3=reg256#10,>ta=reg256#9
# asm 2: vpsllq $30,<out3=%ymm9,>ta=%ymm8
vpsllq $30,%ymm9,%ymm8

# qhasm: 4x ta += out2
# asm 1: vpaddq <ta=reg256#9,<out2=reg256#13,<ta=reg256#9
# asm 2: vpaddq <ta=%ymm8,<out2=%ymm12,<ta=%ymm8
vpaddq %ymm8,%ymm12,%ymm8

# qhasm: stack_fxgx = ta
# asm 1: vmovapd <ta=reg256#9,>stack_fxgx=stack256#1
# asm 2: vmovapd <ta=%ymm8,>stack_fxgx=0(%rsp)
vmovapd %ymm8,0(%rsp)

# qhasm: FVGS4 = mem256[ FVGS +  128 ]
# asm 1: vmovupd   128(<FVGS=int64#10),>FVGS4=reg256#9
# asm 2: vmovupd   128(<FVGS=%r12),>FVGS4=%ymm8
vmovupd   128(%r12),%ymm8

# qhasm: GSFV4 = FVGS4[1,0]
# asm 1: vpermq $0x4e,<FVGS4=reg256#9,>GSFV4=reg256#10
# asm 2: vpermq $0x4e,<FVGS4=%ymm8,>GSFV4=%ymm9
vpermq $0x4e,%ymm8,%ymm9

# qhasm: 4x ta = int32 uuss1 * int32 FVGS3
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS3=reg256#11,>ta=reg256#11
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS3=%ymm10,>ta=%ymm10
vpmuldq %ymm2,%ymm10,%ymm10

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV3
# asm 1: vpmuldq <vvrr1=reg256#4,<GSFV3=reg256#14,>tb=reg256#14
# asm 2: vpmuldq <vvrr1=%ymm3,<GSFV3=%ymm13,>tb=%ymm13
vpmuldq %ymm3,%ymm13,%ymm13

# qhasm: 4x out4plus = ta + tb
# asm 1: vpaddq <ta=reg256#11,<tb=reg256#14,>out4plus=reg256#11
# asm 2: vpaddq <ta=%ymm10,<tb=%ymm13,>out4plus=%ymm10
vpaddq %ymm10,%ymm13,%ymm10

# qhasm: 4x ta = int32 uuss0 * int32 FVGS4
# asm 1: vpmuldq <uuss0=reg256#7,<FVGS4=reg256#9,>ta=reg256#14
# asm 2: vpmuldq <uuss0=%ymm6,<FVGS4=%ymm8,>ta=%ymm13
vpmuldq %ymm6,%ymm8,%ymm13

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV4
# asm 1: vpmuldq <vvrr0=reg256#8,<GSFV4=reg256#10,>tb=reg256#15
# asm 2: vpmuldq <vvrr0=%ymm7,<GSFV4=%ymm9,>tb=%ymm14
vpmuldq %ymm7,%ymm9,%ymm14

# qhasm: 4x out4 = ta + tb
# asm 1: vpaddq <ta=reg256#14,<tb=reg256#15,>out4=reg256#14
# asm 2: vpaddq <ta=%ymm13,<tb=%ymm14,>out4=%ymm13
vpaddq %ymm13,%ymm14,%ymm13

# qhasm: 4x out4 += out4plus
# asm 1: vpaddq <out4=reg256#14,<out4plus=reg256#11,<out4=reg256#14
# asm 2: vpaddq <out4=%ymm13,<out4plus=%ymm10,<out4=%ymm13
vpaddq %ymm13,%ymm10,%ymm13

# qhasm: 4x out4 += carryy
# asm 1: vpaddq <out4=reg256#14,<carryy=reg256#2,<out4=reg256#14
# asm 2: vpaddq <out4=%ymm13,<carryy=%ymm1,<out4=%ymm13
vpaddq %ymm13,%ymm1,%ymm13

# qhasm: 4x carryy = out4 + _2p63m2p33x4 
# asm 1: vpaddq <out4=reg256#14,<_2p63m2p33x4=reg256#1,>carryy=reg256#2
# asm 2: vpaddq <out4=%ymm13,<_2p63m2p33x4=%ymm0,>carryy=%ymm1
vpaddq %ymm13,%ymm0,%ymm1

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#2,<carryy=reg256#2
# asm 2: vpsrlq $30,<carryy=%ymm1,<carryy=%ymm1
vpsrlq $30,%ymm1,%ymm1

# qhasm: FVGS5 = mem256[ FVGS +  160 ]
# asm 1: vmovupd   160(<FVGS=int64#10),>FVGS5=reg256#11
# asm 2: vmovupd   160(<FVGS=%r12),>FVGS5=%ymm10
vmovupd   160(%r12),%ymm10

# qhasm: GSFV5 = FVGS5[1,0]
# asm 1: vpermq $0x4e,<FVGS5=reg256#11,>GSFV5=reg256#15
# asm 2: vpermq $0x4e,<FVGS5=%ymm10,>GSFV5=%ymm14
vpermq $0x4e,%ymm10,%ymm14

# qhasm: 4x ta = int32 uuss1 * int32 FVGS4
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS4=reg256#9,>ta=reg256#9
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS4=%ymm8,>ta=%ymm8
vpmuldq %ymm2,%ymm8,%ymm8

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV4
# asm 1: vpmuldq <vvrr1=reg256#4,<GSFV4=reg256#10,>tb=reg256#10
# asm 2: vpmuldq <vvrr1=%ymm3,<GSFV4=%ymm9,>tb=%ymm9
vpmuldq %ymm3,%ymm9,%ymm9

# qhasm: 4x out5plus = ta + tb
# asm 1: vpaddq <ta=reg256#9,<tb=reg256#10,>out5plus=reg256#9
# asm 2: vpaddq <ta=%ymm8,<tb=%ymm9,>out5plus=%ymm8
vpaddq %ymm8,%ymm9,%ymm8

# qhasm: 4x ta = int32 uuss0 * int32 FVGS5
# asm 1: vpmuldq <uuss0=reg256#7,<FVGS5=reg256#11,>ta=reg256#10
# asm 2: vpmuldq <uuss0=%ymm6,<FVGS5=%ymm10,>ta=%ymm9
vpmuldq %ymm6,%ymm10,%ymm9

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV5
# asm 1: vpmuldq <vvrr0=reg256#8,<GSFV5=reg256#15,>tb=reg256#16
# asm 2: vpmuldq <vvrr0=%ymm7,<GSFV5=%ymm14,>tb=%ymm15
vpmuldq %ymm7,%ymm14,%ymm15

# qhasm: 4x out5 = ta + tb
# asm 1: vpaddq <ta=reg256#10,<tb=reg256#16,>out5=reg256#10
# asm 2: vpaddq <ta=%ymm9,<tb=%ymm15,>out5=%ymm9
vpaddq %ymm9,%ymm15,%ymm9

# qhasm: 4x out5 += out5plus
# asm 1: vpaddq <out5=reg256#10,<out5plus=reg256#9,<out5=reg256#10
# asm 2: vpaddq <out5=%ymm9,<out5plus=%ymm8,<out5=%ymm9
vpaddq %ymm9,%ymm8,%ymm9

# qhasm: 4x out5 += carryy
# asm 1: vpaddq <out5=reg256#10,<carryy=reg256#2,<out5=reg256#10
# asm 2: vpaddq <out5=%ymm9,<carryy=%ymm1,<out5=%ymm9
vpaddq %ymm9,%ymm1,%ymm9

# qhasm: 4x carryy = out5 + _2p63m2p33x4 
# asm 1: vpaddq <out5=reg256#10,<_2p63m2p33x4=reg256#1,>carryy=reg256#2
# asm 2: vpaddq <out5=%ymm9,<_2p63m2p33x4=%ymm0,>carryy=%ymm1
vpaddq %ymm9,%ymm0,%ymm1

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#2,<carryy=reg256#2
# asm 2: vpsrlq $30,<carryy=%ymm1,<carryy=%ymm1
vpsrlq $30,%ymm1,%ymm1

# qhasm: out5 &= _2p30m1x4
# asm 1: vpand <out5=reg256#10,<_2p30m1x4=reg256#6,<out5=reg256#10
# asm 2: vpand <out5=%ymm9,<_2p30m1x4=%ymm5,<out5=%ymm9
vpand %ymm9,%ymm5,%ymm9

# qhasm: out4 &= _2p30m1x4
# asm 1: vpand <out4=reg256#14,<_2p30m1x4=reg256#6,<out4=reg256#14
# asm 2: vpand <out4=%ymm13,<_2p30m1x4=%ymm5,<out4=%ymm13
vpand %ymm13,%ymm5,%ymm13

# qhasm: mem256[ FVGS +  64 ] = out4
# asm 1: vmovupd   <out4=reg256#14,64(<FVGS=int64#10)
# asm 2: vmovupd   <out4=%ymm13,64(<FVGS=%r12)
vmovupd   %ymm13,64(%r12)

# qhasm: 4x ta = out5 << 30
# asm 1: vpsllq $30,<out5=reg256#10,>ta=reg256#9
# asm 2: vpsllq $30,<out5=%ymm9,>ta=%ymm8
vpsllq $30,%ymm9,%ymm8

# qhasm: 4x ta += out4
# asm 1: vpaddq <ta=reg256#9,<out4=reg256#14,<ta=reg256#9
# asm 2: vpaddq <ta=%ymm8,<out4=%ymm13,<ta=%ymm8
vpaddq %ymm8,%ymm13,%ymm8

# qhasm: stack_fygy = ta
# asm 1: vmovapd <ta=reg256#9,>stack_fygy=stack256#12
# asm 2: vmovapd <ta=%ymm8,>stack_fygy=352(%rsp)
vmovapd %ymm8,352(%rsp)

# qhasm: FVGS6 = mem256[ FVGS +  192 ]
# asm 1: vmovupd   192(<FVGS=int64#10),>FVGS6=reg256#9
# asm 2: vmovupd   192(<FVGS=%r12),>FVGS6=%ymm8
vmovupd   192(%r12),%ymm8

# qhasm: GSFV6 = FVGS6[1,0]
# asm 1: vpermq $0x4e,<FVGS6=reg256#9,>GSFV6=reg256#14
# asm 2: vpermq $0x4e,<FVGS6=%ymm8,>GSFV6=%ymm13
vpermq $0x4e,%ymm8,%ymm13

# qhasm: 4x ta = int32 uuss1 * int32 FVGS5
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS5=reg256#11,>ta=reg256#11
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS5=%ymm10,>ta=%ymm10
vpmuldq %ymm2,%ymm10,%ymm10

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV5
# asm 1: vpmuldq <vvrr1=reg256#4,<GSFV5=reg256#15,>tb=reg256#15
# asm 2: vpmuldq <vvrr1=%ymm3,<GSFV5=%ymm14,>tb=%ymm14
vpmuldq %ymm3,%ymm14,%ymm14

# qhasm: 4x out6plus = ta + tb
# asm 1: vpaddq <ta=reg256#11,<tb=reg256#15,>out6plus=reg256#11
# asm 2: vpaddq <ta=%ymm10,<tb=%ymm14,>out6plus=%ymm10
vpaddq %ymm10,%ymm14,%ymm10

# qhasm: 4x ta = int32 uuss0 * int32 FVGS6
# asm 1: vpmuldq <uuss0=reg256#7,<FVGS6=reg256#9,>ta=reg256#15
# asm 2: vpmuldq <uuss0=%ymm6,<FVGS6=%ymm8,>ta=%ymm14
vpmuldq %ymm6,%ymm8,%ymm14

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV6
# asm 1: vpmuldq <vvrr0=reg256#8,<GSFV6=reg256#14,>tb=reg256#16
# asm 2: vpmuldq <vvrr0=%ymm7,<GSFV6=%ymm13,>tb=%ymm15
vpmuldq %ymm7,%ymm13,%ymm15

# qhasm: 4x out6 = ta + tb
# asm 1: vpaddq <ta=reg256#15,<tb=reg256#16,>out6=reg256#15
# asm 2: vpaddq <ta=%ymm14,<tb=%ymm15,>out6=%ymm14
vpaddq %ymm14,%ymm15,%ymm14

# qhasm: 4x out6 += out6plus
# asm 1: vpaddq <out6=reg256#15,<out6plus=reg256#11,<out6=reg256#15
# asm 2: vpaddq <out6=%ymm14,<out6plus=%ymm10,<out6=%ymm14
vpaddq %ymm14,%ymm10,%ymm14

# qhasm: 4x out6 += carryy
# asm 1: vpaddq <out6=reg256#15,<carryy=reg256#2,<out6=reg256#15
# asm 2: vpaddq <out6=%ymm14,<carryy=%ymm1,<out6=%ymm14
vpaddq %ymm14,%ymm1,%ymm14

# qhasm: 4x carryz = out6 + _2p63m2p33x4 
# asm 1: vpaddq <out6=reg256#15,<_2p63m2p33x4=reg256#1,>carryz=reg256#2
# asm 2: vpaddq <out6=%ymm14,<_2p63m2p33x4=%ymm0,>carryz=%ymm1
vpaddq %ymm14,%ymm0,%ymm1

# qhasm: 4x carryz unsigned>>= 30
# asm 1: vpsrlq $30,<carryz=reg256#2,<carryz=reg256#2
# asm 2: vpsrlq $30,<carryz=%ymm1,<carryz=%ymm1
vpsrlq $30,%ymm1,%ymm1

# qhasm: mem256[ FVGS + 96 ] = out5
# asm 1: vmovupd   <out5=reg256#10,96(<FVGS=int64#10)
# asm 2: vmovupd   <out5=%ymm9,96(<FVGS=%r12)
vmovupd   %ymm9,96(%r12)

# qhasm: FVGS7 = mem256[ FVGS +  224 ]
# asm 1: vmovupd   224(<FVGS=int64#10),>FVGS7=reg256#10
# asm 2: vmovupd   224(<FVGS=%r12),>FVGS7=%ymm9
vmovupd   224(%r12),%ymm9

# qhasm: GSFV7 = FVGS7[1,0]
# asm 1: vpermq $0x4e,<FVGS7=reg256#10,>GSFV7=reg256#11
# asm 2: vpermq $0x4e,<FVGS7=%ymm9,>GSFV7=%ymm10
vpermq $0x4e,%ymm9,%ymm10

# qhasm: 4x ta = int32 uuss1 * int32 FVGS6
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS6=reg256#9,>ta=reg256#9
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS6=%ymm8,>ta=%ymm8
vpmuldq %ymm2,%ymm8,%ymm8

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV6
# asm 1: vpmuldq <vvrr1=reg256#4,<GSFV6=reg256#14,>tb=reg256#14
# asm 2: vpmuldq <vvrr1=%ymm3,<GSFV6=%ymm13,>tb=%ymm13
vpmuldq %ymm3,%ymm13,%ymm13

# qhasm: 4x out7plus = ta + tb
# asm 1: vpaddq <ta=reg256#9,<tb=reg256#14,>out7plus=reg256#9
# asm 2: vpaddq <ta=%ymm8,<tb=%ymm13,>out7plus=%ymm8
vpaddq %ymm8,%ymm13,%ymm8

# qhasm: 4x ta = int32 uuss0 * int32 FVGS7
# asm 1: vpmuldq <uuss0=reg256#7,<FVGS7=reg256#10,>ta=reg256#14
# asm 2: vpmuldq <uuss0=%ymm6,<FVGS7=%ymm9,>ta=%ymm13
vpmuldq %ymm6,%ymm9,%ymm13

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV7
# asm 1: vpmuldq <vvrr0=reg256#8,<GSFV7=reg256#11,>tb=reg256#16
# asm 2: vpmuldq <vvrr0=%ymm7,<GSFV7=%ymm10,>tb=%ymm15
vpmuldq %ymm7,%ymm10,%ymm15

# qhasm: 4x out7 = ta + tb
# asm 1: vpaddq <ta=reg256#14,<tb=reg256#16,>out7=reg256#14
# asm 2: vpaddq <ta=%ymm13,<tb=%ymm15,>out7=%ymm13
vpaddq %ymm13,%ymm15,%ymm13

# qhasm: 4x out7 += out7plus
# asm 1: vpaddq <out7=reg256#14,<out7plus=reg256#9,<out7=reg256#14
# asm 2: vpaddq <out7=%ymm13,<out7plus=%ymm8,<out7=%ymm13
vpaddq %ymm13,%ymm8,%ymm13

# qhasm: 4x out7 += carryz
# asm 1: vpaddq <out7=reg256#14,<carryz=reg256#2,<out7=reg256#14
# asm 2: vpaddq <out7=%ymm13,<carryz=%ymm1,<out7=%ymm13
vpaddq %ymm13,%ymm1,%ymm13

# qhasm: 4x carryz = out7 + _2p63m2p33x4 
# asm 1: vpaddq <out7=reg256#14,<_2p63m2p33x4=reg256#1,>carryz=reg256#2
# asm 2: vpaddq <out7=%ymm13,<_2p63m2p33x4=%ymm0,>carryz=%ymm1
vpaddq %ymm13,%ymm0,%ymm1

# qhasm: 4x carryz unsigned>>= 30
# asm 1: vpsrlq $30,<carryz=reg256#2,<carryz=reg256#2
# asm 2: vpsrlq $30,<carryz=%ymm1,<carryz=%ymm1
vpsrlq $30,%ymm1,%ymm1

# qhasm: out6 &= _2p30m1x4
# asm 1: vpand <out6=reg256#15,<_2p30m1x4=reg256#6,<out6=reg256#15
# asm 2: vpand <out6=%ymm14,<_2p30m1x4=%ymm5,<out6=%ymm14
vpand %ymm14,%ymm5,%ymm14

# qhasm: mem256[ FVGS + 128 ] = out6
# asm 1: vmovupd   <out6=reg256#15,128(<FVGS=int64#10)
# asm 2: vmovupd   <out6=%ymm14,128(<FVGS=%r12)
vmovupd   %ymm14,128(%r12)

# qhasm: FVGS8 = mem256[ FVGS +  256 ]
# asm 1: vmovupd   256(<FVGS=int64#10),>FVGS8=reg256#9
# asm 2: vmovupd   256(<FVGS=%r12),>FVGS8=%ymm8
vmovupd   256(%r12),%ymm8

# qhasm: GSFV8 = FVGS8[1,0]
# asm 1: vpermq $0x4e,<FVGS8=reg256#9,>GSFV8=reg256#15
# asm 2: vpermq $0x4e,<FVGS8=%ymm8,>GSFV8=%ymm14
vpermq $0x4e,%ymm8,%ymm14

# qhasm: 4x ta = int32 uuss1 * int32 FVGS7
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS7=reg256#10,>ta=reg256#10
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS7=%ymm9,>ta=%ymm9
vpmuldq %ymm2,%ymm9,%ymm9

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV7
# asm 1: vpmuldq <vvrr1=reg256#4,<GSFV7=reg256#11,>tb=reg256#11
# asm 2: vpmuldq <vvrr1=%ymm3,<GSFV7=%ymm10,>tb=%ymm10
vpmuldq %ymm3,%ymm10,%ymm10

# qhasm: 4x out8plus = ta + tb
# asm 1: vpaddq <ta=reg256#10,<tb=reg256#11,>out8plus=reg256#10
# asm 2: vpaddq <ta=%ymm9,<tb=%ymm10,>out8plus=%ymm9
vpaddq %ymm9,%ymm10,%ymm9

# qhasm: 4x ta = int32 uuss0 * int32 FVGS8
# asm 1: vpmuldq <uuss0=reg256#7,<FVGS8=reg256#9,>ta=reg256#7
# asm 2: vpmuldq <uuss0=%ymm6,<FVGS8=%ymm8,>ta=%ymm6
vpmuldq %ymm6,%ymm8,%ymm6

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV8
# asm 1: vpmuldq <vvrr0=reg256#8,<GSFV8=reg256#15,>tb=reg256#8
# asm 2: vpmuldq <vvrr0=%ymm7,<GSFV8=%ymm14,>tb=%ymm7
vpmuldq %ymm7,%ymm14,%ymm7

# qhasm: 4x out8 = ta + tb
# asm 1: vpaddq <ta=reg256#7,<tb=reg256#8,>out8=reg256#7
# asm 2: vpaddq <ta=%ymm6,<tb=%ymm7,>out8=%ymm6
vpaddq %ymm6,%ymm7,%ymm6

# qhasm: 4x out8 += out8plus
# asm 1: vpaddq <out8=reg256#7,<out8plus=reg256#10,<out8=reg256#7
# asm 2: vpaddq <out8=%ymm6,<out8plus=%ymm9,<out8=%ymm6
vpaddq %ymm6,%ymm9,%ymm6

# qhasm: 4x out8 += carryz
# asm 1: vpaddq <out8=reg256#7,<carryz=reg256#2,<out8=reg256#7
# asm 2: vpaddq <out8=%ymm6,<carryz=%ymm1,<out8=%ymm6
vpaddq %ymm6,%ymm1,%ymm6

# qhasm: 4x out8 += out8plus2
# asm 1: vpaddq <out8=reg256#7,<out8plus2=reg256#12,<out8=reg256#7
# asm 2: vpaddq <out8=%ymm6,<out8plus2=%ymm11,<out8=%ymm6
vpaddq %ymm6,%ymm11,%ymm6

# qhasm: 4x carryz = out8 + _2p63m2p33x4 
# asm 1: vpaddq <out8=reg256#7,<_2p63m2p33x4=reg256#1,>carryz=reg256#2
# asm 2: vpaddq <out8=%ymm6,<_2p63m2p33x4=%ymm0,>carryz=%ymm1
vpaddq %ymm6,%ymm0,%ymm1

# qhasm: 4x carryz unsigned>>= 30
# asm 1: vpsrlq $30,<carryz=reg256#2,<carryz=reg256#2
# asm 2: vpsrlq $30,<carryz=%ymm1,<carryz=%ymm1
vpsrlq $30,%ymm1,%ymm1

# qhasm: out7 &= _2p30m1x4
# asm 1: vpand <out7=reg256#14,<_2p30m1x4=reg256#6,<out7=reg256#14
# asm 2: vpand <out7=%ymm13,<_2p30m1x4=%ymm5,<out7=%ymm13
vpand %ymm13,%ymm5,%ymm13

# qhasm: mem256[ FVGS + 160 ] = out7
# asm 1: vmovupd   <out7=reg256#14,160(<FVGS=int64#10)
# asm 2: vmovupd   <out7=%ymm13,160(<FVGS=%r12)
vmovupd   %ymm13,160(%r12)

# qhasm: 4x ta = int32 uuss1 * int32 FVGS8
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS8=reg256#9,>ta=reg256#3
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS8=%ymm8,>ta=%ymm2
vpmuldq %ymm2,%ymm8,%ymm2

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV8
# asm 1: vpmuldq <vvrr1=reg256#4,<GSFV8=reg256#15,>tb=reg256#4
# asm 2: vpmuldq <vvrr1=%ymm3,<GSFV8=%ymm14,>tb=%ymm3
vpmuldq %ymm3,%ymm14,%ymm3

# qhasm: 4x out9plus = ta + tb
# asm 1: vpaddq <ta=reg256#3,<tb=reg256#4,>out9plus=reg256#3
# asm 2: vpaddq <ta=%ymm2,<tb=%ymm3,>out9plus=%ymm2
vpaddq %ymm2,%ymm3,%ymm2

# qhasm: 4x out9 += out9plus
# asm 1: vpaddq <out9=reg256#5,<out9plus=reg256#3,<out9=reg256#5
# asm 2: vpaddq <out9=%ymm4,<out9plus=%ymm2,<out9=%ymm4
vpaddq %ymm4,%ymm2,%ymm4

# qhasm: 4x out9 += carryz
# asm 1: vpaddq <out9=reg256#5,<carryz=reg256#2,<out9=reg256#5
# asm 2: vpaddq <out9=%ymm4,<carryz=%ymm1,<out9=%ymm4
vpaddq %ymm4,%ymm1,%ymm4

# qhasm: 4x out10 = out9 + _2p63m2p33x4 
# asm 1: vpaddq <out9=reg256#5,<_2p63m2p33x4=reg256#1,>out10=reg256#2
# asm 2: vpaddq <out9=%ymm4,<_2p63m2p33x4=%ymm0,>out10=%ymm1
vpaddq %ymm4,%ymm0,%ymm1

# qhasm: 4x out10 unsigned>>= 30
# asm 1: vpsrlq $30,<out10=reg256#2,<out10=reg256#2
# asm 2: vpsrlq $30,<out10=%ymm1,<out10=%ymm1
vpsrlq $30,%ymm1,%ymm1

# qhasm: out8 &= _2p30m1x4
# asm 1: vpand <out8=reg256#7,<_2p30m1x4=reg256#6,<out8=reg256#7
# asm 2: vpand <out8=%ymm6,<_2p30m1x4=%ymm5,<out8=%ymm6
vpand %ymm6,%ymm5,%ymm6

# qhasm: mem256[ FVGS + 192 ] = out8
# asm 1: vmovupd   <out8=reg256#7,192(<FVGS=int64#10)
# asm 2: vmovupd   <out8=%ymm6,192(<FVGS=%r12)
vmovupd   %ymm6,192(%r12)

# qhasm: _32767x4 = stack_32767x4
# asm 1: vmovapd <stack_32767x4=stack256#4,>_32767x4=reg256#3
# asm 2: vmovapd <stack_32767x4=96(%rsp),>_32767x4=%ymm2
vmovapd 96(%rsp),%ymm2

# qhasm: _2p48x4 = stack_2p48x4
# asm 1: vmovapd <stack_2p48x4=stack256#8,>_2p48x4=reg256#4
# asm 2: vmovapd <stack_2p48x4=224(%rsp),>_2p48x4=%ymm3
vmovapd 224(%rsp),%ymm3

# qhasm: 4x carryy = out10 + _2p63m2p33x4
# asm 1: vpaddq <out10=reg256#2,<_2p63m2p33x4=reg256#1,>carryy=reg256#7
# asm 2: vpaddq <out10=%ymm1,<_2p63m2p33x4=%ymm0,>carryy=%ymm6
vpaddq %ymm1,%ymm0,%ymm6

# qhasm: 4x carryy unsigned>>= 15
# asm 1: vpsrlq $15,<carryy=reg256#7,<carryy=reg256#7
# asm 2: vpsrlq $15,<carryy=%ymm6,<carryy=%ymm6
vpsrlq $15,%ymm6,%ymm6

# qhasm: 4x carryy -= _2p48x4
# asm 1: vpsubq <_2p48x4=reg256#4,<carryy=reg256#7,<carryy=reg256#7
# asm 2: vpsubq <_2p48x4=%ymm3,<carryy=%ymm6,<carryy=%ymm6
vpsubq %ymm3,%ymm6,%ymm6

# qhasm: 4x out10 -= stack_2p33x4
# asm 1: vpsubq <stack_2p33x4=stack256#7,<out10=reg256#2,<out10=reg256#2
# asm 2: vpsubq <stack_2p33x4=192(%rsp),<out10=%ymm1,<out10=%ymm1
vpsubq 192(%rsp),%ymm1,%ymm1

# qhasm: out9 &= _2p30m1x4
# asm 1: vpand <out9=reg256#5,<_2p30m1x4=reg256#6,<out9=reg256#5
# asm 2: vpand <out9=%ymm4,<_2p30m1x4=%ymm5,<out9=%ymm4
vpand %ymm4,%ymm5,%ymm4

# qhasm: out10 &= _32767x4
# asm 1: vpand <out10=reg256#2,<_32767x4=reg256#3,<out10=reg256#2
# asm 2: vpand <out10=%ymm1,<_32767x4=%ymm2,<out10=%ymm1
vpand %ymm1,%ymm2,%ymm1

# qhasm: 4x carryy = int32 carryy * int32 stack_0_19x4
# asm 1: vpmuldq <stack_0_19x4=stack256#3,<carryy=reg256#7,>carryy=reg256#3
# asm 2: vpmuldq <stack_0_19x4=64(%rsp),<carryy=%ymm6,>carryy=%ymm2
vpmuldq 64(%rsp),%ymm6,%ymm2

# qhasm: 4x out2 += carryy
# asm 1: vpaddq <out2=reg256#13,<carryy=reg256#3,<out2=reg256#13
# asm 2: vpaddq <out2=%ymm12,<carryy=%ymm2,<out2=%ymm12
vpaddq %ymm12,%ymm2,%ymm12

# qhasm: mem256[ FVGS +224 ] = out9
# asm 1: vmovupd   <out9=reg256#5,224(<FVGS=int64#10)
# asm 2: vmovupd   <out9=%ymm4,224(<FVGS=%r12)
vmovupd   %ymm4,224(%r12)

# qhasm: mem256[ FVGS +256 ] = out10
# asm 1: vmovupd   <out10=reg256#2,256(<FVGS=int64#10)
# asm 2: vmovupd   <out10=%ymm1,256(<FVGS=%r12)
vmovupd   %ymm1,256(%r12)

# qhasm: mem256[ FVGS +  0 ] = out2
# asm 1: vmovupd   <out2=reg256#13,0(<FVGS=int64#10)
# asm 2: vmovupd   <out2=%ymm12,0(<FVGS=%r12)
vmovupd   %ymm12,0(%r12)

# qhasm: f = stack_fxgx[0]
# asm 1: movq <stack_fxgx=stack256#1,>f=int64#3
# asm 2: movq <stack_fxgx=0(%rsp),>f=%rdx
movq 0(%rsp),%rdx

# qhasm: g = stack_fxgx[2] 
# asm 1: movq <stack_fxgx=stack256#1,>g=int64#4
# asm 2: movq <stack_fxgx=16(%rsp),>g=%rcx
movq 16(%rsp),%rcx

# qhasm: =? i -= 1
# asm 1: dec <i=int64#2
# asm 2: dec <i=%rsi
dec %rsi
# comment:fp stack unchanged by jump

# qhasm: goto bigloop if !=
jne ._bigloop

# qhasm: caller_r11 = stack_r11
# asm 1: movq <stack_r11=stack64#1,>caller_r11=int64#9
# asm 2: movq <stack_r11=384(%rsp),>caller_r11=%r11
movq 384(%rsp),%r11

# qhasm: caller_r12 = stack_r12
# asm 1: movq <stack_r12=stack64#2,>caller_r12=int64#10
# asm 2: movq <stack_r12=392(%rsp),>caller_r12=%r12
movq 392(%rsp),%r12

# qhasm: caller_r13 = stack_r13
# asm 1: movq <stack_r13=stack64#3,>caller_r13=int64#11
# asm 2: movq <stack_r13=400(%rsp),>caller_r13=%r13
movq 400(%rsp),%r13

# qhasm: caller_r14 = stack_r14
# asm 1: movq <stack_r14=stack64#4,>caller_r14=int64#12
# asm 2: movq <stack_r14=408(%rsp),>caller_r14=%r14
movq 408(%rsp),%r14

# qhasm: caller_r15 = stack_r15
# asm 1: movq <stack_r15=stack64#5,>caller_r15=int64#13
# asm 2: movq <stack_r15=416(%rsp),>caller_r15=%r15
movq 416(%rsp),%r15

# qhasm: caller_rbx = stack_rbx
# asm 1: movq <stack_rbx=stack64#6,>caller_rbx=int64#14
# asm 2: movq <stack_rbx=424(%rsp),>caller_rbx=%rbx
movq 424(%rsp),%rbx

# qhasm: caller_rbp = stack_rbp
# asm 1: movq <stack_rbp=stack64#7,>caller_rbp=int64#15
# asm 2: movq <stack_rbp=432(%rsp),>caller_rbp=%rbp
movq 432(%rsp),%rbp

# qhasm: return 
add %r11,%rsp
ret
