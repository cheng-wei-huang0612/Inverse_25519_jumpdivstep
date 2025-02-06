
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

# qhasm: int64 pointer_A

# qhasm: int64 pointer_B

# qhasm: int64 pointer_R

# qhasm: input pointer_A

# qhasm: input pointer_B

# qhasm: input pointer_R

# qhasm: int64 A_lo

# qhasm: int64 A_hi

# qhasm: int64 B_lo

# qhasm: int64 B_hi

# qhasm: int64 sign_A

# qhasm: int64 sign_B

# qhasm: int64 mask_A

# qhasm: int64 mask_B

# qhasm: int64 r0

# qhasm: int64 r1

# qhasm: int64 r2

# qhasm: int64 r3

# qhasm: int64 sign_R

# qhasm: int64 mask_R

# qhasm: int64 sum_A_lo

# qhasm: int64 sum_A_hi

# qhasm: int64 sum_B_lo

# qhasm: int64 sum_B_hi

# qhasm: int64 product_0_lo

# qhasm: int64 product_0_hi

# qhasm: int64 p0

# qhasm: int64 p1

# qhasm: int64 p2

# qhasm: int64 product_2_lo

# qhasm: int64 product_2_hi

# qhasm: int64 temp

# qhasm: enter int128_mul
.align 4
.global _int128_mul
.global int128_mul
_int128_mul:
int128_mul:

# qhasm: A_lo = mem64[pointer_A]
# asm 1: ldr >A_lo=int64#4,[<pointer_A=int64#1]
# asm 2: ldr >A_lo=x3,[<pointer_A=x0]
ldr x3,[x0]

