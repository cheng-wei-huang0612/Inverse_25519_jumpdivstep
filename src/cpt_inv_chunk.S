# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#10, <uu=int64#8, #0, #30
# asm 2: ubfx >uu0=x9, <uu=x7, #0, #30
ubfx x9, x7, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#8, <uu=int64#8, #30, #32
# asm 2: ubfx >uu1=x7, <uu=x7, #30, #32
ubfx x7, x7, #30, #32

# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#11, <vv=int64#6, #0, #30
# asm 2: ubfx >vv0=x10, <vv=x5, #0, #30
ubfx x10, x5, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#6, <vv=int64#6, #30, #32
# asm 2: ubfx >vv1=x5, <vv=x5, #30, #32
ubfx x5, x5, #30, #32

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#12, <rr=int64#7, #0, #30
# asm 2: ubfx >rr0=x11, <rr=x6, #0, #30
ubfx x11, x6, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#7, <rr=int64#7, #30, #32
# asm 2: ubfx >rr1=x6, <rr=x6, #30, #32
ubfx x6, x6, #30, #32

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#13, <ss=int64#5, #0, #30
# asm 2: ubfx >ss0=x12, <ss=x4, #0, #30
ubfx x12, x4, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#5, <ss=int64#5, #30, #32
# asm 2: ubfx >ss1=x4, <ss=x4, #30, #32
ubfx x4, x4, #30, #32

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[0], <uu0=int64#10%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[0], <uu0=w9
ins v17.s[0], w9

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[1], <rr0=int64#12%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[1], <rr0=w11
ins v17.s[1], w11

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[2], <vv0=int64#11%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[2], <vv0=w10
ins v17.s[2], w10

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[3], <ss0=int64#13%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[3], <ss0=w12
ins v17.s[3], w12

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[0], <uu1=int64#8%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[0], <uu1=w7
ins v18.s[0], w7

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[1], <rr1=int64#7%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[1], <rr1=w6
ins v18.s[1], w6

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[2], <vv1=int64#6%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[2], <vv1=w5
ins v18.s[2], w5

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[3], <ss1=int64#5%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[3], <ss1=w4
ins v18.s[3], w4

# qhasm: reg128 vec_buffer

# qhasm: reg128 vec_prod

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smull >vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#13.s[0]
# asm 2: smull >vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F0_F1_G0_G1=v12.s[0]
smull v19.2d,v17.2s,v12.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#13.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F0_F1_G0_G1=v12.s[2]
smlal2 v19.2d,v17.4s,v12.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#13.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F0_F1_G0_G1=v12.s[1]
smlal v19.2d,v17.2s,v12.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#13.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F0_F1_G0_G1=v12.s[3]
smlal2 v19.2d,v17.4s,v12.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F0_F1_G0_G1=reg128#13.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F0_F1_G0_G1=v12.s[0]
smlal v19.2d,v18.2s,v12.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F0_F1_G0_G1=reg128#13.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F0_F1_G0_G1=v12.s[2]
smlal2 v19.2d,v18.4s,v12.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#1.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F2_F3_G2_G3=v0.s[0]
smlal v19.2d,v17.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F2_F3_G2_G3=v0.s[2]
smlal2 v19.2d,v17.4s,v0.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F0_F1_G0_G1=reg128#13.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F0_F1_G0_G1=v12.s[1]
smlal v19.2d,v18.2s,v12.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F0_F1_G0_G1=reg128#13.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F0_F1_G0_G1=v12.s[3]
smlal2 v19.2d,v18.4s,v12.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#13.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v12.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v12.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: vec_F0_F1_G0_G1 = vec_buffer
# asm 1: mov >vec_F0_F1_G0_G1=reg128#13.16b, <vec_buffer=reg128#13.16b
# asm 2: mov >vec_F0_F1_G0_G1=v12.16b, <vec_buffer=v12.16b
mov v12.16b, v12.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#1.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F2_F3_G2_G3=v0.s[1]
smlal v19.2d,v17.2s,v0.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#1.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F2_F3_G2_G3=v0.s[3]
smlal2 v19.2d,v17.4s,v0.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F2_F3_G2_G3=reg128#1.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F2_F3_G2_G3=v0.s[0]
smlal v19.2d,v18.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F2_F3_G2_G3=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F2_F3_G2_G3=v0.s[2]
smlal2 v19.2d,v18.4s,v0.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#21.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v20.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v20.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#21.2d, <vec_buffer=reg128#21.2d, #32
# asm 2: shl >vec_buffer=v20.2d, <vec_buffer=v20.2d, #32
shl v20.2d, v20.2d, #32

