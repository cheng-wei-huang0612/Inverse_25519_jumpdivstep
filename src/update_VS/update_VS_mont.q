enter update_VS_mont

int64 pointerV
int64 pointerS
int64 pointeruuvvrrss

input pointerV
input pointerS
input pointeruuvvrrss

# Calling Convention

caller calleesaved_v8
caller calleesaved_v9
caller calleesaved_v10
caller calleesaved_v11
caller calleesaved_v12
caller calleesaved_v13
caller calleesaved_v14
caller calleesaved_v15
push2x8b calleesaved_v8, calleesaved_v9
push2x8b calleesaved_v10, calleesaved_v11
push2x8b calleesaved_v12, calleesaved_v13
push2x8b calleesaved_v14, calleesaved_v15

# register initialization and specification


reg128 vec_F0_F1_G0_G1
assign v0 to vec_F0_F1_G0_G1
reg128 vec_F2_F3_G2_G3
assign v1 to vec_F2_F3_G2_G3
reg128 vec_F4_F5_G4_G5
assign v2 to vec_F4_F5_G4_G5
reg128 vec_F6_F7_G6_G7
assign v3 to vec_F6_F7_G6_G7
reg128 vec_F8_F9_G8_G9
assign v4 to vec_F8_F9_G8_G9
# The F9, G9 are always 0, we put them here for easy program writing

reg128 vec_V0_V1_S0_S1
assign v5 to vec_V0_V1_S0_S1
reg128 vec_V2_V3_S2_S3
assign v6 to vec_V2_V3_S2_S3
reg128 vec_V4_V5_S4_S5
assign v7 to vec_V4_V5_S4_S5
reg128 vec_V6_V7_S6_S7
assign v8 to vec_V6_V7_S6_S7
reg128 vec_V8_V9_S8_S9
assign v9 to vec_V8_V9_S8_S9
# The V9, S9 are always 0, we put them here for easy program writing

reg128 vec_uu0_rr0_vv0_ss0
assign v10 to vec_uu0_rr0_vv0_ss0
reg128 vec_uu1_rr1_vv1_ss1
assign v11 to vec_uu1_rr1_vv1_ss1
reg128 vec_uuhat_rrhat_vvhat_sshat
assign v12 to vec_uuhat_rrhat_vvhat_sshat

reg128 vec_2x_2p30m1
assign v13 to vec_2x_2p30m1

int64 2p30m1
2p30m1 = 1073741823
2x vec_2x_2p30m1 = 2p30m1



# V, S Data Layout Configuration

int64 V0V1
int64 V2V3
int64 V4V5
int64 V6V7
int64 V8V9

V0V1, V2V3 = mem128[pointerV]
V4V5, V6V7 = mem128[pointerV+16]
V8V9 = mem32[pointerV+32]

int64 S0S1
int64 S2S3
int64 S4S5
int64 S6S7
int64 S8S9

S0S1, S2S3 = mem128[pointerS]
S4S5, S6S7 = mem128[pointerS+16]
S8S9 = mem32[pointerS+32]


vec_V0_V1_S0_S1[0/2] = V0V1 
vec_V0_V1_S0_S1[1/2] = S0S1 


vec_V2_V3_S2_S3[0/2] = V2V3 
vec_V2_V3_S2_S3[1/2] = S2S3 


vec_V4_V5_S4_S5[0/2] = V4V5 
vec_V4_V5_S4_S5[1/2] = S4S5 


vec_V6_V7_S6_S7[0/2] = V6V7 
vec_V6_V7_S6_S7[1/2] = S6S7 


vec_V8_V9_S8_S9[0/2] = V8V9 
vec_V8_V9_S8_S9[1/2] = S8S9 



# At this function, the uu, vv, rr, ss are already in neon registers

int64 uu
int64 vv
int64 rr
int64 ss

uu, vv = mem128[pointeruuvvrrss + 0]
rr, ss = mem128[pointeruuvvrrss + 16]

int64 uu0
int64 uu1
uu0 = uu & ((1 << 30)-1)
uu1 = (uu >> 30) & ((1 << 32)-1)

int64 vv0
int64 vv1
vv0 = vv & ((1 << 30)-1)
vv1 = (vv >> 30) & ((1 << 32)-1)

int64 rr0
int64 rr1
rr0 = rr & ((1 << 30)-1)
rr1 = (rr >> 30) & ((1 << 32)-1)

int64 ss0
int64 ss1
ss0 = ss & ((1 << 30)-1)
ss1 = (ss >> 30) & ((1 << 32)-1)


