


ldr x2, [x0, #0]
ldr x3, [x0, #8]
ldr x4, [x0, #16]
ldr x0, [x0, #24]
mov x5,x2
and x6, x5, #0x3fffffff
lsr x5, x5, #30
and x5, x5, #0x3fffffff
extr x2,x3,x2, #60
and x7, x2, #0x3fffffff
lsr x2, x2, #30
and x2, x2, #0x3fffffff
extr x3,x4,x3, #56
and x8, x3, #0x3fffffff
lsr x3, x3, #30
and x3, x3, #0x3fffffff
extr x4,x0,x4, #52
and x9, x4, #0x3fffffff
lsr x4, x4, #30
and x4, x4, #0x3fffffff
lsr x0, x0, #48
mov x10, #0
add x5,x6,x5,lsl #32
add x2,x7,x2,lsl #32
add x3,x8,x3,lsl #32
add x4,x9,x4,lsl #32
ins v0.d[0], x5
ins v0.d[1], x2
ins v1.d[0], x3
ins v1.d[1], x4
ins v2.d[0], x0
mov x0, #18
movi v3.4s, #19
sshr v4.2d, v3.2d, #32
movi v4.4s, #0
ins v4.s[0], w0
movi v5.2d, #0xffffffff
ushr v6.2d, v5.2d, #2
sshr v7.2d, v6.2d, #15
uzp1 v8.4s, v6.4s, v6.4s
mov x0, #1
lsl x0, x0, #41
mov x2, #1
lsl x2, x2, #62
movz x3, #51739
movk x3, #10347,lsl #16
dup v9.4s, w3
mov v10.16b, v8.16b
sub v4.2d,v10.2d,v4.2d
mov v10.16b, v8.16b
mov v11.16b, v7.16b
zip1 v12.2d, v4.2d, v0.2d
zip2 v0.2d, v4.2d, v0.2d
zip1 v4.2d, v10.2d, v1.2d
zip2 v1.2d, v10.2d, v1.2d
zip1 v2.2d, v11.2d, v2.2d
mov x3, #0
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
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
sub x8,x3,#1
tst x7, #1
csel x9, x6, xzr, ne
tst x8, x7, ror #1
csneg x3, x8, x3, pl
csel x6, x7, x6, mi
csneg x9, x9, x9, pl
add x7,x7,x9
asr x7, x7, #1
mov x8,x6
add x8,x8,#1048576
add x8,x8,x0
asr x8, x8, #42
add x6,x6,#1048576
lsl x6, x6, #22
asr x6, x6, #43
mov x9,x7
add x9,x9,#1048576
add x9,x9,x0
asr x9, x9, #42
add x7,x7,#1048576
lsl x7, x7, #22
asr x7, x7, #43
mul x11,x6,x4
smulh x12, x6, x4
mul x13,x8,x5
adds x11, x11, x13
smulh x13, x8, x5
adc x12,x12,x13
lsr x11, x11, #20
lsl x12, x12, #44
orr x11, x11, x12
mul x12,x7,x4
smulh x4, x7, x4
mul x13,x9,x5
adds x12, x12, x13
smulh x5, x9, x5
adc x4,x4,x5
lsr x5, x12, #20
lsl x4, x4, #44
orr x4, x5, x4
mov x5,x11
and x11, x5, #1048575
and x12, x4, #1048575
sub x11,x11,x0
sub x12,x12,x2
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
sub x13,x3,#1
tst x12, #1
csel x14, x11, xzr, ne
tst x13, x12, ror #1
csneg x3, x13, x3, pl
csel x11, x12, x11, mi
csneg x14, x14, x14, pl
add x12,x12,x14
asr x12, x12, #1
mov x13,x11
add x13,x13,#1048576
add x13,x13,x0
asr x13, x13, #42
add x11,x11,#1048576
lsl x11, x11, #22
asr x11, x11, #43
mov x14,x12
add x14,x14,#1048576
add x14,x14,x0
asr x14, x14, #42
add x12,x12,#1048576
lsl x12, x12, #22
asr x12, x12, #43
mul x15,x11,x5
mul x16,x13,x4
adds x15, x15, x16
asr x15, x15, #20
mov x15,x15
mul x5,x12,x5
mul x4,x14,x4
adds x5, x5, x4
asr x4, x5, #20
mov x4,x4
mov x5,x15
mov x4,x4
mul x15,x11,x6
madd x15, x13, x7, x15
mul x6,x12,x6
madd x6, x14, x7, x6
mul x7,x11,x8
madd x7, x13, x9, x7
mul x8,x12,x8
madd x8, x14, x9, x8
mov x9,x15
mov x7,x7
mov x6,x6
mov x8,x8
and x5, x5, #1048575
and x4, x4, #1048575
sub x5,x5,x0
sub x4,x4,x2
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
sub x11,x3,#1
tst x4, #1
csel x12, x5, xzr, ne
tst x11, x4, ror #1
csneg x3, x11, x3, pl
csel x5, x4, x5, mi
csneg x12, x12, x12, pl
add x4,x4,x12
asr x4, x4, #1
mov x11,x5
add x11,x11,#1048576
add x11,x11,x0
asr x11, x11, #42
add x5,x5,#1048576
lsl x5, x5, #22
asr x5, x5, #43
mov x12,x4
add x12,x12,#1048576
add x12,x12,x0
asr x12, x12, #42
add x4,x4,#1048576
lsl x4, x4, #22
asr x4, x4, #43
mul x13,x5,x9
madd x13, x11, x6, x13
mul x9,x4,x9
madd x6, x12, x6, x9
mul x5,x5,x7
madd x5, x11, x8, x5
mul x4,x4,x7
madd x4, x12, x8, x4
mov x7,x13
mov x5,x5
mov x6,x6
mov x4,x4
mov x8, #9
mov x9, #1
ins v10.d[0], x10
ins v10.d[1], x9
ins v11.d[0], x10
ins v11.d[1], x10
ins v13.d[0], x10
ins v13.d[1], x10
ins v14.d[0], x10
ins v14.d[1], x10
ins v15.d[0], x10
ins v15.d[1], x10
