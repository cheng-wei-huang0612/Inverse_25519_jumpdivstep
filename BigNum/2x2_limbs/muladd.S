
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

# qhasm: int64 F01

# qhasm: int64 F0

# qhasm: int64 F1

# qhasm: int64 Fhat

# qhasm: int64 G01

# qhasm: int64 G0

# qhasm: int64 G1

# qhasm: int64 Ghat

# qhasm: int64 F0G0

# qhasm: int64 F1G1

# qhasm: int64 u01 

# qhasm: int64 u0 

# qhasm: int64 u1 

# qhasm: int64 uhat

# qhasm: int64 v01 

# qhasm: int64 v0 

# qhasm: int64 v1 

# qhasm: int64 vhat

# qhasm: int64 u0v0

# qhasm: int64 u1v1

# qhasm: int64 F0xu0

# qhasm: int64 G0xv0

# qhasm: int64 R01

# qhasm: int64 R23

# qhasm: int64 R0

# qhasm: int64 R1

# qhasm: int64 R2

# qhasm: int64 R3

# qhasm: int64 S01

# qhasm: int64 S23

# qhasm: int64 ONE

# qhasm: int64 MASK2p30m1

# qhasm: int64 MASK2p32m1

# qhasm: int64 MASKupperhalf 

# qhasm: int64 MASK2p28a2p29

# qhasm: int64 MASK2p28m1

# qhasm: int64 MASK_effective_potition

# qhasm: int64 MASK_carry

# qhasm: reg128 vZERO

# qhasm: reg128 vONE

# qhasm: reg128 vMASK2p30m1

# qhasm: reg128 vMASK2p32m1

# qhasm: reg128 vMASKupperhalf

# qhasm: reg128 vMASK2p28a2p29

# qhasm: reg128 vMASK2p28m1

# qhasm: reg128 vMASK_effective_potition

# qhasm: reg128 vMASK_carry

# qhasm: reg128 FG0 

# qhasm: reg128 vec_F0_G0_0_0

# qhasm: reg128 FG1 

# qhasm: reg128 FG01 

# qhasm: reg128 FGhat 

# qhasm: reg128 uv0

# qhasm: reg128 uv1

# qhasm: reg128 uv01 

# qhasm: reg128 uvhat 

# qhasm: reg128 RS0

# qhasm: reg128 RS1

# qhasm: reg128 RS01

# qhasm: reg128 RS2

# qhasm: reg128 RS3

# qhasm: reg128 RS23

# qhasm: reg128 R0R1R2R3

# qhasm: reg128 S0S1S2S3

# qhasm: reg128 R0pS0R1pS1R2pS2R3pS3

# qhasm: reg128 tmp0

# qhasm: reg128 tmp1

# qhasm: reg128 tmp1l

# qhasm: reg128 tmp1m

# qhasm: reg128 tmp1r

# qhasm: reg128 carry

# qhasm: int64 debug0

# qhasm: int64 debug1

# qhasm: reg128 debug128

# qhasm: enter muladd
.align 4
.global _muladd
.global muladd
_muladd:
muladd:

# qhasm: u01 = mem64[pointeru]
# asm 1: ldr >u01=int64#4,[<pointeru=int64#4]
# asm 2: ldr >u01=x3,[<pointeru=x3]
ldr x3,[x3]

# qhasm: v01 = mem64[pointerv]
# asm 1: ldr >v01=int64#5,[<pointerv=int64#5]
# asm 2: ldr >v01=x4,[<pointerv=x4]
ldr x4,[x4]

# qhasm: uv01[0/2] = u01 
# asm 1: ins <uv01=reg128#1.d[0],<u01=int64#4
# asm 2: ins <uv01=v0.d[0],<u01=x3
ins v0.d[0],x3

# qhasm: uv01[1/2] = v01
# asm 1: ins <uv01=reg128#1.d[1],<v01=int64#5
# asm 2: ins <uv01=v0.d[1],<v01=x4
ins v0.d[1],x4

# qhasm: uhat = u01 signed>> 63
# asm 1: asr >uhat=int64#6,<u01=int64#4,#63
# asm 2: asr >uhat=x5,<u01=x3,#63
asr x5,x3,#63

# qhasm: vhat = v01 signed>> 63
# asm 1: asr >vhat=int64#7,<v01=int64#5,#63
# asm 2: asr >vhat=x6,<v01=x4,#63
asr x6,x4,#63