# qhasm: vec_F0_F1_G0_G1 |= vec_buffer
# asm 1: orr <vec_F0_F1_G0_G1=reg128#13.16b, <vec_F0_F1_G0_G1=reg128#13.16b, <vec_buffer=reg128#21.16b
# asm 2: orr <vec_F0_F1_G0_G1=v12.16b, <vec_F0_F1_G0_G1=v12.16b, <vec_buffer=v20.16b
orr v12.16b, v12.16b, v20.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F4_F5_G4_G5=reg128#5.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F4_F5_G4_G5=v4.s[0]
smlal v19.2d,v17.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F4_F5_G4_G5=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F4_F5_G4_G5=v4.s[2]
smlal2 v19.2d,v17.4s,v4.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F2_F3_G2_G3=reg128#1.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F2_F3_G2_G3=v0.s[1]
smlal v19.2d,v18.2s,v0.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F2_F3_G2_G3=reg128#1.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F2_F3_G2_G3=v0.s[3]
smlal2 v19.2d,v18.4s,v0.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#1.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v0.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v0.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: vec_F2_F3_G2_G3 = vec_buffer
# asm 1: mov >vec_F2_F3_G2_G3=reg128#1.16b, <vec_buffer=reg128#1.16b
# asm 2: mov >vec_F2_F3_G2_G3=v0.16b, <vec_buffer=v0.16b
mov v0.16b, v0.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F4_F5_G4_G5=reg128#5.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F4_F5_G4_G5=v4.s[1]
smlal v19.2d,v17.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F4_F5_G4_G5=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F4_F5_G4_G5=v4.s[3]
smlal2 v19.2d,v17.4s,v4.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F4_F5_G4_G5=reg128#5.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F4_F5_G4_G5=v4.s[0]
smlal v19.2d,v18.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F4_F5_G4_G5=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F4_F5_G4_G5=v4.s[2]
smlal2 v19.2d,v18.4s,v4.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#21.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v20.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v20.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#21.2d, <vec_buffer=reg128#21.2d, #32
# asm 2: shl >vec_buffer=v20.2d, <vec_buffer=v20.2d, #32
shl v20.2d, v20.2d, #32

# qhasm: vec_F2_F3_G2_G3 |= vec_buffer
# asm 1: orr <vec_F2_F3_G2_G3=reg128#1.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_buffer=reg128#21.16b
# asm 2: orr <vec_F2_F3_G2_G3=v0.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_buffer=v20.16b
orr v0.16b, v0.16b, v20.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F6_F7_G6_G7=reg128#2.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F6_F7_G6_G7=v1.s[0]
smlal v19.2d,v17.2s,v1.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F6_F7_G6_G7=reg128#2.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F6_F7_G6_G7=v1.s[2]
smlal2 v19.2d,v17.4s,v1.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F4_F5_G4_G5=reg128#5.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F4_F5_G4_G5=v4.s[1]
smlal v19.2d,v18.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F4_F5_G4_G5=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F4_F5_G4_G5=v4.s[3]
smlal2 v19.2d,v18.4s,v4.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#5.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v4.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v4.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: vec_F4_F5_G4_G5 = vec_buffer
# asm 1: mov >vec_F4_F5_G4_G5=reg128#5.16b, <vec_buffer=reg128#5.16b
# asm 2: mov >vec_F4_F5_G4_G5=v4.16b, <vec_buffer=v4.16b
mov v4.16b, v4.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F6_F7_G6_G7=reg128#2.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F6_F7_G6_G7=v1.s[1]
smlal v19.2d,v17.2s,v1.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F6_F7_G6_G7=reg128#2.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F6_F7_G6_G7=v1.s[3]
smlal2 v19.2d,v17.4s,v1.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F6_F7_G6_G7=reg128#2.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F6_F7_G6_G7=v1.s[0]
smlal v19.2d,v18.2s,v1.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F6_F7_G6_G7=reg128#2.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F6_F7_G6_G7=v1.s[2]
smlal2 v19.2d,v18.4s,v1.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#21.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v20.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v20.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#21.2d, <vec_buffer=reg128#21.2d, #32
# asm 2: shl >vec_buffer=v20.2d, <vec_buffer=v20.2d, #32
shl v20.2d, v20.2d, #32

# qhasm: vec_F4_F5_G4_G5 |= vec_buffer
# asm 1: orr <vec_F4_F5_G4_G5=reg128#5.16b, <vec_F4_F5_G4_G5=reg128#5.16b, <vec_buffer=reg128#21.16b
# asm 2: orr <vec_F4_F5_G4_G5=v4.16b, <vec_F4_F5_G4_G5=v4.16b, <vec_buffer=v20.16b
orr v4.16b, v4.16b, v20.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F8_F9_G8_G9=reg128#3.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F8_F9_G8_G9=v2.s[0]
smlal v19.2d,v17.2s,v2.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F8_F9_G8_G9=reg128#3.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F8_F9_G8_G9=v2.s[2]
smlal2 v19.2d,v17.4s,v2.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F6_F7_G6_G7=reg128#2.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F6_F7_G6_G7=v1.s[1]
smlal v19.2d,v18.2s,v1.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F6_F7_G6_G7=reg128#2.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F6_F7_G6_G7=v1.s[3]
smlal2 v19.2d,v18.4s,v1.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#2.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v1.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v1.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: vec_F6_F7_G6_G7 = vec_buffer
# asm 1: mov >vec_F6_F7_G6_G7=reg128#2.16b, <vec_buffer=reg128#2.16b
# asm 2: mov >vec_F6_F7_G6_G7=v1.16b, <vec_buffer=v1.16b
mov v1.16b, v1.16b

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F8_F9_G8_G9=reg128#3.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F8_F9_G8_G9=v2.s[0]
smlal v19.2d,v18.2s,v2.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F8_F9_G8_G9=reg128#3.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F8_F9_G8_G9=v2.s[2]
smlal2 v19.2d,v18.4s,v2.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#3.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v2.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v2.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#3.2d, <vec_buffer=reg128#3.2d, #32
# asm 2: shl >vec_buffer=v2.2d, <vec_buffer=v2.2d, #32
shl v2.2d, v2.2d, #32

