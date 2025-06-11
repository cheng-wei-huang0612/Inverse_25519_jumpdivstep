

enter cpt_inv
input input_x0
input input_x1
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
int64 limb64_0

limb64_0 = mem64[input_x0 + 0]
int64 limb64_1

limb64_1 = mem64[input_x0 + 8]
int64 limb64_2

limb64_2 = mem64[input_x0 + 16]
int64 limb64_3

limb64_3 = mem64[input_x0 + 24]
int64 G0
int64 G1
int64 G2
int64 G3
int64 G4
int64 G5
int64 G6
int64 G7

int64 tmp60
int64 G8G9
tmp60 = limb64_0


G0 = tmp60 & 0x3FFFFFFF
tmp60 = tmp60 unsigned>> 30
G1 = tmp60 & 0x3FFFFFFF

tmp60 = limb64_1, limb64_0 >> 60

G2 = tmp60 & 0x3FFFFFFF
tmp60 = tmp60 unsigned>> 30
G3 = tmp60 & 0x3FFFFFFF



tmp60 = limb64_2, limb64_1 >> 56

G4 = tmp60 & 0x3FFFFFFF
tmp60 = tmp60 unsigned>> 30
G5 = tmp60 & 0x3FFFFFFF




tmp60 = limb64_3, limb64_2 >> 52

G6 = tmp60 & 0x3FFFFFFF
tmp60 = tmp60 unsigned>> 30
G7 = tmp60 & 0x3FFFFFFF


G8G9 = limb64_3 unsigned>> 48


int64 zero
zero = 0

int64 G0G1
int64 G2G3
int64 G4G5
int64 G6G7



G0G1 = G0 + G1 << 32
G2G3 = G2 + G3 << 32
G4G5 = G4 + G5 << 32
G6G7 = G6 + G7 << 32



reg128 vec_G0_G1_G2_G3
reg128 vec_F0_F1_F2_F3
reg128 vec_G4_G5_G6_G7
reg128 vec_F4_F5_F6_F7
reg128 vec_G8_G9_G10_G11
reg128 vec_F8_F9_F10_F11

vec_G0_G1_G2_G3[0/2] = G0G1
vec_G0_G1_G2_G3[1/2] = G2G3
vec_G4_G5_G6_G7[0/2] = G4G5
vec_G4_G5_G6_G7[1/2] = G6G7
vec_G8_G9_G10_G11[0/2] = G8G9

reg128 vec_2x_2p15m1
reg128 vec_2x_2p30m1
reg128 vec_2x_2p32m1
reg128 vec_4x_2p30m1
reg128 vec_M
reg128 vec_1x_18
reg128 vec_2x_19
reg128 vec_4x_19
int64 _18
_18 = 18
4x vec_4x_19 = 19
2x vec_2x_19 = vec_4x_19 >> 32

4x vec_1x_18 = 0
vec_1x_18[0/4] = _18

2x vec_2x_2p32m1 = 0xFFFFFFFF
2x vec_2x_2p30m1 = vec_2x_2p32m1 unsigned>> 2
2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
4x vec_4x_2p30m1 = vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4] vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4]

int64 _2p41
_2p41 = 1
_2p41 = _2p41 << 41

int64 2p62
2p62 = 1
2p62 = 2p62 << 62

int64 M
M[0/4] =(0) 51739
M[1/4] = 10347
4x vec_M = M
# vec_M = [M, M, M, M]



vec_F0_F1_F2_F3 = vec_4x_2p30m1
2x vec_F0_F1_F2_F3 = vec_F0_F1_F2_F3 - vec_1x_18

vec_F4_F5_F6_F7 = vec_4x_2p30m1
vec_F8_F9_F10_F11 = vec_2x_2p15m1



reg128 vec_F0_F1_G0_G1
reg128 vec_F2_F3_G2_G3
reg128 vec_F4_F5_G4_G5
reg128 vec_F6_F7_G6_G7
reg128 vec_F8_F9_G8_G9


2x vec_F0_F1_G0_G1 zip= vec_F0_F1_F2_F3[0/2] vec_G0_G1_G2_G3[0/2]
2x vec_F2_F3_G2_G3 zip= vec_F0_F1_F2_F3[1/2] vec_G0_G1_G2_G3[1/2]

2x vec_F4_F5_G4_G5 zip= vec_F4_F5_F6_F7[0/2] vec_G4_G5_G6_G7[0/2]
2x vec_F6_F7_G6_G7 zip= vec_F4_F5_F6_F7[1/2] vec_G4_G5_G6_G7[1/2]

2x vec_F8_F9_G8_G9 zip= vec_F8_F9_F10_F11[0/2] vec_G8_G9_G10_G11[0/2]






int64 ff
int64 g1
int64 hh
int64 h
int64 m1
int64 f_hi
int64 f
int64 g_hi
int64 g