# qhasm: uvhat[0/2] = uhat 
# asm 1: ins <uvhat=reg128#2.d[0],<uhat=int64#6
# asm 2: ins <uvhat=v1.d[0],<uhat=x5
ins v1.d[0],x5

# qhasm: uvhat[1/2] = vhat
# asm 1: ins <uvhat=reg128#2.d[1],<vhat=int64#7
# asm 2: ins <uvhat=v1.d[1],<vhat=x6
ins v1.d[1],x6

# qhasm: MASK2p30m1 = 1073741823
# asm 1: mov >MASK2p30m1=int64#6, #1073741823
# asm 2: mov >MASK2p30m1=x5, #1073741823
mov x5, #1073741823

# qhasm: u0 = u01 & MASK2p30m1
# asm 1: and  >u0=int64#7,<u01=int64#4,<MASK2p30m1=int64#6
# asm 2: and  >u0=x6,<u01=x3,<MASK2p30m1=x5
and  x6,x3,x5

# qhasm: u1 = u01 unsigned>>32
# asm 1: lsr >u1=int64#4,<u01=int64#4,#32
# asm 2: lsr >u1=x3,<u01=x3,#32
lsr x3,x3,#32

# qhasm: v0 = v01 & MASK2p30m1
# asm 1: and  >v0=int64#8,<v01=int64#5,<MASK2p30m1=int64#6
# asm 2: and  >v0=x7,<v01=x4,<MASK2p30m1=x5
and  x7,x4,x5

# qhasm: v1 = v01 unsigned>>32
# asm 1: lsr >v1=int64#5,<v01=int64#5,#32
# asm 2: lsr >v1=x4,<v01=x4,#32
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

# qhasm: uv0[0/2] = u0v0
# asm 1: ins <uv0=reg128#3.d[0],<u0v0=int64#7
# asm 2: ins <uv0=v2.d[0],<u0v0=x6
ins v2.d[0],x6

# qhasm: uv1[0/2] = u1v1
# asm 1: ins <uv1=reg128#4.d[0],<u1v1=int64#4
# asm 2: ins <uv1=v3.d[0],<u1v1=x3
ins v3.d[0],x3

# qhasm: F01 = mem64[pointerF]
# asm 1: ldr >F01=int64#2,[<pointerF=int64#2]
# asm 2: ldr >F01=x1,[<pointerF=x1]
ldr x1,[x1]

# qhasm: G01 = mem64[pointerG]
# asm 1: ldr >G01=int64#3,[<pointerG=int64#3]
# asm 2: ldr >G01=x2,[<pointerG=x2]
ldr x2,[x2]

# qhasm: FG01[0/2] = F01 
# asm 1: ins <FG01=reg128#5.d[0],<F01=int64#2
# asm 2: ins <FG01=v4.d[0],<F01=x1
ins v4.d[0],x1

# qhasm: FG01[1/2] = G01
# asm 1: ins <FG01=reg128#5.d[1],<G01=int64#3
# asm 2: ins <FG01=v4.d[1],<G01=x2
ins v4.d[1],x2

# qhasm: Fhat = F01 signed>> 63
# asm 1: asr >Fhat=int64#4,<F01=int64#2,#63
# asm 2: asr >Fhat=x3,<F01=x1,#63
asr x3,x1,#63

# qhasm: Ghat = G01 signed>> 63
# asm 1: asr >Ghat=int64#5,<G01=int64#3,#63
# asm 2: asr >Ghat=x4,<G01=x2,#63
asr x4,x2,#63

# qhasm: FGhat[0/2] = Fhat
# asm 1: ins <FGhat=reg128#6.d[0],<Fhat=int64#4
# asm 2: ins <FGhat=v5.d[0],<Fhat=x3
ins v5.d[0],x3

# qhasm: FGhat[1/2] = Ghat
# asm 1: ins <FGhat=reg128#6.d[1],<Ghat=int64#5
# asm 2: ins <FGhat=v5.d[1],<Ghat=x4
ins v5.d[1],x4

# qhasm: F0 = F01 & MASK2p30m1
# asm 1: and  >F0=int64#4,<F01=int64#2,<MASK2p30m1=int64#6
# asm 2: and  >F0=x3,<F01=x1,<MASK2p30m1=x5
and  x3,x1,x5

# qhasm: F1 = F01 unsigned>>32
# asm 1: lsr >F1=int64#2,<F01=int64#2,#32
# asm 2: lsr >F1=x1,<F01=x1,#32
lsr x1,x1,#32

