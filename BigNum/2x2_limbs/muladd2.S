
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

# qhasm: int64 F0F1

# qhasm: int64 F0

# qhasm: int64 F1

# qhasm: int64 Fhat

# qhasm: int64 G0G1

# qhasm: int64 G0

# qhasm: int64 G1

# qhasm: int64 Ghat

# qhasm: int64 F0G0

# qhasm: int64 F1G1

# qhasm: int64 u0u1 

# qhasm: int64 u0 

# qhasm: int64 u1 

# qhasm: int64 uhat

# qhasm: int64 v0v1 

# qhasm: int64 v0 

# qhasm: int64 v1 

# qhasm: int64 vhat

# qhasm: int64 u0v0

# qhasm: int64 u1v1

# qhasm: int64 R0R1

# qhasm: int64 R2R3

# qhasm: int64 S0S1

# qhasm: int64 S2S3

# qhasm: int64 ONE

# qhasm: int64 MASK2p30m1

# qhasm: int64 MASK2p32m1

# qhasm: int64 MASKupperhalf 

# qhasm: int64 MASK2p28a2p29

# qhasm: int64 MASK2p28m1

# qhasm: int64 MASK_effective_potition

# qhasm: int64 MASK_carry

# qhasm: reg128 vec_ZERO

# qhasm: reg128 vec_ONE

# qhasm: reg128 vec_MASK2p30m1

# qhasm: reg128 vec_MASK2p32m1

# qhasm: reg128 vec_MASKupperhalf

# qhasm: reg128 vec_MASK2p28a2p29

# qhasm: reg128 vec_MASK2p28m1

# qhasm: reg128 vec_MASK_effective_potition

# qhasm: reg128 vec_MASK_carry

# qhasm: reg128 vec_F0_G0_0_0 

# qhasm: reg128 vec_F1_G1_0_0 

# qhasm: reg128 vec_F0_F1_G0_G1 

# qhasm: reg128 vec_Fhat_Ghat 

# qhasm: reg128 vec_u0_v0_0_0

# qhasm: reg128 vec_u1_v1_0_0

# qhasm: reg128 vec_u0_u1_v0_v1 

# qhasm: reg128 vec_uhat_vhat

# qhasm: reg128 vec_R0_S0

# qhasm: reg128 vec_R1_S1

# qhasm: reg128 vec_R0R1_S0S1

# qhasm: reg128 vec_R2_S2

# qhasm: reg128 vec_R3_S3

# qhasm: reg128 vec_R2R3_S2S3

# qhasm: reg128 vec_R0_R1_R2_R3

# qhasm: reg128 vec_S0_S1_S2_S3

# qhasm: reg128 vec_sum0_sum1_sum2_sum3

# qhasm: reg128 vec_tmp0

# qhasm: reg128 vec_tmp1

# qhasm: reg128 vec_tmp1l

# qhasm: reg128 vec_tmp1m

# qhasm: reg128 vec_tmp1r

# qhasm: reg128 vec_carry

# qhasm: int64 debug0

# qhasm: int64 debug1

# qhasm: reg128 debug128

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
# asm 1: ins <vec_uhat_vhat=reg128#2.d[0],<uhat=int64#6
# asm 2: ins <vec_uhat_vhat=v1.d[0],<uhat=x5
ins v1.d[0],x5

# qhasm: vec_uhat_vhat[1/2] = vhat
# asm 1: ins <vec_uhat_vhat=reg128#2.d[1],<vhat=int64#7
# asm 2: ins <vec_uhat_vhat=v1.d[1],<vhat=x6
ins v1.d[1],x6

# qhasm: MASK2p30m1 = 1073741823
# asm 1: mov >MASK2p30m1=int64#6, #1073741823
# asm 2: mov >MASK2p30m1=x5, #1073741823
mov x5, #1073741823

# qhasm: u0 = u0u1 & MASK2p30m1
# asm 1: and  >u0=int64#7,<u0u1=int64#4,<MASK2p30m1=int64#6
# asm 2: and  >u0=x6,<u0u1=x3,<MASK2p30m1=x5
and  x6,x3,x5

# qhasm: u1 = u0u1 unsigned>>32
# asm 1: lsr >u1=int64#4,<u0u1=int64#4,#32
# asm 2: lsr >u1=x3,<u0u1=x3,#32
lsr x3,x3,#32

# qhasm: v0 = v0v1 & MASK2p30m1
# asm 1: and  >v0=int64#8,<v0v1=int64#5,<MASK2p30m1=int64#6
# asm 2: and  >v0=x7,<v0v1=x4,<MASK2p30m1=x5
and  x7,x4,x5

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
# asm 1: ins <vec_u0_v0_0_0=reg128#3.d[0],<u0v0=int64#7
# asm 2: ins <vec_u0_v0_0_0=v2.d[0],<u0v0=x6
ins v2.d[0],x6

