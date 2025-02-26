from random import randint



f1 = randint(0, 2**20 - 1)
u1 = randint(-(2**20), (2**20) - 1)
v1 = randint(-(2**20), (2**20) - 1)

f2 = randint(0, 2**20 - 1)
u2 = randint(-(2**20), (2**20) - 1)
v2 = randint(-(2**20), (2**20) - 1)


limb_64 = ((u1 % 2**21) << 43) + ((v1 % 2**21) << 21) + (f1 % 2**20)
assert(limb_64 >= 0)
print(" "*14 + " "*(64 - 20 - 1)+"b"+f"{(f1 % 2**20):020b}")
print(" "*14 + " "*(64 - 20 - 1 - 21 - 1)+"b"+f"{(v1 % 2**21):021b}")
print(" "*14 + " "*(64 - 20 - 1 - 21 - 1 - 21)+f"{u1 % 2**21:021b}")
print(" "*14 + f"{limb_64:064b}")


print("\nNow we work with addition")
limb_64_1 = ((u1 % 2**21) << 43) + ((v1 % 2**21) << 21) + (f1 % 2**20)
limb_64_2 = ((u2 % 2**21) << 43) + ((v2 % 2**21) << 21) + (f2 % 2**20)
print(f"  limb_64_2 = {limb_64_1:064b}")
print(f"  limb_64_2 = {limb_64_2:064b}")

print("\nwe define the mask:")
mask = 2**64 - 2**43  + 2**42 - 2 ** 21 + 2**20 -1 
print(f"       mask = {mask:064b}")
print("this mask will zeroize the buffer positions\n")

limb_64_sum = ((limb_64_1 + limb_64_2) % 2**64) & mask
print(f"limb_64_sum = {limb_64_sum:064b}")
u_sum = (u1 + u2) % 2**21
v_sum = (v1 + v2) % 2**21
f_sum = (f1 + f2) % 2**20

print("f_sum is      " + " "*(64 - 20 - 1)+"b"+f"{(f_sum % 2**20):020b}")
print("v_sum is      " + " "*(64 - 20 - 1 - 21 - 1)+"b"+f"{(v_sum % 2**21):021b}")
print("u_sum is      " + " "*(64 - 20 - 1 - 21 - 1 - 21)+f"{u_sum % 2**21:021b}")
print(" "*14 + f"{limb_64_sum:064b}")


print("\nNow we work with negation")
f1 = randint(0, 2**20 - 1)
u1 = randint(-(2**20), (2**20) - 1)
v1 = randint(-(2**20), (2**20) - 1)
limb_64 = ((u1 % 2**21) << 43) + ((v1 % 2**21) << 21) + (f1 % 2**20)
assert(limb_64 >= 0)
print("f is          " + " "*(64 - 20 - 1)+"b"+f"{(f1 % 2**20):020b}")
print("v is          " + " "*(64 - 20 - 1 - 21 - 1)+"b"+f"{(v1 % 2**21):021b}")
print("u is          " + " "*(64 - 20 - 1 - 21 - 1 - 21)+f"{u1 % 2**21:021b}")
print("limb repr is  " + f"{limb_64:064b}")
print("\nThe negation in 2's complement is done by first \"bitwise NOT\" and then \"ADD 1\" ")
print("The same action will be done in three lanes.")
print("So we first xor with the following mask, equivalent to performing the bitwise NOT to three lanes:")
print()
print(f"       mask = {mask:064b}")
print("              (which is identical to the mask used in addition)")

limb_64_neg = limb_64 ^ mask

print("the intermediate result after bitwise NOT: ")
print(" "*14 + f"{limb_64_neg:064b}")
print("and then we ADD 1 on three respective lanes, that is, we add the following limb: ")
