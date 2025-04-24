
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

# qhasm: int64 pointer_delta

# qhasm: int64 pointer_fuv

# qhasm: int64 pointer_grs

# qhasm: input pointer_delta

# qhasm: input pointer_fuv

# qhasm: input pointer_grs

# qhasm: int64 delta

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 g0_and_1

# qhasm: int64 c_mask

# qhasm: int64 fuv_new

# qhasm: int64 grs_new

# qhasm: int64 grs_final

# qhasm: int64 neg_fuv

# qhasm: int64 neg_delta

# qhasm: enter divstep
.align 4
.global _divstep
.global divstep
_divstep:
divstep:

# qhasm: delta = mem64[pointer_delta]
# asm 1: ldr >delta=int64#4, [<pointer_delta=int64#1]
# asm 2: ldr >delta=x3, [<pointer_delta=x0]
ldr x3, [x0]

# qhasm: fuv = mem64[pointer_fuv]
# asm 1: ldr >fuv=int64#5, [<pointer_fuv=int64#2]
# asm 2: ldr >fuv=x4, [<pointer_fuv=x1]
ldr x4, [x1]

# qhasm: grs = mem64[pointer_grs]
# asm 1: ldr >grs=int64#6, [<pointer_grs=int64#3]
# asm 2: ldr >grs=x5, [<pointer_grs=x2]
ldr x5, [x2]

# qhasm: g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#7, <grs=int64#6, #1
# asm 2: and >g0_and_1=x6, <grs=x5, #1
and x6, x5, #1

# qhasm: delta - 0!
# asm 1: cmp <delta=int64#4,#0
# asm 2: cmp <delta=x3,#0
cmp x3,#0

# qhasm: c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#8, <g0_and_1=int64#7, xzr, gt
# asm 2: csel >c_mask=x7, <g0_and_1=x6, xzr, gt
csel x7, x6, xzr, gt

# qhasm: c_mask = -c_mask!
# asm 1: negs >c_mask=int64#8,<c_mask=int64#8
# asm 2: negs >c_mask=x7,<c_mask=x7
negs x7,x7

# qhasm: neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#9,<fuv=int64#5
# asm 2: neg >neg_fuv=x8,<fuv=x4
neg x8,x4

# qhasm: neg_delta = -delta
# asm 1: neg >neg_delta=int64#10,<delta=int64#4
# asm 2: neg >neg_delta=x9,<delta=x3
neg x9,x3

# qhasm: fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#5,<grs=int64#6,<fuv=int64#5,mi
# asm 2: csel >fuv=x4,<grs=x5,<fuv=x4,mi
csel x4,x5,x4,mi

# qhasm: grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#6,<neg_fuv=int64#9,<grs=int64#6,mi
# asm 2: csel >grs_new=x5,<neg_fuv=x8,<grs=x5,mi
csel x5,x8,x5,mi

# qhasm: delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#4,<neg_delta=int64#10,<delta=int64#4,mi
# asm 2: csel >delta=x3,<neg_delta=x9,<delta=x3,mi
csel x3,x9,x3,mi

# qhasm: grs = -g0_and_1
# asm 1: neg >grs=int64#7,<g0_and_1=int64#7
# asm 2: neg >grs=x6,<g0_and_1=x6
neg x6,x6

# qhasm: grs = grs & fuv
# asm 1: and  >grs=int64#7, <grs=int64#7, <fuv=int64#5
# asm 2: and  >grs=x6, <grs=x6, <fuv=x4
and  x6, x6, x4

# qhasm: grs += grs_new
# asm 1: add <grs=int64#7,<grs=int64#7,<grs_new=int64#6
# asm 2: add <grs=x6,<grs=x6,<grs_new=x5
add x6,x6,x5

# qhasm: grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#7, #1
# asm 2: asr >grs=x5, <grs=x6, #1
asr x5, x6, #1

# qhasm: delta += 2
# asm 1: add <delta=int64#4,<delta=int64#4,#2
# asm 2: add <delta=x3,<delta=x3,#2
add x3,x3,#2

# qhasm: mem64[pointer_delta] = delta
# asm 1: str <delta=int64#4, [<pointer_delta=int64#1]
# asm 2: str <delta=x3, [<pointer_delta=x0]
str x3, [x0]

# qhasm: mem64[pointer_fuv] = fuv
# asm 1: str <fuv=int64#5, [<pointer_fuv=int64#2]
# asm 2: str <fuv=x4, [<pointer_fuv=x1]
str x4, [x1]

# qhasm: mem64[pointer_grs] = grs
# asm 1: str <grs=int64#6, [<pointer_grs=int64#3]
# asm 2: str <grs=x5, [<pointer_grs=x2]
str x5, [x2]

# qhasm: return
ret
