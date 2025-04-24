int64 pointer_f
int64 pointer_g
int64 pointer_uuvvrrss
int64 pointer_uvrs

input pointer_f
input pointer_g
input pointer_uuvvrrss
input pointer_uvrs


int64 f
int64 g
int64 uu
int64 vv
int64 rr
int64 ss
int64 u
int64 v
int64 r
int64 s

int64 prod_lo
int64 prod_hi
int64 tmp

int64 new_f
int64 new_g

int64 new_uu
int64 new_vv
int64 new_rr
int64 new_ss

caller calleesaved_x18
caller calleesaved_x19
stack64 stack_x18
stack64 stack_x19
caller calleesaved_x20
caller calleesaved_x21
stack64 stack_x20
stack64 stack_x21
caller calleesaved_x22
caller calleesaved_x23
stack64 stack_x22
stack64 stack_x23
caller calleesaved_x24
caller calleesaved_x25
stack64 stack_x24
stack64 stack_x25
caller calleesaved_x26
caller calleesaved_x27
stack64 stack_x26
stack64 stack_x27
caller calleesaved_x28
caller calleesaved_x29
stack64 stack_x28
stack64 stack_x29


enter inner_update



f = mem64[pointer_f]
g = mem64[pointer_g]
u  = mem64[pointer_uvrs]
v  = mem64[pointer_uvrs + 8]
r  = mem64[pointer_uvrs + 16]
s  = mem64[pointer_uvrs + 24]

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
#new_g = prod_hi , prod_lo >> 20

mem64[pointer_g] = new_g

uu = mem64[pointer_uuvvrrss]
vv = mem64[pointer_uuvvrrss + 8]
rr = mem64[pointer_uuvvrrss + 16]
ss = mem64[pointer_uuvvrrss + 24]

tmp = u * uu
new_uu = tmp + v * rr
mem64[pointer_uuvvrrss] = new_uu

tmp = r * uu
new_rr = tmp + s * rr
mem64[pointer_uuvvrrss + 16] = new_rr

tmp = u * vv
new_vv = tmp + v * ss
mem64[pointer_uuvvrrss + 8] = new_vv

tmp = r * vv
new_ss = tmp + s * ss
mem64[pointer_uuvvrrss + 24] = new_ss





return
