#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "cint_types.h"
#include "cint_arith.h"


int256_t p = { 0xffffffffffffffed, 0xffffffffffffffff, 0xffffffffffffffff, 0x7fffffffffffffff };
uint256_t inv_2_744 = {0x5dc1855b1b224df9, 0x9ca54469d9422c90, 0x59639d9db0ccd471, 0x38b66f98b076d64f};

void int256_adds_int256(int256_t *A, int256_t *B, int256_t *R) {
    __int128_t sum;
    uint64_t carry = 0;  // 進位應該是無號數，確保只會是 0 或 1

    sum = (__int128_t)A->v[0] + (__int128_t)B->v[0];
    carry = (uint64_t)(sum >> 64);  // 取高 64-bit 作為 carry
    R->v[0] = (uint64_t)sum;

    for (size_t i = 1; i < 3; i++) {  // 只跑到 v[2]
        sum = (__int128_t)A->v[i] + (__int128_t)B->v[i] + carry;
        carry = (uint64_t)(sum >> 64);
        R->v[i] = (uint64_t)sum;
    }

    // 最高 limb
    sum = (__int128_t)A->v[3] + (__int128_t)B->v[3] + carry;
    R->v[3] = (uint64_t)sum;

}

void int320_adds_int320(int320_t *A, int320_t *B, int320_t *R) {
    __int128_t sum;
    uint64_t carry = 0;  // 進位應該是無號數，確保只會是 0 或 1

    sum = (__int128_t)A->v[0] + (__int128_t)B->v[0];
    carry = (uint64_t)(sum >> 64);  // 取高 64-bit 作為 carry
    R->v[0] = (uint64_t)sum;

    for (size_t i = 1; i < 4; i++) {  // 只跑到 v[3]
        sum = (__int128_t)A->v[i] + (__int128_t)B->v[i] + carry;
        carry = (uint64_t)(sum >> 64);
        R->v[i] = (uint64_t)sum;
    }

    // 最高 limb
    sum = (__int128_t)A->v[4] + (__int128_t)B->v[4] + carry;
    R->v[4] = (uint64_t)sum;

    uint64_t overflow = (uint64_t)(sum >> 64);
    if (overflow != 0) {
    printf("Overflow detected!\n");
    }

}

void uint256_adds_uint256(uint256_t *A, uint256_t *B, uint256_t *R ){
    __int128_t sum;
    uint64_t carry = 0;  // 進位應該是無號數，確保只會是 0 或 1

    sum = (__int128_t)A->v[0] + (__int128_t)B->v[0];
    carry = (uint64_t)(sum >> 64);  // 取高 64-bit 作為 carry
    R->v[0] = (uint64_t)sum;

    for (size_t i = 1; i < 3; i++) {  // 只跑到 v[2]
        sum = (__int128_t)A->v[i] + (__int128_t)B->v[i] + carry;
        carry = (uint64_t)(sum >> 64);
        R->v[i] = (uint64_t)sum;
    }

    // 最高 limb
    sum = (__int128_t)A->v[3] + (__int128_t)B->v[3] + carry;
    R->v[3] = (uint64_t)sum;

    uint64_t overflow = (uint64_t)(sum >> 64);
    if (overflow != 0) {
    printf("Overflow detected!\n");
    }
}


