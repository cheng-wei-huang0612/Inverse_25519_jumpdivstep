p = 2^255 - 19; 
assert(p.is_prime())
x = randint(1,p)


def int64_times_int256(i64, i256):
    assert(  -(2**63) <= i64 <= (  (2**63)-1) )
    assert( -(2**255) <= i256 <= ( (2**255)-1) )

    product = i64 * i256
    assert( -(2**319) <= product <= ( (2**319)-1) )
    return product

a, b = randint(-(2**63),(2**63)-1),randint(-(2**255),(2**255)-1)
assert(a * b == int64_times_int256(a,b))


def int64_times_int64(i64_1, i64_2):
    assert (-(2**63) <= i64_1 <= (2**63 - 1))
    assert (-(2**63) <= i64_2 <= (2**63 - 1))

    product = i64_1 * i64_2
    # 確保乘積仍在 int128 位元範圍：
    assert (-(2**127) <= product <= (2**127 - 1))
    return product

def int128_times_int128(i128_1, i128_2):
    assert (-(2**127) <= i128_1 <= (2**127 - 1))
    assert (-(2**127) <= i128_2 <= (2**127 - 1))

    product = i128_1 * i128_2
    # 確保乘積仍在 int256 位元範圍：
    assert (-(2**255) <= product <= (2**255 - 1))
    return product

def int64_2x2_times_int64_2x2(A, B):
    """
    使用 Strassen 演算法計算兩個 2x2 矩陣 A, B (int64) 的乘積，回傳乘積矩陣 C。
    
    A, B 為形如 [[a, b], [c, d]] 的二維陣列。
    回傳值 C 同樣是 [[p, q], [r, s]] 的二維陣列。
    """
    # 1. 拆解 A 與 B
    a, b = A[0][0], A[0][1]
    c, d = A[1][0], A[1][1]
    
    e, f = B[0][0], B[0][1]
    g, h = B[1][0], B[1][1]
    
    # 2. 計算七個中間量 (M1~M7)
    #    以下加減直接用 Python +, -
    #    乘法一律使用 int64_times_int64
    M1 = int64_times_int64(a + d, e + h)
    M2 = int64_times_int64(c + d, e)
    M3 = int64_times_int64(a, f - h)
    M4 = int64_times_int64(d, g - e)
    M5 = int64_times_int64(a + b, h)
    M6 = int64_times_int64(c - a, e + f)
    M7 = int64_times_int64(b - d, g + h)
    
    # 3. 用 M1~M7 組合出結果 C
    p = M1 + M4 - M5 + M7
    q = M3 + M5
    r = M2 + M4
    s = M1 - M2 + M3 + M6
    
    # 4. 回傳結果矩陣 (2x2)
    return [[p, q], [r, s]]



# Generate two random 2x2 matrices with int64 elements
A = [[randint(-(2**62), (2**62)-1) for _ in range(2)] for _ in range(2)]
B = [[randint(-(2**62), (2**62)-1) for _ in range(2)] for _ in range(2)]
# Test the int64_2x2_times_int64_2x2 function
C = int64_2x2_times_int64_2x2(A, B)
assert(matrix(A) * matrix(B) == matrix(C))


def int128_2x2_times_int128_2x2(A, B):
    """
    使用 Strassen 演算法計算兩個 2x2 矩陣 A, B (int128) 的乘積，回傳乘積矩陣 C。
    
    A, B 為形如 [[a, b], [c, d]] 的二維陣列。
    回傳值 C 同樣是 [[p, q], [r, s]] 的二維陣列。
    """
    # 1. 拆解 A 與 B
    a, b = A[0][0], A[0][1]
    c, d = A[1][0], A[1][1]
    
    e, f = B[0][0], B[0][1]
    g, h = B[1][0], B[1][1]
    
    # 2. 計算七個中間量 (M1~M7)
    #    以下加減直接用 Python +, -
    #    乘法一律使用 int64_times_int64
    M1 = int128_times_int128(a + d, e + h)
    M2 = int128_times_int128(c + d, e)
    M3 = int128_times_int128(a, f - h)
    M4 = int128_times_int128(d, g - e)
    M5 = int128_times_int128(a + b, h)
    M6 = int128_times_int128(c - a, e + f)
    M7 = int128_times_int128(b - d, g + h)
    
    # 3. 用 M1~M7 組合出結果 C
    p = M1 + M4 - M5 + M7
    q = M3 + M5
    r = M2 + M4
    s = M1 - M2 + M3 + M6
    
    # 4. 回傳結果矩陣 (2x2)
    return [[p, q], [r, s]]


