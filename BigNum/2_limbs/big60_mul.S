
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

# qhasm: int64 pointerA

# qhasm: int64 pointerB

# qhasm: int64 pointerR

# qhasm: input pointerA

# qhasm: input pointerB

# qhasm: input pointerR

# qhasm: int64 A01

# qhasm: int64 A0

# qhasm: int64 A1

# qhasm: int64 Ahat

# qhasm: int64 B01

# qhasm: int64 B0

# qhasm: int64 B1

# qhasm: int64 Bhat

# qhasm: int64 R01

# qhasm: int64 R23

# qhasm: int64 R0

# qhasm: int64 R1

# qhasm: int64 R2

# qhasm: int64 R3

# qhasm: int64 tmp0

# qhasm: int64 tmp1

# qhasm: int64 tmp1l

# qhasm: int64 tmp1m

# qhasm: int64 tmp1r

# qhasm: int64 carry

# qhasm: int64 MASK

# qhasm: enter big60_mul
.align 4
.global _big60_mul
.global big60_mul
_big60_mul:
big60_mul:

# qhasm: A01 = mem64[pointerA]
# asm 1: ldr >A01=int64#1,[<pointerA=int64#1]
# asm 2: ldr >A01=x0,[<pointerA=x0]
ldr x0,[x0]

# qhasm: B01 = mem64[pointerB]
# asm 1: ldr >B01=int64#2,[<pointerB=int64#2]
# asm 2: ldr >B01=x1,[<pointerB=x1]
ldr x1,[x1]

# qhasm: Ahat = A01 signed>> 63
# asm 1: asr >Ahat=int64#4,<A01=int64#1,#63
# asm 2: asr >Ahat=x3,<A01=x0,#63
asr x3,x0,#63

# qhasm: Bhat = B01 signed>> 63
# asm 1: asr >Bhat=int64#5,<B01=int64#2,#63
# asm 2: asr >Bhat=x4,<B01=x1,#63
asr x4,x1,#63

# qhasm: MASK = 1073741823
# asm 1: mov >MASK=int64#6, #1073741823
# asm 2: mov >MASK=x5, #1073741823
mov x5, #1073741823

# qhasm: A0 = A01 & MASK
# asm 1: and  >A0=int64#7,<A01=int64#1,<MASK=int64#6
# asm 2: and  >A0=x6,<A01=x0,<MASK=x5
and  x6,x0,x5

# qhasm: A1 = A01 unsigned>> 32
# asm 1: lsr >A1=int64#8,<A01=int64#1,#32
# asm 2: lsr >A1=x7,<A01=x0,#32
lsr x7,x0,#32

# qhasm: B0 = B01 & MASK
# asm 1: and  >B0=int64#9,<B01=int64#2,<MASK=int64#6
# asm 2: and  >B0=x8,<B01=x1,<MASK=x5
and  x8,x1,x5

# qhasm: B1 = B01 unsigned>> 32
# asm 1: lsr >B1=int64#10,<B01=int64#2,#32
# asm 2: lsr >B1=x9,<B01=x1,#32
lsr x9,x1,#32

# qhasm: tmp0 = A0 * B0
# asm 1: mul >tmp0=int64#11,<A0=int64#7,<B0=int64#9
# asm 2: mul >tmp0=x10,<A0=x6,<B0=x8
mul x10,x6,x8

# qhasm: R0 = tmp0 & MASK 
# asm 1: and  >R0=int64#12,<tmp0=int64#11,<MASK=int64#6
# asm 2: and  >R0=x11,<tmp0=x10,<MASK=x5
and  x11,x10,x5

# qhasm: tmp0 = tmp0 unsigned>> 30
# asm 1: lsr >tmp0=int64#11,<tmp0=int64#11,#30
# asm 2: lsr >tmp0=x10,<tmp0=x10,#30
lsr x10,x10,#30

# qhasm: tmp0 = A1 * B0 + tmp0
# asm 1: madd >tmp0=int64#9,<A1=int64#8,<B0=int64#9,<tmp0=int64#11
# asm 2: madd >tmp0=x8,<A1=x7,<B0=x8,<tmp0=x10
madd x8,x7,x8,x10

# qhasm: tmp0 = A0 * B1 + tmp0
# asm 1: madd >tmp0=int64#7,<A0=int64#7,<B1=int64#10,<tmp0=int64#9
# asm 2: madd >tmp0=x6,<A0=x6,<B1=x9,<tmp0=x8
madd x6,x6,x9,x8

# qhasm: R1 = tmp0 & MASK
# asm 1: and  >R1=int64#9,<tmp0=int64#7,<MASK=int64#6
# asm 2: and  >R1=x8,<tmp0=x6,<MASK=x5
and  x8,x6,x5

# qhasm: tmp0 = tmp0 unsigned>> 30
# asm 1: lsr >tmp0=int64#7,<tmp0=int64#7,#30
# asm 2: lsr >tmp0=x6,<tmp0=x6,#30
lsr x6,x6,#30

