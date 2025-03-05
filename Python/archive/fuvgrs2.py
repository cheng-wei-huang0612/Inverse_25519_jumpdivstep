from random import randint

f1 = randint(0, 2**20 - 1)  # 21 bits signed
u1 = randint(-(2**20), (2**20) - 1) # 21 bits signed
v1 = randint(-(2**20), (2**20) - 1) # 21 bits signed

g2 = randint(0, 2**20 - 1)
r2 = randint(-(2**20), (2**20) - 1)
s2 = randint(-(2**20), (2**20) - 1)

# limb64 = | u | v | f |  (little-endian)
fuv = u1 * (2**42) + v1 * (2**21) + f1
grs = r2 * (2**42) + s2 * (2**21) + g2





print(f"{fuv % (2**64) :064b}")
print(f"{grs % (2**64) :064b}")


ss = grs + (2**20 + 2**41)
ss = ss >> 42
print("ss = ",ss)
print("s = ", s2)
