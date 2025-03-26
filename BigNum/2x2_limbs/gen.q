
int64 pointerR
int64 pointerF
int64 pointerG
int64 pointeru
int64 pointerv

input pointerR
input pointerF
input pointerG
input pointeru
input pointerv

int64 u0u1
int64 v0v1

reg128 vec_u0_u1_v0_v1

int64 uhat
int64 vhat

reg128 vec_uhat_vhat

int64 read_u_and_v_MASK2p30m1

int64 u0
int64 u1
int64 v0
int64 v1

int64 u0v0
int64 u1v1

reg128 vec_u0_v0_0_0
reg128 vec_u1_v1_0_0

enter muladd

u0u1 = mem64[pointeru]
v0v1 = mem64[pointerv]

vec_u0_u1_v0_v1[0/2] = u0u1 
vec_u0_u1_v0_v1[1/2] = v0v1

uhat = u0u1 signed>> 63
vhat = v0v1 signed>> 63

vec_uhat_vhat[0/2] = uhat
vec_uhat_vhat[1/2] = vhat

read_u_and_v_MASK2p30m1 = 1073741823

u0 = u0u1 & MASK2p30m1
u1 = u0u1 unsigned>>32

v0 = v0v1 & MASK2p30m1
v1 = v0v1 unsigned>>32

v0 = v0 << 32
u0v0 = u0 + v0

v1 = v1 << 32
u1v1 = u1 + v1

vec_u0_v0_0_0[0/2] = u0v0
vec_u1_v1_0_0[0/2] = u1v1

