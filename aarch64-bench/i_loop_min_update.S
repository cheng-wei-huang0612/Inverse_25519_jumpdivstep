
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
.global _i_loop_min_update
.global i_loop_min_update
_i_loop_min_update:
i_loop_min_update:





# qhasm: main_i_loop:

# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#15, <uu=int64#10, #0, #30
# asm 2: ubfx >uu0=x14, <uu=x9, #0, #30
ubfx x14, x9, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#10, <uu=int64#10, #30, #32
# asm 2: ubfx >uu1=x9, <uu=x9, #30, #32
ubfx x9, x9, #30, #32


# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#16, <vv=int64#11, #0, #30
# asm 2: ubfx >vv0=x15, <vv=x10, #0, #30
ubfx x15, x10, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#11, <vv=int64#11, #30, #32
# asm 2: ubfx >vv1=x10, <vv=x10, #30, #32
ubfx x10, x10, #30, #32

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#17, <rr=int64#12, #0, #30
# asm 2: ubfx >rr0=x16, <rr=x11, #0, #30
ubfx x16, x11, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#12, <rr=int64#12, #30, #32
# asm 2: ubfx >rr1=x11, <rr=x11, #30, #32
ubfx x11, x11, #30, #32

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#18, <ss=int64#13, #0, #30
# asm 2: ubfx >ss0=x17, <ss=x12, #0, #30
ubfx x17, x12, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#13, <ss=int64#13, #30, #32
# asm 2: ubfx >ss1=x12, <ss=x12, #30, #32
ubfx x12, x12, #30, #32

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[0], <uu0=int64#15%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[0], <uu0=w14
ins v17.s[0], w14

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[1], <rr0=int64#17%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[1], <rr0=w16
ins v17.s[1], w16

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[2], <vv0=int64#16%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[2], <vv0=w15
ins v17.s[2], w15

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[3], <ss0=int64#18%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[3], <ss0=w17
ins v17.s[3], w17

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[0], <uu1=int64#10%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[0], <uu1=w9
ins v18.s[0], w9

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[1], <rr1=int64#12%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[1], <rr1=w11
ins v18.s[1], w11

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[2], <vv1=int64#11%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[2], <vv1=w10
ins v18.s[2], w10

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[3], <ss1=int64#13%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[3], <ss1=w12
ins v18.s[3], w12

# qhasm: reg128 vec_buffer

# qhasm: reg128 vec_prod

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smull >vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#7.s[0]
# asm 2: smull >vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F0_F1_G0_G1=v6.s[0]
smull v19.2d,v17.2s,v6.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#7.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F0_F1_G0_G1=v6.s[2]
smlal2 v19.2d,v17.4s,v6.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#7.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F0_F1_G0_G1=v6.s[1]
smlal v19.2d,v17.2s,v6.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#7.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F0_F1_G0_G1=v6.s[3]
smlal2 v19.2d,v17.4s,v6.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F0_F1_G0_G1=reg128#7.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F0_F1_G0_G1=v6.s[0]
smlal v19.2d,v18.2s,v6.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F0_F1_G0_G1=reg128#7.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F0_F1_G0_G1=v6.s[2]
smlal2 v19.2d,v18.4s,v6.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#8.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F2_F3_G2_G3=v7.s[0]
smlal v19.2d,v17.2s,v7.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#8.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F2_F3_G2_G3=v7.s[2]
smlal2 v19.2d,v17.4s,v7.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F0_F1_G0_G1=reg128#7.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F0_F1_G0_G1=v6.s[1]
smlal v19.2d,v18.2s,v6.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F0_F1_G0_G1=reg128#7.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F0_F1_G0_G1=v6.s[3]
smlal2 v19.2d,v18.4s,v6.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#7.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v6.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v1.16b
and v6.16b, v19.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: vec_F0_F1_G0_G1 = vec_buffer
# asm 1: mov >vec_F0_F1_G0_G1=reg128#7.16b, <vec_buffer=reg128#7.16b
# asm 2: mov >vec_F0_F1_G0_G1=v6.16b, <vec_buffer=v6.16b
mov v6.16b, v6.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#8.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F2_F3_G2_G3=v7.s[1]
smlal v19.2d,v17.2s,v7.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#8.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F2_F3_G2_G3=v7.s[3]
smlal2 v19.2d,v17.4s,v7.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F2_F3_G2_G3=reg128#8.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F2_F3_G2_G3=v7.s[0]
smlal v19.2d,v18.2s,v7.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F2_F3_G2_G3=reg128#8.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F2_F3_G2_G3=v7.s[2]
smlal2 v19.2d,v18.4s,v7.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#21.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v20.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v1.16b
and v20.16b, v19.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#21.2d, <vec_buffer=reg128#21.2d, #32
# asm 2: shl >vec_buffer=v20.2d, <vec_buffer=v20.2d, #32
shl v20.2d, v20.2d, #32

