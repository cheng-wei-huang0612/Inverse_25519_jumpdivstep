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


enter extraction

fuv = mem64[pointer_fuv]
2p41 = 1
2p41 = 2p41 << 41

v = fuv
v = v + 1048576
v = v + 2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43

mem64[pointer_uvrs] = u
mem64[pointer_uvrs + 8] = v

grs = mem64[pointer_grs]

s = grs
s = s + 1048576
s = s + 2p41
s = s signed>> 42

r = grs + 1048576
r = r << 22
r = r signed>> 43

mem64[pointer_uvrs + 16] = r
mem64[pointer_uvrs + 24] = s


return
