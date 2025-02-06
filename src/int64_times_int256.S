
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

# qhasm: int64 A

# qhasm: int64 B0

# qhasm: int64 B1

# qhasm: int64 B2

# qhasm: int64 B3

# qhasm: int64 sign_A

# qhasm: int64 sign_B

# qhasm: int64 mask_A

# qhasm: int64 mask_B

# qhasm: int64 r0

# qhasm: int64 r1

# qhasm: int64 r2

# qhasm: int64 r3

# qhasm: int64 r4

# qhasm: int64 sign_R

# qhasm: int64 mask_R

# qhasm: int64 product_lo

# qhasm: int64 product_hi

# qhasm: enter int64_times_int256
.align 4
.global _int64_times_int256
.global int64_times_int256
_int64_times_int256:
int64_times_int256:

# qhasm: A = mem64[pointer_A]
# asm 1: ldr >A=int64#1,[<pointer_A=int64#1]
# asm 2: ldr >A=x0,[<pointer_A=x0]
ldr x0,[x0]

# qhasm: B0 = mem64[pointer_B]
# asm 1: ldr >B0=int64#4,[<pointer_B=int64#2]
# asm 2: ldr >B0=x3,[<pointer_B=x1]
ldr x3,[x1]

# qhasm: B1 = mem64[pointer_B + 8]
# asm 1: ldr >B1=int64#5,[<pointer_B=int64#2,#8]
# asm 2: ldr >B1=x4,[<pointer_B=x1,#8]
ldr x4,[x1,#8]

# qhasm: B2 = mem64[pointer_B + 16]
# asm 1: ldr >B2=int64#6,[<pointer_B=int64#2,#16]
# asm 2: ldr >B2=x5,[<pointer_B=x1,#16]
ldr x5,[x1,#16]

# qhasm: B3 = mem64[pointer_B + 24]
# asm 1: ldr >B3=int64#2,[<pointer_B=int64#2,#24]
# asm 2: ldr >B3=x1,[<pointer_B=x1,#24]
ldr x1,[x1,#24]

# qhasm: sign_A = A  >> 63
# asm 1: lsr >sign_A=int64#7,<A=int64#1,#63
# asm 2: lsr >sign_A=x6,<A=x0,#63
lsr x6,x0,#63

# qhasm: sign_B = B3 >> 63
# asm 1: lsr >sign_B=int64#8,<B3=int64#2,#63
# asm 2: lsr >sign_B=x7,<B3=x1,#63
lsr x7,x1,#63

# qhasm: mask_A = - sign_A
# asm 1: neg >mask_A=int64#9,<sign_A=int64#7
# asm 2: neg >mask_A=x8,<sign_A=x6
neg x8,x6

# qhasm: A ^= mask_A
# asm 1: eor >A=int64#1,<A=int64#1,<mask_A=int64#9
# asm 2: eor >A=x0,<A=x0,<mask_A=x8
eor x0,x0,x8

# qhasm: A = A + sign_A
# asm 1: add >A=int64#1,<A=int64#1,<sign_A=int64#7
# asm 2: add >A=x0,<A=x0,<sign_A=x6
add x0,x0,x6

# qhasm: mask_B = - sign_B
# asm 1: neg >mask_B=int64#9,<sign_B=int64#8
# asm 2: neg >mask_B=x8,<sign_B=x7
neg x8,x7

# qhasm: B0 ^= mask_B
# asm 1: eor >B0=int64#4,<B0=int64#4,<mask_B=int64#9
# asm 2: eor >B0=x3,<B0=x3,<mask_B=x8
eor x3,x3,x8

# qhasm: B1 ^= mask_B
# asm 1: eor >B1=int64#5,<B1=int64#5,<mask_B=int64#9
# asm 2: eor >B1=x4,<B1=x4,<mask_B=x8
eor x4,x4,x8

# qhasm: B2 ^= mask_B
# asm 1: eor >B2=int64#6,<B2=int64#6,<mask_B=int64#9
# asm 2: eor >B2=x5,<B2=x5,<mask_B=x8
eor x5,x5,x8

# qhasm: B3 ^= mask_B
# asm 1: eor >B3=int64#2,<B3=int64#2,<mask_B=int64#9
# asm 2: eor >B3=x1,<B3=x1,<mask_B=x8
eor x1,x1,x8

# qhasm: B0 = B0 + sign_B !
# asm 1: adds >B0=int64#4,<B0=int64#4,<sign_B=int64#8
# asm 2: adds >B0=x3,<B0=x3,<sign_B=x7
adds x3,x3,x7

# qhasm: B1 = B1 + carry !
# asm 1: adcs >B1=int64#5,<B1=int64#5, xzr
# asm 2: adcs >B1=x4,<B1=x4, xzr
adcs x4,x4, xzr

# qhasm: B2 = B2 + carry !
# asm 1: adcs >B2=int64#6,<B2=int64#6, xzr
# asm 2: adcs >B2=x5,<B2=x5, xzr
adcs x5,x5, xzr

# qhasm: B3 = B3 + carry !
# asm 1: adcs >B3=int64#2,<B3=int64#2, xzr
# asm 2: adcs >B3=x1,<B3=x1, xzr
adcs x1,x1, xzr

# qhasm: sign_R = sign_A ^ sign_B
# asm 1: eor >sign_R=int64#7,<sign_A=int64#7,<sign_B=int64#8
# asm 2: eor >sign_R=x6,<sign_A=x6,<sign_B=x7
eor x6,x6,x7

# qhasm: r0 = 0
# asm 1: mov >r0=int64#8, #0
# asm 2: mov >r0=x7, #0
mov x7, #0

# qhasm: r1 = 0
# asm 1: mov >r1=int64#9, #0
# asm 2: mov >r1=x8, #0
mov x8, #0

# qhasm: r2 = 0
# asm 1: mov >r2=int64#10, #0
# asm 2: mov >r2=x9, #0
mov x9, #0

# qhasm: r3 = 0
# asm 1: mov >r3=int64#11, #0
# asm 2: mov >r3=x10, #0
mov x10, #0

# qhasm: r4 = 0
# asm 1: mov >r4=int64#12, #0
# asm 2: mov >r4=x11, #0
mov x11, #0

# qhasm: product_lo = A * B0
# asm 1: mul >product_lo=int64#13,<A=int64#1,<B0=int64#4
# asm 2: mul >product_lo=x12,<A=x0,<B0=x3
mul x12,x0,x3

# qhasm: product_hi = A * B0 (hi)
# asm 1: umulh >product_hi=int64#4,<A=int64#1,<B0=int64#4
# asm 2: umulh >product_hi=x3,<A=x0,<B0=x3
umulh x3,x0,x3

# qhasm: r0 = r0 + product_lo !
# asm 1: adds >r0=int64#8,<r0=int64#8,<product_lo=int64#13
# asm 2: adds >r0=x7,<r0=x7,<product_lo=x12
adds x7,x7,x12

# qhasm: r1 = r1 + product_hi + carry !
# asm 1: adcs >r1=int64#4,<r1=int64#9,<product_hi=int64#4
# asm 2: adcs >r1=x3,<r1=x8,<product_hi=x3
adcs x3,x8,x3

# qhasm: product_lo = A * B1
# asm 1: mul >product_lo=int64#9,<A=int64#1,<B1=int64#5
# asm 2: mul >product_lo=x8,<A=x0,<B1=x4
mul x8,x0,x4

# qhasm: product_hi = A * B1 (hi)
# asm 1: umulh >product_hi=int64#5,<A=int64#1,<B1=int64#5
# asm 2: umulh >product_hi=x4,<A=x0,<B1=x4
umulh x4,x0,x4

# qhasm: r1 = r1 + product_lo !
# asm 1: adds >r1=int64#4,<r1=int64#4,<product_lo=int64#9
# asm 2: adds >r1=x3,<r1=x3,<product_lo=x8
adds x3,x3,x8

# qhasm: r2 = r2 + product_hi + carry !
# asm 1: adcs >r2=int64#5,<r2=int64#10,<product_hi=int64#5
# asm 2: adcs >r2=x4,<r2=x9,<product_hi=x4
adcs x4,x9,x4

# qhasm: product_lo = A * B2
# asm 1: mul >product_lo=int64#9,<A=int64#1,<B2=int64#6
# asm 2: mul >product_lo=x8,<A=x0,<B2=x5
mul x8,x0,x5

# qhasm: product_hi = A * B2 (hi)
# asm 1: umulh >product_hi=int64#6,<A=int64#1,<B2=int64#6
# asm 2: umulh >product_hi=x5,<A=x0,<B2=x5
umulh x5,x0,x5

# qhasm: r2 = r2 + product_lo !
# asm 1: adds >r2=int64#5,<r2=int64#5,<product_lo=int64#9
# asm 2: adds >r2=x4,<r2=x4,<product_lo=x8
adds x4,x4,x8

# qhasm: r3 = r3 + product_hi + carry !
# asm 1: adcs >r3=int64#6,<r3=int64#11,<product_hi=int64#6
# asm 2: adcs >r3=x5,<r3=x10,<product_hi=x5
adcs x5,x10,x5

# qhasm: product_lo = A * B3
# asm 1: mul >product_lo=int64#9,<A=int64#1,<B3=int64#2
# asm 2: mul >product_lo=x8,<A=x0,<B3=x1
mul x8,x0,x1

# qhasm: product_hi = A * B3 (hi)
# asm 1: umulh >product_hi=int64#1,<A=int64#1,<B3=int64#2
# asm 2: umulh >product_hi=x0,<A=x0,<B3=x1
umulh x0,x0,x1

# qhasm: r3 = r3 + product_lo !
# asm 1: adds >r3=int64#2,<r3=int64#6,<product_lo=int64#9
# asm 2: adds >r3=x1,<r3=x5,<product_lo=x8
adds x1,x5,x8

# qhasm: r4 = r4 + product_hi + carry !
# asm 1: adcs >r4=int64#1,<r4=int64#12,<product_hi=int64#1
# asm 2: adcs >r4=x0,<r4=x11,<product_hi=x0
adcs x0,x11,x0

# qhasm: mask_R = - sign_R
# asm 1: neg >mask_R=int64#6,<sign_R=int64#7
# asm 2: neg >mask_R=x5,<sign_R=x6
neg x5,x6

# qhasm: r0 ^= mask_R
# asm 1: eor >r0=int64#8,<r0=int64#8,<mask_R=int64#6
# asm 2: eor >r0=x7,<r0=x7,<mask_R=x5
eor x7,x7,x5

# qhasm: r1 ^= mask_R
# asm 1: eor >r1=int64#4,<r1=int64#4,<mask_R=int64#6
# asm 2: eor >r1=x3,<r1=x3,<mask_R=x5
eor x3,x3,x5

# qhasm: r2 ^= mask_R
# asm 1: eor >r2=int64#5,<r2=int64#5,<mask_R=int64#6
# asm 2: eor >r2=x4,<r2=x4,<mask_R=x5
eor x4,x4,x5

# qhasm: r3 ^= mask_R
# asm 1: eor >r3=int64#2,<r3=int64#2,<mask_R=int64#6
# asm 2: eor >r3=x1,<r3=x1,<mask_R=x5
eor x1,x1,x5

# qhasm: r4 ^= mask_R
# asm 1: eor >r4=int64#1,<r4=int64#1,<mask_R=int64#6
# asm 2: eor >r4=x0,<r4=x0,<mask_R=x5
eor x0,x0,x5

# qhasm: r0 = r0 + sign_R!
# asm 1: adds >r0=int64#6,<r0=int64#8,<sign_R=int64#7
# asm 2: adds >r0=x5,<r0=x7,<sign_R=x6
adds x5,x7,x6

# qhasm: r1 = r1 + carry !
# asm 1: adcs >r1=int64#4,<r1=int64#4, xzr
# asm 2: adcs >r1=x3,<r1=x3, xzr
adcs x3,x3, xzr

# qhasm: r2 = r2 + carry !
# asm 1: adcs >r2=int64#5,<r2=int64#5, xzr
# asm 2: adcs >r2=x4,<r2=x4, xzr
adcs x4,x4, xzr

# qhasm: r3 = r3 + carry !
# asm 1: adcs >r3=int64#2,<r3=int64#2, xzr
# asm 2: adcs >r3=x1,<r3=x1, xzr
adcs x1,x1, xzr

# qhasm: r4 = r4 + carry !
# asm 1: adcs >r4=int64#1,<r4=int64#1, xzr
# asm 2: adcs >r4=x0,<r4=x0, xzr
adcs x0,x0, xzr

# qhasm: mem64[pointer_R] = r0
# asm 1: str <r0=int64#6,[<pointer_R=int64#3]
# asm 2: str <r0=x5,[<pointer_R=x2]
str x5,[x2]

# qhasm: mem64[pointer_R + 8] = r1
# asm 1: str <r1=int64#4,[<pointer_R=int64#3,#8]
# asm 2: str <r1=x3,[<pointer_R=x2,#8]
str x3,[x2,#8]

# qhasm: mem64[pointer_R + 16] = r2
# asm 1: str <r2=int64#5,[<pointer_R=int64#3,#16]
# asm 2: str <r2=x4,[<pointer_R=x2,#16]
str x4,[x2,#16]

# qhasm: mem64[pointer_R + 24] = r3
# asm 1: str <r3=int64#2,[<pointer_R=int64#3,#24]
# asm 2: str <r3=x1,[<pointer_R=x2,#24]
str x1,[x2,#24]

# qhasm: mem64[pointer_R + 32] = r4
# asm 1: str <r4=int64#1,[<pointer_R=int64#3,#32]
# asm 2: str <r4=x0,[<pointer_R=x2,#32]
str x0,[x2,#32]

# qhasm: return
ret
