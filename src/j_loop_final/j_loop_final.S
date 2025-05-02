
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

# qhasm: int64 m

# qhasm: m = mem64[pointer_delta]
# asm 1: ldr >m=int64#5, [<pointer_delta=int64#1]
# asm 2: ldr >m=x4, [<pointer_delta=x0]
ldr x4, [x0]

# qhasm: f = mem64[pointer_f]
# asm 1: ldr >f=int64#2, [<pointer_f=int64#2]
# asm 2: ldr >f=x1, [<pointer_f=x1]
ldr x1, [x1]

# qhasm: g = mem64[pointer_g]
# asm 1: ldr >g=int64#3, [<pointer_g=int64#3]
# asm 2: ldr >g=x2, [<pointer_g=x2]
ldr x2, [x2]

# qhasm: uu, vv = mem128[pointer_uuvvrrss]
# asm 1: ldp >uu=int64#6, >vv=int64#7, [<pointer_uuvvrrss=int64#4]
# asm 2: ldp >uu=x5, >vv=x6, [<pointer_uuvvrrss=x3]
ldp x5, x6, [x3]

# qhasm: rr, ss = mem128[pointer_uuvvrrss + 16]
# asm 1: ldp >rr=int64#8, >ss=int64#9, [<pointer_uuvvrrss=int64#4, #16]
# asm 2: ldp >rr=x7, >ss=x8, [<pointer_uuvvrrss=x3, #16]
ldp x7, x8, [x3, #16]

# qhasm: int64 2p41

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#10, #1
# asm 2: mov >2p41=x9, #1
mov x9, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#10, <2p41=int64#10, #41
# asm 2: lsl >2p41=x9, <2p41=x9, #41
lsl x9, x9, #41

# qhasm: int64 2p62

# qhasm: 2p62 = 1
# asm 1: mov >2p62=int64#11, #1
# asm 2: mov >2p62=x10, #1
mov x10, #1

# qhasm: 2p62 = 2p62 << 62
# asm 1: lsl >2p62=int64#11, <2p62=int64#11, #62
# asm 2: lsl >2p62=x10, <2p62=x10, #62
lsl x10, x10, #62

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#2, <f=int64#2, #1048575
# asm 2: and >fuv=x1, <f=x1, #1048575
and x1, x1, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#3, <g=int64#3, #1048575
# asm 2: and >grs=x2, <g=x2, #1048575
and x2, x2, #1048575

# qhasm: fuv -= 2p41
# asm 1: sub <fuv=int64#2,<fuv=int64#2,<2p41=int64#10
# asm 2: sub <fuv=x1,<fuv=x1,<2p41=x9
sub x1,x1,x9

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#3,<grs=int64#3,<2p62=int64#11
# asm 2: sub <grs=x2,<grs=x2,<2p62=x10
sub x2,x2,x10

# qhasm: int64 oldG

# qhasm: int64 h

# qhasm: int64 hh

# qhasm: int64 m1

# qhasm: int64 z

# qhasm: int64 minus_one

# qhasm: int64 delta_new

# qhasm: int64 ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#11,<m=int64#5,#1
# asm 2: sub >m1=x10,<m=x4,#1
sub x10,x4,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#3, #1
# asm 2: tst <grs=x2, #1
tst x2, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#12, <fuv=int64#2, xzr, ne
# asm 2: csel >ff=x11, <fuv=x1, xzr, ne
csel x11, x1, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#11, <grs=int64#3, ROR #1
# asm 2: tst <m1=x10, <grs=x2, ROR #1
tst x10, x2, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#5, <m1=int64#11, <m=int64#5, pl
# asm 2: csneg >m=x4, <m1=x10, <m=x4, pl
csneg x4, x10, x4, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#2, <grs=int64#3, <fuv=int64#2, mi
# asm 2: csel >fuv=x1, <grs=x2, <fuv=x1, mi
csel x1, x2, x1, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#12, <ff=int64#12, <ff=int64#12, pl
# asm 2: csneg >ff=x11, <ff=x11, <ff=x11, pl
csneg x11, x11, x11, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#3,<grs=int64#3,<ff=int64#12
# asm 2: add >grs=x2,<grs=x2,<ff=x11
add x2,x2,x11

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#3, <grs=int64#3, #1
# asm 2: asr >grs=x2, <grs=x2, #1
asr x2, x2, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm: mem64[pointer_delta] = m
# asm 1: str <m=int64#5, [<pointer_delta=int64#1]
# asm 2: str <m=x4, [<pointer_delta=x0]
str x4, [x0]

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: v = fuv
# asm 1: mov >v=int64#1,<fuv=int64#2
# asm 2: mov >v=x0,<fuv=x1
mov x0,x1

# qhasm: v = v + 1048576
# asm 1: add >v=int64#1,<v=int64#1,#1048576
# asm 2: add >v=x0,<v=x0,#1048576
add x0,x0,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#1,<v=int64#1,<2p41=int64#10
# asm 2: add >v=x0,<v=x0,<2p41=x9
add x0,x0,x9

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#1, <v=int64#1, #42
# asm 2: asr >v=x0, <v=x0, #42
asr x0, x0, #42

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
# asm 1: mov >s=int64#5,<grs=int64#3
# asm 2: mov >s=x4,<grs=x2
mov x4,x2

# qhasm: s = s + 1048576
# asm 1: add >s=int64#5,<s=int64#5,#1048576
# asm 2: add >s=x4,<s=x4,#1048576
add x4,x4,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#5,<s=int64#5,<2p41=int64#10
# asm 2: add >s=x4,<s=x4,<2p41=x9
add x4,x4,x9

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#5, <s=int64#5, #42
# asm 2: asr >s=x4, <s=x4, #42
asr x4, x4, #42

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
# asm 1: mul >tmp=int64#10,<u=int64#2,<uu=int64#6
# asm 2: mul >tmp=x9,<u=x1,<uu=x5
mul x9,x1,x5

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#10, <v=int64#1, <rr=int64#8, <tmp=int64#10
# asm 2: madd >new_uu=x9, <v=x0, <rr=x7, <tmp=x9
madd x9, x0, x7, x9

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#6,<r=int64#3,<uu=int64#6
# asm 2: mul >tmp=x5,<r=x2,<uu=x5
mul x5,x2,x5

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#6, <s=int64#5, <rr=int64#8, <tmp=int64#6
# asm 2: madd >new_rr=x5, <s=x4, <rr=x7, <tmp=x5
madd x5, x4, x7, x5

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#2,<u=int64#2,<vv=int64#7
# asm 2: mul >tmp=x1,<u=x1,<vv=x6
mul x1,x1,x6

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#1, <v=int64#1, <ss=int64#9, <tmp=int64#2
# asm 2: madd >new_vv=x0, <v=x0, <ss=x8, <tmp=x1
madd x0, x0, x8, x1

# qhasm: mem128[pointer_uuvvrrss] = new_uu, new_vv
# asm 1: stp <new_uu=int64#10, <new_vv=int64#1, [<pointer_uuvvrrss=int64#4]
# asm 2: stp <new_uu=x9, <new_vv=x0, [<pointer_uuvvrrss=x3]
stp x9, x0, [x3]

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#1,<r=int64#3,<vv=int64#7
# asm 2: mul >tmp=x0,<r=x2,<vv=x6
mul x0,x2,x6

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#1, <s=int64#5, <ss=int64#9, <tmp=int64#1
# asm 2: madd >new_ss=x0, <s=x4, <ss=x8, <tmp=x0
madd x0, x4, x8, x0

# qhasm: mem128[pointer_uuvvrrss + 16] = new_rr, new_ss
# asm 1: stp <new_rr=int64#6, <new_ss=int64#1, [<pointer_uuvvrrss=int64#4, #16]
# asm 2: stp <new_rr=x5, <new_ss=x0, [<pointer_uuvvrrss=x3, #16]
stp x5, x0, [x3, #16]

# qhasm: return
ret