void uint256_mul_mod_p(const uint256_t *A, const uint256_t *B, uint256_t *R)
{
    // --------------------------------------------------------
    // (1) 先做 256×256 => 512 bits 的乘法
    //     暫存在 temp_R[0..7]（每個 limb 64 bits）
    // --------------------------------------------------------
    uint64_t temp_R[8];
    memset(temp_R, 0, sizeof(temp_R));

    // 最簡單的 schoolbook multiplication
    for (int i = 0; i < 4; i++) {
        __uint128_t carry = 0;
        for (int j = 0; j < 4; j++) {
            __uint128_t product =
                (__uint128_t)A->v[i] *
                (__uint128_t)B->v[j] +
                (__uint128_t)temp_R[i + j] +
                carry;

            temp_R[i + j] = (uint64_t)product;       // 低 64 bits
            carry         = (uint64_t)(product >> 64); // 高 64 bits 當進位
        }
        // 最後的 carry 加到 temp_R[i+4]
        temp_R[i + 4] += (uint64_t)carry;
    }

    // 你的指定：p = 2^255 - 19
    // 想做下面步驟來達成 mod p
    // --------------------------------------------------------
    // (2) 把 temp_R[4..7] 四個 limb 各乘以 38，累加到 temp_1[0..4]
    // --------------------------------------------------------
    //   (理由：將超過 2^256(其實是超過 2^255) 的部分折回加到低位，
    //    每 1 => + (2^255) mod p = +19 但作者自訂 ~ 38 的處理方法)
    //   依你的敘述：temp_1[5] 的長度，留意可能進位
    // --------------------------------------------------------
    uint64_t temp_1[5];
    memset(temp_1, 0, sizeof(temp_1));

    {
        __uint128_t carry = 0;
        // 乘 38 並放到 temp_1，index 對應 i-4
        for (int i = 4; i < 8; i++) {
            __uint128_t mulval = (__uint128_t)temp_R[i] * 38 + carry;
            temp_1[i - 4] = (uint64_t)mulval;
            carry         = (uint64_t)(mulval >> 64);

            // 清空 temp_R[4 - 7]
            temp_R[i] = 0;
        }
      
        temp_1[4] = (uint64_t)carry;
      
    }

    // --------------------------------------------------------
    // (3) 取 temp_R[3] 的 MSB (bit #255)，乘以 19 存入 temp2，並清除此 bit
    // --------------------------------------------------------
    //   - limb #3 covers bits [192..255].
    //   - 最高 bit => (temp_R[3] >> 63)
    //   - 只會是 0 或 1
    // --------------------------------------------------------
    uint64_t msb_255 = temp_R[3] >> 63;            // 取最高 bit
    temp_R[3]       &= 0x7FFFFFFFFFFFFFFFULL;      // 清掉該最高 bit
    uint64_t temp2   = msb_255 * 19ULL;            // 該 bit *19 => 一個 64-bit 整數

    // --------------------------------------------------------
    // (4) temp_R = temp_R + temp_1 + temp2
    //     (逐 limb 累加, 注意進位)
    // --------------------------------------------------------
    {
        // 先加 temp_1 => temp_R
        __uint128_t carry = 0;
        int i = 0;
        // 先加前5 limb (temp_1[0..4]) 對應 temp_R[0..4]
        //   temp_R[4] 已經被清空，可放心使用。
        //   這裡是依你指示： temp_R[0..7], temp_1[0..4]
        for (; i < 5; i++) {
            __uint128_t s = (__uint128_t)temp_R[i]
                          + (__uint128_t)temp_1[i]
                          + carry;
            temp_R[i] = (uint64_t)s;
            carry     = (uint64_t)(s >> 64);
        }
        // 再把 carry 加到 temp_R[5]

        __uint128_t s = (__uint128_t)temp_R[4] + carry;
        temp_R[4] = (uint64_t)s;
        carry     = (uint64_t)(s >> 64);

        // carry 之後若還有，也溢出 256+ 位
    }

    {
        // 再加上 temp2 => 加到 temp_R[0]
        //   (你描述是 "temp_R = temp_R + temp_2")
        //   通常也要 propagate carry
        __uint128_t s = ( __uint128_t )temp_R[0] + temp2;
        temp_R[0] = (uint64_t)s;
        uint64_t carry = (uint64_t)(s >> 64);

        // carry往上加
        for (int i = 1; i < 5; i++) {
            __uint128_t s2 = ( __uint128_t )temp_R[i] + carry;
            temp_R[i] = (uint64_t)s2;
            carry     = (uint64_t)(s2 >> 64);
        }
    }

    // --------------------------------------------------------
    // (5) 你要求「for i in range(2): ... 重複一次類似 reduce」
    //     內容：
    //     - 把 temp_R[4] 乘以 38 => 存到 temp_1[2]
    //     - 取 temp_R[3] 的 MSB 乘19 => temp2，清此 bit
    //     - 再把 temp_1, temp2 加回 temp_R
    //   寫成小迴圈做兩次
    // --------------------------------------------------------
    for (int round = 0; round < 2; round++) {
        // a) temp_R[4] * 38 => 可能 128-bit, 我們存到temp_1[0..1]
        //   (你提到 "uint64_t temp_1[2]" ，這裡直接重用一個小陣列即可)
        uint64_t small_1[2];
        {
            __uint128_t val = (__uint128_t)temp_R[4] * 38ULL;
            small_1[0] = (uint64_t)val;
            small_1[1] = (uint64_t)(val >> 64);
        }

        // b) 取temp_R[3]最高bit(第255 bit) *19 => temp2，並清除此bit
        {
            uint64_t msb = temp_R[3] >> 63;           // 0 or 1
            temp_R[3]   &= 0x7FFFFFFFFFFFFFFFULL;     // 清掉
            uint64_t t2  = msb * 19ULL;

            // c) temp_R = temp_R + small_1 + t2
            //    先加 small_1 => temp_R[4..5], 低位對應 temp_R[4], carry
            {
                __uint128_t s = (__uint128_t)temp_R[0] + small_1[0];
                temp_R[0] = (uint64_t)s;
                uint64_t carry = (uint64_t)(s >> 64);

                s = (__uint128_t)temp_R[1] + small_1[1] + carry;
                temp_R[1] = (uint64_t)s;
                carry = (uint64_t)(s >> 64);

                // 如果 carry 還有，就繼續加到 temp_R[4]

                for (int i = 2; i < 5; i++) {
                    __uint128_t s2 = (__uint128_t)temp_R[i] + carry;
                    temp_R[i] = (uint64_t)s2;
                    carry = (uint64_t)(s2 >> 64);
                }
            }

            // 再加 t2 => temp_R[0]
            {
                __uint128_t s = (__uint128_t)temp_R[0] + t2;
                temp_R[0] = (uint64_t)s;
                uint64_t carry = (uint64_t)(s >> 64);

                // propagate carry if needed
                for (int i = 1; i < 5; i++) {
                    __uint128_t s2 = (__uint128_t)temp_R[i] + carry;
                    temp_R[i] = (uint64_t)s2;
                    carry = (uint64_t)(s2 >> 64);
                }
            }
        }
    }


    uint256_t return_R;
    uint256_t return_R_19;
    for (int i = 0; i < 4; i++) {
        return_R.v[i] = temp_R[i];
    }

    uint256_t NINETEEN;
    NINETEEN.v[0] = (uint64_t)19;
    NINETEEN.v[1] = 0;
    NINETEEN.v[2] = 0;
    NINETEEN.v[3] = 0;

    uint256_adds_uint256(&return_R, &NINETEEN, &return_R_19);
    int64_t mask = - ( return_R_19.v[3] >> 63);
    // if mask = 1...1 then return_R += 2^255 + 19 (this is equivalent to mod p)
    NINETEEN.v[0] = ((uint64_t)19) & mask;
    NINETEEN.v[3] = ((uint64_t)1<<63) & mask ;

    uint256_adds_uint256(&return_R, &NINETEEN, &return_R);





    // --------------------------------------------------------
    // 最終結果：temp_R[0..3] 才是 256 bits 範圍
    //           把它存回 R->v[0..3]
    // --------------------------------------------------------
    for (int i = 0; i < 4; i++) {
        R->v[i] = return_R.v[i];
    }

    // 此時 R 已被視為「mod (2^255 - 19)」下的結果。
    // 若還想確保完全 < p，可以再做一次 "若 >= p 則 -p" 的最終比較。
    // 但通常 curve25519 field element 允許最後再一次 carry propagate。
}



