
code = """enter update_FG"""



code += """
int64 pointerF
int64 pointerG
int64 pointeruuvvrrss

input pointerF
input pointerG
input pointeruuvvrrss
"""

code += """
# Calling Convention

"""


for i in range(18, 29+1,1):
    code += f"caller calleesaved_x{i}\n"
for i in range(8, 15+1,1):
    code += f"caller calleesaved_v{i}\n"

for i in range(18, 29+1,2):
    code += f"push2xint64 calleesaved_x{i}, calleesaved_x{i+1}\n"

for i in range(8, 15+1,2):
    code += f"push2x8b calleesaved_v{i}, calleesaved_v{i+1}\n"


code += """

# F, G Data Layout Configuration

"""

for symbol in ["F","G"]:
    
    code += f"int64 {symbol}0{symbol}1\n"
    code += f"int64 {symbol}2{symbol}3\n"
    code += f"int64 {symbol}4{symbol}5\n"
    code += f"int64 {symbol}6{symbol}7\n"
    code += f"int64 {symbol}8\n"
    code += "\n"
    code += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer{symbol}]\n"
    code += f"{symbol}4{symbol}5, {symbol}6{symbol}7 = mem128[pointer{symbol}+16]\n"
    code += f"{symbol}8 = mem32[pointer{symbol}+32]\n"
    code += "\n"




for i in range(0,8,2):
    code += f"reg128 vec_F{i}_F{i+1}_G{i}_G{i+1} \n"
    code += "\n"
    code += f"vec_F{i}_F{i+1}_G{i}_G{i+1}[0/2] = F{i}F{i+1} \n"
    code += f"vec_F{i}_F{i+1}_G{i}_G{i+1}[1/2] = G{i}G{i+1} \n"
    code += "\n"


code += """
reg128 vec_F8_0_G8_0
vec_F8_0_G8_0[0/2] = F8
vec_F8_0_G8_0[1/2] = G8
"""


code += """

# uu, vv, rr, ss 
# They are obtained in general-purpose register
# The method to move them into Neon register matters

# Simulating that they are given in the general-purpose register
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
    code += f"reg128 vec_uu{j}_rr{j}_vv{j}_ss{j}\n"
    code += "\n"
    for (i, symbol) in enumerate(["uu", "rr", "vv", "ss"]):
        code += f"vec_uu{j}_rr{j}_vv{j}_ss{j}[{i}/4] = {symbol}{j}\n"

    code += "\n"



code += """

reg128 vec_uuhat_rrhat_vvhat_sshat
reg128 vec_uuhat_rrhat
reg128 vec_vvhat_sshat

# Get the hats
4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31
4x vec_uuhat_rrhat = vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[1/4] vec_uuhat_rrhat_vvhat_sshat[1/4]
4x vec_vvhat_sshat = vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[3/4] vec_uuhat_rrhat_vvhat_sshat[3/4]

"""




code += """
# Now we perform the unsigned long product
reg128 vec_tmp0
reg128 vec_MASK2p30m1
reg128 vec_MASK2p32m1

2x vec_tmp0 = 0
2x vec_MASK2p32m1 = 0xFFFFFFFF
2x vec_MASK2p30m1 = vec_MASK2p32m1 unsigned>> 2

