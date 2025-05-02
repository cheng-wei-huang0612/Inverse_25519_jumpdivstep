
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

int64 oldG
int64 h
int64 hh
int64 m
int64 m1
int64 z
int64 minus_one
int64 delta_new
int64 ff

enter divstep

int64 g1

m = mem64[pointer_delta]
fuv = mem64[pointer_fuv]
grs = mem64[pointer_grs]



    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1


mem64[pointer_delta] = m
mem64[pointer_fuv] = fuv
mem64[pointer_grs] = grs




return
