
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

# qhasm: int64 pointer_V

# qhasm: int64 pointer_S

# qhasm: int64 pointer_uuvvrrss

# qhasm: input pointer_V

# qhasm: input pointer_S

# qhasm: input pointer_uuvvrrss

# qhasm: caller calleesaved_v8

# qhasm: caller calleesaved_v9

# qhasm: caller calleesaved_v10

# qhasm: caller calleesaved_v11

# qhasm: caller calleesaved_v12

# qhasm: caller calleesaved_v13

# qhasm: caller calleesaved_v14

# qhasm: caller calleesaved_v15

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

# qhasm: reg128 vec_V0_V1_S0_S1

# qhasm: reg128 vec_V2_V3_S2_S3

# qhasm: reg128 vec_V4_V5_S4_S5

# qhasm: reg128 vec_V6_V7_S6_S7

# qhasm: reg128 vec_V8_V9_S8_S9

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: reg128 vec_2x_2p30m1

# qhasm: 2x vec_2x_2p30m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p30m1=reg128#1.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p30m1=v0.2d, #0xFFFFFFFF
movi v0.2d, #0xFFFFFFFF

# qhasm: 2x vec_2x_2p30m1 >>= 2
# asm 1: sshr >vec_2x_2p30m1=reg128#1.2d, <vec_2x_2p30m1=reg128#1.2d, #2
# asm 2: sshr >vec_2x_2p30m1=v0.2d, <vec_2x_2p30m1=v0.2d, #2
sshr v0.2d, v0.2d, #2

# qhasm: int64 M

# qhasm: M = 0
# asm 1: mov >M=int64#4, #0
# asm 2: mov >M=x3, #0
mov x3, #0

# qhasm: M[0/4] = 51739
# asm 1: movk <M=int64#4, #51739
# asm 2: movk <M=x3, #51739
movk x3, #51739

# qhasm: M[1/4] = 10347
# asm 1: movk <M=int64#4, #10347,LSL #16
# asm 2: movk <M=x3, #10347,LSL #16
movk x3, #10347,LSL #16

# qhasm: reg128 vec_M

# qhasm: 4x vec_M = M
# asm 1: dup <vec_M=reg128#2.4s, <M=int64#4%wregname
# asm 2: dup <vec_M=v1.4s, <M=w3
dup v1.4s, w3

# qhasm: int64 _19

# qhasm: _19 = 19
# asm 1: mov >_19=int64#4, #19
# asm 2: mov >_19=x3, #19
mov x3, #19

# qhasm: reg128 vec_4x_19

# qhasm: 4x vec_4x_19 = _19
# asm 1: dup <vec_4x_19=reg128#3.4s, <_19=int64#4%wregname
# asm 2: dup <vec_4x_19=v2.4s, <_19=w3
dup v2.4s, w3

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7

# qhasm: int64 V8V9

# qhasm: V0V1, V2V3 = mem128[pointer_V]
# asm 1: ldp >V0V1=int64#4, >V2V3=int64#5, [<pointer_V=int64#1]
# asm 2: ldp >V0V1=x3, >V2V3=x4, [<pointer_V=x0]
ldp x3, x4, [x0]

