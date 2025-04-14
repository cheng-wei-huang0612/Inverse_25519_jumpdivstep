
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

# qhasm: int64 cond

# qhasm: int64 delta_tmp

# qhasm: int64 c_mask

# qhasm: int64 n_mask

# qhasm: int64 fuv_new

# qhasm: int64 grs_new

# qhasm: int64 tmp

# qhasm: int64 neg_fuv

# qhasm: int64 neg_delta

# qhasm: int64 delta_swapper

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
# asm 1: and  >g0_and_1=int64#7, <grs=int64#6, #1
# asm 2: and  >g0_and_1=x6, <grs=x5, #1
and  x6, x5, #1

# qhasm: delta_tmp = delta - 1
# asm 1: sub >delta_tmp=int64#8,<delta=int64#4,#1
# asm 2: sub >delta_tmp=x7,<delta=x3,#1
sub x7,x3,#1

# qhasm: delta_tmp = delta_tmp signed>> 63
# asm 1: asr >delta_tmp=int64#8,<delta_tmp=int64#8,#63
# asm 2: asr >delta_tmp=x7,<delta_tmp=x7,#63
asr x7,x7,#63

# qhasm: delta_tmp = ~delta_tmp
# asm 1: mvn >delta_tmp=int64#8, <delta_tmp=int64#8
# asm 2: mvn >delta_tmp=x7, <delta_tmp=x7
mvn x7, x7

# qhasm: cond = delta_tmp & g0_and_1
# asm 1: and  >cond=int64#8, <delta_tmp=int64#8, <g0_and_1=int64#7
# asm 2: and  >cond=x7, <delta_tmp=x7, <g0_and_1=x6
and  x7, x7, x6

# qhasm: c_mask = -cond
# asm 1: neg >c_mask=int64#8,<cond=int64#8
# asm 2: neg >c_mask=x7,<cond=x7
neg x7,x7

# qhasm: n_mask = ~c_mask
# asm 1: mvn >n_mask=int64#9, <c_mask=int64#8
# asm 2: mvn >n_mask=x8, <c_mask=x7
mvn x8, x7

# qhasm: fuv_new = n_mask & fuv
# asm 1: and  >fuv_new=int64#10, <n_mask=int64#9, <fuv=int64#5
# asm 2: and  >fuv_new=x9, <n_mask=x8, <fuv=x4
and  x9, x8, x4

# qhasm: tmp = c_mask & grs
# asm 1: and  >tmp=int64#11, <c_mask=int64#8, <grs=int64#6
# asm 2: and  >tmp=x10, <c_mask=x7, <grs=x5
and  x10, x7, x5

# qhasm: fuv_new = fuv_new ^ tmp
# asm 1: eor >fuv_new=int64#10,<fuv_new=int64#10,<tmp=int64#11
# asm 2: eor >fuv_new=x9,<fuv_new=x9,<tmp=x10
eor x9,x9,x10

# qhasm: neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#5,<fuv=int64#5
# asm 2: neg >neg_fuv=x4,<fuv=x4
neg x4,x4

# qhasm: grs_new = c_mask & neg_fuv
# asm 1: and  >grs_new=int64#5, <c_mask=int64#8, <neg_fuv=int64#5
# asm 2: and  >grs_new=x4, <c_mask=x7, <neg_fuv=x4
and  x4, x7, x4

# qhasm: tmp = n_mask & grs
# asm 1: and  >tmp=int64#6, <n_mask=int64#9, <grs=int64#6
# asm 2: and  >tmp=x5, <n_mask=x8, <grs=x5
and  x5, x8, x5

# qhasm: grs_new = grs_new ^ tmp
# asm 1: eor >grs_new=int64#5,<grs_new=int64#5,<tmp=int64#6
# asm 2: eor >grs_new=x4,<grs_new=x4,<tmp=x5
eor x4,x4,x5

# qhasm: fuv = fuv_new
# asm 1: mov >fuv=int64#6,<fuv_new=int64#10
# asm 2: mov >fuv=x5,<fuv_new=x9
mov x5,x9

# qhasm: grs = grs_new
# asm 1: mov >grs=int64#5,<grs_new=int64#5
# asm 2: mov >grs=x4,<grs_new=x4
mov x4,x4

# qhasm: neg_delta = -delta
# asm 1: neg >neg_delta=int64#9,<delta=int64#4
# asm 2: neg >neg_delta=x8,<delta=x3
neg x8,x3

# qhasm: delta_swapper = delta ^ neg_delta
# asm 1: eor >delta_swapper=int64#9,<delta=int64#4,<neg_delta=int64#9
# asm 2: eor >delta_swapper=x8,<delta=x3,<neg_delta=x8
eor x8,x3,x8

# qhasm: tmp = c_mask & delta_swapper
# asm 1: and  >tmp=int64#8, <c_mask=int64#8, <delta_swapper=int64#9
# asm 2: and  >tmp=x7, <c_mask=x7, <delta_swapper=x8
and  x7, x7, x8

# qhasm: delta ^= tmp
# asm 1: eor >delta=int64#4,<delta=int64#4,<tmp=int64#8
# asm 2: eor >delta=x3,<delta=x3,<tmp=x7
eor x3,x3,x7

# qhasm: grs_new = -g0_and_1
# asm 1: neg >grs_new=int64#7,<g0_and_1=int64#7
# asm 2: neg >grs_new=x6,<g0_and_1=x6
neg x6,x6

# qhasm: grs_new = grs_new & fuv
# asm 1: and  >grs_new=int64#7, <grs_new=int64#7, <fuv=int64#6
# asm 2: and  >grs_new=x6, <grs_new=x6, <fuv=x5
and  x6, x6, x5

# qhasm: grs_new += grs
# asm 1: add <grs_new=int64#7,<grs_new=int64#7,<grs=int64#5
# asm 2: add <grs_new=x6,<grs_new=x6,<grs=x4
add x6,x6,x4

# qhasm: grs_new = grs_new signed>> 1
# asm 1: asr >grs_new=int64#5,<grs_new=int64#7,#1
# asm 2: asr >grs_new=x4,<grs_new=x6,#1
asr x4,x6,#1

# qhasm: delta += 2
# asm 1: add <delta=int64#4,<delta=int64#4,#2
# asm 2: add <delta=x3,<delta=x3,#2
add x3,x3,#2

# qhasm: mem64[pointer_delta] = delta
# asm 1: str <delta=int64#4, [<pointer_delta=int64#1]
# asm 2: str <delta=x3, [<pointer_delta=x0]
str x3, [x0]

# qhasm: mem64[pointer_fuv] = fuv
# asm 1: str <fuv=int64#6, [<pointer_fuv=int64#2]
# asm 2: str <fuv=x5, [<pointer_fuv=x1]
str x5, [x1]

# qhasm: mem64[pointer_grs] = grs_new
# asm 1: str <grs_new=int64#5, [<pointer_grs=int64#3]
# asm 2: str <grs_new=x4, [<pointer_grs=x2]
str x4, [x2]

# qhasm: return
ret