# qhasm: vec_u1_v1_0_0[0/2] = u1v1
# asm 1: ins <vec_u1_v1_0_0=reg128#4.d[0],<u1v1=int64#4
# asm 2: ins <vec_u1_v1_0_0=v3.d[0],<u1v1=x3
ins v3.d[0],x3

# qhasm: F0F1 = mem64[pointerF]
# asm 1: ldr >F0F1=int64#2,[<pointerF=int64#2]
# asm 2: ldr >F0F1=x1,[<pointerF=x1]
ldr x1,[x1]

# qhasm: G0G1 = mem64[pointerG]
# asm 1: ldr >G0G1=int64#3,[<pointerG=int64#3]
# asm 2: ldr >G0G1=x2,[<pointerG=x2]
ldr x2,[x2]

# qhasm: vec_F0_F1_G0_G1[0/2] = F0F1
# asm 1: ins <vec_F0_F1_G0_G1=reg128#5.d[0],<F0F1=int64#2
# asm 2: ins <vec_F0_F1_G0_G1=v4.d[0],<F0F1=x1
ins v4.d[0],x1

# qhasm: vec_F0_F1_G0_G1[1/2] = G0G1
# asm 1: ins <vec_F0_F1_G0_G1=reg128#5.d[1],<G0G1=int64#3
# asm 2: ins <vec_F0_F1_G0_G1=v4.d[1],<G0G1=x2
ins v4.d[1],x2

# qhasm: Fhat = F0F1 signed>> 63
# asm 1: asr >Fhat=int64#4,<F0F1=int64#2,#63
# asm 2: asr >Fhat=x3,<F0F1=x1,#63
asr x3,x1,#63

# qhasm: Ghat = G0G1 signed>> 63
# asm 1: asr >Ghat=int64#5,<G0G1=int64#3,#63
# asm 2: asr >Ghat=x4,<G0G1=x2,#63
asr x4,x2,#63

# qhasm: vec_Fhat_Ghat[0/2] = Fhat
# asm 1: ins <vec_Fhat_Ghat=reg128#6.d[0],<Fhat=int64#4
# asm 2: ins <vec_Fhat_Ghat=v5.d[0],<Fhat=x3
ins v5.d[0],x3

# qhasm: vec_Fhat_Ghat[1/2] = Ghat
# asm 1: ins <vec_Fhat_Ghat=reg128#6.d[1],<Ghat=int64#5
# asm 2: ins <vec_Fhat_Ghat=v5.d[1],<Ghat=x4
ins v5.d[1],x4

# qhasm: F0 = F0F1 & MASK2p30m1
# asm 1: and  >F0=int64#4,<F0F1=int64#2,<MASK2p30m1=int64#6
# asm 2: and  >F0=x3,<F0F1=x1,<MASK2p30m1=x5
and  x3,x1,x5

# qhasm: F1 = F0F1 unsigned>>32
# asm 1: lsr >F1=int64#2,<F0F1=int64#2,#32
# asm 2: lsr >F1=x1,<F0F1=x1,#32
lsr x1,x1,#32

# qhasm: G0 = G0G1 & MASK2p30m1
# asm 1: and  >G0=int64#5,<G0G1=int64#3,<MASK2p30m1=int64#6
# asm 2: and  >G0=x4,<G0G1=x2,<MASK2p30m1=x5
and  x4,x2,x5

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
# asm 1: ins <vec_F0_G0_0_0=reg128#7.d[0],<F0G0=int64#4
# asm 2: ins <vec_F0_G0_0_0=v6.d[0],<F0G0=x3
ins v6.d[0],x3

# qhasm: vec_F1_G1_0_0[0/2] = F1G1
# asm 1: ins <vec_F1_G1_0_0=reg128#8.d[0],<F1G1=int64#2
# asm 2: ins <vec_F1_G1_0_0=v7.d[0],<F1G1=x1
ins v7.d[0],x1

# qhasm: 2x vec_tmp0 = vec_F0_G0_0_0 * vec_u0_v0_0_0
# asm 1: umull >vec_tmp0=reg128#9.2d, <vec_F0_G0_0_0=reg128#7.2s, <vec_u0_v0_0_0=reg128#3.2s
# asm 2: umull >vec_tmp0=v8.2d, <vec_F0_G0_0_0=v6.2s, <vec_u0_v0_0_0=v2.2s
umull v8.2d, v6.2s, v2.2s

# qhasm: 2x vec_MASK2p30m1 = MASK2p30m1
# asm 1: dup <vec_MASK2p30m1=reg128#10.2d,<MASK2p30m1=int64#6
# asm 2: dup <vec_MASK2p30m1=v9.2d,<MASK2p30m1=x5
dup v9.2d,x5

# qhasm: vec_R0_S0 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R0_S0=reg128#11.16b,<vec_tmp0=reg128#9.16b,<vec_MASK2p30m1=reg128#10.16b
# asm 2: and >vec_R0_S0=v10.16b,<vec_tmp0=v8.16b,<vec_MASK2p30m1=v9.16b
and v10.16b,v8.16b,v9.16b

