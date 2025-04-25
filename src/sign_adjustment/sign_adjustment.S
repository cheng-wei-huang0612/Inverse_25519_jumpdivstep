
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

# qhasm: caller calleesaved_x18

# qhasm: caller calleesaved_x19

# qhasm: stack64 stack_x18

# qhasm: stack64 stack_x19

# qhasm: caller calleesaved_x20

# qhasm: caller calleesaved_x21

# qhasm: stack64 stack_x20

# qhasm: stack64 stack_x21

# qhasm: caller calleesaved_x22

# qhasm: caller calleesaved_x23

# qhasm: stack64 stack_x22

# qhasm: stack64 stack_x23

# qhasm: caller calleesaved_x24

# qhasm: caller calleesaved_x25

# qhasm: stack64 stack_x24

# qhasm: stack64 stack_x25

# qhasm: caller calleesaved_x26

# qhasm: caller calleesaved_x27

# qhasm: stack64 stack_x26

# qhasm: stack64 stack_x27

# qhasm: caller calleesaved_x28

# qhasm: caller calleesaved_x29

# qhasm: stack64 stack_x28

# qhasm: stack64 stack_x29

# qhasm: enter sign_adjustment
.align 4
.global _sign_adjustment
.global sign_adjustment
_sign_adjustment:
sign_adjustment:

# qhasm: F0_F1 = mem32[pointer_F]
# asm 1: ldr >F0_F1=int64#2%wregname, [<pointer_F=int64#2]
# asm 2: ldr >F0_F1=w1, [<pointer_F=x1]
ldr w1, [x1]

# qhasm: vec_F0_F1_G0_G1[0/4] = F0_F1
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.s[0], <F0_F1=int64#2%wregname
# asm 2: ins <vec_F0_F1_G0_G1=v0.s[0], <F0_F1=w1
ins v0.s[0], w1

# qhasm: inv0 = F0_F1
# asm 1: mov >inv0=int64#2,<F0_F1=int64#2
# asm 2: mov >inv0=x1,<F0_F1=x1
mov x1,x1

# qhasm: V0_V1 = mem64[pointer_V]
# asm 1: ldr >V0_V1=int64#4, [<pointer_V=int64#3]
# asm 2: ldr >V0_V1=x3, [<pointer_V=x2]
ldr x3, [x2]

