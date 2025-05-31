mov x6, #9
movi v0.2d, #0xffffffff
ushr v1.2d, v0.2d, #2
sshr v2.2d, v1.2d, #15
uzp1 v3.4s, v1.4s, v1.4s
movz x7, #51739
movk x7, #10347,lsl #16
dup v4.4s, w7
mov x7, #19
dup v5.4s, w7
mov x7, #1
lsl x7, x7, #41
mov x8, #1
lsl x8, x8, #62
ldp x9, x10, [x1]
ldp x11, x12, [x1, #16]
ldr w13, [x1, #32]
ldp x14, x15, [x2]
ldp x16, x17, [x2, #16]
ldr w18, [x2, #32]
ins v6.d[0], x9
ins v6.d[1], x14
ins v7.d[0], x10
ins v7.d[1], x15
ins v8.d[0], x11
ins v8.d[1], x16
ins v9.d[0], x12
ins v9.d[1], x17
ins v10.d[0], x13
ins v10.d[1], x18
ldp x9, x10, [x3]
ldp x11, x12, [x3, #16]
ldr w13, [x3, #32]
ldp x14, x15, [x4]
ldp x16, x17, [x4, #16]
ldr w18, [x4, #32]
ins v11.d[0], x9
ins v11.d[1], x14
ins v12.d[0], x10
ins v12.d[1], x15
ins v13.d[0], x11
ins v13.d[1], x16
ins v14.d[0], x12
ins v14.d[1], x17
ins v15.d[0], x13
ins v15.d[1], x18
ldr x9, [x0]
ldp x10, x11, [x5, #0]
ldp x12, x13, [x5, #16]
ldr q16,[x5,#0]
ldr q17,[x5,#16]
and v18.16b, v16.16b, v1.16b
and v19.16b, v17.16b, v1.16b
trn1 v18.4s,v18.4s,v19.4s
sshr v19.2d, v16.2d, #30
sshr v16.2d, v17.2d, #30
trn1 v16.4s,v19.4s,v16.4s
