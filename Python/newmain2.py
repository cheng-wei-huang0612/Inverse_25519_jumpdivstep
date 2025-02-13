P = 2**255 - 19; 
inv588 = 13378806053444100433471352356166658344066565117701345005840324140343132455543
inv600 = 30944292108470708005745096299893818799743179878335277999558634282422183477374
assert(inv588 * (2**588) % P == 1)
assert(inv600 * (2**600) % P == 1)


def sign(x):
    return 1 if x >= 0 else -1


def cpt_inv(x):
    f = P
    g = x
    delta = 1
    print("f = ", f)
    print("g = ", g)
    
    # entries of master T
    U = 1
    V = 0
    R = 0
    S = 1


    for j in range(30):
        u = -(2**20)
        v = 0
        r = 0
        s = -(2**20)

        f0 = f % (2**20)
        g0 = g % (2**20)

        fuv = (f0 + (v << 21) + (u << 42)) % ((2**64)-1)
        # | u | v | f0 | (little-endian)
        grs = (g0 + (s << 21) + (r << 42)) % ((2**64)-1)
        # | r | s | g0 |

 
        for i in range(20):
            # g0_and_1 = g0 & 1
            g0_and_1 = g0 & 1
            


            cond = (delta > 0) & (g0_and_1 == 1)

            u_new = (1-cond) * u +     cond * r 
            r_new = ( -cond) * u + (1-cond) * r
            v_new = (1-cond) * v +     cond * s
            s_new = ( -cond) * v + (1-cond) * s
            f0_new = (1-cond) * f0 +     cond * g0
            g0_new = ( -cond) * f0 + (1-cond) * g0

            u = u_new
            r = r_new
            v = v_new
            s = s_new
            f0 = f0_new
            g0 = g0_new


            fuv_new = ((1-cond) * fuv +     cond * grs) % ((2**64)-1)
            grs_new = (( -cond) * fuv + (1-cond) * grs) % ((2**64)-1)

            fuv = fuv_new
            grs = grs_new


            if cond:
                delta = - delta


            u_new = 1 * u
            r_new = (g0_and_1 * u + 1 * r) >> 1
            v_new = 1 * v 
            s_new = (g0_and_1 * v + 1 * s) >> 1
            f0_new = 1 * f0
            g0_new = (g0_and_1 * f0 + 1 * g0) >> 1

            u = u_new
            r = r_new
            v = v_new
            s = s_new
            f0 = f0_new
            g0 = g0_new
            
            fuv_new = 1 * fuv
            grs_new = ((g0_and_1 * fuv + 1 * grs) % ((2**64)-1)) >> 1

            fuv = fuv_new
            grs = grs_new

            delta =  delta + 2

        uu = fuv >> 42
        fuv = ((fuv) - (uu << 42)) % ((2**64)-1)
        vv = fuv >> 21

        rr = grs >> 42
        grs = ((grs) - (rr << 42)) % ((2**64)-1)
        ss = grs >> 21

        print("[uu, vv] = [", uu, ",", vv, "]")
        print("[rr, ss] = [", rr, ",", ss, "]")
        print()
        print("[u, v] = [", u, ",", v, "]")
        print("[r, s] = [", r, ",", s, "]")

        f_new = (u * f + v * g) >> 20
        g_new = (r * f + s * g) >> 20
        


        f = f_new
        g = g_new

        print("f = ", f)
        print("g = ", g)


        U_new = u * U + v * R
        R_new = r * U + s * R
        V_new = u * V + v * S
        S_new = r * V + s * S

        U = U_new
        R = R_new
        V = V_new
        S = S_new



    result = (V * sign(f) * inv600) % P

    return result


from random import randint
for i in range(100):
    x = randint(1, P)
    #x = 1203913883238069791910796757682093185665464422049559318090544978584515012490
    x = 43895893321060092368428052079847824837551928386645187925587889757743967812524
    v = cpt_inv(x)
    print("x is", x)
    print("and its inverse in Ed25519 is")
    print("v is",v)
    print("The result is", (x * v) % P == 1)
    if not (x * v) % P == 1:
        break
