
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

# qhasm: int64 h

# qhasm: int64 oldg

# qhasm: int64 i

# qhasm: int64 j

# qhasm: int64 f0

# qhasm: int64 g0

# qhasm: int64 table

# qhasm: int64 minv

# qhasm: stack64 stack_minv

# qhasm: int64 rtimesoldv

# qhasm: int64 stimesolds

# qhasm: stack64 stack_out

# qhasm: stack256 stack_m1

# qhasm: stack64 stack_m

# qhasm: stack256 stack_fxgx

# qhasm: stack256 stack_uuss

# qhasm: stack256 stack_vvrr

# qhasm: stack256 stack_fygy

# qhasm: stack64 stack_fuv

# qhasm: stack64 stack_f

# qhasm: reg256 carryy

# qhasm: reg256 minvx4

# qhasm: reg256 d0

# qhasm: reg256 d1

# qhasm: reg256 d2

# qhasm: reg256 out0

# qhasm: int64 a0

# qhasm: int64 t0

# qhasm: reg256 mod0

# qhasm: stack256 stack_mod0

# qhasm: reg256 FVGS0

# qhasm: reg256 GSFV0

# qhasm: stack256 stack_FVGS0

# qhasm: reg256 out1

# qhasm: reg256 out1plus

# qhasm: reg256 out2plus2

# qhasm: int64 a1

# qhasm: int64 t1

# qhasm: reg256 mod1

# qhasm: stack256 stack_mod1

# qhasm: reg256 FVGS1

# qhasm: reg256 GSFV1

# qhasm: stack256 stack_FVGS1

# qhasm: reg256 out2

# qhasm: reg256 out2plus

# qhasm: reg256 out3plus2

# qhasm: int64 a2

# qhasm: int64 t2

# qhasm: reg256 mod2

# qhasm: stack256 stack_mod2

# qhasm: reg256 FVGS2

# qhasm: reg256 GSFV2

# qhasm: stack256 stack_FVGS2

# qhasm: reg256 out3

# qhasm: reg256 out3plus

# qhasm: reg256 out4plus2

# qhasm: int64 a3

# qhasm: int64 t3

# qhasm: reg256 mod3

# qhasm: stack256 stack_mod3

# qhasm: reg256 FVGS3

# qhasm: reg256 GSFV3

# qhasm: stack256 stack_FVGS3

# qhasm: reg256 out4

# qhasm: reg256 out4plus

# qhasm: reg256 out5plus2

# qhasm: int64 a4

# qhasm: int64 t4

# qhasm: reg256 mod4

# qhasm: stack256 stack_mod4

# qhasm: reg256 FVGS4

# qhasm: reg256 GSFV4

# qhasm: stack256 stack_FVGS4

# qhasm: reg256 out5

# qhasm: reg256 out5plus

# qhasm: reg256 out6plus2

# qhasm: int64 a5

# qhasm: int64 t5

# qhasm: reg256 mod5

# qhasm: stack256 stack_mod5

# qhasm: reg256 FVGS5

# qhasm: reg256 GSFV5

# qhasm: stack256 stack_FVGS5

# qhasm: reg256 out6

# qhasm: reg256 out6plus

# qhasm: int64 a6

# qhasm: int64 t6

# qhasm: reg256 mod6

# qhasm: stack256 stack_mod6

# qhasm: reg256 FVGS6

# qhasm: reg256 GSFV6

# qhasm: stack256 stack_FVGS6

# qhasm: reg256 out7

# qhasm: reg256 out7plus

# qhasm: int64 t7

# qhasm: reg256 out8

# qhasm: reg256 out8plus

# qhasm: reg256 out9

# qhasm: reg256 ta

# qhasm: reg256 tb

# qhasm: reg256 uuss

# qhasm: reg256 uuss0

# qhasm: reg256 uuss1

# qhasm: reg256 vvrr

# qhasm: reg256 vvrr0

# qhasm: reg256 vvrr1

# qhasm: int64            _m2p20

# qhasm: stack64     stack_m2p20

# qhasm: int64             _2p20

# qhasm: stack64      stack_2p20

# qhasm: int64            _m2p41

# qhasm: stack64     stack_m2p41

# qhasm: int64            _m2p62

# qhasm: stack64     stack_m2p62

# qhasm: int64        _2p20a2p41

# qhasm: stack64 stack_2p20a2p41

# qhasm: reg256 _2p30m1x4

# qhasm: reg256 _2p33x4

# qhasm: reg256 _2p63x4

# qhasm: reg256 _2p63m2p33x4

# qhasm: reg256 _2p29x4

# qhasm: reg256 _prime0x4

# qhasm: stack256 stack_2p30m1x4

# qhasm: stack256 stack_2p33x4

# qhasm: stack256 stack_2p63x4

# qhasm: stack256 stack_2p63m2p33x4

# qhasm: stack256 stack_2p29x4

# qhasm: stack256 stack_prime0x4

# qhasm: enter inverse_192
.p2align 5
.global _inverse_192
.global inverse_192
_inverse_192:
inverse_192:
mov %rsp,%r11
and $31,%r11
add $800,%r11
sub %r11,%rsp

# qhasm: new stack_m1

# qhasm: stack_out = input_1
# asm 1: movq <input_1=int64#2,>stack_out=stack64#1
# asm 2: movq <input_1=%rsi,>stack_out=0(%rsp)
movq %rsi,0(%rsp)

# qhasm: table = input_2
# asm 1: mov  <input_2=int64#3,>table=int64#2
# asm 2: mov  <input_2=%rdx,>table=%rsi
mov  %rdx,%rsi

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

# qhasm: d1 = mem256[ table + 192 ]
# asm 1: vmovupd   192(<table=int64#2),>d1=reg256#1
# asm 2: vmovupd   192(<table=%rsi),>d1=%ymm0
vmovupd   192(%rsi),%ymm0

# qhasm: stack_FVGS0 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_FVGS0=stack256#2
# asm 2: vmovapd <d1=%ymm0,>stack_FVGS0=160(%rsp)
vmovapd %ymm0,160(%rsp)

# qhasm: d1 = mem256[ table + 224 ]
# asm 1: vmovupd   224(<table=int64#2),>d1=reg256#1
# asm 2: vmovupd   224(<table=%rsi),>d1=%ymm0
vmovupd   224(%rsi),%ymm0

# qhasm: stack_FVGS1 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_FVGS1=stack256#3
# asm 2: vmovapd <d1=%ymm0,>stack_FVGS1=192(%rsp)
vmovapd %ymm0,192(%rsp)

# qhasm: d1 = mem256[ table + 256 ]
# asm 1: vmovupd   256(<table=int64#2),>d1=reg256#1
# asm 2: vmovupd   256(<table=%rsi),>d1=%ymm0
vmovupd   256(%rsi),%ymm0

# qhasm: stack_FVGS2 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_FVGS2=stack256#4
# asm 2: vmovapd <d1=%ymm0,>stack_FVGS2=224(%rsp)
vmovapd %ymm0,224(%rsp)

# qhasm: d1 = mem256[ table + 288 ]
# asm 1: vmovupd   288(<table=int64#2),>d1=reg256#1
# asm 2: vmovupd   288(<table=%rsi),>d1=%ymm0
vmovupd   288(%rsi),%ymm0

# qhasm: stack_FVGS3 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_FVGS3=stack256#5
# asm 2: vmovapd <d1=%ymm0,>stack_FVGS3=256(%rsp)
vmovapd %ymm0,256(%rsp)

# qhasm: d1 = mem256[ table + 320 ]
# asm 1: vmovupd   320(<table=int64#2),>d1=reg256#1
# asm 2: vmovupd   320(<table=%rsi),>d1=%ymm0
vmovupd   320(%rsi),%ymm0

# qhasm: stack_FVGS4 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_FVGS4=stack256#6
# asm 2: vmovapd <d1=%ymm0,>stack_FVGS4=288(%rsp)
vmovapd %ymm0,288(%rsp)

# qhasm: d1 = mem256[ table + 352 ]
# asm 1: vmovupd   352(<table=int64#2),>d1=reg256#1
# asm 2: vmovupd   352(<table=%rsi),>d1=%ymm0
vmovupd   352(%rsi),%ymm0

# qhasm: stack_FVGS5 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_FVGS5=stack256#7
# asm 2: vmovapd <d1=%ymm0,>stack_FVGS5=320(%rsp)
vmovapd %ymm0,320(%rsp)

# qhasm: d1 = mem256[ table + 384 ]
# asm 1: vmovupd   384(<table=int64#2),>d1=reg256#1
# asm 2: vmovupd   384(<table=%rsi),>d1=%ymm0
vmovupd   384(%rsi),%ymm0

# qhasm: stack_FVGS6 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_FVGS6=stack256#8
# asm 2: vmovapd <d1=%ymm0,>stack_FVGS6=352(%rsp)
vmovapd %ymm0,352(%rsp)

# qhasm: d1 = 4x stack_FVGS0[0]
# asm 1: vpbroadcastq <stack_FVGS0=stack256#2,>d1=reg256#1
# asm 2: vpbroadcastq <stack_FVGS0=160(%rsp),>d1=%ymm0
vpbroadcastq 160(%rsp),%ymm0

# qhasm: stack_mod0 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_mod0=stack256#9
# asm 2: vmovapd <d1=%ymm0,>stack_mod0=384(%rsp)
vmovapd %ymm0,384(%rsp)

# qhasm: d1 = 4x stack_FVGS1[0]
# asm 1: vpbroadcastq <stack_FVGS1=stack256#3,>d1=reg256#1
# asm 2: vpbroadcastq <stack_FVGS1=192(%rsp),>d1=%ymm0
vpbroadcastq 192(%rsp),%ymm0

# qhasm: stack_mod1 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_mod1=stack256#10
# asm 2: vmovapd <d1=%ymm0,>stack_mod1=416(%rsp)
vmovapd %ymm0,416(%rsp)

# qhasm: d1 = 4x stack_FVGS2[0]
# asm 1: vpbroadcastq <stack_FVGS2=stack256#4,>d1=reg256#1
# asm 2: vpbroadcastq <stack_FVGS2=224(%rsp),>d1=%ymm0
vpbroadcastq 224(%rsp),%ymm0

# qhasm: stack_mod2 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_mod2=stack256#11
# asm 2: vmovapd <d1=%ymm0,>stack_mod2=448(%rsp)
vmovapd %ymm0,448(%rsp)

# qhasm: d1 = 4x stack_FVGS3[0]
# asm 1: vpbroadcastq <stack_FVGS3=stack256#5,>d1=reg256#1
# asm 2: vpbroadcastq <stack_FVGS3=256(%rsp),>d1=%ymm0
vpbroadcastq 256(%rsp),%ymm0

# qhasm: stack_mod3 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_mod3=stack256#12
# asm 2: vmovapd <d1=%ymm0,>stack_mod3=480(%rsp)
vmovapd %ymm0,480(%rsp)

# qhasm: d1 = 4x stack_FVGS4[0]
# asm 1: vpbroadcastq <stack_FVGS4=stack256#6,>d1=reg256#1
# asm 2: vpbroadcastq <stack_FVGS4=288(%rsp),>d1=%ymm0
vpbroadcastq 288(%rsp),%ymm0

# qhasm: stack_mod4 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_mod4=stack256#13
# asm 2: vmovapd <d1=%ymm0,>stack_mod4=512(%rsp)
vmovapd %ymm0,512(%rsp)

# qhasm: d1 = 4x stack_FVGS5[0]
# asm 1: vpbroadcastq <stack_FVGS5=stack256#7,>d1=reg256#1
# asm 2: vpbroadcastq <stack_FVGS5=320(%rsp),>d1=%ymm0
vpbroadcastq 320(%rsp),%ymm0

# qhasm: stack_mod5 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_mod5=stack256#14
# asm 2: vmovapd <d1=%ymm0,>stack_mod5=544(%rsp)
vmovapd %ymm0,544(%rsp)

# qhasm: d1 = 4x stack_FVGS6[0]
# asm 1: vpbroadcastq <stack_FVGS6=stack256#8,>d1=reg256#1
# asm 2: vpbroadcastq <stack_FVGS6=352(%rsp),>d1=%ymm0
vpbroadcastq 352(%rsp),%ymm0

# qhasm: stack_mod6 = d1
# asm 1: vmovapd <d1=reg256#1,>stack_mod6=stack256#15
# asm 2: vmovapd <d1=%ymm0,>stack_mod6=576(%rsp)
vmovapd %ymm0,576(%rsp)

# qhasm: minv = mem64[ table + 416]
# asm 1: movq   416(<table=int64#2),>minv=int64#3
# asm 2: movq   416(<table=%rsi),>minv=%rdx
movq   416(%rsi),%rdx

# qhasm: stack_minv = minv
# asm 1: movq <minv=int64#3,>stack_minv=stack64#9
# asm 2: movq <minv=%rdx,>stack_minv=64(%rsp)
movq %rdx,64(%rsp)

# qhasm: a0 = mem64[input_0 +  0]
# asm 1: movq   0(<input_0=int64#1),>a0=int64#4
# asm 2: movq   0(<input_0=%rdi),>a0=%rcx
movq   0(%rdi),%rcx

# qhasm: minv *= a0
# asm 1: imul  <a0=int64#4,<minv=int64#3
# asm 2: imul  <a0=%rcx,<minv=%rdx
imul  %rcx,%rdx

# qhasm: (uint128) t1 t0 = minv * mem64[ table + 160 ]
# asm 1: mulx  160(<table=int64#2),>t0=int64#5,>t1=int64#6
# asm 2: mulx  160(<table=%rsi),>t0=%r8,>t1=%r9
mulx  160(%rsi),%r8,%r9

# qhasm: carry? t0 += a0
# asm 1: add  <a0=int64#4,<t0=int64#5
# asm 2: add  <a0=%rcx,<t0=%r8
add  %rcx,%r8

# qhasm: t1 += 0 + carry
# asm 1: adc $0,<t1=int64#6
# asm 2: adc $0,<t1=%r9
adc $0,%r9

# qhasm: a1 = mem64[input_0 +  8]
# asm 1: movq   8(<input_0=int64#1),>a1=int64#4
# asm 2: movq   8(<input_0=%rdi),>a1=%rcx
movq   8(%rdi),%rcx

# qhasm: h = 0
# asm 1: xor  >h=int64#5,>h=int64#5
# asm 2: xor  >h=%r8,>h=%r8
xor  %r8,%r8

# qhasm: carry? a1 += t1
# asm 1: add  <t1=int64#6,<a1=int64#4
# asm 2: add  <t1=%r9,<a1=%rcx
add  %r9,%rcx

# qhasm: h += 0 + carry
# asm 1: adc $0,<h=int64#5
# asm 2: adc $0,<h=%r8
adc $0,%r8

# qhasm: (uint128) t2 t1 = minv * mem64[ table + 168 ]
# asm 1: mulx  168(<table=int64#2),>t1=int64#6,>t2=int64#7
# asm 2: mulx  168(<table=%rsi),>t1=%r9,>t2=%rax
mulx  168(%rsi),%r9,%rax

# qhasm: carry? t1 += a1
# asm 1: add  <a1=int64#4,<t1=int64#6
# asm 2: add  <a1=%rcx,<t1=%r9
add  %rcx,%r9

# qhasm: t2 += h + carry
# asm 1: adc <h=int64#5,<t2=int64#7
# asm 2: adc <h=%r8,<t2=%rax
adc %r8,%rax

# qhasm: inplace stack_FVGS0[2] = t1
# asm 1: movq <t1=int64#6,<stack_FVGS0=stack256#2
# asm 2: movq <t1=%r9,<stack_FVGS0=176(%rsp)
movq %r9,176(%rsp)

# qhasm: a2 = mem64[input_0 + 16]
# asm 1: movq   16(<input_0=int64#1),>a2=int64#1
# asm 2: movq   16(<input_0=%rdi),>a2=%rdi
movq   16(%rdi),%rdi

# qhasm: h = 0
# asm 1: xor  >h=int64#4,>h=int64#4
# asm 2: xor  >h=%rcx,>h=%rcx
xor  %rcx,%rcx

# qhasm: carry? a2 += t2
# asm 1: add  <t2=int64#7,<a2=int64#1
# asm 2: add  <t2=%rax,<a2=%rdi
add  %rax,%rdi

# qhasm: h += 0 + carry
# asm 1: adc $0,<h=int64#4
# asm 2: adc $0,<h=%rcx
adc $0,%rcx

# qhasm: (uint128) t3 t2 = minv * mem64[ table + 176 ]
# asm 1: mulx  176(<table=int64#2),>t2=int64#3,>t3=int64#5
# asm 2: mulx  176(<table=%rsi),>t2=%rdx,>t3=%r8
mulx  176(%rsi),%rdx,%r8

# qhasm: carry? t2 += a2
# asm 1: add  <a2=int64#1,<t2=int64#3
# asm 2: add  <a2=%rdi,<t2=%rdx
add  %rdi,%rdx

# qhasm: t3 += h + carry
# asm 1: adc <h=int64#4,<t3=int64#5
# asm 2: adc <h=%rcx,<t3=%r8
adc %rcx,%r8

# qhasm: inplace stack_FVGS1[2] = t2
# asm 1: movq <t2=int64#3,<stack_FVGS1=stack256#3
# asm 2: movq <t2=%rdx,<stack_FVGS1=208(%rsp)
movq %rdx,208(%rsp)

# qhasm: inplace stack_FVGS2[2] = t3
# asm 1: movq <t3=int64#5,<stack_FVGS2=stack256#4
# asm 2: movq <t3=%r8,<stack_FVGS2=240(%rsp)
movq %r8,240(%rsp)

# qhasm: a0 = stack_FVGS0[2]
# asm 1: movq <stack_FVGS0=stack256#2,>a0=int64#1
# asm 2: movq <stack_FVGS0=176(%rsp),>a0=%rdi
movq 176(%rsp),%rdi

# qhasm: carry? a0 -= mem64[ table + 160]
# asm 1: subq 160(<table=int64#2),<a0=int64#1
# asm 2: subq 160(<table=%rsi),<a0=%rdi
subq 160(%rsi),%rdi

# qhasm: inplace stack_FVGS4[2] = a0
# asm 1: movq <a0=int64#1,<stack_FVGS4=stack256#6
# asm 2: movq <a0=%rdi,<stack_FVGS4=304(%rsp)
movq %rdi,304(%rsp)

# qhasm: a1 = stack_FVGS1[2]
# asm 1: movq <stack_FVGS1=stack256#3,>a1=int64#1
# asm 2: movq <stack_FVGS1=208(%rsp),>a1=%rdi
movq 208(%rsp),%rdi

# qhasm: carry? a1 -= mem64[ table + 168] - carry
# asm 1: sbbq 168(<table=int64#2),<a1=int64#1
# asm 2: sbbq 168(<table=%rsi),<a1=%rdi
sbbq 168(%rsi),%rdi

# qhasm: inplace stack_FVGS5[2] = a1
# asm 1: movq <a1=int64#1,<stack_FVGS5=stack256#7
# asm 2: movq <a1=%rdi,<stack_FVGS5=336(%rsp)
movq %rdi,336(%rsp)

# qhasm: a2 = stack_FVGS2[2]
# asm 1: movq <stack_FVGS2=stack256#4,>a2=int64#1
# asm 2: movq <stack_FVGS2=240(%rsp),>a2=%rdi
movq 240(%rsp),%rdi

# qhasm: carry? a2 -= mem64[ table + 176] - carry
# asm 1: sbbq 176(<table=int64#2),<a2=int64#1
# asm 2: sbbq 176(<table=%rsi),<a2=%rdi
sbbq 176(%rsi),%rdi

# qhasm: inplace stack_FVGS6[2] = a2
# asm 1: movq <a2=int64#1,<stack_FVGS6=stack256#8
# asm 2: movq <a2=%rdi,<stack_FVGS6=368(%rsp)
movq %rdi,368(%rsp)

# qhasm: a2 = stack_FVGS6[2]
# asm 1: movq <stack_FVGS6=stack256#8,>a2=int64#1
# asm 2: movq <stack_FVGS6=368(%rsp),>a2=%rdi
movq 368(%rsp),%rdi

# qhasm: a2 = stack_FVGS2[2] if carry
# asm 1: cmovc <stack_FVGS2=stack256#4,<a2=int64#1
# asm 2: cmovc <stack_FVGS2=240(%rsp),<a2=%rdi
cmovc 240(%rsp),%rdi

# qhasm: inplace stack_FVGS6[2] = a2
# asm 1: movq <a2=int64#1,<stack_FVGS6=stack256#8
# asm 2: movq <a2=%rdi,<stack_FVGS6=368(%rsp)
movq %rdi,368(%rsp)

# qhasm: a1 = stack_FVGS5[2]
# asm 1: movq <stack_FVGS5=stack256#7,>a1=int64#1
# asm 2: movq <stack_FVGS5=336(%rsp),>a1=%rdi
movq 336(%rsp),%rdi

# qhasm: a1 = stack_FVGS1[2] if carry
# asm 1: cmovc <stack_FVGS1=stack256#3,<a1=int64#1
# asm 2: cmovc <stack_FVGS1=208(%rsp),<a1=%rdi
cmovc 208(%rsp),%rdi

# qhasm: inplace stack_FVGS5[2] = a1
# asm 1: movq <a1=int64#1,<stack_FVGS5=stack256#7
# asm 2: movq <a1=%rdi,<stack_FVGS5=336(%rsp)
movq %rdi,336(%rsp)

# qhasm: a0 = stack_FVGS4[2]
# asm 1: movq <stack_FVGS4=stack256#6,>a0=int64#1
# asm 2: movq <stack_FVGS4=304(%rsp),>a0=%rdi
movq 304(%rsp),%rdi

# qhasm: a0 = stack_FVGS0[2] if carry
# asm 1: cmovc <stack_FVGS0=stack256#2,<a0=int64#1
# asm 2: cmovc <stack_FVGS0=176(%rsp),<a0=%rdi
cmovc 176(%rsp),%rdi

# qhasm: inplace stack_FVGS4[2] = a0
# asm 1: movq <a0=int64#1,<stack_FVGS4=stack256#6
# asm 2: movq <a0=%rdi,<stack_FVGS4=304(%rsp)
movq %rdi,304(%rsp)

# qhasm: t0 = -1152921504606846976
# asm 1: mov  $-1152921504606846976,>t0=int64#3
# asm 2: mov  $-1152921504606846976,>t0=%rdx
mov  $-1152921504606846976,%rdx

# qhasm: g = a0 & ~ t0
# asm 1: andn  <a0=int64#1,<t0=int64#3,>g=int64#1
# asm 2: andn  <a0=%rdi,<t0=%rdx,>g=%rdi
andn  %rdi,%rdx,%rdi

# qhasm: a0 = stack_FVGS4[2]
# asm 1: movq <stack_FVGS4=stack256#6,>a0=int64#3
# asm 2: movq <stack_FVGS4=304(%rsp),>a0=%rdx
movq 304(%rsp),%rdx

# qhasm: t0 = a0
# asm 1: mov  <a0=int64#3,>t0=int64#4
# asm 2: mov  <a0=%rdx,>t0=%rcx
mov  %rdx,%rcx

# qhasm: t0 &= 1073741823
# asm 1: and  $1073741823,<t0=int64#4
# asm 2: and  $1073741823,<t0=%rcx
and  $1073741823,%rcx