vec_uu0_rr0_vv0_ss0[0/4] = uu0
vec_uu0_rr0_vv0_ss0[1/4] = rr0
vec_uu0_rr0_vv0_ss0[2/4] = vv0
vec_uu0_rr0_vv0_ss0[3/4] = ss0


vec_uu1_rr1_vv1_ss1[0/4] = uu1
vec_uu1_rr1_vv1_ss1[1/4] = rr1
vec_uu1_rr1_vv1_ss1[2/4] = vv1
vec_uu1_rr1_vv1_ss1[3/4] = ss1





# Get the hats
4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31

reg128 front_vec_4x_2p30a2p31
4x front_vec_4x_2p30a2p31 = 0xC0 << 24
vec_uu1_rr1_vv1_ss1 &= ~front_vec_4x_2p30a2p31




# Now we do vec_uuV[0:9]_0_rrV[0:9]_0 = [uu0 * V, rr0 * V]

reg128 vec_prod
2x vec_prod = 0
reg128 vec_prod_1
2x vec_prod_1 = 0

reg128 vec_buf

# Prepare P values

int64 2p30m19
int64 2p15m1

reg128 vec_2x_2p30m19
reg128 vec_2x_2p15m1

2p30m19 = 2p30m1 - 18
2p15m1 = 2p30m1 unsigned>> 15

2x vec_2x_2p30m19 = 2p30m19
2x vec_2x_2p15m1 = 2p15m1
int64 M

#M = 678152731
M = 0
M[0/4] = 51739
M[1/4] = 10347
reg128 vec_M
4x vec_M = M
# vec_M = [M, M, M, M]




reg128 vec_l0_V
reg128 vec_l0_S
reg128 vec_l1_V
reg128 vec_l1_S

2x vec_prod = vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[0/4]
4x vec_l0_V = vec_prod * vec_M
vec_l0_V &= vec_2x_2p30m1
4x vec_l0_V = vec_l0_V[0/4] vec_l0_V[2/4] vec_l0_V[0/4] vec_l0_V[2/4]


2x vec_prod += vec_l0_V[0] unsigned* vec_2x_2p30m19[0/4]

2x vec_prod >>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[1/4]
2x vec_prod += vec_l0_V[0] unsigned* vec_2x_2p30m1[0/4]

2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[0/4]

4x vec_l1_V = vec_prod * vec_M
vec_l1_V &= vec_2x_2p30m1
4x vec_l1_V = vec_l1_V[0/4] vec_l1_V[2/4] vec_l1_V[0/4] vec_l1_V[2/4]

2x vec_prod += vec_l1_V[0] unsigned* vec_2x_2p30m19[0/4]






                    2x vec_prod_1 = vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V0_V1_S0_S1[2/4]
                    4x vec_l0_S = vec_prod_1 * vec_M
                    vec_l0_S &= vec_2x_2p30m1
                    4x vec_l0_S = vec_l0_S[0/4] vec_l0_S[2/4] vec_l0_S[0/4] vec_l0_S[2/4]


                    2x vec_prod_1 += vec_l0_S[0] unsigned* vec_2x_2p30m19[0/4]

                    2x vec_prod_1 >>= 30

                    2x vec_prod_1 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V0_V1_S0_S1[3/4]
                    2x vec_prod_1 += vec_l0_S[0] unsigned* vec_2x_2p30m1[0/4]

                    2x vec_prod_1 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V0_V1_S0_S1[2/4]

                    4x vec_l1_S = vec_prod_1 * vec_M
                    vec_l1_S &= vec_2x_2p30m1
                    4x vec_l1_S = vec_l1_S[0/4] vec_l1_S[2/4] vec_l1_S[0/4] vec_l1_S[2/4]

                    2x vec_prod_1 += vec_l1_S[0] unsigned* vec_2x_2p30m19[0/4]

reg128 vec_Vp0_Vp1_Sp0_Sp1
reg128 vec_Vp2_Vp3_Sp2_Sp3
reg128 vec_Vp4_Vp5_Sp4_Sp5
reg128 vec_Vp6_Vp7_Sp6_Sp7
reg128 vec_Vp8_Vp9_Sp8_Sp9
reg128 vec_l0
reg128 vec_l1

2x vec_l0 = vec_l0_V + vec_l0_S
2x vec_l1 = vec_l1_V + vec_l1_S

2x vec_prod = vec_prod + vec_prod_1
2x vec_prod >>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V2_V3_S2_S3[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V0_V1_S0_S1[3/4]

# += vec_l0 * P2
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# += vec_l1 * P1
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]