# qhasm: vec_F0_F1_G0_G1 |= vec_buffer
# asm 1: orr <vec_F0_F1_G0_G1=reg128#7.16b, <vec_F0_F1_G0_G1=reg128#7.16b, <vec_buffer=reg128#21.16b
# asm 2: orr <vec_F0_F1_G0_G1=v6.16b, <vec_F0_F1_G0_G1=v6.16b, <vec_buffer=v20.16b
orr v6.16b, v6.16b, v20.16b

# qhasm:             f_hi = vec_F0_F1_G0_G1[1/4]
# asm 1: smov >f_hi=int64#10, <vec_F0_F1_G0_G1=reg128#7.s[1]
# asm 2: smov >f_hi=x9, <vec_F0_F1_G0_G1=v6.s[1]
smov x9, v6.s[1]

# qhasm:             f = vec_F0_F1_G0_G1[0/4]
# asm 1: smov >f=int64#11, <vec_F0_F1_G0_G1=reg128#7.s[0]
# asm 2: smov >f=x10, <vec_F0_F1_G0_G1=v6.s[0]
smov x10, v6.s[0]

# qhasm:             g_hi = vec_F0_F1_G0_G1[3/4]
# asm 1: smov >g_hi=int64#12, <vec_F0_F1_G0_G1=reg128#7.s[3]
# asm 2: smov >g_hi=x11, <vec_F0_F1_G0_G1=v6.s[3]
smov x11, v6.s[3]

# qhasm:             g = vec_F0_F1_G0_G1[2/4]
# asm 1: smov >g=int64#13, <vec_F0_F1_G0_G1=reg128#7.s[2]
# asm 2: smov >g=x12, <vec_F0_F1_G0_G1=v6.s[2]
smov x12, v6.s[2]

# qhasm:             f = f + f_hi << 30
# asm 1: add >f=int64#10,<f=int64#11,<f_hi=int64#10,LSL #30
# asm 2: add >f=x9,<f=x10,<f_hi=x9,LSL #30
add x9,x10,x9,LSL #30

# qhasm:             g = g + g_hi << 30
# asm 1: add >g=int64#11,<g=int64#13,<g_hi=int64#12,LSL #30
# asm 2: add >g=x10,<g=x12,<g_hi=x11,LSL #30
add x10,x12,x11,LSL #30

# qhasm:             fuv = f & 1048575
# asm 1: and >fuv=int64#12, <f=int64#10, #1048575
# asm 2: and >fuv=x11, <f=x9, #1048575
and x11, x9, #1048575

# qhasm:             grs = g & 1048575
# asm 1: and >grs=int64#13, <g=int64#11, #1048575
# asm 2: and >grs=x12, <g=x10, #1048575
and x12, x10, #1048575

# qhasm:             fuv -= 2p41
# asm 1: sub <fuv=int64#12,<fuv=int64#12,<2p41=int64#8
# asm 2: sub <fuv=x11,<fuv=x11,<2p41=x7
sub x11,x11,x7

# qhasm:             grs -= 2p62
# asm 1: sub <grs=int64#13,<grs=int64#13,<2p62=int64#9
# asm 2: sub <grs=x12,<grs=x12,<2p62=x8
sub x12,x12,x8

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#15,<m=int64#14,#1
# asm 2: sub >m1=x14,<m=x13,#1
sub x14,x13,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#16, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x15, <fuv=x11, xzr, ne
csel x15, x11, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#15, <grs=int64#13, ROR #1
# asm 2: tst <m1=x14, <grs=x12, ROR #1
tst x14, x12, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#15, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x14, <m=x13, pl
csneg x13, x14, x13, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#16, <ff=int64#16, <ff=int64#16, pl
# asm 2: csneg >ff=x15, <ff=x15, <ff=x15, pl
csneg x15, x15, x15, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#16
# asm 2: add >grs=x12,<grs=x12,<ff=x15
add x12,x12,x15

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: vv = fuv
# asm 1: mov >vv=int64#15,<fuv=int64#12
# asm 2: mov >vv=x14,<fuv=x11
mov x14,x11