# qhasm: inplace stack_FVGS0[2] = t0
# asm 1: movq <t0=int64#4,<stack_FVGS0=stack256#2
# asm 2: movq <t0=%rcx,<stack_FVGS0=176(%rsp)
movq %rcx,176(%rsp)

# qhasm: t0 = a0
# asm 1: mov  <a0=int64#3,>t0=int64#4
# asm 2: mov  <a0=%rdx,>t0=%rcx
mov  %rdx,%rcx

# qhasm: (uint64) t0 >>= 30
# asm 1: shr  $30,<t0=int64#4
# asm 2: shr  $30,<t0=%rcx
shr  $30,%rcx

# qhasm: t0 &= 1073741823
# asm 1: and  $1073741823,<t0=int64#4
# asm 2: and  $1073741823,<t0=%rcx
and  $1073741823,%rcx

# qhasm: inplace stack_FVGS1[2] = t0
# asm 1: movq <t0=int64#4,<stack_FVGS1=stack256#3
# asm 2: movq <t0=%rcx,<stack_FVGS1=208(%rsp)
movq %rcx,208(%rsp)

# qhasm: a1 = stack_FVGS5[2]
# asm 1: movq <stack_FVGS5=stack256#7,>a1=int64#4
# asm 2: movq <stack_FVGS5=336(%rsp),>a1=%rcx
movq 336(%rsp),%rcx

# qhasm: a0 = (a1 a0) >> 60
# asm 1: shrd $60,<a1=int64#4,<a0=int64#3
# asm 2: shrd $60,<a1=%rcx,<a0=%rdx
shrd $60,%rcx,%rdx

# qhasm: a0 &= 1073741823
# asm 1: and  $1073741823,<a0=int64#3
# asm 2: and  $1073741823,<a0=%rdx
and  $1073741823,%rdx

# qhasm: inplace stack_FVGS2[2] = a0
# asm 1: movq <a0=int64#3,<stack_FVGS2=stack256#4
# asm 2: movq <a0=%rdx,<stack_FVGS2=240(%rsp)
movq %rdx,240(%rsp)

# qhasm: t0 = a1
# asm 1: mov  <a1=int64#4,>t0=int64#3
# asm 2: mov  <a1=%rcx,>t0=%rdx
mov  %rcx,%rdx

# qhasm: (uint64) t0 >>= 26
# asm 1: shr  $26,<t0=int64#3
# asm 2: shr  $26,<t0=%rdx
shr  $26,%rdx

# qhasm: t0 &= 1073741823
# asm 1: and  $1073741823,<t0=int64#3
# asm 2: and  $1073741823,<t0=%rdx
and  $1073741823,%rdx

# qhasm: inplace stack_FVGS3[2] = t0
# asm 1: movq <t0=int64#3,<stack_FVGS3=stack256#5
# asm 2: movq <t0=%rdx,<stack_FVGS3=272(%rsp)
movq %rdx,272(%rsp)

# qhasm: a2 = stack_FVGS6[2]
# asm 1: movq <stack_FVGS6=stack256#8,>a2=int64#3
# asm 2: movq <stack_FVGS6=368(%rsp),>a2=%rdx
movq 368(%rsp),%rdx

# qhasm: a1 = (a2 a1) >> 56
# asm 1: shrd $56,<a2=int64#3,<a1=int64#4
# asm 2: shrd $56,<a2=%rdx,<a1=%rcx
shrd $56,%rdx,%rcx

# qhasm: a1 &= 1073741823
# asm 1: and  $1073741823,<a1=int64#4
# asm 2: and  $1073741823,<a1=%rcx
and  $1073741823,%rcx

# qhasm: inplace stack_FVGS4[2] = a1
# asm 1: movq <a1=int64#4,<stack_FVGS4=stack256#6
# asm 2: movq <a1=%rcx,<stack_FVGS4=304(%rsp)
movq %rcx,304(%rsp)

# qhasm: t0 = a2
# asm 1: mov  <a2=int64#3,>t0=int64#4
# asm 2: mov  <a2=%rdx,>t0=%rcx
mov  %rdx,%rcx

# qhasm: (uint64) t0 >>= 22
# asm 1: shr  $22,<t0=int64#4
# asm 2: shr  $22,<t0=%rcx
shr  $22,%rcx

# qhasm: t0 &= 1073741823
# asm 1: and  $1073741823,<t0=int64#4
# asm 2: and  $1073741823,<t0=%rcx
and  $1073741823,%rcx

# qhasm: inplace stack_FVGS5[2] = t0
# asm 1: movq <t0=int64#4,<stack_FVGS5=stack256#7
# asm 2: movq <t0=%rcx,<stack_FVGS5=336(%rsp)
movq %rcx,336(%rsp)

# qhasm: (uint64) a2 >>= 52
# asm 1: shr  $52,<a2=int64#3
# asm 2: shr  $52,<a2=%rdx
shr  $52,%rdx

# qhasm: inplace stack_FVGS6[2] = a2
# asm 1: movq <a2=int64#3,<stack_FVGS6=stack256#8
# asm 2: movq <a2=%rdx,<stack_FVGS6=368(%rsp)
movq %rdx,368(%rsp)

# qhasm: f = stack_FVGS0[0]
# asm 1: movq <stack_FVGS0=stack256#2,>f=int64#4
# asm 2: movq <stack_FVGS0=160(%rsp),>f=%rcx
movq 160(%rsp),%rcx

# qhasm: f0 = stack_FVGS1[0]
# asm 1: movq <stack_FVGS1=stack256#3,>f0=int64#5
# asm 2: movq <stack_FVGS1=192(%rsp),>f0=%r8
movq 192(%rsp),%r8

# qhasm: f0 <<= 30
# asm 1: shl  $30,<f0=int64#5
# asm 2: shl  $30,<f0=%r8
shl  $30,%r8

# qhasm: f += f0 
# asm 1: add  <f0=int64#5,<f=int64#4
# asm 2: add  <f0=%r8,<f=%rcx
add  %r8,%rcx

# qhasm:                   m = 0
# asm 1: xor  >m=int64#6,>m=int64#6
# asm 2: xor  >m=%r9,>m=%r9
xor  %r9,%r9

# qhasm:                   z = -1
# asm 1: mov  $-1,>z=int64#3
# asm 2: mov  $-1,>z=%rdx
mov  $-1,%rdx

# qhasm: inplace stack_m1[0] = m
# asm 1: movq <m=int64#6,<stack_m1=stack256#1
# asm 2: movq <m=%r9,<stack_m1=128(%rsp)
movq %r9,128(%rsp)

# qhasm: inplace stack_m1[1] = z
# asm 1: movq <z=int64#3,<stack_m1=stack256#1
# asm 2: movq <z=%rdx,<stack_m1=136(%rsp)
movq %rdx,136(%rsp)

# qhasm:              _m2p20 = -1048576
# asm 1: mov  $-1048576,>_m2p20=int64#8
# asm 2: mov  $-1048576,>_m2p20=%r10
mov  $-1048576,%r10

# qhasm:         stack_m2p20 = _m2p20
# asm 1: movq <_m2p20=int64#8,>stack_m2p20=stack64#10
# asm 2: movq <_m2p20=%r10,>stack_m2p20=72(%rsp)
movq %r10,72(%rsp)

# qhasm:               _2p20 = 1048576
# asm 1: mov  $1048576,>_2p20=int64#3
# asm 2: mov  $1048576,>_2p20=%rdx
mov  $1048576,%rdx

# qhasm:          stack_2p20 = _2p20
# asm 1: movq <_2p20=int64#3,>stack_2p20=stack64#11
# asm 2: movq <_2p20=%rdx,>stack_2p20=80(%rsp)
movq %rdx,80(%rsp)

# qhasm:              _m2p41 = -2199023255552
# asm 1: mov  $-2199023255552,>_m2p41=int64#3
# asm 2: mov  $-2199023255552,>_m2p41=%rdx
mov  $-2199023255552,%rdx

# qhasm:         stack_m2p41 = _m2p41
# asm 1: movq <_m2p41=int64#3,>stack_m2p41=stack64#12
# asm 2: movq <_m2p41=%rdx,>stack_m2p41=88(%rsp)
movq %rdx,88(%rsp)

# qhasm:              _m2p62 = -4611686018427387904
# asm 1: mov  $-4611686018427387904,>_m2p62=int64#3
# asm 2: mov  $-4611686018427387904,>_m2p62=%rdx
mov  $-4611686018427387904,%rdx

# qhasm:         stack_m2p62 = _m2p62
# asm 1: movq <_m2p62=int64#3,>stack_m2p62=stack64#13
# asm 2: movq <_m2p62=%rdx,>stack_m2p62=96(%rsp)
movq %rdx,96(%rsp)

# qhasm:          _2p20a2p41 = 2199024304128
# asm 1: mov  $2199024304128,>_2p20a2p41=int64#3
# asm 2: mov  $2199024304128,>_2p20a2p41=%rdx
mov  $2199024304128,%rdx

# qhasm:     stack_2p20a2p41 = _2p20a2p41
# asm 1: movq <_2p20a2p41=int64#3,>stack_2p20a2p41=stack64#14
# asm 2: movq <_2p20a2p41=%rdx,>stack_2p20a2p41=104(%rsp)
movq %rdx,104(%rsp)

# qhasm:           _2p30m1x4 = mem256[ table +   0 ]
# asm 1: vmovupd   0(<table=int64#2),>_2p30m1x4=reg256#1
# asm 2: vmovupd   0(<table=%rsi),>_2p30m1x4=%ymm0
vmovupd   0(%rsi),%ymm0

# qhasm:      stack_2p30m1x4 = _2p30m1x4
# asm 1: vmovapd <_2p30m1x4=reg256#1,>stack_2p30m1x4=stack256#1
# asm 2: vmovapd <_2p30m1x4=%ymm0,>stack_2p30m1x4=128(%rsp)
vmovapd %ymm0,128(%rsp)

# qhasm:             _2p33x4 = mem256[ table +  32 ]
# asm 1: vmovupd   32(<table=int64#2),>_2p33x4=reg256#1
# asm 2: vmovupd   32(<table=%rsi),>_2p33x4=%ymm0
vmovupd   32(%rsi),%ymm0

# qhasm:        stack_2p33x4 = _2p33x4
# asm 1: vmovapd <_2p33x4=reg256#1,>stack_2p33x4=stack256#16
# asm 2: vmovapd <_2p33x4=%ymm0,>stack_2p33x4=608(%rsp)
vmovapd %ymm0,608(%rsp)

# qhasm:             _2p63x4 = mem256[ table +  64 ]
# asm 1: vmovupd   64(<table=int64#2),>_2p63x4=reg256#1
# asm 2: vmovupd   64(<table=%rsi),>_2p63x4=%ymm0
vmovupd   64(%rsi),%ymm0

# qhasm:        stack_2p63x4 = _2p63x4
# asm 1: vmovapd <_2p63x4=reg256#1,>stack_2p63x4=stack256#17
# asm 2: vmovapd <_2p63x4=%ymm0,>stack_2p63x4=640(%rsp)
vmovapd %ymm0,640(%rsp)

# qhasm:        _2p63m2p33x4 = mem256[ table +  96 ]
# asm 1: vmovupd   96(<table=int64#2),>_2p63m2p33x4=reg256#1
# asm 2: vmovupd   96(<table=%rsi),>_2p63m2p33x4=%ymm0
vmovupd   96(%rsi),%ymm0

# qhasm:   stack_2p63m2p33x4 = _2p63m2p33x4
# asm 1: vmovapd <_2p63m2p33x4=reg256#1,>stack_2p63m2p33x4=stack256#18
# asm 2: vmovapd <_2p63m2p33x4=%ymm0,>stack_2p63m2p33x4=672(%rsp)
vmovapd %ymm0,672(%rsp)

# qhasm:             _2p29x4 = mem256[ table + 128 ]
# asm 1: vmovupd   128(<table=int64#2),>_2p29x4=reg256#1
# asm 2: vmovupd   128(<table=%rsi),>_2p29x4=%ymm0
vmovupd   128(%rsi),%ymm0

# qhasm:        stack_2p29x4 = _2p29x4
# asm 1: vmovapd <_2p29x4=reg256#1,>stack_2p29x4=stack256#19
# asm 2: vmovapd <_2p29x4=%ymm0,>stack_2p29x4=704(%rsp)
vmovapd %ymm0,704(%rsp)

# qhasm: i = 8
# asm 1: mov  $8,>i=int64#2
# asm 2: mov  $8,>i=%rsi
mov  $8,%rsi

# qhasm: u = 1152921504606846976
# asm 1: mov  $1152921504606846976,>u=int64#9
# asm 2: mov  $1152921504606846976,>u=%r11
mov  $1152921504606846976,%r11

# qhasm: v = 0
# asm 1: xor  >v=int64#10,>v=int64#10
# asm 2: xor  >v=%r12,>v=%r12
xor  %r12,%r12

# qhasm: s = u
# asm 1: mov  <u=int64#9,>s=int64#11
# asm 2: mov  <u=%r11,>s=%r13
mov  %r11,%r13

# qhasm: r = 0
# asm 1: xor  >r=int64#12,>r=int64#12
# asm 2: xor  >r=%r14,>r=%r14
xor  %r14,%r14

# qhasm: bigloop:
._bigloop:

# qhasm:       rax = g
# asm 1: mov  <g=int64#1,>rax=int64#7
# asm 2: mov  <g=%rdi,>rax=%rax
mov  %rdi,%rax

# qhasm:       (int128) rdx rax = rax * s
# asm 1: imul <s=int64#11
# asm 2: imul <s=%r13
imul %r13

# qhasm:       t2 = rax
# asm 1: mov  <rax=int64#7,>t2=int64#14
# asm 2: mov  <rax=%rax,>t2=%rbx
mov  %rax,%rbx

# qhasm:       t1 = rdx
# asm 1: mov  <rdx=int64#3,>t1=int64#15
# asm 2: mov  <rdx=%rdx,>t1=%rbp
mov  %rdx,%rbp

# qhasm:       rax = f
# asm 1: mov  <f=int64#4,>rax=int64#7
# asm 2: mov  <f=%rcx,>rax=%rax
mov  %rcx,%rax

# qhasm:       (int128) rdx rax = rax * r
# asm 1: imul <r=int64#12
# asm 2: imul <r=%r14
imul %r14

# qhasm:       carry? t2 += rax
# asm 1: add  <rax=int64#7,<t2=int64#14
# asm 2: add  <rax=%rax,<t2=%rbx
add  %rax,%rbx

# qhasm:              t1 += rdx + carry
# asm 1: adc <rdx=int64#3,<t1=int64#15
# asm 2: adc <rdx=%rdx,<t1=%rbp
adc %rdx,%rbp

# qhasm:       t2 = (t1 t2) >> 60	 
# asm 1: shrd $60,<t1=int64#15,<t2=int64#14
# asm 2: shrd $60,<t1=%rbp,<t2=%rbx
shrd $60,%rbp,%rbx

# qhasm:       rax = f
# asm 1: mov  <f=int64#4,>rax=int64#7
# asm 2: mov  <f=%rcx,>rax=%rax
mov  %rcx,%rax

# qhasm:       (int128) rdx rax = rax * u
# asm 1: imul <u=int64#9
# asm 2: imul <u=%r11
imul %r11

# qhasm:       f = rax
# asm 1: mov  <rax=int64#7,>f=int64#4
# asm 2: mov  <rax=%rax,>f=%rcx
mov  %rax,%rcx

# qhasm:       t0 = rdx
# asm 1: mov  <rdx=int64#3,>t0=int64#15
# asm 2: mov  <rdx=%rdx,>t0=%rbp
mov  %rdx,%rbp

# qhasm:       rax = g
# asm 1: mov  <g=int64#1,>rax=int64#7
# asm 2: mov  <g=%rdi,>rax=%rax
mov  %rdi,%rax

# qhasm:       (int128) rdx rax = rax * v
# asm 1: imul <v=int64#10
# asm 2: imul <v=%r12
imul %r12

# qhasm:       carry? f += rax
# asm 1: add  <rax=int64#7,<f=int64#4
# asm 2: add  <rax=%rax,<f=%rcx
add  %rax,%rcx

# qhasm:              t0 += rdx + carry
# asm 1: adc <rdx=int64#3,<t0=int64#15
# asm 2: adc <rdx=%rdx,<t0=%rbp
adc %rdx,%rbp

# qhasm:       f = (t0 f) >> 60
# asm 1: shrd $60,<t0=int64#15,<f=int64#4
# asm 2: shrd $60,<t0=%rbp,<f=%rcx
shrd $60,%rbp,%rcx

# qhasm: new vvrr

# qhasm: vvrr = v,vvrr[1],0,0
# asm 1: vpinsrq $0x0,<v=int64#10,<vvrr=reg256#1%128,<vvrr=reg256#1%128
# asm 2: vpinsrq $0x0,<v=%r12,<vvrr=%xmm0,<vvrr=%xmm0
vpinsrq $0x0,%r12,%xmm0,%xmm0

# qhasm: vvrr = vvrr[0],r,0,0
# asm 1: vpinsrq $0x1,<r=int64#12,<vvrr=reg256#1%128,<vvrr=reg256#1%128
# asm 2: vpinsrq $0x1,<r=%r14,<vvrr=%xmm0,<vvrr=%xmm0
vpinsrq $0x1,%r14,%xmm0,%xmm0

# qhasm:       v *= g0
# asm 1: imul  <g0=int64#13,<v=int64#10
# asm 2: imul  <g0=%r15,<v=%r12
imul  %r15,%r12

# qhasm:       g0 *= s
# asm 1: imul  <s=int64#11,<g0=int64#13
# asm 2: imul  <s=%r13,<g0=%r15
imul  %r13,%r15

# qhasm:       r *= f0
# asm 1: imul  <f0=int64#5,<r=int64#12
# asm 2: imul  <f0=%r8,<r=%r14
imul  %r8,%r14

# qhasm:       f0 *= u
# asm 1: imul  <u=int64#9,<f0=int64#5
# asm 2: imul  <u=%r11,<f0=%r8
imul  %r11,%r8

# qhasm:       f0 += v
# asm 1: add  <v=int64#10,<f0=int64#5
# asm 2: add  <v=%r12,<f0=%r8
add  %r12,%r8

# qhasm:       g0 += r
# asm 1: add  <r=int64#12,<g0=int64#13
# asm 2: add  <r=%r14,<g0=%r15
add  %r14,%r15

# qhasm:       f += f0
# asm 1: add  <f0=int64#5,<f=int64#4
# asm 2: add  <f0=%r8,<f=%rcx
add  %r8,%rcx

# qhasm:       g = t2+g0
# asm 1: lea  (<t2=int64#14,<g0=int64#13),>g=int64#1
# asm 2: lea  (<t2=%rbx,<g0=%r15),>g=%rdi
lea  (%rbx,%r15),%rdi

# qhasm: FVGS0 = stack_FVGS0
# asm 1: vmovapd <stack_FVGS0=stack256#2,>FVGS0=reg256#2
# asm 2: vmovapd <stack_FVGS0=160(%rsp),>FVGS0=%ymm1
vmovapd 160(%rsp),%ymm1

# qhasm: loop20_init:
._loop20_init:

# qhasm:   fuv = f & ~ _m2p20
# asm 1: andn  <f=int64#4,<_m2p20=int64#8,>fuv=int64#3
# asm 2: andn  <f=%rcx,<_m2p20=%r10,>fuv=%rdx
andn  %rcx,%r10,%rdx

# qhasm: new uuss

# qhasm: uuss = u,uuss[1],0,0
# asm 1: vpinsrq $0x0,<u=int64#9,<uuss=reg256#3%128,<uuss=reg256#3%128
# asm 2: vpinsrq $0x0,<u=%r11,<uuss=%xmm2,<uuss=%xmm2
vpinsrq $0x0,%r11,%xmm2,%xmm2

# qhasm:   grs = g & ~ _m2p20
# asm 1: andn  <g=int64#1,<_m2p20=int64#8,>grs=int64#5
# asm 2: andn  <g=%rdi,<_m2p20=%r10,>grs=%r8
andn  %rdi,%r10,%r8

# qhasm:   fuv += stack_m2p41
# asm 1: addq <stack_m2p41=stack64#12,<fuv=int64#3
# asm 2: addq <stack_m2p41=88(%rsp),<fuv=%rdx
addq 88(%rsp),%rdx

