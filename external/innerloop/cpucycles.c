unsigned long long cpucycles(void)
{ 
    unsigned int hi, lo;

    asm volatile ("rdtsc\n\t" : "=a" (lo), "=d"(hi));
    return ((long long)lo) | (((long long)hi) << 32);
}

