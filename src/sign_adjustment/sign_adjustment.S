
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

# qhasm: int64 pointer_inv30

# qhasm: int64 pointer_F

# qhasm: int64 pointer_V

# qhasm: input pointer_inv30

# qhasm: input pointer_F

# qhasm: input pointer_V

# qhasm: int64 F0_F1

# qhasm: reg128 vec_F0_F1_G0_G1

# qhasm: int64 V0_V1

# qhasm: int64 V2_V3

# qhasm: int64 V4_V5

# qhasm: int64 V6_V7

# qhasm: int64 V8_0 

# qhasm: reg128 vec_V0_V1_S0_S1

# qhasm: reg128 vec_V2_V3_S2_S3

# qhasm: reg128 vec_V4_V5_S4_S5

# qhasm: reg128 vec_V6_V7_S6_S7

# qhasm: reg128 vec_V8_0_S8_0

# qhasm: int64 2p30m1

# qhasm: reg128 vec_F0_F0_F0_F0

# qhasm: reg128 vec_2p30m1

# qhasm: reg128 vec_mask

# qhasm: int64 mask

# qhasm: reg128 vec_not_mask

# qhasm: int64 not_mask

# qhasm: reg128 vec_diff

# qhasm: reg128 vec_neg_diff

# qhasm: reg128 vec_inv0_inv1_inv2_inv3

# qhasm: reg128 vec_inv4_inv5_inv6_inv7

# qhasm: int64 inv8

# qhasm: reg128 vec_V0_V1_V2_V3

# qhasm: reg128 vec_V4_V5_V6_V7

# qhasm: int64 V8

# qhasm: reg128 vec_tmp1

# qhasm: reg128 vec_tmp2

# qhasm: int64 tmpa

# qhasm: int64 tmpb

# qhasm: int64 borrow

# qhasm: int64 inv0

# qhasm: int64 inv1

# qhasm: int64 inv2

# qhasm: int64 inv3

# qhasm: int64 inv4

# qhasm: int64 inv5

# qhasm: int64 inv6

# qhasm: int64 inv7

# qhasm: int64 eighteen

# qhasm: enter sign_adjustment
.align 4
.global _sign_adjustment
.global sign_adjustment
_sign_adjustment:
sign_adjustment:

# qhasm: F0_F1 = mem64[pointer_F]
# asm 1: ldr >F0_F1=int64#2, [<pointer_F=int64#2]
# asm 2: ldr >F0_F1=x1, [<pointer_F=x1]
ldr x1, [x1]

# qhasm: vec_F0_F1_G0_G1[0/2] = F0_F1
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.d[0], <F0_F1=int64#2
# asm 2: ins <vec_F0_F1_G0_G1=v0.d[0], <F0_F1=x1
ins v0.d[0], x1

# qhasm: V0_V1 = mem64[pointer_V]
# asm 1: ldr >V0_V1=int64#2, [<pointer_V=int64#3]
# asm 2: ldr >V0_V1=x1, [<pointer_V=x2]
ldr x1, [x2]

