P = 2**255 - 19; 
#inv588 = 13378806053444100433471352356166658344066565117701345005840324140343132455543
inv600 = 30944292108470708005745096299893818799743179878335277999558634282422183477374
#assert(inv588 * (2**588) % P == 1)
assert(inv600 * (2**600) % P == 1)


def sign(x):
    return 1 if x >= 0 else -1


def cpt_inv(x):
    f = P
    g = x
    delta = 1
    # print("f = ", f)
    # print("g = ", g)
    
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

 
        for i in range(20):
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

            if cond:
                delta = - delta

            # Elimination
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
            

                

            delta =  delta + 2
        if j == 0:
            print(u)

        f_new = (u * f + v * g) >> 20
        g_new = (r * f + s * g) >> 20
        
        f = f_new
        g = g_new



        U_new = u * U + v * R
        R_new = r * U + s * R
        V_new = u * V + v * S
        S_new = r * V + s * S

        U = U_new
        R = R_new
        V = V_new
        S = S_new

    result = (V * f * inv600) % P

    return result


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
        break
