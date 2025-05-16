# i_loop.py
# Generates qhasm code for i_loop

code = """

enter i_loop

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



int64 pointer_delta
int64 pointer_F
int64 pointer_G
int64 pointer_V
int64 pointer_S
#int64 pointer_uuvvrrss

input pointer_delta
input pointer_F
input pointer_G
input pointer_V
input pointer_S
#input pointer_uuvvrrss

"""

code += """

int64 f
int64 g
int64 uu
int64 vv
int64 rr
int64 ss

int64 f_hi
int64 g_hi

f_hi = mem32[pointer_F + 4]
g_hi = mem32[pointer_G + 4]

f_hi = f_hi << 30
g_hi = g_hi << 30


f = mem32[pointer_F]
g = mem32[pointer_G]

f = f + f_hi
g = g + g_hi

uu = 1
vv = 0
rr = 0
ss = 1

"""


# Before j_loop s


code += """

# Before j_loop s

int64 m
m = mem64[pointer_delta]

int64 fuv
int64 grs



int64 g0_and_1
int64 c_mask

int64 fuv_new
int64 grs_new
int64 grs_final
int64 neg_fuv
int64 neg_delta

int64 oldG
int64 z
int64 minus_one
int64 delta_new


int64 h
int64 hh
int64 m1
int64 ff

int64 tmp
int64 prod_lo
int64 prod_hi
int64 new_f
int64 new_g
int64 new_uu
int64 new_vv
int64 new_rr
int64 new_ss

int64 2p41
2p41 = 1
2p41 = 2p41 << 41

int64 2p62
2p62 = 1
2p62 = 2p62 << 62

"""


# Perform first j_loop

code += """
# Perform first j_loop

fuv = f & 1048575
grs = g & 1048575
fuv -= 2p41
grs -= 2p62


"""


for i in range(20):
    code += """

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff

    """

# Extraction

code += """

# Extraction
int64 u
int64 v
int64 r
int64 s

v = fuv
v = v + 1048576
v = v + 2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + 2p41
s = s signed>> 42

r = grs + 1048576
r = r << 22
r = r signed>> 43


"""


# inner update
code += """
# inner update


prod_lo = u * f
prod_hi = u signed* f (hi)

tmp = v * g
prod_lo += tmp !

tmp = v signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_f = prod_lo | prod_hi




prod_lo = r * f
prod_hi = r signed* f (hi)

tmp = s * g
prod_lo += tmp !

tmp = s signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_g = prod_lo | prod_hi

f = new_f
g = new_g

tmp = u * uu
new_uu = tmp + v * rr

tmp = r * uu
new_rr = tmp + s * rr

tmp = u * vv
new_vv = tmp + v * ss

tmp = r * vv
new_ss = tmp + s * ss

uu = new_uu
vv = new_vv

rr = new_rr
ss = new_ss



"""


# Perform second j_loop

code += """
# Perform second j_loop

fuv = f & 1048575
grs = g & 1048575
fuv -= 2p41
grs -= 2p62


"""


for i in range(20):
    code += """

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff

    """

# Extraction

code += """

# Extraction


v = fuv
v = v + 1048576
v = v + 2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + 2p41
s = s signed>> 42

r = grs + 1048576
r = r << 22
r = r signed>> 43


"""


# inner update
code += """
# inner update


prod_lo = u * f
prod_hi = u signed* f (hi)

tmp = v * g
prod_lo += tmp !

tmp = v signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_f = prod_lo | prod_hi


prod_lo = r * f
prod_hi = r signed* f (hi)

tmp = s * g
prod_lo += tmp !

tmp = s signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_g = prod_lo | prod_hi

f = new_f
g = new_g

tmp = u * uu
new_uu = tmp + v * rr

tmp = r * uu
new_rr = tmp + s * rr

tmp = u * vv
new_vv = tmp + v * ss

tmp = r * vv
new_ss = tmp + s * ss

uu = new_uu
vv = new_vv

rr = new_rr
ss = new_ss



"""


# Perform final (third) j_loop_final

