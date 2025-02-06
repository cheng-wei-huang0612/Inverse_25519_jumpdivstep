#include "cint_arith.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

// 測試向量結構: 保存 A, B, 以及預期結果 R
typedef struct {
    int64_t A;
    int64_t B;
    int128_t R;
} test_vector_t;

static test_vector_t test_vectors[] = {
    { 0xA06193792E3C31BEULL, 0x5172B98A41062CF3ULL, {{0xEC8D4C6FA423DF5AULL, 0xE19405CFE37A2C38ULL}} },
    { 0xA97A4AB8F1D70DB7ULL, 0x5A57A0C2CA121E87ULL, {{0x90CF8A7E18E1AD81ULL, 0xE177607F02F46173ULL}} },
    { 0x9BE5BB28894FD45FULL, 0xA8C8EEA7212EF4D3ULL, {{0x5C73B7FAAB48964DULL, 0x221A75D2825ADD23ULL}} },
    { 0x22C3C45E4663A118ULL, 0xFD656F55DE78EC15ULL, {{0xF8B74DFDF1EE56F8ULL, 0xFFA57B0DE9B9DE5AULL}} },
    { 0x68D0BCE3E89CDB01ULL, 0x37A03159D6177849ULL, {{0x35110B8A5E79EB49ULL, 0x16C66F3FC1CC79BFULL}} },
    { 0x7655D790639D2CD8ULL, 0x802B62C3B9812383ULL, {{0xD650ACA527677A88ULL, 0xC4E9224A591A588BULL}} },
    { 0xEB614FCD53A42AA8ULL, 0xF32659C021A04170ULL, {{0xA2D6E22B97A75180ULL, 0x0108F829C63FF31CULL}} },
    { 0x58E8B8022376D283ULL, 0x489E23B63774E1EAULL, {{0xDF243E5361FD8EBEULL, 0x19385FC94529025AULL}} },
    { 0xC982602D54285886ULL, 0xC9E5738EEB8CB8CEULL, {{0x4518549E235F8BD4ULL, 0x0B84265D70DA0D45ULL}} },
    { 0xC6790F139206833BULL, 0xC6FA78B6421A6F54ULL, {{0xD8A7E52D4707A45CULL, 0x0CD049AE144E4A27ULL}} },
    { 0x0000000000000000ULL, 0x0000000000000000ULL, {{0x0000000000000000ULL, 0x0000000000000000ULL}} },
    { 0x0000000000000001ULL, 0x0000000000000001ULL, {{0x0000000000000001ULL, 0x0000000000000000ULL}} },
    { 0xFFFFFFFFFFFFFFFFULL, 0xFFFFFFFFFFFFFFFFULL, {{0x0000000000000001ULL, 0x0000000000000000ULL}} },
    { 0x7FFFFFFFFFFFFFFFULL, 0x7FFFFFFFFFFFFFFFULL, {{0x0000000000000001ULL, 0x3FFFFFFFFFFFFFFFULL}} },
    { 0x8000000000000000ULL, 0x8000000000000000ULL, {{0x0000000000000000ULL, 0x4000000000000000ULL}} },
    { 0x7FFFFFFFFFFFFFFFULL, 0x8000000000000000ULL, {{0x8000000000000000ULL, 0xC000000000000000ULL}} },
};

int main(void)
{
    int errors = 0;
    int num_tests = sizeof(test_vectors)/sizeof(test_vectors[0]);
    int128_t result;

    for (int i = 0; i < num_tests; i++) {
        // 呼叫被測函式
        int64_times_int64(&test_vectors[i].A, &test_vectors[i].B, &result);

        // 驗證結果: 比對 v[0], v[1]
        if (result.v[0] != test_vectors[i].R.v[0] ||
            result.v[1] != test_vectors[i].R.v[1]) {
            errors++;
            printf("Test #%d FAILED!\n", i);
            printf("  A=%%lld, B=%%lld\n", (long long)test_vectors[i].A, (long long)test_vectors[i].B);
            printf("  Expected R: [%%016llX, %%016llX]\n",
                   (long long)test_vectors[i].R.v[1],
                   (long long)test_vectors[i].R.v[0]);
            printf("  Got R:      [%%016llX, %%016llX]\n",
                   (long long)result.v[1],
                   (long long)result.v[0]);
        }
    }

    if (errors == 0) {
        printf("All tests PASSED!\n");
    } else {
        printf("%%d tests FAILED.\n", errors);
    }

    return errors ? 1 : 0;
}
