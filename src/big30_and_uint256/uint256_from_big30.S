
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

# qhasm: int64 pointer_uint256

# qhasm: int64 pointer_big30

# qhasm: input pointer_uint256

# qhasm: input pointer_big30

# qhasm: int64 limb64_0

# qhasm: int64 limb64_1

# qhasm: int64 limb64_2

# qhasm: int64 limb64_3

# qhasm: int64 limb30_0

# qhasm: int64 limb30_1

# qhasm: int64 limb30_2

# qhasm: int64 limb30_3

# qhasm: int64 limb30_4

# qhasm: int64 limb30_5

# qhasm: int64 limb30_6

# qhasm: int64 limb30_7

# qhasm: int64 limb30_8

# qhasm: int64 tmp

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

# qhasm: enter uint256_from_big30
.align 4
.global _uint256_from_big30
.global uint256_from_big30
_uint256_from_big30:
uint256_from_big30:

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

# qhasm: limb30_0 = mem32[pointer_big30]
# asm 1: ldr >limb30_0=int64#3%wregname, [<pointer_big30=int64#2]
# asm 2: ldr >limb30_0=w2, [<pointer_big30=x1]
ldr w2, [x1]

# qhasm: limb30_1 = mem32[pointer_big30 + 4]
# asm 1: ldr >limb30_1=int64#4%wregname, [<pointer_big30=int64#2, 4]
# asm 2: ldr >limb30_1=w3, [<pointer_big30=x1, 4]
ldr w3, [x1, 4]

