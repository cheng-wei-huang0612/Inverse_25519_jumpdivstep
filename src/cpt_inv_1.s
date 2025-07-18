
# qhasm: int64 input_x0

# qhasm: int64 input_x1

# qhasm: int64 input_x2

# qhasm: int64 input_x3

# qhasm: int64 input_x4

# qhasm: int64 input_x5

# qhasm: int64 input_x6

# qhasm: int64 input_x7

# qhasm: int64 output_x0

# qhasm: int64 calleesaved_x18

# qhasm: int64 calleesaved_x19

# qhasm: int64 calleesaved_x20

# qhasm: int64 calleesaved_x21

# qhasm: int64 calleesaved_x22

# qhasm: int64 calleesaved_x23

# qhasm: int64 calleesaved_x24

# qhasm: int64 calleesaved_x25

# qhasm: int64 calleesaved_x26

# qhasm: int64 calleesaved_x27

# qhasm: int64 calleesaved_x28

# qhasm: int64 calleesaved_x29

# qhasm: reg128 input_v0

# qhasm: reg128 input_v1

# qhasm: reg128 input_v2

# qhasm: reg128 input_v3

# qhasm: reg128 input_v4

# qhasm: reg128 input_v5

# qhasm: reg128 input_v6

# qhasm: reg128 input_v7

# qhasm: reg128 output_v0

# qhasm: reg128 calleesaved_v8

# qhasm: reg128 calleesaved_v9

# qhasm: reg128 calleesaved_v10

# qhasm: reg128 calleesaved_v11

# qhasm: reg128 calleesaved_v12

# qhasm: reg128 calleesaved_v13

# qhasm: reg128 calleesaved_v14

# qhasm: reg128 calleesaved_v15

# qhasm: enter cpt_inv
.align 4
.global _cpt_inv
.global cpt_inv
_cpt_inv:
cpt_inv:

# qhasm: input input_x0

# qhasm: input input_x1

# qhasm: caller calleesaved_x18

# qhasm: caller calleesaved_x19

# qhasm: caller calleesaved_x20

# qhasm: caller calleesaved_x21

# qhasm: caller calleesaved_x22

# qhasm: caller calleesaved_x23

# qhasm: caller calleesaved_x24

# qhasm: caller calleesaved_x25

# qhasm: caller calleesaved_x26

# qhasm: caller calleesaved_x27

# qhasm: caller calleesaved_x28

# qhasm: caller calleesaved_x29

# qhasm: caller calleesaved_v8

# qhasm: caller calleesaved_v9

# qhasm: caller calleesaved_v10

# qhasm: caller calleesaved_v11

# qhasm: caller calleesaved_v12

# qhasm: caller calleesaved_v13

# qhasm: caller calleesaved_v14

# qhasm: caller calleesaved_v15