# qhasm: 2x vec_tmp0 = vec_tmp0 unsigned>> 30
# asm 1: ushr >vec_tmp0=reg128#9.2d,<vec_tmp0=reg128#9.2d,#30
# asm 2: ushr >vec_tmp0=v8.2d,<vec_tmp0=v8.2d,#30
ushr v8.2d,v8.2d,#30

# qhasm: 2x vec_tmp0 += vec_F1_G1_0_0 * vec_u0_v0_0_0
# asm 1: umlal <vec_tmp0=reg128#9.2d,<vec_F1_G1_0_0=reg128#8.2s,<vec_u0_v0_0_0=reg128#3.2s
# asm 2: umlal <vec_tmp0=v8.2d,<vec_F1_G1_0_0=v7.2s,<vec_u0_v0_0_0=v2.2s
umlal v8.2d,v7.2s,v2.2s

# qhasm: 2x vec_tmp0 += vec_F0_G0_0_0 * vec_u1_v1_0_0
# asm 1: umlal <vec_tmp0=reg128#9.2d,<vec_F0_G0_0_0=reg128#7.2s,<vec_u1_v1_0_0=reg128#4.2s
# asm 2: umlal <vec_tmp0=v8.2d,<vec_F0_G0_0_0=v6.2s,<vec_u1_v1_0_0=v3.2s
umlal v8.2d,v6.2s,v3.2s

# qhasm: vec_R1_S1 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R1_S1=reg128#3.16b,<vec_tmp0=reg128#9.16b,<vec_MASK2p30m1=reg128#10.16b
# asm 2: and >vec_R1_S1=v2.16b,<vec_tmp0=v8.16b,<vec_MASK2p30m1=v9.16b
and v2.16b,v8.16b,v9.16b

# qhasm: 2x vec_R1_S1 = vec_R1_S1 << 32
# asm 1: shl >vec_R1_S1=reg128#3.2d,<vec_R1_S1=reg128#3.2d,#32
# asm 2: shl >vec_R1_S1=v2.2d,<vec_R1_S1=v2.2d,#32
shl v2.2d,v2.2d,#32

# qhasm: 2x vec_R0R1_S0S1 = vec_R0_S0 + vec_R1_S1
# asm 1: add >vec_R0R1_S0S1=reg128#3.2d,<vec_R0_S0=reg128#11.2d,<vec_R1_S1=reg128#3.2d
# asm 2: add >vec_R0R1_S0S1=v2.2d,<vec_R0_S0=v10.2d,<vec_R1_S1=v2.2d
add v2.2d,v10.2d,v2.2d

# qhasm: R0R1 = vec_R0R1_S0S1[0/2]
# asm 1: umov >R0R1=int64#2,<vec_R0R1_S0S1=reg128#3.d[0]
# asm 2: umov >R0R1=x1,<vec_R0R1_S0S1=v2.d[0]
umov x1,v2.d[0]

# qhasm: S0S1 = vec_R0R1_S0S1[1/2]
# asm 1: umov >S0S1=int64#3,<vec_R0R1_S0S1=reg128#3.d[1]
# asm 2: umov >S0S1=x2,<vec_R0R1_S0S1=v2.d[1]
umov x2,v2.d[1]

# qhasm: 2x vec_tmp0 = vec_tmp0 unsigned>> 30
# asm 1: ushr >vec_tmp0=reg128#7.2d,<vec_tmp0=reg128#9.2d,#30
# asm 2: ushr >vec_tmp0=v6.2d,<vec_tmp0=v8.2d,#30
ushr v6.2d,v8.2d,#30

# qhasm: 2x vec_tmp0 += vec_F1_G1_0_0 * vec_u1_v1_0_0
# asm 1: umlal <vec_tmp0=reg128#7.2d,<vec_F1_G1_0_0=reg128#8.2s,<vec_u1_v1_0_0=reg128#4.2s
# asm 2: umlal <vec_tmp0=v6.2d,<vec_F1_G1_0_0=v7.2s,<vec_u1_v1_0_0=v3.2s
umlal v6.2d,v7.2s,v3.2s

# qhasm: vec_R2_S2 = vec_tmp0 & vec_MASK2p30m1
# asm 1: and >vec_R2_S2=reg128#4.16b,<vec_tmp0=reg128#7.16b,<vec_MASK2p30m1=reg128#10.16b
# asm 2: and >vec_R2_S2=v3.16b,<vec_tmp0=v6.16b,<vec_MASK2p30m1=v9.16b
and v3.16b,v6.16b,v9.16b

# qhasm: 2x vec_tmp0 = vec_tmp0 unsigned>> 30
# asm 1: ushr >vec_tmp0=reg128#7.2d,<vec_tmp0=reg128#7.2d,#30
# asm 2: ushr >vec_tmp0=v6.2d,<vec_tmp0=v6.2d,#30
ushr v6.2d,v6.2d,#30

