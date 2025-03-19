
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

# qhasm: int64 pointerX

# qhasm: int64 pointerINV

# qhasm: input pointerX

# qhasm: input pointerINV 

# qhasm: int64 X_limb64_0

# qhasm: int64 X_limb64_1

# qhasm: int64 X_limb64_2

# qhasm: int64 X_limb64_3

# qhasm: int32 NINETEEN

# qhasm: int32 P2TO30M1

# qhasm: int32 P2TO15M1

# qhasm: int32 ZERO

# qhasm: int32 ONE

# qhasm: reg128 F0to3

# qhasm: reg128 F4to7

# qhasm: reg128 F8to8

# qhasm: reg128 G0to3

# qhasm: reg128 G4to7

# qhasm: reg128 G8to8

# qhasm: reg128 V0to3

# qhasm: reg128 V4to7

# qhasm: reg128 V8to8

# qhasm: reg128 S0to3

# qhasm: reg128 S4to7

# qhasm: reg128 S8to8

# qhasm: int64 f 

# qhasm: int64 g 

# qhasm: int64 delta 

# qhasm: int64 fuv 

# qhasm: int64 grs 

# qhasm: int64 uu

# qhasm: int64 vv

# qhasm: int64 rr

# qhasm: int64 ss 

# qhasm: int64 uu_new

# qhasm: int64 vv_new

# qhasm: int64 rr_new

# qhasm: int64 ss_new

# qhasm: int64 u

# qhasm: int64 v

# qhasm: int64 r

# qhasm: int64 s 

# qhasm: int64 g0_and_1 

# qhasm: int64 cond 

# qhasm: int64 c_mask

# qhasm: int64 n_mask 

# qhasm: int64 neg_fuv 

# qhasm: int64 fuv_new 

# qhasm: int64 grs_new 

# qhasm: int64 delta_swapper

# qhasm: enter cpt_inv
.align 4
.global _cpt_inv
.global cpt_inv
_cpt_inv:
cpt_inv:

# qhasm: NINETEEN = 19
# asm 1: mov >NINETEEN=int32#1, #19
# asm 2: mov >NINETEEN=w0, #19
mov w0, #19

# qhasm: P2TO30M1 = 1073741823
# asm 1: mov >P2TO30M1=int32#2, #1073741823
# asm 2: mov >P2TO30M1=w1, #1073741823
mov w1, #1073741823

# qhasm: P2TO15M1 = 32767
# asm 1: mov >P2TO15M1=int32#3, #32767
# asm 2: mov >P2TO15M1=w2, #32767
mov w2, #32767

# qhasm: ZERO     = 0 
# asm 1: mov >ZERO=int32#4, #0
# asm 2: mov >ZERO=w3, #0
mov w3, #0

# qhasm: ONE      = 1
# asm 1: mov >ONE=int32#5, #1
# asm 2: mov >ONE=w4, #1
mov w4, #1

# qhasm: 4x F0to3 = P2TO30M1 
# asm 1: dup <F0to3=reg128#1.4s,<P2TO30M1=int32#2
# asm 2: dup <F0to3=v0.4s,<P2TO30M1=w1
dup v0.4s,w1

# qhasm: 4x F4to7 = P2TO30M1
# asm 1: dup <F4to7=reg128#2.4s,<P2TO30M1=int32#2
# asm 2: dup <F4to7=v1.4s,<P2TO30M1=w1
dup v1.4s,w1

# qhasm: F8to8[0/4] = NINETEEN
# asm 1: ins <F8to8=reg128#2.s[0],<NINETEEN=int32#1
# asm 2: ins <F8to8=v1.s[0],<NINETEEN=w0
ins v1.s[0],w0

# qhasm: 4x F0to3 -= F8to8 
# asm 1: sub <F0to3=reg128#1.4s,<F0to3=reg128#1.4s,<F8to8=reg128#2.4s
# asm 2: sub <F0to3=v0.4s,<F0to3=v0.4s,<F8to8=v1.4s
sub v0.4s,v0.4s,v1.4s

# qhasm: F8to8[0/4] = P2TO15M1
# asm 1: ins <F8to8=reg128#2.s[0],<P2TO15M1=int32#3
# asm 2: ins <F8to8=v1.s[0],<P2TO15M1=w2
ins v1.s[0],w2

# qhasm: X_limb64_0, X_limb64_1 = mem128[pointerX]
# asm 1: ldp >X_limb64_0=int64#3, >X_limb64_1=int64#4, [<pointerX=int64#1]
# asm 2: ldp >X_limb64_0=x2, >X_limb64_1=x3, [<pointerX=x0]
ldp x2, x3, [x0]

# qhasm: X_limb64_2, X_limb64_3 = mem128[pointerX+16]
# asm 1: ldp >X_limb64_2=int64#1, >X_limb64_3=int64#5, [<pointerX=int64#1,#16]
# asm 2: ldp >X_limb64_2=x0, >X_limb64_3=x4, [<pointerX=x0,#16]
ldp x0, x4, [x0,#16]
error
.error
error:unknown instruction:G0to3[0/4] = (int32) X_limb64_0

# qhasm: X_limb64_0 = X_limb64_1 , X_limb64_2  >> 30
# asm 1: extr >X_limb64_0=int64#1,<X_limb64_1=int64#4,<X_limb64_2=int64#1, #30
# asm 2: extr >X_limb64_0=x0,<X_limb64_1=x3,<X_limb64_2=x0, #30
extr x0,x3,x0, #30

# qhasm: 4x V0to3 = ZERO 
# asm 1: dup <V0to3=reg128#1.4s,<ZERO=int32#4
# asm 2: dup <V0to3=v0.4s,<ZERO=w3
dup v0.4s,w3

# qhasm: 4x V4to7 = ZERO
# asm 1: dup <V4to7=reg128#1.4s,<ZERO=int32#4
# asm 2: dup <V4to7=v0.4s,<ZERO=w3
dup v0.4s,w3

# qhasm: V8to8[0/4] = ZERO
# asm 1: ins <V8to8=reg128#1.s[0],<ZERO=int32#4
# asm 2: ins <V8to8=v0.s[0],<ZERO=w3
ins v0.s[0],w3

# qhasm: 4x S0to3 = ZERO 
# asm 1: dup <S0to3=reg128#1.4s,<ZERO=int32#4
# asm 2: dup <S0to3=v0.4s,<ZERO=w3
dup v0.4s,w3

# qhasm: 4x S4to7 = ZERO
# asm 1: dup <S4to7=reg128#1.4s,<ZERO=int32#4
# asm 2: dup <S4to7=v0.4s,<ZERO=w3
dup v0.4s,w3

# qhasm: S8to8[0/4] = ONE
# asm 1: ins <S8to8=reg128#1.s[0],<ONE=int32#5
# asm 2: ins <S8to8=v0.s[0],<ONE=w4
ins v0.s[0],w4

# qhasm: return
ret
