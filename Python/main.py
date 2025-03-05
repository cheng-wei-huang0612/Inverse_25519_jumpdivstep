P = 2**255 - 19 
inv600 = 30944292108470708005745096299893818799743179878335277999558634282422183477374
assert(inv600 * (2**600) % P == 1)

def extraction(fuvgrs):
    """
    outputs; u, v or r, s
    """
    fuv = fuvgrs

    v = fuv + 2**20 + 2**41
    v = v >> 42 

    u = fuv + 2**20 
    u = u & 0xFFFFFFFFFFFFFFFF
    u = (u << 22) & 0xFFFFFFFFFFFFFFFF 

    if u & (1 << 63):
        u = u - (1 << 64) 
    
    u = u >> 43 

    return u, v



def cpt_inv(x):
    F = P
    G = x
    delta = 1
    
    V = 0
    S = inv600

    print(F)

    for i in range(10 - 0):

        f = F % (2 ** 60)
        g = G % (2 ** 60)

        print(f"f at i = {i} is {f}")
        print(f"g at i = {i} is {g}")


        uu = 1 
        vv = 0 
        rr = 0 
        ss = 1

        for j in range(3):

            fuv = (f % 2**20) - 2**41 
            grs = (g % 2**20) - 2**62

            #print(f"fuv at j = {j} and before entering k loop is {fuv}") 


 
            for k in range(20):
                g0_and_1 = grs & 1
                cond = (delta > 0) & (g0_and_1 == 1)

                fuv_new = (1-cond) * fuv +     cond * grs
                grs_new = ( -cond) * fuv + (1-cond) * grs

                fuv = fuv_new
                grs = grs_new 

                delta_swapper = delta ^ (-delta)
                delta = delta ^ (cond * delta_swapper)

                grs = (g0_and_1 * fuv + grs) >> 1 


                delta =  delta + 2

                print(f"fuv at i = {i}, j = {j} and k = {k} is {fuv}")
                print(f"cond at i = {i}, j = {j} and k = {k} is {cond}")
                print(f"delta at i = {i}, j = {j} and k = {k} is {delta}")

                
            u, v = extraction(fuv)
            r, s = extraction(grs)

            print(f"u, v at i = {i} and j = {j} is {u}, {v}")
            print(f"r, s at i = {i} and j = {j} is {r}, {s}")


            f_new = (u * f + v * g) >> 20
            g_new = (r * f + s * g) >> 20
        
            f = f_new
            g = g_new

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
            #print("uu, vv =", uu, vv)
            #print("rr, ss =", rr, ss)


        print(f"uu, vv at i = {i} is {uu}, {vv}")
        print(f"rr, ss at i = {i} is {rr}, {ss}")




        # Update_FG

        F_new = (uu * F + vv * G) >> 60
        G_new = (rr * F + ss * G) >> 60

        F = F_new
        G = G_new

        print(f"F at i = {i} is {F}")
        print(f"G at i = {i} is {G}")

        V_new = ((uu * V) % P) + (vv * S) % P
        S_new = ((rr * V) % P) + (ss * S) % P

        V = V_new
        S = S_new

    #assert(F == 1 or F == -1)
    result = V * F % P
    if result < 0:
        result += P



    return result


from random import randint
for i in range(1):
    x = randint(1, P)
    x = 22566953133189417447805678926765234106181498594475993225654012575070174008598

    v = cpt_inv(x)
    print("-"*20)
    print("x is", x)
    print("and its inverse in Ed25519 is")
    print("v is",v)
    print("The result is", (x * v) % P == 1)
    if not (x * v) % P == 1:
        break
