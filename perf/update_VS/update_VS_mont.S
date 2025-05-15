
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

# qhasm: reg128 vec_F0_F1_G0_G1

# qhasm: assign v0 to vec_F0_F1_G0_G1

# qhasm: reg128 vec_F2_F3_G2_G3

# qhasm: assign v1 to vec_F2_F3_G2_G3

# qhasm: reg128 vec_F4_F5_G4_G5

# qhasm: assign v2 to vec_F4_F5_G4_G5

# qhasm: reg128 vec_F6_F7_G6_G7

# qhasm: assign v3 to vec_F6_F7_G6_G7

# qhasm: reg128 vec_F8_F9_G8_G9

# qhasm: assign v4 to vec_F8_F9_G8_G9

# qhasm: reg128 vec_V0_V1_S0_S1

# qhasm: assign v5 to vec_V0_V1_S0_S1

# qhasm: reg128 vec_V2_V3_S2_S3

# qhasm: assign v6 to vec_V2_V3_S2_S3

# qhasm: reg128 vec_V4_V5_S4_S5

# qhasm: assign v7 to vec_V4_V5_S4_S5

# qhasm: reg128 vec_V6_V7_S6_S7

# qhasm: assign v8 to vec_V6_V7_S6_S7

# qhasm: reg128 vec_V8_V9_S8_S9

# qhasm: assign v9 to vec_V8_V9_S8_S9

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: assign v10 to vec_uu0_rr0_vv0_ss0

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: assign v11 to vec_uu1_rr1_vv1_ss1

# qhasm: reg128 vec_uuhat_rrhat_vvhat_sshat

# qhasm: assign v12 to vec_uuhat_rrhat_vvhat_sshat

# qhasm: reg128 vec_2x_2p30m1

# qhasm: assign v13 to vec_2x_2p30m1

# qhasm: int64 2p30m1

# qhasm: 2p30m1 = 1073741823
# asm 1: mov >2p30m1=int64#4, #1073741823
# asm 2: mov >2p30m1=x3, #1073741823
mov x3, #1073741823

# qhasm: 2x vec_2x_2p30m1 = 2p30m1
# asm 1: dup <vec_2x_2p30m1=reg128#14.2d, <2p30m1=int64#4
# asm 2: dup <vec_2x_2p30m1=v13.2d, <2p30m1=x3
dup v13.2d, x3

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7

# qhasm: int64 V8V9

# # qhasm: V0V1, V2V3 = mem128[pointerV]
# # asm 1: ldp >V0V1=int64#5, >V2V3=int64#6, [<pointerV=int64#1]
# # asm 2: ldp >V0V1=x4, >V2V3=x5, [<pointerV=x0]
# # ldp x4, x5, [x0]

# # qhasm: V4V5, V6V7 = mem128[pointerV+16]
# # asm 1: ldp >V4V5=int64#7, >V6V7=int64#8, [<pointerV=int64#1, #16]
# # asm 2: ldp >V4V5=x6, >V6V7=x7, [<pointerV=x0, #16]
# ldp x6, x7, [x0, #16]

# # qhasm: V8V9 = mem32[pointerV+32]
# # asm 1: ldr >V8V9=int64#9%wregname, [<pointerV=int64#1, #32]
# # asm 2: ldr >V8V9=w8, [<pointerV=x0, #32]
# ldr w8, [x0, #32]

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 S4S5

# qhasm: int64 S6S7

# qhasm: int64 S8S9

# # qhasm: S0S1, S2S3 = mem128[pointerS]
# # asm 1: ldp >S0S1=int64#10, >S2S3=int64#11, [<pointerS=int64#2]
# # asm 2: ldp >S0S1=x9, >S2S3=x10, [<pointerS=x1]
# ldp x9, x10, [x1]

# # qhasm: S4S5, S6S7 = mem128[pointerS+16]
# # asm 1: ldp >S4S5=int64#12, >S6S7=int64#13, [<pointerS=int64#2, #16]
# # asm 2: ldp >S4S5=x11, >S6S7=x12, [<pointerS=x1, #16]
# ldp x11, x12, [x1, #16]

# # qhasm: S8S9 = mem32[pointerS+32]
# # asm 1: ldr >S8S9=int64#14%wregname, [<pointerS=int64#2, #32]
# # asm 2: ldr >S8S9=w13, [<pointerS=x1, #32]
# ldr w13, [x1, #32]

# qhasm: vec_V0_V1_S0_S1[0/2] = V0V1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#6.d[0], <V0V1=int64#5
# asm 2: ins <vec_V0_V1_S0_S1=v5.d[0], <V0V1=x4
ins v5.d[0], x4

# qhasm: vec_V0_V1_S0_S1[1/2] = S0S1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#6.d[1], <S0S1=int64#10
# asm 2: ins <vec_V0_V1_S0_S1=v5.d[1], <S0S1=x9
ins v5.d[1], x9

# qhasm: vec_V2_V3_S2_S3[0/2] = V2V3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#7.d[0], <V2V3=int64#6
# asm 2: ins <vec_V2_V3_S2_S3=v6.d[0], <V2V3=x5
ins v6.d[0], x5

# qhasm: vec_V2_V3_S2_S3[1/2] = S2S3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#7.d[1], <S2S3=int64#11
# asm 2: ins <vec_V2_V3_S2_S3=v6.d[1], <S2S3=x10
ins v6.d[1], x10

# qhasm: vec_V4_V5_S4_S5[0/2] = V4V5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#8.d[0], <V4V5=int64#7
# asm 2: ins <vec_V4_V5_S4_S5=v7.d[0], <V4V5=x6
ins v7.d[0], x6

# qhasm: vec_V4_V5_S4_S5[1/2] = S4S5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#8.d[1], <S4S5=int64#12
# asm 2: ins <vec_V4_V5_S4_S5=v7.d[1], <S4S5=x11
ins v7.d[1], x11

# qhasm: vec_V6_V7_S6_S7[0/2] = V6V7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#9.d[0], <V6V7=int64#8
# asm 2: ins <vec_V6_V7_S6_S7=v8.d[0], <V6V7=x7
ins v8.d[0], x7

# qhasm: vec_V6_V7_S6_S7[1/2] = S6S7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#9.d[1], <S6S7=int64#13
# asm 2: ins <vec_V6_V7_S6_S7=v8.d[1], <S6S7=x12
ins v8.d[1], x12

# qhasm: vec_V8_V9_S8_S9[0/2] = V8V9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#10.d[0], <V8V9=int64#9
# asm 2: ins <vec_V8_V9_S8_S9=v9.d[0], <V8V9=x8
ins v9.d[0], x8

# qhasm: vec_V8_V9_S8_S9[1/2] = S8S9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#10.d[1], <S8S9=int64#14
# asm 2: ins <vec_V8_V9_S8_S9=v9.d[1], <S8S9=x13
ins v9.d[1], x13

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss

# # qhasm: uu, vv = mem128[pointeruuvvrrss + 0]
# # asm 1: ldp >uu=int64#5, >vv=int64#6, [<pointeruuvvrrss=int64#3, #0]
# # asm 2: ldp >uu=x4, >vv=x5, [<pointeruuvvrrss=x2, #0]
# ldp x4, x5, [x2, #0]

# # qhasm: rr, ss = mem128[pointeruuvvrrss + 16]
# # asm 1: ldp >rr=int64#3, >ss=int64#7, [<pointeruuvvrrss=int64#3, #16]
# # asm 2: ldp >rr=x2, >ss=x6, [<pointeruuvvrrss=x2, #16]
# ldp x2, x6, [x2, #16]

# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#8, <uu=int64#5, #0, #30
# asm 2: ubfx >uu0=x7, <uu=x4, #0, #30
ubfx x7, x4, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#5, <uu=int64#5, #30, #32
# asm 2: ubfx >uu1=x4, <uu=x4, #30, #32
ubfx x4, x4, #30, #32

# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#9, <vv=int64#6, #0, #30
# asm 2: ubfx >vv0=x8, <vv=x5, #0, #30
ubfx x8, x5, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#6, <vv=int64#6, #30, #32
# asm 2: ubfx >vv1=x5, <vv=x5, #30, #32
ubfx x5, x5, #30, #32

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#10, <rr=int64#3, #0, #30
# asm 2: ubfx >rr0=x9, <rr=x2, #0, #30
ubfx x9, x2, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#3, <rr=int64#3, #30, #32
# asm 2: ubfx >rr1=x2, <rr=x2, #30, #32
ubfx x2, x2, #30, #32

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#11, <ss=int64#7, #0, #30
# asm 2: ubfx >ss0=x10, <ss=x6, #0, #30
ubfx x10, x6, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#7, <ss=int64#7, #30, #32
# asm 2: ubfx >ss1=x6, <ss=x6, #30, #32
ubfx x6, x6, #30, #32

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#11.s[0], <uu0=int64#8%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v10.s[0], <uu0=w7
ins v10.s[0], w7

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#11.s[1], <rr0=int64#10%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v10.s[1], <rr0=w9
ins v10.s[1], w9

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#11.s[2], <vv0=int64#9%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v10.s[2], <vv0=w8
ins v10.s[2], w8

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#11.s[3], <ss0=int64#11%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v10.s[3], <ss0=w10
ins v10.s[3], w10

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#12.s[0], <uu1=int64#5%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v11.s[0], <uu1=w4
ins v11.s[0], w4

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#12.s[1], <rr1=int64#3%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v11.s[1], <rr1=w2
ins v11.s[1], w2

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#12.s[2], <vv1=int64#6%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v11.s[2], <vv1=w5
ins v11.s[2], w5

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#12.s[3], <ss1=int64#7%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v11.s[3], <ss1=w6
ins v11.s[3], w6

# qhasm: 4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31
# asm 1: sshr <vec_uuhat_rrhat_vvhat_sshat=reg128#13.4s, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, #31
# asm 2: sshr <vec_uuhat_rrhat_vvhat_sshat=v12.4s, <vec_uu1_rr1_vv1_ss1=v11.4s, #31
sshr v12.4s, v11.4s, #31

# qhasm: reg128 front_vec_4x_2p30a2p31

# qhasm: 4x front_vec_4x_2p30a2p31 = 0xC0 << 24
# asm 1: movi <front_vec_4x_2p30a2p31=reg128#15.4s, #0xC0, lsl #24
# asm 2: movi <front_vec_4x_2p30a2p31=v14.4s, #0xC0, lsl #24
movi v14.4s, #0xC0, lsl #24

# qhasm: vec_uu1_rr1_vv1_ss1 &= ~front_vec_4x_2p30a2p31
# asm 1: bic <vec_uu1_rr1_vv1_ss1=reg128#12.16b, <vec_uu1_rr1_vv1_ss1=reg128#12.16b, <front_vec_4x_2p30a2p31=reg128#15.16b
# asm 2: bic <vec_uu1_rr1_vv1_ss1=v11.16b, <vec_uu1_rr1_vv1_ss1=v11.16b, <front_vec_4x_2p30a2p31=v14.16b
bic v11.16b, v11.16b, v14.16b

# qhasm: reg128 vec_prod

# qhasm: 2x vec_prod = 0
# asm 1: movi <vec_prod=reg128#15.2d, #0
# asm 2: movi <vec_prod=v14.2d, #0
movi v14.2d, #0

# qhasm: reg128 vec_prod_1

# qhasm: 2x vec_prod_1 = 0
# asm 1: movi <vec_prod_1=reg128#15.2d, #0
# asm 2: movi <vec_prod_1=v14.2d, #0
movi v14.2d, #0

# qhasm: reg128 vec_buf

# qhasm: int64 2p30m19

# qhasm: int64 2p15m1

# qhasm: reg128 vec_2x_2p30m19

# qhasm: reg128 vec_2x_2p15m1

# qhasm: 2p30m19 = 2p30m1 - 18
# asm 1: sub >2p30m19=int64#3,<2p30m1=int64#4,#18
# asm 2: sub >2p30m19=x2,<2p30m1=x3,#18
sub x2,x3,#18

# qhasm: 2p15m1 = 2p30m1 unsigned>> 15
# asm 1: lsr >2p15m1=int64#4, <2p30m1=int64#4, #15
# asm 2: lsr >2p15m1=x3, <2p30m1=x3, #15
lsr x3, x3, #15

# qhasm: 2x vec_2x_2p30m19 = 2p30m19
# asm 1: dup <vec_2x_2p30m19=reg128#15.2d, <2p30m19=int64#3
# asm 2: dup <vec_2x_2p30m19=v14.2d, <2p30m19=x2
dup v14.2d, x2