# qhasm:   grs += stack_m2p62
# asm 1: addq <stack_m2p62=stack64#13,<grs=int64#5
# asm 2: addq <stack_m2p62=96(%rsp),<grs=%r8
addq 96(%rsp),%r8

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: uuss = uuss[0],s,0,0
# asm 1: vpinsrq $0x1,<s=int64#11,<uuss=reg256#3%128,<uuss=reg256#3%128
# asm 2: vpinsrq $0x1,<s=%r13,<uuss=%xmm2,<uuss=%xmm2
vpinsrq $0x1,%r13,%xmm2,%xmm2

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: GSFV0 = FVGS0[1,0]
# asm 1: vpermq $0x4e,<FVGS0=reg256#2,>GSFV0=reg256#4
# asm 2: vpermq $0x4e,<FVGS0=%ymm1,>GSFV0=%ymm3
vpermq $0x4e,%ymm1,%ymm3

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: uuss = uuss[0,0,1,1]
# asm 1: vpermq $0x50,<uuss=reg256#3,>uuss=reg256#3
# asm 2: vpermq $0x50,<uuss=%ymm2,>uuss=%ymm2
vpermq $0x50,%ymm2,%ymm2

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: vvrr = vvrr[0,0,1,1]
# asm 1: vpermq $0x50,<vvrr=reg256#1,>vvrr=reg256#1
# asm 2: vpermq $0x50,<vvrr=%ymm0,>vvrr=%ymm0
vpermq $0x50,%ymm0,%ymm0

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: _2p30m1x4 = stack_2p30m1x4
# asm 1: vmovapd <stack_2p30m1x4=stack256#1,>_2p30m1x4=reg256#5
# asm 2: vmovapd <stack_2p30m1x4=128(%rsp),>_2p30m1x4=%ymm4
vmovapd 128(%rsp),%ymm4

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: uuss0 = uuss & _2p30m1x4
# asm 1: vpand <uuss=reg256#3,<_2p30m1x4=reg256#5,>uuss0=reg256#6
# asm 2: vpand <uuss=%ymm2,<_2p30m1x4=%ymm4,>uuss0=%ymm5
vpand %ymm2,%ymm4,%ymm5

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: vvrr0 = vvrr & _2p30m1x4 
# asm 1: vpand <vvrr=reg256#1,<_2p30m1x4=reg256#5,>vvrr0=reg256#7
# asm 2: vpand <vvrr=%ymm0,<_2p30m1x4=%ymm4,>vvrr0=%ymm6
vpand %ymm0,%ymm4,%ymm6

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: _2p63x4 = stack_2p63x4
# asm 1: vmovapd <stack_2p63x4=stack256#17,>_2p63x4=reg256#8
# asm 2: vmovapd <stack_2p63x4=640(%rsp),>_2p63x4=%ymm7
vmovapd 640(%rsp),%ymm7

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: uuss1 = uuss ^ _2p63x4
# asm 1: vpxor <uuss=reg256#3,<_2p63x4=reg256#8,>uuss1=reg256#3
# asm 2: vpxor <uuss=%ymm2,<_2p63x4=%ymm7,>uuss1=%ymm2
vpxor %ymm2,%ymm7,%ymm2

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: vvrr1 = vvrr ^ _2p63x4
# asm 1: vpxor <vvrr=reg256#1,<_2p63x4=reg256#8,>vvrr1=reg256#1
# asm 2: vpxor <vvrr=%ymm0,<_2p63x4=%ymm7,>vvrr1=%ymm0
vpxor %ymm0,%ymm7,%ymm0

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: 4x uuss1 unsigned>>= 30
# asm 1: vpsrlq $30,<uuss1=reg256#3,<uuss1=reg256#3
# asm 2: vpsrlq $30,<uuss1=%ymm2,<uuss1=%ymm2
vpsrlq $30,%ymm2,%ymm2

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: 4x vvrr1 unsigned>>= 30
# asm 1: vpsrlq $30,<vvrr1=reg256#1,<vvrr1=reg256#1
# asm 2: vpsrlq $30,<vvrr1=%ymm0,<vvrr1=%ymm0
vpsrlq $30,%ymm0,%ymm0

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: _2p33x4 = stack_2p33x4
# asm 1: vmovapd <stack_2p33x4=stack256#16,>_2p33x4=reg256#9
# asm 2: vmovapd <stack_2p33x4=608(%rsp),>_2p33x4=%ymm8
vmovapd 608(%rsp),%ymm8

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: 4x uuss1 -= _2p33x4
# asm 1: vpsubq <_2p33x4=reg256#9,<uuss1=reg256#3,<uuss1=reg256#3
# asm 2: vpsubq <_2p33x4=%ymm8,<uuss1=%ymm2,<uuss1=%ymm2
vpsubq %ymm8,%ymm2,%ymm2

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: 4x vvrr1 -= _2p33x4
# asm 1: vpsubq <_2p33x4=reg256#9,<vvrr1=reg256#1,<vvrr1=reg256#1
# asm 2: vpsubq <_2p33x4=%ymm8,<vvrr1=%ymm0,<vvrr1=%ymm0
vpsubq %ymm8,%ymm0,%ymm0

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: 4x ta = int32 uuss0 * int32 FVGS0
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS0=reg256#2,>ta=reg256#9
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS0=%ymm1,>ta=%ymm8
vpmuldq %ymm5,%ymm1,%ymm8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV0
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV0=reg256#4,>tb=reg256#10
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV0=%ymm3,>tb=%ymm9
vpmuldq %ymm6,%ymm3,%ymm9

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: 4x out0 = ta + tb
# asm 1: vpaddq <tb=reg256#10,<ta=reg256#9,>out0=reg256#9
# asm 2: vpaddq <tb=%ymm9,<ta=%ymm8,>out0=%ymm8
vpaddq %ymm9,%ymm8,%ymm8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: minvx4 = 4x stack_minv
# asm 1: vpbroadcastq <stack_minv=stack64#9,>minvx4=reg256#10
# asm 2: vpbroadcastq <stack_minv=64(%rsp),>minvx4=%ymm9
vpbroadcastq 64(%rsp),%ymm9

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: mod0 = stack_mod0
# asm 1: vmovapd <stack_mod0=stack256#9,>mod0=reg256#11
# asm 2: vmovapd <stack_mod0=384(%rsp),>mod0=%ymm10
vmovapd 384(%rsp),%ymm10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: 4x d0 = int32 minvx4 * int32 out0
# asm 1: vpmuldq <minvx4=reg256#10,<out0=reg256#9,>d0=reg256#12
# asm 2: vpmuldq <minvx4=%ymm9,<out0=%ymm8,>d0=%ymm11
vpmuldq %ymm9,%ymm8,%ymm11

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: d0 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<d0=reg256#12,<d0=reg256#12
# asm 2: vpand <_2p30m1x4=%ymm4,<d0=%ymm11,<d0=%ymm11
vpand %ymm4,%ymm11,%ymm11

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: 4x ta = int32 mod0 * int32 d0
# asm 1: vpmuldq <mod0=reg256#11,<d0=reg256#12,>ta=reg256#13
# asm 2: vpmuldq <mod0=%ymm10,<d0=%ymm11,>ta=%ymm12
vpmuldq %ymm10,%ymm11,%ymm12

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: 4x out0 += ta
# asm 1: vpaddq <ta=reg256#13,<out0=reg256#9,<out0=reg256#9
# asm 2: vpaddq <ta=%ymm12,<out0=%ymm8,<out0=%ymm8
vpaddq %ymm12,%ymm8,%ymm8

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: 4x carryy = out0 +_2p63x4
# asm 1: vpaddq <_2p63x4=reg256#8,<out0=reg256#9,>carryy=reg256#8
# asm 2: vpaddq <_2p63x4=%ymm7,<out0=%ymm8,>carryy=%ymm7
vpaddq %ymm7,%ymm8,%ymm7

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#8,<carryy=reg256#8
# asm 2: vpsrlq $30,<carryy=%ymm7,<carryy=%ymm7
vpsrlq $30,%ymm7,%ymm7

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: FVGS1 = stack_FVGS1
# asm 1: vmovapd <stack_FVGS1=stack256#3,>FVGS1=reg256#9
# asm 2: vmovapd <stack_FVGS1=192(%rsp),>FVGS1=%ymm8
vmovapd 192(%rsp),%ymm8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: GSFV1 = FVGS1[1,0]
# asm 1: vpermq $0x4e,<FVGS1=reg256#9,>GSFV1=reg256#13
# asm 2: vpermq $0x4e,<FVGS1=%ymm8,>GSFV1=%ymm12
vpermq $0x4e,%ymm8,%ymm12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: mod1 = stack_mod1
# asm 1: vmovapd <stack_mod1=stack256#10,>mod1=reg256#14
# asm 2: vmovapd <stack_mod1=416(%rsp),>mod1=%ymm13
vmovapd 416(%rsp),%ymm13

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: 4x ta = int32 uuss1 * int32 FVGS0
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS0=reg256#2,>ta=reg256#2
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS0=%ymm1,>ta=%ymm1
vpmuldq %ymm2,%ymm1,%ymm1

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV0
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV0=reg256#4,>tb=reg256#4
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV0=%ymm3,>tb=%ymm3
vpmuldq %ymm0,%ymm3,%ymm3

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: 4x out1plus = ta + tb
# asm 1: vpaddq <tb=reg256#4,<ta=reg256#2,>out1plus=reg256#2
# asm 2: vpaddq <tb=%ymm3,<ta=%ymm1,>out1plus=%ymm1
vpaddq %ymm3,%ymm1,%ymm1

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: 4x ta = int32 uuss0 * int32 FVGS1
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS1=reg256#9,>ta=reg256#4
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS1=%ymm8,>ta=%ymm3
vpmuldq %ymm5,%ymm8,%ymm3

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV1
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV1=reg256#13,>tb=reg256#15
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV1=%ymm12,>tb=%ymm14
vpmuldq %ymm6,%ymm12,%ymm14

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: 4x out1 = ta + tb
# asm 1: vpaddq <tb=reg256#15,<ta=reg256#4,>out1=reg256#4
# asm 2: vpaddq <tb=%ymm14,<ta=%ymm3,>out1=%ymm3
vpaddq %ymm14,%ymm3,%ymm3

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: 4x out1 += out1plus
# asm 1: vpaddq <out1plus=reg256#2,<out1=reg256#4,<out1=reg256#4
# asm 2: vpaddq <out1plus=%ymm1,<out1=%ymm3,<out1=%ymm3
vpaddq %ymm1,%ymm3,%ymm3

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: 4x ta = int32 d0 * int32 mod1
# asm 1: vpmuldq <d0=reg256#12,<mod1=reg256#14,>ta=reg256#2
# asm 2: vpmuldq <d0=%ymm11,<mod1=%ymm13,>ta=%ymm1
vpmuldq %ymm11,%ymm13,%ymm1

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: 4x ta += carryy
# asm 1: vpaddq <carryy=reg256#8,<ta=reg256#2,<ta=reg256#2
# asm 2: vpaddq <carryy=%ymm7,<ta=%ymm1,<ta=%ymm1
vpaddq %ymm7,%ymm1,%ymm1

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: 4x out1 += ta
# asm 1: vpaddq <ta=reg256#2,<out1=reg256#4,<out1=reg256#4
# asm 2: vpaddq <ta=%ymm1,<out1=%ymm3,<out1=%ymm3
vpaddq %ymm1,%ymm3,%ymm3

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: 4x d1 = int32 minvx4 * int32 out1
# asm 1: vpmuldq <minvx4=reg256#10,<out1=reg256#4,>d1=reg256#2
# asm 2: vpmuldq <minvx4=%ymm9,<out1=%ymm3,>d1=%ymm1
vpmuldq %ymm9,%ymm3,%ymm1

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: d1 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<d1=reg256#2,<d1=reg256#2
# asm 2: vpand <_2p30m1x4=%ymm4,<d1=%ymm1,<d1=%ymm1
vpand %ymm4,%ymm1,%ymm1

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: 4x ta = int32 mod0 * int32 d1
# asm 1: vpmuldq <mod0=reg256#11,<d1=reg256#2,>ta=reg256#8
# asm 2: vpmuldq <mod0=%ymm10,<d1=%ymm1,>ta=%ymm7
vpmuldq %ymm10,%ymm1,%ymm7

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: 4x out1 += ta
# asm 1: vpaddq <ta=reg256#8,<out1=reg256#4,<out1=reg256#4
# asm 2: vpaddq <ta=%ymm7,<out1=%ymm3,<out1=%ymm3
vpaddq %ymm7,%ymm3,%ymm3

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: _2p63m2p33x4 = stack_2p63m2p33x4
# asm 1: vmovapd <stack_2p63m2p33x4=stack256#18,>_2p63m2p33x4=reg256#8
# asm 2: vmovapd <stack_2p63m2p33x4=672(%rsp),>_2p63m2p33x4=%ymm7
vmovapd 672(%rsp),%ymm7

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: 4x carryy = out1 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#8,<out1=reg256#4,>carryy=reg256#4
# asm 2: vpaddq <_2p63m2p33x4=%ymm7,<out1=%ymm3,>carryy=%ymm3
vpaddq %ymm7,%ymm3,%ymm3

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#4,<carryy=reg256#4
# asm 2: vpsrlq $30,<carryy=%ymm3,<carryy=%ymm3
vpsrlq $30,%ymm3,%ymm3

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: FVGS2 = stack_FVGS2
# asm 1: vmovapd <stack_FVGS2=stack256#4,>FVGS2=reg256#10
# asm 2: vmovapd <stack_FVGS2=224(%rsp),>FVGS2=%ymm9
vmovapd 224(%rsp),%ymm9

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: GSFV2 = FVGS2[1,0]
# asm 1: vpermq $0x4e,<FVGS2=reg256#10,>GSFV2=reg256#11
# asm 2: vpermq $0x4e,<FVGS2=%ymm9,>GSFV2=%ymm10
vpermq $0x4e,%ymm9,%ymm10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: mod2 = stack_mod2
# asm 1: vmovapd <stack_mod2=stack256#11,>mod2=reg256#15
# asm 2: vmovapd <stack_mod2=448(%rsp),>mod2=%ymm14
vmovapd 448(%rsp),%ymm14

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: 4x ta = int32 uuss1 * int32 FVGS1
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS1=reg256#9,>ta=reg256#9
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS1=%ymm8,>ta=%ymm8
vpmuldq %ymm2,%ymm8,%ymm8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV1
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV1=reg256#13,>tb=reg256#13
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV1=%ymm12,>tb=%ymm12
vpmuldq %ymm0,%ymm12,%ymm12

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: 4x out2plus = ta + tb
# asm 1: vpaddq <tb=reg256#13,<ta=reg256#9,>out2plus=reg256#9
# asm 2: vpaddq <tb=%ymm12,<ta=%ymm8,>out2plus=%ymm8
vpaddq %ymm12,%ymm8,%ymm8

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: 4x ta = int32 uuss0 * int32 FVGS2
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS2=reg256#10,>ta=reg256#13
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS2=%ymm9,>ta=%ymm12
vpmuldq %ymm5,%ymm9,%ymm12

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV2
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV2=reg256#11,>tb=reg256#16
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV2=%ymm10,>tb=%ymm15
vpmuldq %ymm6,%ymm10,%ymm15

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: 4x out2 = ta + tb
# asm 1: vpaddq <tb=reg256#16,<ta=reg256#13,>out2=reg256#13
# asm 2: vpaddq <tb=%ymm15,<ta=%ymm12,>out2=%ymm12
vpaddq %ymm15,%ymm12,%ymm12

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: 4x out2 += out2plus
# asm 1: vpaddq <out2plus=reg256#9,<out2=reg256#13,<out2=reg256#13
# asm 2: vpaddq <out2plus=%ymm8,<out2=%ymm12,<out2=%ymm12
vpaddq %ymm8,%ymm12,%ymm12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: 4x ta = int32 d0 * int32 mod2
# asm 1: vpmuldq <d0=reg256#12,<mod2=reg256#15,>ta=reg256#9
# asm 2: vpmuldq <d0=%ymm11,<mod2=%ymm14,>ta=%ymm8
vpmuldq %ymm11,%ymm14,%ymm8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: 4x tb = int32 d1 * int32 mod1
# asm 1: vpmuldq <d1=reg256#2,<mod1=reg256#14,>tb=reg256#14
# asm 2: vpmuldq <d1=%ymm1,<mod1=%ymm13,>tb=%ymm13
vpmuldq %ymm1,%ymm13,%ymm13

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: 4x out2plus2 = ta + tb
# asm 1: vpaddq <tb=reg256#14,<ta=reg256#9,>out2plus2=reg256#9
# asm 2: vpaddq <tb=%ymm13,<ta=%ymm8,>out2plus2=%ymm8
vpaddq %ymm13,%ymm8,%ymm8

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: 4x out2plus2 += carryy
# asm 1: vpaddq <carryy=reg256#4,<out2plus2=reg256#9,<out2plus2=reg256#9
# asm 2: vpaddq <carryy=%ymm3,<out2plus2=%ymm8,<out2plus2=%ymm8
vpaddq %ymm3,%ymm8,%ymm8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: 4x out2 += out2plus2
# asm 1: vpaddq <out2plus2=reg256#9,<out2=reg256#13,<out2=reg256#13
# asm 2: vpaddq <out2plus2=%ymm8,<out2=%ymm12,<out2=%ymm12
vpaddq %ymm8,%ymm12,%ymm12

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: 4x carryy = out2 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#8,<out2=reg256#13,>carryy=reg256#4
# asm 2: vpaddq <_2p63m2p33x4=%ymm7,<out2=%ymm12,>carryy=%ymm3
vpaddq %ymm7,%ymm12,%ymm3

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#4,<carryy=reg256#4
# asm 2: vpsrlq $30,<carryy=%ymm3,<carryy=%ymm3
vpsrlq $30,%ymm3,%ymm3

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: out2 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<out2=reg256#13,<out2=reg256#13
# asm 2: vpand <_2p30m1x4=%ymm4,<out2=%ymm12,<out2=%ymm12
vpand %ymm4,%ymm12,%ymm12

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: stack_FVGS0 = out2
# asm 1: vmovapd <out2=reg256#13,>stack_FVGS0=stack256#2
# asm 2: vmovapd <out2=%ymm12,>stack_FVGS0=160(%rsp)
vmovapd %ymm12,160(%rsp)

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: FVGS3 = stack_FVGS3
# asm 1: vmovapd <stack_FVGS3=stack256#5,>FVGS3=reg256#9
# asm 2: vmovapd <stack_FVGS3=256(%rsp),>FVGS3=%ymm8
vmovapd 256(%rsp),%ymm8

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: GSFV3 = FVGS3[1,0]
# asm 1: vpermq $0x4e,<FVGS3=reg256#9,>GSFV3=reg256#13
# asm 2: vpermq $0x4e,<FVGS3=%ymm8,>GSFV3=%ymm12
vpermq $0x4e,%ymm8,%ymm12

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: mod3 = stack_mod3
# asm 1: vmovapd <stack_mod3=stack256#12,>mod3=reg256#14
# asm 2: vmovapd <stack_mod3=480(%rsp),>mod3=%ymm13
vmovapd 480(%rsp),%ymm13

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: 4x ta = int32 uuss1 * int32 FVGS2
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS2=reg256#10,>ta=reg256#10
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS2=%ymm9,>ta=%ymm9
vpmuldq %ymm2,%ymm9,%ymm9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV2
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV2=reg256#11,>tb=reg256#11
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV2=%ymm10,>tb=%ymm10
vpmuldq %ymm0,%ymm10,%ymm10

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: 4x out3plus = ta + tb
# asm 1: vpaddq <tb=reg256#11,<ta=reg256#10,>out3plus=reg256#10
# asm 2: vpaddq <tb=%ymm10,<ta=%ymm9,>out3plus=%ymm9
vpaddq %ymm10,%ymm9,%ymm9

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: 4x ta = int32 uuss0 * int32 FVGS3
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS3=reg256#9,>ta=reg256#11
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS3=%ymm8,>ta=%ymm10
vpmuldq %ymm5,%ymm8,%ymm10

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV3
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV3=reg256#13,>tb=reg256#16
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV3=%ymm12,>tb=%ymm15
vpmuldq %ymm6,%ymm12,%ymm15

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: 4x out3 = ta + tb
# asm 1: vpaddq <tb=reg256#16,<ta=reg256#11,>out3=reg256#11
# asm 2: vpaddq <tb=%ymm15,<ta=%ymm10,>out3=%ymm10
vpaddq %ymm15,%ymm10,%ymm10

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: 4x out3 += out3plus
# asm 1: vpaddq <out3plus=reg256#10,<out3=reg256#11,<out3=reg256#11
# asm 2: vpaddq <out3plus=%ymm9,<out3=%ymm10,<out3=%ymm10
vpaddq %ymm9,%ymm10,%ymm10

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: 4x ta = int32 d0 * int32 mod3
# asm 1: vpmuldq <d0=reg256#12,<mod3=reg256#14,>ta=reg256#10
# asm 2: vpmuldq <d0=%ymm11,<mod3=%ymm13,>ta=%ymm9
vpmuldq %ymm11,%ymm13,%ymm9

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: 4x tb = int32 d1 * int32 mod2
# asm 1: vpmuldq <d1=reg256#2,<mod2=reg256#15,>tb=reg256#15
# asm 2: vpmuldq <d1=%ymm1,<mod2=%ymm14,>tb=%ymm14
vpmuldq %ymm1,%ymm14,%ymm14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: 4x out3plus2 = ta + tb
# asm 1: vpaddq <tb=reg256#15,<ta=reg256#10,>out3plus2=reg256#10
# asm 2: vpaddq <tb=%ymm14,<ta=%ymm9,>out3plus2=%ymm9
vpaddq %ymm14,%ymm9,%ymm9

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: 4x out3plus2 += carryy
# asm 1: vpaddq <carryy=reg256#4,<out3plus2=reg256#10,<out3plus2=reg256#10
# asm 2: vpaddq <carryy=%ymm3,<out3plus2=%ymm9,<out3plus2=%ymm9
vpaddq %ymm3,%ymm9,%ymm9

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: 4x out3 += out3plus2
# asm 1: vpaddq <out3plus2=reg256#10,<out3=reg256#11,<out3=reg256#11
# asm 2: vpaddq <out3plus2=%ymm9,<out3=%ymm10,<out3=%ymm10
vpaddq %ymm9,%ymm10,%ymm10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: 4x carryy = out3 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#8,<out3=reg256#11,>carryy=reg256#4
# asm 2: vpaddq <_2p63m2p33x4=%ymm7,<out3=%ymm10,>carryy=%ymm3
vpaddq %ymm7,%ymm10,%ymm3

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#4,<carryy=reg256#4
# asm 2: vpsrlq $30,<carryy=%ymm3,<carryy=%ymm3
vpsrlq $30,%ymm3,%ymm3

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: out3 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<out3=reg256#11,<out3=reg256#11
# asm 2: vpand <_2p30m1x4=%ymm4,<out3=%ymm10,<out3=%ymm10
vpand %ymm4,%ymm10,%ymm10

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: stack_FVGS1 = out3
# asm 1: vmovapd <out3=reg256#11,>stack_FVGS1=stack256#3
# asm 2: vmovapd <out3=%ymm10,>stack_FVGS1=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: FVGS4 = stack_FVGS4
# asm 1: vmovapd <stack_FVGS4=stack256#6,>FVGS4=reg256#10
# asm 2: vmovapd <stack_FVGS4=288(%rsp),>FVGS4=%ymm9
vmovapd 288(%rsp),%ymm9

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: GSFV4 = FVGS4[1,0]
# asm 1: vpermq $0x4e,<FVGS4=reg256#10,>GSFV4=reg256#11
# asm 2: vpermq $0x4e,<FVGS4=%ymm9,>GSFV4=%ymm10
vpermq $0x4e,%ymm9,%ymm10

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: mod4 = stack_mod4
# asm 1: vmovapd <stack_mod4=stack256#13,>mod4=reg256#15
# asm 2: vmovapd <stack_mod4=512(%rsp),>mod4=%ymm14
vmovapd 512(%rsp),%ymm14

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: 4x ta = int32 uuss1 * int32 FVGS3
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS3=reg256#9,>ta=reg256#9
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS3=%ymm8,>ta=%ymm8
vpmuldq %ymm2,%ymm8,%ymm8

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV3
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV3=reg256#13,>tb=reg256#13
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV3=%ymm12,>tb=%ymm12
vpmuldq %ymm0,%ymm12,%ymm12

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: 4x out4plus = ta + tb
# asm 1: vpaddq <tb=reg256#13,<ta=reg256#9,>out4plus=reg256#9
# asm 2: vpaddq <tb=%ymm12,<ta=%ymm8,>out4plus=%ymm8
vpaddq %ymm12,%ymm8,%ymm8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: 4x ta = int32 uuss0 * int32 FVGS4
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS4=reg256#10,>ta=reg256#13
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS4=%ymm9,>ta=%ymm12
vpmuldq %ymm5,%ymm9,%ymm12

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV4
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV4=reg256#11,>tb=reg256#16
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV4=%ymm10,>tb=%ymm15
vpmuldq %ymm6,%ymm10,%ymm15

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: 4x out4 = ta + tb
# asm 1: vpaddq <tb=reg256#16,<ta=reg256#13,>out4=reg256#13
# asm 2: vpaddq <tb=%ymm15,<ta=%ymm12,>out4=%ymm12
vpaddq %ymm15,%ymm12,%ymm12

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: 4x out4 += out4plus
# asm 1: vpaddq <out4plus=reg256#9,<out4=reg256#13,<out4=reg256#13
# asm 2: vpaddq <out4plus=%ymm8,<out4=%ymm12,<out4=%ymm12
vpaddq %ymm8,%ymm12,%ymm12

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: 4x ta = int32 d0 * int32 mod4
# asm 1: vpmuldq <d0=reg256#12,<mod4=reg256#15,>ta=reg256#9
# asm 2: vpmuldq <d0=%ymm11,<mod4=%ymm14,>ta=%ymm8
vpmuldq %ymm11,%ymm14,%ymm8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: 4x tb = int32 d1 * int32 mod3
# asm 1: vpmuldq <d1=reg256#2,<mod3=reg256#14,>tb=reg256#14
# asm 2: vpmuldq <d1=%ymm1,<mod3=%ymm13,>tb=%ymm13
vpmuldq %ymm1,%ymm13,%ymm13

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: 4x out4plus2 = ta + tb
# asm 1: vpaddq <tb=reg256#14,<ta=reg256#9,>out4plus2=reg256#9
# asm 2: vpaddq <tb=%ymm13,<ta=%ymm8,>out4plus2=%ymm8
vpaddq %ymm13,%ymm8,%ymm8

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: 4x out4plus2 += carryy
# asm 1: vpaddq <carryy=reg256#4,<out4plus2=reg256#9,<out4plus2=reg256#9
# asm 2: vpaddq <carryy=%ymm3,<out4plus2=%ymm8,<out4plus2=%ymm8
vpaddq %ymm3,%ymm8,%ymm8

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: 4x out4 += out4plus2
# asm 1: vpaddq <out4plus2=reg256#9,<out4=reg256#13,<out4=reg256#13
# asm 2: vpaddq <out4plus2=%ymm8,<out4=%ymm12,<out4=%ymm12
vpaddq %ymm8,%ymm12,%ymm12

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: 4x carryy = out4 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#8,<out4=reg256#13,>carryy=reg256#4
# asm 2: vpaddq <_2p63m2p33x4=%ymm7,<out4=%ymm12,>carryy=%ymm3
vpaddq %ymm7,%ymm12,%ymm3

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#4,<carryy=reg256#4
# asm 2: vpsrlq $30,<carryy=%ymm3,<carryy=%ymm3
vpsrlq $30,%ymm3,%ymm3

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: out4 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<out4=reg256#13,<out4=reg256#13
# asm 2: vpand <_2p30m1x4=%ymm4,<out4=%ymm12,<out4=%ymm12
vpand %ymm4,%ymm12,%ymm12

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: stack_FVGS2 = out4
# asm 1: vmovapd <out4=reg256#13,>stack_FVGS2=stack256#4
# asm 2: vmovapd <out4=%ymm12,>stack_FVGS2=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: FVGS5 = stack_FVGS5
# asm 1: vmovapd <stack_FVGS5=stack256#7,>FVGS5=reg256#9
# asm 2: vmovapd <stack_FVGS5=320(%rsp),>FVGS5=%ymm8
vmovapd 320(%rsp),%ymm8

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: GSFV5 = FVGS5[1,0]
# asm 1: vpermq $0x4e,<FVGS5=reg256#9,>GSFV5=reg256#13
# asm 2: vpermq $0x4e,<FVGS5=%ymm8,>GSFV5=%ymm12
vpermq $0x4e,%ymm8,%ymm12

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: mod5 = stack_mod5
# asm 1: vmovapd <stack_mod5=stack256#14,>mod5=reg256#14
# asm 2: vmovapd <stack_mod5=544(%rsp),>mod5=%ymm13
vmovapd 544(%rsp),%ymm13

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: 4x ta = int32 uuss1 * int32 FVGS4
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS4=reg256#10,>ta=reg256#10
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS4=%ymm9,>ta=%ymm9
vpmuldq %ymm2,%ymm9,%ymm9

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV4
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV4=reg256#11,>tb=reg256#11
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV4=%ymm10,>tb=%ymm10
vpmuldq %ymm0,%ymm10,%ymm10

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: 4x out5plus = ta + tb
# asm 1: vpaddq <tb=reg256#11,<ta=reg256#10,>out5plus=reg256#10
# asm 2: vpaddq <tb=%ymm10,<ta=%ymm9,>out5plus=%ymm9
vpaddq %ymm10,%ymm9,%ymm9

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: 4x ta = int32 uuss0 * int32 FVGS5
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS5=reg256#9,>ta=reg256#11
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS5=%ymm8,>ta=%ymm10
vpmuldq %ymm5,%ymm8,%ymm10

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV5
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV5=reg256#13,>tb=reg256#16
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV5=%ymm12,>tb=%ymm15
vpmuldq %ymm6,%ymm12,%ymm15

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: 4x out5 = ta + tb
# asm 1: vpaddq <tb=reg256#16,<ta=reg256#11,>out5=reg256#11
# asm 2: vpaddq <tb=%ymm15,<ta=%ymm10,>out5=%ymm10
vpaddq %ymm15,%ymm10,%ymm10

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: 4x out5 += out5plus
# asm 1: vpaddq <out5plus=reg256#10,<out5=reg256#11,<out5=reg256#11
# asm 2: vpaddq <out5plus=%ymm9,<out5=%ymm10,<out5=%ymm10
vpaddq %ymm9,%ymm10,%ymm10

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: 4x ta = int32 d0 * int32 mod5
# asm 1: vpmuldq <d0=reg256#12,<mod5=reg256#14,>ta=reg256#10
# asm 2: vpmuldq <d0=%ymm11,<mod5=%ymm13,>ta=%ymm9
vpmuldq %ymm11,%ymm13,%ymm9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: 4x tb = int32 d1 * int32 mod4
# asm 1: vpmuldq <d1=reg256#2,<mod4=reg256#15,>tb=reg256#15
# asm 2: vpmuldq <d1=%ymm1,<mod4=%ymm14,>tb=%ymm14
vpmuldq %ymm1,%ymm14,%ymm14

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: 4x out5plus2 = ta + tb
# asm 1: vpaddq <tb=reg256#15,<ta=reg256#10,>out5plus2=reg256#10
# asm 2: vpaddq <tb=%ymm14,<ta=%ymm9,>out5plus2=%ymm9
vpaddq %ymm14,%ymm9,%ymm9

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: 4x out5plus2 += carryy
# asm 1: vpaddq <carryy=reg256#4,<out5plus2=reg256#10,<out5plus2=reg256#10
# asm 2: vpaddq <carryy=%ymm3,<out5plus2=%ymm9,<out5plus2=%ymm9
vpaddq %ymm3,%ymm9,%ymm9

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: 4x out5 += out5plus2
# asm 1: vpaddq <out5plus2=reg256#10,<out5=reg256#11,<out5=reg256#11
# asm 2: vpaddq <out5plus2=%ymm9,<out5=%ymm10,<out5=%ymm10
vpaddq %ymm9,%ymm10,%ymm10

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: 4x carryy = out5 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#8,<out5=reg256#11,>carryy=reg256#4
# asm 2: vpaddq <_2p63m2p33x4=%ymm7,<out5=%ymm10,>carryy=%ymm3
vpaddq %ymm7,%ymm10,%ymm3

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#4,<carryy=reg256#4
# asm 2: vpsrlq $30,<carryy=%ymm3,<carryy=%ymm3
vpsrlq $30,%ymm3,%ymm3

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: out5 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<out5=reg256#11,<out5=reg256#11
# asm 2: vpand <_2p30m1x4=%ymm4,<out5=%ymm10,<out5=%ymm10
vpand %ymm4,%ymm10,%ymm10

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: stack_FVGS3 = out5
# asm 1: vmovapd <out5=reg256#11,>stack_FVGS3=stack256#5
# asm 2: vmovapd <out5=%ymm10,>stack_FVGS3=256(%rsp)
vmovapd %ymm10,256(%rsp)

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: FVGS6 = stack_FVGS6
# asm 1: vmovapd <stack_FVGS6=stack256#8,>FVGS6=reg256#10
# asm 2: vmovapd <stack_FVGS6=352(%rsp),>FVGS6=%ymm9
vmovapd 352(%rsp),%ymm9

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: GSFV6 = FVGS6[1,0]
# asm 1: vpermq $0x4e,<FVGS6=reg256#10,>GSFV6=reg256#11
# asm 2: vpermq $0x4e,<FVGS6=%ymm9,>GSFV6=%ymm10
vpermq $0x4e,%ymm9,%ymm10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: mod6 = stack_mod6
# asm 1: vmovapd <stack_mod6=stack256#15,>mod6=reg256#15
# asm 2: vmovapd <stack_mod6=576(%rsp),>mod6=%ymm14
vmovapd 576(%rsp),%ymm14

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: 4x ta = int32 uuss1 * int32 FVGS5
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS5=reg256#9,>ta=reg256#9
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS5=%ymm8,>ta=%ymm8
vpmuldq %ymm2,%ymm8,%ymm8

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV5
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV5=reg256#13,>tb=reg256#13
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV5=%ymm12,>tb=%ymm12
vpmuldq %ymm0,%ymm12,%ymm12

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: 4x out6plus = ta + tb
# asm 1: vpaddq <tb=reg256#13,<ta=reg256#9,>out6plus=reg256#9
# asm 2: vpaddq <tb=%ymm12,<ta=%ymm8,>out6plus=%ymm8
vpaddq %ymm12,%ymm8,%ymm8

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: 4x ta = int32 uuss0 * int32 FVGS6
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS6=reg256#10,>ta=reg256#6
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS6=%ymm9,>ta=%ymm5
vpmuldq %ymm5,%ymm9,%ymm5

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV6
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV6=reg256#11,>tb=reg256#7
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV6=%ymm10,>tb=%ymm6
vpmuldq %ymm6,%ymm10,%ymm6

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: 4x out6 = ta + tb
# asm 1: vpaddq <tb=reg256#7,<ta=reg256#6,>out6=reg256#6
# asm 2: vpaddq <tb=%ymm6,<ta=%ymm5,>out6=%ymm5
vpaddq %ymm6,%ymm5,%ymm5

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: 4x out6 += out6plus
# asm 1: vpaddq <out6plus=reg256#9,<out6=reg256#6,<out6=reg256#6
# asm 2: vpaddq <out6plus=%ymm8,<out6=%ymm5,<out6=%ymm5
vpaddq %ymm8,%ymm5,%ymm5

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: 4x ta = int32 d0 * int32 mod6
# asm 1: vpmuldq <d0=reg256#12,<mod6=reg256#15,>ta=reg256#7
# asm 2: vpmuldq <d0=%ymm11,<mod6=%ymm14,>ta=%ymm6
vpmuldq %ymm11,%ymm14,%ymm6

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: 4x tb = int32 d1 * int32 mod5
# asm 1: vpmuldq <d1=reg256#2,<mod5=reg256#14,>tb=reg256#9
# asm 2: vpmuldq <d1=%ymm1,<mod5=%ymm13,>tb=%ymm8
vpmuldq %ymm1,%ymm13,%ymm8

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: 4x out6plus2 = ta + tb
# asm 1: vpaddq <tb=reg256#9,<ta=reg256#7,>out6plus2=reg256#7
# asm 2: vpaddq <tb=%ymm8,<ta=%ymm6,>out6plus2=%ymm6
vpaddq %ymm8,%ymm6,%ymm6

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm: 4x out6plus2 += carryy
# asm 1: vpaddq <carryy=reg256#4,<out6plus2=reg256#7,<out6plus2=reg256#7
# asm 2: vpaddq <carryy=%ymm3,<out6plus2=%ymm6,<out6plus2=%ymm6
vpaddq %ymm3,%ymm6,%ymm6

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm: 4x out6 += out6plus2
# asm 1: vpaddq <out6plus2=reg256#7,<out6=reg256#6,<out6=reg256#6
# asm 2: vpaddq <out6plus2=%ymm6,<out6=%ymm5,<out6=%ymm5
vpaddq %ymm6,%ymm5,%ymm5

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm: 4x carryy = out6 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#8,<out6=reg256#6,>carryy=reg256#4
# asm 2: vpaddq <_2p63m2p33x4=%ymm7,<out6=%ymm5,>carryy=%ymm3
vpaddq %ymm7,%ymm5,%ymm3

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#4,<carryy=reg256#4
# asm 2: vpsrlq $30,<carryy=%ymm3,<carryy=%ymm3
vpsrlq $30,%ymm3,%ymm3

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm: out6 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<out6=reg256#6,<out6=reg256#6
# asm 2: vpand <_2p30m1x4=%ymm4,<out6=%ymm5,<out6=%ymm5
vpand %ymm4,%ymm5,%ymm5

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm: stack_FVGS4 = out6
# asm 1: vmovapd <out6=reg256#6,>stack_FVGS4=stack256#6
# asm 2: vmovapd <out6=%ymm5,>stack_FVGS4=288(%rsp)
vmovapd %ymm5,288(%rsp)

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm: _2p33x4 = stack_2p33x4
# asm 1: vmovapd <stack_2p33x4=stack256#16,>_2p33x4=reg256#6
# asm 2: vmovapd <stack_2p33x4=608(%rsp),>_2p33x4=%ymm5
vmovapd 608(%rsp),%ymm5

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: 4x ta = int32 uuss1 * int32 FVGS6
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS6=reg256#10,>ta=reg256#3
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS6=%ymm9,>ta=%ymm2
vpmuldq %ymm2,%ymm9,%ymm2

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#7
# asm 2: mov  $-1,>z=%rax
mov  $-1,%rax

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#9
# asm 2: mov  <grs=%r8,>oldg=%r11
mov  %r8,%r11

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV6
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV6=reg256#11,>tb=reg256#1
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV6=%ymm10,>tb=%ymm0
vpmuldq %ymm0,%ymm10,%ymm0

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#3),>h=int64#10
# asm 2: lea  (<grs=%r8,<fuv=%rdx),>h=%r12
lea  (%r8,%rdx),%r12

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm: 4x out7plus = ta + tb
# asm 1: vpaddq <tb=reg256#1,<ta=reg256#3,>out7plus=reg256#1
# asm 2: vpaddq <tb=%ymm0,<ta=%ymm2,>out7plus=%ymm0
vpaddq %ymm0,%ymm2,%ymm0

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#7
# asm 2: cmovne <m=%r9,<z=%rax
cmovne %r9,%rax

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#10
# asm 2: cmove <grs=%r8,<h=%r12
cmove %r8,%r12

