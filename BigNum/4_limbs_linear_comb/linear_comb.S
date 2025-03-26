
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

# qhasm: int64 pointerR

# qhasm: int64 pointerS

# qhasm: int64 pointerF

# qhasm: int64 pointerG

# qhasm: int64 pointeru

# qhasm: int64 pointerv

# qhasm: int64 pointerr

# qhasm: int64 pointers

# qhasm: input pointerR

# qhasm: input pointerS

# qhasm: input pointerF

# qhasm: input pointerG

# qhasm: input pointeru

# qhasm: input pointerv

# qhasm: input pointerr

# qhasm: input pointers

# qhasm: int64 u0u1

# qhasm: int64 u0

# qhasm: int64 u1

# qhasm: int64 v0v1

# qhasm: int64 v0

# qhasm: int64 v1

# qhasm: int64 r0r1

# qhasm: int64 r0

# qhasm: int64 r1

# qhasm: int64 s0s1

# qhasm: int64 s0

# qhasm: int64 s1

# qhasm: int64 F0F1

# qhasm: int64 F2F3

# qhasm: int64 G0G1

# qhasm: int64 G2G3

# qhasm: reg128 vec_F0_F1_G0_G1 

# qhasm: reg128 vec_F2_F3_G2_G3 

# qhasm: reg128 vec_u0_r0_v0_s0

# qhasm: int64 u0r0

# qhasm: int64 v0s0

# qhasm: reg128 vec_u1_r1_v1_s1

# qhasm: int64 u1r1

# qhasm: int64 v1s1

# qhasm: reg128 vec_tmp0

# qhasm: reg128 vec_MASK2p30m1

# qhasm: reg128 vec_MASK2p32m1

# qhasm: reg128 vec_R0_0_S0_0

# qhasm: reg128 vec_R1_0_S1_0

# qhasm: reg128 vec_R2_0_S2_0

# qhasm: reg128 vec_R3_0_S3_0

# qhasm: reg128 vec_R4_0_S4_0

# qhasm: reg128 vec_R5_0_S5_0

# qhasm: reg128 vec_R0_R1_S0_S1

# qhasm: reg128 vec_R2_R3_S2_S3

# qhasm: reg128 vec_R4_R5_S4_S5

# qhasm: int64 R0R1

# qhasm: int64 R2R3

# qhasm: int64 R4R5

# qhasm: int64 R0

# qhasm: int64 R1

# qhasm: int64 R2

# qhasm: int64 R3

# qhasm: int64 R4

# qhasm: int64 R5

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 S4S5

# qhasm: int64 S0

# qhasm: int64 S1

# qhasm: int64 S2

# qhasm: int64 S3

# qhasm: int64 S4

# qhasm: int64 S5

# qhasm: int64 carry1

# qhasm: reg128 vec_MASKcarry1

# qhasm: reg128 vec_MASKcarry2

# qhasm: reg128 vec_MASKcarry

# qhasm: reg128 vec_MASKeffect

# qhasm: reg128 vec_F0_F1_F0_F1

# qhasm: reg128 vec_F2_F3_F2_F3

# qhasm: reg128 vec_G0_G1_G0_G1

# qhasm: reg128 vec_G2_G3_G2_G3

# qhasm: reg128 vec_uhat_rhat_vhat_shat

# qhasm: reg128 vec_uhat_rhat

# qhasm: reg128 vec_vhat_shat

# qhasm: reg128 vec_tmp1

# qhasm: reg128 vec_tmp2

# qhasm: reg128 vec_carry1

# qhasm: reg128 vec_carry2

# qhasm: int64 debug0

# qhasm: int64 debug1

# qhasm: int64 debug2

# qhasm: int64 debug3

# qhasm: enter linear_comb
.align 4
.global _linear_comb
.global linear_comb
_linear_comb:
linear_comb:

# qhasm: u0u1 = mem64[pointeru]
# asm 1: ldr >u0u1=int64#5,[<pointeru=int64#5]
# asm 2: ldr >u0u1=x4,[<pointeru=x4]
ldr x4,[x4]

# qhasm: u0 = u0u1 & ((1 << 30)-1)
# asm 1: ubfx >u0=int64#9,<u0u1=int64#5, #0, #30
# asm 2: ubfx >u0=x8,<u0u1=x4, #0, #30
ubfx x8,x4, #0, #30

# qhasm: u1 = (u0u1 >> 30) & ((1 << 32)-1)
# asm 1: ubfx >u1=int64#5,<u0u1=int64#5, #30, #32
# asm 2: ubfx >u1=x4,<u0u1=x4, #30, #32
ubfx x4,x4, #30, #32

# qhasm: v0v1 = mem64[pointerv]
# asm 1: ldr >v0v1=int64#6,[<pointerv=int64#6]
# asm 2: ldr >v0v1=x5,[<pointerv=x5]
ldr x5,[x5]

# qhasm: v0 = v0v1 & ((1 << 30)-1)
# asm 1: ubfx >v0=int64#10,<v0v1=int64#6, #0, #30
# asm 2: ubfx >v0=x9,<v0v1=x5, #0, #30
ubfx x9,x5, #0, #30

# qhasm: v1 = (v0v1 >> 30) & ((1 << 32)-1)
# asm 1: ubfx >v1=int64#6,<v0v1=int64#6, #30, #32
# asm 2: ubfx >v1=x5,<v0v1=x5, #30, #32
ubfx x5,x5, #30, #32

# qhasm: r0r1 = mem64[pointerr]
# asm 1: ldr >r0r1=int64#7,[<pointerr=int64#7]
# asm 2: ldr >r0r1=x6,[<pointerr=x6]
ldr x6,[x6]

# qhasm: r0 = r0r1 & ((1 << 30)-1)
# asm 1: ubfx >r0=int64#11,<r0r1=int64#7, #0, #30
# asm 2: ubfx >r0=x10,<r0r1=x6, #0, #30
ubfx x10,x6, #0, #30

# qhasm: r1 = (r0r1 >> 30) & ((1 << 32)-1)
# asm 1: ubfx >r1=int64#7,<r0r1=int64#7, #30, #32
# asm 2: ubfx >r1=x6,<r0r1=x6, #30, #32
ubfx x6,x6, #30, #32

# qhasm: s0s1 = mem64[pointers]
# asm 1: ldr >s0s1=int64#8,[<pointers=int64#8]
# asm 2: ldr >s0s1=x7,[<pointers=x7]
ldr x7,[x7]

# qhasm: s0 = s0s1 & ((1 << 30)-1)
# asm 1: ubfx >s0=int64#12,<s0s1=int64#8, #0, #30
# asm 2: ubfx >s0=x11,<s0s1=x7, #0, #30
ubfx x11,x7, #0, #30

