
int64 pointer_A
int64 pointer_B
int64 pointer_R

input pointer_A
input pointer_B
input pointer_R


int64 A_lo
int64 A_hi
int64 B_lo
int64 B_hi
int64 sign_A
int64 sign_B
int64 mask_A
int64 mask_B

int64 r0
int64 r1
int64 r2
int64 r3
int64 sign_R
int64 mask_R

int64 sum_A_lo
int64 sum_A_hi
int64 sum_B_lo
int64 sum_B_hi



int64 product_0_lo
int64 product_0_hi

int64 p0
int64 p1
int64 p2

int64 product_2_lo
int64 product_2_hi

int64 temp



enter int128_mul
A_lo = mem64[pointer_A]
A_hi = mem64[pointer_A + 8]
B_lo = mem64[pointer_B]
B_hi = mem64[pointer_B + 8]

sign_A = A_hi >> 63
sign_B = B_hi >> 63

# Take abs(A), branchless
mask_A = - sign_A
A_lo ^= mask_A
A_hi ^= mask_A
A_lo = A_lo + sign_A !
A_hi = A_hi + carry !


# Take abs(B), branchless
mask_B = - sign_B
B_lo ^= mask_B
B_hi ^= mask_B
B_lo = B_lo + sign_B !
B_hi = B_hi + carry !

sign_R = sign_A ^ sign_B


# The unsigned multiplication logic
# We will use Karatsuba algorithm

# product_0 = A_lo * B_lo
product_0_lo = A_lo * B_lo
product_0_hi = A_lo * B_lo (hi)

# product_2 = A_hi * B_hi
product_2_lo = A_hi * B_hi
product_2_hi = A_hi * B_hi (hi)







## product_1 = p2 << 128 + p1 << 64 + p0
# p2                   | p1       | p0
#                       sum_A_lo * sum_B_lo
#            sum_A_hi * sum_B_lo
#            sum_A_lo * sum_B_hi
# sum_A_hi * sum_B_hi

# product_1 = (A_lo + A_hi) * (B_lo + B_hi)

## sum_A
sum_A_lo = 0
sum_A_hi = 0

sum_A_lo = A_lo + A_hi !
sum_A_hi = sum_A_hi + carry !

## sum_B
sum_B_lo = 0
sum_B_hi = 0

sum_B_lo = B_lo + B_hi !
sum_B_hi = sum_B_hi + carry !

p0 = 0
p1 = 0
p2 = 0


p0 = sum_A_lo * sum_B_lo
p1 = sum_A_lo * sum_B_lo (hi)

temp = sum_A_hi & sum_B_hi
p2 = p2 + temp 

mask_A = - sum_A_hi
temp = sum_B_lo & mask_A
p1 = p1 + temp !
p2 = p2 + carry !

mask_B = - sum_B_hi
temp = sum_A_lo & mask_B
p1 = p1 + temp !
p2 = p2 + carry !







## r =   r3 | r2 | r1 | r0 | 
#+               |product0 |
#+     |product2 |
#+     |   product1   |       //product_1 = p2 << 128 + p1 << 64 + p0
#-          |product0 |   
#-          |product2 |   

r0 = 0
r1 = 0
r2 = 0
r3 = 0

r0 = r0 + product_0_lo
r1 = r1 + product_0_hi
r2 = r2 + product_2_lo
r3 = r3 + product_2_hi

r1 = r1 + p0 !
r2 = r2 + p1 + carry !
r3 = r3 + p2 + carry !

r1 = r1 - product_0_lo !
r2 = r2 - product_0_hi - borrow !
r3 = r3 - borrow !

r1 = r1 - product_2_lo !
r2 = r2 - product_2_hi - borrow !
r3 = r3 - borrow !

# So far, we've complete the unsigned multiplication
# Adjust to signed number

mask_R = - sign_R
r0 ^= mask_R
r1 ^= mask_R
r2 ^= mask_R
r3 ^= mask_R

r0 = r0 + sign_R!
r1 = r1 + carry !
r2 = r2 + carry !
r3 = r3 + carry !

mem64[pointer_R] = r0
mem64[pointer_R + 8] = r1
mem64[pointer_R + 16] = r2
mem64[pointer_R + 24] = r3

return
