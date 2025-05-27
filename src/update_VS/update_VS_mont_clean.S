movi v0.2d, #0xffffffff
sshr v0.2d, v0.2d, #2

movz x3, #51739
movk x3, #10347,lsl #16
dup v1.4s, w3
mov x3, #19
dup v2.4s, w3
ldp x3, x4, [x0]
ldp x5, x6, [x0, #16]
ldr w7, [x0, #32]
ldp x8, x9, [x1]
ldp x10, x11, [x1, #16]
ldr w12, [x1, #32]
ins v3.d[0], x3
ins v3.d[1], x8
ins v4.d[0], x4
ins v4.d[1], x9
ins v5.d[0], x5
ins v5.d[1], x10
ins v6.d[0], x6
ins v6.d[1], x11
ins v7.d[0], x7
ins v7.d[1], x12
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
ins v16.s[0], w6
ins v16.s[1], w8
ins v16.s[2], w7
ins v16.s[3], w9
ins v17.s[0], w3
ins v17.s[1], w2
ins v17.s[2], w4
ins v17.s[3], w5
smull v18.2d,v16.2s,v3.s[0]
smlal2 v18.2d,v16.4s,v3.s[2]
mul v19.4s,v18.4s,v1.4s
and v19.16b, v19.16b, v0.16b
uzp1 v19.4s, v19.4s, v19.4s
smlsl v18.2d,v19.2s,v2.2s
sshll v19.2d,v19.2s,#15
sshr v18.2d, v18.2d, #30
smlal v18.2d,v16.2s,v3.s[1]
smlal2 v18.2d,v16.4s,v3.s[3]
smlal v18.2d,v17.2s,v3.s[0]
smlal2 v18.2d,v17.4s,v3.s[2]
mul v1.4s,v18.4s,v1.4s
and v1.16b, v1.16b, v0.16b
uzp1 v1.4s, v1.4s, v1.4s
smlsl v18.2d,v1.2s,v2.2s
sshll v1.2d,v1.2s,#15
sshr v18.2d, v18.2d, #30
smlal v18.2d,v16.2s,v4.s[0]
smlal2 v18.2d,v16.4s,v4.s[2]
smlal v18.2d,v17.2s,v3.s[1]
smlal2 v18.2d,v17.4s,v3.s[3]
and v3.16b, v18.16b, v0.16b
sshr v18.2d, v18.2d, #30
smlal v18.2d,v16.2s,v4.s[1]
smlal2 v18.2d,v16.4s,v4.s[3]
smlal v18.2d,v17.2s,v4.s[0]
smlal2 v18.2d,v17.4s,v4.s[2]
and v20.16b, v18.16b, v0.16b
sshr v18.2d, v18.2d, #30
shl v20.2d, v20.2d, #32
orr v3.16b, v3.16b, v20.16b
smlal v18.2d,v16.2s,v5.s[0]
smlal2 v18.2d,v16.4s,v5.s[2]
smlal v18.2d,v17.2s,v4.s[1]
smlal2 v18.2d,v17.4s,v4.s[3]
and v4.16b, v18.16b, v0.16b
sshr v18.2d, v18.2d, #30
smlal v18.2d,v16.2s,v5.s[1]
smlal2 v18.2d,v16.4s,v5.s[3]
smlal v18.2d,v17.2s,v5.s[0]
smlal2 v18.2d,v17.4s,v5.s[2]
and v20.16b, v18.16b, v0.16b
sshr v18.2d, v18.2d, #30
shl v20.2d, v20.2d, #32
orr v4.16b, v4.16b, v20.16b
smlal v18.2d,v16.2s,v6.s[0]
smlal2 v18.2d,v16.4s,v6.s[2]
smlal v18.2d,v17.2s,v5.s[1]
smlal2 v18.2d,v17.4s,v5.s[3]
and v5.16b, v18.16b, v0.16b
sshr v18.2d, v18.2d, #30
smlal v18.2d,v16.2s,v6.s[1]
smlal2 v18.2d,v16.4s,v6.s[3]
smlal v18.2d,v17.2s,v6.s[0]
smlal2 v18.2d,v17.4s,v6.s[2]
and v20.16b, v18.16b, v0.16b
sshr v18.2d, v18.2d, #30
shl v20.2d, v20.2d, #32
orr v5.16b, v5.16b, v20.16b
smlal v18.2d,v16.2s,v7.s[0]
smlal2 v18.2d,v16.4s,v7.s[2]
smlal v18.2d,v17.2s,v6.s[1]
smlal2 v18.2d,v17.4s,v6.s[3]
add v18.2d, v18.2d, v19.2d
and v6.16b, v18.16b, v0.16b
sshr v16.2d, v18.2d, #30
smlal v16.2d,v17.2s,v7.s[0]
smlal2 v16.2d,v17.4s,v7.s[2]
add v16.2d, v16.2d, v1.2d
and v1.16b, v16.16b, v0.16b
shl v1.2d, v1.2d, #32
orr v6.16b, v6.16b, v1.16b
sshr v1.2d, v16.2d, #30
sshr v7.2d, v0.2d, #15
movi v16.2d, #0xffffffff
sshr v17.2d, v1.2d, #15
and v1.16b, v1.16b, v7.16b
mul v2.4s,v2.4s,v17.4s
and v2.16b, v2.16b, v16.16b
add v3.4s, v3.4s, v2.4s
uzp1 v0.4s, v0.4s, v0.4s
sshr v17.4s, v3.4s, #30
shl v2.2d, v17.2d, #32
add v3.4s, v3.4s, v2.4s
sshr v2.4s, v3.4s, #30
ushr v2.2d, v2.2d, #32
and v3.16b, v3.16b, v0.16b
add v4.4s, v4.4s, v2.4s
zip1 v0.2d, v3.2d, v4.2d
zip2 v2.2d, v3.2d, v4.2d
zip1 v3.2d, v5.2d, v6.2d
zip2 v4.2d, v5.2d, v6.2d
str q0, [x0]
str q3, [x0, #16]

str q2, [x1]
str q4, [x1, #16]
umov x2, v1.d[0]
str w2, [x0, #32]
umov x0, v1.d[1]
str w0, [x1, #32]
