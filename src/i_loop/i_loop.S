
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

# qhasm: enter i_loop
.align 4
.global _i_loop
.global i_loop
_i_loop:
i_loop:

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

# qhasm: push2xint64 calleesaved_x18, calleesaved_x19
# asm 1: stp <calleesaved_x18=int64#19, <calleesaved_x19=int64#20, [sp, #-16]!
# asm 2: stp <calleesaved_x18=x18, <calleesaved_x19=x19, [sp, #-16]!
stp x18, x19, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x20, calleesaved_x21
# asm 1: stp <calleesaved_x20=int64#21, <calleesaved_x21=int64#22, [sp, #-16]!
# asm 2: stp <calleesaved_x20=x20, <calleesaved_x21=x21, [sp, #-16]!
stp x20, x21, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x22, calleesaved_x23
# asm 1: stp <calleesaved_x22=int64#23, <calleesaved_x23=int64#24, [sp, #-16]!
# asm 2: stp <calleesaved_x22=x22, <calleesaved_x23=x23, [sp, #-16]!
stp x22, x23, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x24, calleesaved_x25
# asm 1: stp <calleesaved_x24=int64#25, <calleesaved_x25=int64#26, [sp, #-16]!
# asm 2: stp <calleesaved_x24=x24, <calleesaved_x25=x25, [sp, #-16]!
stp x24, x25, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x26, calleesaved_x27
# asm 1: stp <calleesaved_x26=int64#27, <calleesaved_x27=int64#28, [sp, #-16]!
# asm 2: stp <calleesaved_x26=x26, <calleesaved_x27=x27, [sp, #-16]!
stp x26, x27, [sp, #-16]!

# qhasm: push2xint64 calleesaved_x28, calleesaved_x29
# asm 1: stp <calleesaved_x28=int64#29, <calleesaved_x29=int64#30, [sp, #-16]!
# asm 2: stp <calleesaved_x28=x28, <calleesaved_x29=x29, [sp, #-16]!
stp x28, x29, [sp, #-16]!

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

# qhasm: int64 pointer_delta

# qhasm: int64 pointer_F

# qhasm: int64 pointer_G

# qhasm: int64 pointer_V

# qhasm: int64 pointer_S

# qhasm: int64 pointer_uuvvrrss

# qhasm: input pointer_delta

# qhasm: input pointer_F

# qhasm: input pointer_G

# qhasm: input pointer_V

# qhasm: input pointer_S

# qhasm: input pointer_uuvvrrss

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss

# qhasm: int64 ff

# qhasm: int64 f_hi

# qhasm: int64 f

# qhasm: int64 g_hi

# qhasm: int64 g

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 g1

# qhasm: int64 hh

# qhasm: int64 h

# qhasm: int64 m1

# qhasm: int64 ITERATION

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


# qhasm: main_i_loop:
._main_i_loop:

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


# qhasm: ITERATION -= 1 !
# asm 1: subs <ITERATION=int64#7,<ITERATION=int64#7,#1
# asm 2: subs <ITERATION=x6,<ITERATION=x6,#1
subs x6,x6,#1

# qhasm: goto main_i_loop if unsigned>
b.hi ._main_i_loop

# qhasm: reg128 vec_F0_F1_F2_F3

# qhasm: reg128 vec_G0_G1_G2_G3

# qhasm: 2x vec_F0_F1_F2_F3 zip= vec_F0_F1_G0_G1[0/2] vec_F2_F3_G2_G3[0/2]
# asm 1: zip1 >vec_F0_F1_F2_F3=reg128#1.2d, <vec_F0_F1_G0_G1=reg128#7.2d, <vec_F2_F3_G2_G3=reg128#8.2d
# asm 2: zip1 >vec_F0_F1_F2_F3=v0.2d, <vec_F0_F1_G0_G1=v6.2d, <vec_F2_F3_G2_G3=v7.2d
zip1 v0.2d, v6.2d, v7.2d

# qhasm: 2x vec_G0_G1_G2_G3 zip= vec_F0_F1_G0_G1[1/2] vec_F2_F3_G2_G3[1/2]
# asm 1: zip2 >vec_G0_G1_G2_G3=reg128#2.2d, <vec_F0_F1_G0_G1=reg128#7.2d, <vec_F2_F3_G2_G3=reg128#8.2d
# asm 2: zip2 >vec_G0_G1_G2_G3=v1.2d, <vec_F0_F1_G0_G1=v6.2d, <vec_F2_F3_G2_G3=v7.2d
zip2 v1.2d, v6.2d, v7.2d

# qhasm: reg128 vec_F4_F5_F6_F7

# qhasm: reg128 vec_G4_G5_G6_G7

# qhasm: 2x vec_F4_F5_F6_F7 zip= vec_F4_F5_G4_G5[0/2] vec_F6_F7_G6_G7[0/2]
# asm 1: zip1 >vec_F4_F5_F6_F7=reg128#3.2d, <vec_F4_F5_G4_G5=reg128#9.2d, <vec_F6_F7_G6_G7=reg128#10.2d
# asm 2: zip1 >vec_F4_F5_F6_F7=v2.2d, <vec_F4_F5_G4_G5=v8.2d, <vec_F6_F7_G6_G7=v9.2d
zip1 v2.2d, v8.2d, v9.2d

# qhasm: 2x vec_G4_G5_G6_G7 zip= vec_F4_F5_G4_G5[1/2] vec_F6_F7_G6_G7[1/2]
# asm 1: zip2 >vec_G4_G5_G6_G7=reg128#4.2d, <vec_F4_F5_G4_G5=reg128#9.2d, <vec_F6_F7_G6_G7=reg128#10.2d
# asm 2: zip2 >vec_G4_G5_G6_G7=v3.2d, <vec_F4_F5_G4_G5=v8.2d, <vec_F6_F7_G6_G7=v9.2d
zip2 v3.2d, v8.2d, v9.2d

# qhasm: mem256[pointer_F] = vec_F0_F1_F2_F3, vec_F4_F5_F6_F7
# asm 1: stp <vec_F0_F1_F2_F3=reg128#1%qregname, <vec_F4_F5_F6_F7=reg128#3%qregname, [<pointer_F=int64#2]
# asm 2: stp <vec_F0_F1_F2_F3=q0, <vec_F4_F5_F6_F7=q2, [<pointer_F=x1]
stp q0, q2, [x1]

# qhasm: mem256[pointer_G] = vec_G0_G1_G2_G3, vec_G4_G5_G6_G7
# asm 1: stp <vec_G0_G1_G2_G3=reg128#2%qregname, <vec_G4_G5_G6_G7=reg128#4%qregname, [<pointer_G=int64#3]
# asm 2: stp <vec_G0_G1_G2_G3=q1, <vec_G4_G5_G6_G7=q3, [<pointer_G=x2]
stp q1, q3, [x2]

# qhasm: int64 F8

# qhasm: F8 = vec_F8_F9_G8_G9[0/2]
# asm 1: umov >F8=int64#1, <vec_F8_F9_G8_G9=reg128#11.d[0]
# asm 2: umov >F8=x0, <vec_F8_F9_G8_G9=v10.d[0]
umov x0, v10.d[0]

# qhasm: mem32[pointer_F+32] = F8
# asm 1: str <F8=int64#1%wregname, [<pointer_F=int64#2, #32]
# asm 2: str <F8=w0, [<pointer_F=x1, #32]
str w0, [x1, #32]

# qhasm: int64 G8

# qhasm: G8 = vec_F8_F9_G8_G9[1/2]
# asm 1: umov >G8=int64#1, <vec_F8_F9_G8_G9=reg128#11.d[1]
# asm 2: umov >G8=x0, <vec_F8_F9_G8_G9=v10.d[1]
umov x0, v10.d[1]

# qhasm: mem32[pointer_G+32] = G8
# asm 1: str <G8=int64#1%wregname, [<pointer_G=int64#3, #32]
# asm 2: str <G8=w0, [<pointer_G=x2, #32]
str w0, [x2, #32]

# qhasm: reg128 vec_V0_V1_V2_V3

# qhasm: reg128 vec_V4_V5_V6_V7

# qhasm: reg128 vec_S0_S1_S2_S3

# qhasm: reg128 vec_S4_S5_S6_S7

# qhasm: 2x vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2]
# asm 1: zip1 >vec_V0_V1_V2_V3=reg128#1.2d, <vec_V0_V1_S0_S1=reg128#12.2d, <vec_V2_V3_S2_S3=reg128#13.2d
# asm 2: zip1 >vec_V0_V1_V2_V3=v0.2d, <vec_V0_V1_S0_S1=v11.2d, <vec_V2_V3_S2_S3=v12.2d
zip1 v0.2d, v11.2d, v12.2d

# qhasm: 2x vec_S0_S1_S2_S3 zip= vec_V0_V1_S0_S1[1/2] vec_V2_V3_S2_S3[1/2]
# asm 1: zip2 >vec_S0_S1_S2_S3=reg128#2.2d, <vec_V0_V1_S0_S1=reg128#12.2d, <vec_V2_V3_S2_S3=reg128#13.2d
# asm 2: zip2 >vec_S0_S1_S2_S3=v1.2d, <vec_V0_V1_S0_S1=v11.2d, <vec_V2_V3_S2_S3=v12.2d
zip2 v1.2d, v11.2d, v12.2d

# qhasm: 2x vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]
# asm 1: zip1 >vec_V4_V5_V6_V7=reg128#3.2d, <vec_V4_V5_S4_S5=reg128#14.2d, <vec_V6_V7_S6_S7=reg128#15.2d
# asm 2: zip1 >vec_V4_V5_V6_V7=v2.2d, <vec_V4_V5_S4_S5=v13.2d, <vec_V6_V7_S6_S7=v14.2d
zip1 v2.2d, v13.2d, v14.2d

# qhasm: 2x vec_S4_S5_S6_S7 zip= vec_V4_V5_S4_S5[1/2] vec_V6_V7_S6_S7[1/2]
# asm 1: zip2 >vec_S4_S5_S6_S7=reg128#4.2d, <vec_V4_V5_S4_S5=reg128#14.2d, <vec_V6_V7_S6_S7=reg128#15.2d
# asm 2: zip2 >vec_S4_S5_S6_S7=v3.2d, <vec_V4_V5_S4_S5=v13.2d, <vec_V6_V7_S6_S7=v14.2d
zip2 v3.2d, v13.2d, v14.2d

# qhasm: mem256[pointer_V] = vec_V0_V1_V2_V3, vec_V4_V5_V6_V7
# asm 1: stp <vec_V0_V1_V2_V3=reg128#1%qregname, <vec_V4_V5_V6_V7=reg128#3%qregname, [<pointer_V=int64#4]
# asm 2: stp <vec_V0_V1_V2_V3=q0, <vec_V4_V5_V6_V7=q2, [<pointer_V=x3]
stp q0, q2, [x3]

# qhasm: mem256[pointer_S] = vec_S0_S1_S2_S3, vec_S4_S5_S6_S7
# asm 1: stp <vec_S0_S1_S2_S3=reg128#2%qregname, <vec_S4_S5_S6_S7=reg128#4%qregname, [<pointer_S=int64#5]
# asm 2: stp <vec_S0_S1_S2_S3=q1, <vec_S4_S5_S6_S7=q3, [<pointer_S=x4]
stp q1, q3, [x4]

# qhasm: int64 V8

# qhasm: V8 = vec_V8_V9_S8_S9[0/2]
# asm 1: umov >V8=int64#1, <vec_V8_V9_S8_S9=reg128#16.d[0]
# asm 2: umov >V8=x0, <vec_V8_V9_S8_S9=v15.d[0]
umov x0, v15.d[0]

# qhasm: mem32[pointer_V+32] = V8
# asm 1: str <V8=int64#1%wregname, [<pointer_V=int64#4, #32]
# asm 2: str <V8=w0, [<pointer_V=x3, #32]
str w0, [x3, #32]

# qhasm: int64 S8

# qhasm: S8 = vec_V8_V9_S8_S9[1/2]
# asm 1: umov >S8=int64#1, <vec_V8_V9_S8_S9=reg128#16.d[1]
# asm 2: umov >S8=x0, <vec_V8_V9_S8_S9=v15.d[1]
umov x0, v15.d[1]

# qhasm: mem32[pointer_S+32] = S8
# asm 1: str <S8=int64#1%wregname, [<pointer_S=int64#5, #32]
# asm 2: str <S8=w0, [<pointer_S=x4, #32]
str w0, [x4, #32]

# qhasm: mem128[pointer_uuvvrrss] = uu, vv
# asm 1: stp <uu=int64#10, <vv=int64#11, [<pointer_uuvvrrss=int64#6]
# asm 2: stp <uu=x9, <vv=x10, [<pointer_uuvvrrss=x5]
stp x9, x10, [x5]

# qhasm: mem128[pointer_uuvvrrss + 16] = rr, ss
# asm 1: stp <rr=int64#12, <ss=int64#13, [<pointer_uuvvrrss=int64#6, #16]
# asm 2: stp <rr=x11, <ss=x12, [<pointer_uuvvrrss=x5, #16]
stp x11, x12, [x5, #16]

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

# qhasm: pop2xint64 calleesaved_x28, calleesaved_x29
# asm 1: ldp >calleesaved_x28=int64#29, >calleesaved_x29=int64#30, [sp], #16
# asm 2: ldp >calleesaved_x28=x28, >calleesaved_x29=x29, [sp], #16
ldp x28, x29, [sp], #16

# qhasm: pop2xint64 calleesaved_x26, calleesaved_x27
# asm 1: ldp >calleesaved_x26=int64#27, >calleesaved_x27=int64#28, [sp], #16
# asm 2: ldp >calleesaved_x26=x26, >calleesaved_x27=x27, [sp], #16
ldp x26, x27, [sp], #16

# qhasm: pop2xint64 calleesaved_x24, calleesaved_x25
# asm 1: ldp >calleesaved_x24=int64#25, >calleesaved_x25=int64#26, [sp], #16
# asm 2: ldp >calleesaved_x24=x24, >calleesaved_x25=x25, [sp], #16
ldp x24, x25, [sp], #16

# qhasm: pop2xint64 calleesaved_x22, calleesaved_x23
# asm 1: ldp >calleesaved_x22=int64#23, >calleesaved_x23=int64#24, [sp], #16
# asm 2: ldp >calleesaved_x22=x22, >calleesaved_x23=x23, [sp], #16
ldp x22, x23, [sp], #16

# qhasm: pop2xint64 calleesaved_x20, calleesaved_x21
# asm 1: ldp >calleesaved_x20=int64#21, >calleesaved_x21=int64#22, [sp], #16
# asm 2: ldp >calleesaved_x20=x20, >calleesaved_x21=x21, [sp], #16
ldp x20, x21, [sp], #16

# qhasm: pop2xint64 calleesaved_x18, calleesaved_x19
# asm 1: ldp >calleesaved_x18=int64#19, >calleesaved_x19=int64#20, [sp], #16
# asm 2: ldp >calleesaved_x18=x18, >calleesaved_x19=x19, [sp], #16
ldp x18, x19, [sp], #16

# qhasm: return
ret