# Generate two random 2x2 matrices with int64 elements
A = [[randint(-(2**126), (2**126)-1) for _ in range(2)] for _ in range(2)]
B = [[randint(-(2**126), (2**126)-1) for _ in range(2)] for _ in range(2)]
# Test the int64_2x2_times_int64_2x2 function
C = int128_2x2_times_int128_2x2(A, B)
assert(matrix(A) * matrix(B) == matrix(C))






def jump62(delta, f0, g0):

    # ------------- 工具函式區 -------------
    # 2×2 矩陣乘 2×2 矩陣 (皆以二維串列表示)
    def mat2x2_mult(A, B):
        """
        A, B 為 2×2 串列，回傳 A*B (也是 2×2 串列)。
        """
        return [
            [
                A[0][0]*B[0][0] + A[0][1]*B[1][0],
                A[0][0]*B[0][1] + A[0][1]*B[1][1]
            ],
            [
                A[1][0]*B[0][0] + A[1][1]*B[1][0],
                A[1][0]*B[0][1] + A[1][1]*B[1][1]
            ]
        ]
    
    # 2×2 矩陣乘向量 (vector) (皆以串列表示)
    def mat2x2_vec_mult(A, v):
        """
        A 為 2×2 串列，v 為長度 2 的一維串列 [v0, v1]。
        回傳 A*v (結果也是一個長度 2 的串列)。
        """
        return [
            A[0][0]*v[0] + A[0][1]*v[1],
            A[1][0]*v[0] + A[1][1]*v[1]
        ]
    
    # 二維串列的 2×2 單位矩陣
    I2 = [[1, 0], [0, 1]]
    
    # ------------- 主邏輯開始 -------------
    
    jump_length = 62
    
    # These are used for assertion.
    f0_copy = f0
    g0_copy = g0
    

    T = [[1,0],
         [0,1]]

    for _ in range(jump_length):        
        # conditional swap
        g0_and_1 = g0 & 1
        cond = int(delta > 0) & g0_and_1
        if cond:
            temp = f0
            f0 = g0
            g0 = - temp
            delta = - delta
            # f0 <- g0 and g0 <- -f0 and delta <- -delta

        # Matrix product accumulation (conditional swap)
        # T = [[ 1-cond,   cond ]   * [[ T[0][0], T[0][1] ]
        #      [  -cond, 1-cond ]]     [ T[1][0], T[1][1] ]]

        T_new_0_0 = (1-cond) * T[0][0] +     cond * T[1][0]
        T_new_0_1 = (1-cond) * T[0][1] +     cond * T[1][1]
        T_new_1_0 =    -cond * T[0][0] + (1-cond) * T[1][0]
        T_new_1_1 =    -cond * T[0][1] + (1-cond) * T[1][1]

        T[0][0] = T_new_0_0
        T[0][1] = T_new_0_1
        T[1][0] = T_new_1_0
        T[1][1] = T_new_1_1



        # Elimination 
        delta += 1
        g0 = (g0 + (g0_and_1) * f0) >> 1

        # Matrix product accumulation (elimination)
        # T = [[        2,   0 ]   * [[ T[0][0], T[0][1] ]
        #      [ g0_and_1,   1 ]]     [ T[1][0], T[1][1] ]]
        # T = [[                  2 * T[0][0],                  2 * T[0][1] ]
        #      [ T[1][0] + g0_and_1 * T[0][0], T[1][1] + g0_and_1 * T[0][1] ]]

        T[1][0] += g0_and_1 * T[0][0]
        T[1][1] += g0_and_1 * T[0][1]
        T[0][0] = T[0][0] << 1
        T[0][1] = T[0][1] << 1



    # assertion
    # 先記錄 f1, g1
    f1, g1 = f0, g0
    
    # 還原 f0, g0
    f0, g0 = f0_copy, g0_copy

    # 這裡為了方便，暫時轉成 Sage matrix 做驗證
    result_vec = matrix(T) * (matrix([f0, g0]).T)
    # [[ result_f ]   =  [[ T[0][0], T[0][1] ]    *    [[ f0 ]    
    #  [ result_g ]]      [ T[1][0], T[1][1] ]]         [ g0 ]] 
    # after this we shift >> 62 (jump_length)
    #
    # result_f = T[0][0] * f0 + T[0][1] * g0  
    # result_g = T[1][0] * f0 + T[1][1] * g0

    result_f = int64_times_int256( T[0][0], f0 ) + int64_times_int256( T[0][1], g0 ) 
    result_g = int64_times_int256( T[1][0], f0 ) + int64_times_int256( T[1][1], g0 ) 
    result_f = result_f >> 62
    result_g = result_g >> 62


    
    # 驗證
    assert( f1 == result_f )
    assert( g1 == result_g )
    
    return delta, T


    





