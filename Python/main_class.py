from bignum import *

P = 2**255 - 19
hP = P >> 1
inv600 = big30_9(30944292108470708005745096299893818799743179878335277999558634282422183477374)
assert(int(inv600) * (2**600) % P == 1)
OFFSET = P

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
    
    assert(str(type(u)) == "<class 'bignum.int64_t'>")
    assert(str(type(v)) == "<class 'bignum.int64_t'>")
    return u, v






def cpt_inv(x):

    F = big30_9(P)
    assert(int(F) == P)

    G = big30_9(x)
    assert(int(G) == x)

    delta = int64_t(1)
    
    # entries of master T
    V = big30_9(0)
    S = big30_9(int(inv600))

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


    for i in range(10-0):

        f = int64_t(F.low_60_bit())
        assert(f == int64_t(int(F) % (2 ** 60)))
        assert(str(type(f)) == "<class 'bignum.int64_t'>")

        g = int64_t(G.low_60_bit())
        assert(g == int64_t(int(G) % (2 ** 60)))

        print(f"f at i = {i} is {f}")
        print(f"g at i = {i} is {g}")

        uu = int64_t(1) 
        vv = int64_t(0) 
        rr = int64_t(0) 
        ss = int64_t(1)

        for j in range(3):

            f_red = int64_t(0)
            f_red = f - ((f>>20)<<20)
            
            g_red = g - ((g>>20)<<20)

            fuv = (f_red) - int64_t(2**41)
            grs = (g_red) - int64_t(2**62)


            for k in range(20):
                g0_and_1 = (grs & int64_t(1))
                
                cond = int64_t((delta > 0) & (int(g0_and_1) == 1))
                assert(cond in [0,1])

                fuv_new = (int64_t(1)-cond) * fuv +     cond * grs
                grs_new = ( -cond) * fuv + (int64_t(1)-cond) * grs
                assert(str(type(fuv_new)) == "<class 'bignum.int64_t'>")
                assert(str(type(grs_new)) == "<class 'bignum.int64_t'>")

                fuv = fuv_new
                grs = grs_new 

                delta_swapper = delta ^ (-delta)
                delta = delta ^ (cond * delta_swapper)


                grs = (g0_and_1 * fuv + grs) >> 1 
                assert(str(type(grs)) == "<class 'bignum.int64_t'>")

                delta =  delta + int64_t(2)
                assert(str(type(delta)) == "<class 'bignum.int64_t'>")

                print(f"fuv at i = {i}, j = {j} and k = {k} is {fuv}")
                print(f"cond at i = {i}, j = {j} and k = {k} is {cond}")
                print(f"delta at i = {i}, j = {j} and k = {k} is {delta}")
                 
                

            u, v = extraction(fuv)
            r, s = extraction(grs)


            print(f"u, v at i = {i} and j = {j} is {u}, {v}")
            print(f"r, s at i = {i} and j = {j} is {r}, {s}")

            # Update_fg
            # f_new = ((u * f) + (v * g)) >> 20
            # g_new = ((r * f) + (s * g)) >> 20
        
            f_new = (int(u) * int(f) + int(v) * int(g)) >> 20
            g_new = (int(r) * int(f) + int(s) * int(g)) >> 20

            f = int64_t(f_new)
            g = int64_t(g_new)

            print(f"f at i = {i} and j = {j} is {f}")
            print(f"g at i = {i} and j = {j} is {g}")

            
            uu_new = u * uu + v * rr 
            rr_new = r * uu + s * rr 
            vv_new = u * vv + v * ss
            ss_new = r * vv + s * ss

            
            
            uu = uu_new
            rr = rr_new
            vv = vv_new
            ss = ss_new


            assert(str(type(ss)) == "<class 'bignum.int64_t'>")

        print(f"uu, vv at i = {i} is {uu}, {vv}")
        print(f"rr, ss at i = {i} is {rr}, {ss}")


        # Update_FG
        # F_new = (uu * F + vv * G) >> 60
        # G_new = (rr * F + ss * G) >> 60

        F_new = (int(uu) * int(F) + int(vv) * int(G))>>60
        G_new = (int(rr) * int(F) + int(ss) * int(G))>>60
        
        F = big30_9(F_new)
        G = big30_9(G_new)

        print(f"F at i = {i} is {int(F)}")
        print(f"G at i = {i} is {int(G)}")

        V_new = (int(uu) * int(V)) % P + (int(vv) * int(S)) % P
        S_new = (int(rr) * int(V)) % P + (int(ss) * int(S)) % P

        V = big30_9(V_new)
        S = big30_9(S_new)

    result = mul_big30_9_with_big30_9_mod_P(V, F)

    return result


from random import randint
for i in range(1):
    x = randint(1, P)
    x = 22566953133189417447805678926765234106181498594475993225654012575070174008598

    v = cpt_inv(x)
    print("-"*20)
    print("x is", x)
    print("and its inverse in Ed25519 is")
    print("v is",int(v))
    print("The result is", (x * int(v)) % P == 1)
    if not (x * int(v)) % P == 1:
        break
