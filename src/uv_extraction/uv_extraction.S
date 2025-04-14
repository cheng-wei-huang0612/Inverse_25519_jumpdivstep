
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

# qhasm: int64 pointer_u

# qhasm: int64 pointer_v

# qhasm: int64 pointer_fuv

# qhasm: input pointer_u

# qhasm: input pointer_v

# qhasm: input pointer_fuv

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 fuv

# qhasm: int64 2p41

# qhasm: enter extraction
.align 4
.global _extraction
.global extraction
_extraction:
extraction:

# qhasm: fuv = mem64[pointer_fuv]
# asm 1: ldr >fuv=int64#3, [<pointer_fuv=int64#3]
# asm 2: ldr >fuv=x2, [<pointer_fuv=x2]
ldr x2, [x2]

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#4, #1
# asm 2: mov >2p41=x3, #1
mov x3, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#4, <2p41=int64#4, #41
# asm 2: lsl >2p41=x3, <2p41=x3, #41
lsl x3, x3, #41

# qhasm: v = fuv
# asm 1: mov >v=int64#5,<fuv=int64#3
# asm 2: mov >v=x4,<fuv=x2
mov x4,x2

# qhasm: v = v + 1048576
# asm 1: add >v=int64#5,<v=int64#5,#1048576
# asm 2: add >v=x4,<v=x4,#1048576
add x4,x4,#1048576

# qhasm: v = v + 2p41
# asm 1: add >v=int64#4,<v=int64#5,<2p41=int64#4
# asm 2: add >v=x3,<v=x4,<2p41=x3
add x3,x4,x3

# qhasm: v = v signed>> 42
# asm 1: asr >v=int64#4,<v=int64#4,#42
# asm 2: asr >v=x3,<v=x3,#42
asr x3,x3,#42

# qhasm: u = fuv + 1048576
# asm 1: add >u=int64#3,<fuv=int64#3,#1048576
# asm 2: add >u=x2,<fuv=x2,#1048576
add x2,x2,#1048576

# qhasm: u = u << 22
# asm 1: lsl >u=int64#3, <u=int64#3, #22
# asm 2: lsl >u=x2, <u=x2, #22
lsl x2, x2, #22

# qhasm: u = u signed>> 43
# asm 1: asr >u=int64#3,<u=int64#3,#43
# asm 2: asr >u=x2,<u=x2,#43
asr x2,x2,#43

# qhasm: mem64[pointer_u] = u
# asm 1: str <u=int64#3, [<pointer_u=int64#1]
# asm 2: str <u=x2, [<pointer_u=x0]
str x2, [x0]

# qhasm: mem64[pointer_v] = v
# asm 1: str <v=int64#4, [<pointer_v=int64#2]
# asm 2: str <v=x3, [<pointer_v=x1]
str x3, [x1]

# qhasm: return
ret