# qhasm: 4x ta = int32 mod6 * int32 d1
# asm 1: vpmuldq <mod6=reg256#15,<d1=reg256#2,>ta=reg256#2
# asm 2: vpmuldq <mod6=%ymm14,<d1=%ymm1,>ta=%ymm1
vpmuldq %ymm14,%ymm1,%ymm1

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#11
# asm 2: lea  1(<m=%r9),>mnew=%r13
lea  1(%r9),%r13

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#3,<grs=int64#5
# asm 2: sub  <fuv=%rdx,<grs=%r8
sub  %rdx,%r8

# qhasm: 4x out7 = ta + carryy
# asm 1: vpaddq <carryy=reg256#4,<ta=reg256#2,>out7=reg256#2
# asm 2: vpaddq <carryy=%ymm3,<ta=%ymm1,>out7=%ymm1
vpaddq %ymm3,%ymm1,%ymm1

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#10
# asm 2: sar  $1,<h=%r12
sar  $1,%r12

# qhasm: 4x out7 += out7plus
# asm 1: vpaddq <out7plus=reg256#1,<out7=reg256#2,<out7=reg256#2
# asm 2: vpaddq <out7plus=%ymm0,<out7=%ymm1,<out7=%ymm1
vpaddq %ymm0,%ymm1,%ymm1

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#7
# asm 2: cmp  $0,<z=%rax
cmp  $0,%rax

# qhasm: 4x out8 = out7 + _2p63m2p33x4
# asm 1: vpaddq <_2p63m2p33x4=reg256#8,<out7=reg256#2,>out8=reg256#1
# asm 2: vpaddq <_2p63m2p33x4=%ymm7,<out7=%ymm1,>out8=%ymm0
vpaddq %ymm7,%ymm1,%ymm0

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#9,<fuv=int64#3
# asm 2: cmovge <oldg=%r11,<fuv=%rdx
cmovge %r11,%rdx

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#10,<grs=int64#5
# asm 2: cmovl <h=%r12,<grs=%r8
cmovl %r12,%r8

# qhasm: 4x out8 unsigned >>= 30
# asm 1: vpsrlq $30,<out8=reg256#1,<out8=reg256#1
# asm 2: vpsrlq $30,<out8=%ymm0,<out8=%ymm0
vpsrlq $30,%ymm0,%ymm0

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#11,<m=int64#6
# asm 2: cmovl <mnew=%r13,<m=%r9
cmovl %r13,%r9

# qhasm: extract_init:
._extract_init:

# qhasm:   _2p20a2p41 = stack_2p20a2p41
# asm 1: movq <stack_2p20a2p41=stack64#14,>_2p20a2p41=int64#7
# asm 2: movq <stack_2p20a2p41=104(%rsp),>_2p20a2p41=%rax
movq 104(%rsp),%rax

# qhasm: 4x out8 -= _2p33x4
# asm 1: vpsubq <_2p33x4=reg256#6,<out8=reg256#1,<out8=reg256#1
# asm 2: vpsubq <_2p33x4=%ymm5,<out8=%ymm0,<out8=%ymm0
vpsubq %ymm5,%ymm0,%ymm0

# qhasm:   s = grs + _2p20a2p41
# asm 1: lea  (<grs=int64#5,<_2p20a2p41=int64#7),>s=int64#9
# asm 2: lea  (<grs=%r8,<_2p20a2p41=%rax),>s=%r11
lea  (%r8,%rax),%r11

# qhasm: out7 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<out7=reg256#2,<out7=reg256#2
# asm 2: vpand <_2p30m1x4=%ymm4,<out7=%ymm1,<out7=%ymm1
vpand %ymm4,%ymm1,%ymm1

# qhasm:   (int64) s >>= 42
# asm 1: sar  $42,<s=int64#9
# asm 2: sar  $42,<s=%r11
sar  $42,%r11

# qhasm:   t2 = g
# asm 1: mov  <g=int64#1,>t2=int64#10
# asm 2: mov  <g=%rdi,>t2=%r12
mov  %rdi,%r12

# qhasm: stack_FVGS5 = out7
# asm 1: vmovapd <out7=reg256#2,>stack_FVGS5=stack256#7
# asm 2: vmovapd <out7=%ymm1,>stack_FVGS5=320(%rsp)
vmovapd %ymm1,320(%rsp)

# qhasm:   g *= s  
# asm 1: imul  <s=int64#9,<g=int64#1
# asm 2: imul  <s=%r11,<g=%rdi
imul  %r11,%rdi

# qhasm:   v = fuv + _2p20a2p41
# asm 1: lea  (<fuv=int64#3,<_2p20a2p41=int64#7),>v=int64#7
# asm 2: lea  (<fuv=%rdx,<_2p20a2p41=%rax),>v=%rax
lea  (%rdx,%rax),%rax

# qhasm: stack_FVGS6 = out8
# asm 1: vmovapd <out8=reg256#1,>stack_FVGS6=stack256#8
# asm 2: vmovapd <out8=%ymm0,>stack_FVGS6=352(%rsp)
vmovapd %ymm0,352(%rsp)

# qhasm:   (int64) v >>= 42
# asm 1: sar  $42,<v=int64#7
# asm 2: sar  $42,<v=%rax
sar  $42,%rax

# qhasm:   t2 *= v
# asm 1: imul  <v=int64#7,<t2=int64#10
# asm 2: imul  <v=%rax,<t2=%r12
imul  %rax,%r12

# qhasm:   _2p20 = stack_2p20
# asm 1: movq <stack_2p20=stack64#11,>_2p20=int64#11
# asm 2: movq <stack_2p20=80(%rsp),>_2p20=%r13
movq 80(%rsp),%r13

# qhasm:   r = grs + _2p20
# asm 1: lea  (<grs=int64#5,<_2p20=int64#11),>r=int64#5
# asm 2: lea  (<grs=%r8,<_2p20=%r13),>r=%r8
lea  (%r8,%r13),%r8

# qhasm:   r <<= 22
# asm 1: shl  $22,<r=int64#5
# asm 2: shl  $22,<r=%r8
shl  $22,%r8

# qhasm:   (int64) r >>= 43
# asm 1: sar  $43,<r=int64#5
# asm 2: sar  $43,<r=%r8
sar  $43,%r8

# qhasm:       rax = f
# asm 1: mov  <f=int64#4,>rax=int64#12
# asm 2: mov  <f=%rcx,>rax=%r14
mov  %rcx,%r14

# qhasm:       rax *= r
# asm 1: imul  <r=int64#5,<rax=int64#12
# asm 2: imul  <r=%r8,<rax=%r14
imul  %r8,%r14

# qhasm:   u = fuv + _2p20
# asm 1: lea  (<fuv=int64#3,<_2p20=int64#11),>u=int64#3
# asm 2: lea  (<fuv=%rdx,<_2p20=%r13),>u=%rdx
lea  (%rdx,%r13),%rdx

# qhasm:   u <<= 22
# asm 1: shl  $22,<u=int64#3
# asm 2: shl  $22,<u=%rdx
shl  $22,%rdx

# qhasm:   (int64) u >>= 43
# asm 1: sar  $43,<u=int64#3
# asm 2: sar  $43,<u=%rdx
sar  $43,%rdx

# qhasm:        f *= u
# asm 1: imul  <u=int64#3,<f=int64#4
# asm 2: imul  <u=%rdx,<f=%rcx
imul  %rdx,%rcx

# qhasm:        f += t2
# asm 1: add  <t2=int64#10,<f=int64#4
# asm 2: add  <t2=%r12,<f=%rcx
add  %r12,%rcx

# qhasm:        g += rax
# asm 1: add  <rax=int64#12,<g=int64#1
# asm 2: add  <rax=%r14,<g=%rdi
add  %r14,%rdi

# qhasm:   (int64) f >>= 20
# asm 1: sar  $20,<f=int64#4
# asm 2: sar  $20,<f=%rcx
sar  $20,%rcx

# qhasm:   (int64) g >>= 20
# asm 1: sar  $20,<g=int64#1
# asm 2: sar  $20,<g=%rdi
sar  $20,%rdi

# qhasm:   inplace stack_vvrr[0] = v
# asm 1: movq <v=int64#7,<stack_vvrr=stack256#21
# asm 2: movq <v=%rax,<stack_vvrr=768(%rsp)
movq %rax,768(%rsp)

# qhasm:   inplace stack_uuss[0] = u
# asm 1: movq <u=int64#3,<stack_uuss=stack256#20
# asm 2: movq <u=%rdx,<stack_uuss=736(%rsp)
movq %rdx,736(%rsp)

# qhasm:   inplace stack_uuss[2] = s
# asm 1: movq <s=int64#9,<stack_uuss=stack256#20
# asm 2: movq <s=%r11,<stack_uuss=752(%rsp)
movq %r11,752(%rsp)

# qhasm:   inplace stack_vvrr[2] = r
# asm 1: movq <r=int64#5,<stack_vvrr=stack256#21
# asm 2: movq <r=%r8,<stack_vvrr=784(%rsp)
movq %r8,784(%rsp)

# qhasm:   loop = 2
# asm 1: mov  $2,>loop=int64#3
# asm 2: mov  $2,>loop=%rdx
mov  $2,%rdx

# qhasm: loop20:
._loop20:

# qhasm:   fuv = f & ~ _m2p20
# asm 1: andn  <f=int64#4,<_m2p20=int64#8,>fuv=int64#7
# asm 2: andn  <f=%rcx,<_m2p20=%r10,>fuv=%rax
andn  %rcx,%r10,%rax

# qhasm:   grs = g & ~ _m2p20
# asm 1: andn  <g=int64#1,<_m2p20=int64#8,>grs=int64#5
# asm 2: andn  <g=%rdi,<_m2p20=%r10,>grs=%r8
andn  %rdi,%r10,%r8

# qhasm:   fuv += stack_m2p41
# asm 1: addq <stack_m2p41=stack64#12,<fuv=int64#7
# asm 2: addq <stack_m2p41=88(%rsp),<fuv=%rax
addq 88(%rsp),%rax

