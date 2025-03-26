

input_variables_and_entrance = """
int64 pointerR
int64 pointerS
int64 pointerF
int64 pointerG
int64 pointeru
int64 pointerv
int64 pointerr
int64 pointers


input pointerR
input pointerS
input pointerF
input pointerG
input pointeru
input pointerv
input pointerr
input pointers


"""

entrance = """

enter linear_comb

"""

# Data initialization, we do not need optimization
# make vec_F0_F1_G0_G1, ... 
data_initialization_var = ""
data_initialization = ""

for symbol in ["u","v","r","s"]:
    data_initialization_var += f"int64 {symbol}0{symbol}1\n"
    data_initialization_var += f"int64 {symbol}0\n"
    data_initialization_var += f"int64 {symbol}1\n"
    data_initialization += f"{symbol}0{symbol}1 = mem64[pointer{symbol}]\n"
    data_initialization += f"{symbol}0 = {symbol}0{symbol}1 & ((1 << 30)-1)\n"
    data_initialization += f"{symbol}1 = ({symbol}0{symbol}1 >> 30) & ((1 << 32)-1)\n"

for symbol in ["F","G"]:
    
    data_initialization_var += f"int64 {symbol}0{symbol}1\n"
    data_initialization_var += f"int64 {symbol}2{symbol}3\n"
    data_initialization_var += f"int64 {symbol}4{symbol}5\n"
    data_initialization_var += f"int64 {symbol}6{symbol}7\n"
    data_initialization_var += f"int64 {symbol}8\n"
    #data_initialization_var += f"int64 {symbol}0\n"
    #data_initialization_var += f"int64 {symbol}1\n"
    #data_initialization_var += f"int64 {symbol}2\n"
    #data_initialization_var += f"int64 {symbol}3\n"
    data_initialization += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer{symbol}]\n"
    data_initialization += f"{symbol}4{symbol}5, {symbol}6{symbol}7 = mem128[pointer{symbol}+16]\n"
    data_initialization += f"{symbol}8 = mem64[pointer{symbol}+32]\n"
    #data_initialization += f"{symbol}0 = {symbol}0{symbol}1 & ((1 << 30)-1)\n"
    #data_initialization += f"{symbol}1 = ({symbol}0{symbol}1 >> 30) & ((1 << 30)-1)\n"

for i in range(0,8,2):
    data_initialization_var += f"reg128 vec_F{i}_F{i+1}_G{i}_G{i+1} \n"

    data_initialization += f"vec_F{i}_F{i+1}_G{i}_G{i+1}[0/2] = F{i}F{i+1} \n"
    data_initialization += f"vec_F{i}_F{i+1}_G{i}_G{i+1}[1/2] = G{i}G{i+1} \n"

data_initialization_var += "reg128 vec_F8_0_G8_0\n"
data_initialization += f"vec_F8_0_G8_0[0/2] = F8 \n"
data_initialization += f"vec_F8_0_G8_0[1/2] = G8 \n"

for i in range(0,2):
    data_initialization_var += f"reg128 vec_u{i}_r{i}_v{i}_s{i}\n"
    for j,a,b in [(0,"u", "r"), (1,"v", "s")]:

        data_initialization_var += f"int64 {a}{i}{b}{i}\n"

        data_initialization += f"{b}{i} = {b}{i} << 32\n"
        data_initialization += f"{a}{i}{b}{i} = {a}{i} | {b}{i}\n"
        data_initialization += f"vec_u{i}_r{i}_v{i}_s{i}[{j}/2] = {a}{i}{b}{i}\n"


# Unsigned product
unsigned_product_var = ""
unsigned_product = ""


unsigned_product_var += """
reg128 vec_tmp0
reg128 vec_MASK2p30m1
reg128 vec_MASK2p32m1
"""


unsigned_product += "vec_tmp0 = vec_tmp0 ^ vec_tmp0\n"
for i in range(0,11):
    unsigned_product_var += f"reg128 vec_R{i}_0_S{i}_0\n"

unsigned_product += """
2x vec_MASK2p32m1 = 0xFFFFFFFF
2x vec_MASK2p30m1 = vec_MASK2p32m1 unsigned>> 2
"""

