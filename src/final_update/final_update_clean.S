movi v0.2d, #0xffffffff
sshr v1.2d, v0.2d, #2
sshr v2.2d, v1.2d, #15
movz x6, #51739
movk x6, #10347,lsl #16
dup v3.4s, w6
mov x6, #19
dup v4.4s, w6
ldr q5,[x5,#0]
ldr q6,[x5,#16]
and v7.16b, v5.16b, v1.16b
and v16.16b, v6.16b, v1.16b
trn1 v7.4s,v7.4s,v16.4s
sshr v16.2d, v5.2d, #30
sshr v5.2d, v6.2d, #30
trn1 v5.4s,v16.4s,v5.4s
ldp x1, x5, [x1]
ldp x2, x6, [x2]
ins v6.d[0], x1
ins v6.d[1], x2
ins v16.d[0], x5
ins v16.d[1], x6
ldp x1, x2, [x3]
ldp x5, x6, [x3, #16]
ldr w3, [x3, #32]
ldp x7, x8, [x4]
ldp x9, x10, [x4, #16]
ldr w4, [x4, #32]
ins v17.d[0], x1
ins v17.d[1], x7
ins v18.d[0], x2
ins v18.d[1], x8
ins v19.d[0], x5
ins v19.d[1], x9
ins v20.d[0], x6
ins v20.d[1], x10
ins v21.d[0], x3
ins v21.d[1], x4
smull v22.2d,v7.2s,v6.s[0]
smlal2 v22.2d,v7.4s,v6.s[2]
sshr v22.2d, v22.2d, #30
smlal v22.2d,v7.2s,v6.s[1]
smlal2 v22.2d,v7.4s,v6.s[3]
smlal v22.2d,v5.2s,v6.s[0]
smlal2 v22.2d,v5.4s,v6.s[2]
sshr v22.2d, v22.2d, #30
smlal v22.2d,v7.2s,v16.s[0]
smlal2 v22.2d,v7.4s,v16.s[2]
smlal v22.2d,v5.2s,v6.s[1]
smlal2 v22.2d,v5.4s,v6.s[3]
and v6.16b, v22.16b, v1.16b
sshr v22.2d, v22.2d, #30
mov v6.16b, v6.16b
smlal v22.2d,v7.2s,v16.s[1]
smlal2 v22.2d,v7.4s,v16.s[3]
smlal v22.2d,v5.2s,v16.s[0]
smlal2 v22.2d,v5.4s,v16.s[2]
and v16.16b, v22.16b, v1.16b
shl v16.2d, v16.2d, #32
orr v6.16b, v6.16b, v16.16b
smull v16.2d,v7.2s,v17.s[0]
smlal2 v16.2d,v7.4s,v17.s[2]
mul v22.4s,v16.4s,v3.4s
and v22.16b, v22.16b, v1.16b
uzp1 v22.4s, v22.4s, v22.4s
smlsl v16.2d,v22.2s,v4.2s
sshll v22.2d,v22.2s,#15
sshr v16.2d, v16.2d, #30
smlal v16.2d,v7.2s,v17.s[1]
smlal2 v16.2d,v7.4s,v17.s[3]
smlal v16.2d,v5.2s,v17.s[0]
smlal2 v16.2d,v5.4s,v17.s[2]
mul v3.4s,v16.4s,v3.4s
and v3.16b, v3.16b, v1.16b
uzp1 v3.4s, v3.4s, v3.4s
smlsl v16.2d,v3.2s,v4.2s
sshll v3.2d,v3.2s,#15
sshr v16.2d, v16.2d, #30
smlal v16.2d,v7.2s,v18.s[0]
smlal2 v16.2d,v7.4s,v18.s[2]
smlal v16.2d,v5.2s,v17.s[1]
smlal2 v16.2d,v5.4s,v17.s[3]
and v17.16b, v16.16b, v1.16b
sshr v16.2d, v16.2d, #30
smlal v16.2d,v7.2s,v18.s[1]
smlal2 v16.2d,v7.4s,v18.s[3]
smlal v16.2d,v5.2s,v18.s[0]
smlal2 v16.2d,v5.4s,v18.s[2]
and v23.16b, v16.16b, v1.16b
sshr v16.2d, v16.2d, #30
shl v23.2d, v23.2d, #32
orr v17.16b, v17.16b, v23.16b
smlal v16.2d,v7.2s,v19.s[0]
smlal2 v16.2d,v7.4s,v19.s[2]
smlal v16.2d,v5.2s,v18.s[1]
smlal2 v16.2d,v5.4s,v18.s[3]
and v18.16b, v16.16b, v1.16b
sshr v16.2d, v16.2d, #30
smlal v16.2d,v7.2s,v19.s[1]
smlal2 v16.2d,v7.4s,v19.s[3]
smlal v16.2d,v5.2s,v19.s[0]
smlal2 v16.2d,v5.4s,v19.s[2]
and v23.16b, v16.16b, v1.16b
sshr v16.2d, v16.2d, #30
shl v23.2d, v23.2d, #32
orr v18.16b, v18.16b, v23.16b
smlal v16.2d,v7.2s,v20.s[0]
smlal2 v16.2d,v7.4s,v20.s[2]
smlal v16.2d,v5.2s,v19.s[1]
smlal2 v16.2d,v5.4s,v19.s[3]
and v19.16b, v16.16b, v1.16b
sshr v16.2d, v16.2d, #30
smlal v16.2d,v7.2s,v20.s[1]
smlal2 v16.2d,v7.4s,v20.s[3]
smlal v16.2d,v5.2s,v20.s[0]
smlal2 v16.2d,v5.4s,v20.s[2]
and v23.16b, v16.16b, v1.16b
sshr v16.2d, v16.2d, #30
shl v23.2d, v23.2d, #32
orr v19.16b, v19.16b, v23.16b
smlal v16.2d,v7.2s,v21.s[0]
smlal2 v16.2d,v7.4s,v21.s[2]
smlal v16.2d,v5.2s,v20.s[1]
smlal2 v16.2d,v5.4s,v20.s[3]
add v16.2d, v16.2d, v22.2d
and v7.16b, v16.16b, v1.16b
sshr v16.2d, v16.2d, #30
smlal v16.2d,v5.2s,v21.s[0]
smlal2 v16.2d,v5.4s,v21.s[2]
add v16.2d, v16.2d, v3.2d
and v3.16b, v16.16b, v1.16b
shl v3.2d, v3.2d, #32
orr v7.16b, v7.16b, v3.16b
sshr v3.2d, v16.2d, #30
sshr v5.2d, v3.2d, #15
and v2.16b, v3.16b, v2.16b
mul v3.4s,v4.4s,v5.4s
and v3.16b, v3.16b, v0.16b
add v17.4s, v17.4s, v3.4s
uzp1 v0.4s, v1.4s, v1.4s
sshr v5.4s, v17.4s, #30
shl v1.2d, v5.2d, #32
add v17.4s, v17.4s, v1.4s
sshr v1.4s, v17.4s, #30
ushr v1.2d, v1.2d, #32
and v17.16b, v17.16b, v0.16b
add v18.4s, v18.4s, v1.4s
umov x1, v17.d[0]
umov x2, v18.d[0]
umov x3, v19.d[0]
umov x4, v7.d[0]
smov x5, v2.s[0]
and x6, x1, #0x3fffffff
lsr x1, x1, #32
and x7, x2, #0x3fffffff
lsr x2, x2, #32
and x8, x3, #0x3fffffff
lsr x3, x3, #32
and x9, x4, #0x3fffffff
lsr x4, x4, #32
lsl x1, x1, #30
orr x1, x6, x1
lsl x6, x7, #60
orr x1,x1,x6
lsr x6, x7, #4
lsl x2, x2, #26
orr x2, x6, x2
lsl x6, x8, #56
orr x2,x2,x6
lsr x6, x8, #8
lsl x3, x3, #22
orr x3, x6, x3
lsl x6, x9, #52
orr x3,x3,x6
lsr x6, x9, #12
lsl x4, x4, #18
orr x4, x6, x4
lsl x5, x5, #48
orr x4,x4,x5
umov x5, v6.d[0]
lsl x5, x5, #2
asr x5, x5, #3
cmp x5,#0
mvn x6, xzr
lsr x6, x6, #1
mov x7, #18
csinv x1, x1, x1, pl
csinv x2, x2, x2, pl
csinv x3, x3, x3, pl
sub x6,x6,x4
csel x4, x4, x6, pl
and  x5, x7, x5
sub x1,x1,x5
stp x1, x2, [x0]
stp x3, x4, [x0, #16]
