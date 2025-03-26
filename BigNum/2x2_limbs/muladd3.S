
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

# qhasm: int64 u0

# qhasm: int64 u1

# qhasm: int64 v0

# qhasm: int64 v1

# qhasm: int64 u0v0

# qhasm: int64 u1v1

# qhasm: reg128 vec_u0_v0_0_0

# qhasm: reg128 vec_u1_v1_0_0

# qhasm: int64 F0F1

# qhasm: int64 G0G1

# qhasm: reg128 vec_F0_F1_G0_G1

# qhasm: int64 Fhat

# qhasm: int64 Ghat

# qhasm: reg128 vec_Fhat_Ghat

# qhasm: int64 F0

# qhasm: int64 F1

# qhasm: int64 G0

# qhasm: int64 G1

# qhasm: int64 F0G0

# qhasm: int64 F1G1

# qhasm: reg128 vec_F0_G0_0_0

# qhasm: reg128 vec_F1_G1_0_0

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

# qhasm: u0 = u0u1 & 1073741823
# asm 1: and  >u0=int64#6,<u0u1=int64#4,#1073741823
# asm 2: and  >u0=x5,<u0u1=x3,#1073741823
and  x5,x3,#1073741823

# qhasm: u1 = u0u1 unsigned>>32
# asm 1: lsr >u1=int64#4,<u0u1=int64#4,#32
# asm 2: lsr >u1=x3,<u0u1=x3,#32
lsr x3,x3,#32

# qhasm: v0 = v0v1 & 1073741823
# asm 1: and  >v0=int64#7,<v0v1=int64#5,#1073741823
# asm 2: and  >v0=x6,<v0v1=x4,#1073741823
and  x6,x4,#1073741823

# qhasm: v1 = v0v1 unsigned>>32
# asm 1: lsr >v1=int64#5,<v0v1=int64#5,#32
# asm 2: lsr >v1=x4,<v0v1=x4,#32
lsr x4,x4,#32

# qhasm: v0 = v0 << 32
# asm 1: lsl >v0=int64#7,<v0=int64#7,#32
# asm 2: lsl >v0=x6,<v0=x6,#32
lsl x6,x6,#32

# qhasm: u0v0 = u0 + v0
# asm 1: add >u0v0=int64#6,<u0=int64#6,<v0=int64#7
# asm 2: add >u0v0=x5,<u0=x5,<v0=x6
add x5,x5,x6

# qhasm: v1 = v1 << 32
# asm 1: lsl >v1=int64#5,<v1=int64#5,#32
# asm 2: lsl >v1=x4,<v1=x4,#32
lsl x4,x4,#32

# qhasm: u1v1 = u1 + v1
# asm 1: add >u1v1=int64#4,<u1=int64#4,<v1=int64#5
# asm 2: add >u1v1=x3,<u1=x3,<v1=x4
add x3,x3,x4

# qhasm: vec_u0_v0_0_0[0/2] = u0v0
# asm 1: ins <vec_u0_v0_0_0=reg128#1.d[0],<u0v0=int64#6
# asm 2: ins <vec_u0_v0_0_0=v0.d[0],<u0v0=x5
ins v0.d[0],x5

# qhasm: vec_u1_v1_0_0[0/2] = u1v1
# asm 1: ins <vec_u1_v1_0_0=reg128#1.d[0],<u1v1=int64#4
# asm 2: ins <vec_u1_v1_0_0=v0.d[0],<u1v1=x3
ins v0.d[0],x3

# qhasm: F0F1 = mem64[pointerF]
# asm 1: ldr >F0F1=int64#2,[<pointerF=int64#2]
# asm 2: ldr >F0F1=x1,[<pointerF=x1]
ldr x1,[x1]

# qhasm: G0G1 = mem64[pointerG]
# asm 1: ldr >G0G1=int64#3,[<pointerG=int64#3]
# asm 2: ldr >G0G1=x2,[<pointerG=x2]
ldr x2,[x2]

