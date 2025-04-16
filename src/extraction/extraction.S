
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

# qhasm: int64 pointer_uvrs

# qhasm: int64 pointer_fuv

# qhasm: int64 pointer_grs

# qhasm: input pointer_uvrs

# qhasm: input pointer_fuv

# qhasm: input pointer_grs

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 2p41

# qhasm: enter extraction
.align 4
.global _extraction
.global extraction
_extraction:
extraction:

# qhasm: fuv = mem64[pointer_fuv]
# asm 1: ldr >fuv=int64#2, [<pointer_fuv=int64#2]
# asm 2: ldr >fuv=x1, [<pointer_fuv=x1]
ldr x1, [x1]

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#4, #1
# asm 2: mov >2p41=x3, #1
mov x3, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#4, <2p41=int64#4, #41
# asm 2: lsl >2p41=x3, <2p41=x3, #41
lsl x3, x3, #41

# qhasm: v = fuv
# asm 1: mov >v=int64#5,<fuv=int64#2
# asm 2: mov >v=x4,<fuv=x1
mov x4,x1

# qhasm: v = v + 1048576
# asm 1: add >v=int64#5,<v=int64#5,#1048576
# asm 2: add >v=x4,<v=x4,#1048576
add x4,x4,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#5,<v=int64#5,<2p41=int64#4
# asm 2: add >v=x4,<v=x4,<2p41=x3
add x4,x4,x3

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#5, <v=int64#5, #42
# asm 2: asr >v=x4, <v=x4, #42
asr x4, x4, #42

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

# qhasm: mem64[pointer_uvrs] = u
# asm 1: str <u=int64#2, [<pointer_uvrs=int64#1]
# asm 2: str <u=x1, [<pointer_uvrs=x0]
str x1, [x0]

# qhasm: mem64[pointer_uvrs + 8] = v
# asm 1: str <v=int64#5, [<pointer_uvrs=int64#1, #8]
# asm 2: str <v=x4, [<pointer_uvrs=x0, #8]
str x4, [x0, #8]

# qhasm: grs = mem64[pointer_grs]
# asm 1: ldr >grs=int64#2, [<pointer_grs=int64#3]
# asm 2: ldr >grs=x1, [<pointer_grs=x2]
ldr x1, [x2]

# qhasm: s = grs
# asm 1: mov >s=int64#3,<grs=int64#2
# asm 2: mov >s=x2,<grs=x1
mov x2,x1

# qhasm: s = s + 1048576
# asm 1: add >s=int64#3,<s=int64#3,#1048576
# asm 2: add >s=x2,<s=x2,#1048576
add x2,x2,#1048576

# qhasm: s = s + 2p41
# asm 1: add >s=int64#3,<s=int64#3,<2p41=int64#4
# asm 2: add >s=x2,<s=x2,<2p41=x3
add x2,x2,x3

# qhasm: s = s signed>> 42
# asm 1: asr >s=int64#3, <s=int64#3, #42
# asm 2: asr >s=x2, <s=x2, #42
asr x2, x2, #42

# qhasm: r = grs + 1048576
# asm 1: add >r=int64#2,<grs=int64#2,#1048576
# asm 2: add >r=x1,<grs=x1,#1048576
add x1,x1,#1048576

# qhasm: r = r << 22
# asm 1: lsl >r=int64#2, <r=int64#2, #22
# asm 2: lsl >r=x1, <r=x1, #22
lsl x1, x1, #22

# qhasm: r = r signed>> 43
# asm 1: asr >r=int64#2, <r=int64#2, #43
# asm 2: asr >r=x1, <r=x1, #43
asr x1, x1, #43

# qhasm: mem64[pointer_uvrs + 16] = r
# asm 1: str <r=int64#2, [<pointer_uvrs=int64#1, #16]
# asm 2: str <r=x1, [<pointer_uvrs=x0, #16]
str x1, [x0, #16]

# qhasm: mem64[pointer_uvrs + 24] = s
# asm 1: str <s=int64#3, [<pointer_uvrs=int64#1, #24]
# asm 2: str <s=x2, [<pointer_uvrs=x0, #24]
str x2, [x0, #24]

# qhasm: return
ret
