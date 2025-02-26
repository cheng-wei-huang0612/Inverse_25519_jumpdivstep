P = 2**255 - 19; 
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


def sign(x):
    return 1 if x >= 0 else -1


def cpt_inv(x):
    F = P
    G = x
    delta = 1
    
    # entries of master T
    V = 0
    S = 1


    for i in range(10):

        f = F % (2 ** 60)
        g = G % (2 ** 60)

        uu = 1 
        vv = 0 
        rr = 0 
        ss = 1

        for j in range(3):


            fuv = (f % 2**20) - 2**41 
            grs = (g % 2**20) - 2**62

 
            for k in range(20):
                g0_and_1 = grs & 1
                
                cond = (delta > 0) & (g0_and_1 == 1)

                fuv_new = (1-cond) * fuv +     cond * grs
                grs_new = ( -cond) * fuv + (1-cond) * grs


                fuv = fuv_new
                grs = grs_new 

                if cond:
                    delta = - delta

                fuv_new = 1 * fuv 
                grs_new = (g0_and_1 * fuv + 1 * grs) >> 1 

                fuv = fuv_new
                grs = grs_new 

                delta =  delta + 2

                u, v = extraction(fuv)
                r, s = extraction(grs)




            f_new = (u * f + v * g) >> 20
            g_new = (r * f + s * g) >> 20
        
            f = f_new
            g = g_new

            uu_new = u * uu + v * rr 
            rr_new = r * uu + s * rr 
            vv_new = u * vv + v * ss
            ss_new = r * vv + s * ss
            
            uu = uu_new
            rr = rr_new
            vv = vv_new
            ss = ss_new




        F_new = (uu * F + vv * G) >> 60
        G_new = (rr * F + ss * G) >> 60
        
        F = F_new
        G = G_new


        V_new = uu * V + vv * S
        S_new = rr * V + ss * S

        V = V_new
        S = S_new

    result = (V * F * inv600) % P

    return result


from random import randint
for i in range(100):
    x = randint(1, P)

    v = cpt_inv(x)
    print("x is", x)
    print("and its inverse in Ed25519 is")
    print("v is",v)
    print("The result is", (x * v) % P == 1)
    if not (x * v) % P == 1:
        break
