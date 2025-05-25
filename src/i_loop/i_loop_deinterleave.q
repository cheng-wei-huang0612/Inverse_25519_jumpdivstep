

enter i_loop

caller calleesaved_x18
caller calleesaved_x19
caller calleesaved_x20
caller calleesaved_x21
caller calleesaved_x22
caller calleesaved_x23
caller calleesaved_x24
caller calleesaved_x25
caller calleesaved_x26
caller calleesaved_x27
caller calleesaved_x28
caller calleesaved_x29
caller calleesaved_v8
caller calleesaved_v9
caller calleesaved_v10
caller calleesaved_v11
caller calleesaved_v12
caller calleesaved_v13
caller calleesaved_v14
caller calleesaved_v15
push2xint64 calleesaved_x18, calleesaved_x19
push2xint64 calleesaved_x20, calleesaved_x21
push2xint64 calleesaved_x22, calleesaved_x23
push2xint64 calleesaved_x24, calleesaved_x25
push2xint64 calleesaved_x26, calleesaved_x27
push2xint64 calleesaved_x28, calleesaved_x29
push2x8b calleesaved_v8, calleesaved_v9
push2x8b calleesaved_v10, calleesaved_v11
push2x8b calleesaved_v12, calleesaved_v13
push2x8b calleesaved_v14, calleesaved_v15




int64 pointer_delta
int64 pointer_F
int64 pointer_G
int64 pointer_V
int64 pointer_S
int64 pointer_uuvvrrss

input pointer_delta
input pointer_F
input pointer_G
input pointer_V
input pointer_S
input pointer_uuvvrrss
int64 uu
int64 vv
int64 rr
int64 ss

int64 ff

int64 f_hi
int64 f
int64 g_hi
int64 g

int64 fuv
int64 grs

int64 g1
int64 hh
int64 h
int64 m1

int64 ITERATION
ITERATION = 9

reg128 vec_2x_2p30m1
reg128 vec_2x_2p32m1


2x vec_2x_2p32m1 = 0xFFFFFFFF
2x vec_2x_2p30m1 = vec_2x_2p32m1 unsigned>> 2

reg128 vec_2x_2p15m1
2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15

reg128 vec_4x_2p30m1
4x vec_4x_2p30m1 = vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4] vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4]


# M = 678152731
int64 M
M = 0
M[0/4] = 51739
M[1/4] = 10347
reg128 vec_M
4x vec_M = M
# vec_M = [M, M, M, M]

int64 _19
_19 = 19
reg128 vec_4x_19
4x vec_4x_19 = _19

int64 2p41
2p41 = 1
2p41 = 2p41 << 41

int64 2p62
2p62 = 1
2p62 = 2p62 << 62



# F, G Data Layout Configuration

int64 F0F1
int64 F2F3
int64 F4F5
int64 F6F7
int64 F8F9

F0F1, F2F3 = mem128[pointer_F]
F4F5, F6F7 = mem128[pointer_F+16]
F8F9 = mem32[pointer_F+32]

int64 G0G1
int64 G2G3
int64 G4G5
int64 G6G7
int64 G8G9

G0G1, G2G3 = mem128[pointer_G]
G4G5, G6G7 = mem128[pointer_G+16]
G8G9 = mem32[pointer_G+32]

reg128 vec_F0_F1_G0_G1 

vec_F0_F1_G0_G1[0/2] = F0F1 
vec_F0_F1_G0_G1[1/2] = G0G1 

reg128 vec_F2_F3_G2_G3 

vec_F2_F3_G2_G3[0/2] = F2F3 
vec_F2_F3_G2_G3[1/2] = G2G3 

reg128 vec_F4_F5_G4_G5 

vec_F4_F5_G4_G5[0/2] = F4F5 
vec_F4_F5_G4_G5[1/2] = G4G5 

reg128 vec_F6_F7_G6_G7 

vec_F6_F7_G6_G7[0/2] = F6F7 
vec_F6_F7_G6_G7[1/2] = G6G7 

reg128 vec_F8_F9_G8_G9 

vec_F8_F9_G8_G9[0/2] = F8F9 
vec_F8_F9_G8_G9[1/2] = G8G9 


# register initialization and specification