# qhasm: vv = vv + 1048576
# asm 1: add >vv=int64#15,<vv=int64#15,#1048576
# asm 2: add >vv=x14,<vv=x14,#1048576
add x14,x14,#1048576

# qhasm: vv = vv + 2p41
# asm 1: add >vv=int64#15,<vv=int64#15,<2p41=int64#8
# asm 2: add >vv=x14,<vv=x14,<2p41=x7
add x14,x14,x7

# qhasm: vv = vv signed>> 42
# asm 1: asr >vv=int64#15, <vv=int64#15, #42
# asm 2: asr >vv=x14, <vv=x14, #42
asr x14, x14, #42

# qhasm: uu = fuv + 1048576
# asm 1: add >uu=int64#12,<fuv=int64#12,#1048576
# asm 2: add >uu=x11,<fuv=x11,#1048576
add x11,x11,#1048576

# qhasm: uu = uu << 22
# asm 1: lsl >uu=int64#12, <uu=int64#12, #22
# asm 2: lsl >uu=x11, <uu=x11, #22
lsl x11, x11, #22

# qhasm: uu = uu signed>> 43
# asm 1: asr >uu=int64#12, <uu=int64#12, #43
# asm 2: asr >uu=x11, <uu=x11, #43
asr x11, x11, #43

# qhasm: ss = grs
# asm 1: mov >ss=int64#16,<grs=int64#13
# asm 2: mov >ss=x15,<grs=x12
mov x15,x12

# qhasm: ss = ss + 1048576
# asm 1: add >ss=int64#16,<ss=int64#16,#1048576
# asm 2: add >ss=x15,<ss=x15,#1048576
add x15,x15,#1048576

# qhasm: ss = ss + 2p41
# asm 1: add >ss=int64#16,<ss=int64#16,<2p41=int64#8
# asm 2: add >ss=x15,<ss=x15,<2p41=x7
add x15,x15,x7

# qhasm: ss = ss signed>> 42
# asm 1: asr >ss=int64#16, <ss=int64#16, #42
# asm 2: asr >ss=x15, <ss=x15, #42
asr x15, x15, #42

# qhasm: rr = grs + 1048576
# asm 1: add >rr=int64#13,<grs=int64#13,#1048576
# asm 2: add >rr=x12,<grs=x12,#1048576
add x12,x12,#1048576

# qhasm: rr = rr << 22
# asm 1: lsl >rr=int64#13, <rr=int64#13, #22
# asm 2: lsl >rr=x12, <rr=x12, #22
lsl x12, x12, #22

# qhasm: rr = rr signed>> 43
# asm 1: asr >rr=int64#13, <rr=int64#13, #43
# asm 2: asr >rr=x12, <rr=x12, #43
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

# qhasm: prod_lo = uu * f
# asm 1: mul >prod_lo=int64#17,<uu=int64#12,<f=int64#10
# asm 2: mul >prod_lo=x16,<uu=x11,<f=x9
mul x16,x11,x9

# qhasm: prod_hi = uu signed* f (hi)
# asm 1: smulh >prod_hi=int64#18, <uu=int64#12, <f=int64#10
# asm 2: smulh >prod_hi=x17, <uu=x11, <f=x9
smulh x17, x11, x9

# qhasm: tmp = vv * g
# asm 1: mul >tmp=int64#19,<vv=int64#15,<g=int64#11
# asm 2: mul >tmp=x18,<vv=x14,<g=x10
mul x18,x14,x10

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#17, <prod_lo=int64#17, <tmp=int64#19
# asm 2: adds <prod_lo=x16, <prod_lo=x16, <tmp=x18
adds x16, x16, x18