# qhasm: s1 = (s0s1 >> 30) & ((1 << 32)-1)
# asm 1: ubfx >s1=int64#8,<s0s1=int64#8, #30, #32
# asm 2: ubfx >s1=x7,<s0s1=x7, #30, #32
ubfx x7,x7, #30, #32

# qhasm: F0F1, F2F3 = mem128[pointerF]
# asm 1: ldp >F0F1=int64#3, >F2F3=int64#13, [<pointerF=int64#3]
# asm 2: ldp >F0F1=x2, >F2F3=x12, [<pointerF=x2]
ldp x2, x12, [x2]

# qhasm: G0G1, G2G3 = mem128[pointerG]
# asm 1: ldp >G0G1=int64#4, >G2G3=int64#14, [<pointerG=int64#4]
# asm 2: ldp >G0G1=x3, >G2G3=x13, [<pointerG=x3]
ldp x3, x13, [x3]

# qhasm: vec_F0_F1_G0_G1[0/2] = F0F1 
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.d[0],<F0F1=int64#3
# asm 2: ins <vec_F0_F1_G0_G1=v0.d[0],<F0F1=x2
ins v0.d[0],x2

# qhasm: vec_F0_F1_G0_G1[1/2] = G0G1 
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.d[1],<G0G1=int64#4
# asm 2: ins <vec_F0_F1_G0_G1=v0.d[1],<G0G1=x3
ins v0.d[1],x3

# qhasm: vec_F2_F3_G2_G3[0/2] = F2F3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#2.d[0],<F2F3=int64#13
# asm 2: ins <vec_F2_F3_G2_G3=v1.d[0],<F2F3=x12
ins v1.d[0],x12

# qhasm: vec_F2_F3_G2_G3[1/2] = G2G3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#2.d[1],<G2G3=int64#14
# asm 2: ins <vec_F2_F3_G2_G3=v1.d[1],<G2G3=x13
ins v1.d[1],x13

# qhasm: r0 = r0 << 32
# asm 1: lsl >r0=int64#3,<r0=int64#11,#32
# asm 2: lsl >r0=x2,<r0=x10,#32
lsl x2,x10,#32

# qhasm: u0r0 = u0 | r0
# asm 1: orr >u0r0=int64#3, <u0=int64#9, <r0=int64#3
# asm 2: orr >u0r0=x2, <u0=x8, <r0=x2
orr x2, x8, x2

# qhasm: vec_u0_r0_v0_s0[0/2] = u0r0
# asm 1: ins <vec_u0_r0_v0_s0=reg128#3.d[0],<u0r0=int64#3
# asm 2: ins <vec_u0_r0_v0_s0=v2.d[0],<u0r0=x2
ins v2.d[0],x2

# qhasm: s0 = s0 << 32
# asm 1: lsl >s0=int64#3,<s0=int64#12,#32
# asm 2: lsl >s0=x2,<s0=x11,#32
lsl x2,x11,#32

# qhasm: v0s0 = v0 | s0
# asm 1: orr >v0s0=int64#3, <v0=int64#10, <s0=int64#3
# asm 2: orr >v0s0=x2, <v0=x9, <s0=x2
orr x2, x9, x2

# qhasm: vec_u0_r0_v0_s0[1/2] = v0s0
# asm 1: ins <vec_u0_r0_v0_s0=reg128#3.d[1],<v0s0=int64#3
# asm 2: ins <vec_u0_r0_v0_s0=v2.d[1],<v0s0=x2
ins v2.d[1],x2

# qhasm: r1 = r1 << 32
# asm 1: lsl >r1=int64#3,<r1=int64#7,#32
# asm 2: lsl >r1=x2,<r1=x6,#32
lsl x2,x6,#32

# qhasm: u1r1 = u1 | r1
# asm 1: orr >u1r1=int64#3, <u1=int64#5, <r1=int64#3
# asm 2: orr >u1r1=x2, <u1=x4, <r1=x2
orr x2, x4, x2

# qhasm: vec_u1_r1_v1_s1[0/2] = u1r1
# asm 1: ins <vec_u1_r1_v1_s1=reg128#4.d[0],<u1r1=int64#3
# asm 2: ins <vec_u1_r1_v1_s1=v3.d[0],<u1r1=x2
ins v3.d[0],x2

# qhasm: s1 = s1 << 32
# asm 1: lsl >s1=int64#3,<s1=int64#8,#32
# asm 2: lsl >s1=x2,<s1=x7,#32
lsl x2,x7,#32

# qhasm: v1s1 = v1 | s1
# asm 1: orr >v1s1=int64#3, <v1=int64#6, <s1=int64#3
# asm 2: orr >v1s1=x2, <v1=x5, <s1=x2
orr x2, x5, x2

# qhasm: vec_u1_r1_v1_s1[1/2] = v1s1
# asm 1: ins <vec_u1_r1_v1_s1=reg128#4.d[1],<v1s1=int64#3
# asm 2: ins <vec_u1_r1_v1_s1=v3.d[1],<v1s1=x2
ins v3.d[1],x2

# qhasm: vec_tmp0 = vec_tmp0 ^ vec_tmp0
# asm 1: eor >vec_tmp0=reg128#5.16b,<vec_tmp0=reg128#5.16b,<vec_tmp0=reg128#5.16b
# asm 2: eor >vec_tmp0=v4.16b,<vec_tmp0=v4.16b,<vec_tmp0=v4.16b
eor v4.16b,v4.16b,v4.16b

# qhasm: 2x vec_MASK2p32m1 = 0xFFFFFFFF
# asm 1: movi >vec_MASK2p32m1=reg128#6.2d, #0xFFFFFFFF
# asm 2: movi >vec_MASK2p32m1=v5.2d, #0xFFFFFFFF
movi v5.2d, #0xFFFFFFFF

# qhasm: 2x vec_MASK2p30m1 = vec_MASK2p32m1 unsigned>> 2
# asm 1: ushr >vec_MASK2p30m1=reg128#7.2d,<vec_MASK2p32m1=reg128#6.2d,#2
# asm 2: ushr >vec_MASK2p30m1=v6.2d,<vec_MASK2p32m1=v5.2d,#2
ushr v6.2d,v5.2d,#2

# qhasm: 2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F0_F1_G0_G1[0/4]
# asm 1: umlal <vec_tmp0=reg128#5.2d,<vec_u0_r0_v0_s0=reg128#3.2s,<vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: umlal <vec_tmp0=v4.2d,<vec_u0_r0_v0_s0=v2.2s,<vec_F0_F1_G0_G1=v0.s[0]
umlal v4.2d,v2.2s,v0.s[0]

