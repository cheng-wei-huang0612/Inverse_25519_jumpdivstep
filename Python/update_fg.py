# We implement update_FG
# This cooperates with main3_59.py

from bignum import *

# Test data
uu = int64_t(-27021597764222976)
vv = int64_t(9007199254740992)
rr = int64_t(-7)
ss = int64_t(-19)

F = big30_9(57896044618658097711785492504343953926634992332820282019728792003956564819949)
G = big30_9(7)

print("Operands")
print(uu)
print(vv)
print(rr)
print(ss)
print(F)
print(G)
F_new = (int(uu) * int(F) + int(vv) * int(G)) >> 59
G_new = (int(rr) * int(F) + int(ss) * int(G)) >> 59

F_correct = big30_9(F_new)
G_correct = big30_9(G_new)
print("Results")
print(F_correct)
print(G_correct)


    
sign_u = uu & (1<<63) # if uu is negtive then sign_u = 1..1 

sign_F = 1 
print("here",F.to_int(offset=False))



sign_v = vv & (1<<63)
