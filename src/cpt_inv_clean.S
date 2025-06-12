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
mul x7,x11,x9
madd x7, x13, x10, x7
mul x9,x12,x9
madd x9, x14, x10, x9
mov x10,x15
mov x7,x7
mov x6,x6
mov x9,x9
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
