ldp x3, x4, [x0]
ldp x5, x6, [x0, #16]
ldr w7, [x0, #32]
ldp x8, x9, [x1]
ldp x10, x11, [x1, #16]
ldr w12, [x1, #32]
ins v0.d[0], x3
ins v0.d[1], x8
ins v1.d[0], x4
ins v1.d[1], x9
ins v2.d[0], x5
ins v2.d[1], x10
ins v3.d[0], x6
ins v3.d[1], x11
ins v4.d[0], x7
ins v4.d[1], x12
ldp x3, x4, [x2, #0]
ldp x2, x5, [x2, #16]
ubfx x6, x3, #0, #30
ubfx x3, x3, #30, #32
ubfx x7, x4, #0, #30
ubfx x4, x4, #30, #32
ubfx x8, x2, #0, #30
ubfx x2, x2, #30, #32
ubfx x9, x5, #0, #30
ubfx x5, x5, #30, #32
ins v5.s[0], w6
ins v5.s[1], w8
ins v5.s[2], w7
ins v5.s[3], w9
ins v6.s[0], w3
ins v6.s[1], w2
ins v6.s[2], w4
ins v6.s[3], w5
movi v7.2d, #0xffffffff
ushr v7.2d, v7.2d, #2
smull v16.2d,v5.2s,v0.s[0]
smlal2 v16.2d,v5.4s,v0.s[2]
sshr v16.2d, v16.2d, #30
smlal v16.2d,v5.2s,v0.s[1]
smlal2 v16.2d,v5.4s,v0.s[3]
smlal v16.2d,v6.2s,v0.s[0]
smlal2 v16.2d,v6.4s,v0.s[2]
sshr v16.2d, v16.2d, #30
smlal v16.2d,v5.2s,v1.s[0]
smlal2 v16.2d,v5.4s,v1.s[2]
smlal v16.2d,v6.2s,v0.s[1]
smlal2 v16.2d,v6.4s,v0.s[3]
and v0.16b, v16.16b, v7.16b
sshr v16.2d, v16.2d, #30
mov v0.16b, v0.16b
smlal v16.2d,v5.2s,v1.s[1]
smlal2 v16.2d,v5.4s,v1.s[3]
smlal v16.2d,v6.2s,v1.s[0]
smlal2 v16.2d,v6.4s,v1.s[2]
and v17.16b, v16.16b, v7.16b
sshr v16.2d, v16.2d, #30
shl v17.2d, v17.2d, #32
orr v0.16b, v0.16b, v17.16b
smlal v16.2d,v5.2s,v2.s[0]
smlal2 v16.2d,v5.4s,v2.s[2]
smlal v16.2d,v6.2s,v1.s[1]
smlal2 v16.2d,v6.4s,v1.s[3]
and v1.16b, v16.16b, v7.16b
sshr v16.2d, v16.2d, #30
mov v1.16b, v1.16b
smlal v16.2d,v5.2s,v2.s[1]
smlal2 v16.2d,v5.4s,v2.s[3]
smlal v16.2d,v6.2s,v2.s[0]
smlal2 v16.2d,v6.4s,v2.s[2]
and v17.16b, v16.16b, v7.16b
sshr v16.2d, v16.2d, #30
shl v17.2d, v17.2d, #32
orr v1.16b, v1.16b, v17.16b
smlal v16.2d,v5.2s,v3.s[0]
smlal2 v16.2d,v5.4s,v3.s[2]
smlal v16.2d,v6.2s,v2.s[1]
smlal2 v16.2d,v6.4s,v2.s[3]
and v2.16b, v16.16b, v7.16b
sshr v16.2d, v16.2d, #30
mov v2.16b, v2.16b
smlal v16.2d,v5.2s,v3.s[1]
smlal2 v16.2d,v5.4s,v3.s[3]
smlal v16.2d,v6.2s,v3.s[0]
smlal2 v16.2d,v6.4s,v3.s[2]
and v17.16b, v16.16b, v7.16b
sshr v16.2d, v16.2d, #30
shl v17.2d, v17.2d, #32
orr v2.16b, v2.16b, v17.16b
smlal v16.2d,v5.2s,v4.s[0]
smlal2 v16.2d,v5.4s,v4.s[2]
smlal v16.2d,v6.2s,v3.s[1]
smlal2 v16.2d,v6.4s,v3.s[3]
and v3.16b, v16.16b, v7.16b
sshr v5.2d, v16.2d, #30
mov v3.16b, v3.16b
smlal v5.2d,v6.2s,v4.s[0]
smlal2 v5.2d,v6.4s,v4.s[2]
and v4.16b, v5.16b, v7.16b
sshr v5.2d, v5.2d, #30
shl v4.2d, v4.2d, #32
orr v3.16b, v3.16b, v4.16b
mov v4.16b, v5.16b
zip1 v5.2d, v0.2d, v1.2d
zip2 v0.2d, v0.2d, v1.2d
zip1 v1.2d, v2.2d, v3.2d
zip2 v2.2d, v2.2d, v3.2d
stp q5, q1, [x0]
stp q0, q2, [x1]
umov x2, v4.d[0]
str w2, [x0, #32]
umov x0, v4.d[1]
str w0, [x1, #32]
