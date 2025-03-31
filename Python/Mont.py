
# Given A a positive 9 limb 30bits number
# Given u a positive 2 limb 30bits number
# Compute A * u mod P by Multi-limb Montgomery Multiplication

from random import randint


P =  2**255 - 19
r = 9 
B = 1 << 30 
R = B ** r 
M = 678152731 # = (- P^{-1}) mod B
R_square = R**2 % P



    


def MontMul(A, u):
    """
    Receive A (9 30bits limbs) and u (2 30 bits limbs) 
    Return Au/R mod P 
    """

    A =  A * u 
    #A_origin = A 
    #assert(A < P * R)
    

    for i in range(r):
        l = ((A % B) * M) % B
        #assert(l <= (2**60) - 1)
        A = (A + (l * P)) // B

    # Theorem: A/R = A mod P
    #assert(((A_origin - A * R) % P) ==0 )

    # Theorem: A < 2 * P 
    #assert( 0 < A < 2*P)
    
    #if A > P:
    #    A -= P

    return A


for _ in range(1000):
    A = randint(0, P-1)
    u = randint(0, (1<<60) - 1)
    Mont = MontMul(A,u)
    
    Mont_result = MontMul(Mont,R_square)
    

    Correct = (A*u) % P
    print(f"the mont answer is \n{Mont_result}")
    print(f"the correct answer is \n{Correct}")
    print(f"the result is {Mont_result == Correct}")
    if not Mont_result == Correct:
        print(f"things go wrong with A = {A}")
        break
    