code += """
# Perform final (third) j_loop_final


fuv = f & 1048575
grs = g & 1048575
fuv -= 2p41
grs -= 2p62


"""


for i in range(20):
    code += """

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff

    """

# Extraction

code += """


# Extraction


v = fuv
v = v + 1048576
v = v + 2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + 2p41
s = s signed>> 42

r = grs + 1048576
r = r << 22
r = r signed>> 43


"""


# inner update
code += """
# inner update


tmp = u * uu
new_uu = tmp + v * rr

tmp = r * uu
new_rr = tmp + s * rr

tmp = u * vv
new_vv = tmp + v * ss

tmp = r * vv
new_ss = tmp + s * ss

uu = new_uu
vv = new_vv

rr = new_rr
ss = new_ss



"""


code += """

mem64[pointer_delta] = m
#mem128[pointer_uuvvrrss] = uu, vv
#mem128[pointer_uuvvrrss + 16] = rr, ss


"""


# So far, uu, vv, rr, ss are computed






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
    code += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer_{symbol}]\n"
    code += f"{symbol}4{symbol}5, {symbol}6{symbol}7 = mem128[pointer_{symbol}+16]\n"
    code += f"{symbol}8 = mem32[pointer_{symbol}+32]\n"
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

mem256[pointer_F] = vec_F2_F3_F4_F5, vec_F6_F7_F8_F9
mem256[pointer_G] = vec_G2_G3_G4_G5, vec_G6_G7_G8_G9
# mem128[pointerF + 16] = vec_F6_F7_F8_F9
# mem128[pointerG + 16] = vec_G6_G7_G8_G9


int64 F10
F10 = vec_F10_0_G10_0[0/2]
mem32[pointer_F+32] = F10
int64 G10
G10 = vec_F10_0_G10_0[1/2]
mem32[pointer_G+32] = G10


"""


# Update VS
code += """
# register initialization and specification


# reg128 vec_F0_F1_G0_G1
# assign v0 to vec_F0_F1_G0_G1
# reg128 vec_F2_F3_G2_G3
# assign v1 to vec_F2_F3_G2_G3
# reg128 vec_F4_F5_G4_G5
# assign v2 to vec_F4_F5_G4_G5
# reg128 vec_F6_F7_G6_G7
# assign v3 to vec_F6_F7_G6_G7
# reg128 vec_F8_F9_G8_G9
# assign v4 to vec_F8_F9_G8_G9
# The F9, G9 are always 0, we put them here for easy program writing

reg128 vec_V0_V1_S0_S1
#assign v5 to vec_V0_V1_S0_S1
reg128 vec_V2_V3_S2_S3
#assign v6 to vec_V2_V3_S2_S3
reg128 vec_V4_V5_S4_S5
#assign v7 to vec_V4_V5_S4_S5
reg128 vec_V6_V7_S6_S7
#assign v8 to vec_V6_V7_S6_S7
reg128 vec_V8_V9_S8_S9
#assign v9 to vec_V8_V9_S8_S9
# The V9, S9 are always 0, we put them here for easy program writing

# reg128 vec_uu0_rr0_vv0_ss0
# assign v10 to vec_uu0_rr0_vv0_ss0
# reg128 vec_uu1_rr1_vv1_ss1
# assign v11 to vec_uu1_rr1_vv1_ss1
# reg128 vec_uuhat_rrhat_vvhat_sshat
# assign v12 to vec_uuhat_rrhat_vvhat_sshat

reg128 vec_2x_2p30m1
# assign v13 to vec_2x_2p30m1

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
    code += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer_{symbol}]\n"
    code += f"{symbol}4{symbol}5, {symbol}6{symbol}7 = mem128[pointer_{symbol}+16]\n"
    code += f"{symbol}8{symbol}9 = mem32[pointer_{symbol}+32]\n"
    code += "\n"




for i in range(0,10,2):
    # code += f"reg128 vec_V{i}_V{i+1}_S{i}_S{i+1} \n"
    code += "\n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[0/2] = V{i}V{i+1} \n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[1/2] = S{i}S{i+1} \n"
    code += "\n"