# qhasm: 2x vec_2x_2p15m1 = 2p15m1
# asm 1: dup <vec_2x_2p15m1=reg128#16.2d, <2p15m1=int64#4
# asm 2: dup <vec_2x_2p15m1=v15.2d, <2p15m1=x3
dup v15.2d, x3

# qhasm: int64 M

# qhasm: M = 0
# asm 1: mov >M=int64#3, #0
# asm 2: mov >M=x2, #0
mov x2, #0

# qhasm: M[0/4] = 51739
# asm 1: movk <M=int64#3, #51739
# asm 2: movk <M=x2, #51739
movk x2, #51739

# qhasm: M[1/4] = 10347
# asm 1: movk <M=int64#3, #10347,LSL #16
# asm 2: movk <M=x2, #10347,LSL #16
movk x2, #10347,LSL #16

# qhasm: reg128 vec_M

# qhasm: 4x vec_M = M
# asm 1: dup <vec_M=reg128#17.4s, <M=int64#3%wregname
# asm 2: dup <vec_M=v16.4s, <M=w2
dup v16.4s, w2

# qhasm: reg128 vec_l0_V

# qhasm: reg128 vec_l0_S

# qhasm: reg128 vec_l1_V

# qhasm: reg128 vec_l1_S

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[0/4]
# asm 1: umull >vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.2s, <vec_V0_V1_S0_S1=reg128#6.s[0]
# asm 2: umull >vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.2s, <vec_V0_V1_S0_S1=v5.s[0]
umull v17.2d, v10.2s, v5.s[0]

# qhasm: 4x vec_l0_V = vec_prod * vec_M
# asm 1: mul >vec_l0_V=reg128#19.4s,<vec_prod=reg128#18.4s,<vec_M=reg128#17.4s
# asm 2: mul >vec_l0_V=v18.4s,<vec_prod=v17.4s,<vec_M=v16.4s
mul v18.4s,v17.4s,v16.4s

# qhasm: vec_l0_V &= vec_2x_2p30m1
# asm 1: and <vec_l0_V=reg128#19.16b, <vec_l0_V=reg128#19.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and <vec_l0_V=v18.16b, <vec_l0_V=v18.16b, <vec_2x_2p30m1=v13.16b
and v18.16b, v18.16b, v13.16b

# qhasm: 4x vec_l0_V = vec_l0_V[0/4] vec_l0_V[2/4] vec_l0_V[0/4] vec_l0_V[2/4]
# asm 1: uzp1 >vec_l0_V=reg128#19.4s, <vec_l0_V=reg128#19.4s, <vec_l0_V=reg128#19.4s
# asm 2: uzp1 >vec_l0_V=v18.4s, <vec_l0_V=v18.4s, <vec_l0_V=v18.4s
uzp1 v18.4s, v18.4s, v18.4s