# qhasm: vec_F6_F7_G6_G7 |= vec_buffer
# asm 1: orr <vec_F6_F7_G6_G7=reg128#2.16b, <vec_F6_F7_G6_G7=reg128#2.16b, <vec_buffer=reg128#3.16b
# asm 2: orr <vec_F6_F7_G6_G7=v1.16b, <vec_F6_F7_G6_G7=v1.16b, <vec_buffer=v2.16b
orr v1.16b, v1.16b, v2.16b

# qhasm: vec_F8_F9_G8_G9 = vec_prod
# asm 1: mov >vec_F8_F9_G8_G9=reg128#3.16b, <vec_prod=reg128#20.16b
# asm 2: mov >vec_F8_F9_G8_G9=v2.16b, <vec_prod=v19.16b
mov v2.16b, v19.16b

# qhasm: reg128 final_add_0

# qhasm: reg128 final_add_1

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smull >vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V0_V1_S0_S1=reg128#11.s[0]
# asm 2: smull >vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V0_V1_S0_S1=v10.s[0]
smull v19.2d,v17.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V0_V1_S0_S1=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V0_V1_S0_S1=v10.s[2]
smlal2 v19.2d,v17.4s,v10.s[2]

# qhasm: reg128 vec_l0

# qhasm: 4x vec_l0 = vec_prod * vec_M
# asm 1: mul >vec_l0=reg128#21.4s,<vec_prod=reg128#20.4s,<vec_M=reg128#10.4s
# asm 2: mul >vec_l0=v20.4s,<vec_prod=v19.4s,<vec_M=v9.4s
mul v20.4s,v19.4s,v9.4s

# qhasm: vec_l0 &= vec_2x_2p30m1
# asm 1: and <vec_l0=reg128#21.16b, <vec_l0=reg128#21.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and <vec_l0=v20.16b, <vec_l0=v20.16b, <vec_2x_2p30m1=v6.16b
and v20.16b, v20.16b, v6.16b

# qhasm: 4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4]
# asm 1: uzp1 >vec_l0=reg128#21.4s, <vec_l0=reg128#21.4s, <vec_l0=reg128#21.4s
# asm 2: uzp1 >vec_l0=v20.4s, <vec_l0=v20.4s, <vec_l0=v20.4s
uzp1 v20.4s, v20.4s, v20.4s

# qhasm: 2x vec_prod -= vec_l0[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#20.2d,<vec_l0=reg128#21.2s,<vec_4x_19=reg128#4.2s
# asm 2: smlsl <vec_prod=v19.2d,<vec_l0=v20.2s,<vec_4x_19=v3.2s
smlsl v19.2d,v20.2s,v3.2s

# qhasm: 2x final_add_0 = vec_l0[0] << 15
# asm 1: sshll >final_add_0=reg128#21.2d,<vec_l0=reg128#21.2s,#15
# asm 2: sshll >final_add_0=v20.2d,<vec_l0=v20.2s,#15
sshll v20.2d,v20.2s,#15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V0_V1_S0_S1=reg128#11.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V0_V1_S0_S1=v10.s[1]
smlal v19.2d,v17.2s,v10.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V0_V1_S0_S1=reg128#11.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V0_V1_S0_S1=v10.s[3]
smlal2 v19.2d,v17.4s,v10.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V0_V1_S0_S1=reg128#11.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V0_V1_S0_S1=v10.s[0]
smlal v19.2d,v18.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V0_V1_S0_S1=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V0_V1_S0_S1=v10.s[2]
smlal2 v19.2d,v18.4s,v10.s[2]

# qhasm: reg128 vec_l1

# qhasm: 4x vec_l1 = vec_prod * vec_M
# asm 1: mul >vec_l1=reg128#22.4s,<vec_prod=reg128#20.4s,<vec_M=reg128#10.4s
# asm 2: mul >vec_l1=v21.4s,<vec_prod=v19.4s,<vec_M=v9.4s
mul v21.4s,v19.4s,v9.4s

