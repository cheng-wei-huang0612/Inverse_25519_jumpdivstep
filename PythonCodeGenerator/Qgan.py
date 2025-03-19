

code = ""

variables_and_entrance = """
int64 pointerX
int64 pointerINV

input pointerX
input pointerINV 

int64 X_limb64_0
int64 X_limb64_1
int64 X_limb64_2
int64 X_limb64_3


int32 NINETEEN
int32 P2TO30M1
int32 P2TO15M1
int32 ZERO
int32 ONE


reg128 FG0
reg128 FG1
reg128 FG2
reg128 FG3
reg128 FG4
reg128 FG5
reg128 FG6
reg128 FG7
reg128 FG8

reg128 F0to3
reg128 F4to7
reg128 F8to8

reg128 G0to3
reg128 G4to7
reg128 G8to8

reg128 V0to3
reg128 V4to7
reg128 V8to8

reg128 S0to3
reg128 S4to7
reg128 S8to8

int64 f 
int64 g 
int64 delta 
int64 fuv 
int64 grs 

int64 uu
int64 vv
int64 rr
int64 ss 

int64 uu_new
int64 vv_new
int64 rr_new
int64 ss_new

int64 u
int64 v
int64 r
int64 s 

int64 g0_and_1 
int64 cond 
int64 c_mask
int64 n_mask 
int64 neg_fuv 
int64 fuv_new 
int64 grs_new 
int64 delta_swapper



enter cpt_inv
"""


F_initialization = """

NINETEEN = 19
P2TO30M1 = 1073741823
P2TO15M1 = 32767
ZERO     = 0 
ONE      = 1

4x F0to3 = P2TO30M1 
4x F4to7 = P2TO30M1
F8to8[0/4] = NINETEEN
4x F0to3 -= F8to8 
F8to8[0/4] = P2TO15M1

X_limb64_0, X_limb64_1 = mem128[pointerX]
X_limb64_2, X_limb64_3 = mem128[pointerX+16]



G0to3[0/4] = (int32) X_limb64_0
X_limb64_0 = X_limb64_1 , X_limb64_2  >> 30





4x V0to3 = ZERO 
4x V4to7 = ZERO
V8to8[0/4] = ZERO

4x S0to3 = ZERO 
4x S4to7 = ZERO
S8to8[0/4] = ONE









"""





return_ = """return"""



code += variables_and_entrance 

code += F_initialization

code += return_



with open("cpt_inv.q","w") as f:
    f.write(code)

import os 

os.system("qhasm-aarch64-align < cpt_inv.q > cpt_inv.S")
