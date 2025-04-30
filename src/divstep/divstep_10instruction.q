
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

enter divstep

m = mem64[pointer_delta]
fuv = mem64[pointer_fuv]
grs = mem64[pointer_grs]



    h = fuv + grs
    hh = grs - fuv
    m1 = m - 1 
    grs & 1
    # if Z = 1 then grs & 1 == 0
    # if Z = 0 then grs & 1 == 1
 
    grs_new = h if Z=0 else grs
 
 
    m1 & (grs >>> 1)
    # if m - 1 < 0 ang grs & 1 == 1 then N = 1
    # else N = 0

    

    m = m1 if N=0 else -m

    
    

    grs_new = grs_new if N=0 else hh
    #grs = hh if N=0 else grs
    fuv = fuv if N=0 else grs
    grs = grs_new signed>> 1


mem64[pointer_delta] = m
mem64[pointer_fuv] = fuv
mem64[pointer_grs] = grs




return
