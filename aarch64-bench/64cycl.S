
.global _dummy
.global dummy
_dummy:
dummy:
# qhasm: f = f + f_hi << 30
# asm 1: add >f=int64#10,<f=int64#11,<f_hi=int64#10,LSL #30
# asm 2: add >f=x9,<f=x10,<f_hi=x9,LSL #30
add x9,x10,x9,LSL #30

# qhasm: g = g + g_hi << 30
# asm 1: add >g=int64#11,<g=int64#13,<g_hi=int64#12,LSL #30
# asm 2: add >g=x10,<g=x12,<g_hi=x11,LSL #30
add x10,x12,x11,LSL #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F4_F5_G4_G5=reg128#7.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F4_F5_G4_G5=v6.s[0]
smlal v18.2d,v16.2s,v6.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F4_F5_G4_G5=reg128#7.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F4_F5_G4_G5=v6.s[2]
smlal2 v18.2d,v16.4s,v6.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#6.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F2_F3_G2_G3=v5.s[1]
smlal v18.2d,v17.2s,v5.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#6.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F2_F3_G2_G3=v5.s[3]
smlal2 v18.2d,v17.4s,v5.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#6.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v5.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v5.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: vec_F2_F3_G2_G3 = vec_buffer
# asm 1: mov >vec_F2_F3_G2_G3=reg128#6.16b, <vec_buffer=reg128#6.16b
# asm 2: mov >vec_F2_F3_G2_G3=v5.16b, <vec_buffer=v5.16b
mov v5.16b, v5.16b

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#12, <f=int64#10, #1048575
# asm 2: and >fuv=x11, <f=x9, #1048575
and x11, x9, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#13, <g=int64#11, #1048575
# asm 2: and >grs=x12, <g=x10, #1048575
and x12, x10, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#12,<fuv=int64#12,<2p41=int64#8
# asm 2: sub <fuv=x11,<fuv=x11,<2p41=x7
sub x11,x11,x7

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#13,<grs=int64#13,<2p62=int64#9
# asm 2: sub <grs=x12,<grs=x12,<2p62=x8
sub x12,x12,x8

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F4_F5_G4_G5=reg128#7.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F4_F5_G4_G5=v6.s[1]
smlal v18.2d,v16.2s,v6.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F4_F5_G4_G5=reg128#7.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F4_F5_G4_G5=v6.s[3]
smlal2 v18.2d,v16.4s,v6.s[3]

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F4_F5_G4_G5=reg128#7.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F4_F5_G4_G5=v6.s[0]
smlal v18.2d,v17.2s,v6.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F4_F5_G4_G5=reg128#7.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F4_F5_G4_G5=v6.s[2]
smlal2 v18.2d,v17.4s,v6.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#20.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v19.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v19.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#20.2d, <vec_buffer=reg128#20.2d, #32
# asm 2: shl >vec_buffer=v19.2d, <vec_buffer=v19.2d, #32
shl v19.2d, v19.2d, #32

# qhasm: vec_F2_F3_G2_G3 |= vec_buffer
# asm 1: orr <vec_F2_F3_G2_G3=reg128#6.16b, <vec_F2_F3_G2_G3=reg128#6.16b, <vec_buffer=reg128#20.16b
# asm 2: orr <vec_F2_F3_G2_G3=v5.16b, <vec_F2_F3_G2_G3=v5.16b, <vec_buffer=v19.16b
orr v5.16b, v5.16b, v19.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F6_F7_G6_G7=reg128#8.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F6_F7_G6_G7=v7.s[0]
smlal v18.2d,v16.2s,v7.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F6_F7_G6_G7=reg128#8.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F6_F7_G6_G7=v7.s[2]
smlal2 v18.2d,v16.4s,v7.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F4_F5_G4_G5=reg128#7.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F4_F5_G4_G5=v6.s[1]
smlal v18.2d,v17.2s,v6.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F4_F5_G4_G5=reg128#7.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F4_F5_G4_G5=v6.s[3]
smlal2 v18.2d,v17.4s,v6.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#7.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v6.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v6.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: vec_F4_F5_G4_G5 = vec_buffer
# asm 1: mov >vec_F4_F5_G4_G5=reg128#7.16b, <vec_buffer=reg128#7.16b
# asm 2: mov >vec_F4_F5_G4_G5=v6.16b, <vec_buffer=v6.16b
mov v6.16b, v6.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F6_F7_G6_G7=reg128#8.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F6_F7_G6_G7=v7.s[1]
smlal v18.2d,v16.2s,v7.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F6_F7_G6_G7=reg128#8.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F6_F7_G6_G7=v7.s[3]
smlal2 v18.2d,v16.4s,v7.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F6_F7_G6_G7=reg128#8.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F6_F7_G6_G7=v7.s[0]
smlal v18.2d,v17.2s,v7.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F6_F7_G6_G7=reg128#8.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F6_F7_G6_G7=v7.s[2]
smlal2 v18.2d,v17.4s,v7.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#20.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v19.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v19.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#20.2d, <vec_buffer=reg128#20.2d, #32
# asm 2: shl >vec_buffer=v19.2d, <vec_buffer=v19.2d, #32
shl v19.2d, v19.2d, #32