unsigned_product += """
2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F0_F1_G0_G1[0/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F0_F1_G0_G1[2/4]

vec_R0_0_S0_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F0_F1_G0_G1[1/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F0_F1_G0_G1[3/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F0_F1_G0_G1[0/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F0_F1_G0_G1[2/4]

vec_R1_0_S1_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F2_F3_G2_G3[0/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F2_F3_G2_G3[2/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F0_F1_G0_G1[1/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F0_F1_G0_G1[3/4]

vec_R2_0_S2_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F2_F3_G2_G3[1/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F2_F3_G2_G3[3/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F2_F3_G2_G3[0/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F2_F3_G2_G3[2/4]

vec_R3_0_S3_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F4_F5_G4_G5[0/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F4_F5_G4_G5[2/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F2_F3_G2_G3[1/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F2_F3_G2_G3[3/4]

vec_R4_0_S4_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F4_F5_G4_G5[1/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F4_F5_G4_G5[3/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F4_F5_G4_G5[0/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F4_F5_G4_G5[2/4]

vec_R5_0_S5_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F6_F7_G6_G7[0/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F6_F7_G6_G7[2/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F4_F5_G4_G5[1/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F4_F5_G4_G5[3/4]

vec_R6_0_S6_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F6_F7_G6_G7[1/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F6_F7_G6_G7[3/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F6_F7_G6_G7[0/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F6_F7_G6_G7[2/4]

vec_R7_0_S7_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F8_0_G8_0[0/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F8_0_G8_0[2/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F6_F7_G6_G7[1/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F6_F7_G6_G7[3/4]

vec_R8_0_S8_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F8_0_G8_0[0/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F8_0_G8_0[2/4]

vec_R9_0_S9_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

vec_R10_0_S10_0 = vec_tmp0 

"""



# Read out 
# Prepare for the following hat subtraction
read_out_var = ""
read_out = ""

read_out += "\n\n#Collect the unsigned_product\n\n"

#for i in range(0,6):
    #read_out_var += f"reg128 vec_R{i}_0_S{i}_0\n"
    
for i in range(0,10,2):
    read_out_var += f"reg128 vec_R{i}_R{i+1}_S{i}_S{i+1}\n"
for i in range(0,10,2):
    read_out += f"2x vec_R{i+1}_0_S{i+1}_0 <<= 32\n"
    read_out += f"vec_R{i}_R{i+1}_S{i}_S{i+1} = vec_R{i}_0_S{i}_0 | vec_R{i+1}_0_S{i+1}_0\n"


read_out += """
#Till now, we have
#vec_R0_R1_S0_S1
#vec_R2_R3_S2_S3
#vec_R4_R5_S4_S5
#vec_R6_R7_S6_S7
#vec_R8_R9_S8_S9
#vec_R10_0_S10_0
#these stores our unsigned product


"""

# Minus
# Prepare the Masks for the following carry propagation and negation
mask_var = ""
mask = ""

mask_var += """
int64 carry1
int64 ONE

reg128 vec_MASKcarry1
reg128 vec_MASKcarry2
reg128 vec_MASKcarry
reg128 vec_MASKeffect
reg128 vec_ONE
reg128 vec_MASKhalfeffect
"""

mask += "carry1 = 3221225472\n"
mask += "2x vec_MASKcarry1 = carry1\n"
mask += "2x vec_MASKcarry2 = vec_MASKcarry1 << 32\n"
mask += "vec_MASKcarry = vec_MASKcarry1 | vec_MASKcarry2\n"
mask += "vec_MASKeffect = ~vec_MASKcarry\n"
mask += "ONE = 1\n"
mask += "2x vec_ONE = ONE\n"
mask += "carry1 = 4294967295\n"
mask += "2x vec_MASKhalfeffect = carry1\n"



# Minus the [ uhat & F , rhat & F ] and [ vhat & G , shat & G ]

minus1_var = ""
minus1 = ""

minus1_var += """

reg128 vec_uhat_rhat_vhat_shat
reg128 vec_uhat_rhat
reg128 vec_vhat_shat

reg128 vec_tmp1
reg128 vec_tmp2
reg128 vec_tmp3
reg128 vec_tmp4
reg128 vec_tmp5
reg128 vec_carry1
reg128 vec_carry2
"""