# qhasm: 2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F0_F1_G0_G1[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#5.2d,<vec_u0_r0_v0_s0=reg128#3.4s,<vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: umlal2 <vec_tmp0=v4.2d,<vec_u0_r0_v0_s0=v2.4s,<vec_F0_F1_G0_G1=v0.s[2]
umlal2 v4.2d,v2.4s,v0.s[2]

# qhasm: vec_R0_0_S0_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R0_0_S0_0=reg128#8.16b,<vec_tmp0=reg128#5.16b,<vec_MASK2p30m1=reg128#7.16b
# asm 2: and >vec_R0_0_S0_0=v7.16b,<vec_tmp0=v4.16b,<vec_MASK2p30m1=v6.16b
and v7.16b,v4.16b,v6.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30 
# asm 1: ushr >vec_tmp0=reg128#5.2d,<vec_tmp0=reg128#5.2d,#30
# asm 2: ushr >vec_tmp0=v4.2d,<vec_tmp0=v4.2d,#30
ushr v4.2d,v4.2d,#30

# qhasm: 2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F0_F1_G0_G1[1/4]
# asm 1: umlal <vec_tmp0=reg128#5.2d,<vec_u0_r0_v0_s0=reg128#3.2s,<vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: umlal <vec_tmp0=v4.2d,<vec_u0_r0_v0_s0=v2.2s,<vec_F0_F1_G0_G1=v0.s[1]
umlal v4.2d,v2.2s,v0.s[1]

# qhasm: 2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F0_F1_G0_G1[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#5.2d,<vec_u0_r0_v0_s0=reg128#3.4s,<vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: umlal2 <vec_tmp0=v4.2d,<vec_u0_r0_v0_s0=v2.4s,<vec_F0_F1_G0_G1=v0.s[3]
umlal2 v4.2d,v2.4s,v0.s[3]

# qhasm: 2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F0_F1_G0_G1[0/4]
# asm 1: umlal <vec_tmp0=reg128#5.2d,<vec_u1_r1_v1_s1=reg128#4.2s,<vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: umlal <vec_tmp0=v4.2d,<vec_u1_r1_v1_s1=v3.2s,<vec_F0_F1_G0_G1=v0.s[0]
umlal v4.2d,v3.2s,v0.s[0]

# qhasm: 2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F0_F1_G0_G1[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#5.2d,<vec_u1_r1_v1_s1=reg128#4.4s,<vec_F0_F1_G0_G1=reg128#1.s[2]
# asm 2: umlal2 <vec_tmp0=v4.2d,<vec_u1_r1_v1_s1=v3.4s,<vec_F0_F1_G0_G1=v0.s[2]
umlal2 v4.2d,v3.4s,v0.s[2]

# qhasm: vec_R1_0_S1_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R1_0_S1_0=reg128#9.16b,<vec_tmp0=reg128#5.16b,<vec_MASK2p30m1=reg128#7.16b
# asm 2: and >vec_R1_0_S1_0=v8.16b,<vec_tmp0=v4.16b,<vec_MASK2p30m1=v6.16b
and v8.16b,v4.16b,v6.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30 
# asm 1: ushr >vec_tmp0=reg128#5.2d,<vec_tmp0=reg128#5.2d,#30
# asm 2: ushr >vec_tmp0=v4.2d,<vec_tmp0=v4.2d,#30
ushr v4.2d,v4.2d,#30

# qhasm: 2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F2_F3_G2_G3[0/4]
# asm 1: umlal <vec_tmp0=reg128#5.2d,<vec_u0_r0_v0_s0=reg128#3.2s,<vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: umlal <vec_tmp0=v4.2d,<vec_u0_r0_v0_s0=v2.2s,<vec_F2_F3_G2_G3=v1.s[0]
umlal v4.2d,v2.2s,v1.s[0]

# qhasm: 2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F2_F3_G2_G3[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#5.2d,<vec_u0_r0_v0_s0=reg128#3.4s,<vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: umlal2 <vec_tmp0=v4.2d,<vec_u0_r0_v0_s0=v2.4s,<vec_F2_F3_G2_G3=v1.s[2]
umlal2 v4.2d,v2.4s,v1.s[2]

# qhasm: 2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F0_F1_G0_G1[1/4]
# asm 1: umlal <vec_tmp0=reg128#5.2d,<vec_u1_r1_v1_s1=reg128#4.2s,<vec_F0_F1_G0_G1=reg128#1.s[1]
# asm 2: umlal <vec_tmp0=v4.2d,<vec_u1_r1_v1_s1=v3.2s,<vec_F0_F1_G0_G1=v0.s[1]
umlal v4.2d,v3.2s,v0.s[1]

# qhasm: 2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F0_F1_G0_G1[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#5.2d,<vec_u1_r1_v1_s1=reg128#4.4s,<vec_F0_F1_G0_G1=reg128#1.s[3]
# asm 2: umlal2 <vec_tmp0=v4.2d,<vec_u1_r1_v1_s1=v3.4s,<vec_F0_F1_G0_G1=v0.s[3]
umlal2 v4.2d,v3.4s,v0.s[3]

# qhasm: vec_R2_0_S2_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R2_0_S2_0=reg128#10.16b,<vec_tmp0=reg128#5.16b,<vec_MASK2p30m1=reg128#7.16b
# asm 2: and >vec_R2_0_S2_0=v9.16b,<vec_tmp0=v4.16b,<vec_MASK2p30m1=v6.16b
and v9.16b,v4.16b,v6.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30 
# asm 1: ushr >vec_tmp0=reg128#5.2d,<vec_tmp0=reg128#5.2d,#30
# asm 2: ushr >vec_tmp0=v4.2d,<vec_tmp0=v4.2d,#30
ushr v4.2d,v4.2d,#30

# qhasm: 2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F2_F3_G2_G3[1/4]
# asm 1: umlal <vec_tmp0=reg128#5.2d,<vec_u0_r0_v0_s0=reg128#3.2s,<vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: umlal <vec_tmp0=v4.2d,<vec_u0_r0_v0_s0=v2.2s,<vec_F2_F3_G2_G3=v1.s[1]
umlal v4.2d,v2.2s,v1.s[1]

# qhasm: 2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F2_F3_G2_G3[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#5.2d,<vec_u0_r0_v0_s0=reg128#3.4s,<vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: umlal2 <vec_tmp0=v4.2d,<vec_u0_r0_v0_s0=v2.4s,<vec_F2_F3_G2_G3=v1.s[3]
umlal2 v4.2d,v2.4s,v1.s[3]

# qhasm: 2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F2_F3_G2_G3[0/4]
# asm 1: umlal <vec_tmp0=reg128#5.2d,<vec_u1_r1_v1_s1=reg128#4.2s,<vec_F2_F3_G2_G3=reg128#2.s[0]
# asm 2: umlal <vec_tmp0=v4.2d,<vec_u1_r1_v1_s1=v3.2s,<vec_F2_F3_G2_G3=v1.s[0]
umlal v4.2d,v3.2s,v1.s[0]