# qhasm: tmp = vv signed* g (hi)
# asm 1: smulh >tmp=int64#19, <vv=int64#15, <g=int64#11
# asm 2: smulh >tmp=x18, <vv=x14, <g=x10
smulh x18, x14, x10

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#18,<prod_hi=int64#18,<tmp=int64#19
# asm 2: adc >prod_hi=x17,<prod_hi=x17,<tmp=x18
adc x17,x17,x18

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#17, <prod_lo=int64#17, #20
# asm 2: lsr >prod_lo=x16, <prod_lo=x16, #20
lsr x16, x16, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#18, <prod_hi=int64#18, #44
# asm 2: lsl >prod_hi=x17, <prod_hi=x17, #44
lsl x17, x17, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#17, <prod_lo=int64#17, <prod_hi=int64#18
# asm 2: orr >new_f=x16, <prod_lo=x16, <prod_hi=x17
orr x16, x16, x17

# qhasm: prod_lo = rr * f
# asm 1: mul >prod_lo=int64#18,<rr=int64#13,<f=int64#10
# asm 2: mul >prod_lo=x17,<rr=x12,<f=x9
mul x17,x12,x9

# qhasm: prod_hi = rr signed* f (hi)
# asm 1: smulh >prod_hi=int64#10, <rr=int64#13, <f=int64#10
# asm 2: smulh >prod_hi=x9, <rr=x12, <f=x9
smulh x9, x12, x9

# qhasm: tmp = ss * g
# asm 1: mul >tmp=int64#19,<ss=int64#16,<g=int64#11
# asm 2: mul >tmp=x18,<ss=x15,<g=x10
mul x18,x15,x10

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#18, <prod_lo=int64#18, <tmp=int64#19
# asm 2: adds <prod_lo=x17, <prod_lo=x17, <tmp=x18
adds x17, x17, x18

# qhasm: tmp = ss signed* g (hi)
# asm 1: smulh >tmp=int64#11, <ss=int64#16, <g=int64#11
# asm 2: smulh >tmp=x10, <ss=x15, <g=x10
smulh x10, x15, x10

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#10,<prod_hi=int64#10,<tmp=int64#11
# asm 2: adc >prod_hi=x9,<prod_hi=x9,<tmp=x10
adc x9,x9,x10

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#11, <prod_lo=int64#18, #20
# asm 2: lsr >prod_lo=x10, <prod_lo=x17, #20
lsr x10, x17, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#10, <prod_hi=int64#10, #44
# asm 2: lsl >prod_hi=x9, <prod_hi=x9, #44
lsl x9, x9, #44

# qhasm: g = prod_lo | prod_hi
# asm 1: orr >g=int64#10, <prod_lo=int64#11, <prod_hi=int64#10
# asm 2: orr >g=x9, <prod_lo=x10, <prod_hi=x9
orr x9, x10, x9

# qhasm: f = new_f
# asm 1: mov >f=int64#11,<new_f=int64#17
# asm 2: mov >f=x10,<new_f=x16
mov x10,x16

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#17, <f=int64#11, #1048575
# asm 2: and >fuv=x16, <f=x10, #1048575
and x16, x10, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#18, <g=int64#10, #1048575
# asm 2: and >grs=x17, <g=x9, #1048575
and x17, x9, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#17,<fuv=int64#17,<2p41=int64#8
# asm 2: sub <fuv=x16,<fuv=x16,<2p41=x7
sub x16,x16,x7

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#18,<grs=int64#18,<2p62=int64#9
# asm 2: sub <grs=x17,<grs=x17,<2p62=x8
sub x17,x17,x8

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1
# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne

csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#18, #1
# asm 2: tst <grs=x17, #1
tst x17, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#20, <fuv=int64#17, xzr, ne
# asm 2: csel >ff=x19, <fuv=x16, xzr, ne
csel x19, x16, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#18, ROR #1
# asm 2: tst <m1=x18, <grs=x17, ROR #1
tst x18, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#17, <grs=int64#18, <fuv=int64#17, mi
# asm 2: csel >fuv=x16, <grs=x17, <fuv=x16, mi
csel x16, x17, x16, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#20, <ff=int64#20, <ff=int64#20, pl
# asm 2: csneg >ff=x19, <ff=x19, <ff=x19, pl
csneg x19, x19, x19, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#18,<grs=int64#18,<ff=int64#20
# asm 2: add >grs=x17,<grs=x17,<ff=x19
add x17,x17,x19

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#19,<fuv=int64#17
# asm 2: mov >v=x18,<fuv=x16
mov x18,x16