void matrix_int64_t_mul(matrix_int64_t *A, matrix_int64_t *B, matrix_int128_t *R){
    int128_t M1;
    int128_t M2;
    int128_t M3;
    int128_t M4;
    int128_t M5;
    int128_t M6;
    int128_t M7;
    int128_t M8;

    // [[ M1 + M2, M3 + M4  ],
    //  [ M5 + M6, M7 + M8  ]]
    //
    // [[ A[0][0] * B[0][0] + A[0][1] * B[1][0],   A[0][0] * B[0][1] + A[0][1] * B[1][1] ]
    //  [ A[1][0] * B[0][0] + A[1][1] * B[1][0],   A[1][0] * B[0][1] + A[1][1] * B[1][1] ]]
    //

    if (A->v[0][0] == 0x4000000000000000 && A->v[0][1] == 0x0000000000000000 &&
        A->v[1][0] == 0x3fffffffffffffff && A->v[1][1] == 0x0000000000000001 &&
        B->v[0][0] == 0x0000000000000000 && B->v[0][1] == 0x0080000000000000 &&
        B->v[1][0] == 0xffffffffffffff80 && B->v[1][1] == 0x007fffffffffffff) {
        
        printf("Matrix A:\n");
        printf("[[%016llx, %016llx],\n", (unsigned long long)A->v[0][0], (unsigned long long)A->v[0][1]);
        printf(" [%016llx, %016llx]]\n", (unsigned long long)A->v[1][0], (unsigned long long)A->v[1][1]);

        printf("Matrix B:\n");
        printf("[[%016llx, %016llx],\n", (unsigned long long)B->v[0][0], (unsigned long long)B->v[0][1]);
        printf(" [%016llx, %016llx]]\n", (unsigned long long)B->v[1][0], (unsigned long long)B->v[1][1]);
    }
    

    int64_times_int64(&(A->v[0][0]), &(B->v[0][0]), &M1);
    int64_times_int64(&(A->v[0][1]), &(B->v[1][0]), &M2);
    int64_times_int64(&(A->v[0][0]), &(B->v[0][1]), &M3);
    int64_times_int64(&(A->v[0][1]), &(B->v[1][1]), &M4);
    int64_times_int64(&(A->v[1][0]), &(B->v[0][0]), &M5);
    int64_times_int64(&(A->v[1][1]), &(B->v[1][0]), &M6);
    int64_times_int64(&(A->v[1][0]), &(B->v[0][1]), &M7);
    int64_times_int64(&(A->v[1][1]), &(B->v[1][1]), &M8);




    int128_adds_int128(&M1, &M2, &(R->v[0][0]));
    int128_adds_int128(&M3, &M4, &(R->v[0][1]));
    int128_adds_int128(&M5, &M6, &(R->v[1][0]));
    int128_adds_int128(&M7, &M8, &(R->v[1][1]));

}

