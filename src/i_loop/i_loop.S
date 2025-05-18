
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

# qhasm: enter i_loop
.align 4
.global _i_loop
.global i_loop
_i_loop:
i_loop:

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

# qhasm: int64 pointer_delta

# qhasm: int64 pointer_F

# qhasm: int64 pointer_G

# qhasm: int64 pointer_V

# qhasm: int64 pointer_S

# qhasm: int64 pointer_uuvvrrss

# qhasm: input pointer_delta

# qhasm: input pointer_F

# qhasm: input pointer_G

# qhasm: input pointer_V

# qhasm: input pointer_S

# qhasm: input pointer_uuvvrrss

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss

# qhasm: int64 F0F1

# qhasm: int64 F2F3

# qhasm: int64 F4F5

# qhasm: int64 F6F7

# qhasm: int64 F8

# qhasm: F0F1, F2F3 = mem128[pointer_F]
# asm 1: ldp >F0F1=int64#7, >F2F3=int64#8, [<pointer_F=int64#2]
# asm 2: ldp >F0F1=x6, >F2F3=x7, [<pointer_F=x1]
ldp x6, x7, [x1]

# qhasm: F4F5, F6F7 = mem128[pointer_F+16]
# asm 1: ldp >F4F5=int64#9, >F6F7=int64#10, [<pointer_F=int64#2, #16]
# asm 2: ldp >F4F5=x8, >F6F7=x9, [<pointer_F=x1, #16]
ldp x8, x9, [x1, #16]

# qhasm: F8 = mem32[pointer_F+32]
# asm 1: ldr >F8=int64#11%wregname, [<pointer_F=int64#2, #32]
# asm 2: ldr >F8=w10, [<pointer_F=x1, #32]
ldr w10, [x1, #32]

# qhasm: int64 G0G1

# qhasm: int64 G2G3

# qhasm: int64 G4G5

# qhasm: int64 G6G7

# qhasm: int64 G8

# qhasm: G0G1, G2G3 = mem128[pointer_G]
# asm 1: ldp >G0G1=int64#12, >G2G3=int64#13, [<pointer_G=int64#3]
# asm 2: ldp >G0G1=x11, >G2G3=x12, [<pointer_G=x2]
ldp x11, x12, [x2]

# qhasm: G4G5, G6G7 = mem128[pointer_G+16]
# asm 1: ldp >G4G5=int64#14, >G6G7=int64#15, [<pointer_G=int64#3, #16]
# asm 2: ldp >G4G5=x13, >G6G7=x14, [<pointer_G=x2, #16]
ldp x13, x14, [x2, #16]

# qhasm: G8 = mem32[pointer_G+32]
# asm 1: ldr >G8=int64#16%wregname, [<pointer_G=int64#3, #32]
# asm 2: ldr >G8=w15, [<pointer_G=x2, #32]
ldr w15, [x2, #32]

# qhasm: reg128 vec_F0_F1_G0_G1 

# qhasm: vec_F0_F1_G0_G1[0/2] = F0F1 
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.d[0], <F0F1=int64#7
# asm 2: ins <vec_F0_F1_G0_G1=v0.d[0], <F0F1=x6
ins v0.d[0], x6

# qhasm: vec_F0_F1_G0_G1[1/2] = G0G1 
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.d[1], <G0G1=int64#12
# asm 2: ins <vec_F0_F1_G0_G1=v0.d[1], <G0G1=x11
ins v0.d[1], x11

# qhasm: reg128 vec_F2_F3_G2_G3 

# qhasm: vec_F2_F3_G2_G3[0/2] = F2F3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#2.d[0], <F2F3=int64#8
# asm 2: ins <vec_F2_F3_G2_G3=v1.d[0], <F2F3=x7
ins v1.d[0], x7

# qhasm: vec_F2_F3_G2_G3[1/2] = G2G3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#2.d[1], <G2G3=int64#13
# asm 2: ins <vec_F2_F3_G2_G3=v1.d[1], <G2G3=x12
ins v1.d[1], x12

# qhasm: reg128 vec_F4_F5_G4_G5 

# qhasm: vec_F4_F5_G4_G5[0/2] = F4F5 
# asm 1: ins <vec_F4_F5_G4_G5=reg128#3.d[0], <F4F5=int64#9
# asm 2: ins <vec_F4_F5_G4_G5=v2.d[0], <F4F5=x8
ins v2.d[0], x8

# qhasm: vec_F4_F5_G4_G5[1/2] = G4G5 
# asm 1: ins <vec_F4_F5_G4_G5=reg128#3.d[1], <G4G5=int64#14
# asm 2: ins <vec_F4_F5_G4_G5=v2.d[1], <G4G5=x13
ins v2.d[1], x13

# qhasm: reg128 vec_F6_F7_G6_G7 

# qhasm: vec_F6_F7_G6_G7[0/2] = F6F7 
# asm 1: ins <vec_F6_F7_G6_G7=reg128#4.d[0], <F6F7=int64#10
# asm 2: ins <vec_F6_F7_G6_G7=v3.d[0], <F6F7=x9
ins v3.d[0], x9

# qhasm: vec_F6_F7_G6_G7[1/2] = G6G7 
# asm 1: ins <vec_F6_F7_G6_G7=reg128#4.d[1], <G6G7=int64#15
# asm 2: ins <vec_F6_F7_G6_G7=v3.d[1], <G6G7=x14
ins v3.d[1], x14

# qhasm: reg128 vec_F8_0_G8_0

# qhasm: vec_F8_0_G8_0[0/2] = F8
# asm 1: ins <vec_F8_0_G8_0=reg128#5.d[0], <F8=int64#11
# asm 2: ins <vec_F8_0_G8_0=v4.d[0], <F8=x10
ins v4.d[0], x10

# qhasm: vec_F8_0_G8_0[1/2] = G8
# asm 1: ins <vec_F8_0_G8_0=reg128#5.d[1], <G8=int64#16
# asm 2: ins <vec_F8_0_G8_0=v4.d[1], <G8=x15
ins v4.d[1], x15

# qhasm: uu, vv = mem128[pointer_uuvvrrss + 0]
# asm 1: ldp >uu=int64#7, >vv=int64#8, [<pointer_uuvvrrss=int64#6, #0]
# asm 2: ldp >uu=x6, >vv=x7, [<pointer_uuvvrrss=x5, #0]
ldp x6, x7, [x5, #0]

# qhasm: rr, ss = mem128[pointer_uuvvrrss + 16]
# asm 1: ldp >rr=int64#9, >ss=int64#10, [<pointer_uuvvrrss=int64#6, #16]
# asm 2: ldp >rr=x8, >ss=x9, [<pointer_uuvvrrss=x5, #16]
ldp x8, x9, [x5, #16]

# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#11, <uu=int64#7, #0, #30
# asm 2: ubfx >uu0=x10, <uu=x6, #0, #30
ubfx x10, x6, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#7, <uu=int64#7, #30, #32
# asm 2: ubfx >uu1=x6, <uu=x6, #30, #32
ubfx x6, x6, #30, #32

# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#12, <vv=int64#8, #0, #30
# asm 2: ubfx >vv0=x11, <vv=x7, #0, #30
ubfx x11, x7, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#8, <vv=int64#8, #30, #32
# asm 2: ubfx >vv1=x7, <vv=x7, #30, #32
ubfx x7, x7, #30, #32

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#13, <rr=int64#9, #0, #30
# asm 2: ubfx >rr0=x12, <rr=x8, #0, #30
ubfx x12, x8, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#9, <rr=int64#9, #30, #32
# asm 2: ubfx >rr1=x8, <rr=x8, #30, #32
ubfx x8, x8, #30, #32

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#14, <ss=int64#10, #0, #30
# asm 2: ubfx >ss0=x13, <ss=x9, #0, #30
ubfx x13, x9, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#10, <ss=int64#10, #30, #32
# asm 2: ubfx >ss1=x9, <ss=x9, #30, #32
ubfx x9, x9, #30, #32

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[0], <uu0=int64#11%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[0], <uu0=w10
ins v5.s[0], w10

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[1], <rr0=int64#13%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[1], <rr0=w12
ins v5.s[1], w12

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[2], <vv0=int64#12%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[2], <vv0=w11
ins v5.s[2], w11

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#6.s[3], <ss0=int64#14%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v5.s[3], <ss0=w13
ins v5.s[3], w13

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[0], <uu1=int64#7%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[0], <uu1=w6
ins v6.s[0], w6

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[1], <rr1=int64#9%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[1], <rr1=w8
ins v6.s[1], w8

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[2], <vv1=int64#8%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[2], <vv1=w7
ins v6.s[2], w7

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#7.s[3], <ss1=int64#10%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v6.s[3], <ss1=w9
ins v6.s[3], w9

# qhasm: reg128 vec_uuhat_rrhat_vvhat_sshat

# qhasm: reg128 vec_uuhat_rrhat

# qhasm: reg128 vec_vvhat_sshat

# qhasm: 4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31
# asm 1: sshr <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, #31
# asm 2: sshr <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uu1_rr1_vv1_ss1=v6.4s, #31
sshr v7.4s, v6.4s, #31

# qhasm: 4x vec_uuhat_rrhat = vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[1/4] vec_uuhat_rrhat_vvhat_sshat[1/4]
# asm 1: zip1 >vec_uuhat_rrhat=reg128#9.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s
# asm 2: zip1 >vec_uuhat_rrhat=v8.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s
zip1 v8.4s, v7.4s, v7.4s

# qhasm: 4x vec_vvhat_sshat = vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[3/4] vec_uuhat_rrhat_vvhat_sshat[3/4]
# asm 1: zip2 >vec_vvhat_sshat=reg128#10.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s
# asm 2: zip2 >vec_vvhat_sshat=v9.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s
zip2 v9.4s, v7.4s, v7.4s

# qhasm: reg128 vec_tmp0

# qhasm: reg128 vec_MASK2p30m1

# qhasm: reg128 vec_MASK2p32m1

# qhasm: 2x vec_tmp0 = 0
# asm 1: movi <vec_tmp0=reg128#11.2d, #0
# asm 2: movi <vec_tmp0=v10.2d, #0
movi v10.2d, #0

# qhasm: 2x vec_MASK2p32m1 = 0xFFFFFFFF
# asm 1: movi <vec_MASK2p32m1=reg128#12.2d, #0xFFFFFFFF
# asm 2: movi <vec_MASK2p32m1=v11.2d, #0xFFFFFFFF
movi v11.2d, #0xFFFFFFFF

# qhasm: 2x vec_MASK2p30m1 = vec_MASK2p32m1 unsigned>> 2
# asm 1: ushr >vec_MASK2p30m1=reg128#12.2d, <vec_MASK2p32m1=reg128#12.2d, #2
# asm 2: ushr >vec_MASK2p30m1=v11.2d, <vec_MASK2p32m1=v11.2d, #2
ushr v11.2d, v11.2d, #2

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
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F0_F1_G0_G1=v0.s[0]
umlal v10.2d, v5.2s, v0.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F0_F1_G0_G1=v0.s[2]
umlal2 v10.2d, v5.4s, v0.s[2]

# qhasm: vec_R0_0_S0_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R0_0_S0_0=reg128#13.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R0_0_S0_0=v12.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v12.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F0_F1_G0_G1[1/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F0_F1_G0_G1=v0.s[1]
umlal v10.2d, v5.2s, v0.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F0_F1_G0_G1=v0.s[3]
umlal2 v10.2d, v5.4s, v0.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[0/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F0_F1_G0_G1=v0.s[0]
umlal v10.2d, v6.2s, v0.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F0_F1_G0_G1=v0.s[2]
umlal2 v10.2d, v6.4s, v0.s[2]

# qhasm: vec_R1_0_S1_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R1_0_S1_0=reg128#14.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R1_0_S1_0=v13.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v13.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[0/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F2_F3_G2_G3=v1.s[0]
umlal v10.2d, v5.2s, v1.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F2_F3_G2_G3=v1.s[2]
umlal2 v10.2d, v5.4s, v1.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[1/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F0_F1_G0_G1=v0.s[1]
umlal v10.2d, v6.2s, v0.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F0_F1_G0_G1=v0.s[3]
umlal2 v10.2d, v6.4s, v0.s[3]

# qhasm: vec_R2_0_S2_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R2_0_S2_0=reg128#15.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R2_0_S2_0=v14.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v14.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[1/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F2_F3_G2_G3=v1.s[1]
umlal v10.2d, v5.2s, v1.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F2_F3_G2_G3=v1.s[3]
umlal2 v10.2d, v5.4s, v1.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[0/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F2_F3_G2_G3=v1.s[0]
umlal v10.2d, v6.2s, v1.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F2_F3_G2_G3=v1.s[2]
umlal2 v10.2d, v6.4s, v1.s[2]

# qhasm: vec_R3_0_S3_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R3_0_S3_0=reg128#16.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R3_0_S3_0=v15.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v15.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[0/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F4_F5_G4_G5=v2.s[0]
umlal v10.2d, v5.2s, v2.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F4_F5_G4_G5=v2.s[2]
umlal2 v10.2d, v5.4s, v2.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[1/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F2_F3_G2_G3=v1.s[1]
umlal v10.2d, v6.2s, v1.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F2_F3_G2_G3=v1.s[3]
umlal2 v10.2d, v6.4s, v1.s[3]

# qhasm: vec_R4_0_S4_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R4_0_S4_0=reg128#17.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R4_0_S4_0=v16.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v16.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[1/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F4_F5_G4_G5=v2.s[1]
umlal v10.2d, v5.2s, v2.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F4_F5_G4_G5=v2.s[3]
umlal2 v10.2d, v5.4s, v2.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[0/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F4_F5_G4_G5=v2.s[0]
umlal v10.2d, v6.2s, v2.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F4_F5_G4_G5=v2.s[2]
umlal2 v10.2d, v6.4s, v2.s[2]

# qhasm: vec_R5_0_S5_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R5_0_S5_0=reg128#18.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R5_0_S5_0=v17.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v17.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[0/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F6_F7_G6_G7=v3.s[0]
umlal v10.2d, v5.2s, v3.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F6_F7_G6_G7=v3.s[2]
umlal2 v10.2d, v5.4s, v3.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[1/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F4_F5_G4_G5=v2.s[1]
umlal v10.2d, v6.2s, v2.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F4_F5_G4_G5=v2.s[3]
umlal2 v10.2d, v6.4s, v2.s[3]

# qhasm: vec_R6_0_S6_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R6_0_S6_0=reg128#19.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R6_0_S6_0=v18.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v18.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[1/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F6_F7_G6_G7=v3.s[1]
umlal v10.2d, v5.2s, v3.s[1]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F6_F7_G6_G7=v3.s[3]
umlal2 v10.2d, v5.4s, v3.s[3]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[0/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F6_F7_G6_G7=v3.s[0]
umlal v10.2d, v6.2s, v3.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F6_F7_G6_G7=v3.s[2]
umlal2 v10.2d, v6.4s, v3.s[2]

# qhasm: vec_R7_0_S7_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R7_0_S7_0=reg128#20.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R7_0_S7_0=v19.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v19.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F8_0_G8_0[0/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_F8_0_G8_0=reg128#5.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_F8_0_G8_0=v4.s[0]
umlal v10.2d, v5.2s, v4.s[0]

# qhasm: 2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F8_0_G8_0[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_F8_0_G8_0=reg128#5.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_F8_0_G8_0=v4.s[2]
umlal2 v10.2d, v5.4s, v4.s[2]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[1/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F6_F7_G6_G7=v3.s[1]
umlal v10.2d, v6.2s, v3.s[1]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F6_F7_G6_G7=v3.s[3]
umlal2 v10.2d, v6.4s, v3.s[3]

# qhasm: vec_R8_0_S8_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R8_0_S8_0=reg128#21.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R8_0_S8_0=v20.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v20.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F8_0_G8_0[0/4]
# asm 1: umlal <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_F8_0_G8_0=reg128#5.s[0]
# asm 2: umlal <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_F8_0_G8_0=v4.s[0]
umlal v10.2d, v6.2s, v4.s[0]

# qhasm: 2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F8_0_G8_0[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#11.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_F8_0_G8_0=reg128#5.s[2]
# asm 2: umlal2 <vec_tmp0=v10.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_F8_0_G8_0=v4.s[2]
umlal2 v10.2d, v6.4s, v4.s[2]

# qhasm: vec_R9_0_S9_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R9_0_S9_0=reg128#12.16b, <vec_tmp0=reg128#11.16b, <vec_MASK2p30m1=reg128#12.16b
# asm 2: and >vec_R9_0_S9_0=v11.16b, <vec_tmp0=v10.16b, <vec_MASK2p30m1=v11.16b
and v11.16b, v10.16b, v11.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30
# asm 1: ushr >vec_tmp0=reg128#11.2d, <vec_tmp0=reg128#11.2d, #30
# asm 2: ushr >vec_tmp0=v10.2d, <vec_tmp0=v10.2d, #30
ushr v10.2d, v10.2d, #30

# qhasm: vec_R10_0_S10_0 = vec_tmp0 
# asm 1: mov >vec_R10_0_S10_0=reg128#11.16b, <vec_tmp0=reg128#11.16b
# asm 2: mov >vec_R10_0_S10_0=v10.16b, <vec_tmp0=v10.16b
mov v10.16b, v10.16b

# qhasm: reg128 vec_R0_R1_S0_S1

# qhasm: 2x vec_R1_0_S1_0 <<= 32
# asm 1: shl >vec_R1_0_S1_0=reg128#14.2d, <vec_R1_0_S1_0=reg128#14.2d, #32
# asm 2: shl >vec_R1_0_S1_0=v13.2d, <vec_R1_0_S1_0=v13.2d, #32
shl v13.2d, v13.2d, #32

# qhasm: vec_R0_R1_S0_S1 = vec_R0_0_S0_0 | vec_R1_0_S1_0
# asm 1: orr >vec_R0_R1_S0_S1=reg128#22.16b, <vec_R0_0_S0_0=reg128#13.16b, <vec_R1_0_S1_0=reg128#14.16b
# asm 2: orr >vec_R0_R1_S0_S1=v21.16b, <vec_R0_0_S0_0=v12.16b, <vec_R1_0_S1_0=v13.16b
orr v21.16b, v12.16b, v13.16b

# qhasm: reg128 vec_R2_R3_S2_S3

# qhasm: 2x vec_R3_0_S3_0 <<= 32
# asm 1: shl >vec_R3_0_S3_0=reg128#13.2d, <vec_R3_0_S3_0=reg128#16.2d, #32
# asm 2: shl >vec_R3_0_S3_0=v12.2d, <vec_R3_0_S3_0=v15.2d, #32
shl v12.2d, v15.2d, #32

# qhasm: vec_R2_R3_S2_S3 = vec_R2_0_S2_0 | vec_R3_0_S3_0
# asm 1: orr >vec_R2_R3_S2_S3=reg128#13.16b, <vec_R2_0_S2_0=reg128#15.16b, <vec_R3_0_S3_0=reg128#13.16b
# asm 2: orr >vec_R2_R3_S2_S3=v12.16b, <vec_R2_0_S2_0=v14.16b, <vec_R3_0_S3_0=v12.16b
orr v12.16b, v14.16b, v12.16b

# qhasm: reg128 vec_R4_R5_S4_S5

# qhasm: 2x vec_R5_0_S5_0 <<= 32
# asm 1: shl >vec_R5_0_S5_0=reg128#14.2d, <vec_R5_0_S5_0=reg128#18.2d, #32
# asm 2: shl >vec_R5_0_S5_0=v13.2d, <vec_R5_0_S5_0=v17.2d, #32
shl v13.2d, v17.2d, #32

# qhasm: vec_R4_R5_S4_S5 = vec_R4_0_S4_0 | vec_R5_0_S5_0
# asm 1: orr >vec_R4_R5_S4_S5=reg128#14.16b, <vec_R4_0_S4_0=reg128#17.16b, <vec_R5_0_S5_0=reg128#14.16b
# asm 2: orr >vec_R4_R5_S4_S5=v13.16b, <vec_R4_0_S4_0=v16.16b, <vec_R5_0_S5_0=v13.16b
orr v13.16b, v16.16b, v13.16b

# qhasm: reg128 vec_R6_R7_S6_S7

# qhasm: 2x vec_R7_0_S7_0 <<= 32
# asm 1: shl >vec_R7_0_S7_0=reg128#15.2d, <vec_R7_0_S7_0=reg128#20.2d, #32
# asm 2: shl >vec_R7_0_S7_0=v14.2d, <vec_R7_0_S7_0=v19.2d, #32
shl v14.2d, v19.2d, #32

# qhasm: vec_R6_R7_S6_S7 = vec_R6_0_S6_0 | vec_R7_0_S7_0
# asm 1: orr >vec_R6_R7_S6_S7=reg128#15.16b, <vec_R6_0_S6_0=reg128#19.16b, <vec_R7_0_S7_0=reg128#15.16b
# asm 2: orr >vec_R6_R7_S6_S7=v14.16b, <vec_R6_0_S6_0=v18.16b, <vec_R7_0_S7_0=v14.16b
orr v14.16b, v18.16b, v14.16b

# qhasm: reg128 vec_R8_R9_S8_S9

# qhasm: 2x vec_R9_0_S9_0 <<= 32
# asm 1: shl >vec_R9_0_S9_0=reg128#12.2d, <vec_R9_0_S9_0=reg128#12.2d, #32
# asm 2: shl >vec_R9_0_S9_0=v11.2d, <vec_R9_0_S9_0=v11.2d, #32
shl v11.2d, v11.2d, #32

# qhasm: vec_R8_R9_S8_S9 = vec_R8_0_S8_0 | vec_R9_0_S9_0
# asm 1: orr >vec_R8_R9_S8_S9=reg128#12.16b, <vec_R8_0_S8_0=reg128#21.16b, <vec_R9_0_S9_0=reg128#12.16b
# asm 2: orr >vec_R8_R9_S8_S9=v11.16b, <vec_R8_0_S8_0=v20.16b, <vec_R9_0_S9_0=v11.16b
orr v11.16b, v20.16b, v11.16b

# qhasm: int64 carry1

# qhasm: carry1 = 3221225472
# asm 1: mov >carry1=int64#7, #3221225472
# asm 2: mov >carry1=x6, #3221225472
mov x6, #3221225472

# qhasm: reg128 vec_MASKcarry1

# qhasm: 2x vec_MASKcarry1 = carry1
# asm 1: dup <vec_MASKcarry1=reg128#16.2d, <carry1=int64#7
# asm 2: dup <vec_MASKcarry1=v15.2d, <carry1=x6
dup v15.2d, x6

# qhasm: reg128 vec_MASKcarry2

# qhasm: 2x vec_MASKcarry2 = vec_MASKcarry1 << 32
# asm 1: shl >vec_MASKcarry2=reg128#17.2d, <vec_MASKcarry1=reg128#16.2d, #32
# asm 2: shl >vec_MASKcarry2=v16.2d, <vec_MASKcarry1=v15.2d, #32
shl v16.2d, v15.2d, #32

# qhasm: reg128 vec_MASKcarry

# qhasm: vec_MASKcarry = vec_MASKcarry1 | vec_MASKcarry2
# asm 1: orr >vec_MASKcarry=reg128#18.16b, <vec_MASKcarry1=reg128#16.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: orr >vec_MASKcarry=v17.16b, <vec_MASKcarry1=v15.16b, <vec_MASKcarry2=v16.16b
orr v17.16b, v15.16b, v16.16b

# qhasm: reg128 vec_MASKeffect

# qhasm: vec_MASKeffect = ~vec_MASKcarry
# asm 1: not >vec_MASKeffect=reg128#19.16b, <vec_MASKcarry=reg128#18.16b
# asm 2: not >vec_MASKeffect=v18.16b, <vec_MASKcarry=v17.16b
not v18.16b, v17.16b

# qhasm: int64 ONE

# qhasm: ONE = 1
# asm 1: mov >ONE=int64#7, #1
# asm 2: mov >ONE=x6, #1
mov x6, #1

# qhasm: reg128 vec_ONE

# qhasm: 2x vec_ONE = ONE
# asm 1: dup <vec_ONE=reg128#20.2d, <ONE=int64#7
# asm 2: dup <vec_ONE=v19.2d, <ONE=x6
dup v19.2d, x6

# qhasm: reg128 vec_MASKhalfeffect

# qhasm: int64 2p32m1

# qhasm: 2p32m1 = 4294967295
# asm 1: mov >2p32m1=int64#7, #4294967295
# asm 2: mov >2p32m1=x6, #4294967295
mov x6, #4294967295

# qhasm: 2x vec_MASKhalfeffect = 2p32m1
# asm 1: dup <vec_MASKhalfeffect=reg128#21.2d, <2p32m1=int64#7
# asm 2: dup <vec_MASKhalfeffect=v20.2d, <2p32m1=x6
dup v20.2d, x6

# qhasm: reg128 vec_tmp1

# qhasm: reg128 vec_tmp2

# qhasm: reg128 vec_tmp3

# qhasm: reg128 vec_tmp4

# qhasm: reg128 vec_tmp5

# qhasm: reg128 vec_carry1

# qhasm: reg128 vec_carry2

# qhasm: 2x vec_tmp1 = vec_F0_F1_G0_G1[0/2]
# asm 1: dup <vec_tmp1=reg128#23.2d, <vec_F0_F1_G0_G1=reg128#1.d[0]
# asm 2: dup <vec_tmp1=v22.2d, <vec_F0_F1_G0_G1=v0.d[0]
dup v22.2d, v0.d[0]

# qhasm: 2x vec_tmp2 = vec_F2_F3_G2_G3[0/2]
# asm 1: dup <vec_tmp2=reg128#24.2d, <vec_F2_F3_G2_G3=reg128#2.d[0]
# asm 2: dup <vec_tmp2=v23.2d, <vec_F2_F3_G2_G3=v1.d[0]
dup v23.2d, v1.d[0]

# qhasm: 2x vec_tmp3 = vec_F4_F5_G4_G5[0/2]
# asm 1: dup <vec_tmp3=reg128#25.2d, <vec_F4_F5_G4_G5=reg128#3.d[0]
# asm 2: dup <vec_tmp3=v24.2d, <vec_F4_F5_G4_G5=v2.d[0]
dup v24.2d, v2.d[0]

# qhasm: 2x vec_tmp4 = vec_F6_F7_G6_G7[0/2]
# asm 1: dup <vec_tmp4=reg128#26.2d, <vec_F6_F7_G6_G7=reg128#4.d[0]
# asm 2: dup <vec_tmp4=v25.2d, <vec_F6_F7_G6_G7=v3.d[0]
dup v25.2d, v3.d[0]

# qhasm: 2x vec_tmp5 = vec_F8_0_G8_0[0/2]
# asm 1: dup <vec_tmp5=reg128#27.2d, <vec_F8_0_G8_0=reg128#5.d[0]
# asm 2: dup <vec_tmp5=v26.2d, <vec_F8_0_G8_0=v4.d[0]
dup v26.2d, v4.d[0]

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#23.2d, <vec_tmp1=reg128#23.2d, #2
# asm 2: shl >vec_tmp1=v22.2d, <vec_tmp1=v22.2d, #2
shl v22.2d, v22.2d, #2

# qhasm: 2x vec_tmp2 <<= 2
# asm 1: shl >vec_tmp2=reg128#24.2d, <vec_tmp2=reg128#24.2d, #2
# asm 2: shl >vec_tmp2=v23.2d, <vec_tmp2=v23.2d, #2
shl v23.2d, v23.2d, #2

# qhasm: 2x vec_tmp3 <<= 2
# asm 1: shl >vec_tmp3=reg128#25.2d, <vec_tmp3=reg128#25.2d, #2
# asm 2: shl >vec_tmp3=v24.2d, <vec_tmp3=v24.2d, #2
shl v24.2d, v24.2d, #2

# qhasm: 2x vec_tmp4 <<= 2
# asm 1: shl >vec_tmp4=reg128#26.2d, <vec_tmp4=reg128#26.2d, #2
# asm 2: shl >vec_tmp4=v25.2d, <vec_tmp4=v25.2d, #2
shl v25.2d, v25.2d, #2

# qhasm: 2x vec_tmp5 <<= 2
# asm 1: shl >vec_tmp5=reg128#27.2d, <vec_tmp5=reg128#27.2d, #2
# asm 2: shl >vec_tmp5=v26.2d, <vec_tmp5=v26.2d, #2
shl v26.2d, v26.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#28.16b, <vec_tmp1=reg128#23.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v27.16b, <vec_tmp1=v22.16b, <vec_MASKcarry1=v15.16b
and v27.16b, v22.16b, v15.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#23.16b, <vec_tmp1=reg128#23.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp1=v22.16b, <vec_tmp1=v22.16b, <vec_MASKcarry1=v15.16b
bic v22.16b, v22.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#28.2d, <vec_carry1=reg128#28.2d, #2
# asm 2: shl >vec_carry1=v27.2d, <vec_carry1=v27.2d, #2
shl v27.2d, v27.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#23.16b, <vec_tmp1=reg128#23.16b, <vec_carry1=reg128#28.16b
# asm 2: orr <vec_tmp1=v22.16b, <vec_tmp1=v22.16b, <vec_carry1=v27.16b
orr v22.16b, v22.16b, v27.16b

# qhasm: vec_carry2 = vec_tmp1 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#28.16b, <vec_tmp1=reg128#23.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v27.16b, <vec_tmp1=v22.16b, <vec_MASKcarry2=v16.16b
and v27.16b, v22.16b, v16.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp1=reg128#23.16b, <vec_tmp1=reg128#23.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_tmp1=v22.16b, <vec_tmp1=v22.16b, <vec_MASKcarry2=v16.16b
bic v22.16b, v22.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#28.2d, <vec_carry2=reg128#28.2d, #62
# asm 2: ushr >vec_carry2=v27.2d, <vec_carry2=v27.2d, #62
ushr v27.2d, v27.2d, #62

# qhasm: vec_tmp2 |= vec_carry2
# asm 1: orr <vec_tmp2=reg128#24.16b, <vec_tmp2=reg128#24.16b, <vec_carry2=reg128#28.16b
# asm 2: orr <vec_tmp2=v23.16b, <vec_tmp2=v23.16b, <vec_carry2=v27.16b
orr v23.16b, v23.16b, v27.16b

# qhasm: vec_carry1 = vec_tmp2 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#28.16b, <vec_tmp2=reg128#24.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v27.16b, <vec_tmp2=v23.16b, <vec_MASKcarry1=v15.16b
and v27.16b, v23.16b, v15.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp2=reg128#24.16b, <vec_tmp2=reg128#24.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp2=v23.16b, <vec_tmp2=v23.16b, <vec_MASKcarry1=v15.16b
bic v23.16b, v23.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#28.2d, <vec_carry1=reg128#28.2d, #2
# asm 2: shl >vec_carry1=v27.2d, <vec_carry1=v27.2d, #2
shl v27.2d, v27.2d, #2

# qhasm: vec_tmp2 |= vec_carry1
# asm 1: orr <vec_tmp2=reg128#24.16b, <vec_tmp2=reg128#24.16b, <vec_carry1=reg128#28.16b
# asm 2: orr <vec_tmp2=v23.16b, <vec_tmp2=v23.16b, <vec_carry1=v27.16b
orr v23.16b, v23.16b, v27.16b

# qhasm: vec_carry2 = vec_tmp2 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#28.16b, <vec_tmp2=reg128#24.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v27.16b, <vec_tmp2=v23.16b, <vec_MASKcarry2=v16.16b
and v27.16b, v23.16b, v16.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp2=reg128#24.16b, <vec_tmp2=reg128#24.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_tmp2=v23.16b, <vec_tmp2=v23.16b, <vec_MASKcarry2=v16.16b
bic v23.16b, v23.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#28.2d, <vec_carry2=reg128#28.2d, #62
# asm 2: ushr >vec_carry2=v27.2d, <vec_carry2=v27.2d, #62
ushr v27.2d, v27.2d, #62

# qhasm: vec_tmp3 |= vec_carry2
# asm 1: orr <vec_tmp3=reg128#25.16b, <vec_tmp3=reg128#25.16b, <vec_carry2=reg128#28.16b
# asm 2: orr <vec_tmp3=v24.16b, <vec_tmp3=v24.16b, <vec_carry2=v27.16b
orr v24.16b, v24.16b, v27.16b

# qhasm: vec_carry1 = vec_tmp3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#28.16b, <vec_tmp3=reg128#25.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v27.16b, <vec_tmp3=v24.16b, <vec_MASKcarry1=v15.16b
and v27.16b, v24.16b, v15.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp3=reg128#25.16b, <vec_tmp3=reg128#25.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp3=v24.16b, <vec_tmp3=v24.16b, <vec_MASKcarry1=v15.16b
bic v24.16b, v24.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#28.2d, <vec_carry1=reg128#28.2d, #2
# asm 2: shl >vec_carry1=v27.2d, <vec_carry1=v27.2d, #2
shl v27.2d, v27.2d, #2

# qhasm: vec_tmp3 |= vec_carry1
# asm 1: orr <vec_tmp3=reg128#25.16b, <vec_tmp3=reg128#25.16b, <vec_carry1=reg128#28.16b
# asm 2: orr <vec_tmp3=v24.16b, <vec_tmp3=v24.16b, <vec_carry1=v27.16b
orr v24.16b, v24.16b, v27.16b

# qhasm: vec_carry2 = vec_tmp3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#28.16b, <vec_tmp3=reg128#25.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v27.16b, <vec_tmp3=v24.16b, <vec_MASKcarry2=v16.16b
and v27.16b, v24.16b, v16.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp3=reg128#25.16b, <vec_tmp3=reg128#25.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_tmp3=v24.16b, <vec_tmp3=v24.16b, <vec_MASKcarry2=v16.16b
bic v24.16b, v24.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#28.2d, <vec_carry2=reg128#28.2d, #62
# asm 2: ushr >vec_carry2=v27.2d, <vec_carry2=v27.2d, #62
ushr v27.2d, v27.2d, #62

# qhasm: vec_tmp4 |= vec_carry2
# asm 1: orr <vec_tmp4=reg128#26.16b, <vec_tmp4=reg128#26.16b, <vec_carry2=reg128#28.16b
# asm 2: orr <vec_tmp4=v25.16b, <vec_tmp4=v25.16b, <vec_carry2=v27.16b
orr v25.16b, v25.16b, v27.16b

# qhasm: vec_carry1 = vec_tmp4 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#28.16b, <vec_tmp4=reg128#26.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v27.16b, <vec_tmp4=v25.16b, <vec_MASKcarry1=v15.16b
and v27.16b, v25.16b, v15.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp4=reg128#26.16b, <vec_tmp4=reg128#26.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp4=v25.16b, <vec_tmp4=v25.16b, <vec_MASKcarry1=v15.16b
bic v25.16b, v25.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#28.2d, <vec_carry1=reg128#28.2d, #2
# asm 2: shl >vec_carry1=v27.2d, <vec_carry1=v27.2d, #2
shl v27.2d, v27.2d, #2

# qhasm: vec_tmp4 |= vec_carry1
# asm 1: orr <vec_tmp4=reg128#26.16b, <vec_tmp4=reg128#26.16b, <vec_carry1=reg128#28.16b
# asm 2: orr <vec_tmp4=v25.16b, <vec_tmp4=v25.16b, <vec_carry1=v27.16b
orr v25.16b, v25.16b, v27.16b

# qhasm: vec_carry2 = vec_tmp4 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#28.16b, <vec_tmp4=reg128#26.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v27.16b, <vec_tmp4=v25.16b, <vec_MASKcarry2=v16.16b
and v27.16b, v25.16b, v16.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp4=reg128#26.16b, <vec_tmp4=reg128#26.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_tmp4=v25.16b, <vec_tmp4=v25.16b, <vec_MASKcarry2=v16.16b
bic v25.16b, v25.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#28.2d, <vec_carry2=reg128#28.2d, #62
# asm 2: ushr >vec_carry2=v27.2d, <vec_carry2=v27.2d, #62
ushr v27.2d, v27.2d, #62

# qhasm: vec_tmp5 |= vec_carry2
# asm 1: orr <vec_tmp5=reg128#27.16b, <vec_tmp5=reg128#27.16b, <vec_carry2=reg128#28.16b
# asm 2: orr <vec_tmp5=v26.16b, <vec_tmp5=v26.16b, <vec_carry2=v27.16b
orr v26.16b, v26.16b, v27.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry
# asm 1: eor <vec_tmp1=reg128#23.16b, <vec_tmp1=reg128#23.16b, <vec_MASKcarry=reg128#18.16b
# asm 2: eor <vec_tmp1=v22.16b, <vec_tmp1=v22.16b, <vec_MASKcarry=v17.16b
eor v22.16b, v22.16b, v17.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#23.16b, <vec_tmp1=reg128#23.16b
# asm 2: not >vec_tmp1=v22.16b, <vec_tmp1=v22.16b
not v22.16b, v22.16b

# qhasm: vec_tmp2 ^= vec_MASKcarry
# asm 1: eor <vec_tmp2=reg128#24.16b, <vec_tmp2=reg128#24.16b, <vec_MASKcarry=reg128#18.16b
# asm 2: eor <vec_tmp2=v23.16b, <vec_tmp2=v23.16b, <vec_MASKcarry=v17.16b
eor v23.16b, v23.16b, v17.16b

# qhasm: vec_tmp2 = ~vec_tmp2
# asm 1: not >vec_tmp2=reg128#24.16b, <vec_tmp2=reg128#24.16b
# asm 2: not >vec_tmp2=v23.16b, <vec_tmp2=v23.16b
not v23.16b, v23.16b

# qhasm: vec_tmp3 ^= vec_MASKcarry
# asm 1: eor <vec_tmp3=reg128#25.16b, <vec_tmp3=reg128#25.16b, <vec_MASKcarry=reg128#18.16b
# asm 2: eor <vec_tmp3=v24.16b, <vec_tmp3=v24.16b, <vec_MASKcarry=v17.16b
eor v24.16b, v24.16b, v17.16b

# qhasm: vec_tmp3 = ~vec_tmp3
# asm 1: not >vec_tmp3=reg128#25.16b, <vec_tmp3=reg128#25.16b
# asm 2: not >vec_tmp3=v24.16b, <vec_tmp3=v24.16b
not v24.16b, v24.16b

# qhasm: vec_tmp4 ^= vec_MASKcarry
# asm 1: eor <vec_tmp4=reg128#26.16b, <vec_tmp4=reg128#26.16b, <vec_MASKcarry=reg128#18.16b
# asm 2: eor <vec_tmp4=v25.16b, <vec_tmp4=v25.16b, <vec_MASKcarry=v17.16b
eor v25.16b, v25.16b, v17.16b

# qhasm: vec_tmp4 = ~vec_tmp4
# asm 1: not >vec_tmp4=reg128#26.16b, <vec_tmp4=reg128#26.16b
# asm 2: not >vec_tmp4=v25.16b, <vec_tmp4=v25.16b
not v25.16b, v25.16b

# qhasm: vec_tmp5 ^= vec_MASKhalfeffect
# asm 1: eor <vec_tmp5=reg128#27.16b, <vec_tmp5=reg128#27.16b, <vec_MASKhalfeffect=reg128#21.16b
# asm 2: eor <vec_tmp5=v26.16b, <vec_tmp5=v26.16b, <vec_MASKhalfeffect=v20.16b
eor v26.16b, v26.16b, v20.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#23.2d, <vec_tmp1=reg128#23.2d, <vec_ONE=reg128#20.2d
# asm 2: add <vec_tmp1=v22.2d, <vec_tmp1=v22.2d, <vec_ONE=v19.2d
add v22.2d, v22.2d, v19.2d

# qhasm: vec_tmp1 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp1=reg128#23.16b, <vec_tmp1=reg128#23.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp1=v22.16b, <vec_tmp1=v22.16b, <vec_uuhat_rrhat=v8.16b
and v22.16b, v22.16b, v8.16b

# qhasm: vec_tmp2 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp2=reg128#24.16b, <vec_tmp2=reg128#24.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp2=v23.16b, <vec_tmp2=v23.16b, <vec_uuhat_rrhat=v8.16b
and v23.16b, v23.16b, v8.16b

# qhasm: vec_tmp3 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp3=reg128#25.16b, <vec_tmp3=reg128#25.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp3=v24.16b, <vec_tmp3=v24.16b, <vec_uuhat_rrhat=v8.16b
and v24.16b, v24.16b, v8.16b

# qhasm: vec_tmp4 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp4=reg128#26.16b, <vec_tmp4=reg128#26.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp4=v25.16b, <vec_tmp4=v25.16b, <vec_uuhat_rrhat=v8.16b
and v25.16b, v25.16b, v8.16b

# qhasm: vec_tmp5 &= vec_uuhat_rrhat
# asm 1: and <vec_tmp5=reg128#27.16b, <vec_tmp5=reg128#27.16b, <vec_uuhat_rrhat=reg128#9.16b
# asm 2: and <vec_tmp5=v26.16b, <vec_tmp5=v26.16b, <vec_uuhat_rrhat=v8.16b
and v26.16b, v26.16b, v8.16b

# qhasm: 2x vec_R2_R3_S2_S3 += vec_tmp1
# asm 1: add <vec_R2_R3_S2_S3=reg128#13.2d, <vec_R2_R3_S2_S3=reg128#13.2d, <vec_tmp1=reg128#23.2d
# asm 2: add <vec_R2_R3_S2_S3=v12.2d, <vec_R2_R3_S2_S3=v12.2d, <vec_tmp1=v22.2d
add v12.2d, v12.2d, v22.2d

# qhasm: 2x vec_R4_R5_S4_S5 += vec_tmp2
# asm 1: add <vec_R4_R5_S4_S5=reg128#14.2d, <vec_R4_R5_S4_S5=reg128#14.2d, <vec_tmp2=reg128#24.2d
# asm 2: add <vec_R4_R5_S4_S5=v13.2d, <vec_R4_R5_S4_S5=v13.2d, <vec_tmp2=v23.2d
add v13.2d, v13.2d, v23.2d

# qhasm: 2x vec_R6_R7_S6_S7 += vec_tmp3
# asm 1: add <vec_R6_R7_S6_S7=reg128#15.2d, <vec_R6_R7_S6_S7=reg128#15.2d, <vec_tmp3=reg128#25.2d
# asm 2: add <vec_R6_R7_S6_S7=v14.2d, <vec_R6_R7_S6_S7=v14.2d, <vec_tmp3=v24.2d
add v14.2d, v14.2d, v24.2d

# qhasm: 2x vec_R8_R9_S8_S9 += vec_tmp4
# asm 1: add <vec_R8_R9_S8_S9=reg128#12.2d, <vec_R8_R9_S8_S9=reg128#12.2d, <vec_tmp4=reg128#26.2d
# asm 2: add <vec_R8_R9_S8_S9=v11.2d, <vec_R8_R9_S8_S9=v11.2d, <vec_tmp4=v25.2d
add v11.2d, v11.2d, v25.2d

# qhasm: 2x vec_R10_0_S10_0 += vec_tmp5
# asm 1: add <vec_R10_0_S10_0=reg128#11.2d, <vec_R10_0_S10_0=reg128#11.2d, <vec_tmp5=reg128#27.2d
# asm 2: add <vec_R10_0_S10_0=v10.2d, <vec_R10_0_S10_0=v10.2d, <vec_tmp5=v26.2d
add v10.2d, v10.2d, v26.2d

# qhasm: 2x vec_tmp1 = vec_F0_F1_G0_G1[1/2]
# asm 1: dup <vec_tmp1=reg128#23.2d, <vec_F0_F1_G0_G1=reg128#1.d[1]
# asm 2: dup <vec_tmp1=v22.2d, <vec_F0_F1_G0_G1=v0.d[1]
dup v22.2d, v0.d[1]

# qhasm: 2x vec_tmp2 = vec_F2_F3_G2_G3[1/2]
# asm 1: dup <vec_tmp2=reg128#24.2d, <vec_F2_F3_G2_G3=reg128#2.d[1]
# asm 2: dup <vec_tmp2=v23.2d, <vec_F2_F3_G2_G3=v1.d[1]
dup v23.2d, v1.d[1]

# qhasm: 2x vec_tmp3 = vec_F4_F5_G4_G5[1/2]
# asm 1: dup <vec_tmp3=reg128#25.2d, <vec_F4_F5_G4_G5=reg128#3.d[1]
# asm 2: dup <vec_tmp3=v24.2d, <vec_F4_F5_G4_G5=v2.d[1]
dup v24.2d, v2.d[1]

# qhasm: 2x vec_tmp4 = vec_F6_F7_G6_G7[1/2]
# asm 1: dup <vec_tmp4=reg128#26.2d, <vec_F6_F7_G6_G7=reg128#4.d[1]
# asm 2: dup <vec_tmp4=v25.2d, <vec_F6_F7_G6_G7=v3.d[1]
dup v25.2d, v3.d[1]

# qhasm: 2x vec_tmp5 = vec_F8_0_G8_0[1/2]
# asm 1: dup <vec_tmp5=reg128#27.2d, <vec_F8_0_G8_0=reg128#5.d[1]
# asm 2: dup <vec_tmp5=v26.2d, <vec_F8_0_G8_0=v4.d[1]
dup v26.2d, v4.d[1]

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#23.2d, #2
# asm 2: shl >vec_tmp1=v0.2d, <vec_tmp1=v22.2d, #2
shl v0.2d, v22.2d, #2

# qhasm: 2x vec_tmp2 <<= 2
# asm 1: shl >vec_tmp2=reg128#2.2d, <vec_tmp2=reg128#24.2d, #2
# asm 2: shl >vec_tmp2=v1.2d, <vec_tmp2=v23.2d, #2
shl v1.2d, v23.2d, #2

# qhasm: 2x vec_tmp3 <<= 2
# asm 1: shl >vec_tmp3=reg128#3.2d, <vec_tmp3=reg128#25.2d, #2
# asm 2: shl >vec_tmp3=v2.2d, <vec_tmp3=v24.2d, #2
shl v2.2d, v24.2d, #2

# qhasm: 2x vec_tmp4 <<= 2
# asm 1: shl >vec_tmp4=reg128#4.2d, <vec_tmp4=reg128#26.2d, #2
# asm 2: shl >vec_tmp4=v3.2d, <vec_tmp4=v25.2d, #2
shl v3.2d, v25.2d, #2

# qhasm: 2x vec_tmp5 <<= 2
# asm 1: shl >vec_tmp5=reg128#9.2d, <vec_tmp5=reg128#27.2d, #2
# asm 2: shl >vec_tmp5=v8.2d, <vec_tmp5=v26.2d, #2
shl v8.2d, v26.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#23.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v22.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v15.16b
and v22.16b, v0.16b, v15.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry1=v15.16b
bic v0.16b, v0.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#23.2d, <vec_carry1=reg128#23.2d, #2
# asm 2: shl >vec_carry1=v22.2d, <vec_carry1=v22.2d, #2
shl v22.2d, v22.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_carry1=reg128#23.16b
# asm 2: orr <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_carry1=v22.16b
orr v0.16b, v0.16b, v22.16b

# qhasm: vec_carry2 = vec_tmp1 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#23.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v22.16b, <vec_tmp1=v0.16b, <vec_MASKcarry2=v16.16b
and v22.16b, v0.16b, v16.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry2=v16.16b
bic v0.16b, v0.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#23.2d, <vec_carry2=reg128#23.2d, #62
# asm 2: ushr >vec_carry2=v22.2d, <vec_carry2=v22.2d, #62
ushr v22.2d, v22.2d, #62

# qhasm: vec_tmp2 |= vec_carry2
# asm 1: orr <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_carry2=reg128#23.16b
# asm 2: orr <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_carry2=v22.16b
orr v1.16b, v1.16b, v22.16b

# qhasm: vec_carry1 = vec_tmp2 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#23.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v22.16b, <vec_tmp2=v1.16b, <vec_MASKcarry1=v15.16b
and v22.16b, v1.16b, v15.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_MASKcarry1=v15.16b
bic v1.16b, v1.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#23.2d, <vec_carry1=reg128#23.2d, #2
# asm 2: shl >vec_carry1=v22.2d, <vec_carry1=v22.2d, #2
shl v22.2d, v22.2d, #2

# qhasm: vec_tmp2 |= vec_carry1
# asm 1: orr <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_carry1=reg128#23.16b
# asm 2: orr <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_carry1=v22.16b
orr v1.16b, v1.16b, v22.16b

# qhasm: vec_carry2 = vec_tmp2 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#23.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v22.16b, <vec_tmp2=v1.16b, <vec_MASKcarry2=v16.16b
and v22.16b, v1.16b, v16.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_MASKcarry2=v16.16b
bic v1.16b, v1.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#23.2d, <vec_carry2=reg128#23.2d, #62
# asm 2: ushr >vec_carry2=v22.2d, <vec_carry2=v22.2d, #62
ushr v22.2d, v22.2d, #62

# qhasm: vec_tmp3 |= vec_carry2
# asm 1: orr <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_carry2=reg128#23.16b
# asm 2: orr <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_carry2=v22.16b
orr v2.16b, v2.16b, v22.16b

# qhasm: vec_carry1 = vec_tmp3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#23.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v22.16b, <vec_tmp3=v2.16b, <vec_MASKcarry1=v15.16b
and v22.16b, v2.16b, v15.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_MASKcarry1=v15.16b
bic v2.16b, v2.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#23.2d, <vec_carry1=reg128#23.2d, #2
# asm 2: shl >vec_carry1=v22.2d, <vec_carry1=v22.2d, #2
shl v22.2d, v22.2d, #2

# qhasm: vec_tmp3 |= vec_carry1
# asm 1: orr <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_carry1=reg128#23.16b
# asm 2: orr <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_carry1=v22.16b
orr v2.16b, v2.16b, v22.16b

# qhasm: vec_carry2 = vec_tmp3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#23.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v22.16b, <vec_tmp3=v2.16b, <vec_MASKcarry2=v16.16b
and v22.16b, v2.16b, v16.16b

# qhasm: vec_tmp3 = vec_tmp3 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_MASKcarry2=v16.16b
bic v2.16b, v2.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#23.2d, <vec_carry2=reg128#23.2d, #62
# asm 2: ushr >vec_carry2=v22.2d, <vec_carry2=v22.2d, #62
ushr v22.2d, v22.2d, #62

# qhasm: vec_tmp4 |= vec_carry2
# asm 1: orr <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_carry2=reg128#23.16b
# asm 2: orr <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_carry2=v22.16b
orr v3.16b, v3.16b, v22.16b

# qhasm: vec_carry1 = vec_tmp4 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#23.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v22.16b, <vec_tmp4=v3.16b, <vec_MASKcarry1=v15.16b
and v22.16b, v3.16b, v15.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_MASKcarry1=v15.16b
bic v3.16b, v3.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#23.2d, <vec_carry1=reg128#23.2d, #2
# asm 2: shl >vec_carry1=v22.2d, <vec_carry1=v22.2d, #2
shl v22.2d, v22.2d, #2

# qhasm: vec_tmp4 |= vec_carry1
# asm 1: orr <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_carry1=reg128#23.16b
# asm 2: orr <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_carry1=v22.16b
orr v3.16b, v3.16b, v22.16b

# qhasm: vec_carry2 = vec_tmp4 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#23.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v22.16b, <vec_tmp4=v3.16b, <vec_MASKcarry2=v16.16b
and v22.16b, v3.16b, v16.16b

# qhasm: vec_tmp4 = vec_tmp4 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_MASKcarry2=v16.16b
bic v3.16b, v3.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#23.2d, <vec_carry2=reg128#23.2d, #62
# asm 2: ushr >vec_carry2=v22.2d, <vec_carry2=v22.2d, #62
ushr v22.2d, v22.2d, #62

# qhasm: vec_tmp5 |= vec_carry2
# asm 1: orr <vec_tmp5=reg128#9.16b, <vec_tmp5=reg128#9.16b, <vec_carry2=reg128#23.16b
# asm 2: orr <vec_tmp5=v8.16b, <vec_tmp5=v8.16b, <vec_carry2=v22.16b
orr v8.16b, v8.16b, v22.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry
# asm 1: eor <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_MASKcarry=reg128#18.16b
# asm 2: eor <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_MASKcarry=v17.16b
eor v0.16b, v0.16b, v17.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b
# asm 2: not >vec_tmp1=v0.16b, <vec_tmp1=v0.16b
not v0.16b, v0.16b

# qhasm: vec_tmp2 ^= vec_MASKcarry
# asm 1: eor <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_MASKcarry=reg128#18.16b
# asm 2: eor <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_MASKcarry=v17.16b
eor v1.16b, v1.16b, v17.16b

# qhasm: vec_tmp2 = ~vec_tmp2
# asm 1: not >vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b
# asm 2: not >vec_tmp2=v1.16b, <vec_tmp2=v1.16b
not v1.16b, v1.16b

# qhasm: vec_tmp3 ^= vec_MASKcarry
# asm 1: eor <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_MASKcarry=reg128#18.16b
# asm 2: eor <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_MASKcarry=v17.16b
eor v2.16b, v2.16b, v17.16b

# qhasm: vec_tmp3 = ~vec_tmp3
# asm 1: not >vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b
# asm 2: not >vec_tmp3=v2.16b, <vec_tmp3=v2.16b
not v2.16b, v2.16b

# qhasm: vec_tmp4 ^= vec_MASKcarry
# asm 1: eor <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_MASKcarry=reg128#18.16b
# asm 2: eor <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_MASKcarry=v17.16b
eor v3.16b, v3.16b, v17.16b

# qhasm: vec_tmp4 = ~vec_tmp4
# asm 1: not >vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b
# asm 2: not >vec_tmp4=v3.16b, <vec_tmp4=v3.16b
not v3.16b, v3.16b

# qhasm: vec_tmp5 ^= vec_MASKhalfeffect
# asm 1: eor <vec_tmp5=reg128#9.16b, <vec_tmp5=reg128#9.16b, <vec_MASKhalfeffect=reg128#21.16b
# asm 2: eor <vec_tmp5=v8.16b, <vec_tmp5=v8.16b, <vec_MASKhalfeffect=v20.16b
eor v8.16b, v8.16b, v20.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#1.2d, <vec_tmp1=reg128#1.2d, <vec_ONE=reg128#20.2d
# asm 2: add <vec_tmp1=v0.2d, <vec_tmp1=v0.2d, <vec_ONE=v19.2d
add v0.2d, v0.2d, v19.2d

# qhasm: vec_tmp1 &= vec_vvhat_sshat
# asm 1: and <vec_tmp1=reg128#1.16b, <vec_tmp1=reg128#1.16b, <vec_vvhat_sshat=reg128#10.16b
# asm 2: and <vec_tmp1=v0.16b, <vec_tmp1=v0.16b, <vec_vvhat_sshat=v9.16b
and v0.16b, v0.16b, v9.16b

# qhasm: vec_tmp2 &= vec_vvhat_sshat
# asm 1: and <vec_tmp2=reg128#2.16b, <vec_tmp2=reg128#2.16b, <vec_vvhat_sshat=reg128#10.16b
# asm 2: and <vec_tmp2=v1.16b, <vec_tmp2=v1.16b, <vec_vvhat_sshat=v9.16b
and v1.16b, v1.16b, v9.16b

# qhasm: vec_tmp3 &= vec_vvhat_sshat
# asm 1: and <vec_tmp3=reg128#3.16b, <vec_tmp3=reg128#3.16b, <vec_vvhat_sshat=reg128#10.16b
# asm 2: and <vec_tmp3=v2.16b, <vec_tmp3=v2.16b, <vec_vvhat_sshat=v9.16b
and v2.16b, v2.16b, v9.16b

# qhasm: vec_tmp4 &= vec_vvhat_sshat
# asm 1: and <vec_tmp4=reg128#4.16b, <vec_tmp4=reg128#4.16b, <vec_vvhat_sshat=reg128#10.16b
# asm 2: and <vec_tmp4=v3.16b, <vec_tmp4=v3.16b, <vec_vvhat_sshat=v9.16b
and v3.16b, v3.16b, v9.16b

# qhasm: vec_tmp5 &= vec_vvhat_sshat
# asm 1: and <vec_tmp5=reg128#9.16b, <vec_tmp5=reg128#9.16b, <vec_vvhat_sshat=reg128#10.16b
# asm 2: and <vec_tmp5=v8.16b, <vec_tmp5=v8.16b, <vec_vvhat_sshat=v9.16b
and v8.16b, v8.16b, v9.16b

# qhasm: reg128 vec_F8_F9_G8_G9

# qhasm: reg128 vec_F10_0_G10_0

# qhasm: 2x vec_F2_F3_G2_G3 = vec_R2_R3_S2_S3 + vec_tmp1
# asm 1: add >vec_F2_F3_G2_G3=reg128#1.2d, <vec_R2_R3_S2_S3=reg128#13.2d, <vec_tmp1=reg128#1.2d
# asm 2: add >vec_F2_F3_G2_G3=v0.2d, <vec_R2_R3_S2_S3=v12.2d, <vec_tmp1=v0.2d
add v0.2d, v12.2d, v0.2d

# qhasm: 2x vec_F4_F5_G4_G5 = vec_R4_R5_S4_S5 + vec_tmp2
# asm 1: add >vec_F4_F5_G4_G5=reg128#2.2d, <vec_R4_R5_S4_S5=reg128#14.2d, <vec_tmp2=reg128#2.2d
# asm 2: add >vec_F4_F5_G4_G5=v1.2d, <vec_R4_R5_S4_S5=v13.2d, <vec_tmp2=v1.2d
add v1.2d, v13.2d, v1.2d

# qhasm: 2x vec_F6_F7_G6_G7 = vec_R6_R7_S6_S7 + vec_tmp3
# asm 1: add >vec_F6_F7_G6_G7=reg128#3.2d, <vec_R6_R7_S6_S7=reg128#15.2d, <vec_tmp3=reg128#3.2d
# asm 2: add >vec_F6_F7_G6_G7=v2.2d, <vec_R6_R7_S6_S7=v14.2d, <vec_tmp3=v2.2d
add v2.2d, v14.2d, v2.2d

# qhasm: 2x vec_F8_F9_G8_G9 = vec_R8_R9_S8_S9 + vec_tmp4
# asm 1: add >vec_F8_F9_G8_G9=reg128#4.2d, <vec_R8_R9_S8_S9=reg128#12.2d, <vec_tmp4=reg128#4.2d
# asm 2: add >vec_F8_F9_G8_G9=v3.2d, <vec_R8_R9_S8_S9=v11.2d, <vec_tmp4=v3.2d
add v3.2d, v11.2d, v3.2d

# qhasm: 2x vec_F10_0_G10_0 = vec_R10_0_S10_0 + vec_tmp5
# asm 1: add >vec_F10_0_G10_0=reg128#9.2d, <vec_R10_0_S10_0=reg128#11.2d, <vec_tmp5=reg128#9.2d
# asm 2: add >vec_F10_0_G10_0=v8.2d, <vec_R10_0_S10_0=v10.2d, <vec_tmp5=v8.2d
add v8.2d, v10.2d, v8.2d

# qhasm: vec_carry1 = vec_F2_F3_G2_G3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#10.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v9.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_MASKcarry1=v15.16b
and v9.16b, v0.16b, v15.16b

# qhasm: vec_F2_F3_G2_G3 = vec_F2_F3_G2_G3 & ~vec_MASKcarry1
# asm 1: bic >vec_F2_F3_G2_G3=reg128#1.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_F2_F3_G2_G3=v0.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_MASKcarry1=v15.16b
bic v0.16b, v0.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#10.2d, <vec_carry1=reg128#10.2d, #2
# asm 2: shl >vec_carry1=v9.2d, <vec_carry1=v9.2d, #2
shl v9.2d, v9.2d, #2

# qhasm: 2x vec_F2_F3_G2_G3 += vec_carry1
# asm 1: add <vec_F2_F3_G2_G3=reg128#1.2d, <vec_F2_F3_G2_G3=reg128#1.2d, <vec_carry1=reg128#10.2d
# asm 2: add <vec_F2_F3_G2_G3=v0.2d, <vec_F2_F3_G2_G3=v0.2d, <vec_carry1=v9.2d
add v0.2d, v0.2d, v9.2d

# qhasm: vec_carry2 = vec_F2_F3_G2_G3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#10.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v9.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_MASKcarry2=v16.16b
and v9.16b, v0.16b, v16.16b

# qhasm: vec_F2_F3_G2_G3 = vec_F2_F3_G2_G3 & ~vec_MASKcarry2
# asm 1: bic >vec_F2_F3_G2_G3=reg128#1.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_F2_F3_G2_G3=v0.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_MASKcarry2=v16.16b
bic v0.16b, v0.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#10.2d, <vec_carry2=reg128#10.2d, #62
# asm 2: ushr >vec_carry2=v9.2d, <vec_carry2=v9.2d, #62
ushr v9.2d, v9.2d, #62

# qhasm: 2x vec_F4_F5_G4_G5 += vec_carry2
# asm 1: add <vec_F4_F5_G4_G5=reg128#2.2d, <vec_F4_F5_G4_G5=reg128#2.2d, <vec_carry2=reg128#10.2d
# asm 2: add <vec_F4_F5_G4_G5=v1.2d, <vec_F4_F5_G4_G5=v1.2d, <vec_carry2=v9.2d
add v1.2d, v1.2d, v9.2d

# qhasm: vec_carry1 = vec_F4_F5_G4_G5 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#10.16b, <vec_F4_F5_G4_G5=reg128#2.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v9.16b, <vec_F4_F5_G4_G5=v1.16b, <vec_MASKcarry1=v15.16b
and v9.16b, v1.16b, v15.16b

# qhasm: vec_F4_F5_G4_G5 = vec_F4_F5_G4_G5 & ~vec_MASKcarry1
# asm 1: bic >vec_F4_F5_G4_G5=reg128#2.16b, <vec_F4_F5_G4_G5=reg128#2.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_F4_F5_G4_G5=v1.16b, <vec_F4_F5_G4_G5=v1.16b, <vec_MASKcarry1=v15.16b
bic v1.16b, v1.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#10.2d, <vec_carry1=reg128#10.2d, #2
# asm 2: shl >vec_carry1=v9.2d, <vec_carry1=v9.2d, #2
shl v9.2d, v9.2d, #2

# qhasm: 2x vec_F4_F5_G4_G5 += vec_carry1
# asm 1: add <vec_F4_F5_G4_G5=reg128#2.2d, <vec_F4_F5_G4_G5=reg128#2.2d, <vec_carry1=reg128#10.2d
# asm 2: add <vec_F4_F5_G4_G5=v1.2d, <vec_F4_F5_G4_G5=v1.2d, <vec_carry1=v9.2d
add v1.2d, v1.2d, v9.2d

# qhasm: vec_carry2 = vec_F4_F5_G4_G5 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#10.16b, <vec_F4_F5_G4_G5=reg128#2.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v9.16b, <vec_F4_F5_G4_G5=v1.16b, <vec_MASKcarry2=v16.16b
and v9.16b, v1.16b, v16.16b

# qhasm: vec_F4_F5_G4_G5 = vec_F4_F5_G4_G5 & ~vec_MASKcarry2
# asm 1: bic >vec_F4_F5_G4_G5=reg128#2.16b, <vec_F4_F5_G4_G5=reg128#2.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_F4_F5_G4_G5=v1.16b, <vec_F4_F5_G4_G5=v1.16b, <vec_MASKcarry2=v16.16b
bic v1.16b, v1.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#10.2d, <vec_carry2=reg128#10.2d, #62
# asm 2: ushr >vec_carry2=v9.2d, <vec_carry2=v9.2d, #62
ushr v9.2d, v9.2d, #62

# qhasm: 2x vec_F6_F7_G6_G7 += vec_carry2
# asm 1: add <vec_F6_F7_G6_G7=reg128#3.2d, <vec_F6_F7_G6_G7=reg128#3.2d, <vec_carry2=reg128#10.2d
# asm 2: add <vec_F6_F7_G6_G7=v2.2d, <vec_F6_F7_G6_G7=v2.2d, <vec_carry2=v9.2d
add v2.2d, v2.2d, v9.2d

# qhasm: vec_carry1 = vec_F6_F7_G6_G7 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#10.16b, <vec_F6_F7_G6_G7=reg128#3.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v9.16b, <vec_F6_F7_G6_G7=v2.16b, <vec_MASKcarry1=v15.16b
and v9.16b, v2.16b, v15.16b

# qhasm: vec_F6_F7_G6_G7 = vec_F6_F7_G6_G7 & ~vec_MASKcarry1
# asm 1: bic >vec_F6_F7_G6_G7=reg128#3.16b, <vec_F6_F7_G6_G7=reg128#3.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_F6_F7_G6_G7=v2.16b, <vec_F6_F7_G6_G7=v2.16b, <vec_MASKcarry1=v15.16b
bic v2.16b, v2.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#10.2d, <vec_carry1=reg128#10.2d, #2
# asm 2: shl >vec_carry1=v9.2d, <vec_carry1=v9.2d, #2
shl v9.2d, v9.2d, #2

# qhasm: 2x vec_F6_F7_G6_G7 += vec_carry1
# asm 1: add <vec_F6_F7_G6_G7=reg128#3.2d, <vec_F6_F7_G6_G7=reg128#3.2d, <vec_carry1=reg128#10.2d
# asm 2: add <vec_F6_F7_G6_G7=v2.2d, <vec_F6_F7_G6_G7=v2.2d, <vec_carry1=v9.2d
add v2.2d, v2.2d, v9.2d

# qhasm: vec_carry2 = vec_F6_F7_G6_G7 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#10.16b, <vec_F6_F7_G6_G7=reg128#3.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v9.16b, <vec_F6_F7_G6_G7=v2.16b, <vec_MASKcarry2=v16.16b
and v9.16b, v2.16b, v16.16b

# qhasm: vec_F6_F7_G6_G7 = vec_F6_F7_G6_G7 & ~vec_MASKcarry2
# asm 1: bic >vec_F6_F7_G6_G7=reg128#3.16b, <vec_F6_F7_G6_G7=reg128#3.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_F6_F7_G6_G7=v2.16b, <vec_F6_F7_G6_G7=v2.16b, <vec_MASKcarry2=v16.16b
bic v2.16b, v2.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#10.2d, <vec_carry2=reg128#10.2d, #62
# asm 2: ushr >vec_carry2=v9.2d, <vec_carry2=v9.2d, #62
ushr v9.2d, v9.2d, #62

# qhasm: 2x vec_F8_F9_G8_G9 += vec_carry2
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_carry2=reg128#10.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_carry2=v9.2d
add v3.2d, v3.2d, v9.2d

# qhasm: vec_carry1 = vec_F8_F9_G8_G9 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#10.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v9.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry1=v15.16b
and v9.16b, v3.16b, v15.16b

# qhasm: vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry1
# asm 1: bic >vec_F8_F9_G8_G9=reg128#4.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_F8_F9_G8_G9=v3.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry1=v15.16b
bic v3.16b, v3.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#10.2d, <vec_carry1=reg128#10.2d, #2
# asm 2: shl >vec_carry1=v9.2d, <vec_carry1=v9.2d, #2
shl v9.2d, v9.2d, #2

# qhasm: 2x vec_F8_F9_G8_G9 += vec_carry1
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_carry1=reg128#10.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_carry1=v9.2d
add v3.2d, v3.2d, v9.2d

# qhasm: vec_carry2 = vec_F8_F9_G8_G9 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#10.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v9.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry2=v16.16b
and v9.16b, v3.16b, v16.16b

# qhasm: vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry2
# asm 1: bic >vec_F8_F9_G8_G9=reg128#4.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_F8_F9_G8_G9=v3.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry2=v16.16b
bic v3.16b, v3.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#10.2d, <vec_carry2=reg128#10.2d, #62
# asm 2: ushr >vec_carry2=v9.2d, <vec_carry2=v9.2d, #62
ushr v9.2d, v9.2d, #62

# qhasm: 2x vec_F10_0_G10_0 += vec_carry2
# asm 1: add <vec_F10_0_G10_0=reg128#9.2d, <vec_F10_0_G10_0=reg128#9.2d, <vec_carry2=reg128#10.2d
# asm 2: add <vec_F10_0_G10_0=v8.2d, <vec_F10_0_G10_0=v8.2d, <vec_carry2=v9.2d
add v8.2d, v8.2d, v9.2d

# qhasm: reg128 vec_Fhat_0_Ghat_0

# qhasm: reg128 vec_Fhat

# qhasm: reg128 vec_Ghat

# qhasm: 4x vec_Fhat_0_Ghat_0 = vec_F8_0_G8_0 >> 31
# asm 1: sshr <vec_Fhat_0_Ghat_0=reg128#10.4s, <vec_F8_0_G8_0=reg128#5.4s, #31
# asm 2: sshr <vec_Fhat_0_Ghat_0=v9.4s, <vec_F8_0_G8_0=v4.4s, #31
sshr v9.4s, v4.4s, #31

# qhasm: 4x vec_Fhat = vec_Fhat_0_Ghat_0[0/4]
# asm 1: dup <vec_Fhat=reg128#5.4s, <vec_Fhat_0_Ghat_0=reg128#10.s[0]
# asm 2: dup <vec_Fhat=v4.4s, <vec_Fhat_0_Ghat_0=v9.s[0]
dup v4.4s, v9.s[0]

# qhasm: 4x vec_Ghat = vec_Fhat_0_Ghat_0[2/4]
# asm 1: dup <vec_Ghat=reg128#11.4s, <vec_Fhat_0_Ghat_0=reg128#10.s[2]
# asm 2: dup <vec_Ghat=v10.4s, <vec_Fhat_0_Ghat_0=v9.s[2]
dup v10.4s, v9.s[2]

# qhasm: 4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[0/4] vec_uu1_rr1_vv1_ss1[0/4] vec_uu0_rr0_vv0_ss0[1/4] vec_uu1_rr1_vv1_ss1[1/4]
# asm 1: zip1 >vec_tmp1=reg128#10.4s, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s
# asm 2: zip1 >vec_tmp1=v9.4s, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_uu1_rr1_vv1_ss1=v6.4s
zip1 v9.4s, v5.4s, v6.4s

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#10.2d, <vec_tmp1=reg128#10.2d, #2
# asm 2: shl >vec_tmp1=v9.2d, <vec_tmp1=v9.2d, #2
shl v9.2d, v9.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#12.16b, <vec_tmp1=reg128#10.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v11.16b, <vec_tmp1=v9.16b, <vec_MASKcarry1=v15.16b
and v11.16b, v9.16b, v15.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#10.16b, <vec_tmp1=reg128#10.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp1=v9.16b, <vec_tmp1=v9.16b, <vec_MASKcarry1=v15.16b
bic v9.16b, v9.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#12.2d, <vec_carry1=reg128#12.2d, #2
# asm 2: shl >vec_carry1=v11.2d, <vec_carry1=v11.2d, #2
shl v11.2d, v11.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#10.16b, <vec_tmp1=reg128#10.16b, <vec_carry1=reg128#12.16b
# asm 2: orr <vec_tmp1=v9.16b, <vec_tmp1=v9.16b, <vec_carry1=v11.16b
orr v9.16b, v9.16b, v11.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry1
# asm 1: eor <vec_tmp1=reg128#10.16b, <vec_tmp1=reg128#10.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: eor <vec_tmp1=v9.16b, <vec_tmp1=v9.16b, <vec_MASKcarry1=v15.16b
eor v9.16b, v9.16b, v15.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#10.16b, <vec_tmp1=reg128#10.16b
# asm 2: not >vec_tmp1=v9.16b, <vec_tmp1=v9.16b
not v9.16b, v9.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#10.2d, <vec_tmp1=reg128#10.2d, <vec_ONE=reg128#20.2d
# asm 2: add <vec_tmp1=v9.2d, <vec_tmp1=v9.2d, <vec_ONE=v19.2d
add v9.2d, v9.2d, v19.2d

# qhasm: vec_tmp1 &= vec_Fhat
# asm 1: and <vec_tmp1=reg128#10.16b, <vec_tmp1=reg128#10.16b, <vec_Fhat=reg128#5.16b
# asm 2: and <vec_tmp1=v9.16b, <vec_tmp1=v9.16b, <vec_Fhat=v4.16b
and v9.16b, v9.16b, v4.16b

# qhasm: 2x vec_tmp2 = vec_tmp1 << 32
# asm 1: shl >vec_tmp2=reg128#5.2d, <vec_tmp1=reg128#10.2d, #32
# asm 2: shl >vec_tmp2=v4.2d, <vec_tmp1=v9.2d, #32
shl v4.2d, v9.2d, #32

# qhasm: 2x vec_tmp3 = vec_tmp1 unsigned>> 32
# asm 1: ushr >vec_tmp3=reg128#10.2d, <vec_tmp1=reg128#10.2d, #32
# asm 2: ushr >vec_tmp3=v9.2d, <vec_tmp1=v9.2d, #32
ushr v9.2d, v9.2d, #32

# qhasm: 2x vec_F8_F9_G8_G9 += vec_tmp2
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_tmp2=reg128#5.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_tmp2=v4.2d
add v3.2d, v3.2d, v4.2d

# qhasm: 2x vec_F10_0_G10_0 += vec_tmp3
# asm 1: add <vec_F10_0_G10_0=reg128#9.2d, <vec_F10_0_G10_0=reg128#9.2d, <vec_tmp3=reg128#10.2d
# asm 2: add <vec_F10_0_G10_0=v8.2d, <vec_F10_0_G10_0=v8.2d, <vec_tmp3=v9.2d
add v8.2d, v8.2d, v9.2d

# qhasm: 4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[2/4] vec_uu1_rr1_vv1_ss1[2/4] vec_uu0_rr0_vv0_ss0[3/4] vec_uu1_rr1_vv1_ss1[3/4]
# asm 1: zip2 >vec_tmp1=reg128#5.4s, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s
# asm 2: zip2 >vec_tmp1=v4.4s, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_uu1_rr1_vv1_ss1=v6.4s
zip2 v4.4s, v5.4s, v6.4s

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#5.2d, <vec_tmp1=reg128#5.2d, #2
# asm 2: shl >vec_tmp1=v4.2d, <vec_tmp1=v4.2d, #2
shl v4.2d, v4.2d, #2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#10.16b, <vec_tmp1=reg128#5.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v9.16b, <vec_tmp1=v4.16b, <vec_MASKcarry1=v15.16b
and v9.16b, v4.16b, v15.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_MASKcarry1=v15.16b
bic v4.16b, v4.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#10.2d, <vec_carry1=reg128#10.2d, #2
# asm 2: shl >vec_carry1=v9.2d, <vec_carry1=v9.2d, #2
shl v9.2d, v9.2d, #2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_carry1=reg128#10.16b
# asm 2: orr <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_carry1=v9.16b
orr v4.16b, v4.16b, v9.16b

# qhasm: vec_tmp1 ^= vec_MASKcarry1
# asm 1: eor <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: eor <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_MASKcarry1=v15.16b
eor v4.16b, v4.16b, v15.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: not >vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b
# asm 2: not >vec_tmp1=v4.16b, <vec_tmp1=v4.16b
not v4.16b, v4.16b

# qhasm: 2x vec_tmp1 += vec_ONE
# asm 1: add <vec_tmp1=reg128#5.2d, <vec_tmp1=reg128#5.2d, <vec_ONE=reg128#20.2d
# asm 2: add <vec_tmp1=v4.2d, <vec_tmp1=v4.2d, <vec_ONE=v19.2d
add v4.2d, v4.2d, v19.2d

# qhasm: vec_tmp1 &= vec_Ghat
# asm 1: and <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_Ghat=reg128#11.16b
# asm 2: and <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_Ghat=v10.16b
and v4.16b, v4.16b, v10.16b

# qhasm: vec_tmp1 &= vec_Ghat
# asm 1: and <vec_tmp1=reg128#5.16b, <vec_tmp1=reg128#5.16b, <vec_Ghat=reg128#11.16b
# asm 2: and <vec_tmp1=v4.16b, <vec_tmp1=v4.16b, <vec_Ghat=v10.16b
and v4.16b, v4.16b, v10.16b

# qhasm: 2x vec_tmp2 = vec_tmp1 << 32
# asm 1: shl >vec_tmp2=reg128#10.2d, <vec_tmp1=reg128#5.2d, #32
# asm 2: shl >vec_tmp2=v9.2d, <vec_tmp1=v4.2d, #32
shl v9.2d, v4.2d, #32

# qhasm: 2x vec_tmp3 = vec_tmp1 unsigned>> 32
# asm 1: ushr >vec_tmp3=reg128#5.2d, <vec_tmp1=reg128#5.2d, #32
# asm 2: ushr >vec_tmp3=v4.2d, <vec_tmp1=v4.2d, #32
ushr v4.2d, v4.2d, #32

# qhasm: 2x vec_F8_F9_G8_G9 += vec_tmp2
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_tmp2=reg128#10.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_tmp2=v9.2d
add v3.2d, v3.2d, v9.2d

# qhasm: 2x vec_F10_0_G10_0 += vec_tmp3
# asm 1: add <vec_F10_0_G10_0=reg128#9.2d, <vec_F10_0_G10_0=reg128#9.2d, <vec_tmp3=reg128#5.2d
# asm 2: add <vec_F10_0_G10_0=v8.2d, <vec_F10_0_G10_0=v8.2d, <vec_tmp3=v4.2d
add v8.2d, v8.2d, v4.2d

# qhasm: vec_carry1 = vec_F8_F9_G8_G9 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#5.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: and >vec_carry1=v4.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry1=v15.16b
and v4.16b, v3.16b, v15.16b

# qhasm: vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry1
# asm 1: bic >vec_F8_F9_G8_G9=reg128#4.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry1=reg128#16.16b
# asm 2: bic >vec_F8_F9_G8_G9=v3.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry1=v15.16b
bic v3.16b, v3.16b, v15.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#5.2d, <vec_carry1=reg128#5.2d, #2
# asm 2: shl >vec_carry1=v4.2d, <vec_carry1=v4.2d, #2
shl v4.2d, v4.2d, #2

# qhasm: 2x vec_F8_F9_G8_G9 += vec_carry1
# asm 1: add <vec_F8_F9_G8_G9=reg128#4.2d, <vec_F8_F9_G8_G9=reg128#4.2d, <vec_carry1=reg128#5.2d
# asm 2: add <vec_F8_F9_G8_G9=v3.2d, <vec_F8_F9_G8_G9=v3.2d, <vec_carry1=v4.2d
add v3.2d, v3.2d, v4.2d

# qhasm: vec_carry2 = vec_F8_F9_G8_G9 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#5.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: and >vec_carry2=v4.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry2=v16.16b
and v4.16b, v3.16b, v16.16b

# qhasm: vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry2
# asm 1: bic >vec_F8_F9_G8_G9=reg128#4.16b, <vec_F8_F9_G8_G9=reg128#4.16b, <vec_MASKcarry2=reg128#17.16b
# asm 2: bic >vec_F8_F9_G8_G9=v3.16b, <vec_F8_F9_G8_G9=v3.16b, <vec_MASKcarry2=v16.16b
bic v3.16b, v3.16b, v16.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#5.2d, <vec_carry2=reg128#5.2d, #62
# asm 2: ushr >vec_carry2=v4.2d, <vec_carry2=v4.2d, #62
ushr v4.2d, v4.2d, #62

# qhasm: 2x vec_F10_0_G10_0 += vec_carry2
# asm 1: add <vec_F10_0_G10_0=reg128#9.2d, <vec_F10_0_G10_0=reg128#9.2d, <vec_carry2=reg128#5.2d
# asm 2: add <vec_F10_0_G10_0=v8.2d, <vec_F10_0_G10_0=v8.2d, <vec_carry2=v4.2d
add v8.2d, v8.2d, v4.2d

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

# qhasm: mem256[pointer_F] = vec_F2_F3_F4_F5, vec_F6_F7_F8_F9
# asm 1: stp <vec_F2_F3_F4_F5=reg128#5%qregname, <vec_F6_F7_F8_F9=reg128#2%qregname, [<pointer_F=int64#2]
# asm 2: stp <vec_F2_F3_F4_F5=q4, <vec_F6_F7_F8_F9=q1, [<pointer_F=x1]
stp q4, q1, [x1]

# qhasm: mem256[pointer_G] = vec_G2_G3_G4_G5, vec_G6_G7_G8_G9
# asm 1: stp <vec_G2_G3_G4_G5=reg128#1%qregname, <vec_G6_G7_G8_G9=reg128#3%qregname, [<pointer_G=int64#3]
# asm 2: stp <vec_G2_G3_G4_G5=q0, <vec_G6_G7_G8_G9=q2, [<pointer_G=x2]
stp q0, q2, [x2]

# qhasm: int64 F10

# qhasm: F10 = vec_F10_0_G10_0[0/2]
# asm 1: umov >F10=int64#7, <vec_F10_0_G10_0=reg128#9.d[0]
# asm 2: umov >F10=x6, <vec_F10_0_G10_0=v8.d[0]
umov x6, v8.d[0]

# qhasm: mem32[pointer_F+32] = F10
# asm 1: str <F10=int64#7%wregname, [<pointer_F=int64#2, #32]
# asm 2: str <F10=w6, [<pointer_F=x1, #32]
str w6, [x1, #32]

# qhasm: int64 G10

# qhasm: G10 = vec_F10_0_G10_0[1/2]
# asm 1: umov >G10=int64#7, <vec_F10_0_G10_0=reg128#9.d[1]
# asm 2: umov >G10=x6, <vec_F10_0_G10_0=v8.d[1]
umov x6, v8.d[1]

# qhasm: mem32[pointer_G+32] = G10
# asm 1: str <G10=int64#7%wregname, [<pointer_G=int64#3, #32]
# asm 2: str <G10=w6, [<pointer_G=x2, #32]
str w6, [x2, #32]

# qhasm: reg128 vec_V0_V1_S0_S1

# qhasm: reg128 vec_V2_V3_S2_S3

# qhasm: reg128 vec_V4_V5_S4_S5

# qhasm: reg128 vec_V6_V7_S6_S7

# qhasm: reg128 vec_V8_V9_S8_S9

# qhasm: reg128 vec_2x_2p30m1

# qhasm: int64 2p30m1

# qhasm: 2p30m1 = 1073741823
# asm 1: mov >2p30m1=int64#7, #1073741823
# asm 2: mov >2p30m1=x6, #1073741823
mov x6, #1073741823

# qhasm: 2x vec_2x_2p30m1 = 2p30m1
# asm 1: dup <vec_2x_2p30m1=reg128#1.2d, <2p30m1=int64#7
# asm 2: dup <vec_2x_2p30m1=v0.2d, <2p30m1=x6
dup v0.2d, x6

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7

# qhasm: int64 V8V9

# qhasm: V0V1, V2V3 = mem128[pointer_V]
# asm 1: ldp >V0V1=int64#8, >V2V3=int64#9, [<pointer_V=int64#4]
# asm 2: ldp >V0V1=x7, >V2V3=x8, [<pointer_V=x3]
ldp x7, x8, [x3]

# qhasm: V4V5, V6V7 = mem128[pointer_V+16]
# asm 1: ldp >V4V5=int64#10, >V6V7=int64#11, [<pointer_V=int64#4, #16]
# asm 2: ldp >V4V5=x9, >V6V7=x10, [<pointer_V=x3, #16]
ldp x9, x10, [x3, #16]

# qhasm: V8V9 = mem32[pointer_V+32]
# asm 1: ldr >V8V9=int64#12%wregname, [<pointer_V=int64#4, #32]
# asm 2: ldr >V8V9=w11, [<pointer_V=x3, #32]
ldr w11, [x3, #32]

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 S4S5

# qhasm: int64 S6S7

# qhasm: int64 S8S9

# qhasm: S0S1, S2S3 = mem128[pointer_S]
# asm 1: ldp >S0S1=int64#13, >S2S3=int64#14, [<pointer_S=int64#5]
# asm 2: ldp >S0S1=x12, >S2S3=x13, [<pointer_S=x4]
ldp x12, x13, [x4]

# qhasm: S4S5, S6S7 = mem128[pointer_S+16]
# asm 1: ldp >S4S5=int64#15, >S6S7=int64#16, [<pointer_S=int64#5, #16]
# asm 2: ldp >S4S5=x14, >S6S7=x15, [<pointer_S=x4, #16]
ldp x14, x15, [x4, #16]

# qhasm: S8S9 = mem32[pointer_S+32]
# asm 1: ldr >S8S9=int64#17%wregname, [<pointer_S=int64#5, #32]
# asm 2: ldr >S8S9=w16, [<pointer_S=x4, #32]
ldr w16, [x4, #32]

# qhasm: vec_V0_V1_S0_S1[0/2] = V0V1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#2.d[0], <V0V1=int64#8
# asm 2: ins <vec_V0_V1_S0_S1=v1.d[0], <V0V1=x7
ins v1.d[0], x7

# qhasm: vec_V0_V1_S0_S1[1/2] = S0S1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#2.d[1], <S0S1=int64#13
# asm 2: ins <vec_V0_V1_S0_S1=v1.d[1], <S0S1=x12
ins v1.d[1], x12

# qhasm: vec_V2_V3_S2_S3[0/2] = V2V3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#3.d[0], <V2V3=int64#9
# asm 2: ins <vec_V2_V3_S2_S3=v2.d[0], <V2V3=x8
ins v2.d[0], x8

# qhasm: vec_V2_V3_S2_S3[1/2] = S2S3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#3.d[1], <S2S3=int64#14
# asm 2: ins <vec_V2_V3_S2_S3=v2.d[1], <S2S3=x13
ins v2.d[1], x13

# qhasm: vec_V4_V5_S4_S5[0/2] = V4V5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#4.d[0], <V4V5=int64#10
# asm 2: ins <vec_V4_V5_S4_S5=v3.d[0], <V4V5=x9
ins v3.d[0], x9

# qhasm: vec_V4_V5_S4_S5[1/2] = S4S5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#4.d[1], <S4S5=int64#15
# asm 2: ins <vec_V4_V5_S4_S5=v3.d[1], <S4S5=x14
ins v3.d[1], x14

# qhasm: vec_V6_V7_S6_S7[0/2] = V6V7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#5.d[0], <V6V7=int64#11
# asm 2: ins <vec_V6_V7_S6_S7=v4.d[0], <V6V7=x10
ins v4.d[0], x10

# qhasm: vec_V6_V7_S6_S7[1/2] = S6S7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#5.d[1], <S6S7=int64#16
# asm 2: ins <vec_V6_V7_S6_S7=v4.d[1], <S6S7=x15
ins v4.d[1], x15

# qhasm: vec_V8_V9_S8_S9[0/2] = V8V9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#9.d[0], <V8V9=int64#12
# asm 2: ins <vec_V8_V9_S8_S9=v8.d[0], <V8V9=x11
ins v8.d[0], x11

# qhasm: vec_V8_V9_S8_S9[1/2] = S8S9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#9.d[1], <S8S9=int64#17
# asm 2: ins <vec_V8_V9_S8_S9=v8.d[1], <S8S9=x16
ins v8.d[1], x16

# qhasm: uu, vv = mem128[pointer_uuvvrrss + 0]
# asm 1: ldp >uu=int64#8, >vv=int64#9, [<pointer_uuvvrrss=int64#6, #0]
# asm 2: ldp >uu=x7, >vv=x8, [<pointer_uuvvrrss=x5, #0]
ldp x7, x8, [x5, #0]

# qhasm: rr, ss = mem128[pointer_uuvvrrss + 16]
# asm 1: ldp >rr=int64#10, >ss=int64#11, [<pointer_uuvvrrss=int64#6, #16]
# asm 2: ldp >rr=x9, >ss=x10, [<pointer_uuvvrrss=x5, #16]
ldp x9, x10, [x5, #16]

# qhasm: 4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31
# asm 1: sshr <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, #31
# asm 2: sshr <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uu1_rr1_vv1_ss1=v6.4s, #31
sshr v7.4s, v6.4s, #31

# qhasm: reg128 front_vec_4x_2p30a2p31

# qhasm: 4x front_vec_4x_2p30a2p31 = 0xC0 << 24
# asm 1: movi <front_vec_4x_2p30a2p31=reg128#10.4s, #0xC0, lsl #24
# asm 2: movi <front_vec_4x_2p30a2p31=v9.4s, #0xC0, lsl #24
movi v9.4s, #0xC0, lsl #24

# qhasm: vec_uu1_rr1_vv1_ss1 &= ~front_vec_4x_2p30a2p31
# asm 1: bic <vec_uu1_rr1_vv1_ss1=reg128#7.16b, <vec_uu1_rr1_vv1_ss1=reg128#7.16b, <front_vec_4x_2p30a2p31=reg128#10.16b
# asm 2: bic <vec_uu1_rr1_vv1_ss1=v6.16b, <vec_uu1_rr1_vv1_ss1=v6.16b, <front_vec_4x_2p30a2p31=v9.16b
bic v6.16b, v6.16b, v9.16b

# qhasm: reg128 vec_prod

# qhasm: 2x vec_prod = 0
# asm 1: movi <vec_prod=reg128#10.2d, #0
# asm 2: movi <vec_prod=v9.2d, #0
movi v9.2d, #0

# qhasm: reg128 vec_prod_1

# qhasm: 2x vec_prod_1 = 0
# asm 1: movi <vec_prod_1=reg128#10.2d, #0
# asm 2: movi <vec_prod_1=v9.2d, #0
movi v9.2d, #0

# qhasm: reg128 vec_buf

# qhasm: int64 2p30m19

# qhasm: int64 2p15m1

# qhasm: reg128 vec_2x_2p30m19

# qhasm: reg128 vec_2x_2p15m1

# qhasm: 2p30m19 = 2p30m1 - 18
# asm 1: sub >2p30m19=int64#12,<2p30m1=int64#7,#18
# asm 2: sub >2p30m19=x11,<2p30m1=x6,#18
sub x11,x6,#18

# qhasm: 2p15m1 = 2p30m1 unsigned>> 15
# asm 1: lsr >2p15m1=int64#7, <2p30m1=int64#7, #15
# asm 2: lsr >2p15m1=x6, <2p30m1=x6, #15
lsr x6, x6, #15

# qhasm: 2x vec_2x_2p30m19 = 2p30m19
# asm 1: dup <vec_2x_2p30m19=reg128#10.2d, <2p30m19=int64#12
# asm 2: dup <vec_2x_2p30m19=v9.2d, <2p30m19=x11
dup v9.2d, x11

# qhasm: 2x vec_2x_2p15m1 = 2p15m1
# asm 1: dup <vec_2x_2p15m1=reg128#11.2d, <2p15m1=int64#7
# asm 2: dup <vec_2x_2p15m1=v10.2d, <2p15m1=x6
dup v10.2d, x6

# qhasm: int64 M

# qhasm: M = 0
# asm 1: mov >M=int64#7, #0
# asm 2: mov >M=x6, #0
mov x6, #0

# qhasm: M[0/4] = 51739
# asm 1: movk <M=int64#7, #51739
# asm 2: movk <M=x6, #51739
movk x6, #51739

# qhasm: M[1/4] = 10347
# asm 1: movk <M=int64#7, #10347,LSL #16
# asm 2: movk <M=x6, #10347,LSL #16
movk x6, #10347,LSL #16

# qhasm: reg128 vec_M

# qhasm: 4x vec_M = M
# asm 1: dup <vec_M=reg128#12.4s, <M=int64#7%wregname
# asm 2: dup <vec_M=v11.4s, <M=w6
dup v11.4s, w6

# qhasm: reg128 vec_l0_V

# qhasm: reg128 vec_l0_S

# qhasm: reg128 vec_l1_V

# qhasm: reg128 vec_l1_S

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[0/4]
# asm 1: umull >vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V0_V1_S0_S1=reg128#2.s[0]
# asm 2: umull >vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V0_V1_S0_S1=v1.s[0]
umull v12.2d, v5.2s, v1.s[0]

# qhasm: 4x vec_l0_V = vec_prod * vec_M
# asm 1: mul >vec_l0_V=reg128#14.4s,<vec_prod=reg128#13.4s,<vec_M=reg128#12.4s
# asm 2: mul >vec_l0_V=v13.4s,<vec_prod=v12.4s,<vec_M=v11.4s
mul v13.4s,v12.4s,v11.4s

# qhasm: vec_l0_V &= vec_2x_2p30m1
# asm 1: and <vec_l0_V=reg128#14.16b, <vec_l0_V=reg128#14.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and <vec_l0_V=v13.16b, <vec_l0_V=v13.16b, <vec_2x_2p30m1=v0.16b
and v13.16b, v13.16b, v0.16b

# qhasm: 4x vec_l0_V = vec_l0_V[0/4] vec_l0_V[2/4] vec_l0_V[0/4] vec_l0_V[2/4]
# asm 1: uzp1 >vec_l0_V=reg128#14.4s, <vec_l0_V=reg128#14.4s, <vec_l0_V=reg128#14.4s
# asm 2: uzp1 >vec_l0_V=v13.4s, <vec_l0_V=v13.4s, <vec_l0_V=v13.4s
uzp1 v13.4s, v13.4s, v13.4s

# qhasm: 2x vec_prod += vec_l0_V[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l0_V=reg128#14.2s, <vec_2x_2p30m19=reg128#10.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l0_V=v13.2s, <vec_2x_2p30m19=v9.s[0]
umlal v12.2d, v13.2s, v9.s[0]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: sshr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
sshr v12.2d, v12.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[1/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V0_V1_S0_S1=reg128#2.s[1]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V0_V1_S0_S1=v1.s[1]
umlal v12.2d, v5.2s, v1.s[1]

# qhasm: 2x vec_prod += vec_l0_V[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l0_V=reg128#14.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l0_V=v13.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v13.2s, v0.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V0_V1_S0_S1=reg128#2.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V0_V1_S0_S1=v1.s[0]
umlal v12.2d, v6.2s, v1.s[0]

# qhasm: 4x vec_l1_V = vec_prod * vec_M
# asm 1: mul >vec_l1_V=reg128#15.4s,<vec_prod=reg128#13.4s,<vec_M=reg128#12.4s
# asm 2: mul >vec_l1_V=v14.4s,<vec_prod=v12.4s,<vec_M=v11.4s
mul v14.4s,v12.4s,v11.4s

# qhasm: vec_l1_V &= vec_2x_2p30m1
# asm 1: and <vec_l1_V=reg128#15.16b, <vec_l1_V=reg128#15.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and <vec_l1_V=v14.16b, <vec_l1_V=v14.16b, <vec_2x_2p30m1=v0.16b
and v14.16b, v14.16b, v0.16b

# qhasm: 4x vec_l1_V = vec_l1_V[0/4] vec_l1_V[2/4] vec_l1_V[0/4] vec_l1_V[2/4]
# asm 1: uzp1 >vec_l1_V=reg128#15.4s, <vec_l1_V=reg128#15.4s, <vec_l1_V=reg128#15.4s
# asm 2: uzp1 >vec_l1_V=v14.4s, <vec_l1_V=v14.4s, <vec_l1_V=v14.4s
uzp1 v14.4s, v14.4s, v14.4s

# qhasm: 2x vec_prod += vec_l1_V[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1_V=reg128#15.2s, <vec_2x_2p30m19=reg128#10.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1_V=v14.2s, <vec_2x_2p30m19=v9.s[0]
umlal v12.2d, v14.2s, v9.s[0]

# qhasm:                     2x vec_prod_1 = vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V0_V1_S0_S1[2/4]
# asm 1: umull2 >vec_prod_1=reg128#16.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_V0_V1_S0_S1=reg128#2.s[2]
# asm 2: umull2 >vec_prod_1=v15.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_V0_V1_S0_S1=v1.s[2]
umull2 v15.2d, v5.4s, v1.s[2]

# qhasm:                     4x vec_l0_S = vec_prod_1 * vec_M
# asm 1: mul >vec_l0_S=reg128#17.4s,<vec_prod_1=reg128#16.4s,<vec_M=reg128#12.4s
# asm 2: mul >vec_l0_S=v16.4s,<vec_prod_1=v15.4s,<vec_M=v11.4s
mul v16.4s,v15.4s,v11.4s

# qhasm:                     vec_l0_S &= vec_2x_2p30m1
# asm 1: and <vec_l0_S=reg128#17.16b, <vec_l0_S=reg128#17.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and <vec_l0_S=v16.16b, <vec_l0_S=v16.16b, <vec_2x_2p30m1=v0.16b
and v16.16b, v16.16b, v0.16b

# qhasm:                     4x vec_l0_S = vec_l0_S[0/4] vec_l0_S[2/4] vec_l0_S[0/4] vec_l0_S[2/4]
# asm 1: uzp1 >vec_l0_S=reg128#17.4s, <vec_l0_S=reg128#17.4s, <vec_l0_S=reg128#17.4s
# asm 2: uzp1 >vec_l0_S=v16.4s, <vec_l0_S=v16.4s, <vec_l0_S=v16.4s
uzp1 v16.4s, v16.4s, v16.4s

# qhasm:                     2x vec_prod_1 += vec_l0_S[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod_1=reg128#16.2d, <vec_l0_S=reg128#17.2s, <vec_2x_2p30m19=reg128#10.s[0]
# asm 2: umlal <vec_prod_1=v15.2d, <vec_l0_S=v16.2s, <vec_2x_2p30m19=v9.s[0]
umlal v15.2d, v16.2s, v9.s[0]

# qhasm:                     2x vec_prod_1 >>= 30
# asm 1: sshr >vec_prod_1=reg128#16.2d, <vec_prod_1=reg128#16.2d, #30
# asm 2: sshr >vec_prod_1=v15.2d, <vec_prod_1=v15.2d, #30
sshr v15.2d, v15.2d, #30

# qhasm:                     2x vec_prod_1 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V0_V1_S0_S1[3/4]
# asm 1: umlal2 <vec_prod_1=reg128#16.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_V0_V1_S0_S1=reg128#2.s[3]
# asm 2: umlal2 <vec_prod_1=v15.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_V0_V1_S0_S1=v1.s[3]
umlal2 v15.2d, v5.4s, v1.s[3]

# qhasm:                     2x vec_prod_1 += vec_l0_S[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod_1=reg128#16.2d, <vec_l0_S=reg128#17.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod_1=v15.2d, <vec_l0_S=v16.2s, <vec_2x_2p30m1=v0.s[0]
umlal v15.2d, v16.2s, v0.s[0]

# qhasm:                     2x vec_prod_1 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V0_V1_S0_S1[2/4]
# asm 1: umlal2 <vec_prod_1=reg128#16.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_V0_V1_S0_S1=reg128#2.s[2]
# asm 2: umlal2 <vec_prod_1=v15.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_V0_V1_S0_S1=v1.s[2]
umlal2 v15.2d, v6.4s, v1.s[2]

# qhasm:                     4x vec_l1_S = vec_prod_1 * vec_M
# asm 1: mul >vec_l1_S=reg128#12.4s,<vec_prod_1=reg128#16.4s,<vec_M=reg128#12.4s
# asm 2: mul >vec_l1_S=v11.4s,<vec_prod_1=v15.4s,<vec_M=v11.4s
mul v11.4s,v15.4s,v11.4s

# qhasm:                     vec_l1_S &= vec_2x_2p30m1
# asm 1: and <vec_l1_S=reg128#12.16b, <vec_l1_S=reg128#12.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and <vec_l1_S=v11.16b, <vec_l1_S=v11.16b, <vec_2x_2p30m1=v0.16b
and v11.16b, v11.16b, v0.16b

# qhasm:                     4x vec_l1_S = vec_l1_S[0/4] vec_l1_S[2/4] vec_l1_S[0/4] vec_l1_S[2/4]
# asm 1: uzp1 >vec_l1_S=reg128#12.4s, <vec_l1_S=reg128#12.4s, <vec_l1_S=reg128#12.4s
# asm 2: uzp1 >vec_l1_S=v11.4s, <vec_l1_S=v11.4s, <vec_l1_S=v11.4s
uzp1 v11.4s, v11.4s, v11.4s

# qhasm:                     2x vec_prod_1 += vec_l1_S[0] unsigned* vec_2x_2p30m19[0/4]
# asm 1: umlal <vec_prod_1=reg128#16.2d, <vec_l1_S=reg128#12.2s, <vec_2x_2p30m19=reg128#10.s[0]
# asm 2: umlal <vec_prod_1=v15.2d, <vec_l1_S=v11.2s, <vec_2x_2p30m19=v9.s[0]
umlal v15.2d, v11.2s, v9.s[0]

# qhasm: reg128 vec_Vp0_Vp1_Sp0_Sp1

# qhasm: reg128 vec_Vp2_Vp3_Sp2_Sp3

# qhasm: reg128 vec_Vp4_Vp5_Sp4_Sp5

# qhasm: reg128 vec_Vp6_Vp7_Sp6_Sp7

# qhasm: reg128 vec_Vp8_Vp9_Sp8_Sp9

# qhasm: reg128 vec_l0

# qhasm: reg128 vec_l1

# qhasm: 2x vec_l0 = vec_l0_V + vec_l0_S
# asm 1: add >vec_l0=reg128#10.2d, <vec_l0_V=reg128#14.2d, <vec_l0_S=reg128#17.2d
# asm 2: add >vec_l0=v9.2d, <vec_l0_V=v13.2d, <vec_l0_S=v16.2d
add v9.2d, v13.2d, v16.2d

# qhasm: 2x vec_l1 = vec_l1_V + vec_l1_S
# asm 1: add >vec_l1=reg128#12.2d, <vec_l1_V=reg128#15.2d, <vec_l1_S=reg128#12.2d
# asm 2: add >vec_l1=v11.2d, <vec_l1_V=v14.2d, <vec_l1_S=v11.2d
add v11.2d, v14.2d, v11.2d

# qhasm: 2x vec_prod = vec_prod + vec_prod_1
# asm 1: add >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, <vec_prod_1=reg128#16.2d
# asm 2: add >vec_prod=v12.2d, <vec_prod=v12.2d, <vec_prod_1=v15.2d
add v12.2d, v12.2d, v15.2d

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: sshr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
sshr v12.2d, v12.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V2_V3_S2_S3=reg128#3.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V2_V3_S2_S3=v2.s[0]
umlal v12.2d, v5.2s, v2.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V2_V3_S2_S3[2/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_V2_V3_S2_S3=reg128#3.s[2]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_V2_V3_S2_S3=v2.s[2]
umlal2 v12.2d, v5.4s, v2.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[1/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V0_V1_S0_S1=reg128#2.s[1]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V0_V1_S0_S1=v1.s[1]
umlal v12.2d, v6.2s, v1.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V0_V1_S0_S1[3/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_V0_V1_S0_S1=reg128#2.s[3]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_V0_V1_S0_S1=v1.s[3]
umlal2 v12.2d, v6.4s, v1.s[3]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l0=reg128#10.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l0=v9.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v9.2s, v0.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#12.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v11.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v11.2s, v0.s[0]

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp0_Vp1_Sp0_Sp1=reg128#14.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_Vp0_Vp1_Sp0_Sp1=v13.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v0.16b
and v13.16b, v12.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: sshr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
sshr v12.2d, v12.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[1/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V2_V3_S2_S3=reg128#3.s[1]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V2_V3_S2_S3=v2.s[1]
umlal v12.2d, v5.2s, v2.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V2_V3_S2_S3[3/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_V2_V3_S2_S3=reg128#3.s[3]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_V2_V3_S2_S3=v2.s[3]
umlal2 v12.2d, v5.4s, v2.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V2_V3_S2_S3=reg128#3.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V2_V3_S2_S3=v2.s[0]
umlal v12.2d, v6.2s, v2.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V2_V3_S2_S3[2/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_V2_V3_S2_S3=reg128#3.s[2]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_V2_V3_S2_S3=v2.s[2]
umlal2 v12.2d, v6.4s, v2.s[2]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l0=reg128#10.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l0=v9.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v9.2s, v0.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#12.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v11.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v11.2s, v0.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#15.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buf=v14.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v0.16b
and v14.16b, v12.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: sshr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
sshr v12.2d, v12.2d, #30

# qhasm: 2x vec_Vp0_Vp1_Sp0_Sp1 |= vec_buf << 32
# asm 1: sli <vec_Vp0_Vp1_Sp0_Sp1=reg128#14.2d,<vec_buf=reg128#15.2d,#32
# asm 2: sli <vec_Vp0_Vp1_Sp0_Sp1=v13.2d,<vec_buf=v14.2d,#32
sli v13.2d,v14.2d,#32

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V4_V5_S4_S5=reg128#4.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V4_V5_S4_S5=v3.s[0]
umlal v12.2d, v5.2s, v3.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V4_V5_S4_S5[2/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_V4_V5_S4_S5=reg128#4.s[2]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_V4_V5_S4_S5=v3.s[2]
umlal2 v12.2d, v5.4s, v3.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[1/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V2_V3_S2_S3=reg128#3.s[1]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V2_V3_S2_S3=v2.s[1]
umlal v12.2d, v6.2s, v2.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V2_V3_S2_S3[3/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_V2_V3_S2_S3=reg128#3.s[3]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_V2_V3_S2_S3=v2.s[3]
umlal2 v12.2d, v6.4s, v2.s[3]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l0=reg128#10.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l0=v9.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v9.2s, v0.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#12.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v11.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v11.2s, v0.s[0]

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp2_Vp3_Sp2_Sp3=reg128#15.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_Vp2_Vp3_Sp2_Sp3=v14.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v0.16b
and v14.16b, v12.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: sshr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
sshr v12.2d, v12.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[1/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V4_V5_S4_S5=reg128#4.s[1]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V4_V5_S4_S5=v3.s[1]
umlal v12.2d, v5.2s, v3.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V4_V5_S4_S5[3/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_V4_V5_S4_S5=reg128#4.s[3]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_V4_V5_S4_S5=v3.s[3]
umlal2 v12.2d, v5.4s, v3.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V4_V5_S4_S5=reg128#4.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V4_V5_S4_S5=v3.s[0]
umlal v12.2d, v6.2s, v3.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V4_V5_S4_S5[2/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_V4_V5_S4_S5=reg128#4.s[2]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_V4_V5_S4_S5=v3.s[2]
umlal2 v12.2d, v6.4s, v3.s[2]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l0=reg128#10.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l0=v9.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v9.2s, v0.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#12.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v11.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v11.2s, v0.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#16.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buf=v15.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v0.16b
and v15.16b, v12.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: sshr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
sshr v12.2d, v12.2d, #30

# qhasm: 2x vec_Vp2_Vp3_Sp2_Sp3 |= vec_buf << 32
# asm 1: sli <vec_Vp2_Vp3_Sp2_Sp3=reg128#15.2d,<vec_buf=reg128#16.2d,#32
# asm 2: sli <vec_Vp2_Vp3_Sp2_Sp3=v14.2d,<vec_buf=v15.2d,#32
sli v14.2d,v15.2d,#32

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V6_V7_S6_S7=reg128#5.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V6_V7_S6_S7=v4.s[0]
umlal v12.2d, v5.2s, v4.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V6_V7_S6_S7[2/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_V6_V7_S6_S7=reg128#5.s[2]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_V6_V7_S6_S7=v4.s[2]
umlal2 v12.2d, v5.4s, v4.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[1/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V4_V5_S4_S5=reg128#4.s[1]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V4_V5_S4_S5=v3.s[1]
umlal v12.2d, v6.2s, v3.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V4_V5_S4_S5[3/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_V4_V5_S4_S5=reg128#4.s[3]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_V4_V5_S4_S5=v3.s[3]
umlal2 v12.2d, v6.4s, v3.s[3]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l0=reg128#10.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l0=v9.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v9.2s, v0.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#12.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v11.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v11.2s, v0.s[0]

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp4_Vp5_Sp4_Sp5=reg128#16.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_Vp4_Vp5_Sp4_Sp5=v15.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v0.16b
and v15.16b, v12.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: sshr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
sshr v12.2d, v12.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[1/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V6_V7_S6_S7=reg128#5.s[1]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V6_V7_S6_S7=v4.s[1]
umlal v12.2d, v5.2s, v4.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V6_V7_S6_S7[3/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_V6_V7_S6_S7=reg128#5.s[3]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_V6_V7_S6_S7=v4.s[3]
umlal2 v12.2d, v5.4s, v4.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V6_V7_S6_S7=reg128#5.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V6_V7_S6_S7=v4.s[0]
umlal v12.2d, v6.2s, v4.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V6_V7_S6_S7[2/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_V6_V7_S6_S7=reg128#5.s[2]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_V6_V7_S6_S7=v4.s[2]
umlal2 v12.2d, v6.4s, v4.s[2]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l0=reg128#10.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l0=v9.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v9.2s, v0.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#12.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v11.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v11.2s, v0.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#17.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buf=v16.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v0.16b
and v16.16b, v12.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#13.2d, <vec_prod=reg128#13.2d, #30
# asm 2: sshr >vec_prod=v12.2d, <vec_prod=v12.2d, #30
sshr v12.2d, v12.2d, #30

# qhasm: 2x vec_Vp4_Vp5_Sp4_Sp5 |= vec_buf << 32
# asm 1: sli <vec_Vp4_Vp5_Sp4_Sp5=reg128#16.2d,<vec_buf=reg128#17.2d,#32
# asm 2: sli <vec_Vp4_Vp5_Sp4_Sp5=v15.2d,<vec_buf=v16.2d,#32
sli v15.2d,v16.2d,#32

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V8_V9_S8_S9[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.2s, <vec_V8_V9_S8_S9=reg128#9.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.2s, <vec_V8_V9_S8_S9=v8.s[0]
umlal v12.2d, v5.2s, v8.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V8_V9_S8_S9[2/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu0_rr0_vv0_ss0=reg128#6.4s, <vec_V8_V9_S8_S9=reg128#9.s[2]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu0_rr0_vv0_ss0=v5.4s, <vec_V8_V9_S8_S9=v8.s[2]
umlal2 v12.2d, v5.4s, v8.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[1/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V6_V7_S6_S7=reg128#5.s[1]
# asm 2: umlal <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V6_V7_S6_S7=v4.s[1]
umlal v12.2d, v6.2s, v4.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V6_V7_S6_S7[3/4]
# asm 1: umlal2 <vec_prod=reg128#13.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_V6_V7_S6_S7=reg128#5.s[3]
# asm 2: umlal2 <vec_prod=v12.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_V6_V7_S6_S7=v4.s[3]
umlal2 v12.2d, v6.4s, v4.s[3]

# qhasm: 2x vec_prod += vec_l0[0] unsigned* vec_2x_2p15m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l0=reg128#10.2s, <vec_2x_2p15m1=reg128#11.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l0=v9.2s, <vec_2x_2p15m1=v10.s[0]
umlal v12.2d, v9.2s, v10.s[0]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
# asm 1: umlal <vec_prod=reg128#13.2d, <vec_l1=reg128#12.2s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: umlal <vec_prod=v12.2d, <vec_l1=v11.2s, <vec_2x_2p30m1=v0.s[0]
umlal v12.2d, v11.2s, v0.s[0]

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp6_Vp7_Sp6_Sp7=reg128#6.16b, <vec_prod=reg128#13.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_Vp6_Vp7_Sp6_Sp7=v5.16b, <vec_prod=v12.16b, <vec_2x_2p30m1=v0.16b
and v5.16b, v12.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#13.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v12.2d, #30
sshr v9.2d, v12.2d, #30

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V8_V9_S8_S9[0/4]
# asm 1: umlal <vec_prod=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.2s, <vec_V8_V9_S8_S9=reg128#9.s[0]
# asm 2: umlal <vec_prod=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.2s, <vec_V8_V9_S8_S9=v8.s[0]
umlal v9.2d, v6.2s, v8.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V8_V9_S8_S9[2/4]
# asm 1: umlal2 <vec_prod=reg128#10.2d, <vec_uu1_rr1_vv1_ss1=reg128#7.4s, <vec_V8_V9_S8_S9=reg128#9.s[2]
# asm 2: umlal2 <vec_prod=v9.2d, <vec_uu1_rr1_vv1_ss1=v6.4s, <vec_V8_V9_S8_S9=v8.s[2]
umlal2 v9.2d, v6.4s, v8.s[2]

# qhasm: 2x vec_prod += vec_l1[0] unsigned* vec_2x_2p15m1[0/4]
# asm 1: umlal <vec_prod=reg128#10.2d, <vec_l1=reg128#12.2s, <vec_2x_2p15m1=reg128#11.s[0]
# asm 2: umlal <vec_prod=v9.2d, <vec_l1=v11.2s, <vec_2x_2p15m1=v10.s[0]
umlal v9.2d, v11.2s, v10.s[0]

# qhasm: vec_buf = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buf=reg128#7.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buf=v6.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v0.16b
and v6.16b, v9.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: 2x vec_Vp6_Vp7_Sp6_Sp7 |= vec_buf << 32
# asm 1: sli <vec_Vp6_Vp7_Sp6_Sp7=reg128#6.2d,<vec_buf=reg128#7.2d,#32
# asm 2: sli <vec_Vp6_Vp7_Sp6_Sp7=v5.2d,<vec_buf=v6.2d,#32
sli v5.2d,v6.2d,#32

# qhasm: vec_Vp8_Vp9_Sp8_Sp9 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_Vp8_Vp9_Sp8_Sp9=reg128#7.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_Vp8_Vp9_Sp8_Sp9=v6.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v0.16b
and v6.16b, v9.16b, v0.16b

# qhasm: 4x vec_uuhat_rrhat = vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[1/4] vec_uuhat_rrhat_vvhat_sshat[1/4]
# asm 1: zip1 >vec_uuhat_rrhat=reg128#10.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s
# asm 2: zip1 >vec_uuhat_rrhat=v9.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s
zip1 v9.4s, v7.4s, v7.4s

# qhasm: reg128 vec_V0_V1_V0_V1

# qhasm: reg128 vec_V2_V3_V2_V3

# qhasm: reg128 vec_V4_V5_V4_V5

# qhasm: reg128 vec_V6_V7_V6_V7

# qhasm: reg128 vec_V8_V9_V8_V9

# qhasm: reg128 vec_4x_2p30m1

# qhasm: reg128 vec_P0_P1_P0_P1

# qhasm: 4x vec_4x_2p30m1 = vec_2x_2p30m1[0/4]
# asm 1: dup <vec_4x_2p30m1=reg128#12.4s, <vec_2x_2p30m1=reg128#1.s[0]
# asm 2: dup <vec_4x_2p30m1=v11.4s, <vec_2x_2p30m1=v0.s[0]
dup v11.4s, v0.s[0]

# qhasm: int64 eighteen

# qhasm: reg128 vec_eighteen

# qhasm: eighteen = 18
# asm 1: mov >eighteen=int64#7, #18
# asm 2: mov >eighteen=x6, #18
mov x6, #18

# qhasm: 2x vec_eighteen = eighteen
# asm 1: dup <vec_eighteen=reg128#1.2d, <eighteen=int64#7
# asm 2: dup <vec_eighteen=v0.2d, <eighteen=x6
dup v0.2d, x6

# qhasm: 2x vec_P0_P1_P0_P1 = vec_4x_2p30m1 - vec_eighteen
# asm 1: sub >vec_P0_P1_P0_P1=reg128#1.2d,<vec_4x_2p30m1=reg128#12.2d,<vec_eighteen=reg128#1.2d
# asm 2: sub >vec_P0_P1_P0_P1=v0.2d,<vec_4x_2p30m1=v11.2d,<vec_eighteen=v0.2d
sub v0.2d,v11.2d,v0.2d

# qhasm: 2x vec_V0_V1_V0_V1 zip= vec_V0_V1_S0_S1[0/2] vec_V0_V1_S0_S1[0/2]
# asm 1: zip1 >vec_V0_V1_V0_V1=reg128#13.2d, <vec_V0_V1_S0_S1=reg128#2.2d, <vec_V0_V1_S0_S1=reg128#2.2d
# asm 2: zip1 >vec_V0_V1_V0_V1=v12.2d, <vec_V0_V1_S0_S1=v1.2d, <vec_V0_V1_S0_S1=v1.2d
zip1 v12.2d, v1.2d, v1.2d

# qhasm: 4x vec_buf = vec_P0_P1_P0_P1 - vec_V0_V1_V0_V1
# asm 1: sub >vec_buf=reg128#13.4s,<vec_P0_P1_P0_P1=reg128#1.4s,<vec_V0_V1_V0_V1=reg128#13.4s
# asm 2: sub >vec_buf=v12.4s,<vec_P0_P1_P0_P1=v0.4s,<vec_V0_V1_V0_V1=v12.4s
sub v12.4s,v0.4s,v12.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#13.16b, <vec_buf=reg128#13.16b, <vec_uuhat_rrhat=reg128#10.16b
# asm 2: and <vec_buf=v12.16b, <vec_buf=v12.16b, <vec_uuhat_rrhat=v9.16b
and v12.16b, v12.16b, v9.16b

# qhasm: 4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf
# asm 1: add >vec_Vp0_Vp1_Sp0_Sp1=reg128#13.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#14.4s, <vec_buf=reg128#13.4s
# asm 2: add >vec_Vp0_Vp1_Sp0_Sp1=v12.4s, <vec_Vp0_Vp1_Sp0_Sp1=v13.4s, <vec_buf=v12.4s
add v12.4s, v13.4s, v12.4s

# qhasm: 2x vec_V2_V3_V2_V3 zip= vec_V2_V3_S2_S3[0/2] vec_V2_V3_S2_S3[0/2]
# asm 1: zip1 >vec_V2_V3_V2_V3=reg128#14.2d, <vec_V2_V3_S2_S3=reg128#3.2d, <vec_V2_V3_S2_S3=reg128#3.2d
# asm 2: zip1 >vec_V2_V3_V2_V3=v13.2d, <vec_V2_V3_S2_S3=v2.2d, <vec_V2_V3_S2_S3=v2.2d
zip1 v13.2d, v2.2d, v2.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_V2_V3_V2_V3
# asm 1: sub >vec_buf=reg128#14.4s,<vec_4x_2p30m1=reg128#12.4s,<vec_V2_V3_V2_V3=reg128#14.4s
# asm 2: sub >vec_buf=v13.4s,<vec_4x_2p30m1=v11.4s,<vec_V2_V3_V2_V3=v13.4s
sub v13.4s,v11.4s,v13.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#14.16b, <vec_buf=reg128#14.16b, <vec_uuhat_rrhat=reg128#10.16b
# asm 2: and <vec_buf=v13.16b, <vec_buf=v13.16b, <vec_uuhat_rrhat=v9.16b
and v13.16b, v13.16b, v9.16b

# qhasm: 4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#14.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#15.4s, <vec_buf=reg128#14.4s
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v13.4s, <vec_Vp2_Vp3_Sp2_Sp3=v14.4s, <vec_buf=v13.4s
add v13.4s, v14.4s, v13.4s

# qhasm: 2x vec_V4_V5_V4_V5 zip= vec_V4_V5_S4_S5[0/2] vec_V4_V5_S4_S5[0/2]
# asm 1: zip1 >vec_V4_V5_V4_V5=reg128#15.2d, <vec_V4_V5_S4_S5=reg128#4.2d, <vec_V4_V5_S4_S5=reg128#4.2d
# asm 2: zip1 >vec_V4_V5_V4_V5=v14.2d, <vec_V4_V5_S4_S5=v3.2d, <vec_V4_V5_S4_S5=v3.2d
zip1 v14.2d, v3.2d, v3.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_V4_V5_V4_V5
# asm 1: sub >vec_buf=reg128#15.4s,<vec_4x_2p30m1=reg128#12.4s,<vec_V4_V5_V4_V5=reg128#15.4s
# asm 2: sub >vec_buf=v14.4s,<vec_4x_2p30m1=v11.4s,<vec_V4_V5_V4_V5=v14.4s
sub v14.4s,v11.4s,v14.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#15.16b, <vec_buf=reg128#15.16b, <vec_uuhat_rrhat=reg128#10.16b
# asm 2: and <vec_buf=v14.16b, <vec_buf=v14.16b, <vec_uuhat_rrhat=v9.16b
and v14.16b, v14.16b, v9.16b

# qhasm: 4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#15.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#16.4s, <vec_buf=reg128#15.4s
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v14.4s, <vec_Vp4_Vp5_Sp4_Sp5=v15.4s, <vec_buf=v14.4s
add v14.4s, v15.4s, v14.4s

# qhasm: 2x vec_V6_V7_V6_V7 zip= vec_V6_V7_S6_S7[0/2] vec_V6_V7_S6_S7[0/2]
# asm 1: zip1 >vec_V6_V7_V6_V7=reg128#16.2d, <vec_V6_V7_S6_S7=reg128#5.2d, <vec_V6_V7_S6_S7=reg128#5.2d
# asm 2: zip1 >vec_V6_V7_V6_V7=v15.2d, <vec_V6_V7_S6_S7=v4.2d, <vec_V6_V7_S6_S7=v4.2d
zip1 v15.2d, v4.2d, v4.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_V6_V7_V6_V7
# asm 1: sub >vec_buf=reg128#16.4s,<vec_4x_2p30m1=reg128#12.4s,<vec_V6_V7_V6_V7=reg128#16.4s
# asm 2: sub >vec_buf=v15.4s,<vec_4x_2p30m1=v11.4s,<vec_V6_V7_V6_V7=v15.4s
sub v15.4s,v11.4s,v15.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#16.16b, <vec_buf=reg128#16.16b, <vec_uuhat_rrhat=reg128#10.16b
# asm 2: and <vec_buf=v15.16b, <vec_buf=v15.16b, <vec_uuhat_rrhat=v9.16b
and v15.16b, v15.16b, v9.16b

# qhasm: 4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#6.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#6.4s, <vec_buf=reg128#16.4s
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v5.4s, <vec_Vp6_Vp7_Sp6_Sp7=v5.4s, <vec_buf=v15.4s
add v5.4s, v5.4s, v15.4s

# qhasm: 2x vec_V8_V9_V8_V9 zip= vec_V8_V9_S8_S9[0/2] vec_V8_V9_S8_S9[0/2]
# asm 1: zip1 >vec_V8_V9_V8_V9=reg128#16.2d, <vec_V8_V9_S8_S9=reg128#9.2d, <vec_V8_V9_S8_S9=reg128#9.2d
# asm 2: zip1 >vec_V8_V9_V8_V9=v15.2d, <vec_V8_V9_S8_S9=v8.2d, <vec_V8_V9_S8_S9=v8.2d
zip1 v15.2d, v8.2d, v8.2d

# qhasm: 4x vec_buf = vec_2x_2p15m1 - vec_V8_V9_V8_V9
# asm 1: sub >vec_buf=reg128#16.4s,<vec_2x_2p15m1=reg128#11.4s,<vec_V8_V9_V8_V9=reg128#16.4s
# asm 2: sub >vec_buf=v15.4s,<vec_2x_2p15m1=v10.4s,<vec_V8_V9_V8_V9=v15.4s
sub v15.4s,v10.4s,v15.4s

# qhasm: vec_buf &= vec_uuhat_rrhat
# asm 1: and <vec_buf=reg128#16.16b, <vec_buf=reg128#16.16b, <vec_uuhat_rrhat=reg128#10.16b
# asm 2: and <vec_buf=v15.16b, <vec_buf=v15.16b, <vec_uuhat_rrhat=v9.16b
and v15.16b, v15.16b, v9.16b

# qhasm: 4x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf
# asm 1: add >vec_Vp8_Vp9_Sp8_Sp9=reg128#7.4s, <vec_Vp8_Vp9_Sp8_Sp9=reg128#7.4s, <vec_buf=reg128#16.4s
# asm 2: add >vec_Vp8_Vp9_Sp8_Sp9=v6.4s, <vec_Vp8_Vp9_Sp8_Sp9=v6.4s, <vec_buf=v15.4s
add v6.4s, v6.4s, v15.4s

# qhasm: 4x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
# asm 1: sshr <vec_buf=reg128#16.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#13.4s, #30
# asm 2: sshr <vec_buf=v15.4s, <vec_Vp0_Vp1_Sp0_Sp1=v12.4s, #30
sshr v15.4s, v12.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#10.2d, <vec_buf=reg128#16.2d, #32
# asm 2: shl >vec_buf=v9.2d, <vec_buf=v15.2d, #32
shl v9.2d, v15.2d, #32

# qhasm: 4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf
# asm 1: add >vec_Vp0_Vp1_Sp0_Sp1=reg128#13.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#13.4s, <vec_buf=reg128#10.4s
# asm 2: add >vec_Vp0_Vp1_Sp0_Sp1=v12.4s, <vec_Vp0_Vp1_Sp0_Sp1=v12.4s, <vec_buf=v9.4s
add v12.4s, v12.4s, v9.4s

# qhasm: 2x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
# asm 1: sshr <vec_buf=reg128#10.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#13.2d, #30
# asm 2: sshr <vec_buf=v9.2d, <vec_Vp0_Vp1_Sp0_Sp1=v12.2d, #30
sshr v9.2d, v12.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#10.2d, <vec_buf=reg128#10.2d, #32
# asm 2: ushr >vec_buf=v9.2d, <vec_buf=v9.2d, #32
ushr v9.2d, v9.2d, #32

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 &= vec_4x_2p30m1
# asm 1: and <vec_Vp0_Vp1_Sp0_Sp1=reg128#13.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#13.16b, <vec_4x_2p30m1=reg128#12.16b
# asm 2: and <vec_Vp0_Vp1_Sp0_Sp1=v12.16b, <vec_Vp0_Vp1_Sp0_Sp1=v12.16b, <vec_4x_2p30m1=v11.16b
and v12.16b, v12.16b, v11.16b

# qhasm: 2x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#14.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#14.2d, <vec_buf=reg128#10.2d
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v13.2d, <vec_Vp2_Vp3_Sp2_Sp3=v13.2d, <vec_buf=v9.2d
add v13.2d, v13.2d, v9.2d

# qhasm: 4x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
# asm 1: sshr <vec_buf=reg128#10.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#14.4s, #30
# asm 2: sshr <vec_buf=v9.4s, <vec_Vp2_Vp3_Sp2_Sp3=v13.4s, #30
sshr v9.4s, v13.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#10.2d, <vec_buf=reg128#10.2d, #32
# asm 2: shl >vec_buf=v9.2d, <vec_buf=v9.2d, #32
shl v9.2d, v9.2d, #32

# qhasm: 4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#14.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#14.4s, <vec_buf=reg128#10.4s
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v13.4s, <vec_Vp2_Vp3_Sp2_Sp3=v13.4s, <vec_buf=v9.4s
add v13.4s, v13.4s, v9.4s

# qhasm: 2x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
# asm 1: sshr <vec_buf=reg128#10.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#14.2d, #30
# asm 2: sshr <vec_buf=v9.2d, <vec_Vp2_Vp3_Sp2_Sp3=v13.2d, #30
sshr v9.2d, v13.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#10.2d, <vec_buf=reg128#10.2d, #32
# asm 2: ushr >vec_buf=v9.2d, <vec_buf=v9.2d, #32
ushr v9.2d, v9.2d, #32

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 &= vec_4x_2p30m1
# asm 1: and <vec_Vp2_Vp3_Sp2_Sp3=reg128#14.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#14.16b, <vec_4x_2p30m1=reg128#12.16b
# asm 2: and <vec_Vp2_Vp3_Sp2_Sp3=v13.16b, <vec_Vp2_Vp3_Sp2_Sp3=v13.16b, <vec_4x_2p30m1=v11.16b
and v13.16b, v13.16b, v11.16b

# qhasm: 2x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#15.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#15.2d, <vec_buf=reg128#10.2d
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v14.2d, <vec_Vp4_Vp5_Sp4_Sp5=v14.2d, <vec_buf=v9.2d
add v14.2d, v14.2d, v9.2d

# qhasm: 4x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
# asm 1: sshr <vec_buf=reg128#10.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#15.4s, #30
# asm 2: sshr <vec_buf=v9.4s, <vec_Vp4_Vp5_Sp4_Sp5=v14.4s, #30
sshr v9.4s, v14.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#10.2d, <vec_buf=reg128#10.2d, #32
# asm 2: shl >vec_buf=v9.2d, <vec_buf=v9.2d, #32
shl v9.2d, v9.2d, #32

# qhasm: 4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#15.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#15.4s, <vec_buf=reg128#10.4s
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v14.4s, <vec_Vp4_Vp5_Sp4_Sp5=v14.4s, <vec_buf=v9.4s
add v14.4s, v14.4s, v9.4s

# qhasm: 2x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
# asm 1: sshr <vec_buf=reg128#10.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#15.2d, #30
# asm 2: sshr <vec_buf=v9.2d, <vec_Vp4_Vp5_Sp4_Sp5=v14.2d, #30
sshr v9.2d, v14.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#10.2d, <vec_buf=reg128#10.2d, #32
# asm 2: ushr >vec_buf=v9.2d, <vec_buf=v9.2d, #32
ushr v9.2d, v9.2d, #32

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 &= vec_4x_2p30m1
# asm 1: and <vec_Vp4_Vp5_Sp4_Sp5=reg128#15.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#15.16b, <vec_4x_2p30m1=reg128#12.16b
# asm 2: and <vec_Vp4_Vp5_Sp4_Sp5=v14.16b, <vec_Vp4_Vp5_Sp4_Sp5=v14.16b, <vec_4x_2p30m1=v11.16b
and v14.16b, v14.16b, v11.16b

# qhasm: 2x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#6.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#6.2d, <vec_buf=reg128#10.2d
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v5.2d, <vec_Vp6_Vp7_Sp6_Sp7=v5.2d, <vec_buf=v9.2d
add v5.2d, v5.2d, v9.2d

# qhasm: 4x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
# asm 1: sshr <vec_buf=reg128#10.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#6.4s, #30
# asm 2: sshr <vec_buf=v9.4s, <vec_Vp6_Vp7_Sp6_Sp7=v5.4s, #30
sshr v9.4s, v5.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#10.2d, <vec_buf=reg128#10.2d, #32
# asm 2: shl >vec_buf=v9.2d, <vec_buf=v9.2d, #32
shl v9.2d, v9.2d, #32

# qhasm: 4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#6.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#6.4s, <vec_buf=reg128#10.4s
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v5.4s, <vec_Vp6_Vp7_Sp6_Sp7=v5.4s, <vec_buf=v9.4s
add v5.4s, v5.4s, v9.4s

# qhasm: 2x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
# asm 1: sshr <vec_buf=reg128#10.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#6.2d, #30
# asm 2: sshr <vec_buf=v9.2d, <vec_Vp6_Vp7_Sp6_Sp7=v5.2d, #30
sshr v9.2d, v5.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#10.2d, <vec_buf=reg128#10.2d, #32
# asm 2: ushr >vec_buf=v9.2d, <vec_buf=v9.2d, #32
ushr v9.2d, v9.2d, #32

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 &= vec_4x_2p30m1
# asm 1: and <vec_Vp6_Vp7_Sp6_Sp7=reg128#6.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#6.16b, <vec_4x_2p30m1=reg128#12.16b
# asm 2: and <vec_Vp6_Vp7_Sp6_Sp7=v5.16b, <vec_Vp6_Vp7_Sp6_Sp7=v5.16b, <vec_4x_2p30m1=v11.16b
and v5.16b, v5.16b, v11.16b

# qhasm: 2x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf
# asm 1: add >vec_Vp8_Vp9_Sp8_Sp9=reg128#7.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#7.2d, <vec_buf=reg128#10.2d
# asm 2: add >vec_Vp8_Vp9_Sp8_Sp9=v6.2d, <vec_Vp8_Vp9_Sp8_Sp9=v6.2d, <vec_buf=v9.2d
add v6.2d, v6.2d, v9.2d

# qhasm: 4x vec_vvhat_sshat = vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[3/4] vec_uuhat_rrhat_vvhat_sshat[3/4]
# asm 1: zip2 >vec_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s, <vec_uuhat_rrhat_vvhat_sshat=reg128#8.4s
# asm 2: zip2 >vec_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s, <vec_uuhat_rrhat_vvhat_sshat=v7.4s
zip2 v7.4s, v7.4s, v7.4s

# qhasm: reg128 vec_S0_S1_S0_S1

# qhasm: reg128 vec_S2_S3_S2_S3

# qhasm: reg128 vec_S4_S5_S4_S5

# qhasm: reg128 vec_S6_S7_S6_S7

# qhasm: reg128 vec_S8_S9_S8_S9

# qhasm: 2x vec_S0_S1_S0_S1 zip= vec_V0_V1_S0_S1[1/2] vec_V0_V1_S0_S1[1/2]
# asm 1: zip2 >vec_S0_S1_S0_S1=reg128#2.2d, <vec_V0_V1_S0_S1=reg128#2.2d, <vec_V0_V1_S0_S1=reg128#2.2d
# asm 2: zip2 >vec_S0_S1_S0_S1=v1.2d, <vec_V0_V1_S0_S1=v1.2d, <vec_V0_V1_S0_S1=v1.2d
zip2 v1.2d, v1.2d, v1.2d

# qhasm: 4x vec_buf = vec_P0_P1_P0_P1 - vec_S0_S1_S0_S1
# asm 1: sub >vec_buf=reg128#1.4s,<vec_P0_P1_P0_P1=reg128#1.4s,<vec_S0_S1_S0_S1=reg128#2.4s
# asm 2: sub >vec_buf=v0.4s,<vec_P0_P1_P0_P1=v0.4s,<vec_S0_S1_S0_S1=v1.4s
sub v0.4s,v0.4s,v1.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#1.16b, <vec_buf=reg128#1.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_buf=v0.16b, <vec_buf=v0.16b, <vec_vvhat_sshat=v7.16b
and v0.16b, v0.16b, v7.16b

# qhasm: 4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf
# asm 1: add >vec_Vp0_Vp1_Sp0_Sp1=reg128#1.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#13.4s, <vec_buf=reg128#1.4s
# asm 2: add >vec_Vp0_Vp1_Sp0_Sp1=v0.4s, <vec_Vp0_Vp1_Sp0_Sp1=v12.4s, <vec_buf=v0.4s
add v0.4s, v12.4s, v0.4s

# qhasm: 2x vec_S2_S3_S2_S3 zip= vec_V2_V3_S2_S3[1/2] vec_V2_V3_S2_S3[1/2]
# asm 1: zip2 >vec_S2_S3_S2_S3=reg128#2.2d, <vec_V2_V3_S2_S3=reg128#3.2d, <vec_V2_V3_S2_S3=reg128#3.2d
# asm 2: zip2 >vec_S2_S3_S2_S3=v1.2d, <vec_V2_V3_S2_S3=v2.2d, <vec_V2_V3_S2_S3=v2.2d
zip2 v1.2d, v2.2d, v2.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_S2_S3_S2_S3
# asm 1: sub >vec_buf=reg128#2.4s,<vec_4x_2p30m1=reg128#12.4s,<vec_S2_S3_S2_S3=reg128#2.4s
# asm 2: sub >vec_buf=v1.4s,<vec_4x_2p30m1=v11.4s,<vec_S2_S3_S2_S3=v1.4s
sub v1.4s,v11.4s,v1.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#2.16b, <vec_buf=reg128#2.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_buf=v1.16b, <vec_buf=v1.16b, <vec_vvhat_sshat=v7.16b
and v1.16b, v1.16b, v7.16b

# qhasm: 4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#2.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#14.4s, <vec_buf=reg128#2.4s
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v1.4s, <vec_Vp2_Vp3_Sp2_Sp3=v13.4s, <vec_buf=v1.4s
add v1.4s, v13.4s, v1.4s

# qhasm: 2x vec_S4_S5_S4_S5 zip= vec_V4_V5_S4_S5[1/2] vec_V4_V5_S4_S5[1/2]
# asm 1: zip2 >vec_S4_S5_S4_S5=reg128#3.2d, <vec_V4_V5_S4_S5=reg128#4.2d, <vec_V4_V5_S4_S5=reg128#4.2d
# asm 2: zip2 >vec_S4_S5_S4_S5=v2.2d, <vec_V4_V5_S4_S5=v3.2d, <vec_V4_V5_S4_S5=v3.2d
zip2 v2.2d, v3.2d, v3.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_S4_S5_S4_S5
# asm 1: sub >vec_buf=reg128#3.4s,<vec_4x_2p30m1=reg128#12.4s,<vec_S4_S5_S4_S5=reg128#3.4s
# asm 2: sub >vec_buf=v2.4s,<vec_4x_2p30m1=v11.4s,<vec_S4_S5_S4_S5=v2.4s
sub v2.4s,v11.4s,v2.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#3.16b, <vec_buf=reg128#3.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_buf=v2.16b, <vec_buf=v2.16b, <vec_vvhat_sshat=v7.16b
and v2.16b, v2.16b, v7.16b

# qhasm: 4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#3.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#15.4s, <vec_buf=reg128#3.4s
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v2.4s, <vec_Vp4_Vp5_Sp4_Sp5=v14.4s, <vec_buf=v2.4s
add v2.4s, v14.4s, v2.4s

# qhasm: 2x vec_S6_S7_S6_S7 zip= vec_V6_V7_S6_S7[1/2] vec_V6_V7_S6_S7[1/2]
# asm 1: zip2 >vec_S6_S7_S6_S7=reg128#4.2d, <vec_V6_V7_S6_S7=reg128#5.2d, <vec_V6_V7_S6_S7=reg128#5.2d
# asm 2: zip2 >vec_S6_S7_S6_S7=v3.2d, <vec_V6_V7_S6_S7=v4.2d, <vec_V6_V7_S6_S7=v4.2d
zip2 v3.2d, v4.2d, v4.2d

# qhasm: 4x vec_buf = vec_4x_2p30m1 - vec_S6_S7_S6_S7
# asm 1: sub >vec_buf=reg128#4.4s,<vec_4x_2p30m1=reg128#12.4s,<vec_S6_S7_S6_S7=reg128#4.4s
# asm 2: sub >vec_buf=v3.4s,<vec_4x_2p30m1=v11.4s,<vec_S6_S7_S6_S7=v3.4s
sub v3.4s,v11.4s,v3.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#4.16b, <vec_buf=reg128#4.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_buf=v3.16b, <vec_buf=v3.16b, <vec_vvhat_sshat=v7.16b
and v3.16b, v3.16b, v7.16b

# qhasm: 4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#4.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#6.4s, <vec_buf=reg128#4.4s
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v3.4s, <vec_Vp6_Vp7_Sp6_Sp7=v5.4s, <vec_buf=v3.4s
add v3.4s, v5.4s, v3.4s

# qhasm: 2x vec_S8_S9_S8_S9 zip= vec_V8_V9_S8_S9[1/2] vec_V8_V9_S8_S9[1/2]
# asm 1: zip2 >vec_S8_S9_S8_S9=reg128#5.2d, <vec_V8_V9_S8_S9=reg128#9.2d, <vec_V8_V9_S8_S9=reg128#9.2d
# asm 2: zip2 >vec_S8_S9_S8_S9=v4.2d, <vec_V8_V9_S8_S9=v8.2d, <vec_V8_V9_S8_S9=v8.2d
zip2 v4.2d, v8.2d, v8.2d

# qhasm: 4x vec_buf = vec_2x_2p15m1 - vec_S8_S9_S8_S9
# asm 1: sub >vec_buf=reg128#5.4s,<vec_2x_2p15m1=reg128#11.4s,<vec_S8_S9_S8_S9=reg128#5.4s
# asm 2: sub >vec_buf=v4.4s,<vec_2x_2p15m1=v10.4s,<vec_S8_S9_S8_S9=v4.4s
sub v4.4s,v10.4s,v4.4s

# qhasm: vec_buf &= vec_vvhat_sshat
# asm 1: and <vec_buf=reg128#5.16b, <vec_buf=reg128#5.16b, <vec_vvhat_sshat=reg128#8.16b
# asm 2: and <vec_buf=v4.16b, <vec_buf=v4.16b, <vec_vvhat_sshat=v7.16b
and v4.16b, v4.16b, v7.16b

# qhasm: 4x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf
# asm 1: add >vec_Vp8_Vp9_Sp8_Sp9=reg128#6.4s, <vec_Vp8_Vp9_Sp8_Sp9=reg128#7.4s, <vec_buf=reg128#5.4s
# asm 2: add >vec_Vp8_Vp9_Sp8_Sp9=v5.4s, <vec_Vp8_Vp9_Sp8_Sp9=v6.4s, <vec_buf=v4.4s
add v5.4s, v6.4s, v4.4s

# qhasm: 4x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
# asm 1: sshr <vec_buf=reg128#5.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.4s, #30
# asm 2: sshr <vec_buf=v4.4s, <vec_Vp0_Vp1_Sp0_Sp1=v0.4s, #30
sshr v4.4s, v0.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #32
# asm 2: shl >vec_buf=v4.2d, <vec_buf=v4.2d, #32
shl v4.2d, v4.2d, #32

# qhasm: 4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf
# asm 1: add >vec_Vp0_Vp1_Sp0_Sp1=reg128#1.4s, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.4s, <vec_buf=reg128#5.4s
# asm 2: add >vec_Vp0_Vp1_Sp0_Sp1=v0.4s, <vec_Vp0_Vp1_Sp0_Sp1=v0.4s, <vec_buf=v4.4s
add v0.4s, v0.4s, v4.4s

# qhasm: 2x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
# asm 1: sshr <vec_buf=reg128#5.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d, #30
# asm 2: sshr <vec_buf=v4.2d, <vec_Vp0_Vp1_Sp0_Sp1=v0.2d, #30
sshr v4.2d, v0.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #32
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #32
ushr v4.2d, v4.2d, #32

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 &= vec_4x_2p30m1
# asm 1: and <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.16b, <vec_4x_2p30m1=reg128#12.16b
# asm 2: and <vec_Vp0_Vp1_Sp0_Sp1=v0.16b, <vec_Vp0_Vp1_Sp0_Sp1=v0.16b, <vec_4x_2p30m1=v11.16b
and v0.16b, v0.16b, v11.16b

# qhasm: 2x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d, <vec_buf=reg128#5.2d
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v1.2d, <vec_Vp2_Vp3_Sp2_Sp3=v1.2d, <vec_buf=v4.2d
add v1.2d, v1.2d, v4.2d

# qhasm: 4x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
# asm 1: sshr <vec_buf=reg128#5.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.4s, #30
# asm 2: sshr <vec_buf=v4.4s, <vec_Vp2_Vp3_Sp2_Sp3=v1.4s, #30
sshr v4.4s, v1.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #32
# asm 2: shl >vec_buf=v4.2d, <vec_buf=v4.2d, #32
shl v4.2d, v4.2d, #32

# qhasm: 4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
# asm 1: add >vec_Vp2_Vp3_Sp2_Sp3=reg128#2.4s, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.4s, <vec_buf=reg128#5.4s
# asm 2: add >vec_Vp2_Vp3_Sp2_Sp3=v1.4s, <vec_Vp2_Vp3_Sp2_Sp3=v1.4s, <vec_buf=v4.4s
add v1.4s, v1.4s, v4.4s

# qhasm: 2x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
# asm 1: sshr <vec_buf=reg128#5.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d, #30
# asm 2: sshr <vec_buf=v4.2d, <vec_Vp2_Vp3_Sp2_Sp3=v1.2d, #30
sshr v4.2d, v1.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #32
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #32
ushr v4.2d, v4.2d, #32

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 &= vec_4x_2p30m1
# asm 1: and <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.16b, <vec_4x_2p30m1=reg128#12.16b
# asm 2: and <vec_Vp2_Vp3_Sp2_Sp3=v1.16b, <vec_Vp2_Vp3_Sp2_Sp3=v1.16b, <vec_4x_2p30m1=v11.16b
and v1.16b, v1.16b, v11.16b

# qhasm: 2x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d, <vec_buf=reg128#5.2d
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v2.2d, <vec_Vp4_Vp5_Sp4_Sp5=v2.2d, <vec_buf=v4.2d
add v2.2d, v2.2d, v4.2d

# qhasm: 4x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
# asm 1: sshr <vec_buf=reg128#5.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.4s, #30
# asm 2: sshr <vec_buf=v4.4s, <vec_Vp4_Vp5_Sp4_Sp5=v2.4s, #30
sshr v4.4s, v2.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #32
# asm 2: shl >vec_buf=v4.2d, <vec_buf=v4.2d, #32
shl v4.2d, v4.2d, #32

# qhasm: 4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
# asm 1: add >vec_Vp4_Vp5_Sp4_Sp5=reg128#3.4s, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.4s, <vec_buf=reg128#5.4s
# asm 2: add >vec_Vp4_Vp5_Sp4_Sp5=v2.4s, <vec_Vp4_Vp5_Sp4_Sp5=v2.4s, <vec_buf=v4.4s
add v2.4s, v2.4s, v4.4s

# qhasm: 2x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
# asm 1: sshr <vec_buf=reg128#5.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d, #30
# asm 2: sshr <vec_buf=v4.2d, <vec_Vp4_Vp5_Sp4_Sp5=v2.2d, #30
sshr v4.2d, v2.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #32
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #32
ushr v4.2d, v4.2d, #32

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 &= vec_4x_2p30m1
# asm 1: and <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.16b, <vec_4x_2p30m1=reg128#12.16b
# asm 2: and <vec_Vp4_Vp5_Sp4_Sp5=v2.16b, <vec_Vp4_Vp5_Sp4_Sp5=v2.16b, <vec_4x_2p30m1=v11.16b
and v2.16b, v2.16b, v11.16b

# qhasm: 2x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d, <vec_buf=reg128#5.2d
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v3.2d, <vec_Vp6_Vp7_Sp6_Sp7=v3.2d, <vec_buf=v4.2d
add v3.2d, v3.2d, v4.2d

# qhasm: 4x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
# asm 1: sshr <vec_buf=reg128#5.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.4s, #30
# asm 2: sshr <vec_buf=v4.4s, <vec_Vp6_Vp7_Sp6_Sp7=v3.4s, #30
sshr v4.4s, v3.4s, #30

# qhasm: 2x vec_buf <<= 32
# asm 1: shl >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #32
# asm 2: shl >vec_buf=v4.2d, <vec_buf=v4.2d, #32
shl v4.2d, v4.2d, #32

# qhasm: 4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
# asm 1: add >vec_Vp6_Vp7_Sp6_Sp7=reg128#4.4s, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.4s, <vec_buf=reg128#5.4s
# asm 2: add >vec_Vp6_Vp7_Sp6_Sp7=v3.4s, <vec_Vp6_Vp7_Sp6_Sp7=v3.4s, <vec_buf=v4.4s
add v3.4s, v3.4s, v4.4s

# qhasm: 2x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
# asm 1: sshr <vec_buf=reg128#5.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d, #30
# asm 2: sshr <vec_buf=v4.2d, <vec_Vp6_Vp7_Sp6_Sp7=v3.2d, #30
sshr v4.2d, v3.2d, #30

# qhasm: 2x vec_buf unsigned>>= 32
# asm 1: ushr >vec_buf=reg128#5.2d, <vec_buf=reg128#5.2d, #32
# asm 2: ushr >vec_buf=v4.2d, <vec_buf=v4.2d, #32
ushr v4.2d, v4.2d, #32

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 &= vec_4x_2p30m1
# asm 1: and <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.16b, <vec_4x_2p30m1=reg128#12.16b
# asm 2: and <vec_Vp6_Vp7_Sp6_Sp7=v3.16b, <vec_Vp6_Vp7_Sp6_Sp7=v3.16b, <vec_4x_2p30m1=v11.16b
and v3.16b, v3.16b, v11.16b

# qhasm: 2x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf
# asm 1: add >vec_Vp8_Vp9_Sp8_Sp9=reg128#5.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#6.2d, <vec_buf=reg128#5.2d
# asm 2: add >vec_Vp8_Vp9_Sp8_Sp9=v4.2d, <vec_Vp8_Vp9_Sp8_Sp9=v5.2d, <vec_buf=v4.2d
add v4.2d, v5.2d, v4.2d

# qhasm: reg128 vec_small_tmp

# qhasm: 2x vec_small_tmp = vec_Vp8_Vp9_Sp8_Sp9 >> 15
# asm 1: sshr <vec_small_tmp=reg128#6.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#5.2d, #15
# asm 2: sshr <vec_small_tmp=v5.2d, <vec_Vp8_Vp9_Sp8_Sp9=v4.2d, #15
sshr v5.2d, v4.2d, #15

# qhasm: vec_Vp8_Vp9_Sp8_Sp9 &= vec_2x_2p15m1
# asm 1: and <vec_Vp8_Vp9_Sp8_Sp9=reg128#5.16b, <vec_Vp8_Vp9_Sp8_Sp9=reg128#5.16b, <vec_2x_2p15m1=reg128#11.16b
# asm 2: and <vec_Vp8_Vp9_Sp8_Sp9=v4.16b, <vec_Vp8_Vp9_Sp8_Sp9=v4.16b, <vec_2x_2p15m1=v10.16b
and v4.16b, v4.16b, v10.16b

# qhasm: 4x vec_small_tmp = vec_small_tmp[0/4] vec_small_tmp[2/4] vec_small_tmp[0/4] vec_small_tmp[2/4]
# asm 1: uzp1 >vec_small_tmp=reg128#6.4s, <vec_small_tmp=reg128#6.4s, <vec_small_tmp=reg128#6.4s
# asm 2: uzp1 >vec_small_tmp=v5.4s, <vec_small_tmp=v5.4s, <vec_small_tmp=v5.4s
uzp1 v5.4s, v5.4s, v5.4s

# qhasm: reg128 vec_nineteen

# qhasm: int64 nineteen

# qhasm: nineteen = 19
# asm 1: mov >nineteen=int64#7, #19
# asm 2: mov >nineteen=x6, #19
mov x6, #19

# qhasm: 2x vec_nineteen = nineteen
# asm 1: dup <vec_nineteen=reg128#7.2d, <nineteen=int64#7
# asm 2: dup <vec_nineteen=v6.2d, <nineteen=x6
dup v6.2d, x6

# qhasm: 2x vec_Vp0_Vp1_Sp0_Sp1 += vec_small_tmp[0] unsigned* vec_nineteen[0/4]
# asm 1: umlal <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d, <vec_small_tmp=reg128#6.2s, <vec_nineteen=reg128#7.s[0]
# asm 2: umlal <vec_Vp0_Vp1_Sp0_Sp1=v0.2d, <vec_small_tmp=v5.2s, <vec_nineteen=v6.s[0]
umlal v0.2d, v5.2s, v6.s[0]

# qhasm: vec_small_tmp = vec_nineteen
# asm 1: mov >vec_small_tmp=reg128#6.16b, <vec_nineteen=reg128#7.16b
# asm 2: mov >vec_small_tmp=v5.16b, <vec_nineteen=v6.16b
mov v5.16b, v6.16b

# qhasm: reg128 vec_4x_2p30a2p31

# qhasm: reg128 vec_2x_2p30a2p31

# qhasm: reg128 vec_2x_2p62a2p63

# qhasm: reg128 vec_reduction_hat

# qhasm: 4x vec_4x_2p30a2p31 = 192 << 24
# asm 1: movi <vec_4x_2p30a2p31=reg128#7.4s, #192, lsl #24
# asm 2: movi <vec_4x_2p30a2p31=v6.4s, #192, lsl #24
movi v6.4s, #192, lsl #24

# qhasm: 2x vec_2x_2p30a2p31 = vec_4x_2p30a2p31 unsigned>> 32
# asm 1: ushr >vec_2x_2p30a2p31=reg128#7.2d, <vec_4x_2p30a2p31=reg128#7.2d, #32
# asm 2: ushr >vec_2x_2p30a2p31=v6.2d, <vec_4x_2p30a2p31=v6.2d, #32
ushr v6.2d, v6.2d, #32

# qhasm: 2x vec_2x_2p62a2p63 = vec_2x_2p30a2p31 << 32
# asm 1: shl >vec_2x_2p62a2p63=reg128#8.2d, <vec_2x_2p30a2p31=reg128#7.2d, #32
# asm 2: shl >vec_2x_2p62a2p63=v7.2d, <vec_2x_2p30a2p31=v6.2d, #32
shl v7.2d, v6.2d, #32

# qhasm: 2x vec_small_tmp += vec_Vp0_Vp1_Sp0_Sp1 
# asm 1: add <vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d
# asm 2: add <vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, <vec_Vp0_Vp1_Sp0_Sp1=v0.2d
add v5.2d, v5.2d, v0.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_small_tmp=reg128#6.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_small_tmp=v5.16b, <vec_2x_2p30a2p31=v6.16b
and v5.16b, v5.16b, v6.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #2
# asm 2: shl >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #2
shl v5.2d, v5.2d, #2

# qhasm: 2x vec_small_tmp += vec_Vp0_Vp1_Sp0_Sp1 
# asm 1: add <vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d
# asm 2: add <vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, <vec_Vp0_Vp1_Sp0_Sp1=v0.2d
add v5.2d, v5.2d, v0.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_small_tmp=reg128#6.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_small_tmp=v5.16b, <vec_2x_2p62a2p63=v7.16b
and v5.16b, v5.16b, v7.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #62
# asm 2: ushr >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #62
ushr v5.2d, v5.2d, #62

# qhasm: 2x vec_small_tmp += vec_Vp2_Vp3_Sp2_Sp3 
# asm 1: add <vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d
# asm 2: add <vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, <vec_Vp2_Vp3_Sp2_Sp3=v1.2d
add v5.2d, v5.2d, v1.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_small_tmp=reg128#6.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_small_tmp=v5.16b, <vec_2x_2p30a2p31=v6.16b
and v5.16b, v5.16b, v6.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #2
# asm 2: shl >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #2
shl v5.2d, v5.2d, #2

# qhasm: 2x vec_small_tmp += vec_Vp2_Vp3_Sp2_Sp3 
# asm 1: add <vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d
# asm 2: add <vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, <vec_Vp2_Vp3_Sp2_Sp3=v1.2d
add v5.2d, v5.2d, v1.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_small_tmp=reg128#6.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_small_tmp=v5.16b, <vec_2x_2p62a2p63=v7.16b
and v5.16b, v5.16b, v7.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #62
# asm 2: ushr >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #62
ushr v5.2d, v5.2d, #62

# qhasm: 2x vec_small_tmp += vec_Vp4_Vp5_Sp4_Sp5
# asm 1: add <vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d
# asm 2: add <vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, <vec_Vp4_Vp5_Sp4_Sp5=v2.2d
add v5.2d, v5.2d, v2.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_small_tmp=reg128#6.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_small_tmp=v5.16b, <vec_2x_2p30a2p31=v6.16b
and v5.16b, v5.16b, v6.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #2
# asm 2: shl >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #2
shl v5.2d, v5.2d, #2

# qhasm: 2x vec_small_tmp += vec_Vp4_Vp5_Sp4_Sp5
# asm 1: add <vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d
# asm 2: add <vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, <vec_Vp4_Vp5_Sp4_Sp5=v2.2d
add v5.2d, v5.2d, v2.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_small_tmp=reg128#6.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_small_tmp=v5.16b, <vec_2x_2p62a2p63=v7.16b
and v5.16b, v5.16b, v7.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #62
# asm 2: ushr >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #62
ushr v5.2d, v5.2d, #62

# qhasm: 2x vec_small_tmp += vec_Vp6_Vp7_Sp6_Sp7
# asm 1: add <vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d
# asm 2: add <vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, <vec_Vp6_Vp7_Sp6_Sp7=v3.2d
add v5.2d, v5.2d, v3.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_small_tmp=reg128#6.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_small_tmp=v5.16b, <vec_2x_2p30a2p31=v6.16b
and v5.16b, v5.16b, v6.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #2
# asm 2: shl >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #2
shl v5.2d, v5.2d, #2

# qhasm: 2x vec_small_tmp += vec_Vp6_Vp7_Sp6_Sp7
# asm 1: add <vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d
# asm 2: add <vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, <vec_Vp6_Vp7_Sp6_Sp7=v3.2d
add v5.2d, v5.2d, v3.2d

# qhasm: vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_small_tmp=reg128#6.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_small_tmp=v5.16b, <vec_2x_2p62a2p63=v7.16b
and v5.16b, v5.16b, v7.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #62
# asm 2: ushr >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #62
ushr v5.2d, v5.2d, #62

# qhasm: 2x vec_small_tmp += vec_Vp8_Vp9_Sp8_Sp9
# asm 1: add <vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#5.2d
# asm 2: add <vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, <vec_Vp8_Vp9_Sp8_Sp9=v4.2d
add v5.2d, v5.2d, v4.2d

# qhasm: 2x vec_small_tmp = vec_2x_2p15m1 - vec_small_tmp
# asm 1: sub >vec_small_tmp=reg128#6.2d,<vec_2x_2p15m1=reg128#11.2d,<vec_small_tmp=reg128#6.2d
# asm 2: sub >vec_small_tmp=v5.2d,<vec_2x_2p15m1=v10.2d,<vec_small_tmp=v5.2d
sub v5.2d,v10.2d,v5.2d

# qhasm: 2x vec_reduction_hat = vec_small_tmp >> 63
# asm 1: sshr <vec_reduction_hat=reg128#9.2d, <vec_small_tmp=reg128#6.2d, #63
# asm 2: sshr <vec_reduction_hat=v8.2d, <vec_small_tmp=v5.2d, #63
sshr v8.2d, v5.2d, #63

# qhasm: int64 number

# qhasm: reg128 vec_number

# qhasm: number = 19
# asm 1: mov >number=int64#7, #19
# asm 2: mov >number=x6, #19
mov x6, #19

# qhasm: 2x vec_number = number
# asm 1: dup <vec_number=reg128#6.2d, <number=int64#7
# asm 2: dup <vec_number=v5.2d, <number=x6
dup v5.2d, x6

# qhasm: vec_number &= vec_reduction_hat
# asm 1: and <vec_number=reg128#6.16b, <vec_number=reg128#6.16b, <vec_reduction_hat=reg128#9.16b
# asm 2: and <vec_number=v5.16b, <vec_number=v5.16b, <vec_reduction_hat=v8.16b
and v5.16b, v5.16b, v8.16b

# qhasm: 2x vec_Vp0_Vp1_Sp0_Sp1 += vec_number
# asm 1: add <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d, <vec_number=reg128#6.2d
# asm 2: add <vec_Vp0_Vp1_Sp0_Sp1=v0.2d, <vec_Vp0_Vp1_Sp0_Sp1=v0.2d, <vec_number=v5.2d
add v0.2d, v0.2d, v5.2d

# qhasm: number = 32768
# asm 1: mov >number=int64#7, #32768
# asm 2: mov >number=x6, #32768
mov x6, #32768

# qhasm: 2x vec_number = number
# asm 1: dup <vec_number=reg128#6.2d, <number=int64#7
# asm 2: dup <vec_number=v5.2d, <number=x6
dup v5.2d, x6

# qhasm: vec_number &= vec_reduction_hat
# asm 1: and <vec_number=reg128#6.16b, <vec_number=reg128#6.16b, <vec_reduction_hat=reg128#9.16b
# asm 2: and <vec_number=v5.16b, <vec_number=v5.16b, <vec_reduction_hat=v8.16b
and v5.16b, v5.16b, v8.16b

# qhasm: 2x vec_Vp8_Vp9_Sp8_Sp9 -= vec_number
# asm 1: sub <vec_Vp8_Vp9_Sp8_Sp9=reg128#5.2d,<vec_Vp8_Vp9_Sp8_Sp9=reg128#5.2d,<vec_number=reg128#6.2d
# asm 2: sub <vec_Vp8_Vp9_Sp8_Sp9=v4.2d,<vec_Vp8_Vp9_Sp8_Sp9=v4.2d,<vec_number=v5.2d
sub v4.2d,v4.2d,v5.2d

# qhasm: vec_small_tmp = vec_Vp0_Vp1_Sp0_Sp1 & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_Vp0_Vp1_Sp0_Sp1=v0.16b, <vec_2x_2p30a2p31=v6.16b
and v5.16b, v0.16b, v6.16b

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 & ~vec_2x_2p30a2p31
# asm 1: bic >vec_Vp0_Vp1_Sp0_Sp1=reg128#1.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: bic >vec_Vp0_Vp1_Sp0_Sp1=v0.16b, <vec_Vp0_Vp1_Sp0_Sp1=v0.16b, <vec_2x_2p30a2p31=v6.16b
bic v0.16b, v0.16b, v6.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #2
# asm 2: shl >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #2
shl v5.2d, v5.2d, #2

# qhasm: 2x vec_Vp0_Vp1_Sp0_Sp1 += vec_small_tmp
# asm 1: add <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d, <vec_small_tmp=reg128#6.2d
# asm 2: add <vec_Vp0_Vp1_Sp0_Sp1=v0.2d, <vec_Vp0_Vp1_Sp0_Sp1=v0.2d, <vec_small_tmp=v5.2d
add v0.2d, v0.2d, v5.2d

# qhasm: vec_small_tmp = vec_Vp0_Vp1_Sp0_Sp1 & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_Vp0_Vp1_Sp0_Sp1=v0.16b, <vec_2x_2p62a2p63=v7.16b
and v5.16b, v0.16b, v7.16b

# qhasm: vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 & ~vec_2x_2p62a2p63
# asm 1: bic >vec_Vp0_Vp1_Sp0_Sp1=reg128#1.16b, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: bic >vec_Vp0_Vp1_Sp0_Sp1=v0.16b, <vec_Vp0_Vp1_Sp0_Sp1=v0.16b, <vec_2x_2p62a2p63=v7.16b
bic v0.16b, v0.16b, v7.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #62
# asm 2: ushr >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #62
ushr v5.2d, v5.2d, #62

# qhasm: 2x vec_Vp2_Vp3_Sp2_Sp3 += vec_small_tmp
# asm 1: add <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d, <vec_small_tmp=reg128#6.2d
# asm 2: add <vec_Vp2_Vp3_Sp2_Sp3=v1.2d, <vec_Vp2_Vp3_Sp2_Sp3=v1.2d, <vec_small_tmp=v5.2d
add v1.2d, v1.2d, v5.2d

# qhasm: vec_small_tmp = vec_Vp2_Vp3_Sp2_Sp3 & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_Vp2_Vp3_Sp2_Sp3=v1.16b, <vec_2x_2p30a2p31=v6.16b
and v5.16b, v1.16b, v6.16b

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 & ~vec_2x_2p30a2p31
# asm 1: bic >vec_Vp2_Vp3_Sp2_Sp3=reg128#2.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: bic >vec_Vp2_Vp3_Sp2_Sp3=v1.16b, <vec_Vp2_Vp3_Sp2_Sp3=v1.16b, <vec_2x_2p30a2p31=v6.16b
bic v1.16b, v1.16b, v6.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #2
# asm 2: shl >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #2
shl v5.2d, v5.2d, #2

# qhasm: 2x vec_Vp2_Vp3_Sp2_Sp3 += vec_small_tmp
# asm 1: add <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d, <vec_small_tmp=reg128#6.2d
# asm 2: add <vec_Vp2_Vp3_Sp2_Sp3=v1.2d, <vec_Vp2_Vp3_Sp2_Sp3=v1.2d, <vec_small_tmp=v5.2d
add v1.2d, v1.2d, v5.2d

# qhasm: vec_small_tmp = vec_Vp2_Vp3_Sp2_Sp3 & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_Vp2_Vp3_Sp2_Sp3=v1.16b, <vec_2x_2p62a2p63=v7.16b
and v5.16b, v1.16b, v7.16b

# qhasm: vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 & ~vec_2x_2p62a2p63
# asm 1: bic >vec_Vp2_Vp3_Sp2_Sp3=reg128#2.16b, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: bic >vec_Vp2_Vp3_Sp2_Sp3=v1.16b, <vec_Vp2_Vp3_Sp2_Sp3=v1.16b, <vec_2x_2p62a2p63=v7.16b
bic v1.16b, v1.16b, v7.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #62
# asm 2: ushr >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #62
ushr v5.2d, v5.2d, #62

# qhasm: 2x vec_Vp4_Vp5_Sp4_Sp5 += vec_small_tmp
# asm 1: add <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d, <vec_small_tmp=reg128#6.2d
# asm 2: add <vec_Vp4_Vp5_Sp4_Sp5=v2.2d, <vec_Vp4_Vp5_Sp4_Sp5=v2.2d, <vec_small_tmp=v5.2d
add v2.2d, v2.2d, v5.2d

# qhasm: vec_small_tmp = vec_Vp4_Vp5_Sp4_Sp5 & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_Vp4_Vp5_Sp4_Sp5=v2.16b, <vec_2x_2p30a2p31=v6.16b
and v5.16b, v2.16b, v6.16b

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 & ~vec_2x_2p30a2p31
# asm 1: bic >vec_Vp4_Vp5_Sp4_Sp5=reg128#3.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: bic >vec_Vp4_Vp5_Sp4_Sp5=v2.16b, <vec_Vp4_Vp5_Sp4_Sp5=v2.16b, <vec_2x_2p30a2p31=v6.16b
bic v2.16b, v2.16b, v6.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #2
# asm 2: shl >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #2
shl v5.2d, v5.2d, #2

# qhasm: 2x vec_Vp4_Vp5_Sp4_Sp5 += vec_small_tmp
# asm 1: add <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d, <vec_small_tmp=reg128#6.2d
# asm 2: add <vec_Vp4_Vp5_Sp4_Sp5=v2.2d, <vec_Vp4_Vp5_Sp4_Sp5=v2.2d, <vec_small_tmp=v5.2d
add v2.2d, v2.2d, v5.2d

# qhasm: vec_small_tmp = vec_Vp4_Vp5_Sp4_Sp5 & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_Vp4_Vp5_Sp4_Sp5=v2.16b, <vec_2x_2p62a2p63=v7.16b
and v5.16b, v2.16b, v7.16b

# qhasm: vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 & ~vec_2x_2p62a2p63
# asm 1: bic >vec_Vp4_Vp5_Sp4_Sp5=reg128#3.16b, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: bic >vec_Vp4_Vp5_Sp4_Sp5=v2.16b, <vec_Vp4_Vp5_Sp4_Sp5=v2.16b, <vec_2x_2p62a2p63=v7.16b
bic v2.16b, v2.16b, v7.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #62
# asm 2: ushr >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #62
ushr v5.2d, v5.2d, #62

# qhasm: 2x vec_Vp6_Vp7_Sp6_Sp7 += vec_small_tmp
# asm 1: add <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d, <vec_small_tmp=reg128#6.2d
# asm 2: add <vec_Vp6_Vp7_Sp6_Sp7=v3.2d, <vec_Vp6_Vp7_Sp6_Sp7=v3.2d, <vec_small_tmp=v5.2d
add v3.2d, v3.2d, v5.2d

# qhasm: vec_small_tmp = vec_Vp6_Vp7_Sp6_Sp7 & vec_2x_2p30a2p31
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_Vp6_Vp7_Sp6_Sp7=v3.16b, <vec_2x_2p30a2p31=v6.16b
and v5.16b, v3.16b, v6.16b

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 & ~vec_2x_2p30a2p31
# asm 1: bic >vec_Vp6_Vp7_Sp6_Sp7=reg128#4.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.16b, <vec_2x_2p30a2p31=reg128#7.16b
# asm 2: bic >vec_Vp6_Vp7_Sp6_Sp7=v3.16b, <vec_Vp6_Vp7_Sp6_Sp7=v3.16b, <vec_2x_2p30a2p31=v6.16b
bic v3.16b, v3.16b, v6.16b

# qhasm: 2x vec_small_tmp <<= 2
# asm 1: shl >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #2
# asm 2: shl >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #2
shl v5.2d, v5.2d, #2

# qhasm: 2x vec_Vp6_Vp7_Sp6_Sp7 += vec_small_tmp
# asm 1: add <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d, <vec_small_tmp=reg128#6.2d
# asm 2: add <vec_Vp6_Vp7_Sp6_Sp7=v3.2d, <vec_Vp6_Vp7_Sp6_Sp7=v3.2d, <vec_small_tmp=v5.2d
add v3.2d, v3.2d, v5.2d

# qhasm: vec_small_tmp = vec_Vp6_Vp7_Sp6_Sp7 & vec_2x_2p62a2p63
# asm 1: and >vec_small_tmp=reg128#6.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: and >vec_small_tmp=v5.16b, <vec_Vp6_Vp7_Sp6_Sp7=v3.16b, <vec_2x_2p62a2p63=v7.16b
and v5.16b, v3.16b, v7.16b

# qhasm: vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 & ~vec_2x_2p62a2p63
# asm 1: bic >vec_Vp6_Vp7_Sp6_Sp7=reg128#4.16b, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.16b, <vec_2x_2p62a2p63=reg128#8.16b
# asm 2: bic >vec_Vp6_Vp7_Sp6_Sp7=v3.16b, <vec_Vp6_Vp7_Sp6_Sp7=v3.16b, <vec_2x_2p62a2p63=v7.16b
bic v3.16b, v3.16b, v7.16b

# qhasm: 2x vec_small_tmp unsigned>>= 62
# asm 1: ushr >vec_small_tmp=reg128#6.2d, <vec_small_tmp=reg128#6.2d, #62
# asm 2: ushr >vec_small_tmp=v5.2d, <vec_small_tmp=v5.2d, #62
ushr v5.2d, v5.2d, #62

# qhasm: 2x vec_Vp8_Vp9_Sp8_Sp9 += vec_small_tmp
# asm 1: add <vec_Vp8_Vp9_Sp8_Sp9=reg128#5.2d, <vec_Vp8_Vp9_Sp8_Sp9=reg128#5.2d, <vec_small_tmp=reg128#6.2d
# asm 2: add <vec_Vp8_Vp9_Sp8_Sp9=v4.2d, <vec_Vp8_Vp9_Sp8_Sp9=v4.2d, <vec_small_tmp=v5.2d
add v4.2d, v4.2d, v5.2d

# qhasm: reg128 vec_Vp0_Vp1_Vp2_Vp3

# qhasm: reg128 vec_Sp0_Sp1_Sp2_Sp3

# qhasm: 2x vec_Vp0_Vp1_Vp2_Vp3 zip= vec_Vp0_Vp1_Sp0_Sp1[0/2] vec_Vp2_Vp3_Sp2_Sp3[0/2]
# asm 1: zip1 >vec_Vp0_Vp1_Vp2_Vp3=reg128#6.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d
# asm 2: zip1 >vec_Vp0_Vp1_Vp2_Vp3=v5.2d, <vec_Vp0_Vp1_Sp0_Sp1=v0.2d, <vec_Vp2_Vp3_Sp2_Sp3=v1.2d
zip1 v5.2d, v0.2d, v1.2d

# qhasm: 2x vec_Sp0_Sp1_Sp2_Sp3 zip= vec_Vp0_Vp1_Sp0_Sp1[1/2] vec_Vp2_Vp3_Sp2_Sp3[1/2]
# asm 1: zip2 >vec_Sp0_Sp1_Sp2_Sp3=reg128#1.2d, <vec_Vp0_Vp1_Sp0_Sp1=reg128#1.2d, <vec_Vp2_Vp3_Sp2_Sp3=reg128#2.2d
# asm 2: zip2 >vec_Sp0_Sp1_Sp2_Sp3=v0.2d, <vec_Vp0_Vp1_Sp0_Sp1=v0.2d, <vec_Vp2_Vp3_Sp2_Sp3=v1.2d
zip2 v0.2d, v0.2d, v1.2d

# qhasm: reg128 vec_Vp4_Vp5_Vp6_Vp7

# qhasm: reg128 vec_Sp4_Sp5_Sp6_Sp7

# qhasm: 2x vec_Vp4_Vp5_Vp6_Vp7 zip= vec_Vp4_Vp5_Sp4_Sp5[0/2] vec_Vp6_Vp7_Sp6_Sp7[0/2]
# asm 1: zip1 >vec_Vp4_Vp5_Vp6_Vp7=reg128#2.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d
# asm 2: zip1 >vec_Vp4_Vp5_Vp6_Vp7=v1.2d, <vec_Vp4_Vp5_Sp4_Sp5=v2.2d, <vec_Vp6_Vp7_Sp6_Sp7=v3.2d
zip1 v1.2d, v2.2d, v3.2d

# qhasm: 2x vec_Sp4_Sp5_Sp6_Sp7 zip= vec_Vp4_Vp5_Sp4_Sp5[1/2] vec_Vp6_Vp7_Sp6_Sp7[1/2]
# asm 1: zip2 >vec_Sp4_Sp5_Sp6_Sp7=reg128#3.2d, <vec_Vp4_Vp5_Sp4_Sp5=reg128#3.2d, <vec_Vp6_Vp7_Sp6_Sp7=reg128#4.2d
# asm 2: zip2 >vec_Sp4_Sp5_Sp6_Sp7=v2.2d, <vec_Vp4_Vp5_Sp4_Sp5=v2.2d, <vec_Vp6_Vp7_Sp6_Sp7=v3.2d
zip2 v2.2d, v2.2d, v3.2d

# qhasm: mem256[pointer_V] = vec_Vp0_Vp1_Vp2_Vp3, vec_Vp4_Vp5_Vp6_Vp7
# asm 1: stp <vec_Vp0_Vp1_Vp2_Vp3=reg128#6%qregname, <vec_Vp4_Vp5_Vp6_Vp7=reg128#2%qregname, [<pointer_V=int64#4]
# asm 2: stp <vec_Vp0_Vp1_Vp2_Vp3=q5, <vec_Vp4_Vp5_Vp6_Vp7=q1, [<pointer_V=x3]
stp q5, q1, [x3]

# qhasm: mem256[pointer_S] = vec_Sp0_Sp1_Sp2_Sp3, vec_Sp4_Sp5_Sp6_Sp7
# asm 1: stp <vec_Sp0_Sp1_Sp2_Sp3=reg128#1%qregname, <vec_Sp4_Sp5_Sp6_Sp7=reg128#3%qregname, [<pointer_S=int64#5]
# asm 2: stp <vec_Sp0_Sp1_Sp2_Sp3=q0, <vec_Sp4_Sp5_Sp6_Sp7=q2, [<pointer_S=x4]
stp q0, q2, [x4]

# qhasm: int64 Vp8

# qhasm: Vp8 = vec_Vp8_Vp9_Sp8_Sp9[0/2]
# asm 1: umov >Vp8=int64#7, <vec_Vp8_Vp9_Sp8_Sp9=reg128#5.d[0]
# asm 2: umov >Vp8=x6, <vec_Vp8_Vp9_Sp8_Sp9=v4.d[0]
umov x6, v4.d[0]

# qhasm: mem32[pointer_V+32] = Vp8
# asm 1: str <Vp8=int64#7%wregname, [<pointer_V=int64#4, #32]
# asm 2: str <Vp8=w6, [<pointer_V=x3, #32]
str w6, [x3, #32]

# qhasm: int64 Sp8

# qhasm: Sp8 = vec_Vp8_Vp9_Sp8_Sp9[1/2]
# asm 1: umov >Sp8=int64#4, <vec_Vp8_Vp9_Sp8_Sp9=reg128#5.d[1]
# asm 2: umov >Sp8=x3, <vec_Vp8_Vp9_Sp8_Sp9=v4.d[1]
umov x3, v4.d[1]

# qhasm: mem32[pointer_S+32] = Sp8
# asm 1: str <Sp8=int64#4%wregname, [<pointer_S=int64#5, #32]
# asm 2: str <Sp8=w3, [<pointer_S=x4, #32]
str w3, [x4, #32]

# qhasm: int64 f_hi

# qhasm: int64 f

# qhasm: int64 g_hi

# qhasm: int64 g

# qhasm: f_hi = mem32[pointer_F+4]
# asm 1: ldr >f_hi=int64#4%wregname, [<pointer_F=int64#2, 4]
# asm 2: ldr >f_hi=w3, [<pointer_F=x1, 4]
ldr w3, [x1, 4]

# qhasm: f = mem32[pointer_F]
# asm 1: ldr >f=int64#2%wregname, [<pointer_F=int64#2]
# asm 2: ldr >f=w1, [<pointer_F=x1]
ldr w1, [x1]

# qhasm: g_hi = mem32[pointer_G+4]
# asm 1: ldr >g_hi=int64#5%wregname, [<pointer_G=int64#3, 4]
# asm 2: ldr >g_hi=w4, [<pointer_G=x2, 4]
ldr w4, [x2, 4]

# qhasm: g = mem32[pointer_G]
# asm 1: ldr >g=int64#3%wregname, [<pointer_G=int64#3]
# asm 2: ldr >g=w2, [<pointer_G=x2]
ldr w2, [x2]

# qhasm: f = f + f_hi << 30
# asm 1: add >f=int64#2,<f=int64#2,<f_hi=int64#4,LSL #30
# asm 2: add >f=x1,<f=x1,<f_hi=x3,LSL #30
add x1,x1,x3,LSL #30

# qhasm: g = g + g_hi << 30
# asm 1: add >g=int64#3,<g=int64#3,<g_hi=int64#5,LSL #30
# asm 2: add >g=x2,<g=x2,<g_hi=x4,LSL #30
add x2,x2,x4,LSL #30

# qhasm: int64 m

# qhasm: m = mem64[pointer_delta]
# asm 1: ldr >m=int64#4, [<pointer_delta=int64#1]
# asm 2: ldr >m=x3, [<pointer_delta=x0]
ldr x3, [x0]

# qhasm: uu = 1
# asm 1: mov >uu=int64#5, #1
# asm 2: mov >uu=x4, #1
mov x4, #1

# qhasm: vv = 0
# asm 1: mov >vv=int64#7, #0
# asm 2: mov >vv=x6, #0
mov x6, #0

# qhasm: rr = 0
# asm 1: mov >rr=int64#12, #0
# asm 2: mov >rr=x11, #0
mov x11, #0

# qhasm: ss = 1
# asm 1: mov >ss=int64#13, #1
# asm 2: mov >ss=x12, #1
mov x12, #1

# qhasm: int64 2p41

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#14, #1
# asm 2: mov >2p41=x13, #1
mov x13, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#14, <2p41=int64#14, #41
# asm 2: lsl >2p41=x13, <2p41=x13, #41
lsl x13, x13, #41

# qhasm: int64 2p62

# qhasm: 2p62 = 1
# asm 1: mov >2p62=int64#15, #1
# asm 2: mov >2p62=x14, #1
mov x14, #1

# qhasm: 2p62 = 2p62 << 62
# asm 1: lsl >2p62=int64#15, <2p62=int64#15, #62
# asm 2: lsl >2p62=x14, <2p62=x14, #62
lsl x14, x14, #62

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 g1

# qhasm: int64 hh

# qhasm: int64 h

# qhasm: int64 m1

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#16, <f=int64#2, #1048575
# asm 2: and >fuv=x15, <f=x1, #1048575
and x15, x1, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#17, <g=int64#3, #1048575
# asm 2: and >grs=x16, <g=x2, #1048575
and x16, x2, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#16,<fuv=int64#16,<2p41=int64#14
# asm 2: sub <fuv=x15,<fuv=x15,<2p41=x13
sub x15,x15,x13

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#17,<grs=int64#17,<2p62=int64#15
# asm 2: sub <grs=x16,<grs=x16,<2p62=x14
sub x16,x16,x14

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#18,<fuv=int64#16
# asm 2: mov >v=x17,<fuv=x15
mov x17,x15

# qhasm: v = v + 1048576
# asm 1: add >v=int64#18,<v=int64#18,#1048576
# asm 2: add >v=x17,<v=x17,#1048576
add x17,x17,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#18,<v=int64#18,<2p41=int64#14
# asm 2: add >v=x17,<v=x17,<2p41=x13
add x17,x17,x13

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#18, <v=int64#18, #42
# asm 2: asr >v=x17, <v=x17, #42
asr x17, x17, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#16,<fuv=int64#16,#1048576
# asm 2: add >u=x15,<fuv=x15,#1048576
add x15,x15,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#16, <u=int64#16, #22
# asm 2: lsl >u=x15, <u=x15, #22
lsl x15, x15, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#16, <u=int64#16, #43
# asm 2: asr >u=x15, <u=x15, #43
asr x15, x15, #43

# qhasm: s = grs
# asm 1: mov >s=int64#19,<grs=int64#17
# asm 2: mov >s=x18,<grs=x16
mov x18,x16

# qhasm: s = s + 1048576
# asm 1: add >s=int64#19,<s=int64#19,#1048576
# asm 2: add >s=x18,<s=x18,#1048576
add x18,x18,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#19,<s=int64#19,<2p41=int64#14
# asm 2: add >s=x18,<s=x18,<2p41=x13
add x18,x18,x13

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#19, <s=int64#19, #42
# asm 2: asr >s=x18, <s=x18, #42
asr x18, x18, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#17,<grs=int64#17,#1048576
# asm 2: add >r=x16,<grs=x16,#1048576
add x16,x16,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#17, <r=int64#17, #22
# asm 2: lsl >r=x16, <r=x16, #22
lsl x16, x16, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#17, <r=int64#17, #43
# asm 2: asr >r=x16, <r=x16, #43
asr x16, x16, #43

# qhasm: int64 tmp

# qhasm: int64 prod_lo

# qhasm: int64 prod_hi

# qhasm: int64 new_f

# qhasm: int64 new_g

# qhasm: int64 new_uu

# qhasm: int64 new_vv

# qhasm: int64 new_rr

# qhasm: int64 new_ss

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#20,<u=int64#16,<f=int64#2
# asm 2: mul >prod_lo=x19,<u=x15,<f=x1
mul x19,x15,x1

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#21, <u=int64#16, <f=int64#2
# asm 2: smulh >prod_hi=x20, <u=x15, <f=x1
smulh x20, x15, x1

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#22,<v=int64#18,<g=int64#3
# asm 2: mul >tmp=x21,<v=x17,<g=x2
mul x21,x17,x2

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#20, <prod_lo=int64#20, <tmp=int64#22
# asm 2: adds <prod_lo=x19, <prod_lo=x19, <tmp=x21
adds x19, x19, x21

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#22, <v=int64#18, <g=int64#3
# asm 2: smulh >tmp=x21, <v=x17, <g=x2
smulh x21, x17, x2

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#21,<prod_hi=int64#21,<tmp=int64#22
# asm 2: adc >prod_hi=x20,<prod_hi=x20,<tmp=x21
adc x20,x20,x21

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#20, <prod_lo=int64#20, #20
# asm 2: lsr >prod_lo=x19, <prod_lo=x19, #20
lsr x19, x19, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#21, <prod_hi=int64#21, #44
# asm 2: lsl >prod_hi=x20, <prod_hi=x20, #44
lsl x20, x20, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#20, <prod_lo=int64#20, <prod_hi=int64#21
# asm 2: orr >new_f=x19, <prod_lo=x19, <prod_hi=x20
orr x19, x19, x20

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#21,<r=int64#17,<f=int64#2
# asm 2: mul >prod_lo=x20,<r=x16,<f=x1
mul x20,x16,x1

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#2, <r=int64#17, <f=int64#2
# asm 2: smulh >prod_hi=x1, <r=x16, <f=x1
smulh x1, x16, x1

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#22,<s=int64#19,<g=int64#3
# asm 2: mul >tmp=x21,<s=x18,<g=x2
mul x21,x18,x2

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#21, <prod_lo=int64#21, <tmp=int64#22
# asm 2: adds <prod_lo=x20, <prod_lo=x20, <tmp=x21
adds x20, x20, x21

# qhasm: tmp = s signed* g (hi)
# asm 1: smulh >tmp=int64#3, <s=int64#19, <g=int64#3
# asm 2: smulh >tmp=x2, <s=x18, <g=x2
smulh x2, x18, x2

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#2,<prod_hi=int64#2,<tmp=int64#3
# asm 2: adc >prod_hi=x1,<prod_hi=x1,<tmp=x2
adc x1,x1,x2

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#3, <prod_lo=int64#21, #20
# asm 2: lsr >prod_lo=x2, <prod_lo=x20, #20
lsr x2, x20, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#2, <prod_hi=int64#2, #44
# asm 2: lsl >prod_hi=x1, <prod_hi=x1, #44
lsl x1, x1, #44

# qhasm: new_g = prod_lo | prod_hi
# asm 1: orr >new_g=int64#2, <prod_lo=int64#3, <prod_hi=int64#2
# asm 2: orr >new_g=x1, <prod_lo=x2, <prod_hi=x1
orr x1, x2, x1

# qhasm: f = new_f
# asm 1: mov >f=int64#3,<new_f=int64#20
# asm 2: mov >f=x2,<new_f=x19
mov x2,x19

# qhasm: g = new_g
# asm 1: mov >g=int64#2,<new_g=int64#2
# asm 2: mov >g=x1,<new_g=x1
mov x1,x1

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#20,<u=int64#16,<uu=int64#5
# asm 2: mul >tmp=x19,<u=x15,<uu=x4
mul x19,x15,x4

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#20, <v=int64#18, <rr=int64#12, <tmp=int64#20
# asm 2: madd >new_uu=x19, <v=x17, <rr=x11, <tmp=x19
madd x19, x17, x11, x19

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#5,<r=int64#17,<uu=int64#5
# asm 2: mul >tmp=x4,<r=x16,<uu=x4
mul x4,x16,x4

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#5, <s=int64#19, <rr=int64#12, <tmp=int64#5
# asm 2: madd >new_rr=x4, <s=x18, <rr=x11, <tmp=x4
madd x4, x18, x11, x4

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#12,<u=int64#16,<vv=int64#7
# asm 2: mul >tmp=x11,<u=x15,<vv=x6
mul x11,x15,x6

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#12, <v=int64#18, <ss=int64#13, <tmp=int64#12
# asm 2: madd >new_vv=x11, <v=x17, <ss=x12, <tmp=x11
madd x11, x17, x12, x11

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#7,<r=int64#17,<vv=int64#7
# asm 2: mul >tmp=x6,<r=x16,<vv=x6
mul x6,x16,x6

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#7, <s=int64#19, <ss=int64#13, <tmp=int64#7
# asm 2: madd >new_ss=x6, <s=x18, <ss=x12, <tmp=x6
madd x6, x18, x12, x6

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#13,<new_uu=int64#20
# asm 2: mov >uu=x12,<new_uu=x19
mov x12,x19

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#12,<new_vv=int64#12
# asm 2: mov >vv=x11,<new_vv=x11
mov x11,x11

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#5,<new_rr=int64#5
# asm 2: mov >rr=x4,<new_rr=x4
mov x4,x4

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#7,<new_ss=int64#7
# asm 2: mov >ss=x6,<new_ss=x6
mov x6,x6

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#16, <f=int64#3, #1048575
# asm 2: and >fuv=x15, <f=x2, #1048575
and x15, x2, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#17, <g=int64#2, #1048575
# asm 2: and >grs=x16, <g=x1, #1048575
and x16, x1, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#16,<fuv=int64#16,<2p41=int64#14
# asm 2: sub <fuv=x15,<fuv=x15,<2p41=x13
sub x15,x15,x13

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#17,<grs=int64#17,<2p62=int64#15
# asm 2: sub <grs=x16,<grs=x16,<2p62=x14
sub x16,x16,x14

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#18, <grs=int64#17, #1
# asm 2: and >g1=x17, <grs=x16, #1
and x17, x16, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#19,<grs=int64#17,<fuv=int64#16
# asm 2: sub >hh=x18,<grs=x16,<fuv=x15
sub x18,x16,x15

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#18, <g1=int64#18, <fuv=int64#16, <grs=int64#17
# asm 2: madd >h=x17, <g1=x17, <fuv=x15, <grs=x16
madd x17, x17, x15, x16

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#20,<m=int64#4,#1
# asm 2: sub >m1=x19,<m=x3,#1
sub x19,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#20, <grs=int64#17, ROR #1
# asm 2: tst <m1=x19, <grs=x16, ROR #1
tst x19, x16, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#20, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x19, <m=x3, pl
csneg x3, x19, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#16, <fuv=int64#16, <grs=int64#17, pl
# asm 2: csel >fuv=x15, <fuv=x15, <grs=x16, pl
csel x15, x15, x16, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#17, <h=int64#18, <hh=int64#19, pl
# asm 2: csel >grs=x16, <h=x17, <hh=x18, pl
csel x16, x17, x18, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#17, <grs=int64#17, #1
# asm 2: asr >grs=x16, <grs=x16, #1
asr x16, x16, #1

# qhasm: mem64[pointer_delta] = m
# asm 1: str <m=int64#4, [<pointer_delta=int64#1]
# asm 2: str <m=x3, [<pointer_delta=x0]
str x3, [x0]

# qhasm: v = fuv
# asm 1: mov >v=int64#18,<fuv=int64#16
# asm 2: mov >v=x17,<fuv=x15
mov x17,x15

# qhasm: v = v + 1048576
# asm 1: add >v=int64#18,<v=int64#18,#1048576
# asm 2: add >v=x17,<v=x17,#1048576
add x17,x17,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#18,<v=int64#18,<2p41=int64#14
# asm 2: add >v=x17,<v=x17,<2p41=x13
add x17,x17,x13

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#18, <v=int64#18, #42
# asm 2: asr >v=x17, <v=x17, #42
asr x17, x17, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#16,<fuv=int64#16,#1048576
# asm 2: add >u=x15,<fuv=x15,#1048576
add x15,x15,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#16, <u=int64#16, #22
# asm 2: lsl >u=x15, <u=x15, #22
lsl x15, x15, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#16, <u=int64#16, #43
# asm 2: asr >u=x15, <u=x15, #43
asr x15, x15, #43

# qhasm: s = grs
# asm 1: mov >s=int64#19,<grs=int64#17
# asm 2: mov >s=x18,<grs=x16
mov x18,x16

# qhasm: s = s + 1048576
# asm 1: add >s=int64#19,<s=int64#19,#1048576
# asm 2: add >s=x18,<s=x18,#1048576
add x18,x18,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#19,<s=int64#19,<2p41=int64#14
# asm 2: add >s=x18,<s=x18,<2p41=x13
add x18,x18,x13

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#19, <s=int64#19, #42
# asm 2: asr >s=x18, <s=x18, #42
asr x18, x18, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#17,<grs=int64#17,#1048576
# asm 2: add >r=x16,<grs=x16,#1048576
add x16,x16,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#17, <r=int64#17, #22
# asm 2: lsl >r=x16, <r=x16, #22
lsl x16, x16, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#17, <r=int64#17, #43
# asm 2: asr >r=x16, <r=x16, #43
asr x16, x16, #43

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#20,<u=int64#16,<f=int64#3
# asm 2: mul >prod_lo=x19,<u=x15,<f=x2
mul x19,x15,x2

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#21, <u=int64#16, <f=int64#3
# asm 2: smulh >prod_hi=x20, <u=x15, <f=x2
smulh x20, x15, x2

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#22,<v=int64#18,<g=int64#2
# asm 2: mul >tmp=x21,<v=x17,<g=x1
mul x21,x17,x1

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#20, <prod_lo=int64#20, <tmp=int64#22
# asm 2: adds <prod_lo=x19, <prod_lo=x19, <tmp=x21
adds x19, x19, x21

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#22, <v=int64#18, <g=int64#2
# asm 2: smulh >tmp=x21, <v=x17, <g=x1
smulh x21, x17, x1

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#21,<prod_hi=int64#21,<tmp=int64#22
# asm 2: adc >prod_hi=x20,<prod_hi=x20,<tmp=x21
adc x20,x20,x21

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#20, <prod_lo=int64#20, #20
# asm 2: lsr >prod_lo=x19, <prod_lo=x19, #20
lsr x19, x19, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#21, <prod_hi=int64#21, #44
# asm 2: lsl >prod_hi=x20, <prod_hi=x20, #44
lsl x20, x20, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#20, <prod_lo=int64#20, <prod_hi=int64#21
# asm 2: orr >new_f=x19, <prod_lo=x19, <prod_hi=x20
orr x19, x19, x20

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#21,<r=int64#17,<f=int64#3
# asm 2: mul >prod_lo=x20,<r=x16,<f=x2
mul x20,x16,x2

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#3, <r=int64#17, <f=int64#3
# asm 2: smulh >prod_hi=x2, <r=x16, <f=x2
smulh x2, x16, x2

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#22,<s=int64#19,<g=int64#2
# asm 2: mul >tmp=x21,<s=x18,<g=x1
mul x21,x18,x1

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#21, <prod_lo=int64#21, <tmp=int64#22
# asm 2: adds <prod_lo=x20, <prod_lo=x20, <tmp=x21
adds x20, x20, x21

# qhasm: tmp = s signed* g (hi)
# asm 1: smulh >tmp=int64#2, <s=int64#19, <g=int64#2
# asm 2: smulh >tmp=x1, <s=x18, <g=x1
smulh x1, x18, x1

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#2,<prod_hi=int64#3,<tmp=int64#2
# asm 2: adc >prod_hi=x1,<prod_hi=x2,<tmp=x1
adc x1,x2,x1

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#3, <prod_lo=int64#21, #20
# asm 2: lsr >prod_lo=x2, <prod_lo=x20, #20
lsr x2, x20, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#2, <prod_hi=int64#2, #44
# asm 2: lsl >prod_hi=x1, <prod_hi=x1, #44
lsl x1, x1, #44

# qhasm: new_g = prod_lo | prod_hi
# asm 1: orr >new_g=int64#2, <prod_lo=int64#3, <prod_hi=int64#2
# asm 2: orr >new_g=x1, <prod_lo=x2, <prod_hi=x1
orr x1, x2, x1

# qhasm: f = new_f
# asm 1: mov >f=int64#3,<new_f=int64#20
# asm 2: mov >f=x2,<new_f=x19
mov x2,x19

# qhasm: g = new_g
# asm 1: mov >g=int64#2,<new_g=int64#2
# asm 2: mov >g=x1,<new_g=x1
mov x1,x1

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#20,<u=int64#16,<uu=int64#13
# asm 2: mul >tmp=x19,<u=x15,<uu=x12
mul x19,x15,x12

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#20, <v=int64#18, <rr=int64#5, <tmp=int64#20
# asm 2: madd >new_uu=x19, <v=x17, <rr=x4, <tmp=x19
madd x19, x17, x4, x19

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#13,<r=int64#17,<uu=int64#13
# asm 2: mul >tmp=x12,<r=x16,<uu=x12
mul x12,x16,x12

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#5, <s=int64#19, <rr=int64#5, <tmp=int64#13
# asm 2: madd >new_rr=x4, <s=x18, <rr=x4, <tmp=x12
madd x4, x18, x4, x12

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#13,<u=int64#16,<vv=int64#12
# asm 2: mul >tmp=x12,<u=x15,<vv=x11
mul x12,x15,x11

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#13, <v=int64#18, <ss=int64#7, <tmp=int64#13
# asm 2: madd >new_vv=x12, <v=x17, <ss=x6, <tmp=x12
madd x12, x17, x6, x12

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#12,<r=int64#17,<vv=int64#12
# asm 2: mul >tmp=x11,<r=x16,<vv=x11
mul x11,x16,x11

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#7, <s=int64#19, <ss=int64#7, <tmp=int64#12
# asm 2: madd >new_ss=x6, <s=x18, <ss=x6, <tmp=x11
madd x6, x18, x6, x11

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#12,<new_uu=int64#20
# asm 2: mov >uu=x11,<new_uu=x19
mov x11,x19

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#13,<new_vv=int64#13
# asm 2: mov >vv=x12,<new_vv=x12
mov x12,x12

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#5,<new_rr=int64#5
# asm 2: mov >rr=x4,<new_rr=x4
mov x4,x4

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#7,<new_ss=int64#7
# asm 2: mov >ss=x6,<new_ss=x6
mov x6,x6

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#3, <f=int64#3, #1048575
# asm 2: and >fuv=x2, <f=x2, #1048575
and x2, x2, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#2, <g=int64#2, #1048575
# asm 2: and >grs=x1, <g=x1, #1048575
and x1, x1, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#3,<fuv=int64#3,<2p41=int64#14
# asm 2: sub <fuv=x2,<fuv=x2,<2p41=x13
sub x2,x2,x13

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#2,<grs=int64#2,<2p62=int64#15
# asm 2: sub <grs=x1,<grs=x1,<2p62=x14
sub x1,x1,x14

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#2, #1
# asm 2: and >g1=x14, <grs=x1, #1
and x14, x1, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#2,<fuv=int64#3
# asm 2: sub >hh=x15,<grs=x1,<fuv=x2
sub x15,x1,x2

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#3, <grs=int64#2
# asm 2: madd >h=x14, <g1=x14, <fuv=x2, <grs=x1
madd x14, x14, x2, x1

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#2, ROR #1
# asm 2: tst <m1=x16, <grs=x1, ROR #1
tst x16, x1, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#3, <grs=int64#2, pl
# asm 2: csel >fuv=x1, <fuv=x2, <grs=x1, pl
csel x1, x2, x1, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#3, #1
# asm 2: and >g1=x14, <grs=x2, #1
and x14, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x15,<grs=x2,<fuv=x1
sub x15,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x14, <g1=x14, <fuv=x1, <grs=x2
madd x14, x14, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#4,#1
# asm 2: sub >m1=x16,<m=x3,#1
sub x16,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#3, ROR #1
# asm 2: tst <m1=x16, <grs=x2, ROR #1
tst x16, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#17, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x16, <m=x3, pl
csneg x3, x16, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x2, <h=x14, <hh=x15, pl
csel x2, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm: mem64[pointer_delta] = m
# asm 1: str <m=int64#4, [<pointer_delta=int64#1]
# asm 2: str <m=x3, [<pointer_delta=x0]
str x3, [x0]

# qhasm: v = fuv
# asm 1: mov >v=int64#1,<fuv=int64#2
# asm 2: mov >v=x0,<fuv=x1
mov x0,x1

# qhasm: v = v + 1048576
# asm 1: add >v=int64#1,<v=int64#1,#1048576
# asm 2: add >v=x0,<v=x0,#1048576
add x0,x0,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#1,<v=int64#1,<2p41=int64#14
# asm 2: add >v=x0,<v=x0,<2p41=x13
add x0,x0,x13

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#1, <v=int64#1, #42
# asm 2: asr >v=x0, <v=x0, #42
asr x0, x0, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#2,<fuv=int64#2,#1048576
# asm 2: add >u=x1,<fuv=x1,#1048576
add x1,x1,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#2, <u=int64#2, #22
# asm 2: lsl >u=x1, <u=x1, #22
lsl x1, x1, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#2, <u=int64#2, #43
# asm 2: asr >u=x1, <u=x1, #43
asr x1, x1, #43

# qhasm: s = grs
# asm 1: mov >s=int64#4,<grs=int64#3
# asm 2: mov >s=x3,<grs=x2
mov x3,x2

# qhasm: s = s + 1048576
# asm 1: add >s=int64#4,<s=int64#4,#1048576
# asm 2: add >s=x3,<s=x3,#1048576
add x3,x3,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#4,<s=int64#4,<2p41=int64#14
# asm 2: add >s=x3,<s=x3,<2p41=x13
add x3,x3,x13

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#4, <s=int64#4, #42
# asm 2: asr >s=x3, <s=x3, #42
asr x3, x3, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#3,<grs=int64#3,#1048576
# asm 2: add >r=x2,<grs=x2,#1048576
add x2,x2,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#3, <r=int64#3, #22
# asm 2: lsl >r=x2, <r=x2, #22
lsl x2, x2, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#3, <r=int64#3, #43
# asm 2: asr >r=x2, <r=x2, #43
asr x2, x2, #43

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#14,<u=int64#2,<uu=int64#12
# asm 2: mul >tmp=x13,<u=x1,<uu=x11
mul x13,x1,x11

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#14, <v=int64#1, <rr=int64#5, <tmp=int64#14
# asm 2: madd >new_uu=x13, <v=x0, <rr=x4, <tmp=x13
madd x13, x0, x4, x13

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#12,<r=int64#3,<uu=int64#12
# asm 2: mul >tmp=x11,<r=x2,<uu=x11
mul x11,x2,x11

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#5, <s=int64#4, <rr=int64#5, <tmp=int64#12
# asm 2: madd >new_rr=x4, <s=x3, <rr=x4, <tmp=x11
madd x4, x3, x4, x11

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#2,<u=int64#2,<vv=int64#13
# asm 2: mul >tmp=x1,<u=x1,<vv=x12
mul x1,x1,x12

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#1, <v=int64#1, <ss=int64#7, <tmp=int64#2
# asm 2: madd >new_vv=x0, <v=x0, <ss=x6, <tmp=x1
madd x0, x0, x6, x1

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#2,<r=int64#3,<vv=int64#13
# asm 2: mul >tmp=x1,<r=x2,<vv=x12
mul x1,x2,x12

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#2, <s=int64#4, <ss=int64#7, <tmp=int64#2
# asm 2: madd >new_ss=x1, <s=x3, <ss=x6, <tmp=x1
madd x1, x3, x6, x1

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#3,<new_uu=int64#14
# asm 2: mov >uu=x2,<new_uu=x13
mov x2,x13

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#1,<new_vv=int64#1
# asm 2: mov >vv=x0,<new_vv=x0
mov x0,x0

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#4,<new_rr=int64#5
# asm 2: mov >rr=x3,<new_rr=x4
mov x3,x4

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#2,<new_ss=int64#2
# asm 2: mov >ss=x1,<new_ss=x1
mov x1,x1

# qhasm: mem128[pointer_uuvvrrss] = uu, vv
# asm 1: stp <uu=int64#3, <vv=int64#1, [<pointer_uuvvrrss=int64#6]
# asm 2: stp <uu=x2, <vv=x0, [<pointer_uuvvrrss=x5]
stp x2, x0, [x5]

# qhasm: mem128[pointer_uuvvrrss + 16] = rr, ss
# asm 1: stp <rr=int64#4, <ss=int64#2, [<pointer_uuvvrrss=int64#6, #16]
# asm 2: stp <rr=x3, <ss=x1, [<pointer_uuvvrrss=x5, #16]
stp x3, x1, [x5, #16]

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