# qhasm: G0 = G01 & MASK2p30m1
# asm 1: and  >G0=int64#5,<G01=int64#3,<MASK2p30m1=int64#6
# asm 2: and  >G0=x4,<G01=x2,<MASK2p30m1=x5
and  x4,x2,x5

# qhasm: G1 = G01 unsigned>>32
# asm 1: lsr >G1=int64#3,<G01=int64#3,#32
# asm 2: lsr >G1=x2,<G01=x2,#32
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

# qhasm: FG0[0/2] = F0G0
# asm 1: ins <FG0=reg128#7.d[0],<F0G0=int64#4
# asm 2: ins <FG0=v6.d[0],<F0G0=x3
ins v6.d[0],x3

# qhasm: vec_F0_G0_0_0[0/2] = F0G0
# asm 1: ins <vec_F0_G0_0_0=reg128#8.d[0],<F0G0=int64#4
# asm 2: ins <vec_F0_G0_0_0=v7.d[0],<F0G0=x3
ins v7.d[0],x3

# qhasm: FG1[0/2] = F1G1
# asm 1: ins <FG1=reg128#8.d[0],<F1G1=int64#2
# asm 2: ins <FG1=v7.d[0],<F1G1=x1
ins v7.d[0],x1

# qhasm: 2x tmp0 = FG0 * uv0
# asm 1: umull >tmp0=reg128#9.2d, <FG0=reg128#7.2s, <uv0=reg128#3.2s
# asm 2: umull >tmp0=v8.2d, <FG0=v6.2s, <uv0=v2.2s
umull v8.2d, v6.2s, v2.2s

# qhasm: 2x vMASK2p30m1 = MASK2p30m1
# asm 1: dup <vMASK2p30m1=reg128#10.2d,<MASK2p30m1=int64#6
# asm 2: dup <vMASK2p30m1=v9.2d,<MASK2p30m1=x5
dup v9.2d,x5

# qhasm: RS0 = tmp0 & vMASK2p30m1
# asm 1: and >RS0=reg128#11.16b,<tmp0=reg128#9.16b,<vMASK2p30m1=reg128#10.16b
# asm 2: and >RS0=v10.16b,<tmp0=v8.16b,<vMASK2p30m1=v9.16b
and v10.16b,v8.16b,v9.16b

# qhasm: 2x tmp0 = tmp0 unsigned>> 30
# asm 1: ushr >tmp0=reg128#9.2d,<tmp0=reg128#9.2d,#30
# asm 2: ushr >tmp0=v8.2d,<tmp0=v8.2d,#30
ushr v8.2d,v8.2d,#30

# qhasm: 2x tmp0 += FG1 * uv0 
# asm 1: umlal <tmp0=reg128#9.2d,<FG1=reg128#8.2s,<uv0=reg128#3.2s
# asm 2: umlal <tmp0=v8.2d,<FG1=v7.2s,<uv0=v2.2s
umlal v8.2d,v7.2s,v2.2s

# qhasm: 2x tmp0 += FG0 * uv1
# asm 1: umlal <tmp0=reg128#9.2d,<FG0=reg128#7.2s,<uv1=reg128#4.2s
# asm 2: umlal <tmp0=v8.2d,<FG0=v6.2s,<uv1=v3.2s
umlal v8.2d,v6.2s,v3.2s

# qhasm: RS1 = tmp0 & vMASK2p30m1
# asm 1: and >RS1=reg128#3.16b,<tmp0=reg128#9.16b,<vMASK2p30m1=reg128#10.16b
# asm 2: and >RS1=v2.16b,<tmp0=v8.16b,<vMASK2p30m1=v9.16b
and v2.16b,v8.16b,v9.16b

# qhasm: 2x RS1 = RS1 << 32
# asm 1: shl >RS1=reg128#3.2d,<RS1=reg128#3.2d,#32
# asm 2: shl >RS1=v2.2d,<RS1=v2.2d,#32
shl v2.2d,v2.2d,#32

# qhasm: 2x RS01 = RS0 + RS1
# asm 1: add >RS01=reg128#3.2d,<RS0=reg128#11.2d,<RS1=reg128#3.2d
# asm 2: add >RS01=v2.2d,<RS0=v10.2d,<RS1=v2.2d
add v2.2d,v10.2d,v2.2d

# qhasm: R01 = RS01[0/2]
# asm 1: umov >R01=int64#2,<RS01=reg128#3.d[0]
# asm 2: umov >R01=x1,<RS01=v2.d[0]
umov x1,v2.d[0]