void matrix_int128_t_mul(matrix_int128_t *A, matrix_int128_t *B, matrix_int256_t *R){
    int256_t M1;
    int256_t M2;
    int256_t M3;
    int256_t M4;
    int256_t M5;
    int256_t M6;
    int256_t M7;
    int256_t M8;

    // [[ M1 + M2, M3 + M4  ],
    //  [ M5 + M6, M7 + M8  ]]
    //
    // [[ A[0][0] * B[0][0] + A[0][1] * B[1][0],   A[0][0] * B[0][1] + A[0][1] * B[1][1] ]
    //  [ A[1][0] * B[0][0] + A[1][1] * B[1][0],   A[1][0] * B[0][1] + A[1][1] * B[1][1] ]]
    //
    

    int128_times_int128(&(A->v[0][0]), &(B->v[0][0]), &M1);
    int128_times_int128(&(A->v[0][1]), &(B->v[1][0]), &M2);
    int128_times_int128(&(A->v[0][0]), &(B->v[0][1]), &M3);
    int128_times_int128(&(A->v[0][1]), &(B->v[1][1]), &M4);
    int128_times_int128(&(A->v[1][0]), &(B->v[0][0]), &M5);
    int128_times_int128(&(A->v[1][1]), &(B->v[1][0]), &M6);
    int128_times_int128(&(A->v[1][0]), &(B->v[0][1]), &M7);
    int128_times_int128(&(A->v[1][1]), &(B->v[1][1]), &M8);

    int256_adds_int256(&M1, &M2, &(R->v[0][0]));
    int256_adds_int256(&M3, &M4, &(R->v[0][1]));
    int256_adds_int256(&M5, &M6, &(R->v[1][0]));
    int256_adds_int256(&M7, &M8, &(R->v[1][1]));
    
}

void print_int256_bin(const int256_t *X)
{
    // 從最高 limb v[3] 的 bit 63 開始，到最低 limb v[0] 的 bit 0
    for (int i = 3; i >= 0; i--) {
        for (int b = 63; b >= 0; b--) {
            uint64_t mask = (uint64_t)1 << b;
            uint64_t bit  = (X->v[i] & mask) ? 1 : 0;
            printf("%llu", (unsigned long long)bit);
        }
    }
}


/**
 * 以無號方式，將 256-bit 數字轉成十進位並印出。
 *
 * 基本流程:
 *   1. 複製 X => tmp
 *   2. 用長除法 (除以 10) 反覆取得餘數 remainder，作為十進位數字。
 *   3. 直到 tmp == 0 為止，將每個 remainder 轉成字元 (0~9)，逆序排列。
 *   4. 如果最後都沒有進迴圈，表示原數=0，直接印 "0"。
 *
 * 注意: 這裡把 256-bit 視為無號。如果需要有號，請自行檢查最高 bit，
 *       若為 1 表示負數 => 先取二補數 => 加個 '-'。
 */
static bool int256_is_zero(const int256_t *X)
{
    return (X->v[0] == 0 && X->v[1] == 0 && X->v[2] == 0 && X->v[3] == 0);
}

/**
 * 對 256-bit (tmp) 做 "tmp = tmp / 10" (無號), 並回傳 remainder。
 * 這是多精度除法的一段：把 v[3..0] 當作一個大數，不斷地 /10。
 */