# qhasm: 2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F2_F3_G2_G3[2/4]
# asm 1: umlal2 <vec_tmp0=reg128#5.2d,<vec_u1_r1_v1_s1=reg128#4.4s,<vec_F2_F3_G2_G3=reg128#2.s[2]
# asm 2: umlal2 <vec_tmp0=v4.2d,<vec_u1_r1_v1_s1=v3.4s,<vec_F2_F3_G2_G3=v1.s[2]
umlal2 v4.2d,v3.4s,v1.s[2]

# qhasm: vec_R3_0_S3_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R3_0_S3_0=reg128#3.16b,<vec_tmp0=reg128#5.16b,<vec_MASK2p30m1=reg128#7.16b
# asm 2: and >vec_R3_0_S3_0=v2.16b,<vec_tmp0=v4.16b,<vec_MASK2p30m1=v6.16b
and v2.16b,v4.16b,v6.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30 
# asm 1: ushr >vec_tmp0=reg128#5.2d,<vec_tmp0=reg128#5.2d,#30
# asm 2: ushr >vec_tmp0=v4.2d,<vec_tmp0=v4.2d,#30
ushr v4.2d,v4.2d,#30

# qhasm: 2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F2_F3_G2_G3[1/4]
# asm 1: umlal <vec_tmp0=reg128#5.2d,<vec_u1_r1_v1_s1=reg128#4.2s,<vec_F2_F3_G2_G3=reg128#2.s[1]
# asm 2: umlal <vec_tmp0=v4.2d,<vec_u1_r1_v1_s1=v3.2s,<vec_F2_F3_G2_G3=v1.s[1]
umlal v4.2d,v3.2s,v1.s[1]

# qhasm: 2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F2_F3_G2_G3[3/4]
# asm 1: umlal2 <vec_tmp0=reg128#5.2d,<vec_u1_r1_v1_s1=reg128#4.4s,<vec_F2_F3_G2_G3=reg128#2.s[3]
# asm 2: umlal2 <vec_tmp0=v4.2d,<vec_u1_r1_v1_s1=v3.4s,<vec_F2_F3_G2_G3=v1.s[3]
umlal2 v4.2d,v3.4s,v1.s[3]

# qhasm: vec_R4_0_S4_0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R4_0_S4_0=reg128#7.16b,<vec_tmp0=reg128#5.16b,<vec_MASK2p30m1=reg128#7.16b
# asm 2: and >vec_R4_0_S4_0=v6.16b,<vec_tmp0=v4.16b,<vec_MASK2p30m1=v6.16b
and v6.16b,v4.16b,v6.16b

# qhasm: 2x vec_tmp0 unsigned>>= 30 
# asm 1: ushr >vec_tmp0=reg128#5.2d,<vec_tmp0=reg128#5.2d,#30
# asm 2: ushr >vec_tmp0=v4.2d,<vec_tmp0=v4.2d,#30
ushr v4.2d,v4.2d,#30

# qhasm: vec_R5_0_S5_0 = vec_tmp0 & vec_MASK2p32m1
# asm 1: and >vec_R5_0_S5_0=reg128#5.16b,<vec_tmp0=reg128#5.16b,<vec_MASK2p32m1=reg128#6.16b
# asm 2: and >vec_R5_0_S5_0=v4.16b,<vec_tmp0=v4.16b,<vec_MASK2p32m1=v5.16b
and v4.16b,v4.16b,v5.16b

# qhasm: 2x vec_R1_0_S1_0 <<= 32
# asm 1: shl >vec_R1_0_S1_0=reg128#6.2d,<vec_R1_0_S1_0=reg128#9.2d,#32
# asm 2: shl >vec_R1_0_S1_0=v5.2d,<vec_R1_0_S1_0=v8.2d,#32
shl v5.2d,v8.2d,#32

# qhasm: vec_R0_R1_S0_S1 = vec_R0_0_S0_0 | vec_R1_0_S1_0
# asm 1: orr >vec_R0_R1_S0_S1=reg128#6.16b,<vec_R0_0_S0_0=reg128#8.16b,<vec_R1_0_S1_0=reg128#6.16b
# asm 2: orr >vec_R0_R1_S0_S1=v5.16b,<vec_R0_0_S0_0=v7.16b,<vec_R1_0_S1_0=v5.16b
orr v5.16b,v7.16b,v5.16b

# qhasm: 2x vec_R3_0_S3_0 <<= 32
# asm 1: shl >vec_R3_0_S3_0=reg128#3.2d,<vec_R3_0_S3_0=reg128#3.2d,#32
# asm 2: shl >vec_R3_0_S3_0=v2.2d,<vec_R3_0_S3_0=v2.2d,#32
shl v2.2d,v2.2d,#32

# qhasm: vec_R2_R3_S2_S3 = vec_R2_0_S2_0 | vec_R3_0_S3_0
# asm 1: orr >vec_R2_R3_S2_S3=reg128#3.16b,<vec_R2_0_S2_0=reg128#10.16b,<vec_R3_0_S3_0=reg128#3.16b
# asm 2: orr >vec_R2_R3_S2_S3=v2.16b,<vec_R2_0_S2_0=v9.16b,<vec_R3_0_S3_0=v2.16b
orr v2.16b,v9.16b,v2.16b

# qhasm: 2x vec_R5_0_S5_0 <<= 32
# asm 1: shl >vec_R5_0_S5_0=reg128#5.2d,<vec_R5_0_S5_0=reg128#5.2d,#32
# asm 2: shl >vec_R5_0_S5_0=v4.2d,<vec_R5_0_S5_0=v4.2d,#32
shl v4.2d,v4.2d,#32

# qhasm: vec_R4_R5_S4_S5 = vec_R4_0_S4_0 | vec_R5_0_S5_0
# asm 1: orr >vec_R4_R5_S4_S5=reg128#5.16b,<vec_R4_0_S4_0=reg128#7.16b,<vec_R5_0_S5_0=reg128#5.16b
# asm 2: orr >vec_R4_R5_S4_S5=v4.16b,<vec_R4_0_S4_0=v6.16b,<vec_R5_0_S5_0=v4.16b
orr v4.16b,v6.16b,v4.16b

# qhasm: carry1 = 3221225472
# asm 1: mov >carry1=int64#3, #3221225472
# asm 2: mov >carry1=x2, #3221225472
mov x2, #3221225472

# qhasm: 2x vec_MASKcarry1 = carry1
# asm 1: dup <vec_MASKcarry1=reg128#7.2d,<carry1=int64#3
# asm 2: dup <vec_MASKcarry1=v6.2d,<carry1=x2
dup v6.2d,x2