# qhasm:   grs += stack_m2p62
# asm 1: addq <stack_m2p62=stack64#13,<grs=int64#5
# asm 2: addq <stack_m2p62=96(%rsp),<grs=%r8
addq 96(%rsp),%r8

# qhasm: j = 4
# asm 1: mov  $4,>j=int64#9
# asm 2: mov  $4,>j=%r11
mov  $4,%r11

# qhasm: loop2:
._loop2:

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#10
# asm 2: mov  $-1,>z=%r12
mov  $-1,%r12

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#11
# asm 2: mov  <grs=%r8,>oldg=%r13
mov  %r8,%r13

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#7),>h=int64#12
# asm 2: lea  (<grs=%r8,<fuv=%rax),>h=%r14
lea  (%r8,%rax),%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#10
# asm 2: cmovne <m=%r9,<z=%r12
cmovne %r9,%r12

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#12
# asm 2: cmove <grs=%r8,<h=%r14
cmove %r8,%r14

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#13
# asm 2: lea  1(<m=%r9),>mnew=%r15
lea  1(%r9),%r15

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#5
# asm 2: sub  <fuv=%rax,<grs=%r8
sub  %rax,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#12
# asm 2: sar  $1,<h=%r14
sar  $1,%r14

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#10
# asm 2: cmp  $0,<z=%r12
cmp  $0,%r12

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#11,<fuv=int64#7
# asm 2: cmovge <oldg=%r13,<fuv=%rax
cmovge %r13,%rax

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#12,<grs=int64#5
# asm 2: cmovl <h=%r14,<grs=%r8
cmovl %r14,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#13,<m=int64#6
# asm 2: cmovl <mnew=%r15,<m=%r9
cmovl %r15,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#10
# asm 2: mov  $-1,>z=%r12
mov  $-1,%r12

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#11
# asm 2: mov  <grs=%r8,>oldg=%r13
mov  %r8,%r13

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#7),>h=int64#12
# asm 2: lea  (<grs=%r8,<fuv=%rax),>h=%r14
lea  (%r8,%rax),%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#10
# asm 2: cmovne <m=%r9,<z=%r12
cmovne %r9,%r12

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#12
# asm 2: cmove <grs=%r8,<h=%r14
cmove %r8,%r14

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#13
# asm 2: lea  1(<m=%r9),>mnew=%r15
lea  1(%r9),%r15

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#5
# asm 2: sub  <fuv=%rax,<grs=%r8
sub  %rax,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#12
# asm 2: sar  $1,<h=%r14
sar  $1,%r14

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#10
# asm 2: cmp  $0,<z=%r12
cmp  $0,%r12

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#11,<fuv=int64#7
# asm 2: cmovge <oldg=%r13,<fuv=%rax
cmovge %r13,%rax

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#12,<grs=int64#5
# asm 2: cmovl <h=%r14,<grs=%r8
cmovl %r14,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#13,<m=int64#6
# asm 2: cmovl <mnew=%r15,<m=%r9
cmovl %r15,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#10
# asm 2: mov  $-1,>z=%r12
mov  $-1,%r12

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#11
# asm 2: mov  <grs=%r8,>oldg=%r13
mov  %r8,%r13

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#7),>h=int64#12
# asm 2: lea  (<grs=%r8,<fuv=%rax),>h=%r14
lea  (%r8,%rax),%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#10
# asm 2: cmovne <m=%r9,<z=%r12
cmovne %r9,%r12

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#12
# asm 2: cmove <grs=%r8,<h=%r14
cmove %r8,%r14

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#13
# asm 2: lea  1(<m=%r9),>mnew=%r15
lea  1(%r9),%r15

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#5
# asm 2: sub  <fuv=%rax,<grs=%r8
sub  %rax,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#12
# asm 2: sar  $1,<h=%r14
sar  $1,%r14

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#10
# asm 2: cmp  $0,<z=%r12
cmp  $0,%r12

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#11,<fuv=int64#7
# asm 2: cmovge <oldg=%r13,<fuv=%rax
cmovge %r13,%rax

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#12,<grs=int64#5
# asm 2: cmovl <h=%r14,<grs=%r8
cmovl %r14,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#13,<m=int64#6
# asm 2: cmovl <mnew=%r15,<m=%r9
cmovl %r15,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#10
# asm 2: mov  $-1,>z=%r12
mov  $-1,%r12

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#11
# asm 2: mov  <grs=%r8,>oldg=%r13
mov  %r8,%r13

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#7),>h=int64#12
# asm 2: lea  (<grs=%r8,<fuv=%rax),>h=%r14
lea  (%r8,%rax),%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#10
# asm 2: cmovne <m=%r9,<z=%r12
cmovne %r9,%r12

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#12
# asm 2: cmove <grs=%r8,<h=%r14
cmove %r8,%r14

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#13
# asm 2: lea  1(<m=%r9),>mnew=%r15
lea  1(%r9),%r15

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#5
# asm 2: sub  <fuv=%rax,<grs=%r8
sub  %rax,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#12
# asm 2: sar  $1,<h=%r14
sar  $1,%r14

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#10
# asm 2: cmp  $0,<z=%r12
cmp  $0,%r12

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#11,<fuv=int64#7
# asm 2: cmovge <oldg=%r13,<fuv=%rax
cmovge %r13,%rax

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#12,<grs=int64#5
# asm 2: cmovl <h=%r14,<grs=%r8
cmovl %r14,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#13,<m=int64#6
# asm 2: cmovl <mnew=%r15,<m=%r9
cmovl %r15,%r9

# qhasm:   z = -1
# asm 1: mov  $-1,>z=int64#10
# asm 2: mov  $-1,>z=%r12
mov  $-1,%r12

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#5,>oldg=int64#11
# asm 2: mov  <grs=%r8,>oldg=%r13
mov  %r8,%r13

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#5,<fuv=int64#7),>h=int64#12
# asm 2: lea  (<grs=%r8,<fuv=%rax),>h=%r14
lea  (%r8,%rax),%r14

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#5
# asm 2: test  $1,<grs=%r8
test  $1,%r8

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#6,<z=int64#10
# asm 2: cmovne <m=%r9,<z=%r12
cmovne %r9,%r12

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#5,<h=int64#12
# asm 2: cmove <grs=%r8,<h=%r14
cmove %r8,%r14

# qhasm:   mnew = m + 1
# asm 1: lea  1(<m=int64#6),>mnew=int64#13
# asm 2: lea  1(<m=%r9),>mnew=%r15
lea  1(%r9),%r15

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#7,<grs=int64#5
# asm 2: sub  <fuv=%rax,<grs=%r8
sub  %rax,%r8

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#5
# asm 2: sar  $1,<grs=%r8
sar  $1,%r8

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#12
# asm 2: sar  $1,<h=%r14
sar  $1,%r14

# qhasm:   m = -m
# asm 1: neg  <m=int64#6
# asm 2: neg  <m=%r9
neg  %r9

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#10
# asm 2: cmp  $0,<z=%r12
cmp  $0,%r12

# qhasm:   fuv = oldg if !signed<
# asm 1: cmovge <oldg=int64#11,<fuv=int64#7
# asm 2: cmovge <oldg=%r13,<fuv=%rax
cmovge %r13,%rax

# qhasm:   grs = h    if  signed<
# asm 1: cmovl <h=int64#12,<grs=int64#5
# asm 2: cmovl <h=%r14,<grs=%r8
cmovl %r14,%r8

# qhasm:   m = mnew   if  signed<
# asm 1: cmovl <mnew=int64#13,<m=int64#6
# asm 2: cmovl <mnew=%r15,<m=%r9
cmovl %r15,%r9

# qhasm:  =? j -= 1
# asm 1: dec <j=int64#9
# asm 2: dec <j=%r11
dec %r11
# comment:fp stack unchanged by jump

# qhasm: goto loop2 if !=
jne ._loop2

# qhasm:   =? loop -= 1		
# asm 1: dec <loop=int64#3
# asm 2: dec <loop=%rdx
dec %rdx
# comment:fp stack unchanged by jump

# qhasm: goto lastloop if =
je ._lastloop

# qhasm: extract:
._extract:

# qhasm:   _2p20a2p41 = stack_2p20a2p41
# asm 1: movq <stack_2p20a2p41=stack64#14,>_2p20a2p41=int64#9
# asm 2: movq <stack_2p20a2p41=104(%rsp),>_2p20a2p41=%r11
movq 104(%rsp),%r11

# qhasm:   s = grs + _2p20a2p41
# asm 1: lea  (<grs=int64#5,<_2p20a2p41=int64#9),>s=int64#10
# asm 2: lea  (<grs=%r8,<_2p20a2p41=%r11),>s=%r12
lea  (%r8,%r11),%r12

# qhasm:   (int64) s >>= 42
# asm 1: sar  $42,<s=int64#10
# asm 2: sar  $42,<s=%r12
sar  $42,%r12

# qhasm:   t2 = g
# asm 1: mov  <g=int64#1,>t2=int64#11
# asm 2: mov  <g=%rdi,>t2=%r13
mov  %rdi,%r13

# qhasm:   g *= s  
# asm 1: imul  <s=int64#10,<g=int64#1
# asm 2: imul  <s=%r12,<g=%rdi
imul  %r12,%rdi

# qhasm:   v = fuv + _2p20a2p41
# asm 1: lea  (<fuv=int64#7,<_2p20a2p41=int64#9),>v=int64#9
# asm 2: lea  (<fuv=%rax,<_2p20a2p41=%r11),>v=%r11
lea  (%rax,%r11),%r11

# qhasm:   (int64) v >>= 42
# asm 1: sar  $42,<v=int64#9
# asm 2: sar  $42,<v=%r11
sar  $42,%r11

# qhasm:   t2 *= v
# asm 1: imul  <v=int64#9,<t2=int64#11
# asm 2: imul  <v=%r11,<t2=%r13
imul  %r11,%r13

# qhasm:   _2p20 = stack_2p20
# asm 1: movq <stack_2p20=stack64#11,>_2p20=int64#12
# asm 2: movq <stack_2p20=80(%rsp),>_2p20=%r14
movq 80(%rsp),%r14

# qhasm:   r = grs + _2p20
# asm 1: lea  (<grs=int64#5,<_2p20=int64#12),>r=int64#5
# asm 2: lea  (<grs=%r8,<_2p20=%r14),>r=%r8
lea  (%r8,%r14),%r8

# qhasm:   r <<= 22
# asm 1: shl  $22,<r=int64#5
# asm 2: shl  $22,<r=%r8
shl  $22,%r8

# qhasm:   (int64) r >>= 43
# asm 1: sar  $43,<r=int64#5
# asm 2: sar  $43,<r=%r8
sar  $43,%r8

# qhasm:       rax = f
# asm 1: mov  <f=int64#4,>rax=int64#13
# asm 2: mov  <f=%rcx,>rax=%r15
mov  %rcx,%r15

# qhasm:       rax *= r
# asm 1: imul  <r=int64#5,<rax=int64#13
# asm 2: imul  <r=%r8,<rax=%r15
imul  %r8,%r15

# qhasm:   u = fuv + _2p20
# asm 1: lea  (<fuv=int64#7,<_2p20=int64#12),>u=int64#7
# asm 2: lea  (<fuv=%rax,<_2p20=%r14),>u=%rax
lea  (%rax,%r14),%rax

# qhasm:   u <<= 22
# asm 1: shl  $22,<u=int64#7
# asm 2: shl  $22,<u=%rax
shl  $22,%rax

# qhasm:   (int64) u >>= 43
# asm 1: sar  $43,<u=int64#7
# asm 2: sar  $43,<u=%rax
sar  $43,%rax

# qhasm:        f *= u
# asm 1: imul  <u=int64#7,<f=int64#4
# asm 2: imul  <u=%rax,<f=%rcx
imul  %rax,%rcx

# qhasm:        f += t2
# asm 1: add  <t2=int64#11,<f=int64#4
# asm 2: add  <t2=%r13,<f=%rcx
add  %r13,%rcx

# qhasm:        g += rax
# asm 1: add  <rax=int64#13,<g=int64#1
# asm 2: add  <rax=%r15,<g=%rdi
add  %r15,%rdi

# qhasm:   (int64) f >>= 20
# asm 1: sar  $20,<f=int64#4
# asm 2: sar  $20,<f=%rcx
sar  $20,%rcx

# qhasm:   (int64) g >>= 20
# asm 1: sar  $20,<g=int64#1
# asm 2: sar  $20,<g=%rdi
sar  $20,%rdi

# qhasm:   t0 = stack_uuss[0]
# asm 1: movq <stack_uuss=stack256#20,>t0=int64#11
# asm 2: movq <stack_uuss=736(%rsp),>t0=%r13
movq 736(%rsp),%r13

# qhasm:   t0 *= u
# asm 1: imul  <u=int64#7,<t0=int64#11
# asm 2: imul  <u=%rax,<t0=%r13
imul  %rax,%r13

# qhasm:   t1 = stack_vvrr[2]
# asm 1: movq <stack_vvrr=stack256#21,>t1=int64#12
# asm 2: movq <stack_vvrr=784(%rsp),>t1=%r14
movq 784(%rsp),%r14

# qhasm:   t1 *= v
# asm 1: imul  <v=int64#9,<t1=int64#12
# asm 2: imul  <v=%r11,<t1=%r14
imul  %r11,%r14

# qhasm:   rtimesoldv = stack_vvrr[0]
# asm 1: movq <stack_vvrr=stack256#21,>rtimesoldv=int64#13
# asm 2: movq <stack_vvrr=768(%rsp),>rtimesoldv=%r15
movq 768(%rsp),%r15

# qhasm:   u *= rtimesoldv
# asm 1: imul  <rtimesoldv=int64#13,<u=int64#7
# asm 2: imul  <rtimesoldv=%r15,<u=%rax
imul  %r15,%rax

# qhasm:   stimesolds = stack_uuss[2]
# asm 1: movq <stack_uuss=stack256#20,>stimesolds=int64#14
# asm 2: movq <stack_uuss=752(%rsp),>stimesolds=%rbx
movq 752(%rsp),%rbx

# qhasm:   v *= stimesolds
# asm 1: imul  <stimesolds=int64#14,<v=int64#9
# asm 2: imul  <stimesolds=%rbx,<v=%r11
imul  %rbx,%r11

# qhasm:   rtimesoldv *= r
# asm 1: imul  <r=int64#5,<rtimesoldv=int64#13
# asm 2: imul  <r=%r8,<rtimesoldv=%r15
imul  %r8,%r15

# qhasm:   stimesolds *= s
# asm 1: imul  <s=int64#10,<stimesolds=int64#14
# asm 2: imul  <s=%r12,<stimesolds=%rbx
imul  %r12,%rbx

# qhasm:   r *= stack_uuss[0]
# asm 1: imulq <stack_uuss=stack256#20,<r=int64#5
# asm 2: imulq <stack_uuss=736(%rsp),<r=%r8
imulq 736(%rsp),%r8

# qhasm:   s *= stack_vvrr[2]
# asm 1: imulq <stack_vvrr=stack256#21,<s=int64#10
# asm 2: imulq <stack_vvrr=784(%rsp),<s=%r12
imulq 784(%rsp),%r12

# qhasm:   v += u
# asm 1: add  <u=int64#7,<v=int64#9
# asm 2: add  <u=%rax,<v=%r11
add  %rax,%r11

# qhasm:   u = t0 + t1
# asm 1: lea  (<t0=int64#11,<t1=int64#12),>u=int64#7
# asm 2: lea  (<t0=%r13,<t1=%r14),>u=%rax
lea  (%r13,%r14),%rax

# qhasm:   r += s
# asm 1: add  <s=int64#10,<r=int64#5
# asm 2: add  <s=%r12,<r=%r8
add  %r12,%r8

# qhasm:   s = rtimesoldv + stimesolds
# asm 1: lea  (<rtimesoldv=int64#13,<stimesolds=int64#14),>s=int64#10
# asm 2: lea  (<rtimesoldv=%r15,<stimesolds=%rbx),>s=%r12
lea  (%r15,%rbx),%r12

# qhasm: first_loop:
._first_loop:

# qhasm:   inplace stack_vvrr[0] = v
# asm 1: movq <v=int64#9,<stack_vvrr=stack256#21
# asm 2: movq <v=%r11,<stack_vvrr=768(%rsp)
movq %r11,768(%rsp)

# qhasm:   inplace stack_uuss[0] = u
# asm 1: movq <u=int64#7,<stack_uuss=stack256#20
# asm 2: movq <u=%rax,<stack_uuss=736(%rsp)
movq %rax,736(%rsp)

# qhasm:   inplace stack_uuss[2] = s
# asm 1: movq <s=int64#10,<stack_uuss=stack256#20
# asm 2: movq <s=%r12,<stack_uuss=752(%rsp)
movq %r12,752(%rsp)

# qhasm:   inplace stack_vvrr[2] = r
# asm 1: movq <r=int64#5,<stack_vvrr=stack256#21
# asm 2: movq <r=%r8,<stack_vvrr=784(%rsp)
movq %r8,784(%rsp)
# comment:fp stack unchanged by jump

# qhasm: goto loop20 
jmp ._loop20

# qhasm: lastloop:
._lastloop:

# qhasm:   _2p20a2p41 = stack_2p20a2p41
# asm 1: movq <stack_2p20a2p41=stack64#14,>_2p20a2p41=int64#1
# asm 2: movq <stack_2p20a2p41=104(%rsp),>_2p20a2p41=%rdi
movq 104(%rsp),%rdi

# qhasm:   s = grs + _2p20a2p41
# asm 1: lea  (<grs=int64#5,<_2p20a2p41=int64#1),>s=int64#3
# asm 2: lea  (<grs=%r8,<_2p20a2p41=%rdi),>s=%rdx
lea  (%r8,%rdi),%rdx

# qhasm:   (int64) s >>= 42
# asm 1: sar  $42,<s=int64#3
# asm 2: sar  $42,<s=%rdx
sar  $42,%rdx

# qhasm:   v = fuv + _2p20a2p41
# asm 1: lea  (<fuv=int64#7,<_2p20a2p41=int64#1),>v=int64#10
# asm 2: lea  (<fuv=%rax,<_2p20a2p41=%rdi),>v=%r12
lea  (%rax,%rdi),%r12

# qhasm:   (int64) v >>= 42
# asm 1: sar  $42,<v=int64#10
# asm 2: sar  $42,<v=%r12
sar  $42,%r12

# qhasm:   t1 = stack_vvrr[2]
# asm 1: movq <stack_vvrr=stack256#21,>t1=int64#1
# asm 2: movq <stack_vvrr=784(%rsp),>t1=%rdi
movq 784(%rsp),%rdi

# qhasm:   t1 *= v
# asm 1: imul  <v=int64#10,<t1=int64#1
# asm 2: imul  <v=%r12,<t1=%rdi
imul  %r12,%rdi

# qhasm:   stimesolds = stack_uuss[2]
# asm 1: movq <stack_uuss=stack256#20,>stimesolds=int64#4
# asm 2: movq <stack_uuss=752(%rsp),>stimesolds=%rcx
movq 752(%rsp),%rcx

# qhasm:   v *= stimesolds
# asm 1: imul  <stimesolds=int64#4,<v=int64#10
# asm 2: imul  <stimesolds=%rcx,<v=%r12
imul  %rcx,%r12

# qhasm:   stimesolds *= s
# asm 1: imul  <s=int64#3,<stimesolds=int64#4
# asm 2: imul  <s=%rdx,<stimesolds=%rcx
imul  %rdx,%rcx

# qhasm:   _2p20 = stack_2p20
# asm 1: movq <stack_2p20=stack64#11,>_2p20=int64#9
# asm 2: movq <stack_2p20=80(%rsp),>_2p20=%r11
movq 80(%rsp),%r11

# qhasm:   r = grs + _2p20
# asm 1: lea  (<grs=int64#5,<_2p20=int64#9),>r=int64#12
# asm 2: lea  (<grs=%r8,<_2p20=%r11),>r=%r14
lea  (%r8,%r11),%r14

# qhasm:   r <<= 22
# asm 1: shl  $22,<r=int64#12
# asm 2: shl  $22,<r=%r14
shl  $22,%r14

# qhasm:   (int64) r >>= 43
# asm 1: sar  $43,<r=int64#12
# asm 2: sar  $43,<r=%r14
sar  $43,%r14

# qhasm:   u = fuv + _2p20
# asm 1: lea  (<fuv=int64#7,<_2p20=int64#9),>u=int64#5
# asm 2: lea  (<fuv=%rax,<_2p20=%r11),>u=%r8
lea  (%rax,%r11),%r8

# qhasm:   u <<= 22
# asm 1: shl  $22,<u=int64#5
# asm 2: shl  $22,<u=%r8
shl  $22,%r8

# qhasm:   (int64) u >>= 43
# asm 1: sar  $43,<u=int64#5
# asm 2: sar  $43,<u=%r8
sar  $43,%r8

# qhasm:   t0 = stack_uuss[0]
# asm 1: movq <stack_uuss=stack256#20,>t0=int64#9
# asm 2: movq <stack_uuss=736(%rsp),>t0=%r11
movq 736(%rsp),%r11

# qhasm:   t0 *= u
# asm 1: imul  <u=int64#5,<t0=int64#9
# asm 2: imul  <u=%r8,<t0=%r11
imul  %r8,%r11

# qhasm:   rtimesoldv = stack_vvrr[0]
# asm 1: movq <stack_vvrr=stack256#21,>rtimesoldv=int64#11
# asm 2: movq <stack_vvrr=768(%rsp),>rtimesoldv=%r13
movq 768(%rsp),%r13

# qhasm:   u *= rtimesoldv
# asm 1: imul  <rtimesoldv=int64#11,<u=int64#5
# asm 2: imul  <rtimesoldv=%r13,<u=%r8
imul  %r13,%r8

# qhasm:   rtimesoldv *= r
# asm 1: imul  <r=int64#12,<rtimesoldv=int64#11
# asm 2: imul  <r=%r14,<rtimesoldv=%r13
imul  %r14,%r13

# qhasm:   s *= stack_vvrr[2]
# asm 1: imulq <stack_vvrr=stack256#21,<s=int64#3
# asm 2: imulq <stack_vvrr=784(%rsp),<s=%rdx
imulq 784(%rsp),%rdx

# qhasm:   r *= stack_uuss[0]
# asm 1: imulq <stack_uuss=stack256#20,<r=int64#12
# asm 2: imulq <stack_uuss=736(%rsp),<r=%r14
imulq 736(%rsp),%r14

# qhasm:   v += u
# asm 1: add  <u=int64#5,<v=int64#10
# asm 2: add  <u=%r8,<v=%r12
add  %r8,%r12

# qhasm:   u = t0 + t1
# asm 1: lea  (<t0=int64#9,<t1=int64#1),>u=int64#9
# asm 2: lea  (<t0=%r11,<t1=%rdi),>u=%r11
lea  (%r11,%rdi),%r11

# qhasm:   r += s
# asm 1: add  <s=int64#3,<r=int64#12
# asm 2: add  <s=%rdx,<r=%r14
add  %rdx,%r14

# qhasm:   s = rtimesoldv + stimesolds
# asm 1: lea  (<rtimesoldv=int64#11,<stimesolds=int64#4),>s=int64#11
# asm 2: lea  (<rtimesoldv=%r13,<stimesolds=%rcx),>s=%r13
lea  (%r13,%rcx),%r13