# qhasm: V4V5, V6V7 = mem128[pointer_V+16]
# asm 1: ldp >V4V5=int64#6, >V6V7=int64#7, [<pointer_V=int64#1, #16]
# asm 2: ldp >V4V5=x5, >V6V7=x6, [<pointer_V=x0, #16]
ldp x5, x6, [x0, #16]

# qhasm: V8V9 = mem32[pointer_V+32]
# asm 1: ldr >V8V9=int64#8%wregname, [<pointer_V=int64#1, #32]
# asm 2: ldr >V8V9=w7, [<pointer_V=x0, #32]
ldr w7, [x0, #32]

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 S4S5

# qhasm: int64 S6S7

# qhasm: int64 S8S9

# qhasm: S0S1, S2S3 = mem128[pointer_S]
# asm 1: ldp >S0S1=int64#9, >S2S3=int64#10, [<pointer_S=int64#2]
# asm 2: ldp >S0S1=x8, >S2S3=x9, [<pointer_S=x1]
ldp x8, x9, [x1]

# qhasm: S4S5, S6S7 = mem128[pointer_S+16]
# asm 1: ldp >S4S5=int64#11, >S6S7=int64#12, [<pointer_S=int64#2, #16]
# asm 2: ldp >S4S5=x10, >S6S7=x11, [<pointer_S=x1, #16]
ldp x10, x11, [x1, #16]

# qhasm: S8S9 = mem32[pointer_S+32]
# asm 1: ldr >S8S9=int64#13%wregname, [<pointer_S=int64#2, #32]
# asm 2: ldr >S8S9=w12, [<pointer_S=x1, #32]
ldr w12, [x1, #32]

# qhasm: vec_V0_V1_S0_S1[0/2] = V0V1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#4.d[0], <V0V1=int64#4
# asm 2: ins <vec_V0_V1_S0_S1=v3.d[0], <V0V1=x3
ins v3.d[0], x3

# qhasm: vec_V0_V1_S0_S1[1/2] = S0S1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#4.d[1], <S0S1=int64#9
# asm 2: ins <vec_V0_V1_S0_S1=v3.d[1], <S0S1=x8
ins v3.d[1], x8

# qhasm: vec_V2_V3_S2_S3[0/2] = V2V3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#5.d[0], <V2V3=int64#5
# asm 2: ins <vec_V2_V3_S2_S3=v4.d[0], <V2V3=x4
ins v4.d[0], x4

# qhasm: vec_V2_V3_S2_S3[1/2] = S2S3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#5.d[1], <S2S3=int64#10
# asm 2: ins <vec_V2_V3_S2_S3=v4.d[1], <S2S3=x9
ins v4.d[1], x9

# qhasm: vec_V4_V5_S4_S5[0/2] = V4V5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#6.d[0], <V4V5=int64#6
# asm 2: ins <vec_V4_V5_S4_S5=v5.d[0], <V4V5=x5
ins v5.d[0], x5

# qhasm: vec_V4_V5_S4_S5[1/2] = S4S5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#6.d[1], <S4S5=int64#11
# asm 2: ins <vec_V4_V5_S4_S5=v5.d[1], <S4S5=x10
ins v5.d[1], x10

# qhasm: vec_V6_V7_S6_S7[0/2] = V6V7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#7.d[0], <V6V7=int64#7
# asm 2: ins <vec_V6_V7_S6_S7=v6.d[0], <V6V7=x6
ins v6.d[0], x6

# qhasm: vec_V6_V7_S6_S7[1/2] = S6S7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#7.d[1], <S6S7=int64#12
# asm 2: ins <vec_V6_V7_S6_S7=v6.d[1], <S6S7=x11
ins v6.d[1], x11

# qhasm: vec_V8_V9_S8_S9[0/2] = V8V9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#8.d[0], <V8V9=int64#8
# asm 2: ins <vec_V8_V9_S8_S9=v7.d[0], <V8V9=x7
ins v7.d[0], x7

# qhasm: vec_V8_V9_S8_S9[1/2] = S8S9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#8.d[1], <S8S9=int64#13
# asm 2: ins <vec_V8_V9_S8_S9=v7.d[1], <S8S9=x12
ins v7.d[1], x12

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

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#9.s[0], <uu0=int64#7%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v8.s[0], <uu0=w6
ins v8.s[0], w6

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#9.s[1], <rr0=int64#9%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v8.s[1], <rr0=w8
ins v8.s[1], w8

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#9.s[2], <vv0=int64#8%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v8.s[2], <vv0=w7
ins v8.s[2], w7

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#9.s[3], <ss0=int64#10%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v8.s[3], <ss0=w9
ins v8.s[3], w9

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#10.s[0], <uu1=int64#4%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v9.s[0], <uu1=w3
ins v9.s[0], w3

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#10.s[1], <rr1=int64#3%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v9.s[1], <rr1=w2
ins v9.s[1], w2

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#10.s[2], <vv1=int64#5%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v9.s[2], <vv1=w4
ins v9.s[2], w4

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#10.s[3], <ss1=int64#6%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v9.s[3], <ss1=w5
ins v9.s[3], w5

# qhasm: reg128 vec_buffer

# qhasm: reg128 vec_prod

# qhasm: reg128 final_add_0

# qhasm: reg128 final_add_1

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smull >vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.2s,<vec_V0_V1_S0_S1=reg128#4.s[0]
# asm 2: smull >vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.2s,<vec_V0_V1_S0_S1=v3.s[0]
smull v10.2d,v8.2s,v3.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.4s,<vec_V0_V1_S0_S1=reg128#4.s[2]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.4s,<vec_V0_V1_S0_S1=v3.s[2]
smlal2 v10.2d,v8.4s,v3.s[2]

# qhasm: reg128 vec_l0

# qhasm: 4x vec_l0 = vec_prod * vec_M
# asm 1: mul >vec_l0=reg128#12.4s,<vec_prod=reg128#11.4s,<vec_M=reg128#2.4s
# asm 2: mul >vec_l0=v11.4s,<vec_prod=v10.4s,<vec_M=v1.4s
mul v11.4s,v10.4s,v1.4s

# qhasm: vec_l0 &= vec_2x_2p30m1
# asm 1: and <vec_l0=reg128#12.16b, <vec_l0=reg128#12.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and <vec_l0=v11.16b, <vec_l0=v11.16b, <vec_2x_2p30m1=v0.16b
and v11.16b, v11.16b, v0.16b

# qhasm: 4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4]
# asm 1: uzp1 >vec_l0=reg128#12.4s, <vec_l0=reg128#12.4s, <vec_l0=reg128#12.4s
# asm 2: uzp1 >vec_l0=v11.4s, <vec_l0=v11.4s, <vec_l0=v11.4s
uzp1 v11.4s, v11.4s, v11.4s

# qhasm: 2x vec_prod -= vec_l0[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#11.2d,<vec_l0=reg128#12.2s,<vec_4x_19=reg128#3.2s
# asm 2: smlsl <vec_prod=v10.2d,<vec_l0=v11.2s,<vec_4x_19=v2.2s
smlsl v10.2d,v11.2s,v2.2s

# qhasm: 2x final_add_0 = vec_l0[0] << 15
# asm 1: sshll >final_add_0=reg128#12.2d,<vec_l0=reg128#12.2s,15
# asm 2: sshll >final_add_0=v11.2d,<vec_l0=v11.2s,15
sshll v11.2d,v11.2s,15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#11.2d, <vec_prod=reg128#11.2d, #30
# asm 2: sshr >vec_prod=v10.2d, <vec_prod=v10.2d, #30
sshr v10.2d, v10.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.2s,<vec_V0_V1_S0_S1=reg128#4.s[1]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.2s,<vec_V0_V1_S0_S1=v3.s[1]
smlal v10.2d,v8.2s,v3.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.4s,<vec_V0_V1_S0_S1=reg128#4.s[3]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.4s,<vec_V0_V1_S0_S1=v3.s[3]
smlal2 v10.2d,v8.4s,v3.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.2s,<vec_V0_V1_S0_S1=reg128#4.s[0]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.2s,<vec_V0_V1_S0_S1=v3.s[0]
smlal v10.2d,v9.2s,v3.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.4s,<vec_V0_V1_S0_S1=reg128#4.s[2]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.4s,<vec_V0_V1_S0_S1=v3.s[2]
smlal2 v10.2d,v9.4s,v3.s[2]

# qhasm: reg128 vec_l1

# qhasm: 4x vec_l1 = vec_prod * vec_M
# asm 1: mul >vec_l1=reg128#2.4s,<vec_prod=reg128#11.4s,<vec_M=reg128#2.4s
# asm 2: mul >vec_l1=v1.4s,<vec_prod=v10.4s,<vec_M=v1.4s
mul v1.4s,v10.4s,v1.4s

# qhasm: vec_l1 &= vec_2x_2p30m1
# asm 1: and <vec_l1=reg128#2.16b, <vec_l1=reg128#2.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and <vec_l1=v1.16b, <vec_l1=v1.16b, <vec_2x_2p30m1=v0.16b
and v1.16b, v1.16b, v0.16b

# qhasm: 4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4]
# asm 1: uzp1 >vec_l1=reg128#2.4s, <vec_l1=reg128#2.4s, <vec_l1=reg128#2.4s
# asm 2: uzp1 >vec_l1=v1.4s, <vec_l1=v1.4s, <vec_l1=v1.4s
uzp1 v1.4s, v1.4s, v1.4s

# qhasm: 2x vec_prod -= vec_l1[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#11.2d,<vec_l1=reg128#2.2s,<vec_4x_19=reg128#3.2s
# asm 2: smlsl <vec_prod=v10.2d,<vec_l1=v1.2s,<vec_4x_19=v2.2s
smlsl v10.2d,v1.2s,v2.2s

# qhasm: 2x final_add_1 = vec_l1[0] << 15
# asm 1: sshll >final_add_1=reg128#2.2d,<vec_l1=reg128#2.2s,15
# asm 2: sshll >final_add_1=v1.2d,<vec_l1=v1.2s,15
sshll v1.2d,v1.2s,15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#11.2d, <vec_prod=reg128#11.2d, #30
# asm 2: sshr >vec_prod=v10.2d, <vec_prod=v10.2d, #30
sshr v10.2d, v10.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.2s,<vec_V2_V3_S2_S3=reg128#5.s[0]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.2s,<vec_V2_V3_S2_S3=v4.s[0]
smlal v10.2d,v8.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.4s,<vec_V2_V3_S2_S3=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.4s,<vec_V2_V3_S2_S3=v4.s[2]
smlal2 v10.2d,v8.4s,v4.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.2s,<vec_V0_V1_S0_S1=reg128#4.s[1]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.2s,<vec_V0_V1_S0_S1=v3.s[1]
smlal v10.2d,v9.2s,v3.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.4s,<vec_V0_V1_S0_S1=reg128#4.s[3]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.4s,<vec_V0_V1_S0_S1=v3.s[3]
smlal2 v10.2d,v9.4s,v3.s[3]

# qhasm: vec_V0_V1_S0_S1 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V0_V1_S0_S1=reg128#4.16b, <vec_prod=reg128#11.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_V0_V1_S0_S1=v3.16b, <vec_prod=v10.16b, <vec_2x_2p30m1=v0.16b
and v3.16b, v10.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#11.2d, <vec_prod=reg128#11.2d, #30
# asm 2: sshr >vec_prod=v10.2d, <vec_prod=v10.2d, #30
sshr v10.2d, v10.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.2s,<vec_V2_V3_S2_S3=reg128#5.s[1]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.2s,<vec_V2_V3_S2_S3=v4.s[1]
smlal v10.2d,v8.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.4s,<vec_V2_V3_S2_S3=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.4s,<vec_V2_V3_S2_S3=v4.s[3]
smlal2 v10.2d,v8.4s,v4.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.2s,<vec_V2_V3_S2_S3=reg128#5.s[0]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.2s,<vec_V2_V3_S2_S3=v4.s[0]
smlal v10.2d,v9.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.4s,<vec_V2_V3_S2_S3=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.4s,<vec_V2_V3_S2_S3=v4.s[2]
smlal2 v10.2d,v9.4s,v4.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#13.16b, <vec_prod=reg128#11.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buffer=v12.16b, <vec_prod=v10.16b, <vec_2x_2p30m1=v0.16b
and v12.16b, v10.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#11.2d, <vec_prod=reg128#11.2d, #30
# asm 2: sshr >vec_prod=v10.2d, <vec_prod=v10.2d, #30
sshr v10.2d, v10.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#13.2d, <vec_buffer=reg128#13.2d, #32
# asm 2: shl >vec_buffer=v12.2d, <vec_buffer=v12.2d, #32
shl v12.2d, v12.2d, #32

# qhasm: vec_V0_V1_S0_S1 |= vec_buffer
# asm 1: orr <vec_V0_V1_S0_S1=reg128#4.16b, <vec_V0_V1_S0_S1=reg128#4.16b, <vec_buffer=reg128#13.16b
# asm 2: orr <vec_V0_V1_S0_S1=v3.16b, <vec_V0_V1_S0_S1=v3.16b, <vec_buffer=v12.16b
orr v3.16b, v3.16b, v12.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.2s,<vec_V4_V5_S4_S5=reg128#6.s[0]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.2s,<vec_V4_V5_S4_S5=v5.s[0]
smlal v10.2d,v8.2s,v5.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.4s,<vec_V4_V5_S4_S5=reg128#6.s[2]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.4s,<vec_V4_V5_S4_S5=v5.s[2]
smlal2 v10.2d,v8.4s,v5.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.2s,<vec_V2_V3_S2_S3=reg128#5.s[1]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.2s,<vec_V2_V3_S2_S3=v4.s[1]
smlal v10.2d,v9.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.4s,<vec_V2_V3_S2_S3=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.4s,<vec_V2_V3_S2_S3=v4.s[3]
smlal2 v10.2d,v9.4s,v4.s[3]

# qhasm: vec_V2_V3_S2_S3 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V2_V3_S2_S3=reg128#5.16b, <vec_prod=reg128#11.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_V2_V3_S2_S3=v4.16b, <vec_prod=v10.16b, <vec_2x_2p30m1=v0.16b
and v4.16b, v10.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#11.2d, <vec_prod=reg128#11.2d, #30
# asm 2: sshr >vec_prod=v10.2d, <vec_prod=v10.2d, #30
sshr v10.2d, v10.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.2s,<vec_V4_V5_S4_S5=reg128#6.s[1]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.2s,<vec_V4_V5_S4_S5=v5.s[1]
smlal v10.2d,v8.2s,v5.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.4s,<vec_V4_V5_S4_S5=reg128#6.s[3]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.4s,<vec_V4_V5_S4_S5=v5.s[3]
smlal2 v10.2d,v8.4s,v5.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.2s,<vec_V4_V5_S4_S5=reg128#6.s[0]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.2s,<vec_V4_V5_S4_S5=v5.s[0]
smlal v10.2d,v9.2s,v5.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.4s,<vec_V4_V5_S4_S5=reg128#6.s[2]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.4s,<vec_V4_V5_S4_S5=v5.s[2]
smlal2 v10.2d,v9.4s,v5.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#13.16b, <vec_prod=reg128#11.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buffer=v12.16b, <vec_prod=v10.16b, <vec_2x_2p30m1=v0.16b
and v12.16b, v10.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#11.2d, <vec_prod=reg128#11.2d, #30
# asm 2: sshr >vec_prod=v10.2d, <vec_prod=v10.2d, #30
sshr v10.2d, v10.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#13.2d, <vec_buffer=reg128#13.2d, #32
# asm 2: shl >vec_buffer=v12.2d, <vec_buffer=v12.2d, #32
shl v12.2d, v12.2d, #32

# qhasm: vec_V2_V3_S2_S3 |= vec_buffer
# asm 1: orr <vec_V2_V3_S2_S3=reg128#5.16b, <vec_V2_V3_S2_S3=reg128#5.16b, <vec_buffer=reg128#13.16b
# asm 2: orr <vec_V2_V3_S2_S3=v4.16b, <vec_V2_V3_S2_S3=v4.16b, <vec_buffer=v12.16b
orr v4.16b, v4.16b, v12.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.2s,<vec_V6_V7_S6_S7=reg128#7.s[0]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.2s,<vec_V6_V7_S6_S7=v6.s[0]
smlal v10.2d,v8.2s,v6.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.4s,<vec_V6_V7_S6_S7=reg128#7.s[2]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.4s,<vec_V6_V7_S6_S7=v6.s[2]
smlal2 v10.2d,v8.4s,v6.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.2s,<vec_V4_V5_S4_S5=reg128#6.s[1]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.2s,<vec_V4_V5_S4_S5=v5.s[1]
smlal v10.2d,v9.2s,v5.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.4s,<vec_V4_V5_S4_S5=reg128#6.s[3]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.4s,<vec_V4_V5_S4_S5=v5.s[3]
smlal2 v10.2d,v9.4s,v5.s[3]

# qhasm: vec_V4_V5_S4_S5 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V4_V5_S4_S5=reg128#6.16b, <vec_prod=reg128#11.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_V4_V5_S4_S5=v5.16b, <vec_prod=v10.16b, <vec_2x_2p30m1=v0.16b
and v5.16b, v10.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#11.2d, <vec_prod=reg128#11.2d, #30
# asm 2: sshr >vec_prod=v10.2d, <vec_prod=v10.2d, #30
sshr v10.2d, v10.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.2s,<vec_V6_V7_S6_S7=reg128#7.s[1]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.2s,<vec_V6_V7_S6_S7=v6.s[1]
smlal v10.2d,v8.2s,v6.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.4s,<vec_V6_V7_S6_S7=reg128#7.s[3]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.4s,<vec_V6_V7_S6_S7=v6.s[3]
smlal2 v10.2d,v8.4s,v6.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.2s,<vec_V6_V7_S6_S7=reg128#7.s[0]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.2s,<vec_V6_V7_S6_S7=v6.s[0]
smlal v10.2d,v9.2s,v6.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.4s,<vec_V6_V7_S6_S7=reg128#7.s[2]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.4s,<vec_V6_V7_S6_S7=v6.s[2]
smlal2 v10.2d,v9.4s,v6.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#13.16b, <vec_prod=reg128#11.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buffer=v12.16b, <vec_prod=v10.16b, <vec_2x_2p30m1=v0.16b
and v12.16b, v10.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#11.2d, <vec_prod=reg128#11.2d, #30
# asm 2: sshr >vec_prod=v10.2d, <vec_prod=v10.2d, #30
sshr v10.2d, v10.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#13.2d, <vec_buffer=reg128#13.2d, #32
# asm 2: shl >vec_buffer=v12.2d, <vec_buffer=v12.2d, #32
shl v12.2d, v12.2d, #32

# qhasm: vec_V4_V5_S4_S5 |= vec_buffer
# asm 1: orr <vec_V4_V5_S4_S5=reg128#6.16b, <vec_V4_V5_S4_S5=reg128#6.16b, <vec_buffer=reg128#13.16b
# asm 2: orr <vec_V4_V5_S4_S5=v5.16b, <vec_V4_V5_S4_S5=v5.16b, <vec_buffer=v12.16b
orr v5.16b, v5.16b, v12.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.2s,<vec_V8_V9_S8_S9=reg128#8.s[0]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.2s,<vec_V8_V9_S8_S9=v7.s[0]
smlal v10.2d,v8.2s,v7.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu0_rr0_vv0_ss0=reg128#9.4s,<vec_V8_V9_S8_S9=reg128#8.s[2]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu0_rr0_vv0_ss0=v8.4s,<vec_V8_V9_S8_S9=v7.s[2]
smlal2 v10.2d,v8.4s,v7.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.2s,<vec_V6_V7_S6_S7=reg128#7.s[1]
# asm 2: smlal <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.2s,<vec_V6_V7_S6_S7=v6.s[1]
smlal v10.2d,v9.2s,v6.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#11.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.4s,<vec_V6_V7_S6_S7=reg128#7.s[3]
# asm 2: smlal2 <vec_prod=v10.2d,<vec_uu1_rr1_vv1_ss1=v9.4s,<vec_V6_V7_S6_S7=v6.s[3]
smlal2 v10.2d,v9.4s,v6.s[3]

# qhasm: 2x vec_prod += final_add_0
# asm 1: add <vec_prod=reg128#11.2d, <vec_prod=reg128#11.2d, <final_add_0=reg128#12.2d
# asm 2: add <vec_prod=v10.2d, <vec_prod=v10.2d, <final_add_0=v11.2d
add v10.2d, v10.2d, v11.2d

# qhasm: vec_V6_V7_S6_S7 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V6_V7_S6_S7=reg128#7.16b, <vec_prod=reg128#11.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_V6_V7_S6_S7=v6.16b, <vec_prod=v10.16b, <vec_2x_2p30m1=v0.16b
and v6.16b, v10.16b, v0.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#9.2d, <vec_prod=reg128#11.2d, #30
# asm 2: sshr >vec_prod=v8.2d, <vec_prod=v10.2d, #30
sshr v8.2d, v10.2d, #30

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.2s,<vec_V8_V9_S8_S9=reg128#8.s[0]
# asm 2: smlal <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v9.2s,<vec_V8_V9_S8_S9=v7.s[0]
smlal v8.2d,v9.2s,v7.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#9.2d,<vec_uu1_rr1_vv1_ss1=reg128#10.4s,<vec_V8_V9_S8_S9=reg128#8.s[2]
# asm 2: smlal2 <vec_prod=v8.2d,<vec_uu1_rr1_vv1_ss1=v9.4s,<vec_V8_V9_S8_S9=v7.s[2]
smlal2 v8.2d,v9.4s,v7.s[2]

# qhasm: 2x vec_prod += final_add_1
# asm 1: add <vec_prod=reg128#9.2d, <vec_prod=reg128#9.2d, <final_add_1=reg128#2.2d
# asm 2: add <vec_prod=v8.2d, <vec_prod=v8.2d, <final_add_1=v1.2d
add v8.2d, v8.2d, v1.2d

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#2.16b, <vec_prod=reg128#9.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: and >vec_buffer=v1.16b, <vec_prod=v8.16b, <vec_2x_2p30m1=v0.16b
and v1.16b, v8.16b, v0.16b

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#2.2d, <vec_buffer=reg128#2.2d, #32
# asm 2: shl >vec_buffer=v1.2d, <vec_buffer=v1.2d, #32
shl v1.2d, v1.2d, #32

# qhasm: vec_V6_V7_S6_S7 |= vec_buffer
# asm 1: orr <vec_V6_V7_S6_S7=reg128#7.16b, <vec_V6_V7_S6_S7=reg128#7.16b, <vec_buffer=reg128#2.16b
# asm 2: orr <vec_V6_V7_S6_S7=v6.16b, <vec_V6_V7_S6_S7=v6.16b, <vec_buffer=v1.16b
orr v6.16b, v6.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#2.2d, <vec_prod=reg128#9.2d, #30
# asm 2: sshr >vec_prod=v1.2d, <vec_prod=v8.2d, #30
sshr v1.2d, v8.2d, #30

# qhasm: reg128 vec_2x_2p15m1

# qhasm: reg128 vec_2x_2p32m1

# qhasm: 2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
# asm 1: sshr <vec_2x_2p15m1=reg128#8.2d, <vec_2x_2p30m1=reg128#1.2d, #15
# asm 2: sshr <vec_2x_2p15m1=v7.2d, <vec_2x_2p30m1=v0.2d, #15
sshr v7.2d, v0.2d, #15

# qhasm: 2x vec_2x_2p32m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p32m1=reg128#9.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p32m1=v8.2d, #0xFFFFFFFF
movi v8.2d, #0xFFFFFFFF

# qhasm: reg128 vec_carry

# qhasm: 2x vec_carry = vec_prod >> 15
# asm 1: sshr <vec_carry=reg128#10.2d, <vec_prod=reg128#2.2d, #15
# asm 2: sshr <vec_carry=v9.2d, <vec_prod=v1.2d, #15
sshr v9.2d, v1.2d, #15

# qhasm: vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
# asm 1: and >vec_V8_V9_S8_S9=reg128#2.16b, <vec_prod=reg128#2.16b, <vec_2x_2p15m1=reg128#8.16b
# asm 2: and >vec_V8_V9_S8_S9=v1.16b, <vec_prod=v1.16b, <vec_2x_2p15m1=v7.16b
and v1.16b, v1.16b, v7.16b

# qhasm: 4x vec_buffer = vec_4x_19 * vec_carry
# asm 1: mul >vec_buffer=reg128#3.4s,<vec_4x_19=reg128#3.4s,<vec_carry=reg128#10.4s
# asm 2: mul >vec_buffer=v2.4s,<vec_4x_19=v2.4s,<vec_carry=v9.4s
mul v2.4s,v2.4s,v9.4s

# qhasm: vec_buffer &= vec_2x_2p32m1
# asm 1: and <vec_buffer=reg128#3.16b, <vec_buffer=reg128#3.16b, <vec_2x_2p32m1=reg128#9.16b
# asm 2: and <vec_buffer=v2.16b, <vec_buffer=v2.16b, <vec_2x_2p32m1=v8.16b
and v2.16b, v2.16b, v8.16b

# qhasm: 4x vec_V0_V1_S0_S1 += vec_buffer
# asm 1: add <vec_V0_V1_S0_S1=reg128#4.4s, <vec_V0_V1_S0_S1=reg128#4.4s, <vec_buffer=reg128#3.4s
# asm 2: add <vec_V0_V1_S0_S1=v3.4s, <vec_V0_V1_S0_S1=v3.4s, <vec_buffer=v2.4s
add v3.4s, v3.4s, v2.4s

# qhasm: reg128 vec_4x_2p30m1

# qhasm: 2x vec_4x_2p30m1 = vec_2x_2p30m1 << 32
# asm 1: shl >vec_4x_2p30m1=reg128#3.2d, <vec_2x_2p30m1=reg128#1.2d, #32
# asm 2: shl >vec_4x_2p30m1=v2.2d, <vec_2x_2p30m1=v0.2d, #32
shl v2.2d, v0.2d, #32

# qhasm: vec_4x_2p30m1 |= vec_2x_2p30m1
# asm 1: orr <vec_4x_2p30m1=reg128#3.16b, <vec_4x_2p30m1=reg128#3.16b, <vec_2x_2p30m1=reg128#1.16b
# asm 2: orr <vec_4x_2p30m1=v2.16b, <vec_4x_2p30m1=v2.16b, <vec_2x_2p30m1=v0.16b
orr v2.16b, v2.16b, v0.16b

# qhasm: 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# asm 1: sshr <vec_carry=reg128#10.4s, <vec_V0_V1_S0_S1=reg128#4.4s, #30
# asm 2: sshr <vec_carry=v9.4s, <vec_V0_V1_S0_S1=v3.4s, #30
sshr v9.4s, v3.4s, #30

# qhasm: 2x vec_carry = vec_carry << 32
# asm 1: shl >vec_carry=reg128#1.2d, <vec_carry=reg128#10.2d, #32
# asm 2: shl >vec_carry=v0.2d, <vec_carry=v9.2d, #32
shl v0.2d, v9.2d, #32

# qhasm: 4x vec_V0_V1_S0_S1 += vec_carry
# asm 1: add <vec_V0_V1_S0_S1=reg128#4.4s, <vec_V0_V1_S0_S1=reg128#4.4s, <vec_carry=reg128#1.4s
# asm 2: add <vec_V0_V1_S0_S1=v3.4s, <vec_V0_V1_S0_S1=v3.4s, <vec_carry=v0.4s
add v3.4s, v3.4s, v0.4s

# qhasm: 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# asm 1: sshr <vec_carry=reg128#1.4s, <vec_V0_V1_S0_S1=reg128#4.4s, #30
# asm 2: sshr <vec_carry=v0.4s, <vec_V0_V1_S0_S1=v3.4s, #30
sshr v0.4s, v3.4s, #30

# qhasm: 2x vec_carry = vec_carry unsigned>> 32
# asm 1: ushr >vec_carry=reg128#1.2d, <vec_carry=reg128#1.2d, #32
# asm 2: ushr >vec_carry=v0.2d, <vec_carry=v0.2d, #32
ushr v0.2d, v0.2d, #32

# qhasm: vec_V0_V1_S0_S1 &= vec_4x_2p30m1
# asm 1: and <vec_V0_V1_S0_S1=reg128#4.16b, <vec_V0_V1_S0_S1=reg128#4.16b, <vec_4x_2p30m1=reg128#3.16b
# asm 2: and <vec_V0_V1_S0_S1=v3.16b, <vec_V0_V1_S0_S1=v3.16b, <vec_4x_2p30m1=v2.16b
and v3.16b, v3.16b, v2.16b

# qhasm: 4x vec_V2_V3_S2_S3 += vec_carry
# asm 1: add <vec_V2_V3_S2_S3=reg128#5.4s, <vec_V2_V3_S2_S3=reg128#5.4s, <vec_carry=reg128#1.4s
# asm 2: add <vec_V2_V3_S2_S3=v4.4s, <vec_V2_V3_S2_S3=v4.4s, <vec_carry=v0.4s
add v4.4s, v4.4s, v0.4s

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
# asm 1: zip1 >vec_V4_V5_V6_V7=reg128#4.2d, <vec_V4_V5_S4_S5=reg128#6.2d, <vec_V6_V7_S6_S7=reg128#7.2d
# asm 2: zip1 >vec_V4_V5_V6_V7=v3.2d, <vec_V4_V5_S4_S5=v5.2d, <vec_V6_V7_S6_S7=v6.2d
zip1 v3.2d, v5.2d, v6.2d

# qhasm: 2x vec_S4_S5_S6_S7 zip= vec_V4_V5_S4_S5[1/2] vec_V6_V7_S6_S7[1/2]
# asm 1: zip2 >vec_S4_S5_S6_S7=reg128#5.2d, <vec_V4_V5_S4_S5=reg128#6.2d, <vec_V6_V7_S6_S7=reg128#7.2d
# asm 2: zip2 >vec_S4_S5_S6_S7=v4.2d, <vec_V4_V5_S4_S5=v5.2d, <vec_V6_V7_S6_S7=v6.2d
zip2 v4.2d, v5.2d, v6.2d

# qhasm: mem256[pointer_V] = vec_V0_V1_V2_V3, vec_V4_V5_V6_V7
# asm 1: stp <vec_V0_V1_V2_V3=reg128#1%qregname, <vec_V4_V5_V6_V7=reg128#4%qregname, [<pointer_V=int64#1]
# asm 2: stp <vec_V0_V1_V2_V3=q0, <vec_V4_V5_V6_V7=q3, [<pointer_V=x0]
stp q0, q3, [x0]

# qhasm: mem256[pointer_S] = vec_S0_S1_S2_S3, vec_S4_S5_S6_S7
# asm 1: stp <vec_S0_S1_S2_S3=reg128#3%qregname, <vec_S4_S5_S6_S7=reg128#5%qregname, [<pointer_S=int64#2]
# asm 2: stp <vec_S0_S1_S2_S3=q2, <vec_S4_S5_S6_S7=q4, [<pointer_S=x1]
stp q2, q4, [x1]

# qhasm: int64 V8

# qhasm: V8 = vec_V8_V9_S8_S9[0/2]
# asm 1: umov >V8=int64#3, <vec_V8_V9_S8_S9=reg128#2.d[0]
# asm 2: umov >V8=x2, <vec_V8_V9_S8_S9=v1.d[0]
umov x2, v1.d[0]

# qhasm: mem32[pointer_V+32] = V8
# asm 1: str <V8=int64#3%wregname, [<pointer_V=int64#1, #32]
# asm 2: str <V8=w2, [<pointer_V=x0, #32]
str w2, [x0, #32]

# qhasm: int64 S8

# qhasm: S8 = vec_V8_V9_S8_S9[1/2]
# asm 1: umov >S8=int64#1, <vec_V8_V9_S8_S9=reg128#2.d[1]
# asm 2: umov >S8=x0, <vec_V8_V9_S8_S9=v1.d[1]
umov x0, v1.d[1]

# qhasm: mem32[pointer_S+32] = S8
# asm 1: str <S8=int64#1%wregname, [<pointer_S=int64#2, #32]
# asm 2: str <S8=w0, [<pointer_S=x1, #32]
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

# qhasm: return
ret
