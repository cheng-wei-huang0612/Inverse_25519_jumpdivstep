
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

# qhasm: int64 hh

# qhasm: int64 m

# qhasm: int64 m1

# qhasm: int64 z

# qhasm: int64 minus_one

# qhasm: int64 delta_new

# qhasm: enter divstepx20
.align 4
.global _divstepx20
.global divstepx20
_divstepx20:
divstepx20:

# qhasm: m = mem64[pointer_delta]
# asm 1: ldr >m=int64#4, [<pointer_delta=int64#1]
# asm 2: ldr >m=x3, [<pointer_delta=x0]
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

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm:     h = fuv + grs
# asm 1: add >h=int64#8,<fuv=int64#5,<grs=int64#6
# asm 2: add >h=x7,<fuv=x4,<grs=x5
add x7,x4,x5

# qhasm:     hh = grs - fuv
# asm 1: sub >hh=int64#9,<grs=int64#6,<fuv=int64#5
# asm 2: sub >hh=x8,<grs=x5,<fuv=x4
sub x8,x5,x4

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#10,<m=int64#4,#1
# asm 2: sub >m1=x9,<m=x3,#1
sub x9,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     grs_new = h if Z=0 else grs
# asm 1: csel >grs_new=int64#8, <h=int64#8, <grs=int64#6, ne
# asm 2: csel >grs_new=x7, <h=x7, <grs=x5, ne
csel x7, x7, x5, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#10, <grs=int64#6, ROR #1
# asm 2: tst <m1=x9, <grs=x5, ROR #1
tst x9, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#10, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x9, <m=x3, pl
csneg x3, x9, x3, pl

# qhasm:     grs_new = grs_new if N=0 else hh
# asm 1: csel >grs_new=int64#8, <grs_new=int64#8, <hh=int64#9, pl
# asm 2: csel >grs_new=x7, <grs_new=x7, <hh=x8, pl
csel x7, x7, x8, pl

# qhasm:     fuv = fuv if N=0 else grs
# asm 1: csel >fuv=int64#5, <fuv=int64#5, <grs=int64#6, pl
# asm 2: csel >fuv=x4, <fuv=x4, <grs=x5, pl
csel x4, x4, x5, pl

# qhasm:     grs = grs_new signed>> 1
# asm 1: asr >grs=int64#6, <grs_new=int64#8, #1
# asm 2: asr >grs=x5, <grs_new=x7, #1
asr x5, x7, #1

# qhasm: mem64[pointer_delta] = m
# asm 1: str <m=int64#4, [<pointer_delta=int64#1]
# asm 2: str <m=x3, [<pointer_delta=x0]
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
