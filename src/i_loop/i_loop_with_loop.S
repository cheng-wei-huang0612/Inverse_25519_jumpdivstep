
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

# qhasm: ITERATION = 9
# asm 1: mov >ITERATION=int64#7, #9
# asm 2: mov >ITERATION=x6, #9
mov x6, #9

# qhasm: reg128 vec_2x_2p32m1

# qhasm: reg128 vec_2x_2p30m1

# qhasm: 2x vec_2x_2p32m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p32m1=reg128#1.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p32m1=v0.2d, #0xFFFFFFFF
movi v0.2d, #0xFFFFFFFF

# qhasm: 2x vec_2x_2p30m1 = vec_2x_2p32m1 >> 2
# asm 1: sshr <vec_2x_2p30m1=reg128#2.2d, <vec_2x_2p32m1=reg128#1.2d, #2
# asm 2: sshr <vec_2x_2p30m1=v1.2d, <vec_2x_2p32m1=v0.2d, #2
sshr v1.2d, v0.2d, #2

# qhasm: int64 M

# qhasm: M = 0
# asm 1: mov >M=int64#8, #0
# asm 2: mov >M=x7, #0
mov x7, #0

# qhasm: M[0/4] = 51739
# asm 1: movk <M=int64#8, #51739
# asm 2: movk <M=x7, #51739
movk x7, #51739

# qhasm: M[1/4] = 10347
# asm 1: movk <M=int64#8, #10347,LSL #16
# asm 2: movk <M=x7, #10347,LSL #16
movk x7, #10347,LSL #16

# qhasm: reg128 vec_M

# qhasm: 4x vec_M = M
# asm 1: dup <vec_M=reg128#3.4s, <M=int64#8%wregname
# asm 2: dup <vec_M=v2.4s, <M=w7
dup v2.4s, w7

# qhasm: int64 _19

# qhasm: _19 = 19
# asm 1: mov >_19=int64#8, #19
# asm 2: mov >_19=x7, #19
mov x7, #19

# qhasm: reg128 vec_4x_19

# qhasm: 4x vec_4x_19 = _19
# asm 1: dup <vec_4x_19=reg128#4.4s, <_19=int64#8%wregname
# asm 2: dup <vec_4x_19=v3.4s, <_19=w7
dup v3.4s, w7

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
# asm 1: ins <vec_F0_F1_G0_G1=reg128#5.d[0], <F0F1=int64#10
# asm 2: ins <vec_F0_F1_G0_G1=v4.d[0], <F0F1=x9
ins v4.d[0], x9

# qhasm: vec_F0_F1_G0_G1[1/2] = G0G1 
# asm 1: ins <vec_F0_F1_G0_G1=reg128#5.d[1], <G0G1=int64#15
# asm 2: ins <vec_F0_F1_G0_G1=v4.d[1], <G0G1=x14
ins v4.d[1], x14

# qhasm: reg128 vec_F2_F3_G2_G3 

# qhasm: vec_F2_F3_G2_G3[0/2] = F2F3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#6.d[0], <F2F3=int64#11
# asm 2: ins <vec_F2_F3_G2_G3=v5.d[0], <F2F3=x10
ins v5.d[0], x10

# qhasm: vec_F2_F3_G2_G3[1/2] = G2G3 
# asm 1: ins <vec_F2_F3_G2_G3=reg128#6.d[1], <G2G3=int64#16
# asm 2: ins <vec_F2_F3_G2_G3=v5.d[1], <G2G3=x15
ins v5.d[1], x15

# qhasm: reg128 vec_F4_F5_G4_G5 

# qhasm: vec_F4_F5_G4_G5[0/2] = F4F5 
# asm 1: ins <vec_F4_F5_G4_G5=reg128#7.d[0], <F4F5=int64#12
# asm 2: ins <vec_F4_F5_G4_G5=v6.d[0], <F4F5=x11
ins v6.d[0], x11

# qhasm: vec_F4_F5_G4_G5[1/2] = G4G5 
# asm 1: ins <vec_F4_F5_G4_G5=reg128#7.d[1], <G4G5=int64#17
# asm 2: ins <vec_F4_F5_G4_G5=v6.d[1], <G4G5=x16
ins v6.d[1], x16

# qhasm: reg128 vec_F6_F7_G6_G7 

# qhasm: vec_F6_F7_G6_G7[0/2] = F6F7 
# asm 1: ins <vec_F6_F7_G6_G7=reg128#8.d[0], <F6F7=int64#13
# asm 2: ins <vec_F6_F7_G6_G7=v7.d[0], <F6F7=x12
ins v7.d[0], x12

# qhasm: vec_F6_F7_G6_G7[1/2] = G6G7 
# asm 1: ins <vec_F6_F7_G6_G7=reg128#8.d[1], <G6G7=int64#18
# asm 2: ins <vec_F6_F7_G6_G7=v7.d[1], <G6G7=x17
ins v7.d[1], x17

# qhasm: reg128 vec_F8_F9_G8_G9 

# qhasm: vec_F8_F9_G8_G9[0/2] = F8F9 
# asm 1: ins <vec_F8_F9_G8_G9=reg128#9.d[0], <F8F9=int64#14
# asm 2: ins <vec_F8_F9_G8_G9=v8.d[0], <F8F9=x13
ins v8.d[0], x13

# qhasm: vec_F8_F9_G8_G9[1/2] = G8G9 
# asm 1: ins <vec_F8_F9_G8_G9=reg128#9.d[1], <G8G9=int64#19
# asm 2: ins <vec_F8_F9_G8_G9=v8.d[1], <G8G9=x18
ins v8.d[1], x18

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
# asm 1: ins <vec_V0_V1_S0_S1=reg128#10.d[0], <V0V1=int64#10
# asm 2: ins <vec_V0_V1_S0_S1=v9.d[0], <V0V1=x9
ins v9.d[0], x9

# qhasm: vec_V0_V1_S0_S1[1/2] = S0S1 
# asm 1: ins <vec_V0_V1_S0_S1=reg128#10.d[1], <S0S1=int64#15
# asm 2: ins <vec_V0_V1_S0_S1=v9.d[1], <S0S1=x14
ins v9.d[1], x14

# qhasm: vec_V2_V3_S2_S3[0/2] = V2V3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#11.d[0], <V2V3=int64#11
# asm 2: ins <vec_V2_V3_S2_S3=v10.d[0], <V2V3=x10
ins v10.d[0], x10

# qhasm: vec_V2_V3_S2_S3[1/2] = S2S3 
# asm 1: ins <vec_V2_V3_S2_S3=reg128#11.d[1], <S2S3=int64#16
# asm 2: ins <vec_V2_V3_S2_S3=v10.d[1], <S2S3=x15
ins v10.d[1], x15

# qhasm: vec_V4_V5_S4_S5[0/2] = V4V5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#12.d[0], <V4V5=int64#12
# asm 2: ins <vec_V4_V5_S4_S5=v11.d[0], <V4V5=x11
ins v11.d[0], x11

# qhasm: vec_V4_V5_S4_S5[1/2] = S4S5 
# asm 1: ins <vec_V4_V5_S4_S5=reg128#12.d[1], <S4S5=int64#17
# asm 2: ins <vec_V4_V5_S4_S5=v11.d[1], <S4S5=x16
ins v11.d[1], x16

# qhasm: vec_V6_V7_S6_S7[0/2] = V6V7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#13.d[0], <V6V7=int64#13
# asm 2: ins <vec_V6_V7_S6_S7=v12.d[0], <V6V7=x12
ins v12.d[0], x12

# qhasm: vec_V6_V7_S6_S7[1/2] = S6S7 
# asm 1: ins <vec_V6_V7_S6_S7=reg128#13.d[1], <S6S7=int64#18
# asm 2: ins <vec_V6_V7_S6_S7=v12.d[1], <S6S7=x17
ins v12.d[1], x17

# qhasm: vec_V8_V9_S8_S9[0/2] = V8V9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#14.d[0], <V8V9=int64#14
# asm 2: ins <vec_V8_V9_S8_S9=v13.d[0], <V8V9=x13
ins v13.d[0], x13

# qhasm: vec_V8_V9_S8_S9[1/2] = S8S9 
# asm 1: ins <vec_V8_V9_S8_S9=reg128#14.d[1], <S8S9=int64#19
# asm 2: ins <vec_V8_V9_S8_S9=v13.d[1], <S8S9=x18
ins v13.d[1], x18

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

# qhasm: int64 uu0

# qhasm: int64 uu1

# qhasm: uu0 = uu & ((1 << 30)-1)
# asm 1: ubfx >uu0=int64#15, <uu=int64#10, #0, #30
# asm 2: ubfx >uu0=x14, <uu=x9, #0, #30
ubfx x14, x9, #0, #30

# qhasm: uu1 = (uu >> 30) & ((1 << 32)-1)
# asm 1: ubfx >uu1=int64#10, <uu=int64#10, #30, #32
# asm 2: ubfx >uu1=x9, <uu=x9, #30, #32
ubfx x9, x9, #30, #32

# qhasm: int64 vv0

# qhasm: int64 vv1

# qhasm: vv0 = vv & ((1 << 30)-1)
# asm 1: ubfx >vv0=int64#16, <vv=int64#11, #0, #30
# asm 2: ubfx >vv0=x15, <vv=x10, #0, #30
ubfx x15, x10, #0, #30

