int64 pointer_u
int64 pointer_v
int64 pointer_fuv


input pointer_u
input pointer_v
input pointer_fuv

int64 u
int64 v
int64 fuv

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

mem64[pointer_u] = u
mem64[pointer_v] = v


return
