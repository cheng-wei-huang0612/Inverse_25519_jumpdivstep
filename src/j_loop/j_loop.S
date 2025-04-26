
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

# qhasm: int64 oldG

# qhasm: int64 h

# qhasm: int64 z

# qhasm: int64 minus_one

# qhasm: int64 delta_new

# qhasm: minus_one = 1
# asm 1: mov >minus_one=int64#12, #1
# asm 2: mov >minus_one=x11, #1
mov x11, #1

# qhasm: minus_one = -minus_one
# asm 1: neg >minus_one=int64#12,<minus_one=int64#12
# asm 2: neg >minus_one=x11,<minus_one=x11
neg x11,x11

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#17,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x16,<delta=x0,<minus_one=x11,ne
csel x16,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#18,<delta=int64#1,#1
# asm 2: add >delta_new=x17,<delta=x0,#1
add x17,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#17,#0
# asm 2: cmp <z=x16,#0
cmp x16,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#14, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x13, <h=x15, <grs=x13, lt
csel x13, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#14, <grs=int64#14, #1
# asm 2: asr >grs=x13, <grs=x13, #1
asr x13, x13, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#18, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x17, <delta=x0, lt
csel x0, x17, x0, lt

# qhasm:     oldG = grs
# asm 1: mov >oldG=int64#15,<grs=int64#14
# asm 2: mov >oldG=x14,<grs=x13
mov x14,x13

# qhasm:     h = grs + fuv
# asm 1: add >h=int64#16,<grs=int64#14,<fuv=int64#13
# asm 2: add >h=x15,<grs=x13,<fuv=x12
add x15,x13,x12

# qhasm:     grs & 1 == 0
# asm 1: tst <grs=int64#14, #1
# asm 2: tst <grs=x13, #1
tst x13, #1

# qhasm:     z = delta if negativeequal else minus_one
# asm 1: csel >z=int64#12,<delta=int64#1,<minus_one=int64#12,ne
# asm 2: csel >z=x11,<delta=x0,<minus_one=x11,ne
csel x11,x0,x11,ne

# qhasm:     h = grs if equal else h
# asm 1: csel >h=int64#16,<grs=int64#14,<h=int64#16,eq
# asm 2: csel >h=x15,<grs=x13,<h=x15,eq
csel x15,x13,x15,eq

# qhasm:     delta_new = delta + 1
# asm 1: add >delta_new=int64#17,<delta=int64#1,#1
# asm 2: add >delta_new=x16,<delta=x0,#1
add x16,x0,#1

# qhasm:     grs -= fuv
# asm 1: sub <grs=int64#14,<grs=int64#14,<fuv=int64#13
# asm 2: sub <grs=x13,<grs=x13,<fuv=x12
sub x13,x13,x12

# qhasm:     delta = -delta
# asm 1: neg >delta=int64#1,<delta=int64#1
# asm 2: neg >delta=x0,<delta=x0
neg x0,x0

# qhasm:     z - 0
# asm 1: cmp <z=int64#12,#0
# asm 2: cmp <z=x11,#0
cmp x11,#0

# qhasm:     grs = h if signed< else grs
# asm 1: csel >grs=int64#12, <h=int64#16, <grs=int64#14, lt
# asm 2: csel >grs=x11, <h=x15, <grs=x13, lt
csel x11, x15, x13, lt

# qhasm:     fuv = oldG if !signed< else fuv
# asm 1: csel >fuv=int64#13, <oldG=int64#15, <fuv=int64#13, ge
# asm 2: csel >fuv=x12, <oldG=x14, <fuv=x12, ge
csel x12, x14, x12, ge

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#12, <grs=int64#12, #1
# asm 2: asr >grs=x11, <grs=x11, #1
asr x11, x11, #1

# qhasm:     delta = delta_new if signed< else delta
# asm 1: csel >delta=int64#1, <delta_new=int64#17, <delta=int64#1, lt
# asm 2: csel >delta=x0, <delta_new=x16, <delta=x0, lt
csel x0, x16, x0, lt

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#14,<fuv=int64#13
# asm 2: mov >v=x13,<fuv=x12
mov x13,x12

# qhasm: v = v + 1048576
# asm 1: add >v=int64#14,<v=int64#14,#1048576
# asm 2: add >v=x13,<v=x13,#1048576
add x13,x13,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#14,<v=int64#14,<2p41=int64#11
# asm 2: add >v=x13,<v=x13,<2p41=x10
add x13,x13,x10

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#14, <v=int64#14, #42
# asm 2: asr >v=x13, <v=x13, #42
asr x13, x13, #42

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
# asm 1: mov >s=int64#15,<grs=int64#12
# asm 2: mov >s=x14,<grs=x11
mov x14,x11