# qhasm: push2x8b calleesaved_v8, calleesaved_v9
# asm 1: stp <calleesaved_v8=reg128#9%dregname,<calleesaved_v9=reg128#10%dregname,[sp,#-16]!
# asm 2: stp <calleesaved_v8=d8,<calleesaved_v9=d9,[sp,#-16]!
stp d8,d9,[sp,#-16]!

# qhasm: push2x8b calleesaved_v10, calleesaved_v11
# asm 1: stp <calleesaved_v10=reg128#11%dregname,<calleesaved_v11=reg128#12%dregname,[sp,#-16]!
# asm 2: stp <calleesaved_v10=d10,<calleesaved_v11=d11,[sp,#-16]!
stp d10,d11,[sp,#-16]!

# qhasm: push2x8b calleesaved_v12, calleesaved_v13
# asm 1: stp <calleesaved_v12=reg128#13%dregname,<calleesaved_v13=reg128#14%dregname,[sp,#-16]!
# asm 2: stp <calleesaved_v12=d12,<calleesaved_v13=d13,[sp,#-16]!
stp d12,d13,[sp,#-16]!

# qhasm: push2x8b calleesaved_v14, calleesaved_v15
# asm 1: stp <calleesaved_v14=reg128#15%dregname,<calleesaved_v15=reg128#16%dregname,[sp,#-16]!
# asm 2: stp <calleesaved_v14=d14,<calleesaved_v15=d15,[sp,#-16]!
stp d14,d15,[sp,#-16]!

# qhasm: int64 limb64_0

# qhasm: limb64_0 = mem64[input_x0 + 0]
# asm 1: ldr >limb64_0=int64#3, [<input_x0=int64#1, #0]
# asm 2: ldr >limb64_0=x2, [<input_x0=x0, #0]
ldr x2, [x0, #0]

# qhasm: int64 limb64_1

# qhasm: limb64_1 = mem64[input_x0 + 8]
# asm 1: ldr >limb64_1=int64#4, [<input_x0=int64#1, #8]
# asm 2: ldr >limb64_1=x3, [<input_x0=x0, #8]
ldr x3, [x0, #8]

# qhasm: int64 limb64_2

# qhasm: limb64_2 = mem64[input_x0 + 16]
# asm 1: ldr >limb64_2=int64#5, [<input_x0=int64#1, #16]
# asm 2: ldr >limb64_2=x4, [<input_x0=x0, #16]
ldr x4, [x0, #16]

# qhasm: int64 limb64_3

# qhasm: limb64_3 = mem64[input_x0 + 24]
# asm 1: ldr >limb64_3=int64#1, [<input_x0=int64#1, #24]
# asm 2: ldr >limb64_3=x0, [<input_x0=x0, #24]
ldr x0, [x0, #24]

# qhasm: int64 G0

# qhasm: int64 G1

# qhasm: int64 G2

# qhasm: int64 G3

# qhasm: int64 G4

# qhasm: int64 G5

# qhasm: int64 G6

# qhasm: int64 G7

# qhasm: int64 tmp60

# qhasm: int64 G8G9

# qhasm: tmp60 = limb64_0
# asm 1: mov >tmp60=int64#6,<limb64_0=int64#3
# asm 2: mov >tmp60=x5,<limb64_0=x2
mov x5,x2

# qhasm: G0 = tmp60 & 0x3FFFFFFF
# asm 1: and >G0=int64#7, <tmp60=int64#6, #0x3FFFFFFF
# asm 2: and >G0=x6, <tmp60=x5, #0x3FFFFFFF
and x6, x5, #0x3FFFFFFF

# qhasm: tmp60 = tmp60 unsigned>> 30
# asm 1: lsr >tmp60=int64#6, <tmp60=int64#6, #30
# asm 2: lsr >tmp60=x5, <tmp60=x5, #30
lsr x5, x5, #30

# qhasm: G1 = tmp60 & 0x3FFFFFFF
# asm 1: and >G1=int64#6, <tmp60=int64#6, #0x3FFFFFFF
# asm 2: and >G1=x5, <tmp60=x5, #0x3FFFFFFF
and x5, x5, #0x3FFFFFFF

# qhasm: tmp60 = limb64_1, limb64_0 >> 60
# asm 1: extr >tmp60=int64#3,<limb64_1=int64#4,<limb64_0=int64#3, #60
# asm 2: extr >tmp60=x2,<limb64_1=x3,<limb64_0=x2, #60
extr x2,x3,x2, #60

# qhasm: G2 = tmp60 & 0x3FFFFFFF
# asm 1: and >G2=int64#8, <tmp60=int64#3, #0x3FFFFFFF
# asm 2: and >G2=x7, <tmp60=x2, #0x3FFFFFFF
and x7, x2, #0x3FFFFFFF

# qhasm: tmp60 = tmp60 unsigned>> 30
# asm 1: lsr >tmp60=int64#3, <tmp60=int64#3, #30
# asm 2: lsr >tmp60=x2, <tmp60=x2, #30
lsr x2, x2, #30

# qhasm: G3 = tmp60 & 0x3FFFFFFF
# asm 1: and >G3=int64#3, <tmp60=int64#3, #0x3FFFFFFF
# asm 2: and >G3=x2, <tmp60=x2, #0x3FFFFFFF
and x2, x2, #0x3FFFFFFF

# qhasm: tmp60 = limb64_2, limb64_1 >> 56
# asm 1: extr >tmp60=int64#4,<limb64_2=int64#5,<limb64_1=int64#4, #56
# asm 2: extr >tmp60=x3,<limb64_2=x4,<limb64_1=x3, #56
extr x3,x4,x3, #56

# qhasm: G4 = tmp60 & 0x3FFFFFFF
# asm 1: and >G4=int64#9, <tmp60=int64#4, #0x3FFFFFFF
# asm 2: and >G4=x8, <tmp60=x3, #0x3FFFFFFF
and x8, x3, #0x3FFFFFFF

# qhasm: tmp60 = tmp60 unsigned>> 30
# asm 1: lsr >tmp60=int64#4, <tmp60=int64#4, #30
# asm 2: lsr >tmp60=x3, <tmp60=x3, #30
lsr x3, x3, #30

# qhasm: G5 = tmp60 & 0x3FFFFFFF
# asm 1: and >G5=int64#4, <tmp60=int64#4, #0x3FFFFFFF
# asm 2: and >G5=x3, <tmp60=x3, #0x3FFFFFFF
and x3, x3, #0x3FFFFFFF

# qhasm: tmp60 = limb64_3, limb64_2 >> 52
# asm 1: extr >tmp60=int64#5,<limb64_3=int64#1,<limb64_2=int64#5, #52
# asm 2: extr >tmp60=x4,<limb64_3=x0,<limb64_2=x4, #52
extr x4,x0,x4, #52

# qhasm: G6 = tmp60 & 0x3FFFFFFF
# asm 1: and >G6=int64#10, <tmp60=int64#5, #0x3FFFFFFF
# asm 2: and >G6=x9, <tmp60=x4, #0x3FFFFFFF
and x9, x4, #0x3FFFFFFF

# qhasm: tmp60 = tmp60 unsigned>> 30
# asm 1: lsr >tmp60=int64#5, <tmp60=int64#5, #30
# asm 2: lsr >tmp60=x4, <tmp60=x4, #30
lsr x4, x4, #30

# qhasm: G7 = tmp60 & 0x3FFFFFFF
# asm 1: and >G7=int64#5, <tmp60=int64#5, #0x3FFFFFFF
# asm 2: and >G7=x4, <tmp60=x4, #0x3FFFFFFF
and x4, x4, #0x3FFFFFFF

# qhasm: G8G9 = limb64_3 unsigned>> 48
# asm 1: lsr >G8G9=int64#1, <limb64_3=int64#1, #48
# asm 2: lsr >G8G9=x0, <limb64_3=x0, #48
lsr x0, x0, #48

# qhasm: int64 zero

# qhasm: zero = 0
# asm 1: mov >zero=int64#11, #0
# asm 2: mov >zero=x10, #0
mov x10, #0

# qhasm: int64 G0G1

# qhasm: int64 G2G3

# qhasm: int64 G4G5

# qhasm: int64 G6G7

# qhasm: G0G1 = G0 + G1 << 32
# asm 1: add >G0G1=int64#6,<G0=int64#7,<G1=int64#6,LSL #32
# asm 2: add >G0G1=x5,<G0=x6,<G1=x5,LSL #32
add x5,x6,x5,LSL #32

# qhasm: G2G3 = G2 + G3 << 32
# asm 1: add >G2G3=int64#3,<G2=int64#8,<G3=int64#3,LSL #32
# asm 2: add >G2G3=x2,<G2=x7,<G3=x2,LSL #32
add x2,x7,x2,LSL #32

# qhasm: G4G5 = G4 + G5 << 32
# asm 1: add >G4G5=int64#4,<G4=int64#9,<G5=int64#4,LSL #32
# asm 2: add >G4G5=x3,<G4=x8,<G5=x3,LSL #32
add x3,x8,x3,LSL #32

# qhasm: G6G7 = G6 + G7 << 32
# asm 1: add >G6G7=int64#5,<G6=int64#10,<G7=int64#5,LSL #32
# asm 2: add >G6G7=x4,<G6=x9,<G7=x4,LSL #32
add x4,x9,x4,LSL #32

# qhasm: reg128 vec_G0_G1_G2_G3

# qhasm: reg128 vec_F0_F1_F2_F3

# qhasm: reg128 vec_G4_G5_G6_G7

# qhasm: reg128 vec_F4_F5_F6_F7

# qhasm: reg128 vec_G8_G9_G10_G11

# qhasm: reg128 vec_F8_F9_F10_F11

# qhasm: vec_G0_G1_G2_G3[0/2] = G0G1
# asm 1: ins <vec_G0_G1_G2_G3=reg128#1.d[0], <G0G1=int64#6
# asm 2: ins <vec_G0_G1_G2_G3=v0.d[0], <G0G1=x5
ins v0.d[0], x5

# qhasm: vec_G0_G1_G2_G3[1/2] = G2G3
# asm 1: ins <vec_G0_G1_G2_G3=reg128#1.d[1], <G2G3=int64#3
# asm 2: ins <vec_G0_G1_G2_G3=v0.d[1], <G2G3=x2
ins v0.d[1], x2

# qhasm: vec_G4_G5_G6_G7[0/2] = G4G5
# asm 1: ins <vec_G4_G5_G6_G7=reg128#2.d[0], <G4G5=int64#4
# asm 2: ins <vec_G4_G5_G6_G7=v1.d[0], <G4G5=x3
ins v1.d[0], x3

# qhasm: vec_G4_G5_G6_G7[1/2] = G6G7
# asm 1: ins <vec_G4_G5_G6_G7=reg128#2.d[1], <G6G7=int64#5
# asm 2: ins <vec_G4_G5_G6_G7=v1.d[1], <G6G7=x4
ins v1.d[1], x4

# qhasm: vec_G8_G9_G10_G11[0/2] = G8G9
# asm 1: ins <vec_G8_G9_G10_G11=reg128#3.d[0], <G8G9=int64#1
# asm 2: ins <vec_G8_G9_G10_G11=v2.d[0], <G8G9=x0
ins v2.d[0], x0

# qhasm: reg128 vec_2x_2p15m1

# qhasm: reg128 vec_2x_2p30m1

# qhasm: reg128 vec_2x_2p32m1

# qhasm: reg128 vec_4x_2p30m1

# qhasm: reg128 vec_buffer

# qhasm: reg128 vec_prod

# qhasm: reg128 vec_M

# qhasm: reg128 vec_1x_18

# qhasm: reg128 vec_2x_19

# qhasm: reg128 vec_4x_19

# qhasm: int64 _18

# qhasm: _18 = 18
# asm 1: mov >_18=int64#1, #18
# asm 2: mov >_18=x0, #18
mov x0, #18

# qhasm: 4x vec_4x_19 = 19
# asm 1: movi <vec_4x_19=reg128#4.4s, #19
# asm 2: movi <vec_4x_19=v3.4s, #19
movi v3.4s, #19

# qhasm: 4x vec_1x_18 = 0
# asm 1: movi <vec_1x_18=reg128#5.4s, #0
# asm 2: movi <vec_1x_18=v4.4s, #0
movi v4.4s, #0

# qhasm: vec_1x_18[0/4] = _18
# asm 1: ins <vec_1x_18=reg128#5.s[0], <_18=int64#1%wregname
# asm 2: ins <vec_1x_18=v4.s[0], <_18=w0
ins v4.s[0], w0

# qhasm: 2x vec_2x_2p32m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p32m1=reg128#6.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p32m1=v5.2d, #0xFFFFFFFF
movi v5.2d, #0xFFFFFFFF

# qhasm: 2x vec_2x_2p30m1 = vec_2x_2p32m1 unsigned>> 2
# asm 1: ushr >vec_2x_2p30m1=reg128#7.2d, <vec_2x_2p32m1=reg128#6.2d, #2
# asm 2: ushr >vec_2x_2p30m1=v6.2d, <vec_2x_2p32m1=v5.2d, #2
ushr v6.2d, v5.2d, #2

# qhasm: 2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
# asm 1: sshr <vec_2x_2p15m1=reg128#8.2d, <vec_2x_2p30m1=reg128#7.2d, #15
# asm 2: sshr <vec_2x_2p15m1=v7.2d, <vec_2x_2p30m1=v6.2d, #15
sshr v7.2d, v6.2d, #15

# qhasm: 4x vec_4x_2p30m1 = vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4] vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4]
# asm 1: uzp1 >vec_4x_2p30m1=reg128#9.4s, <vec_2x_2p30m1=reg128#7.4s, <vec_2x_2p30m1=reg128#7.4s
# asm 2: uzp1 >vec_4x_2p30m1=v8.4s, <vec_2x_2p30m1=v6.4s, <vec_2x_2p30m1=v6.4s
uzp1 v8.4s, v6.4s, v6.4s

# qhasm: int64 _2p41

# qhasm: _2p41 = 1
# asm 1: mov >_2p41=int64#1, #1
# asm 2: mov >_2p41=x0, #1
mov x0, #1

# qhasm: _2p41 = _2p41 << 41
# asm 1: lsl >_2p41=int64#1, <_2p41=int64#1, #41
# asm 2: lsl >_2p41=x0, <_2p41=x0, #41
lsl x0, x0, #41

# qhasm: int64 2p62

# qhasm: 2p62 = 1
# asm 1: mov >2p62=int64#3, #1
# asm 2: mov >2p62=x2, #1
mov x2, #1

# qhasm: 2p62 = 2p62 << 62
# asm 1: lsl >2p62=int64#3, <2p62=int64#3, #62
# asm 2: lsl >2p62=x2, <2p62=x2, #62
lsl x2, x2, #62

# qhasm: int64 M

# qhasm: M[0/4] =(0) 51739
# asm 1: movz <M=int64#4, #51739
# asm 2: movz <M=x3, #51739
movz x3, #51739

# qhasm: M[1/4] = 10347
# asm 1: movk <M=int64#4, #10347,LSL #16
# asm 2: movk <M=x3, #10347,LSL #16
movk x3, #10347,LSL #16

# qhasm: 4x vec_M = M
# asm 1: dup <vec_M=reg128#10.4s, <M=int64#4%wregname
# asm 2: dup <vec_M=v9.4s, <M=w3
dup v9.4s, w3

# qhasm: vec_F0_F1_F2_F3 = vec_4x_2p30m1
# asm 1: mov >vec_F0_F1_F2_F3=reg128#11.16b, <vec_4x_2p30m1=reg128#9.16b
# asm 2: mov >vec_F0_F1_F2_F3=v10.16b, <vec_4x_2p30m1=v8.16b
mov v10.16b, v8.16b

# qhasm: 2x vec_F0_F1_F2_F3 = vec_F0_F1_F2_F3 - vec_1x_18
# asm 1: sub >vec_F0_F1_F2_F3=reg128#5.2d,<vec_F0_F1_F2_F3=reg128#11.2d,<vec_1x_18=reg128#5.2d
# asm 2: sub >vec_F0_F1_F2_F3=v4.2d,<vec_F0_F1_F2_F3=v10.2d,<vec_1x_18=v4.2d
sub v4.2d,v10.2d,v4.2d

# qhasm: vec_F4_F5_F6_F7 = vec_4x_2p30m1
# asm 1: mov >vec_F4_F5_F6_F7=reg128#11.16b, <vec_4x_2p30m1=reg128#9.16b
# asm 2: mov >vec_F4_F5_F6_F7=v10.16b, <vec_4x_2p30m1=v8.16b
mov v10.16b, v8.16b

# qhasm: vec_F8_F9_F10_F11 = vec_2x_2p15m1
# asm 1: mov >vec_F8_F9_F10_F11=reg128#12.16b, <vec_2x_2p15m1=reg128#8.16b
# asm 2: mov >vec_F8_F9_F10_F11=v11.16b, <vec_2x_2p15m1=v7.16b
mov v11.16b, v7.16b

# qhasm: reg128 vec_F0_F1_G0_G1

# qhasm: reg128 vec_F2_F3_G2_G3

# qhasm: reg128 vec_F4_F5_G4_G5

# qhasm: reg128 vec_F6_F7_G6_G7

# qhasm: reg128 vec_F8_F9_G8_G9

# qhasm: 2x vec_F0_F1_G0_G1 zip= vec_F0_F1_F2_F3[0/2] vec_G0_G1_G2_G3[0/2]
# asm 1: zip1 >vec_F0_F1_G0_G1=reg128#13.2d, <vec_F0_F1_F2_F3=reg128#5.2d, <vec_G0_G1_G2_G3=reg128#1.2d
# asm 2: zip1 >vec_F0_F1_G0_G1=v12.2d, <vec_F0_F1_F2_F3=v4.2d, <vec_G0_G1_G2_G3=v0.2d
zip1 v12.2d, v4.2d, v0.2d

# qhasm: 2x vec_F2_F3_G2_G3 zip= vec_F0_F1_F2_F3[1/2] vec_G0_G1_G2_G3[1/2]
# asm 1: zip2 >vec_F2_F3_G2_G3=reg128#1.2d, <vec_F0_F1_F2_F3=reg128#5.2d, <vec_G0_G1_G2_G3=reg128#1.2d
# asm 2: zip2 >vec_F2_F3_G2_G3=v0.2d, <vec_F0_F1_F2_F3=v4.2d, <vec_G0_G1_G2_G3=v0.2d
zip2 v0.2d, v4.2d, v0.2d

# qhasm: 2x vec_F4_F5_G4_G5 zip= vec_F4_F5_F6_F7[0/2] vec_G4_G5_G6_G7[0/2]
# asm 1: zip1 >vec_F4_F5_G4_G5=reg128#5.2d, <vec_F4_F5_F6_F7=reg128#11.2d, <vec_G4_G5_G6_G7=reg128#2.2d
# asm 2: zip1 >vec_F4_F5_G4_G5=v4.2d, <vec_F4_F5_F6_F7=v10.2d, <vec_G4_G5_G6_G7=v1.2d
zip1 v4.2d, v10.2d, v1.2d

# qhasm: 2x vec_F6_F7_G6_G7 zip= vec_F4_F5_F6_F7[1/2] vec_G4_G5_G6_G7[1/2]
# asm 1: zip2 >vec_F6_F7_G6_G7=reg128#2.2d, <vec_F4_F5_F6_F7=reg128#11.2d, <vec_G4_G5_G6_G7=reg128#2.2d
# asm 2: zip2 >vec_F6_F7_G6_G7=v1.2d, <vec_F4_F5_F6_F7=v10.2d, <vec_G4_G5_G6_G7=v1.2d
zip2 v1.2d, v10.2d, v1.2d

# qhasm: 2x vec_F8_F9_G8_G9 zip= vec_F8_F9_F10_F11[0/2] vec_G8_G9_G10_G11[0/2]
# asm 1: zip1 >vec_F8_F9_G8_G9=reg128#3.2d, <vec_F8_F9_F10_F11=reg128#12.2d, <vec_G8_G9_G10_G11=reg128#3.2d
# asm 2: zip1 >vec_F8_F9_G8_G9=v2.2d, <vec_F8_F9_F10_F11=v11.2d, <vec_G8_G9_G10_G11=v2.2d
zip1 v2.2d, v11.2d, v2.2d

# qhasm: int64 ff

# qhasm: int64 g1

# qhasm: int64 hh

# qhasm: int64 h

# qhasm: int64 m1

# qhasm: int64 f_hi

# qhasm: int64 f

# qhasm: int64 g_hi

# qhasm: int64 g

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 m

# qhasm: m = 0
# asm 1: mov >m=int64#4, #0
# asm 2: mov >m=x3, #0
mov x3, #0

# qhasm:             f_hi = vec_F0_F1_G0_G1[1/4]
# asm 1: smov >f_hi=int64#5, <vec_F0_F1_G0_G1=reg128#13.s[1]
# asm 2: smov >f_hi=x4, <vec_F0_F1_G0_G1=v12.s[1]
smov x4, v12.s[1]

# qhasm:             f = vec_F0_F1_G0_G1[0/4]
# asm 1: smov >f=int64#6, <vec_F0_F1_G0_G1=reg128#13.s[0]
# asm 2: smov >f=x5, <vec_F0_F1_G0_G1=v12.s[0]
smov x5, v12.s[0]

# qhasm:             g_hi = vec_F0_F1_G0_G1[3/4]
# asm 1: smov >g_hi=int64#7, <vec_F0_F1_G0_G1=reg128#13.s[3]
# asm 2: smov >g_hi=x6, <vec_F0_F1_G0_G1=v12.s[3]
smov x6, v12.s[3]

# qhasm:             g = vec_F0_F1_G0_G1[2/4]
# asm 1: smov >g=int64#8, <vec_F0_F1_G0_G1=reg128#13.s[2]
# asm 2: smov >g=x7, <vec_F0_F1_G0_G1=v12.s[2]
smov x7, v12.s[2]

# qhasm:             f = f + f_hi << 30
# asm 1: add >f=int64#5,<f=int64#6,<f_hi=int64#5,LSL #30
# asm 2: add >f=x4,<f=x5,<f_hi=x4,LSL #30
add x4,x5,x4,LSL #30

# qhasm:             g = g + g_hi << 30
# asm 1: add >g=int64#6,<g=int64#8,<g_hi=int64#7,LSL #30
# asm 2: add >g=x5,<g=x7,<g_hi=x6,LSL #30
add x5,x7,x6,LSL #30

# qhasm:             fuv = f & 1048575
# asm 1: and >fuv=int64#7, <f=int64#5, #1048575
# asm 2: and >fuv=x6, <f=x4, #1048575
and x6, x4, #1048575

# qhasm:             grs = g & 1048575
# asm 1: and >grs=int64#8, <g=int64#6, #1048575
# asm 2: and >grs=x7, <g=x5, #1048575
and x7, x5, #1048575

# qhasm:             fuv = fuv - _2p41
# asm 1: sub >fuv=int64#7,<fuv=int64#7,<_2p41=int64#1
# asm 2: sub >fuv=x6,<fuv=x6,<_2p41=x0
sub x6,x6,x0

# qhasm:             grs -= 2p62
# asm 1: sub <grs=int64#8,<grs=int64#8,<2p62=int64#3
# asm 2: sub <grs=x7,<grs=x7,<2p62=x2
sub x7,x7,x2

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#9,<m=int64#4,#1
# asm 2: sub >m1=x8,<m=x3,#1
sub x8,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#10, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x9, <fuv=x6, xzr, ne
csel x9, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#9, <grs=int64#8, ROR #1
# asm 2: tst <m1=x8, <grs=x7, ROR #1
tst x8, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#9, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x8, <m=x3, pl
csneg x3, x8, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#10, <ff=int64#10, <ff=int64#10, pl
# asm 2: csneg >ff=x9, <ff=x9, <ff=x9, pl
csneg x9, x9, x9, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#10
# asm 2: add >grs=x7,<grs=x7,<ff=x9
add x7,x7,x9

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss

# qhasm: vv = fuv
# asm 1: mov >vv=int64#9,<fuv=int64#7
# asm 2: mov >vv=x8,<fuv=x6
mov x8,x6

# qhasm: vv = vv + 1048576
# asm 1: add >vv=int64#9,<vv=int64#9,#1048576
# asm 2: add >vv=x8,<vv=x8,#1048576
add x8,x8,#1048576

# qhasm: vv = vv + _2p41
# asm 1: add >vv=int64#9,<vv=int64#9,<_2p41=int64#1
# asm 2: add >vv=x8,<vv=x8,<_2p41=x0
add x8,x8,x0

# qhasm: vv = vv signed>> 42
# asm 1: asr >vv=int64#9, <vv=int64#9, #42
# asm 2: asr >vv=x8, <vv=x8, #42
asr x8, x8, #42

# qhasm: uu = fuv + 1048576
# asm 1: add >uu=int64#7,<fuv=int64#7,#1048576
# asm 2: add >uu=x6,<fuv=x6,#1048576
add x6,x6,#1048576

# qhasm: uu = uu << 22
# asm 1: lsl >uu=int64#7, <uu=int64#7, #22
# asm 2: lsl >uu=x6, <uu=x6, #22
lsl x6, x6, #22

# qhasm: uu = uu signed>> 43
# asm 1: asr >uu=int64#7, <uu=int64#7, #43
# asm 2: asr >uu=x6, <uu=x6, #43
asr x6, x6, #43

# qhasm: ss = grs
# asm 1: mov >ss=int64#10,<grs=int64#8
# asm 2: mov >ss=x9,<grs=x7
mov x9,x7

# qhasm: ss = ss + 1048576
# asm 1: add >ss=int64#10,<ss=int64#10,#1048576
# asm 2: add >ss=x9,<ss=x9,#1048576
add x9,x9,#1048576

# qhasm: ss = ss + _2p41
# asm 1: add >ss=int64#10,<ss=int64#10,<_2p41=int64#1
# asm 2: add >ss=x9,<ss=x9,<_2p41=x0
add x9,x9,x0

# qhasm: ss = ss signed>> 42
# asm 1: asr >ss=int64#10, <ss=int64#10, #42
# asm 2: asr >ss=x9, <ss=x9, #42
asr x9, x9, #42

# qhasm: rr = grs + 1048576
# asm 1: add >rr=int64#8,<grs=int64#8,#1048576
# asm 2: add >rr=x7,<grs=x7,#1048576
add x7,x7,#1048576

# qhasm: rr = rr << 22
# asm 1: lsl >rr=int64#8, <rr=int64#8, #22
# asm 2: lsl >rr=x7, <rr=x7, #22
lsl x7, x7, #22

# qhasm: rr = rr signed>> 43
# asm 1: asr >rr=int64#8, <rr=int64#8, #43
# asm 2: asr >rr=x7, <rr=x7, #43
asr x7, x7, #43

# qhasm: int64 tmp

# qhasm: int64 prod_lo

# qhasm: int64 prod_hi

# qhasm: int64 new_f

# qhasm: int64 new_g

# qhasm: int64 new_uu

# qhasm: int64 new_vv

# qhasm: int64 new_rr

# qhasm: int64 new_ss

# qhasm: prod_lo = uu * f
# asm 1: mul >prod_lo=int64#12,<uu=int64#7,<f=int64#5
# asm 2: mul >prod_lo=x11,<uu=x6,<f=x4
mul x11,x6,x4

# qhasm: prod_hi = uu signed* f (hi)
# asm 1: smulh >prod_hi=int64#13, <uu=int64#7, <f=int64#5
# asm 2: smulh >prod_hi=x12, <uu=x6, <f=x4
smulh x12, x6, x4

# qhasm: tmp = vv * g
# asm 1: mul >tmp=int64#14,<vv=int64#9,<g=int64#6
# asm 2: mul >tmp=x13,<vv=x8,<g=x5
mul x13,x8,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#12, <prod_lo=int64#12, <tmp=int64#14
# asm 2: adds <prod_lo=x11, <prod_lo=x11, <tmp=x13
adds x11, x11, x13

# qhasm: tmp = vv signed* g (hi)
# asm 1: smulh >tmp=int64#14, <vv=int64#9, <g=int64#6
# asm 2: smulh >tmp=x13, <vv=x8, <g=x5
smulh x13, x8, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#13,<prod_hi=int64#13,<tmp=int64#14
# asm 2: adc >prod_hi=x12,<prod_hi=x12,<tmp=x13
adc x12,x12,x13

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#12, <prod_lo=int64#12, #20
# asm 2: lsr >prod_lo=x11, <prod_lo=x11, #20
lsr x11, x11, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#13, <prod_hi=int64#13, #44
# asm 2: lsl >prod_hi=x12, <prod_hi=x12, #44
lsl x12, x12, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#12, <prod_lo=int64#12, <prod_hi=int64#13
# asm 2: orr >new_f=x11, <prod_lo=x11, <prod_hi=x12
orr x11, x11, x12

# qhasm: prod_lo = rr * f
# asm 1: mul >prod_lo=int64#13,<rr=int64#8,<f=int64#5
# asm 2: mul >prod_lo=x12,<rr=x7,<f=x4
mul x12,x7,x4

# qhasm: prod_hi = rr signed* f (hi)
# asm 1: smulh >prod_hi=int64#5, <rr=int64#8, <f=int64#5
# asm 2: smulh >prod_hi=x4, <rr=x7, <f=x4
smulh x4, x7, x4

# qhasm: tmp = ss * g
# asm 1: mul >tmp=int64#14,<ss=int64#10,<g=int64#6
# asm 2: mul >tmp=x13,<ss=x9,<g=x5
mul x13,x9,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#13, <prod_lo=int64#13, <tmp=int64#14
# asm 2: adds <prod_lo=x12, <prod_lo=x12, <tmp=x13
adds x12, x12, x13

# qhasm: tmp = ss signed* g (hi)
# asm 1: smulh >tmp=int64#6, <ss=int64#10, <g=int64#6
# asm 2: smulh >tmp=x5, <ss=x9, <g=x5
smulh x5, x9, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#5,<prod_hi=int64#5,<tmp=int64#6
# asm 2: adc >prod_hi=x4,<prod_hi=x4,<tmp=x5
adc x4,x4,x5

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#6, <prod_lo=int64#13, #20
# asm 2: lsr >prod_lo=x5, <prod_lo=x12, #20
lsr x5, x12, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#5, <prod_hi=int64#5, #44
# asm 2: lsl >prod_hi=x4, <prod_hi=x4, #44
lsl x4, x4, #44

# qhasm: g = prod_lo | prod_hi
# asm 1: orr >g=int64#5, <prod_lo=int64#6, <prod_hi=int64#5
# asm 2: orr >g=x4, <prod_lo=x5, <prod_hi=x4
orr x4, x5, x4

# qhasm: f = new_f
# asm 1: mov >f=int64#6,<new_f=int64#12
# asm 2: mov >f=x5,<new_f=x11
mov x5,x11

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#12, <f=int64#6, #1048575
# asm 2: and >fuv=x11, <f=x5, #1048575
and x11, x5, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#13, <g=int64#5, #1048575
# asm 2: and >grs=x12, <g=x4, #1048575
and x12, x4, #1048575

# qhasm: fuv -= _2p41
# asm 1: sub <fuv=int64#12,<fuv=int64#12,<_2p41=int64#1
# asm 2: sub <fuv=x11,<fuv=x11,<_2p41=x0
sub x11,x11,x0

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#13,<grs=int64#13,<2p62=int64#3
# asm 2: sub <grs=x12,<grs=x12,<2p62=x2
sub x12,x12,x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#14,<fuv=int64#12
# asm 2: mov >v=x13,<fuv=x11
mov x13,x11

# qhasm: v = v + 1048576
# asm 1: add >v=int64#14,<v=int64#14,#1048576
# asm 2: add >v=x13,<v=x13,#1048576
add x13,x13,#1048576

# qhasm: v = v + _2p41
# asm 1: add >v=int64#14,<v=int64#14,<_2p41=int64#1
# asm 2: add >v=x13,<v=x13,<_2p41=x0
add x13,x13,x0

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#14, <v=int64#14, #42
# asm 2: asr >v=x13, <v=x13, #42
asr x13, x13, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#12,<fuv=int64#12,#1048576
# asm 2: add >u=x11,<fuv=x11,#1048576
add x11,x11,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#12, <u=int64#12, #22
# asm 2: lsl >u=x11, <u=x11, #22
lsl x11, x11, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#12, <u=int64#12, #43
# asm 2: asr >u=x11, <u=x11, #43
asr x11, x11, #43

# qhasm: s = grs
# asm 1: mov >s=int64#15,<grs=int64#13
# asm 2: mov >s=x14,<grs=x12
mov x14,x12

# qhasm: s = s + 1048576
# asm 1: add >s=int64#15,<s=int64#15,#1048576
# asm 2: add >s=x14,<s=x14,#1048576
add x14,x14,#1048576

# qhasm: s = s + _2p41
# asm 1: add >s=int64#15,<s=int64#15,<_2p41=int64#1
# asm 2: add >s=x14,<s=x14,<_2p41=x0
add x14,x14,x0

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#15, <s=int64#15, #42
# asm 2: asr >s=x14, <s=x14, #42
asr x14, x14, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#13,<grs=int64#13,#1048576
# asm 2: add >r=x12,<grs=x12,#1048576
add x12,x12,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#13, <r=int64#13, #22
# asm 2: lsl >r=x12, <r=x12, #22
lsl x12, x12, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#13, <r=int64#13, #43
# asm 2: asr >r=x12, <r=x12, #43
asr x12, x12, #43

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#16,<u=int64#12,<f=int64#6
# asm 2: mul >prod_lo=x15,<u=x11,<f=x5
mul x15,x11,x5

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#17,<v=int64#14,<g=int64#5
# asm 2: mul >tmp=x16,<v=x13,<g=x4
mul x16,x13,x4

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#16, <prod_lo=int64#16, <tmp=int64#17
# asm 2: adds <prod_lo=x15, <prod_lo=x15, <tmp=x16
adds x15, x15, x16

# qhasm: prod_lo = prod_lo signed>> 20
# asm 1: asr >prod_lo=int64#16, <prod_lo=int64#16, #20
# asm 2: asr >prod_lo=x15, <prod_lo=x15, #20
asr x15, x15, #20

# qhasm: new_f = prod_lo 
# asm 1: mov >new_f=int64#16,<prod_lo=int64#16
# asm 2: mov >new_f=x15,<prod_lo=x15
mov x15,x15

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#6,<r=int64#13,<f=int64#6
# asm 2: mul >prod_lo=x5,<r=x12,<f=x5
mul x5,x12,x5

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#5,<s=int64#15,<g=int64#5
# asm 2: mul >tmp=x4,<s=x14,<g=x4
mul x4,x14,x4

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#6, <prod_lo=int64#6, <tmp=int64#5
# asm 2: adds <prod_lo=x5, <prod_lo=x5, <tmp=x4
adds x5, x5, x4

# qhasm: prod_lo = prod_lo signed>> 20
# asm 1: asr >prod_lo=int64#5, <prod_lo=int64#6, #20
# asm 2: asr >prod_lo=x4, <prod_lo=x5, #20
asr x4, x5, #20

# qhasm: new_g = prod_lo 
# asm 1: mov >new_g=int64#5,<prod_lo=int64#5
# asm 2: mov >new_g=x4,<prod_lo=x4
mov x4,x4

# qhasm: f = new_f
# asm 1: mov >f=int64#6,<new_f=int64#16
# asm 2: mov >f=x5,<new_f=x15
mov x5,x15

# qhasm: g = new_g
# asm 1: mov >g=int64#5,<new_g=int64#5
# asm 2: mov >g=x4,<new_g=x4
mov x4,x4

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#16,<u=int64#12,<uu=int64#7
# asm 2: mul >tmp=x15,<u=x11,<uu=x6
mul x15,x11,x6

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#16, <v=int64#14, <rr=int64#8, <tmp=int64#16
# asm 2: madd >new_uu=x15, <v=x13, <rr=x7, <tmp=x15
madd x15, x13, x7, x15

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#7,<r=int64#13,<uu=int64#7
# asm 2: mul >tmp=x6,<r=x12,<uu=x6
mul x6,x12,x6

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#7, <s=int64#15, <rr=int64#8, <tmp=int64#7
# asm 2: madd >new_rr=x6, <s=x14, <rr=x7, <tmp=x6
madd x6, x14, x7, x6

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#8,<u=int64#12,<vv=int64#9
# asm 2: mul >tmp=x7,<u=x11,<vv=x8
mul x7,x11,x8

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#8, <v=int64#14, <ss=int64#10, <tmp=int64#8
# asm 2: madd >new_vv=x7, <v=x13, <ss=x9, <tmp=x7
madd x7, x13, x9, x7

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#9,<r=int64#13,<vv=int64#9
# asm 2: mul >tmp=x8,<r=x12,<vv=x8
mul x8,x12,x8

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#9, <s=int64#15, <ss=int64#10, <tmp=int64#9
# asm 2: madd >new_ss=x8, <s=x14, <ss=x9, <tmp=x8
madd x8, x14, x9, x8

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#10,<new_uu=int64#16
# asm 2: mov >uu=x9,<new_uu=x15
mov x9,x15

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#8,<new_vv=int64#8
# asm 2: mov >vv=x7,<new_vv=x7
mov x7,x7

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#7,<new_rr=int64#7
# asm 2: mov >rr=x6,<new_rr=x6
mov x6,x6

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#9,<new_ss=int64#9
# asm 2: mov >ss=x8,<new_ss=x8
mov x8,x8

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#6, <f=int64#6, #1048575
# asm 2: and >fuv=x5, <f=x5, #1048575
and x5, x5, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#5, <g=int64#5, #1048575
# asm 2: and >grs=x4, <g=x4, #1048575
and x4, x4, #1048575

# qhasm: fuv -= _2p41
# asm 1: sub <fuv=int64#6,<fuv=int64#6,<_2p41=int64#1
# asm 2: sub <fuv=x5,<fuv=x5,<_2p41=x0
sub x5,x5,x0

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#5,<grs=int64#5,<2p62=int64#3
# asm 2: sub <grs=x4,<grs=x4,<2p62=x2
sub x4,x4,x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm: v = fuv
# asm 1: mov >v=int64#12,<fuv=int64#6
# asm 2: mov >v=x11,<fuv=x5
mov x11,x5

# qhasm: v = v + 1048576
# asm 1: add >v=int64#12,<v=int64#12,#1048576
# asm 2: add >v=x11,<v=x11,#1048576
add x11,x11,#1048576

# qhasm: v = v + _2p41
# asm 1: add >v=int64#12,<v=int64#12,<_2p41=int64#1
# asm 2: add >v=x11,<v=x11,<_2p41=x0
add x11,x11,x0

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#12, <v=int64#12, #42
# asm 2: asr >v=x11, <v=x11, #42
asr x11, x11, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#6,<fuv=int64#6,#1048576
# asm 2: add >u=x5,<fuv=x5,#1048576
add x5,x5,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#6, <u=int64#6, #22
# asm 2: lsl >u=x5, <u=x5, #22
lsl x5, x5, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#6, <u=int64#6, #43
# asm 2: asr >u=x5, <u=x5, #43
asr x5, x5, #43

# qhasm: s = grs
# asm 1: mov >s=int64#13,<grs=int64#5
# asm 2: mov >s=x12,<grs=x4
mov x12,x4

# qhasm: s = s + 1048576
# asm 1: add >s=int64#13,<s=int64#13,#1048576
# asm 2: add >s=x12,<s=x12,#1048576
add x12,x12,#1048576

# qhasm: s = s + _2p41
# asm 1: add >s=int64#13,<s=int64#13,<_2p41=int64#1
# asm 2: add >s=x12,<s=x12,<_2p41=x0
add x12,x12,x0

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#13, <s=int64#13, #42
# asm 2: asr >s=x12, <s=x12, #42
asr x12, x12, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#5,<grs=int64#5,#1048576
# asm 2: add >r=x4,<grs=x4,#1048576
add x4,x4,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#5, <r=int64#5, #22
# asm 2: lsl >r=x4, <r=x4, #22
lsl x4, x4, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#5, <r=int64#5, #43
# asm 2: asr >r=x4, <r=x4, #43
asr x4, x4, #43

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#14,<u=int64#6,<uu=int64#10
# asm 2: mul >tmp=x13,<u=x5,<uu=x9
mul x13,x5,x9

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#14, <v=int64#12, <rr=int64#7, <tmp=int64#14
# asm 2: madd >new_uu=x13, <v=x11, <rr=x6, <tmp=x13
madd x13, x11, x6, x13

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#10,<r=int64#5,<uu=int64#10
# asm 2: mul >tmp=x9,<r=x4,<uu=x9
mul x9,x4,x9

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#7, <s=int64#13, <rr=int64#7, <tmp=int64#10
# asm 2: madd >new_rr=x6, <s=x12, <rr=x6, <tmp=x9
madd x6, x12, x6, x9

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#6,<u=int64#6,<vv=int64#8
# asm 2: mul >tmp=x5,<u=x5,<vv=x7
mul x5,x5,x7

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#6, <v=int64#12, <ss=int64#9, <tmp=int64#6
# asm 2: madd >new_vv=x5, <v=x11, <ss=x8, <tmp=x5
madd x5, x11, x8, x5

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#5,<r=int64#5,<vv=int64#8
# asm 2: mul >tmp=x4,<r=x4,<vv=x7
mul x4,x4,x7

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#5, <s=int64#13, <ss=int64#9, <tmp=int64#5
# asm 2: madd >new_ss=x4, <s=x12, <ss=x8, <tmp=x4
madd x4, x12, x8, x4

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#8,<new_uu=int64#14
# asm 2: mov >uu=x7,<new_uu=x13
mov x7,x13

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#6,<new_vv=int64#6
# asm 2: mov >vv=x5,<new_vv=x5
mov x5,x5

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#7,<new_rr=int64#7
# asm 2: mov >rr=x6,<new_rr=x6
mov x6,x6

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#5,<new_ss=int64#5
# asm 2: mov >ss=x4,<new_ss=x4
mov x4,x4

# qhasm: int64 ITERATION

# qhasm: ITERATION = 9
# asm 1: mov >ITERATION=int64#9, #9
# asm 2: mov >ITERATION=x8, #9
mov x8, #9

# qhasm: reg128 vec_V0_V1_S0_S1

# qhasm: reg128 vec_V2_V3_S2_S3

# qhasm: reg128 vec_V4_V5_S4_S5

# qhasm: reg128 vec_V6_V7_S6_S7

# qhasm: reg128 vec_V8_V9_S8_S9

# qhasm: int64 one

# qhasm: one = 1
# asm 1: mov >one=int64#10, #1
# asm 2: mov >one=x9, #1
mov x9, #1

# qhasm: vec_V0_V1_S0_S1[0/2] = zero
# asm 1: ins <vec_V0_V1_S0_S1=reg128#11.d[0], <zero=int64#11
# asm 2: ins <vec_V0_V1_S0_S1=v10.d[0], <zero=x10
ins v10.d[0], x10

# qhasm: vec_V0_V1_S0_S1[1/2] = one
# asm 1: ins <vec_V0_V1_S0_S1=reg128#11.d[1], <one=int64#10
# asm 2: ins <vec_V0_V1_S0_S1=v10.d[1], <one=x9
ins v10.d[1], x9

# qhasm: 2x vec_V2_V3_S2_S3 = 0
# asm 1: movi <vec_V2_V3_S2_S3=reg128#12.2d, #0
# asm 2: movi <vec_V2_V3_S2_S3=v11.2d, #0
movi v11.2d, #0

# qhasm: 2x vec_V4_V5_S4_S5 = 0
# asm 1: movi <vec_V4_V5_S4_S5=reg128#14.2d, #0
# asm 2: movi <vec_V4_V5_S4_S5=v13.2d, #0
movi v13.2d, #0

# qhasm: 2x vec_V6_V7_S6_S7 = 0
# asm 1: movi <vec_V6_V7_S6_S7=reg128#15.2d, #0
# asm 2: movi <vec_V6_V7_S6_S7=v14.2d, #0
movi v14.2d, #0

# qhasm: 2x vec_V8_V9_S8_S9 = 0
# asm 1: movi <vec_V8_V9_S8_S9=reg128#16.2d, #0
# asm 2: movi <vec_V8_V9_S8_S9=v15.2d, #0
movi v15.2d, #0

# qhasm: main_i_loop:
._main_i_loop:

# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#10, <uu=int64#8, #0, #30
# asm 2: ubfx >uu0=x9, <uu=x7, #0, #30
ubfx x9, x7, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#8, <uu=int64#8, #30, #32
# asm 2: ubfx >uu1=x7, <uu=x7, #30, #32
ubfx x7, x7, #30, #32

# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#11, <vv=int64#6, #0, #30
# asm 2: ubfx >vv0=x10, <vv=x5, #0, #30
ubfx x10, x5, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#6, <vv=int64#6, #30, #32
# asm 2: ubfx >vv1=x5, <vv=x5, #30, #32
ubfx x5, x5, #30, #32

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#12, <rr=int64#7, #0, #30
# asm 2: ubfx >rr0=x11, <rr=x6, #0, #30
ubfx x11, x6, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#7, <rr=int64#7, #30, #32
# asm 2: ubfx >rr1=x6, <rr=x6, #30, #32
ubfx x6, x6, #30, #32

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#13, <ss=int64#5, #0, #30
# asm 2: ubfx >ss0=x12, <ss=x4, #0, #30
ubfx x12, x4, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#5, <ss=int64#5, #30, #32
# asm 2: ubfx >ss1=x4, <ss=x4, #30, #32
ubfx x4, x4, #30, #32

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[0], <uu0=int64#10%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[0], <uu0=w9
ins v17.s[0], w9

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[1], <rr0=int64#12%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[1], <rr0=w11
ins v17.s[1], w11

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[2], <vv0=int64#11%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[2], <vv0=w10
ins v17.s[2], w10

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[3], <ss0=int64#13%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[3], <ss0=w12
ins v17.s[3], w12

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[0], <uu1=int64#8%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[0], <uu1=w7
ins v18.s[0], w7

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[1], <rr1=int64#7%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[1], <rr1=w6
ins v18.s[1], w6

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[2], <vv1=int64#6%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[2], <vv1=w5
ins v18.s[2], w5

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[3], <ss1=int64#5%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[3], <ss1=w4
ins v18.s[3], w4

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smull >vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#13.s[0]
# asm 2: smull >vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F0_F1_G0_G1=v12.s[0]
smull v19.2d,v17.2s,v12.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#13.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F0_F1_G0_G1=v12.s[2]
smlal2 v19.2d,v17.4s,v12.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#13.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F0_F1_G0_G1=v12.s[1]
smlal v19.2d,v17.2s,v12.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#13.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F0_F1_G0_G1=v12.s[3]
smlal2 v19.2d,v17.4s,v12.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F0_F1_G0_G1=reg128#13.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F0_F1_G0_G1=v12.s[0]
smlal v19.2d,v18.2s,v12.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F0_F1_G0_G1=reg128#13.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F0_F1_G0_G1=v12.s[2]
smlal2 v19.2d,v18.4s,v12.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#1.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F2_F3_G2_G3=v0.s[0]
smlal v19.2d,v17.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F2_F3_G2_G3=v0.s[2]
smlal2 v19.2d,v17.4s,v0.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F0_F1_G0_G1=reg128#13.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F0_F1_G0_G1=v12.s[1]
smlal v19.2d,v18.2s,v12.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F0_F1_G0_G1=reg128#13.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F0_F1_G0_G1=v12.s[3]
smlal2 v19.2d,v18.4s,v12.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#13.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v12.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v12.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: vec_F0_F1_G0_G1 = vec_buffer
# asm 1: mov >vec_F0_F1_G0_G1=reg128#13.16b, <vec_buffer=reg128#13.16b
# asm 2: mov >vec_F0_F1_G0_G1=v12.16b, <vec_buffer=v12.16b
mov v12.16b, v12.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#1.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F2_F3_G2_G3=v0.s[1]
smlal v19.2d,v17.2s,v0.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#1.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F2_F3_G2_G3=v0.s[3]
smlal2 v19.2d,v17.4s,v0.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F2_F3_G2_G3=reg128#1.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F2_F3_G2_G3=v0.s[0]
smlal v19.2d,v18.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F2_F3_G2_G3=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F2_F3_G2_G3=v0.s[2]
smlal2 v19.2d,v18.4s,v0.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#21.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v20.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v20.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#21.2d, <vec_buffer=reg128#21.2d, #32
# asm 2: shl >vec_buffer=v20.2d, <vec_buffer=v20.2d, #32
shl v20.2d, v20.2d, #32

# qhasm: vec_F0_F1_G0_G1 |= vec_buffer
# asm 1: orr <vec_F0_F1_G0_G1=reg128#13.16b, <vec_F0_F1_G0_G1=reg128#13.16b, <vec_buffer=reg128#21.16b
# asm 2: orr <vec_F0_F1_G0_G1=v12.16b, <vec_F0_F1_G0_G1=v12.16b, <vec_buffer=v20.16b
orr v12.16b, v12.16b, v20.16b

# qhasm:             f_hi = vec_F0_F1_G0_G1[1/4]
# asm 1: smov >f_hi=int64#5, <vec_F0_F1_G0_G1=reg128#13.s[1]
# asm 2: smov >f_hi=x4, <vec_F0_F1_G0_G1=v12.s[1]
smov x4, v12.s[1]

# qhasm:             f = vec_F0_F1_G0_G1[0/4]
# asm 1: smov >f=int64#6, <vec_F0_F1_G0_G1=reg128#13.s[0]
# asm 2: smov >f=x5, <vec_F0_F1_G0_G1=v12.s[0]
smov x5, v12.s[0]

# qhasm:             g_hi = vec_F0_F1_G0_G1[3/4]
# asm 1: smov >g_hi=int64#7, <vec_F0_F1_G0_G1=reg128#13.s[3]
# asm 2: smov >g_hi=x6, <vec_F0_F1_G0_G1=v12.s[3]
smov x6, v12.s[3]

# qhasm:             g = vec_F0_F1_G0_G1[2/4]
# asm 1: smov >g=int64#8, <vec_F0_F1_G0_G1=reg128#13.s[2]
# asm 2: smov >g=x7, <vec_F0_F1_G0_G1=v12.s[2]
smov x7, v12.s[2]

# qhasm:             f = f + f_hi << 30
# asm 1: add >f=int64#5,<f=int64#6,<f_hi=int64#5,LSL #30
# asm 2: add >f=x4,<f=x5,<f_hi=x4,LSL #30
add x4,x5,x4,LSL #30

# qhasm:             g = g + g_hi << 30
# asm 1: add >g=int64#6,<g=int64#8,<g_hi=int64#7,LSL #30
# asm 2: add >g=x5,<g=x7,<g_hi=x6,LSL #30
add x5,x7,x6,LSL #30

# qhasm:             fuv = f & 1048575
# asm 1: and >fuv=int64#7, <f=int64#5, #1048575
# asm 2: and >fuv=x6, <f=x4, #1048575
and x6, x4, #1048575

# qhasm:             grs = g & 1048575
# asm 1: and >grs=int64#8, <g=int64#6, #1048575
# asm 2: and >grs=x7, <g=x5, #1048575
and x7, x5, #1048575

# qhasm:             fuv -= _2p41
# asm 1: sub <fuv=int64#7,<fuv=int64#7,<_2p41=int64#1
# asm 2: sub <fuv=x6,<fuv=x6,<_2p41=x0
sub x6,x6,x0

# qhasm:             grs -= 2p62
# asm 1: sub <grs=int64#8,<grs=int64#8,<2p62=int64#3
# asm 2: sub <grs=x7,<grs=x7,<2p62=x2
sub x7,x7,x2

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F4_F5_G4_G5=reg128#5.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F4_F5_G4_G5=v4.s[0]
smlal v19.2d,v17.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F4_F5_G4_G5=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F4_F5_G4_G5=v4.s[2]
smlal2 v19.2d,v17.4s,v4.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F2_F3_G2_G3=reg128#1.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F2_F3_G2_G3=v0.s[1]
smlal v19.2d,v18.2s,v0.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F2_F3_G2_G3=reg128#1.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F2_F3_G2_G3=v0.s[3]
smlal2 v19.2d,v18.4s,v0.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#1.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v0.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v0.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: vec_F2_F3_G2_G3 = vec_buffer
# asm 1: mov >vec_F2_F3_G2_G3=reg128#1.16b, <vec_buffer=reg128#1.16b
# asm 2: mov >vec_F2_F3_G2_G3=v0.16b, <vec_buffer=v0.16b
mov v0.16b, v0.16b

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F4_F5_G4_G5=reg128#5.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F4_F5_G4_G5=v4.s[1]
smlal v19.2d,v17.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F4_F5_G4_G5=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F4_F5_G4_G5=v4.s[3]
smlal2 v19.2d,v17.4s,v4.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F4_F5_G4_G5=reg128#5.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F4_F5_G4_G5=v4.s[0]
smlal v19.2d,v18.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F4_F5_G4_G5=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F4_F5_G4_G5=v4.s[2]
smlal2 v19.2d,v18.4s,v4.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#21.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v20.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v20.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#21.2d, <vec_buffer=reg128#21.2d, #32
# asm 2: shl >vec_buffer=v20.2d, <vec_buffer=v20.2d, #32
shl v20.2d, v20.2d, #32

# qhasm: vec_F2_F3_G2_G3 |= vec_buffer
# asm 1: orr <vec_F2_F3_G2_G3=reg128#1.16b, <vec_F2_F3_G2_G3=reg128#1.16b, <vec_buffer=reg128#21.16b
# asm 2: orr <vec_F2_F3_G2_G3=v0.16b, <vec_F2_F3_G2_G3=v0.16b, <vec_buffer=v20.16b
orr v0.16b, v0.16b, v20.16b

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F6_F7_G6_G7=reg128#2.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F6_F7_G6_G7=v1.s[0]
smlal v19.2d,v17.2s,v1.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F6_F7_G6_G7=reg128#2.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F6_F7_G6_G7=v1.s[2]
smlal2 v19.2d,v17.4s,v1.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F4_F5_G4_G5=reg128#5.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F4_F5_G4_G5=v4.s[1]
smlal v19.2d,v18.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F4_F5_G4_G5=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F4_F5_G4_G5=v4.s[3]
smlal2 v19.2d,v18.4s,v4.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#5.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v4.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v4.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: vec_F4_F5_G4_G5 = vec_buffer
# asm 1: mov >vec_F4_F5_G4_G5=reg128#5.16b, <vec_buffer=reg128#5.16b
# asm 2: mov >vec_F4_F5_G4_G5=v4.16b, <vec_buffer=v4.16b
mov v4.16b, v4.16b

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F6_F7_G6_G7=reg128#2.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F6_F7_G6_G7=v1.s[1]
smlal v19.2d,v17.2s,v1.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F6_F7_G6_G7=reg128#2.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F6_F7_G6_G7=v1.s[3]
smlal2 v19.2d,v17.4s,v1.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F6_F7_G6_G7=reg128#2.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F6_F7_G6_G7=v1.s[0]
smlal v19.2d,v18.2s,v1.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F6_F7_G6_G7=reg128#2.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F6_F7_G6_G7=v1.s[2]
smlal2 v19.2d,v18.4s,v1.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#21.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v20.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v20.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#21.2d, <vec_buffer=reg128#21.2d, #32
# asm 2: shl >vec_buffer=v20.2d, <vec_buffer=v20.2d, #32
shl v20.2d, v20.2d, #32

# qhasm: vec_F4_F5_G4_G5 |= vec_buffer
# asm 1: orr <vec_F4_F5_G4_G5=reg128#5.16b, <vec_F4_F5_G4_G5=reg128#5.16b, <vec_buffer=reg128#21.16b
# asm 2: orr <vec_F4_F5_G4_G5=v4.16b, <vec_F4_F5_G4_G5=v4.16b, <vec_buffer=v20.16b
orr v4.16b, v4.16b, v20.16b

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F8_F9_G8_G9=reg128#3.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F8_F9_G8_G9=v2.s[0]
smlal v19.2d,v17.2s,v2.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F8_F9_G8_G9=reg128#3.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F8_F9_G8_G9=v2.s[2]
smlal2 v19.2d,v17.4s,v2.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F6_F7_G6_G7=reg128#2.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F6_F7_G6_G7=v1.s[1]
smlal v19.2d,v18.2s,v1.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F6_F7_G6_G7=reg128#2.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F6_F7_G6_G7=v1.s[3]
smlal2 v19.2d,v18.4s,v1.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#2.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v1.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v1.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: vec_F6_F7_G6_G7 = vec_buffer
# asm 1: mov >vec_F6_F7_G6_G7=reg128#2.16b, <vec_buffer=reg128#2.16b
# asm 2: mov >vec_F6_F7_G6_G7=v1.16b, <vec_buffer=v1.16b
mov v1.16b, v1.16b

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F8_F9_G8_G9=reg128#3.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F8_F9_G8_G9=v2.s[0]
smlal v19.2d,v18.2s,v2.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F8_F9_G8_G9=reg128#3.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F8_F9_G8_G9=v2.s[2]
smlal2 v19.2d,v18.4s,v2.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#3.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v2.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v2.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#3.2d, <vec_buffer=reg128#3.2d, #32
# asm 2: shl >vec_buffer=v2.2d, <vec_buffer=v2.2d, #32
shl v2.2d, v2.2d, #32

# qhasm: vec_F6_F7_G6_G7 |= vec_buffer
# asm 1: orr <vec_F6_F7_G6_G7=reg128#2.16b, <vec_F6_F7_G6_G7=reg128#2.16b, <vec_buffer=reg128#3.16b
# asm 2: orr <vec_F6_F7_G6_G7=v1.16b, <vec_F6_F7_G6_G7=v1.16b, <vec_buffer=v2.16b
orr v1.16b, v1.16b, v2.16b

# qhasm: vec_F8_F9_G8_G9 = vec_prod
# asm 1: mov >vec_F8_F9_G8_G9=reg128#3.16b, <vec_prod=reg128#20.16b
# asm 2: mov >vec_F8_F9_G8_G9=v2.16b, <vec_prod=v19.16b
mov v2.16b, v19.16b

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: reg128 final_add_0

# qhasm: reg128 final_add_1

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smull >vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V0_V1_S0_S1=reg128#11.s[0]
# asm 2: smull >vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V0_V1_S0_S1=v10.s[0]
smull v19.2d,v17.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V0_V1_S0_S1=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V0_V1_S0_S1=v10.s[2]
smlal2 v19.2d,v17.4s,v10.s[2]

# qhasm: reg128 vec_l0

# qhasm: 4x vec_l0 = vec_prod * vec_M
# asm 1: mul >vec_l0=reg128#21.4s,<vec_prod=reg128#20.4s,<vec_M=reg128#10.4s
# asm 2: mul >vec_l0=v20.4s,<vec_prod=v19.4s,<vec_M=v9.4s
mul v20.4s,v19.4s,v9.4s

# qhasm: vec_l0 &= vec_2x_2p30m1
# asm 1: and <vec_l0=reg128#21.16b, <vec_l0=reg128#21.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and <vec_l0=v20.16b, <vec_l0=v20.16b, <vec_2x_2p30m1=v6.16b
and v20.16b, v20.16b, v6.16b

# qhasm: 4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4]
# asm 1: uzp1 >vec_l0=reg128#21.4s, <vec_l0=reg128#21.4s, <vec_l0=reg128#21.4s
# asm 2: uzp1 >vec_l0=v20.4s, <vec_l0=v20.4s, <vec_l0=v20.4s
uzp1 v20.4s, v20.4s, v20.4s

# qhasm: 2x vec_prod -= vec_l0[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#20.2d,<vec_l0=reg128#21.2s,<vec_4x_19=reg128#4.2s
# asm 2: smlsl <vec_prod=v19.2d,<vec_l0=v20.2s,<vec_4x_19=v3.2s
smlsl v19.2d,v20.2s,v3.2s

# qhasm: 2x final_add_0 = vec_l0[0] << 15
# asm 1: sshll >final_add_0=reg128#21.2d,<vec_l0=reg128#21.2s,#15
# asm 2: sshll >final_add_0=v20.2d,<vec_l0=v20.2s,#15
sshll v20.2d,v20.2s,#15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V0_V1_S0_S1=reg128#11.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V0_V1_S0_S1=v10.s[1]
smlal v19.2d,v17.2s,v10.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V0_V1_S0_S1=reg128#11.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V0_V1_S0_S1=v10.s[3]
smlal2 v19.2d,v17.4s,v10.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V0_V1_S0_S1=reg128#11.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V0_V1_S0_S1=v10.s[0]
smlal v19.2d,v18.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V0_V1_S0_S1=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V0_V1_S0_S1=v10.s[2]
smlal2 v19.2d,v18.4s,v10.s[2]

# qhasm: reg128 vec_l1

# qhasm: 4x vec_l1 = vec_prod * vec_M
# asm 1: mul >vec_l1=reg128#22.4s,<vec_prod=reg128#20.4s,<vec_M=reg128#10.4s
# asm 2: mul >vec_l1=v21.4s,<vec_prod=v19.4s,<vec_M=v9.4s
mul v21.4s,v19.4s,v9.4s

# qhasm: vec_l1 &= vec_2x_2p30m1
# asm 1: and <vec_l1=reg128#22.16b, <vec_l1=reg128#22.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and <vec_l1=v21.16b, <vec_l1=v21.16b, <vec_2x_2p30m1=v6.16b
and v21.16b, v21.16b, v6.16b

# qhasm: 4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4]
# asm 1: uzp1 >vec_l1=reg128#22.4s, <vec_l1=reg128#22.4s, <vec_l1=reg128#22.4s
# asm 2: uzp1 >vec_l1=v21.4s, <vec_l1=v21.4s, <vec_l1=v21.4s
uzp1 v21.4s, v21.4s, v21.4s

# qhasm: 2x vec_prod -= vec_l1[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#20.2d,<vec_l1=reg128#22.2s,<vec_4x_19=reg128#4.2s
# asm 2: smlsl <vec_prod=v19.2d,<vec_l1=v21.2s,<vec_4x_19=v3.2s
smlsl v19.2d,v21.2s,v3.2s

# qhasm: 2x final_add_1 = vec_l1[0] << 15
# asm 1: sshll >final_add_1=reg128#22.2d,<vec_l1=reg128#22.2s,#15
# asm 2: sshll >final_add_1=v21.2d,<vec_l1=v21.2s,#15
sshll v21.2d,v21.2s,#15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V2_V3_S2_S3=reg128#12.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V2_V3_S2_S3=v11.s[0]
smlal v19.2d,v17.2s,v11.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V2_V3_S2_S3=reg128#12.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V2_V3_S2_S3=v11.s[2]
smlal2 v19.2d,v17.4s,v11.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V0_V1_S0_S1=reg128#11.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V0_V1_S0_S1=v10.s[1]
smlal v19.2d,v18.2s,v10.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V0_V1_S0_S1=reg128#11.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V0_V1_S0_S1=v10.s[3]
smlal2 v19.2d,v18.4s,v10.s[3]

# qhasm: vec_V0_V1_S0_S1 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V0_V1_S0_S1=reg128#11.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V0_V1_S0_S1=v10.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v10.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V2_V3_S2_S3=reg128#12.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V2_V3_S2_S3=v11.s[1]
smlal v19.2d,v17.2s,v11.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V2_V3_S2_S3=reg128#12.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V2_V3_S2_S3=v11.s[3]
smlal2 v19.2d,v17.4s,v11.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V2_V3_S2_S3=reg128#12.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V2_V3_S2_S3=v11.s[0]
smlal v19.2d,v18.2s,v11.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V2_V3_S2_S3=reg128#12.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V2_V3_S2_S3=v11.s[2]
smlal2 v19.2d,v18.4s,v11.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#23.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v22.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v22.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#23.2d, <vec_buffer=reg128#23.2d, #32
# asm 2: shl >vec_buffer=v22.2d, <vec_buffer=v22.2d, #32
shl v22.2d, v22.2d, #32

# qhasm: vec_V0_V1_S0_S1 |= vec_buffer
# asm 1: orr <vec_V0_V1_S0_S1=reg128#11.16b, <vec_V0_V1_S0_S1=reg128#11.16b, <vec_buffer=reg128#23.16b
# asm 2: orr <vec_V0_V1_S0_S1=v10.16b, <vec_V0_V1_S0_S1=v10.16b, <vec_buffer=v22.16b
orr v10.16b, v10.16b, v22.16b

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V4_V5_S4_S5=reg128#14.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V4_V5_S4_S5=v13.s[0]
smlal v19.2d,v17.2s,v13.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V4_V5_S4_S5=reg128#14.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V4_V5_S4_S5=v13.s[2]
smlal2 v19.2d,v17.4s,v13.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V2_V3_S2_S3=reg128#12.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V2_V3_S2_S3=v11.s[1]
smlal v19.2d,v18.2s,v11.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V2_V3_S2_S3=reg128#12.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V2_V3_S2_S3=v11.s[3]
smlal2 v19.2d,v18.4s,v11.s[3]

# qhasm: vec_V2_V3_S2_S3 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V2_V3_S2_S3=reg128#12.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V2_V3_S2_S3=v11.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v11.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V4_V5_S4_S5=reg128#14.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V4_V5_S4_S5=v13.s[1]
smlal v19.2d,v17.2s,v13.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V4_V5_S4_S5=reg128#14.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V4_V5_S4_S5=v13.s[3]
smlal2 v19.2d,v17.4s,v13.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V4_V5_S4_S5=reg128#14.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V4_V5_S4_S5=v13.s[0]
smlal v19.2d,v18.2s,v13.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V4_V5_S4_S5=reg128#14.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V4_V5_S4_S5=v13.s[2]
smlal2 v19.2d,v18.4s,v13.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#23.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v22.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v22.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#23.2d, <vec_buffer=reg128#23.2d, #32
# asm 2: shl >vec_buffer=v22.2d, <vec_buffer=v22.2d, #32
shl v22.2d, v22.2d, #32

# qhasm: vec_V2_V3_S2_S3 |= vec_buffer
# asm 1: orr <vec_V2_V3_S2_S3=reg128#12.16b, <vec_V2_V3_S2_S3=reg128#12.16b, <vec_buffer=reg128#23.16b
# asm 2: orr <vec_V2_V3_S2_S3=v11.16b, <vec_V2_V3_S2_S3=v11.16b, <vec_buffer=v22.16b
orr v11.16b, v11.16b, v22.16b

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V6_V7_S6_S7=reg128#15.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V6_V7_S6_S7=v14.s[0]
smlal v19.2d,v17.2s,v14.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V6_V7_S6_S7=reg128#15.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V6_V7_S6_S7=v14.s[2]
smlal2 v19.2d,v17.4s,v14.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V4_V5_S4_S5=reg128#14.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V4_V5_S4_S5=v13.s[1]
smlal v19.2d,v18.2s,v13.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V4_V5_S4_S5=reg128#14.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V4_V5_S4_S5=v13.s[3]
smlal2 v19.2d,v18.4s,v13.s[3]

# qhasm: vec_V4_V5_S4_S5 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V4_V5_S4_S5=reg128#14.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V4_V5_S4_S5=v13.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v13.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V6_V7_S6_S7=reg128#15.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V6_V7_S6_S7=v14.s[1]
smlal v19.2d,v17.2s,v14.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V6_V7_S6_S7=reg128#15.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V6_V7_S6_S7=v14.s[3]
smlal2 v19.2d,v17.4s,v14.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V6_V7_S6_S7=reg128#15.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V6_V7_S6_S7=v14.s[0]
smlal v19.2d,v18.2s,v14.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V6_V7_S6_S7=reg128#15.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V6_V7_S6_S7=v14.s[2]
smlal2 v19.2d,v18.4s,v14.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#23.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v22.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v22.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#23.2d, <vec_buffer=reg128#23.2d, #32
# asm 2: shl >vec_buffer=v22.2d, <vec_buffer=v22.2d, #32
shl v22.2d, v22.2d, #32

# qhasm: vec_V4_V5_S4_S5 |= vec_buffer
# asm 1: orr <vec_V4_V5_S4_S5=reg128#14.16b, <vec_V4_V5_S4_S5=reg128#14.16b, <vec_buffer=reg128#23.16b
# asm 2: orr <vec_V4_V5_S4_S5=v13.16b, <vec_V4_V5_S4_S5=v13.16b, <vec_buffer=v22.16b
orr v13.16b, v13.16b, v22.16b

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V8_V9_S8_S9=reg128#16.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V8_V9_S8_S9=v15.s[0]
smlal v19.2d,v17.2s,v15.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V8_V9_S8_S9=reg128#16.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V8_V9_S8_S9=v15.s[2]
smlal2 v19.2d,v17.4s,v15.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V6_V7_S6_S7=reg128#15.s[1]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V6_V7_S6_S7=v14.s[1]
smlal v19.2d,v18.2s,v14.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V6_V7_S6_S7=reg128#15.s[3]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V6_V7_S6_S7=v14.s[3]
smlal2 v19.2d,v18.4s,v14.s[3]

# qhasm: 2x vec_prod += final_add_0
# asm 1: add <vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, <final_add_0=reg128#21.2d
# asm 2: add <vec_prod=v19.2d, <vec_prod=v19.2d, <final_add_0=v20.2d
add v19.2d, v19.2d, v20.2d

# qhasm: vec_V6_V7_S6_S7 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V6_V7_S6_S7=reg128#15.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V6_V7_S6_S7=v14.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v14.16b, v19.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v19.2d, <vec_prod=v19.2d, #30
sshr v19.2d, v19.2d, #30

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V8_V9_S8_S9=reg128#16.s[0]
# asm 2: smlal <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V8_V9_S8_S9=v15.s[0]
smlal v19.2d,v18.2s,v15.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#20.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V8_V9_S8_S9=reg128#16.s[2]
# asm 2: smlal2 <vec_prod=v19.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V8_V9_S8_S9=v15.s[2]
smlal2 v19.2d,v18.4s,v15.s[2]

# qhasm: 2x vec_prod += final_add_1
# asm 1: add <vec_prod=reg128#20.2d, <vec_prod=reg128#20.2d, <final_add_1=reg128#22.2d
# asm 2: add <vec_prod=v19.2d, <vec_prod=v19.2d, <final_add_1=v21.2d
add v19.2d, v19.2d, v21.2d

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#16.16b, <vec_prod=reg128#20.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v15.16b, <vec_prod=v19.16b, <vec_2x_2p30m1=v6.16b
and v15.16b, v19.16b, v6.16b

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#16.2d, <vec_buffer=reg128#16.2d, #32
# asm 2: shl >vec_buffer=v15.2d, <vec_buffer=v15.2d, #32
shl v15.2d, v15.2d, #32

# qhasm: vec_V6_V7_S6_S7 |= vec_buffer
# asm 1: orr <vec_V6_V7_S6_S7=reg128#15.16b, <vec_V6_V7_S6_S7=reg128#15.16b, <vec_buffer=reg128#16.16b
# asm 2: orr <vec_V6_V7_S6_S7=v14.16b, <vec_V6_V7_S6_S7=v14.16b, <vec_buffer=v15.16b
orr v14.16b, v14.16b, v15.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#16.2d, <vec_prod=reg128#20.2d, #30
# asm 2: sshr >vec_prod=v15.2d, <vec_prod=v19.2d, #30
sshr v15.2d, v19.2d, #30

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: reg128 vec_carry

# qhasm: 2x vec_carry = vec_prod >> 15
# asm 1: sshr <vec_carry=reg128#17.2d, <vec_prod=reg128#16.2d, #15
# asm 2: sshr <vec_carry=v16.2d, <vec_prod=v15.2d, #15
sshr v16.2d, v15.2d, #15

# qhasm: vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
# asm 1: and >vec_V8_V9_S8_S9=reg128#16.16b, <vec_prod=reg128#16.16b, <vec_2x_2p15m1=reg128#8.16b
# asm 2: and >vec_V8_V9_S8_S9=v15.16b, <vec_prod=v15.16b, <vec_2x_2p15m1=v7.16b
and v15.16b, v15.16b, v7.16b

# qhasm: 4x vec_buffer = vec_4x_19 * vec_carry
# asm 1: mul >vec_buffer=reg128#20.4s,<vec_4x_19=reg128#4.4s,<vec_carry=reg128#17.4s
# asm 2: mul >vec_buffer=v19.4s,<vec_4x_19=v3.4s,<vec_carry=v16.4s
mul v19.4s,v3.4s,v16.4s

# qhasm: vec_buffer &= vec_2x_2p32m1
# asm 1: and <vec_buffer=reg128#20.16b, <vec_buffer=reg128#20.16b, <vec_2x_2p32m1=reg128#6.16b
# asm 2: and <vec_buffer=v19.16b, <vec_buffer=v19.16b, <vec_2x_2p32m1=v5.16b
and v19.16b, v19.16b, v5.16b

# qhasm: 4x vec_V0_V1_S0_S1 += vec_buffer
# asm 1: add <vec_V0_V1_S0_S1=reg128#11.4s, <vec_V0_V1_S0_S1=reg128#11.4s, <vec_buffer=reg128#20.4s
# asm 2: add <vec_V0_V1_S0_S1=v10.4s, <vec_V0_V1_S0_S1=v10.4s, <vec_buffer=v19.4s
add v10.4s, v10.4s, v19.4s

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# asm 1: sshr <vec_carry=reg128#17.4s, <vec_V0_V1_S0_S1=reg128#11.4s, #30
# asm 2: sshr <vec_carry=v16.4s, <vec_V0_V1_S0_S1=v10.4s, #30
sshr v16.4s, v10.4s, #30

# qhasm: 2x vec_carry = vec_carry << 32
# asm 1: shl >vec_carry=reg128#17.2d, <vec_carry=reg128#17.2d, #32
# asm 2: shl >vec_carry=v16.2d, <vec_carry=v16.2d, #32
shl v16.2d, v16.2d, #32

# qhasm: 4x vec_V0_V1_S0_S1 += vec_carry
# asm 1: add <vec_V0_V1_S0_S1=reg128#11.4s, <vec_V0_V1_S0_S1=reg128#11.4s, <vec_carry=reg128#17.4s
# asm 2: add <vec_V0_V1_S0_S1=v10.4s, <vec_V0_V1_S0_S1=v10.4s, <vec_carry=v16.4s
add v10.4s, v10.4s, v16.4s

# qhasm: 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# asm 1: sshr <vec_carry=reg128#17.4s, <vec_V0_V1_S0_S1=reg128#11.4s, #30
# asm 2: sshr <vec_carry=v16.4s, <vec_V0_V1_S0_S1=v10.4s, #30
sshr v16.4s, v10.4s, #30

# qhasm: 2x vec_carry = vec_carry unsigned>> 32
# asm 1: ushr >vec_carry=reg128#17.2d, <vec_carry=reg128#17.2d, #32
# asm 2: ushr >vec_carry=v16.2d, <vec_carry=v16.2d, #32
ushr v16.2d, v16.2d, #32

# qhasm: vec_V0_V1_S0_S1 &= vec_4x_2p30m1
# asm 1: and <vec_V0_V1_S0_S1=reg128#11.16b, <vec_V0_V1_S0_S1=reg128#11.16b, <vec_4x_2p30m1=reg128#9.16b
# asm 2: and <vec_V0_V1_S0_S1=v10.16b, <vec_V0_V1_S0_S1=v10.16b, <vec_4x_2p30m1=v8.16b
and v10.16b, v10.16b, v8.16b

# qhasm: 4x vec_V2_V3_S2_S3 += vec_carry
# asm 1: add <vec_V2_V3_S2_S3=reg128#12.4s, <vec_V2_V3_S2_S3=reg128#12.4s, <vec_carry=reg128#17.4s
# asm 2: add <vec_V2_V3_S2_S3=v11.4s, <vec_V2_V3_S2_S3=v11.4s, <vec_carry=v16.4s
add v11.4s, v11.4s, v16.4s

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm:             m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:             grs & 1
# asm 1: tst <grs=int64#8, #1
# asm 2: tst <grs=x7, #1
tst x7, #1

# qhasm:             ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#11, <fuv=int64#7, xzr, ne
# asm 2: csel >ff=x10, <fuv=x6, xzr, ne
csel x10, x6, xzr, ne

# qhasm:             m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#8, ROR #1
# asm 2: tst <m1=x9, <grs=x7, ROR #1
tst x9, x7, ROR #1

# qhasm:             m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:             fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#7, <grs=int64#8, <fuv=int64#7, mi
# asm 2: csel >fuv=x6, <grs=x7, <fuv=x6, mi
csel x6, x7, x6, mi

# qhasm:             ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#11, <ff=int64#11, <ff=int64#11, pl
# asm 2: csneg >ff=x10, <ff=x10, <ff=x10, pl
csneg x10, x10, x10, pl

# qhasm:             grs = grs + ff
# asm 1: add >grs=int64#8,<grs=int64#8,<ff=int64#11
# asm 2: add >grs=x7,<grs=x7,<ff=x10
add x7,x7,x10

# qhasm:             grs = grs signed>> 1
# asm 1: asr >grs=int64#8, <grs=int64#8, #1
# asm 2: asr >grs=x7, <grs=x7, #1
asr x7, x7, #1

# qhasm:             free m1

# qhasm:             free ff

# qhasm: vv = fuv
# asm 1: mov >vv=int64#10,<fuv=int64#7
# asm 2: mov >vv=x9,<fuv=x6
mov x9,x6

# qhasm: vv = vv + 1048576
# asm 1: add >vv=int64#10,<vv=int64#10,#1048576
# asm 2: add >vv=x9,<vv=x9,#1048576
add x9,x9,#1048576

# qhasm: vv = vv + _2p41
# asm 1: add >vv=int64#10,<vv=int64#10,<_2p41=int64#1
# asm 2: add >vv=x9,<vv=x9,<_2p41=x0
add x9,x9,x0

# qhasm: vv = vv signed>> 42
# asm 1: asr >vv=int64#10, <vv=int64#10, #42
# asm 2: asr >vv=x9, <vv=x9, #42
asr x9, x9, #42

# qhasm: uu = fuv + 1048576
# asm 1: add >uu=int64#7,<fuv=int64#7,#1048576
# asm 2: add >uu=x6,<fuv=x6,#1048576
add x6,x6,#1048576

# qhasm: uu = uu << 22
# asm 1: lsl >uu=int64#7, <uu=int64#7, #22
# asm 2: lsl >uu=x6, <uu=x6, #22
lsl x6, x6, #22

# qhasm: uu = uu signed>> 43
# asm 1: asr >uu=int64#7, <uu=int64#7, #43
# asm 2: asr >uu=x6, <uu=x6, #43
asr x6, x6, #43

# qhasm: ss = grs
# asm 1: mov >ss=int64#11,<grs=int64#8
# asm 2: mov >ss=x10,<grs=x7
mov x10,x7

# qhasm: ss = ss + 1048576
# asm 1: add >ss=int64#11,<ss=int64#11,#1048576
# asm 2: add >ss=x10,<ss=x10,#1048576
add x10,x10,#1048576

# qhasm: ss = ss + _2p41
# asm 1: add >ss=int64#11,<ss=int64#11,<_2p41=int64#1
# asm 2: add >ss=x10,<ss=x10,<_2p41=x0
add x10,x10,x0

# qhasm: ss = ss signed>> 42
# asm 1: asr >ss=int64#11, <ss=int64#11, #42
# asm 2: asr >ss=x10, <ss=x10, #42
asr x10, x10, #42

# qhasm: rr = grs + 1048576
# asm 1: add >rr=int64#8,<grs=int64#8,#1048576
# asm 2: add >rr=x7,<grs=x7,#1048576
add x7,x7,#1048576

# qhasm: rr = rr << 22
# asm 1: lsl >rr=int64#8, <rr=int64#8, #22
# asm 2: lsl >rr=x7, <rr=x7, #22
lsl x7, x7, #22

# qhasm: rr = rr signed>> 43
# asm 1: asr >rr=int64#8, <rr=int64#8, #43
# asm 2: asr >rr=x7, <rr=x7, #43
asr x7, x7, #43

# qhasm: prod_lo = uu * f
# asm 1: mul >prod_lo=int64#12,<uu=int64#7,<f=int64#5
# asm 2: mul >prod_lo=x11,<uu=x6,<f=x4
mul x11,x6,x4

# qhasm: prod_hi = uu signed* f (hi)
# asm 1: smulh >prod_hi=int64#13, <uu=int64#7, <f=int64#5
# asm 2: smulh >prod_hi=x12, <uu=x6, <f=x4
smulh x12, x6, x4

# qhasm: tmp = vv * g
# asm 1: mul >tmp=int64#14,<vv=int64#10,<g=int64#6
# asm 2: mul >tmp=x13,<vv=x9,<g=x5
mul x13,x9,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#12, <prod_lo=int64#12, <tmp=int64#14
# asm 2: adds <prod_lo=x11, <prod_lo=x11, <tmp=x13
adds x11, x11, x13

# qhasm: tmp = vv signed* g (hi)
# asm 1: smulh >tmp=int64#14, <vv=int64#10, <g=int64#6
# asm 2: smulh >tmp=x13, <vv=x9, <g=x5
smulh x13, x9, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#13,<prod_hi=int64#13,<tmp=int64#14
# asm 2: adc >prod_hi=x12,<prod_hi=x12,<tmp=x13
adc x12,x12,x13

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#12, <prod_lo=int64#12, #20
# asm 2: lsr >prod_lo=x11, <prod_lo=x11, #20
lsr x11, x11, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#13, <prod_hi=int64#13, #44
# asm 2: lsl >prod_hi=x12, <prod_hi=x12, #44
lsl x12, x12, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#12, <prod_lo=int64#12, <prod_hi=int64#13
# asm 2: orr >new_f=x11, <prod_lo=x11, <prod_hi=x12
orr x11, x11, x12

# qhasm: prod_lo = rr * f
# asm 1: mul >prod_lo=int64#13,<rr=int64#8,<f=int64#5
# asm 2: mul >prod_lo=x12,<rr=x7,<f=x4
mul x12,x7,x4

# qhasm: prod_hi = rr signed* f (hi)
# asm 1: smulh >prod_hi=int64#5, <rr=int64#8, <f=int64#5
# asm 2: smulh >prod_hi=x4, <rr=x7, <f=x4
smulh x4, x7, x4

# qhasm: tmp = ss * g
# asm 1: mul >tmp=int64#14,<ss=int64#11,<g=int64#6
# asm 2: mul >tmp=x13,<ss=x10,<g=x5
mul x13,x10,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#13, <prod_lo=int64#13, <tmp=int64#14
# asm 2: adds <prod_lo=x12, <prod_lo=x12, <tmp=x13
adds x12, x12, x13

# qhasm: tmp = ss signed* g (hi)
# asm 1: smulh >tmp=int64#6, <ss=int64#11, <g=int64#6
# asm 2: smulh >tmp=x5, <ss=x10, <g=x5
smulh x5, x10, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#5,<prod_hi=int64#5,<tmp=int64#6
# asm 2: adc >prod_hi=x4,<prod_hi=x4,<tmp=x5
adc x4,x4,x5

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#6, <prod_lo=int64#13, #20
# asm 2: lsr >prod_lo=x5, <prod_lo=x12, #20
lsr x5, x12, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#5, <prod_hi=int64#5, #44
# asm 2: lsl >prod_hi=x4, <prod_hi=x4, #44
lsl x4, x4, #44

# qhasm: g = prod_lo | prod_hi
# asm 1: orr >g=int64#5, <prod_lo=int64#6, <prod_hi=int64#5
# asm 2: orr >g=x4, <prod_lo=x5, <prod_hi=x4
orr x4, x5, x4

# qhasm: f = new_f
# asm 1: mov >f=int64#6,<new_f=int64#12
# asm 2: mov >f=x5,<new_f=x11
mov x5,x11

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#12, <f=int64#6, #1048575
# asm 2: and >fuv=x11, <f=x5, #1048575
and x11, x5, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#13, <g=int64#5, #1048575
# asm 2: and >grs=x12, <g=x4, #1048575
and x12, x4, #1048575

# qhasm: fuv -= _2p41
# asm 1: sub <fuv=int64#12,<fuv=int64#12,<_2p41=int64#1
# asm 2: sub <fuv=x11,<fuv=x11,<_2p41=x0
sub x11,x11,x0

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#13,<grs=int64#13,<2p62=int64#3
# asm 2: sub <grs=x12,<grs=x12,<2p62=x2
sub x12,x12,x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm: v = fuv
# asm 1: mov >v=int64#14,<fuv=int64#12
# asm 2: mov >v=x13,<fuv=x11
mov x13,x11

# qhasm: v = v + 1048576
# asm 1: add >v=int64#14,<v=int64#14,#1048576
# asm 2: add >v=x13,<v=x13,#1048576
add x13,x13,#1048576

# qhasm: v = v + _2p41
# asm 1: add >v=int64#14,<v=int64#14,<_2p41=int64#1
# asm 2: add >v=x13,<v=x13,<_2p41=x0
add x13,x13,x0

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#14, <v=int64#14, #42
# asm 2: asr >v=x13, <v=x13, #42
asr x13, x13, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#12,<fuv=int64#12,#1048576
# asm 2: add >u=x11,<fuv=x11,#1048576
add x11,x11,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#12, <u=int64#12, #22
# asm 2: lsl >u=x11, <u=x11, #22
lsl x11, x11, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#12, <u=int64#12, #43
# asm 2: asr >u=x11, <u=x11, #43
asr x11, x11, #43

# qhasm: s = grs
# asm 1: mov >s=int64#15,<grs=int64#13
# asm 2: mov >s=x14,<grs=x12
mov x14,x12

# qhasm: s = s + 1048576
# asm 1: add >s=int64#15,<s=int64#15,#1048576
# asm 2: add >s=x14,<s=x14,#1048576
add x14,x14,#1048576

# qhasm: s = s + _2p41
# asm 1: add >s=int64#15,<s=int64#15,<_2p41=int64#1
# asm 2: add >s=x14,<s=x14,<_2p41=x0
add x14,x14,x0

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#15, <s=int64#15, #42
# asm 2: asr >s=x14, <s=x14, #42
asr x14, x14, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#13,<grs=int64#13,#1048576
# asm 2: add >r=x12,<grs=x12,#1048576
add x12,x12,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#13, <r=int64#13, #22
# asm 2: lsl >r=x12, <r=x12, #22
lsl x12, x12, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#13, <r=int64#13, #43
# asm 2: asr >r=x12, <r=x12, #43
asr x12, x12, #43

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#16,<u=int64#12,<f=int64#6
# asm 2: mul >prod_lo=x15,<u=x11,<f=x5
mul x15,x11,x5

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#17,<v=int64#14,<g=int64#5
# asm 2: mul >tmp=x16,<v=x13,<g=x4
mul x16,x13,x4

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#16, <prod_lo=int64#16, <tmp=int64#17
# asm 2: adds <prod_lo=x15, <prod_lo=x15, <tmp=x16
adds x15, x15, x16

# qhasm: prod_lo = prod_lo signed>> 20
# asm 1: asr >prod_lo=int64#16, <prod_lo=int64#16, #20
# asm 2: asr >prod_lo=x15, <prod_lo=x15, #20
asr x15, x15, #20

# qhasm: new_f = prod_lo 
# asm 1: mov >new_f=int64#16,<prod_lo=int64#16
# asm 2: mov >new_f=x15,<prod_lo=x15
mov x15,x15

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#6,<r=int64#13,<f=int64#6
# asm 2: mul >prod_lo=x5,<r=x12,<f=x5
mul x5,x12,x5

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#5,<s=int64#15,<g=int64#5
# asm 2: mul >tmp=x4,<s=x14,<g=x4
mul x4,x14,x4

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#6, <prod_lo=int64#6, <tmp=int64#5
# asm 2: adds <prod_lo=x5, <prod_lo=x5, <tmp=x4
adds x5, x5, x4

# qhasm: prod_lo = prod_lo signed>> 20
# asm 1: asr >prod_lo=int64#5, <prod_lo=int64#6, #20
# asm 2: asr >prod_lo=x4, <prod_lo=x5, #20
asr x4, x5, #20

# qhasm: new_g = prod_lo 
# asm 1: mov >new_g=int64#5,<prod_lo=int64#5
# asm 2: mov >new_g=x4,<prod_lo=x4
mov x4,x4

# qhasm: f = new_f
# asm 1: mov >f=int64#6,<new_f=int64#16
# asm 2: mov >f=x5,<new_f=x15
mov x5,x15

# qhasm: g = new_g
# asm 1: mov >g=int64#5,<new_g=int64#5
# asm 2: mov >g=x4,<new_g=x4
mov x4,x4

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#16,<u=int64#12,<uu=int64#7
# asm 2: mul >tmp=x15,<u=x11,<uu=x6
mul x15,x11,x6

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#16, <v=int64#14, <rr=int64#8, <tmp=int64#16
# asm 2: madd >new_uu=x15, <v=x13, <rr=x7, <tmp=x15
madd x15, x13, x7, x15

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#7,<r=int64#13,<uu=int64#7
# asm 2: mul >tmp=x6,<r=x12,<uu=x6
mul x6,x12,x6

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#7, <s=int64#15, <rr=int64#8, <tmp=int64#7
# asm 2: madd >new_rr=x6, <s=x14, <rr=x7, <tmp=x6
madd x6, x14, x7, x6

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#8,<u=int64#12,<vv=int64#10
# asm 2: mul >tmp=x7,<u=x11,<vv=x9
mul x7,x11,x9

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#8, <v=int64#14, <ss=int64#11, <tmp=int64#8
# asm 2: madd >new_vv=x7, <v=x13, <ss=x10, <tmp=x7
madd x7, x13, x10, x7

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#10,<r=int64#13,<vv=int64#10
# asm 2: mul >tmp=x9,<r=x12,<vv=x9
mul x9,x12,x9

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#10, <s=int64#15, <ss=int64#11, <tmp=int64#10
# asm 2: madd >new_ss=x9, <s=x14, <ss=x10, <tmp=x9
madd x9, x14, x10, x9

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#11,<new_uu=int64#16
# asm 2: mov >uu=x10,<new_uu=x15
mov x10,x15

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#8,<new_vv=int64#8
# asm 2: mov >vv=x7,<new_vv=x7
mov x7,x7

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#7,<new_rr=int64#7
# asm 2: mov >rr=x6,<new_rr=x6
mov x6,x6

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#10,<new_ss=int64#10
# asm 2: mov >ss=x9,<new_ss=x9
mov x9,x9

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#6, <f=int64#6, #1048575
# asm 2: and >fuv=x5, <f=x5, #1048575
and x5, x5, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#5, <g=int64#5, #1048575
# asm 2: and >grs=x4, <g=x4, #1048575
and x4, x4, #1048575

# qhasm: fuv -= _2p41
# asm 1: sub <fuv=int64#6,<fuv=int64#6,<_2p41=int64#1
# asm 2: sub <fuv=x5,<fuv=x5,<_2p41=x0
sub x5,x5,x0

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#5,<grs=int64#5,<2p62=int64#3
# asm 2: sub <grs=x4,<grs=x4,<2p62=x2
sub x4,x4,x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm: v = fuv
# asm 1: mov >v=int64#12,<fuv=int64#6
# asm 2: mov >v=x11,<fuv=x5
mov x11,x5

# qhasm: v = v + 1048576
# asm 1: add >v=int64#12,<v=int64#12,#1048576
# asm 2: add >v=x11,<v=x11,#1048576
add x11,x11,#1048576

# qhasm: v = v + _2p41
# asm 1: add >v=int64#12,<v=int64#12,<_2p41=int64#1
# asm 2: add >v=x11,<v=x11,<_2p41=x0
add x11,x11,x0

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#12, <v=int64#12, #42
# asm 2: asr >v=x11, <v=x11, #42
asr x11, x11, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#6,<fuv=int64#6,#1048576
# asm 2: add >u=x5,<fuv=x5,#1048576
add x5,x5,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#6, <u=int64#6, #22
# asm 2: lsl >u=x5, <u=x5, #22
lsl x5, x5, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#6, <u=int64#6, #43
# asm 2: asr >u=x5, <u=x5, #43
asr x5, x5, #43

# qhasm: s = grs
# asm 1: mov >s=int64#13,<grs=int64#5
# asm 2: mov >s=x12,<grs=x4
mov x12,x4

# qhasm: s = s + 1048576
# asm 1: add >s=int64#13,<s=int64#13,#1048576
# asm 2: add >s=x12,<s=x12,#1048576
add x12,x12,#1048576

# qhasm: s = s + _2p41
# asm 1: add >s=int64#13,<s=int64#13,<_2p41=int64#1
# asm 2: add >s=x12,<s=x12,<_2p41=x0
add x12,x12,x0

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#13, <s=int64#13, #42
# asm 2: asr >s=x12, <s=x12, #42
asr x12, x12, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#5,<grs=int64#5,#1048576
# asm 2: add >r=x4,<grs=x4,#1048576
add x4,x4,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#5, <r=int64#5, #22
# asm 2: lsl >r=x4, <r=x4, #22
lsl x4, x4, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#5, <r=int64#5, #43
# asm 2: asr >r=x4, <r=x4, #43
asr x4, x4, #43

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#14,<u=int64#6,<uu=int64#11
# asm 2: mul >tmp=x13,<u=x5,<uu=x10
mul x13,x5,x10

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#14, <v=int64#12, <rr=int64#7, <tmp=int64#14
# asm 2: madd >new_uu=x13, <v=x11, <rr=x6, <tmp=x13
madd x13, x11, x6, x13

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#11,<r=int64#5,<uu=int64#11
# asm 2: mul >tmp=x10,<r=x4,<uu=x10
mul x10,x4,x10

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#7, <s=int64#13, <rr=int64#7, <tmp=int64#11
# asm 2: madd >new_rr=x6, <s=x12, <rr=x6, <tmp=x10
madd x6, x12, x6, x10

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#6,<u=int64#6,<vv=int64#8
# asm 2: mul >tmp=x5,<u=x5,<vv=x7
mul x5,x5,x7

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#6, <v=int64#12, <ss=int64#10, <tmp=int64#6
# asm 2: madd >new_vv=x5, <v=x11, <ss=x9, <tmp=x5
madd x5, x11, x9, x5

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#5,<r=int64#5,<vv=int64#8
# asm 2: mul >tmp=x4,<r=x4,<vv=x7
mul x4,x4,x7

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#5, <s=int64#13, <ss=int64#10, <tmp=int64#5
# asm 2: madd >new_ss=x4, <s=x12, <ss=x9, <tmp=x4
madd x4, x12, x9, x4

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#8,<new_uu=int64#14
# asm 2: mov >uu=x7,<new_uu=x13
mov x7,x13

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#6,<new_vv=int64#6
# asm 2: mov >vv=x5,<new_vv=x5
mov x5,x5

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#7,<new_rr=int64#7
# asm 2: mov >rr=x6,<new_rr=x6
mov x6,x6

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#5,<new_ss=int64#5
# asm 2: mov >ss=x4,<new_ss=x4
mov x4,x4

# qhasm: ITERATION -= 1 !
# asm 1: subs <ITERATION=int64#9,<ITERATION=int64#9,#1
# asm 2: subs <ITERATION=x8,<ITERATION=x8,#1
subs x8,x8,#1

# qhasm: goto main_i_loop if unsigned>
b.hi ._main_i_loop

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#1, <uu=int64#8, #0, #30
# asm 2: ubfx >uu0=x0, <uu=x7, #0, #30
ubfx x0, x7, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#3, <uu=int64#8, #30, #32
# asm 2: ubfx >uu1=x2, <uu=x7, #30, #32
ubfx x2, x7, #30, #32

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#4, <vv=int64#6, #0, #30
# asm 2: ubfx >vv0=x3, <vv=x5, #0, #30
ubfx x3, x5, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#6, <vv=int64#6, #30, #32
# asm 2: ubfx >vv1=x5, <vv=x5, #30, #32
ubfx x5, x5, #30, #32

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#8, <rr=int64#7, #0, #30
# asm 2: ubfx >rr0=x7, <rr=x6, #0, #30
ubfx x7, x6, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#7, <rr=int64#7, #30, #32
# asm 2: ubfx >rr1=x6, <rr=x6, #30, #32
ubfx x6, x6, #30, #32

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#9, <ss=int64#5, #0, #30
# asm 2: ubfx >ss0=x8, <ss=x4, #0, #30
ubfx x8, x4, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#5, <ss=int64#5, #30, #32
# asm 2: ubfx >ss1=x4, <ss=x4, #30, #32
ubfx x4, x4, #30, #32

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[0], <uu0=int64#1%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[0], <uu0=w0
ins v17.s[0], w0

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[1], <rr0=int64#8%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[1], <rr0=w7
ins v17.s[1], w7

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[2], <vv0=int64#4%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[2], <vv0=w3
ins v17.s[2], w3

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#18.s[3], <ss0=int64#9%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v17.s[3], <ss0=w8
ins v17.s[3], w8

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[0], <uu1=int64#3%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[0], <uu1=w2
ins v18.s[0], w2

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[1], <rr1=int64#7%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[1], <rr1=w6
ins v18.s[1], w6

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[2], <vv1=int64#6%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[2], <vv1=w5
ins v18.s[2], w5

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#19.s[3], <ss1=int64#5%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v18.s[3], <ss1=w4
ins v18.s[3], w4

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smull >vec_prod=reg128#2.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#13.s[0]
# asm 2: smull >vec_prod=v1.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F0_F1_G0_G1=v12.s[0]
smull v1.2d,v17.2s,v12.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#2.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#13.s[2]
# asm 2: smlal2 <vec_prod=v1.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F0_F1_G0_G1=v12.s[2]
smlal2 v1.2d,v17.4s,v12.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#2.2d, <vec_prod=reg128#2.2d, #30
# asm 2: sshr >vec_prod=v1.2d, <vec_prod=v1.2d, #30
sshr v1.2d, v1.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#2.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#13.s[1]
# asm 2: smlal <vec_prod=v1.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F0_F1_G0_G1=v12.s[1]
smlal v1.2d,v17.2s,v12.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#2.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#13.s[3]
# asm 2: smlal2 <vec_prod=v1.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F0_F1_G0_G1=v12.s[3]
smlal2 v1.2d,v17.4s,v12.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smlal <vec_prod=reg128#2.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F0_F1_G0_G1=reg128#13.s[0]
# asm 2: smlal <vec_prod=v1.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F0_F1_G0_G1=v12.s[0]
smlal v1.2d,v18.2s,v12.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#2.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F0_F1_G0_G1=reg128#13.s[2]
# asm 2: smlal2 <vec_prod=v1.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F0_F1_G0_G1=v12.s[2]
smlal2 v1.2d,v18.4s,v12.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#2.2d, <vec_prod=reg128#2.2d, #30
# asm 2: sshr >vec_prod=v1.2d, <vec_prod=v1.2d, #30
sshr v1.2d, v1.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#2.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#1.s[0]
# asm 2: smlal <vec_prod=v1.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F2_F3_G2_G3=v0.s[0]
smlal v1.2d,v17.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#2.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v1.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F2_F3_G2_G3=v0.s[2]
smlal2 v1.2d,v17.4s,v0.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#2.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F0_F1_G0_G1=reg128#13.s[1]
# asm 2: smlal <vec_prod=v1.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F0_F1_G0_G1=v12.s[1]
smlal v1.2d,v18.2s,v12.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#2.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F0_F1_G0_G1=reg128#13.s[3]
# asm 2: smlal2 <vec_prod=v1.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F0_F1_G0_G1=v12.s[3]
smlal2 v1.2d,v18.4s,v12.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#3.16b, <vec_prod=reg128#2.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v2.16b, <vec_prod=v1.16b, <vec_2x_2p30m1=v6.16b
and v2.16b, v1.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#2.2d, <vec_prod=reg128#2.2d, #30
# asm 2: sshr >vec_prod=v1.2d, <vec_prod=v1.2d, #30
sshr v1.2d, v1.2d, #30

# qhasm: vec_F0_F1_G0_G1 = vec_buffer
# asm 1: mov >vec_F0_F1_G0_G1=reg128#3.16b, <vec_buffer=reg128#3.16b
# asm 2: mov >vec_F0_F1_G0_G1=v2.16b, <vec_buffer=v2.16b
mov v2.16b, v2.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#2.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#1.s[1]
# asm 2: smlal <vec_prod=v1.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_F2_F3_G2_G3=v0.s[1]
smlal v1.2d,v17.2s,v0.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#2.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#1.s[3]
# asm 2: smlal2 <vec_prod=v1.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_F2_F3_G2_G3=v0.s[3]
smlal2 v1.2d,v17.4s,v0.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#2.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_F2_F3_G2_G3=reg128#1.s[0]
# asm 2: smlal <vec_prod=v1.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_F2_F3_G2_G3=v0.s[0]
smlal v1.2d,v18.2s,v0.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#2.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_F2_F3_G2_G3=reg128#1.s[2]
# asm 2: smlal2 <vec_prod=v1.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_F2_F3_G2_G3=v0.s[2]
smlal2 v1.2d,v18.4s,v0.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#1.16b, <vec_prod=reg128#2.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v0.16b, <vec_prod=v1.16b, <vec_2x_2p30m1=v6.16b
and v0.16b, v1.16b, v6.16b

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#1.2d, <vec_buffer=reg128#1.2d, #32
# asm 2: shl >vec_buffer=v0.2d, <vec_buffer=v0.2d, #32
shl v0.2d, v0.2d, #32

# qhasm: vec_F0_F1_G0_G1 |= vec_buffer
# asm 1: orr <vec_F0_F1_G0_G1=reg128#3.16b, <vec_F0_F1_G0_G1=reg128#3.16b, <vec_buffer=reg128#1.16b
# asm 2: orr <vec_F0_F1_G0_G1=v2.16b, <vec_F0_F1_G0_G1=v2.16b, <vec_buffer=v0.16b
orr v2.16b, v2.16b, v0.16b

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smull >vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V0_V1_S0_S1=reg128#11.s[0]
# asm 2: smull >vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V0_V1_S0_S1=v10.s[0]
smull v0.2d,v17.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V0_V1_S0_S1=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V0_V1_S0_S1=v10.s[2]
smlal2 v0.2d,v17.4s,v10.s[2]

# qhasm: 4x vec_l0 = vec_prod * vec_M
# asm 1: mul >vec_l0=reg128#2.4s,<vec_prod=reg128#1.4s,<vec_M=reg128#10.4s
# asm 2: mul >vec_l0=v1.4s,<vec_prod=v0.4s,<vec_M=v9.4s
mul v1.4s,v0.4s,v9.4s

# qhasm: vec_l0 &= vec_2x_2p30m1
# asm 1: and <vec_l0=reg128#2.16b, <vec_l0=reg128#2.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and <vec_l0=v1.16b, <vec_l0=v1.16b, <vec_2x_2p30m1=v6.16b
and v1.16b, v1.16b, v6.16b

# qhasm: 4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4]
# asm 1: uzp1 >vec_l0=reg128#2.4s, <vec_l0=reg128#2.4s, <vec_l0=reg128#2.4s
# asm 2: uzp1 >vec_l0=v1.4s, <vec_l0=v1.4s, <vec_l0=v1.4s
uzp1 v1.4s, v1.4s, v1.4s

# qhasm: 2x vec_prod -= vec_l0[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#1.2d,<vec_l0=reg128#2.2s,<vec_4x_19=reg128#4.2s
# asm 2: smlsl <vec_prod=v0.2d,<vec_l0=v1.2s,<vec_4x_19=v3.2s
smlsl v0.2d,v1.2s,v3.2s

# qhasm: 2x final_add_0 = vec_l0[0] << 15
# asm 1: sshll >final_add_0=reg128#2.2d,<vec_l0=reg128#2.2s,#15
# asm 2: sshll >final_add_0=v1.2d,<vec_l0=v1.2s,#15
sshll v1.2d,v1.2s,#15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V0_V1_S0_S1=reg128#11.s[1]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V0_V1_S0_S1=v10.s[1]
smlal v0.2d,v17.2s,v10.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V0_V1_S0_S1=reg128#11.s[3]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V0_V1_S0_S1=v10.s[3]
smlal2 v0.2d,v17.4s,v10.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V0_V1_S0_S1=reg128#11.s[0]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V0_V1_S0_S1=v10.s[0]
smlal v0.2d,v18.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V0_V1_S0_S1=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V0_V1_S0_S1=v10.s[2]
smlal2 v0.2d,v18.4s,v10.s[2]

# qhasm: 4x vec_l1 = vec_prod * vec_M
# asm 1: mul >vec_l1=reg128#5.4s,<vec_prod=reg128#1.4s,<vec_M=reg128#10.4s
# asm 2: mul >vec_l1=v4.4s,<vec_prod=v0.4s,<vec_M=v9.4s
mul v4.4s,v0.4s,v9.4s

# qhasm: vec_l1 &= vec_2x_2p30m1
# asm 1: and <vec_l1=reg128#5.16b, <vec_l1=reg128#5.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and <vec_l1=v4.16b, <vec_l1=v4.16b, <vec_2x_2p30m1=v6.16b
and v4.16b, v4.16b, v6.16b

# qhasm: 4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4]
# asm 1: uzp1 >vec_l1=reg128#5.4s, <vec_l1=reg128#5.4s, <vec_l1=reg128#5.4s
# asm 2: uzp1 >vec_l1=v4.4s, <vec_l1=v4.4s, <vec_l1=v4.4s
uzp1 v4.4s, v4.4s, v4.4s

# qhasm: 2x vec_prod -= vec_l1[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#1.2d,<vec_l1=reg128#5.2s,<vec_4x_19=reg128#4.2s
# asm 2: smlsl <vec_prod=v0.2d,<vec_l1=v4.2s,<vec_4x_19=v3.2s
smlsl v0.2d,v4.2s,v3.2s

# qhasm: 2x final_add_1 = vec_l1[0] << 15
# asm 1: sshll >final_add_1=reg128#5.2d,<vec_l1=reg128#5.2s,#15
# asm 2: sshll >final_add_1=v4.2d,<vec_l1=v4.2s,#15
sshll v4.2d,v4.2s,#15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V2_V3_S2_S3=reg128#12.s[0]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V2_V3_S2_S3=v11.s[0]
smlal v0.2d,v17.2s,v11.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V2_V3_S2_S3=reg128#12.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V2_V3_S2_S3=v11.s[2]
smlal2 v0.2d,v17.4s,v11.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V0_V1_S0_S1=reg128#11.s[1]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V0_V1_S0_S1=v10.s[1]
smlal v0.2d,v18.2s,v10.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V0_V1_S0_S1=reg128#11.s[3]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V0_V1_S0_S1=v10.s[3]
smlal2 v0.2d,v18.4s,v10.s[3]

# qhasm: vec_V0_V1_S0_S1 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V0_V1_S0_S1=reg128#6.16b, <vec_prod=reg128#1.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V0_V1_S0_S1=v5.16b, <vec_prod=v0.16b, <vec_2x_2p30m1=v6.16b
and v5.16b, v0.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V2_V3_S2_S3=reg128#12.s[1]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V2_V3_S2_S3=v11.s[1]
smlal v0.2d,v17.2s,v11.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V2_V3_S2_S3=reg128#12.s[3]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V2_V3_S2_S3=v11.s[3]
smlal2 v0.2d,v17.4s,v11.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V2_V3_S2_S3=reg128#12.s[0]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V2_V3_S2_S3=v11.s[0]
smlal v0.2d,v18.2s,v11.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V2_V3_S2_S3=reg128#12.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V2_V3_S2_S3=v11.s[2]
smlal2 v0.2d,v18.4s,v11.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#8.16b, <vec_prod=reg128#1.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v7.16b, <vec_prod=v0.16b, <vec_2x_2p30m1=v6.16b
and v7.16b, v0.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#8.2d, <vec_buffer=reg128#8.2d, #32
# asm 2: shl >vec_buffer=v7.2d, <vec_buffer=v7.2d, #32
shl v7.2d, v7.2d, #32

# qhasm: vec_V0_V1_S0_S1 |= vec_buffer
# asm 1: orr <vec_V0_V1_S0_S1=reg128#6.16b, <vec_V0_V1_S0_S1=reg128#6.16b, <vec_buffer=reg128#8.16b
# asm 2: orr <vec_V0_V1_S0_S1=v5.16b, <vec_V0_V1_S0_S1=v5.16b, <vec_buffer=v7.16b
orr v5.16b, v5.16b, v7.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V4_V5_S4_S5=reg128#14.s[0]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V4_V5_S4_S5=v13.s[0]
smlal v0.2d,v17.2s,v13.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V4_V5_S4_S5=reg128#14.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V4_V5_S4_S5=v13.s[2]
smlal2 v0.2d,v17.4s,v13.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V2_V3_S2_S3=reg128#12.s[1]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V2_V3_S2_S3=v11.s[1]
smlal v0.2d,v18.2s,v11.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V2_V3_S2_S3=reg128#12.s[3]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V2_V3_S2_S3=v11.s[3]
smlal2 v0.2d,v18.4s,v11.s[3]

# qhasm: vec_V2_V3_S2_S3 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V2_V3_S2_S3=reg128#10.16b, <vec_prod=reg128#1.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V2_V3_S2_S3=v9.16b, <vec_prod=v0.16b, <vec_2x_2p30m1=v6.16b
and v9.16b, v0.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V4_V5_S4_S5=reg128#14.s[1]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V4_V5_S4_S5=v13.s[1]
smlal v0.2d,v17.2s,v13.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V4_V5_S4_S5=reg128#14.s[3]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V4_V5_S4_S5=v13.s[3]
smlal2 v0.2d,v17.4s,v13.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V4_V5_S4_S5=reg128#14.s[0]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V4_V5_S4_S5=v13.s[0]
smlal v0.2d,v18.2s,v13.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V4_V5_S4_S5=reg128#14.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V4_V5_S4_S5=v13.s[2]
smlal2 v0.2d,v18.4s,v13.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#8.16b, <vec_prod=reg128#1.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v7.16b, <vec_prod=v0.16b, <vec_2x_2p30m1=v6.16b
and v7.16b, v0.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#8.2d, <vec_buffer=reg128#8.2d, #32
# asm 2: shl >vec_buffer=v7.2d, <vec_buffer=v7.2d, #32
shl v7.2d, v7.2d, #32

# qhasm: vec_V2_V3_S2_S3 |= vec_buffer
# asm 1: orr <vec_V2_V3_S2_S3=reg128#10.16b, <vec_V2_V3_S2_S3=reg128#10.16b, <vec_buffer=reg128#8.16b
# asm 2: orr <vec_V2_V3_S2_S3=v9.16b, <vec_V2_V3_S2_S3=v9.16b, <vec_buffer=v7.16b
orr v9.16b, v9.16b, v7.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V6_V7_S6_S7=reg128#15.s[0]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V6_V7_S6_S7=v14.s[0]
smlal v0.2d,v17.2s,v14.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V6_V7_S6_S7=reg128#15.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V6_V7_S6_S7=v14.s[2]
smlal2 v0.2d,v17.4s,v14.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V4_V5_S4_S5=reg128#14.s[1]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V4_V5_S4_S5=v13.s[1]
smlal v0.2d,v18.2s,v13.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V4_V5_S4_S5=reg128#14.s[3]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V4_V5_S4_S5=v13.s[3]
smlal2 v0.2d,v18.4s,v13.s[3]

# qhasm: vec_V4_V5_S4_S5 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V4_V5_S4_S5=reg128#11.16b, <vec_prod=reg128#1.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V4_V5_S4_S5=v10.16b, <vec_prod=v0.16b, <vec_2x_2p30m1=v6.16b
and v10.16b, v0.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V6_V7_S6_S7=reg128#15.s[1]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V6_V7_S6_S7=v14.s[1]
smlal v0.2d,v17.2s,v14.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V6_V7_S6_S7=reg128#15.s[3]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V6_V7_S6_S7=v14.s[3]
smlal2 v0.2d,v17.4s,v14.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V6_V7_S6_S7=reg128#15.s[0]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V6_V7_S6_S7=v14.s[0]
smlal v0.2d,v18.2s,v14.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V6_V7_S6_S7=reg128#15.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V6_V7_S6_S7=v14.s[2]
smlal2 v0.2d,v18.4s,v14.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#8.16b, <vec_prod=reg128#1.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v7.16b, <vec_prod=v0.16b, <vec_2x_2p30m1=v6.16b
and v7.16b, v0.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#8.2d, <vec_buffer=reg128#8.2d, #32
# asm 2: shl >vec_buffer=v7.2d, <vec_buffer=v7.2d, #32
shl v7.2d, v7.2d, #32

# qhasm: vec_V4_V5_S4_S5 |= vec_buffer
# asm 1: orr <vec_V4_V5_S4_S5=reg128#11.16b, <vec_V4_V5_S4_S5=reg128#11.16b, <vec_buffer=reg128#8.16b
# asm 2: orr <vec_V4_V5_S4_S5=v10.16b, <vec_V4_V5_S4_S5=v10.16b, <vec_buffer=v7.16b
orr v10.16b, v10.16b, v7.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.2s,<vec_V8_V9_S8_S9=reg128#16.s[0]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.2s,<vec_V8_V9_S8_S9=v15.s[0]
smlal v0.2d,v17.2s,v15.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu0_rr0_vv0_ss0=reg128#18.4s,<vec_V8_V9_S8_S9=reg128#16.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu0_rr0_vv0_ss0=v17.4s,<vec_V8_V9_S8_S9=v15.s[2]
smlal2 v0.2d,v17.4s,v15.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V6_V7_S6_S7=reg128#15.s[1]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V6_V7_S6_S7=v14.s[1]
smlal v0.2d,v18.2s,v14.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V6_V7_S6_S7=reg128#15.s[3]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V6_V7_S6_S7=v14.s[3]
smlal2 v0.2d,v18.4s,v14.s[3]

# qhasm: 2x vec_prod += final_add_0
# asm 1: add <vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, <final_add_0=reg128#2.2d
# asm 2: add <vec_prod=v0.2d, <vec_prod=v0.2d, <final_add_0=v1.2d
add v0.2d, v0.2d, v1.2d

# qhasm: vec_V6_V7_S6_S7 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V6_V7_S6_S7=reg128#2.16b, <vec_prod=reg128#1.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_V6_V7_S6_S7=v1.16b, <vec_prod=v0.16b, <vec_2x_2p30m1=v6.16b
and v1.16b, v0.16b, v6.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.2s,<vec_V8_V9_S8_S9=reg128#16.s[0]
# asm 2: smlal <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.2s,<vec_V8_V9_S8_S9=v15.s[0]
smlal v0.2d,v18.2s,v15.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#1.2d,<vec_uu1_rr1_vv1_ss1=reg128#19.4s,<vec_V8_V9_S8_S9=reg128#16.s[2]
# asm 2: smlal2 <vec_prod=v0.2d,<vec_uu1_rr1_vv1_ss1=v18.4s,<vec_V8_V9_S8_S9=v15.s[2]
smlal2 v0.2d,v18.4s,v15.s[2]

# qhasm: 2x vec_prod += final_add_1
# asm 1: add <vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, <final_add_1=reg128#5.2d
# asm 2: add <vec_prod=v0.2d, <vec_prod=v0.2d, <final_add_1=v4.2d
add v0.2d, v0.2d, v4.2d

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#5.16b, <vec_prod=reg128#1.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer=v4.16b, <vec_prod=v0.16b, <vec_2x_2p30m1=v6.16b
and v4.16b, v0.16b, v6.16b

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#5.2d, <vec_buffer=reg128#5.2d, #32
# asm 2: shl >vec_buffer=v4.2d, <vec_buffer=v4.2d, #32
shl v4.2d, v4.2d, #32

# qhasm: vec_V6_V7_S6_S7 |= vec_buffer
# asm 1: orr <vec_V6_V7_S6_S7=reg128#2.16b, <vec_V6_V7_S6_S7=reg128#2.16b, <vec_buffer=reg128#5.16b
# asm 2: orr <vec_V6_V7_S6_S7=v1.16b, <vec_V6_V7_S6_S7=v1.16b, <vec_buffer=v4.16b
orr v1.16b, v1.16b, v4.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#1.2d, <vec_prod=reg128#1.2d, #30
# asm 2: sshr >vec_prod=v0.2d, <vec_prod=v0.2d, #30
sshr v0.2d, v0.2d, #30

# qhasm: 2x vec_carry = vec_prod >> 15
# asm 1: sshr <vec_carry=reg128#17.2d, <vec_prod=reg128#1.2d, #15
# asm 2: sshr <vec_carry=v16.2d, <vec_prod=v0.2d, #15
sshr v16.2d, v0.2d, #15

# qhasm: 4x vec_carry = vec_carry[0/4] vec_carry[2/4] vec_carry[0/4] vec_carry[2/4]
# asm 1: uzp1 >vec_carry=reg128#5.4s, <vec_carry=reg128#17.4s, <vec_carry=reg128#17.4s
# asm 2: uzp1 >vec_carry=v4.4s, <vec_carry=v16.4s, <vec_carry=v16.4s
uzp1 v4.4s, v16.4s, v16.4s

# qhasm: 2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
# asm 1: sshr <vec_2x_2p15m1=reg128#8.2d, <vec_2x_2p30m1=reg128#7.2d, #15
# asm 2: sshr <vec_2x_2p15m1=v7.2d, <vec_2x_2p30m1=v6.2d, #15
sshr v7.2d, v6.2d, #15

# qhasm: vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
# asm 1: and >vec_V8_V9_S8_S9=reg128#1.16b, <vec_prod=reg128#1.16b, <vec_2x_2p15m1=reg128#8.16b
# asm 2: and >vec_V8_V9_S8_S9=v0.16b, <vec_prod=v0.16b, <vec_2x_2p15m1=v7.16b
and v0.16b, v0.16b, v7.16b

# qhasm: 2x vec_buffer = vec_4x_19[0] * vec_carry[0]
# asm 1: smull >vec_buffer=reg128#4.2d,<vec_4x_19=reg128#4.2s,<vec_carry=reg128#5.2s
# asm 2: smull >vec_buffer=v3.2d,<vec_4x_19=v3.2s,<vec_carry=v4.2s
smull v3.2d,v3.2s,v4.2s

# qhasm: reg128 vec_buffer_lo

# qhasm: vec_buffer_lo = vec_buffer & vec_2x_2p30m1
# asm 1: and >vec_buffer_lo=reg128#7.16b, <vec_buffer=reg128#4.16b, <vec_2x_2p30m1=reg128#7.16b
# asm 2: and >vec_buffer_lo=v6.16b, <vec_buffer=v3.16b, <vec_2x_2p30m1=v6.16b
and v6.16b, v3.16b, v6.16b

# qhasm: 4x vec_V0_V1_S0_S1 += vec_buffer_lo
# asm 1: add <vec_V0_V1_S0_S1=reg128#6.4s, <vec_V0_V1_S0_S1=reg128#6.4s, <vec_buffer_lo=reg128#7.4s
# asm 2: add <vec_V0_V1_S0_S1=v5.4s, <vec_V0_V1_S0_S1=v5.4s, <vec_buffer_lo=v6.4s
add v5.4s, v5.4s, v6.4s

# qhasm: 2x vec_buffer = vec_buffer >> 30
# asm 1: sshr <vec_buffer=reg128#4.2d, <vec_buffer=reg128#4.2d, #30
# asm 2: sshr <vec_buffer=v3.2d, <vec_buffer=v3.2d, #30
sshr v3.2d, v3.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#4.2d, <vec_buffer=reg128#4.2d, #32
# asm 2: shl >vec_buffer=v3.2d, <vec_buffer=v3.2d, #32
shl v3.2d, v3.2d, #32

# qhasm: 2x vec_V0_V1_S0_S1 += vec_buffer
# asm 1: add <vec_V0_V1_S0_S1=reg128#6.2d, <vec_V0_V1_S0_S1=reg128#6.2d, <vec_buffer=reg128#4.2d
# asm 2: add <vec_V0_V1_S0_S1=v5.2d, <vec_V0_V1_S0_S1=v5.2d, <vec_buffer=v3.2d
add v5.2d, v5.2d, v3.2d

# qhasm: 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# asm 1: sshr <vec_carry=reg128#5.4s, <vec_V0_V1_S0_S1=reg128#6.4s, #30
# asm 2: sshr <vec_carry=v4.4s, <vec_V0_V1_S0_S1=v5.4s, #30
sshr v4.4s, v5.4s, #30

# qhasm: 2x vec_carry = vec_carry << 32
# asm 1: shl >vec_carry=reg128#4.2d, <vec_carry=reg128#5.2d, #32
# asm 2: shl >vec_carry=v3.2d, <vec_carry=v4.2d, #32
shl v3.2d, v4.2d, #32

# qhasm: 4x vec_V0_V1_S0_S1 += vec_carry
# asm 1: add <vec_V0_V1_S0_S1=reg128#6.4s, <vec_V0_V1_S0_S1=reg128#6.4s, <vec_carry=reg128#4.4s
# asm 2: add <vec_V0_V1_S0_S1=v5.4s, <vec_V0_V1_S0_S1=v5.4s, <vec_carry=v3.4s
add v5.4s, v5.4s, v3.4s

# qhasm: 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# asm 1: sshr <vec_carry=reg128#4.4s, <vec_V0_V1_S0_S1=reg128#6.4s, #30
# asm 2: sshr <vec_carry=v3.4s, <vec_V0_V1_S0_S1=v5.4s, #30
sshr v3.4s, v5.4s, #30

# qhasm: 2x vec_carry = vec_carry unsigned>> 32
# asm 1: ushr >vec_carry=reg128#4.2d, <vec_carry=reg128#4.2d, #32
# asm 2: ushr >vec_carry=v3.2d, <vec_carry=v3.2d, #32
ushr v3.2d, v3.2d, #32

# qhasm: vec_V0_V1_S0_S1 &= vec_4x_2p30m1
# asm 1: and <vec_V0_V1_S0_S1=reg128#6.16b, <vec_V0_V1_S0_S1=reg128#6.16b, <vec_4x_2p30m1=reg128#9.16b
# asm 2: and <vec_V0_V1_S0_S1=v5.16b, <vec_V0_V1_S0_S1=v5.16b, <vec_4x_2p30m1=v8.16b
and v5.16b, v5.16b, v8.16b

# qhasm: 4x vec_V2_V3_S2_S3 += vec_carry
# asm 1: add <vec_V2_V3_S2_S3=reg128#10.4s, <vec_V2_V3_S2_S3=reg128#10.4s, <vec_carry=reg128#4.4s
# asm 2: add <vec_V2_V3_S2_S3=v9.4s, <vec_V2_V3_S2_S3=v9.4s, <vec_carry=v3.4s
add v9.4s, v9.4s, v3.4s

# qhasm: int64 V8

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7

# qhasm: V0V1 = vec_V0_V1_S0_S1[0/2]
# asm 1: umov >V0V1=int64#1, <vec_V0_V1_S0_S1=reg128#6.d[0]
# asm 2: umov >V0V1=x0, <vec_V0_V1_S0_S1=v5.d[0]
umov x0, v5.d[0]

# qhasm: V2V3 = vec_V2_V3_S2_S3[0/2]
# asm 1: umov >V2V3=int64#3, <vec_V2_V3_S2_S3=reg128#10.d[0]
# asm 2: umov >V2V3=x2, <vec_V2_V3_S2_S3=v9.d[0]
umov x2, v9.d[0]

# qhasm: V4V5 = vec_V4_V5_S4_S5[0/2]
# asm 1: umov >V4V5=int64#4, <vec_V4_V5_S4_S5=reg128#11.d[0]
# asm 2: umov >V4V5=x3, <vec_V4_V5_S4_S5=v10.d[0]
umov x3, v10.d[0]

# qhasm: V6V7 = vec_V6_V7_S6_S7[0/2]
# asm 1: umov >V6V7=int64#5, <vec_V6_V7_S6_S7=reg128#2.d[0]
# asm 2: umov >V6V7=x4, <vec_V6_V7_S6_S7=v1.d[0]
umov x4, v1.d[0]

# qhasm: V8 = vec_V8_V9_S8_S9[0/4]
# asm 1: smov >V8=int64#6, <vec_V8_V9_S8_S9=reg128#1.s[0]
# asm 2: smov >V8=x5, <vec_V8_V9_S8_S9=v0.s[0]
smov x5, v0.s[0]

# qhasm: int64 V0

# qhasm: int64 V1

# qhasm: V0 = V0V1 & 0x3FFFFFFF
# asm 1: and >V0=int64#7, <V0V1=int64#1, #0x3FFFFFFF
# asm 2: and >V0=x6, <V0V1=x0, #0x3FFFFFFF
and x6, x0, #0x3FFFFFFF

# qhasm: V1 = V0V1 unsigned>> 32
# asm 1: lsr >V1=int64#1, <V0V1=int64#1, #32
# asm 2: lsr >V1=x0, <V0V1=x0, #32
lsr x0, x0, #32

# qhasm: int64 V2

# qhasm: int64 V3

# qhasm: V2 = V2V3 & 0x3FFFFFFF
# asm 1: and >V2=int64#8, <V2V3=int64#3, #0x3FFFFFFF
# asm 2: and >V2=x7, <V2V3=x2, #0x3FFFFFFF
and x7, x2, #0x3FFFFFFF

# qhasm: V3 = V2V3 unsigned>> 32
# asm 1: lsr >V3=int64#3, <V2V3=int64#3, #32
# asm 2: lsr >V3=x2, <V2V3=x2, #32
lsr x2, x2, #32

# qhasm: int64 V4

# qhasm: int64 V5

# qhasm: V4 = V4V5 & 0x3FFFFFFF
# asm 1: and >V4=int64#9, <V4V5=int64#4, #0x3FFFFFFF
# asm 2: and >V4=x8, <V4V5=x3, #0x3FFFFFFF
and x8, x3, #0x3FFFFFFF

# qhasm: V5 = V4V5 unsigned>> 32
# asm 1: lsr >V5=int64#4, <V4V5=int64#4, #32
# asm 2: lsr >V5=x3, <V4V5=x3, #32
lsr x3, x3, #32

# qhasm: int64 V6

# qhasm: int64 V7

# qhasm: V6 = V6V7 & 0x3FFFFFFF
# asm 1: and >V6=int64#10, <V6V7=int64#5, #0x3FFFFFFF
# asm 2: and >V6=x9, <V6V7=x4, #0x3FFFFFFF
and x9, x4, #0x3FFFFFFF

# qhasm: V7 = V6V7 unsigned>> 32
# asm 1: lsr >V7=int64#5, <V6V7=int64#5, #32
# asm 2: lsr >V7=x4, <V6V7=x4, #32
lsr x4, x4, #32

# qhasm: int64 inv0

# qhasm: int64 inv1

# qhasm: int64 inv2

# qhasm: int64 inv3

# qhasm: V1 = V1 << 30
# asm 1: lsl >V1=int64#1, <V1=int64#1, #30
# asm 2: lsl >V1=x0, <V1=x0, #30
lsl x0, x0, #30

# qhasm: inv0 = V0 | V1
# asm 1: orr >inv0=int64#1, <V0=int64#7, <V1=int64#1
# asm 2: orr >inv0=x0, <V0=x6, <V1=x0
orr x0, x6, x0

# qhasm: tmp = V2 << 60
# asm 1: lsl >tmp=int64#7, <V2=int64#8, #60
# asm 2: lsl >tmp=x6, <V2=x7, #60
lsl x6, x7, #60

# qhasm: inv0 |= tmp
# asm 1: orr >inv0=int64#1,<inv0=int64#1,<tmp=int64#7
# asm 2: orr >inv0=x0,<inv0=x0,<tmp=x6
orr x0,x0,x6

# qhasm: V2 = V2 unsigned>> 4
# asm 1: lsr >V2=int64#7, <V2=int64#8, #4
# asm 2: lsr >V2=x6, <V2=x7, #4
lsr x6, x7, #4

# qhasm: V3 = V3 << 26
# asm 1: lsl >V3=int64#3, <V3=int64#3, #26
# asm 2: lsl >V3=x2, <V3=x2, #26
lsl x2, x2, #26

# qhasm: inv1 = V2 | V3 
# asm 1: orr >inv1=int64#3, <V2=int64#7, <V3=int64#3
# asm 2: orr >inv1=x2, <V2=x6, <V3=x2
orr x2, x6, x2

# qhasm: tmp = V4 << 56
# asm 1: lsl >tmp=int64#7, <V4=int64#9, #56
# asm 2: lsl >tmp=x6, <V4=x8, #56
lsl x6, x8, #56

# qhasm: inv1 |= tmp
# asm 1: orr >inv1=int64#3,<inv1=int64#3,<tmp=int64#7
# asm 2: orr >inv1=x2,<inv1=x2,<tmp=x6
orr x2,x2,x6

# qhasm: V4 = V4 unsigned>> 8
# asm 1: lsr >V4=int64#7, <V4=int64#9, #8
# asm 2: lsr >V4=x6, <V4=x8, #8
lsr x6, x8, #8

# qhasm: V5 = V5 << 22
# asm 1: lsl >V5=int64#4, <V5=int64#4, #22
# asm 2: lsl >V5=x3, <V5=x3, #22
lsl x3, x3, #22

# qhasm: inv2 = V4 | V5
# asm 1: orr >inv2=int64#4, <V4=int64#7, <V5=int64#4
# asm 2: orr >inv2=x3, <V4=x6, <V5=x3
orr x3, x6, x3

# qhasm: tmp = V6 << 52
# asm 1: lsl >tmp=int64#7, <V6=int64#10, #52
# asm 2: lsl >tmp=x6, <V6=x9, #52
lsl x6, x9, #52

# qhasm: inv2 |= tmp
# asm 1: orr >inv2=int64#4,<inv2=int64#4,<tmp=int64#7
# asm 2: orr >inv2=x3,<inv2=x3,<tmp=x6
orr x3,x3,x6

# qhasm: V6 = V6 unsigned>> 12
# asm 1: lsr >V6=int64#7, <V6=int64#10, #12
# asm 2: lsr >V6=x6, <V6=x9, #12
lsr x6, x9, #12

# qhasm: V7 = V7 << 18
# asm 1: lsl >V7=int64#5, <V7=int64#5, #18
# asm 2: lsl >V7=x4, <V7=x4, #18
lsl x4, x4, #18

# qhasm: inv3 = V6 | V7
# asm 1: orr >inv3=int64#5, <V6=int64#7, <V7=int64#5
# asm 2: orr >inv3=x4, <V6=x6, <V7=x4
orr x4, x6, x4

# qhasm: tmp = V8 << 48
# asm 1: lsl >tmp=int64#6, <V8=int64#6, #48
# asm 2: lsl >tmp=x5, <V8=x5, #48
lsl x5, x5, #48

# qhasm: inv3 |= tmp
# asm 1: orr >inv3=int64#5,<inv3=int64#5,<tmp=int64#6
# asm 2: orr >inv3=x4,<inv3=x4,<tmp=x5
orr x4,x4,x5

# qhasm: int64 signF

# qhasm: signF = vec_F0_F1_G0_G1[0/2]
# asm 1: umov >signF=int64#6, <vec_F0_F1_G0_G1=reg128#3.d[0]
# asm 2: umov >signF=x5, <vec_F0_F1_G0_G1=v2.d[0]
umov x5, v2.d[0]

# qhasm: signF = signF << 2
# asm 1: lsl >signF=int64#6, <signF=int64#6, #2
# asm 2: lsl >signF=x5, <signF=x5, #2
lsl x5, x5, #2

# qhasm: signF = signF signed>> 3
# asm 1: asr >signF=int64#6, <signF=int64#6, #3
# asm 2: asr >signF=x5, <signF=x5, #3
asr x5, x5, #3

# qhasm: signF - 0!
# asm 1: cmp <signF=int64#6,#0
# asm 2: cmp <signF=x5,#0
cmp x5,#0

# qhasm: int64 2p64m1

# qhasm: int64 2p63m1

# qhasm: 2p64m1 set to ONES
# asm 1: mvn >2p64m1=int64#7, xzr
# asm 2: mvn >2p64m1=x6, xzr
mvn x6, xzr

# qhasm: 2p63m1 = 2p64m1 unsigned>> 1
# asm 1: lsr >2p63m1=int64#7, <2p64m1=int64#7, #1
# asm 2: lsr >2p63m1=x6, <2p64m1=x6, #1
lsr x6, x6, #1

# qhasm: _18 = 18
# asm 1: mov >_18=int64#8, #18
# asm 2: mov >_18=x7, #18
mov x7, #18

# qhasm: inv0 = inv0 if N=0 else ~inv0
# asm 1: csinv >inv0=int64#1, <inv0=int64#1, <inv0=int64#1, pl
# asm 2: csinv >inv0=x0, <inv0=x0, <inv0=x0, pl
csinv x0, x0, x0, pl

# qhasm: inv1 = inv1 if N=0 else ~inv1
# asm 1: csinv >inv1=int64#3, <inv1=int64#3, <inv1=int64#3, pl
# asm 2: csinv >inv1=x2, <inv1=x2, <inv1=x2, pl
csinv x2, x2, x2, pl

# qhasm: inv2 = inv2 if N=0 else ~inv2
# asm 1: csinv >inv2=int64#4, <inv2=int64#4, <inv2=int64#4, pl
# asm 2: csinv >inv2=x3, <inv2=x3, <inv2=x3, pl
csinv x3, x3, x3, pl

# qhasm: tmp = 2p63m1 - inv3
# asm 1: sub >tmp=int64#7,<2p63m1=int64#7,<inv3=int64#5
# asm 2: sub >tmp=x6,<2p63m1=x6,<inv3=x4
sub x6,x6,x4

# qhasm: inv3 = inv3 if N=0 else tmp
# asm 1: csel >inv3=int64#5, <inv3=int64#5, <tmp=int64#7, pl
# asm 2: csel >inv3=x4, <inv3=x4, <tmp=x6, pl
csel x4, x4, x6, pl

# qhasm: tmp = _18 & signF
# asm 1: and  >tmp=int64#6, <_18=int64#8, <signF=int64#6
# asm 2: and  >tmp=x5, <_18=x7, <signF=x5
and  x5, x7, x5

# qhasm: inv0 = inv0 - tmp
# asm 1: sub >inv0=int64#1,<inv0=int64#1,<tmp=int64#6
# asm 2: sub >inv0=x0,<inv0=x0,<tmp=x5
sub x0,x0,x5

# qhasm: mem128[input_x1] = inv0, inv1
# asm 1: stp <inv0=int64#1, <inv1=int64#3, [<input_x1=int64#2]
# asm 2: stp <inv0=x0, <inv1=x2, [<input_x1=x1]
stp x0, x2, [x1]

# qhasm: mem128[input_x1+16] = inv2, inv3
# asm 1: stp <inv2=int64#4, <inv3=int64#5, [<input_x1=int64#2, #16]
# asm 2: stp <inv2=x3, <inv3=x4, [<input_x1=x1, #16]
stp x3, x4, [x1, #16]

# qhasm: pop2x8b calleesaved_v14, calleesaved_v15
# asm 1: ldp >calleesaved_v14=reg128#15%dregname,>calleesaved_v15=reg128#16%dregname,[sp],#16
# asm 2: ldp >calleesaved_v14=d14,>calleesaved_v15=d15,[sp],#16
ldp d14,d15,[sp],#16

# qhasm: pop2x8b calleesaved_v12, calleesaved_v13
# asm 1: ldp >calleesaved_v12=reg128#13%dregname,>calleesaved_v13=reg128#14%dregname,[sp],#16
# asm 2: ldp >calleesaved_v12=d12,>calleesaved_v13=d13,[sp],#16
ldp d12,d13,[sp],#16

# qhasm: pop2x8b calleesaved_v10, calleesaved_v11
# asm 1: ldp >calleesaved_v10=reg128#11%dregname,>calleesaved_v11=reg128#12%dregname,[sp],#16
# asm 2: ldp >calleesaved_v10=d10,>calleesaved_v11=d11,[sp],#16
ldp d10,d11,[sp],#16

# qhasm: pop2x8b calleesaved_v8, calleesaved_v9
# asm 1: ldp >calleesaved_v8=reg128#9%dregname,>calleesaved_v9=reg128#10%dregname,[sp],#16
# asm 2: ldp >calleesaved_v8=d8,>calleesaved_v9=d9,[sp],#16
ldp d8,d9,[sp],#16

# qhasm: return
ret
