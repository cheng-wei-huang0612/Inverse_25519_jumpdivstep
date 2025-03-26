

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
    #data_initialization_var += f"int64 {symbol}0\n"
    #data_initialization_var += f"int64 {symbol}1\n"
    #data_initialization_var += f"int64 {symbol}2\n"
    #data_initialization_var += f"int64 {symbol}3\n"
    data_initialization += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer{symbol}]\n"
    #data_initialization += f"{symbol}0 = {symbol}0{symbol}1 & ((1 << 30)-1)\n"
    #data_initialization += f"{symbol}1 = ({symbol}0{symbol}1 >> 30) & ((1 << 30)-1)\n"

for i in range(0,4,2):
    data_initialization_var += f"reg128 vec_F{i}_F{i+1}_G{i}_G{i+1} \n"

    data_initialization += f"vec_F{i}_F{i+1}_G{i}_G{i+1}[0/2] = F{i}F{i+1} \n"
    data_initialization += f"vec_F{i}_F{i+1}_G{i}_G{i+1}[1/2] = G{i}G{i+1} \n"

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
for i in range(0,6):
    unsigned_product_var += f"reg128 vec_R{i}_0_S{i}_0\n"

unsigned_product += """
2x vec_MASK2p32m1 = 0xFFFFFFFF
2x vec_MASK2p30m1 = vec_MASK2p32m1 unsigned>> 2
"""

unsigned_product += "2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F0_F1_G0_G1[0/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F0_F1_G0_G1[2/4]\n"

unsigned_product += "vec_R0_0_S0_0 = vec_tmp0 & vec_MASK2p30m1\n"
unsigned_product += "2x vec_tmp0 unsigned>>= 30 \n"

unsigned_product += "2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F0_F1_G0_G1[1/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F0_F1_G0_G1[3/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F0_F1_G0_G1[0/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F0_F1_G0_G1[2/4]\n"

unsigned_product += "vec_R1_0_S1_0 = vec_tmp0 & vec_MASK2p30m1\n"
unsigned_product += "2x vec_tmp0 unsigned>>= 30 \n"

unsigned_product += "2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F2_F3_G2_G3[0/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F2_F3_G2_G3[2/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F0_F1_G0_G1[1/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F0_F1_G0_G1[3/4]\n"

unsigned_product += "vec_R2_0_S2_0 = vec_tmp0 & vec_MASK2p30m1\n"
unsigned_product += "2x vec_tmp0 unsigned>>= 30 \n"

unsigned_product += "2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F2_F3_G2_G3[1/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F2_F3_G2_G3[3/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F2_F3_G2_G3[0/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F2_F3_G2_G3[2/4]\n"

unsigned_product += "vec_R3_0_S3_0 = vec_tmp0 & vec_MASK2p30m1\n"
unsigned_product += "2x vec_tmp0 unsigned>>= 30 \n"

unsigned_product += "2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F2_F3_G2_G3[1/4]\n"
unsigned_product += "2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F2_F3_G2_G3[3/4]\n"

unsigned_product += "vec_R4_0_S4_0 = vec_tmp0 & vec_MASK2p30m1\n"
unsigned_product += "2x vec_tmp0 unsigned>>= 30 \n"
unsigned_product += "vec_R5_0_S5_0 = vec_tmp0 & vec_MASK2p32m1\n"





# Read out 
# Prepare for the following hat subtraction
read_out_var = ""
read_out = ""

#for i in range(0,6):
    #read_out_var += f"reg128 vec_R{i}_0_S{i}_0\n"
    
for i in range(0,6,2):
    read_out_var += f"reg128 vec_R{i}_R{i+1}_S{i}_S{i+1}\n"

for i in range(0,6,2):
    read_out += f"2x vec_R{i+1}_0_S{i+1}_0 <<= 32\n"
    read_out += f"vec_R{i}_R{i+1}_S{i}_S{i+1} = vec_R{i}_0_S{i}_0 | vec_R{i+1}_0_S{i+1}_0\n"


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
"""

mask += "carry1 = 3221225472\n"
mask += "2x vec_MASKcarry1 = carry1\n"
mask += "2x vec_MASKcarry2 = vec_MASKcarry1 << 32\n"
mask += "vec_MASKcarry = vec_MASKcarry1 | vec_MASKcarry2\n"
mask += "vec_MASKeffect = ~vec_MASKcarry\n"
mask += "ONE = 1\n"
mask += "2x vec_ONE = ONE\n"



# Minus the [ uhat & F , rhat & F ] and [ vhat & G , shat & G ]

minus1_var = ""
minus1 = ""

minus1_var += """

reg128 vec_uhat_rhat_vhat_shat
reg128 vec_uhat_rhat
reg128 vec_vhat_shat