# qhasm: 2x vec_MASKcarry2 = vec_MASKcarry1 << 32
# asm 1: shl >vec_MASKcarry2=reg128#8.2d,<vec_MASKcarry1=reg128#7.2d,#32
# asm 2: shl >vec_MASKcarry2=v7.2d,<vec_MASKcarry1=v6.2d,#32
shl v7.2d,v6.2d,#32

# qhasm: vec_MASKcarry = vec_MASKcarry1 | vec_MASKcarry2
# asm 1: orr >vec_MASKcarry=reg128#9.16b,<vec_MASKcarry1=reg128#7.16b,<vec_MASKcarry2=reg128#8.16b
# asm 2: orr >vec_MASKcarry=v8.16b,<vec_MASKcarry1=v6.16b,<vec_MASKcarry2=v7.16b
orr v8.16b,v6.16b,v7.16b

# qhasm: vec_MASKeffect = ~vec_MASKcarry
# asm 1: mvn  >vec_MASKeffect=reg128#10.16b,<vec_MASKcarry=reg128#9.16b
# asm 2: mvn  >vec_MASKeffect=v9.16b,<vec_MASKcarry=v8.16b
mvn  v9.16b,v8.16b

# qhasm: 4x vec_uhat_rhat_vhat_shat = vec_u1_r1_v1_s1 >> 31
# asm 1: sshr >vec_uhat_rhat_vhat_shat=reg128#4.4s,<vec_u1_r1_v1_s1=reg128#4.4s,#31
# asm 2: sshr >vec_uhat_rhat_vhat_shat=v3.4s,<vec_u1_r1_v1_s1=v3.4s,#31
sshr v3.4s,v3.4s,#31

# qhasm: 4x vec_uhat_rhat = vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[1/4] vec_uhat_rhat_vhat_shat[1/4]
# asm 1: zip1 >vec_uhat_rhat=reg128#11.4s,<vec_uhat_rhat_vhat_shat=reg128#4.4s,<vec_uhat_rhat_vhat_shat=reg128#4.4s
# asm 2: zip1 >vec_uhat_rhat=v10.4s,<vec_uhat_rhat_vhat_shat=v3.4s,<vec_uhat_rhat_vhat_shat=v3.4s
zip1 v10.4s,v3.4s,v3.4s

# qhasm: 4x vec_vhat_shat = vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[3/4] vec_uhat_rhat_vhat_shat[3/4]
# asm 1: zip2 >vec_vhat_shat=reg128#4.4s,<vec_uhat_rhat_vhat_shat=reg128#4.4s,<vec_uhat_rhat_vhat_shat=reg128#4.4s
# asm 2: zip2 >vec_vhat_shat=v3.4s,<vec_uhat_rhat_vhat_shat=v3.4s,<vec_uhat_rhat_vhat_shat=v3.4s
zip2 v3.4s,v3.4s,v3.4s

# qhasm: 2x vec_F0_F1_F0_F1 = vec_F0_F1_G0_G1[0/2]
# asm 1: dup <vec_F0_F1_F0_F1=reg128#12.2d,<vec_F0_F1_G0_G1=reg128#1.d[0]
# asm 2: dup <vec_F0_F1_F0_F1=v11.2d,<vec_F0_F1_G0_G1=v0.d[0]
dup v11.2d,v0.d[0]

# qhasm: 2x vec_G0_G1_G0_G1 = vec_F0_F1_G0_G1[1/2]
# asm 1: dup <vec_G0_G1_G0_G1=reg128#13.2d,<vec_F0_F1_G0_G1=reg128#1.d[1]
# asm 2: dup <vec_G0_G1_G0_G1=v12.2d,<vec_F0_F1_G0_G1=v0.d[1]
dup v12.2d,v0.d[1]

# qhasm: 2x vec_F2_F3_F2_F3 = vec_F2_F3_G2_G3[0/2]
# asm 1: dup <vec_F2_F3_F2_F3=reg128#1.2d,<vec_F2_F3_G2_G3=reg128#2.d[0]
# asm 2: dup <vec_F2_F3_F2_F3=v0.2d,<vec_F2_F3_G2_G3=v1.d[0]
dup v0.2d,v1.d[0]

# qhasm: 2x vec_G2_G3_G2_G3 = vec_F2_F3_G2_G3[1/2]
# asm 1: dup <vec_G2_G3_G2_G3=reg128#14.2d,<vec_F2_F3_G2_G3=reg128#2.d[1]
# asm 2: dup <vec_G2_G3_G2_G3=v13.2d,<vec_F2_F3_G2_G3=v1.d[1]
dup v13.2d,v1.d[1]

# qhasm: vec_tmp1 = vec_uhat_rhat & vec_F0_F1_F0_F1
# asm 1: and >vec_tmp1=reg128#2.16b,<vec_uhat_rhat=reg128#11.16b,<vec_F0_F1_F0_F1=reg128#12.16b
# asm 2: and >vec_tmp1=v1.16b,<vec_uhat_rhat=v10.16b,<vec_F0_F1_F0_F1=v11.16b
and v1.16b,v10.16b,v11.16b

# qhasm: vec_tmp1 = vec_tmp1 ^ vec_MASKcarry
# asm 1: eor >vec_tmp1=reg128#2.16b,<vec_tmp1=reg128#2.16b,<vec_MASKcarry=reg128#9.16b
# asm 2: eor >vec_tmp1=v1.16b,<vec_tmp1=v1.16b,<vec_MASKcarry=v8.16b
eor v1.16b,v1.16b,v8.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: mvn  >vec_tmp1=reg128#2.16b,<vec_tmp1=reg128#2.16b
# asm 2: mvn  >vec_tmp1=v1.16b,<vec_tmp1=v1.16b
mvn  v1.16b,v1.16b

# qhasm: vec_tmp2 = vec_uhat_rhat & vec_F2_F3_F2_F3
# asm 1: and >vec_tmp2=reg128#1.16b,<vec_uhat_rhat=reg128#11.16b,<vec_F2_F3_F2_F3=reg128#1.16b
# asm 2: and >vec_tmp2=v0.16b,<vec_uhat_rhat=v10.16b,<vec_F2_F3_F2_F3=v0.16b
and v0.16b,v10.16b,v0.16b

# qhasm: vec_tmp2 = vec_tmp2 ^ vec_MASKcarry1
# asm 1: eor >vec_tmp2=reg128#1.16b,<vec_tmp2=reg128#1.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: eor >vec_tmp2=v0.16b,<vec_tmp2=v0.16b,<vec_MASKcarry1=v6.16b
eor v0.16b,v0.16b,v6.16b

# qhasm: vec_tmp2 = ~vec_tmp2
# asm 1: mvn  >vec_tmp2=reg128#1.16b,<vec_tmp2=reg128#1.16b
# asm 2: mvn  >vec_tmp2=v0.16b,<vec_tmp2=v0.16b
mvn  v0.16b,v0.16b