# qhasm: vec_F0_F1_G0_G1[0/2] = F0F1
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.d[0],<F0F1=int64#2
# asm 2: ins <vec_F0_F1_G0_G1=v0.d[0],<F0F1=x1
ins v0.d[0],x1

# qhasm: vec_F0_F1_G0_G1[1/2] = G0G1
# asm 1: ins <vec_F0_F1_G0_G1=reg128#1.d[1],<G0G1=int64#3
# asm 2: ins <vec_F0_F1_G0_G1=v0.d[1],<G0G1=x2
ins v0.d[1],x2

# qhasm: Fhat = F0F1 signed>> 63
# asm 1: asr >Fhat=int64#4,<F0F1=int64#2,#63
# asm 2: asr >Fhat=x3,<F0F1=x1,#63
asr x3,x1,#63

# qhasm: Ghat = G0G1 signed>> 63
# asm 1: asr >Ghat=int64#5,<G0G1=int64#3,#63
# asm 2: asr >Ghat=x4,<G0G1=x2,#63
asr x4,x2,#63

# qhasm: vec_Fhat_Ghat[0/2] = Fhat
# asm 1: ins <vec_Fhat_Ghat=reg128#1.d[0],<Fhat=int64#4
# asm 2: ins <vec_Fhat_Ghat=v0.d[0],<Fhat=x3
ins v0.d[0],x3

# qhasm: vec_Fhat_Ghat[1/2] = Ghat
# asm 1: ins <vec_Fhat_Ghat=reg128#1.d[1],<Ghat=int64#5
# asm 2: ins <vec_Fhat_Ghat=v0.d[1],<Ghat=x4
ins v0.d[1],x4

# qhasm: F0 = F0F1 & 1073741823
# asm 1: and  >F0=int64#4,<F0F1=int64#2,#1073741823
# asm 2: and  >F0=x3,<F0F1=x1,#1073741823
and  x3,x1,#1073741823

# qhasm: F1 = F0F1 unsigned>>32
# asm 1: lsr >F1=int64#2,<F0F1=int64#2,#32
# asm 2: lsr >F1=x1,<F0F1=x1,#32
lsr x1,x1,#32

# qhasm: G0 = G0G1 & 1073741823
# asm 1: and  >G0=int64#5,<G0G1=int64#3,#1073741823
# asm 2: and  >G0=x4,<G0G1=x2,#1073741823
and  x4,x2,#1073741823

# qhasm: G1 = G0G1 unsigned>>32
# asm 1: lsr >G1=int64#3,<G0G1=int64#3,#32
# asm 2: lsr >G1=x2,<G0G1=x2,#32
lsr x2,x2,#32

# qhasm: G0 = G0 << 32
# asm 1: lsl >G0=int64#5,<G0=int64#5,#32
# asm 2: lsl >G0=x4,<G0=x4,#32
lsl x4,x4,#32

# qhasm: F0G0 = F0 + G0
# asm 1: add >F0G0=int64#4,<F0=int64#4,<G0=int64#5
# asm 2: add >F0G0=x3,<F0=x3,<G0=x4
add x3,x3,x4

# qhasm: G1 = G1 << 32
# asm 1: lsl >G1=int64#3,<G1=int64#3,#32
# asm 2: lsl >G1=x2,<G1=x2,#32
lsl x2,x2,#32

# qhasm: F1G1 = F1 + G1
# asm 1: add >F1G1=int64#2,<F1=int64#2,<G1=int64#3
# asm 2: add >F1G1=x1,<F1=x1,<G1=x2
add x1,x1,x2

# qhasm: vec_F0_G0_0_0[0/2] = F0G0
# asm 1: ins <vec_F0_G0_0_0=reg128#1.d[0],<F0G0=int64#4
# asm 2: ins <vec_F0_G0_0_0=v0.d[0],<F0G0=x3
ins v0.d[0],x3

# qhasm: vec_F1_G1_0_0[0/2] = F1G1
# asm 1: ins <vec_F1_G1_0_0=reg128#1.d[0],<F1G1=int64#2
# asm 2: ins <vec_F1_G1_0_0=v0.d[0],<F1G1=x1
ins v0.d[0],x1
