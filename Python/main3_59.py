from bignum import *

P = 2**255 - 19
inv600 = big30_9(30944292108470708005745096299893818799743179878335277999558634282422183477374)
inv590 = big30_9(17818712668025549536314211215127653067675389362630406756392279036074924318873)
assert(int(inv590) * (2**590) % P  == 1)

def extraction(fuvgrs):
    """
    outputs; u, v or r, s
    """
    fuv = fuvgrs

    v = fuv + int64_t(2**20) + int64_t(2**41)
    v = v >> 42 

    u = fuv + int64_t(2**20)
    u = u & 0xFFFFFFFFFFFFFFFF
    u = (u << 22) & 0xFFFFFFFFFFFFFFFF 

    if u & (1 << 63):
        u = u - (1 << 64) 
    
    u = u >> 43 
    
    return u, v



def cpt_inv(x):

    F = big30_9(P)
    G = big30_9(x)

    delta = int64_t(1)
    
    # entries of master T
    V = big30_9(0)
    S = big30_9(int(inv590))

    fuv = int64_t(0) 
    grs = int64_t(0)

    f = int64_t(0)
    g = int64_t(0)


    uu, vv, rr, ss = int64_t(0), int64_t(0), int64_t(0), int64_t(0)
    u, v, r, s = int64_t(0), int64_t(0), int64_t(0), int64_t(0)

    g0_and_1 = int64_t(0) 
    cond = int64_t(0)

    fuv_new = int64_t(0)
    grs_new = int64_t(0)


    for i in range(10):

        f = int64_t(F.low_60_bit())
        g = int64_t(G.low_60_bit())

        uu = int64_t(1) 
        vv = int64_t(0) 
        rr = int64_t(0) 
        ss = int64_t(1)


        # First 20 steps
        fuv = (f - ((f>>20)<<20)) - int64_t(2**41)
        grs = (g - ((g>>20)<<20)) - int64_t(2**62)


        for k in range(20):
            g0_and_1 = (grs & int64_t(1))
            
            cond = int64_t((delta > 0) & (int(g0_and_1) == 1))

            fuv_new = (int64_t(1)-cond) * fuv +     cond * grs
            grs_new = ( -cond) * fuv + (int64_t(1)-cond) * grs

            fuv = fuv_new
            grs = grs_new 

            delta_swapper = delta ^ (-delta)
            delta = delta ^ (cond * delta_swapper)


            grs = (g0_and_1 * fuv + grs) >> 1 

            delta =  delta + int64_t(2)

        u, v = extraction(fuv)
        r, s = extraction(grs)

        # Update_fg
        f_new = (int(u) * int(f) + int(v) * int(g)) >> 20
        g_new = (int(r) * int(f) + int(s) * int(g)) >> 20
        f = int64_t(f_new)
        g = int64_t(g_new)

        # Update_uuvvrrss
        uu_new = u * uu + v * rr 
        rr_new = r * uu + s * rr 
        vv_new = u * vv + v * ss
        ss_new = r * vv + s * ss
        uu = uu_new
        rr = rr_new
        vv = vv_new
        ss = ss_new
        
        # Middle 20 steps
        fuv = (f - ((f>>20)<<20)) - int64_t(2**41)
        grs = (g - ((g>>20)<<20)) - int64_t(2**62)


        for k in range(20):
            g0_and_1 = (grs & int64_t(1))
            
            cond = int64_t((delta > 0) & (int(g0_and_1) == 1))

            fuv_new = (int64_t(1)-cond) * fuv +     cond * grs
            grs_new = ( -cond) * fuv + (int64_t(1)-cond) * grs

            fuv = fuv_new
            grs = grs_new 

            delta_swapper = delta ^ (-delta)
            delta = delta ^ (cond * delta_swapper)


            grs = (g0_and_1 * fuv + grs) >> 1 

            delta =  delta + int64_t(2)

        u, v = extraction(fuv)
        r, s = extraction(grs)



        # Update_fg
        f_new = (int(u) * int(f) + int(v) * int(g)) >> 20
        g_new = (int(r) * int(f) + int(s) * int(g)) >> 20
        f = int64_t(f_new)
        g = int64_t(g_new)

        # Update_uuvvrrss
        uu_new = u * uu + v * rr 
        rr_new = r * uu + s * rr 
        vv_new = u * vv + v * ss
        ss_new = r * vv + s * ss
        uu = uu_new
        rr = rr_new
        vv = vv_new
        ss = ss_new

        # Last 19 steps
        fuv = (f - ((f>>20)<<20)) - int64_t(2**40)
        grs = (g - ((g>>20)<<20)) - int64_t(2**61)


        for k in range(19):
            g0_and_1 = (grs & int64_t(1))
            
            cond = int64_t((delta > 0) & (int(g0_and_1) == 1))

            fuv_new = (int64_t(1)-cond) * fuv +     cond * grs
            grs_new = ( -cond) * fuv + (int64_t(1)-cond) * grs

            fuv = fuv_new
            grs = grs_new 

            delta_swapper = delta ^ (-delta)
            delta = delta ^ (cond * delta_swapper)


            grs = (g0_and_1 * fuv + grs) >> 1 

            delta =  delta + int64_t(2)

        u, v = extraction(fuv)
        r, s = extraction(grs)


        # Update_uuvvrrss
        uu_new = u * uu + v * rr 
        rr_new = r * uu + s * rr 
        vv_new = u * vv + v * ss
        ss_new = r * vv + s * ss
        uu = uu_new
        rr = rr_new
        vv = vv_new
        ss = ss_new




        # Update_FG
        #print("Operands")
        #print(uu)
        #print(vv)
        #print(rr)
        #print(ss)
        #print(F)
        #print(G)
        F_new = (int(uu) * int(F) + int(vv) * int(G)) >> 59
        G_new = (int(rr) * int(F) + int(ss) * int(G)) >> 59

        
        
        F = big30_9(F_new)
        G = big30_9(G_new)
        #print("Results")
        #print(F)
        #print(G)

        # Update_VS
        V_new = (int(uu) * int(V)) % P + (int(vv) * int(S)) % P
        S_new = (int(rr) * int(V)) % P + (int(ss) * int(S)) % P

        V = big30_9(V_new)
        S = big30_9(S_new)


    result = int(V) * int(F) 
    if result < 0:
        result += P

    return result


from random import randint

import time
ITERATION = 1

# 先生成 1000 個隨機數
random_numbers = [randint(1, P) for _ in range(ITERATION)]


start = time.perf_counter()
for i in range(ITERATION):
    x = random_numbers[i]
    x = 7
    v = cpt_inv(x)
    print("-"*20)
    print("x is", x)
    print("and its inverse in Ed25519 is")
    print("v is",int(v))
    print("The result is", (x * int(v)) % P == 1)
    if not (x * int(v)) % P == 1:
        print(f"things go wrong with {x}")
        break
end = time.perf_counter()
print(f"純 inverse 運算時間：{(end - start):.4f} 秒")