# qhasm: MASK2p32m1 = 4294967295
# asm 1: mov >MASK2p32m1=int64#4, #4294967295
# asm 2: mov >MASK2p32m1=x3, #4294967295
mov x3, #4294967295

# qhasm: 2x vec_MASK2p32m1 = MASK2p32m1
# asm 1: dup <vec_MASK2p32m1=reg128#8.2d,<MASK2p32m1=int64#4
# asm 2: dup <vec_MASK2p32m1=v7.2d,<MASK2p32m1=x3
dup v7.2d,x3

# qhasm: vec_R3_S3 = vec_tmp0 & vec_MASK2p32m1
# asm 1: and >vec_R3_S3=reg128#7.16b,<vec_tmp0=reg128#7.16b,<vec_MASK2p32m1=reg128#8.16b
# asm 2: and >vec_R3_S3=v6.16b,<vec_tmp0=v6.16b,<vec_MASK2p32m1=v7.16b
and v6.16b,v6.16b,v7.16b

# qhasm: 2x vec_R3_S3 = vec_R3_S3 << 32
# asm 1: shl >vec_R3_S3=reg128#7.2d,<vec_R3_S3=reg128#7.2d,#32
# asm 2: shl >vec_R3_S3=v6.2d,<vec_R3_S3=v6.2d,#32
shl v6.2d,v6.2d,#32

# qhasm: 2x vec_R2R3_S2S3 = vec_R2_S2 + vec_R3_S3
# asm 1: add >vec_R2R3_S2S3=reg128#4.2d,<vec_R2_S2=reg128#4.2d,<vec_R3_S3=reg128#7.2d
# asm 2: add >vec_R2R3_S2S3=v3.2d,<vec_R2_S2=v3.2d,<vec_R3_S3=v6.2d
add v3.2d,v3.2d,v6.2d

# qhasm: vec_tmp1 = vec_Fhat_Ghat & vec_u0_u1_v0_v1
# asm 1: and >vec_tmp1=reg128#1.16b,<vec_Fhat_Ghat=reg128#6.16b,<vec_u0_u1_v0_v1=reg128#1.16b
# asm 2: and >vec_tmp1=v0.16b,<vec_Fhat_Ghat=v5.16b,<vec_u0_u1_v0_v1=v0.16b
and v0.16b,v5.16b,v0.16b

# qhasm: MASKupperhalf = 0xFFFFFFFF00000000 
# asm 1: mov >MASKupperhalf=int64#4, #0xFFFFFFFF00000000
# asm 2: mov >MASKupperhalf=x3, #0xFFFFFFFF00000000
mov x3, #0xFFFFFFFF00000000

# qhasm: 2x vec_MASKupperhalf = MASKupperhalf
# asm 1: dup <vec_MASKupperhalf=reg128#6.2d,<MASKupperhalf=int64#4
# asm 2: dup <vec_MASKupperhalf=v5.2d,<MASKupperhalf=x3
dup v5.2d,x3

# qhasm: vec_tmp1l = vec_tmp1 & vec_MASKupperhalf
# asm 1: and >vec_tmp1l=reg128#7.16b,<vec_tmp1=reg128#1.16b,<vec_MASKupperhalf=reg128#6.16b
# asm 2: and >vec_tmp1l=v6.16b,<vec_tmp1=v0.16b,<vec_MASKupperhalf=v5.16b
and v6.16b,v0.16b,v5.16b

# qhasm: MASK2p28a2p29 = 805306368
# asm 1: mov >MASK2p28a2p29=int64#4, #805306368
# asm 2: mov >MASK2p28a2p29=x3, #805306368
mov x3, #805306368

# qhasm: 2x vec_MASK2p28a2p29 = MASK2p28a2p29
# asm 1: dup <vec_MASK2p28a2p29=reg128#8.2d,<MASK2p28a2p29=int64#4
# asm 2: dup <vec_MASK2p28a2p29=v7.2d,<MASK2p28a2p29=x3
dup v7.2d,x3

# qhasm: vec_tmp1m = vec_tmp1 & vec_MASK2p28a2p29
# asm 1: and >vec_tmp1m=reg128#9.16b,<vec_tmp1=reg128#1.16b,<vec_MASK2p28a2p29=reg128#8.16b
# asm 2: and >vec_tmp1m=v8.16b,<vec_tmp1=v0.16b,<vec_MASK2p28a2p29=v7.16b
and v8.16b,v0.16b,v7.16b

# qhasm: MASK2p28m1 = 268435455
# asm 1: mov >MASK2p28m1=int64#4, #268435455
# asm 2: mov >MASK2p28m1=x3, #268435455
mov x3, #268435455

# qhasm: 2x vec_MASK2p28m1 = MASK2p28m1
# asm 1: dup <vec_MASK2p28m1=reg128#10.2d,<MASK2p28m1=int64#4
# asm 2: dup <vec_MASK2p28m1=v9.2d,<MASK2p28m1=x3
dup v9.2d,x3

