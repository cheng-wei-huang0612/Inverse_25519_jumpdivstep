
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

# qhasm: enter update_FG
.align 4
.global _update_FG
.global update_FG
_update_FG:
update_FG:

# qhasm: int64 pointerF

# qhasm: int64 pointerG

# qhasm: int64 pointeruuvvrrss

# qhasm: input pointerF

# qhasm: input pointerG

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

# qhasm: int64 F0F1

# qhasm: int64 F2F3

# qhasm: int64 F4F5

# qhasm: int64 F6F7

# qhasm: int64 F8

# qhasm: F0F1, F2F3 = mem128[pointerF]
# asm 1: ldp >F0F1=int64#4, >F2F3=int64#5, [<pointerF=int64#1]
# asm 2: ldp >F0F1=x3, >F2F3=x4, [<pointerF=x0]
ldp x3, x4, [x0]

# qhasm: F4F5, F6F7 = mem128[pointerF+16]
# asm 1: ldp >F4F5=int64#6, >F6F7=int64#7, [<pointerF=int64#1, #16]
# asm 2: ldp >F4F5=x5, >F6F7=x6, [<pointerF=x0, #16]
ldp x5, x6, [x0, #16]

# qhasm: F8 = mem32[pointerF+32]
# asm 1: ldr >F8=int64#8%wregname, [<pointerF=int64#1, #32]
# asm 2: ldr >F8=w7, [<pointerF=x0, #32]
ldr w7, [x0, #32]

# qhasm: int64 G0G1

# qhasm: int64 G2G3

# qhasm: int64 G4G5

# qhasm: int64 G6G7

# qhasm: int64 G8

# qhasm: G0G1, G2G3 = mem128[pointerG]
# asm 1: ldp >G0G1=int64#9, >G2G3=int64#10, [<pointerG=int64#2]
# asm 2: ldp >G0G1=x8, >G2G3=x9, [<pointerG=x1]
ldp x8, x9, [x1]

# qhasm: G4G5, G6G7 = mem128[pointerG+16]
# asm 1: ldp >G4G5=int64#11, >G6G7=int64#12, [<pointerG=int64#2, #16]
# asm 2: ldp >G4G5=x10, >G6G7=x11, [<pointerG=x1, #16]
ldp x10, x11, [x1, #16]

# qhasm: G8 = mem32[pointerG+32]
# asm 1: ldr >G8=int64#13%wregname, [<pointerG=int64#2, #32]
# asm 2: ldr >G8=w12, [<pointerG=x1, #32]
ldr w12, [x1, #32]

# qhasm: reg128 vec_F0_F1_G0_G1 

# qhasm: vec_F0_F1_G0_G1[0/2] = F0F1 
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.d[0], <F0F1=int64#4
# asm 2: ins <vec_F0_F1_G0_G1=v0.d[0], <F0F1=x3
ins v0.d[0], x3

# qhasm: vec_F0_F1_G0_G1[1/2] = G0G1 
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.d[1], <G0G1=int64#9
# asm 2: ins <vec_F0_F1_G0_G1=v0.d[1], <G0G1=x8
ins v0.d[1], x8

# qhasm: reg128 vec_F2_F3_G2_G3 

# qhasm: vec_F2_F3_G2_G3[0/2] = F2F3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#2.d[0], <F2F3=int64#5
# asm 2: ins <vec_F2_F3_G2_G3=v1.d[0], <F2F3=x4
ins v1.d[0], x4

# qhasm: vec_F2_F3_G2_G3[1/2] = G2G3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#2.d[1], <G2G3=int64#10
# asm 2: ins <vec_F2_F3_G2_G3=v1.d[1], <G2G3=x9
ins v1.d[1], x9

# qhasm: reg128 vec_F4_F5_G4_G5 

# qhasm: vec_F4_F5_G4_G5[0/2] = F4F5 
# asm 1: ins <vec_F4_F5_G4_G5=reg128#3.d[0], <F4F5=int64#6
# asm 2: ins <vec_F4_F5_G4_G5=v2.d[0], <F4F5=x5
ins v2.d[0], x5

# qhasm: vec_F4_F5_G4_G5[1/2] = G4G5 
# asm 1: ins <vec_F4_F5_G4_G5=reg128#3.d[1], <G4G5=int64#11
# asm 2: ins <vec_F4_F5_G4_G5=v2.d[1], <G4G5=x10
ins v2.d[1], x10

# qhasm: reg128 vec_F6_F7_G6_G7 

# qhasm: vec_F6_F7_G6_G7[0/2] = F6F7 
# asm 1: ins <vec_F6_F7_G6_G7=reg128#4.d[0], <F6F7=int64#7
# asm 2: ins <vec_F6_F7_G6_G7=v3.d[0], <F6F7=x6
ins v3.d[0], x6

# qhasm: vec_F6_F7_G6_G7[1/2] = G6G7 
# asm 1: ins <vec_F6_F7_G6_G7=reg128#4.d[1], <G6G7=int64#12
# asm 2: ins <vec_F6_F7_G6_G7=v3.d[1], <G6G7=x11
ins v3.d[1], x11

# qhasm: reg128 vec_F8_0_G8_0

# qhasm: vec_F8_0_G8_0[0/2] = F8
# asm 1: ins <vec_F8_0_G8_0=reg128#5.d[0], <F8=int64#8
# asm 2: ins <vec_F8_0_G8_0=v4.d[0], <F8=x7
ins v4.d[0], x7

# qhasm: vec_F8_0_G8_0[1/2] = G8
# asm 1: ins <vec_F8_0_G8_0=reg128#5.d[1], <G8=int64#13
# asm 2: ins <vec_F8_0_G8_0=v4.d[1], <G8=x12
ins v4.d[1], x12

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss

# qhasm: uu, vv = mem128[pointeruuvvrrss]
# asm 1: ldp >uu=int64#4, >vv=int64#5, [<pointeruuvvrrss=int64#3]
# asm 2: ldp >uu=x3, >vv=x4, [<pointeruuvvrrss=x2]
ldp x3, x4, [x2]

# qhasm: rr, ss = mem128[pointeruuvvrrss + 16]
# asm 1: ldp >rr=int64#6, >ss=int64#7, [<pointeruuvvrrss=int64#3, #16]
# asm 2: ldp >rr=x5, >ss=x6, [<pointeruuvvrrss=x2, #16]
ldp x5, x6, [x2, #16]
error
.error
error:unknown instruction:int64 uu

# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu = mem64[pointeruuvvrrss + 0]
# asm 1: ldr >uu=int64#8, [<pointeruuvvrrss=int64#3, #0]
# asm 2: ldr >uu=x7, [<pointeruuvvrrss=x2, #0]
ldr x7, [x2, #0]

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#9, <uu=int64#8, #0, #30
# asm 2: ubfx >uu0=x8, <uu=x7, #0, #30
ubfx x8, x7, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#8, <uu=int64#8, #30, #32
# asm 2: ubfx >uu1=x7, <uu=x7, #30, #32
ubfx x7, x7, #30, #32
error
.error
error:unknown instruction:int64 vv

# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv = mem64[pointeruuvvrrss + 8]
# asm 1: ldr >vv=int64#10, [<pointeruuvvrrss=int64#3, #8]
# asm 2: ldr >vv=x9, [<pointeruuvvrrss=x2, #8]
ldr x9, [x2, #8]

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#11, <vv=int64#10, #0, #30
# asm 2: ubfx >vv0=x10, <vv=x9, #0, #30
ubfx x10, x9, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#10, <vv=int64#10, #30, #32
# asm 2: ubfx >vv1=x9, <vv=x9, #30, #32
ubfx x9, x9, #30, #32
error
.error
error:unknown instruction:int64 rr

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr = mem64[pointeruuvvrrss + 16]
# asm 1: ldr >rr=int64#12, [<pointeruuvvrrss=int64#3, #16]
# asm 2: ldr >rr=x11, [<pointeruuvvrrss=x2, #16]
ldr x11, [x2, #16]

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#13, <rr=int64#12, #0, #30
# asm 2: ubfx >rr0=x12, <rr=x11, #0, #30
ubfx x12, x11, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#12, <rr=int64#12, #30, #32
# asm 2: ubfx >rr1=x11, <rr=x11, #30, #32
ubfx x11, x11, #30, #32
error
.error
error:unknown instruction:int64 ss

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss = mem64[pointeruuvvrrss + 24]
# asm 1: ldr >ss=int64#3, [<pointeruuvvrrss=int64#3, #24]
# asm 2: ldr >ss=x2, [<pointeruuvvrrss=x2, #24]
ldr x2, [x2, #24]

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#14, <ss=int64#3, #0, #30
# asm 2: ubfx >ss0=x13, <ss=x2, #0, #30
ubfx x13, x2, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#3, <ss=int64#3, #30, #32
# asm 2: ubfx >ss1=x2, <ss=x2, #30, #32
ubfx x2, x2, #30, #32

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: int64 uu0rr0

# qhasm: int64 vv0ss0

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: int64 uu1rr1

# qhasm: int64 vv1ss1

# qhasm: reg128 vec_tmp0

# qhasm: reg128 vec_MASK2p30m1

# qhasm: reg128 vec_MASK2p32m1

# qhasm: reg128 vec_R0_0_S0_0

# qhasm: reg128 vec_R1_0_S1_0

# qhasm: reg128 vec_R2_0_S2_0

# qhasm: reg128 vec_R3_0_S3_0

# qhasm: reg128 vec_R4_0_S4_0

# qhasm: reg128 vec_R5_0_S5_0

# qhasm: reg128 vec_R6_0_S6_0

# qhasm: reg128 vec_R7_0_S7_0

# qhasm: reg128 vec_R8_0_S8_0

# qhasm: reg128 vec_R9_0_S9_0

# qhasm: reg128 vec_R10_0_S10_0

# qhasm: reg128 vec_R0_R1_S0_S1

# qhasm: reg128 vec_R2_R3_S2_S3

# qhasm: reg128 vec_R4_R5_S4_S5

# qhasm: reg128 vec_R6_R7_S6_S7

# qhasm: reg128 vec_R8_R9_S8_S9

# qhasm: int64 R0R1

# qhasm: int64 R2R3

# qhasm: int64 R4R5

# qhasm: int64 R6R7

# qhasm: int64 R8R9

# qhasm: int64 R0

# qhasm: int64 R1

# qhasm: int64 R2

# qhasm: int64 R3

# qhasm: int64 R4

# qhasm: int64 R5

# qhasm: int64 R6

# qhasm: int64 R7

# qhasm: int64 R8

# qhasm: int64 R9

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 S4S5

# qhasm: int64 S6S7

# qhasm: int64 S8S9

# qhasm: int64 S0

# qhasm: int64 S1

# qhasm: int64 S2

# qhasm: int64 S3

# qhasm: int64 S4

# qhasm: int64 S5

# qhasm: int64 S6

# qhasm: int64 S7

# qhasm: int64 S8

# qhasm: int64 S9

# qhasm: int64 R10

# qhasm: int64 S10

# qhasm: int64 carry1

# qhasm: int64 ONE

# qhasm: reg128 vec_MASKcarry1

# qhasm: reg128 vec_MASKcarry2

# qhasm: reg128 vec_MASKcarry

# qhasm: reg128 vec_MASKeffect

# qhasm: reg128 vec_ONE

# qhasm: reg128 vec_MASKhalfeffect

# qhasm: reg128 vec_uhat_rhat_vhat_shat

# qhasm: reg128 vec_uhat_rhat

# qhasm: reg128 vec_vhat_shat

# qhasm: reg128 vec_tmp1

# qhasm: reg128 vec_tmp2

# qhasm: reg128 vec_tmp3

# qhasm: reg128 vec_tmp4

# qhasm: reg128 vec_tmp5

# qhasm: reg128 vec_carry1

# qhasm: reg128 vec_carry2

# qhasm: reg128 vec_Fhat_0_Ghat_0

# qhasm: reg128 vec_Fhat

# qhasm: reg128 vec_Ghat

# qhasm: int64 debug0

# qhasm: int64 debug1

# qhasm: int64 debug2

# qhasm: int64 debug3

# qhasm: rr0 = rr0 << 32
# asm 1: lsl >rr0=int64#13, <rr0=int64#13, #32
# asm 2: lsl >rr0=x12, <rr0=x12, #32
lsl x12, x12, #32

# qhasm: uu0rr0 = uu0 | rr0
# asm 1: orr >uu0rr0=int64#9, <uu0=int64#9, <rr0=int64#13
# asm 2: orr >uu0rr0=x8, <uu0=x8, <rr0=x12
orr x8, x8, x12

# qhasm: vec_uu0_rr0_vv0_ss0[0/2] = uu0rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.d[0], <uu0rr0=int64#9
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.d[0], <uu0rr0=x8
ins v5.d[0], x8

# qhasm: ss0 = ss0 << 32
# asm 1: lsl >ss0=int64#9, <ss0=int64#14, #32
# asm 2: lsl >ss0=x8, <ss0=x13, #32
lsl x8, x13, #32

# qhasm: vv0ss0 = vv0 | ss0
# asm 1: orr >vv0ss0=int64#9, <vv0=int64#11, <ss0=int64#9
# asm 2: orr >vv0ss0=x8, <vv0=x10, <ss0=x8
orr x8, x10, x8

# qhasm: vec_uu0_rr0_vv0_ss0[1/2] = vv0ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.d[1], <vv0ss0=int64#9
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.d[1], <vv0ss0=x8
ins v5.d[1], x8

# qhasm: rr1 = rr1 << 32
# asm 1: lsl >rr1=int64#9, <rr1=int64#12, #32
# asm 2: lsl >rr1=x8, <rr1=x11, #32
lsl x8, x11, #32

# qhasm: uu1rr1 = uu1 | rr1
# asm 1: orr >uu1rr1=int64#8, <uu1=int64#8, <rr1=int64#9
# asm 2: orr >uu1rr1=x7, <uu1=x7, <rr1=x8
orr x7, x7, x8

# qhasm: vec_uu1_rr1_vv1_ss1[0/2] = uu1rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.d[0], <uu1rr1=int64#8
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.d[0], <uu1rr1=x7
ins v6.d[0], x7

# qhasm: ss1 = ss1 << 32
# asm 1: lsl >ss1=int64#3, <ss1=int64#3, #32
# asm 2: lsl >ss1=x2, <ss1=x2, #32
lsl x2, x2, #32

# qhasm: vv1ss1 = vv1 | ss1
# asm 1: orr >vv1ss1=int64#3, <vv1=int64#10, <ss1=int64#3
# asm 2: orr >vv1ss1=x2, <vv1=x9, <ss1=x2
orr x2, x9, x2

# qhasm: vec_uu1_rr1_vv1_ss1[1/2] = vv1ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.d[1], <vv1ss1=int64#3
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.d[1], <vv1ss1=x2
ins v6.d[1], x2

# qhasm: vec_tmp0 = vec_tmp0 ^ vec_tmp0
# asm 1: eor >vec_tmp0=reg128#8.16b, <vec_tmp0=reg128#8.16b, <vec_tmp0=reg128#8.16b
# asm 2: eor >vec_tmp0=v7.16b, <vec_tmp0=v7.16b, <vec_tmp0=v7.16b
eor v7.16b, v7.16b, v7.16b

# qhasm: 2x vec_MASK2p32m1 = 0xFFFFFFFF
# asm 1: movi >vec_MASK2p32m1=reg128#9.2d, #0xFFFFFFFF
# asm 2: movi >vec_MASK2p32m1=v8.2d, #0xFFFFFFFF
movi v8.2d, #0xFFFFFFFF

# qhasm: 2x vec_MASK2p30m1 = vec_MASK2p32m1 unsigned>> 2
# asm 1: ushr >vec_MASK2p30m1=reg128#9.2d, <vec_MASK2p32m1=reg128#9.2d, #2
# asm 2: ushr >vec_MASK2p30m1=v8.2d, <vec_MASK2p32m1=v8.2d, #2
ushr v8.2d, v8.2d, #2

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F0_F1_G0_G1[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F0_F1_G0_G1=v0.s[0]
umlal v7.2d, v5.2s, v0.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F0_F1_G0_G1=v0.s[2]
umlal2 v7.2d, v5.4s, v0.s[2]

# qhasm: vec_R0_0_S0_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R0_0_S0_0=reg128#10.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R0_0_S0_0=v9.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v9.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F0_F1_G0_G1[1/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F0_F1_G0_G1=v0.s[1]
umlal v7.2d, v5.2s, v0.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F0_F1_G0_G1=v0.s[3]
umlal2 v7.2d, v5.4s, v0.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F0_F1_G0_G1=v0.s[0]
umlal v7.2d, v6.2s, v0.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F0_F1_G0_G1=v0.s[2]
umlal2 v7.2d, v6.4s, v0.s[2]

# qhasm: vec_R1_0_S1_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R1_0_S1_0=reg128#11.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R1_0_S1_0=v10.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v10.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F2_F3_G2_G3=v1.s[0]
umlal v7.2d, v5.2s, v1.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F2_F3_G2_G3=v1.s[2]
umlal2 v7.2d, v5.4s, v1.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[1/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F0_F1_G0_G1=v0.s[1]
umlal v7.2d, v6.2s, v0.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F0_F1_G0_G1=v0.s[3]
umlal2 v7.2d, v6.4s, v0.s[3]

# qhasm: vec_R2_0_S2_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R2_0_S2_0=reg128#12.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R2_0_S2_0=v11.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v11.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[1/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F2_F3_G2_G3=v1.s[1]
umlal v7.2d, v5.2s, v1.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F2_F3_G2_G3=v1.s[3]
umlal2 v7.2d, v5.4s, v1.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F2_F3_G2_G3=v1.s[0]
umlal v7.2d, v6.2s, v1.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F2_F3_G2_G3=v1.s[2]
umlal2 v7.2d, v6.4s, v1.s[2]

# qhasm: vec_R3_0_S3_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R3_0_S3_0=reg128#13.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R3_0_S3_0=v12.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v12.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F4_F5_G4_G5=v2.s[0]
umlal v7.2d, v5.2s, v2.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F4_F5_G4_G5=v2.s[2]
umlal2 v7.2d, v5.4s, v2.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[1/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F2_F3_G2_G3=v1.s[1]
umlal v7.2d, v6.2s, v1.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F2_F3_G2_G3=v1.s[3]
umlal2 v7.2d, v6.4s, v1.s[3]

# qhasm: vec_R4_0_S4_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R4_0_S4_0=reg128#14.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R4_0_S4_0=v13.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v13.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[1/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F4_F5_G4_G5=v2.s[1]
umlal v7.2d, v5.2s, v2.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F4_F5_G4_G5=v2.s[3]
umlal2 v7.2d, v5.4s, v2.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F4_F5_G4_G5=v2.s[0]
umlal v7.2d, v6.2s, v2.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F4_F5_G4_G5=v2.s[2]
umlal2 v7.2d, v6.4s, v2.s[2]

# qhasm: vec_R5_0_S5_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R5_0_S5_0=reg128#15.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R5_0_S5_0=v14.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v14.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F6_F7_G6_G7=v3.s[0]
umlal v7.2d, v5.2s, v3.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F6_F7_G6_G7=v3.s[2]
umlal2 v7.2d, v5.4s, v3.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[1/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F4_F5_G4_G5=v2.s[1]
umlal v7.2d, v6.2s, v2.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F4_F5_G4_G5=v2.s[3]
umlal2 v7.2d, v6.4s, v2.s[3]

# qhasm: vec_R6_0_S6_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R6_0_S6_0=reg128#16.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R6_0_S6_0=v15.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v15.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[1/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F6_F7_G6_G7=v3.s[1]
umlal v7.2d, v5.2s, v3.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F6_F7_G6_G7=v3.s[3]
umlal2 v7.2d, v5.4s, v3.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F6_F7_G6_G7=v3.s[0]
umlal v7.2d, v6.2s, v3.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F6_F7_G6_G7=v3.s[2]
umlal2 v7.2d, v6.4s, v3.s[2]

# qhasm: vec_R7_0_S7_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R7_0_S7_0=reg128#17.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R7_0_S7_0=v16.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v16.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F8_0_G8_0[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F8_0_G8_0=reg128#5.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F8_0_G8_0=v4.s[0]
umlal v7.2d, v5.2s, v4.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F8_0_G8_0[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F8_0_G8_0=reg128#5.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F8_0_G8_0=v4.s[2]
umlal2 v7.2d, v5.4s, v4.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[1/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F6_F7_G6_G7=v3.s[1]
umlal v7.2d, v6.2s, v3.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F6_F7_G6_G7=v3.s[3]
umlal2 v7.2d, v6.4s, v3.s[3]

# qhasm: vec_R8_0_S8_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R8_0_S8_0=reg128#18.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R8_0_S8_0=v17.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v17.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F8_0_G8_0[0/4]
# asm 1: umlal <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F8_0_G8_0=reg128#5.s[0]
# asm 2: umlal <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F8_0_G8_0=v4.s[0]
umlal v7.2d, v6.2s, v4.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F8_0_G8_0[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#8.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F8_0_G8_0=reg128#5.s[2]
# asm 2: umlal2 <vec_tmp0=v7.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F8_0_G8_0=v4.s[2]
umlal2 v7.2d, v6.4s, v4.s[2]

# qhasm: vec_R9_0_S9_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R9_0_S9_0=reg128#9.16b, <vec_tmp0=reg128#8.16b, <vec_MASK2p30m1=reg128#9.16b
# asm 2: and >vec_R9_0_S9_0=v8.16b, <vec_tmp0=v7.16b, <vec_MASK2p30m1=v8.16b
and v8.16b, v7.16b, v8.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#8.2d, <vec_tmp0=reg128#8.2d, #30
# asm 2: ushr >vec_tmp0=v7.2d, <vec_tmp0=v7.2d, #30
ushr v7.2d, v7.2d, #30

# qhasm: vec_R10_0_S10_0 = vec_tmp0 
# asm 1: mov >vec_R10_0_S10_0=reg128#8.16b, <vec_tmp0=reg128#8.16b
# asm 2: mov >vec_R10_0_S10_0=v7.16b, <vec_tmp0=v7.16b
mov v7.16b, v7.16b

# qhasm: 2x vec_R1_0_S1_0 <<= 32
# asm 1: shl >vec_R1_0_S1_0=reg128#11.2d, <vec_R1_0_S1_0=reg128#11.2d, #32
# asm 2: shl >vec_R1_0_S1_0=v10.2d, <vec_R1_0_S1_0=v10.2d, #32
shl v10.2d, v10.2d, #32

# qhasm: vec_R0_R1_S0_S1 = vec_R0_0_S0_0 | vec_R1_0_S1_0
# asm 1: orr >vec_R0_R1_S0_S1=reg128#19.16b, <vec_R0_0_S0_0=reg128#10.16b, <vec_R1_0_S1_0=reg128#11.16b
# asm 2: orr >vec_R0_R1_S0_S1=v18.16b, <vec_R0_0_S0_0=v9.16b, <vec_R1_0_S1_0=v10.16b
orr v18.16b, v9.16b, v10.16b

# qhasm: 2x vec_R3_0_S3_0 <<= 32
# asm 1: shl >vec_R3_0_S3_0=reg128#10.2d, <vec_R3_0_S3_0=reg128#13.2d, #32
# asm 2: shl >vec_R3_0_S3_0=v9.2d, <vec_R3_0_S3_0=v12.2d, #32
shl v9.2d, v12.2d, #32

# qhasm: vec_R2_R3_S2_S3 = vec_R2_0_S2_0 | vec_R3_0_S3_0
# asm 1: orr >vec_R2_R3_S2_S3=reg128#10.16b, <vec_R2_0_S2_0=reg128#12.16b, <vec_R3_0_S3_0=reg128#10.16b
# asm 2: orr >vec_R2_R3_S2_S3=v9.16b, <vec_R2_0_S2_0=v11.16b, <vec_R3_0_S3_0=v9.16b
orr v9.16b, v11.16b, v9.16b

# qhasm: 2x vec_R5_0_S5_0 <<= 32
# asm 1: shl >vec_R5_0_S5_0=reg128#11.2d, <vec_R5_0_S5_0=reg128#15.2d, #32
# asm 2: shl >vec_R5_0_S5_0=v10.2d, <vec_R5_0_S5_0=v14.2d, #32
shl v10.2d, v14.2d, #32

# qhasm: vec_R4_R5_S4_S5 = vec_R4_0_S4_0 | vec_R5_0_S5_0
# asm 1: orr >vec_R4_R5_S4_S5=reg128#11.16b, <vec_R4_0_S4_0=reg128#14.16b, <vec_R5_0_S5_0=reg128#11.16b
# asm 2: orr >vec_R4_R5_S4_S5=v10.16b, <vec_R4_0_S4_0=v13.16b, <vec_R5_0_S5_0=v10.16b
orr v10.16b, v13.16b, v10.16b

# qhasm: 2x vec_R7_0_S7_0 <<= 32
# asm 1: shl >vec_R7_0_S7_0=reg128#12.2d, <vec_R7_0_S7_0=reg128#17.2d, #32
# asm 2: shl >vec_R7_0_S7_0=v11.2d, <vec_R7_0_S7_0=v16.2d, #32
shl v11.2d, v16.2d, #32

# qhasm: vec_R6_R7_S6_S7 = vec_R6_0_S6_0 | vec_R7_0_S7_0
# asm 1: orr >vec_R6_R7_S6_S7=reg128#12.16b, <vec_R6_0_S6_0=reg128#16.16b, <vec_R7_0_S7_0=reg128#12.16b
# asm 2: orr >vec_R6_R7_S6_S7=v11.16b, <vec_R6_0_S6_0=v15.16b, <vec_R7_0_S7_0=v11.16b
orr v11.16b, v15.16b, v11.16b

# qhasm: 2x vec_R9_0_S9_0 <<= 32
# asm 1: shl >vec_R9_0_S9_0=reg128#9.2d, <vec_R9_0_S9_0=reg128#9.2d, #32
# asm 2: shl >vec_R9_0_S9_0=v8.2d, <vec_R9_0_S9_0=v8.2d, #32
shl v8.2d, v8.2d, #32

# qhasm: vec_R8_R9_S8_S9 = vec_R8_0_S8_0 | vec_R9_0_S9_0
# asm 1: orr >vec_R8_R9_S8_S9=reg128#9.16b, <vec_R8_0_S8_0=reg128#18.16b, <vec_R9_0_S9_0=reg128#9.16b
# asm 2: orr >vec_R8_R9_S8_S9=v8.16b, <vec_R8_0_S8_0=v17.16b, <vec_R9_0_S9_0=v8.16b
orr v8.16b, v17.16b, v8.16b

# qhasm: carry1 = 3221225472
# asm 1: mov >carry1=int64#3, #3221225472
# asm 2: mov >carry1=x2, #3221225472
mov x2, #3221225472

# qhasm: 2x vec_MASKcarry1 = carry1
# asm 1: dup <vec_MASKcarry1=reg128#13.2d, <carry1=int64#3
# asm 2: dup <vec_MASKcarry1=v12.2d, <carry1=x2
dup v12.2d, x2

# qhasm: 2x vec_MASKcarry2 = vec_MASKcarry1 << 32
# asm 1: shl >vec_MASKcarry2=reg128#14.2d, <vec_MASKcarry1=reg128#13.2d, #32
# asm 2: shl >vec_MASKcarry2=v13.2d, <vec_MASKcarry1=v12.2d, #32
shl v13.2d, v12.2d, #32

# qhasm: vec_MASKcarry = vec_MASKcarry1 | vec_MASKcarry2
# asm 1: orr >vec_MASKcarry=reg128#15.16b, <vec_MASKcarry1=reg128#13.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: orr >vec_MASKcarry=v14.16b, <vec_MASKcarry1=v12.16b, <vec_MASKcarry2=v13.16b
orr v14.16b, v12.16b, v13.16b

# qhasm: vec_MASKeffect = ~vec_MASKcarry
# asm 1: not >vec_MASKeffect=reg128#17.16b, <vec_MASKcarry=reg128#15.16b
# asm 2: not >vec_MASKeffect=v16.16b, <vec_MASKcarry=v14.16b
not v16.16b, v14.16b

# qhasm: ONE = 1
# asm 1: mov >ONE=int64#3, #1
# asm 2: mov >ONE=x2, #1
mov x2, #1

# qhasm: 2x vec_ONE = ONE
# asm 1: dup <vec_ONE=reg128#16.2d, <ONE=int64#3
# asm 2: dup <vec_ONE=v15.2d, <ONE=x2
dup v15.2d, x2

# qhasm: carry1 = 4294967295
# asm 1: mov >carry1=int64#3, #4294967295
# asm 2: mov >carry1=x2, #4294967295
mov x2, #4294967295

# qhasm: 2x vec_MASKhalfeffect = carry1
# asm 1: dup <vec_MASKhalfeffect=reg128#18.2d, <carry1=int64#3
# asm 2: dup <vec_MASKhalfeffect=v17.2d, <carry1=x2
dup v17.2d, x2

# qhasm: 4x vec_uhat_rhat_vhat_shat = vec_uu1_rr1_vv1_ss1 >> 31
# asm 1: sshr >vec_uhat_rhat_vhat_shat=reg128#20.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, #31
# asm 2: sshr >vec_uhat_rhat_vhat_shat=v19.4s, <vec_uu1_rr1_vv1_ss1=v6.4s, #31
sshr v19.4s, v6.4s, #31

# qhasm: 4x vec_uhat_rhat = vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[1/4] vec_uhat_rhat_vhat_shat[1/4]
# asm 1: zip1 >vec_uhat_rhat=reg128#21.4s, <vec_uhat_rhat_vhat_shat=reg128#20.4s, <vec_uhat_rhat_vhat_shat=reg128#20.4s
# asm 2: zip1 >vec_uhat_rhat=v20.4s, <vec_uhat_rhat_vhat_shat=v19.4s, <vec_uhat_rhat_vhat_shat=v19.4s
zip1 v20.4s, v19.4s, v19.4s

# qhasm: 4x vec_vhat_shat = vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[3/4] vec_uhat_rhat_vhat_shat[3/4]
# asm 1: zip2 >vec_vhat_shat=reg128#20.4s, <vec_uhat_rhat_vhat_shat=reg128#20.4s, <vec_uhat_rhat_vhat_shat=reg128#20.4s
# asm 2: zip2 >vec_vhat_shat=v19.4s, <vec_uhat_rhat_vhat_shat=v19.4s, <vec_uhat_rhat_vhat_shat=v19.4s
zip2 v19.4s, v19.4s, v19.4s

# qhasm: 2x vec_tmp1 = vec_F0_F1_G0_G1[0/2]
# asm 1: dup <vec_tmp1=reg128#22.2d, <vec_F0_F1_G0_G1=reg128#1.d[0]
# asm 2: dup <vec_tmp1=v21.2d, <vec_F0_F1_G0_G1=v0.d[0]
dup v21.2d, v0.d[0]

# qhasm: 2x vec_tmp2 = vec_F2_F3_G2_G3[0/2]
# asm 1: dup <vec_tmp2=reg128#23.2d, <vec_F2_F3_G2_G3=reg128#2.d[0]
# asm 2: dup <vec_tmp2=v22.2d, <vec_F2_F3_G2_G3=v1.d[0]
dup v22.2d, v1.d[0]

# qhasm: 2x vec_tmp3 = vec_F4_F5_G4_G5[0/2]
# asm 1: dup <vec_tmp3=reg128#24.2d, <vec_F4_F5_G4_G5=reg128#3.d[0]
# asm 2: dup <vec_tmp3=v23.2d, <vec_F4_F5_G4_G5=v2.d[0]
dup v23.2d, v2.d[0]

# qhasm: 2x vec_tmp4 = vec_F6_F7_G6_G7[0/2]
# asm 1: dup <vec_tmp4=reg128#25.2d, <vec_F6_F7_G6_G7=reg128#4.d[0]
# asm 2: dup <vec_tmp4=v24.2d, <vec_F6_F7_G6_G7=v3.d[0]
dup v24.2d, v3.d[0]

# qhasm: 2x vec_tmp5 = vec_F8_0_G8_0[0/2]
# asm 1: dup <vec_tmp5=reg128#26.2d, <vec_F8_0_G8_0=reg128#5.d[0]
# asm 2: dup <vec_tmp5=v25.2d, <vec_F8_0_G8_0=v4.d[0]
dup v25.2d, v4.d[0]

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#22.2d, <vec_tmp1=reg128#22.2d, #2
# asm 2: shl >vec_tmp1=v21.2d, <vec_tmp1=v21.2d, #2
shl v21.2d, v21.2d, #2

# qhasm: 2x vec_tmp2 <<= 2
# asm 1: shl >vec_tmp2=reg128#23.2d, <vec_tmp2=reg128#23.2d, #2
# asm 2: shl >vec_tmp2=v22.2d, <vec_tmp2=v22.2d, #2
shl v22.2d, v22.2d, #2

# qhasm: 2x vec_tmp3 <<= 2
# asm 1: shl >vec_tmp3=reg128#24.2d, <vec_tmp3=reg128#24.2d, #2
# asm 2: shl >vec_tmp3=v23.2d, <vec_tmp3=v23.2d, #2
shl v23.2d, v23.2d, #2

# qhasm: 2x vec_tmp4 <<= 2
# asm 1: shl >vec_tmp4=reg128#25.2d, <vec_tmp4=reg128#25.2d, #2
# asm 2: shl >vec_tmp4=v24.2d, <vec_tmp4=v24.2d, #2
shl v24.2d, v24.2d, #2

# qhasm: 2x vec_tmp5 <<= 2
# asm 1: shl >vec_tmp5=reg128#26.2d, <vec_tmp5=reg128#26.2d, #2
# asm 2: shl >vec_tmp5=v25.2d, <vec_tmp5=v25.2d, #2
shl v25.2d, v25.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#27.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v26.16b, <vec_tmp1=v21.16b, <vec_MASKcarry1=v12.16b
and v26.16b, v21.16b, v12.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_MASKcarry1=v12.16b
bic v21.16b, v21.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#27.2d, <vec_carry1=reg128#27.2d, #2
# asm 2: shl >vec_carry1=v26.2d, <vec_carry1=v26.2d, #2
shl v26.2d, v26.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_carry1=reg128#27.16b
# asm 2: orr <vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_carry1=v26.16b
orr v21.16b, v21.16b, v26.16b

# qhasm: vec_carry2 = vec_tmp1 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#27.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v26.16b, <vec_tmp1=v21.16b, <vec_MASKcarry2=v13.16b
and v26.16b, v21.16b, v13.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_MASKcarry2=v13.16b
bic v21.16b, v21.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#27.2d, <vec_carry2=reg128#27.2d, #62
# asm 2: ushr >vec_carry2=v26.2d, <vec_carry2=v26.2d, #62
ushr v26.2d, v26.2d, #62

# qhasm: vec_tmp2 |= vec_carry2
# asm 1: orr <vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_carry2=reg128#27.16b
# asm 2: orr <vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_carry2=v26.16b
orr v22.16b, v22.16b, v26.16b

# qhasm: vec_carry1 = vec_tmp2 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#27.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v26.16b, <vec_tmp2=v22.16b, <vec_MASKcarry1=v12.16b
and v26.16b, v22.16b, v12.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_MASKcarry1=v12.16b
bic v22.16b, v22.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#27.2d, <vec_carry1=reg128#27.2d, #2
# asm 2: shl >vec_carry1=v26.2d, <vec_carry1=v26.2d, #2
shl v26.2d, v26.2d, #2

# qhasm: vec_tmp2 |= vec_carry1
# asm 1: orr <vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_carry1=reg128#27.16b
# asm 2: orr <vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_carry1=v26.16b
orr v22.16b, v22.16b, v26.16b

# qhasm: vec_carry2 = vec_tmp2 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#27.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v26.16b, <vec_tmp2=v22.16b, <vec_MASKcarry2=v13.16b
and v26.16b, v22.16b, v13.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_MASKcarry2=v13.16b
bic v22.16b, v22.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#27.2d, <vec_carry2=reg128#27.2d, #62
# asm 2: ushr >vec_carry2=v26.2d, <vec_carry2=v26.2d, #62
ushr v26.2d, v26.2d, #62

# qhasm: vec_tmp3 |= vec_carry2
# asm 1: orr <vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_carry2=reg128#27.16b
# asm 2: orr <vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_carry2=v26.16b
orr v23.16b, v23.16b, v26.16b

# qhasm: vec_carry1 = vec_tmp3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#27.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v26.16b, <vec_tmp3=v23.16b, <vec_MASKcarry1=v12.16b
and v26.16b, v23.16b, v12.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_MASKcarry1=v12.16b
bic v23.16b, v23.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#27.2d, <vec_carry1=reg128#27.2d, #2
# asm 2: shl >vec_carry1=v26.2d, <vec_carry1=v26.2d, #2
shl v26.2d, v26.2d, #2

# qhasm: vec_tmp3 |= vec_carry1
# asm 1: orr <vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_carry1=reg128#27.16b
# asm 2: orr <vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_carry1=v26.16b
orr v23.16b, v23.16b, v26.16b

# qhasm: vec_carry2 = vec_tmp3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#27.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v26.16b, <vec_tmp3=v23.16b, <vec_MASKcarry2=v13.16b
and v26.16b, v23.16b, v13.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_MASKcarry2=v13.16b
bic v23.16b, v23.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#27.2d, <vec_carry2=reg128#27.2d, #62
# asm 2: ushr >vec_carry2=v26.2d, <vec_carry2=v26.2d, #62
ushr v26.2d, v26.2d, #62

# qhasm: vec_tmp4 |= vec_carry2
# asm 1: orr <vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_carry2=reg128#27.16b
# asm 2: orr <vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_carry2=v26.16b
orr v24.16b, v24.16b, v26.16b

# qhasm: vec_carry1 = vec_tmp4 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#27.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v26.16b, <vec_tmp4=v24.16b, <vec_MASKcarry1=v12.16b
and v26.16b, v24.16b, v12.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_MASKcarry1=v12.16b
bic v24.16b, v24.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#27.2d, <vec_carry1=reg128#27.2d, #2
# asm 2: shl >vec_carry1=v26.2d, <vec_carry1=v26.2d, #2
shl v26.2d, v26.2d, #2

# qhasm: vec_tmp4 |= vec_carry1
# asm 1: orr <vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_carry1=reg128#27.16b
# asm 2: orr <vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_carry1=v26.16b
orr v24.16b, v24.16b, v26.16b

# qhasm: vec_carry2 = vec_tmp4 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#27.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v26.16b, <vec_tmp4=v24.16b, <vec_MASKcarry2=v13.16b
and v26.16b, v24.16b, v13.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_MASKcarry2=v13.16b
bic v24.16b, v24.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#27.2d, <vec_carry2=reg128#27.2d, #62
# asm 2: ushr >vec_carry2=v26.2d, <vec_carry2=v26.2d, #62
ushr v26.2d, v26.2d, #62

# qhasm: vec_tmp5 |= vec_carry2
# asm 1: orr <vec_tmp5=reg128#26.16b, <vec_tmp5=reg128#26.16b, <vec_carry2=reg128#27.16b
# asm 2: orr <vec_tmp5=v25.16b, <vec_tmp5=v25.16b, <vec_carry2=v26.16b
orr v25.16b, v25.16b, v26.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry
# asm 1: eor <vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry=reg128#15.16b
# asm 2: eor <vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_MASKcarry=v14.16b
eor v21.16b, v21.16b, v14.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b
# asm 2: not >vec_tmp1=v21.16b, <vec_tmp1=v21.16b
not v21.16b, v21.16b

# qhasm: vec_tmp2 ^= vec_MASKcarry
# asm 1: eor <vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry=reg128#15.16b
# asm 2: eor <vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_MASKcarry=v14.16b
eor v22.16b, v22.16b, v14.16b

# qhasm: vec_tmp2 = ~vec_tmp2
# asm 1: not >vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b
# asm 2: not >vec_tmp2=v22.16b, <vec_tmp2=v22.16b
not v22.16b, v22.16b

# qhasm: vec_tmp3 ^= vec_MASKcarry
# asm 1: eor <vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry=reg128#15.16b
# asm 2: eor <vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_MASKcarry=v14.16b
eor v23.16b, v23.16b, v14.16b

# qhasm: vec_tmp3 = ~vec_tmp3
# asm 1: not >vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b
# asm 2: not >vec_tmp3=v23.16b, <vec_tmp3=v23.16b
not v23.16b, v23.16b

# qhasm: vec_tmp4 ^= vec_MASKcarry
# asm 1: eor <vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry=reg128#15.16b
# asm 2: eor <vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_MASKcarry=v14.16b
eor v24.16b, v24.16b, v14.16b

# qhasm: vec_tmp4 = ~vec_tmp4
# asm 1: not >vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b
# asm 2: not >vec_tmp4=v24.16b, <vec_tmp4=v24.16b
not v24.16b, v24.16b

# qhasm: vec_tmp5 ^= vec_MASKhalfeffect
# asm 1: eor <vec_tmp5=reg128#26.16b, <vec_tmp5=reg128#26.16b, <vec_MASKhalfeffect=reg128#18.16b
# asm 2: eor <vec_tmp5=v25.16b, <vec_tmp5=v25.16b, <vec_MASKhalfeffect=v17.16b
eor v25.16b, v25.16b, v17.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#22.2d, <vec_tmp1=reg128#22.2d, <vec_ONE=reg128#16.2d
# asm 2: add <vec_tmp1=v21.2d, <vec_tmp1=v21.2d, <vec_ONE=v15.2d
add v21.2d, v21.2d, v15.2d

# qhasm: vec_tmp1 &= vec_uhat_rhat
# asm 1: and <vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_uhat_rhat=reg128#21.16b
# asm 2: and <vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_uhat_rhat=v20.16b
and v21.16b, v21.16b, v20.16b

# qhasm: vec_tmp2 &= vec_uhat_rhat
# asm 1: and <vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_uhat_rhat=reg128#21.16b
# asm 2: and <vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_uhat_rhat=v20.16b
and v22.16b, v22.16b, v20.16b

# qhasm: vec_tmp3 &= vec_uhat_rhat
# asm 1: and <vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_uhat_rhat=reg128#21.16b
# asm 2: and <vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_uhat_rhat=v20.16b
and v23.16b, v23.16b, v20.16b

# qhasm: vec_tmp4 &= vec_uhat_rhat
# asm 1: and <vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_uhat_rhat=reg128#21.16b
# asm 2: and <vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_uhat_rhat=v20.16b
and v24.16b, v24.16b, v20.16b

# qhasm: vec_tmp5 &= vec_uhat_rhat
# asm 1: and <vec_tmp5=reg128#26.16b, <vec_tmp5=reg128#26.16b, <vec_uhat_rhat=reg128#21.16b
# asm 2: and <vec_tmp5=v25.16b, <vec_tmp5=v25.16b, <vec_uhat_rhat=v20.16b
and v25.16b, v25.16b, v20.16b

# qhasm: 2x vec_R2_R3_S2_S3 += vec_tmp1
# asm 1: add <vec_R2_R3_S2_S3=reg128#10.2d, <vec_R2_R3_S2_S3=reg128#10.2d, <vec_tmp1=reg128#22.2d
# asm 2: add <vec_R2_R3_S2_S3=v9.2d, <vec_R2_R3_S2_S3=v9.2d, <vec_tmp1=v21.2d
add v9.2d, v9.2d, v21.2d

# qhasm: 2x vec_R4_R5_S4_S5 += vec_tmp2
# asm 1: add <vec_R4_R5_S4_S5=reg128#11.2d, <vec_R4_R5_S4_S5=reg128#11.2d, <vec_tmp2=reg128#23.2d
# asm 2: add <vec_R4_R5_S4_S5=v10.2d, <vec_R4_R5_S4_S5=v10.2d, <vec_tmp2=v22.2d
add v10.2d, v10.2d, v22.2d

# qhasm: 2x vec_R6_R7_S6_S7 += vec_tmp3
# asm 1: add <vec_R6_R7_S6_S7=reg128#12.2d, <vec_R6_R7_S6_S7=reg128#12.2d, <vec_tmp3=reg128#24.2d
# asm 2: add <vec_R6_R7_S6_S7=v11.2d, <vec_R6_R7_S6_S7=v11.2d, <vec_tmp3=v23.2d
add v11.2d, v11.2d, v23.2d

# qhasm: 2x vec_R8_R9_S8_S9 += vec_tmp4
# asm 1: add <vec_R8_R9_S8_S9=reg128#9.2d, <vec_R8_R9_S8_S9=reg128#9.2d, <vec_tmp4=reg128#25.2d
# asm 2: add <vec_R8_R9_S8_S9=v8.2d, <vec_R8_R9_S8_S9=v8.2d, <vec_tmp4=v24.2d
add v8.2d, v8.2d, v24.2d

# qhasm: 2x vec_R10_0_S10_0 += vec_tmp5
# asm 1: add <vec_R10_0_S10_0=reg128#8.2d, <vec_R10_0_S10_0=reg128#8.2d, <vec_tmp5=reg128#26.2d
# asm 2: add <vec_R10_0_S10_0=v7.2d, <vec_R10_0_S10_0=v7.2d, <vec_tmp5=v25.2d
add v7.2d, v7.2d, v25.2d

# qhasm: 2x vec_tmp1 = vec_F0_F1_G0_G1[1/2]
# asm 1: dup <vec_tmp1=reg128#22.2d, <vec_F0_F1_G0_G1=reg128#1.d[1]
# asm 2: dup <vec_tmp1=v21.2d, <vec_F0_F1_G0_G1=v0.d[1]
dup v21.2d, v0.d[1]

# qhasm: 2x vec_tmp2 = vec_F2_F3_G2_G3[1/2]
# asm 1: dup <vec_tmp2=reg128#23.2d, <vec_F2_F3_G2_G3=reg128#2.d[1]
# asm 2: dup <vec_tmp2=v22.2d, <vec_F2_F3_G2_G3=v1.d[1]
dup v22.2d, v1.d[1]

# qhasm: 2x vec_tmp3 = vec_F4_F5_G4_G5[1/2]
# asm 1: dup <vec_tmp3=reg128#24.2d, <vec_F4_F5_G4_G5=reg128#3.d[1]
# asm 2: dup <vec_tmp3=v23.2d, <vec_F4_F5_G4_G5=v2.d[1]
dup v23.2d, v2.d[1]

# qhasm: 2x vec_tmp4 = vec_F6_F7_G6_G7[1/2]
# asm 1: dup <vec_tmp4=reg128#25.2d, <vec_F6_F7_G6_G7=reg128#4.d[1]
# asm 2: dup <vec_tmp4=v24.2d, <vec_F6_F7_G6_G7=v3.d[1]
dup v24.2d, v3.d[1]

# qhasm: 2x vec_tmp5 = vec_F8_0_G8_0[1/2]
# asm 1: dup <vec_tmp5=reg128#26.2d, <vec_F8_0_G8_0=reg128#5.d[1]
# asm 2: dup <vec_tmp5=v25.2d, <vec_F8_0_G8_0=v4.d[1]
dup v25.2d, v4.d[1]

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#22.2d, #2
# asm 2: shl >vec_tmp1=v0.2d, <vec_tmp1=v21.2d, #2
shl v0.2d, v21.2d, #2

# qhasm: 2x vec_tmp2 <<= 2
# asm 1: shl >vec_tmp2=reg128#2.2d, <vec_tmp2=reg128#23.2d, #2
# asm 2: shl >vec_tmp2=v1.2d, <vec_tmp2=v22.2d, #2
shl v1.2d, v22.2d, #2

# qhasm: 2x vec_tmp3 <<= 2
# asm 1: shl >vec_tmp3=reg128#3.2d, <vec_tmp3=reg128#24.2d, #2
# asm 2: shl >vec_tmp3=v2.2d, <vec_tmp3=v23.2d, #2
shl v2.2d, v23.2d, #2

# qhasm: 2x vec_tmp4 <<= 2
# asm 1: shl >vec_tmp4=reg128#4.2d, <vec_tmp4=reg128#25.2d, #2
# asm 2: shl >vec_tmp4=v3.2d, <vec_tmp4=v24.2d, #2
shl v3.2d, v24.2d, #2

# qhasm: 2x vec_tmp5 <<= 2
# asm 1: shl >vec_tmp5=reg128#21.2d, <vec_tmp5=reg128#26.2d, #2
# asm 2: shl >vec_tmp5=v20.2d, <vec_tmp5=v25.2d, #2
shl v20.2d, v25.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#22.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v21.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v12.16b
and v21.16b, v0.16b, v12.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v12.16b
bic v0.16b, v0.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#22.2d, <vec_carry1=reg128#22.2d, #2
# asm 2: shl >vec_carry1=v21.2d, <vec_carry1=v21.2d, #2
shl v21.2d, v21.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_carry1=reg128#22.16b
# asm 2: orr <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_carry1=v21.16b
orr v0.16b, v0.16b, v21.16b

# qhasm: vec_carry2 = vec_tmp1 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#22.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v21.16b, <vec_tmp1=v0.16b, <vec_MASKcarry2=v13.16b
and v21.16b, v0.16b, v13.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry2=v13.16b
bic v0.16b, v0.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#22.2d, <vec_carry2=reg128#22.2d, #62
# asm 2: ushr >vec_carry2=v21.2d, <vec_carry2=v21.2d, #62
ushr v21.2d, v21.2d, #62

# qhasm: vec_tmp2 |= vec_carry2
# asm 1: orr <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_carry2=reg128#22.16b
# asm 2: orr <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_carry2=v21.16b
orr v1.16b, v1.16b, v21.16b

# qhasm: vec_carry1 = vec_tmp2 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#22.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v21.16b, <vec_tmp2=v1.16b, <vec_MASKcarry1=v12.16b
and v21.16b, v1.16b, v12.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_MASKcarry1=v12.16b
bic v1.16b, v1.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#22.2d, <vec_carry1=reg128#22.2d, #2
# asm 2: shl >vec_carry1=v21.2d, <vec_carry1=v21.2d, #2
shl v21.2d, v21.2d, #2

# qhasm: vec_tmp2 |= vec_carry1
# asm 1: orr <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_carry1=reg128#22.16b
# asm 2: orr <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_carry1=v21.16b
orr v1.16b, v1.16b, v21.16b

# qhasm: vec_carry2 = vec_tmp2 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#22.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v21.16b, <vec_tmp2=v1.16b, <vec_MASKcarry2=v13.16b
and v21.16b, v1.16b, v13.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_MASKcarry2=v13.16b
bic v1.16b, v1.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#22.2d, <vec_carry2=reg128#22.2d, #62
# asm 2: ushr >vec_carry2=v21.2d, <vec_carry2=v21.2d, #62
ushr v21.2d, v21.2d, #62

# qhasm: vec_tmp3 |= vec_carry2
# asm 1: orr <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_carry2=reg128#22.16b
# asm 2: orr <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_carry2=v21.16b
orr v2.16b, v2.16b, v21.16b

# qhasm: vec_carry1 = vec_tmp3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#22.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v21.16b, <vec_tmp3=v2.16b, <vec_MASKcarry1=v12.16b
and v21.16b, v2.16b, v12.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_MASKcarry1=v12.16b
bic v2.16b, v2.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#22.2d, <vec_carry1=reg128#22.2d, #2
# asm 2: shl >vec_carry1=v21.2d, <vec_carry1=v21.2d, #2
shl v21.2d, v21.2d, #2

# qhasm: vec_tmp3 |= vec_carry1
# asm 1: orr <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_carry1=reg128#22.16b
# asm 2: orr <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_carry1=v21.16b
orr v2.16b, v2.16b, v21.16b

# qhasm: vec_carry2 = vec_tmp3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#22.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v21.16b, <vec_tmp3=v2.16b, <vec_MASKcarry2=v13.16b
and v21.16b, v2.16b, v13.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_MASKcarry2=v13.16b
bic v2.16b, v2.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#22.2d, <vec_carry2=reg128#22.2d, #62
# asm 2: ushr >vec_carry2=v21.2d, <vec_carry2=v21.2d, #62
ushr v21.2d, v21.2d, #62

# qhasm: vec_tmp4 |= vec_carry2
# asm 1: orr <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_carry2=reg128#22.16b
# asm 2: orr <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_carry2=v21.16b
orr v3.16b, v3.16b, v21.16b

# qhasm: vec_carry1 = vec_tmp4 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#22.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v21.16b, <vec_tmp4=v3.16b, <vec_MASKcarry1=v12.16b
and v21.16b, v3.16b, v12.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_MASKcarry1=v12.16b
bic v3.16b, v3.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#22.2d, <vec_carry1=reg128#22.2d, #2
# asm 2: shl >vec_carry1=v21.2d, <vec_carry1=v21.2d, #2
shl v21.2d, v21.2d, #2

# qhasm: vec_tmp4 |= vec_carry1
# asm 1: orr <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_carry1=reg128#22.16b
# asm 2: orr <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_carry1=v21.16b
orr v3.16b, v3.16b, v21.16b

# qhasm: vec_carry2 = vec_tmp4 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#22.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v21.16b, <vec_tmp4=v3.16b, <vec_MASKcarry2=v13.16b
and v21.16b, v3.16b, v13.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_MASKcarry2=v13.16b
bic v3.16b, v3.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#22.2d, <vec_carry2=reg128#22.2d, #62
# asm 2: ushr >vec_carry2=v21.2d, <vec_carry2=v21.2d, #62
ushr v21.2d, v21.2d, #62

# qhasm: vec_tmp5 |= vec_carry2
# asm 1: orr <vec_tmp5=reg128#21.16b, <vec_tmp5=reg128#21.16b, <vec_carry2=reg128#22.16b
# asm 2: orr <vec_tmp5=v20.16b, <vec_tmp5=v20.16b, <vec_carry2=v21.16b
orr v20.16b, v20.16b, v21.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry
# asm 1: eor <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry=reg128#15.16b
# asm 2: eor <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry=v14.16b
eor v0.16b, v0.16b, v14.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b
# asm 2: not >vec_tmp1=v0.16b, <vec_tmp1=v0.16b
not v0.16b, v0.16b

# qhasm: vec_tmp2 ^= vec_MASKcarry
# asm 1: eor <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry=reg128#15.16b
# asm 2: eor <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_MASKcarry=v14.16b
eor v1.16b, v1.16b, v14.16b

# qhasm: vec_tmp2 = ~vec_tmp2
# asm 1: not >vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b
# asm 2: not >vec_tmp2=v1.16b, <vec_tmp2=v1.16b
not v1.16b, v1.16b

# qhasm: vec_tmp3 ^= vec_MASKcarry
# asm 1: eor <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry=reg128#15.16b
# asm 2: eor <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_MASKcarry=v14.16b
eor v2.16b, v2.16b, v14.16b

# qhasm: vec_tmp3 = ~vec_tmp3
# asm 1: not >vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b
# asm 2: not >vec_tmp3=v2.16b, <vec_tmp3=v2.16b
not v2.16b, v2.16b

# qhasm: vec_tmp4 ^= vec_MASKcarry
# asm 1: eor <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry=reg128#15.16b
# asm 2: eor <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_MASKcarry=v14.16b
eor v3.16b, v3.16b, v14.16b

# qhasm: vec_tmp4 = ~vec_tmp4
# asm 1: not >vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b
# asm 2: not >vec_tmp4=v3.16b, <vec_tmp4=v3.16b
not v3.16b, v3.16b

# qhasm: vec_tmp5 ^= vec_MASKhalfeffect
# asm 1: eor <vec_tmp5=reg128#21.16b, <vec_tmp5=reg128#21.16b, <vec_MASKhalfeffect=reg128#18.16b
# asm 2: eor <vec_tmp5=v20.16b, <vec_tmp5=v20.16b, <vec_MASKhalfeffect=v17.16b
eor v20.16b, v20.16b, v17.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#1.2d, <vec_ONE=reg128#16.2d
# asm 2: add <vec_tmp1=v0.2d, <vec_tmp1=v0.2d, <vec_ONE=v15.2d
add v0.2d, v0.2d, v15.2d

# qhasm: vec_tmp1 &= vec_vhat_shat
# asm 1: and <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_vhat_shat=reg128#20.16b
# asm 2: and <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_vhat_shat=v19.16b
and v0.16b, v0.16b, v19.16b

# qhasm: vec_tmp2 &= vec_vhat_shat
# asm 1: and <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_vhat_shat=reg128#20.16b
# asm 2: and <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_vhat_shat=v19.16b
and v1.16b, v1.16b, v19.16b

# qhasm: vec_tmp3 &= vec_vhat_shat
# asm 1: and <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_vhat_shat=reg128#20.16b
# asm 2: and <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_vhat_shat=v19.16b
and v2.16b, v2.16b, v19.16b

# qhasm: vec_tmp4 &= vec_vhat_shat
# asm 1: and <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_vhat_shat=reg128#20.16b
# asm 2: and <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_vhat_shat=v19.16b
and v3.16b, v3.16b, v19.16b

# qhasm: vec_tmp5 &= vec_vhat_shat
# asm 1: and <vec_tmp5=reg128#21.16b, <vec_tmp5=reg128#21.16b, <vec_vhat_shat=reg128#20.16b
# asm 2: and <vec_tmp5=v20.16b, <vec_tmp5=v20.16b, <vec_vhat_shat=v19.16b
and v20.16b, v20.16b, v19.16b

# qhasm: 2x vec_R2_R3_S2_S3 += vec_tmp1
# asm 1: add <vec_R2_R3_S2_S3=reg128#10.2d, <vec_R2_R3_S2_S3=reg128#10.2d, <vec_tmp1=reg128#1.2d
# asm 2: add <vec_R2_R3_S2_S3=v9.2d, <vec_R2_R3_S2_S3=v9.2d, <vec_tmp1=v0.2d
add v9.2d, v9.2d, v0.2d

# qhasm: 2x vec_R4_R5_S4_S5 += vec_tmp2
# asm 1: add <vec_R4_R5_S4_S5=reg128#11.2d, <vec_R4_R5_S4_S5=reg128#11.2d, <vec_tmp2=reg128#2.2d
# asm 2: add <vec_R4_R5_S4_S5=v10.2d, <vec_R4_R5_S4_S5=v10.2d, <vec_tmp2=v1.2d
add v10.2d, v10.2d, v1.2d

# qhasm: 2x vec_R6_R7_S6_S7 += vec_tmp3
# asm 1: add <vec_R6_R7_S6_S7=reg128#12.2d, <vec_R6_R7_S6_S7=reg128#12.2d, <vec_tmp3=reg128#3.2d
# asm 2: add <vec_R6_R7_S6_S7=v11.2d, <vec_R6_R7_S6_S7=v11.2d, <vec_tmp3=v2.2d
add v11.2d, v11.2d, v2.2d

# qhasm: 2x vec_R8_R9_S8_S9 += vec_tmp4
# asm 1: add <vec_R8_R9_S8_S9=reg128#9.2d, <vec_R8_R9_S8_S9=reg128#9.2d, <vec_tmp4=reg128#4.2d
# asm 2: add <vec_R8_R9_S8_S9=v8.2d, <vec_R8_R9_S8_S9=v8.2d, <vec_tmp4=v3.2d
add v8.2d, v8.2d, v3.2d

# qhasm: 2x vec_R10_0_S10_0 += vec_tmp5
# asm 1: add <vec_R10_0_S10_0=reg128#8.2d, <vec_R10_0_S10_0=reg128#8.2d, <vec_tmp5=reg128#21.2d
# asm 2: add <vec_R10_0_S10_0=v7.2d, <vec_R10_0_S10_0=v7.2d, <vec_tmp5=v20.2d
add v7.2d, v7.2d, v20.2d

# qhasm: vec_carry1 = vec_R2_R3_S2_S3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#1.16b, <vec_R2_R3_S2_S3=reg128#10.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v0.16b, <vec_R2_R3_S2_S3=v9.16b, <vec_MASKcarry1=v12.16b
and v0.16b, v9.16b, v12.16b

# qhasm: vec_R2_R3_S2_S3 = vec_R2_R3_S2_S3 & ~vec_MASKcarry1
# asm 1: bic >vec_R2_R3_S2_S3=reg128#2.16b, <vec_R2_R3_S2_S3=reg128#10.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_R2_R3_S2_S3=v1.16b, <vec_R2_R3_S2_S3=v9.16b, <vec_MASKcarry1=v12.16b
bic v1.16b, v9.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#1.2d, <vec_carry1=reg128#1.2d, #2
# asm 2: shl >vec_carry1=v0.2d, <vec_carry1=v0.2d, #2
shl v0.2d, v0.2d, #2

# qhasm: 2x vec_R2_R3_S2_S3 += vec_carry1
# asm 1: add <vec_R2_R3_S2_S3=reg128#2.2d, <vec_R2_R3_S2_S3=reg128#2.2d, <vec_carry1=reg128#1.2d
# asm 2: add <vec_R2_R3_S2_S3=v1.2d, <vec_R2_R3_S2_S3=v1.2d, <vec_carry1=v0.2d
add v1.2d, v1.2d, v0.2d

# qhasm: vec_carry2 = vec_R2_R3_S2_S3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#1.16b, <vec_R2_R3_S2_S3=reg128#2.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v0.16b, <vec_R2_R3_S2_S3=v1.16b, <vec_MASKcarry2=v13.16b
and v0.16b, v1.16b, v13.16b

# qhasm: vec_R2_R3_S2_S3 = vec_R2_R3_S2_S3 & ~vec_MASKcarry2
# asm 1: bic >vec_R2_R3_S2_S3=reg128#2.16b, <vec_R2_R3_S2_S3=reg128#2.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_R2_R3_S2_S3=v1.16b, <vec_R2_R3_S2_S3=v1.16b, <vec_MASKcarry2=v13.16b
bic v1.16b, v1.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#1.2d, <vec_carry2=reg128#1.2d, #62
# asm 2: ushr >vec_carry2=v0.2d, <vec_carry2=v0.2d, #62
ushr v0.2d, v0.2d, #62

# qhasm: 2x vec_R4_R5_S4_S5 += vec_carry2
# asm 1: add <vec_R4_R5_S4_S5=reg128#11.2d, <vec_R4_R5_S4_S5=reg128#11.2d, <vec_carry2=reg128#1.2d
# asm 2: add <vec_R4_R5_S4_S5=v10.2d, <vec_R4_R5_S4_S5=v10.2d, <vec_carry2=v0.2d
add v10.2d, v10.2d, v0.2d

# qhasm: vec_carry1 = vec_R4_R5_S4_S5 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#1.16b, <vec_R4_R5_S4_S5=reg128#11.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v0.16b, <vec_R4_R5_S4_S5=v10.16b, <vec_MASKcarry1=v12.16b
and v0.16b, v10.16b, v12.16b

# qhasm: vec_R4_R5_S4_S5 = vec_R4_R5_S4_S5 & ~vec_MASKcarry1
# asm 1: bic >vec_R4_R5_S4_S5=reg128#3.16b, <vec_R4_R5_S4_S5=reg128#11.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_R4_R5_S4_S5=v2.16b, <vec_R4_R5_S4_S5=v10.16b, <vec_MASKcarry1=v12.16b
bic v2.16b, v10.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#1.2d, <vec_carry1=reg128#1.2d, #2
# asm 2: shl >vec_carry1=v0.2d, <vec_carry1=v0.2d, #2
shl v0.2d, v0.2d, #2

# qhasm: 2x vec_R4_R5_S4_S5 += vec_carry1
# asm 1: add <vec_R4_R5_S4_S5=reg128#3.2d, <vec_R4_R5_S4_S5=reg128#3.2d, <vec_carry1=reg128#1.2d
# asm 2: add <vec_R4_R5_S4_S5=v2.2d, <vec_R4_R5_S4_S5=v2.2d, <vec_carry1=v0.2d
add v2.2d, v2.2d, v0.2d

# qhasm: vec_carry2 = vec_R4_R5_S4_S5 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#1.16b, <vec_R4_R5_S4_S5=reg128#3.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v0.16b, <vec_R4_R5_S4_S5=v2.16b, <vec_MASKcarry2=v13.16b
and v0.16b, v2.16b, v13.16b

# qhasm: vec_R4_R5_S4_S5 = vec_R4_R5_S4_S5 & ~vec_MASKcarry2
# asm 1: bic >vec_R4_R5_S4_S5=reg128#3.16b, <vec_R4_R5_S4_S5=reg128#3.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_R4_R5_S4_S5=v2.16b, <vec_R4_R5_S4_S5=v2.16b, <vec_MASKcarry2=v13.16b
bic v2.16b, v2.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#1.2d, <vec_carry2=reg128#1.2d, #62
# asm 2: ushr >vec_carry2=v0.2d, <vec_carry2=v0.2d, #62
ushr v0.2d, v0.2d, #62

# qhasm: 2x vec_R6_R7_S6_S7 += vec_carry2
# asm 1: add <vec_R6_R7_S6_S7=reg128#12.2d, <vec_R6_R7_S6_S7=reg128#12.2d, <vec_carry2=reg128#1.2d
# asm 2: add <vec_R6_R7_S6_S7=v11.2d, <vec_R6_R7_S6_S7=v11.2d, <vec_carry2=v0.2d
add v11.2d, v11.2d, v0.2d

# qhasm: vec_carry1 = vec_R6_R7_S6_S7 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#1.16b, <vec_R6_R7_S6_S7=reg128#12.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v0.16b, <vec_R6_R7_S6_S7=v11.16b, <vec_MASKcarry1=v12.16b
and v0.16b, v11.16b, v12.16b

# qhasm: vec_R6_R7_S6_S7 = vec_R6_R7_S6_S7 & ~vec_MASKcarry1
# asm 1: bic >vec_R6_R7_S6_S7=reg128#4.16b, <vec_R6_R7_S6_S7=reg128#12.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_R6_R7_S6_S7=v3.16b, <vec_R6_R7_S6_S7=v11.16b, <vec_MASKcarry1=v12.16b
bic v3.16b, v11.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#1.2d, <vec_carry1=reg128#1.2d, #2
# asm 2: shl >vec_carry1=v0.2d, <vec_carry1=v0.2d, #2
shl v0.2d, v0.2d, #2

# qhasm: 2x vec_R6_R7_S6_S7 += vec_carry1
# asm 1: add <vec_R6_R7_S6_S7=reg128#4.2d, <vec_R6_R7_S6_S7=reg128#4.2d, <vec_carry1=reg128#1.2d
# asm 2: add <vec_R6_R7_S6_S7=v3.2d, <vec_R6_R7_S6_S7=v3.2d, <vec_carry1=v0.2d
add v3.2d, v3.2d, v0.2d

# qhasm: vec_carry2 = vec_R6_R7_S6_S7 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#1.16b, <vec_R6_R7_S6_S7=reg128#4.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v0.16b, <vec_R6_R7_S6_S7=v3.16b, <vec_MASKcarry2=v13.16b
and v0.16b, v3.16b, v13.16b

# qhasm: vec_R6_R7_S6_S7 = vec_R6_R7_S6_S7 & ~vec_MASKcarry2
# asm 1: bic >vec_R6_R7_S6_S7=reg128#4.16b, <vec_R6_R7_S6_S7=reg128#4.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_R6_R7_S6_S7=v3.16b, <vec_R6_R7_S6_S7=v3.16b, <vec_MASKcarry2=v13.16b
bic v3.16b, v3.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#1.2d, <vec_carry2=reg128#1.2d, #62
# asm 2: ushr >vec_carry2=v0.2d, <vec_carry2=v0.2d, #62
ushr v0.2d, v0.2d, #62

# qhasm: 2x vec_R8_R9_S8_S9 += vec_carry2
# asm 1: add <vec_R8_R9_S8_S9=reg128#9.2d, <vec_R8_R9_S8_S9=reg128#9.2d, <vec_carry2=reg128#1.2d
# asm 2: add <vec_R8_R9_S8_S9=v8.2d, <vec_R8_R9_S8_S9=v8.2d, <vec_carry2=v0.2d
add v8.2d, v8.2d, v0.2d

# qhasm: vec_carry1 = vec_R8_R9_S8_S9 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#1.16b, <vec_R8_R9_S8_S9=reg128#9.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v0.16b, <vec_R8_R9_S8_S9=v8.16b, <vec_MASKcarry1=v12.16b
and v0.16b, v8.16b, v12.16b

# qhasm: vec_R8_R9_S8_S9 = vec_R8_R9_S8_S9 & ~vec_MASKcarry1
# asm 1: bic >vec_R8_R9_S8_S9=reg128#9.16b, <vec_R8_R9_S8_S9=reg128#9.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_R8_R9_S8_S9=v8.16b, <vec_R8_R9_S8_S9=v8.16b, <vec_MASKcarry1=v12.16b
bic v8.16b, v8.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#1.2d, <vec_carry1=reg128#1.2d, #2
# asm 2: shl >vec_carry1=v0.2d, <vec_carry1=v0.2d, #2
shl v0.2d, v0.2d, #2

# qhasm: 2x vec_R8_R9_S8_S9 += vec_carry1
# asm 1: add <vec_R8_R9_S8_S9=reg128#9.2d, <vec_R8_R9_S8_S9=reg128#9.2d, <vec_carry1=reg128#1.2d
# asm 2: add <vec_R8_R9_S8_S9=v8.2d, <vec_R8_R9_S8_S9=v8.2d, <vec_carry1=v0.2d
add v8.2d, v8.2d, v0.2d

# qhasm: vec_carry2 = vec_R8_R9_S8_S9 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#1.16b, <vec_R8_R9_S8_S9=reg128#9.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v0.16b, <vec_R8_R9_S8_S9=v8.16b, <vec_MASKcarry2=v13.16b
and v0.16b, v8.16b, v13.16b

# qhasm: vec_R8_R9_S8_S9 = vec_R8_R9_S8_S9 & ~vec_MASKcarry2
# asm 1: bic >vec_R8_R9_S8_S9=reg128#9.16b, <vec_R8_R9_S8_S9=reg128#9.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_R8_R9_S8_S9=v8.16b, <vec_R8_R9_S8_S9=v8.16b, <vec_MASKcarry2=v13.16b
bic v8.16b, v8.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#1.2d, <vec_carry2=reg128#1.2d, #62
# asm 2: ushr >vec_carry2=v0.2d, <vec_carry2=v0.2d, #62
ushr v0.2d, v0.2d, #62

# qhasm: 2x vec_R10_0_S10_0 += vec_carry2
# asm 1: add <vec_R10_0_S10_0=reg128#8.2d, <vec_R10_0_S10_0=reg128#8.2d, <vec_carry2=reg128#1.2d
# asm 2: add <vec_R10_0_S10_0=v7.2d, <vec_R10_0_S10_0=v7.2d, <vec_carry2=v0.2d
add v7.2d, v7.2d, v0.2d

# qhasm: 4x vec_Fhat_0_Ghat_0 = vec_F8_0_G8_0 >> 31
# asm 1: sshr >vec_Fhat_0_Ghat_0=reg128#1.4s, <vec_F8_0_G8_0=reg128#5.4s, #31
# asm 2: sshr >vec_Fhat_0_Ghat_0=v0.4s, <vec_F8_0_G8_0=v4.4s, #31
sshr v0.4s, v4.4s, #31

# qhasm: 4x vec_Fhat = vec_Fhat_0_Ghat_0[0/4]
# asm 1: dup <vec_Fhat=reg128#5.4s, <vec_Fhat_0_Ghat_0=reg128#1.s[0]
# asm 2: dup <vec_Fhat=v4.4s, <vec_Fhat_0_Ghat_0=v0.s[0]
dup v4.4s, v0.s[0]

# qhasm: 4x vec_Ghat = vec_Fhat_0_Ghat_0[2/4]
# asm 1: dup <vec_Ghat=reg128#10.4s, <vec_Fhat_0_Ghat_0=reg128#1.s[2]
# asm 2: dup <vec_Ghat=v9.4s, <vec_Fhat_0_Ghat_0=v0.s[2]
dup v9.4s, v0.s[2]

# qhasm: 4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[0/4] vec_uu1_rr1_vv1_ss1[0/4] vec_uu0_rr0_vv0_ss0[1/4] vec_uu1_rr1_vv1_ss1[1/4]
# asm 1: zip1 >vec_tmp1=reg128#1.4s, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s
# asm 2: zip1 >vec_tmp1=v0.4s, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_uu1_rr1_vv1_ss1=v6.4s
zip1 v0.4s, v5.4s, v6.4s

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#1.2d, #2
# asm 2: shl >vec_tmp1=v0.2d, <vec_tmp1=v0.2d, #2
shl v0.2d, v0.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#11.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v10.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v12.16b
and v10.16b, v0.16b, v12.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v12.16b
bic v0.16b, v0.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#11.2d, <vec_carry1=reg128#11.2d, #2
# asm 2: shl >vec_carry1=v10.2d, <vec_carry1=v10.2d, #2
shl v10.2d, v10.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_carry1=reg128#11.16b
# asm 2: orr <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_carry1=v10.16b
orr v0.16b, v0.16b, v10.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry1
# asm 1: eor <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: eor <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v12.16b
eor v0.16b, v0.16b, v12.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b
# asm 2: not >vec_tmp1=v0.16b, <vec_tmp1=v0.16b
not v0.16b, v0.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#1.2d, <vec_ONE=reg128#16.2d
# asm 2: add <vec_tmp1=v0.2d, <vec_tmp1=v0.2d, <vec_ONE=v15.2d
add v0.2d, v0.2d, v15.2d

# qhasm: vec_tmp1 &= vec_Fhat
# asm 1: and <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_Fhat=reg128#5.16b
# asm 2: and <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_Fhat=v4.16b
and v0.16b, v0.16b, v4.16b

# qhasm: 2x vec_tmp2 = vec_tmp1 << 32
# asm 1: shl >vec_tmp2=reg128#5.2d, <vec_tmp1=reg128#1.2d, #32
# asm 2: shl >vec_tmp2=v4.2d, <vec_tmp1=v0.2d, #32
shl v4.2d, v0.2d, #32

# qhasm: 2x vec_tmp3 = vec_tmp1 unsigned>> 32
# asm 1: ushr >vec_tmp3=reg128#1.2d, <vec_tmp1=reg128#1.2d, #32
# asm 2: ushr >vec_tmp3=v0.2d, <vec_tmp1=v0.2d, #32
ushr v0.2d, v0.2d, #32

# qhasm: 2x vec_R8_R9_S8_S9 += vec_tmp2
# asm 1: add <vec_R8_R9_S8_S9=reg128#9.2d, <vec_R8_R9_S8_S9=reg128#9.2d, <vec_tmp2=reg128#5.2d
# asm 2: add <vec_R8_R9_S8_S9=v8.2d, <vec_R8_R9_S8_S9=v8.2d, <vec_tmp2=v4.2d
add v8.2d, v8.2d, v4.2d

# qhasm: 2x vec_R10_0_S10_0 += vec_tmp3
# asm 1: add <vec_R10_0_S10_0=reg128#8.2d, <vec_R10_0_S10_0=reg128#8.2d, <vec_tmp3=reg128#1.2d
# asm 2: add <vec_R10_0_S10_0=v7.2d, <vec_R10_0_S10_0=v7.2d, <vec_tmp3=v0.2d
add v7.2d, v7.2d, v0.2d

# qhasm: 4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[2/4] vec_uu1_rr1_vv1_ss1[2/4] vec_uu0_rr0_vv0_ss0[3/4] vec_uu1_rr1_vv1_ss1[3/4]
# asm 1: zip2 >vec_tmp1=reg128#1.4s, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s
# asm 2: zip2 >vec_tmp1=v0.4s, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_uu1_rr1_vv1_ss1=v6.4s
zip2 v0.4s, v5.4s, v6.4s

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#1.2d, #2
# asm 2: shl >vec_tmp1=v0.2d, <vec_tmp1=v0.2d, #2
shl v0.2d, v0.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#5.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v4.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v12.16b
and v4.16b, v0.16b, v12.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v12.16b
bic v0.16b, v0.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#5.2d, <vec_carry1=reg128#5.2d, #2
# asm 2: shl >vec_carry1=v4.2d, <vec_carry1=v4.2d, #2
shl v4.2d, v4.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_carry1=reg128#5.16b
# asm 2: orr <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_carry1=v4.16b
orr v0.16b, v0.16b, v4.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry1
# asm 1: eor <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: eor <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v12.16b
eor v0.16b, v0.16b, v12.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b
# asm 2: not >vec_tmp1=v0.16b, <vec_tmp1=v0.16b
not v0.16b, v0.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#1.2d, <vec_ONE=reg128#16.2d
# asm 2: add <vec_tmp1=v0.2d, <vec_tmp1=v0.2d, <vec_ONE=v15.2d
add v0.2d, v0.2d, v15.2d

# qhasm: vec_tmp1 &= vec_Ghat
# asm 1: and <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_Ghat=reg128#10.16b
# asm 2: and <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_Ghat=v9.16b
and v0.16b, v0.16b, v9.16b

# qhasm: vec_tmp1 &= vec_Ghat
# asm 1: and <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_Ghat=reg128#10.16b
# asm 2: and <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_Ghat=v9.16b
and v0.16b, v0.16b, v9.16b

# qhasm: 2x vec_tmp2 = vec_tmp1 << 32
# asm 1: shl >vec_tmp2=reg128#5.2d, <vec_tmp1=reg128#1.2d, #32
# asm 2: shl >vec_tmp2=v4.2d, <vec_tmp1=v0.2d, #32
shl v4.2d, v0.2d, #32

# qhasm: 2x vec_tmp3 = vec_tmp1 unsigned>> 32
# asm 1: ushr >vec_tmp3=reg128#1.2d, <vec_tmp1=reg128#1.2d, #32
# asm 2: ushr >vec_tmp3=v0.2d, <vec_tmp1=v0.2d, #32
ushr v0.2d, v0.2d, #32

# qhasm: 2x vec_R8_R9_S8_S9 += vec_tmp2
# asm 1: add <vec_R8_R9_S8_S9=reg128#9.2d, <vec_R8_R9_S8_S9=reg128#9.2d, <vec_tmp2=reg128#5.2d
# asm 2: add <vec_R8_R9_S8_S9=v8.2d, <vec_R8_R9_S8_S9=v8.2d, <vec_tmp2=v4.2d
add v8.2d, v8.2d, v4.2d

# qhasm: 2x vec_R10_0_S10_0 += vec_tmp3
# asm 1: add <vec_R10_0_S10_0=reg128#8.2d, <vec_R10_0_S10_0=reg128#8.2d, <vec_tmp3=reg128#1.2d
# asm 2: add <vec_R10_0_S10_0=v7.2d, <vec_R10_0_S10_0=v7.2d, <vec_tmp3=v0.2d
add v7.2d, v7.2d, v0.2d

# qhasm: vec_carry1 = vec_R8_R9_S8_S9 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#1.16b, <vec_R8_R9_S8_S9=reg128#9.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: and >vec_carry1=v0.16b, <vec_R8_R9_S8_S9=v8.16b, <vec_MASKcarry1=v12.16b
and v0.16b, v8.16b, v12.16b

# qhasm: vec_R8_R9_S8_S9 = vec_R8_R9_S8_S9 & ~vec_MASKcarry1
# asm 1: bic >vec_R8_R9_S8_S9=reg128#5.16b, <vec_R8_R9_S8_S9=reg128#9.16b, <vec_MASKcarry1=reg128#13.16b
# asm 2: bic >vec_R8_R9_S8_S9=v4.16b, <vec_R8_R9_S8_S9=v8.16b, <vec_MASKcarry1=v12.16b
bic v4.16b, v8.16b, v12.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#1.2d, <vec_carry1=reg128#1.2d, #2
# asm 2: shl >vec_carry1=v0.2d, <vec_carry1=v0.2d, #2
shl v0.2d, v0.2d, #2

# qhasm: 2x vec_R8_R9_S8_S9 += vec_carry1
# asm 1: add <vec_R8_R9_S8_S9=reg128#5.2d, <vec_R8_R9_S8_S9=reg128#5.2d, <vec_carry1=reg128#1.2d
# asm 2: add <vec_R8_R9_S8_S9=v4.2d, <vec_R8_R9_S8_S9=v4.2d, <vec_carry1=v0.2d
add v4.2d, v4.2d, v0.2d

# qhasm: vec_carry2 = vec_R8_R9_S8_S9 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#1.16b, <vec_R8_R9_S8_S9=reg128#5.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: and >vec_carry2=v0.16b, <vec_R8_R9_S8_S9=v4.16b, <vec_MASKcarry2=v13.16b
and v0.16b, v4.16b, v13.16b

# qhasm: vec_R8_R9_S8_S9 = vec_R8_R9_S8_S9 & ~vec_MASKcarry2
# asm 1: bic >vec_R8_R9_S8_S9=reg128#5.16b, <vec_R8_R9_S8_S9=reg128#5.16b, <vec_MASKcarry2=reg128#14.16b
# asm 2: bic >vec_R8_R9_S8_S9=v4.16b, <vec_R8_R9_S8_S9=v4.16b, <vec_MASKcarry2=v13.16b
bic v4.16b, v4.16b, v13.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#1.2d, <vec_carry2=reg128#1.2d, #62
# asm 2: ushr >vec_carry2=v0.2d, <vec_carry2=v0.2d, #62
ushr v0.2d, v0.2d, #62

# qhasm: 2x vec_R10_0_S10_0 += vec_carry2
# asm 1: add <vec_R10_0_S10_0=reg128#8.2d, <vec_R10_0_S10_0=reg128#8.2d, <vec_carry2=reg128#1.2d
# asm 2: add <vec_R10_0_S10_0=v7.2d, <vec_R10_0_S10_0=v7.2d, <vec_carry2=v0.2d
add v7.2d, v7.2d, v0.2d

# qhasm: R2R3 = vec_R2_R3_S2_S3[0/2]
# asm 1: umov >R2R3=int64#3, <vec_R2_R3_S2_S3=reg128#2.d[0]
# asm 2: umov >R2R3=x2, <vec_R2_R3_S2_S3=v1.d[0]
umov x2, v1.d[0]

# qhasm: S2S3 = vec_R2_R3_S2_S3[1/2]
# asm 1: umov >S2S3=int64#8, <vec_R2_R3_S2_S3=reg128#2.d[1]
# asm 2: umov >S2S3=x7, <vec_R2_R3_S2_S3=v1.d[1]
umov x7, v1.d[1]

# qhasm: mem64[pointerF+0] = R2R3
# asm 1: str <R2R3=int64#3, [<pointerF=int64#1, #0]
# asm 2: str <R2R3=x2, [<pointerF=x0, #0]
str x2, [x0, #0]

# qhasm: mem64[pointerG+0] = S2S3
# asm 1: str <S2S3=int64#8, [<pointerG=int64#2, #0]
# asm 2: str <S2S3=x7, [<pointerG=x1, #0]
str x7, [x1, #0]

# qhasm: R4R5 = vec_R4_R5_S4_S5[0/2]
# asm 1: umov >R4R5=int64#3, <vec_R4_R5_S4_S5=reg128#3.d[0]
# asm 2: umov >R4R5=x2, <vec_R4_R5_S4_S5=v2.d[0]
umov x2, v2.d[0]

# qhasm: S4S5 = vec_R4_R5_S4_S5[1/2]
# asm 1: umov >S4S5=int64#8, <vec_R4_R5_S4_S5=reg128#3.d[1]
# asm 2: umov >S4S5=x7, <vec_R4_R5_S4_S5=v2.d[1]
umov x7, v2.d[1]

# qhasm: mem64[pointerF+8] = R4R5
# asm 1: str <R4R5=int64#3, [<pointerF=int64#1, #8]
# asm 2: str <R4R5=x2, [<pointerF=x0, #8]
str x2, [x0, #8]

# qhasm: mem64[pointerG+8] = S4S5
# asm 1: str <S4S5=int64#8, [<pointerG=int64#2, #8]
# asm 2: str <S4S5=x7, [<pointerG=x1, #8]
str x7, [x1, #8]

# qhasm: R6R7 = vec_R6_R7_S6_S7[0/2]
# asm 1: umov >R6R7=int64#3, <vec_R6_R7_S6_S7=reg128#4.d[0]
# asm 2: umov >R6R7=x2, <vec_R6_R7_S6_S7=v3.d[0]
umov x2, v3.d[0]

# qhasm: S6S7 = vec_R6_R7_S6_S7[1/2]
# asm 1: umov >S6S7=int64#8, <vec_R6_R7_S6_S7=reg128#4.d[1]
# asm 2: umov >S6S7=x7, <vec_R6_R7_S6_S7=v3.d[1]
umov x7, v3.d[1]

# qhasm: mem64[pointerF+16] = R6R7
# asm 1: str <R6R7=int64#3, [<pointerF=int64#1, #16]
# asm 2: str <R6R7=x2, [<pointerF=x0, #16]
str x2, [x0, #16]

# qhasm: mem64[pointerG+16] = S6S7
# asm 1: str <S6S7=int64#8, [<pointerG=int64#2, #16]
# asm 2: str <S6S7=x7, [<pointerG=x1, #16]
str x7, [x1, #16]

# qhasm: R8R9 = vec_R8_R9_S8_S9[0/2]
# asm 1: umov >R8R9=int64#3, <vec_R8_R9_S8_S9=reg128#5.d[0]
# asm 2: umov >R8R9=x2, <vec_R8_R9_S8_S9=v4.d[0]
umov x2, v4.d[0]

# qhasm: S8S9 = vec_R8_R9_S8_S9[1/2]
# asm 1: umov >S8S9=int64#8, <vec_R8_R9_S8_S9=reg128#5.d[1]
# asm 2: umov >S8S9=x7, <vec_R8_R9_S8_S9=v4.d[1]
umov x7, v4.d[1]

# qhasm: mem64[pointerF+24] = R8R9
# asm 1: str <R8R9=int64#3, [<pointerF=int64#1, #24]
# asm 2: str <R8R9=x2, [<pointerF=x0, #24]
str x2, [x0, #24]

# qhasm: mem64[pointerG+24] = S8S9
# asm 1: str <S8S9=int64#8, [<pointerG=int64#2, #24]
# asm 2: str <S8S9=x7, [<pointerG=x1, #24]
str x7, [x1, #24]

# qhasm: R10 = vec_R10_0_S10_0[0/2]
# asm 1: umov >R10=int64#3, <vec_R10_0_S10_0=reg128#8.d[0]
# asm 2: umov >R10=x2, <vec_R10_0_S10_0=v7.d[0]
umov x2, v7.d[0]

# qhasm: mem32[pointerF+32] = R10
# asm 1: str <R10=int64#3%wregname, [<pointerF=int64#1, #32]
# asm 2: str <R10=w2, [<pointerF=x0, #32]
str w2, [x0, #32]

# qhasm: S10 = vec_R10_0_S10_0[1/2]
# asm 1: umov >S10=int64#1, <vec_R10_0_S10_0=reg128#8.d[1]
# asm 2: umov >S10=x0, <vec_R10_0_S10_0=v7.d[1]
umov x0, v7.d[1]

# qhasm: mem32[pointerG+32] = S10
# asm 1: str <S10=int64#1%wregname, [<pointerG=int64#2, #32]
# asm 2: str <S10=w0, [<pointerG=x1, #32]
str w0, [x1, #32]

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
