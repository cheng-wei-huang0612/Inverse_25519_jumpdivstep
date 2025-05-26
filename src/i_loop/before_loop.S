# CHUNK

# qhasm: ITERATION = 9
# asm 1: mov >ITERATION=int64#7, #9
# asm 2: mov >ITERATION=x6, #9
mov x6, #9

# qhasm: reg128 vec_2x_2p30m1

# qhasm: reg128 vec_2x_2p32m1

# qhasm: 2x vec_2x_2p32m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p32m1=reg128#1.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p32m1=v0.2d, #0xFFFFFFFF
movi v0.2d, #0xFFFFFFFF

# qhasm: 2x vec_2x_2p30m1 = vec_2x_2p32m1 unsigned>> 2
# asm 1: ushr >vec_2x_2p30m1=reg128#2.2d, <vec_2x_2p32m1=reg128#1.2d, #2
# asm 2: ushr >vec_2x_2p30m1=v1.2d, <vec_2x_2p32m1=v0.2d, #2
ushr v1.2d, v0.2d, #2

# qhasm: reg128 vec_2x_2p15m1

# qhasm: 2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
# asm 1: sshr <vec_2x_2p15m1=reg128#3.2d, <vec_2x_2p30m1=reg128#2.2d, #15
# asm 2: sshr <vec_2x_2p15m1=v2.2d, <vec_2x_2p30m1=v1.2d, #15
sshr v2.2d, v1.2d, #15

# qhasm: reg128 vec_4x_2p30m1

# qhasm: 4x vec_4x_2p30m1 = vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4] vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4]
# asm 1: uzp1 >vec_4x_2p30m1=reg128#4.4s, <vec_2x_2p30m1=reg128#2.4s, <vec_2x_2p30m1=reg128#2.4s
# asm 2: uzp1 >vec_4x_2p30m1=v3.4s, <vec_2x_2p30m1=v1.4s, <vec_2x_2p30m1=v1.4s
uzp1 v3.4s, v1.4s, v1.4s

# qhasm: int64 M

# qhasm: M = 0
# asm 1: mov >M=int64#8, #0
# asm 2: mov >M=x7, #0


# qhasm: M[0/4] = 51739
# asm 1: movk <M=int64#8, #51739
# asm 2: movk <M=x7, #51739
movz x7, #51739

# qhasm: M[1/4] = 10347
# asm 1: movk <M=int64#8, #10347,LSL #16
# asm 2: movk <M=x7, #10347,LSL #16
movk x7, #10347,LSL #16

# qhasm: reg128 vec_M

# qhasm: 4x vec_M = M
# asm 1: dup <vec_M=reg128#5.4s, <M=int64#8%wregname
# asm 2: dup <vec_M=v4.4s, <M=w7
dup v4.4s, w7

# qhasm: int64 _19

# qhasm: _19 = 19
# asm 1: mov >_19=int64#8, #19
# asm 2: mov >_19=x7, #19
mov x7, #19

# qhasm: reg128 vec_4x_19

# qhasm: 4x vec_4x_19 = _19
# asm 1: dup <vec_4x_19=reg128#6.4s, <_19=int64#8%wregname
# asm 2: dup <vec_4x_19=v5.4s, <_19=w7
dup v5.4s, w7

# qhasm: int64 2p41

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#8, #1
# asm 2: mov >2p41=x7, #1
mov x7, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#8, <2p41=int64#8, #41
# asm 2: lsl >2p41=x7, <2p41=x7, #41
lsl x7, x7, #41

# qhasm: int64 2p62

# qhasm: 2p62 = 1
# asm 1: mov >2p62=int64#9, #1
# asm 2: mov >2p62=x8, #1
mov x8, #1

# qhasm: 2p62 = 2p62 << 62
# asm 1: lsl >2p62=int64#9, <2p62=int64#9, #62
# asm 2: lsl >2p62=x8, <2p62=x8, #62
lsl x8, x8, #62

