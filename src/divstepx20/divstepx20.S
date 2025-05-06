
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

# qhasm: int64 m

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 h

# qhasm: int64 hh

# qhasm: int64 m1

# qhasm: int64 z

# qhasm: enter divstepx20
.align 4
.global _divstepx20
.global divstepx20
_divstepx20:
divstepx20:


# qhasm: int64 ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#7,<m=int64#4,#1
# asm 2: sub >m1=x6,<m=x3,#1
sub x6,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#6, #1
# asm 2: tst <grs=x5, #1
tst x5, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#8, <fuv=int64#5, xzr, ne
# asm 2: csel >ff=x7, <fuv=x4, xzr, ne
csel x7, x4, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#7, <grs=int64#6, ROR #1
# asm 2: tst <m1=x6, <grs=x5, ROR #1
tst x6, x5, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#7, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x6, <m=x3, pl
csneg x3, x6, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#5, <grs=int64#6, <fuv=int64#5, mi
# asm 2: csel >fuv=x4, <grs=x5, <fuv=x4, mi
csel x4, x5, x4, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#8, <ff=int64#8, <ff=int64#8, pl
# asm 2: csneg >ff=x7, <ff=x7, <ff=x7, pl
csneg x7, x7, x7, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#6,<grs=int64#6,<ff=int64#8
# asm 2: add >grs=x5,<grs=x5,<ff=x7
add x5,x5,x7

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#6, <grs=int64#6, #1
# asm 2: asr >grs=x5, <grs=x5, #1
asr x5, x5, #1

# qhasm:     free m1

# qhasm:     free ff


# qhasm: return
ret
