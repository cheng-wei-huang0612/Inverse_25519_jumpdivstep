
code = ""


code += """
int64 pointer_delta
int64 pointer_fuv
int64 pointer_grs

input pointer_delta
input pointer_fuv
input pointer_grs

int64 delta
int64 fuv
int64 grs


int64 g0_and_1
int64 c_mask

int64 fuv_new
int64 grs_new
int64 grs_final
int64 neg_fuv
int64 neg_delta



enter divstepx20

delta = mem64[pointer_delta]
fuv = mem64[pointer_fuv]
grs = mem64[pointer_grs]


"""

for i in range(20):
    code += """
    g0_and_1 = grs & 1
    delta - 0!

    c_mask = g0_and_1 if signed> else 0 
    c_mask = -c_mask!   
    free c_mask

    neg_fuv = -fuv
    neg_delta = -delta


    fuv = grs if negative else fuv
    grs_new = neg_fuv if negative else grs 
    delta = neg_delta if negative else delta


    grs = -g0_and_1
    # grs_final = -g0_and_1

    grs = grs & fuv
    # grs_new = (-g0_and_1) & fuv_new

    grs += grs_new
    # grs_new = ((-g0_and_1) & fuv) + (grs)

    grs = grs signed>> 1
    # grs_new = (((-g0_and_1) & fuv) + (grs)) >> 1

    delta += 2

    """

code += """
mem64[pointer_delta] = delta
mem64[pointer_fuv] = fuv
mem64[pointer_grs] = grs




return


"""

with open("divstepx20_1.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < divstepx20_1.q > divstepx20_1.S")
