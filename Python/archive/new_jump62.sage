p = 2^255 - 19; 
assert(p.is_prime())
x = randint(1,p);


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
    f0_copy = f0
    g0_copy = g0
    
    # 暫存每次迴圈得到的 2×2 矩陣
    T_list_2d = []
    
    for _ in range(jump_length):
        # ---- (1) 遮罩 (mask) 與 scale 計算 (類似 generate_scaled_T_n) ----
        g_and_1 = g0 & 1
        mask = int(delta > 0) & g_and_1
        scale = (1 - delta)*mask + (1 + delta)*(1 - mask)
        
        # M1, M2 以二維串列定義
        M1 = [[0, 2],
              [-1, 1]]
        M2 = [[2, 0],
              [g_and_1, 1]]
        
        # 依 mask 合成最終 2×2 矩陣
        T_temp_2d = [
            [
                M1[0][0]*mask + M2[0][0]*(1 - mask),
                M1[0][1]*mask + M2[0][1]*(1 - mask)
            ],
            [
                M1[1][0]*mask + M2[1][0]*(1 - mask),
                M1[1][1]*mask + M2[1][1]*(1 - mask)
            ]
        ]
        
        # 取代原本的回傳： delta <-- scale, T <-- T_temp
        delta = scale
        
        # ---- (2) Update 邏輯 ----
        # 向量 [f0, g0] 經 T_temp_2d 乘法
        vec_new = mat2x2_vec_mult(T_temp_2d, [f0, g0])
        # 再右移 1 位 (整除 2)
        f0 = vec_new[0] >> 1
        g0 = vec_new[1] >> 1
        
        # 收集每次的 2×2 矩陣，用於最後累積乘
        T_list_2d.append(T_temp_2d)
    
    # ---- (3) 將所有 T_list_2d 乘在一起，得到最終 T_final_2d ----
    T_final_2d = I2  # 從單位矩陣開始
    for T2d in T_list_2d:
        # 依原程式邏輯 (左乘)
        T_final_2d = mat2x2_mult(T2d, T_final_2d)
    
    # ---- (4) 驗證 (檢查) ----
    # 先記錄 f1, g1
    f1, g1 = f0, g0
    
    # 還原 f0, g0
    f0, g0 = f0_copy, g0_copy
    
    # 這裡為了方便，暫時轉成 Sage matrix 做驗證。若要全程不用 Sage，也可以再寫一個
    # mat2x2_vec_mult() 來比對。
    T_final_sage = matrix(T_final_2d)
    result_vec = T_final_sage * (matrix([f0, g0]).T)
    
    # 驗證
    assert f1 == (result_vec[0, 0] >> jump_length)
    assert g1 == (result_vec[1, 0] >> jump_length)
    
    return delta, matrix(T_final_2d)

    





def cpt_inv(x):
    f = p; g = x; delta =1
    assert(p == 2^255 - 19)


    T_list_12 = []

    for i in range(12):
        f0 = f % (2^64)
        g0 = g % (2^64)
        delta, T = jump62(delta, f0, g0)

        result = T * matrix([f,g]).T
        f = result[0,0]>>(62)
        g = result[1,0]>>(62)

        #print(f,g)
        T_list_12.append(T)


    



    for i in range(6):
        T_list_12[i] = T_list_12[2*i+1] * T_list_12[2*i]

    for i in range(3):
        T_list_12[i] = T_list_12[2*i+1] * T_list_12[2*i]

    master_T = T_list_12[2] * T_list_12[1] * T_list_12[0]
    #master_T = T_list_12[11] *  T_list_12[10] *  T_list_12[9] * T_list_12[8] *  T_list_12[7] *  T_list_12[6] * T_list_12[5] *  T_list_12[4] *  T_list_12[3] * T_list_12[2] *  T_list_12[1] *  T_list_12[0]

    
    R = IntegerModRing(p)
    v = R(master_T[0,1])
    v = v * R(2^(-744))
    #print(v)
    assert(v * x * sign(f) == 1)

    return v    


v = cpt_inv(x)
print(x)
print("and its inverse in 25519 is")
print(v)