# qhasm: vec_l1 &= vec_2x_2p30m1
# asm 1: and <vec_l1=reg128#22.16b, <vec_l1=reg128#22.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and <vec_l1=v21.16b, <vec_l1=v21.16b, <vec_2x_2p30m1=v6.16b
and v21.16b, v21.16b, v6.16b

# qhasm: 4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4]
# asm 1: uzp1 >vec_l1=reg128#22.4s, <vec_l1=reg128#22.4s, <vec_l1=reg128#22.4s
# asm 2: uzp1 >vec_l1=v21.4s, <vec_l1=v21.4s, <vec_l1=v21.4s
uzp1 v21.4s, v21.4s, v21.4s

# qhasm: 2x vec_prod -= vec_l1[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#20.2d,<vec_l1=reg128#22.2s,<vec_4x_19=reg128#4.2s
# asm 2: smlsl <vec_prod=v19.2d,<vec_l1=v21.2s,<vec_4x_19=v3.2s
smlsl v19.2d,v21.2s,v3.2s

# qhasm: 2x final_add_1 = vec_l1[0] << 15
# asm 1: sshll >final_add_1=reg128#22.2d,<vec_l1=reg128#22.2s,#15
# asm 2: sshll >final_add_1=v21.2d,<vec_l1=v21.2s,#15
sshll v21.2d,v21.2s,#15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V2_V3_S2_S3=reg128#12.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V2_V3_S2_S3=v11.s[0]
smlal v19.2d,v17.2s,v11.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V2_V3_S2_S3=reg128#12.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V2_V3_S2_S3=v11.s[2]
smlal2 v19.2d,v17.4s,v11.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V0_V1_S0_S1=reg128#11.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V0_V1_S0_S1=v10.s[1]
smlal v19.2d,v18.2s,v10.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V0_V1_S0_S1=reg128#11.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V0_V1_S0_S1=v10.s[3]
smlal2 v19.2d,v18.4s,v10.s[3]

# qhasm: vec_V0_V1_S0_S1 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V0_V1_S0_S1=reg128#11.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V0_V1_S0_S1=v10.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v10.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V2_V3_S2_S3=reg128#12.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V2_V3_S2_S3=v11.s[1]
smlal v19.2d,v17.2s,v11.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V2_V3_S2_S3=reg128#12.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V2_V3_S2_S3=v11.s[3]
smlal2 v19.2d,v17.4s,v11.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V2_V3_S2_S3=reg128#12.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V2_V3_S2_S3=v11.s[0]
smlal v19.2d,v18.2s,v11.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V2_V3_S2_S3=reg128#12.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V2_V3_S2_S3=v11.s[2]
smlal2 v19.2d,v18.4s,v11.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#23.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v22.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v22.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#23.2d, <vec_buffer=reg128#23.2d, #32
# asm 2: shl >vec_buffer=v22.2d, <vec_buffer=v22.2d, #32
shl v22.2d, v22.2d, #32

# qhasm: vec_V0_V1_S0_S1 |= vec_buffer
# asm 1: orr <vec_V0_V1_S0_S1=reg128#11.16b, <vec_V0_V1_S0_S1=reg128#11.16b, <vec_buffer=reg128#23.16b
# asm 2: orr <vec_V0_V1_S0_S1=v10.16b, <vec_V0_V1_S0_S1=v10.16b, <vec_buffer=v22.16b
orr v10.16b, v10.16b, v22.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V4_V5_S4_S5=reg128#14.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V4_V5_S4_S5=v13.s[0]
smlal v19.2d,v17.2s,v13.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V4_V5_S4_S5=reg128#14.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V4_V5_S4_S5=v13.s[2]
smlal2 v19.2d,v17.4s,v13.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V2_V3_S2_S3=reg128#12.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V2_V3_S2_S3=v11.s[1]
smlal v19.2d,v18.2s,v11.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V2_V3_S2_S3=reg128#12.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V2_V3_S2_S3=v11.s[3]
smlal2 v19.2d,v18.4s,v11.s[3]

# qhasm: vec_V2_V3_S2_S3 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V2_V3_S2_S3=reg128#12.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V2_V3_S2_S3=v11.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v11.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V4_V5_S4_S5=reg128#14.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V4_V5_S4_S5=v13.s[1]
smlal v19.2d,v17.2s,v13.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V4_V5_S4_S5=reg128#14.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V4_V5_S4_S5=v13.s[3]
smlal2 v19.2d,v17.4s,v13.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V4_V5_S4_S5=reg128#14.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V4_V5_S4_S5=v13.s[0]
smlal v19.2d,v18.2s,v13.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V4_V5_S4_S5=reg128#14.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V4_V5_S4_S5=v13.s[2]
smlal2 v19.2d,v18.4s,v13.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#23.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v22.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v22.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#23.2d, <vec_buffer=reg128#23.2d, #32
# asm 2: shl >vec_buffer=v22.2d, <vec_buffer=v22.2d, #32
shl v22.2d, v22.2d, #32

