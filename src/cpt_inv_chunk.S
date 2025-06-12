# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#14,<m=int64#4,#1
# asm 2: sub >m1=x13,<m=x3,#1
sub x13,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#13, #1
# asm 2: tst <grs=x12, #1
tst x12, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#15, <fuv=int64#12, xzr, ne
# asm 2: csel >ff=x14, <fuv=x11, xzr, ne
csel x14, x11, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#14, <grs=int64#13, ROR #1
# asm 2: tst <m1=x13, <grs=x12, ROR #1
tst x13, x12, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#14, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x13, <m=x3, pl
csneg x3, x13, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#12, <grs=int64#13, <fuv=int64#12, mi
# asm 2: csel >fuv=x11, <grs=x12, <fuv=x11, mi
csel x11, x12, x11, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#15, <ff=int64#15, <ff=int64#15, pl
# asm 2: csneg >ff=x14, <ff=x14, <ff=x14, pl
csneg x14, x14, x14, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#13,<grs=int64#13,<ff=int64#15
# asm 2: add >grs=x12,<grs=x12,<ff=x14
add x12,x12,x14

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#13, <grs=int64#13, #1
# asm 2: asr >grs=x12, <grs=x12, #1
asr x12, x12, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm: v = fuv
# asm 1: mov >v=int64#14,<fuv=int64#12
# asm 2: mov >v=x13,<fuv=x11
mov x13,x11

# qhasm: v = v + 1048576
# asm 1: add >v=int64#14,<v=int64#14,#1048576
# asm 2: add >v=x13,<v=x13,#1048576
add x13,x13,#1048576

# qhasm: v = v + _2p41
# asm 1: add >v=int64#14,<v=int64#14,<_2p41=int64#1
# asm 2: add >v=x13,<v=x13,<_2p41=x0
add x13,x13,x0

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#14, <v=int64#14, #42
# asm 2: asr >v=x13, <v=x13, #42
asr x13, x13, #42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#12,<fuv=int64#12,#1048576
# asm 2: add >u=x11,<fuv=x11,#1048576
add x11,x11,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#12, <u=int64#12, #22
# asm 2: lsl >u=x11, <u=x11, #22
lsl x11, x11, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#12, <u=int64#12, #43
# asm 2: asr >u=x11, <u=x11, #43
asr x11, x11, #43

# qhasm: s = grs
# asm 1: mov >s=int64#15,<grs=int64#13
# asm 2: mov >s=x14,<grs=x12
mov x14,x12

# qhasm: s = s + 1048576
# asm 1: add >s=int64#15,<s=int64#15,#1048576
# asm 2: add >s=x14,<s=x14,#1048576
add x14,x14,#1048576

# qhasm: s = s + _2p41
# asm 1: add >s=int64#15,<s=int64#15,<_2p41=int64#1
# asm 2: add >s=x14,<s=x14,<_2p41=x0
add x14,x14,x0

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#15, <s=int64#15, #42
# asm 2: asr >s=x14, <s=x14, #42
asr x14, x14, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#13,<grs=int64#13,#1048576
# asm 2: add >r=x12,<grs=x12,#1048576
add x12,x12,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#13, <r=int64#13, #22
# asm 2: lsl >r=x12, <r=x12, #22
lsl x12, x12, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#13, <r=int64#13, #43
# asm 2: asr >r=x12, <r=x12, #43
asr x12, x12, #43

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#16,<u=int64#12,<f=int64#6
# asm 2: mul >prod_lo=x15,<u=x11,<f=x5
mul x15,x11,x5

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#17,<v=int64#14,<g=int64#5
# asm 2: mul >tmp=x16,<v=x13,<g=x4
mul x16,x13,x4

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#16, <prod_lo=int64#16, <tmp=int64#17
# asm 2: adds <prod_lo=x15, <prod_lo=x15, <tmp=x16
adds x15, x15, x16

# qhasm: prod_lo = prod_lo signed>> 20
# asm 1: asr >prod_lo=int64#16, <prod_lo=int64#16, #20
# asm 2: asr >prod_lo=x15, <prod_lo=x15, #20
asr x15, x15, #20

# qhasm: new_f = prod_lo 
# asm 1: mov >new_f=int64#16,<prod_lo=int64#16
# asm 2: mov >new_f=x15,<prod_lo=x15
mov x15,x15

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#6,<r=int64#13,<f=int64#6
# asm 2: mul >prod_lo=x5,<r=x12,<f=x5
mul x5,x12,x5

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#5,<s=int64#15,<g=int64#5
# asm 2: mul >tmp=x4,<s=x14,<g=x4
mul x4,x14,x4

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#6, <prod_lo=int64#6, <tmp=int64#5
# asm 2: adds <prod_lo=x5, <prod_lo=x5, <tmp=x4
adds x5, x5, x4

# qhasm: prod_lo = prod_lo signed>> 20
# asm 1: asr >prod_lo=int64#5, <prod_lo=int64#6, #20
# asm 2: asr >prod_lo=x4, <prod_lo=x5, #20
asr x4, x5, #20

# qhasm: new_g = prod_lo 
# asm 1: mov >new_g=int64#5,<prod_lo=int64#5
# asm 2: mov >new_g=x4,<prod_lo=x4
mov x4,x4

# qhasm: f = new_f
# asm 1: mov >f=int64#6,<new_f=int64#16
# asm 2: mov >f=x5,<new_f=x15
mov x5,x15