# qhasm: tmp0 = A1 * B1 + tmp0
# asm 1: madd >tmp0=int64#7,<A1=int64#8,<B1=int64#10,<tmp0=int64#7
# asm 2: madd >tmp0=x6,<A1=x7,<B1=x9,<tmp0=x6
madd x6,x7,x9,x6

# qhasm: R2 = tmp0 & MASK
# asm 1: and  >R2=int64#6,<tmp0=int64#7,<MASK=int64#6
# asm 2: and  >R2=x5,<tmp0=x6,<MASK=x5
and  x5,x6,x5

# qhasm: tmp0 = tmp0 unsigned>>30
# asm 1: lsr >tmp0=int64#7,<tmp0=int64#7,#30
# asm 2: lsr >tmp0=x6,<tmp0=x6,#30
lsr x6,x6,#30

# qhasm: R3 = tmp0 & 4294967295
# asm 1: and  >R3=int64#7,<tmp0=int64#7,#4294967295
# asm 2: and  >R3=x6,<tmp0=x6,#4294967295
and  x6,x6,#4294967295

# qhasm: R3 = R3 << 32 
# asm 1: lsl >R3=int64#7,<R3=int64#7,#32
# asm 2: lsl >R3=x6,<R3=x6,#32
lsl x6,x6,#32

# qhasm: R23 = R2 + R3
# asm 1: add >R23=int64#6,<R2=int64#6,<R3=int64#7
# asm 2: add >R23=x5,<R2=x5,<R3=x6
add x5,x5,x6

# qhasm: R1 = R1 << 32 
# asm 1: lsl >R1=int64#7,<R1=int64#9,#32
# asm 2: lsl >R1=x6,<R1=x8,#32
lsl x6,x8,#32

# qhasm: R01 = R0 + R1
# asm 1: add >R01=int64#7,<R0=int64#12,<R1=int64#7
# asm 2: add >R01=x6,<R0=x11,<R1=x6
add x6,x11,x6

# qhasm: tmp1 = Ahat & B01
# asm 1: and  >tmp1=int64#2,<Ahat=int64#4,<B01=int64#2
# asm 2: and  >tmp1=x1,<Ahat=x3,<B01=x1
and  x1,x3,x1

# qhasm: tmp1l = tmp1 & 0xFFFFFFFF00000000
# asm 1: and  >tmp1l=int64#4,<tmp1=int64#2,#0xFFFFFFFF00000000
# asm 2: and  >tmp1l=x3,<tmp1=x1,#0xFFFFFFFF00000000
and  x3,x1,#0xFFFFFFFF00000000

# qhasm: tmp1m = tmp1 & 805306368
# asm 1: and  >tmp1m=int64#8,<tmp1=int64#2,#805306368
# asm 2: and  >tmp1m=x7,<tmp1=x1,#805306368
and  x7,x1,#805306368

# qhasm: tmp1r = tmp1 & 268435455
# asm 1: and  >tmp1r=int64#2,<tmp1=int64#2,#268435455
# asm 2: and  >tmp1r=x1,<tmp1=x1,#268435455
and  x1,x1,#268435455

# qhasm: tmp1l = tmp1l << 2
# asm 1: lsl >tmp1l=int64#4,<tmp1l=int64#4,#2
# asm 2: lsl >tmp1l=x3,<tmp1l=x3,#2
lsl x3,x3,#2

# qhasm: tmp1m = tmp1m << 4
# asm 1: lsl >tmp1m=int64#8,<tmp1m=int64#8,#4
# asm 2: lsl >tmp1m=x7,<tmp1m=x7,#4
lsl x7,x7,#4

# qhasm: tmp1r = tmp1r << 2
# asm 1: lsl >tmp1r=int64#2,<tmp1r=int64#2,#2
# asm 2: lsl >tmp1r=x1,<tmp1r=x1,#2
lsl x1,x1,#2

# qhasm: tmp1 = tmp1l
# asm 1: mov >tmp1=int64#4,<tmp1l=int64#4
# asm 2: mov >tmp1=x3,<tmp1l=x3
mov x3,x3

# qhasm: tmp1 = tmp1 + tmp1m 
# asm 1: add >tmp1=int64#4,<tmp1=int64#4,<tmp1m=int64#8
# asm 2: add >tmp1=x3,<tmp1=x3,<tmp1m=x7
add x3,x3,x7

# qhasm: tmp1 = tmp1 + tmp1r
# asm 1: add >tmp1=int64#2,<tmp1=int64#4,<tmp1r=int64#2
# asm 2: add >tmp1=x1,<tmp1=x3,<tmp1r=x1
add x1,x3,x1

# qhasm: tmp1 = tmp1 ^ 0xFFFFFFFF3FFFFFFF
# asm 1: eor >tmp1=int64#2,<tmp1=int64#2,#0xFFFFFFFF3FFFFFFF
# asm 2: eor >tmp1=x1,<tmp1=x1,#0xFFFFFFFF3FFFFFFF
eor x1,x1,#0xFFFFFFFF3FFFFFFF

# qhasm: tmp1 += 1
# asm 1: add <tmp1=int64#2,<tmp1=int64#2,#1
# asm 2: add <tmp1=x1,<tmp1=x1,#1
add x1,x1,#1

