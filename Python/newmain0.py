P = 2**255 - 19; 

inv = 13378806053444100433471352356166658344066565117701345005840324140343132455543
assert(inv * (2**588) % P == 1)


def sign(x):
    return 1 if x >= 0 else -1


def cpt_inv(x):
    f = P
    g = x
    delta = 1
    
    # entries of master T
    # T_m = [[ u_m  v_m ]  = [[ 1  0 ]
    #        [ s_m  r_m ]]    [ 0  1 ]]
    u = (2**588)
    v = 0
    r = 0
    s = (2**588)


    for j in range(600):
        g_and_1 = g & 1
        cond = (delta > 0) & (g_and_1 == 1)

        u_new = (1-cond) * u +     cond * r 
        r_new = ( -cond) * u + (1-cond) * r
        v_new = (1-cond) * v + cond * s
        s_new = ( -cond) * v + (1-cond) * s
        f_new = (1-cond) * f + cond * g
        g_new = ( -cond) * f + (1-cond) * g

        u = u_new
        r = r_new
        v = v_new
        s = s_new
        f = f_new
        g = g_new

        if cond:
            delta = - delta

        # Elimination
        u_new = 1 * u
        r_new = (g_and_1 * u + 1 * r) >> 1
        v_new = 1 * v 
        s_new = (g_and_1 * v + 1 * s) >> 1
        f_new = 1 * f
        g_new = (g_and_1 * f + 1 * g) >> 1

        u = u_new
        r = r_new
        v = v_new
        s = s_new
        f = f_new
        g = g_new

        delta =  delta + 2

        # if (j % 20 == 0):
        #     print("f = ",f)
        #     print("g = ",g)



    result = (v * sign(f) * inv) % P

    return result


from random import randint

for i in range(1000):
    x = randint(1, P)
    v = cpt_inv(x)
    print("x is", x)
    print("and its inverse in Ed25519 is")
    print("v is",v)
    print("The result is", (x * v) % P == 1)
    if not (x * v) % P == 1:
        print("Not true")
        break