# qhasm:   t0 = stack_FVGS0[0]
# asm 1: movq <stack_FVGS0=stack256#2,>t0=int64#1
# asm 2: movq <stack_FVGS0=160(%rsp),>t0=%rdi
movq 160(%rsp),%rdi

# qhasm:   t1 = stack_FVGS1[0]
# asm 1: movq <stack_FVGS1=stack256#3,>t1=int64#3
# asm 2: movq <stack_FVGS1=192(%rsp),>t1=%rdx
movq 192(%rsp),%rdx

# qhasm:   t1 <<= 30
# asm 1: shl  $30,<t1=int64#3
# asm 2: shl  $30,<t1=%rdx
shl  $30,%rdx

# qhasm:   f = t0 + t1
# asm 1: lea  (<t0=int64#1,<t1=int64#3),>f=int64#4
# asm 2: lea  (<t0=%rdi,<t1=%rdx),>f=%rcx
lea  (%rdi,%rdx),%rcx

# qhasm:   t0 = stack_FVGS0[2]
# asm 1: movq <stack_FVGS0=stack256#2,>t0=int64#1
# asm 2: movq <stack_FVGS0=176(%rsp),>t0=%rdi
movq 176(%rsp),%rdi

# qhasm:   t1 = stack_FVGS1[2]
# asm 1: movq <stack_FVGS1=stack256#3,>t1=int64#3
# asm 2: movq <stack_FVGS1=208(%rsp),>t1=%rdx
movq 208(%rsp),%rdx

# qhasm:   t1 <<= 30
# asm 1: shl  $30,<t1=int64#3
# asm 2: shl  $30,<t1=%rdx
shl  $30,%rdx

# qhasm:   g = t0 + t1
# asm 1: lea  (<t0=int64#1,<t1=int64#3),>g=int64#1
# asm 2: lea  (<t0=%rdi,<t1=%rdx),>g=%rdi
lea  (%rdi,%rdx),%rdi

# qhasm:   t0 = stack_FVGS2[0]
# asm 1: movq <stack_FVGS2=stack256#4,>t0=int64#3
# asm 2: movq <stack_FVGS2=224(%rsp),>t0=%rdx
movq 224(%rsp),%rdx

# qhasm:   t1 = stack_FVGS3[0]
# asm 1: movq <stack_FVGS3=stack256#5,>t1=int64#5
# asm 2: movq <stack_FVGS3=256(%rsp),>t1=%r8
movq 256(%rsp),%r8

# qhasm:   t1 <<= 30
# asm 1: shl  $30,<t1=int64#5
# asm 2: shl  $30,<t1=%r8
shl  $30,%r8

# qhasm:   f0 = t0 + t1
# asm 1: lea  (<t0=int64#3,<t1=int64#5),>f0=int64#5
# asm 2: lea  (<t0=%rdx,<t1=%r8),>f0=%r8
lea  (%rdx,%r8),%r8

# qhasm:   t0 = stack_FVGS2[2]
# asm 1: movq <stack_FVGS2=stack256#4,>t0=int64#3
# asm 2: movq <stack_FVGS2=240(%rsp),>t0=%rdx
movq 240(%rsp),%rdx

# qhasm:   t1 = stack_FVGS3[2]
# asm 1: movq <stack_FVGS3=stack256#5,>t1=int64#13
# asm 2: movq <stack_FVGS3=272(%rsp),>t1=%r15
movq 272(%rsp),%r15

# qhasm:   t1 <<= 30
# asm 1: shl  $30,<t1=int64#13
# asm 2: shl  $30,<t1=%r15
shl  $30,%r15

# qhasm:   g0 = t0 + t1
# asm 1: lea  (<t0=int64#3,<t1=int64#13),>g0=int64#13
# asm 2: lea  (<t0=%rdx,<t1=%r15),>g0=%r15
lea  (%rdx,%r15),%r15

# qhasm: =? i -= 1
# asm 1: dec <i=int64#2
# asm 2: dec <i=%rsi
dec %rsi
# comment:fp stack unchanged by jump

# qhasm: goto bigloop if !=
jne ._bigloop

# qhasm: last_transition:
._last_transition:

# qhasm: fuv &= 2
# asm 1: and  $2,<fuv=int64#7
# asm 2: and  $2,<fuv=%rax
and  $2,%rax

# qhasm: t0 = fuv - 1
# asm 1: lea  -1(<fuv=int64#7),>t0=int64#1
# asm 2: lea  -1(<fuv=%rax),>t0=%rdi
lea  -1(%rax),%rdi

# qhasm: u *= t0
# asm 1: imul  <t0=int64#1,<u=int64#9
# asm 2: imul  <t0=%rdi,<u=%r11
imul  %rdi,%r11

# qhasm: v *= t0
# asm 1: imul  <t0=int64#1,<v=int64#10
# asm 2: imul  <t0=%rdi,<v=%r12
imul  %rdi,%r12

# qhasm: new vvrr

# qhasm: vvrr = v,vvrr[1],0,0
# asm 1: vpinsrq $0x0,<v=int64#10,<vvrr=reg256#1%128,<vvrr=reg256#1%128
# asm 2: vpinsrq $0x0,<v=%r12,<vvrr=%xmm0,<vvrr=%xmm0
vpinsrq $0x0,%r12,%xmm0,%xmm0

# qhasm: vvrr = vvrr[0],r,0,0
# asm 1: vpinsrq $0x1,<r=int64#12,<vvrr=reg256#1%128,<vvrr=reg256#1%128
# asm 2: vpinsrq $0x1,<r=%r14,<vvrr=%xmm0,<vvrr=%xmm0
vpinsrq $0x1,%r14,%xmm0,%xmm0

# qhasm: FVGS0 = stack_FVGS0
# asm 1: vmovapd <stack_FVGS0=stack256#2,>FVGS0=reg256#2
# asm 2: vmovapd <stack_FVGS0=160(%rsp),>FVGS0=%ymm1
vmovapd 160(%rsp),%ymm1

# qhasm: new uuss

# qhasm: uuss = u,uuss[1],0,0
# asm 1: vpinsrq $0x0,<u=int64#9,<uuss=reg256#3%128,<uuss=reg256#3%128
# asm 2: vpinsrq $0x0,<u=%r11,<uuss=%xmm2,<uuss=%xmm2
vpinsrq $0x0,%r11,%xmm2,%xmm2

# qhasm: uuss = uuss[0],s,0,0
# asm 1: vpinsrq $0x1,<s=int64#11,<uuss=reg256#3%128,<uuss=reg256#3%128
# asm 2: vpinsrq $0x1,<s=%r13,<uuss=%xmm2,<uuss=%xmm2
vpinsrq $0x1,%r13,%xmm2,%xmm2

# qhasm: GSFV0 = FVGS0[1,0]
# asm 1: vpermq $0x4e,<FVGS0=reg256#2,>GSFV0=reg256#4
# asm 2: vpermq $0x4e,<FVGS0=%ymm1,>GSFV0=%ymm3
vpermq $0x4e,%ymm1,%ymm3

# qhasm: uuss = uuss[0,0,1,1]
# asm 1: vpermq $0x50,<uuss=reg256#3,>uuss=reg256#3
# asm 2: vpermq $0x50,<uuss=%ymm2,>uuss=%ymm2
vpermq $0x50,%ymm2,%ymm2

# qhasm: vvrr = vvrr[0,0,1,1]
# asm 1: vpermq $0x50,<vvrr=reg256#1,>vvrr=reg256#1
# asm 2: vpermq $0x50,<vvrr=%ymm0,>vvrr=%ymm0
vpermq $0x50,%ymm0,%ymm0

# qhasm: _2p30m1x4 = stack_2p30m1x4
# asm 1: vmovapd <stack_2p30m1x4=stack256#1,>_2p30m1x4=reg256#5
# asm 2: vmovapd <stack_2p30m1x4=128(%rsp),>_2p30m1x4=%ymm4
vmovapd 128(%rsp),%ymm4

# qhasm: uuss0 = uuss & _2p30m1x4
# asm 1: vpand <uuss=reg256#3,<_2p30m1x4=reg256#5,>uuss0=reg256#6
# asm 2: vpand <uuss=%ymm2,<_2p30m1x4=%ymm4,>uuss0=%ymm5
vpand %ymm2,%ymm4,%ymm5

# qhasm: vvrr0 = vvrr & _2p30m1x4 
# asm 1: vpand <vvrr=reg256#1,<_2p30m1x4=reg256#5,>vvrr0=reg256#7
# asm 2: vpand <vvrr=%ymm0,<_2p30m1x4=%ymm4,>vvrr0=%ymm6
vpand %ymm0,%ymm4,%ymm6

# qhasm: _2p63x4 = stack_2p63x4
# asm 1: vmovapd <stack_2p63x4=stack256#17,>_2p63x4=reg256#8
# asm 2: vmovapd <stack_2p63x4=640(%rsp),>_2p63x4=%ymm7
vmovapd 640(%rsp),%ymm7

# qhasm: uuss1 = uuss ^ _2p63x4
# asm 1: vpxor <uuss=reg256#3,<_2p63x4=reg256#8,>uuss1=reg256#3
# asm 2: vpxor <uuss=%ymm2,<_2p63x4=%ymm7,>uuss1=%ymm2
vpxor %ymm2,%ymm7,%ymm2

# qhasm: vvrr1 = vvrr ^ _2p63x4
# asm 1: vpxor <vvrr=reg256#1,<_2p63x4=reg256#8,>vvrr1=reg256#1
# asm 2: vpxor <vvrr=%ymm0,<_2p63x4=%ymm7,>vvrr1=%ymm0
vpxor %ymm0,%ymm7,%ymm0

# qhasm: 4x uuss1 unsigned>>= 30
# asm 1: vpsrlq $30,<uuss1=reg256#3,<uuss1=reg256#3
# asm 2: vpsrlq $30,<uuss1=%ymm2,<uuss1=%ymm2
vpsrlq $30,%ymm2,%ymm2

# qhasm: 4x vvrr1 unsigned>>= 30
# asm 1: vpsrlq $30,<vvrr1=reg256#1,<vvrr1=reg256#1
# asm 2: vpsrlq $30,<vvrr1=%ymm0,<vvrr1=%ymm0
vpsrlq $30,%ymm0,%ymm0

# qhasm: _2p33x4 = stack_2p33x4
# asm 1: vmovapd <stack_2p33x4=stack256#16,>_2p33x4=reg256#9
# asm 2: vmovapd <stack_2p33x4=608(%rsp),>_2p33x4=%ymm8
vmovapd 608(%rsp),%ymm8

# qhasm: 4x uuss1 -= _2p33x4
# asm 1: vpsubq <_2p33x4=reg256#9,<uuss1=reg256#3,<uuss1=reg256#3
# asm 2: vpsubq <_2p33x4=%ymm8,<uuss1=%ymm2,<uuss1=%ymm2
vpsubq %ymm8,%ymm2,%ymm2

# qhasm: 4x vvrr1 -= _2p33x4
# asm 1: vpsubq <_2p33x4=reg256#9,<vvrr1=reg256#1,<vvrr1=reg256#1
# asm 2: vpsubq <_2p33x4=%ymm8,<vvrr1=%ymm0,<vvrr1=%ymm0
vpsubq %ymm8,%ymm0,%ymm0

# qhasm: 4x ta = int32 uuss0 * int32 FVGS0
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS0=reg256#2,>ta=reg256#9
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS0=%ymm1,>ta=%ymm8
vpmuldq %ymm5,%ymm1,%ymm8

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV0
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV0=reg256#4,>tb=reg256#10
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV0=%ymm3,>tb=%ymm9
vpmuldq %ymm6,%ymm3,%ymm9

# qhasm: 4x out0 = ta + tb
# asm 1: vpaddq <tb=reg256#10,<ta=reg256#9,>out0=reg256#9
# asm 2: vpaddq <tb=%ymm9,<ta=%ymm8,>out0=%ymm8
vpaddq %ymm9,%ymm8,%ymm8

# qhasm: minvx4 = 4x stack_minv
# asm 1: vpbroadcastq <stack_minv=stack64#9,>minvx4=reg256#10
# asm 2: vpbroadcastq <stack_minv=64(%rsp),>minvx4=%ymm9
vpbroadcastq 64(%rsp),%ymm9

# qhasm: mod0 = stack_mod0
# asm 1: vmovapd <stack_mod0=stack256#9,>mod0=reg256#11
# asm 2: vmovapd <stack_mod0=384(%rsp),>mod0=%ymm10
vmovapd 384(%rsp),%ymm10

# qhasm: 4x d0 = int32 minvx4 * int32 out0
# asm 1: vpmuldq <minvx4=reg256#10,<out0=reg256#9,>d0=reg256#12
# asm 2: vpmuldq <minvx4=%ymm9,<out0=%ymm8,>d0=%ymm11
vpmuldq %ymm9,%ymm8,%ymm11

# qhasm: d0 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<d0=reg256#12,<d0=reg256#12
# asm 2: vpand <_2p30m1x4=%ymm4,<d0=%ymm11,<d0=%ymm11
vpand %ymm4,%ymm11,%ymm11

# qhasm: 4x ta = int32 mod0 * int32 d0
# asm 1: vpmuldq <mod0=reg256#11,<d0=reg256#12,>ta=reg256#13
# asm 2: vpmuldq <mod0=%ymm10,<d0=%ymm11,>ta=%ymm12
vpmuldq %ymm10,%ymm11,%ymm12

# qhasm: 4x out0 += ta
# asm 1: vpaddq <ta=reg256#13,<out0=reg256#9,<out0=reg256#9
# asm 2: vpaddq <ta=%ymm12,<out0=%ymm8,<out0=%ymm8
vpaddq %ymm12,%ymm8,%ymm8

# qhasm: 4x carryy = out0 +_2p63x4
# asm 1: vpaddq <_2p63x4=reg256#8,<out0=reg256#9,>carryy=reg256#8
# asm 2: vpaddq <_2p63x4=%ymm7,<out0=%ymm8,>carryy=%ymm7
vpaddq %ymm7,%ymm8,%ymm7

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#8,<carryy=reg256#8
# asm 2: vpsrlq $30,<carryy=%ymm7,<carryy=%ymm7
vpsrlq $30,%ymm7,%ymm7

# qhasm: FVGS1 = stack_FVGS1
# asm 1: vmovapd <stack_FVGS1=stack256#3,>FVGS1=reg256#9
# asm 2: vmovapd <stack_FVGS1=192(%rsp),>FVGS1=%ymm8
vmovapd 192(%rsp),%ymm8

# qhasm: GSFV1 = FVGS1[1,0]
# asm 1: vpermq $0x4e,<FVGS1=reg256#9,>GSFV1=reg256#13
# asm 2: vpermq $0x4e,<FVGS1=%ymm8,>GSFV1=%ymm12
vpermq $0x4e,%ymm8,%ymm12

# qhasm: mod1 = stack_mod1
# asm 1: vmovapd <stack_mod1=stack256#10,>mod1=reg256#14
# asm 2: vmovapd <stack_mod1=416(%rsp),>mod1=%ymm13
vmovapd 416(%rsp),%ymm13

# qhasm: 4x ta = int32 uuss1 * int32 FVGS0
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS0=reg256#2,>ta=reg256#2
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS0=%ymm1,>ta=%ymm1
vpmuldq %ymm2,%ymm1,%ymm1

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV0
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV0=reg256#4,>tb=reg256#4
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV0=%ymm3,>tb=%ymm3
vpmuldq %ymm0,%ymm3,%ymm3

# qhasm: 4x out1plus = ta + tb
# asm 1: vpaddq <tb=reg256#4,<ta=reg256#2,>out1plus=reg256#2
# asm 2: vpaddq <tb=%ymm3,<ta=%ymm1,>out1plus=%ymm1
vpaddq %ymm3,%ymm1,%ymm1

# qhasm: 4x ta = int32 uuss0 * int32 FVGS1
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS1=reg256#9,>ta=reg256#4
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS1=%ymm8,>ta=%ymm3
vpmuldq %ymm5,%ymm8,%ymm3

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV1
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV1=reg256#13,>tb=reg256#15
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV1=%ymm12,>tb=%ymm14
vpmuldq %ymm6,%ymm12,%ymm14

# qhasm: 4x out1 = ta + tb
# asm 1: vpaddq <tb=reg256#15,<ta=reg256#4,>out1=reg256#4
# asm 2: vpaddq <tb=%ymm14,<ta=%ymm3,>out1=%ymm3
vpaddq %ymm14,%ymm3,%ymm3

# qhasm: 4x out1 += out1plus
# asm 1: vpaddq <out1plus=reg256#2,<out1=reg256#4,<out1=reg256#4
# asm 2: vpaddq <out1plus=%ymm1,<out1=%ymm3,<out1=%ymm3
vpaddq %ymm1,%ymm3,%ymm3

# qhasm: 4x ta = int32 d0 * int32 mod1
# asm 1: vpmuldq <d0=reg256#12,<mod1=reg256#14,>ta=reg256#2
# asm 2: vpmuldq <d0=%ymm11,<mod1=%ymm13,>ta=%ymm1
vpmuldq %ymm11,%ymm13,%ymm1

# qhasm: 4x ta += carryy
# asm 1: vpaddq <carryy=reg256#8,<ta=reg256#2,<ta=reg256#2
# asm 2: vpaddq <carryy=%ymm7,<ta=%ymm1,<ta=%ymm1
vpaddq %ymm7,%ymm1,%ymm1

# qhasm: 4x out1 += ta
# asm 1: vpaddq <ta=reg256#2,<out1=reg256#4,<out1=reg256#4
# asm 2: vpaddq <ta=%ymm1,<out1=%ymm3,<out1=%ymm3
vpaddq %ymm1,%ymm3,%ymm3

# qhasm: 4x d1 = int32 minvx4 * int32 out1
# asm 1: vpmuldq <minvx4=reg256#10,<out1=reg256#4,>d1=reg256#2
# asm 2: vpmuldq <minvx4=%ymm9,<out1=%ymm3,>d1=%ymm1
vpmuldq %ymm9,%ymm3,%ymm1

# qhasm: d1 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<d1=reg256#2,<d1=reg256#2
# asm 2: vpand <_2p30m1x4=%ymm4,<d1=%ymm1,<d1=%ymm1
vpand %ymm4,%ymm1,%ymm1

# qhasm: 4x ta = int32 mod0 * int32 d1
# asm 1: vpmuldq <mod0=reg256#11,<d1=reg256#2,>ta=reg256#5
# asm 2: vpmuldq <mod0=%ymm10,<d1=%ymm1,>ta=%ymm4
vpmuldq %ymm10,%ymm1,%ymm4

# qhasm: 4x out1 += ta
# asm 1: vpaddq <ta=reg256#5,<out1=reg256#4,<out1=reg256#4
# asm 2: vpaddq <ta=%ymm4,<out1=%ymm3,<out1=%ymm3
vpaddq %ymm4,%ymm3,%ymm3

# qhasm: _2p63m2p33x4 = stack_2p63m2p33x4
# asm 1: vmovapd <stack_2p63m2p33x4=stack256#18,>_2p63m2p33x4=reg256#5
# asm 2: vmovapd <stack_2p63m2p33x4=672(%rsp),>_2p63m2p33x4=%ymm4
vmovapd 672(%rsp),%ymm4

# qhasm: 4x carryy = out1 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#5,<out1=reg256#4,>carryy=reg256#4
# asm 2: vpaddq <_2p63m2p33x4=%ymm4,<out1=%ymm3,>carryy=%ymm3
vpaddq %ymm4,%ymm3,%ymm3

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#4,<carryy=reg256#4
# asm 2: vpsrlq $30,<carryy=%ymm3,<carryy=%ymm3
vpsrlq $30,%ymm3,%ymm3

# qhasm: FVGS2 = stack_FVGS2
# asm 1: vmovapd <stack_FVGS2=stack256#4,>FVGS2=reg256#5
# asm 2: vmovapd <stack_FVGS2=224(%rsp),>FVGS2=%ymm4
vmovapd 224(%rsp),%ymm4

# qhasm: GSFV2 = FVGS2[1,0]
# asm 1: vpermq $0x4e,<FVGS2=reg256#5,>GSFV2=reg256#8
# asm 2: vpermq $0x4e,<FVGS2=%ymm4,>GSFV2=%ymm7
vpermq $0x4e,%ymm4,%ymm7

# qhasm: 4x ta = int32 uuss1 * int32 FVGS1
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS1=reg256#9,>ta=reg256#9
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS1=%ymm8,>ta=%ymm8
vpmuldq %ymm2,%ymm8,%ymm8

# qhasm: 4x out2 = ta + carryy
# asm 1: vpaddq <carryy=reg256#4,<ta=reg256#9,>out2=reg256#4
# asm 2: vpaddq <carryy=%ymm3,<ta=%ymm8,>out2=%ymm3
vpaddq %ymm3,%ymm8,%ymm3

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV1
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV1=reg256#13,>tb=reg256#9
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV1=%ymm12,>tb=%ymm8
vpmuldq %ymm0,%ymm12,%ymm8

# qhasm: 4x out2 += tb
# asm 1: vpaddq <tb=reg256#9,<out2=reg256#4,<out2=reg256#4
# asm 2: vpaddq <tb=%ymm8,<out2=%ymm3,<out2=%ymm3
vpaddq %ymm8,%ymm3,%ymm3

# qhasm: 4x ta = int32 uuss0 * int32 FVGS2
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS2=reg256#5,>ta=reg256#9
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS2=%ymm4,>ta=%ymm8
vpmuldq %ymm5,%ymm4,%ymm8

# qhasm: 4x out2 += ta
# asm 1: vpaddq <ta=reg256#9,<out2=reg256#4,<out2=reg256#4
# asm 2: vpaddq <ta=%ymm8,<out2=%ymm3,<out2=%ymm3
vpaddq %ymm8,%ymm3,%ymm3

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV2
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV2=reg256#8,>tb=reg256#9
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV2=%ymm7,>tb=%ymm8
vpmuldq %ymm6,%ymm7,%ymm8

# qhasm: 4x out2 += tb
# asm 1: vpaddq <tb=reg256#9,<out2=reg256#4,<out2=reg256#4
# asm 2: vpaddq <tb=%ymm8,<out2=%ymm3,<out2=%ymm3
vpaddq %ymm8,%ymm3,%ymm3

# qhasm: 4x tb = int32 d1 * int32 mod1
# asm 1: vpmuldq <d1=reg256#2,<mod1=reg256#14,>tb=reg256#9
# asm 2: vpmuldq <d1=%ymm1,<mod1=%ymm13,>tb=%ymm8
vpmuldq %ymm1,%ymm13,%ymm8

# qhasm: 4x out2 += tb
# asm 1: vpaddq <tb=reg256#9,<out2=reg256#4,<out2=reg256#4
# asm 2: vpaddq <tb=%ymm8,<out2=%ymm3,<out2=%ymm3
vpaddq %ymm8,%ymm3,%ymm3

# qhasm: mod2 = stack_mod2
# asm 1: vmovapd <stack_mod2=stack256#11,>mod2=reg256#9
# asm 2: vmovapd <stack_mod2=448(%rsp),>mod2=%ymm8
vmovapd 448(%rsp),%ymm8