# qhasm: R23 = R23 + tmp1
# asm 1: add >R23=int64#2,<R23=int64#6,<tmp1=int64#2
# asm 2: add >R23=x1,<R23=x5,<tmp1=x1
add x1,x5,x1

# qhasm: tmp1 = Bhat & A01 
# asm 1: and  >tmp1=int64#1,<Bhat=int64#5,<A01=int64#1
# asm 2: and  >tmp1=x0,<Bhat=x4,<A01=x0
and  x0,x4,x0

# qhasm: tmp1l = tmp1 & 0xFFFFFFFF00000000
# asm 1: and  >tmp1l=int64#4,<tmp1=int64#1,#0xFFFFFFFF00000000
# asm 2: and  >tmp1l=x3,<tmp1=x0,#0xFFFFFFFF00000000
and  x3,x0,#0xFFFFFFFF00000000

# qhasm: tmp1m = tmp1 & 805306368
# asm 1: and  >tmp1m=int64#5,<tmp1=int64#1,#805306368
# asm 2: and  >tmp1m=x4,<tmp1=x0,#805306368
and  x4,x0,#805306368

# qhasm: tmp1r = tmp1 & 268435455
# asm 1: and  >tmp1r=int64#1,<tmp1=int64#1,#268435455
# asm 2: and  >tmp1r=x0,<tmp1=x0,#268435455
and  x0,x0,#268435455

# qhasm: tmp1l = tmp1l << 2
# asm 1: lsl >tmp1l=int64#4,<tmp1l=int64#4,#2
# asm 2: lsl >tmp1l=x3,<tmp1l=x3,#2
lsl x3,x3,#2

# qhasm: tmp1m = tmp1m << 4
# asm 1: lsl >tmp1m=int64#5,<tmp1m=int64#5,#4
# asm 2: lsl >tmp1m=x4,<tmp1m=x4,#4
lsl x4,x4,#4

# qhasm: tmp1r = tmp1r << 2
# asm 1: lsl >tmp1r=int64#1,<tmp1r=int64#1,#2
# asm 2: lsl >tmp1r=x0,<tmp1r=x0,#2
lsl x0,x0,#2

# qhasm: tmp1 = tmp1l
# asm 1: mov >tmp1=int64#4,<tmp1l=int64#4
# asm 2: mov >tmp1=x3,<tmp1l=x3
mov x3,x3

# qhasm: tmp1 = tmp1 + tmp1m 
# asm 1: add >tmp1=int64#4,<tmp1=int64#4,<tmp1m=int64#5
# asm 2: add >tmp1=x3,<tmp1=x3,<tmp1m=x4
add x3,x3,x4

# qhasm: tmp1 = tmp1 + tmp1r
# asm 1: add >tmp1=int64#1,<tmp1=int64#4,<tmp1r=int64#1
# asm 2: add >tmp1=x0,<tmp1=x3,<tmp1r=x0
add x0,x3,x0

# qhasm: tmp1 = tmp1 ^ 0xFFFFFFFF3FFFFFFF
# asm 1: eor >tmp1=int64#1,<tmp1=int64#1,#0xFFFFFFFF3FFFFFFF
# asm 2: eor >tmp1=x0,<tmp1=x0,#0xFFFFFFFF3FFFFFFF
eor x0,x0,#0xFFFFFFFF3FFFFFFF

# qhasm: tmp1 += 1
# asm 1: add <tmp1=int64#1,<tmp1=int64#1,#1
# asm 2: add <tmp1=x0,<tmp1=x0,#1
add x0,x0,#1

# qhasm: R23 = R23 + tmp1
# asm 1: add >R23=int64#1,<R23=int64#2,<tmp1=int64#1
# asm 2: add >R23=x0,<R23=x1,<tmp1=x0
add x0,x1,x0

# qhasm: carry = R23 & 0x00000000C0000000
# asm 1: and  >carry=int64#2,<R23=int64#1,#0x00000000C0000000
# asm 2: and  >carry=x1,<R23=x0,#0x00000000C0000000
and  x1,x0,#0x00000000C0000000

# qhasm: R23 = R23 - carry
# asm 1: sub >R23=int64#1,<R23=int64#1,<carry=int64#2
# asm 2: sub >R23=x0,<R23=x0,<carry=x1
sub x0,x0,x1

# qhasm: carry = carry << 2
# asm 1: lsl >carry=int64#2,<carry=int64#2,#2
# asm 2: lsl >carry=x1,<carry=x1,#2
lsl x1,x1,#2

# qhasm: R23 = R23 + carry
# asm 1: add >R23=int64#1,<R23=int64#1,<carry=int64#2
# asm 2: add >R23=x0,<R23=x0,<carry=x1
add x0,x0,x1

# qhasm: mem64[pointerR] = R01
# asm 1: str <R01=int64#7,[<pointerR=int64#3]
# asm 2: str <R01=x6,[<pointerR=x2]
str x6,[x2]

# qhasm: mem64[pointerR + 8] = R23
# asm 1: str <R23=int64#1,[<pointerR=int64#3,#8]
# asm 2: str <R23=x0,[<pointerR=x2,#8]
str x0,[x2,#8]

# qhasm: return
ret