# qhasm: S01 = RS01[1/2]
# asm 1: umov >S01=int64#3,<RS01=reg128#3.d[1]
# asm 2: umov >S01=x2,<RS01=v2.d[1]
umov x2,v2.d[1]

# qhasm: 2x tmp0 = tmp0 unsigned>> 30
# asm 1: ushr >tmp0=reg128#7.2d,<tmp0=reg128#9.2d,#30
# asm 2: ushr >tmp0=v6.2d,<tmp0=v8.2d,#30
ushr v6.2d,v8.2d,#30

# qhasm: 2x tmp0 += FG1 * uv1
# asm 1: umlal <tmp0=reg128#7.2d,<FG1=reg128#8.2s,<uv1=reg128#4.2s
# asm 2: umlal <tmp0=v6.2d,<FG1=v7.2s,<uv1=v3.2s
umlal v6.2d,v7.2s,v3.2s

# qhasm: RS2 = tmp0 & vMASK2p30m1
# asm 1: and >RS2=reg128#4.16b,<tmp0=reg128#7.16b,<vMASK2p30m1=reg128#10.16b
# asm 2: and >RS2=v3.16b,<tmp0=v6.16b,<vMASK2p30m1=v9.16b
and v3.16b,v6.16b,v9.16b

# qhasm: 2x tmp0 = tmp0 unsigned>> 30
# asm 1: ushr >tmp0=reg128#7.2d,<tmp0=reg128#7.2d,#30
# asm 2: ushr >tmp0=v6.2d,<tmp0=v6.2d,#30
ushr v6.2d,v6.2d,#30

# qhasm: MASK2p32m1 = 4294967295
# asm 1: mov >MASK2p32m1=int64#4, #4294967295
# asm 2: mov >MASK2p32m1=x3, #4294967295
mov x3, #4294967295

# qhasm: 2x vMASK2p32m1 = MASK2p32m1
# asm 1: dup <vMASK2p32m1=reg128#8.2d,<MASK2p32m1=int64#4
# asm 2: dup <vMASK2p32m1=v7.2d,<MASK2p32m1=x3
dup v7.2d,x3

# qhasm: RS3 = tmp0 & vMASK2p32m1
# asm 1: and >RS3=reg128#7.16b,<tmp0=reg128#7.16b,<vMASK2p32m1=reg128#8.16b
# asm 2: and >RS3=v6.16b,<tmp0=v6.16b,<vMASK2p32m1=v7.16b
and v6.16b,v6.16b,v7.16b

# qhasm: 2x RS3 = RS3 << 32
# asm 1: shl >RS3=reg128#7.2d,<RS3=reg128#7.2d,#32
# asm 2: shl >RS3=v6.2d,<RS3=v6.2d,#32
shl v6.2d,v6.2d,#32

# qhasm: 2x RS23 = RS2 + RS3
# asm 1: add >RS23=reg128#4.2d,<RS2=reg128#4.2d,<RS3=reg128#7.2d
# asm 2: add >RS23=v3.2d,<RS2=v3.2d,<RS3=v6.2d
add v3.2d,v3.2d,v6.2d

# qhasm: tmp1 = FGhat & uv01
# asm 1: and >tmp1=reg128#1.16b,<FGhat=reg128#6.16b,<uv01=reg128#1.16b
# asm 2: and >tmp1=v0.16b,<FGhat=v5.16b,<uv01=v0.16b
and v0.16b,v5.16b,v0.16b

# qhasm: MASKupperhalf = 0xFFFFFFFF00000000 
# asm 1: mov >MASKupperhalf=int64#4, #0xFFFFFFFF00000000
# asm 2: mov >MASKupperhalf=x3, #0xFFFFFFFF00000000
mov x3, #0xFFFFFFFF00000000

# qhasm: 2x vMASKupperhalf = MASKupperhalf
# asm 1: dup <vMASKupperhalf=reg128#6.2d,<MASKupperhalf=int64#4
# asm 2: dup <vMASKupperhalf=v5.2d,<MASKupperhalf=x3
dup v5.2d,x3

# qhasm: tmp1l = tmp1 & vMASKupperhalf
# asm 1: and >tmp1l=reg128#7.16b,<tmp1=reg128#1.16b,<vMASKupperhalf=reg128#6.16b
# asm 2: and >tmp1l=v6.16b,<tmp1=v0.16b,<vMASKupperhalf=v5.16b
and v6.16b,v0.16b,v5.16b

# qhasm: MASK2p28a2p29 = 805306368
# asm 1: mov >MASK2p28a2p29=int64#4, #805306368
# asm 2: mov >MASK2p28a2p29=x3, #805306368
mov x3, #805306368