int64 fuv
int64 grs
int64 m
m = 0

            f_hi = vec_F0_F1_G0_G1[1/4]
            f = vec_F0_F1_G0_G1[0/4]
            g_hi = vec_F0_F1_G0_G1[3/4]
            g = vec_F0_F1_G0_G1[2/4]
            f = f + f_hi << 30
            g = g + g_hi << 30

            fuv = f & 1048575
            grs = g & 1048575
            fuv = fuv - _2p41
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
int64 uu
int64 vv
int64 rr
int64 ss


vv = fuv
vv = vv + 1048576
vv = vv + _2p41
vv = vv signed>> 42

uu = fuv + 1048576
uu = uu << 22
uu = uu signed>> 43


ss = grs
ss = ss + 1048576
ss = ss + _2p41
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
fuv -= _2p41
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
v = v + _2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + _2p41
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
#prod_hi = u signed* f (hi)

tmp = v * g
prod_lo += tmp !

#tmp = v signed* g (hi)
#prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo signed>> 20
#prod_hi = prod_hi << 44
#new_f = prod_lo | prod_hi
new_f = prod_lo 




prod_lo = r * f
#prod_hi = r signed* f (hi)

tmp = s * g
prod_lo += tmp !

#tmp = s signed* g (hi)
#prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo signed>> 20
#prod_hi = prod_hi << 44
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
fuv -= _2p41
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

v = fuv
v = v + 1048576
v = v + _2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + _2p41
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




int64 ITERATION
ITERATION = 9






# F, G Data Layout Configuration


# register initialization and specification

reg128 vec_V0_V1_S0_S1
reg128 vec_V2_V3_S2_S3
reg128 vec_V4_V5_S4_S5
reg128 vec_V6_V7_S6_S7
reg128 vec_V8_V9_S8_S9
# The V9, S9 are always 0, we put them here for easy program writing




# V, S Data Layout Configuration

int64 one
one = 1
vec_V0_V1_S0_S1[0/2] = zero
vec_V0_V1_S0_S1[1/2] = one





vec_V2_V3_S2_S3[0/2] = zero
vec_V2_V3_S2_S3[1/2] = zero


vec_V4_V5_S4_S5[0/2] = zero
vec_V4_V5_S4_S5[1/2] = zero


vec_V6_V7_S6_S7[0/2] = zero
vec_V6_V7_S6_S7[1/2] = zero


vec_V8_V9_S8_S9[0/2] = zero
vec_V8_V9_S8_S9[1/2] = zero


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



            f_hi = vec_F0_F1_G0_G1[1/4]
            f = vec_F0_F1_G0_G1[0/4]
            g_hi = vec_F0_F1_G0_G1[3/4]
            g = vec_F0_F1_G0_G1[2/4]
            f = f + f_hi << 30
            g = g + g_hi << 30

            fuv = f & 1048575
            grs = g & 1048575
            fuv -= _2p41
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
vv = vv + _2p41
vv = vv signed>> 42

uu = fuv + 1048576
uu = uu << 22
uu = uu signed>> 43


ss = grs
ss = ss + 1048576
ss = ss + _2p41
ss = ss signed>> 42

rr = grs + 1048576
rr = rr << 22
rr = rr signed>> 43



# int64 tmp
# int64 prod_lo
# int64 prod_hi
# int64 new_f
# int64 new_g
# int64 new_uu
# int64 new_vv
# int64 new_rr
# int64 new_ss

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
fuv -= _2p41
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
# int64 u
# int64 v
# int64 r
# int64 s

v = fuv
v = v + 1048576
v = v + _2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + _2p41
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
#prod_hi = u signed* f (hi)

tmp = v * g
prod_lo += tmp !

#tmp = v signed* g (hi)
#prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo signed>> 20
#prod_hi = prod_hi << 44
#new_f = prod_lo | prod_hi
new_f = prod_lo 




prod_lo = r * f
#prod_hi = r signed* f (hi)

tmp = s * g
prod_lo += tmp !

#tmp = s signed* g (hi)
#prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo signed>> 20
#prod_hi = prod_hi << 44
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
fuv -= _2p41
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

v = fuv
v = v + 1048576
v = v + _2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + _2p41
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




ITERATION -= 1 !
goto main_i_loop if unsigned>

uu0 = uu & ((1 << 30)-1)
uu1 = (uu >> 30) & ((1 << 32)-1)

vv0 = vv & ((1 << 30)-1)
vv1 = (vv >> 30) & ((1 << 32)-1)

rr0 = rr & ((1 << 30)-1)
rr1 = (rr >> 30) & ((1 << 32)-1)

ss0 = ss & ((1 << 30)-1)
ss1 = (ss >> 30) & ((1 << 32)-1)


vec_uu0_rr0_vv0_ss0[0/4] = uu0
vec_uu0_rr0_vv0_ss0[1/4] = rr0
vec_uu0_rr0_vv0_ss0[2/4] = vv0
vec_uu0_rr0_vv0_ss0[3/4] = ss0


