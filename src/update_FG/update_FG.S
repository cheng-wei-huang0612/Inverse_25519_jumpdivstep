
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

# qhasm: int64 pointer_F

# qhasm: int64 pointer_G

# qhasm: int64 pointer_uuvvrrss

# qhasm: input pointer_F

# qhasm: input pointer_G

# qhasm: input pointer_uuvvrrss

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

# qhasm: int64 F8F9

# qhasm: F0F1, F2F3 = mem128[pointer_F]
# asm 1: ldp >F0F1=int64#4, >F2F3=int64#5, [<pointer_F=int64#1]
# asm 2: ldp >F0F1=x3, >F2F3=x4, [<pointer_F=x0]
ldp x3, x4, [x0]

# qhasm: F4F5, F6F7 = mem128[pointer_F+16]
# asm 1: ldp >F4F5=int64#6, >F6F7=int64#7, [<pointer_F=int64#1, #16]
# asm 2: ldp >F4F5=x5, >F6F7=x6, [<pointer_F=x0, #16]
ldp x5, x6, [x0, #16]

# qhasm: F8F9 = mem32[pointer_F+32]
# asm 1: ldr >F8F9=int64#8%wregname, [<pointer_F=int64#1, #32]
# asm 2: ldr >F8F9=w7, [<pointer_F=x0, #32]
ldr w7, [x0, #32]

# qhasm: int64 G0G1

# qhasm: int64 G2G3

# qhasm: int64 G4G5

# qhasm: int64 G6G7

# qhasm: int64 G8G9

# qhasm: G0G1, G2G3 = mem128[pointer_G]
# asm 1: ldp >G0G1=int64#9, >G2G3=int64#10, [<pointer_G=int64#2]
# asm 2: ldp >G0G1=x8, >G2G3=x9, [<pointer_G=x1]
ldp x8, x9, [x1]

# qhasm: G4G5, G6G7 = mem128[pointer_G+16]
# asm 1: ldp >G4G5=int64#11, >G6G7=int64#12, [<pointer_G=int64#2, #16]
# asm 2: ldp >G4G5=x10, >G6G7=x11, [<pointer_G=x1, #16]
ldp x10, x11, [x1, #16]

# qhasm: G8G9 = mem32[pointer_G+32]
# asm 1: ldr >G8G9=int64#13%wregname, [<pointer_G=int64#2, #32]
# asm 2: ldr >G8G9=w12, [<pointer_G=x1, #32]
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

# qhasm: reg128 vec_F8_F9_G8_G9 

# qhasm: vec_F8_F9_G8_G9[0/2] = F8F9 
# asm 1: ins <vec_F8_F9_G8_G9=reg128#5.d[0], <F8F9=int64#8
# asm 2: ins <vec_F8_F9_G8_G9=v4.d[0], <F8F9=x7
ins v4.d[0], x7

# qhasm: vec_F8_F9_G8_G9[1/2] = G8G9 
# asm 1: ins <vec_F8_F9_G8_G9=reg128#5.d[1], <G8G9=int64#13
# asm 2: ins <vec_F8_F9_G8_G9=v4.d[1], <G8G9=x12
ins v4.d[1], x12

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss

# qhasm: uu, vv = mem128[pointer_uuvvrrss + 0]
# asm 1: ldp >uu=int64#4, >vv=int64#5, [<pointer_uuvvrrss=int64#3, #0]
# asm 2: ldp >uu=x3, >vv=x4, [<pointer_uuvvrrss=x2, #0]
ldp x3, x4, [x2, #0]

# qhasm: rr, ss = mem128[pointer_uuvvrrss + 16]
# asm 1: ldp >rr=int64#3, >ss=int64#6, [<pointer_uuvvrrss=int64#3, #16]
# asm 2: ldp >rr=x2, >ss=x5, [<pointer_uuvvrrss=x2, #16]
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

# qhasm: reg128 vec_2x_2p30m1

# qhasm: reg128 vec_2x_2p32m1

# qhasm: 2x vec_2x_2p32m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p32m1=reg128#8.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p32m1=v7.2d, #0xFFFFFFFF
movi v7.2d, #0xFFFFFFFF

# qhasm: 2x vec_2x_2p30m1 = vec_2x_2p32m1 unsigned>> 2
# asm 1: ushr >vec_2x_2p30m1=reg128#8.2d, <vec_2x_2p32m1=reg128#8.2d, #2
# asm 2: ushr >vec_2x_2p30m1=v7.2d, <vec_2x_2p32m1=v7.2d, #2
ushr v7.2d, v7.2d, #2

# qhasm: reg128 vec_buffer

# qhasm: reg128 vec_prod

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smull >vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: smull >vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F0_F1_G0_G1=v0.s[0]
smull v8.2d,v5.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F0_F1_G0_G1=v0.s[2]
smlal2 v8.2d,v5.4s,v0.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
sshr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F0_F1_G0_G1=v0.s[1]
smlal v8.2d,v5.2s,v0.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F0_F1_G0_G1=v0.s[3]
smlal2 v8.2d,v5.4s,v0.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F0_F1_G0_G1=v0.s[0]
smlal v8.2d,v6.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F0_F1_G0_G1=v0.s[2]
smlal2 v8.2d,v6.4s,v0.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
sshr v8.2d, v8.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F2_F3_G2_G3=v1.s[0]
smlal v8.2d,v5.2s,v1.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F2_F3_G2_G3=v1.s[2]
smlal2 v8.2d,v5.4s,v1.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F0_F1_G0_G1=v0.s[1]
smlal v8.2d,v6.2s,v0.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F0_F1_G0_G1=v0.s[3]
smlal2 v8.2d,v6.4s,v0.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#1.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_buffer=v0.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v7.16b
and v0.16b, v8.16b, v7.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
sshr v8.2d, v8.2d, #30

# qhasm: vec_F0_F1_G0_G1 = vec_buffer
# asm 1: mov >vec_F0_F1_G0_G1=reg128#1.16b, <vec_buffer=reg128#1.16b
# asm 2: mov >vec_F0_F1_G0_G1=v0.16b, <vec_buffer=v0.16b
mov v0.16b, v0.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F2_F3_G2_G3=v1.s[1]
smlal v8.2d,v5.2s,v1.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F2_F3_G2_G3=v1.s[3]
smlal2 v8.2d,v5.4s,v1.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F2_F3_G2_G3=v1.s[0]
smlal v8.2d,v6.2s,v1.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F2_F3_G2_G3=v1.s[2]
smlal2 v8.2d,v6.4s,v1.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#10.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_buffer=v9.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v8.16b, v7.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
sshr v8.2d, v8.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#10.2d, <vec_buffer=reg128#10.2d, #32
# asm 2: shl >vec_buffer=v9.2d, <vec_buffer=v9.2d, #32
shl v9.2d, v9.2d, #32

# qhasm: vec_F0_F1_G0_G1 |= vec_buffer
# asm 1: orr <vec_F0_F1_G0_G1=reg128#1.16b, <vec_F0_F1_G0_G1=reg128#1.16b, <vec_buffer=reg128#10.16b
# asm 2: orr <vec_F0_F1_G0_G1=v0.16b, <vec_F0_F1_G0_G1=v0.16b, <vec_buffer=v9.16b
orr v0.16b, v0.16b, v9.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F4_F5_G4_G5=v2.s[0]
smlal v8.2d,v5.2s,v2.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F4_F5_G4_G5=v2.s[2]
smlal2 v8.2d,v5.4s,v2.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F2_F3_G2_G3=v1.s[1]
smlal v8.2d,v6.2s,v1.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F2_F3_G2_G3=v1.s[3]
smlal2 v8.2d,v6.4s,v1.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#2.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_buffer=v1.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v7.16b
and v1.16b, v8.16b, v7.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
sshr v8.2d, v8.2d, #30

# qhasm: vec_F2_F3_G2_G3 = vec_buffer
# asm 1: mov >vec_F2_F3_G2_G3=reg128#2.16b, <vec_buffer=reg128#2.16b
# asm 2: mov >vec_F2_F3_G2_G3=v1.16b, <vec_buffer=v1.16b
mov v1.16b, v1.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F4_F5_G4_G5=v2.s[1]
smlal v8.2d,v5.2s,v2.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F4_F5_G4_G5=v2.s[3]
smlal2 v8.2d,v5.4s,v2.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F4_F5_G4_G5=reg128#3.s[0]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F4_F5_G4_G5=v2.s[0]
smlal v8.2d,v6.2s,v2.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F4_F5_G4_G5=reg128#3.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F4_F5_G4_G5=v2.s[2]
smlal2 v8.2d,v6.4s,v2.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#10.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_buffer=v9.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v8.16b, v7.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
sshr v8.2d, v8.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#10.2d, <vec_buffer=reg128#10.2d, #32
# asm 2: shl >vec_buffer=v9.2d, <vec_buffer=v9.2d, #32
shl v9.2d, v9.2d, #32

# qhasm: vec_F2_F3_G2_G3 |= vec_buffer
# asm 1: orr <vec_F2_F3_G2_G3=reg128#2.16b, <vec_F2_F3_G2_G3=reg128#2.16b, <vec_buffer=reg128#10.16b
# asm 2: orr <vec_F2_F3_G2_G3=v1.16b, <vec_F2_F3_G2_G3=v1.16b, <vec_buffer=v9.16b
orr v1.16b, v1.16b, v9.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F6_F7_G6_G7=v3.s[0]
smlal v8.2d,v5.2s,v3.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F6_F7_G6_G7=v3.s[2]
smlal2 v8.2d,v5.4s,v3.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F4_F5_G4_G5=reg128#3.s[1]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F4_F5_G4_G5=v2.s[1]
smlal v8.2d,v6.2s,v2.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F4_F5_G4_G5=reg128#3.s[3]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F4_F5_G4_G5=v2.s[3]
smlal2 v8.2d,v6.4s,v2.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#3.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_buffer=v2.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v7.16b
and v2.16b, v8.16b, v7.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
sshr v8.2d, v8.2d, #30

# qhasm: vec_F4_F5_G4_G5 = vec_buffer
# asm 1: mov >vec_F4_F5_G4_G5=reg128#3.16b, <vec_buffer=reg128#3.16b
# asm 2: mov >vec_F4_F5_G4_G5=v2.16b, <vec_buffer=v2.16b
mov v2.16b, v2.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F6_F7_G6_G7=v3.s[1]
smlal v8.2d,v5.2s,v3.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F6_F7_G6_G7=v3.s[3]
smlal2 v8.2d,v5.4s,v3.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F6_F7_G6_G7=reg128#4.s[0]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F6_F7_G6_G7=v3.s[0]
smlal v8.2d,v6.2s,v3.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F6_F7_G6_G7=reg128#4.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F6_F7_G6_G7=v3.s[2]
smlal2 v8.2d,v6.4s,v3.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#10.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_buffer=v9.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v7.16b
and v9.16b, v8.16b, v7.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v8.2d, <vec_prod=v8.2d, #30
sshr v8.2d, v8.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#10.2d, <vec_buffer=reg128#10.2d, #32
# asm 2: shl >vec_buffer=v9.2d, <vec_buffer=v9.2d, #32
shl v9.2d, v9.2d, #32

# qhasm: vec_F4_F5_G4_G5 |= vec_buffer
# asm 1: orr <vec_F4_F5_G4_G5=reg128#3.16b, <vec_F4_F5_G4_G5=reg128#3.16b, <vec_buffer=reg128#10.16b
# asm 2: orr <vec_F4_F5_G4_G5=v2.16b, <vec_F4_F5_G4_G5=v2.16b, <vec_buffer=v9.16b
orr v2.16b, v2.16b, v9.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.2s,<vec_F8_F9_G8_G9=reg128#5.s[0]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.2s,<vec_F8_F9_G8_G9=v4.s[0]
smlal v8.2d,v5.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu0_rr0_vv0_ss0=reg128#6.4s,<vec_F8_F9_G8_G9=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu0_rr0_vv0_ss0=v5.4s,<vec_F8_F9_G8_G9=v4.s[2]
smlal2 v8.2d,v5.4s,v4.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F6_F7_G6_G7=reg128#4.s[1]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F6_F7_G6_G7=v3.s[1]
smlal v8.2d,v6.2s,v3.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F6_F7_G6_G7=reg128#4.s[3]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F6_F7_G6_G7=v3.s[3]
smlal2 v8.2d,v6.4s,v3.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#4.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_buffer=v3.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v7.16b
and v3.16b, v8.16b, v7.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#6.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v5.2d, <vec_prod=v8.2d, #30
sshr v5.2d, v8.2d, #30

# qhasm: vec_F6_F7_G6_G7 = vec_buffer
# asm 1: mov >vec_F6_F7_G6_G7=reg128#4.16b, <vec_buffer=reg128#4.16b
# asm 2: mov >vec_F6_F7_G6_G7=v3.16b, <vec_buffer=v3.16b
mov v3.16b, v3.16b

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#6.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.2s,<vec_F8_F9_G8_G9=reg128#5.s[0]
# asm 2: smlal <vec_prod=v5.2d,<vec_uu1_rr1_vv1_ss1=v6.2s,<vec_F8_F9_G8_G9=v4.s[0]
smlal v5.2d,v6.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#6.2d,<vec_uu1_rr1_vv1_ss1=reg128#7.4s,<vec_F8_F9_G8_G9=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v5.2d,<vec_uu1_rr1_vv1_ss1=v6.4s,<vec_F8_F9_G8_G9=v4.s[2]
smlal2 v5.2d,v6.4s,v4.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#5.16b, <vec_prod=reg128#6.16b, <vec_2x_2p30m1=reg128#8.16b
# asm 2: and >vec_buffer=v4.16b, <vec_prod=v5.16b, <vec_2x_2p30m1=v7.16b
and v4.16b, v5.16b, v7.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#6.2d, <vec_prod=reg128#6.2d, #30
# asm 2: sshr >vec_prod=v5.2d, <vec_prod=v5.2d, #30
sshr v5.2d, v5.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#5.2d, <vec_buffer=reg128#5.2d, #32
# asm 2: shl >vec_buffer=v4.2d, <vec_buffer=v4.2d, #32
shl v4.2d, v4.2d, #32

# qhasm: vec_F6_F7_G6_G7 |= vec_buffer
# asm 1: orr <vec_F6_F7_G6_G7=reg128#4.16b, <vec_F6_F7_G6_G7=reg128#4.16b, <vec_buffer=reg128#5.16b
# asm 2: orr <vec_F6_F7_G6_G7=v3.16b, <vec_F6_F7_G6_G7=v3.16b, <vec_buffer=v4.16b
orr v3.16b, v3.16b, v4.16b

# qhasm: vec_F8_F9_G8_G9 = vec_prod
# asm 1: mov >vec_F8_F9_G8_G9=reg128#5.16b, <vec_prod=reg128#6.16b
# asm 2: mov >vec_F8_F9_G8_G9=v4.16b, <vec_prod=v5.16b
mov v4.16b, v5.16b

# qhasm: reg128 vec_F0_F1_F2_F3

# qhasm: reg128 vec_G0_G1_G2_G3

# qhasm: 2x vec_F0_F1_F2_F3 zip= vec_F0_F1_G0_G1[0/2] vec_F2_F3_G2_G3[0/2]
# asm 1: zip1 >vec_F0_F1_F2_F3=reg128#6.2d, <vec_F0_F1_G0_G1=reg128#1.2d, <vec_F2_F3_G2_G3=reg128#2.2d
# asm 2: zip1 >vec_F0_F1_F2_F3=v5.2d, <vec_F0_F1_G0_G1=v0.2d, <vec_F2_F3_G2_G3=v1.2d
zip1 v5.2d, v0.2d, v1.2d

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
# asm 1: stp <vec_F0_F1_F2_F3=reg128#6%qregname, <vec_F4_F5_F6_F7=reg128#2%qregname, [<pointer_F=int64#1]
# asm 2: stp <vec_F0_F1_F2_F3=q5, <vec_F4_F5_F6_F7=q1, [<pointer_F=x0]
stp q5, q1, [x0]

# qhasm: mem256[pointer_G] = vec_G0_G1_G2_G3, vec_G4_G5_G6_G7
# asm 1: stp <vec_G0_G1_G2_G3=reg128#1%qregname, <vec_G4_G5_G6_G7=reg128#3%qregname, [<pointer_G=int64#2]
# asm 2: stp <vec_G0_G1_G2_G3=q0, <vec_G4_G5_G6_G7=q2, [<pointer_G=x1]
stp q0, q2, [x1]

# qhasm: int64 F8

# qhasm: F8 = vec_F8_F9_G8_G9[0/2]
# asm 1: umov >F8=int64#3, <vec_F8_F9_G8_G9=reg128#5.d[0]
# asm 2: umov >F8=x2, <vec_F8_F9_G8_G9=v4.d[0]
umov x2, v4.d[0]

# qhasm: mem32[pointer_F+32] = F8
# asm 1: str <F8=int64#3%wregname, [<pointer_F=int64#1, #32]
# asm 2: str <F8=w2, [<pointer_F=x0, #32]
str w2, [x0, #32]

# qhasm: int64 G8

# qhasm: G8 = vec_F8_F9_G8_G9[1/2]
# asm 1: umov >G8=int64#1, <vec_F8_F9_G8_G9=reg128#5.d[1]
# asm 2: umov >G8=x0, <vec_F8_F9_G8_G9=v4.d[1]
umov x0, v4.d[1]

# qhasm: mem32[pointer_G+32] = G8
# asm 1: str <G8=int64#1%wregname, [<pointer_G=int64#2, #32]
# asm 2: str <G8=w0, [<pointer_G=x1, #32]
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