# qhasm: vec_F4_F5_G4_G5 |= vec_buffer
# asm 1: orr <vec_F4_F5_G4_G5=reg128#7.16b, <vec_F4_F5_G4_G5=reg128#7.16b, <vec_buffer=reg128#20.16b
# asm 2: orr <vec_F4_F5_G4_G5=v6.16b, <vec_F4_F5_G4_G5=v6.16b, <vec_buffer=v19.16b
orr v6.16b, v6.16b, v19.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F8_F9_G8_G9=reg128#9.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F8_F9_G8_G9=v8.s[0]
smlal v18.2d,v16.2s,v8.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F8_F9_G8_G9=reg128#9.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F8_F9_G8_G9=v8.s[2]
smlal2 v18.2d,v16.4s,v8.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F6_F7_G6_G7=reg128#8.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F6_F7_G6_G7=v7.s[1]
smlal v18.2d,v17.2s,v7.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F6_F7_G6_G7=reg128#8.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F6_F7_G6_G7=v7.s[3]
smlal2 v18.2d,v17.4s,v7.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#8.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v7.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v7.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: vec_F6_F7_G6_G7 = vec_buffer
# asm 1: mov >vec_F6_F7_G6_G7=reg128#8.16b, <vec_buffer=reg128#8.16b
# asm 2: mov >vec_F6_F7_G6_G7=v7.16b, <vec_buffer=v7.16b
mov v7.16b, v7.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F8_F9_G8_G9=reg128#9.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F8_F9_G8_G9=v8.s[0]
smlal v18.2d,v17.2s,v8.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F8_F9_G8_G9=reg128#9.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F8_F9_G8_G9=v8.s[2]
smlal2 v18.2d,v17.4s,v8.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#9.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v8.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v8.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#9.2d, <vec_buffer=reg128#9.2d, #32
# asm 2: shl >vec_buffer=v8.2d, <vec_buffer=v8.2d, #32
shl v8.2d, v8.2d, #32

# qhasm: vec_F6_F7_G6_G7 |= vec_buffer
# asm 1: orr <vec_F6_F7_G6_G7=reg128#8.16b, <vec_F6_F7_G6_G7=reg128#8.16b, <vec_buffer=reg128#9.16b
# asm 2: orr <vec_F6_F7_G6_G7=v7.16b, <vec_F6_F7_G6_G7=v7.16b, <vec_buffer=v8.16b
orr v7.16b, v7.16b, v8.16b

# qhasm: vec_F8_F9_G8_G9 = vec_prod
# asm 1: mov >vec_F8_F9_G8_G9=reg128#9.16b, <vec_prod=reg128#19.16b
# asm 2: mov >vec_F8_F9_G8_G9=v8.16b, <vec_prod=v18.16b
mov v8.16b, v18.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: reg128 final_add_0

# qhasm: reg128 final_add_1

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smull >vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V0_V1_S0_S1=reg128#10.s[0]
# asm 2: smull >vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V0_V1_S0_S1=v9.s[0]
smull v18.2d,v16.2s,v9.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V0_V1_S0_S1=reg128#10.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V0_V1_S0_S1=v9.s[2]
smlal2 v18.2d,v16.4s,v9.s[2]

ret