# qhasm: vec_V2_V3_S2_S3 |= vec_buffer
# asm 1: orr <vec_V2_V3_S2_S3=reg128#12.16b, <vec_V2_V3_S2_S3=reg128#12.16b, <vec_buffer=reg128#23.16b
# asm 2: orr <vec_V2_V3_S2_S3=v11.16b, <vec_V2_V3_S2_S3=v11.16b, <vec_buffer=v22.16b
orr v11.16b, v11.16b, v22.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V6_V7_S6_S7=reg128#15.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V6_V7_S6_S7=v14.s[0]
smlal v19.2d,v17.2s,v14.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V6_V7_S6_S7=reg128#15.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V6_V7_S6_S7=v14.s[2]
smlal2 v19.2d,v17.4s,v14.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V4_V5_S4_S5=reg128#14.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V4_V5_S4_S5=v13.s[1]
smlal v19.2d,v18.2s,v13.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V4_V5_S4_S5=reg128#14.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V4_V5_S4_S5=v13.s[3]
smlal2 v19.2d,v18.4s,v13.s[3]

# qhasm: vec_V4_V5_S4_S5 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V4_V5_S4_S5=reg128#14.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V4_V5_S4_S5=v13.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v13.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V6_V7_S6_S7=reg128#15.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V6_V7_S6_S7=v14.s[1]
smlal v19.2d,v17.2s,v14.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V6_V7_S6_S7=reg128#15.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V6_V7_S6_S7=v14.s[3]
smlal2 v19.2d,v17.4s,v14.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V6_V7_S6_S7=reg128#15.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V6_V7_S6_S7=v14.s[0]
smlal v19.2d,v18.2s,v14.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V6_V7_S6_S7=reg128#15.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V6_V7_S6_S7=v14.s[2]
smlal2 v19.2d,v18.4s,v14.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#23.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v22.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v22.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#23.2d, <vec_buffer=reg128#23.2d, #32
# asm 2: shl >vec_buffer=v22.2d, <vec_buffer=v22.2d, #32
shl v22.2d, v22.2d, #32

# qhasm: vec_V4_V5_S4_S5 |= vec_buffer
# asm 1: orr <vec_V4_V5_S4_S5=reg128#14.16b, <vec_V4_V5_S4_S5=reg128#14.16b, <vec_buffer=reg128#23.16b
# asm 2: orr <vec_V4_V5_S4_S5=v13.16b, <vec_V4_V5_S4_S5=v13.16b, <vec_buffer=v22.16b
orr v13.16b, v13.16b, v22.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V8_V9_S8_S9=reg128#16.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V8_V9_S8_S9=v15.s[0]
smlal v19.2d,v17.2s,v15.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V8_V9_S8_S9=reg128#16.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V8_V9_S8_S9=v15.s[2]
smlal2 v19.2d,v17.4s,v15.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V6_V7_S6_S7=reg128#15.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V6_V7_S6_S7=v14.s[1]
smlal v19.2d,v18.2s,v14.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V6_V7_S6_S7=reg128#15.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V6_V7_S6_S7=v14.s[3]
smlal2 v19.2d,v18.4s,v14.s[3]

# qhasm: 2x vec_prod += final_add_0
# asm 1: add <vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, <final_add_0=reg128#21.2d
# asm 2: add <vec_prod=v19.2d, <vec_prod=v19.2d, <final_add_0=v20.2d
add v19.2d, v19.2d, v20.2d

# qhasm: vec_V6_V7_S6_S7 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V6_V7_S6_S7=reg128#15.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V6_V7_S6_S7=v14.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v14.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V8_V9_S8_S9=reg128#16.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V8_V9_S8_S9=v15.s[0]
smlal v19.2d,v18.2s,v15.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V8_V9_S8_S9=reg128#16.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V8_V9_S8_S9=v15.s[2]
smlal2 v19.2d,v18.4s,v15.s[2]

# qhasm: 2x vec_prod += final_add_1
# asm 1: add <vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, <final_add_1=reg128#22.2d
# asm 2: add <vec_prod=v19.2d, <vec_prod=v19.2d, <final_add_1=v21.2d
add v19.2d, v19.2d, v21.2d

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#16.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v15.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v15.16b, v19.16b, v6.16b

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#16.2d, <vec_buffer=reg128#16.2d, #32
# asm 2: shl >vec_buffer=v15.2d, <vec_buffer=v15.2d, #32
shl v15.2d, v15.2d, #32

# qhasm: vec_V6_V7_S6_S7 |= vec_buffer
# asm 1: orr <vec_V6_V7_S6_S7=reg128#15.16b, <vec_V6_V7_S6_S7=reg128#15.16b, <vec_buffer=reg128#16.16b
# asm 2: orr <vec_V6_V7_S6_S7=v14.16b, <vec_V6_V7_S6_S7=v14.16b, <vec_buffer=v15.16b
orr v14.16b, v14.16b, v15.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#16.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v15.2d, <vec_prod=v19.2d, #30
sshr v15.2d, v19.2d, #30

# qhasm: reg128 vec_carry