static uint64_t int256_div10(int256_t *tmp)
{
    // 參考多精度除法：先從最高 limb 開始，將"餘數"帶到下一 limb
    // remainder 最高可能到 9，所以可以放在 64-bit 變數中
    uint64_t remainder = 0;

    for (int i = 3; i >= 0; i--) {
        // 先把當前 limb 加上前一次的 remainder
        // remainder * 2^64 + tmp->v[i]
        __uint128_t cur = ( (__uint128_t) remainder << 64 ) + tmp->v[i];

        // 商
        __uint128_t quotient = cur / 10;
        // 餘數
        remainder = (uint64_t)(cur % 10);

        // 更新 tmp->v[i]
        tmp->v[i] = (uint64_t)quotient;
    }
    return remainder;
}

void print_int256_dec(const int256_t *X)
{
    // 先檢查是否 X == 0
    if (int256_is_zero(X)) {
        printf("0");
        return;
    }

    // 複製一份，準備做重複 /10 以取得十進位數字
    int256_t tmp = *X;  // 拷貝

    // 這裡只示範「無號」
    // 如果需要「有號」，請先檢查最高 bit => 若為 1, 取二補數，然後印 '-'

    char buf[128];  
    int pos = sizeof(buf) - 1;
    buf[pos] = '\0';

    // 不斷除以 10，直到 tmp == 0
    while (!int256_is_zero(&tmp)) {
        uint64_t r = int256_div10(&tmp);
        buf[--pos] = (char)('0' + r);
    }

    // 最後從 buf[pos] 開始印到結尾
    printf("%s", &buf[pos]);
}


void jump62(int16_t *delta, int64_t f0, int64_t g0, matrix_int64_t* T_ptr){

    T_ptr->v[0][0] = 1;
    T_ptr->v[0][1] = 0;
    T_ptr->v[1][0] = 0;
    T_ptr->v[1][1] = 1;

    printf("f0 = %lld, g0 = %lld\n", f0, g0);

    for (size_t i = 0; i < 62; i++)
    {
        // Conditional swap

        int g0_and_1 = g0 & 1;
        int cond = 0;
        if ((*delta > 0) && (g0_and_1 == 1)) {
            cond = 1;
        }

        // // // int g0_and_1 = g0 & 1;
        // // // int cond = (1+( *delta >> 15 )) & g0_and_1;
                    // = [[ delta > 0 ]]
        // // // int64_t swap = - cond;
        // // // int64_t mask = (f0 ^ g0) & swap;
        // // // int64_t f0 = f0 ^ mask;
        // // // int64_t g0 = g0 ^ mask;

        // // // // if [[cond]] then g0 = -g0
        // // // // negation is: (g0 xor mask(cond)) + 1
        // // // g0 = g0 & swap;
        // // // g0 = g0 + (int64_t)cond;

        // // // *delta = *delta ^ ( (*delta ^ (- *delta)) & (int16_t)swap );

        if (cond) {
            int64_t tmp = f0;
            f0 = g0;
            g0 = -tmp;
            *delta = -(*delta);
        }
            
        // matrix generation in this step
        // Matrix product accumulation (conditional swap)
        // T = [[ 1-cond,   cond ]   * [[ T[0][0], T[0][1] ]
        //      [  -cond, 1-cond ]]     [ T[1][0], T[1][1] ]]
        int64_t mask;

        mask = - cond;
        int64_t neg_mask = - (1 - cond);

        int64_t T_new_0_0 =  (neg_mask & (T_ptr->v[0][0])) +     (mask & (T_ptr->v[1][0]));
        int64_t T_new_0_1 =  (neg_mask & (T_ptr->v[0][1])) +     (mask & (T_ptr->v[1][1]));
        int64_t T_new_1_0 =   (-(mask & (T_ptr->v[0][0]))) + (neg_mask & (T_ptr->v[1][0]));
        int64_t T_new_1_1 =   (-(mask & (T_ptr->v[0][1]))) + (neg_mask & (T_ptr->v[1][1]));

        T_ptr->v[0][0] = T_new_0_0;
        T_ptr->v[0][1] = T_new_0_1;
        T_ptr->v[1][0] = T_new_1_0;
        T_ptr->v[1][1] = T_new_1_1;

        matrix_int64_t T = *T_ptr;
        printf("T = \n");
        printf("[[%lld, %lld],\n", T.v[0][0], T.v[0][1]);
        printf(" [%lld, %lld]]\n", T.v[1][0], T.v[1][1]);


        // Elimination
        *delta += 1;
        mask = - g0_and_1;
        g0 = (g0 + (mask & f0)) >> 1;

        // Matrix product accumulation (elimination)
        // T = [[        2,   0 ]   * [[ T[0][0], T[0][1] ]
        //      [ g0_and_1,   1 ]]     [ T[1][0], T[1][1] ]]
        // T = [[                  2 * T[0][0],                  2 * T[0][1] ]
        //      [ T[1][0] + g0_and_1 * T[0][0], T[1][1] + g0_and_1 * T[0][1] ]]

        T_ptr->v[1][0] += mask & (T_ptr->v[0][0]);
        T_ptr->v[1][1] += mask & (T_ptr->v[0][1]);
        T_ptr->v[0][0] = (T_ptr->v[0][0]) << 1;
        T_ptr->v[0][1] = (T_ptr->v[0][1]) << 1;


        printf("delta = %d\n", *delta);
        printf("f0 = %lld, g0 = %lld\n", f0, g0);
        printf("\n");



    }



    
}
    