minus1 += """
# Get the hats
4x vec_uhat_rhat_vhat_shat = vec_u1_r1_v1_s1 >> 31
4x vec_uhat_rhat = vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[1/4] vec_uhat_rhat_vhat_shat[1/4]
4x vec_vhat_shat = vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[3/4] vec_uhat_rhat_vhat_shat[3/4]
"""

minus1 += """
# Minus [ uhat & 4F , rhat & 4F ]
"""

for i in range(0,8,2):
    minus1 += f"2x vec_tmp{1+(i>>1)} = vec_F{i}_F{i+1}_G{i}_G{i+1}[0/2]\n"
minus1 += "2x vec_tmp5 = vec_F8_0_G8_0[0/2]\n"

for i in range(1,6):
    minus1 += f"2x vec_tmp{i} <<= 2\n"

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    minus1 += f"vec_carry1 = vec_tmp{i} & vec_MASKcarry1\n"
    minus1 += f"vec_tmp{i} = vec_tmp{i} & ~vec_MASKcarry1\n"

    minus1 += f"2x vec_carry1 <<= 2\n"
    minus1 += f"vec_tmp{i} |= vec_carry1\n"

    minus1 += f"vec_carry2 = vec_tmp{i} & vec_MASKcarry2\n"
    minus1 += f"vec_tmp{i} = vec_tmp{i} & ~vec_MASKcarry2\n"
    minus1 += f"2x vec_carry2 unsigned>>= 62\n"
    minus1 += f"vec_tmp{i+1} |= vec_carry2\n"

minus1 += "\n#So far, we have stored 4F into tmp1-5\n\n"

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    minus1 += f"vec_tmp{i} ^= vec_MASKcarry\n"
    minus1 += f"vec_tmp{i} = ~vec_tmp{i}\n"

minus1 += "vec_tmp5 ^= vec_MASKhalfeffect\n"
#minus1 += "vec_tmp5 = ~vec_tmp5\n"

minus1 += "2x vec_tmp1 += vec_ONE\n"

minus1 += "\n#So far, we have stored F' = -4F into tmp1-5\n\n"

for i in range(1,6,1):
    # i = 1, 2, 3, 4, 5
    minus1 += f"vec_tmp{i} &= vec_uhat_rhat\n"

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    minus1 += f"2x vec_R{2*i}_R{2*i+1}_S{2*i}_S{2*i+1} += vec_tmp{i}\n"

minus1 += "2x vec_R10_0_S10_0 += vec_tmp5\n"


minus1 += "\n\n# Minus [ vhat & 4G , shat & 4G ]\n\n"

for i in range(0,8,2):
    minus1 += f"2x vec_tmp{1+(i>>1)} = vec_F{i}_F{i+1}_G{i}_G{i+1}[1/2]\n"
minus1 += "2x vec_tmp5 = vec_F8_0_G8_0[1/2]\n"

for i in range(1,6):
    minus1 += f"2x vec_tmp{i} <<= 2\n"

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    minus1 += f"vec_carry1 = vec_tmp{i} & vec_MASKcarry1\n"
    minus1 += f"vec_tmp{i} = vec_tmp{i} & ~vec_MASKcarry1\n"

    minus1 += f"2x vec_carry1 <<= 2\n"
    minus1 += f"vec_tmp{i} |= vec_carry1\n"

    minus1 += f"vec_carry2 = vec_tmp{i} & vec_MASKcarry2\n"
    minus1 += f"vec_tmp{i} = vec_tmp{i} & ~vec_MASKcarry2\n"
    minus1 += f"2x vec_carry2 unsigned>>= 62\n"
    minus1 += f"vec_tmp{i+1} |= vec_carry2\n"

minus1 += "\n#So far, we have stored 4G into tmp1-5\n\n"

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    minus1 += f"vec_tmp{i} ^= vec_MASKcarry\n"
    minus1 += f"vec_tmp{i} = ~vec_tmp{i}\n"

minus1 += "vec_tmp5 ^= vec_MASKhalfeffect\n"
#minus1 += "vec_tmp5 = ~vec_tmp5\n"

minus1 += "2x vec_tmp1 += vec_ONE\n"

minus1 += "\n#So far, we have stored G' = -4G into tmp1-5\n\n"