reg128 vec_V0_V1_S0_S1
reg128 vec_V2_V3_S2_S3
reg128 vec_V4_V5_S4_S5
reg128 vec_V6_V7_S6_S7
reg128 vec_V8_V9_S8_S9
# The V9, S9 are always 0, we put them here for easy program writing




# V, S Data Layout Configuration

int64 V0V1
int64 V2V3
int64 V4V5
int64 V6V7
int64 V8V9

V0V1, V2V3 = mem128[pointer_V]
V4V5, V6V7 = mem128[pointer_V+16]
V8V9 = mem32[pointer_V+32]

int64 S0S1
int64 S2S3
int64 S4S5
int64 S6S7
int64 S8S9

S0S1, S2S3 = mem128[pointer_S]
S4S5, S6S7 = mem128[pointer_S+16]
S8S9 = mem32[pointer_S+32]


vec_V0_V1_S0_S1[0/2] = V0V1 
vec_V0_V1_S0_S1[1/2] = S0S1 


vec_V2_V3_S2_S3[0/2] = V2V3 
vec_V2_V3_S2_S3[1/2] = S2S3 


vec_V4_V5_S4_S5[0/2] = V4V5 
vec_V4_V5_S4_S5[1/2] = S4S5 


vec_V6_V7_S6_S7[0/2] = V6V7 
vec_V6_V7_S6_S7[1/2] = S6S7 


vec_V8_V9_S8_S9[0/2] = V8V9 
vec_V8_V9_S8_S9[1/2] = S8S9 




uu, vv = mem128[pointer_uuvvrrss + 0]
rr, ss = mem128[pointer_uuvvrrss + 16]

int64 m
m = mem64[pointer_delta]

main_i_loop:
int64 uu0
int64 uu1
uu0 = uu & ((1 << 30)-1)
uu1 = (uu >> 30) & ((1 << 32)-1)

int64 vv0
int64 vv1
vv0 = vv & ((1 << 30)-1)
vv1 = (vv >> 30) & ((1 << 32)-1)

int64 rr0
int64 rr1
rr0 = rr & ((1 << 30)-1)
rr1 = (rr >> 30) & ((1 << 32)-1)

int64 ss0
int64 ss1
ss0 = ss & ((1 << 30)-1)
ss1 = (ss >> 30) & ((1 << 32)-1)

reg128 vec_uu0_rr0_vv0_ss0

vec_uu0_rr0_vv0_ss0[0/4] = uu0
vec_uu0_rr0_vv0_ss0[1/4] = rr0
vec_uu0_rr0_vv0_ss0[2/4] = vv0
vec_uu0_rr0_vv0_ss0[3/4] = ss0

reg128 vec_uu1_rr1_vv1_ss1

vec_uu1_rr1_vv1_ss1[0/4] = uu1
vec_uu1_rr1_vv1_ss1[1/4] = rr1
vec_uu1_rr1_vv1_ss1[2/4] = vv1
vec_uu1_rr1_vv1_ss1[3/4] = ss1


reg128 vec_buffer
reg128 vec_prod

2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[2/4]


