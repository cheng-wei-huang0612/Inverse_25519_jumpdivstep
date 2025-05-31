
smull v19.2d,v18.2s,v6.s[0]
smlal2 v19.2d,v18.4s,v6.s[2]
sshr v19.2d, v19.2d, #30
smlal v19.2d,v18.2s,v6.s[1]
smlal2 v19.2d,v18.4s,v6.s[3]
smlal v19.2d,v16.2s,v6.s[0]
smlal2 v19.2d,v16.4s,v6.s[2]
sshr v19.2d, v19.2d, #30
smlal v19.2d,v18.2s,v7.s[0]
smlal2 v19.2d,v18.4s,v7.s[2]
smlal v19.2d,v16.2s,v6.s[1]
smlal2 v19.2d,v16.4s,v6.s[3]
and v6.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
mov v6.16b, v6.16b
smlal v19.2d,v18.2s,v7.s[1]
smlal2 v19.2d,v18.4s,v7.s[3]
smlal v19.2d,v16.2s,v7.s[0]
smlal2 v19.2d,v16.4s,v7.s[2]
and v20.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
shl v20.2d, v20.2d, #32
orr v6.16b, v6.16b, v20.16b
smlal v19.2d,v18.2s,v8.s[0]
smlal2 v19.2d,v18.4s,v8.s[2]
smlal v19.2d,v16.2s,v7.s[1]
smlal2 v19.2d,v16.4s,v7.s[3]
and v7.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
mov v7.16b, v7.16b
smlal v19.2d,v18.2s,v8.s[1]
smlal2 v19.2d,v18.4s,v8.s[3]
smlal v19.2d,v16.2s,v8.s[0]
smlal2 v19.2d,v16.4s,v8.s[2]
and v20.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
shl v20.2d, v20.2d, #32
orr v7.16b, v7.16b, v20.16b
smlal v19.2d,v18.2s,v9.s[0]
smlal2 v19.2d,v18.4s,v9.s[2]
smlal v19.2d,v16.2s,v8.s[1]
smlal2 v19.2d,v16.4s,v8.s[3]
and v8.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
mov v8.16b, v8.16b
smlal v19.2d,v18.2s,v9.s[1]
smlal2 v19.2d,v18.4s,v9.s[3]
smlal v19.2d,v16.2s,v9.s[0]
smlal2 v19.2d,v16.4s,v9.s[2]
and v20.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
shl v20.2d, v20.2d, #32
orr v8.16b, v8.16b, v20.16b
smlal v19.2d,v18.2s,v10.s[0]
smlal2 v19.2d,v18.4s,v10.s[2]
smlal v19.2d,v16.2s,v9.s[1]
smlal2 v19.2d,v16.4s,v9.s[3]
and v9.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
mov v9.16b, v9.16b
smlal v19.2d,v16.2s,v10.s[0]
smlal2 v19.2d,v16.4s,v10.s[2]
and v10.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
shl v10.2d, v10.2d, #32
orr v9.16b, v9.16b, v10.16b
mov v10.16b, v19.16b
smull v19.2d,v18.2s,v11.s[0]
smlal2 v19.2d,v18.4s,v11.s[2]
mul v20.4s,v19.4s,v4.4s
and v20.16b, v20.16b, v1.16b
uzp1 v20.4s, v20.4s, v20.4s
smlsl v19.2d,v20.2s,v5.2s
sshll v20.2d,v20.2s,#15
sshr v19.2d, v19.2d, #30
smlal v19.2d,v18.2s,v11.s[1]
smlal2 v19.2d,v18.4s,v11.s[3]
smlal v19.2d,v16.2s,v11.s[0]
smlal2 v19.2d,v16.4s,v11.s[2]
mul v21.4s,v19.4s,v4.4s
and v21.16b, v21.16b, v1.16b
uzp1 v21.4s, v21.4s, v21.4s
smlsl v19.2d,v21.2s,v5.2s
sshll v21.2d,v21.2s,#15
sshr v19.2d, v19.2d, #30
smlal v19.2d,v18.2s,v12.s[0]
smlal2 v19.2d,v18.4s,v12.s[2]
smlal v19.2d,v16.2s,v11.s[1]
smlal2 v19.2d,v16.4s,v11.s[3]
and v11.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
smlal v19.2d,v18.2s,v12.s[1]
smlal2 v19.2d,v18.4s,v12.s[3]
smlal v19.2d,v16.2s,v12.s[0]
smlal2 v19.2d,v16.4s,v12.s[2]
and v22.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
shl v22.2d, v22.2d, #32
orr v11.16b, v11.16b, v22.16b
smlal v19.2d,v18.2s,v13.s[0]
smlal2 v19.2d,v18.4s,v13.s[2]
smlal v19.2d,v16.2s,v12.s[1]
smlal2 v19.2d,v16.4s,v12.s[3]
and v12.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
smlal v19.2d,v18.2s,v13.s[1]
smlal2 v19.2d,v18.4s,v13.s[3]
smlal v19.2d,v16.2s,v13.s[0]
smlal2 v19.2d,v16.4s,v13.s[2]
and v22.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
shl v22.2d, v22.2d, #32
orr v12.16b, v12.16b, v22.16b
smlal v19.2d,v18.2s,v14.s[0]
smlal2 v19.2d,v18.4s,v14.s[2]
smlal v19.2d,v16.2s,v13.s[1]
smlal2 v19.2d,v16.4s,v13.s[3]
and v13.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
smlal v19.2d,v18.2s,v14.s[1]
smlal2 v19.2d,v18.4s,v14.s[3]
smlal v19.2d,v16.2s,v14.s[0]
smlal2 v19.2d,v16.4s,v14.s[2]
and v22.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
shl v22.2d, v22.2d, #32
orr v13.16b, v13.16b, v22.16b
smlal v19.2d,v18.2s,v15.s[0]
smlal2 v19.2d,v18.4s,v15.s[2]
smlal v19.2d,v16.2s,v14.s[1]
smlal2 v19.2d,v16.4s,v14.s[3]
add v19.2d, v19.2d, v20.2d
and v14.16b, v19.16b, v1.16b
sshr v19.2d, v19.2d, #30
smlal v19.2d,v16.2s,v15.s[0]
smlal2 v19.2d,v16.4s,v15.s[2]
add v19.2d, v19.2d, v21.2d
and v15.16b, v19.16b, v1.16b
shl v15.2d, v15.2d, #32
orr v14.16b, v14.16b, v15.16b
sshr v15.2d, v19.2d, #30
sshr v17.2d, v15.2d, #15
and v15.16b, v15.16b, v2.16b
mul v19.4s,v5.4s,v17.4s
and v19.16b, v19.16b, v0.16b
add v11.4s, v11.4s, v19.4s
sshr v17.4s, v11.4s, #30
shl v17.2d, v17.2d, #32
add v11.4s, v11.4s, v17.4s
sshr v17.4s, v11.4s, #30
ushr v17.2d, v17.2d, #32
and v11.16b, v11.16b, v3.16b
add v12.4s, v12.4s, v17.4s
smov x10, v6.s[1]
smov x11, v6.s[0]
smov x12, v6.s[3]
smov x13, v6.s[2]
add x10,x11,x10,lsl #30
add x11,x13,x12,lsl #30
and x12, x10, #1048575
and x13, x11, #1048575
sub x12,x12,x7
sub x13,x13,x8
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
sub x14,x9,#1
tst x13, #1
csel x15, x12, xzr, ne
tst x14, x13, ror #1
csneg x9, x14, x9, pl
csel x12, x13, x12, mi
csneg x15, x15, x15, pl
add x13,x13,x15
asr x13, x13, #1
mov x14,x12
add x14,x14,#1048576
add x14,x14,x7
asr x14, x14, #42
add x12,x12,#1048576
lsl x12, x12, #22
asr x12, x12, #43
mov x15,x13
add x15,x15,#1048576
add x15,x15,x7
asr x15, x15, #42
add x13,x13,#1048576
lsl x13, x13, #22
asr x13, x13, #43
mul x16,x12,x10
smulh x17, x12, x10
mul x18,x14,x11
adds x16, x16, x18
smulh x18, x14, x11
adc x17,x17,x18
lsr x16, x16, #20
lsl x17, x17, #44
orr x16, x16, x17
mul x17,x13,x10
smulh x10, x13, x10
mul x18,x15,x11
adds x17, x17, x18
smulh x11, x15, x11
adc x10,x10,x11
lsr x11, x17, #20
lsl x10, x10, #44
orr x17, x11, x10
mov x16,x16
and x10, x16, #1048575
and x11, x17, #1048575
sub x10,x10,x7
sub x11,x11,x8
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
sub x18,x9,#1
tst x11, #1
csel x19, x10, xzr, ne
tst x18, x11, ror #1
csneg x9, x18, x9, pl
csel x10, x11, x10, mi
csneg x19, x19, x19, pl
add x11,x11,x19
asr x11, x11, #1
mov x18,x10
add x18,x18,#1048576
add x18,x18,x7
asr x18, x18, #42
add x10,x10,#1048576
lsl x10, x10, #22
asr x10, x10, #43
mov x19,x11
add x19,x19,#1048576
add x19,x19,x7
asr x19, x19, #42
add x11,x11,#1048576
lsl x11, x11, #22
asr x11, x11, #43
mul x20,x10,x16
mul x21,x18,x17
adds x20, x20, x21
lsr x20, x20, #20
mov x20,x20
mul x16,x11,x16
mul x17,x19,x17
adds x16, x16, x17
lsr x16, x16, #20
mov x16,x16
mov x17,x20
mov x16,x16
mul x20,x10,x12
madd x20, x18, x13, x20
mul x12,x11,x12
madd x12, x19, x13, x12
mul x10,x10,x14
madd x10, x18, x15, x10
mul x11,x11,x14
madd x11, x19, x15, x11
mov x13,x20
mov x10,x10
mov x12,x12
mov x11,x11
and x14, x17, #1048575
and x15, x16, #1048575
sub x14,x14,x7
sub x15,x15,x8
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
sub x16,x9,#1
tst x15, #1
csel x17, x14, xzr, ne
tst x16, x15, ror #1
csneg x9, x16, x9, pl
csel x14, x15, x14, mi
csneg x17, x17, x17, pl
add x15,x15,x17
asr x15, x15, #1
str x9, [x0]
mov x16,x14
add x16,x16,#1048576
add x16,x16,x7
asr x16, x16, #42
add x14,x14,#1048576
lsl x14, x14, #22
asr x14, x14, #43
mov x17,x15
add x17,x17,#1048576
add x17,x17,x7
asr x17, x17, #42
add x15,x15,#1048576
lsl x15, x15, #22
asr x15, x15, #43
mul x18,x14,x13
madd x18, x16, x12, x18
mul x13,x15,x13
madd x12, x17, x12, x13
mul x13,x14,x10
madd x13, x16, x11, x13
mul x10,x15,x10
madd x10, x17, x11, x10
mov x11,x18
mov x13,x13
mov x12,x12
mov x10,x10
ubfx x14, x11, #0, #30
ubfx x15, x13, #0, #30
ubfx x16, x12, #0, #30
ubfx x17, x10, #0, #30
ins v18.s[0], w14
ins v18.s[1], w16
ins v18.s[2], w15
ins v18.s[3], w17
ubfx x14, x11, #30, #32
ubfx x15, x13, #30, #32
ubfx x16, x12, #30, #32
ubfx x17, x10, #30, #32
ins v16.s[0], w14
ins v16.s[1], w16
ins v16.s[2], w15
ins v16.s[3], w17
