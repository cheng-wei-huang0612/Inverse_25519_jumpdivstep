#include <stdint.h>
#include <stdio.h>
#include "inner_update.h"
// #include "big30.h"
#include <gmp.h>

void inner_update(int64_t *f, int64_t *g, int64_t *uuvvrrss, int64_t *uvrs ) {

    int64_t u = uvrs[0];
    int64_t v = uvrs[1];
    int64_t r = uvrs[2];
    int64_t s = uvrs[3];

    int64_t uu = uuvvrrss[0];
    int64_t vv = uuvvrrss[1];
    int64_t rr = uuvvrrss[2];
    int64_t ss = uuvvrrss[3];

    mpz_t mpf, mpf_new, mpg, mpg_new, mpu, mpv, mpr, mps, tmp;
    mpz_init(mpf_new);
    mpz_init(mpg_new);
    mpz_init(tmp);

    mpz_init_set_si(mpf, *f);
    mpz_init_set_si(mpg, *g);
    mpz_init_set_si(mpu, u);
    mpz_init_set_si(mpv, v);
    mpz_init_set_si(mpr, r);
    mpz_init_set_si(mps, s);
    
    mpz_mul(tmp, mpu, mpf);
    mpz_addmul(tmp, mpv, mpg);
    mpz_fdiv_q_2exp(mpf_new, tmp, 20);

    mpz_mul(tmp, mpr, mpf);
    mpz_addmul(tmp, mps, mpg);
    mpz_fdiv_q_2exp(mpg_new, tmp, 20);

    *f = mpz_get_si(mpf_new);
    *g = mpz_get_si(mpg_new);

    mpz_clears(mpf, mpg, mpf_new, mpg_new, tmp, mpu, mpv ,mpr ,mps, NULL);

    int64_t uu_new = (u) * (uu) + (v) * (rr);         
    int64_t rr_new = (r) * (uu) + (s) * (rr);
    int64_t vv_new = (u) * (vv) + (v) * (ss);
    int64_t ss_new = (r) * (vv) + (s) * (ss);

    uu = uu_new;
    rr = rr_new;
    vv = vv_new;
    ss = ss_new;

    uvrs[0] = u;
    uvrs[1] = v;
    uvrs[2] = r;
    uvrs[3] = s;

    uuvvrrss[0] = uu;
    uuvvrrss[1] = vv;
    uuvvrrss[2] = rr;
    uuvvrrss[3] = ss;
}