# qhasm: V2_V3 = mem64[pointer_V + 8]
# asm 1: ldr >V2_V3=int64#4, [<pointer_V=int64#3, #8]
# asm 2: ldr >V2_V3=x3, [<pointer_V=x2, #8]
ldr x3, [x2, #8]

# qhasm: V4_V5 = mem64[pointer_V + 16]
# asm 1: ldr >V4_V5=int64#5, [<pointer_V=int64#3, #16]
# asm 2: ldr >V4_V5=x4, [<pointer_V=x2, #16]
ldr x4, [x2, #16]

# qhasm: V6_V7 = mem64[pointer_V + 32]
# asm 1: ldr >V6_V7=int64#6, [<pointer_V=int64#3, #32]
# asm 2: ldr >V6_V7=x5, [<pointer_V=x2, #32]
ldr x5, [x2, #32]

# qhasm: V8_0 = mem32[pointer_V + 40]
# asm 1: ldr >V8_0=int64#3%wregname, [<pointer_V=int64#3, #40]
# asm 2: ldr >V8_0=w2, [<pointer_V=x2, #40]
ldr w2, [x2, #40]

# qhasm: vec_V0_V1_S0_S1[0/2] = V0_V1
# asm 1: ins <vec_V0_V1_S0_S1=reg128#2.d[0], <V0_V1=int64#2
# asm 2: ins <vec_V0_V1_S0_S1=v1.d[0], <V0_V1=x1
ins v1.d[0], x1

# qhasm: vec_V2_V3_S2_S3[0/2] = V2_V3
# asm 1: ins <vec_V2_V3_S2_S3=reg128#3.d[0], <V2_V3=int64#4
# asm 2: ins <vec_V2_V3_S2_S3=v2.d[0], <V2_V3=x3
ins v2.d[0], x3

# qhasm: vec_V4_V5_S4_S5[0/2] = V4_V5
# asm 1: ins <vec_V4_V5_S4_S5=reg128#4.d[0], <V4_V5=int64#5
# asm 2: ins <vec_V4_V5_S4_S5=v3.d[0], <V4_V5=x4
ins v3.d[0], x4

# qhasm: vec_V6_V7_S6_S7[0/2] = V6_V7
# asm 1: ins <vec_V6_V7_S6_S7=reg128#5.d[0], <V6_V7=int64#6
# asm 2: ins <vec_V6_V7_S6_S7=v4.d[0], <V6_V7=x5
ins v4.d[0], x5

# qhasm: vec_V8_0_S8_0[0/2] = V8_0
# asm 1: ins <vec_V8_0_S8_0=reg128#6.d[0], <V8_0=int64#3
# asm 2: ins <vec_V8_0_S8_0=v5.d[0], <V8_0=x2
ins v5.d[0], x2

# qhasm: 4x vec_F0_F0_F0_F0 = vec_F0_F1_G0_G1[0/4]
# asm 1: dup <vec_F0_F0_F0_F0=reg128#7.4s, <vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: dup <vec_F0_F0_F0_F0=v6.4s, <vec_F0_F1_G0_G1=v0.s[0]
dup v6.4s, v0.s[0]

# qhasm: 2p30m1 = 1073741823
# asm 1: mov >2p30m1=int64#2, #1073741823
# asm 2: mov >2p30m1=x1, #1073741823
mov x1, #1073741823

# qhasm: 4x vec_2p30m1 = 2p30m1
# asm 1: dup <vec_2p30m1=reg128#1.4s, <2p30m1=int64#2%bot
# asm 2: dup <vec_2p30m1=v0.4s, <2p30m1=x1%bot
dup v0.4s, w1

# qhasm: vec_diff = vec_F0_F0_F0_F0 ^ vec_2p30m1
# asm 1: eor >vec_diff=reg128#7.16b, <vec_F0_F0_F0_F0=reg128#7.16b, <vec_2p30m1=reg128#1.16b
# asm 2: eor >vec_diff=v6.16b, <vec_F0_F0_F0_F0=v6.16b, <vec_2p30m1=v0.16b
eor v6.16b, v6.16b, v0.16b

# qhasm: 4x vec_neg_diff = -vec_diff
# asm 1: neg >vec_neg_diff=reg128#8.4s, <vec_diff=reg128#7.4s
# asm 2: neg >vec_neg_diff=v7.4s, <vec_diff=v6.4s
neg v7.4s, v6.4s

# qhasm: vec_not_mask = vec_diff | vec_neg_diff
# asm 1: orr >vec_not_mask=reg128#7.16b, <vec_diff=reg128#7.16b, <vec_neg_diff=reg128#8.16b
# asm 2: orr >vec_not_mask=v6.16b, <vec_diff=v6.16b, <vec_neg_diff=v7.16b
orr v6.16b, v6.16b, v7.16b

# qhasm: 4x vec_not_mask = vec_not_mask >> 31
# asm 1: sshr >vec_not_mask=reg128#7.4s, <vec_not_mask=reg128#7.4s, #31
# asm 2: sshr >vec_not_mask=v6.4s, <vec_not_mask=v6.4s, #31
sshr v6.4s, v6.4s, #31

# qhasm: vec_mask = ~vec_not_mask
# asm 1: not >vec_mask=reg128#8.16b, <vec_not_mask=reg128#7.16b
# asm 2: not >vec_mask=v7.16b, <vec_not_mask=v6.16b
not v7.16b, v6.16b

# qhasm: mask = vec_mask[0/4]
# asm 1: smov >mask=int64#2, <vec_mask=reg128#8.s[0]
# asm 2: smov >mask=x1, <vec_mask=v7.s[0]
smov x1, v7.s[0]

# qhasm: not_mask = ~mask
# asm 1: mvn >not_mask=int64#3, <mask=int64#2
# asm 2: mvn >not_mask=x2, <mask=x1
mvn x2, x1

# qhasm: vec_inv0_inv1_inv2_inv3 = vec_mask & vec_2p30m1
# asm 1: and >vec_inv0_inv1_inv2_inv3=reg128#1.16b, <vec_mask=reg128#8.16b, <vec_2p30m1=reg128#1.16b
# asm 2: and >vec_inv0_inv1_inv2_inv3=v0.16b, <vec_mask=v7.16b, <vec_2p30m1=v0.16b
and v0.16b, v7.16b, v0.16b

# qhasm: vec_inv4_inv5_inv6_inv7 = vec_inv0_inv1_inv2_inv3 
# asm 1: mov >vec_inv4_inv5_inv6_inv7=reg128#9.16b, <vec_inv0_inv1_inv2_inv3=reg128#1.16b
# asm 2: mov >vec_inv4_inv5_inv6_inv7=v8.16b, <vec_inv0_inv1_inv2_inv3=v0.16b
mov v8.16b, v0.16b

# qhasm: inv8 = 32767
# asm 1: mov >inv8=int64#4, #32767
# asm 2: mov >inv8=x3, #32767
mov x3, #32767

# qhasm: inv8 = inv8 & mask
# asm 1: and  >inv8=int64#4, <inv8=int64#4, <mask=int64#2
# asm 2: and  >inv8=x3, <inv8=x3, <mask=x1
and  x3, x3, x1

# qhasm: 2x vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2] 
# asm 1: zip1 >vec_V0_V1_V2_V3=reg128#2.2d, <vec_V0_V1_S0_S1=reg128#2.2d, <vec_V2_V3_S2_S3=reg128#3.2d
# asm 2: zip1 >vec_V0_V1_V2_V3=v1.2d, <vec_V0_V1_S0_S1=v1.2d, <vec_V2_V3_S2_S3=v2.2d
zip1 v1.2d, v1.2d, v2.2d

# qhasm: 2x vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]
# asm 1: zip1 >vec_V4_V5_V6_V7=reg128#3.2d, <vec_V4_V5_S4_S5=reg128#4.2d, <vec_V6_V7_S6_S7=reg128#5.2d
# asm 2: zip1 >vec_V4_V5_V6_V7=v2.2d, <vec_V4_V5_S4_S5=v3.2d, <vec_V6_V7_S6_S7=v4.2d
zip1 v2.2d, v3.2d, v4.2d

# qhasm: vec_tmp1 = vec_V0_V1_V2_V3 & vec_mask
# asm 1: and >vec_tmp1=reg128#4.16b, <vec_V0_V1_V2_V3=reg128#2.16b, <vec_mask=reg128#8.16b
# asm 2: and >vec_tmp1=v3.16b, <vec_V0_V1_V2_V3=v1.16b, <vec_mask=v7.16b
and v3.16b, v1.16b, v7.16b

# qhasm: 4x vec_inv0_inv1_inv2_inv3 -= vec_tmp1
# asm 1: sub <vec_inv0_inv1_inv2_inv3=reg128#1.4s,<vec_inv0_inv1_inv2_inv3=reg128#1.4s,<vec_tmp1=reg128#4.4s
# asm 2: sub <vec_inv0_inv1_inv2_inv3=v0.4s,<vec_inv0_inv1_inv2_inv3=v0.4s,<vec_tmp1=v3.4s
sub v0.4s,v0.4s,v3.4s

# qhasm: vec_tmp2 = vec_V4_V5_V6_V7 & vec_mask
# asm 1: and >vec_tmp2=reg128#4.16b, <vec_V4_V5_V6_V7=reg128#3.16b, <vec_mask=reg128#8.16b
# asm 2: and >vec_tmp2=v3.16b, <vec_V4_V5_V6_V7=v2.16b, <vec_mask=v7.16b
and v3.16b, v2.16b, v7.16b

# qhasm: 4x vec_inv4_inv5_inv6_inv7 -= vec_tmp2
# asm 1: sub <vec_inv4_inv5_inv6_inv7=reg128#9.4s,<vec_inv4_inv5_inv6_inv7=reg128#9.4s,<vec_tmp2=reg128#4.4s
# asm 2: sub <vec_inv4_inv5_inv6_inv7=v8.4s,<vec_inv4_inv5_inv6_inv7=v8.4s,<vec_tmp2=v3.4s
sub v8.4s,v8.4s,v3.4s

# qhasm: vec_tmp1 = vec_V0_V1_V2_V3 & vec_not_mask
# asm 1: and >vec_tmp1=reg128#2.16b, <vec_V0_V1_V2_V3=reg128#2.16b, <vec_not_mask=reg128#7.16b
# asm 2: and >vec_tmp1=v1.16b, <vec_V0_V1_V2_V3=v1.16b, <vec_not_mask=v6.16b
and v1.16b, v1.16b, v6.16b

# qhasm: 4x vec_inv0_inv1_inv2_inv3 += vec_tmp1
# asm 1: add <vec_inv0_inv1_inv2_inv3=reg128#1.4s, <vec_inv0_inv1_inv2_inv3=reg128#1.4s, <vec_tmp1=reg128#2.4s
# asm 2: add <vec_inv0_inv1_inv2_inv3=v0.4s, <vec_inv0_inv1_inv2_inv3=v0.4s, <vec_tmp1=v1.4s
add v0.4s, v0.4s, v1.4s

# qhasm: vec_tmp2 = vec_V4_V5_V6_V7 & vec_not_mask
# asm 1: and >vec_tmp2=reg128#2.16b, <vec_V4_V5_V6_V7=reg128#3.16b, <vec_not_mask=reg128#7.16b
# asm 2: and >vec_tmp2=v1.16b, <vec_V4_V5_V6_V7=v2.16b, <vec_not_mask=v6.16b
and v1.16b, v2.16b, v6.16b

# qhasm: 4x vec_inv4_inv5_inv6_inv7 += vec_tmp2
# asm 1: add <vec_inv4_inv5_inv6_inv7=reg128#9.4s, <vec_inv4_inv5_inv6_inv7=reg128#9.4s, <vec_tmp2=reg128#2.4s
# asm 2: add <vec_inv4_inv5_inv6_inv7=v8.4s, <vec_inv4_inv5_inv6_inv7=v8.4s, <vec_tmp2=v1.4s
add v8.4s, v8.4s, v1.4s

# qhasm: V8 = vec_V8_0_S8_0[0/4]
# asm 1: smov >V8=int64#5, <vec_V8_0_S8_0=reg128#6.s[0]
# asm 2: smov >V8=x4, <vec_V8_0_S8_0=v5.s[0]
smov x4, v5.s[0]

# qhasm: tmpa = mask & V8
# asm 1: and  >tmpa=int64#6, <mask=int64#2, <V8=int64#5
# asm 2: and  >tmpa=x5, <mask=x1, <V8=x4
and  x5, x1, x4

# qhasm: inv8 -= tmpa
# asm 1: sub <inv8=int64#4,<inv8=int64#4,<tmpa=int64#6
# asm 2: sub <inv8=x3,<inv8=x3,<tmpa=x5
sub x3,x3,x5

# qhasm: tmpb = not_mask & V8
# asm 1: and  >tmpb=int64#3, <not_mask=int64#3, <V8=int64#5
# asm 2: and  >tmpb=x2, <not_mask=x2, <V8=x4
and  x2, x2, x4

# qhasm: inv8 += tmpb
# asm 1: add <inv8=int64#4,<inv8=int64#4,<tmpb=int64#3
# asm 2: add <inv8=x3,<inv8=x3,<tmpb=x2
add x3,x3,x2

# qhasm: borrow = 0
# asm 1: mov >borrow=int64#3, #0
# asm 2: mov >borrow=x2, #0
mov x2, #0

# qhasm: inv0 = vec_inv0_inv1_inv2_inv3[0/4]
# asm 1: smov >inv0=int64#5, <vec_inv0_inv1_inv2_inv3=reg128#1.s[0]
# asm 2: smov >inv0=x4, <vec_inv0_inv1_inv2_inv3=v0.s[0]
smov x4, v0.s[0]

# qhasm: eighteen = 18
# asm 1: mov >eighteen=int64#6, #18
# asm 2: mov >eighteen=x5, #18
mov x5, #18

# qhasm: tmpa = mask & eighteen
# asm 1: and  >tmpa=int64#2, <mask=int64#2, <eighteen=int64#6
# asm 2: and  >tmpa=x1, <mask=x1, <eighteen=x5
and  x1, x1, x5

# qhasm: inv0 -= tmpa
# asm 1: sub <inv0=int64#5,<inv0=int64#5,<tmpa=int64#2
# asm 2: sub <inv0=x4,<inv0=x4,<tmpa=x1
sub x4,x4,x1

# qhasm: inv1 = vec_inv0_inv1_inv2_inv3[1/4]
# asm 1: smov >inv1=int64#2, <vec_inv0_inv1_inv2_inv3=reg128#1.s[1]
# asm 2: smov >inv1=x1, <vec_inv0_inv1_inv2_inv3=v0.s[1]
smov x1, v0.s[1]

# qhasm: borrow = inv0 signed>> 31
# asm 1: asr >borrow=int64#6, <inv0=int64#5, #31
# asm 2: asr >borrow=x5, <inv0=x4, #31
asr x5, x4, #31

# qhasm: inv1 -= borrow
# asm 1: sub <inv1=int64#2,<inv1=int64#2,<borrow=int64#6
# asm 2: sub <inv1=x1,<inv1=x1,<borrow=x5
sub x1,x1,x5

# qhasm: inv0 = inv0 + borrow << 30
# asm 1: add >inv0=int64#5,<inv0=int64#5,<borrow=int64#6,LSL #30
# asm 2: add >inv0=x4,<inv0=x4,<borrow=x5,LSL #30
add x4,x4,x5,LSL #30

# qhasm: inv2 = vec_inv0_inv1_inv2_inv3[2/4]
# asm 1: smov >inv2=int64#6, <vec_inv0_inv1_inv2_inv3=reg128#1.s[2]
# asm 2: smov >inv2=x5, <vec_inv0_inv1_inv2_inv3=v0.s[2]
smov x5, v0.s[2]

# qhasm: borrow = inv1 signed>> 31
# asm 1: asr >borrow=int64#7, <inv1=int64#2, #31
# asm 2: asr >borrow=x6, <inv1=x1, #31
asr x6, x1, #31

# qhasm: inv2 -= borrow
# asm 1: sub <inv2=int64#6,<inv2=int64#6,<borrow=int64#7
# asm 2: sub <inv2=x5,<inv2=x5,<borrow=x6
sub x5,x5,x6

# qhasm: inv1 = inv1 + borrow << 30
# asm 1: add >inv1=int64#2,<inv1=int64#2,<borrow=int64#7,LSL #30
# asm 2: add >inv1=x1,<inv1=x1,<borrow=x6,LSL #30
add x1,x1,x6,LSL #30

# qhasm: inv3 = vec_inv0_inv1_inv2_inv3[3/4]
# asm 1: smov >inv3=int64#7, <vec_inv0_inv1_inv2_inv3=reg128#1.s[3]
# asm 2: smov >inv3=x6, <vec_inv0_inv1_inv2_inv3=v0.s[3]
smov x6, v0.s[3]

# qhasm: borrow = inv2 signed>> 31
# asm 1: asr >borrow=int64#8, <inv2=int64#6, #31
# asm 2: asr >borrow=x7, <inv2=x5, #31
asr x7, x5, #31

# qhasm: inv3 -= borrow
# asm 1: sub <inv3=int64#7,<inv3=int64#7,<borrow=int64#8
# asm 2: sub <inv3=x6,<inv3=x6,<borrow=x7
sub x6,x6,x7

# qhasm: inv2 = inv2 + borrow << 30
# asm 1: add >inv2=int64#6,<inv2=int64#6,<borrow=int64#8,LSL #30
# asm 2: add >inv2=x5,<inv2=x5,<borrow=x7,LSL #30
add x5,x5,x7,LSL #30

# qhasm: inv4 = vec_inv4_inv5_inv6_inv7[0/4]
# asm 1: smov >inv4=int64#8, <vec_inv4_inv5_inv6_inv7=reg128#9.s[0]
# asm 2: smov >inv4=x7, <vec_inv4_inv5_inv6_inv7=v8.s[0]
smov x7, v8.s[0]

# qhasm: borrow = inv3 signed>> 31
# asm 1: asr >borrow=int64#9, <inv3=int64#7, #31
# asm 2: asr >borrow=x8, <inv3=x6, #31
asr x8, x6, #31

# qhasm: inv4 -= borrow
# asm 1: sub <inv4=int64#8,<inv4=int64#8,<borrow=int64#9
# asm 2: sub <inv4=x7,<inv4=x7,<borrow=x8
sub x7,x7,x8

# qhasm: inv3 = inv3 + borrow << 30
# asm 1: add >inv3=int64#7,<inv3=int64#7,<borrow=int64#9,LSL #30
# asm 2: add >inv3=x6,<inv3=x6,<borrow=x8,LSL #30
add x6,x6,x8,LSL #30

# qhasm: inv5 = vec_inv4_inv5_inv6_inv7[1/4]
# asm 1: smov >inv5=int64#9, <vec_inv4_inv5_inv6_inv7=reg128#9.s[1]
# asm 2: smov >inv5=x8, <vec_inv4_inv5_inv6_inv7=v8.s[1]
smov x8, v8.s[1]

# qhasm: borrow = inv4 signed>> 31
# asm 1: asr >borrow=int64#10, <inv4=int64#8, #31
# asm 2: asr >borrow=x9, <inv4=x7, #31
asr x9, x7, #31

# qhasm: inv5 -= borrow
# asm 1: sub <inv5=int64#9,<inv5=int64#9,<borrow=int64#10
# asm 2: sub <inv5=x8,<inv5=x8,<borrow=x9
sub x8,x8,x9

# qhasm: inv4 = inv4 + borrow << 30
# asm 1: add >inv4=int64#8,<inv4=int64#8,<borrow=int64#10,LSL #30
# asm 2: add >inv4=x7,<inv4=x7,<borrow=x9,LSL #30
add x7,x7,x9,LSL #30

# qhasm: inv6 = vec_inv4_inv5_inv6_inv7[2/4]
# asm 1: smov >inv6=int64#10, <vec_inv4_inv5_inv6_inv7=reg128#9.s[2]
# asm 2: smov >inv6=x9, <vec_inv4_inv5_inv6_inv7=v8.s[2]
smov x9, v8.s[2]

# qhasm: borrow = inv5 signed>> 31
# asm 1: asr >borrow=int64#11, <inv5=int64#9, #31
# asm 2: asr >borrow=x10, <inv5=x8, #31
asr x10, x8, #31

# qhasm: inv6 -= borrow
# asm 1: sub <inv6=int64#10,<inv6=int64#10,<borrow=int64#11
# asm 2: sub <inv6=x9,<inv6=x9,<borrow=x10
sub x9,x9,x10

# qhasm: inv5 = inv5 + borrow << 30
# asm 1: add >inv5=int64#9,<inv5=int64#9,<borrow=int64#11,LSL #30
# asm 2: add >inv5=x8,<inv5=x8,<borrow=x10,LSL #30
add x8,x8,x10,LSL #30

# qhasm: inv7 = vec_inv4_inv5_inv6_inv7[3/4]
# asm 1: smov >inv7=int64#11, <vec_inv4_inv5_inv6_inv7=reg128#9.s[3]
# asm 2: smov >inv7=x10, <vec_inv4_inv5_inv6_inv7=v8.s[3]
smov x10, v8.s[3]

# qhasm: borrow = inv6 signed>> 31
# asm 1: asr >borrow=int64#12, <inv6=int64#10, #31
# asm 2: asr >borrow=x11, <inv6=x9, #31
asr x11, x9, #31

# qhasm: inv7 -= borrow
# asm 1: sub <inv7=int64#11,<inv7=int64#11,<borrow=int64#12
# asm 2: sub <inv7=x10,<inv7=x10,<borrow=x11
sub x10,x10,x11

# qhasm: inv6 = inv6 + borrow << 30
# asm 1: add >inv6=int64#10,<inv6=int64#10,<borrow=int64#12,LSL #30
# asm 2: add >inv6=x9,<inv6=x9,<borrow=x11,LSL #30
add x9,x9,x11,LSL #30

# qhasm: borrow = inv7 signed>> 31
# asm 1: asr >borrow=int64#12, <inv7=int64#11, #31
# asm 2: asr >borrow=x11, <inv7=x10, #31
asr x11, x10, #31

# qhasm: inv8 -= borrow
# asm 1: sub <inv8=int64#4,<inv8=int64#4,<borrow=int64#12
# asm 2: sub <inv8=x3,<inv8=x3,<borrow=x11
sub x3,x3,x11

# qhasm: inv7 = inv7 + borrow << 30
# asm 1: add >inv7=int64#11,<inv7=int64#11,<borrow=int64#12,LSL #30
# asm 2: add >inv7=x10,<inv7=x10,<borrow=x11,LSL #30
add x10,x10,x11,LSL #30

# qhasm: mem32[pointer_inv30] = inv0
# asm 1: str <inv0=int64#5%wregname, [<pointer_inv30=int64#1]
# asm 2: str <inv0=w4, [<pointer_inv30=x0]
str w4, [x0]

# qhasm: mem32[pointer_inv30 + 4] = inv1
# asm 1: str <inv1=int64#2%wregname, [<pointer_inv30=int64#1, #4]
# asm 2: str <inv1=w1, [<pointer_inv30=x0, #4]
str w1, [x0, #4]

# qhasm: mem32[pointer_inv30 + 8] = inv2
# asm 1: str <inv2=int64#6%wregname, [<pointer_inv30=int64#1, #8]
# asm 2: str <inv2=w5, [<pointer_inv30=x0, #8]
str w5, [x0, #8]

# qhasm: mem32[pointer_inv30 + 12] = inv3
# asm 1: str <inv3=int64#7%wregname, [<pointer_inv30=int64#1, #12]
# asm 2: str <inv3=w6, [<pointer_inv30=x0, #12]
str w6, [x0, #12]

# qhasm: mem32[pointer_inv30 + 16] = inv4
# asm 1: str <inv4=int64#8%wregname, [<pointer_inv30=int64#1, #16]
# asm 2: str <inv4=w7, [<pointer_inv30=x0, #16]
str w7, [x0, #16]

# qhasm: mem32[pointer_inv30 + 20] = inv5
# asm 1: str <inv5=int64#9%wregname, [<pointer_inv30=int64#1, #20]
# asm 2: str <inv5=w8, [<pointer_inv30=x0, #20]
str w8, [x0, #20]

# qhasm: mem32[pointer_inv30 + 24] = inv6
# asm 1: str <inv6=int64#10%wregname, [<pointer_inv30=int64#1, #24]
# asm 2: str <inv6=w9, [<pointer_inv30=x0, #24]
str w9, [x0, #24]

# qhasm: mem32[pointer_inv30 + 28] = inv7
# asm 1: str <inv7=int64#11%wregname, [<pointer_inv30=int64#1, #28]
# asm 2: str <inv7=w10, [<pointer_inv30=x0, #28]
str w10, [x0, #28]

# qhasm: mem32[pointer_inv30 + 32] = inv8
# asm 1: str <inv8=int64#4%wregname, [<pointer_inv30=int64#1, #32]
# asm 2: str <inv8=w3, [<pointer_inv30=x0, #32]
str w3, [x0, #32]

# qhasm: return
ret
