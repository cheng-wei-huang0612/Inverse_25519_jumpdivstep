
code = ""


code += """
int64 pointer_delta
int64 pointer_f
int64 pointer_g
int64 pointer_uuvvrrss

input pointer_delta
input pointer_f
input pointer_g
input pointer_uuvvrrss

int64 delta
int64 fuv
int64 grs
int64 f
int64 g

int64 uu
int64 vv
int64 rr
int64 ss


int64 g0_and_1
int64 c_mask

int64 fuv_new
int64 grs_new
int64 grs_final
int64 neg_fuv
int64 neg_delta



enter j_loop

int64 m
m = mem64[pointer_delta]
f = mem64[pointer_f]
g = mem64[pointer_g]
uu, vv = mem128[pointer_uuvvrrss]
rr, ss = mem128[pointer_uuvvrrss + 16]

int64 2p41
2p41 = 1
2p41 = 2p41 << 41

int64 2p62
2p62 = 1
2p62 = 2p62 << 62

fuv = f & 1048575
grs = g & 1048575
fuv -= 2p41
grs -= 2p62

int64 oldG
int64 z
int64 minus_one
int64 delta_new

# minus_one = 1
# minus_one = -minus_one


int64 h
int64 hh
int64 m1

int64 g1

"""

for i in range(20):
    code += """

    g1 = grs & 1
    hh = grs - fuv
    h = grs + g1 * fuv
    m1 = m - 1 
 
 
    m1 & (grs >>> 1)
    # if m - 1 < 0 ang grs & 1 == 1 then N = 1
    # else N = 0
    m = m1 if N=0 else -m
    fuv = fuv if N=0 else grs
    grs = h if N=0 else hh
    grs = grs signed>> 1


    """



code += """
mem64[pointer_delta] = m

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


"""


code += """
int64 tmp
int64 prod_lo
int64 prod_hi
int64 new_f
int64 new_g
int64 new_uu
int64 new_vv
int64 new_rr
int64 new_ss
prod_lo = u * f
prod_hi = u signed* f (hi)

tmp = v * g
prod_lo += tmp !

tmp = v signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_f = prod_lo | prod_hi

mem64[pointer_f] = new_f



prod_lo = r * f
prod_hi = r signed* f (hi)

tmp = s * g
prod_lo += tmp !

tmp = s signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_g = prod_lo | prod_hi

mem64[pointer_g] = new_g

tmp = u * uu
new_uu = tmp + v * rr

tmp = r * uu
new_rr = tmp + s * rr

tmp = u * vv
new_vv = tmp + v * ss
mem128[pointer_uuvvrrss] = new_uu, new_vv

tmp = r * vv
new_ss = tmp + s * ss
mem128[pointer_uuvvrrss + 16] = new_rr, new_ss


return


"""

with open("j_loop.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < j_loop.q > j_loop.S")
