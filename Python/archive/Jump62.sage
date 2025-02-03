p = 2^255 - 19; 
assert(p.is_prime())
x = randint(1,p);

def generate_scaled_T_n(delta,g):
    g_and_1 = g & 1
    if delta > 0 and (g_and_1):
        return 1-delta, matrix([[0,2],[-1,1]])
    else:
        return 1+delta, matrix([[2,0],[ g_and_1 ,1]])
    
def Update(T,f,g):
    result = T * matrix([f,g]).T
    f, g = result[0,0], result[1,0]
    f = f >> 1
    g = g >> 1
    return f, g


def jump62(delta,f0,g0):
    jump_length = 62
    f0_copy = f0
    g0_copy = g0


    T_list = []
    for _ in range(jump_length):
        delta, T = generate_scaled_T_n(delta,g0)
        T_list.append(T)
        f0,g0 = Update(T, f0, g0)
        

    f1, g1 = f0, g0    #used for assertion
    #print(f0,g0)
    
    T = matrix.identity(2)
    for i in range(len(T_list)):
        T = T_list[i] * T

    # Assertion
    f0 = f0_copy
    g0 = g0_copy
    result = T * matrix([f0,g0]).T
    assert(f1 == result[0,0]>>(jump_length))
    assert(g1 == result[1,0]>>(jump_length))
    

    
    return delta, T
    
    
    


def cpt_inv(x):
    f = p; g = x; delta =1
    jump_length = 62
    assert(p == 2^255 - 19)

    T_list_12 = []
    for i in range(12):
        f0 = f % (2^64)
        g0 = g % (2^64)
        delta, T = jump62(delta, f0, g0)

        result = T * matrix([f,g]).T
        f = result[0,0]>>(jump_length)
        g = result[1,0]>>(jump_length)

        
        #print(f,g)
        T_list_12.append(T)

    assert(len(T_list_12) == 12)

    
    master_T = matrix.identity(2)
    for i in range(12):
        master_T = T_list_12[i] * master_T

    
    R = IntegerModRing(p);
    v = R(master_T[0,1])
    v = v * R(2^(-744))
    #print(v)
    assert(v * x * sign(f) == 1)

    return v    


v = cpt_inv(x)
print(x)
print("and its inverse in 25519 is")
print(v)