# qhasm: 2x vMASK2p28a2p29 = MASK2p28a2p29
# asm 1: dup <vMASK2p28a2p29=reg128#8.2d,<MASK2p28a2p29=int64#4
# asm 2: dup <vMASK2p28a2p29=v7.2d,<MASK2p28a2p29=x3
dup v7.2d,x3

# qhasm: tmp1m = tmp1 & vMASK2p28a2p29
# asm 1: and >tmp1m=reg128#9.16b,<tmp1=reg128#1.16b,<vMASK2p28a2p29=reg128#8.16b
# asm 2: and >tmp1m=v8.16b,<tmp1=v0.16b,<vMASK2p28a2p29=v7.16b
and v8.16b,v0.16b,v7.16b

# qhasm: MASK2p28m1 = 268435455
# asm 1: mov >MASK2p28m1=int64#4, #268435455
# asm 2: mov >MASK2p28m1=x3, #268435455
mov x3, #268435455

# qhasm: 2x vMASK2p28m1 = MASK2p28m1
# asm 1: dup <vMASK2p28m1=reg128#10.2d,<MASK2p28m1=int64#4
# asm 2: dup <vMASK2p28m1=v9.2d,<MASK2p28m1=x3
dup v9.2d,x3

# qhasm: tmp1r = tmp1 & vMASK2p28m1
# asm 1: and >tmp1r=reg128#1.16b,<tmp1=reg128#1.16b,<vMASK2p28m1=reg128#10.16b
# asm 2: and >tmp1r=v0.16b,<tmp1=v0.16b,<vMASK2p28m1=v9.16b
and v0.16b,v0.16b,v9.16b

# qhasm: 2x tmp1l = tmp1l << 2 
# asm 1: shl >tmp1l=reg128#7.2d,<tmp1l=reg128#7.2d,#2
# asm 2: shl >tmp1l=v6.2d,<tmp1l=v6.2d,#2
shl v6.2d,v6.2d,#2

# qhasm: 2x tmp1m = tmp1m << 4 
# asm 1: shl >tmp1m=reg128#9.2d,<tmp1m=reg128#9.2d,#4
# asm 2: shl >tmp1m=v8.2d,<tmp1m=v8.2d,#4
shl v8.2d,v8.2d,#4

# qhasm: 2x tmp1r = tmp1r << 2
# asm 1: shl >tmp1r=reg128#1.2d,<tmp1r=reg128#1.2d,#2
# asm 2: shl >tmp1r=v0.2d,<tmp1r=v0.2d,#2
shl v0.2d,v0.2d,#2

# qhasm: tmp1 = tmp1l
# asm 1: mov >tmp1=reg128#7.16b,<tmp1l=reg128#7.16b
# asm 2: mov >tmp1=v6.16b,<tmp1l=v6.16b
mov v6.16b,v6.16b

# qhasm: 2x tmp1 = tmp1 + tmp1m
# asm 1: add >tmp1=reg128#7.2d,<tmp1=reg128#7.2d,<tmp1m=reg128#9.2d
# asm 2: add >tmp1=v6.2d,<tmp1=v6.2d,<tmp1m=v8.2d
add v6.2d,v6.2d,v8.2d

# qhasm: 2x tmp1 = tmp1 + tmp1r
# asm 1: add >tmp1=reg128#1.2d,<tmp1=reg128#7.2d,<tmp1r=reg128#1.2d
# asm 2: add >tmp1=v0.2d,<tmp1=v6.2d,<tmp1r=v0.2d
add v0.2d,v6.2d,v0.2d

# qhasm: MASK_effective_potition = 0xFFFFFFFF3FFFFFFF
# asm 1: mov >MASK_effective_potition=int64#4, #0xFFFFFFFF3FFFFFFF
# asm 2: mov >MASK_effective_potition=x3, #0xFFFFFFFF3FFFFFFF
mov x3, #0xFFFFFFFF3FFFFFFF

# qhasm: 2x vMASK_effective_potition = MASK_effective_potition
# asm 1: dup <vMASK_effective_potition=reg128#7.2d,<MASK_effective_potition=int64#4
# asm 2: dup <vMASK_effective_potition=v6.2d,<MASK_effective_potition=x3
dup v6.2d,x3