# qhasm: v = v + 1048576
# asm 1: add >v=int64#19,<v=int64#19,#1048576
# asm 2: add >v=x18,<v=x18,#1048576
add x18,x18,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#19,<v=int64#19,<2p41=int64#8
# asm 2: add >v=x18,<v=x18,<2p41=x7
add x18,x18,x7

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#19, <v=int64#19, #42
# asm 2: asr >v=x18, <v=x18, #42
asr x18, x18, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#17,<fuv=int64#17,#1048576
# asm 2: add >u=x16,<fuv=x16,#1048576
add x16,x16,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#17, <u=int64#17, #22
# asm 2: lsl >u=x16, <u=x16, #22
lsl x16, x16, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#17, <u=int64#17, #43
# asm 2: asr >u=x16, <u=x16, #43
asr x16, x16, #43

# qhasm: s = grs
# asm 1: mov >s=int64#20,<grs=int64#18
# asm 2: mov >s=x19,<grs=x17
mov x19,x17

# qhasm: s = s + 1048576
# asm 1: add >s=int64#20,<s=int64#20,#1048576
# asm 2: add >s=x19,<s=x19,#1048576
add x19,x19,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#20,<s=int64#20,<2p41=int64#8
# asm 2: add >s=x19,<s=x19,<2p41=x7
add x19,x19,x7

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#20, <s=int64#20, #42
# asm 2: asr >s=x19, <s=x19, #42
asr x19, x19, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#18,<grs=int64#18,#1048576
# asm 2: add >r=x17,<grs=x17,#1048576
add x17,x17,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#18, <r=int64#18, #22
# asm 2: lsl >r=x17, <r=x17, #22
lsl x17, x17, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#18, <r=int64#18, #43
# asm 2: asr >r=x17, <r=x17, #43
asr x17, x17, #43

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#21,<u=int64#17,<f=int64#11
# asm 2: mul >prod_lo=x20,<u=x16,<f=x10
mul x20,x16,x10

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#22, <u=int64#17, <f=int64#11
# asm 2: smulh >prod_hi=x21, <u=x16, <f=x10
smulh x21, x16, x10

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#23,<v=int64#19,<g=int64#10
# asm 2: mul >tmp=x22,<v=x18,<g=x9
mul x22,x18,x9

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#21, <prod_lo=int64#21, <tmp=int64#23
# asm 2: adds <prod_lo=x20, <prod_lo=x20, <tmp=x22
adds x20, x20, x22

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#23, <v=int64#19, <g=int64#10
# asm 2: smulh >tmp=x22, <v=x18, <g=x9
smulh x22, x18, x9

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#22,<prod_hi=int64#22,<tmp=int64#23
# asm 2: adc >prod_hi=x21,<prod_hi=x21,<tmp=x22
adc x21,x21,x22

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#21, <prod_lo=int64#21, #20
# asm 2: lsr >prod_lo=x20, <prod_lo=x20, #20
lsr x20, x20, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#22, <prod_hi=int64#22, #44
# asm 2: lsl >prod_hi=x21, <prod_hi=x21, #44
lsl x21, x21, #44

# qhasm: new_f = prod_lo 
# asm 1: mov >new_f=int64#21,<prod_lo=int64#21
# asm 2: mov >new_f=x20,<prod_lo=x20
mov x20,x20

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#23,<r=int64#18,<f=int64#11
# asm 2: mul >prod_lo=x22,<r=x17,<f=x10
mul x22,x17,x10

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#11, <r=int64#18, <f=int64#11
# asm 2: smulh >prod_hi=x10, <r=x17, <f=x10
smulh x10, x17, x10

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#24,<s=int64#20,<g=int64#10
# asm 2: mul >tmp=x23,<s=x19,<g=x9
mul x23,x19,x9

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#23, <prod_lo=int64#23, <tmp=int64#24
# asm 2: adds <prod_lo=x22, <prod_lo=x22, <tmp=x23
adds x22, x22, x23

