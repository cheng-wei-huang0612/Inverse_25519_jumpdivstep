
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

# qhasm: input pointer_big30

# qhasm: input pointer_uint256

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

# qhasm: int64 tmp60

# qhasm: enter big30_from_uint256
.align 4
.global _big30_from_uint256
.global big30_from_uint256
_big30_from_uint256:
big30_from_uint256:

# qhasm: limb64_0 = mem64[pointer_uint256 + 0]
# asm 1: ldr >limb64_0=int64#3, [<pointer_uint256=int64#2, #0]
# asm 2: ldr >limb64_0=x2, [<pointer_uint256=x1, #0]
ldr x2, [x1, #0]

# qhasm: limb64_1 = mem64[pointer_uint256 + 8]
# asm 1: ldr >limb64_1=int64#4, [<pointer_uint256=int64#2, #8]
# asm 2: ldr >limb64_1=x3, [<pointer_uint256=x1, #8]
ldr x3, [x1, #8]

# qhasm: limb64_2 = mem64[pointer_uint256 + 16]
# asm 1: ldr >limb64_2=int64#5, [<pointer_uint256=int64#2, #16]
# asm 2: ldr >limb64_2=x4, [<pointer_uint256=x1, #16]
ldr x4, [x1, #16]

# qhasm: limb64_3 = mem64[pointer_uint256 + 24]
# asm 1: ldr >limb64_3=int64#2, [<pointer_uint256=int64#2, #24]
# asm 2: ldr >limb64_3=x1, [<pointer_uint256=x1, #24]
ldr x1, [x1, #24]

# qhasm: tmp60 = limb64_0
# asm 1: mov >tmp60=int64#6,<limb64_0=int64#3
# asm 2: mov >tmp60=x5,<limb64_0=x2
mov x5,x2

# qhasm: limb30_0 = tmp60 & 0x3FFFFFFF
# asm 1: and >limb30_0=int64#7, <tmp60=int64#6, #0x3FFFFFFF
# asm 2: and >limb30_0=x6, <tmp60=x5, #0x3FFFFFFF
and x6, x5, #0x3FFFFFFF

# qhasm: tmp60 = tmp60 unsigned>> 30
# asm 1: lsr >tmp60=int64#6, <tmp60=int64#6, #30
# asm 2: lsr >tmp60=x5, <tmp60=x5, #30
lsr x5, x5, #30

# qhasm: limb30_1 = tmp60 & 0x3FFFFFFF
# asm 1: and >limb30_1=int64#6, <tmp60=int64#6, #0x3FFFFFFF
# asm 2: and >limb30_1=x5, <tmp60=x5, #0x3FFFFFFF
and x5, x5, #0x3FFFFFFF

# qhasm: mem32[pointer_big30] = limb30_0
# asm 1: str <limb30_0=int64#7%wregname, [<pointer_big30=int64#1]
# asm 2: str <limb30_0=w6, [<pointer_big30=x0]
str w6, [x0]

# qhasm: mem32[pointer_big30 + 4] = limb30_1
# asm 1: str <limb30_1=int64#6%wregname, [<pointer_big30=int64#1, #4]
# asm 2: str <limb30_1=w5, [<pointer_big30=x0, #4]
str w5, [x0, #4]

# qhasm: tmp60 = limb64_1, limb64_0 >> 60
# asm 1: extr >tmp60=int64#3,<limb64_1=int64#4,<limb64_0=int64#3, #60
# asm 2: extr >tmp60=x2,<limb64_1=x3,<limb64_0=x2, #60
extr x2,x3,x2, #60

# qhasm: limb30_2 = tmp60 & 0x3FFFFFFF
# asm 1: and >limb30_2=int64#6, <tmp60=int64#3, #0x3FFFFFFF
# asm 2: and >limb30_2=x5, <tmp60=x2, #0x3FFFFFFF
and x5, x2, #0x3FFFFFFF

# qhasm: tmp60 = tmp60 unsigned>> 30
# asm 1: lsr >tmp60=int64#3, <tmp60=int64#3, #30
# asm 2: lsr >tmp60=x2, <tmp60=x2, #30
lsr x2, x2, #30

# qhasm: limb30_3 = tmp60 & 0x3FFFFFFF
# asm 1: and >limb30_3=int64#3, <tmp60=int64#3, #0x3FFFFFFF
# asm 2: and >limb30_3=x2, <tmp60=x2, #0x3FFFFFFF
and x2, x2, #0x3FFFFFFF

# qhasm: mem32[pointer_big30 + 8] = limb30_2
# asm 1: str <limb30_2=int64#6%wregname, [<pointer_big30=int64#1, #8]
# asm 2: str <limb30_2=w5, [<pointer_big30=x0, #8]
str w5, [x0, #8]

# qhasm: mem32[pointer_big30 + 12] = limb30_3
# asm 1: str <limb30_3=int64#3%wregname, [<pointer_big30=int64#1, #12]
# asm 2: str <limb30_3=w2, [<pointer_big30=x0, #12]
str w2, [x0, #12]

# qhasm: tmp60 = limb64_2, limb64_1 >> 56
# asm 1: extr >tmp60=int64#3,<limb64_2=int64#5,<limb64_1=int64#4, #56
# asm 2: extr >tmp60=x2,<limb64_2=x4,<limb64_1=x3, #56
extr x2,x4,x3, #56

# qhasm: limb30_4 = tmp60 & 0x3FFFFFFF
# asm 1: and >limb30_4=int64#4, <tmp60=int64#3, #0x3FFFFFFF
# asm 2: and >limb30_4=x3, <tmp60=x2, #0x3FFFFFFF
and x3, x2, #0x3FFFFFFF

# qhasm: tmp60 = tmp60 unsigned>> 30
# asm 1: lsr >tmp60=int64#3, <tmp60=int64#3, #30
# asm 2: lsr >tmp60=x2, <tmp60=x2, #30
lsr x2, x2, #30

# qhasm: limb30_5 = tmp60 & 0x3FFFFFFF
# asm 1: and >limb30_5=int64#3, <tmp60=int64#3, #0x3FFFFFFF
# asm 2: and >limb30_5=x2, <tmp60=x2, #0x3FFFFFFF
and x2, x2, #0x3FFFFFFF

# qhasm: mem32[pointer_big30 + 16] = limb30_4
# asm 1: str <limb30_4=int64#4%wregname, [<pointer_big30=int64#1, #16]
# asm 2: str <limb30_4=w3, [<pointer_big30=x0, #16]
str w3, [x0, #16]

# qhasm: mem32[pointer_big30 + 20] = limb30_5
# asm 1: str <limb30_5=int64#3%wregname, [<pointer_big30=int64#1, #20]
# asm 2: str <limb30_5=w2, [<pointer_big30=x0, #20]
str w2, [x0, #20]

# qhasm: tmp60 = limb64_3, limb64_2 >> 52
# asm 1: extr >tmp60=int64#3,<limb64_3=int64#2,<limb64_2=int64#5, #52
# asm 2: extr >tmp60=x2,<limb64_3=x1,<limb64_2=x4, #52
extr x2,x1,x4, #52

# qhasm: limb30_6 = tmp60 & 0x3FFFFFFF
# asm 1: and >limb30_6=int64#4, <tmp60=int64#3, #0x3FFFFFFF
# asm 2: and >limb30_6=x3, <tmp60=x2, #0x3FFFFFFF
and x3, x2, #0x3FFFFFFF

# qhasm: tmp60 = tmp60 unsigned>> 30
# asm 1: lsr >tmp60=int64#3, <tmp60=int64#3, #30
# asm 2: lsr >tmp60=x2, <tmp60=x2, #30
lsr x2, x2, #30

# qhasm: limb30_7 = tmp60 & 0x3FFFFFFF
# asm 1: and >limb30_7=int64#3, <tmp60=int64#3, #0x3FFFFFFF
# asm 2: and >limb30_7=x2, <tmp60=x2, #0x3FFFFFFF
and x2, x2, #0x3FFFFFFF

# qhasm: limb30_8 = limb64_3 unsigned>> 48
# asm 1: lsr >limb30_8=int64#2, <limb64_3=int64#2, #48
# asm 2: lsr >limb30_8=x1, <limb64_3=x1, #48
lsr x1, x1, #48

# qhasm: mem32[pointer_big30 + 24] = limb30_6
# asm 1: str <limb30_6=int64#4%wregname, [<pointer_big30=int64#1, #24]
# asm 2: str <limb30_6=w3, [<pointer_big30=x0, #24]
str w3, [x0, #24]

# qhasm: mem32[pointer_big30 + 28] = limb30_7
# asm 1: str <limb30_7=int64#3%wregname, [<pointer_big30=int64#1, #28]
# asm 2: str <limb30_7=w2, [<pointer_big30=x0, #28]
str w2, [x0, #28]

# qhasm: mem32[pointer_big30 + 32] = limb30_8
# asm 1: str <limb30_8=int64#2%wregname, [<pointer_big30=int64#1, #32]
# asm 2: str <limb30_8=w1, [<pointer_big30=x0, #32]
str w1, [x0, #32]

# qhasm: return
ret