# qhasm: tmp1 = tmp1 ^ vMASK_effective_potition
# asm 1: eor >tmp1=reg128#1.16b,<tmp1=reg128#1.16b,<vMASK_effective_potition=reg128#7.16b
# asm 2: eor >tmp1=v0.16b,<tmp1=v0.16b,<vMASK_effective_potition=v6.16b
eor v0.16b,v0.16b,v6.16b

# qhasm: ONE = 1
# asm 1: mov >ONE=int64#4, #1
# asm 2: mov >ONE=x3, #1
mov x3, #1

# qhasm: 2x vONE = ONE
# asm 1: dup <vONE=reg128#9.2d,<ONE=int64#4
# asm 2: dup <vONE=v8.2d,<ONE=x3
dup v8.2d,x3

# qhasm: 2x tmp1 = tmp1 + vONE
# asm 1: add >tmp1=reg128#1.2d,<tmp1=reg128#1.2d,<vONE=reg128#9.2d
# asm 2: add >tmp1=v0.2d,<tmp1=v0.2d,<vONE=v8.2d
add v0.2d,v0.2d,v8.2d

# qhasm: 2x RS23 = RS23 + tmp1
# asm 1: add >RS23=reg128#1.2d,<RS23=reg128#4.2d,<tmp1=reg128#1.2d
# asm 2: add >RS23=v0.2d,<RS23=v3.2d,<tmp1=v0.2d
add v0.2d,v3.2d,v0.2d

# qhasm: tmp1 = uvhat & FG01
# asm 1: and >tmp1=reg128#2.16b,<uvhat=reg128#2.16b,<FG01=reg128#5.16b
# asm 2: and >tmp1=v1.16b,<uvhat=v1.16b,<FG01=v4.16b
and v1.16b,v1.16b,v4.16b

# qhasm: tmp1l = tmp1 & vMASKupperhalf
# asm 1: and >tmp1l=reg128#4.16b,<tmp1=reg128#2.16b,<vMASKupperhalf=reg128#6.16b
# asm 2: and >tmp1l=v3.16b,<tmp1=v1.16b,<vMASKupperhalf=v5.16b
and v3.16b,v1.16b,v5.16b

# qhasm: tmp1m = tmp1 & vMASK2p28a2p29
# asm 1: and >tmp1m=reg128#5.16b,<tmp1=reg128#2.16b,<vMASK2p28a2p29=reg128#8.16b
# asm 2: and >tmp1m=v4.16b,<tmp1=v1.16b,<vMASK2p28a2p29=v7.16b
and v4.16b,v1.16b,v7.16b

# qhasm: tmp1r = tmp1 & vMASK2p28m1
# asm 1: and >tmp1r=reg128#2.16b,<tmp1=reg128#2.16b,<vMASK2p28m1=reg128#10.16b
# asm 2: and >tmp1r=v1.16b,<tmp1=v1.16b,<vMASK2p28m1=v9.16b
and v1.16b,v1.16b,v9.16b

# qhasm: 2x tmp1l = tmp1l << 2
# asm 1: shl >tmp1l=reg128#4.2d,<tmp1l=reg128#4.2d,#2
# asm 2: shl >tmp1l=v3.2d,<tmp1l=v3.2d,#2
shl v3.2d,v3.2d,#2

# qhasm: 2x tmp1m = tmp1m << 4
# asm 1: shl >tmp1m=reg128#5.2d,<tmp1m=reg128#5.2d,#4
# asm 2: shl >tmp1m=v4.2d,<tmp1m=v4.2d,#4
shl v4.2d,v4.2d,#4

# qhasm: 2x tmp1r = tmp1r << 2
# asm 1: shl >tmp1r=reg128#2.2d,<tmp1r=reg128#2.2d,#2
# asm 2: shl >tmp1r=v1.2d,<tmp1r=v1.2d,#2
shl v1.2d,v1.2d,#2

# qhasm: tmp1 = tmp1l
# asm 1: mov >tmp1=reg128#4.16b,<tmp1l=reg128#4.16b
# asm 2: mov >tmp1=v3.16b,<tmp1l=v3.16b
mov v3.16b,v3.16b

# qhasm: 2x tmp1 = tmp1 + tmp1m
# asm 1: add >tmp1=reg128#4.2d,<tmp1=reg128#4.2d,<tmp1m=reg128#5.2d
# asm 2: add >tmp1=v3.2d,<tmp1=v3.2d,<tmp1m=v4.2d
add v3.2d,v3.2d,v4.2d