# qhasm: 2x vec_uhat_rhat unsigned>>= 63
# asm 1: ushr >vec_uhat_rhat=reg128#11.2d,<vec_uhat_rhat=reg128#11.2d,#63
# asm 2: ushr >vec_uhat_rhat=v10.2d,<vec_uhat_rhat=v10.2d,#63
ushr v10.2d,v10.2d,#63

# qhasm: 2x vec_tmp1 = vec_tmp1 + vec_uhat_rhat
# asm 1: add >vec_tmp1=reg128#2.2d,<vec_tmp1=reg128#2.2d,<vec_uhat_rhat=reg128#11.2d
# asm 2: add >vec_tmp1=v1.2d,<vec_tmp1=v1.2d,<vec_uhat_rhat=v10.2d
add v1.2d,v1.2d,v10.2d

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#2.2d,<vec_tmp1=reg128#2.2d,#2
# asm 2: shl >vec_tmp1=v1.2d,<vec_tmp1=v1.2d,#2
shl v1.2d,v1.2d,#2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#11.16b,<vec_tmp1=reg128#2.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: and >vec_carry1=v10.16b,<vec_tmp1=v1.16b,<vec_MASKcarry1=v6.16b
and v10.16b,v1.16b,v6.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#2.16b,<vec_tmp1=reg128#2.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: bic >vec_tmp1=v1.16b,<vec_tmp1=v1.16b,<vec_MASKcarry1=v6.16b
bic v1.16b,v1.16b,v6.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#11.2d,<vec_carry1=reg128#11.2d,#2
# asm 2: shl >vec_carry1=v10.2d,<vec_carry1=v10.2d,#2
shl v10.2d,v10.2d,#2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr >vec_tmp1=reg128#2.16b,<vec_tmp1=reg128#2.16b,<vec_carry1=reg128#11.16b
# asm 2: orr >vec_tmp1=v1.16b,<vec_tmp1=v1.16b,<vec_carry1=v10.16b
orr v1.16b,v1.16b,v10.16b

# qhasm: vec_carry2 = vec_tmp1 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#11.16b,<vec_tmp1=reg128#2.16b,<vec_MASKcarry2=reg128#8.16b
# asm 2: and >vec_carry2=v10.16b,<vec_tmp1=v1.16b,<vec_MASKcarry2=v7.16b
and v10.16b,v1.16b,v7.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp1=reg128#2.16b,<vec_tmp1=reg128#2.16b,<vec_MASKcarry2=reg128#8.16b
# asm 2: bic >vec_tmp1=v1.16b,<vec_tmp1=v1.16b,<vec_MASKcarry2=v7.16b
bic v1.16b,v1.16b,v7.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#11.2d,<vec_carry2=reg128#11.2d,#62
# asm 2: ushr >vec_carry2=v10.2d,<vec_carry2=v10.2d,#62
ushr v10.2d,v10.2d,#62

# qhasm: 2x vec_tmp2 <<= 2
# asm 1: shl >vec_tmp2=reg128#1.2d,<vec_tmp2=reg128#1.2d,#2
# asm 2: shl >vec_tmp2=v0.2d,<vec_tmp2=v0.2d,#2
shl v0.2d,v0.2d,#2

# qhasm: vec_tmp2 |= vec_carry2
# asm 1: orr >vec_tmp2=reg128#1.16b,<vec_tmp2=reg128#1.16b,<vec_carry2=reg128#11.16b
# asm 2: orr >vec_tmp2=v0.16b,<vec_tmp2=v0.16b,<vec_carry2=v10.16b
orr v0.16b,v0.16b,v10.16b

# qhasm: vec_carry1 = vec_tmp2 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#11.16b,<vec_tmp2=reg128#1.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: and >vec_carry1=v10.16b,<vec_tmp2=v0.16b,<vec_MASKcarry1=v6.16b
and v10.16b,v0.16b,v6.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp2=reg128#1.16b,<vec_tmp2=reg128#1.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: bic >vec_tmp2=v0.16b,<vec_tmp2=v0.16b,<vec_MASKcarry1=v6.16b
bic v0.16b,v0.16b,v6.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#11.2d,<vec_carry1=reg128#11.2d,#2
# asm 2: shl >vec_carry1=v10.2d,<vec_carry1=v10.2d,#2
shl v10.2d,v10.2d,#2

# qhasm: vec_tmp2 |= vec_carry1
# asm 1: orr >vec_tmp2=reg128#1.16b,<vec_tmp2=reg128#1.16b,<vec_carry1=reg128#11.16b
# asm 2: orr >vec_tmp2=v0.16b,<vec_tmp2=v0.16b,<vec_carry1=v10.16b
orr v0.16b,v0.16b,v10.16b

# qhasm: 2x vec_R2_R3_S2_S3 += vec_tmp1
# asm 1: add <vec_R2_R3_S2_S3=reg128#3.2d,<vec_R2_R3_S2_S3=reg128#3.2d,<vec_tmp1=reg128#2.2d
# asm 2: add <vec_R2_R3_S2_S3=v2.2d,<vec_R2_R3_S2_S3=v2.2d,<vec_tmp1=v1.2d
add v2.2d,v2.2d,v1.2d

# qhasm: 2x vec_R4_R5_S4_S5 += vec_tmp2
# asm 1: add <vec_R4_R5_S4_S5=reg128#5.2d,<vec_R4_R5_S4_S5=reg128#5.2d,<vec_tmp2=reg128#1.2d
# asm 2: add <vec_R4_R5_S4_S5=v4.2d,<vec_R4_R5_S4_S5=v4.2d,<vec_tmp2=v0.2d
add v4.2d,v4.2d,v0.2d

# qhasm: vec_tmp1 = vec_vhat_shat & vec_G0_G1_G0_G1
# asm 1: and >vec_tmp1=reg128#1.16b,<vec_vhat_shat=reg128#4.16b,<vec_G0_G1_G0_G1=reg128#13.16b
# asm 2: and >vec_tmp1=v0.16b,<vec_vhat_shat=v3.16b,<vec_G0_G1_G0_G1=v12.16b
and v0.16b,v3.16b,v12.16b

# qhasm: vec_tmp1 = vec_tmp1 ^ vec_MASKcarry
# asm 1: eor >vec_tmp1=reg128#1.16b,<vec_tmp1=reg128#1.16b,<vec_MASKcarry=reg128#9.16b
# asm 2: eor >vec_tmp1=v0.16b,<vec_tmp1=v0.16b,<vec_MASKcarry=v8.16b
eor v0.16b,v0.16b,v8.16b