reg128 vec_tmp1
reg128 vec_tmp2
reg128 vec_carry1
reg128 vec_carry2
"""

minus1 += "# Get the hats\n"
minus1 += "4x vec_uhat_rhat_vhat_shat = vec_u1_r1_v1_s1 >> 31\n"
minus1 += "4x vec_uhat_rhat = vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[1/4] vec_uhat_rhat_vhat_shat[1/4]\n"
minus1 += "4x vec_vhat_shat = vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[3/4] vec_uhat_rhat_vhat_shat[3/4]\n"

minus1 += "# Minus [ uhat & 4F , rhat & 4F ]\n"
minus1 += "2x vec_tmp1 = vec_F0_F1_G0_G1[0/2]\n"
minus1 += "2x vec_tmp2 = vec_F2_F3_G2_G3[0/2]\n"

minus1 += "2x vec_tmp1 <<= 2\n"
minus1 += "2x vec_tmp2 <<= 2\n"

minus1 += "vec_carry1 = vec_tmp1 & vec_MASKcarry1\n"
minus1 += "vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1\n"

minus1 += "2x vec_carry1 <<= 2\n"
minus1 += "vec_tmp1 |= vec_carry1\n"

minus1 += "vec_carry2 = vec_tmp1 & vec_MASKcarry2\n"
minus1 += "vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2\n"
minus1 += "2x vec_carry2 unsigned>>= 62\n"

minus1 += "vec_tmp2 |= vec_carry2\n"

minus1 += "vec_carry1 = vec_tmp2 & vec_MASKcarry1\n"
minus1 += "vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1\n"

minus1 += "2x vec_carry1 <<= 2\n"
minus1 += "vec_tmp2 |= vec_carry1\n"

minus1 += "\n# So far, 4F is stored in tmp1 and tmp2\n#Negation starts\n\n"

minus1 += "vec_tmp1 = vec_tmp1 ^ vec_MASKcarry\n"
minus1 += "vec_tmp1 = ~vec_tmp1\n"
minus1 += "vec_tmp2 = vec_tmp2 ^ vec_MASKcarry1\n"
minus1 += "vec_tmp2 = ~vec_tmp2\n"
minus1 += "2x vec_tmp1 += vec_ONE\n"

minus1 += "\n#So far, we have stored F' = -4F into tmp1 and tmp2\n\n"

minus1 += "vec_tmp1 &= vec_uhat_rhat\n"
minus1 += "vec_tmp2 &= vec_uhat_rhat\n"

minus1 += "2x vec_R2_R3_S2_S3 += vec_tmp1\n"
minus1 += "2x vec_R4_R5_S4_S5 += vec_tmp2\n"


minus1 += "# Minus [ vhat & 4G , shat & 4G ]\n"

minus1 += "2x vec_tmp1 = vec_F0_F1_G0_G1[1/2]\n"
minus1 += "2x vec_tmp2 = vec_F2_F3_G2_G3[1/2]\n"

minus1 += "2x vec_tmp1 <<= 2\n"
minus1 += "2x vec_tmp2 <<= 2\n"

minus1 += "vec_carry1 = vec_tmp1 & vec_MASKcarry1\n"
minus1 += "vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1\n"

minus1 += "2x vec_carry1 <<= 2\n"
minus1 += "vec_tmp1 |= vec_carry1\n"

minus1 += "vec_carry2 = vec_tmp1 & vec_MASKcarry2\n"
minus1 += "vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2\n"
minus1 += "2x vec_carry2 unsigned>>= 62\n"

minus1 += "vec_tmp2 |= vec_carry2\n"

minus1 += "vec_carry1 = vec_tmp2 & vec_MASKcarry1\n"
minus1 += "vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1\n"

minus1 += "2x vec_carry1 <<= 2\n"
minus1 += "vec_tmp2 |= vec_carry1\n"

minus1 += "\n# So far, 4G is stored in tmp1 and tmp2\n#Negation starts\n\n"

minus1 += "vec_tmp1 = vec_tmp1 ^ vec_MASKcarry\n"
minus1 += "vec_tmp1 = ~vec_tmp1\n"
minus1 += "vec_tmp2 = vec_tmp2 ^ vec_MASKcarry1\n"
minus1 += "vec_tmp2 = ~vec_tmp2\n"
minus1 += "2x vec_tmp1 += vec_ONE\n"

minus1 += "\n#So far, we have stored G' = -4G into tmp1 and tmp2\n\n"

minus1 += "vec_tmp1 &= vec_vhat_shat\n"
minus1 += "vec_tmp2 &= vec_vhat_shat\n"

minus1 += "2x vec_R2_R3_S2_S3 += vec_tmp1\n"
minus1 += "2x vec_R4_R5_S4_S5 += vec_tmp2\n"



# Carry propagation
carry_propagation_var = ""
carry_propagation = ""

carry_propagation += "\n# Now we do carry propagation\n\n"
carry_propagation += "vec_carry1 = vec_R2_R3_S2_S3 & vec_MASKcarry1\n"
carry_propagation += "vec_R2_R3_S2_S3 = vec_R2_R3_S2_S3 & ~vec_MASKcarry1\n"
carry_propagation += "2x vec_carry1 <<= 2\n"
carry_propagation += "2x vec_R2_R3_S2_S3 += vec_carry1\n"
carry_propagation += "vec_carry2 = vec_R2_R3_S2_S3 & vec_MASKcarry2\n"
carry_propagation += "vec_R2_R3_S2_S3 = vec_R2_R3_S2_S3 & ~vec_MASKcarry2\n"

carry_propagation += "2x vec_carry2 unsigned>>= 62\n"
carry_propagation += "2x vec_R4_R5_S4_S5 += vec_carry2\n"
carry_propagation += "vec_carry1 = vec_R4_R5_S4_S5 & vec_MASKcarry1\n"
carry_propagation += "vec_R4_R5_S4_S5 = vec_R4_R5_S4_S5 & ~vec_MASKcarry1\n"
carry_propagation += "2x vec_carry1 <<= 2\n"
carry_propagation += "2x vec_R4_R5_S4_S5 += vec_carry1\n"

# Minus the [ Fhat & u , Fhat & r ] and [ Ghat & v , Ghat & s ]

minus2_var = ""
minus2 = ""

minus2_var += """