# qhasm: 2x tmp1 = tmp1 + tmp1r
# asm 1: add >tmp1=reg128#2.2d,<tmp1=reg128#4.2d,<tmp1r=reg128#2.2d
# asm 2: add >tmp1=v1.2d,<tmp1=v3.2d,<tmp1r=v1.2d
add v1.2d,v3.2d,v1.2d

# qhasm: tmp1 = tmp1 ^ vMASK_effective_potition
# asm 1: eor >tmp1=reg128#2.16b,<tmp1=reg128#2.16b,<vMASK_effective_potition=reg128#7.16b
# asm 2: eor >tmp1=v1.16b,<tmp1=v1.16b,<vMASK_effective_potition=v6.16b
eor v1.16b,v1.16b,v6.16b

# qhasm: 2x tmp1 = tmp1 + vONE
# asm 1: add >tmp1=reg128#2.2d,<tmp1=reg128#2.2d,<vONE=reg128#9.2d
# asm 2: add >tmp1=v1.2d,<tmp1=v1.2d,<vONE=v8.2d
add v1.2d,v1.2d,v8.2d

# qhasm: 2x RS23 = RS23 + tmp1
# asm 1: add >RS23=reg128#1.2d,<RS23=reg128#1.2d,<tmp1=reg128#2.2d
# asm 2: add >RS23=v0.2d,<RS23=v0.2d,<tmp1=v1.2d
add v0.2d,v0.2d,v1.2d

# qhasm: MASK_carry = 0x00000000C0000000
# asm 1: mov >MASK_carry=int64#4, #0x00000000C0000000
# asm 2: mov >MASK_carry=x3, #0x00000000C0000000
mov x3, #0x00000000C0000000

# qhasm: 2x vMASK_carry = MASK_carry
# asm 1: dup <vMASK_carry=reg128#2.2d,<MASK_carry=int64#4
# asm 2: dup <vMASK_carry=v1.2d,<MASK_carry=x3
dup v1.2d,x3

# qhasm: carry = RS23 & vMASK_carry
# asm 1: and >carry=reg128#4.16b,<RS23=reg128#1.16b,<vMASK_carry=reg128#2.16b
# asm 2: and >carry=v3.16b,<RS23=v0.16b,<vMASK_carry=v1.16b
and v3.16b,v0.16b,v1.16b

# qhasm: 2x RS23 = RS23 - carry
# asm 1: sub >RS23=reg128#1.2d,<RS23=reg128#1.2d,<carry=reg128#4.2d
# asm 2: sub >RS23=v0.2d,<RS23=v0.2d,<carry=v3.2d
sub v0.2d,v0.2d,v3.2d

# qhasm: 2x carry = carry << 2
# asm 1: shl >carry=reg128#4.2d,<carry=reg128#4.2d,#2
# asm 2: shl >carry=v3.2d,<carry=v3.2d,#2
shl v3.2d,v3.2d,#2

# qhasm: 2x RS23 = RS23 + carry
# asm 1: add >RS23=reg128#1.2d,<RS23=reg128#1.2d,<carry=reg128#4.2d
# asm 2: add >RS23=v0.2d,<RS23=v0.2d,<carry=v3.2d
add v0.2d,v0.2d,v3.2d

# qhasm: 2x R0R1R2R3 zip= RS01[0/2] RS23[0/2]
# asm 1: zip1 >R0R1R2R3=reg128#4.2d,<RS01=reg128#3.2d,<RS23=reg128#1.2d
# asm 2: zip1 >R0R1R2R3=v3.2d,<RS01=v2.2d,<RS23=v0.2d
zip1 v3.2d,v2.2d,v0.2d

# qhasm: 2x S0S1S2S3 zip= RS01[1/2] RS23[1/2]
# asm 1: zip2 >S0S1S2S3=reg128#1.2d,<RS01=reg128#3.2d,<RS23=reg128#1.2d
# asm 2: zip2 >S0S1S2S3=v0.2d,<RS01=v2.2d,<RS23=v0.2d
zip2 v0.2d,v2.2d,v0.2d

# qhasm: 4x R0pS0R1pS1R2pS2R3pS3 = R0R1R2R3 + S0S1S2S3
# asm 1: add >R0pS0R1pS1R2pS2R3pS3=reg128#1.4s,<R0R1R2R3=reg128#4.4s,<S0S1S2S3=reg128#1.4s
# asm 2: add >R0pS0R1pS1R2pS2R3pS3=v0.4s,<R0R1R2R3=v3.4s,<S0S1S2S3=v0.4s
add v0.4s,v3.4s,v0.4s