int256_t cpt_inv(int256_t x){
    int256_t f = p;
    int256_t g = x;
    int16_t delta = 1;
    matrix_int64_t T[12];
    matrix_int128_t T_128[6];
    matrix_int256_t T_256[3];

    for (size_t i = 0; i < (12); i++)
    {


        int64_t f0 = (f.v[0] << 1)>>1;
        int64_t g0 = g.v[0];



        // jump62
        matrix_int64_t* T_ptr = &T[i];
        jump62(&delta, f0, g0, T_ptr);

        printf("T[%zu] = \n", i);
        printf("[[%lld, %lld],\n", T[i].v[0][0], T[i].v[0][1]);
        printf(" [%lld, %lld]]\n", T[i].v[1][0], T[i].v[1][1]);

        // result = matrix(T) * matrix([f,g]).T
        // [[ result_f ]   =  [[ T[0][0], T[0][1] ]    *    [[ f ]    
        //  [ result_g ]]      [ T[1][0], T[1][1] ]]         [ g ]] 
        // after this we shift >> 62 (jump_length)
        //
        // result_f = T[0][0] * f + T[0][1] * g  
        // result_g = T[1][0] * f + T[1][1] * g
        //           | Tf        | | Tg        |
        



        // T [f0,g0]^t  = [f1,g1]^t


        int320_t Tf; 
        int320_t Tg; 
        int320_t result_f; 
        int320_t result_g; 
        int64_times_int256(&(T[i].v[0][0]), &f, &Tf);
        int64_times_int256(&(T[i].v[0][1]), &g, &Tg);
        int320_adds_int320(&Tf, &Tg, &result_f);
        
        uint64_t mask = ((uint64_t)1 << 63) - 1; // 00111...111
        result_f.v[0] = result_f.v[0] >> 62;
        result_f.v[0] += ((result_f.v[1] & mask) << 2);
        result_f.v[1] = result_f.v[1] >> 62;
        result_f.v[1] += ((result_f.v[2] & mask) << 2);
        result_f.v[2] = result_f.v[2] >> 62;
        result_f.v[2] += ((result_f.v[3] & mask) << 2);
        result_f.v[3] = result_f.v[3] >> 62;
        result_f.v[3] += ((result_f.v[4] & mask) << 2);


        int64_times_int256(&(T[i].v[1][0]), &f, &Tf);
        int64_times_int256(&(T[i].v[1][1]), &g, &Tg);
        int320_adds_int320(&Tf, &Tg, &result_g);
        
        // uint64_t mask = (1 << 63) - 1; // 00111...111
        result_g.v[0] = result_g.v[0] >> 62;
        result_g.v[0] += ((result_g.v[1] & mask) << 2);
        result_g.v[1] = result_g.v[1] >> 62;
        result_g.v[1] += ((result_g.v[2] & mask) << 2);
        result_g.v[2] = result_g.v[2] >> 62;
        result_g.v[2] += ((result_g.v[3] & mask) << 2);
        result_g.v[3] = result_g.v[3] >> 62;
        result_g.v[3] += ((result_g.v[4] & mask) << 2);

        // f = result_f
        // g = result_g

        f.v[0] = result_f.v[0];
        f.v[1] = result_f.v[1];
        f.v[2] = result_f.v[2];
        f.v[3] = result_f.v[3];

        g.v[0] = result_g.v[0];
        g.v[1] = result_g.v[1];
        g.v[2] = result_g.v[2];
        g.v[3] = result_g.v[3];

        printf("\n  f = %016llx_%016llx_%016llx_%016llx\n", 
        (unsigned long long)f.v[3],
        (unsigned long long)f.v[2],
        (unsigned long long)f.v[1],
        (unsigned long long)f.v[0]
        );

        printf("    = ");
        print_int256_dec(&f);

        printf("\n");

        printf("\n  g = %016llx_%016llx_%016llx_%016llx\n", 
        (unsigned long long)g.v[3],
        (unsigned long long)g.v[2],
        (unsigned long long)g.v[1],
        (unsigned long long)g.v[0]
        );
        
        printf("    = ");
        print_int256_dec(&g);
        printf("\n");

    }


    for (size_t i = 0; i < 12; i++) {
        if (i != 4 && i != 5) continue;
        printf("T[%zu] = \n", i);
        printf("[[%016llx, %016llx],\n", T[i].v[0][0], T[i].v[0][1]);
        printf(" [%016llx, %016llx]]\n", T[i].v[1][0], T[i].v[1][1]);
    }


    for (size_t i = 0; i < 6; i++)
    {
        matrix_int64_t_mul(&(T[2*i+1]), &(T[2*i+0]), &(T_128[i]));
    }


    for (size_t i = 0; i < 6; i++) {
        if (i != 2) continue;
        printf("T_128[%zu] = \n", i);
        printf("[[%016llx_%016llx, %016llx_%016llx],\n", 
            (unsigned long long)(T_128[i].v[0][0].v[1]), 
            (unsigned long long)(T_128[i].v[0][0].v[0]), 
            (unsigned long long)(T_128[i].v[0][1].v[1]), 
            (unsigned long long)(T_128[i].v[0][1].v[0]));
        printf(" [%016llx_%016llx, %016llx_%016llx]]\n", 
            (unsigned long long)(T_128[i].v[1][0].v[1]), 
            (unsigned long long)(T_128[i].v[1][0].v[0]), 
            (unsigned long long)(T_128[i].v[1][1].v[1]), 
            (unsigned long long)(T_128[i].v[1][1].v[0]));
    }
    
    for (size_t i = 0; i < 3; i++)
    {
        matrix_int128_t_mul(&(T_128[2*i+1]), &(T_128[2*i+0]), &(T_256[i]));
    }






    
    uint256_t T200;
    uint256_t T201;
    uint256_t T100;
    uint256_t T101;
    uint256_t T110;
    uint256_t T111;
    uint256_t T001;
    uint256_t T011;

    int256_t temp;
    // T_256[2].v[0][0] is int256 but with range of singed 252 bits
    int256_adds_int256(&(T_256[2].v[0][0]), &p, &(temp));
    // convert temp as uint256_t and store it into T200
    for (size_t i = 0; i < 4; i++){
        T200.v[i] = temp.v[i];
    }
    int256_adds_int256(&(T_256[2].v[0][1]), &p, &(temp));
    // convert temp as uint256_t and store it into T200
    for (size_t i = 0; i < 4; i++){
        T201.v[i] = temp.v[i];
    }

    int256_adds_int256(&(T_256[1].v[0][0]), &p, &(temp));
    // convert temp as uint256_t and store it into T200
    for (size_t i = 0; i < 4; i++){
        T100.v[i] = temp.v[i];
    }
    int256_adds_int256(&(T_256[1].v[0][1]), &p, &(temp));
    // convert temp as uint256_t and store it into T200
    for (size_t i = 0; i < 4; i++){
        T101.v[i] = temp.v[i];
    }
    int256_adds_int256(&(T_256[1].v[1][0]), &p, &(temp));
    // convert temp as uint256_t and store it into T200
    for (size_t i = 0; i < 4; i++){
        T110.v[i] = temp.v[i];
    }
    int256_adds_int256(&(T_256[1].v[1][1]), &p, &(temp));
    // convert temp as uint256_t and store it into T200
    for (size_t i = 0; i < 4; i++){
        T111.v[i] = temp.v[i];
    }
    int256_adds_int256(&(T_256[0].v[0][1]), &p, &(temp));
    // convert temp as uint256_t and store it into T200
    for (size_t i = 0; i < 4; i++){
        T001.v[i] = temp.v[i];
    }
    int256_adds_int256(&(T_256[0].v[1][1]), &p, &(temp));
    // convert temp as uint256_t and store it into T200
    for (size_t i = 0; i < 4; i++){
        T011.v[i] = temp.v[i];
    }

    uint256_t a;
    uint256_t b;
    uint256_t c;
    uint256_t d;

    uint256_mul_mod_p(&T100, &T001, &a);
    uint256_mul_mod_p(&T101, &T011, &b);
    uint256_mul_mod_p(&T110, &T001, &c);
    uint256_mul_mod_p(&T111, &T011, &d);

    uint256_t a_plus_b;
    uint256_t c_plus_d;
    uint256_t aa;
    uint256_t bb;

    uint256_adds_uint256(&a, &b, &a_plus_b);
    uint256_adds_uint256(&c, &d, &c_plus_d);


    uint256_mul_mod_p(&T200, &a_plus_b, &aa);
    uint256_mul_mod_p(&T201, &c_plus_d, &bb);

    uint256_t temp1;
    uint256_adds_uint256(&aa, &bb, &temp1);

    int64_t mask = - (temp1.v[3] << 63);

    temp1.v[3] += (mask & ((uint64_t)1 << 63));
    uint256_t NINETEEN;
    NINETEEN.v[0] = 19 & mask;
    for (size_t i = 1; i < 4; i++)
    {
        NINETEEN.v[i] = 0;
    }

    uint256_t temp2;
    uint256_adds_uint256(&temp1, &NINETEEN, &temp2);

    // it is possible that temp2 consists of a multiple of p, like 2^255-1
    uint256_t temp2_19;
    NINETEEN.v[0] = 19;
    uint256_adds_uint256(&temp2, &NINETEEN, &temp2_19);

    int64_t reduction_mask = -(int64_t)(temp2_19.v[3] >> 63);

    // if mask = 1...1 then return_R += 2^255 + 19 (this is equivalent to mod p)
    NINETEEN.v[0] = ((uint64_t)19) & reduction_mask;
    NINETEEN.v[3] = ((uint64_t)1<<63) & reduction_mask ;

    uint256_t temp3;
    uint256_adds_uint256(&temp2, &NINETEEN, &temp3);



    printf("before inv 2 = %016llx_%016llx_%016llx_%016llx\n", 
        (unsigned long long)temp3.v[3],
        (unsigned long long)temp3.v[2],
        (unsigned long long)temp3.v[1],
        (unsigned long long)temp3.v[0]
    );
    printf("            = ");
    print_int256_dec(&temp3);
    printf("\n");
    // Now do v = sign(f) * v * inv_2_744 % p
    // first we have to multiply temp3 and inv_2_744 mod p
    // temp3 and inv_2_744 are uint256_t
    uint256_t temp4;
    uint256_mul_mod_p(&temp3, &inv_2_744, &temp4);

    printf("after inv 2 = %016llx_%016llx_%016llx_%016llx\n", 
        (unsigned long long)temp4.v[3],
        (unsigned long long)temp4.v[2],
        (unsigned long long)temp4.v[1],
        (unsigned long long)temp4.v[0]
    );
    printf("            = ");
    print_int256_dec(&temp4);
    printf("\n");


    int64_t sign_f = (f.v[3] >> 63);
    // if sign_f == 1 then change sign of temp4, otherwise no change

    printf("sign(f) = %lld\n", sign_f);

    if (sign_f)
    {
        int64_t current_mask = (int64_t)(-1);
        for (size_t i = 0; i < 4; i++)
        {
            temp4.v[i] = temp4.v[i] ^ current_mask;
        }
        uint256_t ONE;
        ONE.v[0] = 1;
        ONE.v[1] = 0;
        ONE.v[2] = 0;
        ONE.v[3] = 0;
        uint256_t temp5;
        int256_adds_int256(&temp4, &ONE, &temp5);
        
        for (size_t i = 0; i < 4; i++)
        {
            temp4.v[i] = temp5.v[i];
        }
        
    }

    // return temp4:



    int256_t return_val;
    for (size_t i = 0; i < 4; i++)
    {
        return_val.v[i] = temp4.v[i];
    }
    return return_val;
}