# qhasm: vec_tmp1r = vec_tmp1 & vec_MASK2p28m1
# asm 1: and >vec_tmp1r=reg128#1.16b,<vec_tmp1=reg128#1.16b,<vec_MASK2p28m1=reg128#10.16b
# asm 2: and >vec_tmp1r=v0.16b,<vec_tmp1=v0.16b,<vec_MASK2p28m1=v9.16b
and v0.16b,v0.16b,v9.16b

# qhasm: 2x vec_tmp1l = vec_tmp1l << 2 
# asm 1: shl >vec_tmp1l=reg128#7.2d,<vec_tmp1l=reg128#7.2d,#2
# asm 2: shl >vec_tmp1l=v6.2d,<vec_tmp1l=v6.2d,#2
shl v6.2d,v6.2d,#2

# qhasm: 2x vec_tmp1m = vec_tmp1m << 4 
# asm 1: shl >vec_tmp1m=reg128#9.2d,<vec_tmp1m=reg128#9.2d,#4
# asm 2: shl >vec_tmp1m=v8.2d,<vec_tmp1m=v8.2d,#4
shl v8.2d,v8.2d,#4

# qhasm: 2x vec_tmp1r = vec_tmp1r << 2
# asm 1: shl >vec_tmp1r=reg128#1.2d,<vec_tmp1r=reg128#1.2d,#2
# asm 2: shl >vec_tmp1r=v0.2d,<vec_tmp1r=v0.2d,#2
shl v0.2d,v0.2d,#2

# qhasm: vec_tmp1 = vec_tmp1l
# asm 1: mov >vec_tmp1=reg128#7.16b,<vec_tmp1l=reg128#7.16b
# asm 2: mov >vec_tmp1=v6.16b,<vec_tmp1l=v6.16b
mov v6.16b,v6.16b

# qhasm: 2x vec_tmp1 = vec_tmp1 + vec_tmp1m
# asm 1: add >vec_tmp1=reg128#7.2d,<vec_tmp1=reg128#7.2d,<vec_tmp1m=reg128#9.2d
# asm 2: add >vec_tmp1=v6.2d,<vec_tmp1=v6.2d,<vec_tmp1m=v8.2d
add v6.2d,v6.2d,v8.2d

# qhasm: 2x vec_tmp1 = vec_tmp1 + vec_tmp1r
# asm 1: add >vec_tmp1=reg128#1.2d,<vec_tmp1=reg128#7.2d,<vec_tmp1r=reg128#1.2d
# asm 2: add >vec_tmp1=v0.2d,<vec_tmp1=v6.2d,<vec_tmp1r=v0.2d
add v0.2d,v6.2d,v0.2d

# qhasm: MASK_effective_potition = 0xFFFFFFFF3FFFFFFF
# asm 1: mov >MASK_effective_potition=int64#4, #0xFFFFFFFF3FFFFFFF
# asm 2: mov >MASK_effective_potition=x3, #0xFFFFFFFF3FFFFFFF
mov x3, #0xFFFFFFFF3FFFFFFF

# qhasm: 2x vec_MASK_effective_potition = MASK_effective_potition
# asm 1: dup <vec_MASK_effective_potition=reg128#7.2d,<MASK_effective_potition=int64#4
# asm 2: dup <vec_MASK_effective_potition=v6.2d,<MASK_effective_potition=x3
dup v6.2d,x3

# qhasm: vec_tmp1 = vec_tmp1 ^ vec_MASK_effective_potition
# asm 1: eor >vec_tmp1=reg128#1.16b,<vec_tmp1=reg128#1.16b,<vec_MASK_effective_potition=reg128#7.16b
# asm 2: eor >vec_tmp1=v0.16b,<vec_tmp1=v0.16b,<vec_MASK_effective_potition=v6.16b
eor v0.16b,v0.16b,v6.16b

# qhasm: ONE = 1
# asm 1: mov >ONE=int64#4, #1
# asm 2: mov >ONE=x3, #1
mov x3, #1

# qhasm: 2x vec_ONE = ONE
# asm 1: dup <vec_ONE=reg128#9.2d,<ONE=int64#4
# asm 2: dup <vec_ONE=v8.2d,<ONE=x3
dup v8.2d,x3

# qhasm: 2x vec_tmp1 = vec_tmp1 + vec_ONE
# asm 1: add >vec_tmp1=reg128#1.2d,<vec_tmp1=reg128#1.2d,<vec_ONE=reg128#9.2d
# asm 2: add >vec_tmp1=v0.2d,<vec_tmp1=v0.2d,<vec_ONE=v8.2d
add v0.2d,v0.2d,v8.2d

