
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

# qhasm: int64 pointer_f

# qhasm: int64 pointer_g

# qhasm: int64 pointer_uuvvrrss

# qhasm: int64 pointer_uvrs

# qhasm: input pointer_f

# qhasm: input pointer_g

# qhasm: input pointer_uuvvrrss

# qhasm: input pointer_uvrs

# qhasm: int64 f

# qhasm: int64 g

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: int64 prod_lo

# qhasm: int64 prod_hi

# qhasm: int64 tmp

# qhasm: int64 new_f

# qhasm: int64 new_g

# qhasm: int64 new_uu

# qhasm: int64 new_vv

# qhasm: int64 new_rr

# qhasm: int64 new_ss

# qhasm: caller calleesaved_x18

# qhasm: caller calleesaved_x19

# qhasm: stack64 stack_x18

# qhasm: stack64 stack_x19

# qhasm: caller calleesaved_x20

# qhasm: caller calleesaved_x21

# qhasm: stack64 stack_x20

# qhasm: stack64 stack_x21

# qhasm: caller calleesaved_x22

# qhasm: caller calleesaved_x23

# qhasm: stack64 stack_x22

# qhasm: stack64 stack_x23

# qhasm: caller calleesaved_x24

# qhasm: caller calleesaved_x25

# qhasm: stack64 stack_x24

# qhasm: stack64 stack_x25

# qhasm: caller calleesaved_x26

# qhasm: caller calleesaved_x27

# qhasm: stack64 stack_x26

# qhasm: stack64 stack_x27

# qhasm: caller calleesaved_x28

# qhasm: caller calleesaved_x29

# qhasm: stack64 stack_x28

# qhasm: stack64 stack_x29

# qhasm: enter inner_update
.align 4
.global _inner_update
.global inner_update
_inner_update:
inner_update:

# qhasm: f = mem64[pointer_f]
# asm 1: ldr >f=int64#5, [<pointer_f=int64#1]
# asm 2: ldr >f=x4, [<pointer_f=x0]
ldr x4, [x0]

# qhasm: g = mem64[pointer_g]
# asm 1: ldr >g=int64#6, [<pointer_g=int64#2]
# asm 2: ldr >g=x5, [<pointer_g=x1]
ldr x5, [x1]

# qhasm: u  = mem64[pointer_uvrs]
# asm 1: ldr >u=int64#7, [<pointer_uvrs=int64#4]
# asm 2: ldr >u=x6, [<pointer_uvrs=x3]
ldr x6, [x3]

