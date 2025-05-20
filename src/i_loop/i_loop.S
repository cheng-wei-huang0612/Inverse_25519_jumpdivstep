
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

# qhasm: int64 F8F9

# qhasm: F0F1, F2F3 = mem128[pointer_F]
# asm 1: ldp >F0F1=int64#7, >F2F3=int64#8, [<pointer_F=int64#2]
# asm 2: ldp >F0F1=x6, >F2F3=x7, [<pointer_F=x1]
ldp x6, x7, [x1]

# qhasm: F4F5, F6F7 = mem128[pointer_F+16]
# asm 1: ldp >F4F5=int64#9, >F6F7=int64#10, [<pointer_F=int64#2, #16]
# asm 2: ldp >F4F5=x8, >F6F7=x9, [<pointer_F=x1, #16]
ldp x8, x9, [x1, #16]

# qhasm: F8F9 = mem32[pointer_F+32]
# asm 1: ldr >F8F9=int64#11%wregname, [<pointer_F=int64#2, #32]
# asm 2: ldr >F8F9=w10, [<pointer_F=x1, #32]
ldr w10, [x1, #32]

# qhasm: int64 G0G1

# qhasm: int64 G2G3

# qhasm: int64 G4G5

# qhasm: int64 G6G7

# qhasm: int64 G8G9

# qhasm: G0G1, G2G3 = mem128[pointer_G]
# asm 1: ldp >G0G1=int64#12, >G2G3=int64#13, [<pointer_G=int64#3]
# asm 2: ldp >G0G1=x11, >G2G3=x12, [<pointer_G=x2]
ldp x11, x12, [x2]

# qhasm: G4G5, G6G7 = mem128[pointer_G+16]
# asm 1: ldp >G4G5=int64#14, >G6G7=int64#15, [<pointer_G=int64#3, #16]
# asm 2: ldp >G4G5=x13, >G6G7=x14, [<pointer_G=x2, #16]
ldp x13, x14, [x2, #16]

# qhasm: G8G9 = mem32[pointer_G+32]
# asm 1: ldr >G8G9=int64#16%wregname, [<pointer_G=int64#3, #32]
# asm 2: ldr >G8G9=w15, [<pointer_G=x2, #32]
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

# qhasm: reg128 vec_F8_F9_G8_G9 

# qhasm: vec_F8_F9_G8_G9[0/2] = F8F9 
# asm 1: ins <vec_F8_F9_G8_G9=reg128#5.d[0], <F8F9=int64#11
# asm 2: ins <vec_F8_F9_G8_G9=v4.d[0], <F8F9=x10
ins v4.d[0], x10

# qhasm: vec_F8_F9_G8_G9[1/2] = G8G9 
# asm 1: ins <vec_F8_F9_G8_G9=reg128#5.d[1], <G8G9=int64#16
# asm 2: ins <vec_F8_F9_G8_G9=v4.d[1], <G8G9=x15
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

# qhasm: reg128 vec_2x_2p30m1

# qhasm: reg128 vec_2x_2p32m1

# qhasm: 2x vec_2x_2p32m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p32m1=reg128#8.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p32m1=v7.2d, #0xFFFFFFFF
movi v7.2d, #0xFFFFFFFF

# qhasm: 2x vec_2x_2p30m1 = vec_2x_2p32m1 unsigned>> 2
# asm 1: ushr >vec_2x_2p30m1=reg128#9.2d, <vec_2x_2p32m1=reg128#8.2d, #2
# asm 2: ushr >vec_2x_2p30m1=v8.2d, <vec_2x_2p32m1=v7.2d, #2
ushr v8.2d, v7.2d, #2

# qhasm: reg128 vec_buffer

# qhasm: reg128 vec_prod

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smull >vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: smull >vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F0_F1_G0_G1=v0.s[0]
smull v9.2d,v5.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F0_F1_G0_G1=v0.s[2]
smlal2 v9.2d,v5.4s,v0.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F0_F1_G0_G1=v0.s[1]
smlal v9.2d,v5.2s,v0.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F0_F1_G0_G1=v0.s[3]
smlal2 v9.2d,v5.4s,v0.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F0_F1_G0_G1=v0.s[0]
smlal v9.2d,v6.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F0_F1_G0_G1=v0.s[2]
smlal2 v9.2d,v6.4s,v0.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F2_F3_G2_G3=v1.s[0]
smlal v9.2d,v5.2s,v1.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F2_F3_G2_G3=v1.s[2]
smlal2 v9.2d,v5.4s,v1.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F0_F1_G0_G1=v0.s[1]
smlal v9.2d,v6.2s,v0.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F0_F1_G0_G1=v0.s[3]
smlal2 v9.2d,v6.4s,v0.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#1.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#9.16b
# asm 2: and >vec_buffer=v0.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v8.16b
and v0.16b, v9.16b, v8.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: vec_F0_F1_G0_G1 = vec_buffer
# asm 1: mov >vec_F0_F1_G0_G1=reg128#1.16b, <vec_buffer=reg128#1.16b
# asm 2: mov >vec_F0_F1_G0_G1=v0.16b, <vec_buffer=v0.16b
mov v0.16b, v0.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F2_F3_G2_G3=v1.s[1]
smlal v9.2d,v5.2s,v1.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F2_F3_G2_G3=v1.s[3]
smlal2 v9.2d,v5.4s,v1.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F2_F3_G2_G3=v1.s[0]
smlal v9.2d,v6.2s,v1.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F2_F3_G2_G3=v1.s[2]
smlal2 v9.2d,v6.4s,v1.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#11.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#9.16b
# asm 2: and >vec_buffer=v10.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v8.16b
and v10.16b, v9.16b, v8.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#11.2d, <vec_buffer=reg128#11.2d, #32
# asm 2: shl >vec_buffer=v10.2d, <vec_buffer=v10.2d, #32
shl v10.2d, v10.2d, #32

# qhasm: vec_F0_F1_G0_G1 |= vec_buffer
# asm 1: orr <vec_F0_F1_G0_G1=reg128#1.16b, <vec_F0_F1_G0_G1=reg128#1.16b, <vec_buffer=reg128#11.16b
# asm 2: orr <vec_F0_F1_G0_G1=v0.16b, <vec_F0_F1_G0_G1=v0.16b, <vec_buffer=v10.16b
orr v0.16b, v0.16b, v10.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F4_F5_G4_G5=v2.s[0]
smlal v9.2d,v5.2s,v2.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F4_F5_G4_G5=v2.s[2]
smlal2 v9.2d,v5.4s,v2.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F2_F3_G2_G3=v1.s[1]
smlal v9.2d,v6.2s,v1.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F2_F3_G2_G3=v1.s[3]
smlal2 v9.2d,v6.4s,v1.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#2.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#9.16b
# asm 2: and >vec_buffer=v1.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v8.16b
and v1.16b, v9.16b, v8.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: vec_F2_F3_G2_G3 = vec_buffer
# asm 1: mov >vec_F2_F3_G2_G3=reg128#2.16b, <vec_buffer=reg128#2.16b
# asm 2: mov >vec_F2_F3_G2_G3=v1.16b, <vec_buffer=v1.16b
mov v1.16b, v1.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F4_F5_G4_G5=v2.s[1]
smlal v9.2d,v5.2s,v2.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F4_F5_G4_G5=v2.s[3]
smlal2 v9.2d,v5.4s,v2.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F4_F5_G4_G5=v2.s[0]
smlal v9.2d,v6.2s,v2.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F4_F5_G4_G5=v2.s[2]
smlal2 v9.2d,v6.4s,v2.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#11.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#9.16b
# asm 2: and >vec_buffer=v10.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v8.16b
and v10.16b, v9.16b, v8.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#11.2d, <vec_buffer=reg128#11.2d, #32
# asm 2: shl >vec_buffer=v10.2d, <vec_buffer=v10.2d, #32
shl v10.2d, v10.2d, #32

# qhasm: vec_F2_F3_G2_G3 |= vec_buffer
# asm 1: orr <vec_F2_F3_G2_G3=reg128#2.16b, <vec_F2_F3_G2_G3=reg128#2.16b, <vec_buffer=reg128#11.16b
# asm 2: orr <vec_F2_F3_G2_G3=v1.16b, <vec_F2_F3_G2_G3=v1.16b, <vec_buffer=v10.16b
orr v1.16b, v1.16b, v10.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F6_F7_G6_G7=v3.s[0]
smlal v9.2d,v5.2s,v3.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F6_F7_G6_G7=v3.s[2]
smlal2 v9.2d,v5.4s,v3.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F4_F5_G4_G5=v2.s[1]
smlal v9.2d,v6.2s,v2.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F4_F5_G4_G5=v2.s[3]
smlal2 v9.2d,v6.4s,v2.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#3.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#9.16b
# asm 2: and >vec_buffer=v2.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v8.16b
and v2.16b, v9.16b, v8.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: vec_F4_F5_G4_G5 = vec_buffer
# asm 1: mov >vec_F4_F5_G4_G5=reg128#3.16b, <vec_buffer=reg128#3.16b
# asm 2: mov >vec_F4_F5_G4_G5=v2.16b, <vec_buffer=v2.16b
mov v2.16b, v2.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F6_F7_G6_G7=v3.s[1]
smlal v9.2d,v5.2s,v3.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F6_F7_G6_G7=v3.s[3]
smlal2 v9.2d,v5.4s,v3.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F6_F7_G6_G7=v3.s[0]
smlal v9.2d,v6.2s,v3.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F6_F7_G6_G7=v3.s[2]
smlal2 v9.2d,v6.4s,v3.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#11.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#9.16b
# asm 2: and >vec_buffer=v10.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v8.16b
and v10.16b, v9.16b, v8.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#11.2d, <vec_buffer=reg128#11.2d, #32
# asm 2: shl >vec_buffer=v10.2d, <vec_buffer=v10.2d, #32
shl v10.2d, v10.2d, #32

# qhasm: vec_F4_F5_G4_G5 |= vec_buffer
# asm 1: orr <vec_F4_F5_G4_G5=reg128#3.16b, <vec_F4_F5_G4_G5=reg128#3.16b, <vec_buffer=reg128#11.16b
# asm 2: orr <vec_F4_F5_G4_G5=v2.16b, <vec_F4_F5_G4_G5=v2.16b, <vec_buffer=v10.16b
orr v2.16b, v2.16b, v10.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F8_F9_G8_G9=reg128#5.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F8_F9_G8_G9=v4.s[0]
smlal v9.2d,v5.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F8_F9_G8_G9=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F8_F9_G8_G9=v4.s[2]
smlal2 v9.2d,v5.4s,v4.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F6_F7_G6_G7=v3.s[1]
smlal v9.2d,v6.2s,v3.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F6_F7_G6_G7=v3.s[3]
smlal2 v9.2d,v6.4s,v3.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#4.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#9.16b
# asm 2: and >vec_buffer=v3.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v8.16b
and v3.16b, v9.16b, v8.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: vec_F6_F7_G6_G7 = vec_buffer
# asm 1: mov >vec_F6_F7_G6_G7=reg128#4.16b, <vec_buffer=reg128#4.16b
# asm 2: mov >vec_F6_F7_G6_G7=v3.16b, <vec_buffer=v3.16b
mov v3.16b, v3.16b

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F8_F9_G8_G9=reg128#5.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F8_F9_G8_G9=v4.s[0]
smlal v9.2d,v6.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F8_F9_G8_G9=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F8_F9_G8_G9=v4.s[2]
smlal2 v9.2d,v6.4s,v4.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#5.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#9.16b
# asm 2: and >vec_buffer=v4.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v8.16b
and v4.16b, v9.16b, v8.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v9.2d, #30
sshr v9.2d, v9.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#5.2d, <vec_buffer=reg128#5.2d, #32
# asm 2: shl >vec_buffer=v4.2d, <vec_buffer=v4.2d, #32
shl v4.2d, v4.2d, #32

# qhasm: vec_F6_F7_G6_G7 |= vec_buffer
# asm 1: orr <vec_F6_F7_G6_G7=reg128#4.16b, <vec_F6_F7_G6_G7=reg128#4.16b, <vec_buffer=reg128#5.16b
# asm 2: orr <vec_F6_F7_G6_G7=v3.16b, <vec_F6_F7_G6_G7=v3.16b, <vec_buffer=v4.16b
orr v3.16b, v3.16b, v4.16b

# qhasm: vec_F8_F9_G8_G9 = vec_prod
# asm 1: mov >vec_F8_F9_G8_G9=reg128#5.16b, <vec_prod=reg128#10.16b
# asm 2: mov >vec_F8_F9_G8_G9=v4.16b, <vec_prod=v9.16b
mov v4.16b, v9.16b

# qhasm: reg128 vec_F0_F1_F2_F3

# qhasm: reg128 vec_G0_G1_G2_G3

# qhasm: 2x vec_F0_F1_F2_F3 zip= vec_F0_F1_G0_G1[0/2] vec_F2_F3_G2_G3[0/2]
# asm 1: zip1 >vec_F0_F1_F2_F3=reg128#10.2d, <vec_F0_F1_G0_G1=reg128#1.2d, <vec_F2_F3_G2_G3=reg128#2.2d
# asm 2: zip1 >vec_F0_F1_F2_F3=v9.2d, <vec_F0_F1_G0_G1=v0.2d, <vec_F2_F3_G2_G3=v1.2d
zip1 v9.2d, v0.2d, v1.2d

# qhasm: 2x vec_G0_G1_G2_G3 zip= vec_F0_F1_G0_G1[1/2] vec_F2_F3_G2_G3[1/2]
# asm 1: zip2 >vec_G0_G1_G2_G3=reg128#1.2d, <vec_F0_F1_G0_G1=reg128#1.2d, <vec_F2_F3_G2_G3=reg128#2.2d
# asm 2: zip2 >vec_G0_G1_G2_G3=v0.2d, <vec_F0_F1_G0_G1=v0.2d, <vec_F2_F3_G2_G3=v1.2d
zip2 v0.2d, v0.2d, v1.2d

# qhasm: reg128 vec_F4_F5_F6_F7

# qhasm: reg128 vec_G4_G5_G6_G7

# qhasm: 2x vec_F4_F5_F6_F7 zip= vec_F4_F5_G4_G5[0/2] vec_F6_F7_G6_G7[0/2]
# asm 1: zip1 >vec_F4_F5_F6_F7=reg128#2.2d, <vec_F4_F5_G4_G5=reg128#3.2d, <vec_F6_F7_G6_G7=reg128#4.2d
# asm 2: zip1 >vec_F4_F5_F6_F7=v1.2d, <vec_F4_F5_G4_G5=v2.2d, <vec_F6_F7_G6_G7=v3.2d
zip1 v1.2d, v2.2d, v3.2d

# qhasm: 2x vec_G4_G5_G6_G7 zip= vec_F4_F5_G4_G5[1/2] vec_F6_F7_G6_G7[1/2]
# asm 1: zip2 >vec_G4_G5_G6_G7=reg128#3.2d, <vec_F4_F5_G4_G5=reg128#3.2d, <vec_F6_F7_G6_G7=reg128#4.2d
# asm 2: zip2 >vec_G4_G5_G6_G7=v2.2d, <vec_F4_F5_G4_G5=v2.2d, <vec_F6_F7_G6_G7=v3.2d
zip2 v2.2d, v2.2d, v3.2d

# qhasm: mem256[pointer_F] = vec_F0_F1_F2_F3, vec_F4_F5_F6_F7
# asm 1: stp <vec_F0_F1_F2_F3=reg128#10%qregname, <vec_F4_F5_F6_F7=reg128#2%qregname, [<pointer_F=int64#2]
# asm 2: stp <vec_F0_F1_F2_F3=q9, <vec_F4_F5_F6_F7=q1, [<pointer_F=x1]
stp q9, q1, [x1]

# qhasm: mem256[pointer_G] = vec_G0_G1_G2_G3, vec_G4_G5_G6_G7
# asm 1: stp <vec_G0_G1_G2_G3=reg128#1%qregname, <vec_G4_G5_G6_G7=reg128#3%qregname, [<pointer_G=int64#3]
# asm 2: stp <vec_G0_G1_G2_G3=q0, <vec_G4_G5_G6_G7=q2, [<pointer_G=x2]
stp q0, q2, [x2]

# qhasm: int64 F8

# qhasm: F8 = vec_F8_F9_G8_G9[0/2]
# asm 1: umov >F8=int64#7, <vec_F8_F9_G8_G9=reg128#5.d[0]
# asm 2: umov >F8=x6, <vec_F8_F9_G8_G9=v4.d[0]
umov x6, v4.d[0]

# qhasm: mem32[pointer_F+32] = F8
# asm 1: str <F8=int64#7%wregname, [<pointer_F=int64#2, #32]
# asm 2: str <F8=w6, [<pointer_F=x1, #32]
str w6, [x1, #32]

# qhasm: int64 G8

# qhasm: G8 = vec_F8_F9_G8_G9[1/2]
# asm 1: umov >G8=int64#7, <vec_F8_F9_G8_G9=reg128#5.d[1]
# asm 2: umov >G8=x6, <vec_F8_F9_G8_G9=v4.d[1]
umov x6, v4.d[1]

# qhasm: mem32[pointer_G+32] = G8
# asm 1: str <G8=int64#7%wregname, [<pointer_G=int64#3, #32]
# asm 2: str <G8=w6, [<pointer_G=x2, #32]
str w6, [x2, #32]

# qhasm: reg128 vec_V0_V1_S0_S1

# qhasm: reg128 vec_V2_V3_S2_S3

# qhasm: reg128 vec_V4_V5_S4_S5

# qhasm: reg128 vec_V6_V7_S6_S7

# qhasm: reg128 vec_V8_V9_S8_S9

# qhasm: 2x vec_2x_2p30m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p30m1=reg128#9.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p30m1=v8.2d, #0xFFFFFFFF
movi v8.2d, #0xFFFFFFFF

# qhasm: 2x vec_2x_2p30m1 >>= 2
# asm 1: sshr >vec_2x_2p30m1=reg128#1.2d, <vec_2x_2p30m1=reg128#9.2d, #2
# asm 2: sshr >vec_2x_2p30m1=v0.2d, <vec_2x_2p30m1=v8.2d, #2
sshr v0.2d, v8.2d, #2

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
# asm 1: dup <vec_M=reg128#2.4s, <M=int64#7%wregname
# asm 2: dup <vec_M=v1.4s, <M=w6
dup v1.4s, w6

# qhasm: int64 _19

# qhasm: _19 = 19
# asm 1: mov >_19=int64#7, #19
# asm 2: mov >_19=x6, #19
mov x6, #19

# qhasm: reg128 vec_4x_19

# qhasm: 4x vec_4x_19 = _19
# asm 1: dup <vec_4x_19=reg128#3.4s, <_19=int64#7%wregname
# asm 2: dup <vec_4x_19=v2.4s, <_19=w6
dup v2.4s, w6

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7

# qhasm: int64 V8V9

# qhasm: V0V1, V2V3 = mem128[pointer_V]
# asm 1: ldp >V0V1=int64#7, >V2V3=int64#8, [<pointer_V=int64#4]
# asm 2: ldp >V0V1=x6, >V2V3=x7, [<pointer_V=x3]
ldp x6, x7, [x3]

# qhasm: V4V5, V6V7 = mem128[pointer_V+16]
# asm 1: ldp >V4V5=int64#9, >V6V7=int64#10, [<pointer_V=int64#4, #16]
# asm 2: ldp >V4V5=x8, >V6V7=x9, [<pointer_V=x3, #16]
ldp x8, x9, [x3, #16]

# qhasm: V8V9 = mem32[pointer_V+32]
# asm 1: ldr >V8V9=int64#11%wregname, [<pointer_V=int64#4, #32]
# asm 2: ldr >V8V9=w10, [<pointer_V=x3, #32]
ldr w10, [x3, #32]

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 S4S5

# qhasm: int64 S6S7

# qhasm: int64 S8S9

# qhasm: S0S1, S2S3 = mem128[pointer_S]
# asm 1: ldp >S0S1=int64#12, >S2S3=int64#13, [<pointer_S=int64#5]
# asm 2: ldp >S0S1=x11, >S2S3=x12, [<pointer_S=x4]
ldp x11, x12, [x4]

# qhasm: S4S5, S6S7 = mem128[pointer_S+16]
# asm 1: ldp >S4S5=int64#14, >S6S7=int64#15, [<pointer_S=int64#5, #16]
# asm 2: ldp >S4S5=x13, >S6S7=x14, [<pointer_S=x4, #16]
ldp x13, x14, [x4, #16]

# qhasm: S8S9 = mem32[pointer_S+32]
# asm 1: ldr >S8S9=int64#16%wregname, [<pointer_S=int64#5, #32]
# asm 2: ldr >S8S9=w15, [<pointer_S=x4, #32]
ldr w15, [x4, #32]

# qhasm: vec_V0_V1_S0_S1[0/2] = V0V1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#4.d[0], <V0V1=int64#7
# asm 2: ins <vec_V0_V1_S0_S1=v3.d[0], <V0V1=x6
ins v3.d[0], x6

# qhasm: vec_V0_V1_S0_S1[1/2] = S0S1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#4.d[1], <S0S1=int64#12
# asm 2: ins <vec_V0_V1_S0_S1=v3.d[1], <S0S1=x11
ins v3.d[1], x11

# qhasm: vec_V2_V3_S2_S3[0/2] = V2V3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#5.d[0], <V2V3=int64#8
# asm 2: ins <vec_V2_V3_S2_S3=v4.d[0], <V2V3=x7
ins v4.d[0], x7

# qhasm: vec_V2_V3_S2_S3[1/2] = S2S3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#5.d[1], <S2S3=int64#13
# asm 2: ins <vec_V2_V3_S2_S3=v4.d[1], <S2S3=x12
ins v4.d[1], x12

# qhasm: vec_V4_V5_S4_S5[0/2] = V4V5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#9.d[0], <V4V5=int64#9
# asm 2: ins <vec_V4_V5_S4_S5=v8.d[0], <V4V5=x8
ins v8.d[0], x8

# qhasm: vec_V4_V5_S4_S5[1/2] = S4S5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#9.d[1], <S4S5=int64#14
# asm 2: ins <vec_V4_V5_S4_S5=v8.d[1], <S4S5=x13
ins v8.d[1], x13

# qhasm: vec_V6_V7_S6_S7[0/2] = V6V7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#10.d[0], <V6V7=int64#10
# asm 2: ins <vec_V6_V7_S6_S7=v9.d[0], <V6V7=x9
ins v9.d[0], x9

# qhasm: vec_V6_V7_S6_S7[1/2] = S6S7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#10.d[1], <S6S7=int64#15
# asm 2: ins <vec_V6_V7_S6_S7=v9.d[1], <S6S7=x14
ins v9.d[1], x14

# qhasm: vec_V8_V9_S8_S9[0/2] = V8V9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#11.d[0], <V8V9=int64#11
# asm 2: ins <vec_V8_V9_S8_S9=v10.d[0], <V8V9=x10
ins v10.d[0], x10

# qhasm: vec_V8_V9_S8_S9[1/2] = S8S9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#11.d[1], <S8S9=int64#16
# asm 2: ins <vec_V8_V9_S8_S9=v10.d[1], <S8S9=x15
ins v10.d[1], x15

# qhasm: reg128 final_add_0

# qhasm: reg128 final_add_1

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smull >vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_V0_V1_S0_S1=reg128#4.s[0]
# asm 2: smull >vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_V0_V1_S0_S1=v3.s[0]
smull v11.2d,v5.2s,v3.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_V0_V1_S0_S1=reg128#4.s[2]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_V0_V1_S0_S1=v3.s[2]
smlal2 v11.2d,v5.4s,v3.s[2]

# qhasm: reg128 vec_l0

# qhasm: 4x vec_l0 = vec_prod * vec_M
# asm 1: mul >vec_l0=reg128#13.4s,<vec_prod=reg128#12.4s,<vec_M=reg128#2.4s
# asm 2: mul >vec_l0=v12.4s,<vec_prod=v11.4s,<vec_M=v1.4s
mul v12.4s,v11.4s,v1.4s

# qhasm: vec_l0 &= vec_2x_2p30m1
# asm 1: and <vec_l0=reg128#13.16b, <vec_l0=reg128#13.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and <vec_l0=v12.16b, <vec_l0=v12.16b, <vec_2x_2p30m1=v0.16b
and v12.16b, v12.16b, v0.16b

# qhasm: 4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4]
# asm 1: uzp1 >vec_l0=reg128#13.4s, <vec_l0=reg128#13.4s, <vec_l0=reg128#13.4s
# asm 2: uzp1 >vec_l0=v12.4s, <vec_l0=v12.4s, <vec_l0=v12.4s
uzp1 v12.4s, v12.4s, v12.4s

# qhasm: 2x vec_prod -= vec_l0[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#12.2d,<vec_l0=reg128#13.2s,<vec_4x_19=reg128#3.2s
# asm 2: smlsl <vec_prod=v11.2d,<vec_l0=v12.2s,<vec_4x_19=v2.2s
smlsl v11.2d,v12.2s,v2.2s

# qhasm: 2x final_add_0 = vec_l0[0] << 15
# asm 1: sshll >final_add_0=reg128#13.2d,<vec_l0=reg128#13.2s,15
# asm 2: sshll >final_add_0=v12.2d,<vec_l0=v12.2s,15
sshll v12.2d,v12.2s,15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#12.2d, <vec_prod=reg128#12.2d, #30
# asm 2: sshr >vec_prod=v11.2d, <vec_prod=v11.2d, #30
sshr v11.2d, v11.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_V0_V1_S0_S1=reg128#4.s[1]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_V0_V1_S0_S1=v3.s[1]
smlal v11.2d,v5.2s,v3.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_V0_V1_S0_S1=reg128#4.s[3]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_V0_V1_S0_S1=v3.s[3]
smlal2 v11.2d,v5.4s,v3.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_V0_V1_S0_S1=reg128#4.s[0]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_V0_V1_S0_S1=v3.s[0]
smlal v11.2d,v6.2s,v3.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_V0_V1_S0_S1=reg128#4.s[2]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_V0_V1_S0_S1=v3.s[2]
smlal2 v11.2d,v6.4s,v3.s[2]

# qhasm: reg128 vec_l1

# qhasm: 4x vec_l1 = vec_prod * vec_M
# asm 1: mul >vec_l1=reg128#2.4s,<vec_prod=reg128#12.4s,<vec_M=reg128#2.4s
# asm 2: mul >vec_l1=v1.4s,<vec_prod=v11.4s,<vec_M=v1.4s
mul v1.4s,v11.4s,v1.4s

# qhasm: vec_l1 &= vec_2x_2p30m1
# asm 1: and <vec_l1=reg128#2.16b, <vec_l1=reg128#2.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and <vec_l1=v1.16b, <vec_l1=v1.16b, <vec_2x_2p30m1=v0.16b
and v1.16b, v1.16b, v0.16b

# qhasm: 4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4]
# asm 1: uzp1 >vec_l1=reg128#2.4s, <vec_l1=reg128#2.4s, <vec_l1=reg128#2.4s
# asm 2: uzp1 >vec_l1=v1.4s, <vec_l1=v1.4s, <vec_l1=v1.4s
uzp1 v1.4s, v1.4s, v1.4s

# qhasm: 2x vec_prod -= vec_l1[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#12.2d,<vec_l1=reg128#2.2s,<vec_4x_19=reg128#3.2s
# asm 2: smlsl <vec_prod=v11.2d,<vec_l1=v1.2s,<vec_4x_19=v2.2s
smlsl v11.2d,v1.2s,v2.2s

# qhasm: 2x final_add_1 = vec_l1[0] << 15
# asm 1: sshll >final_add_1=reg128#2.2d,<vec_l1=reg128#2.2s,15
# asm 2: sshll >final_add_1=v1.2d,<vec_l1=v1.2s,15
sshll v1.2d,v1.2s,15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#12.2d, <vec_prod=reg128#12.2d, #30
# asm 2: sshr >vec_prod=v11.2d, <vec_prod=v11.2d, #30
sshr v11.2d, v11.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_V2_V3_S2_S3=reg128#5.s[0]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_V2_V3_S2_S3=v4.s[0]
smlal v11.2d,v5.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_V2_V3_S2_S3=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_V2_V3_S2_S3=v4.s[2]
smlal2 v11.2d,v5.4s,v4.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_V0_V1_S0_S1=reg128#4.s[1]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_V0_V1_S0_S1=v3.s[1]
smlal v11.2d,v6.2s,v3.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_V0_V1_S0_S1=reg128#4.s[3]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_V0_V1_S0_S1=v3.s[3]
smlal2 v11.2d,v6.4s,v3.s[3]

# qhasm: vec_V0_V1_S0_S1 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V0_V1_S0_S1=reg128#4.16b, <vec_prod=reg128#12.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_V0_V1_S0_S1=v3.16b, <vec_prod=v11.16b, <vec_2x_2p30m1=v0.16b
and v3.16b, v11.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#12.2d, <vec_prod=reg128#12.2d, #30
# asm 2: sshr >vec_prod=v11.2d, <vec_prod=v11.2d, #30
sshr v11.2d, v11.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_V2_V3_S2_S3=reg128#5.s[1]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_V2_V3_S2_S3=v4.s[1]
smlal v11.2d,v5.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_V2_V3_S2_S3=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_V2_V3_S2_S3=v4.s[3]
smlal2 v11.2d,v5.4s,v4.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_V2_V3_S2_S3=reg128#5.s[0]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_V2_V3_S2_S3=v4.s[0]
smlal v11.2d,v6.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_V2_V3_S2_S3=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_V2_V3_S2_S3=v4.s[2]
smlal2 v11.2d,v6.4s,v4.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#14.16b, <vec_prod=reg128#12.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buffer=v13.16b, <vec_prod=v11.16b, <vec_2x_2p30m1=v0.16b
and v13.16b, v11.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#12.2d, <vec_prod=reg128#12.2d, #30
# asm 2: sshr >vec_prod=v11.2d, <vec_prod=v11.2d, #30
sshr v11.2d, v11.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#14.2d, <vec_buffer=reg128#14.2d, #32
# asm 2: shl >vec_buffer=v13.2d, <vec_buffer=v13.2d, #32
shl v13.2d, v13.2d, #32

# qhasm: vec_V0_V1_S0_S1 |= vec_buffer
# asm 1: orr <vec_V0_V1_S0_S1=reg128#4.16b, <vec_V0_V1_S0_S1=reg128#4.16b, <vec_buffer=reg128#14.16b
# asm 2: orr <vec_V0_V1_S0_S1=v3.16b, <vec_V0_V1_S0_S1=v3.16b, <vec_buffer=v13.16b
orr v3.16b, v3.16b, v13.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_V4_V5_S4_S5=reg128#9.s[0]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_V4_V5_S4_S5=v8.s[0]
smlal v11.2d,v5.2s,v8.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_V4_V5_S4_S5=reg128#9.s[2]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_V4_V5_S4_S5=v8.s[2]
smlal2 v11.2d,v5.4s,v8.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_V2_V3_S2_S3=reg128#5.s[1]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_V2_V3_S2_S3=v4.s[1]
smlal v11.2d,v6.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_V2_V3_S2_S3=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_V2_V3_S2_S3=v4.s[3]
smlal2 v11.2d,v6.4s,v4.s[3]

# qhasm: vec_V2_V3_S2_S3 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V2_V3_S2_S3=reg128#5.16b, <vec_prod=reg128#12.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_V2_V3_S2_S3=v4.16b, <vec_prod=v11.16b, <vec_2x_2p30m1=v0.16b
and v4.16b, v11.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#12.2d, <vec_prod=reg128#12.2d, #30
# asm 2: sshr >vec_prod=v11.2d, <vec_prod=v11.2d, #30
sshr v11.2d, v11.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_V4_V5_S4_S5=reg128#9.s[1]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_V4_V5_S4_S5=v8.s[1]
smlal v11.2d,v5.2s,v8.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_V4_V5_S4_S5=reg128#9.s[3]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_V4_V5_S4_S5=v8.s[3]
smlal2 v11.2d,v5.4s,v8.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_V4_V5_S4_S5=reg128#9.s[0]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_V4_V5_S4_S5=v8.s[0]
smlal v11.2d,v6.2s,v8.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_V4_V5_S4_S5=reg128#9.s[2]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_V4_V5_S4_S5=v8.s[2]
smlal2 v11.2d,v6.4s,v8.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#14.16b, <vec_prod=reg128#12.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buffer=v13.16b, <vec_prod=v11.16b, <vec_2x_2p30m1=v0.16b
and v13.16b, v11.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#12.2d, <vec_prod=reg128#12.2d, #30
# asm 2: sshr >vec_prod=v11.2d, <vec_prod=v11.2d, #30
sshr v11.2d, v11.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#14.2d, <vec_buffer=reg128#14.2d, #32
# asm 2: shl >vec_buffer=v13.2d, <vec_buffer=v13.2d, #32
shl v13.2d, v13.2d, #32

# qhasm: vec_V2_V3_S2_S3 |= vec_buffer
# asm 1: orr <vec_V2_V3_S2_S3=reg128#5.16b, <vec_V2_V3_S2_S3=reg128#5.16b, <vec_buffer=reg128#14.16b
# asm 2: orr <vec_V2_V3_S2_S3=v4.16b, <vec_V2_V3_S2_S3=v4.16b, <vec_buffer=v13.16b
orr v4.16b, v4.16b, v13.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_V6_V7_S6_S7=reg128#10.s[0]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_V6_V7_S6_S7=v9.s[0]
smlal v11.2d,v5.2s,v9.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_V6_V7_S6_S7=reg128#10.s[2]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_V6_V7_S6_S7=v9.s[2]
smlal2 v11.2d,v5.4s,v9.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_V4_V5_S4_S5=reg128#9.s[1]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_V4_V5_S4_S5=v8.s[1]
smlal v11.2d,v6.2s,v8.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_V4_V5_S4_S5=reg128#9.s[3]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_V4_V5_S4_S5=v8.s[3]
smlal2 v11.2d,v6.4s,v8.s[3]

# qhasm: vec_V4_V5_S4_S5 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V4_V5_S4_S5=reg128#9.16b, <vec_prod=reg128#12.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_V4_V5_S4_S5=v8.16b, <vec_prod=v11.16b, <vec_2x_2p30m1=v0.16b
and v8.16b, v11.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#12.2d, <vec_prod=reg128#12.2d, #30
# asm 2: sshr >vec_prod=v11.2d, <vec_prod=v11.2d, #30
sshr v11.2d, v11.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_V6_V7_S6_S7=reg128#10.s[1]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_V6_V7_S6_S7=v9.s[1]
smlal v11.2d,v5.2s,v9.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_V6_V7_S6_S7=reg128#10.s[3]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_V6_V7_S6_S7=v9.s[3]
smlal2 v11.2d,v5.4s,v9.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_V6_V7_S6_S7=reg128#10.s[0]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_V6_V7_S6_S7=v9.s[0]
smlal v11.2d,v6.2s,v9.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_V6_V7_S6_S7=reg128#10.s[2]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_V6_V7_S6_S7=v9.s[2]
smlal2 v11.2d,v6.4s,v9.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#14.16b, <vec_prod=reg128#12.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buffer=v13.16b, <vec_prod=v11.16b, <vec_2x_2p30m1=v0.16b
and v13.16b, v11.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#12.2d, <vec_prod=reg128#12.2d, #30
# asm 2: sshr >vec_prod=v11.2d, <vec_prod=v11.2d, #30
sshr v11.2d, v11.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#14.2d, <vec_buffer=reg128#14.2d, #32
# asm 2: shl >vec_buffer=v13.2d, <vec_buffer=v13.2d, #32
shl v13.2d, v13.2d, #32

# qhasm: vec_V4_V5_S4_S5 |= vec_buffer
# asm 1: orr <vec_V4_V5_S4_S5=reg128#9.16b, <vec_V4_V5_S4_S5=reg128#9.16b, <vec_buffer=reg128#14.16b
# asm 2: orr <vec_V4_V5_S4_S5=v8.16b, <vec_V4_V5_S4_S5=v8.16b, <vec_buffer=v13.16b
orr v8.16b, v8.16b, v13.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_V8_V9_S8_S9=reg128#11.s[0]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_V8_V9_S8_S9=v10.s[0]
smlal v11.2d,v5.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_V8_V9_S8_S9=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_V8_V9_S8_S9=v10.s[2]
smlal2 v11.2d,v5.4s,v10.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_V6_V7_S6_S7=reg128#10.s[1]
# asm 2: smlal <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_V6_V7_S6_S7=v9.s[1]
smlal v11.2d,v6.2s,v9.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#12.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_V6_V7_S6_S7=reg128#10.s[3]
# asm 2: smlal2 <vec_prod=v11.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_V6_V7_S6_S7=v9.s[3]
smlal2 v11.2d,v6.4s,v9.s[3]

# qhasm: 2x vec_prod += final_add_0
# asm 1: add <vec_prod=reg128#12.2d, <vec_prod=reg128#12.2d, <final_add_0=reg128#13.2d
# asm 2: add <vec_prod=v11.2d, <vec_prod=v11.2d, <final_add_0=v12.2d
add v11.2d, v11.2d, v12.2d

# qhasm: vec_V6_V7_S6_S7 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V6_V7_S6_S7=reg128#6.16b, <vec_prod=reg128#12.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_V6_V7_S6_S7=v5.16b, <vec_prod=v11.16b, <vec_2x_2p30m1=v0.16b
and v5.16b, v11.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#10.2d, <vec_prod=reg128#12.2d, #30
# asm 2: sshr >vec_prod=v9.2d, <vec_prod=v11.2d, #30
sshr v9.2d, v11.2d, #30

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_V8_V9_S8_S9=reg128#11.s[0]
# asm 2: smlal <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_V8_V9_S8_S9=v10.s[0]
smlal v9.2d,v6.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#10.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_V8_V9_S8_S9=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v9.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_V8_V9_S8_S9=v10.s[2]
smlal2 v9.2d,v6.4s,v10.s[2]

# qhasm: 2x vec_prod += final_add_1
# asm 1: add <vec_prod=reg128#10.2d, <vec_prod=reg128#10.2d, <final_add_1=reg128#2.2d
# asm 2: add <vec_prod=v9.2d, <vec_prod=v9.2d, <final_add_1=v1.2d
add v9.2d, v9.2d, v1.2d

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#2.16b, <vec_prod=reg128#10.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buffer=v1.16b, <vec_prod=v9.16b, <vec_2x_2p30m1=v0.16b
and v1.16b, v9.16b, v0.16b

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#2.2d, <vec_buffer=reg128#2.2d, #32
# asm 2: shl >vec_buffer=v1.2d, <vec_buffer=v1.2d, #32
shl v1.2d, v1.2d, #32

# qhasm: vec_V6_V7_S6_S7 |= vec_buffer
# asm 1: orr <vec_V6_V7_S6_S7=reg128#6.16b, <vec_V6_V7_S6_S7=reg128#6.16b, <vec_buffer=reg128#2.16b
# asm 2: orr <vec_V6_V7_S6_S7=v5.16b, <vec_V6_V7_S6_S7=v5.16b, <vec_buffer=v1.16b
orr v5.16b, v5.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#2.2d, <vec_prod=reg128#10.2d, #30
# asm 2: sshr >vec_prod=v1.2d, <vec_prod=v9.2d, #30
sshr v1.2d, v9.2d, #30

# qhasm: reg128 vec_2x_2p15m1

# qhasm: 2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
# asm 1: sshr <vec_2x_2p15m1=reg128#7.2d, <vec_2x_2p30m1=reg128#1.2d, #15
# asm 2: sshr <vec_2x_2p15m1=v6.2d, <vec_2x_2p30m1=v0.2d, #15
sshr v6.2d, v0.2d, #15

# qhasm: 2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
# asm 1: sshr <vec_2x_2p15m1=reg128#7.2d, <vec_2x_2p30m1=reg128#1.2d, #15
# asm 2: sshr <vec_2x_2p15m1=v6.2d, <vec_2x_2p30m1=v0.2d, #15
sshr v6.2d, v0.2d, #15

# qhasm: 2x vec_2x_2p32m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p32m1=reg128#8.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p32m1=v7.2d, #0xFFFFFFFF
movi v7.2d, #0xFFFFFFFF

# qhasm: reg128 vec_carry

# qhasm: 2x vec_carry = vec_prod >> 15
# asm 1: sshr <vec_carry=reg128#1.2d, <vec_prod=reg128#2.2d, #15
# asm 2: sshr <vec_carry=v0.2d, <vec_prod=v1.2d, #15
sshr v0.2d, v1.2d, #15

# qhasm: vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
# asm 1: and >vec_V8_V9_S8_S9=reg128#2.16b, <vec_prod=reg128#2.16b, <vec_2x_2p15m1=reg128#7.16b
# asm 2: and >vec_V8_V9_S8_S9=v1.16b, <vec_prod=v1.16b, <vec_2x_2p15m1=v6.16b
and v1.16b, v1.16b, v6.16b

# qhasm: 4x vec_buffer = vec_4x_19 * vec_carry
# asm 1: mul >vec_buffer=reg128#1.4s,<vec_4x_19=reg128#3.4s,<vec_carry=reg128#1.4s
# asm 2: mul >vec_buffer=v0.4s,<vec_4x_19=v2.4s,<vec_carry=v0.4s
mul v0.4s,v2.4s,v0.4s

# qhasm: vec_buffer &= vec_2x_2p32m1
# asm 1: and <vec_buffer=reg128#1.16b, <vec_buffer=reg128#1.16b, <vec_2x_2p32m1=reg128#8.16b
# asm 2: and <vec_buffer=v0.16b, <vec_buffer=v0.16b, <vec_2x_2p32m1=v7.16b
and v0.16b, v0.16b, v7.16b

# qhasm: 4x vec_V0_V1_S0_S1 += vec_buffer
# asm 1: add <vec_V0_V1_S0_S1=reg128#4.4s, <vec_V0_V1_S0_S1=reg128#4.4s, <vec_buffer=reg128#1.4s
# asm 2: add <vec_V0_V1_S0_S1=v3.4s, <vec_V0_V1_S0_S1=v3.4s, <vec_buffer=v0.4s
add v3.4s, v3.4s, v0.4s

# qhasm: reg128 vec_V0_V1_V2_V3

# qhasm: reg128 vec_V4_V5_V6_V7

# qhasm: reg128 vec_S0_S1_S2_S3

# qhasm: reg128 vec_S4_S5_S6_S7

# qhasm: 2x vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2]
# asm 1: zip1 >vec_V0_V1_V2_V3=reg128#1.2d, <vec_V0_V1_S0_S1=reg128#4.2d, <vec_V2_V3_S2_S3=reg128#5.2d
# asm 2: zip1 >vec_V0_V1_V2_V3=v0.2d, <vec_V0_V1_S0_S1=v3.2d, <vec_V2_V3_S2_S3=v4.2d
zip1 v0.2d, v3.2d, v4.2d

# qhasm: 2x vec_S0_S1_S2_S3 zip= vec_V0_V1_S0_S1[1/2] vec_V2_V3_S2_S3[1/2]
# asm 1: zip2 >vec_S0_S1_S2_S3=reg128#3.2d, <vec_V0_V1_S0_S1=reg128#4.2d, <vec_V2_V3_S2_S3=reg128#5.2d
# asm 2: zip2 >vec_S0_S1_S2_S3=v2.2d, <vec_V0_V1_S0_S1=v3.2d, <vec_V2_V3_S2_S3=v4.2d
zip2 v2.2d, v3.2d, v4.2d

# qhasm: 2x vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]
# asm 1: zip1 >vec_V4_V5_V6_V7=reg128#4.2d, <vec_V4_V5_S4_S5=reg128#9.2d, <vec_V6_V7_S6_S7=reg128#6.2d
# asm 2: zip1 >vec_V4_V5_V6_V7=v3.2d, <vec_V4_V5_S4_S5=v8.2d, <vec_V6_V7_S6_S7=v5.2d
zip1 v3.2d, v8.2d, v5.2d

# qhasm: 2x vec_S4_S5_S6_S7 zip= vec_V4_V5_S4_S5[1/2] vec_V6_V7_S6_S7[1/2]
# asm 1: zip2 >vec_S4_S5_S6_S7=reg128#5.2d, <vec_V4_V5_S4_S5=reg128#9.2d, <vec_V6_V7_S6_S7=reg128#6.2d
# asm 2: zip2 >vec_S4_S5_S6_S7=v4.2d, <vec_V4_V5_S4_S5=v8.2d, <vec_V6_V7_S6_S7=v5.2d
zip2 v4.2d, v8.2d, v5.2d

# qhasm: mem256[pointer_V] = vec_V0_V1_V2_V3, vec_V4_V5_V6_V7
# asm 1: stp <vec_V0_V1_V2_V3=reg128#1%qregname, <vec_V4_V5_V6_V7=reg128#4%qregname, [<pointer_V=int64#4]
# asm 2: stp <vec_V0_V1_V2_V3=q0, <vec_V4_V5_V6_V7=q3, [<pointer_V=x3]
stp q0, q3, [x3]

# qhasm: mem256[pointer_S] = vec_S0_S1_S2_S3, vec_S4_S5_S6_S7
# asm 1: stp <vec_S0_S1_S2_S3=reg128#3%qregname, <vec_S4_S5_S6_S7=reg128#5%qregname, [<pointer_S=int64#5]
# asm 2: stp <vec_S0_S1_S2_S3=q2, <vec_S4_S5_S6_S7=q4, [<pointer_S=x4]
stp q2, q4, [x4]

# qhasm: int64 V8

# qhasm: V8 = vec_V8_V9_S8_S9[0/2]
# asm 1: umov >V8=int64#7, <vec_V8_V9_S8_S9=reg128#2.d[0]
# asm 2: umov >V8=x6, <vec_V8_V9_S8_S9=v1.d[0]
umov x6, v1.d[0]

# qhasm: mem32[pointer_V+32] = V8
# asm 1: str <V8=int64#7%wregname, [<pointer_V=int64#4, #32]
# asm 2: str <V8=w6, [<pointer_V=x3, #32]
str w6, [x3, #32]

# qhasm: int64 S8

# qhasm: S8 = vec_V8_V9_S8_S9[1/2]
# asm 1: umov >S8=int64#4, <vec_V8_V9_S8_S9=reg128#2.d[1]
# asm 2: umov >S8=x3, <vec_V8_V9_S8_S9=v1.d[1]
umov x3, v1.d[1]

# qhasm: mem32[pointer_S+32] = S8
# asm 1: str <S8=int64#4%wregname, [<pointer_S=int64#5, #32]
# asm 2: str <S8=w3, [<pointer_S=x4, #32]
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
# asm 1: mov >rr=int64#8, #0
# asm 2: mov >rr=x7, #0
mov x7, #0

# qhasm: ss = 1
# asm 1: mov >ss=int64#9, #1
# asm 2: mov >ss=x8, #1
mov x8, #1

# qhasm: int64 2p41

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#10, #1
# asm 2: mov >2p41=x9, #1
mov x9, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#10, <2p41=int64#10, #41
# asm 2: lsl >2p41=x9, <2p41=x9, #41
lsl x9, x9, #41

# qhasm: int64 2p62

# qhasm: 2p62 = 1
# asm 1: mov >2p62=int64#11, #1
# asm 2: mov >2p62=x10, #1
mov x10, #1

# qhasm: 2p62 = 2p62 << 62
# asm 1: lsl >2p62=int64#11, <2p62=int64#11, #62
# asm 2: lsl >2p62=x10, <2p62=x10, #62
lsl x10, x10, #62

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 g1

# qhasm: int64 hh

# qhasm: int64 h

# qhasm: int64 m1

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#12, <f=int64#2, #1048575
# asm 2: and >fuv=x11, <f=x1, #1048575
and x11, x1, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#13, <g=int64#3, #1048575
# asm 2: and >grs=x12, <g=x2, #1048575
and x12, x2, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#12,<fuv=int64#12,<2p41=int64#10
# asm 2: sub <fuv=x11,<fuv=x11,<2p41=x9
sub x11,x11,x9

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#13,<grs=int64#13,<2p62=int64#11
# asm 2: sub <grs=x12,<grs=x12,<2p62=x10
sub x12,x12,x10

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#14,<fuv=int64#12
# asm 2: mov >v=x13,<fuv=x11
mov x13,x11

# qhasm: v = v + 1048576
# asm 1: add >v=int64#14,<v=int64#14,#1048576
# asm 2: add >v=x13,<v=x13,#1048576
add x13,x13,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#14,<v=int64#14,<2p41=int64#10
# asm 2: add >v=x13,<v=x13,<2p41=x9
add x13,x13,x9

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#14, <v=int64#14, #42
# asm 2: asr >v=x13, <v=x13, #42
asr x13, x13, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#12,<fuv=int64#12,#1048576
# asm 2: add >u=x11,<fuv=x11,#1048576
add x11,x11,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#12, <u=int64#12, #22
# asm 2: lsl >u=x11, <u=x11, #22
lsl x11, x11, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#12, <u=int64#12, #43
# asm 2: asr >u=x11, <u=x11, #43
asr x11, x11, #43

# qhasm: s = grs
# asm 1: mov >s=int64#15,<grs=int64#13
# asm 2: mov >s=x14,<grs=x12
mov x14,x12

# qhasm: s = s + 1048576
# asm 1: add >s=int64#15,<s=int64#15,#1048576
# asm 2: add >s=x14,<s=x14,#1048576
add x14,x14,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#15,<s=int64#15,<2p41=int64#10
# asm 2: add >s=x14,<s=x14,<2p41=x9
add x14,x14,x9

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#15, <s=int64#15, #42
# asm 2: asr >s=x14, <s=x14, #42
asr x14, x14, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#13,<grs=int64#13,#1048576
# asm 2: add >r=x12,<grs=x12,#1048576
add x12,x12,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#13, <r=int64#13, #22
# asm 2: lsl >r=x12, <r=x12, #22
lsl x12, x12, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#13, <r=int64#13, #43
# asm 2: asr >r=x12, <r=x12, #43
asr x12, x12, #43

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
# asm 1: mul >prod_lo=int64#16,<u=int64#12,<f=int64#2
# asm 2: mul >prod_lo=x15,<u=x11,<f=x1
mul x15,x11,x1

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#17, <u=int64#12, <f=int64#2
# asm 2: smulh >prod_hi=x16, <u=x11, <f=x1
smulh x16, x11, x1

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#18,<v=int64#14,<g=int64#3
# asm 2: mul >tmp=x17,<v=x13,<g=x2
mul x17,x13,x2

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#16, <prod_lo=int64#16, <tmp=int64#18
# asm 2: adds <prod_lo=x15, <prod_lo=x15, <tmp=x17
adds x15, x15, x17

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#18, <v=int64#14, <g=int64#3
# asm 2: smulh >tmp=x17, <v=x13, <g=x2
smulh x17, x13, x2

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#17,<prod_hi=int64#17,<tmp=int64#18
# asm 2: adc >prod_hi=x16,<prod_hi=x16,<tmp=x17
adc x16,x16,x17

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#16, <prod_lo=int64#16, #20
# asm 2: lsr >prod_lo=x15, <prod_lo=x15, #20
lsr x15, x15, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#17, <prod_hi=int64#17, #44
# asm 2: lsl >prod_hi=x16, <prod_hi=x16, #44
lsl x16, x16, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#16, <prod_lo=int64#16, <prod_hi=int64#17
# asm 2: orr >new_f=x15, <prod_lo=x15, <prod_hi=x16
orr x15, x15, x16

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#17,<r=int64#13,<f=int64#2
# asm 2: mul >prod_lo=x16,<r=x12,<f=x1
mul x16,x12,x1

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#2, <r=int64#13, <f=int64#2
# asm 2: smulh >prod_hi=x1, <r=x12, <f=x1
smulh x1, x12, x1

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#18,<s=int64#15,<g=int64#3
# asm 2: mul >tmp=x17,<s=x14,<g=x2
mul x17,x14,x2

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#17, <prod_lo=int64#17, <tmp=int64#18
# asm 2: adds <prod_lo=x16, <prod_lo=x16, <tmp=x17
adds x16, x16, x17

# qhasm: tmp = s signed* g (hi)
# asm 1: smulh >tmp=int64#3, <s=int64#15, <g=int64#3
# asm 2: smulh >tmp=x2, <s=x14, <g=x2
smulh x2, x14, x2

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#2,<prod_hi=int64#2,<tmp=int64#3
# asm 2: adc >prod_hi=x1,<prod_hi=x1,<tmp=x2
adc x1,x1,x2

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#3, <prod_lo=int64#17, #20
# asm 2: lsr >prod_lo=x2, <prod_lo=x16, #20
lsr x2, x16, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#2, <prod_hi=int64#2, #44
# asm 2: lsl >prod_hi=x1, <prod_hi=x1, #44
lsl x1, x1, #44

# qhasm: new_g = prod_lo | prod_hi
# asm 1: orr >new_g=int64#2, <prod_lo=int64#3, <prod_hi=int64#2
# asm 2: orr >new_g=x1, <prod_lo=x2, <prod_hi=x1
orr x1, x2, x1

# qhasm: f = new_f
# asm 1: mov >f=int64#3,<new_f=int64#16
# asm 2: mov >f=x2,<new_f=x15
mov x2,x15

# qhasm: g = new_g
# asm 1: mov >g=int64#2,<new_g=int64#2
# asm 2: mov >g=x1,<new_g=x1
mov x1,x1

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#16,<u=int64#12,<uu=int64#5
# asm 2: mul >tmp=x15,<u=x11,<uu=x4
mul x15,x11,x4

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#16, <v=int64#14, <rr=int64#8, <tmp=int64#16
# asm 2: madd >new_uu=x15, <v=x13, <rr=x7, <tmp=x15
madd x15, x13, x7, x15

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#5,<r=int64#13,<uu=int64#5
# asm 2: mul >tmp=x4,<r=x12,<uu=x4
mul x4,x12,x4

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#5, <s=int64#15, <rr=int64#8, <tmp=int64#5
# asm 2: madd >new_rr=x4, <s=x14, <rr=x7, <tmp=x4
madd x4, x14, x7, x4

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#8,<u=int64#12,<vv=int64#7
# asm 2: mul >tmp=x7,<u=x11,<vv=x6
mul x7,x11,x6

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#8, <v=int64#14, <ss=int64#9, <tmp=int64#8
# asm 2: madd >new_vv=x7, <v=x13, <ss=x8, <tmp=x7
madd x7, x13, x8, x7

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#7,<r=int64#13,<vv=int64#7
# asm 2: mul >tmp=x6,<r=x12,<vv=x6
mul x6,x12,x6

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#7, <s=int64#15, <ss=int64#9, <tmp=int64#7
# asm 2: madd >new_ss=x6, <s=x14, <ss=x8, <tmp=x6
madd x6, x14, x8, x6

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#9,<new_uu=int64#16
# asm 2: mov >uu=x8,<new_uu=x15
mov x8,x15

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#8,<new_vv=int64#8
# asm 2: mov >vv=x7,<new_vv=x7
mov x7,x7

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#5,<new_rr=int64#5
# asm 2: mov >rr=x4,<new_rr=x4
mov x4,x4

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#7,<new_ss=int64#7
# asm 2: mov >ss=x6,<new_ss=x6
mov x6,x6

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#12, <f=int64#3, #1048575
# asm 2: and >fuv=x11, <f=x2, #1048575
and x11, x2, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#13, <g=int64#2, #1048575
# asm 2: and >grs=x12, <g=x1, #1048575
and x12, x1, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#12,<fuv=int64#12,<2p41=int64#10
# asm 2: sub <fuv=x11,<fuv=x11,<2p41=x9
sub x11,x11,x9

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#13,<grs=int64#13,<2p62=int64#11
# asm 2: sub <grs=x12,<grs=x12,<2p62=x10
sub x12,x12,x10

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#14, <grs=int64#13, #1
# asm 2: and >g1=x13, <grs=x12, #1
and x13, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#15,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x14,<grs=x12,<fuv=x11
sub x14,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#14, <g1=int64#14, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x13, <g1=x13, <fuv=x11, <grs=x12
madd x13, x13, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#16,<m=int64#4,#1
# asm 2: sub >m1=x15,<m=x3,#1
sub x15,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#16, <grs=int64#13, ROR #1
# asm 2: tst <m1=x15, <grs=x12, ROR #1
tst x15, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#16, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x15, <m=x3, pl
csneg x3, x15, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#14, <hh=int64#15, pl
# asm 2: csel >grs=x12, <h=x13, <hh=x14, pl
csel x12, x13, x14, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: v = fuv
# asm 1: mov >v=int64#14,<fuv=int64#12
# asm 2: mov >v=x13,<fuv=x11
mov x13,x11

# qhasm: v = v + 1048576
# asm 1: add >v=int64#14,<v=int64#14,#1048576
# asm 2: add >v=x13,<v=x13,#1048576
add x13,x13,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#14,<v=int64#14,<2p41=int64#10
# asm 2: add >v=x13,<v=x13,<2p41=x9
add x13,x13,x9

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#14, <v=int64#14, #42
# asm 2: asr >v=x13, <v=x13, #42
asr x13, x13, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#12,<fuv=int64#12,#1048576
# asm 2: add >u=x11,<fuv=x11,#1048576
add x11,x11,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#12, <u=int64#12, #22
# asm 2: lsl >u=x11, <u=x11, #22
lsl x11, x11, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#12, <u=int64#12, #43
# asm 2: asr >u=x11, <u=x11, #43
asr x11, x11, #43

# qhasm: s = grs
# asm 1: mov >s=int64#15,<grs=int64#13
# asm 2: mov >s=x14,<grs=x12
mov x14,x12

# qhasm: s = s + 1048576
# asm 1: add >s=int64#15,<s=int64#15,#1048576
# asm 2: add >s=x14,<s=x14,#1048576
add x14,x14,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#15,<s=int64#15,<2p41=int64#10
# asm 2: add >s=x14,<s=x14,<2p41=x9
add x14,x14,x9

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#15, <s=int64#15, #42
# asm 2: asr >s=x14, <s=x14, #42
asr x14, x14, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#13,<grs=int64#13,#1048576
# asm 2: add >r=x12,<grs=x12,#1048576
add x12,x12,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#13, <r=int64#13, #22
# asm 2: lsl >r=x12, <r=x12, #22
lsl x12, x12, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#13, <r=int64#13, #43
# asm 2: asr >r=x12, <r=x12, #43
asr x12, x12, #43

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#16,<u=int64#12,<f=int64#3
# asm 2: mul >prod_lo=x15,<u=x11,<f=x2
mul x15,x11,x2

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#17, <u=int64#12, <f=int64#3
# asm 2: smulh >prod_hi=x16, <u=x11, <f=x2
smulh x16, x11, x2

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#18,<v=int64#14,<g=int64#2
# asm 2: mul >tmp=x17,<v=x13,<g=x1
mul x17,x13,x1

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#16, <prod_lo=int64#16, <tmp=int64#18
# asm 2: adds <prod_lo=x15, <prod_lo=x15, <tmp=x17
adds x15, x15, x17

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#18, <v=int64#14, <g=int64#2
# asm 2: smulh >tmp=x17, <v=x13, <g=x1
smulh x17, x13, x1

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#17,<prod_hi=int64#17,<tmp=int64#18
# asm 2: adc >prod_hi=x16,<prod_hi=x16,<tmp=x17
adc x16,x16,x17

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#16, <prod_lo=int64#16, #20
# asm 2: lsr >prod_lo=x15, <prod_lo=x15, #20
lsr x15, x15, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#17, <prod_hi=int64#17, #44
# asm 2: lsl >prod_hi=x16, <prod_hi=x16, #44
lsl x16, x16, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#16, <prod_lo=int64#16, <prod_hi=int64#17
# asm 2: orr >new_f=x15, <prod_lo=x15, <prod_hi=x16
orr x15, x15, x16

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#17,<r=int64#13,<f=int64#3
# asm 2: mul >prod_lo=x16,<r=x12,<f=x2
mul x16,x12,x2

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#3, <r=int64#13, <f=int64#3
# asm 2: smulh >prod_hi=x2, <r=x12, <f=x2
smulh x2, x12, x2

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#18,<s=int64#15,<g=int64#2
# asm 2: mul >tmp=x17,<s=x14,<g=x1
mul x17,x14,x1

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#17, <prod_lo=int64#17, <tmp=int64#18
# asm 2: adds <prod_lo=x16, <prod_lo=x16, <tmp=x17
adds x16, x16, x17

# qhasm: tmp = s signed* g (hi)
# asm 1: smulh >tmp=int64#2, <s=int64#15, <g=int64#2
# asm 2: smulh >tmp=x1, <s=x14, <g=x1
smulh x1, x14, x1

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#2,<prod_hi=int64#3,<tmp=int64#2
# asm 2: adc >prod_hi=x1,<prod_hi=x2,<tmp=x1
adc x1,x2,x1

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#3, <prod_lo=int64#17, #20
# asm 2: lsr >prod_lo=x2, <prod_lo=x16, #20
lsr x2, x16, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#2, <prod_hi=int64#2, #44
# asm 2: lsl >prod_hi=x1, <prod_hi=x1, #44
lsl x1, x1, #44

# qhasm: new_g = prod_lo | prod_hi
# asm 1: orr >new_g=int64#2, <prod_lo=int64#3, <prod_hi=int64#2
# asm 2: orr >new_g=x1, <prod_lo=x2, <prod_hi=x1
orr x1, x2, x1

# qhasm: f = new_f
# asm 1: mov >f=int64#3,<new_f=int64#16
# asm 2: mov >f=x2,<new_f=x15
mov x2,x15

# qhasm: g = new_g
# asm 1: mov >g=int64#2,<new_g=int64#2
# asm 2: mov >g=x1,<new_g=x1
mov x1,x1

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#16,<u=int64#12,<uu=int64#9
# asm 2: mul >tmp=x15,<u=x11,<uu=x8
mul x15,x11,x8

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#16, <v=int64#14, <rr=int64#5, <tmp=int64#16
# asm 2: madd >new_uu=x15, <v=x13, <rr=x4, <tmp=x15
madd x15, x13, x4, x15

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#9,<r=int64#13,<uu=int64#9
# asm 2: mul >tmp=x8,<r=x12,<uu=x8
mul x8,x12,x8

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#5, <s=int64#15, <rr=int64#5, <tmp=int64#9
# asm 2: madd >new_rr=x4, <s=x14, <rr=x4, <tmp=x8
madd x4, x14, x4, x8

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#9,<u=int64#12,<vv=int64#8
# asm 2: mul >tmp=x8,<u=x11,<vv=x7
mul x8,x11,x7

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#9, <v=int64#14, <ss=int64#7, <tmp=int64#9
# asm 2: madd >new_vv=x8, <v=x13, <ss=x6, <tmp=x8
madd x8, x13, x6, x8

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#8,<r=int64#13,<vv=int64#8
# asm 2: mul >tmp=x7,<r=x12,<vv=x7
mul x7,x12,x7

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#7, <s=int64#15, <ss=int64#7, <tmp=int64#8
# asm 2: madd >new_ss=x6, <s=x14, <ss=x6, <tmp=x7
madd x6, x14, x6, x7

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#8,<new_uu=int64#16
# asm 2: mov >uu=x7,<new_uu=x15
mov x7,x15

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#9,<new_vv=int64#9
# asm 2: mov >vv=x8,<new_vv=x8
mov x8,x8

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
# asm 1: sub <fuv=int64#3,<fuv=int64#3,<2p41=int64#10
# asm 2: sub <fuv=x2,<fuv=x2,<2p41=x9
sub x2,x2,x9

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#2,<grs=int64#2,<2p62=int64#11
# asm 2: sub <grs=x1,<grs=x1,<2p62=x10
sub x1,x1,x10

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#2, #1
# asm 2: and >g1=x10, <grs=x1, #1
and x10, x1, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#2,<fuv=int64#3
# asm 2: sub >hh=x11,<grs=x1,<fuv=x2
sub x11,x1,x2

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#3, <grs=int64#2
# asm 2: madd >h=x10, <g1=x10, <fuv=x2, <grs=x1
madd x10, x10, x2, x1

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#2, ROR #1
# asm 2: tst <m1=x12, <grs=x1, ROR #1
tst x12, x1, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#3, <grs=int64#2, pl
# asm 2: csel >fuv=x1, <fuv=x2, <grs=x1, pl
csel x1, x2, x1, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#11, <grs=int64#3, #1
# asm 2: and >g1=x10, <grs=x2, #1
and x10, x2, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: sub >hh=x11,<grs=x2,<fuv=x1
sub x11,x2,x1

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#11, <g1=int64#11, <fuv=int64#2, <grs=int64#3
# asm 2: madd >h=x10, <g1=x10, <fuv=x1, <grs=x2
madd x10, x10, x1, x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#13,<m=int64#4,#1
# asm 2: sub >m1=x12,<m=x3,#1
sub x12,x3,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#13, <grs=int64#3, ROR #1
# asm 2: tst <m1=x12, <grs=x2, ROR #1
tst x12, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#13, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x12, <m=x3, pl
csneg x3, x12, x3, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#2, <fuv=int64#2, <grs=int64#3, pl
# asm 2: csel >fuv=x1, <fuv=x1, <grs=x2, pl
csel x1, x1, x2, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#3, <h=int64#11, <hh=int64#12, pl
# asm 2: csel >grs=x2, <h=x10, <hh=x11, pl
csel x2, x10, x11, pl

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
# asm 1: add >v=int64#1,<v=int64#1,<2p41=int64#10
# asm 2: add >v=x0,<v=x0,<2p41=x9
add x0,x0,x9

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
# asm 1: add >s=int64#4,<s=int64#4,<2p41=int64#10
# asm 2: add >s=x3,<s=x3,<2p41=x9
add x3,x3,x9

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
# asm 1: mul >tmp=int64#10,<u=int64#2,<uu=int64#8
# asm 2: mul >tmp=x9,<u=x1,<uu=x7
mul x9,x1,x7

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#10, <v=int64#1, <rr=int64#5, <tmp=int64#10
# asm 2: madd >new_uu=x9, <v=x0, <rr=x4, <tmp=x9
madd x9, x0, x4, x9

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#8,<r=int64#3,<uu=int64#8
# asm 2: mul >tmp=x7,<r=x2,<uu=x7
mul x7,x2,x7

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#5, <s=int64#4, <rr=int64#5, <tmp=int64#8
# asm 2: madd >new_rr=x4, <s=x3, <rr=x4, <tmp=x7
madd x4, x3, x4, x7

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#2,<u=int64#2,<vv=int64#9
# asm 2: mul >tmp=x1,<u=x1,<vv=x8
mul x1,x1,x8

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#1, <v=int64#1, <ss=int64#7, <tmp=int64#2
# asm 2: madd >new_vv=x0, <v=x0, <ss=x6, <tmp=x1
madd x0, x0, x6, x1

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#2,<r=int64#3,<vv=int64#9
# asm 2: mul >tmp=x1,<r=x2,<vv=x8
mul x1,x2,x8

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#2, <s=int64#4, <ss=int64#7, <tmp=int64#2
# asm 2: madd >new_ss=x1, <s=x3, <ss=x6, <tmp=x1
madd x1, x3, x6, x1

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#3,<new_uu=int64#10
# asm 2: mov >uu=x2,<new_uu=x9
mov x2,x9

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
