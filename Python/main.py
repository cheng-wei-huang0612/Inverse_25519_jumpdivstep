from random import randint



def sign(x):
    return 1 if x >= 0 else -1

p = 2**255 - 19; 
#assert(p.is_prime())
x = randint(1, p)
x = 1


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

def uint256_times_uint256_mod_p(uint256_1, uint256_2):
    assert( 0 <= uint256_1 <= 2**256 - 1 )
    assert( 0 <= uint256_2 <= 2**256 - 1 )

    product = uint256_1 * uint256_2
    high = product >> 255
    low  = product & ((1 << 255) - 1)
    product = low + high * 19

    high = product >> 255
    low  = product & ((1 << 255) - 1)
    product = low + high * 19

    high = product >> 255
    low  = product & ((1 << 255) - 1)
    product = low + high * 19


    if not 0 <= product <= p-1:
        product -= p


    assert( 0 <= product <= p-1)
    return product



a, b = randint(0 ,(2**256)-1),randint(0 ,(2**256)-1)
assert(a * b % p  == uint256_times_uint256_mod_p(a,b))


def int128_times_int128(i128_1, i128_2):
    assert (-(2**127) <= i128_1 <= (2**127 - 1))
    assert (-(2**127) <= i128_2 <= (2**127 - 1))

    product = i128_1 * i128_2
    # 確保乘積仍在 int256 位元範圍：
    assert (-(2**255) <= product <= (2**255 - 1))
    return product

def int64_2x2_times_int64_2x2(A, B):
    """
    使用普通矩陣乘法計算兩個 2x2 矩陣 A, B (int64) 的乘積，回傳乘積矩陣 C。
    
    A, B 為形如 [[a, b], [c, d]] 的二維陣列。
    回傳值 C 同樣是 [[p, q], [r, s]] 的二維陣列。
    """

    
    
    print("Matrix A:")
    print(f"[[{A[0][0]:016x}, {A[0][1]:016x}],")
    print(f" [{A[1][0]:016x}, {A[1][1]:016x}]]")

    print("Matrix B:")
    print(f"[[{B[0][0]:016x}, {B[0][1]:016x}],")
    print(f" [{B[1][0]:016x}, {B[1][1]:016x}]]")

    # 1. 拆解 A 與 B
    a, b = A[0][0], A[0][1]
    c, d = A[1][0], A[1][1]
    
    e, f = B[0][0], B[0][1]
    g, h = B[1][0], B[1][1]
    
    # 2. 計算乘積
    p = int64_times_int64(a, e) + int64_times_int64(b, g)
    q = int64_times_int64(a, f) + int64_times_int64(b, h)
    r = int64_times_int64(c, e) + int64_times_int64(d, g)
    s = int64_times_int64(c, f) + int64_times_int64(d, h)
    
    # 3. 回傳結果矩陣 (2x2)
    return [[p, q], [r, s]]



# Generate two random 2x2 matrices with int64 elements
A = [[randint(-(2**62), (2**62)-1) for _ in range(2)] for _ in range(2)]
B = [[randint(-(2**62), (2**62)-1) for _ in range(2)] for _ in range(2)]
# Test the int64_2x2_times_int64_2x2 function
C = int64_2x2_times_int64_2x2(A, B)
#assert(matrix(A) * matrix(B) == matrix(C))


def int128_2x2_times_int128_2x2(A, B):
    """
    計算兩個 2x2 矩陣 A, B (int128) 的乘積，回傳乘積矩陣 C。
    
    A, B 為形如 [[a, b], [c, d]] 的二維陣列。
    回傳值 C 同樣是 [[p, q], [r, s]] 的二維陣列。
    """
    # 1. 拆解 A 與 B
    a, b = A[0][0], A[0][1]
    c, d = A[1][0], A[1][1]
    
    e, f = B[0][0], B[0][1]
    g, h = B[1][0], B[1][1]
    
    # 2. 計算八個中間量 (M1~M8)
    M1 = int128_times_int128(a, e)
    M2 = int128_times_int128(b, g)
    M3 = int128_times_int128(a, f)
    M4 = int128_times_int128(b, h)
    M5 = int128_times_int128(c, e)
    M6 = int128_times_int128(d, g)
    M7 = int128_times_int128(c, f)
    M8 = int128_times_int128(d, h)
    
    # 3. 用 M1~M8 組合出結果 C
    p = M1 + M2
    q = M3 + M4
    r = M5 + M6
    s = M7 + M8
    
    # 4. 回傳結果矩陣 (2x2)
    return [[p, q], [r, s]]


