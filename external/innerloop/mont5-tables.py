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

def split (L,b,l=0) :
    R = 2**b
    if L==0 :
       return ([0])
    LL = []
    x = L
    if x < 0 :
       x += R**(ceil(log(2*abs(x))/log(2)/b))
    if (l == 0) :
        l = int(floor(log(x)/log(2)/b))+1
    for i in range(l) :
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


def mont5_table (prime, name, comment, nbits=0,nlimbs=0) :
    if (nbits==0) : nbits = int(log(prime)/log(2.0)+1)
    if (nlimbs==0) : nlimbs = (nbits+30-1)//30    
    nqwords = (nbits+64-1)//64
    nymms = (nqwords-1)//4+1
    length = 24 + (nlimbs + nymms) * 4
    
    print('''
/* This is the %s */
static const __attribute__((aligned(32)))
int64_t t_%s[%d]={0x3FFFFFFFLL, 0x3FFFFFFFLL, 0x3FFFFFFFLL, 0x3FFFFFFFLL,
    0x200000000LL, 0x200000000LL, 0x200000000LL, 0x200000000LL,
    0x8000000000000000LL, 0x8000000000000000LL,
    0x8000000000000000LL, 0x8000000000000000LL, 
    0X7FFFFFFE00000000LL, 0X7FFFFFFE00000000LL,
    0X7FFFFFFE00000000LL, 0X7FFFFFFE00000000LL,
    0x20000000LL, 0x20000000LL, 0x20000000LL, 0x20000000LL,''' % (comment, name, length))
    prime_list1 = split(prime, 64)
    if len(prime_list1) < nqwords : prime_list1+=[0]*(nqwords-len(prime_list1))
    prime_list = split(prime, 30)
    if len(prime_list) < nlimbs : prime_list += [0] * (nlimbs- len(prime_list))
    _2pm34 = mod_inverse(2**34, prime)
    _2pm34_list = split(_2pm34, 30, nlimbs)

    for i in range(nqwords,(nqwords+3)//4*4) : prime_list1.append(0)
    for i in range(0,(nqwords+3)//4*4,2) :
        print("    0x%016xULL, 0x%016xULL," % (prime_list1[i],prime_list1[i+1]))
    for i in range(nlimbs) :
        print("    0x%09xLL, 0LL, 0LL, 0x%09xLL," % (prime_list[i],_2pm34_list[i]))
    mont_inverse = mod_inverse(-prime, 2**64)
    print("    0x%016xULL, 0LL, 0LL, 0LL};" % mont_inverse)

    

csidh_prime_512 = 4 ; j = 3
for i in range(73) :  
    csidh_prime_512 *= j 
    j = next_prime(j) 
csidh_prime_512 = csidh_prime_512 * 587 - 1 

mont5_table (csidh_prime_512, "csidh_512", "CSIDH 512 Prime") 

csidh_prime_1024 = radix([0xdbe34c5460e36453, 0xa1d81eebbc3d344d, 0x514ba72cb8d89fd3, 0xc2cab6a0e287f1bd, 0x642aca4d5a313709, 0x6b317c5431541f40, 0xb97c56d1de81ede5, 0x0978dbeed90a2b58, 0x7611ad4f90441c80, 0xf811d9c419ec8329, 0x4d6c594a8ad82d2d, 0xf06de2471cf9386e, 0x0683cf25db31ad5b, 0x216c22bc86f21a08, 0xd89dec879007ebd7, 0x0ece55ed427012a9], 64)

mont5_table (csidh_prime_1024, "csidh_1024", "CSIDH 1024 Prime", 1024) 

sikep434 = 2**0xd8 * 3**0x89 -1
 
mont5_table (sikep434, "sikep_434", "sikep_434 Prime", 512) 

craig182 = 2**91*3**57-1

mont5_table (craig182, "craig_182", "craig_182_challenge_prime", 192)
mont5_table (craig182, "craig_182", "craig_182_challenge_prime", 256)