# qhasm: v  = mem64[pointer_uvrs + 8]
# asm 1: ldr >v=int64#8, [<pointer_uvrs=int64#4, #8]
# asm 2: ldr >v=x7, [<pointer_uvrs=x3, #8]
ldr x7, [x3, #8]

# qhasm: r  = mem64[pointer_uvrs + 16]
# asm 1: ldr >r=int64#9, [<pointer_uvrs=int64#4, #16]
# asm 2: ldr >r=x8, [<pointer_uvrs=x3, #16]
ldr x8, [x3, #16]

# qhasm: s  = mem64[pointer_uvrs + 24]
# asm 1: ldr >s=int64#4, [<pointer_uvrs=int64#4, #24]
# asm 2: ldr >s=x3, [<pointer_uvrs=x3, #24]
ldr x3, [x3, #24]

# qhasm: prod_lo = u * f
# asm 1: mul >prod_lo=int64#10,<u=int64#7,<f=int64#5
# asm 2: mul >prod_lo=x9,<u=x6,<f=x4
mul x9,x6,x4

# qhasm: prod_hi = u signed* f (hi)
# asm 1: smulh >prod_hi=int64#11, <u=int64#7, <f=int64#5
# asm 2: smulh >prod_hi=x10, <u=x6, <f=x4
smulh x10, x6, x4

# qhasm: tmp = v * g
# asm 1: mul >tmp=int64#12,<v=int64#8,<g=int64#6
# asm 2: mul >tmp=x11,<v=x7,<g=x5
mul x11,x7,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#10, <prod_lo=int64#10, <tmp=int64#12
# asm 2: adds <prod_lo=x9, <prod_lo=x9, <tmp=x11
adds x9, x9, x11

# qhasm: tmp = v signed* g (hi)
# asm 1: smulh >tmp=int64#12, <v=int64#8, <g=int64#6
# asm 2: smulh >tmp=x11, <v=x7, <g=x5
smulh x11, x7, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#11,<prod_hi=int64#11,<tmp=int64#12
# asm 2: adc >prod_hi=x10,<prod_hi=x10,<tmp=x11
adc x10,x10,x11

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#10, <prod_lo=int64#10, #20
# asm 2: lsr >prod_lo=x9, <prod_lo=x9, #20
lsr x9, x9, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#11, <prod_hi=int64#11, #44
# asm 2: lsl >prod_hi=x10, <prod_hi=x10, #44
lsl x10, x10, #44

# qhasm: new_f = prod_lo | prod_hi
# asm 1: orr >new_f=int64#10, <prod_lo=int64#10, <prod_hi=int64#11
# asm 2: orr >new_f=x9, <prod_lo=x9, <prod_hi=x10
orr x9, x9, x10

# qhasm: mem64[pointer_f] = new_f
# asm 1: str <new_f=int64#10, [<pointer_f=int64#1]
# asm 2: str <new_f=x9, [<pointer_f=x0]
str x9, [x0]

# qhasm: prod_lo = r * f
# asm 1: mul >prod_lo=int64#1,<r=int64#9,<f=int64#5
# asm 2: mul >prod_lo=x0,<r=x8,<f=x4
mul x0,x8,x4

# qhasm: prod_hi = r signed* f (hi)
# asm 1: smulh >prod_hi=int64#5, <r=int64#9, <f=int64#5
# asm 2: smulh >prod_hi=x4, <r=x8, <f=x4
smulh x4, x8, x4

# qhasm: tmp = s * g
# asm 1: mul >tmp=int64#10,<s=int64#4,<g=int64#6
# asm 2: mul >tmp=x9,<s=x3,<g=x5
mul x9,x3,x5

# qhasm: prod_lo += tmp !
# asm 1: adds <prod_lo=int64#1, <prod_lo=int64#1, <tmp=int64#10
# asm 2: adds <prod_lo=x0, <prod_lo=x0, <tmp=x9
adds x0, x0, x9

# qhasm: tmp = s signed* g (hi)
# asm 1: smulh >tmp=int64#6, <s=int64#4, <g=int64#6
# asm 2: smulh >tmp=x5, <s=x3, <g=x5
smulh x5, x3, x5

# qhasm: prod_hi = prod_hi + tmp + carry 
# asm 1: adc >prod_hi=int64#5,<prod_hi=int64#5,<tmp=int64#6
# asm 2: adc >prod_hi=x4,<prod_hi=x4,<tmp=x5
adc x4,x4,x5

# qhasm: prod_lo = prod_lo unsigned>> 20
# asm 1: lsr >prod_lo=int64#1, <prod_lo=int64#1, #20
# asm 2: lsr >prod_lo=x0, <prod_lo=x0, #20
lsr x0, x0, #20

# qhasm: prod_hi = prod_hi << 44
# asm 1: lsl >prod_hi=int64#5, <prod_hi=int64#5, #44
# asm 2: lsl >prod_hi=x4, <prod_hi=x4, #44
lsl x4, x4, #44

# qhasm: new_g = prod_lo | prod_hi
# asm 1: orr >new_g=int64#1, <prod_lo=int64#1, <prod_hi=int64#5
# asm 2: orr >new_g=x0, <prod_lo=x0, <prod_hi=x4
orr x0, x0, x4

# qhasm: mem64[pointer_g] = new_g
# asm 1: str <new_g=int64#1, [<pointer_g=int64#2]
# asm 2: str <new_g=x0, [<pointer_g=x1]
str x0, [x1]

# qhasm: uu = mem64[pointer_uuvvrrss]
# asm 1: ldr >uu=int64#1, [<pointer_uuvvrrss=int64#3]
# asm 2: ldr >uu=x0, [<pointer_uuvvrrss=x2]
ldr x0, [x2]

# qhasm: vv = mem64[pointer_uuvvrrss + 8]
# asm 1: ldr >vv=int64#2, [<pointer_uuvvrrss=int64#3, #8]
# asm 2: ldr >vv=x1, [<pointer_uuvvrrss=x2, #8]
ldr x1, [x2, #8]

# qhasm: rr = mem64[pointer_uuvvrrss + 16]
# asm 1: ldr >rr=int64#5, [<pointer_uuvvrrss=int64#3, #16]
# asm 2: ldr >rr=x4, [<pointer_uuvvrrss=x2, #16]
ldr x4, [x2, #16]

# qhasm: ss = mem64[pointer_uuvvrrss + 24]
# asm 1: ldr >ss=int64#6, [<pointer_uuvvrrss=int64#3, #24]
# asm 2: ldr >ss=x5, [<pointer_uuvvrrss=x2, #24]
ldr x5, [x2, #24]

# qhasm: tmp = u * uu
# asm 1: mul >tmp=int64#10,<u=int64#7,<uu=int64#1
# asm 2: mul >tmp=x9,<u=x6,<uu=x0
mul x9,x6,x0

# qhasm: new_uu = tmp + v * rr
# asm 1: madd >new_uu=int64#10, <v=int64#8, <rr=int64#5, <tmp=int64#10
# asm 2: madd >new_uu=x9, <v=x7, <rr=x4, <tmp=x9
madd x9, x7, x4, x9

# qhasm: mem64[pointer_uuvvrrss] = new_uu
# asm 1: str <new_uu=int64#10, [<pointer_uuvvrrss=int64#3]
# asm 2: str <new_uu=x9, [<pointer_uuvvrrss=x2]
str x9, [x2]

# qhasm: tmp = r * uu
# asm 1: mul >tmp=int64#1,<r=int64#9,<uu=int64#1
# asm 2: mul >tmp=x0,<r=x8,<uu=x0
mul x0,x8,x0

# qhasm: new_rr = tmp + s * rr
# asm 1: madd >new_rr=int64#1, <s=int64#4, <rr=int64#5, <tmp=int64#1
# asm 2: madd >new_rr=x0, <s=x3, <rr=x4, <tmp=x0
madd x0, x3, x4, x0

# qhasm: mem64[pointer_uuvvrrss + 16] = new_rr
# asm 1: str <new_rr=int64#1, [<pointer_uuvvrrss=int64#3, #16]
# asm 2: str <new_rr=x0, [<pointer_uuvvrrss=x2, #16]
str x0, [x2, #16]

# qhasm: tmp = u * vv
# asm 1: mul >tmp=int64#1,<u=int64#7,<vv=int64#2
# asm 2: mul >tmp=x0,<u=x6,<vv=x1
mul x0,x6,x1

# qhasm: new_vv = tmp + v * ss
# asm 1: madd >new_vv=int64#1, <v=int64#8, <ss=int64#6, <tmp=int64#1
# asm 2: madd >new_vv=x0, <v=x7, <ss=x5, <tmp=x0
madd x0, x7, x5, x0

# qhasm: mem64[pointer_uuvvrrss + 8] = new_vv
# asm 1: str <new_vv=int64#1, [<pointer_uuvvrrss=int64#3, #8]
# asm 2: str <new_vv=x0, [<pointer_uuvvrrss=x2, #8]
str x0, [x2, #8]

# qhasm: tmp = r * vv
# asm 1: mul >tmp=int64#1,<r=int64#9,<vv=int64#2
# asm 2: mul >tmp=x0,<r=x8,<vv=x1
mul x0,x8,x1

# qhasm: new_ss = tmp + s * ss
# asm 1: madd >new_ss=int64#1, <s=int64#4, <ss=int64#6, <tmp=int64#1
# asm 2: madd >new_ss=x0, <s=x3, <ss=x5, <tmp=x0
madd x0, x3, x5, x0

# qhasm: mem64[pointer_uuvvrrss + 24] = new_ss
# asm 1: str <new_ss=int64#1, [<pointer_uuvvrrss=int64#3, #24]
# asm 2: str <new_ss=x0, [<pointer_uuvvrrss=x2, #24]
str x0, [x2, #24]

# qhasm: return
ret
