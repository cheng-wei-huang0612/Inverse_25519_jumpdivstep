
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

# qhasm: int64 pointer_f

# qhasm: int64 pointer_g

# qhasm: int64 pointer_uuvvrrss

# qhasm: input pointer_delta

# qhasm: input pointer_f

# qhasm: input pointer_g

# qhasm: input pointer_uuvvrrss

# qhasm: int64 delta

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 f

# qhasm: int64 g

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss

# qhasm: int64 g0_and_1

# qhasm: int64 c_mask

# qhasm: int64 fuv_new

# qhasm: int64 grs_new

# qhasm: int64 grs_final

# qhasm: int64 neg_fuv

# qhasm: int64 neg_delta

# qhasm: enter j_loop
.align 4
.global _j_loop
.global j_loop
_j_loop:
j_loop:

# qhasm: delta = mem64[pointer_delta]
# asm 1: ldr >delta=int64#1, [<pointer_delta=int64#1]
# asm 2: ldr >delta=x0, [<pointer_delta=x0]
ldr x0, [x0]

# qhasm: f = mem64[pointer_f]
# asm 1: ldr >f=int64#5, [<pointer_f=int64#2]
# asm 2: ldr >f=x4, [<pointer_f=x1]
ldr x4, [x1]

# qhasm: g = mem64[pointer_g]
# asm 1: ldr >g=int64#6, [<pointer_g=int64#3]
# asm 2: ldr >g=x5, [<pointer_g=x2]
ldr x5, [x2]

# qhasm: uu, vv = mem128[pointer_uuvvrrss]
# asm 1: ldp >uu=int64#7, >vv=int64#8, [<pointer_uuvvrrss=int64#4]
# asm 2: ldp >uu=x6, >vv=x7, [<pointer_uuvvrrss=x3]
ldp x6, x7, [x3]