vec_Vp0_Vp1_Sp0_Sp1 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V2_V3_S2_S3[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V2_V3_S2_S3[2/4]

# += vec_l0 * P3
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# += vec_l1 * P2
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]


vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_Vp0_Vp1_Sp0_Sp1 |= vec_buf << 32


2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V4_V5_S4_S5[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V2_V3_S2_S3[3/4]

# += vec_l0 * P4
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# += vec_l1 * P3
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]


vec_Vp2_Vp3_Sp2_Sp3 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V4_V5_S4_S5[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V4_V5_S4_S5[2/4]

# += vec_l0 * P5
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# += vec_l1 * P4
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]


vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_Vp2_Vp3_Sp2_Sp3 |= vec_buf << 32

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V6_V7_S6_S7[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V4_V5_S4_S5[3/4]

# += vec_l0 * P6
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# += vec_l1 * P5
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]


vec_Vp4_Vp5_Sp4_Sp5 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V6_V7_S6_S7[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V6_V7_S6_S7[2/4]

# += vec_l0 * P7
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
# += vec_l1 * P6
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]


vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_Vp4_Vp5_Sp4_Sp5 |= vec_buf << 32

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V8_V9_S8_S9[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_V8_V9_S8_S9[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V6_V7_S6_S7[3/4]

# += vec_l0 * P8
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p15m1[0/4]
# += vec_l1 * P7
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]


vec_Vp6_Vp7_Sp6_Sp7 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30


2x vec_prod += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V8_V9_S8_S9[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_V8_V9_S8_S9[2/4]

# += vec_l1 * P8
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p15m1[0/4]


vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_Vp6_Vp7_Sp6_Sp7 |= vec_buf << 32

vec_Vp8_Vp9_Sp8_Sp9 = vec_prod & vec_2x_2p30m1


  
# Branchless minus [uuhat, rrhat] & P-V
#                  [vvhat, sshat] & P-S
# Interleaved with carry/borrow propagation

reg128 vec_carry
reg128 vec_buf2
reg128 vec_uuhat_rrhat
reg128 vec_vvhat_sshat
4x vec_uuhat_rrhat = vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[1/4] vec_uuhat_rrhat_vvhat_sshat[1/4]

reg128 vec_V0_V1_V0_V1
reg128 vec_V2_V3_V2_V3
reg128 vec_V4_V5_V4_V5
reg128 vec_V6_V7_V6_V7
reg128 vec_V8_V9_V8_V9


reg128 vec_4x_2p30m1
reg128 vec_P0_P1_P0_P1
4x vec_4x_2p30m1 = vec_2x_2p30m1[0/4]
int64 eighteen
reg128 vec_eighteen
eighteen = 18
2x vec_eighteen = eighteen
2x vec_P0_P1_P0_P1 = vec_4x_2p30m1 - vec_eighteen
2x vec_V0_V1_V0_V1 zip= vec_V0_V1_S0_S1[0/2] vec_V0_V1_S0_S1[0/2]
2x vec_V2_V3_V2_V3 zip= vec_V2_V3_S2_S3[0/2] vec_V2_V3_S2_S3[0/2]
2x vec_V4_V5_V4_V5 zip= vec_V4_V5_S4_S5[0/2] vec_V4_V5_S4_S5[0/2]
2x vec_V6_V7_V6_V7 zip= vec_V6_V7_S6_S7[0/2] vec_V6_V7_S6_S7[0/2]
2x vec_V8_V9_V8_V9 zip= vec_V8_V9_S8_S9[0/2] vec_V8_V9_S8_S9[0/2]





4x vec_buf = vec_P0_P1_P0_P1 - vec_V0_V1_V0_V1
4x vec_buf2 = vec_4x_2p30m1 - vec_V2_V3_V2_V3

vec_buf &= vec_uuhat_rrhat
vec_buf2 &= vec_uuhat_rrhat

4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf
4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf2

                ##### begin{carry/borrow propagation}
                4x vec_carry = vec_Vp0_Vp1_Sp0_Sp1 >> 30
                2x vec_carry <<= 32
                4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_carry
                2x vec_carry = vec_Vp0_Vp1_Sp0_Sp1 >> 30
                2x vec_carry unsigned>>= 32
                vec_Vp0_Vp1_Sp0_Sp1 &= vec_4x_2p30m1
                ##### end{carry/borrow propagation}



4x vec_buf = vec_4x_2p30m1 - vec_V4_V5_V4_V5
4x vec_buf2 = vec_4x_2p30m1 - vec_V6_V7_V6_V7
vec_buf &= vec_uuhat_rrhat
vec_buf2 &= vec_uuhat_rrhat


4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf2



                ##### begin{carry/borrow propagation}
                2x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_carry
                4x vec_carry = vec_Vp2_Vp3_Sp2_Sp3 >> 30
                2x vec_carry <<= 32
                4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_carry
                2x vec_carry = vec_Vp2_Vp3_Sp2_Sp3 >> 30
                2x vec_carry unsigned>>= 32
                # Clear the carries/borrows 
                vec_Vp2_Vp3_Sp2_Sp3 &= vec_4x_2p30m1
                ##### end{carry/borrow propagation}






                ##### begin{carry/borrow propagation}
                2x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_carry
                4x vec_carry = vec_Vp4_Vp5_Sp4_Sp5 >> 30
                2x vec_carry <<= 32
                4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_carry
                2x vec_carry = vec_Vp4_Vp5_Sp4_Sp5 >> 30
                2x vec_carry unsigned>>= 32
                # Clear the carries/borrows 
                vec_Vp4_Vp5_Sp4_Sp5 &= vec_4x_2p30m1
                ##### end{carry/borrow propagation}






4x vec_buf = vec_2x_2p15m1 - vec_V8_V9_V8_V9
vec_buf &= vec_uuhat_rrhat
4x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf



                ##### begin{carry/borrow propagation}
                2x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_carry
                4x vec_carry = vec_Vp6_Vp7_Sp6_Sp7 >> 30
                2x vec_carry <<= 32
                4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_carry
                2x vec_carry = vec_Vp6_Vp7_Sp6_Sp7 >> 30
                2x vec_carry unsigned>>= 32
                # Clear the carries/borrows 
                vec_Vp6_Vp7_Sp6_Sp7 &= vec_4x_2p30m1
                ##### end{carry/borrow propagation}




                ##### begin{carry/borrow propagation}
                2x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_carry
                ##### end{carry/borrow propagation}



4x vec_vvhat_sshat = vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[3/4] vec_uuhat_rrhat_vvhat_sshat[3/4]

reg128 vec_S0_S1_S0_S1
reg128 vec_S2_S3_S2_S3
reg128 vec_S4_S5_S4_S5
reg128 vec_S6_S7_S6_S7
reg128 vec_S8_S9_S8_S9


2x vec_S0_S1_S0_S1 zip= vec_V0_V1_S0_S1[1/2] vec_V0_V1_S0_S1[1/2]
4x vec_buf = vec_P0_P1_P0_P1 - vec_S0_S1_S0_S1
vec_buf &= vec_vvhat_sshat
4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf

2x vec_S2_S3_S2_S3 zip= vec_V2_V3_S2_S3[1/2] vec_V2_V3_S2_S3[1/2]
4x vec_buf = vec_4x_2p30m1 - vec_S2_S3_S2_S3
vec_buf &= vec_vvhat_sshat
4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf

2x vec_S4_S5_S4_S5 zip= vec_V4_V5_S4_S5[1/2] vec_V4_V5_S4_S5[1/2]
4x vec_buf = vec_4x_2p30m1 - vec_S4_S5_S4_S5
vec_buf &= vec_vvhat_sshat
4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf

2x vec_S6_S7_S6_S7 zip= vec_V6_V7_S6_S7[1/2] vec_V6_V7_S6_S7[1/2]
4x vec_buf = vec_4x_2p30m1 - vec_S6_S7_S6_S7
vec_buf &= vec_vvhat_sshat
4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf

2x vec_S8_S9_S8_S9 zip= vec_V8_V9_S8_S9[1/2] vec_V8_V9_S8_S9[1/2]
4x vec_buf = vec_2x_2p15m1 - vec_S8_S9_S8_S9
vec_buf &= vec_vvhat_sshat
4x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf



# Borrow and carry propagation


4x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
2x vec_buf <<= 32
4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf

2x vec_buf = vec_Vp0_Vp1_Sp0_Sp1 >> 30
2x vec_buf unsigned>>= 32

# Clear the carries/borrows 
vec_Vp0_Vp1_Sp0_Sp1 &= vec_4x_2p30m1

2x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf
4x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
2x vec_buf <<= 32
4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf

2x vec_buf = vec_Vp2_Vp3_Sp2_Sp3 >> 30
2x vec_buf unsigned>>= 32

# Clear the carries/borrows 
vec_Vp2_Vp3_Sp2_Sp3 &= vec_4x_2p30m1

2x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf
4x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
2x vec_buf <<= 32
4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf

2x vec_buf = vec_Vp4_Vp5_Sp4_Sp5 >> 30
2x vec_buf unsigned>>= 32

# Clear the carries/borrows 
vec_Vp4_Vp5_Sp4_Sp5 &= vec_4x_2p30m1


2x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf
4x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
2x vec_buf <<= 32
4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf

2x vec_buf = vec_Vp6_Vp7_Sp6_Sp7 >> 30
2x vec_buf unsigned>>= 32


# Clear the carries/borrows 
vec_Vp6_Vp7_Sp6_Sp7 &= vec_4x_2p30m1

2x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf

# Roughly Reduction P

reg128 vec_small_tmp
2x vec_small_tmp = vec_Vp8_Vp9_Sp8_Sp9 >> 15
vec_Vp8_Vp9_Sp8_Sp9 &= vec_2x_2p15m1

4x vec_small_tmp = vec_small_tmp[0/4] vec_small_tmp[2/4] vec_small_tmp[0/4] vec_small_tmp[2/4]



reg128 vec_nineteen
int64 nineteen
nineteen = 19
2x vec_nineteen = nineteen
2x vec_Vp0_Vp1_Sp0_Sp1 += vec_small_tmp[0] unsigned* vec_nineteen[0/4]





# Reduction P once

vec_small_tmp = vec_nineteen

reg128 vec_4x_2p30a2p31
reg128 vec_2x_2p30a2p31
reg128 vec_2x_2p62a2p63
reg128 vec_reduction_hat
4x vec_4x_2p30a2p31 = 192 << 24
2x vec_2x_2p30a2p31 = vec_4x_2p30a2p31 unsigned>> 32
2x vec_2x_2p62a2p63 = vec_2x_2p30a2p31 << 32

2x vec_small_tmp += vec_Vp0_Vp1_Sp0_Sp1 
vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
2x vec_small_tmp <<= 2

2x vec_small_tmp += vec_Vp0_Vp1_Sp0_Sp1 
vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
2x vec_small_tmp unsigned>>= 62


2x vec_small_tmp += vec_Vp2_Vp3_Sp2_Sp3 
vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
2x vec_small_tmp <<= 2

2x vec_small_tmp += vec_Vp2_Vp3_Sp2_Sp3 
vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
2x vec_small_tmp unsigned>>= 62


2x vec_small_tmp += vec_Vp4_Vp5_Sp4_Sp5
vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
2x vec_small_tmp <<= 2

2x vec_small_tmp += vec_Vp4_Vp5_Sp4_Sp5
vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
2x vec_small_tmp unsigned>>= 62


2x vec_small_tmp += vec_Vp6_Vp7_Sp6_Sp7
vec_small_tmp = vec_small_tmp & vec_2x_2p30a2p31
2x vec_small_tmp <<= 2

2x vec_small_tmp += vec_Vp6_Vp7_Sp6_Sp7
vec_small_tmp = vec_small_tmp & vec_2x_2p62a2p63
2x vec_small_tmp unsigned>>= 62


2x vec_small_tmp += vec_Vp8_Vp9_Sp8_Sp9
2x vec_small_tmp = vec_2x_2p15m1 - vec_small_tmp
2x vec_reduction_hat = vec_small_tmp >> 63

# minus reduction_hat & P
#   add Vp0, Sp0 by 19
#   sub Vp0, Sp0 by 2^15

int64 number
reg128 vec_number
number = 19
2x vec_number = number
vec_number &= vec_reduction_hat

2x vec_Vp0_Vp1_Sp0_Sp1 += vec_number

number = 32768
2x vec_number = number
vec_number &= vec_reduction_hat

2x vec_Vp8_Vp9_Sp8_Sp9 -= vec_number



# Unsigned Carry Propagation

vec_small_tmp = vec_Vp0_Vp1_Sp0_Sp1 & vec_2x_2p30a2p31
vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 & ~vec_2x_2p30a2p31
2x vec_small_tmp <<= 2
2x vec_Vp0_Vp1_Sp0_Sp1 += vec_small_tmp

vec_small_tmp = vec_Vp0_Vp1_Sp0_Sp1 & vec_2x_2p62a2p63
vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 & ~vec_2x_2p62a2p63
2x vec_small_tmp unsigned>>= 62
2x vec_Vp2_Vp3_Sp2_Sp3 += vec_small_tmp


vec_small_tmp = vec_Vp2_Vp3_Sp2_Sp3 & vec_2x_2p30a2p31
vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 & ~vec_2x_2p30a2p31
2x vec_small_tmp <<= 2
2x vec_Vp2_Vp3_Sp2_Sp3 += vec_small_tmp

vec_small_tmp = vec_Vp2_Vp3_Sp2_Sp3 & vec_2x_2p62a2p63
vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 & ~vec_2x_2p62a2p63
2x vec_small_tmp unsigned>>= 62
2x vec_Vp4_Vp5_Sp4_Sp5 += vec_small_tmp


vec_small_tmp = vec_Vp4_Vp5_Sp4_Sp5 & vec_2x_2p30a2p31
vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 & ~vec_2x_2p30a2p31
2x vec_small_tmp <<= 2
2x vec_Vp4_Vp5_Sp4_Sp5 += vec_small_tmp

vec_small_tmp = vec_Vp4_Vp5_Sp4_Sp5 & vec_2x_2p62a2p63
vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 & ~vec_2x_2p62a2p63
2x vec_small_tmp unsigned>>= 62
2x vec_Vp6_Vp7_Sp6_Sp7 += vec_small_tmp


vec_small_tmp = vec_Vp6_Vp7_Sp6_Sp7 & vec_2x_2p30a2p31
vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 & ~vec_2x_2p30a2p31
2x vec_small_tmp <<= 2
2x vec_Vp6_Vp7_Sp6_Sp7 += vec_small_tmp

vec_small_tmp = vec_Vp6_Vp7_Sp6_Sp7 & vec_2x_2p62a2p63
vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 & ~vec_2x_2p62a2p63
2x vec_small_tmp unsigned>>= 62
2x vec_Vp8_Vp9_Sp8_Sp9 += vec_small_tmp


vec_V0_V1_S0_S1 = vec_Vp0_Vp1_Sp0_Sp1
vec_V2_V3_S2_S3 = vec_Vp2_Vp3_Sp2_Sp3
vec_V4_V5_S4_S5 = vec_Vp4_Vp5_Sp4_Sp5
vec_V6_V7_S6_S7 = vec_Vp6_Vp7_Sp6_Sp7
vec_V8_V9_S8_S9 = vec_Vp8_Vp9_Sp8_Sp9



# Store the result





reg128 store_back_vec_V0_V1_V2_V3
reg128 store_back_vec_V4_V5_V6_V7
reg128 store_back_vec_S0_S1_S2_S3
reg128 store_back_vec_S4_S5_S6_S7
reg128 store_back_vec_V8_V9_S8_S9




2x store_back_vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2]
2x store_back_vec_S0_S1_S2_S3 zip= vec_V0_V1_S0_S1[1/2] vec_V2_V3_S2_S3[1/2]

2x store_back_vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]
2x store_back_vec_S4_S5_S6_S7 zip= vec_V4_V5_S4_S5[1/2] vec_V6_V7_S6_S7[1/2]