# Generate two random 2x2 matrices with int64 elements
A = [[randint(-(2**126), (2**126)-1) for _ in range(2)] for _ in range(2)]
B = [[randint(-(2**126), (2**126)-1) for _ in range(2)] for _ in range(2)]
# Test the int64_2x2_times_int64_2x2 function
C = int128_2x2_times_int128_2x2(A, B)
#assert(matrix(A) * matrix(B) == matrix(C))


def format_256_hex_grouped(value: int) -> str:
    """
    將 256-bit 二補數 (Python int) 以 64 hex digits 顯示，
    並且每 16 字元用 '_' 分隔。
    """
    # 1) 取 mod 2^256 (無號)
    mask_256 = (1 << 256) - 1
    uval = value & mask_256

    # 2) 轉成 64 hex digits (不含 '0x')
    hex_str = f"{uval:064x}"

    # 3) 每 16 字元切一段 => 用 '_'
    chunks = [hex_str[i:i+16] for i in range(0, 64, 16)]
    grouped = "_".join(chunks)

    return f"0x{grouped}"

def format_320_hex_grouped(value: int) -> str:
    """
    將 320-bit 二補數 (Python int) 以 80 hex digits 顯示，
    並且每 16 字元用 '_' 分隔。
    """
    # 1) 取 mod 2^320 (無號)
    mask_320 = (1 << 320) - 1
    uval = value & mask_320

    # 2) 轉成 80 hex digits (不含 '0x')
    hex_str = f"{uval:080x}"

    # 3) 每 16 字元切一段 => 用 '_'
    chunks = [hex_str[i:i+16] for i in range(0, 80, 16)]
    grouped = "_".join(chunks)

    return f"0x{grouped}"

def format_128_hex_grouped(value: int) -> str:
    """
    將 128-bit 二補數 (Python int) 以 64 hex digits 顯示，
    並且每 16 字元用 '_' 分隔。
    """
    # 1) 取 mod 2^128 (無號)
    mask_128 = (1 << 128) - 1
    uval = value & mask_128

    # 2) 轉成 64 hex digits (不含 '0x')
    hex_str = f"{uval:032x}"

    # 3) 每 16 字元切一段 => 用 '_'
    chunks = [hex_str[i:i+16] for i in range(0, 32, 16)]
    grouped = "_".join(chunks)

    return f"0x{grouped}"

def format_64_hex_grouped(value: int) -> str:
    """
    將 64-bit 二補數 (Python int) 以 16 hex digits 顯示，
    並且每 16 字元用 '_' 分隔。
    """
    # 1) 取 mod 2^64 (無號)
    mask_64 = (1 << 64) - 1
    uval = value & mask_64

    # 2) 轉成 16 hex digits (不含 '0x')
    hex_str = f"{uval:016x}"

    # 3) 每 16 字元切一段 => 用 '_'
    chunks = [hex_str[i:i+16] for i in range(0, 16, 16)]
    grouped = "_".join(chunks)

    return f"0x{grouped}"