# qhasm: vv1 = (vv >> 30) & ((1 << 32)-1)
# asm 1: ubfx >vv1=int64#11, <vv=int64#11, #30, #32
# asm 2: ubfx >vv1=x10, <vv=x10, #30, #32
ubfx x10, x10, #30, #32

# qhasm: int64 rr0

# qhasm: int64 rr1

# qhasm: rr0 = rr & ((1 << 30)-1)
# asm 1: ubfx >rr0=int64#17, <rr=int64#12, #0, #30
# asm 2: ubfx >rr0=x16, <rr=x11, #0, #30
ubfx x16, x11, #0, #30

# qhasm: rr1 = (rr >> 30) & ((1 << 32)-1)
# asm 1: ubfx >rr1=int64#12, <rr=int64#12, #30, #32
# asm 2: ubfx >rr1=x11, <rr=x11, #30, #32
ubfx x11, x11, #30, #32

# qhasm: int64 ss0

# qhasm: int64 ss1

# qhasm: ss0 = ss & ((1 << 30)-1)
# asm 1: ubfx >ss0=int64#18, <ss=int64#13, #0, #30
# asm 2: ubfx >ss0=x17, <ss=x12, #0, #30
ubfx x17, x12, #0, #30

# qhasm: ss1 = (ss >> 30) & ((1 << 32)-1)
# asm 1: ubfx >ss1=int64#13, <ss=int64#13, #30, #32
# asm 2: ubfx >ss1=x12, <ss=x12, #30, #32
ubfx x12, x12, #30, #32

# qhasm: reg128 vec_uu0_rr0_vv0_ss0

# qhasm: vec_uu0_rr0_vv0_ss0[0/4] = uu0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#17.s[0], <uu0=int64#15%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v16.s[0], <uu0=w14
ins v16.s[0], w14

# qhasm: vec_uu0_rr0_vv0_ss0[1/4] = rr0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#17.s[1], <rr0=int64#17%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v16.s[1], <rr0=w16
ins v16.s[1], w16

# qhasm: vec_uu0_rr0_vv0_ss0[2/4] = vv0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#17.s[2], <vv0=int64#16%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v16.s[2], <vv0=w15
ins v16.s[2], w15

# qhasm: vec_uu0_rr0_vv0_ss0[3/4] = ss0
# asm 1: ins <vec_uu0_rr0_vv0_ss0=reg128#17.s[3], <ss0=int64#18%wregname
# asm 2: ins <vec_uu0_rr0_vv0_ss0=v16.s[3], <ss0=w17
ins v16.s[3], w17

# qhasm: reg128 vec_uu1_rr1_vv1_ss1

# qhasm: vec_uu1_rr1_vv1_ss1[0/4] = uu1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#18.s[0], <uu1=int64#10%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v17.s[0], <uu1=w9
ins v17.s[0], w9

# qhasm: vec_uu1_rr1_vv1_ss1[1/4] = rr1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#18.s[1], <rr1=int64#12%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v17.s[1], <rr1=w11
ins v17.s[1], w11

# qhasm: vec_uu1_rr1_vv1_ss1[2/4] = vv1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#18.s[2], <vv1=int64#11%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v17.s[2], <vv1=w10
ins v17.s[2], w10

# qhasm: vec_uu1_rr1_vv1_ss1[3/4] = ss1
# asm 1: ins <vec_uu1_rr1_vv1_ss1=reg128#18.s[3], <ss1=int64#13%wregname
# asm 2: ins <vec_uu1_rr1_vv1_ss1=v17.s[3], <ss1=w12
ins v17.s[3], w12

# qhasm: reg128 vec_buffer

# qhasm: reg128 vec_prod

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smull >vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F0_F1_G0_G1=reg128#5.s[0]
# asm 2: smull >vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F0_F1_G0_G1=v4.s[0]
smull v18.2d,v16.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F0_F1_G0_G1=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F0_F1_G0_G1=v4.s[2]
smlal2 v18.2d,v16.4s,v4.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F0_F1_G0_G1=reg128#5.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F0_F1_G0_G1=v4.s[1]
smlal v18.2d,v16.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F0_F1_G0_G1=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F0_F1_G0_G1=v4.s[3]
smlal2 v18.2d,v16.4s,v4.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#5.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F0_F1_G0_G1=v4.s[0]
smlal v18.2d,v17.2s,v4.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#5.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F0_F1_G0_G1=v4.s[2]
smlal2 v18.2d,v17.4s,v4.s[2]

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F2_F3_G2_G3=reg128#6.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F2_F3_G2_G3=v5.s[0]
smlal v18.2d,v16.2s,v5.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F2_F3_G2_G3=reg128#6.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F2_F3_G2_G3=v5.s[2]
smlal2 v18.2d,v16.4s,v5.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F0_F1_G0_G1=reg128#5.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F0_F1_G0_G1=v4.s[1]
smlal v18.2d,v17.2s,v4.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F0_F1_G0_G1=reg128#5.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F0_F1_G0_G1=v4.s[3]
smlal2 v18.2d,v17.4s,v4.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#5.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v4.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v4.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: vec_F0_F1_G0_G1 = vec_buffer
# asm 1: mov >vec_F0_F1_G0_G1=reg128#5.16b, <vec_buffer=reg128#5.16b
# asm 2: mov >vec_F0_F1_G0_G1=v4.16b, <vec_buffer=v4.16b
mov v4.16b, v4.16b

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F2_F3_G2_G3=reg128#6.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F2_F3_G2_G3=v5.s[1]
smlal v18.2d,v16.2s,v5.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F2_F3_G2_G3=reg128#6.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F2_F3_G2_G3=v5.s[3]
smlal2 v18.2d,v16.4s,v5.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#6.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F2_F3_G2_G3=v5.s[0]
smlal v18.2d,v17.2s,v5.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#6.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F2_F3_G2_G3=v5.s[2]
smlal2 v18.2d,v17.4s,v5.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#20.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v19.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v19.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#20.2d, <vec_buffer=reg128#20.2d, #32
# asm 2: shl >vec_buffer=v19.2d, <vec_buffer=v19.2d, #32
shl v19.2d, v19.2d, #32

# qhasm: vec_F0_F1_G0_G1 |= vec_buffer
# asm 1: orr <vec_F0_F1_G0_G1=reg128#5.16b, <vec_F0_F1_G0_G1=reg128#5.16b, <vec_buffer=reg128#20.16b
# asm 2: orr <vec_F0_F1_G0_G1=v4.16b, <vec_F0_F1_G0_G1=v4.16b, <vec_buffer=v19.16b
orr v4.16b, v4.16b, v19.16b

# qhasm: f_hi = vec_F0_F1_G0_G1[1/4]
# asm 1: smov >f_hi=int64#10, <vec_F0_F1_G0_G1=reg128#5.s[1]
# asm 2: smov >f_hi=x9, <vec_F0_F1_G0_G1=v4.s[1]
smov x9, v4.s[1]

# qhasm: f = vec_F0_F1_G0_G1[0/4]
# asm 1: smov >f=int64#11, <vec_F0_F1_G0_G1=reg128#5.s[0]
# asm 2: smov >f=x10, <vec_F0_F1_G0_G1=v4.s[0]
smov x10, v4.s[0]

# qhasm: g_hi = vec_F0_F1_G0_G1[3/4]
# asm 1: smov >g_hi=int64#12, <vec_F0_F1_G0_G1=reg128#5.s[3]
# asm 2: smov >g_hi=x11, <vec_F0_F1_G0_G1=v4.s[3]
smov x11, v4.s[3]

# qhasm: g = vec_F0_F1_G0_G1[2/4]
# asm 1: smov >g=int64#13, <vec_F0_F1_G0_G1=reg128#5.s[2]
# asm 2: smov >g=x12, <vec_F0_F1_G0_G1=v4.s[2]
smov x12, v4.s[2]

# qhasm: f = f + f_hi << 30
# asm 1: add >f=int64#10,<f=int64#11,<f_hi=int64#10,LSL #30
# asm 2: add >f=x9,<f=x10,<f_hi=x9,LSL #30
add x9,x10,x9,LSL #30

