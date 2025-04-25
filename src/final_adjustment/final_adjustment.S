
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

# qhasm: int64 pointer_inv

# qhasm: int64 pointer_F

# qhasm: int64 pointer_V

# qhasm: input pointer_inv

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

# qhasm: int64 limb64_0

# qhasm: int64 limb64_1

# qhasm: int64 limb64_2

# qhasm: int64 limb64_3

# qhasm: int64 tmp

# qhasm: enter final_adjustment
.align 4
.global _final_adjustment
.global final_adjustment
_final_adjustment:
final_adjustment:

# qhasm: push2xint64 calleesaved_x18, calleesaved_x19
# asm 1: stp <calleesaved_x18=int64#19, <calleesaved_x19=int64#20, [sp, #-16]!
# asm 2: stp <calleesaved_x18=x18, <calleesaved_x19=x19, [sp, #-16]!
stp x18, x19, [sp, #-16]!

# qhasm: F0_F1 = mem32[pointer_F]
# asm 1: ldr >F0_F1=int64#2%wregname, [<pointer_F=int64#2]
# asm 2: ldr >F0_F1=w1, [<pointer_F=x1]
ldr w1, [x1]

# qhasm: vec_F0_F1_G0_G1[0/4] = F0_F1
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.s[0], <F0_F1=int64#2%wregname
# asm 2: ins <vec_F0_F1_G0_G1=v0.s[0], <F0_F1=w1
ins v0.s[0], w1

# qhasm: V0_V1, V2_V3 = mem128[pointer_V]
# asm 1: ldp >V0_V1=int64#2, >V2_V3=int64#4, [<pointer_V=int64#3]
# asm 2: ldp >V0_V1=x1, >V2_V3=x3, [<pointer_V=x2]
ldp x1, x3, [x2]

# qhasm: V4_V5, V6_V7 = mem128[pointer_V + 16]
# asm 1: ldp >V4_V5=int64#5, >V6_V7=int64#6, [<pointer_V=int64#3, #16]
# asm 2: ldp >V4_V5=x4, >V6_V7=x5, [<pointer_V=x2, #16]
ldp x4, x5, [x2, #16]

# qhasm: V8_0 = mem32[pointer_V + 32]
# asm 1: ldr >V8_0=int64#3%wregname, [<pointer_V=int64#3, #32]
# asm 2: ldr >V8_0=w2, [<pointer_V=x2, #32]
ldr w2, [x2, #32]

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

# qhasm: vec_V8_0_S8_0[0/4] = V8_0
# asm 1: ins <vec_V8_0_S8_0=reg128#6.s[0], <V8_0=int64#3%wregname
# asm 2: ins <vec_V8_0_S8_0=v5.s[0], <V8_0=w2
ins v5.s[0], w2

# qhasm: 4x vec_F0_F0_F0_F0 = vec_F0_F1_G0_G1[0/4]
# asm 1: dup <vec_F0_F0_F0_F0=reg128#7.4s, <vec_F0_F1_G0_G1=reg128#1.s[0]
# asm 2: dup <vec_F0_F0_F0_F0=v6.4s, <vec_F0_F1_G0_G1=v0.s[0]
dup v6.4s, v0.s[0]

# qhasm: 2p30m1 = 1073741823
# asm 1: mov >2p30m1=int64#2, #1073741823
# asm 2: mov >2p30m1=x1, #1073741823
mov x1, #1073741823

# qhasm: 4x vec_2p30m1 = 2p30m1
# asm 1: dup <vec_2p30m1=reg128#1.4s, <2p30m1=int64#2%wregname
# asm 2: dup <vec_2p30m1=v0.4s, <2p30m1=w1
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

# qhasm: inv0 = vec_inv0_inv1_inv2_inv3[0/4]
# asm 1: smov >inv0=int64#3, <vec_inv0_inv1_inv2_inv3=reg128#1.s[0]
# asm 2: smov >inv0=x2, <vec_inv0_inv1_inv2_inv3=v0.s[0]
smov x2, v0.s[0]

# qhasm: inv1 = vec_inv0_inv1_inv2_inv3[1/4]
# asm 1: smov >inv1=int64#5, <vec_inv0_inv1_inv2_inv3=reg128#1.s[1]
# asm 2: smov >inv1=x4, <vec_inv0_inv1_inv2_inv3=v0.s[1]
smov x4, v0.s[1]

# qhasm: inv2 = vec_inv0_inv1_inv2_inv3[2/4]
# asm 1: smov >inv2=int64#6, <vec_inv0_inv1_inv2_inv3=reg128#1.s[2]
# asm 2: smov >inv2=x5, <vec_inv0_inv1_inv2_inv3=v0.s[2]
smov x5, v0.s[2]

# qhasm: inv3 = vec_inv0_inv1_inv2_inv3[3/4]
# asm 1: smov >inv3=int64#7, <vec_inv0_inv1_inv2_inv3=reg128#1.s[3]
# asm 2: smov >inv3=x6, <vec_inv0_inv1_inv2_inv3=v0.s[3]
smov x6, v0.s[3]

# qhasm: inv4 = vec_inv4_inv5_inv6_inv7[0/4]
# asm 1: smov >inv4=int64#8, <vec_inv4_inv5_inv6_inv7=reg128#9.s[0]
# asm 2: smov >inv4=x7, <vec_inv4_inv5_inv6_inv7=v8.s[0]
smov x7, v8.s[0]

# qhasm: inv5 = vec_inv4_inv5_inv6_inv7[1/4]
# asm 1: smov >inv5=int64#9, <vec_inv4_inv5_inv6_inv7=reg128#9.s[1]
# asm 2: smov >inv5=x8, <vec_inv4_inv5_inv6_inv7=v8.s[1]
smov x8, v8.s[1]

# qhasm: inv6 = vec_inv4_inv5_inv6_inv7[2/4]
# asm 1: smov >inv6=int64#10, <vec_inv4_inv5_inv6_inv7=reg128#9.s[2]
# asm 2: smov >inv6=x9, <vec_inv4_inv5_inv6_inv7=v8.s[2]
smov x9, v8.s[2]

# qhasm: inv7 = vec_inv4_inv5_inv6_inv7[3/4]
# asm 1: smov >inv7=int64#11, <vec_inv4_inv5_inv6_inv7=reg128#9.s[3]
# asm 2: smov >inv7=x10, <vec_inv4_inv5_inv6_inv7=v8.s[3]
smov x10, v8.s[3]

# qhasm: borrow = 0
# asm 1: mov >borrow=int64#12, #0
# asm 2: mov >borrow=x11, #0
mov x11, #0

# qhasm: inv0 = vec_inv0_inv1_inv2_inv3[0/4]
# asm 1: smov >inv0=int64#13, <vec_inv0_inv1_inv2_inv3=reg128#1.s[0]
# asm 2: smov >inv0=x12, <vec_inv0_inv1_inv2_inv3=v0.s[0]
smov x12, v0.s[0]

# qhasm: eighteen = 18
# asm 1: mov >eighteen=int64#14, #18
# asm 2: mov >eighteen=x13, #18
mov x13, #18

# qhasm: tmpa = mask & eighteen
# asm 1: and  >tmpa=int64#2, <mask=int64#2, <eighteen=int64#14
# asm 2: and  >tmpa=x1, <mask=x1, <eighteen=x13
and  x1, x1, x13

# qhasm: inv0 -= tmpa
# asm 1: sub <inv0=int64#13,<inv0=int64#13,<tmpa=int64#2
# asm 2: sub <inv0=x12,<inv0=x12,<tmpa=x1
sub x12,x12,x1

# qhasm: inv1 = vec_inv0_inv1_inv2_inv3[1/4]
# asm 1: smov >inv1=int64#2, <vec_inv0_inv1_inv2_inv3=reg128#1.s[1]
# asm 2: smov >inv1=x1, <vec_inv0_inv1_inv2_inv3=v0.s[1]
smov x1, v0.s[1]

# qhasm: borrow = inv0 unsigned>> 31
# asm 1: lsr >borrow=int64#14, <inv0=int64#13, #31
# asm 2: lsr >borrow=x13, <inv0=x12, #31
lsr x13, x12, #31

# qhasm: inv1 -= borrow
# asm 1: sub <inv1=int64#2,<inv1=int64#2,<borrow=int64#14
# asm 2: sub <inv1=x1,<inv1=x1,<borrow=x13
sub x1,x1,x13

# qhasm: inv0 = inv0 + borrow << 30
# asm 1: add >inv0=int64#13,<inv0=int64#13,<borrow=int64#14,LSL #30
# asm 2: add >inv0=x12,<inv0=x12,<borrow=x13,LSL #30
add x12,x12,x13,LSL #30

# qhasm: inv2 = vec_inv0_inv1_inv2_inv3[2/4]
# asm 1: smov >inv2=int64#14, <vec_inv0_inv1_inv2_inv3=reg128#1.s[2]
# asm 2: smov >inv2=x13, <vec_inv0_inv1_inv2_inv3=v0.s[2]
smov x13, v0.s[2]

# qhasm: borrow = inv1 unsigned>> 31
# asm 1: lsr >borrow=int64#15, <inv1=int64#2, #31
# asm 2: lsr >borrow=x14, <inv1=x1, #31
lsr x14, x1, #31

# qhasm: inv2 -= borrow
# asm 1: sub <inv2=int64#14,<inv2=int64#14,<borrow=int64#15
# asm 2: sub <inv2=x13,<inv2=x13,<borrow=x14
sub x13,x13,x14

# qhasm: inv1 = inv1 + borrow << 30
# asm 1: add >inv1=int64#2,<inv1=int64#2,<borrow=int64#15,LSL #30
# asm 2: add >inv1=x1,<inv1=x1,<borrow=x14,LSL #30
add x1,x1,x14,LSL #30

# qhasm: inv3 = vec_inv0_inv1_inv2_inv3[3/4]
# asm 1: smov >inv3=int64#15, <vec_inv0_inv1_inv2_inv3=reg128#1.s[3]
# asm 2: smov >inv3=x14, <vec_inv0_inv1_inv2_inv3=v0.s[3]
smov x14, v0.s[3]

# qhasm: borrow = inv2 unsigned>> 31
# asm 1: lsr >borrow=int64#16, <inv2=int64#14, #31
# asm 2: lsr >borrow=x15, <inv2=x13, #31
lsr x15, x13, #31

# qhasm: inv3 -= borrow
# asm 1: sub <inv3=int64#15,<inv3=int64#15,<borrow=int64#16
# asm 2: sub <inv3=x14,<inv3=x14,<borrow=x15
sub x14,x14,x15

# qhasm: inv2 = inv2 + borrow << 30
# asm 1: add >inv2=int64#14,<inv2=int64#14,<borrow=int64#16,LSL #30
# asm 2: add >inv2=x13,<inv2=x13,<borrow=x15,LSL #30
add x13,x13,x15,LSL #30

# qhasm: inv4 = vec_inv4_inv5_inv6_inv7[0/4]
# asm 1: smov >inv4=int64#16, <vec_inv4_inv5_inv6_inv7=reg128#9.s[0]
# asm 2: smov >inv4=x15, <vec_inv4_inv5_inv6_inv7=v8.s[0]
smov x15, v8.s[0]

# qhasm: borrow = inv3 unsigned>> 31
# asm 1: lsr >borrow=int64#17, <inv3=int64#15, #31
# asm 2: lsr >borrow=x16, <inv3=x14, #31
lsr x16, x14, #31

# qhasm: inv4 -= borrow
# asm 1: sub <inv4=int64#16,<inv4=int64#16,<borrow=int64#17
# asm 2: sub <inv4=x15,<inv4=x15,<borrow=x16
sub x15,x15,x16

# qhasm: inv3 = inv3 + borrow << 30
# asm 1: add >inv3=int64#15,<inv3=int64#15,<borrow=int64#17,LSL #30
# asm 2: add >inv3=x14,<inv3=x14,<borrow=x16,LSL #30
add x14,x14,x16,LSL #30

# qhasm: inv5 = vec_inv4_inv5_inv6_inv7[1/4]
# asm 1: smov >inv5=int64#17, <vec_inv4_inv5_inv6_inv7=reg128#9.s[1]
# asm 2: smov >inv5=x16, <vec_inv4_inv5_inv6_inv7=v8.s[1]
smov x16, v8.s[1]

# qhasm: borrow = inv4 unsigned>> 31
# asm 1: lsr >borrow=int64#18, <inv4=int64#16, #31
# asm 2: lsr >borrow=x17, <inv4=x15, #31
lsr x17, x15, #31

# qhasm: inv5 -= borrow
# asm 1: sub <inv5=int64#17,<inv5=int64#17,<borrow=int64#18
# asm 2: sub <inv5=x16,<inv5=x16,<borrow=x17
sub x16,x16,x17

# qhasm: inv4 = inv4 + borrow << 30
# asm 1: add >inv4=int64#16,<inv4=int64#16,<borrow=int64#18,LSL #30
# asm 2: add >inv4=x15,<inv4=x15,<borrow=x17,LSL #30
add x15,x15,x17,LSL #30

# qhasm: inv6 = vec_inv4_inv5_inv6_inv7[2/4]
# asm 1: smov >inv6=int64#18, <vec_inv4_inv5_inv6_inv7=reg128#9.s[2]
# asm 2: smov >inv6=x17, <vec_inv4_inv5_inv6_inv7=v8.s[2]
smov x17, v8.s[2]

# qhasm: borrow = inv5 unsigned>> 31
# asm 1: lsr >borrow=int64#19, <inv5=int64#17, #31
# asm 2: lsr >borrow=x18, <inv5=x16, #31
lsr x18, x16, #31

# qhasm: inv6 -= borrow
# asm 1: sub <inv6=int64#18,<inv6=int64#18,<borrow=int64#19
# asm 2: sub <inv6=x17,<inv6=x17,<borrow=x18
sub x17,x17,x18

# qhasm: inv5 = inv5 + borrow << 30
# asm 1: add >inv5=int64#17,<inv5=int64#17,<borrow=int64#19,LSL #30
# asm 2: add >inv5=x16,<inv5=x16,<borrow=x18,LSL #30
add x16,x16,x18,LSL #30

# qhasm: inv7 = vec_inv4_inv5_inv6_inv7[3/4]
# asm 1: smov >inv7=int64#19, <vec_inv4_inv5_inv6_inv7=reg128#9.s[3]
# asm 2: smov >inv7=x18, <vec_inv4_inv5_inv6_inv7=v8.s[3]
smov x18, v8.s[3]

# qhasm: borrow = inv6 unsigned>> 31
# asm 1: lsr >borrow=int64#20, <inv6=int64#18, #31
# asm 2: lsr >borrow=x19, <inv6=x17, #31
lsr x19, x17, #31

# qhasm: inv7 -= borrow
# asm 1: sub <inv7=int64#19,<inv7=int64#19,<borrow=int64#20
# asm 2: sub <inv7=x18,<inv7=x18,<borrow=x19
sub x18,x18,x19

# qhasm: inv6 = inv6 + borrow << 30
# asm 1: add >inv6=int64#18,<inv6=int64#18,<borrow=int64#20,LSL #30
# asm 2: add >inv6=x17,<inv6=x17,<borrow=x19,LSL #30
add x17,x17,x19,LSL #30

# qhasm: borrow = inv7 unsigned>> 31
# asm 1: lsr >borrow=int64#20, <inv7=int64#19, #31
# asm 2: lsr >borrow=x19, <inv7=x18, #31
lsr x19, x18, #31

# qhasm: inv8 -= borrow
# asm 1: sub <inv8=int64#4,<inv8=int64#4,<borrow=int64#20
# asm 2: sub <inv8=x3,<inv8=x3,<borrow=x19
sub x3,x3,x19

# qhasm: inv7 = inv7 + borrow << 30
# asm 1: add >inv7=int64#19,<inv7=int64#19,<borrow=int64#20,LSL #30
# asm 2: add >inv7=x18,<inv7=x18,<borrow=x19,LSL #30
add x18,x18,x19,LSL #30

# qhasm: inv1 = inv1 << 30
# asm 1: lsl >inv1=int64#2, <inv1=int64#2, #30
# asm 2: lsl >inv1=x1, <inv1=x1, #30
lsl x1, x1, #30

# qhasm: tmp = inv2 << 60
# asm 1: lsl >tmp=int64#20, <inv2=int64#14, #60
# asm 2: lsl >tmp=x19, <inv2=x13, #60
lsl x19, x13, #60

# qhasm: limb64_0 = inv1 | inv0
# asm 1: orr >limb64_0=int64#2, <inv1=int64#2, <inv0=int64#13
# asm 2: orr >limb64_0=x1, <inv1=x1, <inv0=x12
orr x1, x1, x12

# qhasm: limb64_0 = limb64_0 | tmp
# asm 1: orr >limb64_0=int64#2, <limb64_0=int64#2, <tmp=int64#20
# asm 2: orr >limb64_0=x1, <limb64_0=x1, <tmp=x19
orr x1, x1, x19

# qhasm: inv2 = inv2 (unsigned)>> 4
# asm 1: lsr >inv2=int64#13, <inv2=int64#14, #4
# asm 2: lsr >inv2=x12, <inv2=x13, #4
lsr x12, x13, #4

# qhasm: inv3 = inv3 << 26
# asm 1: lsl >inv3=int64#14, <inv3=int64#15, #26
# asm 2: lsl >inv3=x13, <inv3=x14, #26
lsl x13, x14, #26

# qhasm: tmp = inv4 << 56
# asm 1: lsl >tmp=int64#15, <inv4=int64#16, #56
# asm 2: lsl >tmp=x14, <inv4=x15, #56
lsl x14, x15, #56

# qhasm: limb64_1 = inv2 | inv3
# asm 1: orr >limb64_1=int64#13, <inv2=int64#13, <inv3=int64#14
# asm 2: orr >limb64_1=x12, <inv2=x12, <inv3=x13
orr x12, x12, x13

# qhasm: limb64_1 = limb64_1 | tmp
# asm 1: orr >limb64_1=int64#13, <limb64_1=int64#13, <tmp=int64#15
# asm 2: orr >limb64_1=x12, <limb64_1=x12, <tmp=x14
orr x12, x12, x14

# qhasm: inv4 = inv4 (unsigned)>> 8
# asm 1: lsr >inv4=int64#14, <inv4=int64#16, #8
# asm 2: lsr >inv4=x13, <inv4=x15, #8
lsr x13, x15, #8

# qhasm: inv5 = inv5 << 22
# asm 1: lsl >inv5=int64#15, <inv5=int64#17, #22
# asm 2: lsl >inv5=x14, <inv5=x16, #22
lsl x14, x16, #22

# qhasm: tmp = inv6 << 52
# asm 1: lsl >tmp=int64#16, <inv6=int64#18, #52
# asm 2: lsl >tmp=x15, <inv6=x17, #52
lsl x15, x17, #52

# qhasm: limb64_2 = inv4 | inv5
# asm 1: orr >limb64_2=int64#14, <inv4=int64#14, <inv5=int64#15
# asm 2: orr >limb64_2=x13, <inv4=x13, <inv5=x14
orr x13, x13, x14

# qhasm: limb64_2 = limb64_2 | tmp
# asm 1: orr >limb64_2=int64#14, <limb64_2=int64#14, <tmp=int64#16
# asm 2: orr >limb64_2=x13, <limb64_2=x13, <tmp=x15
orr x13, x13, x15

# qhasm: inv6 = inv6 (unsigned)>> 12
# asm 1: lsr >inv6=int64#15, <inv6=int64#18, #12
# asm 2: lsr >inv6=x14, <inv6=x17, #12
lsr x14, x17, #12

# qhasm: inv7 = inv7 << 18
# asm 1: lsl >inv7=int64#16, <inv7=int64#19, #18
# asm 2: lsl >inv7=x15, <inv7=x18, #18
lsl x15, x18, #18

# qhasm: tmp = inv8 << 48
# asm 1: lsl >tmp=int64#4, <inv8=int64#4, #48
# asm 2: lsl >tmp=x3, <inv8=x3, #48
lsl x3, x3, #48

# qhasm: limb64_3 = inv6 | inv7
# asm 1: orr >limb64_3=int64#15, <inv6=int64#15, <inv7=int64#16
# asm 2: orr >limb64_3=x14, <inv6=x14, <inv7=x15
orr x14, x14, x15

# qhasm: limb64_3 = limb64_3 | tmp
# asm 1: orr >limb64_3=int64#4, <limb64_3=int64#15, <tmp=int64#4
# asm 2: orr >limb64_3=x3, <limb64_3=x14, <tmp=x3
orr x3, x14, x3

# qhasm: mem128[pointer_inv] = limb64_0, limb64_1
# asm 1: stp <limb64_0=int64#2, <limb64_1=int64#13, [<pointer_inv=int64#1]
# asm 2: stp <limb64_0=x1, <limb64_1=x12, [<pointer_inv=x0]
stp x1, x12, [x0]

# qhasm: mem128[pointer_inv + 16] = limb64_2, limb64_3
# asm 1: stp <limb64_2=int64#14, <limb64_3=int64#4, [<pointer_inv=int64#1, #16]
# asm 2: stp <limb64_2=x13, <limb64_3=x3, [<pointer_inv=x0, #16]
stp x13, x3, [x0, #16]

# qhasm: pop2xint64 calleesaved_x18, calleesaved_x19
# asm 1: ldp >calleesaved_x18=int64#19, >calleesaved_x19=int64#20, [sp], #16
# asm 2: ldp >calleesaved_x18=x18, >calleesaved_x19=x19, [sp], #16
ldp x18, x19, [sp], #16

# qhasm: return
ret
