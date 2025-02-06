#!/usr/bin/python3
import sys
import re
from math import log,ceil,floor,sqrt

def cmod (a,b) :
    assert (b>0)
    r = (a+b//2) % b - (b//2)
    return r

def extended_gcd(a, b) :
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = extended_gcd(b % a, a)
        return (g, x - (b // a) * y, y)

def mod_inverse(a, m) :
    g, x, y = extended_gcd(a, m)
    if (g ** 2 != 1):
        raise Exception('modular inverse does not exist')
    elif (g == 1):
        return x % m
    else : # (g == -1)
        return (-x) % m
    
def cmod_inverse(a, m) :
    return cmod(mod_inverse(a, m), m)

def radix (LL,b) :
    R = 2**b
    return (sum(LL[i]*R**i for i in range(len(LL))))

def sradix (LL,b) :
    R = 2**b
    x = sum(LL[i]*R**i for i in range(len(LL)))
    if LL[-1] >= R/2 :
        x -= R**(len(LL))
    return (x)

def split (L,b) :
    R = 2**b
    if L==0 :
       return ([0])
    LL = []
    x = L
    if x < 0 :
       x += R**(ceil(log(2*abs(x))/log(2)/b))
    for i in range(int(floor(log(x)/log(2)/b))+1) :
        LL.append(x % R)                                
        x //= R
    return (LL)   

def splitps (L,b) :
    R = 2**b
    bb = 2**(int(ceil(log(b)/log(2))))
    RR = 2**bb
    fs = "0x%0" + str(ceil(bb/4)) + "xULL,"	
    if L==0 :
       return ([0])
    LL = []
    x = L
    if x < 0 :
       x += R**(ceil(log(2*abs(x))/log(2)/b))
    for i in range(int(floor(log(x)/log(2)/b))+1) :
        print (fs % (cmod(x,R) % RR))
        x = (x- cmod(x,R)) // R
        
    #return (LL)

def splitp (L,b) :
    R = 2**b
    fs = "0x%0" + str(ceil(b/4)) + "x,"	
    if L==0 :
       return ([0])
    x = L   
    if x < 0 :
       x += R**(int(ceil(log(2*abs(x))/log(2)/b)))
    for i in range(int(floor(log(x)/log(2)/b))+1) :
        print (fs % (x % R) )
        x //= R


def mont3_table (prime, name, comment) :
    print('''
/* This is the %s */
static const __attribute__((aligned(32)))
int64_t t_%s[64]={
    0x3FFFFFFFLL, 0x3FFFFFFFLL, 0x3FFFFFFFLL, 0x3FFFFFFFLL,
    0x200000000LL, 0x200000000LL, 0x200000000LL, 0x200000000LL,
    0x8000000000000000LL, 0x8000000000000000LL,
    0x8000000000000000LL, 0x8000000000000000LL,
    0X7FFFFFFE00000000LL, 0X7FFFFFFE00000000LL,
    0X7FFFFFFE00000000LL, 0X7FFFFFFE00000000LL,
    0x20000000LL, 0x20000000LL, 0x20000000LL, 0x20000000LL,''' % (comment, name))
    prime_list1 = split(prime, 64)
    prime_list = split(prime, 30)
    for i in range(0,4,2) :
        print("    0x%016xULL, 0x%016xULL," % (prime_list1[i],prime_list1[i+1]))
    for i in range(9) :
        if (i==1) : s = 1
        else : s = 0
        print("    0x%09xLL, 0LL, 0LL, %dLL," % (prime_list[i],s))
    mont_inverse = mod_inverse(-prime,2**64)
    print("    0x%016xULL, 0LL, 0LL, 0LL};" % mont_inverse)
    print('')
    primebytes = split(prime, 8)
    print('unsigned char inverse256_%s_modulus[32] = {' % name)
    for i in range(4):
      row = ['0x%02x,' % primebytes[8*i+j] for j in range(8)]
      print('  %s' % ''.join(row))
    print('} ;')
    print('')
    print('void inverse256_%s(unsigned char *out,const unsigned char *in)' % name)
    print('{')
    print('  inverse256_skylake_asm(in,out,t_%s);' % name)
    print('}')


mont3_table(radix([0xfffffffefffffc2f ,0xffffffffffffffff,
                   0xffffffffffffffff, 0xffffffffffffffff],64),
            "BTC_p","Bitcoin prime")
mont3_table(radix([0xbfd25e8cd0364141, 0xbaaedce6af48a03b,
		   0xfffffffffffffffe, 0xffffffffffffffff],64),
            "BTC_n","Bitcoin curve order prime")
mont3_table(radix([0xf3b9cac2fc632551, 0xbce6faada7179e84,
		   0xffffffffffffffff, 0xffffffff00000000],64),
            "P256_n","P-256 curve order prime")
mont3_table(radix([0xffffffffffffffff, 0x00000000ffffffff,
		   0x0000000000000000, 0xffffffff00000001],64),
            "P256_p","P-256 curve Solinas prime")
    