# qhasm: g = g + g_hi << 30
# asm 1: add >g=int64#11,<g=int64#13,<g_hi=int64#12,LSL #30
# asm 2: add >g=x10,<g=x12,<g_hi=x11,LSL #30
add x10,x12,x11,LSL #30

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F4_F5_G4_G5=reg128#7.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F4_F5_G4_G5=v6.s[0]
smlal v18.2d,v16.2s,v6.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F4_F5_G4_G5=reg128#7.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F4_F5_G4_G5=v6.s[2]
smlal2 v18.2d,v16.4s,v6.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F2_F3_G2_G3=reg128#6.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F2_F3_G2_G3=v5.s[1]
smlal v18.2d,v17.2s,v5.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F2_F3_G2_G3=reg128#6.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F2_F3_G2_G3=v5.s[3]
smlal2 v18.2d,v17.4s,v5.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#6.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v5.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v5.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: vec_F2_F3_G2_G3 = vec_buffer
# asm 1: mov >vec_F2_F3_G2_G3=reg128#6.16b, <vec_buffer=reg128#6.16b
# asm 2: mov >vec_F2_F3_G2_G3=v5.16b, <vec_buffer=v5.16b
mov v5.16b, v5.16b

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#12, <f=int64#10, #1048575
# asm 2: and >fuv=x11, <f=x9, #1048575
and x11, x9, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#13, <g=int64#11, #1048575
# asm 2: and >grs=x12, <g=x10, #1048575
and x12, x10, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#12,<fuv=int64#12,<2p41=int64#8
# asm 2: sub <fuv=x11,<fuv=x11,<2p41=x7
sub x11,x11,x7

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#13,<grs=int64#13,<2p62=int64#9
# asm 2: sub <grs=x12,<grs=x12,<2p62=x8
sub x12,x12,x8

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F4_F5_G4_G5=reg128#7.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F4_F5_G4_G5=v6.s[1]
smlal v18.2d,v16.2s,v6.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F4_F5_G4_G5=reg128#7.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F4_F5_G4_G5=v6.s[3]
smlal2 v18.2d,v16.4s,v6.s[3]

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F4_F5_G4_G5=reg128#7.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F4_F5_G4_G5=v6.s[0]
smlal v18.2d,v17.2s,v6.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F4_F5_G4_G5=reg128#7.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F4_F5_G4_G5=v6.s[2]
smlal2 v18.2d,v17.4s,v6.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#20.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v19.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v19.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#20.2d, <vec_buffer=reg128#20.2d, #32
# asm 2: shl >vec_buffer=v19.2d, <vec_buffer=v19.2d, #32
shl v19.2d, v19.2d, #32

# qhasm: vec_F2_F3_G2_G3 |= vec_buffer
# asm 1: orr <vec_F2_F3_G2_G3=reg128#6.16b, <vec_F2_F3_G2_G3=reg128#6.16b, <vec_buffer=reg128#20.16b
# asm 2: orr <vec_F2_F3_G2_G3=v5.16b, <vec_F2_F3_G2_G3=v5.16b, <vec_buffer=v19.16b
orr v5.16b, v5.16b, v19.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F6_F7_G6_G7=reg128#8.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F6_F7_G6_G7=v7.s[0]
smlal v18.2d,v16.2s,v7.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F6_F7_G6_G7=reg128#8.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F6_F7_G6_G7=v7.s[2]
smlal2 v18.2d,v16.4s,v7.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F4_F5_G4_G5=reg128#7.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F4_F5_G4_G5=v6.s[1]
smlal v18.2d,v17.2s,v6.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F4_F5_G4_G5=reg128#7.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F4_F5_G4_G5=v6.s[3]
smlal2 v18.2d,v17.4s,v6.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#7.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v6.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v6.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: vec_F4_F5_G4_G5 = vec_buffer
# asm 1: mov >vec_F4_F5_G4_G5=reg128#7.16b, <vec_buffer=reg128#7.16b
# asm 2: mov >vec_F4_F5_G4_G5=v6.16b, <vec_buffer=v6.16b
mov v6.16b, v6.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F6_F7_G6_G7=reg128#8.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F6_F7_G6_G7=v7.s[1]
smlal v18.2d,v16.2s,v7.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F6_F7_G6_G7=reg128#8.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F6_F7_G6_G7=v7.s[3]
smlal2 v18.2d,v16.4s,v7.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F6_F7_G6_G7=reg128#8.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F6_F7_G6_G7=v7.s[0]
smlal v18.2d,v17.2s,v7.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F6_F7_G6_G7=reg128#8.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F6_F7_G6_G7=v7.s[2]
smlal2 v18.2d,v17.4s,v7.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#20.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v19.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v19.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#20.2d, <vec_buffer=reg128#20.2d, #32
# asm 2: shl >vec_buffer=v19.2d, <vec_buffer=v19.2d, #32
shl v19.2d, v19.2d, #32

# qhasm: vec_F4_F5_G4_G5 |= vec_buffer
# asm 1: orr <vec_F4_F5_G4_G5=reg128#7.16b, <vec_F4_F5_G4_G5=reg128#7.16b, <vec_buffer=reg128#20.16b
# asm 2: orr <vec_F4_F5_G4_G5=v6.16b, <vec_F4_F5_G4_G5=v6.16b, <vec_buffer=v19.16b
orr v6.16b, v6.16b, v19.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_F8_F9_G8_G9=reg128#9.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_F8_F9_G8_G9=v8.s[0]
smlal v18.2d,v16.2s,v8.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_F8_F9_G8_G9=reg128#9.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_F8_F9_G8_G9=v8.s[2]
smlal2 v18.2d,v16.4s,v8.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F6_F7_G6_G7=reg128#8.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F6_F7_G6_G7=v7.s[1]
smlal v18.2d,v17.2s,v7.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F6_F7_G6_G7=reg128#8.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F6_F7_G6_G7=v7.s[3]
smlal2 v18.2d,v17.4s,v7.s[3]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#8.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v7.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v7.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: vec_F6_F7_G6_G7 = vec_buffer
# asm 1: mov >vec_F6_F7_G6_G7=reg128#8.16b, <vec_buffer=reg128#8.16b
# asm 2: mov >vec_F6_F7_G6_G7=v7.16b, <vec_buffer=v7.16b
mov v7.16b, v7.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_F8_F9_G8_G9=reg128#9.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_F8_F9_G8_G9=v8.s[0]
smlal v18.2d,v17.2s,v8.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_F8_F9_G8_G9=reg128#9.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_F8_F9_G8_G9=v8.s[2]
smlal2 v18.2d,v17.4s,v8.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#9.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v8.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v8.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#9.2d, <vec_buffer=reg128#9.2d, #32
# asm 2: shl >vec_buffer=v8.2d, <vec_buffer=v8.2d, #32
shl v8.2d, v8.2d, #32

# qhasm: vec_F6_F7_G6_G7 |= vec_buffer
# asm 1: orr <vec_F6_F7_G6_G7=reg128#8.16b, <vec_F6_F7_G6_G7=reg128#8.16b, <vec_buffer=reg128#9.16b
# asm 2: orr <vec_F6_F7_G6_G7=v7.16b, <vec_F6_F7_G6_G7=v7.16b, <vec_buffer=v8.16b
orr v7.16b, v7.16b, v8.16b

# qhasm: vec_F8_F9_G8_G9 = vec_prod
# asm 1: mov >vec_F8_F9_G8_G9=reg128#9.16b, <vec_prod=reg128#19.16b
# asm 2: mov >vec_F8_F9_G8_G9=v8.16b, <vec_prod=v18.16b
mov v8.16b, v18.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: reg128 final_add_0

# qhasm: reg128 final_add_1

# qhasm: 2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smull >vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V0_V1_S0_S1=reg128#10.s[0]
# asm 2: smull >vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V0_V1_S0_S1=v9.s[0]
smull v18.2d,v16.2s,v9.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V0_V1_S0_S1=reg128#10.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V0_V1_S0_S1=v9.s[2]
smlal2 v18.2d,v16.4s,v9.s[2]

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: reg128 vec_l0

# qhasm: 4x vec_l0 = vec_prod * vec_M
# asm 1: mul >vec_l0=reg128#20.4s,<vec_prod=reg128#19.4s,<vec_M=reg128#3.4s
# asm 2: mul >vec_l0=v19.4s,<vec_prod=v18.4s,<vec_M=v2.4s
mul v19.4s,v18.4s,v2.4s

# qhasm: vec_l0 &= vec_2x_2p30m1
# asm 1: and <vec_l0=reg128#20.16b, <vec_l0=reg128#20.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and <vec_l0=v19.16b, <vec_l0=v19.16b, <vec_2x_2p30m1=v1.16b
and v19.16b, v19.16b, v1.16b

# qhasm: 4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4]
# asm 1: uzp1 >vec_l0=reg128#20.4s, <vec_l0=reg128#20.4s, <vec_l0=reg128#20.4s
# asm 2: uzp1 >vec_l0=v19.4s, <vec_l0=v19.4s, <vec_l0=v19.4s
uzp1 v19.4s, v19.4s, v19.4s

# qhasm: 2x vec_prod -= vec_l0[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#19.2d,<vec_l0=reg128#20.2s,<vec_4x_19=reg128#4.2s
# asm 2: smlsl <vec_prod=v18.2d,<vec_l0=v19.2s,<vec_4x_19=v3.2s
smlsl v18.2d,v19.2s,v3.2s

# qhasm: 2x final_add_0 = vec_l0[0] << 15
# asm 1: sshll >final_add_0=reg128#20.2d,<vec_l0=reg128#20.2s,15
# asm 2: sshll >final_add_0=v19.2d,<vec_l0=v19.2s,15
sshll v19.2d,v19.2s,15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V0_V1_S0_S1=reg128#10.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V0_V1_S0_S1=v9.s[1]
smlal v18.2d,v16.2s,v9.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V0_V1_S0_S1=reg128#10.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V0_V1_S0_S1=v9.s[3]
smlal2 v18.2d,v16.4s,v9.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_V0_V1_S0_S1=reg128#10.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_V0_V1_S0_S1=v9.s[0]
smlal v18.2d,v17.2s,v9.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_V0_V1_S0_S1=reg128#10.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_V0_V1_S0_S1=v9.s[2]
smlal2 v18.2d,v17.4s,v9.s[2]

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: reg128 vec_l1

# qhasm: 4x vec_l1 = vec_prod * vec_M
# asm 1: mul >vec_l1=reg128#21.4s,<vec_prod=reg128#19.4s,<vec_M=reg128#3.4s
# asm 2: mul >vec_l1=v20.4s,<vec_prod=v18.4s,<vec_M=v2.4s
mul v20.4s,v18.4s,v2.4s