def cpt_inv(x):
    f = 2**255 - 19; 
    g = x; delta = 1


    T_list = []

    for i in range(12):

        f0 = f % (2**64)
        g0 = g % (2**64)
        delta, T = jump62(delta, f0, g0)

        #result = matrix(T) * matrix([f,g]).T
        # [[ result_f ]   =  [[ T[0][0], T[0][1] ]    *    [[ f ]    
        #  [ result_g ]]      [ T[1][0], T[1][1] ]]         [ g ]] 
        # after this we shift >> 62 (jump_length)
        #
        # result_f = T[0][0] * f + T[0][1] * g  
        # result_g = T[1][0] * f + T[1][1] * g
        result_f = int64_times_int256( T[0][0], f ) + int64_times_int256( T[0][1], g )
        result_g = int64_times_int256( T[1][0], f ) + int64_times_int256( T[1][1], g )
        result_f = result_f >> 62
        result_g = result_g >> 62

        f = result_f
        g = result_g

        #print(f,g)
        T_list.append(T)


    


    assert( len(T_list) == 12 )
    for i in range(6):
        #T_list[i] = T_list[2*i+1] * T_list[2*i]
        T_list[i] = int64_2x2_times_int64_2x2(T_list[2*i+1], T_list[2*i])


    for i in range(3):
        #T_list[i] = matrix(T_list[2*i+1]) * matrix(T_list[2*i])
        T_list[i] = int128_2x2_times_int128_2x2(T_list[2*i+1], T_list[2*i])


    # master_T = matrix(T_list[2]) * matrix(T_list[1]) * matrix(T_list[0])
    # v = master_T[0,1] % p

    # Out v should be computed as:
    # v = top right corner of (T_list[2] * T_list[1] * T_list[0])
    # So it suffices to compute: 
    # v =    T_list[2][0][0] * ( T_list[1][0][0] * T_list[0][0][1] + T_list[1][0][1] * T_list[0][1][1] ) 
    #     +  T_list[2][0][1] * ( T_list[1][1][0] * T_list[0][0][1] + T_list[1][1][1] * T_list[0][1][1] ) 
    # There are 6 (int256 mod p mul) operations

    v = T_list[2][0][0] * ( T_list[1][0][0] * T_list[0][0][1] + T_list[1][0][1] * T_list[0][1][1] ) +  T_list[2][0][1] * ( T_list[1][1][0] * T_list[0][0][1] + T_list[1][1][1] * T_list[0][1][1] ) 
    v = v % p


    
    # R = IntegerModRing(p)
    inv_2_744 = 0x38b66f98_b076d64f_59639d9d_b0ccd471_9ca54469_d9422c90_5dc1855b_1b224df9
    assert( inv_2_744 * (2**744) % p == 1)

    v = sign(f) * v * inv_2_744 % p
    #print(v)
    assert(v * x % p == 1)
    return v    


v = cpt_inv(x)
print("x is", x)
print("and its inverse in 25519 is")
print("v is",v)
print("The result is", (x * v) % p == 1)