# qhasm: limb30_2 = mem32[pointer_big30 + 8]
# asm 1: ldr >limb30_2=int64#5%wregname, [<pointer_big30=int64#2, #8]
# asm 2: ldr >limb30_2=w4, [<pointer_big30=x1, #8]
ldr w4, [x1, #8]

# qhasm: limb30_3 = mem32[pointer_big30 + 12]
# asm 1: ldr >limb30_3=int64#6%wregname, [<pointer_big30=int64#2, #12]
# asm 2: ldr >limb30_3=w5, [<pointer_big30=x1, #12]
ldr w5, [x1, #12]

# qhasm: limb30_4 = mem32[pointer_big30 + 16]
# asm 1: ldr >limb30_4=int64#7%wregname, [<pointer_big30=int64#2, #16]
# asm 2: ldr >limb30_4=w6, [<pointer_big30=x1, #16]
ldr w6, [x1, #16]

# qhasm: limb30_5 = mem32[pointer_big30 + 20]
# asm 1: ldr >limb30_5=int64#8%wregname, [<pointer_big30=int64#2, #20]
# asm 2: ldr >limb30_5=w7, [<pointer_big30=x1, #20]
ldr w7, [x1, #20]

# qhasm: limb30_6 = mem32[pointer_big30 + 24]
# asm 1: ldr >limb30_6=int64#9%wregname, [<pointer_big30=int64#2, #24]
# asm 2: ldr >limb30_6=w8, [<pointer_big30=x1, #24]
ldr w8, [x1, #24]

# qhasm: limb30_7 = mem32[pointer_big30 + 28]
# asm 1: ldr >limb30_7=int64#10%wregname, [<pointer_big30=int64#2, #28]
# asm 2: ldr >limb30_7=w9, [<pointer_big30=x1, #28]
ldr w9, [x1, #28]

# qhasm: limb30_8 = mem32[pointer_big30 + 32]
# asm 1: ldr >limb30_8=int64#2%wregname, [<pointer_big30=int64#2, #32]
# asm 2: ldr >limb30_8=w1, [<pointer_big30=x1, #32]
ldr w1, [x1, #32]

# qhasm: limb30_1 = limb30_1 << 30
# asm 1: lsl >limb30_1=int64#4, <limb30_1=int64#4, #30
# asm 2: lsl >limb30_1=x3, <limb30_1=x3, #30
lsl x3, x3, #30

# qhasm: tmp = limb30_2 << 60
# asm 1: lsl >tmp=int64#11, <limb30_2=int64#5, #60
# asm 2: lsl >tmp=x10, <limb30_2=x4, #60
lsl x10, x4, #60

# qhasm: limb64_0 = limb30_1 | limb30_0
# asm 1: orr >limb64_0=int64#3, <limb30_1=int64#4, <limb30_0=int64#3
# asm 2: orr >limb64_0=x2, <limb30_1=x3, <limb30_0=x2
orr x2, x3, x2

# qhasm: limb64_0 = limb64_0 | tmp
# asm 1: orr >limb64_0=int64#3, <limb64_0=int64#3, <tmp=int64#11
# asm 2: orr >limb64_0=x2, <limb64_0=x2, <tmp=x10
orr x2, x2, x10

# qhasm: limb30_2 = limb30_2 (unsigned)>> 4
# asm 1: lsr >limb30_2=int64#4, <limb30_2=int64#5, #4
# asm 2: lsr >limb30_2=x3, <limb30_2=x4, #4
lsr x3, x4, #4

# qhasm: limb30_3 = limb30_3 << 26
# asm 1: lsl >limb30_3=int64#5, <limb30_3=int64#6, #26
# asm 2: lsl >limb30_3=x4, <limb30_3=x5, #26
lsl x4, x5, #26

# qhasm: tmp = limb30_4 << 56
# asm 1: lsl >tmp=int64#6, <limb30_4=int64#7, #56
# asm 2: lsl >tmp=x5, <limb30_4=x6, #56
lsl x5, x6, #56

# qhasm: limb64_1 = limb30_2 | limb30_3
# asm 1: orr >limb64_1=int64#4, <limb30_2=int64#4, <limb30_3=int64#5
# asm 2: orr >limb64_1=x3, <limb30_2=x3, <limb30_3=x4
orr x3, x3, x4

# qhasm: limb64_1 = limb64_1 | tmp
# asm 1: orr >limb64_1=int64#4, <limb64_1=int64#4, <tmp=int64#6
# asm 2: orr >limb64_1=x3, <limb64_1=x3, <tmp=x5
orr x3, x3, x5

# qhasm: limb30_4 = limb30_4 (unsigned)>> 8
# asm 1: lsr >limb30_4=int64#5, <limb30_4=int64#7, #8
# asm 2: lsr >limb30_4=x4, <limb30_4=x6, #8
lsr x4, x6, #8

# qhasm: limb30_5 = limb30_5 << 22
# asm 1: lsl >limb30_5=int64#6, <limb30_5=int64#8, #22
# asm 2: lsl >limb30_5=x5, <limb30_5=x7, #22
lsl x5, x7, #22

# qhasm: tmp = limb30_6 << 52
# asm 1: lsl >tmp=int64#7, <limb30_6=int64#9, #52
# asm 2: lsl >tmp=x6, <limb30_6=x8, #52
lsl x6, x8, #52

# qhasm: limb64_2 = limb30_4 | limb30_5
# asm 1: orr >limb64_2=int64#5, <limb30_4=int64#5, <limb30_5=int64#6
# asm 2: orr >limb64_2=x4, <limb30_4=x4, <limb30_5=x5
orr x4, x4, x5

# qhasm: limb64_2 = limb64_2 | tmp
# asm 1: orr >limb64_2=int64#5, <limb64_2=int64#5, <tmp=int64#7
# asm 2: orr >limb64_2=x4, <limb64_2=x4, <tmp=x6
orr x4, x4, x6

# qhasm: limb30_6 = limb30_6 (unsigned)>> 12
# asm 1: lsr >limb30_6=int64#6, <limb30_6=int64#9, #12
# asm 2: lsr >limb30_6=x5, <limb30_6=x8, #12
lsr x5, x8, #12

# qhasm: limb30_7 = limb30_7 << 18
# asm 1: lsl >limb30_7=int64#7, <limb30_7=int64#10, #18
# asm 2: lsl >limb30_7=x6, <limb30_7=x9, #18
lsl x6, x9, #18

# qhasm: tmp = limb30_8 << 48
# asm 1: lsl >tmp=int64#2, <limb30_8=int64#2, #48
# asm 2: lsl >tmp=x1, <limb30_8=x1, #48
lsl x1, x1, #48

# qhasm: limb64_3 = limb30_6 | limb30_7
# asm 1: orr >limb64_3=int64#6, <limb30_6=int64#6, <limb30_7=int64#7
# asm 2: orr >limb64_3=x5, <limb30_6=x5, <limb30_7=x6
orr x5, x5, x6

# qhasm: limb64_3 = limb64_3 | tmp
# asm 1: orr >limb64_3=int64#2, <limb64_3=int64#6, <tmp=int64#2
# asm 2: orr >limb64_3=x1, <limb64_3=x5, <tmp=x1
orr x1, x5, x1

# qhasm: mem64[pointer_uint256] = limb64_0
# asm 1: str <limb64_0=int64#3, [<pointer_uint256=int64#1]
# asm 2: str <limb64_0=x2, [<pointer_uint256=x0]
str x2, [x0]

# qhasm: mem64[pointer_uint256 + 8] = limb64_1
# asm 1: str <limb64_1=int64#4, [<pointer_uint256=int64#1, #8]
# asm 2: str <limb64_1=x3, [<pointer_uint256=x0, #8]
str x3, [x0, #8]

# qhasm: mem64[pointer_uint256 + 16] = limb64_2
# asm 1: str <limb64_2=int64#5, [<pointer_uint256=int64#1, #16]
# asm 2: str <limb64_2=x4, [<pointer_uint256=x0, #16]
str x4, [x0, #16]

# qhasm: mem64[pointer_uint256 + 24] = limb64_3
# asm 1: str <limb64_3=int64#2, [<pointer_uint256=int64#1, #24]
# asm 2: str <limb64_3=x1, [<pointer_uint256=x0, #24]
str x1, [x0, #24]

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
