P = 2**255 - 19; 
#inv588 = 13378806053444100433471352356166658344066565117701345005840324140343132455543
inv600 = 30944292108470708005745096299893818799743179878335277999558634282422183477374
#assert(inv588 * (2**588) % P == 1)
assert(inv600 * (2**600) % P == 1)


def sign(x):
    return 1 if x >= 0 else -1


def cpt_inv(x):
    F = P
    G = x
    delta = 1
    V = 0
    S = 1
    

    for i in range(10):

        f0 = F % (2**60)
        g0 = G % (2**60)

        uu, vv = 1, 0
        rr, ss = 0, 1


        for j in range(3):
            
            fuv = (f0 % (2**20)) - 2**41
            grs = (g0 % (2**20)) - 2**62
            



            for k in range(20):

                g0_and_1 = g0 & 1
                cond = (delta > 0) & (g0_and_1 == 1)
                
                fuv_new = (1 - cond) * fuv +      cond  * grs
                grs_new = (  - cond) * fuv + (1 - cond) * grs

                fuv = fuv_new
                grs = grs_new


                if cond:
                    delta = - delta

                
                grs = (g0_and_1 * fuv + grs) >> 1


                delta =  delta + 2
            



            v = fuv + 2**20 + 2**41
            v = v >> 42

            u = fuv + 2**20
            u = u & 0xFFFFFFFFFFFFFFFF
            u = (u << 22) & 0xFFFFFFFFFFFFFFFF

            if u & (1 << 63):
                u = u - (1 << 64)

            u = u >> 43

            s = grs + 2**20 + 2**41
            s = s >> 42

            r = grs + 2**20
            r = r & 0xFFFFFFFFFFFFFFFF
            r = (r << 22) & 0xFFFFFFFFFFFFFFFF

            if r & (1 << 63):
                r = r - (1 << 64)

            r = r >> 43

            print(" u, v =", u, v)
            print(" r, s =", r, s)






            uu_new, vv_new = u * uu + v * rr, u * vv + v * ss
            rr_new, ss_new = r * uu + s * rr, r * vv + s * ss

            uu = uu_new
            vv = vv_new
            rr = rr_new
            ss = ss_new


            f0_new, g0_new = u * f0 + v * g0, r * f0 + s * g0 
            f0 = f0_new >> 20
            g0 = g0_new >> 20

            if i == 0:
                print("f0 =", f0)
                print("g0 =", g0)


        F_new, V_new = uu * F + vv * G, uu * V + vv * S
        G_new, S_new = rr * F + ss * G, rr * V + ss * S 

        F = F_new >> 60
        V = V_new
        G = G_new >> 60
        S = S_new


        print("F =",F)
    V = (V * sign(F) * inv600) % P

    return V









        

from random import randint
for i in range(1):
    x = randint(1, P)
    x = 29898550999291309230350269358275533761860962274120382721550840808703900785706
    v = cpt_inv(x)
    print("x is", x)
    print("and its inverse in Ed25519 is")
    print("v is",v)
    print("The result is", (x * v) % P == 1)
    if not (x * v) % P == 1:
        print("(x * v) % P =\n", (x * v) % P )
        break



