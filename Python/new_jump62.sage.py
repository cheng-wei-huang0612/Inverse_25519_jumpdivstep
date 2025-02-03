

# This file was *autogenerated* from the file new_jump62.sage
from sage.all_cmdline import *   # import sage library

_sage_const_2 = Integer(2); _sage_const_255 = Integer(255); _sage_const_19 = Integer(19); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0); _sage_const_62 = Integer(62); _sage_const_12 = Integer(12); _sage_const_64 = Integer(64); _sage_const_6 = Integer(6); _sage_const_3 = Integer(3); _sage_const_744 = Integer(744)
p = _sage_const_2 **_sage_const_255  - _sage_const_19 ; 
assert(p.is_prime())
x = randint(_sage_const_1 ,p);


def jump62(delta, f0, g0):

    # ------------- 工具函式區 -------------
    # 2×2 矩陣乘 2×2 矩陣 (皆以二維串列表示)
    def mat2x2_mult(A, B):
        """
        A, B 為 2×2 串列，回傳 A*B (也是 2×2 串列)。
        """
        return [
            [
                A[_sage_const_0 ][_sage_const_0 ]*B[_sage_const_0 ][_sage_const_0 ] + A[_sage_const_0 ][_sage_const_1 ]*B[_sage_const_1 ][_sage_const_0 ],
                A[_sage_const_0 ][_sage_const_0 ]*B[_sage_const_0 ][_sage_const_1 ] + A[_sage_const_0 ][_sage_const_1 ]*B[_sage_const_1 ][_sage_const_1 ]
            ],
            [
                A[_sage_const_1 ][_sage_const_0 ]*B[_sage_const_0 ][_sage_const_0 ] + A[_sage_const_1 ][_sage_const_1 ]*B[_sage_const_1 ][_sage_const_0 ],
                A[_sage_const_1 ][_sage_const_0 ]*B[_sage_const_0 ][_sage_const_1 ] + A[_sage_const_1 ][_sage_const_1 ]*B[_sage_const_1 ][_sage_const_1 ]
            ]
        ]
    
    # 2×2 矩陣乘向量 (vector) (皆以串列表示)
    def mat2x2_vec_mult(A, v):
        """
        A 為 2×2 串列，v 為長度 2 的一維串列 [v0, v1]。
        回傳 A*v (結果也是一個長度 2 的串列)。
        """
        return [
            A[_sage_const_0 ][_sage_const_0 ]*v[_sage_const_0 ] + A[_sage_const_0 ][_sage_const_1 ]*v[_sage_const_1 ],
            A[_sage_const_1 ][_sage_const_0 ]*v[_sage_const_0 ] + A[_sage_const_1 ][_sage_const_1 ]*v[_sage_const_1 ]
        ]
    
    # 二維串列的 2×2 單位矩陣
    I2 = [[_sage_const_1 , _sage_const_0 ], [_sage_const_0 , _sage_const_1 ]]
    
    # ------------- 主邏輯開始 -------------
    
    jump_length = _sage_const_62 
    f0_copy = f0
    g0_copy = g0
    
    # 暫存每次迴圈得到的 2×2 矩陣
    T_list_2d = []
    
    for _ in range(jump_length):
        # ---- (1) 遮罩 (mask) 與 scale 計算 (類似 generate_scaled_T_n) ----
        g_and_1 = g0 & _sage_const_1 
        mask = int(delta > _sage_const_0 ) & g_and_1
        scale = (_sage_const_1  - delta)*mask + (_sage_const_1  + delta)*(_sage_const_1  - mask)
        
        # M1, M2 以二維串列定義
        M1 = [[_sage_const_0 , _sage_const_2 ],
              [-_sage_const_1 , _sage_const_1 ]]
        M2 = [[_sage_const_2 , _sage_const_0 ],
              [g_and_1, _sage_const_1 ]]
        
        # 依 mask 合成最終 2×2 矩陣
        T_temp_2d = [
            [
                M1[_sage_const_0 ][_sage_const_0 ]*mask + M2[_sage_const_0 ][_sage_const_0 ]*(_sage_const_1  - mask),
                M1[_sage_const_0 ][_sage_const_1 ]*mask + M2[_sage_const_0 ][_sage_const_1 ]*(_sage_const_1  - mask)
            ],
            [
                M1[_sage_const_1 ][_sage_const_0 ]*mask + M2[_sage_const_1 ][_sage_const_0 ]*(_sage_const_1  - mask),
                M1[_sage_const_1 ][_sage_const_1 ]*mask + M2[_sage_const_1 ][_sage_const_1 ]*(_sage_const_1  - mask)
            ]
        ]
        
        # 取代原本的回傳： delta <-- scale, T <-- T_temp
        delta = scale
        
        # ---- (2) Update 邏輯 ----
        # 向量 [f0, g0] 經 T_temp_2d 乘法
        vec_new = mat2x2_vec_mult(T_temp_2d, [f0, g0])
        # 再右移 1 位 (整除 2)
        f0 = vec_new[_sage_const_0 ] >> _sage_const_1 
        g0 = vec_new[_sage_const_1 ] >> _sage_const_1 
        
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
    assert f1 == (result_vec[_sage_const_0 , _sage_const_0 ] >> jump_length)
    assert g1 == (result_vec[_sage_const_1 , _sage_const_0 ] >> jump_length)
    
    return delta, matrix(T_final_2d)

    





def cpt_inv(x):
    f = p; g = x; delta =_sage_const_1 
    assert(p == _sage_const_2 **_sage_const_255  - _sage_const_19 )


    T_list_12 = []

    for i in range(_sage_const_12 ):
        f0 = f % (_sage_const_2 **_sage_const_64 )
        g0 = g % (_sage_const_2 **_sage_const_64 )
        delta, T = jump62(delta, f0, g0)

        result = T * matrix([f,g]).T
        f = result[_sage_const_0 ,_sage_const_0 ]>>(_sage_const_62 )
        g = result[_sage_const_1 ,_sage_const_0 ]>>(_sage_const_62 )

        #print(f,g)
        T_list_12.append(T)


    



    for i in range(_sage_const_6 ):
        T_list_12[i] = T_list_12[_sage_const_2 *i+_sage_const_1 ] * T_list_12[_sage_const_2 *i]

    for i in range(_sage_const_3 ):
        T_list_12[i] = T_list_12[_sage_const_2 *i+_sage_const_1 ] * T_list_12[_sage_const_2 *i]

    master_T = T_list_12[_sage_const_2 ] * T_list_12[_sage_const_1 ] * T_list_12[_sage_const_0 ]
    #master_T = T_list_12[11] *  T_list_12[10] *  T_list_12[9] * T_list_12[8] *  T_list_12[7] *  T_list_12[6] * T_list_12[5] *  T_list_12[4] *  T_list_12[3] * T_list_12[2] *  T_list_12[1] *  T_list_12[0]

    
    R = IntegerModRing(p)
    v = R(master_T[_sage_const_0 ,_sage_const_1 ])
    v = v * R(_sage_const_2 **(-_sage_const_744 ))
    #print(v)
    assert(v * x * sign(f) == _sage_const_1 )

    return v    


v = cpt_inv(x)
print(x)
print("and its inverse in 25519 is")
print(v)