# qhasm: vMASK_carry[1/2] = MASK_carry
# asm 1: ins <vMASK_carry=reg128#2.d[1],<MASK_carry=int64#4
# asm 2: ins <vMASK_carry=v1.d[1],<MASK_carry=x3
ins v1.d[1],x3

# qhasm: MASK_carry = MASK_carry + MASK_carry << 32
# asm 1: add >MASK_carry=int64#4,<MASK_carry=int64#4,<MASK_carry=int64#4,LSL #32
# asm 2: add >MASK_carry=x3,<MASK_carry=x3,<MASK_carry=x3,LSL #32
add x3,x3,x3,LSL #32

# qhasm: vMASK_carry[0/2] = MASK_carry
# asm 1: ins <vMASK_carry=reg128#2.d[0],<MASK_carry=int64#4
# asm 2: ins <vMASK_carry=v1.d[0],<MASK_carry=x3
ins v1.d[0],x3

# qhasm: carry = R0pS0R1pS1R2pS2R3pS3 & vMASK_carry
# asm 1: and >carry=reg128#3.16b,<R0pS0R1pS1R2pS2R3pS3=reg128#1.16b,<vMASK_carry=reg128#2.16b
# asm 2: and >carry=v2.16b,<R0pS0R1pS1R2pS2R3pS3=v0.16b,<vMASK_carry=v1.16b
and v2.16b,v0.16b,v1.16b

# qhasm: vMASK_carry = ~vMASK_carry
# asm 1: mvn  >vMASK_carry=reg128#2.16b,<vMASK_carry=reg128#2.16b
# asm 2: mvn  >vMASK_carry=v1.16b,<vMASK_carry=v1.16b
mvn  v1.16b,v1.16b

# qhasm: R0pS0R1pS1R2pS2R3pS3 = R0pS0R1pS1R2pS2R3pS3 & vMASK_carry
# asm 1: and >R0pS0R1pS1R2pS2R3pS3=reg128#1.16b,<R0pS0R1pS1R2pS2R3pS3=reg128#1.16b,<vMASK_carry=reg128#2.16b
# asm 2: and >R0pS0R1pS1R2pS2R3pS3=v0.16b,<R0pS0R1pS1R2pS2R3pS3=v0.16b,<vMASK_carry=v1.16b
and v0.16b,v0.16b,v1.16b

# qhasm: vZERO = carry ^ carry 
# asm 1: eor >vZERO=reg128#2.16b,<carry=reg128#3.16b,<carry=reg128#3.16b
# asm 2: eor >vZERO=v1.16b,<carry=v2.16b,<carry=v2.16b
eor v1.16b,v2.16b,v2.16b

# qhasm: carry = vZERO , carry >> 12
# asm 1: ext >carry=reg128#2.16b, <vZERO=reg128#2.16b, <carry=reg128#3.16b, #12
# asm 2: ext >carry=v1.16b, <vZERO=v1.16b, <carry=v2.16b, #12
ext v1.16b, v1.16b, v2.16b, #12

# qhasm: 4x carry = carry >> 30
# asm 1: sshr >carry=reg128#2.4s,<carry=reg128#2.4s,#30
# asm 2: sshr >carry=v1.4s,<carry=v1.4s,#30
sshr v1.4s,v1.4s,#30

# qhasm: 4x R0pS0R1pS1R2pS2R3pS3 = R0pS0R1pS1R2pS2R3pS3 + carry
# asm 1: add >R0pS0R1pS1R2pS2R3pS3=reg128#1.4s,<R0pS0R1pS1R2pS2R3pS3=reg128#1.4s,<carry=reg128#2.4s
# asm 2: add >R0pS0R1pS1R2pS2R3pS3=v0.4s,<R0pS0R1pS1R2pS2R3pS3=v0.4s,<carry=v1.4s
add v0.4s,v0.4s,v1.4s

# qhasm: debug0 = R0pS0R1pS1R2pS2R3pS3[0/2]
# asm 1: umov >debug0=int64#4,<R0pS0R1pS1R2pS2R3pS3=reg128#1.d[0]
# asm 2: umov >debug0=x3,<R0pS0R1pS1R2pS2R3pS3=v0.d[0]
umov x3,v0.d[0]

# qhasm: debug1 = R0pS0R1pS1R2pS2R3pS3[1/2]
# asm 1: umov >debug1=int64#5,<R0pS0R1pS1R2pS2R3pS3=reg128#1.d[1]
# asm 2: umov >debug1=x4,<R0pS0R1pS1R2pS2R3pS3=v0.d[1]
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