2x vec_prod >>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[2/4]
2x vec_prod >>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[3/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
vec_F0_F1_G0_G1 = vec_buffer


2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[2/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F0_F1_G0_G1 |= vec_buffer






            f_hi = vec_F0_F1_G0_G1[1/4]
            f = vec_F0_F1_G0_G1[0/4]
            g_hi = vec_F0_F1_G0_G1[3/4]
            g = vec_F0_F1_G0_G1[2/4]
            f = f + f_hi << 30
            g = g + g_hi << 30

            fuv = f & 1048575
            grs = g & 1048575
            fuv -= 2p41
            grs -= 2p62



            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    

            m1 = m - 1 
            grs & 1
            ff = fuv if Z=0 else 0
            m1 & (grs >>> 1)
            m = m1 if N=0 else -m
            fuv = grs if N=1 else fuv
            ff = ff if N=0 else -ff
            grs = grs + ff
            grs = grs signed>> 1

            free m1
            free ff


    


# Extraction


vv = fuv
vv = vv + 1048576
vv = vv + 2p41
vv = vv signed>> 42

uu = fuv + 1048576
uu = uu << 22
uu = uu signed>> 43


ss = grs
ss = ss + 1048576
ss = ss + 2p41
ss = ss signed>> 42

rr = grs + 1048576
rr = rr << 22
rr = rr signed>> 43



int64 tmp
int64 prod_lo
int64 prod_hi
int64 new_f
int64 new_g
int64 new_uu
int64 new_vv
int64 new_rr
int64 new_ss

prod_lo = uu * f
prod_hi = uu signed* f (hi)

tmp = vv * g
prod_lo += tmp !

tmp = vv signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_f = prod_lo | prod_hi




prod_lo = rr * f
prod_hi = rr signed* f (hi)

tmp = ss * g
prod_lo += tmp !

tmp = ss signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
g = prod_lo | prod_hi
f = new_f




# The second j_loop

fuv = f & 1048575
grs = g & 1048575
fuv -= 2p41
grs -= 2p62




    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    


# Extraction
int64 u
int64 v
int64 r
int64 s

v = fuv
v = v + 1048576
v = v + 2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + 2p41
s = s signed>> 42

r = grs + 1048576
r = r << 22
r = r signed>> 43



# int64 tmp
# int64 prod_lo
# int64 prod_hi
# int64 new_f
# int64 new_g
# int64 new_uu
# int64 new_vv
# int64 new_rr
# int64 new_ss
prod_lo = u * f
prod_hi = u signed* f (hi)

tmp = v * g
prod_lo += tmp !

tmp = v signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
#new_f = prod_lo | prod_hi
new_f = prod_lo 




prod_lo = r * f
prod_hi = r signed* f (hi)

tmp = s * g
prod_lo += tmp !

tmp = s signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
#new_g = prod_lo | prod_hi
new_g = prod_lo 



f = new_f
g = new_g





tmp = u * uu
new_uu = tmp + v * rr

tmp = r * uu
new_rr = tmp + s * rr

tmp = u * vv
new_vv = tmp + v * ss

tmp = r * vv
new_ss = tmp + s * ss




uu = new_uu
vv = new_vv
rr = new_rr
ss = new_ss



# The second j_loop

fuv = f & 1048575
grs = g & 1048575
fuv -= 2p41
grs -= 2p62




    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff


    
mem64[pointer_delta] = m

# Extraction

v = fuv
v = v + 1048576
v = v + 2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + 2p41
s = s signed>> 42

r = grs + 1048576
r = r << 22
r = r signed>> 43









tmp = u * uu
new_uu = tmp + v * rr

tmp = r * uu
new_rr = tmp + s * rr

tmp = u * vv
new_vv = tmp + v * ss

tmp = r * vv
new_ss = tmp + s * ss



uu = new_uu
vv = new_vv
rr = new_rr
ss = new_ss


2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
vec_F2_F3_G2_G3 = vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F2_F3_G2_G3 |= vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
vec_F4_F5_G4_G5 = vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F4_F5_G4_G5 |= vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
vec_F6_F7_G6_G7 = vec_buffer



2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F6_F7_G6_G7 |= vec_buffer

vec_F8_F9_G8_G9 = vec_prod



#reg128 vec_buffer
#reg128 vec_prod
reg128 final_add_0
reg128 final_add_1

2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]

reg128 vec_l0
4x vec_l0 = vec_prod * vec_M
vec_l0 &= vec_2x_2p30m1
4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4]

2x vec_prod -= vec_l0[0] * vec_4x_19[0]
2x final_add_0 = vec_l0[0] << 15

2x vec_prod >>= 30


2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[2/4]

reg128 vec_l1
4x vec_l1 = vec_prod * vec_M
vec_l1 &= vec_2x_2p30m1
4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4]

2x vec_prod -= vec_l1[0] * vec_4x_19[0]
2x final_add_1 = vec_l1[0] << 15

2x vec_prod >>= 30



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[3/4]

vec_V0_V1_S0_S1 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30




2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[2/4]

vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_V0_V1_S0_S1 |= vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[3/4]

vec_V2_V3_S2_S3 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[2/4]

vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_V2_V3_S2_S3 |= vec_buffer




2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[3/4]

vec_V4_V5_S4_S5 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30




2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[2/4]


vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_V4_V5_S4_S5 |= vec_buffer