# qhasm: 2x vec_R2R3_S2S3 = vec_R2R3_S2S3 + vec_tmp1
# asm 1: add >vec_R2R3_S2S3=reg128#1.2d,<vec_R2R3_S2S3=reg128#4.2d,<vec_tmp1=reg128#1.2d
# asm 2: add >vec_R2R3_S2S3=v0.2d,<vec_R2R3_S2S3=v3.2d,<vec_tmp1=v0.2d
add v0.2d,v3.2d,v0.2d

# qhasm: vec_tmp1 = vec_uhat_vhat & vec_F0_F1_G0_G1
# asm 1: and >vec_tmp1=reg128#2.16b,<vec_uhat_vhat=reg128#2.16b,<vec_F0_F1_G0_G1=reg128#5.16b
# asm 2: and >vec_tmp1=v1.16b,<vec_uhat_vhat=v1.16b,<vec_F0_F1_G0_G1=v4.16b
and v1.16b,v1.16b,v4.16b

# qhasm: vec_tmp1l = vec_tmp1 & vec_MASKupperhalf
# asm 1: and >vec_tmp1l=reg128#4.16b,<vec_tmp1=reg128#2.16b,<vec_MASKupperhalf=reg128#6.16b
# asm 2: and >vec_tmp1l=v3.16b,<vec_tmp1=v1.16b,<vec_MASKupperhalf=v5.16b
and v3.16b,v1.16b,v5.16b

# qhasm: vec_tmp1m = vec_tmp1 & vec_MASK2p28a2p29
# asm 1: and >vec_tmp1m=reg128#5.16b,<vec_tmp1=reg128#2.16b,<vec_MASK2p28a2p29=reg128#8.16b
# asm 2: and >vec_tmp1m=v4.16b,<vec_tmp1=v1.16b,<vec_MASK2p28a2p29=v7.16b
and v4.16b,v1.16b,v7.16b

# qhasm: vec_tmp1r = vec_tmp1 & vec_MASK2p28m1
# asm 1: and >vec_tmp1r=reg128#2.16b,<vec_tmp1=reg128#2.16b,<vec_MASK2p28m1=reg128#10.16b
# asm 2: and >vec_tmp1r=v1.16b,<vec_tmp1=v1.16b,<vec_MASK2p28m1=v9.16b
and v1.16b,v1.16b,v9.16b

# qhasm: 2x vec_tmp1l = vec_tmp1l << 2
# asm 1: shl >vec_tmp1l=reg128#4.2d,<vec_tmp1l=reg128#4.2d,#2
# asm 2: shl >vec_tmp1l=v3.2d,<vec_tmp1l=v3.2d,#2
shl v3.2d,v3.2d,#2

# qhasm: 2x vec_tmp1m = vec_tmp1m << 4
# asm 1: shl >vec_tmp1m=reg128#5.2d,<vec_tmp1m=reg128#5.2d,#4
# asm 2: shl >vec_tmp1m=v4.2d,<vec_tmp1m=v4.2d,#4
shl v4.2d,v4.2d,#4

# qhasm: 2x vec_tmp1r = vec_tmp1r << 2
# asm 1: shl >vec_tmp1r=reg128#2.2d,<vec_tmp1r=reg128#2.2d,#2
# asm 2: shl >vec_tmp1r=v1.2d,<vec_tmp1r=v1.2d,#2
shl v1.2d,v1.2d,#2

# qhasm: vec_tmp1 = vec_tmp1l
# asm 1: mov >vec_tmp1=reg128#4.16b,<vec_tmp1l=reg128#4.16b
# asm 2: mov >vec_tmp1=v3.16b,<vec_tmp1l=v3.16b
mov v3.16b,v3.16b

# qhasm: 2x vec_tmp1 = vec_tmp1 + vec_tmp1m
# asm 1: add >vec_tmp1=reg128#4.2d,<vec_tmp1=reg128#4.2d,<vec_tmp1m=reg128#5.2d
# asm 2: add >vec_tmp1=v3.2d,<vec_tmp1=v3.2d,<vec_tmp1m=v4.2d
add v3.2d,v3.2d,v4.2d

# qhasm: 2x vec_tmp1 = vec_tmp1 + vec_tmp1r
# asm 1: add >vec_tmp1=reg128#2.2d,<vec_tmp1=reg128#4.2d,<vec_tmp1r=reg128#2.2d
# asm 2: add >vec_tmp1=v1.2d,<vec_tmp1=v3.2d,<vec_tmp1r=v1.2d
add v1.2d,v3.2d,v1.2d

# qhasm: vec_tmp1 = vec_tmp1 ^ vec_MASK_effective_potition
# asm 1: eor >vec_tmp1=reg128#2.16b,<vec_tmp1=reg128#2.16b,<vec_MASK_effective_potition=reg128#7.16b
# asm 2: eor >vec_tmp1=v1.16b,<vec_tmp1=v1.16b,<vec_MASK_effective_potition=v6.16b
eor v1.16b,v1.16b,v6.16b