# qhasm: 2x vec_carry = vec_prod >> 15
# asm 1: sshr <vec_carry=reg128#17.2d, <vec_prod=reg128#16.2d, #15
# asm 2: sshr <vec_carry=v16.2d, <vec_prod=v15.2d, #15
sshr v16.2d, v15.2d, #15

# qhasm: vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
# asm 1: and >vec_V8_V9_S8_S9=reg128#16.16b, <vec_prod=reg128#16.16b, <vec_2x_2p15m1=reg128#8.16b
# asm 2: and >vec_V8_V9_S8_S9=v15.16b, <vec_prod=v15.16b, <vec_2x_2p15m1=v7.16b
and v15.16b, v15.16b, v7.16b

# qhasm: 4x vec_buffer = vec_4x_19 * vec_carry
# asm 1: mul >vec_buffer=reg128#20.4s,<vec_4x_19=reg128#4.4s,<vec_carry=reg128#17.4s
# asm 2: mul >vec_buffer=v19.4s,<vec_4x_19=v3.4s,<vec_carry=v16.4s
mul v19.4s,v3.4s,v16.4s

# qhasm: vec_buffer &= vec_2x_2p32m1
# asm 1: and <vec_buffer=reg128#20.16b, <vec_buffer=reg128#20.16b, <vec_2x_2p32m1=reg128#6.16b
# asm 2: and <vec_buffer=v19.16b, <vec_buffer=v19.16b, <vec_2x_2p32m1=v5.16b
and v19.16b, v19.16b, v5.16b

# qhasm: 4x vec_V0_V1_S0_S1 += vec_buffer
# asm 1: add <vec_V0_V1_S0_S1=reg128#11.4s, <vec_V0_V1_S0_S1=reg128#11.4s, <vec_buffer=reg128#20.4s
# asm 2: add <vec_V0_V1_S0_S1=v10.4s, <vec_V0_V1_S0_S1=v10.4s, <vec_buffer=v19.4s
add v10.4s, v10.4s, v19.4s

# qhasm: 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# asm 1: sshr <vec_carry=reg128#17.4s, <vec_V0_V1_S0_S1=reg128#11.4s, #30
# asm 2: sshr <vec_carry=v16.4s, <vec_V0_V1_S0_S1=v10.4s, #30
sshr v16.4s, v10.4s, #30

# qhasm: 2x vec_carry = vec_carry << 32
# asm 1: shl >vec_carry=reg128#17.2d, <vec_carry=reg128#17.2d, #32
# asm 2: shl >vec_carry=v16.2d, <vec_carry=v16.2d, #32
shl v16.2d, v16.2d, #32

# qhasm: 4x vec_V0_V1_S0_S1 += vec_carry
# asm 1: add <vec_V0_V1_S0_S1=reg128#11.4s, <vec_V0_V1_S0_S1=reg128#11.4s, <vec_carry=reg128#17.4s
# asm 2: add <vec_V0_V1_S0_S1=v10.4s, <vec_V0_V1_S0_S1=v10.4s, <vec_carry=v16.4s
add v10.4s, v10.4s, v16.4s

# qhasm: 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# asm 1: sshr <vec_carry=reg128#17.4s, <vec_V0_V1_S0_S1=reg128#11.4s, #30
# asm 2: sshr <vec_carry=v16.4s, <vec_V0_V1_S0_S1=v10.4s, #30
sshr v16.4s, v10.4s, #30

# qhasm: 2x vec_carry = vec_carry unsigned>> 32
# asm 1: ushr >vec_carry=reg128#17.2d, <vec_carry=reg128#17.2d, #32
# asm 2: ushr >vec_carry=v16.2d, <vec_carry=v16.2d, #32
ushr v16.2d, v16.2d, #32

# qhasm: vec_V0_V1_S0_S1 &= vec_4x_2p30m1
# asm 1: and <vec_V0_V1_S0_S1=reg128#11.16b, <vec_V0_V1_S0_S1=reg128#11.16b, <vec_4x_2p30m1=reg128#9.16b
# asm 2: and <vec_V0_V1_S0_S1=v10.16b, <vec_V0_V1_S0_S1=v10.16b, <vec_4x_2p30m1=v8.16b
and v10.16b, v10.16b, v8.16b

# qhasm: 4x vec_V2_V3_S2_S3 += vec_carry
# asm 1: add <vec_V2_V3_S2_S3=reg128#12.4s, <vec_V2_V3_S2_S3=reg128#12.4s, <vec_carry=reg128#17.4s
# asm 2: add <vec_V2_V3_S2_S3=v11.4s, <vec_V2_V3_S2_S3=v11.4s, <vec_carry=v16.4s
add v11.4s, v11.4s, v16.4s

# qhasm:             f_hi = vec_F0_F1_G0_G1[1/4]
# asm 1: smov >f_hi=int64#5, <vec_F0_F1_G0_G1=reg128#13.s[1]
# asm 2: smov >f_hi=x4, <vec_F0_F1_G0_G1=v12.s[1]
smov x4, v12.s[1]

