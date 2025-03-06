
from math import trunc 
P = 2**255 - 19

P_low60 = P & ((1 << 60) - 1)  

class uint32_t:
    """ A class to simulate uint32_t in Python with bitwise operations. """
    def __init__(self, value: int):
        # Ensure the value stays within 32-bit unsigned integer range
        self.value = value % (1 << 32)

    def __repr__(self):
        return f"uint32_t({self.value})"

    def __add__(self, other):
        return uint32_t(self.value + int(other))

    def __sub__(self, other):
        return uint32_t(self.value - int(other))

    def __mul__(self, other):
        return uint32_t(self.value * int(other))

    def __mod__(self, other):
        divisor = int(other)
        if divisor == 0:
            raise ZeroDivisionError("uint32_t modulo by zero")

        remainder = self.value % divisor
        return uint32_t(remainder)

    def __and__(self, other):
        return uint32_t(self.value & int(other))

    def __or__(self, other):
        return uint32_t(self.value | int(other))

    def __xor__(self, other):
        return uint32_t(self.value ^ int(other))

    def __invert__(self):
        return uint32_t(~self.value)

    def __neg__(self):
        return uint32_t(-self.value)

    def __rshift__(self, shift):
        return uint32_t(self.value >> shift)

    def __lshift__(self, shift):
        return uint32_t(self.value << shift)

    def __eq__(self, other):
        return self.value == int(other)

    def __gt__(self, other):
        return self.value > int(other)

    def __int__(self):
        return self.value


class int64_t:
    """ A class to simulate int64_t in Python with bitwise operations. """
    def __init__(self, value: int):
        # Ensure the value stays within 64-bit signed integer range
        self.value = (value + (1 << 63)) % (1 << 64) - (1 << 63)

    def __repr__(self):
        return f"int64_t({self.value})"

    def __add__(self, other):
        return int64_t(self.value + int(other))

    def __sub__(self, other):
        return int64_t(self.value - int(other))

    def __mul__(self, other):
        return int64_t(self.value * int(other))

    def __mod__(self, other):
        divisor = int(other)
        if divisor == 0:
            raise ZeroDivisionError("int64_t modulo by zero")

        # 1. 先做「向 0 取整」的整數除法

        quotient = trunc(self.value / divisor)  

        # 2. 用數學方式計算 remainder
        remainder = self.value - quotient * divisor

        # 3. 包裝回 int64_t (含 64-bit 範圍裁切)
        return int64_t(remainder)

    def __and__(self, other):
        return int64_t(self.value & int(other))

    def __or__(self, other):
        return int64_t(self.value | int(other))

    def __xor__(self, other):
        return int64_t(self.value ^ int(other))

    def __invert__(self):
        return int64_t(~self.value)

    def __neg__(self):
        return int64_t(-self.value)

    def __rshift__(self, shift):
        return int64_t(self.value >> shift)

    def __lshift__(self, shift):
        return int64_t(self.value << shift)

    def __eq__(self, other):
        return self.value == int(other)
    
    def __gt__(self, other):
        return self.value > int(other)

    def __int__(self):
        return self.value




class big30_9:
    """ A big integer type composed of 9 uint32_t segments, each holding up to 30 bits. """
    RADIX = 1 << 30
    MASK = RADIX - 1

    def __init__(self, value=0):
        self.limb = [uint32_t(0)] * 9
        for i in range(9):
            self.limb[i] = uint32_t(value & self.MASK)
            value >>= 30

    def to_int(self):
        total = 0
        for i in reversed(range(9)):
            total = (total << 30) + int(self.limb[i])
        return total

    def __int__(self):
        return self.to_int()

    def __str__(self) -> str:
        return str(int(self))

    def low_60_bit(self):
        raw_low60 = (int(self.limb[1]) << 30) | int(self.limb[0])
        return (raw_low60 - P_low60) & ((1 << 60) - 1)




def mul_int64_t_with_big30_9(a: int64_t, b:big30_9):
    result = int(a) * int(b)
    return big30_9(result)




def mul_big30_9_with_big30_9_mod_P(a: big30_9, b:big30_9):
    result = int(a) * int(b)
    assert(P == (2**255 - 19))
    result = result % P
    return big30_9(result)
    
