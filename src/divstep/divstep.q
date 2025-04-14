
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
int64 cond
int64 delta_tmp
int64 c_mask
int64 n_mask

int64 fuv_new
int64 grs_new
int64 tmp
int64 neg_fuv

int64 neg_delta
int64 delta_swapper



enter divstep

delta = mem64[pointer_delta]
fuv = mem64[pointer_fuv]
grs = mem64[pointer_grs]


g0_and_1 = grs & 1

delta_tmp = delta - 1
delta_tmp = delta_tmp signed>> 63
delta_tmp = ~delta_tmp
cond = delta_tmp & g0_and_1

c_mask = -cond
n_mask = ~c_mask

fuv_new = n_mask & fuv
tmp = c_mask & grs
fuv_new = fuv_new ^ tmp

neg_fuv = -fuv
grs_new = c_mask & neg_fuv
tmp = n_mask & grs
grs_new = grs_new ^ tmp


fuv = fuv_new
grs = grs_new


neg_delta = -delta

delta_swapper = delta ^ neg_delta
tmp = c_mask & delta_swapper
delta ^= tmp

grs_new = -g0_and_1
# grs_new = -g0_and_1

grs_new = grs_new & fuv
# grs_new = (-g0_and_1) & fuv

grs_new += grs
# grs_new = ((-g0_and_1) & fuv) + (grs)

grs_new = grs_new signed>> 1
# grs_new = (((-g0_and_1) & fuv) + (grs)) >> 1

delta += 2


mem64[pointer_delta] = delta
mem64[pointer_fuv] = fuv
mem64[pointer_grs] = grs_new




return
