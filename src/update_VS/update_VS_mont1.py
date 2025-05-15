code = ""


code += "enter update_VS_mont\n"
code += """
int64 pointerV
int64 pointerS
int64 pointeruuvvrrss

input pointerV
input pointerS
input pointeruuvvrrss
"""

code += """
# Calling Convention

"""


# for i in range(18, 29+1,1):
#     code += f"caller calleesaved_x{i}\n"
for i in range(8, 15+1,1):
    code += f"caller calleesaved_v{i}\n"

# for i in range(18, 29+1,2):
#     code += f"push2xint64 calleesaved_x{i}, calleesaved_x{i+1}\n"

for i in range(8, 15+1,2):
    code += f"push2x8b calleesaved_v{i}, calleesaved_v{i+1}\n"


code += """
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

"""

code += """

# V, S Data Layout Configuration

"""

for symbol in ["V","S"]:
    
    code += f"int64 {symbol}0{symbol}1\n"
    code += f"int64 {symbol}2{symbol}3\n"
    code += f"int64 {symbol}4{symbol}5\n"
    code += f"int64 {symbol}6{symbol}7\n"
    code += f"int64 {symbol}8{symbol}9\n"
    code += "\n"
    code += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer{symbol}]\n"
    code += f"{symbol}4{symbol}5, {symbol}6{symbol}7 = mem128[pointer{symbol}+16]\n"
    code += f"{symbol}8{symbol}9 = mem32[pointer{symbol}+32]\n"
    code += "\n"




for i in range(0,10,2):
    # code += f"reg128 vec_V{i}_V{i+1}_S{i}_S{i+1} \n"
    code += "\n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[0/2] = V{i}V{i+1} \n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[1/2] = S{i}S{i+1} \n"
    code += "\n"





code += """

# At this function, the uu, vv, rr, ss are already in neon registers

int64 uu
int64 vv
int64 rr
int64 ss

uu, vv = mem128[pointeruuvvrrss + 0]
rr, ss = mem128[pointeruuvvrrss + 16]

"""


# Data initialization, we do not need optimization
# make vec_F0_F1_G0_G1, ... 

for symbol in ["uu","vv","rr","ss"]:

    code += f"int64 {symbol}0\n"
    code += f"int64 {symbol}1\n"
    code += f"{symbol}0 = {symbol} & ((1 << 30)-1)\n"
    code += f"{symbol}1 = ({symbol} >> 30) & ((1 << 32)-1)\n"
    code += "\n"


for j in range(2):
    # code += f"reg128 vec_uu{j}_rr{j}_vv{j}_ss{j}\n"
    code += "\n"
    for (i, symbol) in enumerate(["uu", "rr", "vv", "ss"]):
        code += f"vec_uu{j}_rr{j}_vv{j}_ss{j}[{i}/4] = {symbol}{j}\n"

    code += "\n"



code += """



# Get the hats
4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31

reg128 front_vec_4x_2p30a2p31
4x front_vec_4x_2p30a2p31 = 0xC0 << 24
vec_uu1_rr1_vv1_ss1 &= ~front_vec_4x_2p30a2p31


"""



code += """

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



"""



code += """
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


"""



# Branchless minus [uuhat, rrhat] & V
#                  [vvhat, sshat] & S
code += """  
# Branchless minus [uuhat, rrhat] & P-V
#                  [vvhat, sshat] & P-S
# Interleaved with carry/borrow propagation

reg128 vec_carry
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
vec_buf &= vec_uuhat_rrhat
4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf


                ##### begin{carry/borrow propagation}
                4x vec_carry = vec_Vp0_Vp1_Sp0_Sp1 >> 30
                2x vec_carry <<= 32
                4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_carry
                2x vec_carry = vec_Vp0_Vp1_Sp0_Sp1 >> 30
                2x vec_carry unsigned>>= 32
                vec_Vp0_Vp1_Sp0_Sp1 &= vec_4x_2p30m1
                ##### end{carry/borrow propagation}


4x vec_buf = vec_4x_2p30m1 - vec_V2_V3_V2_V3
vec_buf &= vec_uuhat_rrhat
4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf


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




4x vec_buf = vec_4x_2p30m1 - vec_V4_V5_V4_V5
vec_buf &= vec_uuhat_rrhat
4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf



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



4x vec_buf = vec_4x_2p30m1 - vec_V6_V7_V6_V7
vec_buf &= vec_uuhat_rrhat
4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf



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




4x vec_buf = vec_2x_2p15m1 - vec_V8_V9_V8_V9
vec_buf &= vec_uuhat_rrhat
4x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_buf



                ##### begin{carry/borrow propagation}
                2x vec_Vp8_Vp9_Sp8_Sp9 = vec_Vp8_Vp9_Sp8_Sp9 + vec_carry
                ##### end{carry/borrow propagation}

"""








code +="""

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


"""


code += """
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
"""



# Roughly Reduction P 
code += """
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



"""

# Reduction P once

code += """

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


"""



# Unsigned Carry Propagation
code += """
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


"""











# Store the result
code += """
# Store the result

reg128 vec_Vp0_Vp1_Vp2_Vp3
reg128 vec_Sp0_Sp1_Sp2_Sp3
2x vec_Vp0_Vp1_Vp2_Vp3 zip= vec_Vp0_Vp1_Sp0_Sp1[0/2] vec_Vp2_Vp3_Sp2_Sp3[0/2]
2x vec_Sp0_Sp1_Sp2_Sp3 zip= vec_Vp0_Vp1_Sp0_Sp1[1/2] vec_Vp2_Vp3_Sp2_Sp3[1/2]

reg128 vec_Vp4_Vp5_Vp6_Vp7
reg128 vec_Sp4_Sp5_Sp6_Sp7
2x vec_Vp4_Vp5_Vp6_Vp7 zip= vec_Vp4_Vp5_Sp4_Sp5[0/2] vec_Vp6_Vp7_Sp6_Sp7[0/2]
2x vec_Sp4_Sp5_Sp6_Sp7 zip= vec_Vp4_Vp5_Sp4_Sp5[1/2] vec_Vp6_Vp7_Sp6_Sp7[1/2]

mem256[pointerV] = vec_Vp0_Vp1_Vp2_Vp3, vec_Vp4_Vp5_Vp6_Vp7
mem256[pointerS] = vec_Sp0_Sp1_Sp2_Sp3, vec_Sp4_Sp5_Sp6_Sp7
# mem128[pointerV + 16] = vec_Vp4_Vp5_Vp6_Vp7
# mem128[pointerS + 16] = vec_Sp4_Sp5_Sp6_Sp7

int64 Vp8
Vp8 = vec_Vp8_Vp9_Sp8_Sp9[0/2]
mem32[pointerV+32] = Vp8
int64 Sp8
Sp8 = vec_Vp8_Vp9_Sp8_Sp9[1/2]
mem32[pointerS+32] = Sp8

"""









for i in range(15-1, 8-1,-2):
    code += f"pop2x8b calleesaved_v{i}, calleesaved_v{i+1}\n"
# for i in range(29, 18-1,-2):
#     code += f"pop2xint64 calleesaved_x{i-1}, calleesaved_x{i}\n"




code += """

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

"""

code += "return"

# ----
with open("update_VS_mont.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < update_VS_mont.q > update_VS_mont.S")


