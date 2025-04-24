
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

# qhasm: int64 pointerV

# qhasm: int64 pointerS

# qhasm: int64 pointeruuvvrrss

# qhasm: input pointerV

# qhasm: input pointerS

# qhasm: input pointeruuvvrrss

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7

# qhasm: int64 V8

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 S4S5

# qhasm: int64 S6S7

# qhasm: int64 S8

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

# qhasm: reg128 vec_V2_V3_S2_S3 

# qhasm: reg128 vec_V4_V5_S4_S5 

# qhasm: reg128 vec_V6_V7_S6_S7 

# qhasm: reg128 vec_V8_0_S8_0

# qhasm: vec_V0_V1_S0_S1[0/2] = V0V1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#1.d[0], <V0V1=int64#4
# asm 2: ins <vec_V0_V1_S0_S1=v0.d[0], <V0V1=x3
ins v0.d[0], x3

# qhasm: vec_V0_V1_S0_S1[1/2] = S0S1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#1.d[1], <S0S1=int64#8
# asm 2: ins <vec_V0_V1_S0_S1=v0.d[1], <S0S1=x7
ins v0.d[1], x7

# qhasm: vec_V2_V3_S2_S3[0/2] = V2V3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#2.d[0], <V2V3=int64#5
# asm 2: ins <vec_V2_V3_S2_S3=v1.d[0], <V2V3=x4
ins v1.d[0], x4

# qhasm: vec_V2_V3_S2_S3[1/2] = S2S3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#2.d[1], <S2S3=int64#9
# asm 2: ins <vec_V2_V3_S2_S3=v1.d[1], <S2S3=x8
ins v1.d[1], x8

# qhasm: vec_V4_V5_S4_S5[0/2] = V4V5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#3.d[0], <V4V5=int64#6
# asm 2: ins <vec_V4_V5_S4_S5=v2.d[0], <V4V5=x5
ins v2.d[0], x5

# qhasm: vec_V4_V5_S4_S5[1/2] = S4S5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#3.d[1], <S4S5=int64#10
# asm 2: ins <vec_V4_V5_S4_S5=v2.d[1], <S4S5=x9
ins v2.d[1], x9

# qhasm: vec_V6_V7_S6_S7[0/2] = V6V7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#4.d[0], <V6V7=int64#7
# asm 2: ins <vec_V6_V7_S6_S7=v3.d[0], <V6V7=x6
ins v3.d[0], x6

# qhasm: vec_V6_V7_S6_S7[1/2] = S6S7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#4.d[1], <S6S7=int64#11
# asm 2: ins <vec_V6_V7_S6_S7=v3.d[1], <S6S7=x10
ins v3.d[1], x10

# qhasm: vec_V8_0_S8_0[0/2] = V8 
# asm 1: ins <vec_V8_0_S8_0=reg128#5.d[0], <V8=int64#1
# asm 2: ins <vec_V8_0_S8_0=v4.d[0], <V8=x0
ins v4.d[0], x0

# qhasm: vec_V8_0_S8_0[1/2] = S8 
# asm 1: ins <vec_V8_0_S8_0=reg128#5.d[1], <S8=int64#2
# asm 2: ins <vec_V8_0_S8_0=v4.d[1], <S8=x1
ins v4.d[1], x1

# qhasm: int64 uu0uu1

# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu0uu1 = mem64[pointeruuvvrrss + 0]
# asm 1: ldr >uu0uu1=int64#1, [<pointeruuvvrrss=int64#3, #0]
# asm 2: ldr >uu0uu1=x0, [<pointeruuvvrrss=x2, #0]
ldr x0, [x2, #0]

# qhasm: uu0 = uu0uu1 & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#2, <uu0uu1=int64#1, #0, #30
# asm 2: ubfx >uu0=x1, <uu0uu1=x0, #0, #30
ubfx x1, x0, #0, #30

# qhasm: uu1 = (uu0uu1 >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#1, <uu0uu1=int64#1, #30, #32
# asm 2: ubfx >uu1=x0, <uu0uu1=x0, #30, #32
ubfx x0, x0, #30, #32

# qhasm: int64 vv0vv1

# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv0vv1 = mem64[pointeruuvvrrss + 8]
# asm 1: ldr >vv0vv1=int64#4, [<pointeruuvvrrss=int64#3, #8]
# asm 2: ldr >vv0vv1=x3, [<pointeruuvvrrss=x2, #8]
ldr x3, [x2, #8]

# qhasm: vv0 = vv0vv1 & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#5, <vv0vv1=int64#4, #0, #30
# asm 2: ubfx >vv0=x4, <vv0vv1=x3, #0, #30
ubfx x4, x3, #0, #30

# qhasm: vv1 = (vv0vv1 >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#4, <vv0vv1=int64#4, #30, #32
# asm 2: ubfx >vv1=x3, <vv0vv1=x3, #30, #32
ubfx x3, x3, #30, #32

# qhasm: int64 rr0rr1

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr0rr1 = mem64[pointeruuvvrrss + 16]
# asm 1: ldr >rr0rr1=int64#6, [<pointeruuvvrrss=int64#3, #16]
# asm 2: ldr >rr0rr1=x5, [<pointeruuvvrrss=x2, #16]
ldr x5, [x2, #16]

# qhasm: rr0 = rr0rr1 & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#7, <rr0rr1=int64#6, #0, #30
# asm 2: ubfx >rr0=x6, <rr0rr1=x5, #0, #30
ubfx x6, x5, #0, #30

# qhasm: rr1 = (rr0rr1 >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#6, <rr0rr1=int64#6, #30, #32
# asm 2: ubfx >rr1=x5, <rr0rr1=x5, #30, #32
ubfx x5, x5, #30, #32

# qhasm: int64 ss0ss1

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss0ss1 = mem64[pointeruuvvrrss + 24]
# asm 1: ldr >ss0ss1=int64#3, [<pointeruuvvrrss=int64#3, #24]
# asm 2: ldr >ss0ss1=x2, [<pointeruuvvrrss=x2, #24]
ldr x2, [x2, #24]

# qhasm: ss0 = ss0ss1 & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#8, <ss0ss1=int64#3, #0, #30
# asm 2: ubfx >ss0=x7, <ss0ss1=x2, #0, #30
ubfx x7, x2, #0, #30

# qhasm: ss1 = (ss0ss1 >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#3, <ss0ss1=int64#3, #30, #32
# asm 2: ubfx >ss1=x2, <ss0ss1=x2, #30, #32
ubfx x2, x2, #30, #32

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: int64 uu0rr0

# qhasm: rr0 = rr0 << 32
# asm 1: lsl >rr0=int64#7, <rr0=int64#7, #32
# asm 2: lsl >rr0=x6, <rr0=x6, #32
lsl x6, x6, #32

# qhasm: uu0rr0 = uu0 | rr0
# asm 1: orr >uu0rr0=int64#2, <uu0=int64#2, <rr0=int64#7
# asm 2: orr >uu0rr0=x1, <uu0=x1, <rr0=x6
orr x1, x1, x6

# qhasm: vec_uu0_rr0_vv0_ss0[0/2] = uu0rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.d[0], <uu0rr0=int64#2
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.d[0], <uu0rr0=x1
ins v5.d[0], x1

# qhasm: int64 vv0ss0

# qhasm: ss0 = ss0 << 32
# asm 1: lsl >ss0=int64#2, <ss0=int64#8, #32
# asm 2: lsl >ss0=x1, <ss0=x7, #32
lsl x1, x7, #32

# qhasm: vv0ss0 = vv0 | ss0
# asm 1: orr >vv0ss0=int64#2, <vv0=int64#5, <ss0=int64#2
# asm 2: orr >vv0ss0=x1, <vv0=x4, <ss0=x1
orr x1, x4, x1

# qhasm: vec_uu0_rr0_vv0_ss0[1/2] = vv0ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.d[1], <vv0ss0=int64#2
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.d[1], <vv0ss0=x1
ins v5.d[1], x1

# qhasm: int64 uu1rr1

# qhasm: rr1 = rr1 << 32
# asm 1: lsl >rr1=int64#2, <rr1=int64#6, #32
# asm 2: lsl >rr1=x1, <rr1=x5, #32
lsl x1, x5, #32

# qhasm: uu1rr1 = uu1 | rr1
# asm 1: orr >uu1rr1=int64#1, <uu1=int64#1, <rr1=int64#2
# asm 2: orr >uu1rr1=x0, <uu1=x0, <rr1=x1
orr x0, x0, x1

# qhasm: vec_uu1_rr1_vv1_ss1[0/2] = uu1rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.d[0], <uu1rr1=int64#1
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.d[0], <uu1rr1=x0
ins v6.d[0], x0

# qhasm: int64 vv1ss1

# qhasm: ss1 = ss1 << 32
# asm 1: lsl >ss1=int64#1, <ss1=int64#3, #32
# asm 2: lsl >ss1=x0, <ss1=x2, #32
lsl x0, x2, #32

# qhasm: vv1ss1 = vv1 | ss1
# asm 1: orr >vv1ss1=int64#1, <vv1=int64#4, <ss1=int64#1
# asm 2: orr >vv1ss1=x0, <vv1=x3, <ss1=x0
orr x0, x3, x0

# qhasm: vec_uu1_rr1_vv1_ss1[1/2] = vv1ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.d[1], <vv1ss1=int64#1
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.d[1], <vv1ss1=x0
ins v6.d[1], x0

# qhasm: reg128 vec_tmp0

# qhasm: reg128 vec_tmp1

# qhasm: reg128 vec_tmp2

# qhasm: reg128 vec_tmp3

# qhasm: reg128 vec_tmp4

# qhasm: reg128 vec_tmp5

# qhasm: reg128 vec_tmp6

# qhasm: reg128 vec_tmp7

# qhasm: reg128 vec_tmp8

# qhasm: reg128 vec_tmp9

# qhasm: reg128 vec_product

# qhasm: reg128 vec_2x_2p30m1

# qhasm: reg128 vec_4x_2p30m1

# qhasm: reg128 vec_4x_2p30m19

# qhasm: reg128 vec_4x_2p15m1

# qhasm: 2x vec_product = 0
# asm 1: movi >vec_product=reg128#7.2d, #0
# asm 2: movi >vec_product=v6.2d, #0
movi v6.2d, #0

# qhasm: 2x vec_2x_2p30m1 = 1073741823
# asm 1: movi >vec_2x_2p30m1=reg128#8.2d, #1073741823
# asm 2: movi >vec_2x_2p30m1=v7.2d, #1073741823
movi v7.2d, #1073741823

# qhasm: int64 2p30m1

# qhasm: 2p30m1 = 1073741823
# asm 1: mov >2p30m1=int64#1, #1073741823
# asm 2: mov >2p30m1=x0, #1073741823
mov x0, #1073741823

# qhasm: int64 2p30m19

# qhasm: 2p30m1 = 1073741805
# asm 1: mov >2p30m1=int64#2, #1073741805
# asm 2: mov >2p30m1=x1, #1073741805
mov x1, #1073741805

# qhasm: int64 2p15m1

# qhasm: 2p30m1 = 32767
# asm 1: mov >2p30m1=int64#3, #32767
# asm 2: mov >2p30m1=x2, #32767
mov x2, #32767

# qhasm: 4x vec_4x_2p30m1 = 2p30m1
# asm 1: dup <vec_4x_2p30m1=reg128#9.4s, <2p30m1=int64#3%wregname
# asm 2: dup <vec_4x_2p30m1=v8.4s, <2p30m1=w2
dup v8.4s, w2

# qhasm: 4x vec_4x_2p30m19 = 2p30m19
# asm 1: dup <vec_4x_2p30m19=reg128#10.4s, <2p30m19=int64#3%wregname
# asm 2: dup <vec_4x_2p30m19=v9.4s, <2p30m19=w2
dup v9.4s, w2

# qhasm: 4x vec_4x_2p15m1 = 2p15m1
# asm 1: dup <vec_4x_2p15m1=reg128#11.4s, <2p15m1=int64#3%wregname
# asm 2: dup <vec_4x_2p15m1=v10.4s, <2p15m1=w2
dup v10.4s, w2

# qhasm: 2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[0/4]
# asm 1: umlal <vec_product=reg128#7.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V0_V1_S0_S1=reg128#1.s[0]
# asm 2: umlal <vec_product=v6.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V0_V1_S0_S1=v0.s[0]
umlal v6.2d, v5.2s, v0.s[0]

# qhasm: vec_tmp0 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp0=reg128#12.16b, <vec_product=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp0=v11.16b, <vec_product=v6.16b, <vec_2x_2p30m1=v7.16b
and v11.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = vec_product unsigned>> 30
# asm 1: ushr >vec_product=reg128#7.2d, <vec_product=reg128#7.2d, #30
# asm 2: ushr >vec_product=v6.2d, <vec_product=v6.2d, #30
ushr v6.2d, v6.2d, #30

# qhasm: 2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[1/4]
# asm 1: umlal <vec_product=reg128#7.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V0_V1_S0_S1=reg128#1.s[1]
# asm 2: umlal <vec_product=v6.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V0_V1_S0_S1=v0.s[1]
umlal v6.2d, v5.2s, v0.s[1]

# qhasm: vec_tmp1 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp1=reg128#1.16b, <vec_product=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp1=v0.16b, <vec_product=v6.16b, <vec_2x_2p30m1=v7.16b
and v0.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = vec_product unsigned>> 30
# asm 1: ushr >vec_product=reg128#7.2d, <vec_product=reg128#7.2d, #30
# asm 2: ushr >vec_product=v6.2d, <vec_product=v6.2d, #30
ushr v6.2d, v6.2d, #30

# qhasm: 2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[0/4]
# asm 1: umlal <vec_product=reg128#7.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V2_V3_S2_S3=reg128#2.s[0]
# asm 2: umlal <vec_product=v6.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V2_V3_S2_S3=v1.s[0]
umlal v6.2d, v5.2s, v1.s[0]

# qhasm: vec_tmp2 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp2=reg128#13.16b, <vec_product=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp2=v12.16b, <vec_product=v6.16b, <vec_2x_2p30m1=v7.16b
and v12.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = vec_product unsigned>> 30
# asm 1: ushr >vec_product=reg128#7.2d, <vec_product=reg128#7.2d, #30
# asm 2: ushr >vec_product=v6.2d, <vec_product=v6.2d, #30
ushr v6.2d, v6.2d, #30

# qhasm: 2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[1/4]
# asm 1: umlal <vec_product=reg128#7.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V2_V3_S2_S3=reg128#2.s[1]
# asm 2: umlal <vec_product=v6.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V2_V3_S2_S3=v1.s[1]
umlal v6.2d, v5.2s, v1.s[1]

# qhasm: vec_tmp3 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp3=reg128#2.16b, <vec_product=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp3=v1.16b, <vec_product=v6.16b, <vec_2x_2p30m1=v7.16b
and v1.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = vec_product unsigned>> 30
# asm 1: ushr >vec_product=reg128#7.2d, <vec_product=reg128#7.2d, #30
# asm 2: ushr >vec_product=v6.2d, <vec_product=v6.2d, #30
ushr v6.2d, v6.2d, #30

# qhasm: 2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[0/4]
# asm 1: umlal <vec_product=reg128#7.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V4_V5_S4_S5=reg128#3.s[0]
# asm 2: umlal <vec_product=v6.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V4_V5_S4_S5=v2.s[0]
umlal v6.2d, v5.2s, v2.s[0]

# qhasm: vec_tmp4 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp4=reg128#14.16b, <vec_product=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp4=v13.16b, <vec_product=v6.16b, <vec_2x_2p30m1=v7.16b
and v13.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = vec_product unsigned>> 30
# asm 1: ushr >vec_product=reg128#7.2d, <vec_product=reg128#7.2d, #30
# asm 2: ushr >vec_product=v6.2d, <vec_product=v6.2d, #30
ushr v6.2d, v6.2d, #30

# qhasm: 2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[1/4]
# asm 1: umlal <vec_product=reg128#7.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V4_V5_S4_S5=reg128#3.s[1]
# asm 2: umlal <vec_product=v6.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V4_V5_S4_S5=v2.s[1]
umlal v6.2d, v5.2s, v2.s[1]

# qhasm: vec_tmp5 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp5=reg128#3.16b, <vec_product=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp5=v2.16b, <vec_product=v6.16b, <vec_2x_2p30m1=v7.16b
and v2.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = vec_product unsigned>> 30
# asm 1: ushr >vec_product=reg128#7.2d, <vec_product=reg128#7.2d, #30
# asm 2: ushr >vec_product=v6.2d, <vec_product=v6.2d, #30
ushr v6.2d, v6.2d, #30

# qhasm: 2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[0/4]
# asm 1: umlal <vec_product=reg128#7.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V6_V7_S6_S7=reg128#4.s[0]
# asm 2: umlal <vec_product=v6.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V6_V7_S6_S7=v3.s[0]
umlal v6.2d, v5.2s, v3.s[0]

# qhasm: vec_tmp6 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp6=reg128#15.16b, <vec_product=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp6=v14.16b, <vec_product=v6.16b, <vec_2x_2p30m1=v7.16b
and v14.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = vec_product unsigned>> 30
# asm 1: ushr >vec_product=reg128#7.2d, <vec_product=reg128#7.2d, #30
# asm 2: ushr >vec_product=v6.2d, <vec_product=v6.2d, #30
ushr v6.2d, v6.2d, #30

# qhasm: 2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[1/4]
# asm 1: umlal <vec_product=reg128#7.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V6_V7_S6_S7=reg128#4.s[1]
# asm 2: umlal <vec_product=v6.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V6_V7_S6_S7=v3.s[1]
umlal v6.2d, v5.2s, v3.s[1]

# qhasm: vec_tmp7 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp7=reg128#4.16b, <vec_product=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp7=v3.16b, <vec_product=v6.16b, <vec_2x_2p30m1=v7.16b
and v3.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = vec_product unsigned>> 30
# asm 1: ushr >vec_product=reg128#7.2d, <vec_product=reg128#7.2d, #30
# asm 2: ushr >vec_product=v6.2d, <vec_product=v6.2d, #30
ushr v6.2d, v6.2d, #30

# qhasm: 2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V8_0_S8_0[0/4]
# asm 1: umlal <vec_product=reg128#7.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V8_0_S8_0=reg128#5.s[0]
# asm 2: umlal <vec_product=v6.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V8_0_S8_0=v4.s[0]
umlal v6.2d, v5.2s, v4.s[0]

# qhasm: vec_tmp8 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp8=reg128#5.16b, <vec_product=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp8=v4.16b, <vec_product=v6.16b, <vec_2x_2p30m1=v7.16b
and v4.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = vec_product unsigned>> 30
# asm 1: ushr >vec_product=reg128#6.2d, <vec_product=reg128#7.2d, #30
# asm 2: ushr >vec_product=v5.2d, <vec_product=v6.2d, #30
ushr v5.2d, v6.2d, #30

# qhasm: vec_tmp9 = vec_product & vec_2x_2p30m1
# asm 1: and >vec_tmp9=reg128#6.16b, <vec_product=reg128#6.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp9=v5.16b, <vec_product=v5.16b, <vec_2x_2p30m1=v7.16b
and v5.16b, v5.16b, v7.16b

# qhasm: reg128 vec_l0

# qhasm: reg128 vec_M

# qhasm: 2x vec_M = 678152731
# asm 1: movi >vec_M=reg128#7.2d, #678152731
# asm 2: movi >vec_M=v6.2d, #678152731
movi v6.2d, #678152731

# qhasm: 4x vec_l0 = vec_tmp0 * vec_M
# asm 1: mul >vec_l0=reg128#7.4s,<vec_tmp0=reg128#12.4s,<vec_M=reg128#7.4s
# asm 2: mul >vec_l0=v6.4s,<vec_tmp0=v11.4s,<vec_M=v6.4s
mul v6.4s,v11.4s,v6.4s

# qhasm: vec_l0 = vec_l0 & vec_2x_2p30m1
# asm 1: and >vec_l0=reg128#7.16b, <vec_l0=reg128#7.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_l0=v6.16b, <vec_l0=v6.16b, <vec_2x_2p30m1=v7.16b
and v6.16b, v6.16b, v7.16b

# qhasm: 2x vec_product = 0
# asm 1: movi >vec_product=reg128#16.2d, #0
# asm 2: movi >vec_product=v15.2d, #0
movi v15.2d, #0

# qhasm: reg128 vec_accu

# qhasm: 2x vec_accu = 0
# asm 1: movi >vec_accu=reg128#17.2d, #0
# asm 2: movi >vec_accu=v16.2d, #0
movi v16.2d, #0

# qhasm: 2x vec_product += vec_4x_2p30m19[0] unsigned* vec_l0[0/4]
# asm 1: umlal <vec_product=reg128#16.2d, <vec_4x_2p30m19=reg128#10.2s, <vec_l0=reg128#7.s[0]
# asm 2: umlal <vec_product=v15.2d, <vec_4x_2p30m19=v9.2s, <vec_l0=v6.s[0]
umlal v15.2d, v9.2s, v6.s[0]

# qhasm: vec_accu = vec_product & vec_2x_2p30m1
# asm 1: and >vec_accu=reg128#10.16b, <vec_product=reg128#16.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_accu=v9.16b, <vec_product=v15.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v15.16b, v7.16b

# qhasm: 2x vec_tmp0 += vec_accu
# asm 1: add <vec_tmp0=reg128#12.2d, <vec_tmp0=reg128#12.2d, <vec_accu=reg128#10.2d
# asm 2: add <vec_tmp0=v11.2d, <vec_tmp0=v11.2d, <vec_accu=v9.2d
add v11.2d, v11.2d, v9.2d

# qhasm: 2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
# asm 1: umlal <vec_product=reg128#16.2d, <vec_4x_2p30m1=reg128#9.2s, <vec_l0=reg128#7.s[0]
# asm 2: umlal <vec_product=v15.2d, <vec_4x_2p30m1=v8.2s, <vec_l0=v6.s[0]
umlal v15.2d, v8.2s, v6.s[0]

# qhasm: vec_accu = vec_product & vec_2x_2p30m1
# asm 1: and >vec_accu=reg128#10.16b, <vec_product=reg128#16.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_accu=v9.16b, <vec_product=v15.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v15.16b, v7.16b

# qhasm: 2x vec_tmp0 += vec_accu
# asm 1: add <vec_tmp0=reg128#12.2d, <vec_tmp0=reg128#12.2d, <vec_accu=reg128#10.2d
# asm 2: add <vec_tmp0=v11.2d, <vec_tmp0=v11.2d, <vec_accu=v9.2d
add v11.2d, v11.2d, v9.2d

# qhasm: 2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
# asm 1: umlal <vec_product=reg128#16.2d, <vec_4x_2p30m1=reg128#9.2s, <vec_l0=reg128#7.s[0]
# asm 2: umlal <vec_product=v15.2d, <vec_4x_2p30m1=v8.2s, <vec_l0=v6.s[0]
umlal v15.2d, v8.2s, v6.s[0]

# qhasm: vec_accu = vec_product & vec_2x_2p30m1
# asm 1: and >vec_accu=reg128#10.16b, <vec_product=reg128#16.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_accu=v9.16b, <vec_product=v15.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v15.16b, v7.16b

# qhasm: 2x vec_tmp0 += vec_accu
# asm 1: add <vec_tmp0=reg128#12.2d, <vec_tmp0=reg128#12.2d, <vec_accu=reg128#10.2d
# asm 2: add <vec_tmp0=v11.2d, <vec_tmp0=v11.2d, <vec_accu=v9.2d
add v11.2d, v11.2d, v9.2d

# qhasm: 2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
# asm 1: umlal <vec_product=reg128#16.2d, <vec_4x_2p30m1=reg128#9.2s, <vec_l0=reg128#7.s[0]
# asm 2: umlal <vec_product=v15.2d, <vec_4x_2p30m1=v8.2s, <vec_l0=v6.s[0]
umlal v15.2d, v8.2s, v6.s[0]

# qhasm: vec_accu = vec_product & vec_2x_2p30m1
# asm 1: and >vec_accu=reg128#10.16b, <vec_product=reg128#16.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_accu=v9.16b, <vec_product=v15.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v15.16b, v7.16b

# qhasm: 2x vec_tmp0 += vec_accu
# asm 1: add <vec_tmp0=reg128#12.2d, <vec_tmp0=reg128#12.2d, <vec_accu=reg128#10.2d
# asm 2: add <vec_tmp0=v11.2d, <vec_tmp0=v11.2d, <vec_accu=v9.2d
add v11.2d, v11.2d, v9.2d

# qhasm: 2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
# asm 1: umlal <vec_product=reg128#16.2d, <vec_4x_2p30m1=reg128#9.2s, <vec_l0=reg128#7.s[0]
# asm 2: umlal <vec_product=v15.2d, <vec_4x_2p30m1=v8.2s, <vec_l0=v6.s[0]
umlal v15.2d, v8.2s, v6.s[0]

# qhasm: vec_accu = vec_product & vec_2x_2p30m1
# asm 1: and >vec_accu=reg128#10.16b, <vec_product=reg128#16.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_accu=v9.16b, <vec_product=v15.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v15.16b, v7.16b

# qhasm: 2x vec_tmp0 += vec_accu
# asm 1: add <vec_tmp0=reg128#12.2d, <vec_tmp0=reg128#12.2d, <vec_accu=reg128#10.2d
# asm 2: add <vec_tmp0=v11.2d, <vec_tmp0=v11.2d, <vec_accu=v9.2d
add v11.2d, v11.2d, v9.2d

# qhasm: 2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
# asm 1: umlal <vec_product=reg128#16.2d, <vec_4x_2p30m1=reg128#9.2s, <vec_l0=reg128#7.s[0]
# asm 2: umlal <vec_product=v15.2d, <vec_4x_2p30m1=v8.2s, <vec_l0=v6.s[0]
umlal v15.2d, v8.2s, v6.s[0]

# qhasm: vec_accu = vec_product & vec_2x_2p30m1
# asm 1: and >vec_accu=reg128#10.16b, <vec_product=reg128#16.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_accu=v9.16b, <vec_product=v15.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v15.16b, v7.16b

# qhasm: 2x vec_tmp0 += vec_accu
# asm 1: add <vec_tmp0=reg128#12.2d, <vec_tmp0=reg128#12.2d, <vec_accu=reg128#10.2d
# asm 2: add <vec_tmp0=v11.2d, <vec_tmp0=v11.2d, <vec_accu=v9.2d
add v11.2d, v11.2d, v9.2d

# qhasm: 2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
# asm 1: umlal <vec_product=reg128#16.2d, <vec_4x_2p30m1=reg128#9.2s, <vec_l0=reg128#7.s[0]
# asm 2: umlal <vec_product=v15.2d, <vec_4x_2p30m1=v8.2s, <vec_l0=v6.s[0]
umlal v15.2d, v8.2s, v6.s[0]

# qhasm: vec_accu = vec_product & vec_2x_2p30m1
# asm 1: and >vec_accu=reg128#10.16b, <vec_product=reg128#16.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_accu=v9.16b, <vec_product=v15.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v15.16b, v7.16b

# qhasm: 2x vec_tmp0 += vec_accu
# asm 1: add <vec_tmp0=reg128#12.2d, <vec_tmp0=reg128#12.2d, <vec_accu=reg128#10.2d
# asm 2: add <vec_tmp0=v11.2d, <vec_tmp0=v11.2d, <vec_accu=v9.2d
add v11.2d, v11.2d, v9.2d

# qhasm: 2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
# asm 1: umlal <vec_product=reg128#16.2d, <vec_4x_2p30m1=reg128#9.2s, <vec_l0=reg128#7.s[0]
# asm 2: umlal <vec_product=v15.2d, <vec_4x_2p30m1=v8.2s, <vec_l0=v6.s[0]
umlal v15.2d, v8.2s, v6.s[0]

# qhasm: vec_accu = vec_product & vec_2x_2p30m1
# asm 1: and >vec_accu=reg128#9.16b, <vec_product=reg128#16.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_accu=v8.16b, <vec_product=v15.16b, <vec_2x_2p30m1=v7.16b
and v8.16b, v15.16b, v7.16b

# qhasm: 2x vec_tmp0 += vec_accu
# asm 1: add <vec_tmp0=reg128#12.2d, <vec_tmp0=reg128#12.2d, <vec_accu=reg128#9.2d
# asm 2: add <vec_tmp0=v11.2d, <vec_tmp0=v11.2d, <vec_accu=v8.2d
add v11.2d, v11.2d, v8.2d

# qhasm: 2x vec_product += vec_4x_2p15m1[0] unsigned* vec_l0[0/4]
# asm 1: umlal <vec_product=reg128#16.2d, <vec_4x_2p15m1=reg128#11.2s, <vec_l0=reg128#7.s[0]
# asm 2: umlal <vec_product=v15.2d, <vec_4x_2p15m1=v10.2s, <vec_l0=v6.s[0]
umlal v15.2d, v10.2s, v6.s[0]

# qhasm: vec_accu = vec_product & vec_2x_2p30m1
# asm 1: and >vec_accu=reg128#7.16b, <vec_product=reg128#16.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_accu=v6.16b, <vec_product=v15.16b, <vec_2x_2p30m1=v7.16b
and v6.16b, v15.16b, v7.16b

# qhasm: 2x vec_tmp0 += vec_accu
# asm 1: add <vec_tmp0=reg128#12.2d, <vec_tmp0=reg128#12.2d, <vec_accu=reg128#7.2d
# asm 2: add <vec_tmp0=v11.2d, <vec_tmp0=v11.2d, <vec_accu=v6.2d
add v11.2d, v11.2d, v6.2d

# qhasm: reg128 vec_carry

# qhasm: 2x vec_carry = 0
# asm 1: movi >vec_carry=reg128#7.2d, #0
# asm 2: movi >vec_carry=v6.2d, #0
movi v6.2d, #0

# qhasm: 2x vec_carry = vec_tmp0 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#9.2d, <vec_tmp0=reg128#12.2d, #30
# asm 2: ushr >vec_carry=v8.2d, <vec_tmp0=v11.2d, #30
ushr v8.2d, v11.2d, #30

# qhasm: vec_tmp0 = vec_tmp0 & vec_2x_2p30m1
# asm 1: and >vec_tmp0=reg128#18.16b, <vec_tmp0=reg128#12.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp0=v17.16b, <vec_tmp0=v11.16b, <vec_2x_2p30m1=v7.16b
and v17.16b, v11.16b, v7.16b

# qhasm: 2x vec_tmp1 = vec_tmp1 + vec_carry
# asm 1: add >vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#1.2d, <vec_carry=reg128#9.2d
# asm 2: add >vec_tmp1=v0.2d, <vec_tmp1=v0.2d, <vec_carry=v8.2d
add v0.2d, v0.2d, v8.2d

# qhasm: 2x vec_carry = vec_tmp1 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#9.2d, <vec_tmp1=reg128#1.2d, #30
# asm 2: ushr >vec_carry=v8.2d, <vec_tmp1=v0.2d, #30
ushr v8.2d, v0.2d, #30

# qhasm: vec_tmp1 = vec_tmp1 & vec_2x_2p30m1
# asm 1: and >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_2x_2p30m1=v7.16b
and v0.16b, v0.16b, v7.16b

# qhasm: 2x vec_tmp2 = vec_tmp2 + vec_carry
# asm 1: add >vec_tmp2=reg128#9.2d, <vec_tmp2=reg128#13.2d, <vec_carry=reg128#9.2d
# asm 2: add >vec_tmp2=v8.2d, <vec_tmp2=v12.2d, <vec_carry=v8.2d
add v8.2d, v12.2d, v8.2d

# qhasm: 2x vec_carry = vec_tmp2 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#10.2d, <vec_tmp2=reg128#9.2d, #30
# asm 2: ushr >vec_carry=v9.2d, <vec_tmp2=v8.2d, #30
ushr v9.2d, v8.2d, #30

# qhasm: vec_tmp2 = vec_tmp2 & vec_2x_2p30m1
# asm 1: and >vec_tmp2=reg128#19.16b, <vec_tmp2=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp2=v18.16b, <vec_tmp2=v8.16b, <vec_2x_2p30m1=v7.16b
and v18.16b, v8.16b, v7.16b

# qhasm: 2x vec_tmp3 = vec_tmp3 + vec_carry
# asm 1: add >vec_tmp3=reg128#2.2d, <vec_tmp3=reg128#2.2d, <vec_carry=reg128#10.2d
# asm 2: add >vec_tmp3=v1.2d, <vec_tmp3=v1.2d, <vec_carry=v9.2d
add v1.2d, v1.2d, v9.2d

# qhasm: 2x vec_carry = vec_tmp3 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#9.2d, <vec_tmp3=reg128#2.2d, #30
# asm 2: ushr >vec_carry=v8.2d, <vec_tmp3=v1.2d, #30
ushr v8.2d, v1.2d, #30

# qhasm: vec_tmp3 = vec_tmp3 & vec_2x_2p30m1
# asm 1: and >vec_tmp3=reg128#2.16b, <vec_tmp3=reg128#2.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp3=v1.16b, <vec_tmp3=v1.16b, <vec_2x_2p30m1=v7.16b
and v1.16b, v1.16b, v7.16b

# qhasm: 2x vec_tmp4 = vec_tmp4 + vec_carry
# asm 1: add >vec_tmp4=reg128#9.2d, <vec_tmp4=reg128#14.2d, <vec_carry=reg128#9.2d
# asm 2: add >vec_tmp4=v8.2d, <vec_tmp4=v13.2d, <vec_carry=v8.2d
add v8.2d, v13.2d, v8.2d

# qhasm: 2x vec_carry = vec_tmp4 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#10.2d, <vec_tmp4=reg128#9.2d, #30
# asm 2: ushr >vec_carry=v9.2d, <vec_tmp4=v8.2d, #30
ushr v9.2d, v8.2d, #30

# qhasm: vec_tmp4 = vec_tmp4 & vec_2x_2p30m1
# asm 1: and >vec_tmp4=reg128#20.16b, <vec_tmp4=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp4=v19.16b, <vec_tmp4=v8.16b, <vec_2x_2p30m1=v7.16b
and v19.16b, v8.16b, v7.16b

# qhasm: 2x vec_tmp5 = vec_tmp5 + vec_carry
# asm 1: add >vec_tmp5=reg128#3.2d, <vec_tmp5=reg128#3.2d, <vec_carry=reg128#10.2d
# asm 2: add >vec_tmp5=v2.2d, <vec_tmp5=v2.2d, <vec_carry=v9.2d
add v2.2d, v2.2d, v9.2d

# qhasm: 2x vec_carry = vec_tmp5 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#9.2d, <vec_tmp5=reg128#3.2d, #30
# asm 2: ushr >vec_carry=v8.2d, <vec_tmp5=v2.2d, #30
ushr v8.2d, v2.2d, #30

# qhasm: vec_tmp5 = vec_tmp5 & vec_2x_2p30m1
# asm 1: and >vec_tmp5=reg128#3.16b, <vec_tmp5=reg128#3.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp5=v2.16b, <vec_tmp5=v2.16b, <vec_2x_2p30m1=v7.16b
and v2.16b, v2.16b, v7.16b

# qhasm: 2x vec_tmp6 = vec_tmp6 + vec_carry
# asm 1: add >vec_tmp6=reg128#9.2d, <vec_tmp6=reg128#15.2d, <vec_carry=reg128#9.2d
# asm 2: add >vec_tmp6=v8.2d, <vec_tmp6=v14.2d, <vec_carry=v8.2d
add v8.2d, v14.2d, v8.2d

# qhasm: 2x vec_carry = vec_tmp6 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#10.2d, <vec_tmp6=reg128#9.2d, #30
# asm 2: ushr >vec_carry=v9.2d, <vec_tmp6=v8.2d, #30
ushr v9.2d, v8.2d, #30

# qhasm: vec_tmp6 = vec_tmp6 & vec_2x_2p30m1
# asm 1: and >vec_tmp6=reg128#21.16b, <vec_tmp6=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp6=v20.16b, <vec_tmp6=v8.16b, <vec_2x_2p30m1=v7.16b
and v20.16b, v8.16b, v7.16b

# qhasm: 2x vec_tmp7 = vec_tmp7 + vec_carry
# asm 1: add >vec_tmp7=reg128#4.2d, <vec_tmp7=reg128#4.2d, <vec_carry=reg128#10.2d
# asm 2: add >vec_tmp7=v3.2d, <vec_tmp7=v3.2d, <vec_carry=v9.2d
add v3.2d, v3.2d, v9.2d

# qhasm: 2x vec_carry = vec_tmp7 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#9.2d, <vec_tmp7=reg128#4.2d, #30
# asm 2: ushr >vec_carry=v8.2d, <vec_tmp7=v3.2d, #30
ushr v8.2d, v3.2d, #30

# qhasm: vec_tmp7 = vec_tmp7 & vec_2x_2p30m1
# asm 1: and >vec_tmp7=reg128#4.16b, <vec_tmp7=reg128#4.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp7=v3.16b, <vec_tmp7=v3.16b, <vec_2x_2p30m1=v7.16b
and v3.16b, v3.16b, v7.16b

# qhasm: 2x vec_tmp8 = vec_tmp8 + vec_carry
# asm 1: add >vec_tmp8=reg128#5.2d, <vec_tmp8=reg128#5.2d, <vec_carry=reg128#9.2d
# asm 2: add >vec_tmp8=v4.2d, <vec_tmp8=v4.2d, <vec_carry=v8.2d
add v4.2d, v4.2d, v8.2d

# qhasm: 2x vec_carry = vec_tmp8 unsigned>> 30
# asm 1: ushr >vec_carry=reg128#9.2d, <vec_tmp8=reg128#5.2d, #30
# asm 2: ushr >vec_carry=v8.2d, <vec_tmp8=v4.2d, #30
ushr v8.2d, v4.2d, #30

# qhasm: vec_tmp8 = vec_tmp8 & vec_2x_2p30m1
# asm 1: and >vec_tmp8=reg128#5.16b, <vec_tmp8=reg128#5.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_tmp8=v4.16b, <vec_tmp8=v4.16b, <vec_2x_2p30m1=v7.16b
and v4.16b, v4.16b, v7.16b

# qhasm: 2x vec_tmp9 = vec_tmp9 + vec_carry
# asm 1: add >vec_tmp9=reg128#6.2d, <vec_tmp9=reg128#6.2d, <vec_carry=reg128#9.2d
# asm 2: add >vec_tmp9=v5.2d, <vec_tmp9=v5.2d, <vec_carry=v8.2d
add v5.2d, v5.2d, v8.2d

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