store_back_vec_V8_V9_S8_S9 = vec_V8_V9_S8_S9

mem256[pointerV] = store_back_vec_V0_V1_V2_V3, store_back_vec_V4_V5_V6_V7
mem256[pointerS] = store_back_vec_S0_S1_S2_S3, store_back_vec_S4_S5_S6_S7



int64 Vp8
Vp8 = store_back_vec_V8_V9_S8_S9[0/2]
mem32[pointerV+32] = Vp8
int64 Sp8
Sp8 = store_back_vec_V8_V9_S8_S9[1/2]
mem32[pointerS+32] = Sp8

pop2x8b calleesaved_v14, calleesaved_v15
pop2x8b calleesaved_v12, calleesaved_v13
pop2x8b calleesaved_v10, calleesaved_v11
pop2x8b calleesaved_v8, calleesaved_v9


# Free out specified registers

free vec_F0_F1_G0_G1
free vec_F2_F3_G2_G3
free vec_F4_F5_G4_G5
free vec_F6_F7_G6_G7
free vec_F8_F9_G8_G9

free vec_V0_V1_S0_S1
free vec_V2_V3_S2_S3
free vec_V4_V5_S4_S5
free vec_V6_V7_S6_S7
free vec_V8_V9_S8_S9

free vec_uu0_rr0_vv0_ss0
free vec_uu1_rr1_vv1_ss1
free vec_uuhat_rrhat_vvhat_sshat
free vec_2x_2p30m1

return