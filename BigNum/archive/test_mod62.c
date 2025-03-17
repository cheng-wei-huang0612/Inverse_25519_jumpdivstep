#include <stdio.h>
#include <stdint.h>
#include <inttypes.h> // for PRId64
#include <stdlib.h>   // for rand(), srand(), exit()
#include <time.h>     // for time()
#include <stdbool.h>  // for bool type

#include "big60.h"

// 這個函式測試：
//   1) 將 x 存入 big60_t
//   2) 再轉回 int64_t，看是否落在 [-2^61, 2^61) 區間
//   3) 檢查 x 與取回後的值 y，是否只差 k * 2^62 (k 為某個整數)
static void test_value(int64_t x) {
    // (1) 存入 big
    big60_t bigX;
    big60_from_int64(x, &bigX);

    // (2) 取出
    int64_t y = int64_from_big60(&bigX);

    // (3) 檢查 y 是否在 [-2^61, 2^61)
    const int64_t minRange = -((int64_t)1 << 61); // -2^61
    const int64_t maxRange =  ((int64_t)1 << 61); //  2^61
    bool inRange = (y >= minRange) && (y < maxRange);

    // (4) 檢查 x - y 是否為 2^62 的倍數
    //     這裡使用 __int128 (GCC / Clang 支援) 來避免 64-bit overflow。
    //     若環境不支援，可用 GMP 或其他方法。
    __int128 diff = ( __int128 )x - ( __int128 )y;
    __int128 mod  = (( __int128)1 << 62);

    // diff mod (2^62) == 0 ?
    // 寫法: 若 diff<0，用 (-diff)%mod 再取負，得到正確餘數。
    __int128 remainder = (diff >= 0) ? (diff % mod)
                                     : -(( -diff ) % mod);

    bool isMultiple = (remainder == 0);

    // 印出測試結果
    if (!inRange || !isMultiple) {
        printf("FAIL: x=%" PRId64 " => y=%" PRId64
               " [inRange=%d, isMultipleOf2^62=%d]\n",
               x, y, (int)inRange, (int)isMultiple);
    } else {
        printf(" OK : x=%" PRId64 " => y=%" PRId64
               " [they differ by k*2^62, y in [-2^61,2^61)\n",
               x, y);
    }
}

int main(void) {
    printf("=== Test mod 2^62 with representative in [-2^61, 2^61) ===\n\n");

    // 1) 測試一些「邊界」值
    int64_t testvals[] = {
        -((int64_t)1<<61),        // -2^61
        -((int64_t)1<<61)-1,      // -2^61 - 1
        -((int64_t)1<<61)+1,      // -2^61 + 1
        ((int64_t)1<<61)-1,       //  2^61 - 1
        ((int64_t)1<<61),         //  2^61
        ((int64_t)1<<61)+1,       //  2^61 + 1
        -1, 0, 1,
        INT64_MIN,                // -2^63
        INT64_MAX                 //  2^63 -1
    };

    size_t n = sizeof(testvals) / sizeof(testvals[0]);
    printf(">> Boundary tests:\n");
    for (size_t i = 0; i < n; i++) {
        test_value(testvals[i]);
    }

    // 2) (可選) 大量隨機測試
    //    這裡示範隨機產生 20 個值(你可改成幾千幾萬)，包含可能超過 2^61 ~ 2^63
    printf("\n>> Random tests:\n");
    srand((unsigned)time(NULL));
    for (int i = 0; i < 20; i++) {
        // 亂數產生一個 64-bit 值
        // 例如分兩次 32-bit rand()，再合併
        uint64_t hi = (uint64_t)rand();
        uint64_t lo = (uint64_t)rand();
        uint64_t val = (hi << 32) | lo;

        // 以某種機率產生負數
        // (val >> 63) 可以作為 sign bit 1 => negative
        // 但這裡簡單: 只要 val & 1 => negative
        if (val & 1) {
            int64_t neg = -(int64_t)(val >> 1); 
            test_value(neg);
        } else {
            // 直接測正數
            test_value((int64_t)(val >> 1));
        }
    }

    return 0;
}

