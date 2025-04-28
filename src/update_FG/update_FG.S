
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

# qhasm: uu, vv = mem128[pointeruuvvrrss + 0]
# asm 1: ldp >uu=int64#4, >vv=int64#5, [<pointeruuvvrrss=int64#3, #0]
# asm 2: ldp >uu=x3, >vv=x4, [<pointeruuvvrrss=x2, #0]
ldp x3, x4, [x2, #0]

# qhasm: rr, ss = mem128[pointeruuvvrrss + 16]
# asm 1: ldp >rr=int64#3, >ss=int64#6, [<pointeruuvvrrss=int64#3, #16]
# asm 2: ldp >rr=x2, >ss=x5, [<pointeruuvvrrss=x2, #16]
ldp x2, x5, [x2, #16]

# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#7, <uu=int64#4, #0, #30
# asm 2: ubfx >uu0=x6, <uu=x3, #0, #30
ubfx x6, x3, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#4, <uu=int64#4, #30, #32
# asm 2: ubfx >uu1=x3, <uu=x3, #30, #32
ubfx x3, x3, #30, #32

# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#8, <vv=int64#5, #0, #30
# asm 2: ubfx >vv0=x7, <vv=x4, #0, #30
ubfx x7, x4, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#5, <vv=int64#5, #30, #32
# asm 2: ubfx >vv1=x4, <vv=x4, #30, #32
ubfx x4, x4, #30, #32

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#9, <rr=int64#3, #0, #30
# asm 2: ubfx >rr0=x8, <rr=x2, #0, #30
ubfx x8, x2, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#3, <rr=int64#3, #30, #32
# asm 2: ubfx >rr1=x2, <rr=x2, #30, #32
ubfx x2, x2, #30, #32

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#10, <ss=int64#6, #0, #30
# asm 2: ubfx >ss0=x9, <ss=x5, #0, #30
ubfx x9, x5, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#6, <ss=int64#6, #30, #32
# asm 2: ubfx >ss1=x5, <ss=x5, #30, #32
ubfx x5, x5, #30, #32

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[0], <uu0=int64#7%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[0], <uu0=w6
ins v5.s[0], w6

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[1], <rr0=int64#9%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[1], <rr0=w8
ins v5.s[1], w8

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[2], <vv0=int64#8%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[2], <vv0=w7
ins v5.s[2], w7

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[3], <ss0=int64#10%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[3], <ss0=w9
ins v5.s[3], w9

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[0], <uu1=int64#4%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[0], <uu1=w3
ins v6.s[0], w3

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[1], <rr1=int64#3%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[1], <rr1=w2
ins v6.s[1], w2

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[2], <vv1=int64#5%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[2], <vv1=w4
ins v6.s[2], w4

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[3], <ss1=int64#6%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[3], <ss1=w5
ins v6.s[3], w5

# qhasm: reg128 vec_uuhat_rrhat_vvhat_sshat

# qhasm: reg128 vec_uuhat_rrhat

# qhasm: reg128 vec_vvhat_sshat

# qhasm: 4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31
# asm 1: sshr >vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, #31
# asm 2: sshr >vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uu1_rr1_vv1_ss1=v6.4s, #31
sshr v7.4s, v6.4s, #31

# qhasm: 4x vec_uuhat_rrhat = vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[1/4] vec_uuhat_rrhat_vvhat_sshat[1/4]
# asm 1: zip1 >vec_uuhat_rrhat=reg128#9.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s
# asm 2: zip1 >vec_uuhat_rrhat=v8.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s
zip1 v8.4s, v7.4s, v7.4s

# qhasm: 4x vec_vvhat_sshat = vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[3/4] vec_uuhat_rrhat_vvhat_sshat[3/4]
# asm 1: zip2 >vec_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s
# asm 2: zip2 >vec_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s
zip2 v7.4s, v7.4s, v7.4s

# qhasm: reg128 vec_tmp0

# qhasm: reg128 vec_MASK2p30m1

# qhasm: reg128 vec_MASK2p32m1

# qhasm: 2x vec_tmp0 = 0
# asm 1: movi >vec_tmp0=reg128#10.2d, #0
# asm 2: movi >vec_tmp0=v9.2d, #0
movi v9.2d, #0

# qhasm: 2x vec_MASK2p32m1 = 0xFFFFFFFF
# asm 1: movi >vec_MASK2p32m1=reg128#11.2d, #0xFFFFFFFF
# asm 2: movi >vec_MASK2p32m1=v10.2d, #0xFFFFFFFF
movi v10.2d, #0xFFFFFFFF

# qhasm: 2x vec_MASK2p30m1 = vec_MASK2p32m1 unsigned>> 2
# asm 1: ushr >vec_MASK2p30m1=reg128#11.2d, <vec_MASK2p32m1=reg128#11.2d, #2
# asm 2: ushr >vec_MASK2p30m1=v10.2d, <vec_MASK2p32m1=v10.2d, #2
ushr v10.2d, v10.2d, #2

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

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F0_F1_G0_G1[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F0_F1_G0_G1=v0.s[0]
umlal v9.2d, v5.2s, v0.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F0_F1_G0_G1=v0.s[2]
umlal2 v9.2d, v5.4s, v0.s[2]

# qhasm: vec_R0_0_S0_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R0_0_S0_0=reg128#12.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R0_0_S0_0=v11.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v11.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F0_F1_G0_G1[1/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F0_F1_G0_G1=v0.s[1]
umlal v9.2d, v5.2s, v0.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F0_F1_G0_G1=v0.s[3]
umlal2 v9.2d, v5.4s, v0.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F0_F1_G0_G1=v0.s[0]
umlal v9.2d, v6.2s, v0.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F0_F1_G0_G1=v0.s[2]
umlal2 v9.2d, v6.4s, v0.s[2]

# qhasm: vec_R1_0_S1_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R1_0_S1_0=reg128#13.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R1_0_S1_0=v12.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v12.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F2_F3_G2_G3=v1.s[0]
umlal v9.2d, v5.2s, v1.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F2_F3_G2_G3=v1.s[2]
umlal2 v9.2d, v5.4s, v1.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[1/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F0_F1_G0_G1=v0.s[1]
umlal v9.2d, v6.2s, v0.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F0_F1_G0_G1=v0.s[3]
umlal2 v9.2d, v6.4s, v0.s[3]

# qhasm: vec_R2_0_S2_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R2_0_S2_0=reg128#14.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R2_0_S2_0=v13.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v13.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[1/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F2_F3_G2_G3=v1.s[1]
umlal v9.2d, v5.2s, v1.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F2_F3_G2_G3=v1.s[3]
umlal2 v9.2d, v5.4s, v1.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F2_F3_G2_G3=v1.s[0]
umlal v9.2d, v6.2s, v1.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F2_F3_G2_G3=v1.s[2]
umlal2 v9.2d, v6.4s, v1.s[2]

# qhasm: vec_R3_0_S3_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R3_0_S3_0=reg128#15.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R3_0_S3_0=v14.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v14.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F4_F5_G4_G5=v2.s[0]
umlal v9.2d, v5.2s, v2.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F4_F5_G4_G5=v2.s[2]
umlal2 v9.2d, v5.4s, v2.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[1/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F2_F3_G2_G3=v1.s[1]
umlal v9.2d, v6.2s, v1.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F2_F3_G2_G3=v1.s[3]
umlal2 v9.2d, v6.4s, v1.s[3]

# qhasm: vec_R4_0_S4_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R4_0_S4_0=reg128#16.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R4_0_S4_0=v15.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v15.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[1/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F4_F5_G4_G5=v2.s[1]
umlal v9.2d, v5.2s, v2.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F4_F5_G4_G5=v2.s[3]
umlal2 v9.2d, v5.4s, v2.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F4_F5_G4_G5=v2.s[0]
umlal v9.2d, v6.2s, v2.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F4_F5_G4_G5=v2.s[2]
umlal2 v9.2d, v6.4s, v2.s[2]

# qhasm: vec_R5_0_S5_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R5_0_S5_0=reg128#17.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R5_0_S5_0=v16.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v16.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F6_F7_G6_G7=v3.s[0]
umlal v9.2d, v5.2s, v3.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F6_F7_G6_G7=v3.s[2]
umlal2 v9.2d, v5.4s, v3.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[1/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F4_F5_G4_G5=v2.s[1]
umlal v9.2d, v6.2s, v2.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F4_F5_G4_G5=v2.s[3]
umlal2 v9.2d, v6.4s, v2.s[3]

# qhasm: vec_R6_0_S6_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R6_0_S6_0=reg128#18.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R6_0_S6_0=v17.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v17.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[1/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F6_F7_G6_G7=v3.s[1]
umlal v9.2d, v5.2s, v3.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F6_F7_G6_G7=v3.s[3]
umlal2 v9.2d, v5.4s, v3.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F6_F7_G6_G7=v3.s[0]
umlal v9.2d, v6.2s, v3.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F6_F7_G6_G7=v3.s[2]
umlal2 v9.2d, v6.4s, v3.s[2]

# qhasm: vec_R7_0_S7_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R7_0_S7_0=reg128#19.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R7_0_S7_0=v18.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v18.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F8_0_G8_0[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F8_0_G8_0=reg128#5.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F8_0_G8_0=v4.s[0]
umlal v9.2d, v5.2s, v4.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F8_0_G8_0[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F8_0_G8_0=reg128#5.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F8_0_G8_0=v4.s[2]
umlal2 v9.2d, v5.4s, v4.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[1/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F6_F7_G6_G7=v3.s[1]
umlal v9.2d, v6.2s, v3.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F6_F7_G6_G7=v3.s[3]
umlal2 v9.2d, v6.4s, v3.s[3]

# qhasm: vec_R8_0_S8_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R8_0_S8_0=reg128#20.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R8_0_S8_0=v19.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v19.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F8_0_G8_0[0/4]
# asm 1: umlal <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F8_0_G8_0=reg128#5.s[0]
# asm 2: umlal <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F8_0_G8_0=v4.s[0]
umlal v9.2d, v6.2s, v4.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F8_0_G8_0[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F8_0_G8_0=reg128#5.s[2]
# asm 2: umlal2 <vec_tmp0=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F8_0_G8_0=v4.s[2]
umlal2 v9.2d, v6.4s, v4.s[2]

# qhasm: vec_R9_0_S9_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R9_0_S9_0=reg128#11.16b, <vec_tmp0=reg128#10.16b, <vec_MASK2p30m1=reg128#11.16b
# asm 2: and >vec_R9_0_S9_0=v10.16b, <vec_tmp0=v9.16b, <vec_MASK2p30m1=v10.16b
and v10.16b, v9.16b, v10.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#10.2d, <vec_tmp0=reg128#10.2d, #30
# asm 2: ushr >vec_tmp0=v9.2d, <vec_tmp0=v9.2d, #30
ushr v9.2d, v9.2d, #30

# qhasm: vec_R10_0_S10_0 = vec_tmp0 
# asm 1: mov >vec_R10_0_S10_0=reg128#10.16b, <vec_tmp0=reg128#10.16b
# asm 2: mov >vec_R10_0_S10_0=v9.16b, <vec_tmp0=v9.16b
mov v9.16b, v9.16b

# qhasm: reg128 vec_R0_R1_S0_S1

# qhasm: 2x vec_R1_0_S1_0 <<= 32
# asm 1: shl >vec_R1_0_S1_0=reg128#13.2d, <vec_R1_0_S1_0=reg128#13.2d, #32
# asm 2: shl >vec_R1_0_S1_0=v12.2d, <vec_R1_0_S1_0=v12.2d, #32
shl v12.2d, v12.2d, #32

# qhasm: vec_R0_R1_S0_S1 = vec_R0_0_S0_0 | vec_R1_0_S1_0
# asm 1: orr >vec_R0_R1_S0_S1=reg128#21.16b, <vec_R0_0_S0_0=reg128#12.16b, <vec_R1_0_S1_0=reg128#13.16b
# asm 2: orr >vec_R0_R1_S0_S1=v20.16b, <vec_R0_0_S0_0=v11.16b, <vec_R1_0_S1_0=v12.16b
orr v20.16b, v11.16b, v12.16b

# qhasm: reg128 vec_R2_R3_S2_S3

# qhasm: 2x vec_R3_0_S3_0 <<= 32
# asm 1: shl >vec_R3_0_S3_0=reg128#12.2d, <vec_R3_0_S3_0=reg128#15.2d, #32
# asm 2: shl >vec_R3_0_S3_0=v11.2d, <vec_R3_0_S3_0=v14.2d, #32
shl v11.2d, v14.2d, #32

# qhasm: vec_R2_R3_S2_S3 = vec_R2_0_S2_0 | vec_R3_0_S3_0
# asm 1: orr >vec_R2_R3_S2_S3=reg128#12.16b, <vec_R2_0_S2_0=reg128#14.16b, <vec_R3_0_S3_0=reg128#12.16b
# asm 2: orr >vec_R2_R3_S2_S3=v11.16b, <vec_R2_0_S2_0=v13.16b, <vec_R3_0_S3_0=v11.16b
orr v11.16b, v13.16b, v11.16b

# qhasm: reg128 vec_R4_R5_S4_S5

# qhasm: 2x vec_R5_0_S5_0 <<= 32
# asm 1: shl >vec_R5_0_S5_0=reg128#13.2d, <vec_R5_0_S5_0=reg128#17.2d, #32
# asm 2: shl >vec_R5_0_S5_0=v12.2d, <vec_R5_0_S5_0=v16.2d, #32
shl v12.2d, v16.2d, #32

# qhasm: vec_R4_R5_S4_S5 = vec_R4_0_S4_0 | vec_R5_0_S5_0
# asm 1: orr >vec_R4_R5_S4_S5=reg128#13.16b, <vec_R4_0_S4_0=reg128#16.16b, <vec_R5_0_S5_0=reg128#13.16b
# asm 2: orr >vec_R4_R5_S4_S5=v12.16b, <vec_R4_0_S4_0=v15.16b, <vec_R5_0_S5_0=v12.16b
orr v12.16b, v15.16b, v12.16b

# qhasm: reg128 vec_R6_R7_S6_S7

# qhasm: 2x vec_R7_0_S7_0 <<= 32
# asm 1: shl >vec_R7_0_S7_0=reg128#14.2d, <vec_R7_0_S7_0=reg128#19.2d, #32
# asm 2: shl >vec_R7_0_S7_0=v13.2d, <vec_R7_0_S7_0=v18.2d, #32
shl v13.2d, v18.2d, #32

# qhasm: vec_R6_R7_S6_S7 = vec_R6_0_S6_0 | vec_R7_0_S7_0
# asm 1: orr >vec_R6_R7_S6_S7=reg128#14.16b, <vec_R6_0_S6_0=reg128#18.16b, <vec_R7_0_S7_0=reg128#14.16b
# asm 2: orr >vec_R6_R7_S6_S7=v13.16b, <vec_R6_0_S6_0=v17.16b, <vec_R7_0_S7_0=v13.16b
orr v13.16b, v17.16b, v13.16b

# qhasm: reg128 vec_R8_R9_S8_S9

# qhasm: 2x vec_R9_0_S9_0 <<= 32
# asm 1: shl >vec_R9_0_S9_0=reg128#11.2d, <vec_R9_0_S9_0=reg128#11.2d, #32
# asm 2: shl >vec_R9_0_S9_0=v10.2d, <vec_R9_0_S9_0=v10.2d, #32
shl v10.2d, v10.2d, #32

# qhasm: vec_R8_R9_S8_S9 = vec_R8_0_S8_0 | vec_R9_0_S9_0
# asm 1: orr >vec_R8_R9_S8_S9=reg128#11.16b, <vec_R8_0_S8_0=reg128#20.16b, <vec_R9_0_S9_0=reg128#11.16b
# asm 2: orr >vec_R8_R9_S8_S9=v10.16b, <vec_R8_0_S8_0=v19.16b, <vec_R9_0_S9_0=v10.16b
orr v10.16b, v19.16b, v10.16b

# qhasm: int64 carry1

# qhasm: carry1 = 3221225472
# asm 1: mov >carry1=int64#3, #3221225472
# asm 2: mov >carry1=x2, #3221225472
mov x2, #3221225472

# qhasm: reg128 vec_MASKcarry1

# qhasm: 2x vec_MASKcarry1 = carry1
# asm 1: dup <vec_MASKcarry1=reg128#15.2d, <carry1=int64#3
# asm 2: dup <vec_MASKcarry1=v14.2d, <carry1=x2
dup v14.2d, x2

# qhasm: reg128 vec_MASKcarry2

# qhasm: 2x vec_MASKcarry2 = vec_MASKcarry1 << 32
# asm 1: shl >vec_MASKcarry2=reg128#16.2d, <vec_MASKcarry1=reg128#15.2d, #32
# asm 2: shl >vec_MASKcarry2=v15.2d, <vec_MASKcarry1=v14.2d, #32
shl v15.2d, v14.2d, #32

# qhasm: reg128 vec_MASKcarry

# qhasm: vec_MASKcarry = vec_MASKcarry1 | vec_MASKcarry2
# asm 1: orr >vec_MASKcarry=reg128#17.16b, <vec_MASKcarry1=reg128#15.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: orr >vec_MASKcarry=v16.16b, <vec_MASKcarry1=v14.16b, <vec_MASKcarry2=v15.16b
orr v16.16b, v14.16b, v15.16b

# qhasm: reg128 vec_MASKeffect

# qhasm: vec_MASKeffect = ~vec_MASKcarry
# asm 1: not >vec_MASKeffect=reg128#18.16b, <vec_MASKcarry=reg128#17.16b
# asm 2: not >vec_MASKeffect=v17.16b, <vec_MASKcarry=v16.16b
not v17.16b, v16.16b

# qhasm: int64 ONE

# qhasm: ONE = 1
# asm 1: mov >ONE=int64#3, #1
# asm 2: mov >ONE=x2, #1
mov x2, #1

# qhasm: reg128 vec_ONE

# qhasm: 2x vec_ONE = ONE
# asm 1: dup <vec_ONE=reg128#19.2d, <ONE=int64#3
# asm 2: dup <vec_ONE=v18.2d, <ONE=x2
dup v18.2d, x2

# qhasm: reg128 vec_MASKhalfeffect

# qhasm: int64 2p32m1

# qhasm: 2p32m1 = 4294967295
# asm 1: mov >2p32m1=int64#3, #4294967295
# asm 2: mov >2p32m1=x2, #4294967295
mov x2, #4294967295

# qhasm: 2x vec_MASKhalfeffect = 2p32m1
# asm 1: dup <vec_MASKhalfeffect=reg128#20.2d, <2p32m1=int64#3
# asm 2: dup <vec_MASKhalfeffect=v19.2d, <2p32m1=x2
dup v19.2d, x2

# qhasm: reg128 vec_tmp1

# qhasm: reg128 vec_tmp2

# qhasm: reg128 vec_tmp3

# qhasm: reg128 vec_tmp4

# qhasm: reg128 vec_tmp5

# qhasm: reg128 vec_carry1

# qhasm: reg128 vec_carry2

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
# asm 1: and >vec_carry1=reg128#27.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v26.16b, <vec_tmp1=v21.16b, <vec_MASKcarry1=v14.16b
and v26.16b, v21.16b, v14.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_MASKcarry1=v14.16b
bic v21.16b, v21.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#27.2d, <vec_carry1=reg128#27.2d, #2
# asm 2: shl >vec_carry1=v26.2d, <vec_carry1=v26.2d, #2
shl v26.2d, v26.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_carry1=reg128#27.16b
# asm 2: orr <vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_carry1=v26.16b
orr v21.16b, v21.16b, v26.16b

# qhasm: vec_carry2 = vec_tmp1 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#27.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v26.16b, <vec_tmp1=v21.16b, <vec_MASKcarry2=v15.16b
and v26.16b, v21.16b, v15.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_MASKcarry2=v15.16b
bic v21.16b, v21.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#27.2d, <vec_carry2=reg128#27.2d, #62
# asm 2: ushr >vec_carry2=v26.2d, <vec_carry2=v26.2d, #62
ushr v26.2d, v26.2d, #62

# qhasm: vec_tmp2 |= vec_carry2
# asm 1: orr <vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_carry2=reg128#27.16b
# asm 2: orr <vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_carry2=v26.16b
orr v22.16b, v22.16b, v26.16b

# qhasm: vec_carry1 = vec_tmp2 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#27.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v26.16b, <vec_tmp2=v22.16b, <vec_MASKcarry1=v14.16b
and v26.16b, v22.16b, v14.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_MASKcarry1=v14.16b
bic v22.16b, v22.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#27.2d, <vec_carry1=reg128#27.2d, #2
# asm 2: shl >vec_carry1=v26.2d, <vec_carry1=v26.2d, #2
shl v26.2d, v26.2d, #2

# qhasm: vec_tmp2 |= vec_carry1
# asm 1: orr <vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_carry1=reg128#27.16b
# asm 2: orr <vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_carry1=v26.16b
orr v22.16b, v22.16b, v26.16b

# qhasm: vec_carry2 = vec_tmp2 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#27.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v26.16b, <vec_tmp2=v22.16b, <vec_MASKcarry2=v15.16b
and v26.16b, v22.16b, v15.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_MASKcarry2=v15.16b
bic v22.16b, v22.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#27.2d, <vec_carry2=reg128#27.2d, #62
# asm 2: ushr >vec_carry2=v26.2d, <vec_carry2=v26.2d, #62
ushr v26.2d, v26.2d, #62

# qhasm: vec_tmp3 |= vec_carry2
# asm 1: orr <vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_carry2=reg128#27.16b
# asm 2: orr <vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_carry2=v26.16b
orr v23.16b, v23.16b, v26.16b

# qhasm: vec_carry1 = vec_tmp3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#27.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v26.16b, <vec_tmp3=v23.16b, <vec_MASKcarry1=v14.16b
and v26.16b, v23.16b, v14.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_MASKcarry1=v14.16b
bic v23.16b, v23.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#27.2d, <vec_carry1=reg128#27.2d, #2
# asm 2: shl >vec_carry1=v26.2d, <vec_carry1=v26.2d, #2
shl v26.2d, v26.2d, #2

# qhasm: vec_tmp3 |= vec_carry1
# asm 1: orr <vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_carry1=reg128#27.16b
# asm 2: orr <vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_carry1=v26.16b
orr v23.16b, v23.16b, v26.16b

# qhasm: vec_carry2 = vec_tmp3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#27.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v26.16b, <vec_tmp3=v23.16b, <vec_MASKcarry2=v15.16b
and v26.16b, v23.16b, v15.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_MASKcarry2=v15.16b
bic v23.16b, v23.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#27.2d, <vec_carry2=reg128#27.2d, #62
# asm 2: ushr >vec_carry2=v26.2d, <vec_carry2=v26.2d, #62
ushr v26.2d, v26.2d, #62

# qhasm: vec_tmp4 |= vec_carry2
# asm 1: orr <vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_carry2=reg128#27.16b
# asm 2: orr <vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_carry2=v26.16b
orr v24.16b, v24.16b, v26.16b

# qhasm: vec_carry1 = vec_tmp4 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#27.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v26.16b, <vec_tmp4=v24.16b, <vec_MASKcarry1=v14.16b
and v26.16b, v24.16b, v14.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_MASKcarry1=v14.16b
bic v24.16b, v24.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#27.2d, <vec_carry1=reg128#27.2d, #2
# asm 2: shl >vec_carry1=v26.2d, <vec_carry1=v26.2d, #2
shl v26.2d, v26.2d, #2

# qhasm: vec_tmp4 |= vec_carry1
# asm 1: orr <vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_carry1=reg128#27.16b
# asm 2: orr <vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_carry1=v26.16b
orr v24.16b, v24.16b, v26.16b

# qhasm: vec_carry2 = vec_tmp4 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#27.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v26.16b, <vec_tmp4=v24.16b, <vec_MASKcarry2=v15.16b
and v26.16b, v24.16b, v15.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_MASKcarry2=v15.16b
bic v24.16b, v24.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#27.2d, <vec_carry2=reg128#27.2d, #62
# asm 2: ushr >vec_carry2=v26.2d, <vec_carry2=v26.2d, #62
ushr v26.2d, v26.2d, #62

# qhasm: vec_tmp5 |= vec_carry2
# asm 1: orr <vec_tmp5=reg128#26.16b, <vec_tmp5=reg128#26.16b, <vec_carry2=reg128#27.16b
# asm 2: orr <vec_tmp5=v25.16b, <vec_tmp5=v25.16b, <vec_carry2=v26.16b
orr v25.16b, v25.16b, v26.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry
# asm 1: eor <vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_MASKcarry=reg128#17.16b
# asm 2: eor <vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_MASKcarry=v16.16b
eor v21.16b, v21.16b, v16.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b
# asm 2: not >vec_tmp1=v21.16b, <vec_tmp1=v21.16b
not v21.16b, v21.16b

# qhasm: vec_tmp2 ^= vec_MASKcarry
# asm 1: eor <vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_MASKcarry=reg128#17.16b
# asm 2: eor <vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_MASKcarry=v16.16b
eor v22.16b, v22.16b, v16.16b

# qhasm: vec_tmp2 = ~vec_tmp2
# asm 1: not >vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b
# asm 2: not >vec_tmp2=v22.16b, <vec_tmp2=v22.16b
not v22.16b, v22.16b

# qhasm: vec_tmp3 ^= vec_MASKcarry
# asm 1: eor <vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_MASKcarry=reg128#17.16b
# asm 2: eor <vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_MASKcarry=v16.16b
eor v23.16b, v23.16b, v16.16b

# qhasm: vec_tmp3 = ~vec_tmp3
# asm 1: not >vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b
# asm 2: not >vec_tmp3=v23.16b, <vec_tmp3=v23.16b
not v23.16b, v23.16b

# qhasm: vec_tmp4 ^= vec_MASKcarry
# asm 1: eor <vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_MASKcarry=reg128#17.16b
# asm 2: eor <vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_MASKcarry=v16.16b
eor v24.16b, v24.16b, v16.16b

# qhasm: vec_tmp4 = ~vec_tmp4
# asm 1: not >vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b
# asm 2: not >vec_tmp4=v24.16b, <vec_tmp4=v24.16b
not v24.16b, v24.16b

# qhasm: vec_tmp5 ^= vec_MASKhalfeffect
# asm 1: eor <vec_tmp5=reg128#26.16b, <vec_tmp5=reg128#26.16b, <vec_MASKhalfeffect=reg128#20.16b
# asm 2: eor <vec_tmp5=v25.16b, <vec_tmp5=v25.16b, <vec_MASKhalfeffect=v19.16b
eor v25.16b, v25.16b, v19.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#22.2d, <vec_tmp1=reg128#22.2d, <vec_ONE=reg128#19.2d
# asm 2: add <vec_tmp1=v21.2d, <vec_tmp1=v21.2d, <vec_ONE=v18.2d
add v21.2d, v21.2d, v18.2d

# qhasm: vec_tmp1 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp1=reg128#22.16b, <vec_tmp1=reg128#22.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp1=v21.16b, <vec_tmp1=v21.16b, <vec_uuhat_rrhat=v8.16b
and v21.16b, v21.16b, v8.16b

# qhasm: vec_tmp2 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp2=reg128#23.16b, <vec_tmp2=reg128#23.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp2=v22.16b, <vec_tmp2=v22.16b, <vec_uuhat_rrhat=v8.16b
and v22.16b, v22.16b, v8.16b

# qhasm: vec_tmp3 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp3=reg128#24.16b, <vec_tmp3=reg128#24.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp3=v23.16b, <vec_tmp3=v23.16b, <vec_uuhat_rrhat=v8.16b
and v23.16b, v23.16b, v8.16b

# qhasm: vec_tmp4 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp4=reg128#25.16b, <vec_tmp4=reg128#25.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp4=v24.16b, <vec_tmp4=v24.16b, <vec_uuhat_rrhat=v8.16b
and v24.16b, v24.16b, v8.16b

# qhasm: vec_tmp5 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp5=reg128#26.16b, <vec_tmp5=reg128#26.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp5=v25.16b, <vec_tmp5=v25.16b, <vec_uuhat_rrhat=v8.16b
and v25.16b, v25.16b, v8.16b

# qhasm: 2x vec_R2_R3_S2_S3 += vec_tmp1
# asm 1: add <vec_R2_R3_S2_S3=reg128#12.2d, <vec_R2_R3_S2_S3=reg128#12.2d, <vec_tmp1=reg128#22.2d
# asm 2: add <vec_R2_R3_S2_S3=v11.2d, <vec_R2_R3_S2_S3=v11.2d, <vec_tmp1=v21.2d
add v11.2d, v11.2d, v21.2d

# qhasm: 2x vec_R4_R5_S4_S5 += vec_tmp2
# asm 1: add <vec_R4_R5_S4_S5=reg128#13.2d, <vec_R4_R5_S4_S5=reg128#13.2d, <vec_tmp2=reg128#23.2d
# asm 2: add <vec_R4_R5_S4_S5=v12.2d, <vec_R4_R5_S4_S5=v12.2d, <vec_tmp2=v22.2d
add v12.2d, v12.2d, v22.2d

# qhasm: 2x vec_R6_R7_S6_S7 += vec_tmp3
# asm 1: add <vec_R6_R7_S6_S7=reg128#14.2d, <vec_R6_R7_S6_S7=reg128#14.2d, <vec_tmp3=reg128#24.2d
# asm 2: add <vec_R6_R7_S6_S7=v13.2d, <vec_R6_R7_S6_S7=v13.2d, <vec_tmp3=v23.2d
add v13.2d, v13.2d, v23.2d

# qhasm: 2x vec_R8_R9_S8_S9 += vec_tmp4
# asm 1: add <vec_R8_R9_S8_S9=reg128#11.2d, <vec_R8_R9_S8_S9=reg128#11.2d, <vec_tmp4=reg128#25.2d
# asm 2: add <vec_R8_R9_S8_S9=v10.2d, <vec_R8_R9_S8_S9=v10.2d, <vec_tmp4=v24.2d
add v10.2d, v10.2d, v24.2d

# qhasm: 2x vec_R10_0_S10_0 += vec_tmp5
# asm 1: add <vec_R10_0_S10_0=reg128#10.2d, <vec_R10_0_S10_0=reg128#10.2d, <vec_tmp5=reg128#26.2d
# asm 2: add <vec_R10_0_S10_0=v9.2d, <vec_R10_0_S10_0=v9.2d, <vec_tmp5=v25.2d
add v9.2d, v9.2d, v25.2d

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
# asm 1: shl >vec_tmp5=reg128#9.2d, <vec_tmp5=reg128#26.2d, #2
# asm 2: shl >vec_tmp5=v8.2d, <vec_tmp5=v25.2d, #2
shl v8.2d, v25.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#22.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v21.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v14.16b
and v21.16b, v0.16b, v14.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v14.16b
bic v0.16b, v0.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#22.2d, <vec_carry1=reg128#22.2d, #2
# asm 2: shl >vec_carry1=v21.2d, <vec_carry1=v21.2d, #2
shl v21.2d, v21.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_carry1=reg128#22.16b
# asm 2: orr <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_carry1=v21.16b
orr v0.16b, v0.16b, v21.16b

# qhasm: vec_carry2 = vec_tmp1 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#22.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v21.16b, <vec_tmp1=v0.16b, <vec_MASKcarry2=v15.16b
and v21.16b, v0.16b, v15.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry2=v15.16b
bic v0.16b, v0.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#22.2d, <vec_carry2=reg128#22.2d, #62
# asm 2: ushr >vec_carry2=v21.2d, <vec_carry2=v21.2d, #62
ushr v21.2d, v21.2d, #62

# qhasm: vec_tmp2 |= vec_carry2
# asm 1: orr <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_carry2=reg128#22.16b
# asm 2: orr <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_carry2=v21.16b
orr v1.16b, v1.16b, v21.16b

# qhasm: vec_carry1 = vec_tmp2 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#22.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v21.16b, <vec_tmp2=v1.16b, <vec_MASKcarry1=v14.16b
and v21.16b, v1.16b, v14.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_MASKcarry1=v14.16b
bic v1.16b, v1.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#22.2d, <vec_carry1=reg128#22.2d, #2
# asm 2: shl >vec_carry1=v21.2d, <vec_carry1=v21.2d, #2
shl v21.2d, v21.2d, #2

# qhasm: vec_tmp2 |= vec_carry1
# asm 1: orr <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_carry1=reg128#22.16b
# asm 2: orr <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_carry1=v21.16b
orr v1.16b, v1.16b, v21.16b

# qhasm: vec_carry2 = vec_tmp2 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#22.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v21.16b, <vec_tmp2=v1.16b, <vec_MASKcarry2=v15.16b
and v21.16b, v1.16b, v15.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_MASKcarry2=v15.16b
bic v1.16b, v1.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#22.2d, <vec_carry2=reg128#22.2d, #62
# asm 2: ushr >vec_carry2=v21.2d, <vec_carry2=v21.2d, #62
ushr v21.2d, v21.2d, #62

# qhasm: vec_tmp3 |= vec_carry2
# asm 1: orr <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_carry2=reg128#22.16b
# asm 2: orr <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_carry2=v21.16b
orr v2.16b, v2.16b, v21.16b

# qhasm: vec_carry1 = vec_tmp3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#22.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v21.16b, <vec_tmp3=v2.16b, <vec_MASKcarry1=v14.16b
and v21.16b, v2.16b, v14.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_MASKcarry1=v14.16b
bic v2.16b, v2.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#22.2d, <vec_carry1=reg128#22.2d, #2
# asm 2: shl >vec_carry1=v21.2d, <vec_carry1=v21.2d, #2
shl v21.2d, v21.2d, #2

# qhasm: vec_tmp3 |= vec_carry1
# asm 1: orr <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_carry1=reg128#22.16b
# asm 2: orr <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_carry1=v21.16b
orr v2.16b, v2.16b, v21.16b

# qhasm: vec_carry2 = vec_tmp3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#22.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v21.16b, <vec_tmp3=v2.16b, <vec_MASKcarry2=v15.16b
and v21.16b, v2.16b, v15.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_MASKcarry2=v15.16b
bic v2.16b, v2.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#22.2d, <vec_carry2=reg128#22.2d, #62
# asm 2: ushr >vec_carry2=v21.2d, <vec_carry2=v21.2d, #62
ushr v21.2d, v21.2d, #62

# qhasm: vec_tmp4 |= vec_carry2
# asm 1: orr <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_carry2=reg128#22.16b
# asm 2: orr <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_carry2=v21.16b
orr v3.16b, v3.16b, v21.16b

# qhasm: vec_carry1 = vec_tmp4 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#22.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v21.16b, <vec_tmp4=v3.16b, <vec_MASKcarry1=v14.16b
and v21.16b, v3.16b, v14.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_MASKcarry1=v14.16b
bic v3.16b, v3.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#22.2d, <vec_carry1=reg128#22.2d, #2
# asm 2: shl >vec_carry1=v21.2d, <vec_carry1=v21.2d, #2
shl v21.2d, v21.2d, #2

# qhasm: vec_tmp4 |= vec_carry1
# asm 1: orr <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_carry1=reg128#22.16b
# asm 2: orr <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_carry1=v21.16b
orr v3.16b, v3.16b, v21.16b

# qhasm: vec_carry2 = vec_tmp4 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#22.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v21.16b, <vec_tmp4=v3.16b, <vec_MASKcarry2=v15.16b
and v21.16b, v3.16b, v15.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_MASKcarry2=v15.16b
bic v3.16b, v3.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#22.2d, <vec_carry2=reg128#22.2d, #62
# asm 2: ushr >vec_carry2=v21.2d, <vec_carry2=v21.2d, #62
ushr v21.2d, v21.2d, #62

# qhasm: vec_tmp5 |= vec_carry2
# asm 1: orr <vec_tmp5=reg128#9.16b, <vec_tmp5=reg128#9.16b, <vec_carry2=reg128#22.16b
# asm 2: orr <vec_tmp5=v8.16b, <vec_tmp5=v8.16b, <vec_carry2=v21.16b
orr v8.16b, v8.16b, v21.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry
# asm 1: eor <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry=reg128#17.16b
# asm 2: eor <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry=v16.16b
eor v0.16b, v0.16b, v16.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b
# asm 2: not >vec_tmp1=v0.16b, <vec_tmp1=v0.16b
not v0.16b, v0.16b

# qhasm: vec_tmp2 ^= vec_MASKcarry
# asm 1: eor <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry=reg128#17.16b
# asm 2: eor <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_MASKcarry=v16.16b
eor v1.16b, v1.16b, v16.16b

# qhasm: vec_tmp2 = ~vec_tmp2
# asm 1: not >vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b
# asm 2: not >vec_tmp2=v1.16b, <vec_tmp2=v1.16b
not v1.16b, v1.16b

# qhasm: vec_tmp3 ^= vec_MASKcarry
# asm 1: eor <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry=reg128#17.16b
# asm 2: eor <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_MASKcarry=v16.16b
eor v2.16b, v2.16b, v16.16b

# qhasm: vec_tmp3 = ~vec_tmp3
# asm 1: not >vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b
# asm 2: not >vec_tmp3=v2.16b, <vec_tmp3=v2.16b
not v2.16b, v2.16b

# qhasm: vec_tmp4 ^= vec_MASKcarry
# asm 1: eor <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry=reg128#17.16b
# asm 2: eor <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_MASKcarry=v16.16b
eor v3.16b, v3.16b, v16.16b

# qhasm: vec_tmp4 = ~vec_tmp4
# asm 1: not >vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b
# asm 2: not >vec_tmp4=v3.16b, <vec_tmp4=v3.16b
not v3.16b, v3.16b

# qhasm: vec_tmp5 ^= vec_MASKhalfeffect
# asm 1: eor <vec_tmp5=reg128#9.16b, <vec_tmp5=reg128#9.16b, <vec_MASKhalfeffect=reg128#20.16b
# asm 2: eor <vec_tmp5=v8.16b, <vec_tmp5=v8.16b, <vec_MASKhalfeffect=v19.16b
eor v8.16b, v8.16b, v19.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#1.2d, <vec_ONE=reg128#19.2d
# asm 2: add <vec_tmp1=v0.2d, <vec_tmp1=v0.2d, <vec_ONE=v18.2d
add v0.2d, v0.2d, v18.2d

# qhasm: vec_tmp1 &= vec_vvhat_sshat
# asm 1: and <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_vvhat_sshat=v7.16b
and v0.16b, v0.16b, v7.16b

# qhasm: vec_tmp2 &= vec_vvhat_sshat
# asm 1: and <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_vvhat_sshat=v7.16b
and v1.16b, v1.16b, v7.16b

# qhasm: vec_tmp3 &= vec_vvhat_sshat
# asm 1: and <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_vvhat_sshat=v7.16b
and v2.16b, v2.16b, v7.16b

# qhasm: vec_tmp4 &= vec_vvhat_sshat
# asm 1: and <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_vvhat_sshat=v7.16b
and v3.16b, v3.16b, v7.16b

# qhasm: vec_tmp5 &= vec_vvhat_sshat
# asm 1: and <vec_tmp5=reg128#9.16b, <vec_tmp5=reg128#9.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_tmp5=v8.16b, <vec_tmp5=v8.16b, <vec_vvhat_sshat=v7.16b
and v8.16b, v8.16b, v7.16b

# qhasm: reg128 vec_F8_F9_G8_G9

# qhasm: reg128 vec_F10_0_G10_0

# qhasm: 2x vec_F2_F3_G2_G3 = vec_R2_R3_S2_S3 + vec_tmp1
# asm 1: add >vec_F2_F3_G2_G3=reg128#1.2d, <vec_R2_R3_S2_S3=reg128#12.2d, <vec_tmp1=reg128#1.2d
# asm 2: add >vec_F2_F3_G2_G3=v0.2d, <vec_R2_R3_S2_S3=v11.2d, <vec_tmp1=v0.2d
add v0.2d, v11.2d, v0.2d

# qhasm: 2x vec_F4_F5_G4_G5 = vec_R4_R5_S4_S5 + vec_tmp2
# asm 1: add >vec_F4_F5_G4_G5=reg128#2.2d, <vec_R4_R5_S4_S5=reg128#13.2d, <vec_tmp2=reg128#2.2d
# asm 2: add >vec_F4_F5_G4_G5=v1.2d, <vec_R4_R5_S4_S5=v12.2d, <vec_tmp2=v1.2d
add v1.2d, v12.2d, v1.2d

# qhasm: 2x vec_F6_F7_G6_G7 = vec_R6_R7_S6_S7 + vec_tmp3
# asm 1: add >vec_F6_F7_G6_G7=reg128#3.2d, <vec_R6_R7_S6_S7=reg128#14.2d, <vec_tmp3=reg128#3.2d
# asm 2: add >vec_F6_F7_G6_G7=v2.2d, <vec_R6_R7_S6_S7=v13.2d, <vec_tmp3=v2.2d
add v2.2d, v13.2d, v2.2d

# qhasm: 2x vec_F8_F9_G8_G9 = vec_R8_R9_S8_S9 + vec_tmp4
# asm 1: add >vec_F8_F9_G8_G9=reg128#4.2d, <vec_R8_R9_S8_S9=reg128#11.2d, <vec_tmp4=reg128#4.2d
# asm 2: add >vec_F8_F9_G8_G9=v3.2d, <vec_R8_R9_S8_S9=v10.2d, <vec_tmp4=v3.2d
add v3.2d, v10.2d, v3.2d

# qhasm: 2x vec_F10_0_G10_0 = vec_R10_0_S10_0 + vec_tmp5
# asm 1: add >vec_F10_0_G10_0=reg128#8.2d, <vec_R10_0_S10_0=reg128#10.2d, <vec_tmp5=reg128#9.2d
# asm 2: add >vec_F10_0_G10_0=v7.2d, <vec_R10_0_S10_0=v9.2d, <vec_tmp5=v8.2d
add v7.2d, v9.2d, v8.2d

# qhasm: vec_carry1 = vec_F2_F3_G2_G3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#9.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v8.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_MASKcarry1=v14.16b
and v8.16b, v0.16b, v14.16b

# qhasm: vec_F2_F3_G2_G3 = vec_F2_F3_G2_G3 & ~vec_MASKcarry1
# asm 1: bic >vec_F2_F3_G2_G3=reg128#1.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_F2_F3_G2_G3=v0.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_MASKcarry1=v14.16b
bic v0.16b, v0.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#9.2d, <vec_carry1=reg128#9.2d, #2
# asm 2: shl >vec_carry1=v8.2d, <vec_carry1=v8.2d, #2
shl v8.2d, v8.2d, #2

# qhasm: 2x vec_F2_F3_G2_G3 += vec_carry1
# asm 1: add <vec_F2_F3_G2_G3=reg128#1.2d, <vec_F2_F3_G2_G3=reg128#1.2d, <vec_carry1=reg128#9.2d
# asm 2: add <vec_F2_F3_G2_G3=v0.2d, <vec_F2_F3_G2_G3=v0.2d, <vec_carry1=v8.2d
add v0.2d, v0.2d, v8.2d

# qhasm: vec_carry2 = vec_F2_F3_G2_G3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#9.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v8.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_MASKcarry2=v15.16b
and v8.16b, v0.16b, v15.16b

# qhasm: vec_F2_F3_G2_G3 = vec_F2_F3_G2_G3 & ~vec_MASKcarry2
# asm 1: bic >vec_F2_F3_G2_G3=reg128#1.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_F2_F3_G2_G3=v0.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_MASKcarry2=v15.16b
bic v0.16b, v0.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#9.2d, <vec_carry2=reg128#9.2d, #62
# asm 2: ushr >vec_carry2=v8.2d, <vec_carry2=v8.2d, #62
ushr v8.2d, v8.2d, #62

# qhasm: 2x vec_F4_F5_G4_G5 += vec_carry2
# asm 1: add <vec_F4_F5_G4_G5=reg128#2.2d, <vec_F4_F5_G4_G5=reg128#2.2d, <vec_carry2=reg128#9.2d
# asm 2: add <vec_F4_F5_G4_G5=v1.2d, <vec_F4_F5_G4_G5=v1.2d, <vec_carry2=v8.2d
add v1.2d, v1.2d, v8.2d

# qhasm: vec_carry1 = vec_F4_F5_G4_G5 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#9.16b, <vec_F4_F5_G4_G5=reg128#2.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v8.16b, <vec_F4_F5_G4_G5=v1.16b, <vec_MASKcarry1=v14.16b
and v8.16b, v1.16b, v14.16b

# qhasm: vec_F4_F5_G4_G5 = vec_F4_F5_G4_G5 & ~vec_MASKcarry1
# asm 1: bic >vec_F4_F5_G4_G5=reg128#2.16b, <vec_F4_F5_G4_G5=reg128#2.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_F4_F5_G4_G5=v1.16b, <vec_F4_F5_G4_G5=v1.16b, <vec_MASKcarry1=v14.16b
bic v1.16b, v1.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#9.2d, <vec_carry1=reg128#9.2d, #2
# asm 2: shl >vec_carry1=v8.2d, <vec_carry1=v8.2d, #2
shl v8.2d, v8.2d, #2

# qhasm: 2x vec_F4_F5_G4_G5 += vec_carry1
# asm 1: add <vec_F4_F5_G4_G5=reg128#2.2d, <vec_F4_F5_G4_G5=reg128#2.2d, <vec_carry1=reg128#9.2d
# asm 2: add <vec_F4_F5_G4_G5=v1.2d, <vec_F4_F5_G4_G5=v1.2d, <vec_carry1=v8.2d
add v1.2d, v1.2d, v8.2d

# qhasm: vec_carry2 = vec_F4_F5_G4_G5 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#9.16b, <vec_F4_F5_G4_G5=reg128#2.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v8.16b, <vec_F4_F5_G4_G5=v1.16b, <vec_MASKcarry2=v15.16b
and v8.16b, v1.16b, v15.16b

# qhasm: vec_F4_F5_G4_G5 = vec_F4_F5_G4_G5 & ~vec_MASKcarry2
# asm 1: bic >vec_F4_F5_G4_G5=reg128#2.16b, <vec_F4_F5_G4_G5=reg128#2.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_F4_F5_G4_G5=v1.16b, <vec_F4_F5_G4_G5=v1.16b, <vec_MASKcarry2=v15.16b
bic v1.16b, v1.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#9.2d, <vec_carry2=reg128#9.2d, #62
# asm 2: ushr >vec_carry2=v8.2d, <vec_carry2=v8.2d, #62
ushr v8.2d, v8.2d, #62

# qhasm: 2x vec_F6_F7_G6_G7 += vec_carry2
# asm 1: add <vec_F6_F7_G6_G7=reg128#3.2d, <vec_F6_F7_G6_G7=reg128#3.2d, <vec_carry2=reg128#9.2d
# asm 2: add <vec_F6_F7_G6_G7=v2.2d, <vec_F6_F7_G6_G7=v2.2d, <vec_carry2=v8.2d
add v2.2d, v2.2d, v8.2d

# qhasm: vec_carry1 = vec_F6_F7_G6_G7 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#9.16b, <vec_F6_F7_G6_G7=reg128#3.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v8.16b, <vec_F6_F7_G6_G7=v2.16b, <vec_MASKcarry1=v14.16b
and v8.16b, v2.16b, v14.16b

# qhasm: vec_F6_F7_G6_G7 = vec_F6_F7_G6_G7 & ~vec_MASKcarry1
# asm 1: bic >vec_F6_F7_G6_G7=reg128#3.16b, <vec_F6_F7_G6_G7=reg128#3.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_F6_F7_G6_G7=v2.16b, <vec_F6_F7_G6_G7=v2.16b, <vec_MASKcarry1=v14.16b
bic v2.16b, v2.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#9.2d, <vec_carry1=reg128#9.2d, #2
# asm 2: shl >vec_carry1=v8.2d, <vec_carry1=v8.2d, #2
shl v8.2d, v8.2d, #2

# qhasm: 2x vec_F6_F7_G6_G7 += vec_carry1
# asm 1: add <vec_F6_F7_G6_G7=reg128#3.2d, <vec_F6_F7_G6_G7=reg128#3.2d, <vec_carry1=reg128#9.2d
# asm 2: add <vec_F6_F7_G6_G7=v2.2d, <vec_F6_F7_G6_G7=v2.2d, <vec_carry1=v8.2d
add v2.2d, v2.2d, v8.2d

# qhasm: vec_carry2 = vec_F6_F7_G6_G7 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#9.16b, <vec_F6_F7_G6_G7=reg128#3.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v8.16b, <vec_F6_F7_G6_G7=v2.16b, <vec_MASKcarry2=v15.16b
and v8.16b, v2.16b, v15.16b

# qhasm: vec_F6_F7_G6_G7 = vec_F6_F7_G6_G7 & ~vec_MASKcarry2
# asm 1: bic >vec_F6_F7_G6_G7=reg128#3.16b, <vec_F6_F7_G6_G7=reg128#3.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_F6_F7_G6_G7=v2.16b, <vec_F6_F7_G6_G7=v2.16b, <vec_MASKcarry2=v15.16b
bic v2.16b, v2.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#9.2d, <vec_carry2=reg128#9.2d, #62
# asm 2: ushr >vec_carry2=v8.2d, <vec_carry2=v8.2d, #62
ushr v8.2d, v8.2d, #62

# qhasm: 2x vec_F8_F9_G8_G9 += vec_carry2
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_carry2=reg128#9.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_carry2=v8.2d
add v3.2d, v3.2d, v8.2d

# qhasm: vec_carry1 = vec_F8_F9_G8_G9 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#9.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v8.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry1=v14.16b
and v8.16b, v3.16b, v14.16b

# qhasm: vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry1
# asm 1: bic >vec_F8_F9_G8_G9=reg128#4.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_F8_F9_G8_G9=v3.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry1=v14.16b
bic v3.16b, v3.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#9.2d, <vec_carry1=reg128#9.2d, #2
# asm 2: shl >vec_carry1=v8.2d, <vec_carry1=v8.2d, #2
shl v8.2d, v8.2d, #2

# qhasm: 2x vec_F8_F9_G8_G9 += vec_carry1
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_carry1=reg128#9.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_carry1=v8.2d
add v3.2d, v3.2d, v8.2d

# qhasm: vec_carry2 = vec_F8_F9_G8_G9 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#9.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v8.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry2=v15.16b
and v8.16b, v3.16b, v15.16b

# qhasm: vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry2
# asm 1: bic >vec_F8_F9_G8_G9=reg128#4.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_F8_F9_G8_G9=v3.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry2=v15.16b
bic v3.16b, v3.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#9.2d, <vec_carry2=reg128#9.2d, #62
# asm 2: ushr >vec_carry2=v8.2d, <vec_carry2=v8.2d, #62
ushr v8.2d, v8.2d, #62

# qhasm: 2x vec_F10_0_G10_0 += vec_carry2
# asm 1: add <vec_F10_0_G10_0=reg128#8.2d, <vec_F10_0_G10_0=reg128#8.2d, <vec_carry2=reg128#9.2d
# asm 2: add <vec_F10_0_G10_0=v7.2d, <vec_F10_0_G10_0=v7.2d, <vec_carry2=v8.2d
add v7.2d, v7.2d, v8.2d

# qhasm: reg128 vec_Fhat_0_Ghat_0

# qhasm: reg128 vec_Fhat

# qhasm: reg128 vec_Ghat

# qhasm: 4x vec_Fhat_0_Ghat_0 = vec_F8_0_G8_0 >> 31
# asm 1: sshr >vec_Fhat_0_Ghat_0=reg128#5.4s, <vec_F8_0_G8_0=reg128#5.4s, #31
# asm 2: sshr >vec_Fhat_0_Ghat_0=v4.4s, <vec_F8_0_G8_0=v4.4s, #31
sshr v4.4s, v4.4s, #31

# qhasm: 4x vec_Fhat = vec_Fhat_0_Ghat_0[0/4]
# asm 1: dup <vec_Fhat=reg128#9.4s, <vec_Fhat_0_Ghat_0=reg128#5.s[0]
# asm 2: dup <vec_Fhat=v8.4s, <vec_Fhat_0_Ghat_0=v4.s[0]
dup v8.4s, v4.s[0]

# qhasm: 4x vec_Ghat = vec_Fhat_0_Ghat_0[2/4]
# asm 1: dup <vec_Ghat=reg128#10.4s, <vec_Fhat_0_Ghat_0=reg128#5.s[2]
# asm 2: dup <vec_Ghat=v9.4s, <vec_Fhat_0_Ghat_0=v4.s[2]
dup v9.4s, v4.s[2]

# qhasm: 4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[0/4] vec_uu1_rr1_vv1_ss1[0/4] vec_uu0_rr0_vv0_ss0[1/4] vec_uu1_rr1_vv1_ss1[1/4]
# asm 1: zip1 >vec_tmp1=reg128#5.4s, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s
# asm 2: zip1 >vec_tmp1=v4.4s, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_uu1_rr1_vv1_ss1=v6.4s
zip1 v4.4s, v5.4s, v6.4s

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#5.2d, <vec_tmp1=reg128#5.2d, #2
# asm 2: shl >vec_tmp1=v4.2d, <vec_tmp1=v4.2d, #2
shl v4.2d, v4.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#11.16b, <vec_tmp1=reg128#5.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v10.16b, <vec_tmp1=v4.16b, <vec_MASKcarry1=v14.16b
and v10.16b, v4.16b, v14.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_MASKcarry1=v14.16b
bic v4.16b, v4.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#11.2d, <vec_carry1=reg128#11.2d, #2
# asm 2: shl >vec_carry1=v10.2d, <vec_carry1=v10.2d, #2
shl v10.2d, v10.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_carry1=reg128#11.16b
# asm 2: orr <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_carry1=v10.16b
orr v4.16b, v4.16b, v10.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry1
# asm 1: eor <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: eor <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_MASKcarry1=v14.16b
eor v4.16b, v4.16b, v14.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b
# asm 2: not >vec_tmp1=v4.16b, <vec_tmp1=v4.16b
not v4.16b, v4.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#5.2d, <vec_tmp1=reg128#5.2d, <vec_ONE=reg128#19.2d
# asm 2: add <vec_tmp1=v4.2d, <vec_tmp1=v4.2d, <vec_ONE=v18.2d
add v4.2d, v4.2d, v18.2d

# qhasm: vec_tmp1 &= vec_Fhat
# asm 1: and <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_Fhat=reg128#9.16b
# asm 2: and <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_Fhat=v8.16b
and v4.16b, v4.16b, v8.16b

# qhasm: 2x vec_tmp2 = vec_tmp1 << 32
# asm 1: shl >vec_tmp2=reg128#9.2d, <vec_tmp1=reg128#5.2d, #32
# asm 2: shl >vec_tmp2=v8.2d, <vec_tmp1=v4.2d, #32
shl v8.2d, v4.2d, #32

# qhasm: 2x vec_tmp3 = vec_tmp1 unsigned>> 32
# asm 1: ushr >vec_tmp3=reg128#5.2d, <vec_tmp1=reg128#5.2d, #32
# asm 2: ushr >vec_tmp3=v4.2d, <vec_tmp1=v4.2d, #32
ushr v4.2d, v4.2d, #32

# qhasm: 2x vec_F8_F9_G8_G9 += vec_tmp2
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_tmp2=reg128#9.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_tmp2=v8.2d
add v3.2d, v3.2d, v8.2d

# qhasm: 2x vec_F10_0_G10_0 += vec_tmp3
# asm 1: add <vec_F10_0_G10_0=reg128#8.2d, <vec_F10_0_G10_0=reg128#8.2d, <vec_tmp3=reg128#5.2d
# asm 2: add <vec_F10_0_G10_0=v7.2d, <vec_F10_0_G10_0=v7.2d, <vec_tmp3=v4.2d
add v7.2d, v7.2d, v4.2d

# qhasm: 4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[2/4] vec_uu1_rr1_vv1_ss1[2/4] vec_uu0_rr0_vv0_ss0[3/4] vec_uu1_rr1_vv1_ss1[3/4]
# asm 1: zip2 >vec_tmp1=reg128#5.4s, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s
# asm 2: zip2 >vec_tmp1=v4.4s, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_uu1_rr1_vv1_ss1=v6.4s
zip2 v4.4s, v5.4s, v6.4s

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#5.2d, <vec_tmp1=reg128#5.2d, #2
# asm 2: shl >vec_tmp1=v4.2d, <vec_tmp1=v4.2d, #2
shl v4.2d, v4.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#6.16b, <vec_tmp1=reg128#5.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v5.16b, <vec_tmp1=v4.16b, <vec_MASKcarry1=v14.16b
and v5.16b, v4.16b, v14.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_MASKcarry1=v14.16b
bic v4.16b, v4.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#6.2d, <vec_carry1=reg128#6.2d, #2
# asm 2: shl >vec_carry1=v5.2d, <vec_carry1=v5.2d, #2
shl v5.2d, v5.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_carry1=reg128#6.16b
# asm 2: orr <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_carry1=v5.16b
orr v4.16b, v4.16b, v5.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry1
# asm 1: eor <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: eor <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_MASKcarry1=v14.16b
eor v4.16b, v4.16b, v14.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b
# asm 2: not >vec_tmp1=v4.16b, <vec_tmp1=v4.16b
not v4.16b, v4.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#5.2d, <vec_tmp1=reg128#5.2d, <vec_ONE=reg128#19.2d
# asm 2: add <vec_tmp1=v4.2d, <vec_tmp1=v4.2d, <vec_ONE=v18.2d
add v4.2d, v4.2d, v18.2d

# qhasm: vec_tmp1 &= vec_Ghat
# asm 1: and <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_Ghat=reg128#10.16b
# asm 2: and <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_Ghat=v9.16b
and v4.16b, v4.16b, v9.16b

# qhasm: vec_tmp1 &= vec_Ghat
# asm 1: and <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_Ghat=reg128#10.16b
# asm 2: and <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_Ghat=v9.16b
and v4.16b, v4.16b, v9.16b

# qhasm: 2x vec_tmp2 = vec_tmp1 << 32
# asm 1: shl >vec_tmp2=reg128#6.2d, <vec_tmp1=reg128#5.2d, #32
# asm 2: shl >vec_tmp2=v5.2d, <vec_tmp1=v4.2d, #32
shl v5.2d, v4.2d, #32

# qhasm: 2x vec_tmp3 = vec_tmp1 unsigned>> 32
# asm 1: ushr >vec_tmp3=reg128#5.2d, <vec_tmp1=reg128#5.2d, #32
# asm 2: ushr >vec_tmp3=v4.2d, <vec_tmp1=v4.2d, #32
ushr v4.2d, v4.2d, #32

# qhasm: 2x vec_F8_F9_G8_G9 += vec_tmp2
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_tmp2=reg128#6.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_tmp2=v5.2d
add v3.2d, v3.2d, v5.2d

# qhasm: 2x vec_F10_0_G10_0 += vec_tmp3
# asm 1: add <vec_F10_0_G10_0=reg128#8.2d, <vec_F10_0_G10_0=reg128#8.2d, <vec_tmp3=reg128#5.2d
# asm 2: add <vec_F10_0_G10_0=v7.2d, <vec_F10_0_G10_0=v7.2d, <vec_tmp3=v4.2d
add v7.2d, v7.2d, v4.2d

# qhasm: vec_carry1 = vec_F8_F9_G8_G9 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#5.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: and >vec_carry1=v4.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry1=v14.16b
and v4.16b, v3.16b, v14.16b

# qhasm: vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry1
# asm 1: bic >vec_F8_F9_G8_G9=reg128#4.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry1=reg128#15.16b
# asm 2: bic >vec_F8_F9_G8_G9=v3.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry1=v14.16b
bic v3.16b, v3.16b, v14.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#5.2d, <vec_carry1=reg128#5.2d, #2
# asm 2: shl >vec_carry1=v4.2d, <vec_carry1=v4.2d, #2
shl v4.2d, v4.2d, #2

# qhasm: 2x vec_F8_F9_G8_G9 += vec_carry1
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_carry1=reg128#5.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_carry1=v4.2d
add v3.2d, v3.2d, v4.2d

# qhasm: vec_carry2 = vec_F8_F9_G8_G9 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#5.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: and >vec_carry2=v4.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry2=v15.16b
and v4.16b, v3.16b, v15.16b

# qhasm: vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry2
# asm 1: bic >vec_F8_F9_G8_G9=reg128#4.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry2=reg128#16.16b
# asm 2: bic >vec_F8_F9_G8_G9=v3.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry2=v15.16b
bic v3.16b, v3.16b, v15.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#5.2d, <vec_carry2=reg128#5.2d, #62
# asm 2: ushr >vec_carry2=v4.2d, <vec_carry2=v4.2d, #62
ushr v4.2d, v4.2d, #62

# qhasm: 2x vec_F10_0_G10_0 += vec_carry2
# asm 1: add <vec_F10_0_G10_0=reg128#8.2d, <vec_F10_0_G10_0=reg128#8.2d, <vec_carry2=reg128#5.2d
# asm 2: add <vec_F10_0_G10_0=v7.2d, <vec_F10_0_G10_0=v7.2d, <vec_carry2=v4.2d
add v7.2d, v7.2d, v4.2d

# qhasm: reg128 vec_F2_F3_F4_F5

# qhasm: reg128 vec_G2_G3_G4_G5

# qhasm: 2x vec_F2_F3_F4_F5 zip= vec_F2_F3_G2_G3[0/2] vec_F4_F5_G4_G5[0/2]
# asm 1: zip1 >vec_F2_F3_F4_F5=reg128#5.2d, <vec_F2_F3_G2_G3=reg128#1.2d, <vec_F4_F5_G4_G5=reg128#2.2d
# asm 2: zip1 >vec_F2_F3_F4_F5=v4.2d, <vec_F2_F3_G2_G3=v0.2d, <vec_F4_F5_G4_G5=v1.2d
zip1 v4.2d, v0.2d, v1.2d

# qhasm: 2x vec_G2_G3_G4_G5 zip= vec_F2_F3_G2_G3[1/2] vec_F4_F5_G4_G5[1/2]
# asm 1: zip2 >vec_G2_G3_G4_G5=reg128#1.2d, <vec_F2_F3_G2_G3=reg128#1.2d, <vec_F4_F5_G4_G5=reg128#2.2d
# asm 2: zip2 >vec_G2_G3_G4_G5=v0.2d, <vec_F2_F3_G2_G3=v0.2d, <vec_F4_F5_G4_G5=v1.2d
zip2 v0.2d, v0.2d, v1.2d

# qhasm: reg128 vec_F6_F7_F8_F9

# qhasm: reg128 vec_G6_G7_G8_G9

# qhasm: 2x vec_F6_F7_F8_F9 zip= vec_F6_F7_G6_G7[0/2] vec_F8_F9_G8_G9[0/2]
# asm 1: zip1 >vec_F6_F7_F8_F9=reg128#2.2d, <vec_F6_F7_G6_G7=reg128#3.2d, <vec_F8_F9_G8_G9=reg128#4.2d
# asm 2: zip1 >vec_F6_F7_F8_F9=v1.2d, <vec_F6_F7_G6_G7=v2.2d, <vec_F8_F9_G8_G9=v3.2d
zip1 v1.2d, v2.2d, v3.2d

# qhasm: 2x vec_G6_G7_G8_G9 zip= vec_F6_F7_G6_G7[1/2] vec_F8_F9_G8_G9[1/2]
# asm 1: zip2 >vec_G6_G7_G8_G9=reg128#3.2d, <vec_F6_F7_G6_G7=reg128#3.2d, <vec_F8_F9_G8_G9=reg128#4.2d
# asm 2: zip2 >vec_G6_G7_G8_G9=v2.2d, <vec_F6_F7_G6_G7=v2.2d, <vec_F8_F9_G8_G9=v3.2d
zip2 v2.2d, v2.2d, v3.2d

# qhasm: mem256[pointerF] = vec_F2_F3_F4_F5, vec_F6_F7_F8_F9
# asm 1: stp <vec_F2_F3_F4_F5=reg128#5%qregname, <vec_F6_F7_F8_F9=reg128#2%qregname, [<pointerF=int64#1]
# asm 2: stp <vec_F2_F3_F4_F5=q4, <vec_F6_F7_F8_F9=q1, [<pointerF=x0]
stp q4, q1, [x0]

# qhasm: mem256[pointerG] = vec_G2_G3_G4_G5, vec_G6_G7_G8_G9
# asm 1: stp <vec_G2_G3_G4_G5=reg128#1%qregname, <vec_G6_G7_G8_G9=reg128#3%qregname, [<pointerG=int64#2]
# asm 2: stp <vec_G2_G3_G4_G5=q0, <vec_G6_G7_G8_G9=q2, [<pointerG=x1]
stp q0, q2, [x1]

# qhasm: int64 F10

# qhasm: F10 = vec_F10_0_G10_0[0/2]
# asm 1: umov >F10=int64#3, <vec_F10_0_G10_0=reg128#8.d[0]
# asm 2: umov >F10=x2, <vec_F10_0_G10_0=v7.d[0]
umov x2, v7.d[0]

# qhasm: mem32[pointerF+32] = F10
# asm 1: str <F10=int64#3%wregname, [<pointerF=int64#1, #32]
# asm 2: str <F10=w2, [<pointerF=x0, #32]
str w2, [x0, #32]

# qhasm: int64 G10

# qhasm: G10 = vec_F10_0_G10_0[1/2]
# asm 1: umov >G10=int64#1, <vec_F10_0_G10_0=reg128#8.d[1]
# asm 2: umov >G10=x0, <vec_F10_0_G10_0=v7.d[1]
umov x0, v7.d[1]

# qhasm: mem32[pointerG+32] = G10
# asm 1: str <G10=int64#1%wregname, [<pointerG=int64#2, #32]
# asm 2: str <G10=w0, [<pointerG=x1, #32]
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