# qhasm: vec_l1 &= vec_2x_2p30m1
# asm 1: and <vec_l1=reg128#21.16b, <vec_l1=reg128#21.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and <vec_l1=v20.16b, <vec_l1=v20.16b, <vec_2x_2p30m1=v1.16b
and v20.16b, v20.16b, v1.16b

# qhasm: 4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4]
# asm 1: uzp1 >vec_l1=reg128#21.4s, <vec_l1=reg128#21.4s, <vec_l1=reg128#21.4s
# asm 2: uzp1 >vec_l1=v20.4s, <vec_l1=v20.4s, <vec_l1=v20.4s
uzp1 v20.4s, v20.4s, v20.4s

# qhasm: 2x vec_prod -= vec_l1[0] * vec_4x_19[0]
# asm 1: smlsl <vec_prod=reg128#19.2d,<vec_l1=reg128#21.2s,<vec_4x_19=reg128#4.2s
# asm 2: smlsl <vec_prod=v18.2d,<vec_l1=v20.2s,<vec_4x_19=v3.2s
smlsl v18.2d,v20.2s,v3.2s

# qhasm: 2x final_add_1 = vec_l1[0] << 15
# asm 1: sshll >final_add_1=reg128#21.2d,<vec_l1=reg128#21.2s,15
# asm 2: sshll >final_add_1=v20.2d,<vec_l1=v20.2s,15
sshll v20.2d,v20.2s,15

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V2_V3_S2_S3=reg128#11.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V2_V3_S2_S3=v10.s[0]
smlal v18.2d,v16.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V2_V3_S2_S3=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V2_V3_S2_S3=v10.s[2]
smlal2 v18.2d,v16.4s,v10.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_V0_V1_S0_S1=reg128#10.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_V0_V1_S0_S1=v9.s[1]
smlal v18.2d,v17.2s,v9.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_V0_V1_S0_S1=reg128#10.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_V0_V1_S0_S1=v9.s[3]
smlal2 v18.2d,v17.4s,v9.s[3]

# qhasm: vec_V0_V1_S0_S1 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V0_V1_S0_S1=reg128#10.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_V0_V1_S0_S1=v9.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v9.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V2_V3_S2_S3=reg128#11.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V2_V3_S2_S3=v10.s[1]
smlal v18.2d,v16.2s,v10.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V2_V3_S2_S3=reg128#11.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V2_V3_S2_S3=v10.s[3]
smlal2 v18.2d,v16.4s,v10.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_V2_V3_S2_S3=reg128#11.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_V2_V3_S2_S3=v10.s[0]
smlal v18.2d,v17.2s,v10.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_V2_V3_S2_S3=reg128#11.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_V2_V3_S2_S3=v10.s[2]
smlal2 v18.2d,v17.4s,v10.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#22.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v21.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v21.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#22.2d, <vec_buffer=reg128#22.2d, #32
# asm 2: shl >vec_buffer=v21.2d, <vec_buffer=v21.2d, #32
shl v21.2d, v21.2d, #32

# qhasm: vec_V0_V1_S0_S1 |= vec_buffer
# asm 1: orr <vec_V0_V1_S0_S1=reg128#10.16b, <vec_V0_V1_S0_S1=reg128#10.16b, <vec_buffer=reg128#22.16b
# asm 2: orr <vec_V0_V1_S0_S1=v9.16b, <vec_V0_V1_S0_S1=v9.16b, <vec_buffer=v21.16b
orr v9.16b, v9.16b, v21.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V4_V5_S4_S5=reg128#12.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V4_V5_S4_S5=v11.s[0]
smlal v18.2d,v16.2s,v11.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V4_V5_S4_S5=reg128#12.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V4_V5_S4_S5=v11.s[2]
smlal2 v18.2d,v16.4s,v11.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_V2_V3_S2_S3=reg128#11.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_V2_V3_S2_S3=v10.s[1]
smlal v18.2d,v17.2s,v10.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_V2_V3_S2_S3=reg128#11.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_V2_V3_S2_S3=v10.s[3]
smlal2 v18.2d,v17.4s,v10.s[3]

# qhasm: vec_V2_V3_S2_S3 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V2_V3_S2_S3=reg128#11.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_V2_V3_S2_S3=v10.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v10.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V4_V5_S4_S5=reg128#12.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V4_V5_S4_S5=v11.s[1]
smlal v18.2d,v16.2s,v11.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V4_V5_S4_S5=reg128#12.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V4_V5_S4_S5=v11.s[3]
smlal2 v18.2d,v16.4s,v11.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_V4_V5_S4_S5=reg128#12.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_V4_V5_S4_S5=v11.s[0]
smlal v18.2d,v17.2s,v11.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_V4_V5_S4_S5=reg128#12.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_V4_V5_S4_S5=v11.s[2]
smlal2 v18.2d,v17.4s,v11.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#22.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v21.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v21.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#22.2d, <vec_buffer=reg128#22.2d, #32
# asm 2: shl >vec_buffer=v21.2d, <vec_buffer=v21.2d, #32
shl v21.2d, v21.2d, #32

# qhasm: vec_V2_V3_S2_S3 |= vec_buffer
# asm 1: orr <vec_V2_V3_S2_S3=reg128#11.16b, <vec_V2_V3_S2_S3=reg128#11.16b, <vec_buffer=reg128#22.16b
# asm 2: orr <vec_V2_V3_S2_S3=v10.16b, <vec_V2_V3_S2_S3=v10.16b, <vec_buffer=v21.16b
orr v10.16b, v10.16b, v21.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V6_V7_S6_S7=reg128#13.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V6_V7_S6_S7=v12.s[0]
smlal v18.2d,v16.2s,v12.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V6_V7_S6_S7=reg128#13.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V6_V7_S6_S7=v12.s[2]
smlal2 v18.2d,v16.4s,v12.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_V4_V5_S4_S5=reg128#12.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_V4_V5_S4_S5=v11.s[1]
smlal v18.2d,v17.2s,v11.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_V4_V5_S4_S5=reg128#12.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_V4_V5_S4_S5=v11.s[3]
smlal2 v18.2d,v17.4s,v11.s[3]

# qhasm: vec_V4_V5_S4_S5 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V4_V5_S4_S5=reg128#12.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_V4_V5_S4_S5=v11.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v11.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V6_V7_S6_S7=reg128#13.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V6_V7_S6_S7=v12.s[1]
smlal v18.2d,v16.2s,v12.s[1]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V6_V7_S6_S7=reg128#13.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V6_V7_S6_S7=v12.s[3]
smlal2 v18.2d,v16.4s,v12.s[3]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_V6_V7_S6_S7=reg128#13.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_V6_V7_S6_S7=v12.s[0]
smlal v18.2d,v17.2s,v12.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_V6_V7_S6_S7=reg128#13.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_V6_V7_S6_S7=v12.s[2]
smlal2 v18.2d,v17.4s,v12.s[2]

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#22.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v21.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v21.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#22.2d, <vec_buffer=reg128#22.2d, #32
# asm 2: shl >vec_buffer=v21.2d, <vec_buffer=v21.2d, #32
shl v21.2d, v21.2d, #32

# qhasm: vec_V4_V5_S4_S5 |= vec_buffer
# asm 1: orr <vec_V4_V5_S4_S5=reg128#12.16b, <vec_V4_V5_S4_S5=reg128#12.16b, <vec_buffer=reg128#22.16b
# asm 2: orr <vec_V4_V5_S4_S5=v11.16b, <vec_V4_V5_S4_S5=v11.16b, <vec_buffer=v21.16b
orr v11.16b, v11.16b, v21.16b

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.2s,<vec_V8_V9_S8_S9=reg128#14.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.2s,<vec_V8_V9_S8_S9=v13.s[0]
smlal v18.2d,v16.2s,v13.s[0]

