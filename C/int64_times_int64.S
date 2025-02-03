
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

# qhasm: int64 B

# qhasm: int64 sign_A

# qhasm: int64 sign_B

# qhasm: int64 mask_A

# qhasm: int64 mask_B

# qhasm: int64 R0

# qhasm: int64 R1

# qhasm: int64 sign_R

# qhasm: int64 mask_R

# qhasm: int64 product_lo

# qhasm: int64 product_hi

# qhasm: enter int64_times_int64
.align 4
.global _int64_times_int64
.global int64_times_int64
_int64_times_int64:
int64_times_int64:

# qhasm: A = mem64[pointer_A]
# asm 1: ldr >A=int64#1,[<pointer_A=int64#1]
# asm 2: ldr >A=x0,[<pointer_A=x0]
ldr x0,[x0]

# qhasm: B = mem64[pointer_B]
# asm 1: ldr >B=int64#2,[<pointer_B=int64#2]
# asm 2: ldr >B=x1,[<pointer_B=x1]
ldr x1,[x1]

# qhasm: sign_A = A  >> 63
# asm 1: lsr >sign_A=int64#4,<A=int64#1,#63
# asm 2: lsr >sign_A=x3,<A=x0,#63
lsr x3,x0,#63

# qhasm: sign_B = B >> 63
# asm 1: lsr >sign_B=int64#5,<B=int64#2,#63
# asm 2: lsr >sign_B=x4,<B=x1,#63
lsr x4,x1,#63

# qhasm: mask_A = - sign_A
# asm 1: neg >mask_A=int64#6,<sign_A=int64#4
# asm 2: neg >mask_A=x5,<sign_A=x3
neg x5,x3

# qhasm: A ^= mask_A
# asm 1: eor >A=int64#1,<A=int64#1,<mask_A=int64#6
# asm 2: eor >A=x0,<A=x0,<mask_A=x5
eor x0,x0,x5

# qhasm: A = A + sign_A
# asm 1: add >A=int64#1,<A=int64#1,<sign_A=int64#4
# asm 2: add >A=x0,<A=x0,<sign_A=x3
add x0,x0,x3

# qhasm: mask_B = - sign_B
# asm 1: neg >mask_B=int64#6,<sign_B=int64#5
# asm 2: neg >mask_B=x5,<sign_B=x4
neg x5,x4

# qhasm: B ^= mask_B
# asm 1: eor >B=int64#2,<B=int64#2,<mask_B=int64#6
# asm 2: eor >B=x1,<B=x1,<mask_B=x5
eor x1,x1,x5

# qhasm: B = B + sign_B 
# asm 1: add >B=int64#2,<B=int64#2,<sign_B=int64#5
# asm 2: add >B=x1,<B=x1,<sign_B=x4
add x1,x1,x4

# qhasm: sign_R = sign_A ^ sign_B
# asm 1: eor >sign_R=int64#4,<sign_A=int64#4,<sign_B=int64#5
# asm 2: eor >sign_R=x3,<sign_A=x3,<sign_B=x4
eor x3,x3,x4

# qhasm: R0 = 0
# asm 1: mov >R0=int64#5, #0
# asm 2: mov >R0=x4, #0
mov x4, #0

# qhasm: R1 = 0
# asm 1: mov >R1=int64#6, #0
# asm 2: mov >R1=x5, #0
mov x5, #0

# qhasm: R0 = A * B
# asm 1: mul >R0=int64#7,<A=int64#1,<B=int64#2
# asm 2: mul >R0=x6,<A=x0,<B=x1
mul x6,x0,x1

# qhasm: R1 = A * B (hi)
# asm 1: umulh >R1=int64#1,<A=int64#1,<B=int64#2
# asm 2: umulh >R1=x0,<A=x0,<B=x1
umulh x0,x0,x1

# qhasm: mask_R = - sign_R
# asm 1: neg >mask_R=int64#2,<sign_R=int64#4
# asm 2: neg >mask_R=x1,<sign_R=x3
neg x1,x3

# qhasm: R0 ^= mask_R
# asm 1: eor >R0=int64#7,<R0=int64#7,<mask_R=int64#2
# asm 2: eor >R0=x6,<R0=x6,<mask_R=x1
eor x6,x6,x1

# qhasm: R1 ^= mask_R
# asm 1: eor >R1=int64#1,<R1=int64#1,<mask_R=int64#2
# asm 2: eor >R1=x0,<R1=x0,<mask_R=x1
eor x0,x0,x1

# qhasm: R0 = R0 + sign_R!
# asm 1: adds >R0=int64#2,<R0=int64#7,<sign_R=int64#4
# asm 2: adds >R0=x1,<R0=x6,<sign_R=x3
adds x1,x6,x3

# qhasm: R1 = R1 + carry !
# asm 1: adcs >R1=int64#1,<R1=int64#1, xzr
# asm 2: adcs >R1=x0,<R1=x0, xzr
adcs x0,x0, xzr

# qhasm: mem64[pointer_R] = R0
# asm 1: str <R0=int64#2,[<pointer_R=int64#3]
# asm 2: str <R0=x1,[<pointer_R=x2]
str x1,[x2]

# qhasm: mem64[pointer_R + 8] = R1
# asm 1: str <R1=int64#1,[<pointer_R=int64#3,#8]
# asm 2: str <R1=x0,[<pointer_R=x2,#8]
str x0,[x2,#8]

# qhasm: return
ret