# qhasm:             f = vec_F0_F1_G0_G1[0/4]
# asm 1: smov >f=int64#6, <vec_F0_F1_G0_G1=reg128#13.s[0]
# asm 2: smov >f=x5, <vec_F0_F1_G0_G1=v12.s[0]
smov x5, v12.s[0]

# qhasm:             g_hi = vec_F0_F1_G0_G1[3/4]
# asm 1: smov >g_hi=int64#7, <vec_F0_F1_G0_G1=reg128#13.s[3]
# asm 2: smov >g_hi=x6, <vec_F0_F1_G0_G1=v12.s[3]
smov x6, v12.s[3]

# qhasm:             g = vec_F0_F1_G0_G1[2/4]
# asm 1: smov >g=int64#8, <vec_F0_F1_G0_G1=reg128#13.s[2]
# asm 2: smov >g=x7, <vec_F0_F1_G0_G1=v12.s[2]
smov x7, v12.s[2]

# qhasm:             f = f + f_hi << 30
# asm 1: add >f=int64#5,<f=int64#6,<f_hi=int64#5,LSL #30
# asm 2: add >f=x4,<f=x5,<f_hi=x4,LSL #30
add x4,x5,x4,LSL #30

# qhasm:             g = g + g_hi << 30
# asm 1: add >g=int64#6,<g=int64#8,<g_hi=int64#7,LSL #30
# asm 2: add >g=x5,<g=x7,<g_hi=x6,LSL #30
add x5,x7,x6,LSL #30

# qhasm:             fuv = f & 1048575
# asm 1: and >fuv=int64#7, <f=int64#5, #1048575
# asm 2: and >fuv=x6, <f=x4, #1048575
and x6, x4, #1048575

# qhasm:             grs = g & 1048575
# asm 1: and >grs=int64#8, <g=int64#6, #1048575
# asm 2: and >grs=x7, <g=x5, #1048575
and x7, x5, #1048575

# qhasm:             fuv -= _2p41
# asm 1: sub <fuv=int64#7,<fuv=int64#7,<_2p41=int64#1
# asm 2: sub <fuv=x6,<fuv=x6,<_2p41=x0
sub x6,x6,x0

# qhasm:             grs -= 2p62
# asm 1: sub <grs=int64#8,<grs=int64#8,<2p62=int64#3
# asm 2: sub <grs=x7,<grs=x7,<2p62=x2
sub x7,x7,x2

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: vv = fuv
# asm 1: mov >vv=int64#10,<fuv=int64#7
# asm 2: mov >vv=x9,<fuv=x6
mov x9,x6

# qhasm: vv = vv + 1048576
# asm 1: add >vv=int64#10,<vv=int64#10,#1048576
# asm 2: add >vv=x9,<vv=x9,#1048576
add x9,x9,#1048576

# qhasm: vv = vv + _2p41
# asm 1: add >vv=int64#10,<vv=int64#10,<_2p41=int64#1
# asm 2: add >vv=x9,<vv=x9,<_2p41=x0
add x9,x9,x0

# qhasm: vv = vv signed>> 42
# asm 1: asr >vv=int64#10, <vv=int64#10, #42
# asm 2: asr >vv=x9, <vv=x9, #42
asr x9, x9, #42

# qhasm: uu = fuv + 1048576
# asm 1: add >uu=int64#7,<fuv=int64#7,#1048576
# asm 2: add >uu=x6,<fuv=x6,#1048576
add x6,x6,#1048576

# qhasm: uu = uu << 22
# asm 1: lsl >uu=int64#7, <uu=int64#7, #22
# asm 2: lsl >uu=x6, <uu=x6, #22
lsl x6, x6, #22

# qhasm: uu = uu signed>> 43
# asm 1: asr >uu=int64#7, <uu=int64#7, #43
# asm 2: asr >uu=x6, <uu=x6, #43
asr x6, x6, #43

# qhasm: ss = grs
# asm 1: mov >ss=int64#11,<grs=int64#8
# asm 2: mov >ss=x10,<grs=x7
mov x10,x7

# qhasm: ss = ss + 1048576
# asm 1: add >ss=int64#11,<ss=int64#11,#1048576
# asm 2: add >ss=x10,<ss=x10,#1048576
add x10,x10,#1048576

# qhasm: ss = ss + _2p41
# asm 1: add >ss=int64#11,<ss=int64#11,<_2p41=int64#1
# asm 2: add >ss=x10,<ss=x10,<_2p41=x0
add x10,x10,x0

# qhasm: ss = ss signed>> 42
# asm 1: asr >ss=int64#11, <ss=int64#11, #42
# asm 2: asr >ss=x10, <ss=x10, #42
asr x10, x10, #42

# qhasm: rr = grs + 1048576
# asm 1: add >rr=int64#8,<grs=int64#8,#1048576
# asm 2: add >rr=x7,<grs=x7,#1048576
add x7,x7,#1048576

