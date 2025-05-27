
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

# qhasm: int64 signF

# qhasm: enter final_adjustment
.align 4
.global _final_adjustment
.global final_adjustment
_final_adjustment:
final_adjustment:

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7

# qhasm: int64 V8

# qhasm: V0V1 = mem64[pointer_V]
# asm 1: ldr >V0V1=int64#4, [<pointer_V=int64#3]
# asm 2: ldr >V0V1=x3, [<pointer_V=x2]
ldr x3, [x2]

# qhasm: V2V3 = mem64[pointer_V + 8]
# asm 1: ldr >V2V3=int64#5, [<pointer_V=int64#3, #8]
# asm 2: ldr >V2V3=x4, [<pointer_V=x2, #8]
ldr x4, [x2, #8]

# qhasm: V4V5 = mem64[pointer_V + 16]
# asm 1: ldr >V4V5=int64#6, [<pointer_V=int64#3, #16]
# asm 2: ldr >V4V5=x5, [<pointer_V=x2, #16]
ldr x5, [x2, #16]

# qhasm: V6V7 = mem64[pointer_V + 24]
# asm 1: ldr >V6V7=int64#7, [<pointer_V=int64#3, #24]
# asm 2: ldr >V6V7=x6, [<pointer_V=x2, #24]
ldr x6, [x2, #24]

# qhasm: V8 = mem32[pointer_V + 32]
# asm 1: ldr >V8=int64#3%wregname, [<pointer_V=int64#3, #32]
# asm 2: ldr >V8=w2, [<pointer_V=x2, #32]
ldr w2, [x2, #32]

# qhasm: int64 V0

# qhasm: int64 V1

# qhasm: V0 = V0V1 & 0x3FFFFFFF
# asm 1: and >V0=int64#8, <V0V1=int64#4, #0x3FFFFFFF
# asm 2: and >V0=x7, <V0V1=x3, #0x3FFFFFFF
and x7, x3, #0x3FFFFFFF

# qhasm: V1 = V0V1 unsigned>> 32
# asm 1: lsr >V1=int64#4, <V0V1=int64#4, #32
# asm 2: lsr >V1=x3, <V0V1=x3, #32
lsr x3, x3, #32

# qhasm: int64 V2

# qhasm: int64 V3

# qhasm: V2 = V2V3 & 0x3FFFFFFF
# asm 1: and >V2=int64#9, <V2V3=int64#5, #0x3FFFFFFF
# asm 2: and >V2=x8, <V2V3=x4, #0x3FFFFFFF
and x8, x4, #0x3FFFFFFF

# qhasm: V3 = V2V3 unsigned>> 32
# asm 1: lsr >V3=int64#5, <V2V3=int64#5, #32
# asm 2: lsr >V3=x4, <V2V3=x4, #32
lsr x4, x4, #32

# qhasm: int64 V4

# qhasm: int64 V5

# qhasm: V4 = V4V5 & 0x3FFFFFFF
# asm 1: and >V4=int64#10, <V4V5=int64#6, #0x3FFFFFFF
# asm 2: and >V4=x9, <V4V5=x5, #0x3FFFFFFF
and x9, x5, #0x3FFFFFFF

# qhasm: V5 = V4V5 unsigned>> 32
# asm 1: lsr >V5=int64#6, <V4V5=int64#6, #32
# asm 2: lsr >V5=x5, <V4V5=x5, #32
lsr x5, x5, #32

# qhasm: int64 V6

# qhasm: int64 V7

# qhasm: V6 = V6V7 & 0x3FFFFFFF
# asm 1: and >V6=int64#11, <V6V7=int64#7, #0x3FFFFFFF
# asm 2: and >V6=x10, <V6V7=x6, #0x3FFFFFFF
and x10, x6, #0x3FFFFFFF

# qhasm: V7 = V6V7 unsigned>> 32
# asm 1: lsr >V7=int64#7, <V6V7=int64#7, #32
# asm 2: lsr >V7=x6, <V6V7=x6, #32
lsr x6, x6, #32

# qhasm: int64 inv0

# qhasm: int64 inv1

# qhasm: int64 inv2

# qhasm: int64 inv3

# qhasm: int64 tmp

# qhasm: V1 = V1 << 30
# asm 1: lsl >V1=int64#4, <V1=int64#4, #30
# asm 2: lsl >V1=x3, <V1=x3, #30
lsl x3, x3, #30

# qhasm: inv0 = V0 | V1
# asm 1: orr >inv0=int64#4, <V0=int64#8, <V1=int64#4
# asm 2: orr >inv0=x3, <V0=x7, <V1=x3
orr x3, x7, x3

# qhasm: tmp = V2 << 60
# asm 1: lsl >tmp=int64#8, <V2=int64#9, #60
# asm 2: lsl >tmp=x7, <V2=x8, #60
lsl x7, x8, #60

# qhasm: inv0 |= tmp
# asm 1: orr >inv0=int64#4,<inv0=int64#4,<tmp=int64#8
# asm 2: orr >inv0=x3,<inv0=x3,<tmp=x7
orr x3,x3,x7

# qhasm: V2 = V2 unsigned>> 4
# asm 1: lsr >V2=int64#8, <V2=int64#9, #4
# asm 2: lsr >V2=x7, <V2=x8, #4
lsr x7, x8, #4

# qhasm: V3 = V3 << 26
# asm 1: lsl >V3=int64#5, <V3=int64#5, #26
# asm 2: lsl >V3=x4, <V3=x4, #26
lsl x4, x4, #26

# qhasm: inv1 = V2 | V3 
# asm 1: orr >inv1=int64#5, <V2=int64#8, <V3=int64#5
# asm 2: orr >inv1=x4, <V2=x7, <V3=x4
orr x4, x7, x4

# qhasm: tmp = V4 << 56
# asm 1: lsl >tmp=int64#8, <V4=int64#10, #56
# asm 2: lsl >tmp=x7, <V4=x9, #56
lsl x7, x9, #56

# qhasm: inv1 |= tmp
# asm 1: orr >inv1=int64#5,<inv1=int64#5,<tmp=int64#8
# asm 2: orr >inv1=x4,<inv1=x4,<tmp=x7
orr x4,x4,x7

# qhasm: V4 = V4 unsigned>> 8
# asm 1: lsr >V4=int64#8, <V4=int64#10, #8
# asm 2: lsr >V4=x7, <V4=x9, #8
lsr x7, x9, #8

# qhasm: V5 = V5 << 22
# asm 1: lsl >V5=int64#6, <V5=int64#6, #22
# asm 2: lsl >V5=x5, <V5=x5, #22
lsl x5, x5, #22

# qhasm: inv2 = V4 | V5
# asm 1: orr >inv2=int64#6, <V4=int64#8, <V5=int64#6
# asm 2: orr >inv2=x5, <V4=x7, <V5=x5
orr x5, x7, x5

# qhasm: tmp = V6 << 52
# asm 1: lsl >tmp=int64#8, <V6=int64#11, #52
# asm 2: lsl >tmp=x7, <V6=x10, #52
lsl x7, x10, #52

# qhasm: inv2 |= tmp
# asm 1: orr >inv2=int64#6,<inv2=int64#6,<tmp=int64#8
# asm 2: orr >inv2=x5,<inv2=x5,<tmp=x7
orr x5,x5,x7

# qhasm: V6 = V6 unsigned>> 12
# asm 1: lsr >V6=int64#8, <V6=int64#11, #12
# asm 2: lsr >V6=x7, <V6=x10, #12
lsr x7, x10, #12

# qhasm: V7 = V7 << 18
# asm 1: lsl >V7=int64#7, <V7=int64#7, #18
# asm 2: lsl >V7=x6, <V7=x6, #18
lsl x6, x6, #18

# qhasm: inv3 = V6 | V7
# asm 1: orr >inv3=int64#7, <V6=int64#8, <V7=int64#7
# asm 2: orr >inv3=x6, <V6=x7, <V7=x6
orr x6, x7, x6

# qhasm: tmp = V8 << 48
# asm 1: lsl >tmp=int64#3, <V8=int64#3, #48
# asm 2: lsl >tmp=x2, <V8=x2, #48
lsl x2, x2, #48

# qhasm: inv3 |= tmp
# asm 1: orr >inv3=int64#3,<inv3=int64#7,<tmp=int64#3
# asm 2: orr >inv3=x2,<inv3=x6,<tmp=x2
orr x2,x6,x2

# qhasm: signF =signextend mem32[pointer_F+32]
# asm 1: ldrsw >signF=int64#2, [<pointer_F=int64#2, #32]
# asm 2: ldrsw >signF=x1, [<pointer_F=x1, #32]
ldrsw x1, [x1, #32]

# qhasm: signF = signF - 0!
# asm 1: subs >signF=int64#2,<signF=int64#2,#0
# asm 2: subs >signF=x1,<signF=x1,#0
subs x1,x1,#0

# qhasm: int64 2p64m1

# qhasm: int64 2p63m1

# qhasm: int64 _18

# qhasm: 2p64m1 set to ONES
# asm 1: mvn >2p64m1=int64#7, xzr
# asm 2: mvn >2p64m1=x6, xzr
mvn x6, xzr

# qhasm: 2p63m1 = 2p64m1 unsigned>> 1
# asm 1: lsr >2p63m1=int64#8, <2p64m1=int64#7, #1
# asm 2: lsr >2p63m1=x7, <2p64m1=x6, #1
lsr x7, x6, #1

# qhasm: _18 = 18
# asm 1: mov >_18=int64#9, #18
# asm 2: mov >_18=x8, #18
mov x8, #18

# qhasm: tmp = 2p64m1 - inv0
# asm 1: sub >tmp=int64#7,<2p64m1=int64#7,<inv0=int64#4
# asm 2: sub >tmp=x6,<2p64m1=x6,<inv0=x3
sub x6,x6,x3

# qhasm: inv0 = inv0 if N=0 else ~inv0
# asm 1: csinv >inv0=int64#4, <inv0=int64#4, <inv0=int64#4, pl
# asm 2: csinv >inv0=x3, <inv0=x3, <inv0=x3, pl
csinv x3, x3, x3, pl

# qhasm: inv1 = inv1 if N=0 else ~inv1
# asm 1: csinv >inv1=int64#5, <inv1=int64#5, <inv1=int64#5, pl
# asm 2: csinv >inv1=x4, <inv1=x4, <inv1=x4, pl
csinv x4, x4, x4, pl

# qhasm: inv2 = inv2 if N=0 else ~inv2
# asm 1: csinv >inv2=int64#6, <inv2=int64#6, <inv2=int64#6, pl
# asm 2: csinv >inv2=x5, <inv2=x5, <inv2=x5, pl
csinv x5, x5, x5, pl

# qhasm: tmp = 2p63m1 - inv3
# asm 1: sub >tmp=int64#8,<2p63m1=int64#8,<inv3=int64#3
# asm 2: sub >tmp=x7,<2p63m1=x7,<inv3=x2
sub x7,x7,x2

# qhasm: inv3 = inv3 if N=0 else tmp
# asm 1: csel >inv3=int64#3, <inv3=int64#3, <tmp=int64#8, pl
# asm 2: csel >inv3=x2, <inv3=x2, <tmp=x7, pl
csel x2, x2, x7, pl

# qhasm: tmp = _18 & signF
# asm 1: and  >tmp=int64#2, <_18=int64#9, <signF=int64#2
# asm 2: and  >tmp=x1, <_18=x8, <signF=x1
and  x1, x8, x1

# qhasm: inv0 = inv0 - tmp
# asm 1: sub >inv0=int64#2,<inv0=int64#4,<tmp=int64#2
# asm 2: sub >inv0=x1,<inv0=x3,<tmp=x1
sub x1,x3,x1

# qhasm: mem64[pointer_inv] = inv0
# asm 1: str <inv0=int64#2, [<pointer_inv=int64#1]
# asm 2: str <inv0=x1, [<pointer_inv=x0]
str x1, [x0]

# qhasm: mem64[pointer_inv+8] = inv1
# asm 1: str <inv1=int64#5, [<pointer_inv=int64#1, #8]
# asm 2: str <inv1=x4, [<pointer_inv=x0, #8]
str x4, [x0, #8]

# qhasm: mem64[pointer_inv+16] = inv2
# asm 1: str <inv2=int64#6, [<pointer_inv=int64#1, #16]
# asm 2: str <inv2=x5, [<pointer_inv=x0, #16]
str x5, [x0, #16]

# qhasm: mem64[pointer_inv+24] = inv3
# asm 1: str <inv3=int64#3, [<pointer_inv=int64#1, #24]
# asm 2: str <inv3=x2, [<pointer_inv=x0, #24]
str x2, [x0, #24]

# qhasm: return
ret