# qhasm: V2_V3 = mem64[pointer_V + 8]
# asm 1: ldr >V2_V3=int64#5, [<pointer_V=int64#3, #8]
# asm 2: ldr >V2_V3=x4, [<pointer_V=x2, #8]
ldr x4, [x2, #8]

# qhasm: V4_V5 = mem64[pointer_V + 16]
# asm 1: ldr >V4_V5=int64#6, [<pointer_V=int64#3, #16]
# asm 2: ldr >V4_V5=x5, [<pointer_V=x2, #16]
ldr x5, [x2, #16]

# qhasm: V6_V7 = mem64[pointer_V + 24]
# asm 1: ldr >V6_V7=int64#7, [<pointer_V=int64#3, #24]
# asm 2: ldr >V6_V7=x6, [<pointer_V=x2, #24]
ldr x6, [x2, #24]

# qhasm: V8_0 = mem32[pointer_V + 32]
# asm 1: ldr >V8_0=int64#3%wregname, [<pointer_V=int64#3, #32]
# asm 2: ldr >V8_0=w2, [<pointer_V=x2, #32]
ldr w2, [x2, #32]

# qhasm: vec_V0_V1_S0_S1[0/2] = V0_V1
# asm 1: ins <vec_V0_V1_S0_S1=reg128#2.d[0], <V0_V1=int64#4
# asm 2: ins <vec_V0_V1_S0_S1=v1.d[0], <V0_V1=x3
ins v1.d[0], x3

# qhasm: vec_V2_V3_S2_S3[0/2] = V2_V3
# asm 1: ins <vec_V2_V3_S2_S3=reg128#3.d[0], <V2_V3=int64#5
# asm 2: ins <vec_V2_V3_S2_S3=v2.d[0], <V2_V3=x4
ins v2.d[0], x4

# qhasm: vec_V4_V5_S4_S5[0/2] = V4_V5
# asm 1: ins <vec_V4_V5_S4_S5=reg128#4.d[0], <V4_V5=int64#6
# asm 2: ins <vec_V4_V5_S4_S5=v3.d[0], <V4_V5=x5
ins v3.d[0], x5

# qhasm: vec_V6_V7_S6_S7[0/2] = V6_V7
# asm 1: ins <vec_V6_V7_S6_S7=reg128#5.d[0], <V6_V7=int64#7
# asm 2: ins <vec_V6_V7_S6_S7=v4.d[0], <V6_V7=x6
ins v4.d[0], x6

# qhasm: vec_V8_0_S8_0[0/4] = V8_0
# asm 1: ins <vec_V8_0_S8_0=reg128#6.s[0], <V8_0=int64#3%wregname
# asm 2: ins <vec_V8_0_S8_0=v5.s[0], <V8_0=w2
ins v5.s[0], w2

# qhasm: 4x vec_F0_F0_F0_F0 = vec_F0_F1_G0_G1[0/4]
# asm 1: dup <vec_F0_F0_F0_F0=reg128#7.4s, <vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: dup <vec_F0_F0_F0_F0=v6.4s, <vec_F0_F1_G0_G1=v0.s[0]
dup v6.4s, v0.s[0]

# qhasm: 2p30m1 = 1073741823
# asm 1: mov >2p30m1=int64#3, #1073741823
# asm 2: mov >2p30m1=x2, #1073741823
mov x2, #1073741823

# qhasm: 4x vec_2p30m1 = 2p30m1
# asm 1: dup <vec_2p30m1=reg128#1.4s, <2p30m1=int64#3%wregname
# asm 2: dup <vec_2p30m1=v0.4s, <2p30m1=w2
dup v0.4s, w2

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
# asm 1: smov >mask=int64#3, <vec_mask=reg128#8.s[0]
# asm 2: smov >mask=x2, <vec_mask=v7.s[0]
smov x2, v7.s[0]

# qhasm: not_mask = ~mask
# asm 1: mvn >not_mask=int64#4, <mask=int64#3
# asm 2: mvn >not_mask=x3, <mask=x2
mvn x3, x2

# qhasm: vec_inv0_inv1_inv2_inv3 = vec_mask & vec_2p30m1
# asm 1: and >vec_inv0_inv1_inv2_inv3=reg128#1.16b, <vec_mask=reg128#8.16b, <vec_2p30m1=reg128#1.16b
# asm 2: and >vec_inv0_inv1_inv2_inv3=v0.16b, <vec_mask=v7.16b, <vec_2p30m1=v0.16b
and v0.16b, v7.16b, v0.16b

# qhasm: vec_inv4_inv5_inv6_inv7 = vec_inv0_inv1_inv2_inv3 
# asm 1: mov >vec_inv4_inv5_inv6_inv7=reg128#9.16b, <vec_inv0_inv1_inv2_inv3=reg128#1.16b
# asm 2: mov >vec_inv4_inv5_inv6_inv7=v8.16b, <vec_inv0_inv1_inv2_inv3=v0.16b
mov v8.16b, v0.16b

# qhasm: inv8 = 32767
# asm 1: mov >inv8=int64#5, #32767
# asm 2: mov >inv8=x4, #32767
mov x4, #32767

# qhasm: inv8 = inv8 & mask
# asm 1: and  >inv8=int64#5, <inv8=int64#5, <mask=int64#3
# asm 2: and  >inv8=x4, <inv8=x4, <mask=x2
and  x4, x4, x2

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
# asm 1: smov >V8=int64#6, <vec_V8_0_S8_0=reg128#6.s[0]
# asm 2: smov >V8=x5, <vec_V8_0_S8_0=v5.s[0]
smov x5, v5.s[0]

# qhasm: tmpa = mask & V8
# asm 1: and  >tmpa=int64#7, <mask=int64#3, <V8=int64#6
# asm 2: and  >tmpa=x6, <mask=x2, <V8=x5
and  x6, x2, x5

# qhasm: inv8 -= tmpa
# asm 1: sub <inv8=int64#5,<inv8=int64#5,<tmpa=int64#7
# asm 2: sub <inv8=x4,<inv8=x4,<tmpa=x6
sub x4,x4,x6

# qhasm: tmpb = not_mask & V8
# asm 1: and  >tmpb=int64#4, <not_mask=int64#4, <V8=int64#6
# asm 2: and  >tmpb=x3, <not_mask=x3, <V8=x5
and  x3, x3, x5

# qhasm: inv8 += tmpb
# asm 1: add <inv8=int64#5,<inv8=int64#5,<tmpb=int64#4
# asm 2: add <inv8=x4,<inv8=x4,<tmpb=x3
add x4,x4,x3

# qhasm: inv0 = vec_inv0_inv1_inv2_inv3[0/4]
# asm 1: smov >inv0=int64#4, <vec_inv0_inv1_inv2_inv3=reg128#1.s[0]
# asm 2: smov >inv0=x3, <vec_inv0_inv1_inv2_inv3=v0.s[0]
smov x3, v0.s[0]

# qhasm: inv1 = vec_inv0_inv1_inv2_inv3[1/4]
# asm 1: smov >inv1=int64#6, <vec_inv0_inv1_inv2_inv3=reg128#1.s[1]
# asm 2: smov >inv1=x5, <vec_inv0_inv1_inv2_inv3=v0.s[1]
smov x5, v0.s[1]

# qhasm: inv2 = vec_inv0_inv1_inv2_inv3[2/4]
# asm 1: smov >inv2=int64#7, <vec_inv0_inv1_inv2_inv3=reg128#1.s[2]
# asm 2: smov >inv2=x6, <vec_inv0_inv1_inv2_inv3=v0.s[2]
smov x6, v0.s[2]

# qhasm: inv3 = vec_inv0_inv1_inv2_inv3[3/4]
# asm 1: smov >inv3=int64#8, <vec_inv0_inv1_inv2_inv3=reg128#1.s[3]
# asm 2: smov >inv3=x7, <vec_inv0_inv1_inv2_inv3=v0.s[3]
smov x7, v0.s[3]

# qhasm: inv4 = vec_inv4_inv5_inv6_inv7[0/4]
# asm 1: smov >inv4=int64#9, <vec_inv4_inv5_inv6_inv7=reg128#9.s[0]
# asm 2: smov >inv4=x8, <vec_inv4_inv5_inv6_inv7=v8.s[0]
smov x8, v8.s[0]

# qhasm: inv5 = vec_inv4_inv5_inv6_inv7[1/4]
# asm 1: smov >inv5=int64#10, <vec_inv4_inv5_inv6_inv7=reg128#9.s[1]
# asm 2: smov >inv5=x9, <vec_inv4_inv5_inv6_inv7=v8.s[1]
smov x9, v8.s[1]

# qhasm: inv6 = vec_inv4_inv5_inv6_inv7[2/4]
# asm 1: smov >inv6=int64#11, <vec_inv4_inv5_inv6_inv7=reg128#9.s[2]
# asm 2: smov >inv6=x10, <vec_inv4_inv5_inv6_inv7=v8.s[2]
smov x10, v8.s[2]

# qhasm: inv7 = vec_inv4_inv5_inv6_inv7[3/4]
# asm 1: smov >inv7=int64#12, <vec_inv4_inv5_inv6_inv7=reg128#9.s[3]
# asm 2: smov >inv7=x11, <vec_inv4_inv5_inv6_inv7=v8.s[3]
smov x11, v8.s[3]

# qhasm: borrow = 0
# asm 1: mov >borrow=int64#13, #0
# asm 2: mov >borrow=x12, #0
mov x12, #0

# qhasm: inv0 = vec_inv0_inv1_inv2_inv3[0/4]
# asm 1: smov >inv0=int64#14, <vec_inv0_inv1_inv2_inv3=reg128#1.s[0]
# asm 2: smov >inv0=x13, <vec_inv0_inv1_inv2_inv3=v0.s[0]
smov x13, v0.s[0]

# qhasm: eighteen = 18
# asm 1: mov >eighteen=int64#15, #18
# asm 2: mov >eighteen=x14, #18
mov x14, #18

# qhasm: tmpa = mask & eighteen
# asm 1: and  >tmpa=int64#3, <mask=int64#3, <eighteen=int64#15
# asm 2: and  >tmpa=x2, <mask=x2, <eighteen=x14
and  x2, x2, x14

# qhasm: inv0 -= tmpa
# asm 1: sub <inv0=int64#14,<inv0=int64#14,<tmpa=int64#3
# asm 2: sub <inv0=x13,<inv0=x13,<tmpa=x2
sub x13,x13,x2

# qhasm: inv1 = vec_inv0_inv1_inv2_inv3[1/4]
# asm 1: smov >inv1=int64#3, <vec_inv0_inv1_inv2_inv3=reg128#1.s[1]
# asm 2: smov >inv1=x2, <vec_inv0_inv1_inv2_inv3=v0.s[1]
smov x2, v0.s[1]

# qhasm: borrow = inv0 unsigned>> 31
# asm 1: lsr >borrow=int64#15, <inv0=int64#14, #31
# asm 2: lsr >borrow=x14, <inv0=x13, #31
lsr x14, x13, #31

# qhasm: inv1 -= borrow
# asm 1: sub <inv1=int64#3,<inv1=int64#3,<borrow=int64#15
# asm 2: sub <inv1=x2,<inv1=x2,<borrow=x14
sub x2,x2,x14

# qhasm: inv0 = inv0 + borrow << 30
# asm 1: add >inv0=int64#14,<inv0=int64#14,<borrow=int64#15,LSL #30
# asm 2: add >inv0=x13,<inv0=x13,<borrow=x14,LSL #30
add x13,x13,x14,LSL #30

# qhasm: mem32[pointer_inv30] = inv0
# asm 1: str <inv0=int64#14%wregname, [<pointer_inv30=int64#1]
# asm 2: str <inv0=w13, [<pointer_inv30=x0]
str w13, [x0]

# qhasm: inv2 = vec_inv0_inv1_inv2_inv3[2/4]
# asm 1: smov >inv2=int64#14, <vec_inv0_inv1_inv2_inv3=reg128#1.s[2]
# asm 2: smov >inv2=x13, <vec_inv0_inv1_inv2_inv3=v0.s[2]
smov x13, v0.s[2]

# qhasm: borrow = inv1 unsigned>> 31
# asm 1: lsr >borrow=int64#15, <inv1=int64#3, #31
# asm 2: lsr >borrow=x14, <inv1=x2, #31
lsr x14, x2, #31

# qhasm: inv2 -= borrow
# asm 1: sub <inv2=int64#14,<inv2=int64#14,<borrow=int64#15
# asm 2: sub <inv2=x13,<inv2=x13,<borrow=x14
sub x13,x13,x14

# qhasm: inv1 = inv1 + borrow << 30
# asm 1: add >inv1=int64#3,<inv1=int64#3,<borrow=int64#15,LSL #30
# asm 2: add >inv1=x2,<inv1=x2,<borrow=x14,LSL #30
add x2,x2,x14,LSL #30

# qhasm: mem32[pointer_inv30 + 4] = inv1
# asm 1: str <inv1=int64#3%wregname, [<pointer_inv30=int64#1, #4]
# asm 2: str <inv1=w2, [<pointer_inv30=x0, #4]
str w2, [x0, #4]

# qhasm: inv3 = vec_inv0_inv1_inv2_inv3[3/4]
# asm 1: smov >inv3=int64#3, <vec_inv0_inv1_inv2_inv3=reg128#1.s[3]
# asm 2: smov >inv3=x2, <vec_inv0_inv1_inv2_inv3=v0.s[3]
smov x2, v0.s[3]

# qhasm: borrow = inv2 unsigned>> 31
# asm 1: lsr >borrow=int64#15, <inv2=int64#14, #31
# asm 2: lsr >borrow=x14, <inv2=x13, #31
lsr x14, x13, #31

# qhasm: inv3 -= borrow
# asm 1: sub <inv3=int64#3,<inv3=int64#3,<borrow=int64#15
# asm 2: sub <inv3=x2,<inv3=x2,<borrow=x14
sub x2,x2,x14

# qhasm: inv2 = inv2 + borrow << 30
# asm 1: add >inv2=int64#14,<inv2=int64#14,<borrow=int64#15,LSL #30
# asm 2: add >inv2=x13,<inv2=x13,<borrow=x14,LSL #30
add x13,x13,x14,LSL #30

# qhasm: mem32[pointer_inv30 + 8] = inv2
# asm 1: str <inv2=int64#14%wregname, [<pointer_inv30=int64#1, #8]
# asm 2: str <inv2=w13, [<pointer_inv30=x0, #8]
str w13, [x0, #8]

# qhasm: inv4 = vec_inv4_inv5_inv6_inv7[0/4]
# asm 1: smov >inv4=int64#14, <vec_inv4_inv5_inv6_inv7=reg128#9.s[0]
# asm 2: smov >inv4=x13, <vec_inv4_inv5_inv6_inv7=v8.s[0]
smov x13, v8.s[0]

# qhasm: borrow = inv3 unsigned>> 31
# asm 1: lsr >borrow=int64#15, <inv3=int64#3, #31
# asm 2: lsr >borrow=x14, <inv3=x2, #31
lsr x14, x2, #31

# qhasm: inv4 -= borrow
# asm 1: sub <inv4=int64#14,<inv4=int64#14,<borrow=int64#15
# asm 2: sub <inv4=x13,<inv4=x13,<borrow=x14
sub x13,x13,x14

# qhasm: inv3 = inv3 + borrow << 30
# asm 1: add >inv3=int64#3,<inv3=int64#3,<borrow=int64#15,LSL #30
# asm 2: add >inv3=x2,<inv3=x2,<borrow=x14,LSL #30
add x2,x2,x14,LSL #30

# qhasm: mem32[pointer_inv30 + 12] = inv3
# asm 1: str <inv3=int64#3%wregname, [<pointer_inv30=int64#1, #12]
# asm 2: str <inv3=w2, [<pointer_inv30=x0, #12]
str w2, [x0, #12]

# qhasm: inv5 = vec_inv4_inv5_inv6_inv7[1/4]
# asm 1: smov >inv5=int64#3, <vec_inv4_inv5_inv6_inv7=reg128#9.s[1]
# asm 2: smov >inv5=x2, <vec_inv4_inv5_inv6_inv7=v8.s[1]
smov x2, v8.s[1]

# qhasm: borrow = inv4 unsigned>> 31
# asm 1: lsr >borrow=int64#15, <inv4=int64#14, #31
# asm 2: lsr >borrow=x14, <inv4=x13, #31
lsr x14, x13, #31

# qhasm: inv5 -= borrow
# asm 1: sub <inv5=int64#3,<inv5=int64#3,<borrow=int64#15
# asm 2: sub <inv5=x2,<inv5=x2,<borrow=x14
sub x2,x2,x14

# qhasm: inv4 = inv4 + borrow << 30
# asm 1: add >inv4=int64#14,<inv4=int64#14,<borrow=int64#15,LSL #30
# asm 2: add >inv4=x13,<inv4=x13,<borrow=x14,LSL #30
add x13,x13,x14,LSL #30

# qhasm: mem32[pointer_inv30 + 16] = inv4
# asm 1: str <inv4=int64#14%wregname, [<pointer_inv30=int64#1, #16]
# asm 2: str <inv4=w13, [<pointer_inv30=x0, #16]
str w13, [x0, #16]

# qhasm: inv6 = vec_inv4_inv5_inv6_inv7[2/4]
# asm 1: smov >inv6=int64#14, <vec_inv4_inv5_inv6_inv7=reg128#9.s[2]
# asm 2: smov >inv6=x13, <vec_inv4_inv5_inv6_inv7=v8.s[2]
smov x13, v8.s[2]

# qhasm: borrow = inv5 unsigned>> 31
# asm 1: lsr >borrow=int64#15, <inv5=int64#3, #31
# asm 2: lsr >borrow=x14, <inv5=x2, #31
lsr x14, x2, #31

# qhasm: inv6 -= borrow
# asm 1: sub <inv6=int64#14,<inv6=int64#14,<borrow=int64#15
# asm 2: sub <inv6=x13,<inv6=x13,<borrow=x14
sub x13,x13,x14

# qhasm: inv5 = inv5 + borrow << 30
# asm 1: add >inv5=int64#3,<inv5=int64#3,<borrow=int64#15,LSL #30
# asm 2: add >inv5=x2,<inv5=x2,<borrow=x14,LSL #30
add x2,x2,x14,LSL #30

# qhasm: mem32[pointer_inv30 + 20] = inv5
# asm 1: str <inv5=int64#3%wregname, [<pointer_inv30=int64#1, #20]
# asm 2: str <inv5=w2, [<pointer_inv30=x0, #20]
str w2, [x0, #20]

# qhasm: inv7 = vec_inv4_inv5_inv6_inv7[3/4]
# asm 1: smov >inv7=int64#3, <vec_inv4_inv5_inv6_inv7=reg128#9.s[3]
# asm 2: smov >inv7=x2, <vec_inv4_inv5_inv6_inv7=v8.s[3]
smov x2, v8.s[3]

# qhasm: borrow = inv6 unsigned>> 31
# asm 1: lsr >borrow=int64#15, <inv6=int64#14, #31
# asm 2: lsr >borrow=x14, <inv6=x13, #31
lsr x14, x13, #31

# qhasm: inv7 -= borrow
# asm 1: sub <inv7=int64#3,<inv7=int64#3,<borrow=int64#15
# asm 2: sub <inv7=x2,<inv7=x2,<borrow=x14
sub x2,x2,x14

# qhasm: inv6 = inv6 + borrow << 30
# asm 1: add >inv6=int64#14,<inv6=int64#14,<borrow=int64#15,LSL #30
# asm 2: add >inv6=x13,<inv6=x13,<borrow=x14,LSL #30
add x13,x13,x14,LSL #30

# qhasm: mem32[pointer_inv30 + 24] = inv6
# asm 1: str <inv6=int64#14%wregname, [<pointer_inv30=int64#1, #24]
# asm 2: str <inv6=w13, [<pointer_inv30=x0, #24]
str w13, [x0, #24]

# qhasm: borrow = inv7 unsigned>> 31
# asm 1: lsr >borrow=int64#14, <inv7=int64#3, #31
# asm 2: lsr >borrow=x13, <inv7=x2, #31
lsr x13, x2, #31

# qhasm: inv8 -= borrow
# asm 1: sub <inv8=int64#5,<inv8=int64#5,<borrow=int64#14
# asm 2: sub <inv8=x4,<inv8=x4,<borrow=x13
sub x4,x4,x13

# qhasm: inv7 = inv7 + borrow << 30
# asm 1: add >inv7=int64#3,<inv7=int64#3,<borrow=int64#14,LSL #30
# asm 2: add >inv7=x2,<inv7=x2,<borrow=x13,LSL #30
add x2,x2,x13,LSL #30

# qhasm: mem32[pointer_inv30 + 28] = inv7
# asm 1: str <inv7=int64#3%wregname, [<pointer_inv30=int64#1, #28]
# asm 2: str <inv7=w2, [<pointer_inv30=x0, #28]
str w2, [x0, #28]

# qhasm: mem32[pointer_inv30 + 32] = inv8
# asm 1: str <inv8=int64#5%wregname, [<pointer_inv30=int64#1, #32]
# asm 2: str <inv8=w4, [<pointer_inv30=x0, #32]
str w4, [x0, #32]

# qhasm: return
ret
