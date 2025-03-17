
class BigIntRadix30:
    """
    以 9 個 limb (每 limb 30 bits) 表示一個帶符號的大數，可涵蓋到 ±2^269。
    * 本示範用 Python int 儲存 limbs（不直接用 int32），
      嚴格來說並不會呈現 "最高 limb = -1 其餘 = 0x3FFFFFFF" 那種狀態。
    * 但運算流程與「拆成 30-bit limb，進行加減」的概念類似。
    """

    SHIFT = 30                 # 每個 limb 有效位元數
    LIMBS = 9                  # limb 數量
    BIT_SIZE = SHIFT * LIMBS   # 總位元數 = 270
    MOD = 1 << BIT_SIZE        # 2^270
    HALF = 1 << (BIT_SIZE - 1) # 2^269，用於判斷正負

    def __init__(self, x: int):
        """
        以 Python int x 建構。
        將 x 視為二補數範圍 [-2^269, 2^269)，並拆解成 9 個 30-bit limb。
        """
        # 先把 x 映射到 [-2^(269), 2^(269)) 的範圍
        x &= (self.MOD - 1)         # 先取 mod 2^270
        if x >= self.HALF:          # 若超過 2^269，視為負數 (two's complement)
            x -= self.MOD

        # 接著拆成 9 個 30-bit limb
        # 這裡全部用「非負」整數存入 self.limbs[i]
        # 也就是每個 limb 皆在 [0, 2^30)
        self.limbs = [0] * self.LIMBS
        if x < 0:
            x += self.MOD  # 如果是負數，就補上 2^270 化成「絕對值對應」的二補數
        for i in range(self.LIMBS):
            self.limbs[i] = x & ((1 << self.SHIFT) - 1)
            x >>= self.SHIFT

    def to_int(self) -> int:
        """
        將內部 9 個 30-bit limb 還原為 Python int。
        由於要支援負數，所以若組合後 >= 2^269，就要減掉 2^270 當作負數。
        """
        x = 0
        # 注意：組合時要先從最高 limb 開始 or 從最低 limb 開始都可以
        # 這邊從最低 limb (i=0) 依序往上，最後 x 會是 0～2^270-1 之間
        for i in reversed(range(self.LIMBS)):
            x <<= self.SHIFT
            x |= self.limbs[i]

        # 若超過 2^269，就代表是負數，要減 2^270
        if x >= self.HALF:
            x -= self.MOD
        return x

    def __add__(self, other: "BigIntRadix30") -> "BigIntRadix30":
        """
        加法示範：將自己與其他 BigIntRadix30 轉成 Python int，相加後再建構。
        在真正的低階實作中，會 limb-by-limb 做 carry，但這裡為了示範，直接轉回 int 處理。
        """
        return BigIntRadix30(self.to_int() + other.to_int())

    def __sub__(self, other: "BigIntRadix30") -> "BigIntRadix30":
        """
        減法示範：同理，先轉回 Python int 再相減。
        """
        return BigIntRadix30(self.to_int() - other.to_int())

    def __repr__(self):
        """
        顯示一下數值內容，用 16 進位或 10 進位都可以。
        這裡示範轉回 Python int，再以 10 進位顯示。
        """
        return f"BigIntRadix30({self.to_int()})"


# ---- 以下是簡單測試 ----
if __name__ == "__main__":
    # 建立幾個 BigIntRadix30
    a = BigIntRadix30(12345678901234567890)
    b = BigIntRadix30(-1)
    c = BigIntRadix30(-12345678901234567890)

    print("a =", a)        # a = BigIntRadix30(12345678901234567890)
    print("b =", b)        # b = BigIntRadix30(-1)
    print("c =", c)        # c = BigIntRadix30(-12345678901234567890)

    print("a + b =", a + b)      # 12345678901234567889
    print("b + c =", b + c)      # -12345678901234567891
    print("a - c =", a - c)      # (a - c) = 24691357802469135780