# qhasm: A_hi = mem64[pointer_A + 8]
# asm 1: ldr >A_hi=int64#1,[<pointer_A=int64#1,#8]
# asm 2: ldr >A_hi=x0,[<pointer_A=x0,#8]
ldr x0,[x0,#8]

# qhasm: B_lo = mem64[pointer_B]
# asm 1: ldr >B_lo=int64#5,[<pointer_B=int64#2]
# asm 2: ldr >B_lo=x4,[<pointer_B=x1]
ldr x4,[x1]

# qhasm: B_hi = mem64[pointer_B + 8]
# asm 1: ldr >B_hi=int64#2,[<pointer_B=int64#2,#8]
# asm 2: ldr >B_hi=x1,[<pointer_B=x1,#8]
ldr x1,[x1,#8]

# qhasm: sign_A = A_hi >> 63
# asm 1: lsr >sign_A=int64#6,<A_hi=int64#1,#63
# asm 2: lsr >sign_A=x5,<A_hi=x0,#63
lsr x5,x0,#63

# qhasm: sign_B = B_hi >> 63
# asm 1: lsr >sign_B=int64#7,<B_hi=int64#2,#63
# asm 2: lsr >sign_B=x6,<B_hi=x1,#63
lsr x6,x1,#63

# qhasm: mask_A = - sign_A
# asm 1: neg >mask_A=int64#8,<sign_A=int64#6
# asm 2: neg >mask_A=x7,<sign_A=x5
neg x7,x5

# qhasm: A_lo ^= mask_A
# asm 1: eor >A_lo=int64#4,<A_lo=int64#4,<mask_A=int64#8
# asm 2: eor >A_lo=x3,<A_lo=x3,<mask_A=x7
eor x3,x3,x7

# qhasm: A_hi ^= mask_A
# asm 1: eor >A_hi=int64#1,<A_hi=int64#1,<mask_A=int64#8
# asm 2: eor >A_hi=x0,<A_hi=x0,<mask_A=x7
eor x0,x0,x7

# qhasm: A_lo = A_lo + sign_A !
# asm 1: adds >A_lo=int64#4,<A_lo=int64#4,<sign_A=int64#6
# asm 2: adds >A_lo=x3,<A_lo=x3,<sign_A=x5
adds x3,x3,x5

# qhasm: A_hi = A_hi + carry !
# asm 1: adcs >A_hi=int64#1,<A_hi=int64#1, xzr
# asm 2: adcs >A_hi=x0,<A_hi=x0, xzr
adcs x0,x0, xzr

# qhasm: mask_B = - sign_B
# asm 1: neg >mask_B=int64#8,<sign_B=int64#7
# asm 2: neg >mask_B=x7,<sign_B=x6
neg x7,x6

# qhasm: B_lo ^= mask_B
# asm 1: eor >B_lo=int64#5,<B_lo=int64#5,<mask_B=int64#8
# asm 2: eor >B_lo=x4,<B_lo=x4,<mask_B=x7
eor x4,x4,x7

# qhasm: B_hi ^= mask_B
# asm 1: eor >B_hi=int64#2,<B_hi=int64#2,<mask_B=int64#8
# asm 2: eor >B_hi=x1,<B_hi=x1,<mask_B=x7
eor x1,x1,x7

# qhasm: B_lo = B_lo + sign_B !
# asm 1: adds >B_lo=int64#5,<B_lo=int64#5,<sign_B=int64#7
# asm 2: adds >B_lo=x4,<B_lo=x4,<sign_B=x6
adds x4,x4,x6

# qhasm: B_hi = B_hi + carry !
# asm 1: adcs >B_hi=int64#2,<B_hi=int64#2, xzr
# asm 2: adcs >B_hi=x1,<B_hi=x1, xzr
adcs x1,x1, xzr

# qhasm: sign_R = sign_A ^ sign_B
# asm 1: eor >sign_R=int64#6,<sign_A=int64#6,<sign_B=int64#7
# asm 2: eor >sign_R=x5,<sign_A=x5,<sign_B=x6
eor x5,x5,x6

# qhasm: product_0_lo = A_lo * B_lo
# asm 1: mul >product_0_lo=int64#7,<A_lo=int64#4,<B_lo=int64#5
# asm 2: mul >product_0_lo=x6,<A_lo=x3,<B_lo=x4
mul x6,x3,x4

# qhasm: product_0_hi = A_lo * B_lo (hi)
# asm 1: umulh >product_0_hi=int64#8,<A_lo=int64#4,<B_lo=int64#5
# asm 2: umulh >product_0_hi=x7,<A_lo=x3,<B_lo=x4
umulh x7,x3,x4

# qhasm: product_2_lo = A_hi * B_hi
# asm 1: mul >product_2_lo=int64#9,<A_hi=int64#1,<B_hi=int64#2
# asm 2: mul >product_2_lo=x8,<A_hi=x0,<B_hi=x1
mul x8,x0,x1

# qhasm: product_2_hi = A_hi * B_hi (hi)
# asm 1: umulh >product_2_hi=int64#10,<A_hi=int64#1,<B_hi=int64#2
# asm 2: umulh >product_2_hi=x9,<A_hi=x0,<B_hi=x1
umulh x9,x0,x1

# qhasm: sum_A_lo = 0
# asm 1: mov >sum_A_lo=int64#11, #0
# asm 2: mov >sum_A_lo=x10, #0
mov x10, #0

# qhasm: sum_A_hi = 0
# asm 1: mov >sum_A_hi=int64#12, #0
# asm 2: mov >sum_A_hi=x11, #0
mov x11, #0

# qhasm: sum_A_lo = A_lo + A_hi !
# asm 1: adds >sum_A_lo=int64#1,<A_lo=int64#4,<A_hi=int64#1
# asm 2: adds >sum_A_lo=x0,<A_lo=x3,<A_hi=x0
adds x0,x3,x0

# qhasm: sum_A_hi = sum_A_hi + carry !
# asm 1: adcs >sum_A_hi=int64#4,<sum_A_hi=int64#12, xzr
# asm 2: adcs >sum_A_hi=x3,<sum_A_hi=x11, xzr
adcs x3,x11, xzr

# qhasm: sum_B_lo = 0
# asm 1: mov >sum_B_lo=int64#12, #0
# asm 2: mov >sum_B_lo=x11, #0
mov x11, #0

# qhasm: sum_B_hi = 0
# asm 1: mov >sum_B_hi=int64#13, #0
# asm 2: mov >sum_B_hi=x12, #0
mov x12, #0

# qhasm: sum_B_lo = B_lo + B_hi !
# asm 1: adds >sum_B_lo=int64#2,<B_lo=int64#5,<B_hi=int64#2
# asm 2: adds >sum_B_lo=x1,<B_lo=x4,<B_hi=x1
adds x1,x4,x1

# qhasm: sum_B_hi = sum_B_hi + carry !
# asm 1: adcs >sum_B_hi=int64#5,<sum_B_hi=int64#13, xzr
# asm 2: adcs >sum_B_hi=x4,<sum_B_hi=x12, xzr
adcs x4,x12, xzr

# qhasm: p0 = 0
# asm 1: mov >p0=int64#13, #0
# asm 2: mov >p0=x12, #0
mov x12, #0

# qhasm: p1 = 0
# asm 1: mov >p1=int64#14, #0
# asm 2: mov >p1=x13, #0
mov x13, #0

# qhasm: p2 = 0
# asm 1: mov >p2=int64#15, #0
# asm 2: mov >p2=x14, #0
mov x14, #0

# qhasm: p0 = sum_A_lo * sum_B_lo
# asm 1: mul >p0=int64#16,<sum_A_lo=int64#1,<sum_B_lo=int64#2
# asm 2: mul >p0=x15,<sum_A_lo=x0,<sum_B_lo=x1
mul x15,x0,x1

# qhasm: p1 = sum_A_lo * sum_B_lo (hi)
# asm 1: umulh >p1=int64#17,<sum_A_lo=int64#1,<sum_B_lo=int64#2
# asm 2: umulh >p1=x16,<sum_A_lo=x0,<sum_B_lo=x1
umulh x16,x0,x1

# qhasm: temp = sum_A_hi & sum_B_hi
# asm 1: and  >temp=int64#18,<sum_A_hi=int64#4,<sum_B_hi=int64#5
# asm 2: and  >temp=x17,<sum_A_hi=x3,<sum_B_hi=x4
and  x17,x3,x4

# qhasm: p2 = p2 + temp 
# asm 1: add >p2=int64#15,<p2=int64#15,<temp=int64#18
# asm 2: add >p2=x14,<p2=x14,<temp=x17
add x14,x14,x17

# qhasm: mask_A = - sum_A_hi
# asm 1: neg >mask_A=int64#4,<sum_A_hi=int64#4
# asm 2: neg >mask_A=x3,<sum_A_hi=x3
neg x3,x3

# qhasm: temp = sum_B_lo & mask_A
# asm 1: and  >temp=int64#2,<sum_B_lo=int64#2,<mask_A=int64#4
# asm 2: and  >temp=x1,<sum_B_lo=x1,<mask_A=x3
and  x1,x1,x3

# qhasm: p1 = p1 + temp !
# asm 1: adds >p1=int64#2,<p1=int64#17,<temp=int64#2
# asm 2: adds >p1=x1,<p1=x16,<temp=x1
adds x1,x16,x1

# qhasm: p2 = p2 + carry !
# asm 1: adcs >p2=int64#4,<p2=int64#15, xzr
# asm 2: adcs >p2=x3,<p2=x14, xzr
adcs x3,x14, xzr

# qhasm: mask_B = - sum_B_hi
# asm 1: neg >mask_B=int64#5,<sum_B_hi=int64#5
# asm 2: neg >mask_B=x4,<sum_B_hi=x4
neg x4,x4

# qhasm: temp = sum_A_lo & mask_B
# asm 1: and  >temp=int64#1,<sum_A_lo=int64#1,<mask_B=int64#5
# asm 2: and  >temp=x0,<sum_A_lo=x0,<mask_B=x4
and  x0,x0,x4

# qhasm: p1 = p1 + temp !
# asm 1: adds >p1=int64#1,<p1=int64#2,<temp=int64#1
# asm 2: adds >p1=x0,<p1=x1,<temp=x0
adds x0,x1,x0

# qhasm: p2 = p2 + carry !
# asm 1: adcs >p2=int64#2,<p2=int64#4, xzr
# asm 2: adcs >p2=x1,<p2=x3, xzr
adcs x1,x3, xzr

# qhasm: r0 = 0
# asm 1: mov >r0=int64#4, #0
# asm 2: mov >r0=x3, #0
mov x3, #0

# qhasm: r1 = 0
# asm 1: mov >r1=int64#5, #0
# asm 2: mov >r1=x4, #0
mov x4, #0

# qhasm: r2 = 0
# asm 1: mov >r2=int64#15, #0
# asm 2: mov >r2=x14, #0
mov x14, #0

# qhasm: r3 = 0
# asm 1: mov >r3=int64#17, #0
# asm 2: mov >r3=x16, #0
mov x16, #0

# qhasm: r0 = r0 + product_0_lo
# asm 1: add >r0=int64#4,<r0=int64#4,<product_0_lo=int64#7
# asm 2: add >r0=x3,<r0=x3,<product_0_lo=x6
add x3,x3,x6

# qhasm: r1 = r1 + product_0_hi
# asm 1: add >r1=int64#5,<r1=int64#5,<product_0_hi=int64#8
# asm 2: add >r1=x4,<r1=x4,<product_0_hi=x7
add x4,x4,x7

# qhasm: r2 = r2 + product_2_lo
# asm 1: add >r2=int64#15,<r2=int64#15,<product_2_lo=int64#9
# asm 2: add >r2=x14,<r2=x14,<product_2_lo=x8
add x14,x14,x8

# qhasm: r3 = r3 + product_2_hi
# asm 1: add >r3=int64#17,<r3=int64#17,<product_2_hi=int64#10
# asm 2: add >r3=x16,<r3=x16,<product_2_hi=x9
add x16,x16,x9

# qhasm: r1 = r1 + p0 !
# asm 1: adds >r1=int64#5,<r1=int64#5,<p0=int64#16
# asm 2: adds >r1=x4,<r1=x4,<p0=x15
adds x4,x4,x15

# qhasm: r2 = r2 + p1 + carry !
# asm 1: adcs >r2=int64#1,<r2=int64#15,<p1=int64#1
# asm 2: adcs >r2=x0,<r2=x14,<p1=x0
adcs x0,x14,x0

# qhasm: r3 = r3 + p2 + carry !
# asm 1: adcs >r3=int64#2,<r3=int64#17,<p2=int64#2
# asm 2: adcs >r3=x1,<r3=x16,<p2=x1
adcs x1,x16,x1

# qhasm: r1 = r1 - product_0_lo !
# asm 1: subs >r1=int64#5,<r1=int64#5,<product_0_lo=int64#7
# asm 2: subs >r1=x4,<r1=x4,<product_0_lo=x6
subs x4,x4,x6

# qhasm: r2 = r2 - product_0_hi - borrow !
# asm 1: sbcs >r2=int64#1,<r2=int64#1,<product_0_hi=int64#8
# asm 2: sbcs >r2=x0,<r2=x0,<product_0_hi=x7
sbcs x0,x0,x7

# qhasm: r3 = r3 - borrow !
# asm 1: sbcs >r3=int64#2,<r3=int64#2,xzr
# asm 2: sbcs >r3=x1,<r3=x1,xzr
sbcs x1,x1,xzr

# qhasm: r1 = r1 - product_2_lo !
# asm 1: subs >r1=int64#5,<r1=int64#5,<product_2_lo=int64#9
# asm 2: subs >r1=x4,<r1=x4,<product_2_lo=x8
subs x4,x4,x8

# qhasm: r2 = r2 - product_2_hi - borrow !
# asm 1: sbcs >r2=int64#1,<r2=int64#1,<product_2_hi=int64#10
# asm 2: sbcs >r2=x0,<r2=x0,<product_2_hi=x9
sbcs x0,x0,x9

# qhasm: r3 = r3 - borrow !
# asm 1: sbcs >r3=int64#2,<r3=int64#2,xzr
# asm 2: sbcs >r3=x1,<r3=x1,xzr
sbcs x1,x1,xzr

# qhasm: mask_R = - sign_R
# asm 1: neg >mask_R=int64#7,<sign_R=int64#6
# asm 2: neg >mask_R=x6,<sign_R=x5
neg x6,x5

# qhasm: r0 ^= mask_R
# asm 1: eor >r0=int64#4,<r0=int64#4,<mask_R=int64#7
# asm 2: eor >r0=x3,<r0=x3,<mask_R=x6
eor x3,x3,x6

# qhasm: r1 ^= mask_R
# asm 1: eor >r1=int64#5,<r1=int64#5,<mask_R=int64#7
# asm 2: eor >r1=x4,<r1=x4,<mask_R=x6
eor x4,x4,x6

# qhasm: r2 ^= mask_R
# asm 1: eor >r2=int64#1,<r2=int64#1,<mask_R=int64#7
# asm 2: eor >r2=x0,<r2=x0,<mask_R=x6
eor x0,x0,x6

# qhasm: r3 ^= mask_R
# asm 1: eor >r3=int64#2,<r3=int64#2,<mask_R=int64#7
# asm 2: eor >r3=x1,<r3=x1,<mask_R=x6
eor x1,x1,x6

# qhasm: r0 = r0 + sign_R!
# asm 1: adds >r0=int64#4,<r0=int64#4,<sign_R=int64#6
# asm 2: adds >r0=x3,<r0=x3,<sign_R=x5
adds x3,x3,x5

# qhasm: r1 = r1 + carry !
# asm 1: adcs >r1=int64#5,<r1=int64#5, xzr
# asm 2: adcs >r1=x4,<r1=x4, xzr
adcs x4,x4, xzr

# qhasm: r2 = r2 + carry !
# asm 1: adcs >r2=int64#1,<r2=int64#1, xzr
# asm 2: adcs >r2=x0,<r2=x0, xzr
adcs x0,x0, xzr

# qhasm: r3 = r3 + carry !
# asm 1: adcs >r3=int64#2,<r3=int64#2, xzr
# asm 2: adcs >r3=x1,<r3=x1, xzr
adcs x1,x1, xzr

# qhasm: mem64[pointer_R] = r0
# asm 1: str <r0=int64#4,[<pointer_R=int64#3]
# asm 2: str <r0=x3,[<pointer_R=x2]
str x3,[x2]

# qhasm: mem64[pointer_R + 8] = r1
# asm 1: str <r1=int64#5,[<pointer_R=int64#3,#8]
# asm 2: str <r1=x4,[<pointer_R=x2,#8]
str x4,[x2,#8]

# qhasm: mem64[pointer_R + 16] = r2
# asm 1: str <r2=int64#1,[<pointer_R=int64#3,#16]
# asm 2: str <r2=x0,[<pointer_R=x2,#16]
str x0,[x2,#16]

# qhasm: mem64[pointer_R + 24] = r3
# asm 1: str <r3=int64#2,[<pointer_R=int64#3,#24]
# asm 2: str <r3=x1,[<pointer_R=x2,#24]
str x1,[x2,#24]

# qhasm: return
ret