for i in range(1,6,1):
    # i = 1, 2, 3, 4, 5
    minus1 += f"vec_tmp{i} &= vec_vhat_shat\n"

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    minus1 += f"2x vec_R{2*i}_R{2*i+1}_S{2*i}_S{2*i+1} += vec_tmp{i}\n"

minus1 += "2x vec_R10_0_S10_0 += vec_tmp5\n"




# Carry propagation
carry_propagation_var = ""
carry_propagation = ""

carry_propagation += "\n# Now we do carry propagation\n\n"

for i in range(2,10,2):
    carry_propagation += f"vec_carry1 = vec_R{i}_R{i+1}_S{i}_S{i+1} & vec_MASKcarry1\n"
    carry_propagation += f"vec_R{i}_R{i+1}_S{i}_S{i+1} = vec_R{i}_R{i+1}_S{i}_S{i+1} & ~vec_MASKcarry1\n"
    carry_propagation += f"2x vec_carry1 <<= 2\n"
    carry_propagation += f"2x vec_R{i}_R{i+1}_S{i}_S{i+1} += vec_carry1\n"
    carry_propagation += f"vec_carry2 = vec_R{i}_R{i+1}_S{i}_S{i+1} & vec_MASKcarry2\n"
    carry_propagation += f"vec_R{i}_R{i+1}_S{i}_S{i+1} = vec_R{i}_R{i+1}_S{i}_S{i+1} & ~vec_MASKcarry2\n"
    carry_propagation += f"2x vec_carry2 unsigned>>= 62\n"
    if i <8:
        carry_propagation += f"2x vec_R{i+2}_R{i+3}_S{i+2}_S{i+3} += vec_carry2\n"
    else:
        carry_propagation += f"2x vec_R{i+2}_0_S{i+2}_0 += vec_carry2\n"
        


# Minus the [ Fhat & u , Fhat & r ] and [ Ghat & v , Ghat & s ]

minus2_var = ""
minus2 = ""

minus2_var += """

reg128 vec_Fhat_0_Ghat_0
reg128 vec_Fhat
reg128 vec_Ghat


"""

minus2 += """
4x vec_Fhat_0_Ghat_0 = vec_F8_0_G8_0 >> 31

4x vec_Fhat = vec_Fhat_0_Ghat_0[0/4]
4x vec_Ghat = vec_Fhat_0_Ghat_0[2/4]

4x vec_tmp1 = vec_u0_r0_v0_s0[0/4] vec_u1_r1_v1_s1[0/4] vec_u0_r0_v0_s0[1/4] vec_u1_r1_v1_s1[1/4]

2x vec_tmp1 <<= 2
vec_carry1 = vec_tmp1 & vec_MASKcarry1
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1

2x vec_carry1 <<= 2
vec_tmp1 |= vec_carry1

vec_tmp1 ^= vec_MASKcarry1
vec_tmp1 = ~vec_tmp1

2x vec_tmp1 += vec_ONE

# vec_tmp1 = [ u'0, u'1, r'0, r'1 ]
# where u' = -4u, r' = -4r

vec_tmp1 &= vec_Fhat

# vec_tmp1 = [ (Fhat&u')0, (Fhat&u')1, (Fhat&r')0, (Fhat&r')1 ]
# where u' = -4u, r' = -4r


2x vec_tmp2 = vec_tmp1 << 32
# vec_tmp2 = [ 0, (Fhat&u')0, 0, (Fhat&r')0 ]

2x vec_tmp3 = vec_tmp1 unsigned>> 32
# vec_tmp3 = [ (Fhat&u')1, 0, (Fhat&r')1, 0 ]


# do vec_R8_R9_S8_S9 += vec_tmp2
2x vec_R8_R9_S8_S9 += vec_tmp2
# do vec_R10_0_S10_0 += vec_tmp3
2x vec_R10_0_S10_0 += vec_tmp3




4x vec_tmp1 = vec_u0_r0_v0_s0[2/4] vec_u1_r1_v1_s1[2/4] vec_u0_r0_v0_s0[3/4] vec_u1_r1_v1_s1[3/4]

2x vec_tmp1 <<= 2
vec_carry1 = vec_tmp1 & vec_MASKcarry1
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1

2x vec_carry1 <<= 2
vec_tmp1 |= vec_carry1

vec_tmp1 ^= vec_MASKcarry1
vec_tmp1 = ~vec_tmp1

2x vec_tmp1 += vec_ONE

vec_tmp1 &= vec_Ghat

# vec_tmp1 = [ v'0, v'1, s'0, s'1 ]
# where v' = -4v, s' = -4s

vec_tmp1 &= vec_Ghat

# vec_tmp1 = [ (Ghat&v')0, (Ghat&v')1, (Ghat&s')0, (Ghat&s')1 ]

2x vec_tmp2 = vec_tmp1 << 32
# vec_tmp2 = [ 0, (Ghat&v')0, 0, (Ghat&s')0]

2x vec_tmp3 = vec_tmp1 unsigned>> 32
# vec_tmp3 = [ (Ghat&v')1, 0, (Ghat&s')1, 0 ]


# do vec_R8_R9_S8_S9 += vec_tmp2
2x vec_R8_R9_S8_S9 += vec_tmp2
# do vec_R10_0_S10_0 += vec_tmp3
2x vec_R10_0_S10_0 += vec_tmp3

"""