# qhasm: g = new_g
# asm 1: mov >g=int64#5,<new_g=int64#5
# asm 2: mov >g=x4,<new_g=x4
mov x4,x4

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#16,<u=int64#12,<uu=int64#7
# asm 2: mul >tmp=x15,<u=x11,<uu=x6
mul x15,x11,x6

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#16, <v=int64#14, <rr=int64#8, <tmp=int64#16
# asm 2: madd >new_uu=x15, <v=x13, <rr=x7, <tmp=x15
madd x15, x13, x7, x15

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#7,<r=int64#13,<uu=int64#7
# asm 2: mul >tmp=x6,<r=x12,<uu=x6
mul x6,x12,x6

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#7, <s=int64#15, <rr=int64#8, <tmp=int64#7
# asm 2: madd >new_rr=x6, <s=x14, <rr=x7, <tmp=x6
madd x6, x14, x7, x6

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#8,<u=int64#12,<vv=int64#10
# asm 2: mul >tmp=x7,<u=x11,<vv=x9
mul x7,x11,x9

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#8, <v=int64#14, <ss=int64#11, <tmp=int64#8
# asm 2: madd >new_vv=x7, <v=x13, <ss=x10, <tmp=x7
madd x7, x13, x10, x7

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#10,<r=int64#13,<vv=int64#10
# asm 2: mul >tmp=x9,<r=x12,<vv=x9
mul x9,x12,x9

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#10, <s=int64#15, <ss=int64#11, <tmp=int64#10
# asm 2: madd >new_ss=x9, <s=x14, <ss=x10, <tmp=x9
madd x9, x14, x10, x9

# qhasm: uu = new_uu
# asm 1: mov >uu=int64#11,<new_uu=int64#16
# asm 2: mov >uu=x10,<new_uu=x15
mov x10,x15

# qhasm: vv = new_vv
# asm 1: mov >vv=int64#8,<new_vv=int64#8
# asm 2: mov >vv=x7,<new_vv=x7
mov x7,x7

# qhasm: rr = new_rr
# asm 1: mov >rr=int64#7,<new_rr=int64#7
# asm 2: mov >rr=x6,<new_rr=x6
mov x6,x6

# qhasm: ss = new_ss
# asm 1: mov >ss=int64#10,<new_ss=int64#10
# asm 2: mov >ss=x9,<new_ss=x9
mov x9,x9

# qhasm: fuv = f & 1048575
# asm 1: and >fuv=int64#6, <f=int64#6, #1048575
# asm 2: and >fuv=x5, <f=x5, #1048575
and x5, x5, #1048575

# qhasm: grs = g & 1048575
# asm 1: and >grs=int64#5, <g=int64#5, #1048575
# asm 2: and >grs=x4, <g=x4, #1048575
and x4, x4, #1048575

# qhasm: fuv -= _2p41
# asm 1: sub <fuv=int64#6,<fuv=int64#6,<_2p41=int64#1
# asm 2: sub <fuv=x5,<fuv=x5,<_2p41=x0
sub x5,x5,x0

# qhasm: grs -= 2p62
# asm 1: sub <grs=int64#5,<grs=int64#5,<2p62=int64#3
# asm 2: sub <grs=x4,<grs=x4,<2p62=x2
sub x4,x4,x2

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1

# qhasm:     free m1

# qhasm:     free ff

# qhasm:     m1 = m - 1 
# asm 1: sub >m1=int64#12,<m=int64#4,#1
# asm 2: sub >m1=x11,<m=x3,#1
sub x11,x3,#1

# qhasm:     grs & 1
# asm 1: tst <grs=int64#5, #1
# asm 2: tst <grs=x4, #1
tst x4, #1

# qhasm:     ff = fuv if Z=0 else 0
# asm 1: csel >ff=int64#13, <fuv=int64#6, xzr, ne
# asm 2: csel >ff=x12, <fuv=x5, xzr, ne
csel x12, x5, xzr, ne

# qhasm:     m1 & (grs >>> 1)
# asm 1: tst <m1=int64#12, <grs=int64#5, ROR #1
# asm 2: tst <m1=x11, <grs=x4, ROR #1
tst x11, x4, ROR #1

# qhasm:     m = m1 if N=0 else -m
# asm 1: csneg >m=int64#4, <m1=int64#12, <m=int64#4, pl
# asm 2: csneg >m=x3, <m1=x11, <m=x3, pl
csneg x3, x11, x3, pl

# qhasm:     fuv = grs if N=1 else fuv
# asm 1: csel >fuv=int64#6, <grs=int64#5, <fuv=int64#6, mi
# asm 2: csel >fuv=x5, <grs=x4, <fuv=x5, mi
csel x5, x4, x5, mi

# qhasm:     ff = ff if N=0 else -ff
# asm 1: csneg >ff=int64#13, <ff=int64#13, <ff=int64#13, pl
# asm 2: csneg >ff=x12, <ff=x12, <ff=x12, pl
csneg x12, x12, x12, pl

# qhasm:     grs = grs + ff
# asm 1: add >grs=int64#5,<grs=int64#5,<ff=int64#13
# asm 2: add >grs=x4,<grs=x4,<ff=x12
add x4,x4,x12

# qhasm:     grs = grs signed>> 1
# asm 1: asr >grs=int64#5, <grs=int64#5, #1
# asm 2: asr >grs=x4, <grs=x4, #1
asr x4, x4, #1