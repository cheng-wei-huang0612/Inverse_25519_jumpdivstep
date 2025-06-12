smlal v19.2d,v18.2s,v15.s[0]
smlal2 v19.2d,v18.4s,v15.s[2]
add v19.2d, v19.2d, v21.2d
and v15.16b, v19.16b, v6.16b
shl v15.2d, v15.2d, #32
orr v14.16b, v14.16b, v15.16b
sshr v15.2d, v19.2d, #30
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sshr v16.2d, v15.2d, #15
and v15.16b, v15.16b, v7.16b
mul v19.4s,v3.4s,v16.4s
and v19.16b, v19.16b, v5.16b
add v10.4s, v10.4s, v19.4s
sub x9,x3,#1
tst x7, #1
csel x10, x6, xzr, ne
tst x9, x7, ror #1
csneg x3, x9, x3, pl
csel x6, x7, x6, mi
csneg x10, x10, x10, pl
add x7,x7,x10
asr x7, x7, #1
sshr v16.4s, v10.4s, #30
shl v16.2d, v16.2d, #32
add v10.4s, v10.4s, v16.4s
sshr v16.4s, v10.4s, #30
ushr v16.2d, v16.2d, #32
and v10.16b, v10.16b, v8.16b
add v11.4s, v11.4s, v16.4s
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