# qhasm: 4x ta = int32 d0 * int32 mod2
# asm 1: vpmuldq <d0=reg256#12,<mod2=reg256#9,>ta=reg256#13
# asm 2: vpmuldq <d0=%ymm11,<mod2=%ymm8,>ta=%ymm12
vpmuldq %ymm11,%ymm8,%ymm12

# qhasm: 4x out2 += ta
# asm 1: vpaddq <ta=reg256#13,<out2=reg256#4,<out2=reg256#4
# asm 2: vpaddq <ta=%ymm12,<out2=%ymm3,<out2=%ymm3
vpaddq %ymm12,%ymm3,%ymm3

# qhasm: _2p30m1x4 = stack_2p30m1x4
# asm 1: vmovapd <stack_2p30m1x4=stack256#1,>_2p30m1x4=reg256#13
# asm 2: vmovapd <stack_2p30m1x4=128(%rsp),>_2p30m1x4=%ymm12
vmovapd 128(%rsp),%ymm12

# qhasm: _2p29x4 = stack_2p29x4
# asm 1: vmovapd <stack_2p29x4=stack256#19,>_2p29x4=reg256#15
# asm 2: vmovapd <stack_2p29x4=704(%rsp),>_2p29x4=%ymm14
vmovapd 704(%rsp),%ymm14

# qhasm: 4x d2 = int32 minvx4 * int32 out2
# asm 1: vpmuldq <minvx4=reg256#10,<out2=reg256#4,>d2=reg256#10
# asm 2: vpmuldq <minvx4=%ymm9,<out2=%ymm3,>d2=%ymm9
vpmuldq %ymm9,%ymm3,%ymm9

# qhasm: d2 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#13,<d2=reg256#10,<d2=reg256#10
# asm 2: vpand <_2p30m1x4=%ymm12,<d2=%ymm9,<d2=%ymm9
vpand %ymm12,%ymm9,%ymm9

# qhasm: d2 ^= _2p29x4
# asm 1: vpxor <_2p29x4=reg256#15,<d2=reg256#10,<d2=reg256#10
# asm 2: vpxor <_2p29x4=%ymm14,<d2=%ymm9,<d2=%ymm9
vpxor %ymm14,%ymm9,%ymm9

# qhasm: 4x d2 -=  _2p29x4
# asm 1: vpsubq <_2p29x4=reg256#15,<d2=reg256#10,<d2=reg256#10
# asm 2: vpsubq <_2p29x4=%ymm14,<d2=%ymm9,<d2=%ymm9
vpsubq %ymm14,%ymm9,%ymm9

# qhasm: 4x ta = int32 mod0 * int32 d2
# asm 1: vpmuldq <mod0=reg256#11,<d2=reg256#10,>ta=reg256#11
# asm 2: vpmuldq <mod0=%ymm10,<d2=%ymm9,>ta=%ymm10
vpmuldq %ymm10,%ymm9,%ymm10

# qhasm: 4x out2 += ta
# asm 1: vpaddq <ta=reg256#11,<out2=reg256#4,<out2=reg256#4
# asm 2: vpaddq <ta=%ymm10,<out2=%ymm3,<out2=%ymm3
vpaddq %ymm10,%ymm3,%ymm3

# qhasm: _2p63m2p33x4 = stack_2p63m2p33x4
# asm 1: vmovapd <stack_2p63m2p33x4=stack256#18,>_2p63m2p33x4=reg256#11
# asm 2: vmovapd <stack_2p63m2p33x4=672(%rsp),>_2p63m2p33x4=%ymm10
vmovapd 672(%rsp),%ymm10

# qhasm: 4x carryy = out2 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#11,<out2=reg256#4,>carryy=reg256#4
# asm 2: vpaddq <_2p63m2p33x4=%ymm10,<out2=%ymm3,>carryy=%ymm3
vpaddq %ymm10,%ymm3,%ymm3

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#4,<carryy=reg256#4
# asm 2: vpsrlq $30,<carryy=%ymm3,<carryy=%ymm3
vpsrlq $30,%ymm3,%ymm3

# qhasm: FVGS3 = stack_FVGS3
# asm 1: vmovapd <stack_FVGS3=stack256#5,>FVGS3=reg256#11
# asm 2: vmovapd <stack_FVGS3=256(%rsp),>FVGS3=%ymm10
vmovapd 256(%rsp),%ymm10

# qhasm: GSFV3 = FVGS3[1,0]
# asm 1: vpermq $0x4e,<FVGS3=reg256#11,>GSFV3=reg256#13
# asm 2: vpermq $0x4e,<FVGS3=%ymm10,>GSFV3=%ymm12
vpermq $0x4e,%ymm10,%ymm12

# qhasm: 4x ta = int32 uuss1 * int32 FVGS2
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS2=reg256#5,>ta=reg256#5
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS2=%ymm4,>ta=%ymm4
vpmuldq %ymm2,%ymm4,%ymm4

# qhasm: 4x out3 = ta + carryy
# asm 1: vpaddq <carryy=reg256#4,<ta=reg256#5,>out3=reg256#4
# asm 2: vpaddq <carryy=%ymm3,<ta=%ymm4,>out3=%ymm3
vpaddq %ymm3,%ymm4,%ymm3

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV2
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV2=reg256#8,>tb=reg256#5
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV2=%ymm7,>tb=%ymm4
vpmuldq %ymm0,%ymm7,%ymm4

# qhasm: 4x out3 += tb
# asm 1: vpaddq <tb=reg256#5,<out3=reg256#4,<out3=reg256#4
# asm 2: vpaddq <tb=%ymm4,<out3=%ymm3,<out3=%ymm3
vpaddq %ymm4,%ymm3,%ymm3

# qhasm: 4x ta = int32 uuss0 * int32 FVGS3
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS3=reg256#11,>ta=reg256#5
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS3=%ymm10,>ta=%ymm4
vpmuldq %ymm5,%ymm10,%ymm4

# qhasm: 4x out3 += ta
# asm 1: vpaddq <ta=reg256#5,<out3=reg256#4,<out3=reg256#4
# asm 2: vpaddq <ta=%ymm4,<out3=%ymm3,<out3=%ymm3
vpaddq %ymm4,%ymm3,%ymm3

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV3
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV3=reg256#13,>tb=reg256#5
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV3=%ymm12,>tb=%ymm4
vpmuldq %ymm6,%ymm12,%ymm4

# qhasm: 4x out3 += tb
# asm 1: vpaddq <tb=reg256#5,<out3=reg256#4,<out3=reg256#4
# asm 2: vpaddq <tb=%ymm4,<out3=%ymm3,<out3=%ymm3
vpaddq %ymm4,%ymm3,%ymm3

# qhasm: mod3 = stack_mod3
# asm 1: vmovapd <stack_mod3=stack256#12,>mod3=reg256#5
# asm 2: vmovapd <stack_mod3=480(%rsp),>mod3=%ymm4
vmovapd 480(%rsp),%ymm4

# qhasm: 4x ta = int32 d2 * int32 mod1
# asm 1: vpmuldq <d2=reg256#10,<mod1=reg256#14,>ta=reg256#8
# asm 2: vpmuldq <d2=%ymm9,<mod1=%ymm13,>ta=%ymm7
vpmuldq %ymm9,%ymm13,%ymm7

# qhasm: 4x out3 += ta
# asm 1: vpaddq <ta=reg256#8,<out3=reg256#4,<out3=reg256#4
# asm 2: vpaddq <ta=%ymm7,<out3=%ymm3,<out3=%ymm3
vpaddq %ymm7,%ymm3,%ymm3

# qhasm: 4x tb = int32 d1 * int32 mod2
# asm 1: vpmuldq <d1=reg256#2,<mod2=reg256#9,>tb=reg256#8
# asm 2: vpmuldq <d1=%ymm1,<mod2=%ymm8,>tb=%ymm7
vpmuldq %ymm1,%ymm8,%ymm7

# qhasm: 4x out3 += tb
# asm 1: vpaddq <tb=reg256#8,<out3=reg256#4,<out3=reg256#4
# asm 2: vpaddq <tb=%ymm7,<out3=%ymm3,<out3=%ymm3
vpaddq %ymm7,%ymm3,%ymm3

# qhasm: 4x ta = int32 d0 * int32 mod3
# asm 1: vpmuldq <d0=reg256#12,<mod3=reg256#5,>ta=reg256#8
# asm 2: vpmuldq <d0=%ymm11,<mod3=%ymm4,>ta=%ymm7
vpmuldq %ymm11,%ymm4,%ymm7

# qhasm: 4x out3 += ta
# asm 1: vpaddq <ta=reg256#8,<out3=reg256#4,<out3=reg256#4
# asm 2: vpaddq <ta=%ymm7,<out3=%ymm3,<out3=%ymm3
vpaddq %ymm7,%ymm3,%ymm3

# qhasm: _2p30m1x4 = stack_2p30m1x4
# asm 1: vmovapd <stack_2p30m1x4=stack256#1,>_2p30m1x4=reg256#8
# asm 2: vmovapd <stack_2p30m1x4=128(%rsp),>_2p30m1x4=%ymm7
vmovapd 128(%rsp),%ymm7

# qhasm: _2p63m2p33x4 = stack_2p63m2p33x4
# asm 1: vmovapd <stack_2p63m2p33x4=stack256#18,>_2p63m2p33x4=reg256#14
# asm 2: vmovapd <stack_2p63m2p33x4=672(%rsp),>_2p63m2p33x4=%ymm13
vmovapd 672(%rsp),%ymm13

# qhasm: 4x carryy = out3 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#14,<out3=reg256#4,>carryy=reg256#14
# asm 2: vpaddq <_2p63m2p33x4=%ymm13,<out3=%ymm3,>carryy=%ymm13
vpaddq %ymm13,%ymm3,%ymm13

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#14,<carryy=reg256#14
# asm 2: vpsrlq $30,<carryy=%ymm13,<carryy=%ymm13
vpsrlq $30,%ymm13,%ymm13

# qhasm: out3 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#8,<out3=reg256#4,<out3=reg256#4
# asm 2: vpand <_2p30m1x4=%ymm7,<out3=%ymm3,<out3=%ymm3
vpand %ymm7,%ymm3,%ymm3

# qhasm: stack_FVGS0 = out3
# asm 1: vmovapd <out3=reg256#4,>stack_FVGS0=stack256#2
# asm 2: vmovapd <out3=%ymm3,>stack_FVGS0=160(%rsp)
vmovapd %ymm3,160(%rsp)

# qhasm: FVGS4 = stack_FVGS4
# asm 1: vmovapd <stack_FVGS4=stack256#6,>FVGS4=reg256#4
# asm 2: vmovapd <stack_FVGS4=288(%rsp),>FVGS4=%ymm3
vmovapd 288(%rsp),%ymm3

# qhasm: GSFV4 = FVGS4[1,0]
# asm 1: vpermq $0x4e,<FVGS4=reg256#4,>GSFV4=reg256#8
# asm 2: vpermq $0x4e,<FVGS4=%ymm3,>GSFV4=%ymm7
vpermq $0x4e,%ymm3,%ymm7

# qhasm: 4x ta = int32 uuss1 * int32 FVGS3
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS3=reg256#11,>ta=reg256#11
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS3=%ymm10,>ta=%ymm10
vpmuldq %ymm2,%ymm10,%ymm10

# qhasm: 4x out4 = ta + carryy
# asm 1: vpaddq <carryy=reg256#14,<ta=reg256#11,>out4=reg256#11
# asm 2: vpaddq <carryy=%ymm13,<ta=%ymm10,>out4=%ymm10
vpaddq %ymm13,%ymm10,%ymm10

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV3
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV3=reg256#13,>tb=reg256#13
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV3=%ymm12,>tb=%ymm12
vpmuldq %ymm0,%ymm12,%ymm12

# qhasm: 4x out4 += tb
# asm 1: vpaddq <tb=reg256#13,<out4=reg256#11,<out4=reg256#11
# asm 2: vpaddq <tb=%ymm12,<out4=%ymm10,<out4=%ymm10
vpaddq %ymm12,%ymm10,%ymm10

# qhasm: 4x ta = int32 uuss0 * int32 FVGS4
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS4=reg256#4,>ta=reg256#13
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS4=%ymm3,>ta=%ymm12
vpmuldq %ymm5,%ymm3,%ymm12

# qhasm: 4x out4 += ta
# asm 1: vpaddq <ta=reg256#13,<out4=reg256#11,<out4=reg256#11
# asm 2: vpaddq <ta=%ymm12,<out4=%ymm10,<out4=%ymm10
vpaddq %ymm12,%ymm10,%ymm10

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV4
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV4=reg256#8,>tb=reg256#13
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV4=%ymm7,>tb=%ymm12
vpmuldq %ymm6,%ymm7,%ymm12

# qhasm: 4x out4 += tb
# asm 1: vpaddq <tb=reg256#13,<out4=reg256#11,<out4=reg256#11
# asm 2: vpaddq <tb=%ymm12,<out4=%ymm10,<out4=%ymm10
vpaddq %ymm12,%ymm10,%ymm10

# qhasm: mod4 = stack_mod4
# asm 1: vmovapd <stack_mod4=stack256#13,>mod4=reg256#13
# asm 2: vmovapd <stack_mod4=512(%rsp),>mod4=%ymm12
vmovapd 512(%rsp),%ymm12

# qhasm: 4x ta = int32 d2 * int32 mod2
# asm 1: vpmuldq <d2=reg256#10,<mod2=reg256#9,>ta=reg256#9
# asm 2: vpmuldq <d2=%ymm9,<mod2=%ymm8,>ta=%ymm8
vpmuldq %ymm9,%ymm8,%ymm8

# qhasm: 4x out4 += ta
# asm 1: vpaddq <ta=reg256#9,<out4=reg256#11,<out4=reg256#11
# asm 2: vpaddq <ta=%ymm8,<out4=%ymm10,<out4=%ymm10
vpaddq %ymm8,%ymm10,%ymm10

# qhasm: 4x tb = int32 d1 * int32 mod3
# asm 1: vpmuldq <d1=reg256#2,<mod3=reg256#5,>tb=reg256#9
# asm 2: vpmuldq <d1=%ymm1,<mod3=%ymm4,>tb=%ymm8
vpmuldq %ymm1,%ymm4,%ymm8

# qhasm: 4x out4 += tb
# asm 1: vpaddq <tb=reg256#9,<out4=reg256#11,<out4=reg256#11
# asm 2: vpaddq <tb=%ymm8,<out4=%ymm10,<out4=%ymm10
vpaddq %ymm8,%ymm10,%ymm10

# qhasm: 4x ta = int32 d0 * int32 mod4
# asm 1: vpmuldq <d0=reg256#12,<mod4=reg256#13,>ta=reg256#9
# asm 2: vpmuldq <d0=%ymm11,<mod4=%ymm12,>ta=%ymm8
vpmuldq %ymm11,%ymm12,%ymm8

# qhasm: 4x out4 += ta
# asm 1: vpaddq <ta=reg256#9,<out4=reg256#11,<out4=reg256#11
# asm 2: vpaddq <ta=%ymm8,<out4=%ymm10,<out4=%ymm10
vpaddq %ymm8,%ymm10,%ymm10

# qhasm: _2p30m1x4 = stack_2p30m1x4
# asm 1: vmovapd <stack_2p30m1x4=stack256#1,>_2p30m1x4=reg256#9
# asm 2: vmovapd <stack_2p30m1x4=128(%rsp),>_2p30m1x4=%ymm8
vmovapd 128(%rsp),%ymm8

# qhasm: _2p63m2p33x4 = stack_2p63m2p33x4
# asm 1: vmovapd <stack_2p63m2p33x4=stack256#18,>_2p63m2p33x4=reg256#14
# asm 2: vmovapd <stack_2p63m2p33x4=672(%rsp),>_2p63m2p33x4=%ymm13
vmovapd 672(%rsp),%ymm13

# qhasm: 4x carryy = out4 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#14,<out4=reg256#11,>carryy=reg256#14
# asm 2: vpaddq <_2p63m2p33x4=%ymm13,<out4=%ymm10,>carryy=%ymm13
vpaddq %ymm13,%ymm10,%ymm13

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#14,<carryy=reg256#14
# asm 2: vpsrlq $30,<carryy=%ymm13,<carryy=%ymm13
vpsrlq $30,%ymm13,%ymm13

# qhasm: out4 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#9,<out4=reg256#11,<out4=reg256#11
# asm 2: vpand <_2p30m1x4=%ymm8,<out4=%ymm10,<out4=%ymm10
vpand %ymm8,%ymm10,%ymm10

# qhasm: stack_FVGS1 = out4
# asm 1: vmovapd <out4=reg256#11,>stack_FVGS1=stack256#3
# asm 2: vmovapd <out4=%ymm10,>stack_FVGS1=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: FVGS5 = stack_FVGS5
# asm 1: vmovapd <stack_FVGS5=stack256#7,>FVGS5=reg256#9
# asm 2: vmovapd <stack_FVGS5=320(%rsp),>FVGS5=%ymm8
vmovapd 320(%rsp),%ymm8

# qhasm: GSFV5 = FVGS5[1,0]
# asm 1: vpermq $0x4e,<FVGS5=reg256#9,>GSFV5=reg256#11
# asm 2: vpermq $0x4e,<FVGS5=%ymm8,>GSFV5=%ymm10
vpermq $0x4e,%ymm8,%ymm10

# qhasm: 4x ta = int32 uuss1 * int32 FVGS4
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS4=reg256#4,>ta=reg256#4
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS4=%ymm3,>ta=%ymm3
vpmuldq %ymm2,%ymm3,%ymm3

# qhasm: 4x out5 = ta + carryy
# asm 1: vpaddq <carryy=reg256#14,<ta=reg256#4,>out5=reg256#4
# asm 2: vpaddq <carryy=%ymm13,<ta=%ymm3,>out5=%ymm3
vpaddq %ymm13,%ymm3,%ymm3

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV4
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV4=reg256#8,>tb=reg256#8
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV4=%ymm7,>tb=%ymm7
vpmuldq %ymm0,%ymm7,%ymm7

# qhasm: 4x out5 += tb
# asm 1: vpaddq <tb=reg256#8,<out5=reg256#4,<out5=reg256#4
# asm 2: vpaddq <tb=%ymm7,<out5=%ymm3,<out5=%ymm3
vpaddq %ymm7,%ymm3,%ymm3

# qhasm: 4x ta = int32 uuss0 * int32 FVGS5
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS5=reg256#9,>ta=reg256#8
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS5=%ymm8,>ta=%ymm7
vpmuldq %ymm5,%ymm8,%ymm7

# qhasm: 4x out5 += ta
# asm 1: vpaddq <ta=reg256#8,<out5=reg256#4,<out5=reg256#4
# asm 2: vpaddq <ta=%ymm7,<out5=%ymm3,<out5=%ymm3
vpaddq %ymm7,%ymm3,%ymm3

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV5
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV5=reg256#11,>tb=reg256#8
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV5=%ymm10,>tb=%ymm7
vpmuldq %ymm6,%ymm10,%ymm7

# qhasm: 4x out5 += tb
# asm 1: vpaddq <tb=reg256#8,<out5=reg256#4,<out5=reg256#4
# asm 2: vpaddq <tb=%ymm7,<out5=%ymm3,<out5=%ymm3
vpaddq %ymm7,%ymm3,%ymm3

# qhasm: mod5 = stack_mod5
# asm 1: vmovapd <stack_mod5=stack256#14,>mod5=reg256#8
# asm 2: vmovapd <stack_mod5=544(%rsp),>mod5=%ymm7
vmovapd 544(%rsp),%ymm7

# qhasm: 4x ta = int32 d2 * int32 mod3
# asm 1: vpmuldq <d2=reg256#10,<mod3=reg256#5,>ta=reg256#5
# asm 2: vpmuldq <d2=%ymm9,<mod3=%ymm4,>ta=%ymm4
vpmuldq %ymm9,%ymm4,%ymm4

# qhasm: 4x out5 += ta
# asm 1: vpaddq <ta=reg256#5,<out5=reg256#4,<out5=reg256#4
# asm 2: vpaddq <ta=%ymm4,<out5=%ymm3,<out5=%ymm3
vpaddq %ymm4,%ymm3,%ymm3

# qhasm: 4x tb = int32 d1 * int32 mod4
# asm 1: vpmuldq <d1=reg256#2,<mod4=reg256#13,>tb=reg256#5
# asm 2: vpmuldq <d1=%ymm1,<mod4=%ymm12,>tb=%ymm4
vpmuldq %ymm1,%ymm12,%ymm4

# qhasm: 4x out5 += tb
# asm 1: vpaddq <tb=reg256#5,<out5=reg256#4,<out5=reg256#4
# asm 2: vpaddq <tb=%ymm4,<out5=%ymm3,<out5=%ymm3
vpaddq %ymm4,%ymm3,%ymm3

# qhasm: 4x ta = int32 d0 * int32 mod5
# asm 1: vpmuldq <d0=reg256#12,<mod5=reg256#8,>ta=reg256#5
# asm 2: vpmuldq <d0=%ymm11,<mod5=%ymm7,>ta=%ymm4
vpmuldq %ymm11,%ymm7,%ymm4

# qhasm: 4x out5 += ta
# asm 1: vpaddq <ta=reg256#5,<out5=reg256#4,<out5=reg256#4
# asm 2: vpaddq <ta=%ymm4,<out5=%ymm3,<out5=%ymm3
vpaddq %ymm4,%ymm3,%ymm3

# qhasm: _2p30m1x4 = stack_2p30m1x4
# asm 1: vmovapd <stack_2p30m1x4=stack256#1,>_2p30m1x4=reg256#5
# asm 2: vmovapd <stack_2p30m1x4=128(%rsp),>_2p30m1x4=%ymm4
vmovapd 128(%rsp),%ymm4

# qhasm: _2p63m2p33x4 = stack_2p63m2p33x4
# asm 1: vmovapd <stack_2p63m2p33x4=stack256#18,>_2p63m2p33x4=reg256#14
# asm 2: vmovapd <stack_2p63m2p33x4=672(%rsp),>_2p63m2p33x4=%ymm13
vmovapd 672(%rsp),%ymm13

# qhasm: 4x carryy = out5 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#14,<out5=reg256#4,>carryy=reg256#14
# asm 2: vpaddq <_2p63m2p33x4=%ymm13,<out5=%ymm3,>carryy=%ymm13
vpaddq %ymm13,%ymm3,%ymm13

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#14,<carryy=reg256#14
# asm 2: vpsrlq $30,<carryy=%ymm13,<carryy=%ymm13
vpsrlq $30,%ymm13,%ymm13

# qhasm: out5 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#5,<out5=reg256#4,<out5=reg256#4
# asm 2: vpand <_2p30m1x4=%ymm4,<out5=%ymm3,<out5=%ymm3
vpand %ymm4,%ymm3,%ymm3

# qhasm: stack_FVGS2 = out5
# asm 1: vmovapd <out5=reg256#4,>stack_FVGS2=stack256#4
# asm 2: vmovapd <out5=%ymm3,>stack_FVGS2=224(%rsp)
vmovapd %ymm3,224(%rsp)

# qhasm: FVGS6 = stack_FVGS6
# asm 1: vmovapd <stack_FVGS6=stack256#8,>FVGS6=reg256#4
# asm 2: vmovapd <stack_FVGS6=352(%rsp),>FVGS6=%ymm3
vmovapd 352(%rsp),%ymm3

