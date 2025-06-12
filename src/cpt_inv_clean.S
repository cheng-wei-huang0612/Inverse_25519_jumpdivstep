ubfx x9, x7, #0, #30
ubfx x7, x7, #30, #32
ubfx x10, x5, #0, #30
ubfx x5, x5, #30, #32
ubfx x11, x6, #0, #30
ubfx x6, x6, #30, #32
ubfx x12, x4, #0, #30
ubfx x4, x4, #30, #32
ins v17.s[0], w9
ins v17.s[1], w11
ins v17.s[2], w10
ins v17.s[3], w12
ins v18.s[0], w7
ins v18.s[1], w6
ins v18.s[2], w5
ins v18.s[3], w4
smull v19.2d,v17.2s,v12.s[0]
smlal2 v19.2d,v17.4s,v12.s[2]
sshr v19.2d, v19.2d, #30
smlal v19.2d,v17.2s,v12.s[1]
smlal2 v19.2d,v17.4s,v12.s[3]
smlal v19.2d,v18.2s,v12.s[0]
smlal2 v19.2d,v18.4s,v12.s[2]
sshr v19.2d, v19.2d, #30
smlal v19.2d,v17.2s,v0.s[0]
smlal2 v19.2d,v17.4s,v0.s[2]
smlal v19.2d,v18.2s,v12.s[1]
smlal2 v19.2d,v18.4s,v12.s[3]
and v12.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
mov v12.16b, v12.16b
smlal v19.2d,v17.2s,v0.s[1]
smlal2 v19.2d,v17.4s,v0.s[3]
smlal v19.2d,v18.2s,v0.s[0]
smlal2 v19.2d,v18.4s,v0.s[2]
and v20.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
shl v20.2d, v20.2d, #32
orr v12.16b, v12.16b, v20.16b
smlal v19.2d,v17.2s,v4.s[0]
smlal2 v19.2d,v17.4s,v4.s[2]
smlal v19.2d,v18.2s,v0.s[1]
smlal2 v19.2d,v18.4s,v0.s[3]
and v0.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
mov v0.16b, v0.16b
smlal v19.2d,v17.2s,v4.s[1]
smlal2 v19.2d,v17.4s,v4.s[3]
smlal v19.2d,v18.2s,v4.s[0]
smlal2 v19.2d,v18.4s,v4.s[2]
and v20.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
shl v20.2d, v20.2d, #32
orr v0.16b, v0.16b, v20.16b
smlal v19.2d,v17.2s,v1.s[0]
smlal2 v19.2d,v17.4s,v1.s[2]
smlal v19.2d,v18.2s,v4.s[1]
smlal2 v19.2d,v18.4s,v4.s[3]
and v4.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
mov v4.16b, v4.16b
smlal v19.2d,v17.2s,v1.s[1]
smlal2 v19.2d,v17.4s,v1.s[3]
smlal v19.2d,v18.2s,v1.s[0]
smlal2 v19.2d,v18.4s,v1.s[2]
and v20.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
shl v20.2d, v20.2d, #32
orr v4.16b, v4.16b, v20.16b
smlal v19.2d,v17.2s,v2.s[0]
smlal2 v19.2d,v17.4s,v2.s[2]
smlal v19.2d,v18.2s,v1.s[1]
smlal2 v19.2d,v18.4s,v1.s[3]
and v1.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
mov v1.16b, v1.16b
smlal v19.2d,v18.2s,v2.s[0]
smlal2 v19.2d,v18.4s,v2.s[2]
and v2.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
shl v2.2d, v2.2d, #32
orr v1.16b, v1.16b, v2.16b
mov v2.16b, v19.16b
smull v19.2d,v17.2s,v10.s[0]
smlal2 v19.2d,v17.4s,v10.s[2]
mul v20.4s,v19.4s,v9.4s
and v20.16b, v20.16b, v6.16b
uzp1 v20.4s, v20.4s, v20.4s
smlsl v19.2d,v20.2s,v3.2s
sshll v20.2d,v20.2s,#15
sshr v19.2d, v19.2d, #30
smlal v19.2d,v17.2s,v10.s[1]
smlal2 v19.2d,v17.4s,v10.s[3]
smlal v19.2d,v18.2s,v10.s[0]
smlal2 v19.2d,v18.4s,v10.s[2]
mul v21.4s,v19.4s,v9.4s
and v21.16b, v21.16b, v6.16b
uzp1 v21.4s, v21.4s, v21.4s
smlsl v19.2d,v21.2s,v3.2s
sshll v21.2d,v21.2s,#15
sshr v19.2d, v19.2d, #30
smlal v19.2d,v17.2s,v11.s[0]
smlal2 v19.2d,v17.4s,v11.s[2]
smlal v19.2d,v18.2s,v10.s[1]
smlal2 v19.2d,v18.4s,v10.s[3]
and v10.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
smlal v19.2d,v17.2s,v11.s[1]
smlal2 v19.2d,v17.4s,v11.s[3]
smlal v19.2d,v18.2s,v11.s[0]
smlal2 v19.2d,v18.4s,v11.s[2]
and v22.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
shl v22.2d, v22.2d, #32
orr v10.16b, v10.16b, v22.16b
smlal v19.2d,v17.2s,v13.s[0]
smlal2 v19.2d,v17.4s,v13.s[2]
smlal v19.2d,v18.2s,v11.s[1]
smlal2 v19.2d,v18.4s,v11.s[3]
and v11.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
smlal v19.2d,v17.2s,v13.s[1]
smlal2 v19.2d,v17.4s,v13.s[3]
smlal v19.2d,v18.2s,v13.s[0]
smlal2 v19.2d,v18.4s,v13.s[2]
and v22.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
shl v22.2d, v22.2d, #32
orr v11.16b, v11.16b, v22.16b
smlal v19.2d,v17.2s,v14.s[0]
smlal2 v19.2d,v17.4s,v14.s[2]
smlal v19.2d,v18.2s,v13.s[1]
smlal2 v19.2d,v18.4s,v13.s[3]
and v13.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
smlal v19.2d,v17.2s,v14.s[1]
smlal2 v19.2d,v17.4s,v14.s[3]
smlal v19.2d,v18.2s,v14.s[0]
smlal2 v19.2d,v18.4s,v14.s[2]
and v22.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
shl v22.2d, v22.2d, #32
orr v13.16b, v13.16b, v22.16b
smlal v19.2d,v17.2s,v15.s[0]
smlal2 v19.2d,v17.4s,v15.s[2]
smlal v19.2d,v18.2s,v14.s[1]
smlal2 v19.2d,v18.4s,v14.s[3]
add v19.2d, v19.2d, v20.2d
and v14.16b, v19.16b, v6.16b
sshr v19.2d, v19.2d, #30
smlal v19.2d,v18.2s,v15.s[0]
smlal2 v19.2d,v18.4s,v15.s[2]
add v19.2d, v19.2d, v21.2d
and v15.16b, v19.16b, v6.16b
shl v15.2d, v15.2d, #32
orr v14.16b, v14.16b, v15.16b
sshr v15.2d, v19.2d, #30
sshr v16.2d, v15.2d, #15
and v15.16b, v15.16b, v7.16b
mul v19.4s,v3.4s,v16.4s
and v19.16b, v19.16b, v5.16b
add v10.4s, v10.4s, v19.4s
sshr v16.4s, v10.4s, #30
shl v16.2d, v16.2d, #32
add v10.4s, v10.4s, v16.4s
sshr v16.4s, v10.4s, #30
ushr v16.2d, v16.2d, #32
and v10.16b, v10.16b, v8.16b
add v11.4s, v11.4s, v16.4s
smov x4, v12.s[1]
smov x5, v12.s[0]
smov x6, v12.s[3]
smov x7, v12.s[2]
add x4,x5,x4,lsl #30
add x5,x7,x6,lsl #30
and x6, x4, #1048575
and x7, x5, #1048575
sub x6,x6,x0
sub x7,x7,x2
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
mov x9,x6
add x9,x9,#1048576
add x9,x9,x0
asr x9, x9, #42
add x6,x6,#1048576
lsl x6, x6, #22
asr x6, x6, #43
mov x10,x7
add x10,x10,#1048576
add x10,x10,x0
asr x10, x10, #42
add x7,x7,#1048576
lsl x7, x7, #22
asr x7, x7, #43
mul x11,x6,x4
smulh x12, x6, x4
mul x13,x9,x5
adds x11, x11, x13
smulh x13, x9, x5
adc x12,x12,x13
lsr x11, x11, #20
lsl x12, x12, #44
orr x11, x11, x12
mul x12,x7,x4
smulh x4, x7, x4
mul x13,x10,x5
adds x12, x12, x13
smulh x5, x10, x5
adc x4,x4,x5
lsr x5, x12, #20
lsl x4, x4, #44
orr x4, x5, x4
mov x5,x11
and x11, x5, #1048575
and x12, x4, #1048575
sub x11,x11,x0
sub x12,x12,x2
