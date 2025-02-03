import ctypes
from random import randint

class U256:
    __slots__ = ('limb',)

    def __init__(self, limb0, limb1, limb2, limb3):
        self.limb = [limb0, limb1, limb2, limb3]

    @staticmethod
    def from_int(value: int):
        # 假設 value >= 0
        return U256(
            value & ((1 << 64) - 1),
            (value >> 64) & ((1 << 64) - 1),
            (value >> 128) & ((1 << 64) - 1),
            (value >> 192) & ((1 << 64) - 1)
        )

    def to_int(self) -> int:
        return (self.limb[0]
                + (self.limb[1] << 64)
                + (self.limb[2] << 128)
                + (self.limb[3] << 192))

    def __add__(self, other: 'U256'):
        # 做跟前面一樣的分 limb 加法
        # 只是我們可以在 Python 裡用一些 trick，
        # 但我這邊還是示範手動 carry 的方式
        carry = 0
        result_limb = [0, 0, 0, 0]
        for i in range(4):
            tmp = self.limb[i] + other.limb[i] + carry
            result_limb[i] = tmp & ((1 << 64) - 1)
            carry = tmp >> 64
        return U256(*result_limb)

    def __repr__(self):
        return f"U256(0x{self.to_int():064x})"



