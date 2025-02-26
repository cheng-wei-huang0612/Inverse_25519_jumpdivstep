#include <stdio.h>
#include <stdint.h>
#include <math.h>


void compare_print(const char *label, int64_t actual, int64_t expected)
{
    // 同時印出十進位和十六進位，方便觀察
    printf("%s => actual = %lld (0x%llX),\n   expected = %lld (0x%llX)\n",
           label,
           (long long) actual,           // 10 進位 (有號)
           (unsigned long long) actual,  // 16 進位
           (long long) expected,
           (unsigned long long) expected);
}


int main()
{
    int64_t delta = 1;
    int64_t fuv;
    int64_t grs;

    int64_t f0 = 1048557;
    int64_t g0 = 441260;
    int64_t u = - 1048576;
    int64_t v = 0;
    int64_t r = 0;
    int64_t s = - 1048576;



    fuv = (u << 42) + (v << 21) + f0;
    grs = (r << 42) + (s << 21) + g0;

    printf("f0 = %lld\n", f0);
    printf("u  = %lld\n", u);
    printf("v  = %lld\n", v);
    printf("g0 = %lld\n", g0);
    printf("r  = %lld\n", r);
    printf("s  = %lld\n", s);

    // printf("fuv = %lld\n", fuv);
    // printf("grs = %lld\n", grs);
    
    

    int64_t extracted_u = (fuv + ((int64_t)1 << 20) + ((int64_t)1 << 41));
    extracted_u = extracted_u >> 42;
    
    int64_t extracted_v = (fuv + ((int64_t)1 << 20));
    extracted_v = (uint64_t) extracted_v << 22;
    extracted_v = extracted_v >> 43;


    int64_t extracted_r = (grs + ((int64_t)1 << 20) + ((int64_t)1 << 41));
    extracted_r = extracted_r >> 42;
    
    int64_t extracted_s = (grs + ((int64_t)1 << 20));
    extracted_s = (uint64_t) extracted_s << 22;
    extracted_s = extracted_s >> 43;


    
    printf("\n--- Extracted from fuv ---\n");
    compare_print("u", extracted_u, u);
    compare_print("v", extracted_v, v);

    printf("\n--- Extracted from grs ---\n");
    compare_print("r", extracted_r, r);
    compare_print("s", extracted_s, s);


    for (size_t i = 0; i < 20; i++)
    {
        //printf("\n Step %zu\n", i);

        int64_t g0_and_1 = grs & 1;
        int64_t cond = (delta > 0) & (g0_and_1 == 1);

        if (cond)
        {
            int64_t temp_fuv = fuv;
            fuv = grs;
            grs = -temp_fuv;

            int64_t temp_f0 = f0;
            f0 = g0;
            g0 = -temp_f0;

            int64_t temp_u = u;
            u = r;
            r = -temp_u;

            int64_t temp_v = v;
            v = s;
            s = -temp_v;

            delta = - delta;
        }

        grs = ((g0_and_1 * fuv + 1 * grs)) >> 1;
        r = (g0_and_1 * u + 1 * r) >> 1;
        s = (g0_and_1 * v + 1 * s) >> 1;
        g0 = (g0_and_1 * f0 + 1 * g0) >> 1;
        delta += 2;



        extracted_u = (fuv + ((int64_t)1 << 20) + ((int64_t)1 << 41));
        extracted_u = extracted_u >> 42;
        
        extracted_v = (fuv + ((int64_t)1 << 20));
        extracted_v = (uint64_t) extracted_v << 22;
        extracted_v = extracted_v >> 43;


        extracted_r = (grs + ((int64_t)1 << 20) + ((int64_t)1 << 41));
        extracted_r = extracted_r >> 42;
        
        extracted_s = (grs + ((int64_t)1 << 20));
        extracted_s = (uint64_t) extracted_s << 22;
        extracted_s = extracted_s >> 43;


    }
    printf("\n--- Extracted from fuv ---\n");
    compare_print("u", extracted_u, u);
    compare_print("v", extracted_v, v);

    printf("\n--- Extracted from grs ---\n");
    compare_print("r", extracted_r, r);
    compare_print("s", extracted_s, s);




    return 0;
}
