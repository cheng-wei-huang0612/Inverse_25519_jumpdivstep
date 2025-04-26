
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

# qhasm: enter j_loop_final
.align 4
.global _j_loop_final
.global j_loop_final
_j_loop_final:
j_loop_final:

# qhasm: delta = mem64[pointer_delta]
# asm 1: ldr >delta=int64#1, [<pointer_delta=int64#1]
# asm 2: ldr >delta=x0, [<pointer_delta=x0]
ldr x0, [x0]

# qhasm: f = mem64[pointer_f]
# asm 1: ldr >f=int64#2, [<pointer_f=int64#2]
# asm 2: ldr >f=x1, [<pointer_f=x1]
ldr x1, [x1]

# qhasm: g = mem64[pointer_g]
# asm 1: ldr >g=int64#3, [<pointer_g=int64#3]
# asm 2: ldr >g=x2, [<pointer_g=x2]
ldr x2, [x2]

# qhasm: uu, vv = mem128[pointer_uuvvrrss]
# asm 1: ldp >uu=int64#5, >vv=int64#6, [<pointer_uuvvrrss=int64#4]
# asm 2: ldp >uu=x4, >vv=x5, [<pointer_uuvvrrss=x3]
ldp x4, x5, [x3]

# qhasm: rr, ss = mem128[pointer_uuvvrrss + 16]
# asm 1: ldp >rr=int64#7, >ss=int64#8, [<pointer_uuvvrrss=int64#4, #16]
# asm 2: ldp >rr=x6, >ss=x7, [<pointer_uuvvrrss=x3, #16]
ldp x6, x7, [x3, #16]

# qhasm: int64 2p41

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#9, #1
# asm 2: mov >2p41=x8, #1
mov x8, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#9, <2p41=int64#9, #41
# asm 2: lsl >2p41=x8, <2p41=x8, #41
lsl x8, x8, #41

# qhasm: int64 2p62

# qhasm: 2p62 = 1
# asm 1: mov >2p62=int64#10, #1
# asm 2: mov >2p62=x9, #1
mov x9, #1

# qhasm: 2p62 = 2p62 << 62
# asm 1: lsl >2p62=int64#10, <2p62=int64#10, #62
# asm 2: lsl >2p62=x9, <2p62=x9, #62
lsl x9, x9, #62

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#2, <f=int64#2, #1048575
# asm 2: and >fuv=x1, <f=x1, #1048575
and x1, x1, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#3, <g=int64#3, #1048575
# asm 2: and >grs=x2, <g=x2, #1048575
and x2, x2, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#2,<fuv=int64#2,<2p41=int64#9
# asm 2: sub <fuv=x1,<fuv=x1,<2p41=x8
sub x1,x1,x8

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#3,<grs=int64#3,<2p62=int64#10
# asm 2: sub <grs=x2,<grs=x2,<2p62=x9
sub x2,x2,x9

# qhasm: int64 oldG

# qhasm: int64 h

# qhasm: int64 z

# qhasm: int64 minus_one

# qhasm: int64 delta_new

# qhasm: minus_one = 1
# asm 1: mov >minus_one=int64#10, #1
# asm 2: mov >minus_one=x9, #1
mov x9, #1

# qhasm: minus_one = -minus_one
# asm 1: neg >minus_one=int64#10,<minus_one=int64#10
# asm 2: neg >minus_one=x9,<minus_one=x9
neg x9,x9

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#13,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x12,<delta=x0,<minus_one=x9,ne
csel x12,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#14,<delta=int64#1,#1
# asm 2: add >delta_new=x13,<delta=x0,#1
add x13,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#13,#0
# asm 2: cmp <z=x12,#0
cmp x12,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#14, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x13, <delta=x0, lt
csel x0, x13, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#11,<grs=int64#3
# asm 2: mov >oldG=x10,<grs=x2
mov x10,x2

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#12,<grs=int64#3,<fuv=int64#2
# asm 2: add >h=x11,<grs=x2,<fuv=x1
add x11,x2,x1

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#10,<delta=int64#1,<minus_one=int64#10,ne
# asm 2: csel >z=x9,<delta=x0,<minus_one=x9,ne
csel x9,x0,x9,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#12,<grs=int64#3,<h=int64#12,eq
# asm 2: csel >h=x11,<grs=x2,<h=x11,eq
csel x11,x2,x11,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#13,<delta=int64#1,#1
# asm 2: add >delta_new=x12,<delta=x0,#1
add x12,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#3,<grs=int64#3,<fuv=int64#2
# asm 2: sub <grs=x2,<grs=x2,<fuv=x1
sub x2,x2,x1

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#10,#0
# asm 2: cmp <z=x9,#0
cmp x9,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#3, <h=int64#12, <grs=int64#3, lt
# asm 2: csel >grs=x2, <h=x11, <grs=x2, lt
csel x2, x11, x2, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#2, <oldG=int64#11, <fuv=int64#2, ge
# asm 2: csel >fuv=x1, <oldG=x10, <fuv=x1, ge
csel x1, x10, x1, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#13, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x12, <delta=x0, lt
csel x0, x12, x0, lt

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#10,<fuv=int64#2
# asm 2: mov >v=x9,<fuv=x1
mov x9,x1

# qhasm: v = v + 1048576
# asm 1: add >v=int64#10,<v=int64#10,#1048576
# asm 2: add >v=x9,<v=x9,#1048576
add x9,x9,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#10,<v=int64#10,<2p41=int64#9
# asm 2: add >v=x9,<v=x9,<2p41=x8
add x9,x9,x8

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#10, <v=int64#10, #42
# asm 2: asr >v=x9, <v=x9, #42
asr x9, x9, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#2,<fuv=int64#2,#1048576
# asm 2: add >u=x1,<fuv=x1,#1048576
add x1,x1,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#2, <u=int64#2, #22
# asm 2: lsl >u=x1, <u=x1, #22
lsl x1, x1, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#2, <u=int64#2, #43
# asm 2: asr >u=x1, <u=x1, #43
asr x1, x1, #43

# qhasm: s = grs
# asm 1: mov >s=int64#11,<grs=int64#3
# asm 2: mov >s=x10,<grs=x2
mov x10,x2

# qhasm: s = s + 1048576
# asm 1: add >s=int64#11,<s=int64#11,#1048576
# asm 2: add >s=x10,<s=x10,#1048576
add x10,x10,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#9,<s=int64#11,<2p41=int64#9
# asm 2: add >s=x8,<s=x10,<2p41=x8
add x8,x10,x8

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#9, <s=int64#9, #42
# asm 2: asr >s=x8, <s=x8, #42
asr x8, x8, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#3,<grs=int64#3,#1048576
# asm 2: add >r=x2,<grs=x2,#1048576
add x2,x2,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#3, <r=int64#3, #22
# asm 2: lsl >r=x2, <r=x2, #22
lsl x2, x2, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#3, <r=int64#3, #43
# asm 2: asr >r=x2, <r=x2, #43
asr x2, x2, #43

# qhasm: int64 tmp

# qhasm: int64 prod_lo

# qhasm: int64 prod_hi

# qhasm: int64 new_f

# qhasm: int64 new_g

# qhasm: int64 new_uu

# qhasm: int64 new_vv

# qhasm: int64 new_rr

# qhasm: int64 new_ss

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#11,<u=int64#2,<uu=int64#5
# asm 2: mul >tmp=x10,<u=x1,<uu=x4
mul x10,x1,x4

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#11, <v=int64#10, <rr=int64#7, <tmp=int64#11
# asm 2: madd >new_uu=x10, <v=x9, <rr=x6, <tmp=x10
madd x10, x9, x6, x10

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#5,<r=int64#3,<uu=int64#5
# asm 2: mul >tmp=x4,<r=x2,<uu=x4
mul x4,x2,x4

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#5, <s=int64#9, <rr=int64#7, <tmp=int64#5
# asm 2: madd >new_rr=x4, <s=x8, <rr=x6, <tmp=x4
madd x4, x8, x6, x4

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#2,<u=int64#2,<vv=int64#6
# asm 2: mul >tmp=x1,<u=x1,<vv=x5
mul x1,x1,x5

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#2, <v=int64#10, <ss=int64#8, <tmp=int64#2
# asm 2: madd >new_vv=x1, <v=x9, <ss=x7, <tmp=x1
madd x1, x9, x7, x1

# qhasm: mem128[pointer_uuvvrrss] = new_uu, new_vv
# asm 1: stp <new_uu=int64#11, <new_vv=int64#2, [<pointer_uuvvrrss=int64#4]
# asm 2: stp <new_uu=x10, <new_vv=x1, [<pointer_uuvvrrss=x3]
stp x10, x1, [x3]

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#2,<r=int64#3,<vv=int64#6
# asm 2: mul >tmp=x1,<r=x2,<vv=x5
mul x1,x2,x5

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#2, <s=int64#9, <ss=int64#8, <tmp=int64#2
# asm 2: madd >new_ss=x1, <s=x8, <ss=x7, <tmp=x1
madd x1, x8, x7, x1

# qhasm: mem128[pointer_uuvvrrss + 16] = new_rr, new_ss
# asm 1: stp <new_rr=int64#5, <new_ss=int64#2, [<pointer_uuvvrrss=int64#4, #16]
# asm 2: stp <new_rr=x4, <new_ss=x1, [<pointer_uuvvrrss=x3, #16]
stp x4, x1, [x3, #16]

# qhasm: return
ret
