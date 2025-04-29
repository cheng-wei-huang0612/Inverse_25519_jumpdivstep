
# qhasm: int64 input_x0

# qhasm: int64 input_x1

# qhasm: int64 input_x2

# qhasm: int64 input_x3

# qhasm: int64 input_x4

# qhasm: int64 input_x5

# qhasm: int64 input_x6

# qhasm: int64 input_x7

# qhasm: int64 output_x0

# qhasm: int64 calleesaved_x18

# qhasm: int64 calleesaved_x19

# qhasm: int64 calleesaved_x20

# qhasm: int64 calleesaved_x21

# qhasm: int64 calleesaved_x22

# qhasm: int64 calleesaved_x23

# qhasm: int64 calleesaved_x24

# qhasm: int64 calleesaved_x25

# qhasm: int64 calleesaved_x26

# qhasm: int64 calleesaved_x27

# qhasm: int64 calleesaved_x28

# qhasm: int64 calleesaved_x29

# qhasm: reg128 input_v0

# qhasm: reg128 input_v1

# qhasm: reg128 input_v2

# qhasm: reg128 input_v3

# qhasm: reg128 input_v4

# qhasm: reg128 input_v5

# qhasm: reg128 input_v6

# qhasm: reg128 input_v7

# qhasm: reg128 output_v0

# qhasm: reg128 calleesaved_v8

# qhasm: reg128 calleesaved_v9

# qhasm: reg128 calleesaved_v10

# qhasm: reg128 calleesaved_v11

# qhasm: reg128 calleesaved_v12

# qhasm: reg128 calleesaved_v13

# qhasm: reg128 calleesaved_v14

# qhasm: reg128 calleesaved_v15

# qhasm: enter update_VS_mont
.align 4
.global _update_VS_mont
.global update_VS_mont
_update_VS_mont:
update_VS_mont:

# qhasm: int64 pointerV

# qhasm: int64 pointerS

# qhasm: int64 pointeruuvvrrss

# qhasm: input pointerV

# qhasm: input pointerS

# qhasm: input pointeruuvvrrss

# qhasm: caller calleesaved_x18

# qhasm: caller calleesaved_x19

# qhasm: caller calleesaved_x20

# qhasm: caller calleesaved_x21

# qhasm: caller calleesaved_x22

# qhasm: caller calleesaved_x23

# qhasm: caller calleesaved_x24

# qhasm: caller calleesaved_x25

# qhasm: caller calleesaved_x26

# qhasm: caller calleesaved_x27

# qhasm: caller calleesaved_x28

# qhasm: caller calleesaved_x29

# qhasm: caller calleesaved_v8

# qhasm: caller calleesaved_v9

# qhasm: caller calleesaved_v10

# qhasm: caller calleesaved_v11

# qhasm: caller calleesaved_v12

# qhasm: caller calleesaved_v13

# qhasm: caller calleesaved_v14

# qhasm: caller calleesaved_v15