# qhasm: s = s + 1048576
# asm 1: add >s=int64#15,<s=int64#15,#1048576
# asm 2: add >s=x14,<s=x14,#1048576
add x14,x14,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#11,<s=int64#15,<2p41=int64#11
# asm 2: add >s=x10,<s=x14,<2p41=x10
add x10,x14,x10

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
# asm 1: mul >prod_lo=int64#15,<u=int64#13,<f=int64#5
# asm 2: mul >prod_lo=x14,<u=x12,<f=x4
mul x14,x12,x4

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#16, <u=int64#13, <f=int64#5
# asm 2: smulh >prod_hi=x15, <u=x12, <f=x4
smulh x15, x12, x4

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#17,<v=int64#14,<g=int64#6
# asm 2: mul >tmp=x16,<v=x13,<g=x5
mul x16,x13,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#15, <prod_lo=int64#15, <tmp=int64#17
# asm 2: adds <prod_lo=x14, <prod_lo=x14, <tmp=x16
adds x14, x14, x16

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#17, <v=int64#14, <g=int64#6
# asm 2: smulh >tmp=x16, <v=x13, <g=x5
smulh x16, x13, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#16,<prod_hi=int64#16,<tmp=int64#17
# asm 2: adc >prod_hi=x15,<prod_hi=x15,<tmp=x16
adc x15,x15,x16

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#15, <prod_lo=int64#15, #20
# asm 2: lsr >prod_lo=x14, <prod_lo=x14, #20
lsr x14, x14, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#16, <prod_hi=int64#16, #44
# asm 2: lsl >prod_hi=x15, <prod_hi=x15, #44
lsl x15, x15, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#15, <prod_lo=int64#15, <prod_hi=int64#16
# asm 2: orr >new_f=x14, <prod_lo=x14, <prod_hi=x15
orr x14, x14, x15

# qhasm: mem64[pointer_f] = new_f
# asm 1: str <new_f=int64#15, [<pointer_f=int64#2]
# asm 2: str <new_f=x14, [<pointer_f=x1]
str x14, [x1]

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#2,<r=int64#12,<f=int64#5
# asm 2: mul >prod_lo=x1,<r=x11,<f=x4
mul x1,x11,x4

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#5, <r=int64#12, <f=int64#5
# asm 2: smulh >prod_hi=x4, <r=x11, <f=x4
smulh x4, x11, x4

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#15,<s=int64#11,<g=int64#6
# asm 2: mul >tmp=x14,<s=x10,<g=x5
mul x14,x10,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#2, <prod_lo=int64#2, <tmp=int64#15
# asm 2: adds <prod_lo=x1, <prod_lo=x1, <tmp=x14
adds x1, x1, x14

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
# asm 1: madd >new_uu=int64#2, <v=int64#14, <rr=int64#9, <tmp=int64#2
# asm 2: madd >new_uu=x1, <v=x13, <rr=x8, <tmp=x1
madd x1, x13, x8, x1

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
# asm 1: madd >new_vv=int64#5, <v=int64#14, <ss=int64#10, <tmp=int64#5
# asm 2: madd >new_vv=x4, <v=x13, <ss=x9, <tmp=x4
madd x4, x13, x9, x4

# qhasm: mem128[pointer_uuvvrrss] = new_uu, new_vv
# asm 1: stp <new_uu=int64#2, <new_vv=int64#5, [<pointer_uuvvrrss=int64#4]
# asm 2: stp <new_uu=x1, <new_vv=x4, [<pointer_uuvvrrss=x3]
stp x1, x4, [x3]

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#2,<r=int64#12,<vv=int64#8
# asm 2: mul >tmp=x1,<r=x11,<vv=x7
mul x1,x11,x7

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#2, <s=int64#11, <ss=int64#10, <tmp=int64#2
# asm 2: madd >new_ss=x1, <s=x10, <ss=x9, <tmp=x1
madd x1, x10, x9, x1

# qhasm: mem128[pointer_uuvvrrss + 16] = new_rr, new_ss
# asm 1: stp <new_rr=int64#3, <new_ss=int64#2, [<pointer_uuvvrrss=int64#4, #16]
# asm 2: stp <new_rr=x2, <new_ss=x1, [<pointer_uuvvrrss=x3, #16]
stp x2, x1, [x3, #16]

# qhasm: return
ret