vec_uu1_rr1_vv1_ss1[0/4] = uu1
vec_uu1_rr1_vv1_ss1[1/4] = rr1
vec_uu1_rr1_vv1_ss1[2/4] = vv1
vec_uu1_rr1_vv1_ss1[3/4] = ss1


# reg128 vec_buffer
# reg128 vec_prod

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
#2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F0_F1_G0_G1 |= vec_buffer



# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# vec_F2_F3_G2_G3 = vec_buffer



# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# 2x vec_buffer <<= 32
# vec_F2_F3_G2_G3 |= vec_buffer



# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# vec_F4_F5_G4_G5 = vec_buffer



# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# 2x vec_buffer <<= 32
# vec_F4_F5_G4_G5 |= vec_buffer



# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# vec_F6_F7_G6_G7 = vec_buffer



# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# 2x vec_buffer <<= 32
# vec_F6_F7_G6_G7 |= vec_buffer

# vec_F8_F9_G8_G9 = vec_prod





#reg128 vec_buffer
#reg128 vec_prod
# reg128 final_add_0
# reg128 final_add_1

2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]

#reg128 vec_l0


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

#reg128 vec_l1
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



#reg128 vec_carry
2x vec_carry = vec_prod >> 15

4x vec_carry = vec_carry[0/4] vec_carry[2/4] vec_carry[0/4] vec_carry[2/4]
#vec_V8_V9_S8_S9 = vec_prod 
2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1


# int64 debug
# debug = 0
# debug = vec_V8_V9_S8_S9[0/4]

# mem128[input_x1] = debug, zero
# mem128[input_x1 + 16] = zero, zero



2x vec_buffer = vec_4x_19[0] * vec_carry[0]
#vec_buffer &= vec_2x_2p32m1

reg128 vec_buffer_lo
vec_buffer_lo = vec_buffer & vec_2x_2p30m1

4x vec_V0_V1_S0_S1 += vec_buffer_lo

2x vec_buffer = vec_buffer >> 30
2x vec_buffer <<= 32
2x vec_V0_V1_S0_S1 += vec_buffer







4x vec_carry = vec_V0_V1_S0_S1 >> 30
2x vec_carry = vec_carry << 32
4x vec_V0_V1_S0_S1 += vec_carry
4x vec_carry = vec_V0_V1_S0_S1 >> 30
2x vec_carry = vec_carry unsigned>> 32
vec_V0_V1_S0_S1 &= vec_4x_2p30m1

4x vec_V2_V3_S2_S3 += vec_carry








int64 V8
int64 V0V1
int64 V2V3
int64 V4V5
int64 V6V7

V0V1 = vec_V0_V1_S0_S1[0/2]
V2V3 = vec_V2_V3_S2_S3[0/2]
V4V5 = vec_V4_V5_S4_S5[0/2]
V6V7 = vec_V6_V7_S6_S7[0/2]
V8 = vec_V8_V9_S8_S9[0/4]

int64 V0
int64 V1
V0 = V0V1 & 0x3FFFFFFF
V1 = V0V1 unsigned>> 32

int64 V2
int64 V3
V2 = V2V3 & 0x3FFFFFFF
V3 = V2V3 unsigned>> 32

int64 V4
int64 V5
V4 = V4V5 & 0x3FFFFFFF
V5 = V4V5 unsigned>> 32

int64 V6
int64 V7
V6 = V6V7 & 0x3FFFFFFF
V7 = V6V7 unsigned>> 32

int64 inv0
int64 inv1
int64 inv2
int64 inv3
#int64 tmp

V1 = V1 << 30
inv0 = V0 | V1
tmp = V2 << 60
inv0 |= tmp

V2 = V2 unsigned>> 4
V3 = V3 << 26
inv1 = V2 | V3 
tmp = V4 << 56
inv1 |= tmp

V4 = V4 unsigned>> 8
V5 = V5 << 22
inv2 = V4 | V5
tmp = V6 << 52
inv2 |= tmp

V6 = V6 unsigned>> 12
V7 = V7 << 18
inv3 = V6 | V7
tmp = V8 << 48
inv3 |= tmp





# sign_adjustment
int64 signF
signF = vec_F0_F1_G0_G1[0/2]
signF = signF << 2
signF = signF signed>> 3
signF - 0!

int64 2p64m1
int64 2p63m1
#int64 _18
2p64m1 set to ONES
2p63m1 = 2p64m1 unsigned>> 1
_18 = 18




inv0 = inv0 if N=0 else ~inv0
inv1 = inv1 if N=0 else ~inv1
inv2 = inv2 if N=0 else ~inv2

tmp = 2p63m1 - inv3
inv3 = inv3 if N=0 else tmp
tmp = _18 & signF
inv0 = inv0 - tmp

#zero = 0


mem128[input_x1] = inv0, inv1
mem128[input_x1+16] = inv2, inv3

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