# qhasm: 2x vec_tmp1 = vec_tmp1 + vec_ONE
# asm 1: add >vec_tmp1=reg128#2.2d,<vec_tmp1=reg128#2.2d,<vec_ONE=reg128#9.2d
# asm 2: add >vec_tmp1=v1.2d,<vec_tmp1=v1.2d,<vec_ONE=v8.2d
add v1.2d,v1.2d,v8.2d

# qhasm: 2x vec_R2R3_S2S3 = vec_R2R3_S2S3 + vec_tmp1
# asm 1: add >vec_R2R3_S2S3=reg128#1.2d,<vec_R2R3_S2S3=reg128#1.2d,<vec_tmp1=reg128#2.2d
# asm 2: add >vec_R2R3_S2S3=v0.2d,<vec_R2R3_S2S3=v0.2d,<vec_tmp1=v1.2d
add v0.2d,v0.2d,v1.2d

# qhasm: MASK_carry = 0x00000000C0000000
# asm 1: mov >MASK_carry=int64#4, #0x00000000C0000000
# asm 2: mov >MASK_carry=x3, #0x00000000C0000000
mov x3, #0x00000000C0000000

# qhasm: 2x vec_MASK_carry = MASK_carry
# asm 1: dup <vec_MASK_carry=reg128#2.2d,<MASK_carry=int64#4
# asm 2: dup <vec_MASK_carry=v1.2d,<MASK_carry=x3
dup v1.2d,x3

# qhasm: vec_carry = vec_R2R3_S2S3 & vec_MASK_carry
# asm 1: and >vec_carry=reg128#4.16b,<vec_R2R3_S2S3=reg128#1.16b,<vec_MASK_carry=reg128#2.16b
# asm 2: and >vec_carry=v3.16b,<vec_R2R3_S2S3=v0.16b,<vec_MASK_carry=v1.16b
and v3.16b,v0.16b,v1.16b

# qhasm: 2x vec_R2R3_S2S3 = vec_R2R3_S2S3 - vec_carry
# asm 1: sub >vec_R2R3_S2S3=reg128#1.2d,<vec_R2R3_S2S3=reg128#1.2d,<vec_carry=reg128#4.2d
# asm 2: sub >vec_R2R3_S2S3=v0.2d,<vec_R2R3_S2S3=v0.2d,<vec_carry=v3.2d
sub v0.2d,v0.2d,v3.2d

# qhasm: 2x vec_carry = vec_carry << 2
# asm 1: shl >vec_carry=reg128#4.2d,<vec_carry=reg128#4.2d,#2
# asm 2: shl >vec_carry=v3.2d,<vec_carry=v3.2d,#2
shl v3.2d,v3.2d,#2

# qhasm: 2x vec_R2R3_S2S3 = vec_R2R3_S2S3 + vec_carry
# asm 1: add >vec_R2R3_S2S3=reg128#1.2d,<vec_R2R3_S2S3=reg128#1.2d,<vec_carry=reg128#4.2d
# asm 2: add >vec_R2R3_S2S3=v0.2d,<vec_R2R3_S2S3=v0.2d,<vec_carry=v3.2d
add v0.2d,v0.2d,v3.2d

# qhasm: 2x vec_R0_R1_R2_R3 zip= vec_R0R1_S0S1[0/2] vec_R2R3_S2S3[0/2]
# asm 1: zip1 >vec_R0_R1_R2_R3=reg128#4.2d,<vec_R0R1_S0S1=reg128#3.2d,<vec_R2R3_S2S3=reg128#1.2d
# asm 2: zip1 >vec_R0_R1_R2_R3=v3.2d,<vec_R0R1_S0S1=v2.2d,<vec_R2R3_S2S3=v0.2d
zip1 v3.2d,v2.2d,v0.2d

# qhasm: 2x vec_S0_S1_S2_S3 zip= vec_R0R1_S0S1[1/2] vec_R2R3_S2S3[1/2]
# asm 1: zip2 >vec_S0_S1_S2_S3=reg128#1.2d,<vec_R0R1_S0S1=reg128#3.2d,<vec_R2R3_S2S3=reg128#1.2d
# asm 2: zip2 >vec_S0_S1_S2_S3=v0.2d,<vec_R0R1_S0S1=v2.2d,<vec_R2R3_S2S3=v0.2d
zip2 v0.2d,v2.2d,v0.2d

# qhasm: 4x vec_sum0_sum1_sum2_sum3 = vec_R0_R1_R2_R3 + vec_S0_S1_S2_S3
# asm 1: add >vec_sum0_sum1_sum2_sum3=reg128#1.4s,<vec_R0_R1_R2_R3=reg128#4.4s,<vec_S0_S1_S2_S3=reg128#1.4s
# asm 2: add >vec_sum0_sum1_sum2_sum3=v0.4s,<vec_R0_R1_R2_R3=v3.4s,<vec_S0_S1_S2_S3=v0.4s
add v0.4s,v3.4s,v0.4s

