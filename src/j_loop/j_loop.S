
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

# qhasm: int64 m

# qhasm: m = mem64[pointer_delta]
# asm 1: ldr >m=int64#5, [<pointer_delta=int64#1]
# asm 2: ldr >m=x4, [<pointer_delta=x0]
ldr x4, [x0]

# qhasm: f = mem64[pointer_f]
# asm 1: ldr >f=int64#6, [<pointer_f=int64#2]
# asm 2: ldr >f=x5, [<pointer_f=x1]
ldr x5, [x1]

# qhasm: g = mem64[pointer_g]
# asm 1: ldr >g=int64#7, [<pointer_g=int64#3]
# asm 2: ldr >g=x6, [<pointer_g=x2]
ldr x6, [x2]

# qhasm: uu, vv = mem128[pointer_uuvvrrss]
# asm 1: ldp >uu=int64#8, >vv=int64#9, [<pointer_uuvvrrss=int64#4]
# asm 2: ldp >uu=x7, >vv=x8, [<pointer_uuvvrrss=x3]
ldp x7, x8, [x3]

# qhasm: rr, ss = mem128[pointer_uuvvrrss + 16]
# asm 1: ldp >rr=int64#10, >ss=int64#11, [<pointer_uuvvrrss=int64#4, #16]
# asm 2: ldp >rr=x9, >ss=x10, [<pointer_uuvvrrss=x3, #16]
ldp x9, x10, [x3, #16]

# qhasm: int64 2p41

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#12, #1
# asm 2: mov >2p41=x11, #1
mov x11, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#12, <2p41=int64#12, #41
# asm 2: lsl >2p41=x11, <2p41=x11, #41
lsl x11, x11, #41

# qhasm: int64 2p62

# qhasm: 2p62 = 1
# asm 1: mov >2p62=int64#13, #1
# asm 2: mov >2p62=x12, #1
mov x12, #1

# qhasm: 2p62 = 2p62 << 62
# asm 1: lsl >2p62=int64#13, <2p62=int64#13, #62
# asm 2: lsl >2p62=x12, <2p62=x12, #62
lsl x12, x12, #62

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#14, <f=int64#6, #1048575
# asm 2: and >fuv=x13, <f=x5, #1048575
and x13, x5, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#15, <g=int64#7, #1048575
# asm 2: and >grs=x14, <g=x6, #1048575
and x14, x6, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#14,<fuv=int64#14,<2p41=int64#12
# asm 2: sub <fuv=x13,<fuv=x13,<2p41=x11
sub x13,x13,x11

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#15,<grs=int64#15,<2p62=int64#13
# asm 2: sub <grs=x14,<grs=x14,<2p62=x12
sub x14,x14,x12

# qhasm: int64 oldG

# qhasm: int64 z

# qhasm: int64 minus_one

# qhasm: int64 delta_new

# qhasm: minus_one = 1
# asm 1: mov >minus_one=int64#13, #1
# asm 2: mov >minus_one=x12, #1
mov x12, #1

# qhasm: minus_one = -minus_one
# asm 1: neg >minus_one=int64#13,<minus_one=int64#13
# asm 2: neg >minus_one=x12,<minus_one=x12
neg x12,x12

# qhasm: int64 h

# qhasm: int64 hh

# qhasm: int64 m1

# qhasm: int64 g1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm:     g1 = grs & 1
# asm 1: and >g1=int64#16, <grs=int64#15, #1
# asm 2: and >g1=x15, <grs=x14, #1
and x15, x14, #1

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#17,<grs=int64#15,<fuv=int64#14
# asm 2: sub >hh=x16,<grs=x14,<fuv=x13
sub x16,x14,x13

# qhasm:     h = grs + g1 * fuv
# asm 1: madd >h=int64#16, <g1=int64#16, <fuv=int64#14, <grs=int64#15
# asm 2: madd >h=x15, <g1=x15, <fuv=x13, <grs=x14
madd x15, x15, x13, x14

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#18,<m=int64#5,#1
# asm 2: sub >m1=x17,<m=x4,#1
sub x17,x4,#1

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#18, <grs=int64#15, ROR #1
# asm 2: tst <m1=x17, <grs=x14, ROR #1
tst x17, x14, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#18, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x17, <m=x4, pl
csneg x4, x17, x4, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#14, <fuv=int64#14, <grs=int64#15, pl
# asm 2: csel >fuv=x13, <fuv=x13, <grs=x14, pl
csel x13, x13, x14, pl

# qhasm:     grs = h if N=0 else hh
# asm 1: csel >grs=int64#15, <h=int64#16, <hh=int64#17, pl
# asm 2: csel >grs=x14, <h=x15, <hh=x16, pl
csel x14, x15, x16, pl

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#15, <grs=int64#15, #1
# asm 2: asr >grs=x14, <grs=x14, #1
asr x14, x14, #1

# qhasm: mem64[pointer_delta] = m
# asm 1: str <m=int64#5, [<pointer_delta=int64#1]
# asm 2: str <m=x4, [<pointer_delta=x0]
str x4, [x0]

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#1,<fuv=int64#14
# asm 2: mov >v=x0,<fuv=x13
mov x0,x13

# qhasm: v = v + 1048576
# asm 1: add >v=int64#1,<v=int64#1,#1048576
# asm 2: add >v=x0,<v=x0,#1048576
add x0,x0,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#1,<v=int64#1,<2p41=int64#12
# asm 2: add >v=x0,<v=x0,<2p41=x11
add x0,x0,x11

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#1, <v=int64#1, #42
# asm 2: asr >v=x0, <v=x0, #42
asr x0, x0, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#5,<fuv=int64#14,#1048576
# asm 2: add >u=x4,<fuv=x13,#1048576
add x4,x13,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#5, <u=int64#5, #22
# asm 2: lsl >u=x4, <u=x4, #22
lsl x4, x4, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#5, <u=int64#5, #43
# asm 2: asr >u=x4, <u=x4, #43
asr x4, x4, #43

# qhasm: s = grs
# asm 1: mov >s=int64#14,<grs=int64#15
# asm 2: mov >s=x13,<grs=x14
mov x13,x14

# qhasm: s = s + 1048576
# asm 1: add >s=int64#14,<s=int64#14,#1048576
# asm 2: add >s=x13,<s=x13,#1048576
add x13,x13,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#12,<s=int64#14,<2p41=int64#12
# asm 2: add >s=x11,<s=x13,<2p41=x11
add x11,x13,x11

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#12, <s=int64#12, #42
# asm 2: asr >s=x11, <s=x11, #42
asr x11, x11, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#14,<grs=int64#15,#1048576
# asm 2: add >r=x13,<grs=x14,#1048576
add x13,x14,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#14, <r=int64#14, #22
# asm 2: lsl >r=x13, <r=x13, #22
lsl x13, x13, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#14, <r=int64#14, #43
# asm 2: asr >r=x13, <r=x13, #43
asr x13, x13, #43

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
# asm 1: mul >prod_lo=int64#15,<u=int64#5,<f=int64#6
# asm 2: mul >prod_lo=x14,<u=x4,<f=x5
mul x14,x4,x5

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#16, <u=int64#5, <f=int64#6
# asm 2: smulh >prod_hi=x15, <u=x4, <f=x5
smulh x15, x4, x5

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#17,<v=int64#1,<g=int64#7
# asm 2: mul >tmp=x16,<v=x0,<g=x6
mul x16,x0,x6

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#15, <prod_lo=int64#15, <tmp=int64#17
# asm 2: adds <prod_lo=x14, <prod_lo=x14, <tmp=x16
adds x14, x14, x16

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#17, <v=int64#1, <g=int64#7
# asm 2: smulh >tmp=x16, <v=x0, <g=x6
smulh x16, x0, x6

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
# asm 1: mul >prod_lo=int64#2,<r=int64#14,<f=int64#6
# asm 2: mul >prod_lo=x1,<r=x13,<f=x5
mul x1,x13,x5

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#6, <r=int64#14, <f=int64#6
# asm 2: smulh >prod_hi=x5, <r=x13, <f=x5
smulh x5, x13, x5

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#15,<s=int64#12,<g=int64#7
# asm 2: mul >tmp=x14,<s=x11,<g=x6
mul x14,x11,x6

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#2, <prod_lo=int64#2, <tmp=int64#15
# asm 2: adds <prod_lo=x1, <prod_lo=x1, <tmp=x14
adds x1, x1, x14

# qhasm: tmp = s signed* g (hi)
# asm 1: smulh >tmp=int64#7, <s=int64#12, <g=int64#7
# asm 2: smulh >tmp=x6, <s=x11, <g=x6
smulh x6, x11, x6

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#6,<prod_hi=int64#6,<tmp=int64#7
# asm 2: adc >prod_hi=x5,<prod_hi=x5,<tmp=x6
adc x5,x5,x6

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#2, <prod_lo=int64#2, #20
# asm 2: lsr >prod_lo=x1, <prod_lo=x1, #20
lsr x1, x1, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#6, <prod_hi=int64#6, #44
# asm 2: lsl >prod_hi=x5, <prod_hi=x5, #44
lsl x5, x5, #44

# qhasm: new_g = prod_lo | prod_hi
# asm 1: orr >new_g=int64#2, <prod_lo=int64#2, <prod_hi=int64#6
# asm 2: orr >new_g=x1, <prod_lo=x1, <prod_hi=x5
orr x1, x1, x5

# qhasm: mem64[pointer_g] = new_g
# asm 1: str <new_g=int64#2, [<pointer_g=int64#3]
# asm 2: str <new_g=x1, [<pointer_g=x2]
str x1, [x2]

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#2,<u=int64#5,<uu=int64#8
# asm 2: mul >tmp=x1,<u=x4,<uu=x7
mul x1,x4,x7

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#2, <v=int64#1, <rr=int64#10, <tmp=int64#2
# asm 2: madd >new_uu=x1, <v=x0, <rr=x9, <tmp=x1
madd x1, x0, x9, x1

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#3,<r=int64#14,<uu=int64#8
# asm 2: mul >tmp=x2,<r=x13,<uu=x7
mul x2,x13,x7

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#3, <s=int64#12, <rr=int64#10, <tmp=int64#3
# asm 2: madd >new_rr=x2, <s=x11, <rr=x9, <tmp=x2
madd x2, x11, x9, x2

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#5,<u=int64#5,<vv=int64#9
# asm 2: mul >tmp=x4,<u=x4,<vv=x8
mul x4,x4,x8

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#1, <v=int64#1, <ss=int64#11, <tmp=int64#5
# asm 2: madd >new_vv=x0, <v=x0, <ss=x10, <tmp=x4
madd x0, x0, x10, x4

# qhasm: mem128[pointer_uuvvrrss] = new_uu, new_vv
# asm 1: stp <new_uu=int64#2, <new_vv=int64#1, [<pointer_uuvvrrss=int64#4]
# asm 2: stp <new_uu=x1, <new_vv=x0, [<pointer_uuvvrrss=x3]
stp x1, x0, [x3]

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#1,<r=int64#14,<vv=int64#9
# asm 2: mul >tmp=x0,<r=x13,<vv=x8
mul x0,x13,x8

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#1, <s=int64#12, <ss=int64#11, <tmp=int64#1
# asm 2: madd >new_ss=x0, <s=x11, <ss=x10, <tmp=x0
madd x0, x11, x10, x0

# qhasm: mem128[pointer_uuvvrrss + 16] = new_rr, new_ss
# asm 1: stp <new_rr=int64#3, <new_ss=int64#1, [<pointer_uuvvrrss=int64#4, #16]
# asm 2: stp <new_rr=x2, <new_ss=x0, [<pointer_uuvvrrss=x3, #16]
stp x2, x0, [x3, #16]

# qhasm: return
ret