# qhasm: int64 F0F1

# qhasm: int64 F2F3

# qhasm: int64 F4F5

# qhasm: int64 F6F7

# qhasm: int64 F8F9

# qhasm: F0F1, F2F3 = mem128[pointer_F]
# asm 1: ldp >F0F1=int64#10, >F2F3=int64#11, [<pointer_F=int64#2]
# asm 2: ldp >F0F1=x9, >F2F3=x10, [<pointer_F=x1]
ldp x9, x10, [x1]

# qhasm: F4F5, F6F7 = mem128[pointer_F+16]
# asm 1: ldp >F4F5=int64#12, >F6F7=int64#13, [<pointer_F=int64#2, #16]
# asm 2: ldp >F4F5=x11, >F6F7=x12, [<pointer_F=x1, #16]
ldp x11, x12, [x1, #16]

# qhasm: F8F9 = mem32[pointer_F+32]
# asm 1: ldr >F8F9=int64#14%wregname, [<pointer_F=int64#2, #32]
# asm 2: ldr >F8F9=w13, [<pointer_F=x1, #32]
ldr w13, [x1, #32]

# qhasm: int64 G0G1

# qhasm: int64 G2G3

# qhasm: int64 G4G5

# qhasm: int64 G6G7

# qhasm: int64 G8G9

# qhasm: G0G1, G2G3 = mem128[pointer_G]
# asm 1: ldp >G0G1=int64#15, >G2G3=int64#16, [<pointer_G=int64#3]
# asm 2: ldp >G0G1=x14, >G2G3=x15, [<pointer_G=x2]
ldp x14, x15, [x2]

# qhasm: G4G5, G6G7 = mem128[pointer_G+16]
# asm 1: ldp >G4G5=int64#17, >G6G7=int64#18, [<pointer_G=int64#3, #16]
# asm 2: ldp >G4G5=x16, >G6G7=x17, [<pointer_G=x2, #16]
ldp x16, x17, [x2, #16]

# qhasm: G8G9 = mem32[pointer_G+32]
# asm 1: ldr >G8G9=int64#19%wregname, [<pointer_G=int64#3, #32]
# asm 2: ldr >G8G9=w18, [<pointer_G=x2, #32]
ldr w18, [x2, #32]

# qhasm: reg128 vec_F0_F1_G0_G1 

# qhasm: vec_F0_F1_G0_G1[0/2] = F0F1 
# asm 1: ins <vec_F0_F1_G0_G1=reg128#7.d[0], <F0F1=int64#10
# asm 2: ins <vec_F0_F1_G0_G1=v6.d[0], <F0F1=x9
ins v6.d[0], x9

# qhasm: vec_F0_F1_G0_G1[1/2] = G0G1 
# asm 1: ins <vec_F0_F1_G0_G1=reg128#7.d[1], <G0G1=int64#15
# asm 2: ins <vec_F0_F1_G0_G1=v6.d[1], <G0G1=x14
ins v6.d[1], x14

# qhasm: reg128 vec_F2_F3_G2_G3 

# qhasm: vec_F2_F3_G2_G3[0/2] = F2F3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#8.d[0], <F2F3=int64#11
# asm 2: ins <vec_F2_F3_G2_G3=v7.d[0], <F2F3=x10
ins v7.d[0], x10

# qhasm: vec_F2_F3_G2_G3[1/2] = G2G3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#8.d[1], <G2G3=int64#16
# asm 2: ins <vec_F2_F3_G2_G3=v7.d[1], <G2G3=x15
ins v7.d[1], x15

# qhasm: reg128 vec_F4_F5_G4_G5 

# qhasm: vec_F4_F5_G4_G5[0/2] = F4F5 
# asm 1: ins <vec_F4_F5_G4_G5=reg128#9.d[0], <F4F5=int64#12
# asm 2: ins <vec_F4_F5_G4_G5=v8.d[0], <F4F5=x11
ins v8.d[0], x11

# qhasm: vec_F4_F5_G4_G5[1/2] = G4G5 
# asm 1: ins <vec_F4_F5_G4_G5=reg128#9.d[1], <G4G5=int64#17
# asm 2: ins <vec_F4_F5_G4_G5=v8.d[1], <G4G5=x16
ins v8.d[1], x16

# qhasm: reg128 vec_F6_F7_G6_G7 

# qhasm: vec_F6_F7_G6_G7[0/2] = F6F7 
# asm 1: ins <vec_F6_F7_G6_G7=reg128#10.d[0], <F6F7=int64#13
# asm 2: ins <vec_F6_F7_G6_G7=v9.d[0], <F6F7=x12
ins v9.d[0], x12

# qhasm: vec_F6_F7_G6_G7[1/2] = G6G7 
# asm 1: ins <vec_F6_F7_G6_G7=reg128#10.d[1], <G6G7=int64#18
# asm 2: ins <vec_F6_F7_G6_G7=v9.d[1], <G6G7=x17
ins v9.d[1], x17

# qhasm: reg128 vec_F8_F9_G8_G9 

# qhasm: vec_F8_F9_G8_G9[0/2] = F8F9 
# asm 1: ins <vec_F8_F9_G8_G9=reg128#11.d[0], <F8F9=int64#14
# asm 2: ins <vec_F8_F9_G8_G9=v10.d[0], <F8F9=x13
ins v10.d[0], x13

# qhasm: vec_F8_F9_G8_G9[1/2] = G8G9 
# asm 1: ins <vec_F8_F9_G8_G9=reg128#11.d[1], <G8G9=int64#19
# asm 2: ins <vec_F8_F9_G8_G9=v10.d[1], <G8G9=x18
ins v10.d[1], x18

# qhasm: reg128 vec_V0_V1_S0_S1

# qhasm: reg128 vec_V2_V3_S2_S3

# qhasm: reg128 vec_V4_V5_S4_S5

# qhasm: reg128 vec_V6_V7_S6_S7

# qhasm: reg128 vec_V8_V9_S8_S9

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7

# qhasm: int64 V8V9

# qhasm: V0V1, V2V3 = mem128[pointer_V]
# asm 1: ldp >V0V1=int64#10, >V2V3=int64#11, [<pointer_V=int64#4]
# asm 2: ldp >V0V1=x9, >V2V3=x10, [<pointer_V=x3]
ldp x9, x10, [x3]

# qhasm: V4V5, V6V7 = mem128[pointer_V+16]
# asm 1: ldp >V4V5=int64#12, >V6V7=int64#13, [<pointer_V=int64#4, #16]
# asm 2: ldp >V4V5=x11, >V6V7=x12, [<pointer_V=x3, #16]
ldp x11, x12, [x3, #16]

# qhasm: V8V9 = mem32[pointer_V+32]
# asm 1: ldr >V8V9=int64#14%wregname, [<pointer_V=int64#4, #32]
# asm 2: ldr >V8V9=w13, [<pointer_V=x3, #32]
ldr w13, [x3, #32]

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 S4S5

# qhasm: int64 S6S7

# qhasm: int64 S8S9

# qhasm: S0S1, S2S3 = mem128[pointer_S]
# asm 1: ldp >S0S1=int64#15, >S2S3=int64#16, [<pointer_S=int64#5]
# asm 2: ldp >S0S1=x14, >S2S3=x15, [<pointer_S=x4]
ldp x14, x15, [x4]

# qhasm: S4S5, S6S7 = mem128[pointer_S+16]
# asm 1: ldp >S4S5=int64#17, >S6S7=int64#18, [<pointer_S=int64#5, #16]
# asm 2: ldp >S4S5=x16, >S6S7=x17, [<pointer_S=x4, #16]
ldp x16, x17, [x4, #16]

# qhasm: S8S9 = mem32[pointer_S+32]
# asm 1: ldr >S8S9=int64#19%wregname, [<pointer_S=int64#5, #32]
# asm 2: ldr >S8S9=w18, [<pointer_S=x4, #32]
ldr w18, [x4, #32]

# qhasm: vec_V0_V1_S0_S1[0/2] = V0V1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#12.d[0], <V0V1=int64#10
# asm 2: ins <vec_V0_V1_S0_S1=v11.d[0], <V0V1=x9
ins v11.d[0], x9

# qhasm: vec_V0_V1_S0_S1[1/2] = S0S1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#12.d[1], <S0S1=int64#15
# asm 2: ins <vec_V0_V1_S0_S1=v11.d[1], <S0S1=x14
ins v11.d[1], x14

# qhasm: vec_V2_V3_S2_S3[0/2] = V2V3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#13.d[0], <V2V3=int64#11
# asm 2: ins <vec_V2_V3_S2_S3=v12.d[0], <V2V3=x10
ins v12.d[0], x10

# qhasm: vec_V2_V3_S2_S3[1/2] = S2S3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#13.d[1], <S2S3=int64#16
# asm 2: ins <vec_V2_V3_S2_S3=v12.d[1], <S2S3=x15
ins v12.d[1], x15

# qhasm: vec_V4_V5_S4_S5[0/2] = V4V5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#14.d[0], <V4V5=int64#12
# asm 2: ins <vec_V4_V5_S4_S5=v13.d[0], <V4V5=x11
ins v13.d[0], x11

# qhasm: vec_V4_V5_S4_S5[1/2] = S4S5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#14.d[1], <S4S5=int64#17
# asm 2: ins <vec_V4_V5_S4_S5=v13.d[1], <S4S5=x16
ins v13.d[1], x16

# qhasm: vec_V6_V7_S6_S7[0/2] = V6V7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#15.d[0], <V6V7=int64#13
# asm 2: ins <vec_V6_V7_S6_S7=v14.d[0], <V6V7=x12
ins v14.d[0], x12

# qhasm: vec_V6_V7_S6_S7[1/2] = S6S7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#15.d[1], <S6S7=int64#18
# asm 2: ins <vec_V6_V7_S6_S7=v14.d[1], <S6S7=x17
ins v14.d[1], x17

# qhasm: vec_V8_V9_S8_S9[0/2] = V8V9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#16.d[0], <V8V9=int64#14
# asm 2: ins <vec_V8_V9_S8_S9=v15.d[0], <V8V9=x13
ins v15.d[0], x13

# qhasm: vec_V8_V9_S8_S9[1/2] = S8S9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#16.d[1], <S8S9=int64#19
# asm 2: ins <vec_V8_V9_S8_S9=v15.d[1], <S8S9=x18
ins v15.d[1], x18

# qhasm: uu, vv = mem128[pointer_uuvvrrss + 0]
# asm 1: ldp >uu=int64#10, >vv=int64#11, [<pointer_uuvvrrss=int64#6, #0]
# asm 2: ldp >uu=x9, >vv=x10, [<pointer_uuvvrrss=x5, #0]
ldp x9, x10, [x5, #0]

# qhasm: rr, ss = mem128[pointer_uuvvrrss + 16]
# asm 1: ldp >rr=int64#12, >ss=int64#13, [<pointer_uuvvrrss=int64#6, #16]
# asm 2: ldp >rr=x11, >ss=x12, [<pointer_uuvvrrss=x5, #16]
ldp x11, x12, [x5, #16]

# qhasm: int64 m

# qhasm: m = mem64[pointer_delta]
# asm 1: ldr >m=int64#14, [<pointer_delta=int64#1]
# asm 2: ldr >m=x13, [<pointer_delta=x0]
ldr x13, [x0]

# CHUNK