# qhasm: GSFV6 = FVGS6[1,0]
# asm 1: vpermq $0x4e,<FVGS6=reg256#4,>GSFV6=reg256#5
# asm 2: vpermq $0x4e,<FVGS6=%ymm3,>GSFV6=%ymm4
vpermq $0x4e,%ymm3,%ymm4

# qhasm: 4x ta = int32 uuss1 * int32 FVGS5
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS5=reg256#9,>ta=reg256#9
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS5=%ymm8,>ta=%ymm8
vpmuldq %ymm2,%ymm8,%ymm8

# qhasm: 4x out6 = ta + carryy
# asm 1: vpaddq <carryy=reg256#14,<ta=reg256#9,>out6=reg256#9
# asm 2: vpaddq <carryy=%ymm13,<ta=%ymm8,>out6=%ymm8
vpaddq %ymm13,%ymm8,%ymm8

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV5
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV5=reg256#11,>tb=reg256#11
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV5=%ymm10,>tb=%ymm10
vpmuldq %ymm0,%ymm10,%ymm10

# qhasm: 4x out6 += tb
# asm 1: vpaddq <tb=reg256#11,<out6=reg256#9,<out6=reg256#9
# asm 2: vpaddq <tb=%ymm10,<out6=%ymm8,<out6=%ymm8
vpaddq %ymm10,%ymm8,%ymm8

# qhasm: 4x ta = int32 uuss0 * int32 FVGS6
# asm 1: vpmuldq <uuss0=reg256#6,<FVGS6=reg256#4,>ta=reg256#6
# asm 2: vpmuldq <uuss0=%ymm5,<FVGS6=%ymm3,>ta=%ymm5
vpmuldq %ymm5,%ymm3,%ymm5

# qhasm: 4x out6 += ta
# asm 1: vpaddq <ta=reg256#6,<out6=reg256#9,<out6=reg256#9
# asm 2: vpaddq <ta=%ymm5,<out6=%ymm8,<out6=%ymm8
vpaddq %ymm5,%ymm8,%ymm8

# qhasm: 4x tb = int32 vvrr0 * int32 GSFV6
# asm 1: vpmuldq <vvrr0=reg256#7,<GSFV6=reg256#5,>tb=reg256#6
# asm 2: vpmuldq <vvrr0=%ymm6,<GSFV6=%ymm4,>tb=%ymm5
vpmuldq %ymm6,%ymm4,%ymm5

# qhasm: 4x out6 += tb
# asm 1: vpaddq <tb=reg256#6,<out6=reg256#9,<out6=reg256#9
# asm 2: vpaddq <tb=%ymm5,<out6=%ymm8,<out6=%ymm8
vpaddq %ymm5,%ymm8,%ymm8

# qhasm: mod6 = stack_mod6
# asm 1: vmovapd <stack_mod6=stack256#15,>mod6=reg256#6
# asm 2: vmovapd <stack_mod6=576(%rsp),>mod6=%ymm5
vmovapd 576(%rsp),%ymm5

# qhasm: 4x ta = int32 d2 * int32 mod4
# asm 1: vpmuldq <d2=reg256#10,<mod4=reg256#13,>ta=reg256#7
# asm 2: vpmuldq <d2=%ymm9,<mod4=%ymm12,>ta=%ymm6
vpmuldq %ymm9,%ymm12,%ymm6

# qhasm: 4x out6 += ta
# asm 1: vpaddq <ta=reg256#7,<out6=reg256#9,<out6=reg256#9
# asm 2: vpaddq <ta=%ymm6,<out6=%ymm8,<out6=%ymm8
vpaddq %ymm6,%ymm8,%ymm8

# qhasm: 4x tb = int32 d1 * int32 mod5
# asm 1: vpmuldq <d1=reg256#2,<mod5=reg256#8,>tb=reg256#7
# asm 2: vpmuldq <d1=%ymm1,<mod5=%ymm7,>tb=%ymm6
vpmuldq %ymm1,%ymm7,%ymm6

# qhasm: 4x out6 += tb
# asm 1: vpaddq <tb=reg256#7,<out6=reg256#9,<out6=reg256#9
# asm 2: vpaddq <tb=%ymm6,<out6=%ymm8,<out6=%ymm8
vpaddq %ymm6,%ymm8,%ymm8

# qhasm: 4x ta = int32 d0 * int32 mod6
# asm 1: vpmuldq <d0=reg256#12,<mod6=reg256#6,>ta=reg256#7
# asm 2: vpmuldq <d0=%ymm11,<mod6=%ymm5,>ta=%ymm6
vpmuldq %ymm11,%ymm5,%ymm6

# qhasm: 4x out6 += ta
# asm 1: vpaddq <ta=reg256#7,<out6=reg256#9,<out6=reg256#9
# asm 2: vpaddq <ta=%ymm6,<out6=%ymm8,<out6=%ymm8
vpaddq %ymm6,%ymm8,%ymm8

# qhasm: _2p30m1x4 = stack_2p30m1x4
# asm 1: vmovapd <stack_2p30m1x4=stack256#1,>_2p30m1x4=reg256#7
# asm 2: vmovapd <stack_2p30m1x4=128(%rsp),>_2p30m1x4=%ymm6
vmovapd 128(%rsp),%ymm6

# qhasm: _2p63m2p33x4 = stack_2p63m2p33x4
# asm 1: vmovapd <stack_2p63m2p33x4=stack256#18,>_2p63m2p33x4=reg256#11
# asm 2: vmovapd <stack_2p63m2p33x4=672(%rsp),>_2p63m2p33x4=%ymm10
vmovapd 672(%rsp),%ymm10

# qhasm: 4x carryy = out6 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#11,<out6=reg256#9,>carryy=reg256#12
# asm 2: vpaddq <_2p63m2p33x4=%ymm10,<out6=%ymm8,>carryy=%ymm11
vpaddq %ymm10,%ymm8,%ymm11

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#12,<carryy=reg256#12
# asm 2: vpsrlq $30,<carryy=%ymm11,<carryy=%ymm11
vpsrlq $30,%ymm11,%ymm11

# qhasm: out6 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#7,<out6=reg256#9,<out6=reg256#9
# asm 2: vpand <_2p30m1x4=%ymm6,<out6=%ymm8,<out6=%ymm8
vpand %ymm6,%ymm8,%ymm8

# qhasm: stack_FVGS3 = out6
# asm 1: vmovapd <out6=reg256#9,>stack_FVGS3=stack256#1
# asm 2: vmovapd <out6=%ymm8,>stack_FVGS3=128(%rsp)
vmovapd %ymm8,128(%rsp)

# qhasm: 4x ta = int32 uuss1 * int32 FVGS6
# asm 1: vpmuldq <uuss1=reg256#3,<FVGS6=reg256#4,>ta=reg256#3
# asm 2: vpmuldq <uuss1=%ymm2,<FVGS6=%ymm3,>ta=%ymm2
vpmuldq %ymm2,%ymm3,%ymm2

# qhasm: 4x tb = int32 vvrr1 * int32 GSFV6
# asm 1: vpmuldq <vvrr1=reg256#1,<GSFV6=reg256#5,>tb=reg256#1
# asm 2: vpmuldq <vvrr1=%ymm0,<GSFV6=%ymm4,>tb=%ymm0
vpmuldq %ymm0,%ymm4,%ymm0

# qhasm: 4x out7plus = ta + tb
# asm 1: vpaddq <tb=reg256#1,<ta=reg256#3,>out7plus=reg256#1
# asm 2: vpaddq <tb=%ymm0,<ta=%ymm2,>out7plus=%ymm0
vpaddq %ymm0,%ymm2,%ymm0

# qhasm: 4x ta = int32 mod6 * int32 d1
# asm 1: vpmuldq <mod6=reg256#6,<d1=reg256#2,>ta=reg256#2
# asm 2: vpmuldq <mod6=%ymm5,<d1=%ymm1,>ta=%ymm1
vpmuldq %ymm5,%ymm1,%ymm1

# qhasm: 4x tb = int32 mod5 * int32 d2
# asm 1: vpmuldq <mod5=reg256#8,<d2=reg256#10,>tb=reg256#3
# asm 2: vpmuldq <mod5=%ymm7,<d2=%ymm9,>tb=%ymm2
vpmuldq %ymm7,%ymm9,%ymm2

# qhasm: 4x tb += carryy
# asm 1: vpaddq <carryy=reg256#12,<tb=reg256#3,<tb=reg256#3
# asm 2: vpaddq <carryy=%ymm11,<tb=%ymm2,<tb=%ymm2
vpaddq %ymm11,%ymm2,%ymm2

# qhasm: 4x out7 = ta + tb
# asm 1: vpaddq <tb=reg256#3,<ta=reg256#2,>out7=reg256#2
# asm 2: vpaddq <tb=%ymm2,<ta=%ymm1,>out7=%ymm1
vpaddq %ymm2,%ymm1,%ymm1

# qhasm: 4x out7 += out7plus
# asm 1: vpaddq <out7plus=reg256#1,<out7=reg256#2,<out7=reg256#2
# asm 2: vpaddq <out7plus=%ymm0,<out7=%ymm1,<out7=%ymm1
vpaddq %ymm0,%ymm1,%ymm1

# qhasm: 4x carryy = out7 + _2p63m2p33x4 
# asm 1: vpaddq <_2p63m2p33x4=reg256#11,<out7=reg256#2,>carryy=reg256#1
# asm 2: vpaddq <_2p63m2p33x4=%ymm10,<out7=%ymm1,>carryy=%ymm0
vpaddq %ymm10,%ymm1,%ymm0

# qhasm: 4x carryy unsigned>>= 30
# asm 1: vpsrlq $30,<carryy=reg256#1,<carryy=reg256#1
# asm 2: vpsrlq $30,<carryy=%ymm0,<carryy=%ymm0
vpsrlq $30,%ymm0,%ymm0

# qhasm: out7 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#7,<out7=reg256#2,<out7=reg256#2
# asm 2: vpand <_2p30m1x4=%ymm6,<out7=%ymm1,<out7=%ymm1
vpand %ymm6,%ymm1,%ymm1

# qhasm: stack_FVGS4 = out7
# asm 1: vmovapd <out7=reg256#2,>stack_FVGS4=stack256#5
# asm 2: vmovapd <out7=%ymm1,>stack_FVGS4=256(%rsp)
vmovapd %ymm1,256(%rsp)

# qhasm: _2p33x4 = stack_2p33x4
# asm 1: vmovapd <stack_2p33x4=stack256#16,>_2p33x4=reg256#2
# asm 2: vmovapd <stack_2p33x4=608(%rsp),>_2p33x4=%ymm1
vmovapd 608(%rsp),%ymm1

# qhasm: 4x tb = int32 mod6 * int32 d2
# asm 1: vpmuldq <mod6=reg256#6,<d2=reg256#10,>tb=reg256#3
# asm 2: vpmuldq <mod6=%ymm5,<d2=%ymm9,>tb=%ymm2
vpmuldq %ymm5,%ymm9,%ymm2

# qhasm: 4x out8 = tb + carryy
# asm 1: vpaddq <carryy=reg256#1,<tb=reg256#3,>out8=reg256#1
# asm 2: vpaddq <carryy=%ymm0,<tb=%ymm2,>out8=%ymm0
vpaddq %ymm0,%ymm2,%ymm0

# qhasm: 4x out9 = out8 + _2p63m2p33x4
# asm 1: vpaddq <_2p63m2p33x4=reg256#11,<out8=reg256#1,>out9=reg256#3
# asm 2: vpaddq <_2p63m2p33x4=%ymm10,<out8=%ymm0,>out9=%ymm2
vpaddq %ymm10,%ymm0,%ymm2

# qhasm: 4x out9 unsigned >>= 30
# asm 1: vpsrlq $30,<out9=reg256#3,<out9=reg256#3
# asm 2: vpsrlq $30,<out9=%ymm2,<out9=%ymm2
vpsrlq $30,%ymm2,%ymm2

# qhasm: 4x out9 -= _2p33x4
# asm 1: vpsubq <_2p33x4=reg256#2,<out9=reg256#3,<out9=reg256#3
# asm 2: vpsubq <_2p33x4=%ymm1,<out9=%ymm2,<out9=%ymm2
vpsubq %ymm1,%ymm2,%ymm2

# qhasm: out8 &= _2p30m1x4
# asm 1: vpand <_2p30m1x4=reg256#7,<out8=reg256#1,<out8=reg256#1
# asm 2: vpand <_2p30m1x4=%ymm6,<out8=%ymm0,<out8=%ymm0
vpand %ymm6,%ymm0,%ymm0

# qhasm: stack_FVGS6 = out9
# asm 1: vmovapd <out9=reg256#3,>stack_FVGS6=stack256#6
# asm 2: vmovapd <out9=%ymm2,>stack_FVGS6=288(%rsp)
vmovapd %ymm2,288(%rsp)

# qhasm: z = stack_FVGS6[1]
# asm 1: movq <stack_FVGS6=stack256#6,>z=int64#1
# asm 2: movq <stack_FVGS6=296(%rsp),>z=%rdi
movq 296(%rsp),%rdi

# qhasm: (int64) z >>= 63
# asm 1: sar  $63,<z=int64#1
# asm 2: sar  $63,<z=%rdi
sar  $63,%rdi

# qhasm: stack_FVGS5 = out8
# asm 1: vmovapd <out8=reg256#1,>stack_FVGS5=stack256#7
# asm 2: vmovapd <out8=%ymm0,>stack_FVGS5=320(%rsp)
vmovapd %ymm0,320(%rsp)

# qhasm: table = stack_out
# asm 1: movq <stack_out=stack64#1,>table=int64#2
# asm 2: movq <stack_out=0(%rsp),>table=%rsi
movq 0(%rsp),%rsi

# qhasm: a0 = stack_FVGS0[1]
# asm 1: movq <stack_FVGS0=stack256#2,>a0=int64#3
# asm 2: movq <stack_FVGS0=168(%rsp),>a0=%rdx
movq 168(%rsp),%rdx

# qhasm: h = z
# asm 1: mov  <z=int64#1,>h=int64#4
# asm 2: mov  <z=%rdi,>h=%rcx
mov  %rdi,%rcx

# qhasm: h &= stack_mod0[0]
# asm 1: andq <stack_mod0=stack256#9,<h=int64#4
# asm 2: andq <stack_mod0=384(%rsp),<h=%rcx
andq 384(%rsp),%rcx

# qhasm: a0 += h
# asm 1: add  <h=int64#4,<a0=int64#3
# asm 2: add  <h=%rcx,<a0=%rdx
add  %rcx,%rdx

# qhasm: t1 = stack_FVGS1[1]
# asm 1: movq <stack_FVGS1=stack256#3,>t1=int64#4
# asm 2: movq <stack_FVGS1=200(%rsp),>t1=%rcx
movq 200(%rsp),%rcx

# qhasm: h = z
# asm 1: mov  <z=int64#1,>h=int64#5
# asm 2: mov  <z=%rdi,>h=%r8
mov  %rdi,%r8

# qhasm: h &= stack_mod1[0]
# asm 1: andq <stack_mod1=stack256#10,<h=int64#5
# asm 2: andq <stack_mod1=416(%rsp),<h=%r8
andq 416(%rsp),%r8

# qhasm: t1 += h
# asm 1: add  <h=int64#5,<t1=int64#4
# asm 2: add  <h=%r8,<t1=%rcx
add  %r8,%rcx

# qhasm: t1 <<= 30
# asm 1: shl  $30,<t1=int64#4
# asm 2: shl  $30,<t1=%rcx
shl  $30,%rcx

# qhasm: a0 += t1
# asm 1: add  <t1=int64#4,<a0=int64#3
# asm 2: add  <t1=%rcx,<a0=%rdx
add  %rcx,%rdx

# qhasm: t2 = stack_FVGS2[1]
# asm 1: movq <stack_FVGS2=stack256#4,>t2=int64#4
# asm 2: movq <stack_FVGS2=232(%rsp),>t2=%rcx
movq 232(%rsp),%rcx

# qhasm: h = z
# asm 1: mov  <z=int64#1,>h=int64#5
# asm 2: mov  <z=%rdi,>h=%r8
mov  %rdi,%r8

# qhasm: h &= stack_mod2[0]
# asm 1: andq <stack_mod2=stack256#11,<h=int64#5
# asm 2: andq <stack_mod2=448(%rsp),<h=%r8
andq 448(%rsp),%r8

# qhasm: t2 += h
# asm 1: add  <h=int64#5,<t2=int64#4
# asm 2: add  <h=%r8,<t2=%rcx
add  %r8,%rcx

# qhasm: a1 = t2
# asm 1: mov  <t2=int64#4,>a1=int64#5
# asm 2: mov  <t2=%rcx,>a1=%r8
mov  %rcx,%r8

# qhasm: t2 <<= 60
# asm 1: shl  $60,<t2=int64#4
# asm 2: shl  $60,<t2=%rcx
shl  $60,%rcx

# qhasm: (int64) a1 >>= 4
# asm 1: sar  $4,<a1=int64#5
# asm 2: sar  $4,<a1=%r8
sar  $4,%r8

# qhasm: carry? a0 += t2
# asm 1: add  <t2=int64#4,<a0=int64#3
# asm 2: add  <t2=%rcx,<a0=%rdx
add  %rcx,%rdx

# qhasm: a1 += 0 + carry
# asm 1: adc $0,<a1=int64#5
# asm 2: adc $0,<a1=%r8
adc $0,%r8

# qhasm: mem64[table +  0] = a0
# asm 1: movq   <a0=int64#3,0(<table=int64#2)
# asm 2: movq   <a0=%rdx,0(<table=%rsi)
movq   %rdx,0(%rsi)

# qhasm: t3 = stack_FVGS3[1]
# asm 1: movq <stack_FVGS3=stack256#1,>t3=int64#3
# asm 2: movq <stack_FVGS3=136(%rsp),>t3=%rdx
movq 136(%rsp),%rdx

# qhasm: h = z
# asm 1: mov  <z=int64#1,>h=int64#4
# asm 2: mov  <z=%rdi,>h=%rcx
mov  %rdi,%rcx

# qhasm: h &= stack_mod3[0]
# asm 1: andq <stack_mod3=stack256#12,<h=int64#4
# asm 2: andq <stack_mod3=480(%rsp),<h=%rcx
andq 480(%rsp),%rcx

# qhasm: t3 += h
# asm 1: add  <h=int64#4,<t3=int64#3
# asm 2: add  <h=%rcx,<t3=%rdx
add  %rcx,%rdx

# qhasm: t3 <<= 26
# asm 1: shl  $26,<t3=int64#3
# asm 2: shl  $26,<t3=%rdx
shl  $26,%rdx

# qhasm: a1 += t3
# asm 1: add  <t3=int64#3,<a1=int64#5
# asm 2: add  <t3=%rdx,<a1=%r8
add  %rdx,%r8

# qhasm: t4 = stack_FVGS4[1]
# asm 1: movq <stack_FVGS4=stack256#5,>t4=int64#3
# asm 2: movq <stack_FVGS4=264(%rsp),>t4=%rdx
movq 264(%rsp),%rdx

# qhasm: h = z
# asm 1: mov  <z=int64#1,>h=int64#4
# asm 2: mov  <z=%rdi,>h=%rcx
mov  %rdi,%rcx

# qhasm: h &= stack_mod4[0]
# asm 1: andq <stack_mod4=stack256#13,<h=int64#4
# asm 2: andq <stack_mod4=512(%rsp),<h=%rcx
andq 512(%rsp),%rcx

# qhasm: t4 += h
# asm 1: add  <h=int64#4,<t4=int64#3
# asm 2: add  <h=%rcx,<t4=%rdx
add  %rcx,%rdx

# qhasm: a2 = t4
# asm 1: mov  <t4=int64#3,>a2=int64#4
# asm 2: mov  <t4=%rdx,>a2=%rcx
mov  %rdx,%rcx

# qhasm: t4 <<= 56
# asm 1: shl  $56,<t4=int64#3
# asm 2: shl  $56,<t4=%rdx
shl  $56,%rdx

# qhasm: (int64) a2 >>= 8
# asm 1: sar  $8,<a2=int64#4
# asm 2: sar  $8,<a2=%rcx
sar  $8,%rcx

# qhasm: carry? a1 += t4
# asm 1: add  <t4=int64#3,<a1=int64#5
# asm 2: add  <t4=%rdx,<a1=%r8
add  %rdx,%r8

# qhasm: a2 += 0 + carry
# asm 1: adc $0,<a2=int64#4
# asm 2: adc $0,<a2=%rcx
adc $0,%rcx

# qhasm: mem64[table +  8] = a1
# asm 1: movq   <a1=int64#5,8(<table=int64#2)
# asm 2: movq   <a1=%r8,8(<table=%rsi)
movq   %r8,8(%rsi)

# qhasm: t5 = stack_FVGS5[1]
# asm 1: movq <stack_FVGS5=stack256#7,>t5=int64#3
# asm 2: movq <stack_FVGS5=328(%rsp),>t5=%rdx
movq 328(%rsp),%rdx

# qhasm: h = z
# asm 1: mov  <z=int64#1,>h=int64#5
# asm 2: mov  <z=%rdi,>h=%r8
mov  %rdi,%r8

# qhasm: h &= stack_mod5[0]
# asm 1: andq <stack_mod5=stack256#14,<h=int64#5
# asm 2: andq <stack_mod5=544(%rsp),<h=%r8
andq 544(%rsp),%r8

# qhasm: t5 += h
# asm 1: add  <h=int64#5,<t5=int64#3
# asm 2: add  <h=%r8,<t5=%rdx
add  %r8,%rdx

# qhasm: t5 <<= 22
# asm 1: shl  $22,<t5=int64#3
# asm 2: shl  $22,<t5=%rdx
shl  $22,%rdx

# qhasm: a2 += t5
# asm 1: add  <t5=int64#3,<a2=int64#4
# asm 2: add  <t5=%rdx,<a2=%rcx
add  %rdx,%rcx

# qhasm: t6 = stack_FVGS6[1]
# asm 1: movq <stack_FVGS6=stack256#6,>t6=int64#3
# asm 2: movq <stack_FVGS6=296(%rsp),>t6=%rdx
movq 296(%rsp),%rdx

# qhasm: h = z
# asm 1: mov  <z=int64#1,>h=int64#1
# asm 2: mov  <z=%rdi,>h=%rdi
mov  %rdi,%rdi

# qhasm: h &= stack_mod6[0]
# asm 1: andq <stack_mod6=stack256#15,<h=int64#1
# asm 2: andq <stack_mod6=576(%rsp),<h=%rdi
andq 576(%rsp),%rdi

# qhasm: t6 += h
# asm 1: add  <h=int64#1,<t6=int64#3
# asm 2: add  <h=%rdi,<t6=%rdx
add  %rdi,%rdx

# qhasm: t6 <<= 52
# asm 1: shl  $52,<t6=int64#3
# asm 2: shl  $52,<t6=%rdx
shl  $52,%rdx

# qhasm: a2 += t6
# asm 1: add  <t6=int64#3,<a2=int64#4
# asm 2: add  <t6=%rdx,<a2=%rcx
add  %rdx,%rcx

# qhasm: mem64[table + 16] = a2
# asm 1: movq   <a2=int64#4,16(<table=int64#2)
# asm 2: movq   <a2=%rcx,16(<table=%rsi)
movq   %rcx,16(%rsi)

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