# Carry propagation2
carry_propagation2_var = ""
carry_propagation2 = ""

carry_propagation2 += "\n# Now we do carry propagation2\n\n"
carry_propagation2 += "vec_carry1 = vec_R8_R9_S8_S9 & vec_MASKcarry1\n"
carry_propagation2 += "vec_R8_R9_S8_S9 = vec_R8_R9_S8_S9 & ~vec_MASKcarry1\n"
carry_propagation2 += "2x vec_carry1 <<= 2\n"
carry_propagation2 += "2x vec_R8_R9_S8_S9 += vec_carry1\n"
carry_propagation2 += "vec_carry2 = vec_R8_R9_S8_S9 & vec_MASKcarry2\n"
carry_propagation2 += "vec_R8_R9_S8_S9 = vec_R8_R9_S8_S9 & ~vec_MASKcarry2\n"
carry_propagation2 += "2x vec_carry2 unsigned>>= 62\n"
carry_propagation2 += "2x vec_R10_0_S10_0 += vec_carry2\n"




# Store the result
store_result_var = ""
store_result = ""
for symbol in ["R","S"]:
    for i in range(0,10,2):
        store_result_var += f"int64 {symbol}{i}{symbol}{i+1}\n"
    for i in range(0,10):
        store_result_var += f"int64 {symbol}{i}\n"
for i in range(0,10,2):
    store_result += f"R{i}R{i+1} = vec_R{i}_R{i+1}_S{i}_S{i+1}[0/2]\n"
    store_result += f"S{i}S{i+1} = vec_R{i}_R{i+1}_S{i}_S{i+1}[1/2]\n"
    store_result += f"mem64[pointerR+{4*i}] = R{i}R{i+1}\n"
    store_result += f"mem64[pointerS+{4*i}] = S{i}S{i+1}\n"

store_result_var += """
int64 R10
int64 S10
"""
store_result += """
R10 = vec_R10_0_S10_0[0/2]
mem32[pointerR+40] = R10
S10 = vec_R10_0_S10_0[1/2]
mem32[pointerS+40] = S10
"""


code = ""
code += input_variables_and_entrance

code += data_initialization_var

code += unsigned_product_var

code += read_out_var

code += store_result_var

code += mask_var

code += minus1_var

code += minus2_var

code += """
int64 debug0
int64 debug1
int64 debug2
int64 debug3
"""


code += entrance

code += """
#Data initialization:
"""

code += data_initialization

code += "\n#so far, we are ready for the real computation, i.e., from now on, we will be serious on optimizations.\n"
code += "\n#Unsigned product\n"

code += unsigned_product

code += read_out
# code += "\n\n#DEBUG: The unsigned product behaves as expected\n\n"

code += store_result

code += "\n\n#Producing the masks\n\n"
code += mask
code += minus1
code += carry_propagation

code += minus2
code += carry_propagation2

code += store_result


code += """

return

"""
with open("9_linear_comb.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < 9_linear_comb.q > 9_linear_comb.S")
os.system("gcc main.c 9_linear_comb.S -o main -lgmp && ./main")
