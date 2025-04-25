
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

# qhasm: int64 oldG

# qhasm: int64 h

# qhasm: int64 z

# qhasm: int64 minus_one

# qhasm: int64 delta_new

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

# qhasm: minus_one = 1
# asm 1: mov >minus_one=int64#7, #1
# asm 2: mov >minus_one=x6, #1
mov x6, #1

# qhasm: minus_one = -minus_one
# asm 1: neg >minus_one=int64#7,<minus_one=int64#7
# asm 2: neg >minus_one=x6,<minus_one=x6
neg x6,x6

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#8,<grs=int64#6
# asm 2: mov >oldG=x7,<grs=x5
mov x7,x5

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: add >h=x8,<grs=x5,<fuv=x4
add x8,x5,x4

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#7,<delta=int64#4,<minus_one=int64#7,ne
# asm 2: csel >z=x6,<delta=x3,<minus_one=x6,ne
csel x6,x3,x6,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#9,<grs=int64#6,<h=int64#9,eq
# asm 2: csel >h=x8,<grs=x5,<h=x8,eq
csel x8,x5,x8,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#10,<delta=int64#4,#1
# asm 2: add >delta_new=x9,<delta=x3,#1
add x9,x3,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#6,<grs=int64#6,<fuv=int64#5
# asm 2: sub <grs=x5,<grs=x5,<fuv=x4
sub x5,x5,x4

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     h = h signed>> 1
# asm 1: asr >h=int64#9, <h=int64#9, #1
# asm 2: asr >h=x8, <h=x8, #1
asr x8, x8, #1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#4,<delta=int64#4
# asm 2: neg >delta=x3,<delta=x3
neg x3,x3

# qhasm:     z - 0
# asm 1: cmp <z=int64#7,#0
# asm 2: cmp <z=x6,#0
cmp x6,#0

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#5, <oldG=int64#8, <fuv=int64#5, ge
# asm 2: csel >fuv=x4, <oldG=x7, <fuv=x4, ge
csel x4, x7, x4, ge

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#6, <h=int64#9, <grs=int64#6, lt
# asm 2: csel >grs=x5, <h=x8, <grs=x5, lt
csel x5, x8, x5, lt

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#4, <delta_new=int64#10, <delta=int64#4, lt
# asm 2: csel >delta=x3, <delta_new=x9, <delta=x3, lt
csel x3, x9, x3, lt

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