reg128 vec_Fhat_Ghat
reg128 vec_Fhat
reg128 vec_Ghat


"""

minus2 += """
2x vec_Fhat_Ghat = vec_F2_F3_G2_G3 >> 63
2x vec_Fhat = vec_Fhat_Ghat[0/2]
2x vec_Ghat = vec_Fhat_Ghat[1/2]

4x vec_tmp1 = vec_u0_r0_v0_s0[0/4] vec_u1_r1_v1_s1[0/4] vec_u0_r0_v0_s0[1/4] vec_u1_r1_v1_s1[1/4]

2x vec_tmp1 <<= 2
vec_carry1 = vec_tmp1 & vec_MASKcarry1
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1

2x vec_carry1 <<= 2
vec_tmp1 |= vec_carry1

vec_tmp1 ^= vec_MASKcarry1
vec_tmp1 = ~vec_tmp1

2x vec_tmp1 += vec_ONE

vec_tmp1 &= vec_Fhat
2x vec_R4_R5_S4_S5 += vec_tmp1




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
2x vec_R4_R5_S4_S5 += vec_tmp1

"""

# Carry propagation2
carry_propagation2_var = ""
carry_propagation2 = ""

carry_propagation2 += "\n# Now we do carry propagation2\n\n"
carry_propagation2 += "vec_carry1 = vec_R4_R5_S4_S5 & vec_MASKcarry1\n"
carry_propagation2 += "vec_R4_R5_S4_S5 = vec_R4_R5_S4_S5 & ~vec_MASKcarry1\n"
carry_propagation2 += "2x vec_carry1 <<= 2\n"
carry_propagation2 += "2x vec_R4_R5_S4_S5 += vec_carry1\n"

# Store the result
store_result_var = ""
store_result = ""
for symbol in ["R","S"]:
    for i in range(0,6,2):
        store_result_var += f"int64 {symbol}{i}{symbol}{i+1}\n"
    for i in range(0,6):
        store_result_var += f"int64 {symbol}{i}\n"
for i in range(0,6,2):
    store_result += f"R{i}R{i+1} = vec_R{i}_R{i+1}_S{i}_S{i+1}[0/2]\n"
    store_result += f"S{i}S{i+1} = vec_R{i}_R{i+1}_S{i}_S{i+1}[1/2]\n"
    store_result += f"mem64[pointerR+{4*i}] = R{i}R{i+1}\n"
    store_result += f"mem64[pointerS+{4*i}] = S{i}S{i+1}\n"


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

code += "\n\n#Collect the unsigned_product\n\n"
code += read_out
code += "\n\n#DEBUG: The unsigned product behaves as expected\n\n"

code += store_result

code += "\n\n#Producing the masks\n\n"
code += mask
code += "\n\n#Minus the [ uhat & F , rhat & F ] and [ vhat & G , shat & G ]\n\n"
code += minus1
code += carry_propagation

code += minus2
code += carry_propagation2

code += store_result


code += """

return

"""
with open("linear_comb.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < linear_comb.q > linear_comb.S")
os.system("gcc main.c linear_comb.S -o main -lgmp && ./main")