2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V8_V9_S8_S9[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V8_V9_S8_S9[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[3/4]

2x vec_prod += final_add_0
vec_V6_V7_S6_S7 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30


2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V8_V9_S8_S9[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V8_V9_S8_S9[2/4]

2x vec_prod += final_add_1
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_buffer <<= 32
vec_V6_V7_S6_S7 |= vec_buffer

2x vec_prod >>= 30



reg128 vec_carry
2x vec_carry = vec_prod >> 15

#4x vec_carry = vec_carry[0/4] vec_carry[2/4] vec_carry[0/4] vec_carry[2/4]
#vec_V8_V9_S8_S9 = vec_prod 
vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
4x vec_buffer = vec_4x_19 * vec_carry
vec_buffer &= vec_2x_2p32m1

4x vec_V0_V1_S0_S1 += vec_buffer




4x vec_carry = vec_V0_V1_S0_S1 >> 30
2x vec_carry = vec_carry << 32
4x vec_V0_V1_S0_S1 += vec_carry
4x vec_carry = vec_V0_V1_S0_S1 >> 30
2x vec_carry = vec_carry unsigned>> 32
vec_V0_V1_S0_S1 &= vec_4x_2p30m1

4x vec_V2_V3_S2_S3 += vec_carry


ITERATION -= 1 !
goto main_i_loop if unsigned>



# Now we store the results back to memory

reg128 vec_F0_F1_F2_F3
reg128 vec_G0_G1_G2_G3

2x vec_F0_F1_F2_F3 zip= vec_F0_F1_G0_G1[0/2] vec_F2_F3_G2_G3[0/2]
2x vec_G0_G1_G2_G3 zip= vec_F0_F1_G0_G1[1/2] vec_F2_F3_G2_G3[1/2]

reg128 vec_F4_F5_F6_F7
reg128 vec_G4_G5_G6_G7
2x vec_F4_F5_F6_F7 zip= vec_F4_F5_G4_G5[0/2] vec_F6_F7_G6_G7[0/2]
2x vec_G4_G5_G6_G7 zip= vec_F4_F5_G4_G5[1/2] vec_F6_F7_G6_G7[1/2]

mem256[pointer_F] = vec_F0_F1_F2_F3, vec_F4_F5_F6_F7
mem256[pointer_G] = vec_G0_G1_G2_G3, vec_G4_G5_G6_G7


int64 F8
F8 = vec_F8_F9_G8_G9[0/2]
mem32[pointer_F+32] = F8
int64 G8
G8 = vec_F8_F9_G8_G9[1/2]
mem32[pointer_G+32] = G8


# Store the result



reg128 vec_V0_V1_V2_V3
reg128 vec_V4_V5_V6_V7
reg128 vec_S0_S1_S2_S3
reg128 vec_S4_S5_S6_S7





2x vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2]
2x vec_S0_S1_S2_S3 zip= vec_V0_V1_S0_S1[1/2] vec_V2_V3_S2_S3[1/2]

2x vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]
2x vec_S4_S5_S6_S7 zip= vec_V4_V5_S4_S5[1/2] vec_V6_V7_S6_S7[1/2]



mem256[pointer_V] = vec_V0_V1_V2_V3, vec_V4_V5_V6_V7
mem256[pointer_S] = vec_S0_S1_S2_S3, vec_S4_S5_S6_S7



int64 V8
V8 = vec_V8_V9_S8_S9[0/2]
mem32[pointer_V+32] = V8
int64 S8
S8 = vec_V8_V9_S8_S9[1/2]
mem32[pointer_S+32] = S8


mem128[pointer_uuvvrrss] = uu, vv
mem128[pointer_uuvvrrss + 16] = rr, ss

pop2x8b calleesaved_v14, calleesaved_v15
pop2x8b calleesaved_v12, calleesaved_v13
pop2x8b calleesaved_v10, calleesaved_v11
pop2x8b calleesaved_v8, calleesaved_v9
pop2xint64 calleesaved_x28, calleesaved_x29
pop2xint64 calleesaved_x26, calleesaved_x27
pop2xint64 calleesaved_x24, calleesaved_x25
pop2xint64 calleesaved_x22, calleesaved_x23
pop2xint64 calleesaved_x20, calleesaved_x21
pop2xint64 calleesaved_x18, calleesaved_x19

return