# qhasm: vec_tmp1 = ~vec_tmp1
# asm 1: mvn  >vec_tmp1=reg128#1.16b,<vec_tmp1=reg128#1.16b
# asm 2: mvn  >vec_tmp1=v0.16b,<vec_tmp1=v0.16b
mvn  v0.16b,v0.16b

# qhasm: vec_tmp2 = vec_vhat_shat & vec_G2_G3_G2_G3
# asm 1: and >vec_tmp2=reg128#2.16b,<vec_vhat_shat=reg128#4.16b,<vec_G2_G3_G2_G3=reg128#14.16b
# asm 2: and >vec_tmp2=v1.16b,<vec_vhat_shat=v3.16b,<vec_G2_G3_G2_G3=v13.16b
and v1.16b,v3.16b,v13.16b

# qhasm: vec_tmp2 = vec_tmp2 ^ vec_MASKcarry1
# asm 1: eor >vec_tmp2=reg128#2.16b,<vec_tmp2=reg128#2.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: eor >vec_tmp2=v1.16b,<vec_tmp2=v1.16b,<vec_MASKcarry1=v6.16b
eor v1.16b,v1.16b,v6.16b

# qhasm: vec_tmp2 = ~vec_tmp2
# asm 1: mvn  >vec_tmp2=reg128#2.16b,<vec_tmp2=reg128#2.16b
# asm 2: mvn  >vec_tmp2=v1.16b,<vec_tmp2=v1.16b
mvn  v1.16b,v1.16b

# qhasm: debug0 = vec_tmp2[0/2]
# asm 1: umov >debug0=int64#3,<vec_tmp2=reg128#2.d[0]
# asm 2: umov >debug0=x2,<vec_tmp2=v1.d[0]
umov x2,v1.d[0]

# qhasm: debug1 = vec_tmp2[1/2]
# asm 1: umov >debug1=int64#4,<vec_tmp2=reg128#2.d[1]
# asm 2: umov >debug1=x3,<vec_tmp2=v1.d[1]
umov x3,v1.d[1]

# qhasm: mem64[pointerR]=debug0
# asm 1: str <debug0=int64#3,[<pointerR=int64#1]
# asm 2: str <debug0=x2,[<pointerR=x0]
str x2,[x0]