# qhasm: 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu0_rr0_vv0_ss0=reg128#17.4s,<vec_V8_V9_S8_S9=reg128#14.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu0_rr0_vv0_ss0=v16.4s,<vec_V8_V9_S8_S9=v13.s[2]
smlal2 v18.2d,v16.4s,v13.s[2]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[1/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_V6_V7_S6_S7=reg128#13.s[1]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_V6_V7_S6_S7=v12.s[1]
smlal v18.2d,v17.2s,v12.s[1]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[3/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_V6_V7_S6_S7=reg128#13.s[3]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_V6_V7_S6_S7=v12.s[3]
smlal2 v18.2d,v17.4s,v12.s[3]

# qhasm: 2x vec_prod += final_add_0
# asm 1: add <vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, <final_add_0=reg128#20.2d
# asm 2: add <vec_prod=v18.2d, <vec_prod=v18.2d, <final_add_0=v19.2d
add v18.2d, v18.2d, v19.2d

# qhasm: vec_V6_V7_S6_S7 = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_V6_V7_S6_S7=reg128#13.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_V6_V7_S6_S7=v12.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v12.16b, v18.16b, v1.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v18.2d, <vec_prod=v18.2d, #30
sshr v18.2d, v18.2d, #30

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V8_V9_S8_S9[0/4]
# asm 1: smlal <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.2s,<vec_V8_V9_S8_S9=reg128#14.s[0]
# asm 2: smlal <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.2s,<vec_V8_V9_S8_S9=v13.s[0]
smlal v18.2d,v17.2s,v13.s[0]

# qhasm: 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V8_V9_S8_S9[2/4]
# asm 1: smlal2 <vec_prod=reg128#19.2d,<vec_uu1_rr1_vv1_ss1=reg128#18.4s,<vec_V8_V9_S8_S9=reg128#14.s[2]
# asm 2: smlal2 <vec_prod=v18.2d,<vec_uu1_rr1_vv1_ss1=v17.4s,<vec_V8_V9_S8_S9=v13.s[2]
smlal2 v18.2d,v17.4s,v13.s[2]

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: 2x vec_prod += final_add_1
# asm 1: add <vec_prod=reg128#19.2d, <vec_prod=reg128#19.2d, <final_add_1=reg128#21.2d
# asm 2: add <vec_prod=v18.2d, <vec_prod=v18.2d, <final_add_1=v20.2d
add v18.2d, v18.2d, v20.2d

# qhasm: vec_buffer = vec_prod & vec_2x_2p30m1
# asm 1: and >vec_buffer=reg128#14.16b, <vec_prod=reg128#19.16b, <vec_2x_2p30m1=reg128#2.16b
# asm 2: and >vec_buffer=v13.16b, <vec_prod=v18.16b, <vec_2x_2p30m1=v1.16b
and v13.16b, v18.16b, v1.16b

# qhasm: 2x vec_buffer <<= 32
# asm 1: shl >vec_buffer=reg128#14.2d, <vec_buffer=reg128#14.2d, #32
# asm 2: shl >vec_buffer=v13.2d, <vec_buffer=v13.2d, #32
shl v13.2d, v13.2d, #32

# qhasm: vec_V6_V7_S6_S7 |= vec_buffer
# asm 1: orr <vec_V6_V7_S6_S7=reg128#13.16b, <vec_V6_V7_S6_S7=reg128#13.16b, <vec_buffer=reg128#14.16b
# asm 2: orr <vec_V6_V7_S6_S7=v12.16b, <vec_V6_V7_S6_S7=v12.16b, <vec_buffer=v13.16b
orr v12.16b, v12.16b, v13.16b

# qhasm: 2x vec_prod >>= 30
# asm 1: sshr >vec_prod=reg128#14.2d, <vec_prod=reg128#19.2d, #30
# asm 2: sshr >vec_prod=v13.2d, <vec_prod=v18.2d, #30
sshr v13.2d, v18.2d, #30

# qhasm: reg128 vec_2x_2p15m1

# qhasm: 2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
# asm 1: sshr <vec_2x_2p15m1=reg128#15.2d, <vec_2x_2p30m1=reg128#2.2d, #15
# asm 2: sshr <vec_2x_2p15m1=v14.2d, <vec_2x_2p30m1=v1.2d, #15
sshr v14.2d, v1.2d, #15

# qhasm: 2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
# asm 1: sshr <vec_2x_2p15m1=reg128#15.2d, <vec_2x_2p30m1=reg128#2.2d, #15
# asm 2: sshr <vec_2x_2p15m1=v14.2d, <vec_2x_2p30m1=v1.2d, #15
sshr v14.2d, v1.2d, #15

# qhasm: 2x vec_2x_2p32m1 = 0xFFFFFFFF
# asm 1: movi <vec_2x_2p32m1=reg128#1.2d, #0xFFFFFFFF
# asm 2: movi <vec_2x_2p32m1=v0.2d, #0xFFFFFFFF
movi v0.2d, #0xFFFFFFFF

# qhasm: reg128 vec_carry

# qhasm: 2x vec_carry = vec_prod >> 15
# asm 1: sshr <vec_carry=reg128#16.2d, <vec_prod=reg128#14.2d, #15
# asm 2: sshr <vec_carry=v15.2d, <vec_prod=v13.2d, #15
sshr v15.2d, v13.2d, #15

# qhasm: vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
# asm 1: and >vec_V8_V9_S8_S9=reg128#14.16b, <vec_prod=reg128#14.16b, <vec_2x_2p15m1=reg128#15.16b
# asm 2: and >vec_V8_V9_S8_S9=v13.16b, <vec_prod=v13.16b, <vec_2x_2p15m1=v14.16b
and v13.16b, v13.16b, v14.16b

# qhasm: 4x vec_buffer = vec_4x_19 * vec_carry
# asm 1: mul >vec_buffer=reg128#19.4s,<vec_4x_19=reg128#4.4s,<vec_carry=reg128#16.4s
# asm 2: mul >vec_buffer=v18.4s,<vec_4x_19=v3.4s,<vec_carry=v15.4s
mul v18.4s,v3.4s,v15.4s

# qhasm: vec_buffer &= vec_2x_2p32m1
# asm 1: and <vec_buffer=reg128#19.16b, <vec_buffer=reg128#19.16b, <vec_2x_2p32m1=reg128#1.16b
# asm 2: and <vec_buffer=v18.16b, <vec_buffer=v18.16b, <vec_2x_2p32m1=v0.16b
and v18.16b, v18.16b, v0.16b

# qhasm: 4x vec_V0_V1_S0_S1 += vec_buffer
# asm 1: add <vec_V0_V1_S0_S1=reg128#10.4s, <vec_V0_V1_S0_S1=reg128#10.4s, <vec_buffer=reg128#19.4s
# asm 2: add <vec_V0_V1_S0_S1=v9.4s, <vec_V0_V1_S0_S1=v9.4s, <vec_buffer=v18.4s
add v9.4s, v9.4s, v18.4s

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#15, <grs=int64#13, #1
# asm 2: and >g1=x14, <grs=x12, #1
and x14, x12, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#16,<grs=int64#13,<fuv=int64#12
# asm 2: sub >hh=x15,<grs=x12,<fuv=x11
sub x15,x12,x11

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#15, <g1=int64#15, <fuv=int64#12, <grs=int64#13
# asm 2: madd >h=x14, <g1=x14, <fuv=x11, <grs=x12
madd x14, x14, x11, x12

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#17,<m=int64#14,#1
# asm 2: sub >m1=x16,<m=x13,#1
sub x16,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#17, <grs=int64#13, ROR #1
# asm 2: tst <m1=x16, <grs=x12, ROR #1
tst x16, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#17, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x16, <m=x13, pl
csneg x13, x16, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#12, <fuv=int64#12, <grs=int64#13, pl
# asm 2: csel >fuv=x11, <fuv=x11, <grs=x12, pl
csel x11, x11, x12, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#13, <h=int64#15, <hh=int64#16, pl
# asm 2: csel >grs=x12, <h=x14, <hh=x15, pl
csel x12, x14, x15, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm: vv = fuv
# asm 1: mov >vv=int64#15,<fuv=int64#12
# asm 2: mov >vv=x14,<fuv=x11
mov x14,x11

# qhasm: vv = vv + 1048576
# asm 1: add >vv=int64#15,<vv=int64#15,#1048576
# asm 2: add >vv=x14,<vv=x14,#1048576
add x14,x14,#1048576

# qhasm: vv = vv + 2p41
# asm 1: add >vv=int64#15,<vv=int64#15,<2p41=int64#8
# asm 2: add >vv=x14,<vv=x14,<2p41=x7
add x14,x14,x7

# qhasm: vv = vv signed>> 42
# asm 1: asr >vv=int64#15, <vv=int64#15, #42
# asm 2: asr >vv=x14, <vv=x14, #42
asr x14, x14, #42

# qhasm: uu = fuv + 1048576
# asm 1: add >uu=int64#12,<fuv=int64#12,#1048576
# asm 2: add >uu=x11,<fuv=x11,#1048576
add x11,x11,#1048576

# qhasm: uu = uu << 22
# asm 1: lsl >uu=int64#12, <uu=int64#12, #22
# asm 2: lsl >uu=x11, <uu=x11, #22
lsl x11, x11, #22

# qhasm: uu = uu signed>> 43
# asm 1: asr >uu=int64#12, <uu=int64#12, #43
# asm 2: asr >uu=x11, <uu=x11, #43
asr x11, x11, #43

# qhasm: ss = grs
# asm 1: mov >ss=int64#16,<grs=int64#13
# asm 2: mov >ss=x15,<grs=x12
mov x15,x12

# qhasm: ss = ss + 1048576
# asm 1: add >ss=int64#16,<ss=int64#16,#1048576
# asm 2: add >ss=x15,<ss=x15,#1048576
add x15,x15,#1048576

# qhasm: ss = ss + 2p41
# asm 1: add >ss=int64#16,<ss=int64#16,<2p41=int64#8
# asm 2: add >ss=x15,<ss=x15,<2p41=x7
add x15,x15,x7

# qhasm: ss = ss signed>> 42
# asm 1: asr >ss=int64#16, <ss=int64#16, #42
# asm 2: asr >ss=x15, <ss=x15, #42
asr x15, x15, #42

# qhasm: rr = grs + 1048576
# asm 1: add >rr=int64#13,<grs=int64#13,#1048576
# asm 2: add >rr=x12,<grs=x12,#1048576
add x12,x12,#1048576

# qhasm: rr = rr << 22
# asm 1: lsl >rr=int64#13, <rr=int64#13, #22
# asm 2: lsl >rr=x12, <rr=x12, #22
lsl x12, x12, #22

# qhasm: rr = rr signed>> 43
# asm 1: asr >rr=int64#13, <rr=int64#13, #43
# asm 2: asr >rr=x12, <rr=x12, #43
asr x12, x12, #43

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
# asm 1: mul >prod_lo=int64#17,<uu=int64#12,<f=int64#10
# asm 2: mul >prod_lo=x16,<uu=x11,<f=x9
mul x16,x11,x9

# qhasm: prod_hi = uu signed* f (hi)
# asm 1: smulh >prod_hi=int64#18, <uu=int64#12, <f=int64#10
# asm 2: smulh >prod_hi=x17, <uu=x11, <f=x9
smulh x17, x11, x9

# qhasm: tmp = vv * g
# asm 1: mul >tmp=int64#19,<vv=int64#15,<g=int64#11
# asm 2: mul >tmp=x18,<vv=x14,<g=x10
mul x18,x14,x10

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#17, <prod_lo=int64#17, <tmp=int64#19
# asm 2: adds <prod_lo=x16, <prod_lo=x16, <tmp=x18
adds x16, x16, x18

# qhasm: tmp = vv signed* g (hi)
# asm 1: smulh >tmp=int64#19, <vv=int64#15, <g=int64#11
# asm 2: smulh >tmp=x18, <vv=x14, <g=x10
smulh x18, x14, x10

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#18,<prod_hi=int64#18,<tmp=int64#19
# asm 2: adc >prod_hi=x17,<prod_hi=x17,<tmp=x18
adc x17,x17,x18

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#17, <prod_lo=int64#17, #20
# asm 2: lsr >prod_lo=x16, <prod_lo=x16, #20
lsr x16, x16, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#18, <prod_hi=int64#18, #44
# asm 2: lsl >prod_hi=x17, <prod_hi=x17, #44
lsl x17, x17, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#17, <prod_lo=int64#17, <prod_hi=int64#18
# asm 2: orr >new_f=x16, <prod_lo=x16, <prod_hi=x17
orr x16, x16, x17

# qhasm: prod_lo = rr * f
# asm 1: mul >prod_lo=int64#18,<rr=int64#13,<f=int64#10
# asm 2: mul >prod_lo=x17,<rr=x12,<f=x9
mul x17,x12,x9

# qhasm: prod_hi = rr signed* f (hi)
# asm 1: smulh >prod_hi=int64#10, <rr=int64#13, <f=int64#10
# asm 2: smulh >prod_hi=x9, <rr=x12, <f=x9
smulh x9, x12, x9

# qhasm: tmp = ss * g
# asm 1: mul >tmp=int64#19,<ss=int64#16,<g=int64#11
# asm 2: mul >tmp=x18,<ss=x15,<g=x10
mul x18,x15,x10

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#18, <prod_lo=int64#18, <tmp=int64#19
# asm 2: adds <prod_lo=x17, <prod_lo=x17, <tmp=x18
adds x17, x17, x18

# qhasm: tmp = ss signed* g (hi)
# asm 1: smulh >tmp=int64#11, <ss=int64#16, <g=int64#11
# asm 2: smulh >tmp=x10, <ss=x15, <g=x10
smulh x10, x15, x10

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#10,<prod_hi=int64#10,<tmp=int64#11
# asm 2: adc >prod_hi=x9,<prod_hi=x9,<tmp=x10
adc x9,x9,x10

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#11, <prod_lo=int64#18, #20
# asm 2: lsr >prod_lo=x10, <prod_lo=x17, #20
lsr x10, x17, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#10, <prod_hi=int64#10, #44
# asm 2: lsl >prod_hi=x9, <prod_hi=x9, #44
lsl x9, x9, #44

# qhasm: g = prod_lo | prod_hi
# asm 1: orr >g=int64#10, <prod_lo=int64#11, <prod_hi=int64#10
# asm 2: orr >g=x9, <prod_lo=x10, <prod_hi=x9
orr x9, x10, x9

# qhasm: f = new_f
# asm 1: mov >f=int64#11,<new_f=int64#17
# asm 2: mov >f=x10,<new_f=x16
mov x10,x16

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#17, <f=int64#11, #1048575
# asm 2: and >fuv=x16, <f=x10, #1048575
and x16, x10, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#18, <g=int64#10, #1048575
# asm 2: and >grs=x17, <g=x9, #1048575
and x17, x9, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#17,<fuv=int64#17,<2p41=int64#8
# asm 2: sub <fuv=x16,<fuv=x16,<2p41=x7
sub x16,x16,x7

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#18,<grs=int64#18,<2p62=int64#9
# asm 2: sub <grs=x17,<grs=x17,<2p62=x8
sub x17,x17,x8

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#19, <grs=int64#18, #1
# asm 2: and >g1=x18, <grs=x17, #1
and x18, x17, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#20,<grs=int64#18,<fuv=int64#17
# asm 2: sub >hh=x19,<grs=x17,<fuv=x16
sub x19,x17,x16

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#19, <g1=int64#19, <fuv=int64#17, <grs=int64#18
# asm 2: madd >h=x18, <g1=x18, <fuv=x16, <grs=x17
madd x18, x18, x16, x17

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#21,<m=int64#14,#1
# asm 2: sub >m1=x20,<m=x13,#1
sub x20,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#21, <grs=int64#18, ROR #1
# asm 2: tst <m1=x20, <grs=x17, ROR #1
tst x20, x17, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#21, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x20, <m=x13, pl
csneg x13, x20, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#17, <fuv=int64#17, <grs=int64#18, pl
# asm 2: csel >fuv=x16, <fuv=x16, <grs=x17, pl
csel x16, x16, x17, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#18, <h=int64#19, <hh=int64#20, pl
# asm 2: csel >grs=x17, <h=x18, <hh=x19, pl
csel x17, x18, x19, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#18, <grs=int64#18, #1
# asm 2: asr >grs=x17, <grs=x17, #1
asr x17, x17, #1

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#19,<fuv=int64#17
# asm 2: mov >v=x18,<fuv=x16
mov x18,x16

# qhasm: v = v + 1048576
# asm 1: add >v=int64#19,<v=int64#19,#1048576
# asm 2: add >v=x18,<v=x18,#1048576
add x18,x18,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#19,<v=int64#19,<2p41=int64#8
# asm 2: add >v=x18,<v=x18,<2p41=x7
add x18,x18,x7

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#19, <v=int64#19, #42
# asm 2: asr >v=x18, <v=x18, #42
asr x18, x18, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#17,<fuv=int64#17,#1048576
# asm 2: add >u=x16,<fuv=x16,#1048576
add x16,x16,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#17, <u=int64#17, #22
# asm 2: lsl >u=x16, <u=x16, #22
lsl x16, x16, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#17, <u=int64#17, #43
# asm 2: asr >u=x16, <u=x16, #43
asr x16, x16, #43

# qhasm: s = grs
# asm 1: mov >s=int64#20,<grs=int64#18
# asm 2: mov >s=x19,<grs=x17
mov x19,x17

# qhasm: s = s + 1048576
# asm 1: add >s=int64#20,<s=int64#20,#1048576
# asm 2: add >s=x19,<s=x19,#1048576
add x19,x19,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#20,<s=int64#20,<2p41=int64#8
# asm 2: add >s=x19,<s=x19,<2p41=x7
add x19,x19,x7

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#20, <s=int64#20, #42
# asm 2: asr >s=x19, <s=x19, #42
asr x19, x19, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#18,<grs=int64#18,#1048576
# asm 2: add >r=x17,<grs=x17,#1048576
add x17,x17,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#18, <r=int64#18, #22
# asm 2: lsl >r=x17, <r=x17, #22
lsl x17, x17, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#18, <r=int64#18, #43
# asm 2: asr >r=x17, <r=x17, #43
asr x17, x17, #43

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#21,<u=int64#17,<f=int64#11
# asm 2: mul >prod_lo=x20,<u=x16,<f=x10
mul x20,x16,x10

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#22, <u=int64#17, <f=int64#11
# asm 2: smulh >prod_hi=x21, <u=x16, <f=x10
smulh x21, x16, x10

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#23,<v=int64#19,<g=int64#10
# asm 2: mul >tmp=x22,<v=x18,<g=x9
mul x22,x18,x9

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#21, <prod_lo=int64#21, <tmp=int64#23
# asm 2: adds <prod_lo=x20, <prod_lo=x20, <tmp=x22
adds x20, x20, x22

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#23, <v=int64#19, <g=int64#10
# asm 2: smulh >tmp=x22, <v=x18, <g=x9
smulh x22, x18, x9

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#22,<prod_hi=int64#22,<tmp=int64#23
# asm 2: adc >prod_hi=x21,<prod_hi=x21,<tmp=x22
adc x21,x21,x22

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#21, <prod_lo=int64#21, #20
# asm 2: lsr >prod_lo=x20, <prod_lo=x20, #20
lsr x20, x20, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#22, <prod_hi=int64#22, #44
# asm 2: lsl >prod_hi=x21, <prod_hi=x21, #44
lsl x21, x21, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#21, <prod_lo=int64#21, <prod_hi=int64#22
# asm 2: orr >new_f=x20, <prod_lo=x20, <prod_hi=x21
orr x20, x20, x21

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#22,<r=int64#18,<f=int64#11
# asm 2: mul >prod_lo=x21,<r=x17,<f=x10
mul x21,x17,x10

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#11, <r=int64#18, <f=int64#11
# asm 2: smulh >prod_hi=x10, <r=x17, <f=x10
smulh x10, x17, x10

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#23,<s=int64#20,<g=int64#10
# asm 2: mul >tmp=x22,<s=x19,<g=x9
mul x22,x19,x9

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#22, <prod_lo=int64#22, <tmp=int64#23
# asm 2: adds <prod_lo=x21, <prod_lo=x21, <tmp=x22
adds x21, x21, x22

# qhasm: tmp = s signed* g (hi)
# asm 1: smulh >tmp=int64#10, <s=int64#20, <g=int64#10
# asm 2: smulh >tmp=x9, <s=x19, <g=x9
smulh x9, x19, x9

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#10,<prod_hi=int64#11,<tmp=int64#10
# asm 2: adc >prod_hi=x9,<prod_hi=x10,<tmp=x9
adc x9,x10,x9

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#11, <prod_lo=int64#22, #20
# asm 2: lsr >prod_lo=x10, <prod_lo=x21, #20
lsr x10, x21, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#10, <prod_hi=int64#10, #44
# asm 2: lsl >prod_hi=x9, <prod_hi=x9, #44
lsl x9, x9, #44

# qhasm: new_g = prod_lo | prod_hi
# asm 1: orr >new_g=int64#10, <prod_lo=int64#11, <prod_hi=int64#10
# asm 2: orr >new_g=x9, <prod_lo=x10, <prod_hi=x9
orr x9, x10, x9

# qhasm: f = new_f
# asm 1: mov >f=int64#11,<new_f=int64#21
# asm 2: mov >f=x10,<new_f=x20
mov x10,x20

# qhasm: g = new_g
# asm 1: mov >g=int64#10,<new_g=int64#10
# asm 2: mov >g=x9,<new_g=x9
mov x9,x9

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#21,<u=int64#17,<uu=int64#12
# asm 2: mul >tmp=x20,<u=x16,<uu=x11
mul x20,x16,x11

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#21, <v=int64#19, <rr=int64#13, <tmp=int64#21
# asm 2: madd >new_uu=x20, <v=x18, <rr=x12, <tmp=x20
madd x20, x18, x12, x20

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#12,<r=int64#18,<uu=int64#12
# asm 2: mul >tmp=x11,<r=x17,<uu=x11
mul x11,x17,x11

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#12, <s=int64#20, <rr=int64#13, <tmp=int64#12
# asm 2: madd >new_rr=x11, <s=x19, <rr=x12, <tmp=x11
madd x11, x19, x12, x11

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#13,<u=int64#17,<vv=int64#15
# asm 2: mul >tmp=x12,<u=x16,<vv=x14
mul x12,x16,x14

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#13, <v=int64#19, <ss=int64#16, <tmp=int64#13
# asm 2: madd >new_vv=x12, <v=x18, <ss=x15, <tmp=x12
madd x12, x18, x15, x12

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#15,<r=int64#18,<vv=int64#15
# asm 2: mul >tmp=x14,<r=x17,<vv=x14
mul x14,x17,x14

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#15, <s=int64#20, <ss=int64#16, <tmp=int64#15
# asm 2: madd >new_ss=x14, <s=x19, <ss=x15, <tmp=x14
madd x14, x19, x15, x14

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#16,<new_uu=int64#21
# asm 2: mov >uu=x15,<new_uu=x20
mov x15,x20

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#13,<new_vv=int64#13
# asm 2: mov >vv=x12,<new_vv=x12
mov x12,x12

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#12,<new_rr=int64#12
# asm 2: mov >rr=x11,<new_rr=x11
mov x11,x11

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#15,<new_ss=int64#15
# asm 2: mov >ss=x14,<new_ss=x14
mov x14,x14

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#11, <f=int64#11, #1048575
# asm 2: and >fuv=x10, <f=x10, #1048575
and x10, x10, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#10, <g=int64#10, #1048575
# asm 2: and >grs=x9, <g=x9, #1048575
and x9, x9, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#11,<fuv=int64#11,<2p41=int64#8
# asm 2: sub <fuv=x10,<fuv=x10,<2p41=x7
sub x10,x10,x7

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#10,<grs=int64#10,<2p62=int64#9
# asm 2: sub <grs=x9,<grs=x9,<2p62=x8
sub x9,x9,x8

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#10, #1
# asm 2: and >g1=x16, <grs=x9, #1
and x16, x9, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#10,<fuv=int64#11
# asm 2: sub >hh=x17,<grs=x9,<fuv=x10
sub x17,x9,x10

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#11, <grs=int64#10
# asm 2: madd >h=x16, <g1=x16, <fuv=x10, <grs=x9
madd x16, x16, x10, x9

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#10, ROR #1
# asm 2: tst <m1=x18, <grs=x9, ROR #1
tst x18, x9, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#11, <grs=int64#10, pl
# asm 2: csel >fuv=x9, <fuv=x10, <grs=x9, pl
csel x9, x10, x9, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#17, <grs=int64#11, #1
# asm 2: and >g1=x16, <grs=x10, #1
and x16, x10, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#18,<grs=int64#11,<fuv=int64#10
# asm 2: sub >hh=x17,<grs=x10,<fuv=x9
sub x17,x10,x9

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#17, <g1=int64#17, <fuv=int64#10, <grs=int64#11
# asm 2: madd >h=x16, <g1=x16, <fuv=x9, <grs=x10
madd x16, x16, x9, x10

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#19,<m=int64#14,#1
# asm 2: sub >m1=x18,<m=x13,#1
sub x18,x13,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#19, <grs=int64#11, ROR #1
# asm 2: tst <m1=x18, <grs=x10, ROR #1
tst x18, x10, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#14, <m1=int64#19, <m=int64#14, pl
# asm 2: csneg >m=x13, <m1=x18, <m=x13, pl
csneg x13, x18, x13, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#10, <fuv=int64#10, <grs=int64#11, pl
# asm 2: csel >fuv=x9, <fuv=x9, <grs=x10, pl
csel x9, x9, x10, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#11, <h=int64#17, <hh=int64#18, pl
# asm 2: csel >grs=x10, <h=x16, <hh=x17, pl
csel x10, x16, x17, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#11, <grs=int64#11, #1
# asm 2: asr >grs=x10, <grs=x10, #1
asr x10, x10, #1

# qhasm: v = fuv
# asm 1: mov >v=int64#17,<fuv=int64#10
# asm 2: mov >v=x16,<fuv=x9
mov x16,x9

# qhasm: v = v + 1048576
# asm 1: add >v=int64#17,<v=int64#17,#1048576
# asm 2: add >v=x16,<v=x16,#1048576
add x16,x16,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#17,<v=int64#17,<2p41=int64#8
# asm 2: add >v=x16,<v=x16,<2p41=x7
add x16,x16,x7

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#17, <v=int64#17, #42
# asm 2: asr >v=x16, <v=x16, #42
asr x16, x16, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#10,<fuv=int64#10,#1048576
# asm 2: add >u=x9,<fuv=x9,#1048576
add x9,x9,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#10, <u=int64#10, #22
# asm 2: lsl >u=x9, <u=x9, #22
lsl x9, x9, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#10, <u=int64#10, #43
# asm 2: asr >u=x9, <u=x9, #43
asr x9, x9, #43

# qhasm: s = grs
# asm 1: mov >s=int64#18,<grs=int64#11
# asm 2: mov >s=x17,<grs=x10
mov x17,x10

# qhasm: s = s + 1048576
# asm 1: add >s=int64#18,<s=int64#18,#1048576
# asm 2: add >s=x17,<s=x17,#1048576
add x17,x17,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#18,<s=int64#18,<2p41=int64#8
# asm 2: add >s=x17,<s=x17,<2p41=x7
add x17,x17,x7

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#18, <s=int64#18, #42
# asm 2: asr >s=x17, <s=x17, #42
asr x17, x17, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#11,<grs=int64#11,#1048576
# asm 2: add >r=x10,<grs=x10,#1048576
add x10,x10,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#11, <r=int64#11, #22
# asm 2: lsl >r=x10, <r=x10, #22
lsl x10, x10, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#11, <r=int64#11, #43
# asm 2: asr >r=x10, <r=x10, #43
asr x10, x10, #43

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#19,<u=int64#10,<uu=int64#16
# asm 2: mul >tmp=x18,<u=x9,<uu=x15
mul x18,x9,x15

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#19, <v=int64#17, <rr=int64#12, <tmp=int64#19
# asm 2: madd >new_uu=x18, <v=x16, <rr=x11, <tmp=x18
madd x18, x16, x11, x18

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#16,<r=int64#11,<uu=int64#16
# asm 2: mul >tmp=x15,<r=x10,<uu=x15
mul x15,x10,x15

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#12, <s=int64#18, <rr=int64#12, <tmp=int64#16
# asm 2: madd >new_rr=x11, <s=x17, <rr=x11, <tmp=x15
madd x11, x17, x11, x15

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#10,<u=int64#10,<vv=int64#13
# asm 2: mul >tmp=x9,<u=x9,<vv=x12
mul x9,x9,x12

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#16, <v=int64#17, <ss=int64#15, <tmp=int64#10
# asm 2: madd >new_vv=x15, <v=x16, <ss=x14, <tmp=x9
madd x15, x16, x14, x9

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#10,<r=int64#11,<vv=int64#13
# asm 2: mul >tmp=x9,<r=x10,<vv=x12
mul x9,x10,x12

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#13, <s=int64#18, <ss=int64#15, <tmp=int64#10
# asm 2: madd >new_ss=x12, <s=x17, <ss=x14, <tmp=x9
madd x12, x17, x14, x9

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#10,<new_uu=int64#19
# asm 2: mov >uu=x9,<new_uu=x18
mov x9,x18

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#11,<new_vv=int64#16
# asm 2: mov >vv=x10,<new_vv=x15
mov x10,x15

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#12,<new_rr=int64#12
# asm 2: mov >rr=x11,<new_rr=x11
mov x11,x11

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#13,<new_ss=int64#13
# asm 2: mov >ss=x12,<new_ss=x12
mov x12,x12

# qhasm: ITERATION -= 1 !
# asm 1: subs <ITERATION=int64#7,<ITERATION=int64#7,#1
# asm 2: subs <ITERATION=x6,<ITERATION=x6,#1
subs x6,x6,#1

# qhasm: goto main_i_loop if unsigned>
b.hi ._main_i_loop

# qhasm: mem64[pointer_delta] = m
# asm 1: str <m=int64#14, [<pointer_delta=int64#1]
# asm 2: str <m=x13, [<pointer_delta=x0]
str x13, [x0]

# qhasm: mem128[pointer_uuvvrrss] = uu, vv
# asm 1: stp <uu=int64#10, <vv=int64#11, [<pointer_uuvvrrss=int64#6]
# asm 2: stp <uu=x9, <vv=x10, [<pointer_uuvvrrss=x5]
stp x9, x10, [x5]

# qhasm: mem128[pointer_uuvvrrss + 16] = rr, ss
# asm 1: stp <rr=int64#12, <ss=int64#13, [<pointer_uuvvrrss=int64#6, #16]
# asm 2: stp <rr=x11, <ss=x12, [<pointer_uuvvrrss=x5, #16]
stp x11, x12, [x5, #16]

# qhasm: reg128 vec_F0_F1_F2_F3

# qhasm: reg128 vec_G0_G1_G2_G3

# qhasm: 2x vec_F0_F1_F2_F3 zip= vec_F0_F1_G0_G1[0/2] vec_F2_F3_G2_G3[0/2]
# asm 1: zip1 >vec_F0_F1_F2_F3=reg128#1.2d, <vec_F0_F1_G0_G1=reg128#5.2d, <vec_F2_F3_G2_G3=reg128#6.2d
# asm 2: zip1 >vec_F0_F1_F2_F3=v0.2d, <vec_F0_F1_G0_G1=v4.2d, <vec_F2_F3_G2_G3=v5.2d
zip1 v0.2d, v4.2d, v5.2d

# qhasm: 2x vec_G0_G1_G2_G3 zip= vec_F0_F1_G0_G1[1/2] vec_F2_F3_G2_G3[1/2]
# asm 1: zip2 >vec_G0_G1_G2_G3=reg128#2.2d, <vec_F0_F1_G0_G1=reg128#5.2d, <vec_F2_F3_G2_G3=reg128#6.2d
# asm 2: zip2 >vec_G0_G1_G2_G3=v1.2d, <vec_F0_F1_G0_G1=v4.2d, <vec_F2_F3_G2_G3=v5.2d
zip2 v1.2d, v4.2d, v5.2d

# qhasm: reg128 vec_F4_F5_F6_F7

# qhasm: reg128 vec_G4_G5_G6_G7

# qhasm: 2x vec_F4_F5_F6_F7 zip= vec_F4_F5_G4_G5[0/2] vec_F6_F7_G6_G7[0/2]
# asm 1: zip1 >vec_F4_F5_F6_F7=reg128#3.2d, <vec_F4_F5_G4_G5=reg128#7.2d, <vec_F6_F7_G6_G7=reg128#8.2d
# asm 2: zip1 >vec_F4_F5_F6_F7=v2.2d, <vec_F4_F5_G4_G5=v6.2d, <vec_F6_F7_G6_G7=v7.2d
zip1 v2.2d, v6.2d, v7.2d

# qhasm: 2x vec_G4_G5_G6_G7 zip= vec_F4_F5_G4_G5[1/2] vec_F6_F7_G6_G7[1/2]
# asm 1: zip2 >vec_G4_G5_G6_G7=reg128#4.2d, <vec_F4_F5_G4_G5=reg128#7.2d, <vec_F6_F7_G6_G7=reg128#8.2d
# asm 2: zip2 >vec_G4_G5_G6_G7=v3.2d, <vec_F4_F5_G4_G5=v6.2d, <vec_F6_F7_G6_G7=v7.2d
zip2 v3.2d, v6.2d, v7.2d

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
# asm 1: umov >F8=int64#1, <vec_F8_F9_G8_G9=reg128#9.d[0]
# asm 2: umov >F8=x0, <vec_F8_F9_G8_G9=v8.d[0]
umov x0, v8.d[0]

# qhasm: mem32[pointer_F+32] = F8
# asm 1: str <F8=int64#1%wregname, [<pointer_F=int64#2, #32]
# asm 2: str <F8=w0, [<pointer_F=x1, #32]
str w0, [x1, #32]

# qhasm: int64 G8

# qhasm: G8 = vec_F8_F9_G8_G9[1/2]
# asm 1: umov >G8=int64#1, <vec_F8_F9_G8_G9=reg128#9.d[1]
# asm 2: umov >G8=x0, <vec_F8_F9_G8_G9=v8.d[1]
umov x0, v8.d[1]

# qhasm: mem32[pointer_G+32] = G8
# asm 1: str <G8=int64#1%wregname, [<pointer_G=int64#3, #32]
# asm 2: str <G8=w0, [<pointer_G=x2, #32]
str w0, [x2, #32]

# qhasm: reg128 vec_V0_V1_V2_V3

# qhasm: reg128 vec_V4_V5_V6_V7

# qhasm: reg128 vec_S0_S1_S2_S3

# qhasm: reg128 vec_S4_S5_S6_S7

# qhasm: 2x vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2]
# asm 1: zip1 >vec_V0_V1_V2_V3=reg128#1.2d, <vec_V0_V1_S0_S1=reg128#10.2d, <vec_V2_V3_S2_S3=reg128#11.2d
# asm 2: zip1 >vec_V0_V1_V2_V3=v0.2d, <vec_V0_V1_S0_S1=v9.2d, <vec_V2_V3_S2_S3=v10.2d
zip1 v0.2d, v9.2d, v10.2d

# qhasm: 2x vec_S0_S1_S2_S3 zip= vec_V0_V1_S0_S1[1/2] vec_V2_V3_S2_S3[1/2]
# asm 1: zip2 >vec_S0_S1_S2_S3=reg128#2.2d, <vec_V0_V1_S0_S1=reg128#10.2d, <vec_V2_V3_S2_S3=reg128#11.2d
# asm 2: zip2 >vec_S0_S1_S2_S3=v1.2d, <vec_V0_V1_S0_S1=v9.2d, <vec_V2_V3_S2_S3=v10.2d
zip2 v1.2d, v9.2d, v10.2d

# qhasm: 2x vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]
# asm 1: zip1 >vec_V4_V5_V6_V7=reg128#3.2d, <vec_V4_V5_S4_S5=reg128#12.2d, <vec_V6_V7_S6_S7=reg128#13.2d
# asm 2: zip1 >vec_V4_V5_V6_V7=v2.2d, <vec_V4_V5_S4_S5=v11.2d, <vec_V6_V7_S6_S7=v12.2d
zip1 v2.2d, v11.2d, v12.2d

# qhasm: 2x vec_S4_S5_S6_S7 zip= vec_V4_V5_S4_S5[1/2] vec_V6_V7_S6_S7[1/2]
# asm 1: zip2 >vec_S4_S5_S6_S7=reg128#4.2d, <vec_V4_V5_S4_S5=reg128#12.2d, <vec_V6_V7_S6_S7=reg128#13.2d
# asm 2: zip2 >vec_S4_S5_S6_S7=v3.2d, <vec_V4_V5_S4_S5=v11.2d, <vec_V6_V7_S6_S7=v12.2d
zip2 v3.2d, v11.2d, v12.2d

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
# asm 1: umov >V8=int64#1, <vec_V8_V9_S8_S9=reg128#14.d[0]
# asm 2: umov >V8=x0, <vec_V8_V9_S8_S9=v13.d[0]
umov x0, v13.d[0]

# qhasm: mem32[pointer_V+32] = V8
# asm 1: str <V8=int64#1%wregname, [<pointer_V=int64#4, #32]
# asm 2: str <V8=w0, [<pointer_V=x3, #32]
str w0, [x3, #32]

# qhasm: int64 S8

# qhasm: S8 = vec_V8_V9_S8_S9[1/2]
# asm 1: umov >S8=int64#1, <vec_V8_V9_S8_S9=reg128#14.d[1]
# asm 2: umov >S8=x0, <vec_V8_V9_S8_S9=v13.d[1]
umov x0, v13.d[1]

# qhasm: mem32[pointer_S+32] = S8
# asm 1: str <S8=int64#1%wregname, [<pointer_S=int64#5, #32]
# asm 2: str <S8=w0, [<pointer_S=x4, #32]
str w0, [x4, #32]

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
