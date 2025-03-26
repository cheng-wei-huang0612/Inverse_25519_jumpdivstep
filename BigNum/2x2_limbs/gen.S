
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

# qhasm: int64 pointerR

# qhasm: int64 pointerF

# qhasm: int64 pointerG

# qhasm: int64 pointeru

# qhasm: int64 pointerv

# qhasm: input pointerR

# qhasm: input pointerF

# qhasm: input pointerG

# qhasm: input pointeru

# qhasm: input pointerv

# qhasm: int64 u0u1

# qhasm: int64 v0v1

# qhasm: reg128 vec_u0_u1_v0_v1

# qhasm: int64 uhat

# qhasm: int64 vhat

# qhasm: reg128 vec_uhat_vhat

# qhasm: int64 read_u_and_v_MASK2p30m1

# qhasm: int64 u0

# qhasm: int64 u1

# qhasm: int64 v0

# qhasm: int64 v1

# qhasm: int64 u0v0

# qhasm: int64 u1v1

# qhasm: reg128 vec_u0_v0_0_0

# qhasm: reg128 vec_u1_v1_0_0

# qhasm: enter muladd
.align 4
.global _muladd
.global muladd
_muladd:
muladd:

# qhasm: u0u1 = mem64[pointeru]
# asm 1: ldr >u0u1=int64#4,[<pointeru=int64#4]
# asm 2: ldr >u0u1=x3,[<pointeru=x3]
ldr x3,[x3]

# qhasm: v0v1 = mem64[pointerv]
# asm 1: ldr >v0v1=int64#5,[<pointerv=int64#5]
# asm 2: ldr >v0v1=x4,[<pointerv=x4]
ldr x4,[x4]

# qhasm: vec_u0_u1_v0_v1[0/2] = u0u1 
# asm 1: ins <vec_u0_u1_v0_v1=reg128#1.d[0],<u0u1=int64#4
# asm 2: ins <vec_u0_u1_v0_v1=v0.d[0],<u0u1=x3
ins v0.d[0],x3

# qhasm: vec_u0_u1_v0_v1[1/2] = v0v1
# asm 1: ins <vec_u0_u1_v0_v1=reg128#1.d[1],<v0v1=int64#5
# asm 2: ins <vec_u0_u1_v0_v1=v0.d[1],<v0v1=x4
ins v0.d[1],x4

# qhasm: uhat = u0u1 signed>> 63
# asm 1: asr >uhat=int64#6,<u0u1=int64#4,#63
# asm 2: asr >uhat=x5,<u0u1=x3,#63
asr x5,x3,#63

# qhasm: vhat = v0v1 signed>> 63
# asm 1: asr >vhat=int64#7,<v0v1=int64#5,#63
# asm 2: asr >vhat=x6,<v0v1=x4,#63
asr x6,x4,#63

# qhasm: vec_uhat_vhat[0/2] = uhat
# asm 1: ins <vec_uhat_vhat=reg128#1.d[0],<uhat=int64#6
# asm 2: ins <vec_uhat_vhat=v0.d[0],<uhat=x5
ins v0.d[0],x5

# qhasm: vec_uhat_vhat[1/2] = vhat
# asm 1: ins <vec_uhat_vhat=reg128#1.d[1],<vhat=int64#7
# asm 2: ins <vec_uhat_vhat=v0.d[1],<vhat=x6
ins v0.d[1],x6

# qhasm: read_u_and_v_MASK2p30m1 = 1073741823
# asm 1: mov >read_u_and_v_MASK2p30m1=int64#6, #1073741823
# asm 2: mov >read_u_and_v_MASK2p30m1=x5, #1073741823
mov x5, #1073741823

# qhasm: u0 = u0u1 & MASK2p30m1
# asm 1: and  >u0=int64#7,<u0u1=int64#4,#MASK2p30m1
# asm 2: and  >u0=x6,<u0u1=x3,#MASK2p30m1
and  x6,x3,#MASK2p30m1

# qhasm: u1 = u0u1 unsigned>>32
# asm 1: lsr >u1=int64#4,<u0u1=int64#4,#32
# asm 2: lsr >u1=x3,<u0u1=x3,#32
lsr x3,x3,#32

# qhasm: v0 = v0v1 & MASK2p30m1
# asm 1: and  >v0=int64#8,<v0v1=int64#5,#MASK2p30m1
# asm 2: and  >v0=x7,<v0v1=x4,#MASK2p30m1
and  x7,x4,#MASK2p30m1

# qhasm: v1 = v0v1 unsigned>>32
# asm 1: lsr >v1=int64#5,<v0v1=int64#5,#32
# asm 2: lsr >v1=x4,<v0v1=x4,#32
lsr x4,x4,#32

# qhasm: v0 = v0 << 32
# asm 1: lsl >v0=int64#8,<v0=int64#8,#32
# asm 2: lsl >v0=x7,<v0=x7,#32
lsl x7,x7,#32

# qhasm: u0v0 = u0 + v0
# asm 1: add >u0v0=int64#7,<u0=int64#7,<v0=int64#8
# asm 2: add >u0v0=x6,<u0=x6,<v0=x7
add x6,x6,x7

# qhasm: v1 = v1 << 32
# asm 1: lsl >v1=int64#5,<v1=int64#5,#32
# asm 2: lsl >v1=x4,<v1=x4,#32
lsl x4,x4,#32

# qhasm: u1v1 = u1 + v1
# asm 1: add >u1v1=int64#4,<u1=int64#4,<v1=int64#5
# asm 2: add >u1v1=x3,<u1=x3,<v1=x4
add x3,x3,x4

# qhasm: vec_u0_v0_0_0[0/2] = u0v0
# asm 1: ins <vec_u0_v0_0_0=reg128#1.d[0],<u0v0=int64#7
# asm 2: ins <vec_u0_v0_0_0=v0.d[0],<u0v0=x6
ins v0.d[0],x6

# qhasm: vec_u1_v1_0_0[0/2] = u1v1
# asm 1: ins <vec_u1_v1_0_0=reg128#1.d[0],<u1v1=int64#4
# asm 2: ins <vec_u1_v1_0_0=v0.d[0],<u1v1=x3
ins v0.d[0],x3
