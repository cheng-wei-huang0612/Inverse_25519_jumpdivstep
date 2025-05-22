
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

# qhasm: int64 2p20

# qhasm: int64 2p20a2p41

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

# qhasm: grs = mem64[pointer_grs]
# asm 1: ldr >grs=int64#3, [<pointer_grs=int64#3]
# asm 2: ldr >grs=x2, [<pointer_grs=x2]
ldr x2, [x2]

# qhasm: reg128 vec_fuv_grs

# qhasm: reg128 vec_2p20a2p41

# qhasm: reg128 vec_2p20

# qhasm: vec_fuv_grs[0/2] = fuv
# asm 1: ins <vec_fuv_grs=reg128#1.d[0], <fuv=int64#2
# asm 2: ins <vec_fuv_grs=v0.d[0], <fuv=x1
ins v0.d[0], x1

# qhasm: vec_fuv_grs[1/2] = grs
# asm 1: ins <vec_fuv_grs=reg128#1.d[1], <grs=int64#3
# asm 2: ins <vec_fuv_grs=v0.d[1], <grs=x2
ins v0.d[1], x2

# qhasm: 2p41 = 1
# asm 1: mov >2p41=int64#2, #1
# asm 2: mov >2p41=x1, #1
mov x1, #1

# qhasm: 2p41 = 2p41 << 41
# asm 1: lsl >2p41=int64#2, <2p41=int64#2, #41
# asm 2: lsl >2p41=x1, <2p41=x1, #41
lsl x1, x1, #41

# qhasm: 2p20a2p41 = 2p41 + 1048576
# asm 1: add >2p20a2p41=int64#2,<2p41=int64#2,#1048576
# asm 2: add >2p20a2p41=x1,<2p41=x1,#1048576
add x1,x1,#1048576

# qhasm: 2x vec_2p20a2p41 = 2p20a2p41
# asm 1: dup <vec_2p20a2p41=reg128#2.2d, <2p20a2p41=int64#2
# asm 2: dup <vec_2p20a2p41=v1.2d, <2p20a2p41=x1
dup v1.2d, x1

# qhasm: 2p20 = 1048576
# asm 1: mov >2p20=int64#2, #1048576
# asm 2: mov >2p20=x1, #1048576
mov x1, #1048576

# qhasm: 2x vec_2p20 = 2p20
# asm 1: dup <vec_2p20=reg128#3.2d, <2p20=int64#2
# asm 2: dup <vec_2p20=v2.2d, <2p20=x1
dup v2.2d, x1

# qhasm: reg128 vec_v_s

# qhasm: reg128 vec_u_r

# qhasm: 2x vec_v_s = vec_fuv_grs + vec_2p20a2p41
# asm 1: add >vec_v_s=reg128#4.2d, <vec_fuv_grs=reg128#1.2d, <vec_2p20a2p41=reg128#2.2d
# asm 2: add >vec_v_s=v3.2d, <vec_fuv_grs=v0.2d, <vec_2p20a2p41=v1.2d
add v3.2d, v0.2d, v1.2d

# qhasm: 2x vec_v_s = vec_v_s >> 42
# asm 1: sshr <vec_v_s=reg128#4.2d, <vec_v_s=reg128#4.2d, #42
# asm 2: sshr <vec_v_s=v3.2d, <vec_v_s=v3.2d, #42
sshr v3.2d, v3.2d, #42

# qhasm: v = vec_v_s[0/4]
# asm 1: smov >v=int64#2, <vec_v_s=reg128#4.s[0]
# asm 2: smov >v=x1, <vec_v_s=v3.s[0]
smov x1, v3.s[0]

# qhasm: s = vec_v_s[2/4]
# asm 1: smov >s=int64#3, <vec_v_s=reg128#4.s[2]
# asm 2: smov >s=x2, <vec_v_s=v3.s[2]
smov x2, v3.s[2]

# qhasm: 2x vec_v_s = vec_fuv_grs + vec_2p20a2p41
# asm 1: add >vec_v_s=reg128#2.2d, <vec_fuv_grs=reg128#1.2d, <vec_2p20a2p41=reg128#2.2d
# asm 2: add >vec_v_s=v1.2d, <vec_fuv_grs=v0.2d, <vec_2p20a2p41=v1.2d
add v1.2d, v0.2d, v1.2d

# qhasm: 2x vec_u_r = vec_fuv_grs + vec_2p20
# asm 1: add >vec_u_r=reg128#1.2d, <vec_fuv_grs=reg128#1.2d, <vec_2p20=reg128#3.2d
# asm 2: add >vec_u_r=v0.2d, <vec_fuv_grs=v0.2d, <vec_2p20=v2.2d
add v0.2d, v0.2d, v2.2d
error
.error
error:unknown instruction:2x vec_u_r << 22

# qhasm: 2x vec_u_r = vec_u_r >> 43
# asm 1: sshr <vec_u_r=reg128#1.2d, <vec_u_r=reg128#1.2d, #43
# asm 2: sshr <vec_u_r=v0.2d, <vec_u_r=v0.2d, #43
sshr v0.2d, v0.2d, #43

# qhasm: u = vec_u_r[0/4]
# asm 1: smov >u=int64#4, <vec_u_r=reg128#1.s[0]
# asm 2: smov >u=x3, <vec_u_r=v0.s[0]
smov x3, v0.s[0]

# qhasm: r = vec_u_r[2/4]
# asm 1: smov >r=int64#5, <vec_u_r=reg128#1.s[2]
# asm 2: smov >r=x4, <vec_u_r=v0.s[2]
smov x4, v0.s[2]

# qhasm: mem64[pointer_uvrs] = u
# asm 1: str <u=int64#4, [<pointer_uvrs=int64#1]
# asm 2: str <u=x3, [<pointer_uvrs=x0]
str x3, [x0]

# qhasm: mem64[pointer_uvrs + 8] = v
# asm 1: str <v=int64#2, [<pointer_uvrs=int64#1, #8]
# asm 2: str <v=x1, [<pointer_uvrs=x0, #8]
str x1, [x0, #8]

# qhasm: mem64[pointer_uvrs + 16] = r
# asm 1: str <r=int64#5, [<pointer_uvrs=int64#1, #16]
# asm 2: str <r=x4, [<pointer_uvrs=x0, #16]
str x4, [x0, #16]

# qhasm: mem64[pointer_uvrs + 24] = s
# asm 1: str <s=int64#3, [<pointer_uvrs=int64#1, #24]
# asm 2: str <s=x2, [<pointer_uvrs=x0, #24]
str x2, [x0, #24]

# qhasm: return
ret