# qhasm: 2x vec_prod += vec_l0_V[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l0_V=reg128#19.2s, <vec_2x_2p30m19=reg128#15.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l0_V=v18.2s, <vec_2x_2p30m19=v14.s[0]
umlal v17.2d, v18.2s, v14.s[0]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[1/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.2s, <vec_V0_V1_S0_S1=reg128#6.s[1]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.2s, <vec_V0_V1_S0_S1=v5.s[1]
umlal v17.2d, v10.2s, v5.s[1]

# qhasm: 2x vec_prod += vec_l0_V[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l0_V=reg128#19.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l0_V=v18.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v18.2s, v13.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.2s, <vec_V0_V1_S0_S1=reg128#6.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.2s, <vec_V0_V1_S0_S1=v5.s[0]
umlal v17.2d, v11.2s, v5.s[0]

# qhasm: 4x vec_l1_V = vec_prod * vec_M
# asm 1: mul >vec_l1_V=reg128#20.4s,<vec_prod=reg128#18.4s,<vec_M=reg128#17.4s
# asm 2: mul >vec_l1_V=v19.4s,<vec_prod=v17.4s,<vec_M=v16.4s
mul v19.4s,v17.4s,v16.4s

# qhasm: vec_l1_V &= vec_2x_2p30m1
# asm 1: and <vec_l1_V=reg128#20.16b, <vec_l1_V=reg128#20.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and <vec_l1_V=v19.16b, <vec_l1_V=v19.16b, <vec_2x_2p30m1=v13.16b
and v19.16b, v19.16b, v13.16b

# qhasm: 4x vec_l1_V = vec_l1_V[0/4] vec_l1_V[2/4] vec_l1_V[0/4] vec_l1_V[2/4]
# asm 1: uzp1 >vec_l1_V=reg128#20.4s, <vec_l1_V=reg128#20.4s, <vec_l1_V=reg128#20.4s
# asm 2: uzp1 >vec_l1_V=v19.4s, <vec_l1_V=v19.4s, <vec_l1_V=v19.4s
uzp1 v19.4s, v19.4s, v19.4s

# qhasm: 2x vec_prod += vec_l1_V[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l1_V=reg128#20.2s, <vec_2x_2p30m19=reg128#15.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l1_V=v19.2s, <vec_2x_2p30m19=v14.s[0]
umlal v17.2d, v19.2s, v14.s[0]

# qhasm:                     2x vec_prod_1 = vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V0_V1_S0_S1[2/4]
# asm 1: umull2 >vec_prod_1=reg128#21.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.4s, <vec_V0_V1_S0_S1=reg128#6.s[2]
# asm 2: umull2 >vec_prod_1=v20.2d, <vec_uu0_rr0_vv0_ss0=v10.4s, <vec_V0_V1_S0_S1=v5.s[2]
umull2 v20.2d, v10.4s, v5.s[2]

# qhasm:                     4x vec_l0_S = vec_prod_1 * vec_M
# asm 1: mul >vec_l0_S=reg128#22.4s,<vec_prod_1=reg128#21.4s,<vec_M=reg128#17.4s
# asm 2: mul >vec_l0_S=v21.4s,<vec_prod_1=v20.4s,<vec_M=v16.4s
mul v21.4s,v20.4s,v16.4s

# qhasm:                     vec_l0_S &= vec_2x_2p30m1
# asm 1: and <vec_l0_S=reg128#22.16b, <vec_l0_S=reg128#22.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and <vec_l0_S=v21.16b, <vec_l0_S=v21.16b, <vec_2x_2p30m1=v13.16b
and v21.16b, v21.16b, v13.16b

# qhasm:                     4x vec_l0_S = vec_l0_S[0/4] vec_l0_S[2/4] vec_l0_S[0/4] vec_l0_S[2/4]
# asm 1: uzp1 >vec_l0_S=reg128#22.4s, <vec_l0_S=reg128#22.4s, <vec_l0_S=reg128#22.4s
# asm 2: uzp1 >vec_l0_S=v21.4s, <vec_l0_S=v21.4s, <vec_l0_S=v21.4s
uzp1 v21.4s, v21.4s, v21.4s

# qhasm:                     2x vec_prod_1 += vec_l0_S[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod_1=reg128#21.2d, <vec_l0_S=reg128#22.2s, <vec_2x_2p30m19=reg128#15.s[0]
# asm 2: umlal <vec_prod_1=v20.2d, <vec_l0_S=v21.2s, <vec_2x_2p30m19=v14.s[0]
umlal v20.2d, v21.2s, v14.s[0]

# qhasm:                     2x vec_prod_1 >>= 30
# asm 1: sshr >vec_prod_1=reg128#21.2d, <vec_prod_1=reg128#21.2d, #30
# asm 2: sshr >vec_prod_1=v20.2d, <vec_prod_1=v20.2d, #30
sshr v20.2d, v20.2d, #30

# qhasm:                     2x vec_prod_1 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V0_V1_S0_S1[3/4]
# asm 1: umlal2 <vec_prod_1=reg128#21.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.4s, <vec_V0_V1_S0_S1=reg128#6.s[3]
# asm 2: umlal2 <vec_prod_1=v20.2d, <vec_uu0_rr0_vv0_ss0=v10.4s, <vec_V0_V1_S0_S1=v5.s[3]
umlal2 v20.2d, v10.4s, v5.s[3]

# qhasm:                     2x vec_prod_1 += vec_l0_S[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod_1=reg128#21.2d, <vec_l0_S=reg128#22.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod_1=v20.2d, <vec_l0_S=v21.2s, <vec_2x_2p30m1=v13.s[0]
umlal v20.2d, v21.2s, v13.s[0]

# qhasm:                     2x vec_prod_1 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V0_V1_S0_S1[2/4]
# asm 1: umlal2 <vec_prod_1=reg128#21.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, <vec_V0_V1_S0_S1=reg128#6.s[2]
# asm 2: umlal2 <vec_prod_1=v20.2d, <vec_uu1_rr1_vv1_ss1=v11.4s, <vec_V0_V1_S0_S1=v5.s[2]
umlal2 v20.2d, v11.4s, v5.s[2]

# qhasm:                     4x vec_l1_S = vec_prod_1 * vec_M
# asm 1: mul >vec_l1_S=reg128#17.4s,<vec_prod_1=reg128#21.4s,<vec_M=reg128#17.4s
# asm 2: mul >vec_l1_S=v16.4s,<vec_prod_1=v20.4s,<vec_M=v16.4s
mul v16.4s,v20.4s,v16.4s

# qhasm:                     vec_l1_S &= vec_2x_2p30m1
# asm 1: and <vec_l1_S=reg128#17.16b, <vec_l1_S=reg128#17.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and <vec_l1_S=v16.16b, <vec_l1_S=v16.16b, <vec_2x_2p30m1=v13.16b
and v16.16b, v16.16b, v13.16b

# qhasm:                     4x vec_l1_S = vec_l1_S[0/4] vec_l1_S[2/4] vec_l1_S[0/4] vec_l1_S[2/4]
# asm 1: uzp1 >vec_l1_S=reg128#17.4s, <vec_l1_S=reg128#17.4s, <vec_l1_S=reg128#17.4s
# asm 2: uzp1 >vec_l1_S=v16.4s, <vec_l1_S=v16.4s, <vec_l1_S=v16.4s
uzp1 v16.4s, v16.4s, v16.4s

# qhasm:                     2x vec_prod_1 += vec_l1_S[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod_1=reg128#21.2d, <vec_l1_S=reg128#17.2s, <vec_2x_2p30m19=reg128#15.s[0]
# asm 2: umlal <vec_prod_1=v20.2d, <vec_l1_S=v16.2s, <vec_2x_2p30m19=v14.s[0]
umlal v20.2d, v16.2s, v14.s[0]

# qhasm: reg128 vec_Vp0_Vp1_Sp0_Sp1

# qhasm: reg128 vec_Vp2_Vp3_Sp2_Sp3

# qhasm: reg128 vec_Vp4_Vp5_Sp4_Sp5

# qhasm: reg128 vec_Vp6_Vp7_Sp6_Sp7

# qhasm: reg128 vec_Vp8_Vp9_Sp8_Sp9

# qhasm: reg128 vec_l0

# qhasm: reg128 vec_l1

# qhasm: 2x vec_l0 = vec_l0_V + vec_l0_S
# asm 1: add >vec_l0=reg128#15.2d, <vec_l0_V=reg128#19.2d, <vec_l0_S=reg128#22.2d
# asm 2: add >vec_l0=v14.2d, <vec_l0_V=v18.2d, <vec_l0_S=v21.2d
add v14.2d, v18.2d, v21.2d

# qhasm: 2x vec_l1 = vec_l1_V + vec_l1_S
# asm 1: add >vec_l1=reg128#17.2d, <vec_l1_V=reg128#20.2d, <vec_l1_S=reg128#17.2d
# asm 2: add >vec_l1=v16.2d, <vec_l1_V=v19.2d, <vec_l1_S=v16.2d
add v16.2d, v19.2d, v16.2d

# qhasm: 2x vec_prod = vec_prod + vec_prod_1
# asm 1: add >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, <vec_prod_1=reg128#21.2d
# asm 2: add >vec_prod=v17.2d, <vec_prod=v17.2d, <vec_prod_1=v20.2d
add v17.2d, v17.2d, v20.2d

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.2s, <vec_V2_V3_S2_S3=reg128#7.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.2s, <vec_V2_V3_S2_S3=v6.s[0]
umlal v17.2d, v10.2s, v6.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V2_V3_S2_S3[2/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.4s, <vec_V2_V3_S2_S3=reg128#7.s[2]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.4s, <vec_V2_V3_S2_S3=v6.s[2]
umlal2 v17.2d, v10.4s, v6.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[1/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.2s, <vec_V0_V1_S0_S1=reg128#6.s[1]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.2s, <vec_V0_V1_S0_S1=v5.s[1]
umlal v17.2d, v11.2s, v5.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V0_V1_S0_S1[3/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, <vec_V0_V1_S0_S1=reg128#6.s[3]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.4s, <vec_V0_V1_S0_S1=v5.s[3]
umlal2 v17.2d, v11.4s, v5.s[3]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l0=reg128#15.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l0=v14.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v14.2s, v13.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l1=reg128#17.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l1=v16.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v16.2s, v13.s[0]

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp0_Vp1_Sp0_Sp1=reg128#19.16b, <vec_prod=reg128#18.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and >vec_Vp0_Vp1_Sp0_Sp1=v18.16b, <vec_prod=v17.16b, <vec_2x_2p30m1=v13.16b
and v18.16b, v17.16b, v13.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[1/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.2s, <vec_V2_V3_S2_S3=reg128#7.s[1]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.2s, <vec_V2_V3_S2_S3=v6.s[1]
umlal v17.2d, v10.2s, v6.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V2_V3_S2_S3[3/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.4s, <vec_V2_V3_S2_S3=reg128#7.s[3]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.4s, <vec_V2_V3_S2_S3=v6.s[3]
umlal2 v17.2d, v10.4s, v6.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.2s, <vec_V2_V3_S2_S3=reg128#7.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.2s, <vec_V2_V3_S2_S3=v6.s[0]
umlal v17.2d, v11.2s, v6.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V2_V3_S2_S3[2/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, <vec_V2_V3_S2_S3=reg128#7.s[2]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.4s, <vec_V2_V3_S2_S3=v6.s[2]
umlal2 v17.2d, v11.4s, v6.s[2]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l0=reg128#15.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l0=v14.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v14.2s, v13.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l1=reg128#17.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l1=v16.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v16.2s, v13.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#20.16b, <vec_prod=reg128#18.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and >vec_buf=v19.16b, <vec_prod=v17.16b, <vec_2x_2p30m1=v13.16b
and v19.16b, v17.16b, v13.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#20.2d, <vec_buf=reg128#20.2d, #32
# asm 2: shl >vec_buf=v19.2d, <vec_buf=v19.2d, #32
shl v19.2d, v19.2d, #32

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 |= vec_buf
# asm 1: orr <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.16b, <vec_buf=reg128#20.16b
# asm 2: orr <vec_Vp0_Vp1_Sp0_Sp1=v18.16b, <vec_Vp0_Vp1_Sp0_Sp1=v18.16b, <vec_buf=v19.16b
orr v18.16b, v18.16b, v19.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.2s, <vec_V4_V5_S4_S5=reg128#8.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.2s, <vec_V4_V5_S4_S5=v7.s[0]
umlal v17.2d, v10.2s, v7.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V4_V5_S4_S5[2/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.4s, <vec_V4_V5_S4_S5=reg128#8.s[2]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.4s, <vec_V4_V5_S4_S5=v7.s[2]
umlal2 v17.2d, v10.4s, v7.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[1/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.2s, <vec_V2_V3_S2_S3=reg128#7.s[1]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.2s, <vec_V2_V3_S2_S3=v6.s[1]
umlal v17.2d, v11.2s, v6.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V2_V3_S2_S3[3/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, <vec_V2_V3_S2_S3=reg128#7.s[3]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.4s, <vec_V2_V3_S2_S3=v6.s[3]
umlal2 v17.2d, v11.4s, v6.s[3]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l0=reg128#15.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l0=v14.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v14.2s, v13.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l1=reg128#17.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l1=v16.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v16.2s, v13.s[0]

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp2_Vp3_Sp2_Sp3=reg128#20.16b, <vec_prod=reg128#18.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and >vec_Vp2_Vp3_Sp2_Sp3=v19.16b, <vec_prod=v17.16b, <vec_2x_2p30m1=v13.16b
and v19.16b, v17.16b, v13.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[1/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.2s, <vec_V4_V5_S4_S5=reg128#8.s[1]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.2s, <vec_V4_V5_S4_S5=v7.s[1]
umlal v17.2d, v10.2s, v7.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V4_V5_S4_S5[3/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.4s, <vec_V4_V5_S4_S5=reg128#8.s[3]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.4s, <vec_V4_V5_S4_S5=v7.s[3]
umlal2 v17.2d, v10.4s, v7.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.2s, <vec_V4_V5_S4_S5=reg128#8.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.2s, <vec_V4_V5_S4_S5=v7.s[0]
umlal v17.2d, v11.2s, v7.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V4_V5_S4_S5[2/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, <vec_V4_V5_S4_S5=reg128#8.s[2]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.4s, <vec_V4_V5_S4_S5=v7.s[2]
umlal2 v17.2d, v11.4s, v7.s[2]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l0=reg128#15.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l0=v14.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v14.2s, v13.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l1=reg128#17.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l1=v16.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v16.2s, v13.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#21.16b, <vec_prod=reg128#18.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and >vec_buf=v20.16b, <vec_prod=v17.16b, <vec_2x_2p30m1=v13.16b
and v20.16b, v17.16b, v13.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#21.2d, <vec_buf=reg128#21.2d, #32
# asm 2: shl >vec_buf=v20.2d, <vec_buf=v20.2d, #32
shl v20.2d, v20.2d, #32

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 |= vec_buf
# asm 1: orr <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.16b, <vec_buf=reg128#21.16b
# asm 2: orr <vec_Vp2_Vp3_Sp2_Sp3=v19.16b, <vec_Vp2_Vp3_Sp2_Sp3=v19.16b, <vec_buf=v20.16b
orr v19.16b, v19.16b, v20.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.2s, <vec_V6_V7_S6_S7=reg128#9.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.2s, <vec_V6_V7_S6_S7=v8.s[0]
umlal v17.2d, v10.2s, v8.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V6_V7_S6_S7[2/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.4s, <vec_V6_V7_S6_S7=reg128#9.s[2]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.4s, <vec_V6_V7_S6_S7=v8.s[2]
umlal2 v17.2d, v10.4s, v8.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[1/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.2s, <vec_V4_V5_S4_S5=reg128#8.s[1]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.2s, <vec_V4_V5_S4_S5=v7.s[1]
umlal v17.2d, v11.2s, v7.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V4_V5_S4_S5[3/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, <vec_V4_V5_S4_S5=reg128#8.s[3]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.4s, <vec_V4_V5_S4_S5=v7.s[3]
umlal2 v17.2d, v11.4s, v7.s[3]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l0=reg128#15.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l0=v14.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v14.2s, v13.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l1=reg128#17.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l1=v16.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v16.2s, v13.s[0]

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp4_Vp5_Sp4_Sp5=reg128#21.16b, <vec_prod=reg128#18.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and >vec_Vp4_Vp5_Sp4_Sp5=v20.16b, <vec_prod=v17.16b, <vec_2x_2p30m1=v13.16b
and v20.16b, v17.16b, v13.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[1/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.2s, <vec_V6_V7_S6_S7=reg128#9.s[1]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.2s, <vec_V6_V7_S6_S7=v8.s[1]
umlal v17.2d, v10.2s, v8.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V6_V7_S6_S7[3/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.4s, <vec_V6_V7_S6_S7=reg128#9.s[3]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.4s, <vec_V6_V7_S6_S7=v8.s[3]
umlal2 v17.2d, v10.4s, v8.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.2s, <vec_V6_V7_S6_S7=reg128#9.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.2s, <vec_V6_V7_S6_S7=v8.s[0]
umlal v17.2d, v11.2s, v8.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V6_V7_S6_S7[2/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, <vec_V6_V7_S6_S7=reg128#9.s[2]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.4s, <vec_V6_V7_S6_S7=v8.s[2]
umlal2 v17.2d, v11.4s, v8.s[2]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l0=reg128#15.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l0=v14.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v14.2s, v13.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l1=reg128#17.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l1=v16.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v16.2s, v13.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#22.16b, <vec_prod=reg128#18.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and >vec_buf=v21.16b, <vec_prod=v17.16b, <vec_2x_2p30m1=v13.16b
and v21.16b, v17.16b, v13.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#22.2d, <vec_buf=reg128#22.2d, #32
# asm 2: shl >vec_buf=v21.2d, <vec_buf=v21.2d, #32
shl v21.2d, v21.2d, #32

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 |= vec_buf
# asm 1: orr <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.16b, <vec_buf=reg128#22.16b
# asm 2: orr <vec_Vp4_Vp5_Sp4_Sp5=v20.16b, <vec_Vp4_Vp5_Sp4_Sp5=v20.16b, <vec_buf=v21.16b
orr v20.16b, v20.16b, v21.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V8_V9_S8_S9[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.2s, <vec_V8_V9_S8_S9=reg128#10.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.2s, <vec_V8_V9_S8_S9=v9.s[0]
umlal v17.2d, v10.2s, v9.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V8_V9_S8_S9[2/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu0_rr0_vv0_ss0=reg128#11.4s, <vec_V8_V9_S8_S9=reg128#10.s[2]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu0_rr0_vv0_ss0=v10.4s, <vec_V8_V9_S8_S9=v9.s[2]
umlal2 v17.2d, v10.4s, v9.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[1/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.2s, <vec_V6_V7_S6_S7=reg128#9.s[1]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.2s, <vec_V6_V7_S6_S7=v8.s[1]
umlal v17.2d, v11.2s, v8.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V6_V7_S6_S7[3/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, <vec_V6_V7_S6_S7=reg128#9.s[3]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.4s, <vec_V6_V7_S6_S7=v8.s[3]
umlal2 v17.2d, v11.4s, v8.s[3]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p15m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l0=reg128#15.2s, <vec_2x_2p15m1=reg128#16.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l0=v14.2s, <vec_2x_2p15m1=v15.s[0]
umlal v17.2d, v14.2s, v15.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l1=reg128#17.2s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l1=v16.2s, <vec_2x_2p30m1=v13.s[0]
umlal v17.2d, v16.2s, v13.s[0]

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_prod=reg128#18.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and >vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_prod=v17.16b, <vec_2x_2p30m1=v13.16b
and v14.16b, v17.16b, v13.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V8_V9_S8_S9[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.2s, <vec_V8_V9_S8_S9=reg128#10.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.2s, <vec_V8_V9_S8_S9=v9.s[0]
umlal v17.2d, v11.2s, v9.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V8_V9_S8_S9[2/4]
# asm 1: umlal2 <vec_prod=reg128#18.2d, <vec_uu1_rr1_vv1_ss1=reg128#12.4s, <vec_V8_V9_S8_S9=reg128#10.s[2]
# asm 2: umlal2 <vec_prod=v17.2d, <vec_uu1_rr1_vv1_ss1=v11.4s, <vec_V8_V9_S8_S9=v9.s[2]
umlal2 v17.2d, v11.4s, v9.s[2]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p15m1[0/4]
# asm 1: umlal <vec_prod=reg128#18.2d, <vec_l1=reg128#17.2s, <vec_2x_2p15m1=reg128#16.s[0]
# asm 2: umlal <vec_prod=v17.2d, <vec_l1=v16.2s, <vec_2x_2p15m1=v15.s[0]
umlal v17.2d, v16.2s, v15.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#17.16b, <vec_prod=reg128#18.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and >vec_buf=v16.16b, <vec_prod=v17.16b, <vec_2x_2p30m1=v13.16b
and v16.16b, v17.16b, v13.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#18.2d, <vec_prod=reg128#18.2d, #30
# asm 2: sshr >vec_prod=v17.2d, <vec_prod=v17.2d, #30
sshr v17.2d, v17.2d, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#17.2d, <vec_buf=reg128#17.2d, #32
# asm 2: shl >vec_buf=v16.2d, <vec_buf=v16.2d, #32
shl v16.2d, v16.2d, #32

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 |= vec_buf
# asm 1: orr <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_buf=reg128#17.16b
# asm 2: orr <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_buf=v16.16b
orr v14.16b, v14.16b, v16.16b

# qhasm: vec_Vp8_Vp9_Sp8_Sp9 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp8_Vp9_Sp8_Sp9=reg128#17.16b, <vec_prod=reg128#18.16b, <vec_2x_2p30m1=reg128#14.16b
# asm 2: and >vec_Vp8_Vp9_Sp8_Sp9=v16.16b, <vec_prod=v17.16b, <vec_2x_2p30m1=v13.16b
and v16.16b, v17.16b, v13.16b

# qhasm: reg128 vec_uuhat_rrhat

# qhasm: reg128 vec_vvhat_sshat

# qhasm: 4x vec_uuhat_rrhat = vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[1/4] vec_uuhat_rrhat_vvhat_sshat[1/4]
# asm 1: zip1 >vec_uuhat_rrhat=reg128#18.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#13.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#13.4s
# asm 2: zip1 >vec_uuhat_rrhat=v17.4s, <vec_uuhat_rrhat_vvhat_sshat=v12.4s, <vec_uuhat_rrhat_vvhat_sshat=v12.4s
zip1 v17.4s, v12.4s, v12.4s

# qhasm: reg128 vec_V0_V1_V0_V1

# qhasm: reg128 vec_V2_V3_V2_V3

# qhasm: reg128 vec_V4_V5_V4_V5

# qhasm: reg128 vec_V6_V7_V6_V7

# qhasm: reg128 vec_V8_V9_V8_V9

# qhasm: reg128 vec_4x_2p30m1

# qhasm: reg128 vec_P0_P1_P0_P1

# qhasm: 4x vec_4x_2p30m1 = vec_2x_2p30m1[0/4]
# asm 1: dup <vec_4x_2p30m1=reg128#22.4s, <vec_2x_2p30m1=reg128#14.s[0]
# asm 2: dup <vec_4x_2p30m1=v21.4s, <vec_2x_2p30m1=v13.s[0]
dup v21.4s, v13.s[0]

# qhasm: int64 eighteen

# qhasm: reg128 vec_eighteen

# qhasm: eighteen = 18
# asm 1: mov >eighteen=int64#3, #18
# asm 2: mov >eighteen=x2, #18
mov x2, #18

# qhasm: 2x vec_eighteen = eighteen
# asm 1: dup <vec_eighteen=reg128#23.2d, <eighteen=int64#3
# asm 2: dup <vec_eighteen=v22.2d, <eighteen=x2
dup v22.2d, x2

# qhasm: 2x vec_P0_P1_P0_P1 = vec_4x_2p30m1 - vec_eighteen
# asm 1: sub >vec_P0_P1_P0_P1=reg128#23.2d,<vec_4x_2p30m1=reg128#22.2d,<vec_eighteen=reg128#23.2d
# asm 2: sub >vec_P0_P1_P0_P1=v22.2d,<vec_4x_2p30m1=v21.2d,<vec_eighteen=v22.2d
sub v22.2d,v21.2d,v22.2d

# qhasm: 2x vec_V0_V1_V0_V1 zip= vec_V0_V1_S0_S1[0/2] vec_V0_V1_S0_S1[0/2]
# asm 1: zip1 >vec_V0_V1_V0_V1=reg128#24.2d, <vec_V0_V1_S0_S1=reg128#6.2d, <vec_V0_V1_S0_S1=reg128#6.2d
# asm 2: zip1 >vec_V0_V1_V0_V1=v23.2d, <vec_V0_V1_S0_S1=v5.2d, <vec_V0_V1_S0_S1=v5.2d
zip1 v23.2d, v5.2d, v5.2d

# qhasm: 4x vec_buf = vec_P0_P1_P0_P1 - vec_V0_V1_V0_V1
# asm 1: sub >vec_buf=reg128#24.4s,<vec_P0_P1_P0_P1=reg128#23.4s,<vec_V0_V1_V0_V1=reg128#24.4s
# asm 2: sub >vec_buf=v23.4s,<vec_P0_P1_P0_P1=v22.4s,<vec_V0_V1_V0_V1=v23.4s
sub v23.4s,v22.4s,v23.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#24.16b, <vec_buf=reg128#24.16b, <vec_uuhat_rrhat=reg128#18.16b
# asm 2: and <vec_buf=v23.16b, <vec_buf=v23.16b, <vec_uuhat_rrhat=v17.16b
and v23.16b, v23.16b, v17.16b

# qhasm: 4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf
# asm 1: add >vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, <vec_buf=reg128#24.4s
# asm 2: add >vec_Vp0_Vp1_Sp0_Sp1=v18.4s, <vec_Vp0_Vp1_Sp0_Sp1=v18.4s, <vec_buf=v23.4s
add v18.4s, v18.4s, v23.4s

# qhasm: 2x vec_V2_V3_V2_V3 zip= vec_V2_V3_S2_S3[0/2] vec_V2_V3_S2_S3[0/2]
# asm 1: zip1 >vec_V2_V3_V2_V3=reg128#24.2d, <vec_V2_V3_S2_S3=reg128#7.2d, <vec_V2_V3_S2_S3=reg128#7.2d
# asm 2: zip1 >vec_V2_V3_V2_V3=v23.2d, <vec_V2_V3_S2_S3=v6.2d, <vec_V2_V3_S2_S3=v6.2d
zip1 v23.2d, v6.2d, v6.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_V2_V3_V2_V3
# asm 1: sub >vec_buf=reg128#24.4s,<vec_4x_2p30m1=reg128#22.4s,<vec_V2_V3_V2_V3=reg128#24.4s
# asm 2: sub >vec_buf=v23.4s,<vec_4x_2p30m1=v21.4s,<vec_V2_V3_V2_V3=v23.4s
sub v23.4s,v21.4s,v23.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#24.16b, <vec_buf=reg128#24.16b, <vec_uuhat_rrhat=reg128#18.16b
# asm 2: and <vec_buf=v23.16b, <vec_buf=v23.16b, <vec_uuhat_rrhat=v17.16b
and v23.16b, v23.16b, v17.16b

# qhasm: 4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, <vec_buf=reg128#24.4s
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v19.4s, <vec_Vp2_Vp3_Sp2_Sp3=v19.4s, <vec_buf=v23.4s
add v19.4s, v19.4s, v23.4s

# qhasm: 2x vec_V4_V5_V4_V5 zip= vec_V4_V5_S4_S5[0/2] vec_V4_V5_S4_S5[0/2]
# asm 1: zip1 >vec_V4_V5_V4_V5=reg128#24.2d, <vec_V4_V5_S4_S5=reg128#8.2d, <vec_V4_V5_S4_S5=reg128#8.2d
# asm 2: zip1 >vec_V4_V5_V4_V5=v23.2d, <vec_V4_V5_S4_S5=v7.2d, <vec_V4_V5_S4_S5=v7.2d
zip1 v23.2d, v7.2d, v7.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_V4_V5_V4_V5
# asm 1: sub >vec_buf=reg128#24.4s,<vec_4x_2p30m1=reg128#22.4s,<vec_V4_V5_V4_V5=reg128#24.4s
# asm 2: sub >vec_buf=v23.4s,<vec_4x_2p30m1=v21.4s,<vec_V4_V5_V4_V5=v23.4s
sub v23.4s,v21.4s,v23.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#24.16b, <vec_buf=reg128#24.16b, <vec_uuhat_rrhat=reg128#18.16b
# asm 2: and <vec_buf=v23.16b, <vec_buf=v23.16b, <vec_uuhat_rrhat=v17.16b
and v23.16b, v23.16b, v17.16b

# qhasm: 4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, <vec_buf=reg128#24.4s
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v20.4s, <vec_Vp4_Vp5_Sp4_Sp5=v20.4s, <vec_buf=v23.4s
add v20.4s, v20.4s, v23.4s

# qhasm: 2x vec_V6_V7_V6_V7 zip= vec_V6_V7_S6_S7[0/2] vec_V6_V7_S6_S7[0/2]
# asm 1: zip1 >vec_V6_V7_V6_V7=reg128#24.2d, <vec_V6_V7_S6_S7=reg128#9.2d, <vec_V6_V7_S6_S7=reg128#9.2d
# asm 2: zip1 >vec_V6_V7_V6_V7=v23.2d, <vec_V6_V7_S6_S7=v8.2d, <vec_V6_V7_S6_S7=v8.2d
zip1 v23.2d, v8.2d, v8.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_V6_V7_V6_V7
# asm 1: sub >vec_buf=reg128#24.4s,<vec_4x_2p30m1=reg128#22.4s,<vec_V6_V7_V6_V7=reg128#24.4s
# asm 2: sub >vec_buf=v23.4s,<vec_4x_2p30m1=v21.4s,<vec_V6_V7_V6_V7=v23.4s
sub v23.4s,v21.4s,v23.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#24.16b, <vec_buf=reg128#24.16b, <vec_uuhat_rrhat=reg128#18.16b
# asm 2: and <vec_buf=v23.16b, <vec_buf=v23.16b, <vec_uuhat_rrhat=v17.16b
and v23.16b, v23.16b, v17.16b

# qhasm: 4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, <vec_buf=reg128#24.4s
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v14.4s, <vec_Vp6_Vp7_Sp6_Sp7=v14.4s, <vec_buf=v23.4s
add v14.4s, v14.4s, v23.4s

# qhasm: 2x vec_V8_V9_V8_V9 zip= vec_V8_V9_S8_S9[0/2] vec_V8_V9_S8_S9[0/2]
# asm 1: zip1 >vec_V8_V9_V8_V9=reg128#24.2d, <vec_V8_V9_S8_S9=reg128#10.2d, <vec_V8_V9_S8_S9=reg128#10.2d
# asm 2: zip1 >vec_V8_V9_V8_V9=v23.2d, <vec_V8_V9_S8_S9=v9.2d, <vec_V8_V9_S8_S9=v9.2d
zip1 v23.2d, v9.2d, v9.2d

# qhasm: 4x vec_buf = vec_2x_2p15m1 - vec_V8_V9_V8_V9
# asm 1: sub >vec_buf=reg128#24.4s,<vec_2x_2p15m1=reg128#16.4s,<vec_V8_V9_V8_V9=reg128#24.4s
# asm 2: sub >vec_buf=v23.4s,<vec_2x_2p15m1=v15.4s,<vec_V8_V9_V8_V9=v23.4s
sub v23.4s,v15.4s,v23.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#24.16b, <vec_buf=reg128#24.16b, <vec_uuhat_rrhat=reg128#18.16b
# asm 2: and <vec_buf=v23.16b, <vec_buf=v23.16b, <vec_uuhat_rrhat=v17.16b
and v23.16b, v23.16b, v17.16b

# qhasm: 4x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf
# asm 1: add >vec_Vp8_Vp9_Sp8_Sp9=reg128#17.4s, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.4s, <vec_buf=reg128#24.4s
# asm 2: add >vec_Vp8_Vp9_Sp8_Sp9=v16.4s, <vec_Vp8_Vp9_Sp8_Sp9=v16.4s, <vec_buf=v23.4s
add v16.4s, v16.4s, v23.4s

# qhasm: 4x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
# asm 1: sshr <vec_buf=reg128#24.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, #30
# asm 2: sshr <vec_buf=v23.4s, <vec_Vp0_Vp1_Sp0_Sp1=v18.4s, #30
sshr v23.4s, v18.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#18.2d, <vec_buf=reg128#24.2d, #32
# asm 2: shl >vec_buf=v17.2d, <vec_buf=v23.2d, #32
shl v17.2d, v23.2d, #32

# qhasm: 4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf
# asm 1: add >vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, <vec_buf=reg128#18.4s
# asm 2: add >vec_Vp0_Vp1_Sp0_Sp1=v18.4s, <vec_Vp0_Vp1_Sp0_Sp1=v18.4s, <vec_buf=v17.4s
add v18.4s, v18.4s, v17.4s

# qhasm: 2x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
# asm 1: sshr <vec_buf=reg128#18.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.2d, #30
# asm 2: sshr <vec_buf=v17.2d, <vec_Vp0_Vp1_Sp0_Sp1=v18.2d, #30
sshr v17.2d, v18.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: ushr >vec_buf=v17.2d, <vec_buf=v17.2d, #32
ushr v17.2d, v17.2d, #32

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 &= vec_4x_2p30m1
# asm 1: and <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.16b, <vec_4x_2p30m1=reg128#22.16b
# asm 2: and <vec_Vp0_Vp1_Sp0_Sp1=v18.16b, <vec_Vp0_Vp1_Sp0_Sp1=v18.16b, <vec_4x_2p30m1=v21.16b
and v18.16b, v18.16b, v21.16b

# qhasm: 2x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d, <vec_buf=reg128#18.2d
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v19.2d, <vec_Vp2_Vp3_Sp2_Sp3=v19.2d, <vec_buf=v17.2d
add v19.2d, v19.2d, v17.2d

# qhasm: 4x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
# asm 1: sshr <vec_buf=reg128#18.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, #30
# asm 2: sshr <vec_buf=v17.4s, <vec_Vp2_Vp3_Sp2_Sp3=v19.4s, #30
sshr v17.4s, v19.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: shl >vec_buf=v17.2d, <vec_buf=v17.2d, #32
shl v17.2d, v17.2d, #32

# qhasm: 4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, <vec_buf=reg128#18.4s
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v19.4s, <vec_Vp2_Vp3_Sp2_Sp3=v19.4s, <vec_buf=v17.4s
add v19.4s, v19.4s, v17.4s

# qhasm: 2x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
# asm 1: sshr <vec_buf=reg128#18.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d, #30
# asm 2: sshr <vec_buf=v17.2d, <vec_Vp2_Vp3_Sp2_Sp3=v19.2d, #30
sshr v17.2d, v19.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: ushr >vec_buf=v17.2d, <vec_buf=v17.2d, #32
ushr v17.2d, v17.2d, #32

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 &= vec_4x_2p30m1
# asm 1: and <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.16b, <vec_4x_2p30m1=reg128#22.16b
# asm 2: and <vec_Vp2_Vp3_Sp2_Sp3=v19.16b, <vec_Vp2_Vp3_Sp2_Sp3=v19.16b, <vec_4x_2p30m1=v21.16b
and v19.16b, v19.16b, v21.16b

# qhasm: 2x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d, <vec_buf=reg128#18.2d
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v20.2d, <vec_Vp4_Vp5_Sp4_Sp5=v20.2d, <vec_buf=v17.2d
add v20.2d, v20.2d, v17.2d

# qhasm: 4x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
# asm 1: sshr <vec_buf=reg128#18.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, #30
# asm 2: sshr <vec_buf=v17.4s, <vec_Vp4_Vp5_Sp4_Sp5=v20.4s, #30
sshr v17.4s, v20.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: shl >vec_buf=v17.2d, <vec_buf=v17.2d, #32
shl v17.2d, v17.2d, #32

# qhasm: 4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, <vec_buf=reg128#18.4s
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v20.4s, <vec_Vp4_Vp5_Sp4_Sp5=v20.4s, <vec_buf=v17.4s
add v20.4s, v20.4s, v17.4s

# qhasm: 2x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
# asm 1: sshr <vec_buf=reg128#18.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d, #30
# asm 2: sshr <vec_buf=v17.2d, <vec_Vp4_Vp5_Sp4_Sp5=v20.2d, #30
sshr v17.2d, v20.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: ushr >vec_buf=v17.2d, <vec_buf=v17.2d, #32
ushr v17.2d, v17.2d, #32

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 &= vec_4x_2p30m1
# asm 1: and <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.16b, <vec_4x_2p30m1=reg128#22.16b
# asm 2: and <vec_Vp4_Vp5_Sp4_Sp5=v20.16b, <vec_Vp4_Vp5_Sp4_Sp5=v20.16b, <vec_4x_2p30m1=v21.16b
and v20.16b, v20.16b, v21.16b

# qhasm: 2x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, <vec_buf=reg128#18.2d
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v14.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d, <vec_buf=v17.2d
add v14.2d, v14.2d, v17.2d

# qhasm: 4x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
# asm 1: sshr <vec_buf=reg128#18.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, #30
# asm 2: sshr <vec_buf=v17.4s, <vec_Vp6_Vp7_Sp6_Sp7=v14.4s, #30
sshr v17.4s, v14.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: shl >vec_buf=v17.2d, <vec_buf=v17.2d, #32
shl v17.2d, v17.2d, #32

# qhasm: 4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, <vec_buf=reg128#18.4s
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v14.4s, <vec_Vp6_Vp7_Sp6_Sp7=v14.4s, <vec_buf=v17.4s
add v14.4s, v14.4s, v17.4s

# qhasm: 2x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
# asm 1: sshr <vec_buf=reg128#18.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, #30
# asm 2: sshr <vec_buf=v17.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d, #30
sshr v17.2d, v14.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: ushr >vec_buf=v17.2d, <vec_buf=v17.2d, #32
ushr v17.2d, v17.2d, #32

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 &= vec_4x_2p30m1
# asm 1: and <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_4x_2p30m1=reg128#22.16b
# asm 2: and <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_4x_2p30m1=v21.16b
and v14.16b, v14.16b, v21.16b

# qhasm: 2x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf
# asm 1: add >vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d, <vec_buf=reg128#18.2d
# asm 2: add >vec_Vp8_Vp9_Sp8_Sp9=v16.2d, <vec_Vp8_Vp9_Sp8_Sp9=v16.2d, <vec_buf=v17.2d
add v16.2d, v16.2d, v17.2d

# qhasm: 4x vec_vvhat_sshat = vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[3/4] vec_uuhat_rrhat_vvhat_sshat[3/4]
# asm 1: zip2 >vec_vvhat_sshat=reg128#18.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#13.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#13.4s
# asm 2: zip2 >vec_vvhat_sshat=v17.4s, <vec_uuhat_rrhat_vvhat_sshat=v12.4s, <vec_uuhat_rrhat_vvhat_sshat=v12.4s
zip2 v17.4s, v12.4s, v12.4s

# qhasm: reg128 vec_S0_S1_S0_S1

# qhasm: reg128 vec_S2_S3_S2_S3

# qhasm: reg128 vec_S4_S5_S4_S5

# qhasm: reg128 vec_S6_S7_S6_S7

# qhasm: reg128 vec_S8_S9_S8_S9

# qhasm: 2x vec_S0_S1_S0_S1 zip= vec_V0_V1_S0_S1[1/2] vec_V0_V1_S0_S1[1/2]
# asm 1: zip2 >vec_S0_S1_S0_S1=reg128#24.2d, <vec_V0_V1_S0_S1=reg128#6.2d, <vec_V0_V1_S0_S1=reg128#6.2d
# asm 2: zip2 >vec_S0_S1_S0_S1=v23.2d, <vec_V0_V1_S0_S1=v5.2d, <vec_V0_V1_S0_S1=v5.2d
zip2 v23.2d, v5.2d, v5.2d

# qhasm: 4x vec_buf = vec_P0_P1_P0_P1 - vec_S0_S1_S0_S1
# asm 1: sub >vec_buf=reg128#23.4s,<vec_P0_P1_P0_P1=reg128#23.4s,<vec_S0_S1_S0_S1=reg128#24.4s
# asm 2: sub >vec_buf=v22.4s,<vec_P0_P1_P0_P1=v22.4s,<vec_S0_S1_S0_S1=v23.4s
sub v22.4s,v22.4s,v23.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#23.16b, <vec_buf=reg128#23.16b, <vec_vvhat_sshat=reg128#18.16b
# asm 2: and <vec_buf=v22.16b, <vec_buf=v22.16b, <vec_vvhat_sshat=v17.16b
and v22.16b, v22.16b, v17.16b

# qhasm: 4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf
# asm 1: add >vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, <vec_buf=reg128#23.4s
# asm 2: add >vec_Vp0_Vp1_Sp0_Sp1=v18.4s, <vec_Vp0_Vp1_Sp0_Sp1=v18.4s, <vec_buf=v22.4s
add v18.4s, v18.4s, v22.4s

# qhasm: 2x vec_S2_S3_S2_S3 zip= vec_V2_V3_S2_S3[1/2] vec_V2_V3_S2_S3[1/2]
# asm 1: zip2 >vec_S2_S3_S2_S3=reg128#23.2d, <vec_V2_V3_S2_S3=reg128#7.2d, <vec_V2_V3_S2_S3=reg128#7.2d
# asm 2: zip2 >vec_S2_S3_S2_S3=v22.2d, <vec_V2_V3_S2_S3=v6.2d, <vec_V2_V3_S2_S3=v6.2d
zip2 v22.2d, v6.2d, v6.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_S2_S3_S2_S3
# asm 1: sub >vec_buf=reg128#23.4s,<vec_4x_2p30m1=reg128#22.4s,<vec_S2_S3_S2_S3=reg128#23.4s
# asm 2: sub >vec_buf=v22.4s,<vec_4x_2p30m1=v21.4s,<vec_S2_S3_S2_S3=v22.4s
sub v22.4s,v21.4s,v22.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#23.16b, <vec_buf=reg128#23.16b, <vec_vvhat_sshat=reg128#18.16b
# asm 2: and <vec_buf=v22.16b, <vec_buf=v22.16b, <vec_vvhat_sshat=v17.16b
and v22.16b, v22.16b, v17.16b

# qhasm: 4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, <vec_buf=reg128#23.4s
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v19.4s, <vec_Vp2_Vp3_Sp2_Sp3=v19.4s, <vec_buf=v22.4s
add v19.4s, v19.4s, v22.4s

# qhasm: 2x vec_S4_S5_S4_S5 zip= vec_V4_V5_S4_S5[1/2] vec_V4_V5_S4_S5[1/2]
# asm 1: zip2 >vec_S4_S5_S4_S5=reg128#23.2d, <vec_V4_V5_S4_S5=reg128#8.2d, <vec_V4_V5_S4_S5=reg128#8.2d
# asm 2: zip2 >vec_S4_S5_S4_S5=v22.2d, <vec_V4_V5_S4_S5=v7.2d, <vec_V4_V5_S4_S5=v7.2d
zip2 v22.2d, v7.2d, v7.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_S4_S5_S4_S5
# asm 1: sub >vec_buf=reg128#23.4s,<vec_4x_2p30m1=reg128#22.4s,<vec_S4_S5_S4_S5=reg128#23.4s
# asm 2: sub >vec_buf=v22.4s,<vec_4x_2p30m1=v21.4s,<vec_S4_S5_S4_S5=v22.4s
sub v22.4s,v21.4s,v22.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#23.16b, <vec_buf=reg128#23.16b, <vec_vvhat_sshat=reg128#18.16b
# asm 2: and <vec_buf=v22.16b, <vec_buf=v22.16b, <vec_vvhat_sshat=v17.16b
and v22.16b, v22.16b, v17.16b

# qhasm: 4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, <vec_buf=reg128#23.4s
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v20.4s, <vec_Vp4_Vp5_Sp4_Sp5=v20.4s, <vec_buf=v22.4s
add v20.4s, v20.4s, v22.4s

# qhasm: 2x vec_S6_S7_S6_S7 zip= vec_V6_V7_S6_S7[1/2] vec_V6_V7_S6_S7[1/2]
# asm 1: zip2 >vec_S6_S7_S6_S7=reg128#23.2d, <vec_V6_V7_S6_S7=reg128#9.2d, <vec_V6_V7_S6_S7=reg128#9.2d
# asm 2: zip2 >vec_S6_S7_S6_S7=v22.2d, <vec_V6_V7_S6_S7=v8.2d, <vec_V6_V7_S6_S7=v8.2d
zip2 v22.2d, v8.2d, v8.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_S6_S7_S6_S7
# asm 1: sub >vec_buf=reg128#23.4s,<vec_4x_2p30m1=reg128#22.4s,<vec_S6_S7_S6_S7=reg128#23.4s
# asm 2: sub >vec_buf=v22.4s,<vec_4x_2p30m1=v21.4s,<vec_S6_S7_S6_S7=v22.4s
sub v22.4s,v21.4s,v22.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#23.16b, <vec_buf=reg128#23.16b, <vec_vvhat_sshat=reg128#18.16b
# asm 2: and <vec_buf=v22.16b, <vec_buf=v22.16b, <vec_vvhat_sshat=v17.16b
and v22.16b, v22.16b, v17.16b

# qhasm: 4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, <vec_buf=reg128#23.4s
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v14.4s, <vec_Vp6_Vp7_Sp6_Sp7=v14.4s, <vec_buf=v22.4s
add v14.4s, v14.4s, v22.4s

# qhasm: 2x vec_S8_S9_S8_S9 zip= vec_V8_V9_S8_S9[1/2] vec_V8_V9_S8_S9[1/2]
# asm 1: zip2 >vec_S8_S9_S8_S9=reg128#23.2d, <vec_V8_V9_S8_S9=reg128#10.2d, <vec_V8_V9_S8_S9=reg128#10.2d
# asm 2: zip2 >vec_S8_S9_S8_S9=v22.2d, <vec_V8_V9_S8_S9=v9.2d, <vec_V8_V9_S8_S9=v9.2d
zip2 v22.2d, v9.2d, v9.2d

# qhasm: 4x vec_buf = vec_2x_2p15m1 - vec_S8_S9_S8_S9
# asm 1: sub >vec_buf=reg128#23.4s,<vec_2x_2p15m1=reg128#16.4s,<vec_S8_S9_S8_S9=reg128#23.4s
# asm 2: sub >vec_buf=v22.4s,<vec_2x_2p15m1=v15.4s,<vec_S8_S9_S8_S9=v22.4s
sub v22.4s,v15.4s,v22.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#23.16b, <vec_buf=reg128#23.16b, <vec_vvhat_sshat=reg128#18.16b
# asm 2: and <vec_buf=v22.16b, <vec_buf=v22.16b, <vec_vvhat_sshat=v17.16b
and v22.16b, v22.16b, v17.16b

# qhasm: 4x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf
# asm 1: add >vec_Vp8_Vp9_Sp8_Sp9=reg128#17.4s, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.4s, <vec_buf=reg128#23.4s
# asm 2: add >vec_Vp8_Vp9_Sp8_Sp9=v16.4s, <vec_Vp8_Vp9_Sp8_Sp9=v16.4s, <vec_buf=v22.4s
add v16.4s, v16.4s, v22.4s

# qhasm: 4x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
# asm 1: sshr <vec_buf=reg128#23.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, #30
# asm 2: sshr <vec_buf=v22.4s, <vec_Vp0_Vp1_Sp0_Sp1=v18.4s, #30
sshr v22.4s, v18.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#18.2d, <vec_buf=reg128#23.2d, #32
# asm 2: shl >vec_buf=v17.2d, <vec_buf=v22.2d, #32
shl v17.2d, v22.2d, #32

# qhasm: 4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf
# asm 1: add >vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.4s, <vec_buf=reg128#18.4s
# asm 2: add >vec_Vp0_Vp1_Sp0_Sp1=v18.4s, <vec_Vp0_Vp1_Sp0_Sp1=v18.4s, <vec_buf=v17.4s
add v18.4s, v18.4s, v17.4s

# qhasm: 2x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
# asm 1: sshr <vec_buf=reg128#18.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.2d, #30
# asm 2: sshr <vec_buf=v17.2d, <vec_Vp0_Vp1_Sp0_Sp1=v18.2d, #30
sshr v17.2d, v18.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: ushr >vec_buf=v17.2d, <vec_buf=v17.2d, #32
ushr v17.2d, v17.2d, #32

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 &= vec_4x_2p30m1
# asm 1: and <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.16b, <vec_4x_2p30m1=reg128#22.16b
# asm 2: and <vec_Vp0_Vp1_Sp0_Sp1=v18.16b, <vec_Vp0_Vp1_Sp0_Sp1=v18.16b, <vec_4x_2p30m1=v21.16b
and v18.16b, v18.16b, v21.16b

# qhasm: 2x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d, <vec_buf=reg128#18.2d
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v19.2d, <vec_Vp2_Vp3_Sp2_Sp3=v19.2d, <vec_buf=v17.2d
add v19.2d, v19.2d, v17.2d

# qhasm: 4x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
# asm 1: sshr <vec_buf=reg128#18.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, #30
# asm 2: sshr <vec_buf=v17.4s, <vec_Vp2_Vp3_Sp2_Sp3=v19.4s, #30
sshr v17.4s, v19.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: shl >vec_buf=v17.2d, <vec_buf=v17.2d, #32
shl v17.2d, v17.2d, #32

# qhasm: 4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.4s, <vec_buf=reg128#18.4s
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v19.4s, <vec_Vp2_Vp3_Sp2_Sp3=v19.4s, <vec_buf=v17.4s
add v19.4s, v19.4s, v17.4s

# qhasm: 2x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
# asm 1: sshr <vec_buf=reg128#18.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d, #30
# asm 2: sshr <vec_buf=v17.2d, <vec_Vp2_Vp3_Sp2_Sp3=v19.2d, #30
sshr v17.2d, v19.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: ushr >vec_buf=v17.2d, <vec_buf=v17.2d, #32
ushr v17.2d, v17.2d, #32

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 &= vec_4x_2p30m1
# asm 1: and <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.16b, <vec_4x_2p30m1=reg128#22.16b
# asm 2: and <vec_Vp2_Vp3_Sp2_Sp3=v19.16b, <vec_Vp2_Vp3_Sp2_Sp3=v19.16b, <vec_4x_2p30m1=v21.16b
and v19.16b, v19.16b, v21.16b

# qhasm: 2x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d, <vec_buf=reg128#18.2d
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v20.2d, <vec_Vp4_Vp5_Sp4_Sp5=v20.2d, <vec_buf=v17.2d
add v20.2d, v20.2d, v17.2d

# qhasm: 4x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
# asm 1: sshr <vec_buf=reg128#18.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, #30
# asm 2: sshr <vec_buf=v17.4s, <vec_Vp4_Vp5_Sp4_Sp5=v20.4s, #30
sshr v17.4s, v20.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: shl >vec_buf=v17.2d, <vec_buf=v17.2d, #32
shl v17.2d, v17.2d, #32

# qhasm: 4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.4s, <vec_buf=reg128#18.4s
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v20.4s, <vec_Vp4_Vp5_Sp4_Sp5=v20.4s, <vec_buf=v17.4s
add v20.4s, v20.4s, v17.4s

# qhasm: 2x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
# asm 1: sshr <vec_buf=reg128#18.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d, #30
# asm 2: sshr <vec_buf=v17.2d, <vec_Vp4_Vp5_Sp4_Sp5=v20.2d, #30
sshr v17.2d, v20.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: ushr >vec_buf=v17.2d, <vec_buf=v17.2d, #32
ushr v17.2d, v17.2d, #32

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 &= vec_4x_2p30m1
# asm 1: and <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.16b, <vec_4x_2p30m1=reg128#22.16b
# asm 2: and <vec_Vp4_Vp5_Sp4_Sp5=v20.16b, <vec_Vp4_Vp5_Sp4_Sp5=v20.16b, <vec_4x_2p30m1=v21.16b
and v20.16b, v20.16b, v21.16b

# qhasm: 2x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, <vec_buf=reg128#18.2d
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v14.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d, <vec_buf=v17.2d
add v14.2d, v14.2d, v17.2d

# qhasm: 4x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
# asm 1: sshr <vec_buf=reg128#18.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, #30
# asm 2: sshr <vec_buf=v17.4s, <vec_Vp6_Vp7_Sp6_Sp7=v14.4s, #30
sshr v17.4s, v14.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: shl >vec_buf=v17.2d, <vec_buf=v17.2d, #32
shl v17.2d, v17.2d, #32

# qhasm: 4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.4s, <vec_buf=reg128#18.4s
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v14.4s, <vec_Vp6_Vp7_Sp6_Sp7=v14.4s, <vec_buf=v17.4s
add v14.4s, v14.4s, v17.4s

# qhasm: 2x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
# asm 1: sshr <vec_buf=reg128#18.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, #30
# asm 2: sshr <vec_buf=v17.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d, #30
sshr v17.2d, v14.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#18.2d, <vec_buf=reg128#18.2d, #32
# asm 2: ushr >vec_buf=v17.2d, <vec_buf=v17.2d, #32
ushr v17.2d, v17.2d, #32

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 &= vec_4x_2p30m1
# asm 1: and <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_4x_2p30m1=reg128#22.16b
# asm 2: and <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_4x_2p30m1=v21.16b
and v14.16b, v14.16b, v21.16b

# qhasm: 2x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf
# asm 1: add >vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d, <vec_buf=reg128#18.2d
# asm 2: add >vec_Vp8_Vp9_Sp8_Sp9=v16.2d, <vec_Vp8_Vp9_Sp8_Sp9=v16.2d, <vec_buf=v17.2d
add v16.2d, v16.2d, v17.2d

# qhasm: reg128 vec_small_tmp

# qhasm: 2x vec_small_tmp = vec_Vp8_Vp9_Sp8_Sp9 >> 15
# asm 1: sshr <vec_small_tmp=reg128#18.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d, #15
# asm 2: sshr <vec_small_tmp=v17.2d, <vec_Vp8_Vp9_Sp8_Sp9=v16.2d, #15
sshr v17.2d, v16.2d, #15

# qhasm: vec_Vp8_Vp9_Sp8_Sp9 &= vec_2x_2p15m1
# asm 1: and <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.16b, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.16b, <vec_2x_2p15m1=reg128#16.16b
# asm 2: and <vec_Vp8_Vp9_Sp8_Sp9=v16.16b, <vec_Vp8_Vp9_Sp8_Sp9=v16.16b, <vec_2x_2p15m1=v15.16b
and v16.16b, v16.16b, v15.16b

# qhasm: 4x vec_small_tmp = vec_small_tmp[0/4] vec_small_tmp[2/4] vec_small_tmp[0/4] vec_small_tmp[2/4]
# asm 1: uzp1 >vec_small_tmp=reg128#18.4s, <vec_small_tmp=reg128#18.4s, <vec_small_tmp=reg128#18.4s
# asm 2: uzp1 >vec_small_tmp=v17.4s, <vec_small_tmp=v17.4s, <vec_small_tmp=v17.4s
uzp1 v17.4s, v17.4s, v17.4s

# qhasm: reg128 vec_nineteen

# qhasm: int64 nineteen

# qhasm: nineteen = 19
# asm 1: mov >nineteen=int64#3, #19
# asm 2: mov >nineteen=x2, #19
mov x2, #19

# qhasm: 2x vec_nineteen = nineteen
# asm 1: dup <vec_nineteen=reg128#22.2d, <nineteen=int64#3
# asm 2: dup <vec_nineteen=v21.2d, <nineteen=x2
dup v21.2d, x2

# qhasm: 2x vec_Vp0_Vp1_Sp0_Sp1 += vec_small_tmp[0] unsigned* vec_nineteen[0/4]
# asm 1: umlal <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.2d, <vec_small_tmp=reg128#18.2s, <vec_nineteen=reg128#22.s[0]
# asm 2: umlal <vec_Vp0_Vp1_Sp0_Sp1=v18.2d, <vec_small_tmp=v17.2s, <vec_nineteen=v21.s[0]
umlal v18.2d, v17.2s, v21.s[0]

# qhasm: vec_small_tmp = vec_nineteen
# asm 1: mov >vec_small_tmp=reg128#18.16b, <vec_nineteen=reg128#22.16b
# asm 2: mov >vec_small_tmp=v17.16b, <vec_nineteen=v21.16b
mov v17.16b, v21.16b

# qhasm: reg128 vec_4x_2p30a2p31

# qhasm: reg128 vec_2x_2p30a2p31

# qhasm: reg128 vec_2x_2p62a2p63

# qhasm: reg128 vec_reduction_hat

# qhasm: 4x vec_4x_2p30a2p31 = 192 << 24
# asm 1: movi <vec_4x_2p30a2p31=reg128#22.4s, #192, lsl #24
# asm 2: movi <vec_4x_2p30a2p31=v21.4s, #192, lsl #24
movi v21.4s, #192, lsl #24

# qhasm: 2x vec_2x_2p30a2p31 = vec_4x_2p30a2p31 unsigned>> 32
# asm 1: ushr >vec_2x_2p30a2p31=reg128#22.2d, <vec_4x_2p30a2p31=reg128#22.2d, #32
# asm 2: ushr >vec_2x_2p30a2p31=v21.2d, <vec_4x_2p30a2p31=v21.2d, #32
ushr v21.2d, v21.2d, #32

# qhasm: 2x vec_2x_2p62a2p63 = vec_2x_2p30a2p31 << 32
# asm 1: shl >vec_2x_2p62a2p63=reg128#23.2d, <vec_2x_2p30a2p31=reg128#22.2d, #32
# asm 2: shl >vec_2x_2p62a2p63=v22.2d, <vec_2x_2p30a2p31=v21.2d, #32
shl v22.2d, v21.2d, #32

# qhasm: 2x vec_small_tmp += vec_Vp0_Vp1_Sp0_Sp1 
# asm 1: add <vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.2d
# asm 2: add <vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, <vec_Vp0_Vp1_Sp0_Sp1=v18.2d
add v17.2d, v17.2d, v18.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#18.16b, <vec_small_tmp=reg128#18.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: and >vec_small_tmp=v17.16b, <vec_small_tmp=v17.16b, <vec_2x_2p30a2p31=v21.16b
and v17.16b, v17.16b, v21.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, #2
# asm 2: shl >vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, #2
shl v17.2d, v17.2d, #2

# qhasm: 2x vec_small_tmp += vec_Vp0_Vp1_Sp0_Sp1 
# asm 1: add <vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.2d
# asm 2: add <vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, <vec_Vp0_Vp1_Sp0_Sp1=v18.2d
add v17.2d, v17.2d, v18.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#18.16b, <vec_small_tmp=reg128#18.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: and >vec_small_tmp=v17.16b, <vec_small_tmp=v17.16b, <vec_2x_2p62a2p63=v22.16b
and v17.16b, v17.16b, v22.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, #62
# asm 2: ushr >vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, #62
ushr v17.2d, v17.2d, #62

# qhasm: 2x vec_small_tmp += vec_Vp2_Vp3_Sp2_Sp3 
# asm 1: add <vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d
# asm 2: add <vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, <vec_Vp2_Vp3_Sp2_Sp3=v19.2d
add v17.2d, v17.2d, v19.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#18.16b, <vec_small_tmp=reg128#18.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: and >vec_small_tmp=v17.16b, <vec_small_tmp=v17.16b, <vec_2x_2p30a2p31=v21.16b
and v17.16b, v17.16b, v21.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, #2
# asm 2: shl >vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, #2
shl v17.2d, v17.2d, #2

# qhasm: 2x vec_small_tmp += vec_Vp2_Vp3_Sp2_Sp3 
# asm 1: add <vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d
# asm 2: add <vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, <vec_Vp2_Vp3_Sp2_Sp3=v19.2d
add v17.2d, v17.2d, v19.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#18.16b, <vec_small_tmp=reg128#18.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: and >vec_small_tmp=v17.16b, <vec_small_tmp=v17.16b, <vec_2x_2p62a2p63=v22.16b
and v17.16b, v17.16b, v22.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, #62
# asm 2: ushr >vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, #62
ushr v17.2d, v17.2d, #62

# qhasm: 2x vec_small_tmp += vec_Vp4_Vp5_Sp4_Sp5
# asm 1: add <vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d
# asm 2: add <vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, <vec_Vp4_Vp5_Sp4_Sp5=v20.2d
add v17.2d, v17.2d, v20.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#18.16b, <vec_small_tmp=reg128#18.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: and >vec_small_tmp=v17.16b, <vec_small_tmp=v17.16b, <vec_2x_2p30a2p31=v21.16b
and v17.16b, v17.16b, v21.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, #2
# asm 2: shl >vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, #2
shl v17.2d, v17.2d, #2

# qhasm: 2x vec_small_tmp += vec_Vp4_Vp5_Sp4_Sp5
# asm 1: add <vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d
# asm 2: add <vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, <vec_Vp4_Vp5_Sp4_Sp5=v20.2d
add v17.2d, v17.2d, v20.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#18.16b, <vec_small_tmp=reg128#18.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: and >vec_small_tmp=v17.16b, <vec_small_tmp=v17.16b, <vec_2x_2p62a2p63=v22.16b
and v17.16b, v17.16b, v22.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, #62
# asm 2: ushr >vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, #62
ushr v17.2d, v17.2d, #62

# qhasm: 2x vec_small_tmp += vec_Vp6_Vp7_Sp6_Sp7
# asm 1: add <vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d
# asm 2: add <vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d
add v17.2d, v17.2d, v14.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#18.16b, <vec_small_tmp=reg128#18.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: and >vec_small_tmp=v17.16b, <vec_small_tmp=v17.16b, <vec_2x_2p30a2p31=v21.16b
and v17.16b, v17.16b, v21.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, #2
# asm 2: shl >vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, #2
shl v17.2d, v17.2d, #2

# qhasm: 2x vec_small_tmp += vec_Vp6_Vp7_Sp6_Sp7
# asm 1: add <vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d
# asm 2: add <vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d
add v17.2d, v17.2d, v14.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#18.16b, <vec_small_tmp=reg128#18.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: and >vec_small_tmp=v17.16b, <vec_small_tmp=v17.16b, <vec_2x_2p62a2p63=v22.16b
and v17.16b, v17.16b, v22.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, #62
# asm 2: ushr >vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, #62
ushr v17.2d, v17.2d, #62

# qhasm: 2x vec_small_tmp += vec_Vp8_Vp9_Sp8_Sp9
# asm 1: add <vec_small_tmp=reg128#18.2d, <vec_small_tmp=reg128#18.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d
# asm 2: add <vec_small_tmp=v17.2d, <vec_small_tmp=v17.2d, <vec_Vp8_Vp9_Sp8_Sp9=v16.2d
add v17.2d, v17.2d, v16.2d

# qhasm: 2x vec_small_tmp = vec_2x_2p15m1 - vec_small_tmp
# asm 1: sub >vec_small_tmp=reg128#16.2d,<vec_2x_2p15m1=reg128#16.2d,<vec_small_tmp=reg128#18.2d
# asm 2: sub >vec_small_tmp=v15.2d,<vec_2x_2p15m1=v15.2d,<vec_small_tmp=v17.2d
sub v15.2d,v15.2d,v17.2d

# qhasm: 2x vec_reduction_hat = vec_small_tmp >> 63
# asm 1: sshr <vec_reduction_hat=reg128#18.2d, <vec_small_tmp=reg128#16.2d, #63
# asm 2: sshr <vec_reduction_hat=v17.2d, <vec_small_tmp=v15.2d, #63
sshr v17.2d, v15.2d, #63

# qhasm: int64 number

# qhasm: reg128 vec_number

# qhasm: number = 19
# asm 1: mov >number=int64#3, #19
# asm 2: mov >number=x2, #19
mov x2, #19

# qhasm: 2x vec_number = number
# asm 1: dup <vec_number=reg128#16.2d, <number=int64#3
# asm 2: dup <vec_number=v15.2d, <number=x2
dup v15.2d, x2

# qhasm: vec_number &= vec_reduction_hat
# asm 1: and <vec_number=reg128#16.16b, <vec_number=reg128#16.16b, <vec_reduction_hat=reg128#18.16b
# asm 2: and <vec_number=v15.16b, <vec_number=v15.16b, <vec_reduction_hat=v17.16b
and v15.16b, v15.16b, v17.16b

# qhasm: 2x vec_Vp0_Vp1_Sp0_Sp1 += vec_number
# asm 1: add <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.2d, <vec_number=reg128#16.2d
# asm 2: add <vec_Vp0_Vp1_Sp0_Sp1=v18.2d, <vec_Vp0_Vp1_Sp0_Sp1=v18.2d, <vec_number=v15.2d
add v18.2d, v18.2d, v15.2d

# qhasm: number = 32768
# asm 1: mov >number=int64#3, #32768
# asm 2: mov >number=x2, #32768
mov x2, #32768

# qhasm: 2x vec_number = number
# asm 1: dup <vec_number=reg128#16.2d, <number=int64#3
# asm 2: dup <vec_number=v15.2d, <number=x2
dup v15.2d, x2

# qhasm: vec_number &= vec_reduction_hat
# asm 1: and <vec_number=reg128#16.16b, <vec_number=reg128#16.16b, <vec_reduction_hat=reg128#18.16b
# asm 2: and <vec_number=v15.16b, <vec_number=v15.16b, <vec_reduction_hat=v17.16b
and v15.16b, v15.16b, v17.16b

# qhasm: 2x vec_Vp8_Vp9_Sp8_Sp9 -= vec_number
# asm 1: sub <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d,<vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d,<vec_number=reg128#16.2d
# asm 2: sub <vec_Vp8_Vp9_Sp8_Sp9=v16.2d,<vec_Vp8_Vp9_Sp8_Sp9=v16.2d,<vec_number=v15.2d
sub v16.2d,v16.2d,v15.2d

# qhasm: vec_small_tmp = vec_Vp0_Vp1_Sp0_Sp1 & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#16.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: and >vec_small_tmp=v15.16b, <vec_Vp0_Vp1_Sp0_Sp1=v18.16b, <vec_2x_2p30a2p31=v21.16b
and v15.16b, v18.16b, v21.16b

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 & ~vec_2x_2p30a2p31
# asm 1: bic >vec_Vp0_Vp1_Sp0_Sp1=reg128#18.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#19.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: bic >vec_Vp0_Vp1_Sp0_Sp1=v17.16b, <vec_Vp0_Vp1_Sp0_Sp1=v18.16b, <vec_2x_2p30a2p31=v21.16b
bic v17.16b, v18.16b, v21.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#16.2d, <vec_small_tmp=reg128#16.2d, #2
# asm 2: shl >vec_small_tmp=v15.2d, <vec_small_tmp=v15.2d, #2
shl v15.2d, v15.2d, #2

# qhasm: 2x vec_Vp0_Vp1_Sp0_Sp1 += vec_small_tmp
# asm 1: add <vec_Vp0_Vp1_Sp0_Sp1=reg128#18.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#18.2d, <vec_small_tmp=reg128#16.2d
# asm 2: add <vec_Vp0_Vp1_Sp0_Sp1=v17.2d, <vec_Vp0_Vp1_Sp0_Sp1=v17.2d, <vec_small_tmp=v15.2d
add v17.2d, v17.2d, v15.2d

# qhasm: vec_small_tmp = vec_Vp0_Vp1_Sp0_Sp1 & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#16.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#18.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: and >vec_small_tmp=v15.16b, <vec_Vp0_Vp1_Sp0_Sp1=v17.16b, <vec_2x_2p62a2p63=v22.16b
and v15.16b, v17.16b, v22.16b

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 & ~vec_2x_2p62a2p63
# asm 1: bic >vec_Vp0_Vp1_Sp0_Sp1=reg128#18.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#18.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: bic >vec_Vp0_Vp1_Sp0_Sp1=v17.16b, <vec_Vp0_Vp1_Sp0_Sp1=v17.16b, <vec_2x_2p62a2p63=v22.16b
bic v17.16b, v17.16b, v22.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#16.2d, <vec_small_tmp=reg128#16.2d, #62
# asm 2: ushr >vec_small_tmp=v15.2d, <vec_small_tmp=v15.2d, #62
ushr v15.2d, v15.2d, #62

# qhasm: 2x vec_Vp2_Vp3_Sp2_Sp3 += vec_small_tmp
# asm 1: add <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.2d, <vec_small_tmp=reg128#16.2d
# asm 2: add <vec_Vp2_Vp3_Sp2_Sp3=v19.2d, <vec_Vp2_Vp3_Sp2_Sp3=v19.2d, <vec_small_tmp=v15.2d
add v19.2d, v19.2d, v15.2d

# qhasm: vec_small_tmp = vec_Vp2_Vp3_Sp2_Sp3 & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#16.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: and >vec_small_tmp=v15.16b, <vec_Vp2_Vp3_Sp2_Sp3=v19.16b, <vec_2x_2p30a2p31=v21.16b
and v15.16b, v19.16b, v21.16b

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 & ~vec_2x_2p30a2p31
# asm 1: bic >vec_Vp2_Vp3_Sp2_Sp3=reg128#19.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#20.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: bic >vec_Vp2_Vp3_Sp2_Sp3=v18.16b, <vec_Vp2_Vp3_Sp2_Sp3=v19.16b, <vec_2x_2p30a2p31=v21.16b
bic v18.16b, v19.16b, v21.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#16.2d, <vec_small_tmp=reg128#16.2d, #2
# asm 2: shl >vec_small_tmp=v15.2d, <vec_small_tmp=v15.2d, #2
shl v15.2d, v15.2d, #2

# qhasm: 2x vec_Vp2_Vp3_Sp2_Sp3 += vec_small_tmp
# asm 1: add <vec_Vp2_Vp3_Sp2_Sp3=reg128#19.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#19.2d, <vec_small_tmp=reg128#16.2d
# asm 2: add <vec_Vp2_Vp3_Sp2_Sp3=v18.2d, <vec_Vp2_Vp3_Sp2_Sp3=v18.2d, <vec_small_tmp=v15.2d
add v18.2d, v18.2d, v15.2d

# qhasm: vec_small_tmp = vec_Vp2_Vp3_Sp2_Sp3 & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#16.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#19.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: and >vec_small_tmp=v15.16b, <vec_Vp2_Vp3_Sp2_Sp3=v18.16b, <vec_2x_2p62a2p63=v22.16b
and v15.16b, v18.16b, v22.16b

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 & ~vec_2x_2p62a2p63
# asm 1: bic >vec_Vp2_Vp3_Sp2_Sp3=reg128#19.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#19.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: bic >vec_Vp2_Vp3_Sp2_Sp3=v18.16b, <vec_Vp2_Vp3_Sp2_Sp3=v18.16b, <vec_2x_2p62a2p63=v22.16b
bic v18.16b, v18.16b, v22.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#16.2d, <vec_small_tmp=reg128#16.2d, #62
# asm 2: ushr >vec_small_tmp=v15.2d, <vec_small_tmp=v15.2d, #62
ushr v15.2d, v15.2d, #62

# qhasm: 2x vec_Vp4_Vp5_Sp4_Sp5 += vec_small_tmp
# asm 1: add <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.2d, <vec_small_tmp=reg128#16.2d
# asm 2: add <vec_Vp4_Vp5_Sp4_Sp5=v20.2d, <vec_Vp4_Vp5_Sp4_Sp5=v20.2d, <vec_small_tmp=v15.2d
add v20.2d, v20.2d, v15.2d

# qhasm: vec_small_tmp = vec_Vp4_Vp5_Sp4_Sp5 & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#16.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: and >vec_small_tmp=v15.16b, <vec_Vp4_Vp5_Sp4_Sp5=v20.16b, <vec_2x_2p30a2p31=v21.16b
and v15.16b, v20.16b, v21.16b

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 & ~vec_2x_2p30a2p31
# asm 1: bic >vec_Vp4_Vp5_Sp4_Sp5=reg128#20.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#21.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: bic >vec_Vp4_Vp5_Sp4_Sp5=v19.16b, <vec_Vp4_Vp5_Sp4_Sp5=v20.16b, <vec_2x_2p30a2p31=v21.16b
bic v19.16b, v20.16b, v21.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#16.2d, <vec_small_tmp=reg128#16.2d, #2
# asm 2: shl >vec_small_tmp=v15.2d, <vec_small_tmp=v15.2d, #2
shl v15.2d, v15.2d, #2

# qhasm: 2x vec_Vp4_Vp5_Sp4_Sp5 += vec_small_tmp
# asm 1: add <vec_Vp4_Vp5_Sp4_Sp5=reg128#20.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#20.2d, <vec_small_tmp=reg128#16.2d
# asm 2: add <vec_Vp4_Vp5_Sp4_Sp5=v19.2d, <vec_Vp4_Vp5_Sp4_Sp5=v19.2d, <vec_small_tmp=v15.2d
add v19.2d, v19.2d, v15.2d

# qhasm: vec_small_tmp = vec_Vp4_Vp5_Sp4_Sp5 & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#16.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#20.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: and >vec_small_tmp=v15.16b, <vec_Vp4_Vp5_Sp4_Sp5=v19.16b, <vec_2x_2p62a2p63=v22.16b
and v15.16b, v19.16b, v22.16b

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 & ~vec_2x_2p62a2p63
# asm 1: bic >vec_Vp4_Vp5_Sp4_Sp5=reg128#20.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#20.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: bic >vec_Vp4_Vp5_Sp4_Sp5=v19.16b, <vec_Vp4_Vp5_Sp4_Sp5=v19.16b, <vec_2x_2p62a2p63=v22.16b
bic v19.16b, v19.16b, v22.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#16.2d, <vec_small_tmp=reg128#16.2d, #62
# asm 2: ushr >vec_small_tmp=v15.2d, <vec_small_tmp=v15.2d, #62
ushr v15.2d, v15.2d, #62

# qhasm: 2x vec_Vp6_Vp7_Sp6_Sp7 += vec_small_tmp
# asm 1: add <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, <vec_small_tmp=reg128#16.2d
# asm 2: add <vec_Vp6_Vp7_Sp6_Sp7=v14.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d, <vec_small_tmp=v15.2d
add v14.2d, v14.2d, v15.2d

# qhasm: vec_small_tmp = vec_Vp6_Vp7_Sp6_Sp7 & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#16.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: and >vec_small_tmp=v15.16b, <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_2x_2p30a2p31=v21.16b
and v15.16b, v14.16b, v21.16b

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 & ~vec_2x_2p30a2p31
# asm 1: bic >vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_2x_2p30a2p31=reg128#22.16b
# asm 2: bic >vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_2x_2p30a2p31=v21.16b
bic v14.16b, v14.16b, v21.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#16.2d, <vec_small_tmp=reg128#16.2d, #2
# asm 2: shl >vec_small_tmp=v15.2d, <vec_small_tmp=v15.2d, #2
shl v15.2d, v15.2d, #2

# qhasm: 2x vec_Vp6_Vp7_Sp6_Sp7 += vec_small_tmp
# asm 1: add <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d, <vec_small_tmp=reg128#16.2d
# asm 2: add <vec_Vp6_Vp7_Sp6_Sp7=v14.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d, <vec_small_tmp=v15.2d
add v14.2d, v14.2d, v15.2d

# qhasm: vec_small_tmp = vec_Vp6_Vp7_Sp6_Sp7 & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#16.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: and >vec_small_tmp=v15.16b, <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_2x_2p62a2p63=v22.16b
and v15.16b, v14.16b, v22.16b

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 & ~vec_2x_2p62a2p63
# asm 1: bic >vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.16b, <vec_2x_2p62a2p63=reg128#23.16b
# asm 2: bic >vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_Vp6_Vp7_Sp6_Sp7=v14.16b, <vec_2x_2p62a2p63=v22.16b
bic v14.16b, v14.16b, v22.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#16.2d, <vec_small_tmp=reg128#16.2d, #62
# asm 2: ushr >vec_small_tmp=v15.2d, <vec_small_tmp=v15.2d, #62
ushr v15.2d, v15.2d, #62

# qhasm: 2x vec_Vp8_Vp9_Sp8_Sp9 += vec_small_tmp
# asm 1: add <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.2d, <vec_small_tmp=reg128#16.2d
# asm 2: add <vec_Vp8_Vp9_Sp8_Sp9=v16.2d, <vec_Vp8_Vp9_Sp8_Sp9=v16.2d, <vec_small_tmp=v15.2d
add v16.2d, v16.2d, v15.2d

# qhasm: reg128 vec_Vp0_Vp1_Vp2_Vp3

# qhasm: reg128 vec_Sp0_Sp1_Sp2_Sp3

# # qhasm: 2x vec_Vp0_Vp1_Vp2_Vp3 zip= vec_Vp0_Vp1_Sp0_Sp1[0/2] vec_Vp2_Vp3_Sp2_Sp3[0/2]
# # asm 1: zip1 >vec_Vp0_Vp1_Vp2_Vp3=reg128#16.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#18.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#19.2d
# # asm 2: zip1 >vec_Vp0_Vp1_Vp2_Vp3=v15.2d, <vec_Vp0_Vp1_Sp0_Sp1=v17.2d, <vec_Vp2_Vp3_Sp2_Sp3=v18.2d
# zip1 v15.2d, v17.2d, v18.2d

# # qhasm: 2x vec_Sp0_Sp1_Sp2_Sp3 zip= vec_Vp0_Vp1_Sp0_Sp1[1/2] vec_Vp2_Vp3_Sp2_Sp3[1/2]
# # asm 1: zip2 >vec_Sp0_Sp1_Sp2_Sp3=reg128#18.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#18.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#19.2d
# # asm 2: zip2 >vec_Sp0_Sp1_Sp2_Sp3=v17.2d, <vec_Vp0_Vp1_Sp0_Sp1=v17.2d, <vec_Vp2_Vp3_Sp2_Sp3=v18.2d
# zip2 v17.2d, v17.2d, v18.2d

# # qhasm: reg128 vec_Vp4_Vp5_Vp6_Vp7

# # qhasm: reg128 vec_Sp4_Sp5_Sp6_Sp7

# # qhasm: 2x vec_Vp4_Vp5_Vp6_Vp7 zip= vec_Vp4_Vp5_Sp4_Sp5[0/2] vec_Vp6_Vp7_Sp6_Sp7[0/2]
# # asm 1: zip1 >vec_Vp4_Vp5_Vp6_Vp7=reg128#19.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#20.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d
# # asm 2: zip1 >vec_Vp4_Vp5_Vp6_Vp7=v18.2d, <vec_Vp4_Vp5_Sp4_Sp5=v19.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d
# zip1 v18.2d, v19.2d, v14.2d

# # qhasm: 2x vec_Sp4_Sp5_Sp6_Sp7 zip= vec_Vp4_Vp5_Sp4_Sp5[1/2] vec_Vp6_Vp7_Sp6_Sp7[1/2]
# # asm 1: zip2 >vec_Sp4_Sp5_Sp6_Sp7=reg128#15.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#20.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#15.2d
# # asm 2: zip2 >vec_Sp4_Sp5_Sp6_Sp7=v14.2d, <vec_Vp4_Vp5_Sp4_Sp5=v19.2d, <vec_Vp6_Vp7_Sp6_Sp7=v14.2d
# zip2 v14.2d, v19.2d, v14.2d

# # qhasm: mem256[pointerV] = vec_Vp0_Vp1_Vp2_Vp3, vec_Vp4_Vp5_Vp6_Vp7
# # asm 1: stp <vec_Vp0_Vp1_Vp2_Vp3=reg128#16%qregname, <vec_Vp4_Vp5_Vp6_Vp7=reg128#19%qregname, [<pointerV=int64#1]
# # asm 2: stp <vec_Vp0_Vp1_Vp2_Vp3=q15, <vec_Vp4_Vp5_Vp6_Vp7=q18, [<pointerV=x0]
# stp q15, q18, [x0]

# # qhasm: mem256[pointerS] = vec_Sp0_Sp1_Sp2_Sp3, vec_Sp4_Sp5_Sp6_Sp7
# # asm 1: stp <vec_Sp0_Sp1_Sp2_Sp3=reg128#18%qregname, <vec_Sp4_Sp5_Sp6_Sp7=reg128#15%qregname, [<pointerS=int64#2]
# # asm 2: stp <vec_Sp0_Sp1_Sp2_Sp3=q17, <vec_Sp4_Sp5_Sp6_Sp7=q14, [<pointerS=x1]
# stp q17, q14, [x1]

# # qhasm: int64 Vp8

# # qhasm: Vp8 = vec_Vp8_Vp9_Sp8_Sp9[0/2]
# # asm 1: umov >Vp8=int64#3, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.d[0]
# # asm 2: umov >Vp8=x2, <vec_Vp8_Vp9_Sp8_Sp9=v16.d[0]
# umov x2, v16.d[0]

# # qhasm: mem32[pointerV+32] = Vp8
# # asm 1: str <Vp8=int64#3%wregname, [<pointerV=int64#1, #32]
# # asm 2: str <Vp8=w2, [<pointerV=x0, #32]
# str w2, [x0, #32]

# # qhasm: int64 Sp8

# # qhasm: Sp8 = vec_Vp8_Vp9_Sp8_Sp9[1/2]
# # asm 1: umov >Sp8=int64#1, <vec_Vp8_Vp9_Sp8_Sp9=reg128#17.d[1]
# # asm 2: umov >Sp8=x0, <vec_Vp8_Vp9_Sp8_Sp9=v16.d[1]
# umov x0, v16.d[1]

# # qhasm: mem32[pointerS+32] = Sp8
# # asm 1: str <Sp8=int64#1%wregname, [<pointerS=int64#2, #32]
# # asm 2: str <Sp8=w0, [<pointerS=x1, #32]
# str w0, [x1, #32]

# qhasm: pop2x8b calleesaved_v14, calleesaved_v15
# asm 1: ldp >calleesaved_v14=reg128#15%dregname,>calleesaved_v15=reg128#16%dregname,[sp],#16
# asm 2: ldp >calleesaved_v14=d14,>calleesaved_v15=d15,[sp],#16
ldp d14,d15,[sp],#16

# qhasm: pop2x8b calleesaved_v12, calleesaved_v13
# asm 1: ldp >calleesaved_v12=reg128#17%dregname,>calleesaved_v13=reg128#18%dregname,[sp],#16
# asm 2: ldp >calleesaved_v12=d16,>calleesaved_v13=d17,[sp],#16
ldp d16,d17,[sp],#16

# qhasm: pop2x8b calleesaved_v10, calleesaved_v11
# asm 1: ldp >calleesaved_v10=reg128#19%dregname,>calleesaved_v11=reg128#20%dregname,[sp],#16
# asm 2: ldp >calleesaved_v10=d18,>calleesaved_v11=d19,[sp],#16
ldp d18,d19,[sp],#16

# qhasm: pop2x8b calleesaved_v8, calleesaved_v9
# asm 1: ldp >calleesaved_v8=reg128#21%dregname,>calleesaved_v9=reg128#22%dregname,[sp],#16
# asm 2: ldp >calleesaved_v8=d20,>calleesaved_v9=d21,[sp],#16
ldp d20,d21,[sp],#16

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

# qhasm: free vec_F0_F1_G0_G1

# qhasm: free vec_F2_F3_G2_G3

# qhasm: free vec_F4_F5_G4_G5

# qhasm: free vec_F6_F7_G6_G7

# qhasm: free vec_F8_F9_G8_G9

# qhasm: free vec_V0_V1_S0_S1

# qhasm: free vec_V2_V3_S2_S3

# qhasm: free vec_V4_V5_S4_S5

# qhasm: free vec_V6_V7_S6_S7

# qhasm: free vec_V8_V9_S8_S9

# qhasm: free vec_uu0_rr0_vv0_ss0

# qhasm: free vec_uu1_rr1_vv1_ss1

# qhasm: free vec_uuhat_rrhat_vvhat_sshat

# qhasm: free vec_2x_2p30m1

# qhasm: return
ret