# qhasm: vec_MASK_carry[1/2] = MASK_carry
# asm 1: ins <vec_MASK_carry=reg128#2.d[1],<MASK_carry=int64#4
# asm 2: ins <vec_MASK_carry=v1.d[1],<MASK_carry=x3
ins v1.d[1],x3

# qhasm: MASK_carry = MASK_carry + MASK_carry << 32
# asm 1: add >MASK_carry=int64#4,<MASK_carry=int64#4,<MASK_carry=int64#4,LSL #32
# asm 2: add >MASK_carry=x3,<MASK_carry=x3,<MASK_carry=x3,LSL #32
add x3,x3,x3,LSL #32

# qhasm: vec_MASK_carry[0/2] = MASK_carry
# asm 1: ins <vec_MASK_carry=reg128#2.d[0],<MASK_carry=int64#4
# asm 2: ins <vec_MASK_carry=v1.d[0],<MASK_carry=x3
ins v1.d[0],x3

# qhasm: vec_carry = vec_sum0_sum1_sum2_sum3 & vec_MASK_carry
# asm 1: and >vec_carry=reg128#2.16b,<vec_sum0_sum1_sum2_sum3=reg128#1.16b,<vec_MASK_carry=reg128#2.16b
# asm 2: and >vec_carry=v1.16b,<vec_sum0_sum1_sum2_sum3=v0.16b,<vec_MASK_carry=v1.16b
and v1.16b,v0.16b,v1.16b

# qhasm: 4x vec_sum0_sum1_sum2_sum3 = vec_sum0_sum1_sum2_sum3 - vec_carry
# asm 1: sub >vec_sum0_sum1_sum2_sum3=reg128#1.4s,<vec_sum0_sum1_sum2_sum3=reg128#1.4s,<vec_carry=reg128#2.4s
# asm 2: sub >vec_sum0_sum1_sum2_sum3=v0.4s,<vec_sum0_sum1_sum2_sum3=v0.4s,<vec_carry=v1.4s
sub v0.4s,v0.4s,v1.4s

# qhasm: vec_ZERO = vec_carry ^ vec_carry 
# asm 1: eor >vec_ZERO=reg128#3.16b,<vec_carry=reg128#2.16b,<vec_carry=reg128#2.16b
# asm 2: eor >vec_ZERO=v2.16b,<vec_carry=v1.16b,<vec_carry=v1.16b
eor v2.16b,v1.16b,v1.16b

# qhasm: vec_carry = vec_ZERO , vec_carry >> 12
# asm 1: ext >vec_carry=reg128#2.16b, <vec_ZERO=reg128#3.16b, <vec_carry=reg128#2.16b, #12
# asm 2: ext >vec_carry=v1.16b, <vec_ZERO=v2.16b, <vec_carry=v1.16b, #12
ext v1.16b, v2.16b, v1.16b, #12

# qhasm: 4x vec_carry = vec_carry >> 30
# asm 1: sshr >vec_carry=reg128#2.4s,<vec_carry=reg128#2.4s,#30
# asm 2: sshr >vec_carry=v1.4s,<vec_carry=v1.4s,#30
sshr v1.4s,v1.4s,#30

# qhasm: 4x vec_sum0_sum1_sum2_sum3 = vec_sum0_sum1_sum2_sum3 + vec_carry
# asm 1: add >vec_sum0_sum1_sum2_sum3=reg128#1.4s,<vec_sum0_sum1_sum2_sum3=reg128#1.4s,<vec_carry=reg128#2.4s
# asm 2: add >vec_sum0_sum1_sum2_sum3=v0.4s,<vec_sum0_sum1_sum2_sum3=v0.4s,<vec_carry=v1.4s
add v0.4s,v0.4s,v1.4s

# qhasm: debug0 = vec_sum0_sum1_sum2_sum3[0/2]
# asm 1: umov >debug0=int64#4,<vec_sum0_sum1_sum2_sum3=reg128#1.d[0]
# asm 2: umov >debug0=x3,<vec_sum0_sum1_sum2_sum3=v0.d[0]
umov x3,v0.d[0]

# qhasm: debug1 = vec_sum0_sum1_sum2_sum3[1/2]
# asm 1: umov >debug1=int64#5,<vec_sum0_sum1_sum2_sum3=reg128#1.d[1]
# asm 2: umov >debug1=x4,<vec_sum0_sum1_sum2_sum3=v0.d[1]
umov x4,v0.d[1]

# qhasm: mem64[pointerR] = debug0
# asm 1: str <debug0=int64#4,[<pointerR=int64#1]
# asm 2: str <debug0=x3,[<pointerR=x0]
str x3,[x0]

# qhasm: mem64[pointerR+8] = debug1
# asm 1: str <debug1=int64#5,[<pointerR=int64#1,#8]
# asm 2: str <debug1=x4,[<pointerR=x0,#8]
str x4,[x0,#8]

# qhasm: return
ret