# qhasm: tmp = s signed* g (hi)
# asm 1: smulh >tmp=int64#10, <s=int64#20, <g=int64#10
# asm 2: smulh >tmp=x9, <s=x19, <g=x9
smulh x9, x19, x9

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#10,<prod_hi=int64#11,<tmp=int64#10
# asm 2: adc >prod_hi=x9,<prod_hi=x10,<tmp=x9
adc x9,x10,x9

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#11, <prod_lo=int64#23, #20
# asm 2: lsr >prod_lo=x10, <prod_lo=x22, #20
lsr x10, x22, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#23, <prod_hi=int64#10, #44
# asm 2: lsl >prod_hi=x22, <prod_hi=x9, #44
lsl x22, x9, #44

# qhasm: new_g = prod_lo 
# asm 1: mov >new_g=int64#10,<prod_lo=int64#11
# asm 2: mov >new_g=x9,<prod_lo=x10
mov x9,x10

# qhasm: f = new_f
# asm 1: mov >f=int64#11,<new_f=int64#21
# asm 2: mov >f=x10,<new_f=x20
mov x10,x20

# qhasm: g = new_g
# asm 1: mov >g=int64#10,<new_g=int64#10
# asm 2: mov >g=x9,<new_g=x9
mov x9,x9

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#21,<u=int64#17,<uu=int64#12
# asm 2: mul >tmp=x20,<u=x16,<uu=x11
mul x20,x16,x11

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#21, <v=int64#19, <rr=int64#13, <tmp=int64#21
# asm 2: madd >new_uu=x20, <v=x18, <rr=x12, <tmp=x20
madd x20, x18, x12, x20

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#12,<r=int64#18,<uu=int64#12
# asm 2: mul >tmp=x11,<r=x17,<uu=x11
mul x11,x17,x11

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#12, <s=int64#20, <rr=int64#13, <tmp=int64#12
# asm 2: madd >new_rr=x11, <s=x19, <rr=x12, <tmp=x11
madd x11, x19, x12, x11

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#13,<u=int64#17,<vv=int64#15
# asm 2: mul >tmp=x12,<u=x16,<vv=x14
mul x12,x16,x14

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#13, <v=int64#19, <ss=int64#16, <tmp=int64#13
# asm 2: madd >new_vv=x12, <v=x18, <ss=x15, <tmp=x12
madd x12, x18, x15, x12

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#15,<r=int64#18,<vv=int64#15
# asm 2: mul >tmp=x14,<r=x17,<vv=x14
mul x14,x17,x14

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#15, <s=int64#20, <ss=int64#16, <tmp=int64#15
# asm 2: madd >new_ss=x14, <s=x19, <ss=x15, <tmp=x14
madd x14, x19, x15, x14

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#16,<new_uu=int64#21
# asm 2: mov >uu=x15,<new_uu=x20
mov x15,x20

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#13,<new_vv=int64#13
# asm 2: mov >vv=x12,<new_vv=x12
mov x12,x12

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#12,<new_rr=int64#12
# asm 2: mov >rr=x11,<new_rr=x11
mov x11,x11

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#15,<new_ss=int64#15
# asm 2: mov >ss=x14,<new_ss=x14
mov x14,x14

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#11, <f=int64#11, #1048575
# asm 2: and >fuv=x10, <f=x10, #1048575
and x10, x10, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#10, <g=int64#10, #1048575
# asm 2: and >grs=x9, <g=x9, #1048575
and x9, x9, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#11,<fuv=int64#11,<2p41=int64#8
# asm 2: sub <fuv=x10,<fuv=x10,<2p41=x7
sub x10,x10,x7

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#10,<grs=int64#10,<2p62=int64#9
# asm 2: sub <grs=x9,<grs=x9,<2p62=x8
sub x9,x9,x8

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#10, #1
# asm 2: tst <grs=x9, #1
tst x9, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#18, <fuv=int64#11, xzr, ne
# asm 2: csel >ff=x17, <fuv=x10, xzr, ne
csel x17, x10, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#10, ROR #1
# asm 2: tst <m1=x16, <grs=x9, ROR #1
tst x16, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#11, <grs=int64#10, <fuv=int64#11, mi
# asm 2: csel >fuv=x10, <grs=x9, <fuv=x10, mi
csel x10, x9, x10, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#18, <ff=int64#18, <ff=int64#18, pl
# asm 2: csneg >ff=x17, <ff=x17, <ff=x17, pl
csneg x17, x17, x17, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#10,<grs=int64#10,<ff=int64#18
# asm 2: add >grs=x9,<grs=x9,<ff=x17
add x9,x9,x17

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#10, <grs=int64#10, #1
# asm 2: asr >grs=x9, <grs=x9, #1
asr x9, x9, #1