int main(void)
{

    int256_t x = {{ 0x0000000000000001, 
                    0x0000000000000000,
                    0x0000000000000000,
                    0x0000000000000000 }};

    printf("We invert the number \n");
    printf("\n  x = %016llx_%016llx_%016llx_%016llx\n", 
        (unsigned long long)x.v[3],
        (unsigned long long)x.v[2],
        (unsigned long long)x.v[1],
        (unsigned long long)x.v[0]
    );
    printf("    = ");
    print_int256_dec(&x);
    printf("\n\n");
    printf("modulus the prime number \n");
    printf("\n  p = %016llx_%016llx_%016llx_%016llx\n", 
        (unsigned long long)p.v[3],
        (unsigned long long)p.v[2],
        (unsigned long long)p.v[1],
        (unsigned long long)p.v[0]
    );
    printf("    = ");
    print_int256_dec(&p);
    printf("\n\n");


    int256_t inv = cpt_inv(x);
    printf("And the answer is \n");
    printf("\ninv = %016llx_%016llx_%016llx_%016llx\n", 
    (unsigned long long)inv.v[3],
    (unsigned long long)inv.v[2],
    (unsigned long long)inv.v[1],
    (unsigned long long)inv.v[0]
    );
    printf("    = ");
    print_int256_dec(&inv);
    printf("\n\n");

    

    return 0;
}