# qhasm: rr, ss = mem128[pointer_uuvvrrss + 16]
# asm 1: ldp >rr=int64#9, >ss=int64#10, [<pointer_uuvvrrss=int64#4, #16]
# asm 2: ldp >rr=x8, >ss=x9, [<pointer_uuvvrrss=x3, #16]
ldp x8, x9, [x3, #16]

# qhasm: int64 2p41

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#11, #1
# asm 2: mov >2p41=x10, #1
mov x10, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#11, <2p41=int64#11, #41
# asm 2: lsl >2p41=x10, <2p41=x10, #41
lsl x10, x10, #41

# qhasm: int64 2p62

# qhasm: 2p62 = 1
# asm 1: mov >2p62=int64#12, #1
# asm 2: mov >2p62=x11, #1
mov x11, #1

# qhasm: 2p62 = 2p62 << 62
# asm 1: lsl >2p62=int64#12, <2p62=int64#12, #62
# asm 2: lsl >2p62=x11, <2p62=x11, #62
lsl x11, x11, #62

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#13, <f=int64#5, #1048575
# asm 2: and >fuv=x12, <f=x4, #1048575
and x12, x4, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#14, <g=int64#6, #1048575
# asm 2: and >grs=x13, <g=x5, #1048575
and x13, x5, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#13,<fuv=int64#13,<2p41=int64#11
# asm 2: sub <fuv=x12,<fuv=x12,<2p41=x10
sub x12,x12,x10

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#14,<grs=int64#14,<2p62=int64#12
# asm 2: sub <grs=x13,<grs=x13,<2p62=x11
sub x13,x13,x11

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#12, <grs=int64#14, #1
# asm 2: and >g0_and_1=x11, <grs=x13, #1
and x11, x13, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#12, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x11, xzr, gt
csel x14, x11, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#14,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x13,<fuv=x12,mi
csel x12,x13,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#14,<neg_fuv=int64#15,<grs=int64#14,mi
# asm 2: csel >grs_new=x13,<neg_fuv=x14,<grs=x13,mi
csel x13,x14,x13,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#12,<g0_and_1=int64#12
# asm 2: neg >grs=x11,<g0_and_1=x11
neg x11,x11

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#12, <grs=int64#12, <fuv=int64#13
# asm 2: and  >grs=x11, <grs=x11, <fuv=x12
and  x11, x11, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#12,<grs=int64#12,<grs_new=int64#14
# asm 2: add <grs=x11,<grs=x11,<grs_new=x13
add x11,x11,x13

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#12, #1
# asm 2: asr >grs=x11, <grs=x11, #1
asr x11, x11, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm:     g0_and_1 = grs & 1
# asm 1: and >g0_and_1=int64#14, <grs=int64#12, #1
# asm 2: and >g0_and_1=x13, <grs=x11, #1
and x13, x11, #1

# qhasm:     delta - 0!
# asm 1: cmp <delta=int64#1,#0
# asm 2: cmp <delta=x0,#0
cmp x0,#0

# qhasm:     c_mask = g0_and_1 if signed> else 0 
# asm 1: csel >c_mask=int64#15, <g0_and_1=int64#14, xzr, gt
# asm 2: csel >c_mask=x14, <g0_and_1=x13, xzr, gt
csel x14, x13, xzr, gt

# qhasm:     c_mask = -c_mask!   
# asm 1: negs >c_mask=int64#15,<c_mask=int64#15
# asm 2: negs >c_mask=x14,<c_mask=x14
negs x14,x14

# qhasm:     free c_mask

# qhasm:     neg_fuv = -fuv
# asm 1: neg >neg_fuv=int64#15,<fuv=int64#13
# asm 2: neg >neg_fuv=x14,<fuv=x12
neg x14,x12

# qhasm:     neg_delta = -delta
# asm 1: neg >neg_delta=int64#16,<delta=int64#1
# asm 2: neg >neg_delta=x15,<delta=x0
neg x15,x0

# qhasm:     fuv = grs if negative else fuv
# asm 1: csel >fuv=int64#13,<grs=int64#12,<fuv=int64#13,mi
# asm 2: csel >fuv=x12,<grs=x11,<fuv=x12,mi
csel x12,x11,x12,mi

# qhasm:     grs_new = neg_fuv if negative else grs 
# asm 1: csel >grs_new=int64#12,<neg_fuv=int64#15,<grs=int64#12,mi
# asm 2: csel >grs_new=x11,<neg_fuv=x14,<grs=x11,mi
csel x11,x14,x11,mi

# qhasm:     delta = neg_delta if negative else delta
# asm 1: csel >delta=int64#1,<neg_delta=int64#16,<delta=int64#1,mi
# asm 2: csel >delta=x0,<neg_delta=x15,<delta=x0,mi
csel x0,x15,x0,mi

# qhasm:     grs = -g0_and_1
# asm 1: neg >grs=int64#14,<g0_and_1=int64#14
# asm 2: neg >grs=x13,<g0_and_1=x13
neg x13,x13

# qhasm:     grs = grs & fuv
# asm 1: and  >grs=int64#14, <grs=int64#14, <fuv=int64#13
# asm 2: and  >grs=x13, <grs=x13, <fuv=x12
and  x13, x13, x12

# qhasm:     grs += grs_new
# asm 1: add <grs=int64#14,<grs=int64#14,<grs_new=int64#12
# asm 2: add <grs=x13,<grs=x13,<grs_new=x11
add x13,x13,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#14, #1
# asm 2: asr >grs=x11, <grs=x13, #1
asr x11, x13, #1

# qhasm:     delta += 2
# asm 1: add <delta=int64#1,<delta=int64#1,#2
# asm 2: add <delta=x0,<delta=x0,#2
add x0,x0,#2

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#1,<fuv=int64#13
# asm 2: mov >v=x0,<fuv=x12
mov x0,x12

# qhasm: v = v + 1048576
# asm 1: add >v=int64#1,<v=int64#1,#1048576
# asm 2: add >v=x0,<v=x0,#1048576
add x0,x0,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#1,<v=int64#1,<2p41=int64#11
# asm 2: add >v=x0,<v=x0,<2p41=x10
add x0,x0,x10

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#1, <v=int64#1, #42
# asm 2: asr >v=x0, <v=x0, #42
asr x0, x0, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#13,<fuv=int64#13,#1048576
# asm 2: add >u=x12,<fuv=x12,#1048576
add x12,x12,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#13, <u=int64#13, #22
# asm 2: lsl >u=x12, <u=x12, #22
lsl x12, x12, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#13, <u=int64#13, #43
# asm 2: asr >u=x12, <u=x12, #43
asr x12, x12, #43

# qhasm: s = grs
# asm 1: mov >s=int64#14,<grs=int64#12
# asm 2: mov >s=x13,<grs=x11
mov x13,x11

# qhasm: s = s + 1048576
# asm 1: add >s=int64#14,<s=int64#14,#1048576
# asm 2: add >s=x13,<s=x13,#1048576
add x13,x13,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#11,<s=int64#14,<2p41=int64#11
# asm 2: add >s=x10,<s=x13,<2p41=x10
add x10,x13,x10

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#11, <s=int64#11, #42
# asm 2: asr >s=x10, <s=x10, #42
asr x10, x10, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#12,<grs=int64#12,#1048576
# asm 2: add >r=x11,<grs=x11,#1048576
add x11,x11,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#12, <r=int64#12, #22
# asm 2: lsl >r=x11, <r=x11, #22
lsl x11, x11, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#12, <r=int64#12, #43
# asm 2: asr >r=x11, <r=x11, #43
asr x11, x11, #43

# qhasm: int64 tmp

# qhasm: int64 prod_lo

# qhasm: int64 prod_hi

# qhasm: int64 new_f

# qhasm: int64 new_g

# qhasm: int64 new_uu

# qhasm: int64 new_vv

# qhasm: int64 new_rr

# qhasm: int64 new_ss

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#14,<u=int64#13,<f=int64#5
# asm 2: mul >prod_lo=x13,<u=x12,<f=x4
mul x13,x12,x4

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#15, <u=int64#13, <f=int64#5
# asm 2: smulh >prod_hi=x14, <u=x12, <f=x4
smulh x14, x12, x4

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#16,<v=int64#1,<g=int64#6
# asm 2: mul >tmp=x15,<v=x0,<g=x5
mul x15,x0,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#14, <prod_lo=int64#14, <tmp=int64#16
# asm 2: adds <prod_lo=x13, <prod_lo=x13, <tmp=x15
adds x13, x13, x15

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#16, <v=int64#1, <g=int64#6
# asm 2: smulh >tmp=x15, <v=x0, <g=x5
smulh x15, x0, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#15,<prod_hi=int64#15,<tmp=int64#16
# asm 2: adc >prod_hi=x14,<prod_hi=x14,<tmp=x15
adc x14,x14,x15

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#14, <prod_lo=int64#14, #20
# asm 2: lsr >prod_lo=x13, <prod_lo=x13, #20
lsr x13, x13, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#15, <prod_hi=int64#15, #44
# asm 2: lsl >prod_hi=x14, <prod_hi=x14, #44
lsl x14, x14, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#14, <prod_lo=int64#14, <prod_hi=int64#15
# asm 2: orr >new_f=x13, <prod_lo=x13, <prod_hi=x14
orr x13, x13, x14

# qhasm: mem64[pointer_f] = new_f
# asm 1: str <new_f=int64#14, [<pointer_f=int64#2]
# asm 2: str <new_f=x13, [<pointer_f=x1]
str x13, [x1]

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#2,<r=int64#12,<f=int64#5
# asm 2: mul >prod_lo=x1,<r=x11,<f=x4
mul x1,x11,x4

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#5, <r=int64#12, <f=int64#5
# asm 2: smulh >prod_hi=x4, <r=x11, <f=x4
smulh x4, x11, x4

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#14,<s=int64#11,<g=int64#6
# asm 2: mul >tmp=x13,<s=x10,<g=x5
mul x13,x10,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#2, <prod_lo=int64#2, <tmp=int64#14
# asm 2: adds <prod_lo=x1, <prod_lo=x1, <tmp=x13
adds x1, x1, x13

# qhasm: tmp = s signed* g (hi)
# asm 1: smulh >tmp=int64#6, <s=int64#11, <g=int64#6
# asm 2: smulh >tmp=x5, <s=x10, <g=x5
smulh x5, x10, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#5,<prod_hi=int64#5,<tmp=int64#6
# asm 2: adc >prod_hi=x4,<prod_hi=x4,<tmp=x5
adc x4,x4,x5

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#2, <prod_lo=int64#2, #20
# asm 2: lsr >prod_lo=x1, <prod_lo=x1, #20
lsr x1, x1, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#5, <prod_hi=int64#5, #44
# asm 2: lsl >prod_hi=x4, <prod_hi=x4, #44
lsl x4, x4, #44

# qhasm: new_g = prod_lo | prod_hi
# asm 1: orr >new_g=int64#2, <prod_lo=int64#2, <prod_hi=int64#5
# asm 2: orr >new_g=x1, <prod_lo=x1, <prod_hi=x4
orr x1, x1, x4

# qhasm: mem64[pointer_g] = new_g
# asm 1: str <new_g=int64#2, [<pointer_g=int64#3]
# asm 2: str <new_g=x1, [<pointer_g=x2]
str x1, [x2]

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#2,<u=int64#13,<uu=int64#7
# asm 2: mul >tmp=x1,<u=x12,<uu=x6
mul x1,x12,x6

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#2, <v=int64#1, <rr=int64#9, <tmp=int64#2
# asm 2: madd >new_uu=x1, <v=x0, <rr=x8, <tmp=x1
madd x1, x0, x8, x1

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#3,<r=int64#12,<uu=int64#7
# asm 2: mul >tmp=x2,<r=x11,<uu=x6
mul x2,x11,x6

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#3, <s=int64#11, <rr=int64#9, <tmp=int64#3
# asm 2: madd >new_rr=x2, <s=x10, <rr=x8, <tmp=x2
madd x2, x10, x8, x2

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#5,<u=int64#13,<vv=int64#8
# asm 2: mul >tmp=x4,<u=x12,<vv=x7
mul x4,x12,x7

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#1, <v=int64#1, <ss=int64#10, <tmp=int64#5
# asm 2: madd >new_vv=x0, <v=x0, <ss=x9, <tmp=x4
madd x0, x0, x9, x4

# qhasm: mem128[pointer_uuvvrrss] = new_uu, new_vv
# asm 1: stp <new_uu=int64#2, <new_vv=int64#1, [<pointer_uuvvrrss=int64#4]
# asm 2: stp <new_uu=x1, <new_vv=x0, [<pointer_uuvvrrss=x3]
stp x1, x0, [x3]

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#1,<r=int64#12,<vv=int64#8
# asm 2: mul >tmp=x0,<r=x11,<vv=x7
mul x0,x11,x7

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#1, <s=int64#11, <ss=int64#10, <tmp=int64#1
# asm 2: madd >new_ss=x0, <s=x10, <ss=x9, <tmp=x0
madd x0, x10, x9, x0

# qhasm: mem128[pointer_uuvvrrss + 16] = new_rr, new_ss
# asm 1: stp <new_rr=int64#3, <new_ss=int64#1, [<pointer_uuvvrrss=int64#4, #16]
# asm 2: stp <new_rr=x2, <new_ss=x0, [<pointer_uuvvrrss=x3, #16]
stp x2, x0, [x3, #16]

# qhasm: return
ret
