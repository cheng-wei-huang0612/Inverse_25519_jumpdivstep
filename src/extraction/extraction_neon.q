int64 pointer_uvrs
int64 pointer_fuv
int64 pointer_grs


input pointer_uvrs
input pointer_fuv
input pointer_grs

int64 u
int64 v
int64 r
int64 s
int64 fuv
int64 grs

int64 2p41
int64 2p20
int64 2p20a2p41


enter extraction

fuv = mem64[pointer_fuv]
grs = mem64[pointer_grs]

reg128 vec_fuv_grs

reg128 vec_2p20a2p41
reg128 vec_2p20

vec_fuv_grs[0/2] = fuv
vec_fuv_grs[1/2] = grs

2p41 = 1
2p41 = 2p41 << 41
2p20a2p41 = 2p41 + 1048576
2x vec_2p20a2p41 = 2p20a2p41
2p20 = 1048576
2x vec_2p20 = 2p20

reg128 vec_v_s
reg128 vec_u_r
2x vec_v_s = vec_fuv_grs + vec_2p20a2p41
2x vec_v_s = vec_v_s >> 42

v = vec_v_s[0/4]
s = vec_v_s[2/4]

2x vec_v_s = vec_fuv_grs + vec_2p20a2p41


2x vec_u_r = vec_fuv_grs + vec_2p20
2x vec_u_r << 22
2x vec_u_r = vec_u_r >> 43

u = vec_u_r[0/4]
r = vec_u_r[2/4]

mem64[pointer_uvrs] = u
mem64[pointer_uvrs + 8] = v
mem64[pointer_uvrs + 16] = r
mem64[pointer_uvrs + 24] = s


return
