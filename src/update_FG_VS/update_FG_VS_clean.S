movi v0.2d, #0xffffffff
sshr v1.2d, v0.2d, #2
sshr v2.2d, v1.2d, #15
movz x5, #51739
movk x5, #10347,lsl #16
dup v3.4s, w5
mov x5, #19
dup v4.4s, w5
ldr q5,[x4,#0]
ldr q6,[x4,#16]
and v7.16b, v5.16b, v1.16b
and v16.16b, v6.16b, v1.16b
trn1 v7.4s,v7.4s,v16.4s
sshr v16.2d, v5.2d, #30
sshr v5.2d, v6.2d, #30
trn1 v5.4s,v16.4s,v5.4s
ldp x4, x5, [x0]
ldp x6, x7, [x0, #16]
ldr w8, [x0, #32]
ldp x9, x10, [x1]
ldp x11, x12, [x1, #16]
ldr w13, [x1, #32]
ins v6.d[0], x4
ins v6.d[1], x9
ins v16.d[0], x5
ins v16.d[1], x10
ins v17.d[0], x6
ins v17.d[1], x11
ins v18.d[0], x7
ins v18.d[1], x12
ins v19.d[0], x8
ins v19.d[1], x13
ldp x4, x5, [x2]
ldp x6, x7, [x2, #16]
ldr w8, [x2, #32]
ldp x9, x10, [x3]
ldp x11, x12, [x3, #16]
ldr w13, [x3, #32]
ins v20.d[0], x4
ins v20.d[1], x9
ins v21.d[0], x5
ins v21.d[1], x10
ins v22.d[0], x6
ins v22.d[1], x11
ins v23.d[0], x7
ins v23.d[1], x12
ins v24.d[0], x8
ins v24.d[1], x13
smull v25.2d,v7.2s,v6.s[0]
smlal2 v25.2d,v7.4s,v6.s[2]
sshr v25.2d, v25.2d, #30
smlal v25.2d,v7.2s,v6.s[1]
smlal2 v25.2d,v7.4s,v6.s[3]
smlal v25.2d,v5.2s,v6.s[0]
smlal2 v25.2d,v5.4s,v6.s[2]
sshr v25.2d, v25.2d, #30
smlal v25.2d,v7.2s,v16.s[0]
smlal2 v25.2d,v7.4s,v16.s[2]
smlal v25.2d,v5.2s,v6.s[1]
smlal2 v25.2d,v5.4s,v6.s[3]
and v6.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
mov v6.16b, v6.16b
smlal v25.2d,v7.2s,v16.s[1]
smlal2 v25.2d,v7.4s,v16.s[3]
smlal v25.2d,v5.2s,v16.s[0]
smlal2 v25.2d,v5.4s,v16.s[2]
and v26.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
shl v26.2d, v26.2d, #32
orr v6.16b, v6.16b, v26.16b
smlal v25.2d,v7.2s,v17.s[0]
smlal2 v25.2d,v7.4s,v17.s[2]
smlal v25.2d,v5.2s,v16.s[1]
smlal2 v25.2d,v5.4s,v16.s[3]
and v16.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
mov v16.16b, v16.16b
smlal v25.2d,v7.2s,v17.s[1]
smlal2 v25.2d,v7.4s,v17.s[3]
smlal v25.2d,v5.2s,v17.s[0]
smlal2 v25.2d,v5.4s,v17.s[2]
and v26.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
shl v26.2d, v26.2d, #32
orr v16.16b, v16.16b, v26.16b
smlal v25.2d,v7.2s,v18.s[0]
smlal2 v25.2d,v7.4s,v18.s[2]
smlal v25.2d,v5.2s,v17.s[1]
smlal2 v25.2d,v5.4s,v17.s[3]
and v17.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
mov v17.16b, v17.16b
smlal v25.2d,v7.2s,v18.s[1]
smlal2 v25.2d,v7.4s,v18.s[3]
smlal v25.2d,v5.2s,v18.s[0]
smlal2 v25.2d,v5.4s,v18.s[2]
and v26.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
shl v26.2d, v26.2d, #32
orr v17.16b, v17.16b, v26.16b
smlal v25.2d,v7.2s,v19.s[0]
smlal2 v25.2d,v7.4s,v19.s[2]
smlal v25.2d,v5.2s,v18.s[1]
smlal2 v25.2d,v5.4s,v18.s[3]
and v18.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
mov v18.16b, v18.16b
smlal v25.2d,v5.2s,v19.s[0]
smlal2 v25.2d,v5.4s,v19.s[2]
and v19.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
shl v19.2d, v19.2d, #32
orr v18.16b, v18.16b, v19.16b
mov v19.16b, v25.16b
smull v25.2d,v7.2s,v20.s[0]
smlal2 v25.2d,v7.4s,v20.s[2]
mul v26.4s,v25.4s,v3.4s
and v26.16b, v26.16b, v1.16b
uzp1 v26.4s, v26.4s, v26.4s
smlsl v25.2d,v26.2s,v4.2s
sshll v26.2d,v26.2s,#15
sshr v25.2d, v25.2d, #30
smlal v25.2d,v7.2s,v20.s[1]
smlal2 v25.2d,v7.4s,v20.s[3]
smlal v25.2d,v5.2s,v20.s[0]
smlal2 v25.2d,v5.4s,v20.s[2]
mul v3.4s,v25.4s,v3.4s
and v3.16b, v3.16b, v1.16b
uzp1 v3.4s, v3.4s, v3.4s
smlsl v25.2d,v3.2s,v4.2s
sshll v3.2d,v3.2s,#15
sshr v25.2d, v25.2d, #30
smlal v25.2d,v7.2s,v21.s[0]
smlal2 v25.2d,v7.4s,v21.s[2]
smlal v25.2d,v5.2s,v20.s[1]
smlal2 v25.2d,v5.4s,v20.s[3]
and v20.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
smlal v25.2d,v7.2s,v21.s[1]
smlal2 v25.2d,v7.4s,v21.s[3]
smlal v25.2d,v5.2s,v21.s[0]
smlal2 v25.2d,v5.4s,v21.s[2]
and v27.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
shl v27.2d, v27.2d, #32
orr v20.16b, v20.16b, v27.16b
smlal v25.2d,v7.2s,v22.s[0]
smlal2 v25.2d,v7.4s,v22.s[2]
smlal v25.2d,v5.2s,v21.s[1]
smlal2 v25.2d,v5.4s,v21.s[3]
and v21.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
smlal v25.2d,v7.2s,v22.s[1]
smlal2 v25.2d,v7.4s,v22.s[3]
smlal v25.2d,v5.2s,v22.s[0]
smlal2 v25.2d,v5.4s,v22.s[2]
and v27.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
shl v27.2d, v27.2d, #32
orr v21.16b, v21.16b, v27.16b
smlal v25.2d,v7.2s,v23.s[0]
smlal2 v25.2d,v7.4s,v23.s[2]
smlal v25.2d,v5.2s,v22.s[1]
smlal2 v25.2d,v5.4s,v22.s[3]
and v22.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
smlal v25.2d,v7.2s,v23.s[1]
smlal2 v25.2d,v7.4s,v23.s[3]
smlal v25.2d,v5.2s,v23.s[0]
smlal2 v25.2d,v5.4s,v23.s[2]
and v27.16b, v25.16b, v1.16b
sshr v25.2d, v25.2d, #30
shl v27.2d, v27.2d, #32
orr v22.16b, v22.16b, v27.16b
smlal v25.2d,v7.2s,v24.s[0]
smlal2 v25.2d,v7.4s,v24.s[2]
smlal v25.2d,v5.2s,v23.s[1]
smlal2 v25.2d,v5.4s,v23.s[3]
add v25.2d, v25.2d, v26.2d
and v7.16b, v25.16b, v1.16b
sshr v23.2d, v25.2d, #30
smlal v23.2d,v5.2s,v24.s[0]
smlal2 v23.2d,v5.4s,v24.s[2]
add v23.2d, v23.2d, v3.2d
and v3.16b, v23.16b, v1.16b
shl v3.2d, v3.2d, #32
orr v7.16b, v7.16b, v3.16b
sshr v3.2d, v23.2d, #30
sshr v5.2d, v3.2d, #15
and v2.16b, v3.16b, v2.16b
mul v3.4s,v4.4s,v5.4s
and v3.16b, v3.16b, v0.16b
add v20.4s, v20.4s, v3.4s
uzp1 v0.4s, v1.4s, v1.4s
sshr v5.4s, v20.4s, #30
shl v1.2d, v5.2d, #32
add v20.4s, v20.4s, v1.4s
sshr v1.4s, v20.4s, #30
ushr v1.2d, v1.2d, #32
and v20.16b, v20.16b, v0.16b
add v21.4s, v21.4s, v1.4s
zip1 v0.2d, v6.2d, v16.2d
zip2 v1.2d, v6.2d, v16.2d
zip1 v3.2d, v17.2d, v18.2d
zip2 v4.2d, v17.2d, v18.2d
str q0, [x0]
str q3, [x0, #16]
str q1, [x1]
str q4, [x1, #16]
umov x4, v19.d[0]
str w4, [x0, #32]
umov x0, v19.d[1]
str w0, [x1, #32]
zip1 v0.2d, v20.2d, v21.2d
zip2 v1.2d, v20.2d, v21.2d
zip1 v3.2d, v22.2d, v7.2d
zip2 v4.2d, v22.2d, v7.2d
str q0, [x2]
str q3, [x2, #16]
str q1, [x3]
str q4, [x3, #16]
umov x0, v2.d[0]
str w0, [x2, #32]
umov x0, v2.d[1]
str w0, [x3, #32]