# qhasm:     free m1

# qhasm:     free ff



# qhasm: v = fuv
# asm 1: mov >v=int64#17,<fuv=int64#11
# asm 2: mov >v=x16,<fuv=x10
mov x16,x10

# qhasm: v = v + 1048576
# asm 1: add >v=int64#17,<v=int64#17,#1048576
# asm 2: add >v=x16,<v=x16,#1048576
add x16,x16,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#17,<v=int64#17,<2p41=int64#8
# asm 2: add >v=x16,<v=x16,<2p41=x7
add x16,x16,x7

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#17, <v=int64#17, #42
# asm 2: asr >v=x16, <v=x16, #42
asr x16, x16, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#11,<fuv=int64#11,#1048576
# asm 2: add >u=x10,<fuv=x10,#1048576
add x10,x10,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#11, <u=int64#11, #22
# asm 2: lsl >u=x10, <u=x10, #22
lsl x10, x10, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#11, <u=int64#11, #43
# asm 2: asr >u=x10, <u=x10, #43
asr x10, x10, #43

# qhasm: s = grs
# asm 1: mov >s=int64#18,<grs=int64#10
# asm 2: mov >s=x17,<grs=x9
mov x17,x9

# qhasm: s = s + 1048576
# asm 1: add >s=int64#18,<s=int64#18,#1048576
# asm 2: add >s=x17,<s=x17,#1048576
add x17,x17,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#18,<s=int64#18,<2p41=int64#8
# asm 2: add >s=x17,<s=x17,<2p41=x7
add x17,x17,x7

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#18, <s=int64#18, #42
# asm 2: asr >s=x17, <s=x17, #42
asr x17, x17, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#10,<grs=int64#10,#1048576
# asm 2: add >r=x9,<grs=x9,#1048576
add x9,x9,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#10, <r=int64#10, #22
# asm 2: lsl >r=x9, <r=x9, #22
lsl x9, x9, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#10, <r=int64#10, #43
# asm 2: asr >r=x9, <r=x9, #43
asr x9, x9, #43

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#19,<u=int64#11,<uu=int64#16
# asm 2: mul >tmp=x18,<u=x10,<uu=x15
mul x18,x10,x15

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#19, <v=int64#17, <rr=int64#12, <tmp=int64#19
# asm 2: madd >new_uu=x18, <v=x16, <rr=x11, <tmp=x18
madd x18, x16, x11, x18

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#16,<r=int64#10,<uu=int64#16
# asm 2: mul >tmp=x15,<r=x9,<uu=x15
mul x15,x9,x15

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#12, <s=int64#18, <rr=int64#12, <tmp=int64#16
# asm 2: madd >new_rr=x11, <s=x17, <rr=x11, <tmp=x15
madd x11, x17, x11, x15

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#11,<u=int64#11,<vv=int64#13
# asm 2: mul >tmp=x10,<u=x10,<vv=x12
mul x10,x10,x12

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#11, <v=int64#17, <ss=int64#15, <tmp=int64#11
# asm 2: madd >new_vv=x10, <v=x16, <ss=x14, <tmp=x10
madd x10, x16, x14, x10

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#10,<r=int64#10,<vv=int64#13
# asm 2: mul >tmp=x9,<r=x9,<vv=x12
mul x9,x9,x12

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#13, <s=int64#18, <ss=int64#15, <tmp=int64#10
# asm 2: madd >new_ss=x12, <s=x17, <ss=x14, <tmp=x9
madd x12, x17, x14, x9

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#10,<new_uu=int64#19
# asm 2: mov >uu=x9,<new_uu=x18
mov x9,x18

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#11,<new_vv=int64#11
# asm 2: mov >vv=x10,<new_vv=x10
mov x10,x10

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#12,<new_rr=int64#12
# asm 2: mov >rr=x11,<new_rr=x11
mov x11,x11

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#13,<new_ss=int64#13
# asm 2: mov >ss=x12,<new_ss=x12
mov x12,x12



# qhasm: ITERATION -= 1 !
# asm 1: subs <ITERATION=int64#7,<ITERATION=int64#7,#1
# asm 2: subs <ITERATION=x6,<ITERATION=x6,#1




# qhasm: return
ret