# qhasm: rr = rr << 22
# asm 1: lsl >rr=int64#8, <rr=int64#8, #22
# asm 2: lsl >rr=x7, <rr=x7, #22
lsl x7, x7, #22

# qhasm: rr = rr signed>> 43
# asm 1: asr >rr=int64#8, <rr=int64#8, #43
# asm 2: asr >rr=x7, <rr=x7, #43
asr x7, x7, #43

# qhasm: prod_lo = uu * f
# asm 1: mul >prod_lo=int64#12,<uu=int64#7,<f=int64#5
# asm 2: mul >prod_lo=x11,<uu=x6,<f=x4
mul x11,x6,x4

# qhasm: prod_hi = uu signed* f (hi)
# asm 1: smulh >prod_hi=int64#13, <uu=int64#7, <f=int64#5
# asm 2: smulh >prod_hi=x12, <uu=x6, <f=x4
smulh x12, x6, x4

# qhasm: tmp = vv * g
# asm 1: mul >tmp=int64#14,<vv=int64#10,<g=int64#6
# asm 2: mul >tmp=x13,<vv=x9,<g=x5
mul x13,x9,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#12, <prod_lo=int64#12, <tmp=int64#14
# asm 2: adds <prod_lo=x11, <prod_lo=x11, <tmp=x13
adds x11, x11, x13

# qhasm: tmp = vv signed* g (hi)
# asm 1: smulh >tmp=int64#14, <vv=int64#10, <g=int64#6
# asm 2: smulh >tmp=x13, <vv=x9, <g=x5
smulh x13, x9, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#13,<prod_hi=int64#13,<tmp=int64#14
# asm 2: adc >prod_hi=x12,<prod_hi=x12,<tmp=x13
adc x12,x12,x13

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#12, <prod_lo=int64#12, #20
# asm 2: lsr >prod_lo=x11, <prod_lo=x11, #20
lsr x11, x11, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#13, <prod_hi=int64#13, #44
# asm 2: lsl >prod_hi=x12, <prod_hi=x12, #44
lsl x12, x12, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#12, <prod_lo=int64#12, <prod_hi=int64#13
# asm 2: orr >new_f=x11, <prod_lo=x11, <prod_hi=x12
orr x11, x11, x12

# qhasm: prod_lo = rr * f
# asm 1: mul >prod_lo=int64#13,<rr=int64#8,<f=int64#5
# asm 2: mul >prod_lo=x12,<rr=x7,<f=x4
mul x12,x7,x4

# qhasm: prod_hi = rr signed* f (hi)
# asm 1: smulh >prod_hi=int64#5, <rr=int64#8, <f=int64#5
# asm 2: smulh >prod_hi=x4, <rr=x7, <f=x4
smulh x4, x7, x4

# qhasm: tmp = ss * g
# asm 1: mul >tmp=int64#14,<ss=int64#11,<g=int64#6
# asm 2: mul >tmp=x13,<ss=x10,<g=x5
mul x13,x10,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#13, <prod_lo=int64#13, <tmp=int64#14
# asm 2: adds <prod_lo=x12, <prod_lo=x12, <tmp=x13
adds x12, x12, x13

# qhasm: tmp = ss signed* g (hi)
# asm 1: smulh >tmp=int64#6, <ss=int64#11, <g=int64#6
# asm 2: smulh >tmp=x5, <ss=x10, <g=x5
smulh x5, x10, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#5,<prod_hi=int64#5,<tmp=int64#6
# asm 2: adc >prod_hi=x4,<prod_hi=x4,<tmp=x5
adc x4,x4,x5

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#6, <prod_lo=int64#13, #20
# asm 2: lsr >prod_lo=x5, <prod_lo=x12, #20
lsr x5, x12, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#5, <prod_hi=int64#5, #44
# asm 2: lsl >prod_hi=x4, <prod_hi=x4, #44
lsl x4, x4, #44

# qhasm: g = prod_lo | prod_hi
# asm 1: orr >g=int64#5, <prod_lo=int64#6, <prod_hi=int64#5
# asm 2: orr >g=x4, <prod_lo=x5, <prod_hi=x4
orr x4, x5, x4

# qhasm: f = new_f
# asm 1: mov >f=int64#6,<new_f=int64#12
# asm 2: mov >f=x5,<new_f=x11
mov x5,x11

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#12, <f=int64#6, #1048575
# asm 2: and >fuv=x11, <f=x5, #1048575
and x11, x5, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#13, <g=int64#5, #1048575
# asm 2: and >grs=x12, <g=x4, #1048575
and x12, x4, #1048575

# qhasm: fuv -= _2p41
# asm 1: sub <fuv=int64#12,<fuv=int64#12,<_2p41=int64#1
# asm 2: sub <fuv=x11,<fuv=x11,<_2p41=x0
sub x11,x11,x0

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#13,<grs=int64#13,<2p62=int64#3
# asm 2: sub <grs=x12,<grs=x12,<2p62=x2
sub x12,x12,x2