"""



for i in range(0,11):
    code += f"reg128 vec_R{i}_0_S{i}_0\n"



code += """
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F0_F1_G0_G1[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[2/4]

vec_R0_0_S0_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F0_F1_G0_G1[1/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[3/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[2/4]

vec_R1_0_S1_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[2/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[1/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[3/4]

vec_R2_0_S2_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[1/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[3/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[2/4]

vec_R3_0_S3_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[2/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[1/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[3/4]

vec_R4_0_S4_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[1/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[3/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[2/4]

vec_R5_0_S5_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[2/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[1/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[3/4]

vec_R6_0_S6_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[1/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[3/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[2/4]

vec_R7_0_S7_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F8_0_G8_0[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F8_0_G8_0[2/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[1/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[3/4]

vec_R8_0_S8_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F8_0_G8_0[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F8_0_G8_0[2/4]

vec_R9_0_S9_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

vec_R10_0_S10_0 = vec_tmp0 

"""

code += """

# We collect the unsigned products as
# vec_R0_R1_S0_S1
# vec_R2_R3_S2_S3
# vec_R4_R5_S4_S5
# vec_R6_R7_S6_S7
# vec_R8_R9_S8_S9
# vec_R10_0_S10_0

"""


# Read out 
# Prepare for the following hat subtraction

for i in range(0,10,2):
    code += f"reg128 vec_R{i}_R{i+1}_S{i}_S{i+1}\n"
    code += f"2x vec_R{i+1}_0_S{i+1}_0 <<= 32\n"
    code += f"vec_R{i}_R{i+1}_S{i}_S{i+1} = vec_R{i}_0_S{i}_0 | vec_R{i+1}_0_S{i+1}_0\n"
    code += "\n"






# Minus
# Prepare the Masks for the following carry propagation and negation

code += """
int64 carry1

carry1 = 3221225472
reg128 vec_MASKcarry1

2x vec_MASKcarry1 = carry1

reg128 vec_MASKcarry2

2x vec_MASKcarry2 = vec_MASKcarry1 << 32

reg128 vec_MASKcarry

vec_MASKcarry = vec_MASKcarry1 | vec_MASKcarry2

reg128 vec_MASKeffect

vec_MASKeffect = ~vec_MASKcarry

int64 ONE

ONE = 1

reg128 vec_ONE

2x vec_ONE = ONE

reg128 vec_MASKhalfeffect

int64 2p32m1

2p32m1 = 4294967295

2x vec_MASKhalfeffect = 2p32m1

"""




# Minus the [ uhat & F , rhat & F ] and [ vhat & G , shat & G ]


code += """
reg128 vec_tmp1
reg128 vec_tmp2
reg128 vec_tmp3
reg128 vec_tmp4
reg128 vec_tmp5

reg128 vec_carry1
reg128 vec_carry2
"""


code += """
# Minus [ uhat & 4F , rhat & 4F ]
#
# Prepare vec_tmpn = 4*F
"""

for i in range(0,8,2):
    code += f"2x vec_tmp{1+(i>>1)} = vec_F{i}_F{i+1}_G{i}_G{i+1}[0/2]\n"
code += "2x vec_tmp5 = vec_F8_0_G8_0[0/2]\n"
code += "\n"

for i in range(1,6):
    code += f"2x vec_tmp{i} <<= 2\n"

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    code += f"vec_carry1 = vec_tmp{i} & vec_MASKcarry1\n"
    code += f"vec_tmp{i} = vec_tmp{i} & ~vec_MASKcarry1\n"
    code += f"2x vec_carry1 <<= 2\n"
    code += f"vec_tmp{i} |= vec_carry1\n"
    code += "\n"

    code += f"vec_carry2 = vec_tmp{i} & vec_MASKcarry2\n"
    code += f"vec_tmp{i} = vec_tmp{i} & ~vec_MASKcarry2\n"
    code += f"2x vec_carry2 unsigned>>= 62\n"
    code += f"vec_tmp{i+1} |= vec_carry2\n"
    code += "\n"
    code += "\n"

code += """

# So far, we have stored 4F into tmp1-5
# We now take the negation of 4F, i.e., -4F
# Effectively, we do -A = not(A)+1 
# however, the not is perform according to effective bits, that is, excluded the carry buffer bits

"""

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    code += f"vec_tmp{i} ^= vec_MASKcarry\n"
    code += f"vec_tmp{i} = ~vec_tmp{i}\n"

code += "vec_tmp5 ^= vec_MASKhalfeffect\n"

code += "2x vec_tmp1 += vec_ONE\n"

code += """

# So far, we have stored F' = -4F into tmp1-5

# We now perform the conditional subtraction
"""

for i in range(1,6,1):
    # i = 1, 2, 3, 4, 5
    code += f"vec_tmp{i} &= vec_uuhat_rrhat\n"

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    code += f"2x vec_R{2*i}_R{2*i+1}_S{2*i}_S{2*i+1} += vec_tmp{i}\n"

code += "2x vec_R10_0_S10_0 += vec_tmp5\n"
code += "\n"


code += """

# Minus [ vhat & 4G , shat & 4G ]

"""

for i in range(0,8,2):
    code += f"2x vec_tmp{1+(i>>1)} = vec_F{i}_F{i+1}_G{i}_G{i+1}[1/2]\n"
code += "2x vec_tmp5 = vec_F8_0_G8_0[1/2]\n"

for i in range(1,6):
    code += f"2x vec_tmp{i} <<= 2\n"


code += """

# Remark:
# vec_F0_F1_G0_G1
# vec_F2_F3_G2_G3
# vec_F4_F5_G4_G5
# vec_F6_F7_G6_G7
# These data are no longer used, 
# vec_F8_0_G8_0 will be used for getting vec_Fhat_0_Ghat_0 later

"""


for i in range(1,5,1):
    # i = 1, 2, 3, 4
    code += f"vec_carry1 = vec_tmp{i} & vec_MASKcarry1\n"
    code += f"vec_tmp{i} = vec_tmp{i} & ~vec_MASKcarry1\n"
    code += f"2x vec_carry1 <<= 2\n"
    code += f"vec_tmp{i} |= vec_carry1\n"
    code += "\n"

    code += f"vec_carry2 = vec_tmp{i} & vec_MASKcarry2\n"
    code += f"vec_tmp{i} = vec_tmp{i} & ~vec_MASKcarry2\n"
    code += f"2x vec_carry2 unsigned>>= 62\n"
    code += f"vec_tmp{i+1} |= vec_carry2\n"
    code += "\n"
    code += "\n"

code += """
# So far, we have stored 4G into tmp1-5
"""

for i in range(1,5,1):
    # i = 1, 2, 3, 4
    code += f"vec_tmp{i} ^= vec_MASKcarry\n"
    code += f"vec_tmp{i} = ~vec_tmp{i}\n"

code += "vec_tmp5 ^= vec_MASKhalfeffect\n"
#minus1 += "vec_tmp5 = ~vec_tmp5\n"

code += "2x vec_tmp1 += vec_ONE\n"

code += """
# So far, we have stored G' = -4G into tmp1-5
"""

for i in range(1,6,1):
    # i = 1, 2, 3, 4, 5
    code += f"vec_tmp{i} &= vec_vvhat_sshat\n"

code += "reg128 vec_F8_F9_G8_G9\n"
code += "reg128 vec_F10_0_G10_0\n"
for i in range(1,5,1):
    # i = 1, 2, 3, 4
    code += f"2x vec_F{2*i}_F{2*i+1}_G{2*i}_G{2*i+1} = vec_R{2*i}_R{2*i+1}_S{2*i}_S{2*i+1} + vec_tmp{i}\n"

code += "2x vec_F10_0_G10_0 = vec_R10_0_S10_0 + vec_tmp5\n"
code += "\n"




# Carry propagation

code += """

# Carry propagation

"""

for i in range(2,10,2):
    code += f"vec_carry1 = vec_F{i}_F{i+1}_G{i}_G{i+1} & vec_MASKcarry1\n"
    code += f"vec_F{i}_F{i+1}_G{i}_G{i+1} = vec_F{i}_F{i+1}_G{i}_G{i+1} & ~vec_MASKcarry1\n"
    code += f"2x vec_carry1 <<= 2\n"
    code += f"2x vec_F{i}_F{i+1}_G{i}_G{i+1} += vec_carry1\n"
    code += f"vec_carry2 = vec_F{i}_F{i+1}_G{i}_G{i+1} & vec_MASKcarry2\n"
    code += f"vec_F{i}_F{i+1}_G{i}_G{i+1} = vec_F{i}_F{i+1}_G{i}_G{i+1} & ~vec_MASKcarry2\n"
    code += f"2x vec_carry2 unsigned>>= 62\n"
    if i <8:
        code += f"2x vec_F{i+2}_F{i+3}_G{i+2}_G{i+3} += vec_carry2\n"
    else:
        code += f"2x vec_F{i+2}_0_G{i+2}_0 += vec_carry2\n"
    code += "\n"


# Minus the [ Fhat & u , Fhat & r ] and [ Ghat & v , Ghat & s ]
code += """

reg128 vec_Fhat_0_Ghat_0
reg128 vec_Fhat
reg128 vec_Ghat


"""

code += """
4x vec_Fhat_0_Ghat_0 = vec_F8_0_G8_0 >> 31

4x vec_Fhat = vec_Fhat_0_Ghat_0[0/4]
4x vec_Ghat = vec_Fhat_0_Ghat_0[2/4]

4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[0/4] vec_uu1_rr1_vv1_ss1[0/4] vec_uu0_rr0_vv0_ss0[1/4] vec_uu1_rr1_vv1_ss1[1/4]

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


2x vec_F8_F9_G8_G9 += vec_tmp2
2x vec_F10_0_G10_0 += vec_tmp3



4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[2/4] vec_uu1_rr1_vv1_ss1[2/4] vec_uu0_rr0_vv0_ss0[3/4] vec_uu1_rr1_vv1_ss1[3/4]

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


2x vec_F8_F9_G8_G9 += vec_tmp2
2x vec_F10_0_G10_0 += vec_tmp3

"""

# Carry propagation2

code += """
# Now we do carry propagation2

vec_carry1 = vec_F8_F9_G8_G9 & vec_MASKcarry1
vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
2x vec_F8_F9_G8_G9 += vec_carry1
vec_carry2 = vec_F8_F9_G8_G9 & vec_MASKcarry2
vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
2x vec_F10_0_G10_0 += vec_carry2
"""



code += """

# Now we store the results back to memory


reg128 vec_F2_F3_F4_F5
reg128 vec_G2_G3_G4_G5
2x vec_F2_F3_F4_F5 zip= vec_F2_F3_G2_G3[0/2] vec_F4_F5_G4_G5[0/2]
2x vec_G2_G3_G4_G5 zip= vec_F2_F3_G2_G3[1/2] vec_F4_F5_G4_G5[1/2]


reg128 vec_F6_F7_F8_F9
reg128 vec_G6_G7_G8_G9
2x vec_F6_F7_F8_F9 zip= vec_F6_F7_G6_G7[0/2] vec_F8_F9_G8_G9[0/2]
2x vec_G6_G7_G8_G9 zip= vec_F6_F7_G6_G7[1/2] vec_F8_F9_G8_G9[1/2]

mem256[pointerF] = vec_F2_F3_F4_F5, vec_F6_F7_F8_F9
mem256[pointerG] = vec_G2_G3_G4_G5, vec_G6_G7_G8_G9
# mem128[pointerF + 16] = vec_F6_F7_F8_F9
# mem128[pointerG + 16] = vec_G6_G7_G8_G9


int64 F10
F10 = vec_F10_0_G10_0[0/2]
mem32[pointerF+32] = F10
int64 G10
G10 = vec_F10_0_G10_0[1/2]
mem32[pointerG+32] = G10


"""






for i in range(15-1, 8-1,-2):
    code += f"pop2x8b calleesaved_v{i}, calleesaved_v{i+1}\n"
for i in range(29, 18-1,-2):
    code += f"pop2xint64 calleesaved_x{i-1}, calleesaved_x{i}\n"



code += """

return

"""
with open("update_FG.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < update_FG.q > update_FG.S")