# qhasm: mem64[pointerR+8]=debug1
# asm 1: str <debug1=int64#4,[<pointerR=int64#1,#8]
# asm 2: str <debug1=x3,[<pointerR=x0,#8]
str x3,[x0,#8]

# qhasm: 2x vec_vhat_shat unsigned>>= 63
# asm 1: ushr >vec_vhat_shat=reg128#4.2d,<vec_vhat_shat=reg128#4.2d,#63
# asm 2: ushr >vec_vhat_shat=v3.2d,<vec_vhat_shat=v3.2d,#63
ushr v3.2d,v3.2d,#63

# qhasm: 2x vec_tmp1 = vec_tmp1 + vec_vhat_shat
# asm 1: add >vec_tmp1=reg128#1.2d,<vec_tmp1=reg128#1.2d,<vec_vhat_shat=reg128#4.2d
# asm 2: add >vec_tmp1=v0.2d,<vec_tmp1=v0.2d,<vec_vhat_shat=v3.2d
add v0.2d,v0.2d,v3.2d

# qhasm: 2x vec_tmp1 <<= 2
# asm 1: shl >vec_tmp1=reg128#1.2d,<vec_tmp1=reg128#1.2d,#2
# asm 2: shl >vec_tmp1=v0.2d,<vec_tmp1=v0.2d,#2
shl v0.2d,v0.2d,#2

# qhasm: vec_carry1 = vec_tmp1 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#4.16b,<vec_tmp1=reg128#1.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: and >vec_carry1=v3.16b,<vec_tmp1=v0.16b,<vec_MASKcarry1=v6.16b
and v3.16b,v0.16b,v6.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp1=reg128#1.16b,<vec_tmp1=reg128#1.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: bic >vec_tmp1=v0.16b,<vec_tmp1=v0.16b,<vec_MASKcarry1=v6.16b
bic v0.16b,v0.16b,v6.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#4.2d,<vec_carry1=reg128#4.2d,#2
# asm 2: shl >vec_carry1=v3.2d,<vec_carry1=v3.2d,#2
shl v3.2d,v3.2d,#2

# qhasm: vec_tmp1 |= vec_carry1
# asm 1: orr >vec_tmp1=reg128#1.16b,<vec_tmp1=reg128#1.16b,<vec_carry1=reg128#4.16b
# asm 2: orr >vec_tmp1=v0.16b,<vec_tmp1=v0.16b,<vec_carry1=v3.16b
orr v0.16b,v0.16b,v3.16b

# qhasm: vec_carry2 = vec_tmp1 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#4.16b,<vec_tmp1=reg128#1.16b,<vec_MASKcarry2=reg128#8.16b
# asm 2: and >vec_carry2=v3.16b,<vec_tmp1=v0.16b,<vec_MASKcarry2=v7.16b
and v3.16b,v0.16b,v7.16b

# qhasm: vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
# asm 1: bic >vec_tmp1=reg128#1.16b,<vec_tmp1=reg128#1.16b,<vec_MASKcarry2=reg128#8.16b
# asm 2: bic >vec_tmp1=v0.16b,<vec_tmp1=v0.16b,<vec_MASKcarry2=v7.16b
bic v0.16b,v0.16b,v7.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#4.2d,<vec_carry2=reg128#4.2d,#62
# asm 2: ushr >vec_carry2=v3.2d,<vec_carry2=v3.2d,#62
ushr v3.2d,v3.2d,#62

# qhasm: 2x vec_tmp2 <<= 2
# asm 1: shl >vec_tmp2=reg128#2.2d,<vec_tmp2=reg128#2.2d,#2
# asm 2: shl >vec_tmp2=v1.2d,<vec_tmp2=v1.2d,#2
shl v1.2d,v1.2d,#2

# qhasm: vec_tmp2 |= vec_carry2
# asm 1: orr >vec_tmp2=reg128#2.16b,<vec_tmp2=reg128#2.16b,<vec_carry2=reg128#4.16b
# asm 2: orr >vec_tmp2=v1.16b,<vec_tmp2=v1.16b,<vec_carry2=v3.16b
orr v1.16b,v1.16b,v3.16b

# qhasm: vec_carry1 = vec_tmp2 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#4.16b,<vec_tmp2=reg128#2.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: and >vec_carry1=v3.16b,<vec_tmp2=v1.16b,<vec_MASKcarry1=v6.16b
and v3.16b,v1.16b,v6.16b

# qhasm: vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
# asm 1: bic >vec_tmp2=reg128#2.16b,<vec_tmp2=reg128#2.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: bic >vec_tmp2=v1.16b,<vec_tmp2=v1.16b,<vec_MASKcarry1=v6.16b
bic v1.16b,v1.16b,v6.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#4.2d,<vec_carry1=reg128#4.2d,#2
# asm 2: shl >vec_carry1=v3.2d,<vec_carry1=v3.2d,#2
shl v3.2d,v3.2d,#2

# qhasm: vec_tmp2 |= vec_carry1
# asm 1: orr >vec_tmp2=reg128#2.16b,<vec_tmp2=reg128#2.16b,<vec_carry1=reg128#4.16b
# asm 2: orr >vec_tmp2=v1.16b,<vec_tmp2=v1.16b,<vec_carry1=v3.16b
orr v1.16b,v1.16b,v3.16b

# qhasm: 2x vec_R2_R3_S2_S3 += vec_tmp1
# asm 1: add <vec_R2_R3_S2_S3=reg128#3.2d,<vec_R2_R3_S2_S3=reg128#3.2d,<vec_tmp1=reg128#1.2d
# asm 2: add <vec_R2_R3_S2_S3=v2.2d,<vec_R2_R3_S2_S3=v2.2d,<vec_tmp1=v0.2d
add v2.2d,v2.2d,v0.2d

# qhasm: 2x vec_R4_R5_S4_S5 += vec_tmp2
# asm 1: add <vec_R4_R5_S4_S5=reg128#5.2d,<vec_R4_R5_S4_S5=reg128#5.2d,<vec_tmp2=reg128#2.2d
# asm 2: add <vec_R4_R5_S4_S5=v4.2d,<vec_R4_R5_S4_S5=v4.2d,<vec_tmp2=v1.2d
add v4.2d,v4.2d,v1.2d

# qhasm: vec_carry1 = vec_R2_R3_S2_S3 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#1.16b,<vec_R2_R3_S2_S3=reg128#3.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: and >vec_carry1=v0.16b,<vec_R2_R3_S2_S3=v2.16b,<vec_MASKcarry1=v6.16b
and v0.16b,v2.16b,v6.16b

# qhasm: vec_R2_R3_S2_S3 = vec_R2_R3_S2_S3 & ~vec_MASKcarry1
# asm 1: bic >vec_R2_R3_S2_S3=reg128#2.16b,<vec_R2_R3_S2_S3=reg128#3.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: bic >vec_R2_R3_S2_S3=v1.16b,<vec_R2_R3_S2_S3=v2.16b,<vec_MASKcarry1=v6.16b
bic v1.16b,v2.16b,v6.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#1.2d,<vec_carry1=reg128#1.2d,#2
# asm 2: shl >vec_carry1=v0.2d,<vec_carry1=v0.2d,#2
shl v0.2d,v0.2d,#2

# qhasm: 2x vec_R2_R3_S2_S3 += vec_carry1
# asm 1: add <vec_R2_R3_S2_S3=reg128#2.2d,<vec_R2_R3_S2_S3=reg128#2.2d,<vec_carry1=reg128#1.2d
# asm 2: add <vec_R2_R3_S2_S3=v1.2d,<vec_R2_R3_S2_S3=v1.2d,<vec_carry1=v0.2d
add v1.2d,v1.2d,v0.2d

# qhasm: vec_carry2 = vec_R2_R3_S2_S3 & vec_MASKcarry2
# asm 1: and >vec_carry2=reg128#1.16b,<vec_R2_R3_S2_S3=reg128#2.16b,<vec_MASKcarry2=reg128#8.16b
# asm 2: and >vec_carry2=v0.16b,<vec_R2_R3_S2_S3=v1.16b,<vec_MASKcarry2=v7.16b
and v0.16b,v1.16b,v7.16b

# qhasm: vec_R2_R3_S2_S3 = vec_R2_R3_S2_S3 & ~vec_MASKcarry2
# asm 1: bic >vec_R2_R3_S2_S3=reg128#2.16b,<vec_R2_R3_S2_S3=reg128#2.16b,<vec_MASKcarry2=reg128#8.16b
# asm 2: bic >vec_R2_R3_S2_S3=v1.16b,<vec_R2_R3_S2_S3=v1.16b,<vec_MASKcarry2=v7.16b
bic v1.16b,v1.16b,v7.16b

# qhasm: 2x vec_carry2 unsigned>>= 62
# asm 1: ushr >vec_carry2=reg128#1.2d,<vec_carry2=reg128#1.2d,#62
# asm 2: ushr >vec_carry2=v0.2d,<vec_carry2=v0.2d,#62
ushr v0.2d,v0.2d,#62

# qhasm: 2x vec_R4_R5_S4_S5 += vec_carry2
# asm 1: add <vec_R4_R5_S4_S5=reg128#5.2d,<vec_R4_R5_S4_S5=reg128#5.2d,<vec_carry2=reg128#1.2d
# asm 2: add <vec_R4_R5_S4_S5=v4.2d,<vec_R4_R5_S4_S5=v4.2d,<vec_carry2=v0.2d
add v4.2d,v4.2d,v0.2d

# qhasm: vec_carry1 = vec_R4_R5_S4_S5 & vec_MASKcarry1
# asm 1: and >vec_carry1=reg128#1.16b,<vec_R4_R5_S4_S5=reg128#5.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: and >vec_carry1=v0.16b,<vec_R4_R5_S4_S5=v4.16b,<vec_MASKcarry1=v6.16b
and v0.16b,v4.16b,v6.16b

# qhasm: vec_R4_R5_S4_S5 = vec_R4_R5_S4_S5 & ~vec_MASKcarry1
# asm 1: bic >vec_R4_R5_S4_S5=reg128#3.16b,<vec_R4_R5_S4_S5=reg128#5.16b,<vec_MASKcarry1=reg128#7.16b
# asm 2: bic >vec_R4_R5_S4_S5=v2.16b,<vec_R4_R5_S4_S5=v4.16b,<vec_MASKcarry1=v6.16b
bic v2.16b,v4.16b,v6.16b

# qhasm: 2x vec_carry1 <<= 2
# asm 1: shl >vec_carry1=reg128#1.2d,<vec_carry1=reg128#1.2d,#2
# asm 2: shl >vec_carry1=v0.2d,<vec_carry1=v0.2d,#2
shl v0.2d,v0.2d,#2

# qhasm: 2x vec_R4_R5_S4_S5 += vec_carry1
# asm 1: add <vec_R4_R5_S4_S5=reg128#3.2d,<vec_R4_R5_S4_S5=reg128#3.2d,<vec_carry1=reg128#1.2d
# asm 2: add <vec_R4_R5_S4_S5=v2.2d,<vec_R4_R5_S4_S5=v2.2d,<vec_carry1=v0.2d
add v2.2d,v2.2d,v0.2d

# qhasm: return
ret
