
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

int64 u0
int64 u1
int64 v0
int64 v1

int64 u0v0
int64 u1v1

reg128 vec_u0_v0_0_0
reg128 vec_u1_v1_0_0

int64 F0F1
int64 G0G1

reg128 vec_F0_F1_G0_G1

int64 Fhat
int64 Ghat

reg128 vec_Fhat_Ghat

int64 F0
int64 F1
int64 G0
int64 G1

int64 F0G0
int64 F1G1

reg128 vec_F0_G0_0_0
reg128 vec_F1_G1_0_0


enter muladd

u0u1 = mem64[pointeru]
v0v1 = mem64[pointerv]

vec_u0_u1_v0_v1[0/2] = u0u1 
vec_u0_u1_v0_v1[1/2] = v0v1

uhat = u0u1 signed>> 63
vhat = v0v1 signed>> 63

vec_uhat_vhat[0/2] = uhat
vec_uhat_vhat[1/2] = vhat

u0 = u0u1 & 1073741823
u1 = u0u1 unsigned>>32

v0 = v0v1 & 1073741823
v1 = v0v1 unsigned>>32

v0 = v0 << 32
u0v0 = u0 + v0

v1 = v1 << 32
u1v1 = u1 + v1

vec_u0_v0_0_0[0/2] = u0v0
vec_u1_v1_0_0[0/2] = u1v1


F0F1 = mem64[pointerF]
G0G1 = mem64[pointerG]

vec_F0_F1_G0_G1[0/2] = F0F1
vec_F0_F1_G0_G1[1/2] = G0G1

Fhat = F0F1 signed>> 63
Ghat = G0G1 signed>> 63

vec_Fhat_Ghat[0/2] = Fhat
vec_Fhat_Ghat[1/2] = Ghat


F0 = F0F1 & 1073741823
F1 = F0F1 unsigned>>32

G0 = G0G1 & 1073741823
G1 = G0G1 unsigned>>32

G0 = G0 << 32
F0G0 = F0 + G0

G1 = G1 << 32
F1G1 = F1 + G1

vec_F0_G0_0_0[0/2] = F0G0
vec_F1_G1_0_0[0/2] = F1G1