def jump62(delta, f0, g0):        
    # These are used for assertion.
    f0_copy = f0
    g0_copy = g0
    
    print("f0 = ",f0)
    print("g0 = ",g0)

    T = [[1,0],
         [0,1]]

    for _ in range(62):        
        # conditional swap
        g0_and_1 = g0 & 1
        cond = int(delta > 0) & g0_and_1
        if cond:
            # 
            #     [[ 1-cond,   cond ]   * [[ f0 ]
            #      [  -cond, 1-cond ]]     [ g0 ]]
            #
            # if cond == 1
            # then the result is [[ g0, -f0 ]]^T
            # if cond == 0
            # then the result is [[ f0, g0 ]]^T
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

        print("T is ", T,"\n")

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

        print("delta", delta)
        print("f0 = ",f0,", g0 = ",g0,"\n")
    

    print("\n\n\n")



    # assertion
    # 先記錄 f1, g1
    f1, g1 = f0, g0
    
    # 還原 f0, g0
    f0, g0 = f0_copy, g0_copy

    # 這裡為了方便，暫時轉成 Sage matrix 做驗證
    # result_vec = matrix(T) * (matrix([f0, g0]).T)
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

        f0 = f % (2**63)
        g0 = g % (2**63)


        
        delta, T = jump62(delta, f0, g0)

        print("T is ", T,"\n")



        #result = matrix(T) * matrix([f,g]).T
        # [[ result_f ]   =  [[ T[0][0], T[0][1] ]    *    [[ f ]    
        #  [ result_g ]]      [ T[1][0], T[1][1] ]]         [ g ]] 
        # after this we shift >> 62 (jump_length)
        #
        # result_f = T[0][0] * f + T[0][1] * g  
        # result_g = T[1][0] * f + T[1][1] * g
        result_f = int64_times_int256( T[0][0], f ) + int64_times_int256( T[0][1], g )
        result_f = result_f >> 62
        result_g = int64_times_int256( T[1][0], f ) + int64_times_int256( T[1][1], g )
        result_g = result_g >> 62

        f = result_f
        g = result_g
        f_str = format_256_hex_grouped(f)
        print("f = ",f_str)
        print("  = ",f)
        g_str = format_256_hex_grouped(g)
        print("g = ",g_str)
        print("  = ",g)

        T_list.append(T)


    



    for i, T in enumerate(T_list):
        if i != 4 and i != 5:
            continue
        print(f"T_list[{i}] = [")
        for row in T:
            formatted_row = [format_64_hex_grouped(entry) for entry in row]
            print(f"  {formatted_row}")
        print("]")


    assert( len(T_list) == 12 )
    for i in range(6):
        T_list[i] = int64_2x2_times_int64_2x2(T_list[2*i+1], T_list[2*i])


    for i, T in enumerate(T_list):
        if i != 2:
            continue
        if i == 6:
            break
        print(f"T_list[{i}] = [")
        for row in T:
            formatted_row = [format_128_hex_grouped(entry) for entry in row]
            print(f"  {formatted_row}")
        print("]")



    for i in range(3):
        T_list[i] = int128_2x2_times_int128_2x2(T_list[2*i+1], T_list[2*i])


        

    






    # Out v should be computed as:
    # v = top right corner of (T_list[2] * T_list[1] * T_list[0])
    # So it suffices to compute: 
    # v =    T_list[2][0][0] * ( T_list[1][0][0] * T_list[0][0][1] + T_list[1][0][1] * T_list[0][1][1] ) 
    #     +  T_list[2][0][1] * ( T_list[1][1][0] * T_list[0][0][1] + T_list[1][1][1] * T_list[0][1][1] ) 
    # There are 6 (int256 mod p mul) operations
    # Please note that since our modulo 2**255 - 19 is pretty, and it is convenient for us to use "unsigned" arithmetic
    # But the data we've received is (signed) int256
    # We have to first convert the data needed into uint256: essentially: += p
    T_list[2][0][0] += p
    T_list[2][0][1] += p
    T_list[1][0][0] += p
    T_list[1][0][1] += p
    T_list[1][1][0] += p
    T_list[1][1][1] += p
    T_list[0][0][1] += p
    T_list[0][1][1] += p


    # v =    T_list[2][0][0] * ( T_list[1][0][0] * T_list[0][0][1] + T_list[1][0][1] * T_list[0][1][1] ) 
    #     +  T_list[2][0][1] * ( T_list[1][1][0] * T_list[0][0][1] + T_list[1][1][1] * T_list[0][1][1] ) 
    # Compute:
    # a = T_list[1][0][0] * T_list[0][0][1]
    # b = T_list[1][0][1] * T_list[0][1][1] 
    # c = T_list[1][1][0] * T_list[0][0][1]
    # d = T_list[1][1][1] * T_list[0][1][1]
    a = uint256_times_uint256_mod_p( T_list[1][0][0], T_list[0][0][1] )
    b = uint256_times_uint256_mod_p( T_list[1][0][1], T_list[0][1][1] )
    c = uint256_times_uint256_mod_p( T_list[1][1][0], T_list[0][0][1] )
    d = uint256_times_uint256_mod_p( T_list[1][1][1], T_list[0][1][1] )



    # So v will be computed as
    # v =    T_list[2][0][0] * ( a + b ) 
    #     +  T_list[2][0][1] * ( c + d ) 
    a = uint256_times_uint256_mod_p(T_list[2][0][0], a+b)
    b = uint256_times_uint256_mod_p(T_list[2][0][1], c+d)

    v = (a + b) % p
    print("before inv2  ",v)

    inv_2_744 = 0x38b66f98_b076d64f_59639d9d_b0ccd471_9ca54469_d9422c90_5dc1855b_1b224df9
    assert( ((inv_2_744 * (2**744)) % p) == 1)

    v = (v * inv_2_744) % p
    print("after inv2  ",v)

    print("sign f is ", sign(f))
    v = (sign(f) * v) % p

    assert(v * x % p == 1)

    return v    


v = cpt_inv(x)
print("x is", x)
print("and its inverse in 25519 is")
print("v is",v)
print("The result is", (x * v) % p == 1)