# Data initialization, we do not need optimization
# make vec_F0_F1_G0_G1, ... 

# for symbol in ["uu","vv","rr","ss"]:

#     code += f"int64 {symbol}0\n"
#     code += f"int64 {symbol}1\n"
#     code += f"{symbol}0 = {symbol} & ((1 << 30)-1)\n"
#     code += f"{symbol}1 = ({symbol} >> 30) & ((1 << 32)-1)\n"
#     code += "\n"


# for j in range(2):
#     # code += f"reg128 vec_uu{j}_rr{j}_vv{j}_ss{j}\n"
#     code += "\n"
#     for (i, symbol) in enumerate(["uu", "rr", "vv", "ss"]):
#         code += f"vec_uu{j}_rr{j}_vv{j}_ss{j}[{i}/4] = {symbol}{j}\n"

#     code += "\n"



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

#reg128 vec_uuhat_rrhat
#reg128 vec_vvhat_sshat
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
4x vec_buf = vec_P0_P1_P0_P1 - vec_V0_V1_V0_V1
vec_buf &= vec_uuhat_rrhat
4x vec_Vp0_Vp1_Sp0_Sp1 = vec_Vp0_Vp1_Sp0_Sp1 + vec_buf

2x vec_V2_V3_V2_V3 zip= vec_V2_V3_S2_S3[0/2] vec_V2_V3_S2_S3[0/2]
4x vec_buf = vec_4x_2p30m1 - vec_V2_V3_V2_V3
vec_buf &= vec_uuhat_rrhat
4x vec_Vp2_Vp3_Sp2_Sp3 = vec_Vp2_Vp3_Sp2_Sp3 + vec_buf

2x vec_V4_V5_V4_V5 zip= vec_V4_V5_S4_S5[0/2] vec_V4_V5_S4_S5[0/2]
4x vec_buf = vec_4x_2p30m1 - vec_V4_V5_V4_V5
vec_buf &= vec_uuhat_rrhat
4x vec_Vp4_Vp5_Sp4_Sp5 = vec_Vp4_Vp5_Sp4_Sp5 + vec_buf

2x vec_V6_V7_V6_V7 zip= vec_V6_V7_S6_S7[0/2] vec_V6_V7_S6_S7[0/2]
4x vec_buf = vec_4x_2p30m1 - vec_V6_V7_V6_V7
vec_buf &= vec_uuhat_rrhat
4x vec_Vp6_Vp7_Sp6_Sp7 = vec_Vp6_Vp7_Sp6_Sp7 + vec_buf

2x vec_V8_V9_V8_V9 zip= vec_V8_V9_S8_S9[0/2] vec_V8_V9_S8_S9[0/2]
4x vec_buf = vec_2x_2p15m1 - vec_V8_V9_V8_V9
vec_buf &= vec_uuhat_rrhat
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

mem256[pointer_V] = vec_Vp0_Vp1_Vp2_Vp3, vec_Vp4_Vp5_Vp6_Vp7
mem256[pointer_S] = vec_Sp0_Sp1_Sp2_Sp3, vec_Sp4_Sp5_Sp6_Sp7
# mem128[pointerV + 16] = vec_Vp4_Vp5_Vp6_Vp7
# mem128[pointerS + 16] = vec_Sp4_Sp5_Sp6_Sp7

int64 Vp8
Vp8 = vec_Vp8_Vp9_Sp8_Sp9[0/2]
mem32[pointer_V+32] = Vp8
int64 Sp8
Sp8 = vec_Vp8_Vp9_Sp8_Sp9[1/2]
mem32[pointer_S+32] = Sp8

"""















for i in range(15-1, 8-1,-2):
    code += f"pop2x8b calleesaved_v{i}, calleesaved_v{i+1}\n"
for i in range(29, 18-1,-2):
    code += f"pop2xint64 calleesaved_x{i-1}, calleesaved_x{i}\n"



code += """
return

"""



with open("i_loop.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < i_loop.q > i_loop.S")