# qhasm: push2xint64 calleesaved_x18, calleesaved_x19
# asm 1: stp <calleesaved_x18=int64#19, <calleesaved_x19=int64#20, [sp, #-16]!
# asm 2: stp <calleesaved_x18=x18, <calleesaved_x19=x19, [sp, #-16]!
stp x18, x19, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x20, calleesaved_x21
# asm 1: stp <calleesaved_x20=int64#21, <calleesaved_x21=int64#22, [sp, #-16]!
# asm 2: stp <calleesaved_x20=x20, <calleesaved_x21=x21, [sp, #-16]!
stp x20, x21, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x22, calleesaved_x23
# asm 1: stp <calleesaved_x22=int64#23, <calleesaved_x23=int64#24, [sp, #-16]!
# asm 2: stp <calleesaved_x22=x22, <calleesaved_x23=x23, [sp, #-16]!
stp x22, x23, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x24, calleesaved_x25
# asm 1: stp <calleesaved_x24=int64#25, <calleesaved_x25=int64#26, [sp, #-16]!
# asm 2: stp <calleesaved_x24=x24, <calleesaved_x25=x25, [sp, #-16]!
stp x24, x25, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x26, calleesaved_x27
# asm 1: stp <calleesaved_x26=int64#27, <calleesaved_x27=int64#28, [sp, #-16]!
# asm 2: stp <calleesaved_x26=x26, <calleesaved_x27=x27, [sp, #-16]!
stp x26, x27, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x28, calleesaved_x29
# asm 1: stp <calleesaved_x28=int64#29, <calleesaved_x29=int64#30, [sp, #-16]!
# asm 2: stp <calleesaved_x28=x28, <calleesaved_x29=x29, [sp, #-16]!
stp x28, x29, [sp, #-16]!

# qhasm: push2x8b calleesaved_v8, calleesaved_v9
# asm 1: stp <calleesaved_v8=reg128#9%dregname,<calleesaved_v9=reg128#10%dregname,[sp,#-16]!
# asm 2: stp <calleesaved_v8=d8,<calleesaved_v9=d9,[sp,#-16]!
stp d8,d9,[sp,#-16]!

# qhasm: push2x8b calleesaved_v10, calleesaved_v11
# asm 1: stp <calleesaved_v10=reg128#11%dregname,<calleesaved_v11=reg128#12%dregname,[sp,#-16]!
# asm 2: stp <calleesaved_v10=d10,<calleesaved_v11=d11,[sp,#-16]!
stp d10,d11,[sp,#-16]!

# qhasm: push2x8b calleesaved_v12, calleesaved_v13
# asm 1: stp <calleesaved_v12=reg128#13%dregname,<calleesaved_v13=reg128#14%dregname,[sp,#-16]!
# asm 2: stp <calleesaved_v12=d12,<calleesaved_v13=d13,[sp,#-16]!
stp d12,d13,[sp,#-16]!

# qhasm: push2x8b calleesaved_v14, calleesaved_v15
# asm 1: stp <calleesaved_v14=reg128#15%dregname,<calleesaved_v15=reg128#16%dregname,[sp,#-16]!
# asm 2: stp <calleesaved_v14=d14,<calleesaved_v15=d15,[sp,#-16]!
stp d14,d15,[sp,#-16]!

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7

# qhasm: int64 V8

# qhasm: V0V1, V2V3 = mem128[pointerV]
# asm 1: ldp >V0V1=int64#4, >V2V3=int64#5, [<pointerV=int64#1]
# asm 2: ldp >V0V1=x3, >V2V3=x4, [<pointerV=x0]
ldp x3, x4, [x0]

# qhasm: V4V5, V6V7 = mem128[pointerV+16]
# asm 1: ldp >V4V5=int64#6, >V6V7=int64#7, [<pointerV=int64#1, #16]
# asm 2: ldp >V4V5=x5, >V6V7=x6, [<pointerV=x0, #16]
ldp x5, x6, [x0, #16]

# qhasm: V8 = mem32[pointerV+32]
# asm 1: ldr >V8=int64#1%wregname, [<pointerV=int64#1, #32]
# asm 2: ldr >V8=w0, [<pointerV=x0, #32]
ldr w0, [x0, #32]

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 S4S5

# qhasm: int64 S6S7

# qhasm: int64 S8

# qhasm: S0S1, S2S3 = mem128[pointerS]
# asm 1: ldp >S0S1=int64#8, >S2S3=int64#9, [<pointerS=int64#2]
# asm 2: ldp >S0S1=x7, >S2S3=x8, [<pointerS=x1]
ldp x7, x8, [x1]

# qhasm: S4S5, S6S7 = mem128[pointerS+16]
# asm 1: ldp >S4S5=int64#10, >S6S7=int64#11, [<pointerS=int64#2, #16]
# asm 2: ldp >S4S5=x9, >S6S7=x10, [<pointerS=x1, #16]
ldp x9, x10, [x1, #16]

# qhasm: S8 = mem32[pointerS+32]
# asm 1: ldr >S8=int64#2%wregname, [<pointerS=int64#2, #32]
# asm 2: ldr >S8=w1, [<pointerS=x1, #32]
ldr w1, [x1, #32]

# qhasm: reg128 vec_V0_V1_S0_S1 

# qhasm: vec_V0_V1_S0_S1[0/2] = V0V1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#1.d[0], <V0V1=int64#4
# asm 2: ins <vec_V0_V1_S0_S1=v0.d[0], <V0V1=x3
ins v0.d[0], x3

# qhasm: vec_V0_V1_S0_S1[1/2] = S0S1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#1.d[1], <S0S1=int64#8
# asm 2: ins <vec_V0_V1_S0_S1=v0.d[1], <S0S1=x7
ins v0.d[1], x7

# qhasm: reg128 vec_V2_V3_S2_S3 

# qhasm: vec_V2_V3_S2_S3[0/2] = V2V3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#2.d[0], <V2V3=int64#5
# asm 2: ins <vec_V2_V3_S2_S3=v1.d[0], <V2V3=x4
ins v1.d[0], x4

# qhasm: vec_V2_V3_S2_S3[1/2] = S2S3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#2.d[1], <S2S3=int64#9
# asm 2: ins <vec_V2_V3_S2_S3=v1.d[1], <S2S3=x8
ins v1.d[1], x8

# qhasm: reg128 vec_V4_V5_S4_S5 

# qhasm: vec_V4_V5_S4_S5[0/2] = V4V5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#3.d[0], <V4V5=int64#6
# asm 2: ins <vec_V4_V5_S4_S5=v2.d[0], <V4V5=x5
ins v2.d[0], x5

# qhasm: vec_V4_V5_S4_S5[1/2] = S4S5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#3.d[1], <S4S5=int64#10
# asm 2: ins <vec_V4_V5_S4_S5=v2.d[1], <S4S5=x9
ins v2.d[1], x9

# qhasm: reg128 vec_V6_V7_S6_S7 

# qhasm: vec_V6_V7_S6_S7[0/2] = V6V7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#4.d[0], <V6V7=int64#7
# asm 2: ins <vec_V6_V7_S6_S7=v3.d[0], <V6V7=x6
ins v3.d[0], x6

# qhasm: vec_V6_V7_S6_S7[1/2] = S6S7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#4.d[1], <S6S7=int64#11
# asm 2: ins <vec_V6_V7_S6_S7=v3.d[1], <S6S7=x10
ins v3.d[1], x10

# qhasm: reg128 vec_V8_0_S8_0

# qhasm: vec_V8_0_S8_0[0/2] = V8
# asm 1: ins <vec_V8_0_S8_0=reg128#5.d[0], <V8=int64#1
# asm 2: ins <vec_V8_0_S8_0=v4.d[0], <V8=x0
ins v4.d[0], x0

# qhasm: vec_V8_0_S8_0[1/2] = S8
# asm 1: ins <vec_V8_0_S8_0=reg128#5.d[1], <S8=int64#2
# asm 2: ins <vec_V8_0_S8_0=v4.d[1], <S8=x1
ins v4.d[1], x1

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss

# qhasm: uu, vv = mem128[pointeruuvvrrss + 0]
# asm 1: ldp >uu=int64#1, >vv=int64#2, [<pointeruuvvrrss=int64#3, #0]
# asm 2: ldp >uu=x0, >vv=x1, [<pointeruuvvrrss=x2, #0]
ldp x0, x1, [x2, #0]

# qhasm: rr, ss = mem128[pointeruuvvrrss + 16]
# asm 1: ldp >rr=int64#3, >ss=int64#4, [<pointeruuvvrrss=int64#3, #16]
# asm 2: ldp >rr=x2, >ss=x3, [<pointeruuvvrrss=x2, #16]
ldp x2, x3, [x2, #16]

# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#5, <uu=int64#1, #0, #30
# asm 2: ubfx >uu0=x4, <uu=x0, #0, #30
ubfx x4, x0, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#1, <uu=int64#1, #30, #32
# asm 2: ubfx >uu1=x0, <uu=x0, #30, #32
ubfx x0, x0, #30, #32

# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#6, <vv=int64#2, #0, #30
# asm 2: ubfx >vv0=x5, <vv=x1, #0, #30
ubfx x5, x1, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#2, <vv=int64#2, #30, #32
# asm 2: ubfx >vv1=x1, <vv=x1, #30, #32
ubfx x1, x1, #30, #32

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#7, <rr=int64#3, #0, #30
# asm 2: ubfx >rr0=x6, <rr=x2, #0, #30
ubfx x6, x2, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#3, <rr=int64#3, #30, #32
# asm 2: ubfx >rr1=x2, <rr=x2, #30, #32
ubfx x2, x2, #30, #32

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#8, <ss=int64#4, #0, #30
# asm 2: ubfx >ss0=x7, <ss=x3, #0, #30
ubfx x7, x3, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#4, <ss=int64#4, #30, #32
# asm 2: ubfx >ss1=x3, <ss=x3, #30, #32
ubfx x3, x3, #30, #32

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[0], <uu0=int64#5%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[0], <uu0=w4
ins v5.s[0], w4

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[1], <rr0=int64#7%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[1], <rr0=w6
ins v5.s[1], w6

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[2], <vv0=int64#6%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[2], <vv0=w5
ins v5.s[2], w5

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[3], <ss0=int64#8%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[3], <ss0=w7
ins v5.s[3], w7

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[0], <uu1=int64#1%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[0], <uu1=w0
ins v6.s[0], w0

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[1], <rr1=int64#3%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[1], <rr1=w2
ins v6.s[1], w2

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[2], <vv1=int64#2%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[2], <vv1=w1
ins v6.s[2], w1

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[3], <ss1=int64#4%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[3], <ss1=w3
ins v6.s[3], w3

# qhasm: reg128 vec_uuhat_rrhat_vvhat_sshat

# qhasm: reg128 vec_uuhat_rrhat

# qhasm: reg128 vec_vvhat_sshat

# qhasm: 4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31
# asm 1: sshr >vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, #31
# asm 2: sshr >vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uu1_rr1_vv1_ss1=v6.4s, #31
sshr v7.4s, v6.4s, #31

# qhasm: 4x vec_uuhat_rrhat = vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[1/4] vec_uuhat_rrhat_vvhat_sshat[1/4]
# asm 1: zip1 >vec_uuhat_rrhat=reg128#17.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s
# asm 2: zip1 >vec_uuhat_rrhat=v16.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s
zip1 v16.4s, v7.4s, v7.4s

# qhasm: 4x vec_vvhat_sshat = vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[3/4] vec_uuhat_rrhat_vvhat_sshat[3/4]
# asm 1: zip2 >vec_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s
# asm 2: zip2 >vec_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s
zip2 v7.4s, v7.4s, v7.4s

# qhasm: reg128 vec_prod

# qhasm: 2x vec_prod = 0
# asm 1: movi >vec_prod=reg128#9.2d, #0
# asm 2: movi >vec_prod=v8.2d, #0
movi v8.2d, #0

# qhasm: reg128 vec_2x_2p30m1

# qhasm: int64 2p30m1

# qhasm: 2p30m1 = 1073741823
# asm 1: mov >2p30m1=int64#1, #1073741823
# asm 2: mov >2p30m1=x0, #1073741823
mov x0, #1073741823

# qhasm: 2x vec_2x_2p30m1 = 2p30m1
# asm 1: dup <vec_2x_2p30m1=reg128#10.2d, <2p30m1=int64#1
# asm 2: dup <vec_2x_2p30m1=v9.2d, <2p30m1=x0
dup v9.2d, x0

# qhasm: int64 2p30m19

# qhasm: int64 2p15m1

# qhasm: reg128 vec_2x_2p30m19

# qhasm: reg128 vec_2x_2p15m1

# qhasm: 2p30m19 = 2p30m1 - 18
# asm 1: sub >2p30m19=int64#2,<2p30m1=int64#1,#18
# asm 2: sub >2p30m19=x1,<2p30m1=x0,#18
sub x1,x0,#18

# qhasm: 2p15m1 = 2p30m1 unsigned>> 15
# asm 1: lsr >2p15m1=int64#1, <2p30m1=int64#1, #15
# asm 2: lsr >2p15m1=x0, <2p30m1=x0, #15
lsr x0, x0, #15

# qhasm: 2x vec_2x_2p30m19 = 2p30m19
# asm 1: dup <vec_2x_2p30m19=reg128#11.2d, <2p30m19=int64#2
# asm 2: dup <vec_2x_2p30m19=v10.2d, <2p30m19=x1
dup v10.2d, x1

# qhasm: 2x vec_2x_2p15m1 = 2p15m1
# asm 1: dup <vec_2x_2p15m1=reg128#12.2d, <2p15m1=int64#1
# asm 2: dup <vec_2x_2p15m1=v11.2d, <2p15m1=x0
dup v11.2d, x0

# qhasm: reg128 vec_uuV0_0_rrV0_0

# qhasm: reg128 vec_uuV1_0_rrV1_0

# qhasm: reg128 vec_uuV2_0_rrV2_0

# qhasm: reg128 vec_uuV3_0_rrV3_0

# qhasm: reg128 vec_uuV4_0_rrV4_0

# qhasm: reg128 vec_uuV5_0_rrV5_0

# qhasm: reg128 vec_uuV6_0_rrV6_0

# qhasm: reg128 vec_uuV7_0_rrV7_0

# qhasm: reg128 vec_uuV8_0_rrV8_0

# qhasm: reg128 vec_uuV9_0_rrV9_0

# qhasm: reg128 vec_uuV10_0_rrV10_0

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[0/4]
# asm 1: umlal <vec_prod=reg128#9.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V0_V1_S0_S1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v8.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V0_V1_S0_S1=v0.s[0]
umlal v8.2d, v5.2s, v0.s[0]

# qhasm: vec_uuV0_0_rrV0_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV0_0_rrV0_0=reg128#13.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV0_0_rrV0_0=v12.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v12.16b, v8.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: ushr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
ushr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[1/4]
# asm 1: umlal <vec_prod=reg128#9.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V0_V1_S0_S1=reg128#1.s[1]
# asm 2: umlal <vec_prod=v8.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V0_V1_S0_S1=v0.s[1]
umlal v8.2d, v5.2s, v0.s[1]

# qhasm: vec_uuV1_0_rrV1_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV1_0_rrV1_0=reg128#14.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV1_0_rrV1_0=v13.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v13.16b, v8.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: ushr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
ushr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[0/4]
# asm 1: umlal <vec_prod=reg128#9.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V2_V3_S2_S3=reg128#2.s[0]
# asm 2: umlal <vec_prod=v8.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V2_V3_S2_S3=v1.s[0]
umlal v8.2d, v5.2s, v1.s[0]

# qhasm: vec_uuV2_0_rrV2_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV2_0_rrV2_0=reg128#15.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV2_0_rrV2_0=v14.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v14.16b, v8.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: ushr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
ushr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[1/4]
# asm 1: umlal <vec_prod=reg128#9.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V2_V3_S2_S3=reg128#2.s[1]
# asm 2: umlal <vec_prod=v8.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V2_V3_S2_S3=v1.s[1]
umlal v8.2d, v5.2s, v1.s[1]

# qhasm: vec_uuV3_0_rrV3_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV3_0_rrV3_0=reg128#16.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV3_0_rrV3_0=v15.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v15.16b, v8.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: ushr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
ushr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[0/4]
# asm 1: umlal <vec_prod=reg128#9.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V4_V5_S4_S5=reg128#3.s[0]
# asm 2: umlal <vec_prod=v8.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V4_V5_S4_S5=v2.s[0]
umlal v8.2d, v5.2s, v2.s[0]

# qhasm: vec_uuV4_0_rrV4_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV4_0_rrV4_0=reg128#18.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV4_0_rrV4_0=v17.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v17.16b, v8.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: ushr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
ushr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[1/4]
# asm 1: umlal <vec_prod=reg128#9.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V4_V5_S4_S5=reg128#3.s[1]
# asm 2: umlal <vec_prod=v8.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V4_V5_S4_S5=v2.s[1]
umlal v8.2d, v5.2s, v2.s[1]

# qhasm: vec_uuV5_0_rrV5_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV5_0_rrV5_0=reg128#19.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV5_0_rrV5_0=v18.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v18.16b, v8.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: ushr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
ushr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[0/4]
# asm 1: umlal <vec_prod=reg128#9.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V6_V7_S6_S7=reg128#4.s[0]
# asm 2: umlal <vec_prod=v8.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V6_V7_S6_S7=v3.s[0]
umlal v8.2d, v5.2s, v3.s[0]

# qhasm: vec_uuV6_0_rrV6_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV6_0_rrV6_0=reg128#20.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV6_0_rrV6_0=v19.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v19.16b, v8.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: ushr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
ushr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[1/4]
# asm 1: umlal <vec_prod=reg128#9.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V6_V7_S6_S7=reg128#4.s[1]
# asm 2: umlal <vec_prod=v8.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V6_V7_S6_S7=v3.s[1]
umlal v8.2d, v5.2s, v3.s[1]

# qhasm: vec_uuV7_0_rrV7_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV7_0_rrV7_0=reg128#21.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV7_0_rrV7_0=v20.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v20.16b, v8.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: ushr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
ushr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V8_0_S8_0[0/4]
# asm 1: umlal <vec_prod=reg128#9.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V8_0_S8_0=reg128#5.s[0]
# asm 2: umlal <vec_prod=v8.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V8_0_S8_0=v4.s[0]
umlal v8.2d, v5.2s, v4.s[0]

# qhasm: vec_uuV8_0_rrV8_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV8_0_rrV8_0=reg128#6.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV8_0_rrV8_0=v5.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v5.16b, v8.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: ushr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
ushr v8.2d, v8.2d, #30

# qhasm: vec_uuV9_0_rrV9_0 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_uuV9_0_rrV9_0=reg128#9.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_uuV9_0_rrV9_0=v8.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v9.16b
and v8.16b, v8.16b, v9.16b

# qhasm: reg128 vec_l0 

# qhasm: reg128 vec_M

# qhasm: reg128 vec_4x_2p30m1

# qhasm: int64 M

# qhasm: 4x vec_4x_2p30m1 = vec_2x_2p30m1[0]
# asm 1: dup <vec_4x_2p30m1=reg128#22.4s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: dup <vec_4x_2p30m1=v21.4s, <vec_2x_2p30m1=v9.s[0]
dup v21.4s, v9.s[0]

# qhasm: M = 678152731
# asm 1: mov >M=int64#1, #678152731
# asm 2: mov >M=x0, #678152731
mov x0, #678152731

# qhasm: 2x vec_M = M
# asm 1: dup <vec_M=reg128#22.2d, <M=int64#1
# asm 2: dup <vec_M=v21.2d, <M=x0
dup v21.2d, x0

# qhasm: 4x vec_l0 = vec_uuV0_0_rrV0_0 * vec_M
# asm 1: mul >vec_l0=reg128#23.4s,<vec_uuV0_0_rrV0_0=reg128#13.4s,<vec_M=reg128#22.4s
# asm 2: mul >vec_l0=v22.4s,<vec_uuV0_0_rrV0_0=v12.4s,<vec_M=v21.4s
mul v22.4s,v12.4s,v21.4s

# qhasm: vec_l0 &= vec_2x_2p30m1
# asm 1: and <vec_l0=reg128#23.16b, <vec_l0=reg128#23.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_l0=v22.16b, <vec_l0=v22.16b, <vec_2x_2p30m1=v9.16b
and v22.16b, v22.16b, v9.16b

# qhasm: 4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4] 
# asm 1: uzp1 >vec_l0=reg128#23.4s, <vec_l0=reg128#23.4s, <vec_l0=reg128#23.4s
# asm 2: uzp1 >vec_l0=v22.4s, <vec_l0=v22.4s, <vec_l0=v22.4s
uzp1 v22.4s, v22.4s, v22.4s

# qhasm: reg128 vec_buf

# qhasm: 2x vec_prod = 0
# asm 1: movi >vec_prod=reg128#24.2d, #0
# asm 2: movi >vec_prod=v23.2d, #0
movi v23.2d, #0

# qhasm: 2x vec_buf = 0
# asm 1: movi >vec_buf=reg128#25.2d, #0
# asm 2: movi >vec_buf=v24.2d, #0
movi v24.2d, #0

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod=reg128#24.2d, <vec_l0=reg128#23.2s, <vec_2x_2p30m19=reg128#11.s[0]
# asm 2: umlal <vec_prod=v23.2d, <vec_l0=v22.2s, <vec_2x_2p30m19=v10.s[0]
umlal v23.2d, v22.2s, v10.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#26.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v25.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v25.16b, v23.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#24.2d, <vec_prod=reg128#24.2d, #30
# asm 2: ushr >vec_prod=v23.2d, <vec_prod=v23.2d, #30
ushr v23.2d, v23.2d, #30

# qhasm: 2x vec_uuV0_0_rrV0_0 += vec_buf
# asm 1: add <vec_uuV0_0_rrV0_0=reg128#13.2d, <vec_uuV0_0_rrV0_0=reg128#13.2d, <vec_buf=reg128#26.2d
# asm 2: add <vec_uuV0_0_rrV0_0=v12.2d, <vec_uuV0_0_rrV0_0=v12.2d, <vec_buf=v25.2d
add v12.2d, v12.2d, v25.2d

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#24.2d, <vec_l0=reg128#23.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v23.2d, <vec_l0=v22.2s, <vec_2x_2p30m1=v9.s[0]
umlal v23.2d, v22.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#26.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v25.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v25.16b, v23.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#24.2d, <vec_prod=reg128#24.2d, #30
# asm 2: ushr >vec_prod=v23.2d, <vec_prod=v23.2d, #30
ushr v23.2d, v23.2d, #30

# qhasm: 2x vec_uuV1_0_rrV1_0 += vec_buf
# asm 1: add <vec_uuV1_0_rrV1_0=reg128#14.2d, <vec_uuV1_0_rrV1_0=reg128#14.2d, <vec_buf=reg128#26.2d
# asm 2: add <vec_uuV1_0_rrV1_0=v13.2d, <vec_uuV1_0_rrV1_0=v13.2d, <vec_buf=v25.2d
add v13.2d, v13.2d, v25.2d

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#24.2d, <vec_l0=reg128#23.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v23.2d, <vec_l0=v22.2s, <vec_2x_2p30m1=v9.s[0]
umlal v23.2d, v22.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#26.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v25.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v25.16b, v23.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#24.2d, <vec_prod=reg128#24.2d, #30
# asm 2: ushr >vec_prod=v23.2d, <vec_prod=v23.2d, #30
ushr v23.2d, v23.2d, #30

# qhasm: 2x vec_uuV2_0_rrV2_0 += vec_buf
# asm 1: add <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_buf=reg128#26.2d
# asm 2: add <vec_uuV2_0_rrV2_0=v14.2d, <vec_uuV2_0_rrV2_0=v14.2d, <vec_buf=v25.2d
add v14.2d, v14.2d, v25.2d

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#24.2d, <vec_l0=reg128#23.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v23.2d, <vec_l0=v22.2s, <vec_2x_2p30m1=v9.s[0]
umlal v23.2d, v22.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#26.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v25.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v25.16b, v23.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#24.2d, <vec_prod=reg128#24.2d, #30
# asm 2: ushr >vec_prod=v23.2d, <vec_prod=v23.2d, #30
ushr v23.2d, v23.2d, #30

# qhasm: 2x vec_uuV3_0_rrV3_0 += vec_buf
# asm 1: add <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_buf=reg128#26.2d
# asm 2: add <vec_uuV3_0_rrV3_0=v15.2d, <vec_uuV3_0_rrV3_0=v15.2d, <vec_buf=v25.2d
add v15.2d, v15.2d, v25.2d

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#24.2d, <vec_l0=reg128#23.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v23.2d, <vec_l0=v22.2s, <vec_2x_2p30m1=v9.s[0]
umlal v23.2d, v22.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#26.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v25.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v25.16b, v23.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#24.2d, <vec_prod=reg128#24.2d, #30
# asm 2: ushr >vec_prod=v23.2d, <vec_prod=v23.2d, #30
ushr v23.2d, v23.2d, #30

# qhasm: 2x vec_uuV4_0_rrV4_0 += vec_buf
# asm 1: add <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_buf=reg128#26.2d
# asm 2: add <vec_uuV4_0_rrV4_0=v17.2d, <vec_uuV4_0_rrV4_0=v17.2d, <vec_buf=v25.2d
add v17.2d, v17.2d, v25.2d

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#24.2d, <vec_l0=reg128#23.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v23.2d, <vec_l0=v22.2s, <vec_2x_2p30m1=v9.s[0]
umlal v23.2d, v22.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#26.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v25.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v25.16b, v23.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#24.2d, <vec_prod=reg128#24.2d, #30
# asm 2: ushr >vec_prod=v23.2d, <vec_prod=v23.2d, #30
ushr v23.2d, v23.2d, #30

# qhasm: 2x vec_uuV5_0_rrV5_0 += vec_buf
# asm 1: add <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_buf=reg128#26.2d
# asm 2: add <vec_uuV5_0_rrV5_0=v18.2d, <vec_uuV5_0_rrV5_0=v18.2d, <vec_buf=v25.2d
add v18.2d, v18.2d, v25.2d

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#24.2d, <vec_l0=reg128#23.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v23.2d, <vec_l0=v22.2s, <vec_2x_2p30m1=v9.s[0]
umlal v23.2d, v22.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#26.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v25.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v25.16b, v23.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#24.2d, <vec_prod=reg128#24.2d, #30
# asm 2: ushr >vec_prod=v23.2d, <vec_prod=v23.2d, #30
ushr v23.2d, v23.2d, #30

# qhasm: 2x vec_uuV6_0_rrV6_0 += vec_buf
# asm 1: add <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_buf=reg128#26.2d
# asm 2: add <vec_uuV6_0_rrV6_0=v19.2d, <vec_uuV6_0_rrV6_0=v19.2d, <vec_buf=v25.2d
add v19.2d, v19.2d, v25.2d

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#24.2d, <vec_l0=reg128#23.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v23.2d, <vec_l0=v22.2s, <vec_2x_2p30m1=v9.s[0]
umlal v23.2d, v22.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#26.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v25.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v25.16b, v23.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#24.2d, <vec_prod=reg128#24.2d, #30
# asm 2: ushr >vec_prod=v23.2d, <vec_prod=v23.2d, #30
ushr v23.2d, v23.2d, #30

# qhasm: 2x vec_uuV7_0_rrV7_0 += vec_buf
# asm 1: add <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_buf=reg128#26.2d
# asm 2: add <vec_uuV7_0_rrV7_0=v20.2d, <vec_uuV7_0_rrV7_0=v20.2d, <vec_buf=v25.2d
add v20.2d, v20.2d, v25.2d

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p15m1[0/4]
# asm 1: umlal <vec_prod=reg128#24.2d, <vec_l0=reg128#23.2s, <vec_2x_2p15m1=reg128#12.s[0]
# asm 2: umlal <vec_prod=v23.2d, <vec_l0=v22.2s, <vec_2x_2p15m1=v11.s[0]
umlal v23.2d, v22.2s, v11.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#23.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v22.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v22.16b, v23.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#24.2d, <vec_prod=reg128#24.2d, #30
# asm 2: ushr >vec_prod=v23.2d, <vec_prod=v23.2d, #30
ushr v23.2d, v23.2d, #30

# qhasm: 2x vec_uuV8_0_rrV8_0 += vec_buf
# asm 1: add <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_buf=reg128#23.2d
# asm 2: add <vec_uuV8_0_rrV8_0=v5.2d, <vec_uuV8_0_rrV8_0=v5.2d, <vec_buf=v22.2d
add v5.2d, v5.2d, v22.2d

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#23.16b, <vec_prod=reg128#24.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v22.16b, <vec_prod=v23.16b, <vec_2x_2p30m1=v9.16b
and v22.16b, v23.16b, v9.16b

# qhasm: 2x vec_uuV9_0_rrV9_0 += vec_buf
# asm 1: add <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_buf=reg128#23.2d
# asm 2: add <vec_uuV9_0_rrV9_0=v8.2d, <vec_uuV9_0_rrV9_0=v8.2d, <vec_buf=v22.2d
add v8.2d, v8.2d, v22.2d

# qhasm: reg128 vec_carry

# qhasm: 2x vec_carry = 0
# asm 1: movi >vec_carry=reg128#23.2d, #0
# asm 2: movi >vec_carry=v22.2d, #0
movi v22.2d, #0

# qhasm: 2x vec_carry = vec_uuV0_0_rrV0_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#24.2d, <vec_uuV0_0_rrV0_0=reg128#13.2d, #30
# asm 2: ushr >vec_carry=v23.2d, <vec_uuV0_0_rrV0_0=v12.2d, #30
ushr v23.2d, v12.2d, #30

# qhasm: vec_uuV0_0_rrV0_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV0_0_rrV0_0=reg128#13.16b, <vec_uuV0_0_rrV0_0=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV0_0_rrV0_0=v12.16b, <vec_uuV0_0_rrV0_0=v12.16b, <vec_2x_2p30m1=v9.16b
and v12.16b, v12.16b, v9.16b

# qhasm: 2x vec_uuV1_0_rrV1_0 += vec_carry
# asm 1: add <vec_uuV1_0_rrV1_0=reg128#14.2d, <vec_uuV1_0_rrV1_0=reg128#14.2d, <vec_carry=reg128#24.2d
# asm 2: add <vec_uuV1_0_rrV1_0=v13.2d, <vec_uuV1_0_rrV1_0=v13.2d, <vec_carry=v23.2d
add v13.2d, v13.2d, v23.2d

# qhasm: 2x vec_carry = vec_uuV1_0_rrV1_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#13.2d, <vec_uuV1_0_rrV1_0=reg128#14.2d, #30
# asm 2: ushr >vec_carry=v12.2d, <vec_uuV1_0_rrV1_0=v13.2d, #30
ushr v12.2d, v13.2d, #30

# qhasm: vec_uuV1_0_rrV1_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV1_0_rrV1_0=reg128#14.16b, <vec_uuV1_0_rrV1_0=reg128#14.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV1_0_rrV1_0=v13.16b, <vec_uuV1_0_rrV1_0=v13.16b, <vec_2x_2p30m1=v9.16b
and v13.16b, v13.16b, v9.16b

# qhasm: 2x vec_uuV2_0_rrV2_0 += vec_carry
# asm 1: add <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_carry=reg128#13.2d
# asm 2: add <vec_uuV2_0_rrV2_0=v14.2d, <vec_uuV2_0_rrV2_0=v14.2d, <vec_carry=v12.2d
add v14.2d, v14.2d, v12.2d

# qhasm: 2x vec_carry = vec_uuV2_0_rrV2_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#13.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d, #30
# asm 2: ushr >vec_carry=v12.2d, <vec_uuV2_0_rrV2_0=v14.2d, #30
ushr v12.2d, v14.2d, #30

# qhasm: vec_uuV2_0_rrV2_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV2_0_rrV2_0=reg128#15.16b, <vec_uuV2_0_rrV2_0=reg128#15.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV2_0_rrV2_0=v14.16b, <vec_uuV2_0_rrV2_0=v14.16b, <vec_2x_2p30m1=v9.16b
and v14.16b, v14.16b, v9.16b

# qhasm: 2x vec_uuV3_0_rrV3_0 += vec_carry
# asm 1: add <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_carry=reg128#13.2d
# asm 2: add <vec_uuV3_0_rrV3_0=v15.2d, <vec_uuV3_0_rrV3_0=v15.2d, <vec_carry=v12.2d
add v15.2d, v15.2d, v12.2d

# qhasm: 2x vec_carry = vec_uuV3_0_rrV3_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#13.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d, #30
# asm 2: ushr >vec_carry=v12.2d, <vec_uuV3_0_rrV3_0=v15.2d, #30
ushr v12.2d, v15.2d, #30

# qhasm: vec_uuV3_0_rrV3_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV3_0_rrV3_0=reg128#16.16b, <vec_uuV3_0_rrV3_0=reg128#16.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV3_0_rrV3_0=v15.16b, <vec_uuV3_0_rrV3_0=v15.16b, <vec_2x_2p30m1=v9.16b
and v15.16b, v15.16b, v9.16b

# qhasm: 2x vec_uuV4_0_rrV4_0 += vec_carry
# asm 1: add <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_carry=reg128#13.2d
# asm 2: add <vec_uuV4_0_rrV4_0=v17.2d, <vec_uuV4_0_rrV4_0=v17.2d, <vec_carry=v12.2d
add v17.2d, v17.2d, v12.2d

# qhasm: 2x vec_carry = vec_uuV4_0_rrV4_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#13.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d, #30
# asm 2: ushr >vec_carry=v12.2d, <vec_uuV4_0_rrV4_0=v17.2d, #30
ushr v12.2d, v17.2d, #30

# qhasm: vec_uuV4_0_rrV4_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV4_0_rrV4_0=reg128#18.16b, <vec_uuV4_0_rrV4_0=reg128#18.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV4_0_rrV4_0=v17.16b, <vec_uuV4_0_rrV4_0=v17.16b, <vec_2x_2p30m1=v9.16b
and v17.16b, v17.16b, v9.16b

# qhasm: 2x vec_uuV5_0_rrV5_0 += vec_carry
# asm 1: add <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_carry=reg128#13.2d
# asm 2: add <vec_uuV5_0_rrV5_0=v18.2d, <vec_uuV5_0_rrV5_0=v18.2d, <vec_carry=v12.2d
add v18.2d, v18.2d, v12.2d

# qhasm: 2x vec_carry = vec_uuV5_0_rrV5_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#13.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d, #30
# asm 2: ushr >vec_carry=v12.2d, <vec_uuV5_0_rrV5_0=v18.2d, #30
ushr v12.2d, v18.2d, #30

# qhasm: vec_uuV5_0_rrV5_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV5_0_rrV5_0=reg128#19.16b, <vec_uuV5_0_rrV5_0=reg128#19.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV5_0_rrV5_0=v18.16b, <vec_uuV5_0_rrV5_0=v18.16b, <vec_2x_2p30m1=v9.16b
and v18.16b, v18.16b, v9.16b

# qhasm: 2x vec_uuV6_0_rrV6_0 += vec_carry
# asm 1: add <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_carry=reg128#13.2d
# asm 2: add <vec_uuV6_0_rrV6_0=v19.2d, <vec_uuV6_0_rrV6_0=v19.2d, <vec_carry=v12.2d
add v19.2d, v19.2d, v12.2d

# qhasm: 2x vec_carry = vec_uuV6_0_rrV6_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#13.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d, #30
# asm 2: ushr >vec_carry=v12.2d, <vec_uuV6_0_rrV6_0=v19.2d, #30
ushr v12.2d, v19.2d, #30

# qhasm: vec_uuV6_0_rrV6_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV6_0_rrV6_0=reg128#20.16b, <vec_uuV6_0_rrV6_0=reg128#20.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV6_0_rrV6_0=v19.16b, <vec_uuV6_0_rrV6_0=v19.16b, <vec_2x_2p30m1=v9.16b
and v19.16b, v19.16b, v9.16b

# qhasm: 2x vec_uuV7_0_rrV7_0 += vec_carry
# asm 1: add <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_carry=reg128#13.2d
# asm 2: add <vec_uuV7_0_rrV7_0=v20.2d, <vec_uuV7_0_rrV7_0=v20.2d, <vec_carry=v12.2d
add v20.2d, v20.2d, v12.2d

# qhasm: 2x vec_carry = vec_uuV7_0_rrV7_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#13.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d, #30
# asm 2: ushr >vec_carry=v12.2d, <vec_uuV7_0_rrV7_0=v20.2d, #30
ushr v12.2d, v20.2d, #30

# qhasm: vec_uuV7_0_rrV7_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV7_0_rrV7_0=reg128#21.16b, <vec_uuV7_0_rrV7_0=reg128#21.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV7_0_rrV7_0=v20.16b, <vec_uuV7_0_rrV7_0=v20.16b, <vec_2x_2p30m1=v9.16b
and v20.16b, v20.16b, v9.16b

# qhasm: 2x vec_uuV8_0_rrV8_0 += vec_carry
# asm 1: add <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_carry=reg128#13.2d
# asm 2: add <vec_uuV8_0_rrV8_0=v5.2d, <vec_uuV8_0_rrV8_0=v5.2d, <vec_carry=v12.2d
add v5.2d, v5.2d, v12.2d

# qhasm: 2x vec_carry = vec_uuV8_0_rrV8_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#13.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d, #30
# asm 2: ushr >vec_carry=v12.2d, <vec_uuV8_0_rrV8_0=v5.2d, #30
ushr v12.2d, v5.2d, #30

# qhasm: vec_uuV8_0_rrV8_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV8_0_rrV8_0=reg128#6.16b, <vec_uuV8_0_rrV8_0=reg128#6.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV8_0_rrV8_0=v5.16b, <vec_uuV8_0_rrV8_0=v5.16b, <vec_2x_2p30m1=v9.16b
and v5.16b, v5.16b, v9.16b

# qhasm: 2x vec_uuV9_0_rrV9_0 += vec_carry
# asm 1: add <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_carry=reg128#13.2d
# asm 2: add <vec_uuV9_0_rrV9_0=v8.2d, <vec_uuV9_0_rrV9_0=v8.2d, <vec_carry=v12.2d
add v8.2d, v8.2d, v12.2d

# qhasm: 2x vec_prod = 0
# asm 1: movi >vec_prod=reg128#24.2d, #0
# asm 2: movi >vec_prod=v23.2d, #0
movi v23.2d, #0

# qhasm: 2x vec_buf = 0
# asm 1: movi >vec_buf=reg128#26.2d, #0
# asm 2: movi >vec_buf=v25.2d, #0
movi v25.2d, #0

# qhasm: 2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[0/4]
# asm 1: umull >vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V0_V1_S0_S1=reg128#1.s[0]
# asm 2: umull >vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V0_V1_S0_S1=v0.s[0]
umull v12.2d, v6.2s, v0.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#27.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v26.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v26.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#28.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v27.2d, <vec_prod=v12.2d, #30
ushr v27.2d, v12.2d, #30

# qhasm: 2x vec_uuV1_0_rrV1_0 += vec_buf
# asm 1: add <vec_uuV1_0_rrV1_0=reg128#14.2d, <vec_uuV1_0_rrV1_0=reg128#14.2d, <vec_buf=reg128#27.2d
# asm 2: add <vec_uuV1_0_rrV1_0=v13.2d, <vec_uuV1_0_rrV1_0=v13.2d, <vec_buf=v26.2d
add v13.2d, v13.2d, v26.2d

# qhasm: 2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[1/4]
# asm 1: umull >vec_prod=reg128#1.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V0_V1_S0_S1=reg128#1.s[1]
# asm 2: umull >vec_prod=v0.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V0_V1_S0_S1=v0.s[1]
umull v0.2d, v6.2s, v0.s[1]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#13.16b, <vec_prod=reg128#1.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v12.16b, <vec_prod=v0.16b, <vec_2x_2p30m1=v9.16b
and v12.16b, v0.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: ushr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
ushr v0.2d, v0.2d, #30

# qhasm: 2x vec_uuV2_0_rrV2_0 += vec_buf
# asm 1: add <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_buf=reg128#13.2d
# asm 2: add <vec_uuV2_0_rrV2_0=v14.2d, <vec_uuV2_0_rrV2_0=v14.2d, <vec_buf=v12.2d
add v14.2d, v14.2d, v12.2d

# qhasm: 2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[0/4]
# asm 1: umull >vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V2_V3_S2_S3=reg128#2.s[0]
# asm 2: umull >vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V2_V3_S2_S3=v1.s[0]
umull v12.2d, v6.2s, v1.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#27.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v26.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v26.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#29.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v28.2d, <vec_prod=v12.2d, #30
ushr v28.2d, v12.2d, #30

# qhasm: 2x vec_uuV3_0_rrV3_0 += vec_buf
# asm 1: add <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_buf=reg128#27.2d
# asm 2: add <vec_uuV3_0_rrV3_0=v15.2d, <vec_uuV3_0_rrV3_0=v15.2d, <vec_buf=v26.2d
add v15.2d, v15.2d, v26.2d

# qhasm: 2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[1/4]
# asm 1: umull >vec_prod=reg128#2.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V2_V3_S2_S3=reg128#2.s[1]
# asm 2: umull >vec_prod=v1.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V2_V3_S2_S3=v1.s[1]
umull v1.2d, v6.2s, v1.s[1]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#13.16b, <vec_prod=reg128#2.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v12.16b, <vec_prod=v1.16b, <vec_2x_2p30m1=v9.16b
and v12.16b, v1.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#2.2d, <vec_prod=reg128#2.2d, #30
# asm 2: ushr >vec_prod=v1.2d, <vec_prod=v1.2d, #30
ushr v1.2d, v1.2d, #30

# qhasm: 2x vec_uuV4_0_rrV4_0 += vec_buf
# asm 1: add <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_buf=reg128#13.2d
# asm 2: add <vec_uuV4_0_rrV4_0=v17.2d, <vec_uuV4_0_rrV4_0=v17.2d, <vec_buf=v12.2d
add v17.2d, v17.2d, v12.2d

# qhasm: 2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[0/4]
# asm 1: umull >vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V4_V5_S4_S5=reg128#3.s[0]
# asm 2: umull >vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V4_V5_S4_S5=v2.s[0]
umull v12.2d, v6.2s, v2.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#27.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v26.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v26.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#30.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v29.2d, <vec_prod=v12.2d, #30
ushr v29.2d, v12.2d, #30

# qhasm: 2x vec_uuV5_0_rrV5_0 += vec_buf
# asm 1: add <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_buf=reg128#27.2d
# asm 2: add <vec_uuV5_0_rrV5_0=v18.2d, <vec_uuV5_0_rrV5_0=v18.2d, <vec_buf=v26.2d
add v18.2d, v18.2d, v26.2d

# qhasm: 2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[1/4]
# asm 1: umull >vec_prod=reg128#3.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V4_V5_S4_S5=reg128#3.s[1]
# asm 2: umull >vec_prod=v2.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V4_V5_S4_S5=v2.s[1]
umull v2.2d, v6.2s, v2.s[1]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#13.16b, <vec_prod=reg128#3.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v12.16b, <vec_prod=v2.16b, <vec_2x_2p30m1=v9.16b
and v12.16b, v2.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#3.2d, <vec_prod=reg128#3.2d, #30
# asm 2: ushr >vec_prod=v2.2d, <vec_prod=v2.2d, #30
ushr v2.2d, v2.2d, #30

# qhasm: 2x vec_uuV6_0_rrV6_0 += vec_buf
# asm 1: add <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_buf=reg128#13.2d
# asm 2: add <vec_uuV6_0_rrV6_0=v19.2d, <vec_uuV6_0_rrV6_0=v19.2d, <vec_buf=v12.2d
add v19.2d, v19.2d, v12.2d

# qhasm: 2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[0/4]
# asm 1: umull >vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V6_V7_S6_S7=reg128#4.s[0]
# asm 2: umull >vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V6_V7_S6_S7=v3.s[0]
umull v12.2d, v6.2s, v3.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#27.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v26.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v26.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#31.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v30.2d, <vec_prod=v12.2d, #30
ushr v30.2d, v12.2d, #30

# qhasm: 2x vec_uuV7_0_rrV7_0 += vec_buf
# asm 1: add <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_buf=reg128#27.2d
# asm 2: add <vec_uuV7_0_rrV7_0=v20.2d, <vec_uuV7_0_rrV7_0=v20.2d, <vec_buf=v26.2d
add v20.2d, v20.2d, v26.2d

# qhasm: 2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[1/4]
# asm 1: umull >vec_prod=reg128#4.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V6_V7_S6_S7=reg128#4.s[1]
# asm 2: umull >vec_prod=v3.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V6_V7_S6_S7=v3.s[1]
umull v3.2d, v6.2s, v3.s[1]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#13.16b, <vec_prod=reg128#4.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v12.16b, <vec_prod=v3.16b, <vec_2x_2p30m1=v9.16b
and v12.16b, v3.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#4.2d, <vec_prod=reg128#4.2d, #30
# asm 2: ushr >vec_prod=v3.2d, <vec_prod=v3.2d, #30
ushr v3.2d, v3.2d, #30

# qhasm: 2x vec_uuV8_0_rrV8_0 += vec_buf
# asm 1: add <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_buf=reg128#13.2d
# asm 2: add <vec_uuV8_0_rrV8_0=v5.2d, <vec_uuV8_0_rrV8_0=v5.2d, <vec_buf=v12.2d
add v5.2d, v5.2d, v12.2d

# qhasm: 2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V8_0_S8_0[0/4]
# asm 1: umull >vec_prod=reg128#5.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V8_0_S8_0=reg128#5.s[0]
# asm 2: umull >vec_prod=v4.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V8_0_S8_0=v4.s[0]
umull v4.2d, v6.2s, v4.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#7.16b, <vec_prod=reg128#5.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v6.16b, <vec_prod=v4.16b, <vec_2x_2p30m1=v9.16b
and v6.16b, v4.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#5.2d, <vec_prod=reg128#5.2d, #30
# asm 2: ushr >vec_prod=v4.2d, <vec_prod=v4.2d, #30
ushr v4.2d, v4.2d, #30

# qhasm: 2x vec_uuV9_0_rrV9_0 += vec_buf
# asm 1: add <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_buf=reg128#7.2d
# asm 2: add <vec_uuV9_0_rrV9_0=v8.2d, <vec_uuV9_0_rrV9_0=v8.2d, <vec_buf=v6.2d
add v8.2d, v8.2d, v6.2d

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#5.16b, <vec_prod=reg128#5.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v4.16b, <vec_prod=v4.16b, <vec_2x_2p30m1=v9.16b
and v4.16b, v4.16b, v9.16b

# qhasm: 2x vec_uuV10_0_rrV10_0 += vec_buf
# asm 1: add <vec_uuV10_0_rrV10_0=reg128#7.2d, <vec_uuV10_0_rrV10_0=reg128#7.2d, <vec_buf=reg128#5.2d
# asm 2: add <vec_uuV10_0_rrV10_0=v6.2d, <vec_uuV10_0_rrV10_0=v6.2d, <vec_buf=v4.2d
add v6.2d, v6.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV1_0_rrV1_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV1_0_rrV1_0=reg128#14.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV1_0_rrV1_0=v13.2d, #30
ushr v4.2d, v13.2d, #30

# qhasm: vec_uuV1_0_rrV1_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV1_0_rrV1_0=reg128#14.16b, <vec_uuV1_0_rrV1_0=reg128#14.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV1_0_rrV1_0=v13.16b, <vec_uuV1_0_rrV1_0=v13.16b, <vec_2x_2p30m1=v9.16b
and v13.16b, v13.16b, v9.16b

# qhasm: 2x vec_uuV2_0_rrV2_0 += vec_carry
# asm 1: add <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV2_0_rrV2_0=v14.2d, <vec_uuV2_0_rrV2_0=v14.2d, <vec_carry=v4.2d
add v14.2d, v14.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV2_0_rrV2_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV2_0_rrV2_0=v14.2d, #30
ushr v4.2d, v14.2d, #30

# qhasm: vec_uuV2_0_rrV2_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV2_0_rrV2_0=reg128#15.16b, <vec_uuV2_0_rrV2_0=reg128#15.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV2_0_rrV2_0=v14.16b, <vec_uuV2_0_rrV2_0=v14.16b, <vec_2x_2p30m1=v9.16b
and v14.16b, v14.16b, v9.16b

# qhasm: 2x vec_uuV3_0_rrV3_0 += vec_carry
# asm 1: add <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV3_0_rrV3_0=v15.2d, <vec_uuV3_0_rrV3_0=v15.2d, <vec_carry=v4.2d
add v15.2d, v15.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV3_0_rrV3_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV3_0_rrV3_0=v15.2d, #30
ushr v4.2d, v15.2d, #30

# qhasm: vec_uuV3_0_rrV3_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV3_0_rrV3_0=reg128#16.16b, <vec_uuV3_0_rrV3_0=reg128#16.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV3_0_rrV3_0=v15.16b, <vec_uuV3_0_rrV3_0=v15.16b, <vec_2x_2p30m1=v9.16b
and v15.16b, v15.16b, v9.16b

# qhasm: 2x vec_uuV4_0_rrV4_0 += vec_carry
# asm 1: add <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV4_0_rrV4_0=v17.2d, <vec_uuV4_0_rrV4_0=v17.2d, <vec_carry=v4.2d
add v17.2d, v17.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV4_0_rrV4_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV4_0_rrV4_0=v17.2d, #30
ushr v4.2d, v17.2d, #30

# qhasm: vec_uuV4_0_rrV4_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV4_0_rrV4_0=reg128#18.16b, <vec_uuV4_0_rrV4_0=reg128#18.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV4_0_rrV4_0=v17.16b, <vec_uuV4_0_rrV4_0=v17.16b, <vec_2x_2p30m1=v9.16b
and v17.16b, v17.16b, v9.16b

# qhasm: 2x vec_uuV5_0_rrV5_0 += vec_carry
# asm 1: add <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV5_0_rrV5_0=v18.2d, <vec_uuV5_0_rrV5_0=v18.2d, <vec_carry=v4.2d
add v18.2d, v18.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV5_0_rrV5_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV5_0_rrV5_0=v18.2d, #30
ushr v4.2d, v18.2d, #30

# qhasm: vec_uuV5_0_rrV5_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV5_0_rrV5_0=reg128#19.16b, <vec_uuV5_0_rrV5_0=reg128#19.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV5_0_rrV5_0=v18.16b, <vec_uuV5_0_rrV5_0=v18.16b, <vec_2x_2p30m1=v9.16b
and v18.16b, v18.16b, v9.16b

# qhasm: 2x vec_uuV6_0_rrV6_0 += vec_carry
# asm 1: add <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV6_0_rrV6_0=v19.2d, <vec_uuV6_0_rrV6_0=v19.2d, <vec_carry=v4.2d
add v19.2d, v19.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV6_0_rrV6_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV6_0_rrV6_0=v19.2d, #30
ushr v4.2d, v19.2d, #30

# qhasm: vec_uuV6_0_rrV6_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV6_0_rrV6_0=reg128#20.16b, <vec_uuV6_0_rrV6_0=reg128#20.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV6_0_rrV6_0=v19.16b, <vec_uuV6_0_rrV6_0=v19.16b, <vec_2x_2p30m1=v9.16b
and v19.16b, v19.16b, v9.16b

# qhasm: 2x vec_uuV7_0_rrV7_0 += vec_carry
# asm 1: add <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV7_0_rrV7_0=v20.2d, <vec_uuV7_0_rrV7_0=v20.2d, <vec_carry=v4.2d
add v20.2d, v20.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV7_0_rrV7_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV7_0_rrV7_0=v20.2d, #30
ushr v4.2d, v20.2d, #30

# qhasm: vec_uuV7_0_rrV7_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV7_0_rrV7_0=reg128#21.16b, <vec_uuV7_0_rrV7_0=reg128#21.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV7_0_rrV7_0=v20.16b, <vec_uuV7_0_rrV7_0=v20.16b, <vec_2x_2p30m1=v9.16b
and v20.16b, v20.16b, v9.16b

# qhasm: 2x vec_uuV8_0_rrV8_0 += vec_carry
# asm 1: add <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV8_0_rrV8_0=v5.2d, <vec_uuV8_0_rrV8_0=v5.2d, <vec_carry=v4.2d
add v5.2d, v5.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV8_0_rrV8_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV8_0_rrV8_0=v5.2d, #30
ushr v4.2d, v5.2d, #30

# qhasm: vec_uuV8_0_rrV8_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV8_0_rrV8_0=reg128#6.16b, <vec_uuV8_0_rrV8_0=reg128#6.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV8_0_rrV8_0=v5.16b, <vec_uuV8_0_rrV8_0=v5.16b, <vec_2x_2p30m1=v9.16b
and v5.16b, v5.16b, v9.16b

# qhasm: 2x vec_uuV9_0_rrV9_0 += vec_carry
# asm 1: add <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV9_0_rrV9_0=v8.2d, <vec_uuV9_0_rrV9_0=v8.2d, <vec_carry=v4.2d
add v8.2d, v8.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV9_0_rrV9_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV9_0_rrV9_0=reg128#9.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV9_0_rrV9_0=v8.2d, #30
ushr v4.2d, v8.2d, #30

# qhasm: vec_uuV9_0_rrV9_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV9_0_rrV9_0=reg128#9.16b, <vec_uuV9_0_rrV9_0=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV9_0_rrV9_0=v8.16b, <vec_uuV9_0_rrV9_0=v8.16b, <vec_2x_2p30m1=v9.16b
and v8.16b, v8.16b, v9.16b

# qhasm: 2x vec_uuV10_0_rrV10_0 += vec_carry
# asm 1: add <vec_uuV10_0_rrV10_0=reg128#7.2d, <vec_uuV10_0_rrV10_0=reg128#7.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV10_0_rrV10_0=v6.2d, <vec_uuV10_0_rrV10_0=v6.2d, <vec_carry=v4.2d
add v6.2d, v6.2d, v4.2d

# qhasm: reg128 vec_l1

# qhasm: 4x vec_l1 = vec_uuV1_0_rrV1_0 * vec_M
# asm 1: mul >vec_l1=reg128#5.4s,<vec_uuV1_0_rrV1_0=reg128#14.4s,<vec_M=reg128#22.4s
# asm 2: mul >vec_l1=v4.4s,<vec_uuV1_0_rrV1_0=v13.4s,<vec_M=v21.4s
mul v4.4s,v13.4s,v21.4s

# qhasm: vec_l1 &= vec_2x_2p30m1
# asm 1: and <vec_l1=reg128#5.16b, <vec_l1=reg128#5.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_l1=v4.16b, <vec_l1=v4.16b, <vec_2x_2p30m1=v9.16b
and v4.16b, v4.16b, v9.16b

# qhasm: 4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4] 
# asm 1: uzp1 >vec_l1=reg128#5.4s, <vec_l1=reg128#5.4s, <vec_l1=reg128#5.4s
# asm 2: uzp1 >vec_l1=v4.4s, <vec_l1=v4.4s, <vec_l1=v4.4s
uzp1 v4.4s, v4.4s, v4.4s

# qhasm: 2x vec_prod = 0
# asm 1: movi >vec_prod=reg128#13.2d, #0
# asm 2: movi >vec_prod=v12.2d, #0
movi v12.2d, #0

# qhasm: 2x vec_buf = 0
# asm 1: movi >vec_buf=reg128#22.2d, #0
# asm 2: movi >vec_buf=v21.2d, #0
movi v21.2d, #0

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#5.2s, <vec_2x_2p30m19=reg128#11.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v4.2s, <vec_2x_2p30m19=v10.s[0]
umlal v12.2d, v4.2s, v10.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#11.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v10.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v10.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
ushr v12.2d, v12.2d, #30

# qhasm: 2x vec_uuV1_0_rrV1_0 += vec_buf
# asm 1: add <vec_uuV1_0_rrV1_0=reg128#14.2d, <vec_uuV1_0_rrV1_0=reg128#14.2d, <vec_buf=reg128#11.2d
# asm 2: add <vec_uuV1_0_rrV1_0=v13.2d, <vec_uuV1_0_rrV1_0=v13.2d, <vec_buf=v10.2d
add v13.2d, v13.2d, v10.2d

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#5.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v4.2s, <vec_2x_2p30m1=v9.s[0]
umlal v12.2d, v4.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#11.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v10.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v10.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
ushr v12.2d, v12.2d, #30

# qhasm: 2x vec_uuV2_0_rrV2_0 += vec_buf
# asm 1: add <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_buf=reg128#11.2d
# asm 2: add <vec_uuV2_0_rrV2_0=v14.2d, <vec_uuV2_0_rrV2_0=v14.2d, <vec_buf=v10.2d
add v14.2d, v14.2d, v10.2d

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#5.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v4.2s, <vec_2x_2p30m1=v9.s[0]
umlal v12.2d, v4.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#11.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v10.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v10.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
ushr v12.2d, v12.2d, #30

# qhasm: 2x vec_uuV3_0_rrV3_0 += vec_buf
# asm 1: add <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_buf=reg128#11.2d
# asm 2: add <vec_uuV3_0_rrV3_0=v15.2d, <vec_uuV3_0_rrV3_0=v15.2d, <vec_buf=v10.2d
add v15.2d, v15.2d, v10.2d

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#5.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v4.2s, <vec_2x_2p30m1=v9.s[0]
umlal v12.2d, v4.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#11.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v10.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v10.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
ushr v12.2d, v12.2d, #30

# qhasm: 2x vec_uuV4_0_rrV4_0 += vec_buf
# asm 1: add <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_buf=reg128#11.2d
# asm 2: add <vec_uuV4_0_rrV4_0=v17.2d, <vec_uuV4_0_rrV4_0=v17.2d, <vec_buf=v10.2d
add v17.2d, v17.2d, v10.2d

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#5.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v4.2s, <vec_2x_2p30m1=v9.s[0]
umlal v12.2d, v4.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#11.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v10.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v10.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
ushr v12.2d, v12.2d, #30

# qhasm: 2x vec_uuV5_0_rrV5_0 += vec_buf
# asm 1: add <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_buf=reg128#11.2d
# asm 2: add <vec_uuV5_0_rrV5_0=v18.2d, <vec_uuV5_0_rrV5_0=v18.2d, <vec_buf=v10.2d
add v18.2d, v18.2d, v10.2d

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#5.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v4.2s, <vec_2x_2p30m1=v9.s[0]
umlal v12.2d, v4.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#11.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v10.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v10.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
ushr v12.2d, v12.2d, #30

# qhasm: 2x vec_uuV6_0_rrV6_0 += vec_buf
# asm 1: add <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_buf=reg128#11.2d
# asm 2: add <vec_uuV6_0_rrV6_0=v19.2d, <vec_uuV6_0_rrV6_0=v19.2d, <vec_buf=v10.2d
add v19.2d, v19.2d, v10.2d

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#5.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v4.2s, <vec_2x_2p30m1=v9.s[0]
umlal v12.2d, v4.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#11.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v10.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v10.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
ushr v12.2d, v12.2d, #30

# qhasm: 2x vec_uuV7_0_rrV7_0 += vec_buf
# asm 1: add <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_buf=reg128#11.2d
# asm 2: add <vec_uuV7_0_rrV7_0=v20.2d, <vec_uuV7_0_rrV7_0=v20.2d, <vec_buf=v10.2d
add v20.2d, v20.2d, v10.2d

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#5.2s, <vec_2x_2p30m1=reg128#10.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v4.2s, <vec_2x_2p30m1=v9.s[0]
umlal v12.2d, v4.2s, v9.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#11.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v10.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v10.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
ushr v12.2d, v12.2d, #30

# qhasm: 2x vec_uuV8_0_rrV8_0 += vec_buf
# asm 1: add <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_buf=reg128#11.2d
# asm 2: add <vec_uuV8_0_rrV8_0=v5.2d, <vec_uuV8_0_rrV8_0=v5.2d, <vec_buf=v10.2d
add v5.2d, v5.2d, v10.2d

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p15m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#5.2s, <vec_2x_2p15m1=reg128#12.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v4.2s, <vec_2x_2p15m1=v11.s[0]
umlal v12.2d, v4.2s, v11.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#5.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v4.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v9.16b
and v4.16b, v12.16b, v9.16b

# qhasm: 2x vec_prod unsigned>>= 30
# asm 1: ushr >vec_prod=reg128#11.2d, <vec_prod=reg128#13.2d, #30
# asm 2: ushr >vec_prod=v10.2d, <vec_prod=v12.2d, #30
ushr v10.2d, v12.2d, #30

# qhasm: 2x vec_uuV9_0_rrV9_0 += vec_buf
# asm 1: add <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_buf=reg128#5.2d
# asm 2: add <vec_uuV9_0_rrV9_0=v8.2d, <vec_uuV9_0_rrV9_0=v8.2d, <vec_buf=v4.2d
add v8.2d, v8.2d, v4.2d

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#5.16b, <vec_prod=reg128#11.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and >vec_buf=v4.16b, <vec_prod=v10.16b, <vec_2x_2p30m1=v9.16b
and v4.16b, v10.16b, v9.16b

# qhasm: 2x vec_uuV10_0_rrV10_0 += vec_buf
# asm 1: add <vec_uuV10_0_rrV10_0=reg128#7.2d, <vec_uuV10_0_rrV10_0=reg128#7.2d, <vec_buf=reg128#5.2d
# asm 2: add <vec_uuV10_0_rrV10_0=v6.2d, <vec_uuV10_0_rrV10_0=v6.2d, <vec_buf=v4.2d
add v6.2d, v6.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV1_0_rrV1_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV1_0_rrV1_0=reg128#14.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV1_0_rrV1_0=v13.2d, #30
ushr v4.2d, v13.2d, #30

# qhasm: vec_uuV1_0_rrV1_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV1_0_rrV1_0=reg128#14.16b, <vec_uuV1_0_rrV1_0=reg128#14.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV1_0_rrV1_0=v13.16b, <vec_uuV1_0_rrV1_0=v13.16b, <vec_2x_2p30m1=v9.16b
and v13.16b, v13.16b, v9.16b

# qhasm: 2x vec_uuV2_0_rrV2_0 += vec_carry
# asm 1: add <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV2_0_rrV2_0=v14.2d, <vec_uuV2_0_rrV2_0=v14.2d, <vec_carry=v4.2d
add v14.2d, v14.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV2_0_rrV2_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV2_0_rrV2_0=v14.2d, #30
ushr v4.2d, v14.2d, #30

# qhasm: vec_uuV2_0_rrV2_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV2_0_rrV2_0=reg128#15.16b, <vec_uuV2_0_rrV2_0=reg128#15.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV2_0_rrV2_0=v14.16b, <vec_uuV2_0_rrV2_0=v14.16b, <vec_2x_2p30m1=v9.16b
and v14.16b, v14.16b, v9.16b

# qhasm: 2x vec_uuV3_0_rrV3_0 += vec_carry
# asm 1: add <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV3_0_rrV3_0=v15.2d, <vec_uuV3_0_rrV3_0=v15.2d, <vec_carry=v4.2d
add v15.2d, v15.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV3_0_rrV3_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV3_0_rrV3_0=v15.2d, #30
ushr v4.2d, v15.2d, #30

# qhasm: vec_uuV3_0_rrV3_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV3_0_rrV3_0=reg128#16.16b, <vec_uuV3_0_rrV3_0=reg128#16.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV3_0_rrV3_0=v15.16b, <vec_uuV3_0_rrV3_0=v15.16b, <vec_2x_2p30m1=v9.16b
and v15.16b, v15.16b, v9.16b

# qhasm: 2x vec_uuV4_0_rrV4_0 += vec_carry
# asm 1: add <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV4_0_rrV4_0=v17.2d, <vec_uuV4_0_rrV4_0=v17.2d, <vec_carry=v4.2d
add v17.2d, v17.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV4_0_rrV4_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV4_0_rrV4_0=v17.2d, #30
ushr v4.2d, v17.2d, #30

# qhasm: vec_uuV4_0_rrV4_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV4_0_rrV4_0=reg128#18.16b, <vec_uuV4_0_rrV4_0=reg128#18.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV4_0_rrV4_0=v17.16b, <vec_uuV4_0_rrV4_0=v17.16b, <vec_2x_2p30m1=v9.16b
and v17.16b, v17.16b, v9.16b

# qhasm: 2x vec_uuV5_0_rrV5_0 += vec_carry
# asm 1: add <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV5_0_rrV5_0=v18.2d, <vec_uuV5_0_rrV5_0=v18.2d, <vec_carry=v4.2d
add v18.2d, v18.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV5_0_rrV5_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV5_0_rrV5_0=v18.2d, #30
ushr v4.2d, v18.2d, #30

# qhasm: vec_uuV5_0_rrV5_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV5_0_rrV5_0=reg128#19.16b, <vec_uuV5_0_rrV5_0=reg128#19.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV5_0_rrV5_0=v18.16b, <vec_uuV5_0_rrV5_0=v18.16b, <vec_2x_2p30m1=v9.16b
and v18.16b, v18.16b, v9.16b

# qhasm: 2x vec_uuV6_0_rrV6_0 += vec_carry
# asm 1: add <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV6_0_rrV6_0=v19.2d, <vec_uuV6_0_rrV6_0=v19.2d, <vec_carry=v4.2d
add v19.2d, v19.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV6_0_rrV6_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV6_0_rrV6_0=v19.2d, #30
ushr v4.2d, v19.2d, #30

# qhasm: vec_uuV6_0_rrV6_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV6_0_rrV6_0=reg128#20.16b, <vec_uuV6_0_rrV6_0=reg128#20.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV6_0_rrV6_0=v19.16b, <vec_uuV6_0_rrV6_0=v19.16b, <vec_2x_2p30m1=v9.16b
and v19.16b, v19.16b, v9.16b

# qhasm: 2x vec_uuV7_0_rrV7_0 += vec_carry
# asm 1: add <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV7_0_rrV7_0=v20.2d, <vec_uuV7_0_rrV7_0=v20.2d, <vec_carry=v4.2d
add v20.2d, v20.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV7_0_rrV7_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV7_0_rrV7_0=v20.2d, #30
ushr v4.2d, v20.2d, #30

# qhasm: vec_uuV7_0_rrV7_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV7_0_rrV7_0=reg128#21.16b, <vec_uuV7_0_rrV7_0=reg128#21.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV7_0_rrV7_0=v20.16b, <vec_uuV7_0_rrV7_0=v20.16b, <vec_2x_2p30m1=v9.16b
and v20.16b, v20.16b, v9.16b

# qhasm: 2x vec_uuV8_0_rrV8_0 += vec_carry
# asm 1: add <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV8_0_rrV8_0=v5.2d, <vec_uuV8_0_rrV8_0=v5.2d, <vec_carry=v4.2d
add v5.2d, v5.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV8_0_rrV8_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV8_0_rrV8_0=v5.2d, #30
ushr v4.2d, v5.2d, #30

# qhasm: vec_uuV8_0_rrV8_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV8_0_rrV8_0=reg128#6.16b, <vec_uuV8_0_rrV8_0=reg128#6.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV8_0_rrV8_0=v5.16b, <vec_uuV8_0_rrV8_0=v5.16b, <vec_2x_2p30m1=v9.16b
and v5.16b, v5.16b, v9.16b

# qhasm: 2x vec_uuV9_0_rrV9_0 += vec_carry
# asm 1: add <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_uuV9_0_rrV9_0=reg128#9.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV9_0_rrV9_0=v8.2d, <vec_uuV9_0_rrV9_0=v8.2d, <vec_carry=v4.2d
add v8.2d, v8.2d, v4.2d

# qhasm: 2x vec_carry = vec_uuV9_0_rrV9_0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#5.2d, <vec_uuV9_0_rrV9_0=reg128#9.2d, #30
# asm 2: ushr >vec_carry=v4.2d, <vec_uuV9_0_rrV9_0=v8.2d, #30
ushr v4.2d, v8.2d, #30

# qhasm: vec_uuV9_0_rrV9_0 &= vec_2x_2p30m1
# asm 1: and <vec_uuV9_0_rrV9_0=reg128#9.16b, <vec_uuV9_0_rrV9_0=reg128#9.16b, <vec_2x_2p30m1=reg128#10.16b
# asm 2: and <vec_uuV9_0_rrV9_0=v8.16b, <vec_uuV9_0_rrV9_0=v8.16b, <vec_2x_2p30m1=v9.16b
and v8.16b, v8.16b, v9.16b

# qhasm: 2x vec_uuV10_0_rrV10_0 += vec_carry
# asm 1: add <vec_uuV10_0_rrV10_0=reg128#7.2d, <vec_uuV10_0_rrV10_0=reg128#7.2d, <vec_carry=reg128#5.2d
# asm 2: add <vec_uuV10_0_rrV10_0=v6.2d, <vec_uuV10_0_rrV10_0=v6.2d, <vec_carry=v4.2d
add v6.2d, v6.2d, v4.2d

# qhasm: 2x vec_buf = 19
# asm 1: movi >vec_buf=reg128#5.2d, #19
# asm 2: movi >vec_buf=v4.2d, #19
movi v4.2d, #19

# qhasm: 2x vec_buf = vec_buf + vec_uuV2_0_rrV2_0
# asm 1: add >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, <vec_uuV2_0_rrV2_0=reg128#15.2d
# asm 2: add >vec_buf=v4.2d, <vec_buf=v4.2d, <vec_uuV2_0_rrV2_0=v14.2d
add v4.2d, v4.2d, v14.2d

# qhasm: 2x vec_buf unsigned>>= 30
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #30
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #30
ushr v4.2d, v4.2d, #30

# qhasm: 2x vec_buf = vec_buf + vec_uuV3_0_rrV3_0
# asm 1: add >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, <vec_uuV3_0_rrV3_0=reg128#16.2d
# asm 2: add >vec_buf=v4.2d, <vec_buf=v4.2d, <vec_uuV3_0_rrV3_0=v15.2d
add v4.2d, v4.2d, v15.2d

# qhasm: 2x vec_buf unsigned>>= 30
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #30
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #30
ushr v4.2d, v4.2d, #30

# qhasm: 2x vec_buf = vec_buf + vec_uuV4_0_rrV4_0
# asm 1: add >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, <vec_uuV4_0_rrV4_0=reg128#18.2d
# asm 2: add >vec_buf=v4.2d, <vec_buf=v4.2d, <vec_uuV4_0_rrV4_0=v17.2d
add v4.2d, v4.2d, v17.2d

# qhasm: 2x vec_buf unsigned>>= 30
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #30
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #30
ushr v4.2d, v4.2d, #30

# qhasm: 2x vec_buf = vec_buf + vec_uuV5_0_rrV5_0
# asm 1: add >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, <vec_uuV5_0_rrV5_0=reg128#19.2d
# asm 2: add >vec_buf=v4.2d, <vec_buf=v4.2d, <vec_uuV5_0_rrV5_0=v18.2d
add v4.2d, v4.2d, v18.2d

# qhasm: 2x vec_buf unsigned>>= 30
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #30
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #30
ushr v4.2d, v4.2d, #30

# qhasm: 2x vec_buf = vec_buf + vec_uuV6_0_rrV6_0
# asm 1: add >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, <vec_uuV6_0_rrV6_0=reg128#20.2d
# asm 2: add >vec_buf=v4.2d, <vec_buf=v4.2d, <vec_uuV6_0_rrV6_0=v19.2d
add v4.2d, v4.2d, v19.2d

# qhasm: 2x vec_buf unsigned>>= 30
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #30
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #30
ushr v4.2d, v4.2d, #30

# qhasm: 2x vec_buf = vec_buf + vec_uuV7_0_rrV7_0
# asm 1: add >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, <vec_uuV7_0_rrV7_0=reg128#21.2d
# asm 2: add >vec_buf=v4.2d, <vec_buf=v4.2d, <vec_uuV7_0_rrV7_0=v20.2d
add v4.2d, v4.2d, v20.2d

# qhasm: 2x vec_buf unsigned>>= 30
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #30
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #30
ushr v4.2d, v4.2d, #30

# qhasm: 2x vec_buf = vec_buf + vec_uuV8_0_rrV8_0
# asm 1: add >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, <vec_uuV8_0_rrV8_0=reg128#6.2d
# asm 2: add >vec_buf=v4.2d, <vec_buf=v4.2d, <vec_uuV8_0_rrV8_0=v5.2d
add v4.2d, v4.2d, v5.2d

# qhasm: 2x vec_buf unsigned>>= 30
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #30
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #30
ushr v4.2d, v4.2d, #30

# qhasm: 2x vec_buf = vec_buf + vec_uuV9_0_rrV9_0
# asm 1: add >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, <vec_uuV9_0_rrV9_0=reg128#9.2d
# asm 2: add >vec_buf=v4.2d, <vec_buf=v4.2d, <vec_uuV9_0_rrV9_0=v8.2d
add v4.2d, v4.2d, v8.2d

# qhasm: 2x vec_buf unsigned>>= 30
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #30
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #30
ushr v4.2d, v4.2d, #30

# qhasm: pop2x8b calleesaved_v14, calleesaved_v15
# asm 1: ldp >calleesaved_v14=reg128#15%dregname,>calleesaved_v15=reg128#16%dregname,[sp],#16
# asm 2: ldp >calleesaved_v14=d14,>calleesaved_v15=d15,[sp],#16
ldp d14,d15,[sp],#16

# qhasm: pop2x8b calleesaved_v12, calleesaved_v13
# asm 1: ldp >calleesaved_v12=reg128#13%dregname,>calleesaved_v13=reg128#14%dregname,[sp],#16
# asm 2: ldp >calleesaved_v12=d12,>calleesaved_v13=d13,[sp],#16
ldp d12,d13,[sp],#16

# qhasm: pop2x8b calleesaved_v10, calleesaved_v11
# asm 1: ldp >calleesaved_v10=reg128#11%dregname,>calleesaved_v11=reg128#12%dregname,[sp],#16
# asm 2: ldp >calleesaved_v10=d10,>calleesaved_v11=d11,[sp],#16
ldp d10,d11,[sp],#16

# qhasm: pop2x8b calleesaved_v8, calleesaved_v9
# asm 1: ldp >calleesaved_v8=reg128#9%dregname,>calleesaved_v9=reg128#10%dregname,[sp],#16
# asm 2: ldp >calleesaved_v8=d8,>calleesaved_v9=d9,[sp],#16
ldp d8,d9,[sp],#16

# qhasm: pop2xint64 calleesaved_x28, calleesaved_x29
# asm 1: ldp >calleesaved_x28=int64#29, >calleesaved_x29=int64#30, [sp], #16
# asm 2: ldp >calleesaved_x28=x28, >calleesaved_x29=x29, [sp], #16
ldp x28, x29, [sp], #16

# qhasm: pop2xint64 calleesaved_x26, calleesaved_x27
# asm 1: ldp >calleesaved_x26=int64#27, >calleesaved_x27=int64#28, [sp], #16
# asm 2: ldp >calleesaved_x26=x26, >calleesaved_x27=x27, [sp], #16
ldp x26, x27, [sp], #16

# qhasm: pop2xint64 calleesaved_x24, calleesaved_x25
# asm 1: ldp >calleesaved_x24=int64#25, >calleesaved_x25=int64#26, [sp], #16
# asm 2: ldp >calleesaved_x24=x24, >calleesaved_x25=x25, [sp], #16
ldp x24, x25, [sp], #16

# qhasm: pop2xint64 calleesaved_x22, calleesaved_x23
# asm 1: ldp >calleesaved_x22=int64#23, >calleesaved_x23=int64#24, [sp], #16
# asm 2: ldp >calleesaved_x22=x22, >calleesaved_x23=x23, [sp], #16
ldp x22, x23, [sp], #16

# qhasm: pop2xint64 calleesaved_x20, calleesaved_x21
# asm 1: ldp >calleesaved_x20=int64#21, >calleesaved_x21=int64#22, [sp], #16
# asm 2: ldp >calleesaved_x20=x20, >calleesaved_x21=x21, [sp], #16
ldp x20, x21, [sp], #16

# qhasm: pop2xint64 calleesaved_x18, calleesaved_x19
# asm 1: ldp >calleesaved_x18=int64#19, >calleesaved_x19=int64#20, [sp], #16
# asm 2: ldp >calleesaved_x18=x18, >calleesaved_x19=x19, [sp], #16
ldp x18, x19, [sp], #16

# qhasm: return
ret
