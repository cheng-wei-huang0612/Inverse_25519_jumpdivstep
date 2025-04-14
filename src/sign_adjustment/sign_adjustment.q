int64 pointer_inv30
int64 pointer_F
int64 pointer_V

input pointer_inv30
input pointer_F
input pointer_V

int64 F0_F1
reg128 vec_F0_F1_G0_G1

int64 V0_V1
int64 V2_V3
int64 V4_V5
int64 V6_V7
int64 V8_0 

reg128 vec_V0_V1_S0_S1
reg128 vec_V2_V3_S2_S3
reg128 vec_V4_V5_S4_S5
reg128 vec_V6_V7_S6_S7
reg128 vec_V8_0_S8_0

int64 2p30m1
reg128 vec_F0_F0_F0_F0
reg128 vec_2p30m1
reg128 vec_mask
int64 mask
reg128 vec_not_mask
int64 not_mask
reg128 vec_diff
reg128 vec_neg_diff

reg128 vec_inv0_inv1_inv2_inv3
reg128 vec_inv4_inv5_inv6_inv7
int64 inv8

reg128 vec_V0_V1_V2_V3
reg128 vec_V4_V5_V6_V7
int64 V8

reg128 vec_tmp1
reg128 vec_tmp2

int64 tmpa
int64 tmpb

int64 borrow
int64 inv0
int64 inv1
int64 inv2
int64 inv3
int64 inv4
int64 inv5
int64 inv6
int64 inv7

int64 eighteen

enter sign_adjustment

# initial condition
# in the real implementation, these will not occur
F0_F1 = mem64[pointer_F]
vec_F0_F1_G0_G1[0/2] = F0_F1


V0_V1 = mem64[pointer_V]
V2_V3 = mem64[pointer_V + 8]
V4_V5 = mem64[pointer_V + 16]
V6_V7 = mem64[pointer_V + 32]
V8_0 = mem32[pointer_V + 40]

vec_V0_V1_S0_S1[0/2] = V0_V1
vec_V2_V3_S2_S3[0/2] = V2_V3
vec_V4_V5_S4_S5[0/2] = V4_V5
vec_V6_V7_S6_S7[0/2] = V6_V7
vec_V8_0_S8_0[0/2] = V8_0

# debug: return
# initial conditioning ends


4x vec_F0_F0_F0_F0 = vec_F0_F1_G0_G1[0/4]
2p30m1 = 1073741823
4x vec_2p30m1 = 2p30m1

vec_diff = vec_F0_F0_F0_F0 ^ vec_2p30m1
4x vec_neg_diff = -vec_diff
vec_not_mask = vec_diff | vec_neg_diff
4x vec_not_mask = vec_not_mask >> 31
vec_mask = ~vec_not_mask

mask = vec_mask[0/4]
not_mask = ~mask

vec_inv0_inv1_inv2_inv3 = vec_mask & vec_2p30m1
vec_inv4_inv5_inv6_inv7 = vec_inv0_inv1_inv2_inv3 
inv8 = 32767
inv8 = inv8 & mask

# debug: return

2x vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2] 
2x vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]


vec_tmp1 = vec_V0_V1_V2_V3 & vec_mask
4x vec_inv0_inv1_inv2_inv3 -= vec_tmp1


vec_tmp2 = vec_V4_V5_V6_V7 & vec_mask
4x vec_inv4_inv5_inv6_inv7 -= vec_tmp2


vec_tmp1 = vec_V0_V1_V2_V3 & vec_not_mask
4x vec_inv0_inv1_inv2_inv3 += vec_tmp1

vec_tmp2 = vec_V4_V5_V6_V7 & vec_not_mask
4x vec_inv4_inv5_inv6_inv7 += vec_tmp2

V8 = vec_V8_0_S8_0[0/4]
tmpa = mask & V8

# debug: return

inv8 -= tmpa

tmpb = not_mask & V8

inv8 += tmpb

borrow = 0
inv0 = vec_inv0_inv1_inv2_inv3[0/4]

# debug: return

eighteen = 18
tmpa = mask & eighteen
inv0 -= tmpa

inv1 = vec_inv0_inv1_inv2_inv3[1/4]
borrow = inv0 signed>> 31
inv1 -= borrow
inv0 = inv0 + borrow << 30

inv2 = vec_inv0_inv1_inv2_inv3[2/4]
borrow = inv1 signed>> 31
inv2 -= borrow
inv1 = inv1 + borrow << 30

inv3 = vec_inv0_inv1_inv2_inv3[3/4]
borrow = inv2 signed>> 31
inv3 -= borrow
inv2 = inv2 + borrow << 30

inv4 = vec_inv4_inv5_inv6_inv7[0/4]
borrow = inv3 signed>> 31
inv4 -= borrow
inv3 = inv3 + borrow << 30

inv5 = vec_inv4_inv5_inv6_inv7[1/4]
borrow = inv4 signed>> 31
inv5 -= borrow
inv4 = inv4 + borrow << 30

inv6 = vec_inv4_inv5_inv6_inv7[2/4]
borrow = inv5 signed>> 31
inv6 -= borrow
inv5 = inv5 + borrow << 30

inv7 = vec_inv4_inv5_inv6_inv7[3/4]
borrow = inv6 signed>> 31
inv7 -= borrow
inv6 = inv6 + borrow << 30

borrow = inv7 signed>> 31
inv8 -= borrow
inv7 = inv7 + borrow << 30




# debug: return
# store back


mem32[pointer_inv30] = inv0
mem32[pointer_inv30 + 4] = inv1
mem32[pointer_inv30 + 8] = inv2
mem32[pointer_inv30 + 12] = inv3
mem32[pointer_inv30 + 16] = inv4
mem32[pointer_inv30 + 20] = inv5
mem32[pointer_inv30 + 24] = inv6
mem32[pointer_inv30 + 28] = inv7
mem32[pointer_inv30 + 32] = inv8


return
