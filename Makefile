# === 編譯器與旗標設定 ===
CC      = gcc
CFLAGS  = -Wall -Wextra -Iinclude

# === 主要程式檔案 (只有 .c) ===
MAIN_SRC   = src/main.c

# === 核心程式的 .c 與 .S 分開列出 ===
CORE_C_SRCS = src/int128_adds_int128.c
CORE_S_SRCS = src/int128_times_int128.S \
              src/int64_times_int256.S \
              src/int64_times_int64.S

# === 測試程式 (只有 .c) ===
TEST_SRCS  = test/int64_times_int64_test.c

# === 根據檔案類型分別生成 .o 清單 ===
MAIN_OBJS  = $(MAIN_SRC:.c=.o)
CORE_C_OBJS = $(CORE_C_SRCS:.c=.o)
CORE_S_OBJS = $(CORE_S_SRCS:.S=.o)
TEST_OBJS  = $(TEST_SRCS:.c=.o)

CORE_OBJS  = $(CORE_C_OBJS) $(CORE_S_OBJS)

# === 可執行檔 (正式 / 測試) ===
TARGET      = ed25519_app        # 正式程式
TEST_TARGET = test_runner        # 測試程式

# -------------------------
#     Build Rules
# -------------------------

# (1) 預設目標: 建置正式應用
all: $(TARGET)

# (2) 連結: 正式應用程式 (含 main + 核心 .o)
$(TARGET): $(MAIN_OBJS) $(CORE_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# (3) 測試目標: 連結測試 + 核心，不包含 main.o
test: $(TEST_TARGET)
	@echo "=== Running Tests ==="
	./$(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJS) $(CORE_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# (4) 編譯 .c -> .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# (5) 編譯 .S -> .o (組合語言)
%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

# (6) clean: 只刪除 .o、執行檔與測試檔
clean:
	rm -f $(MAIN_OBJS) $(CORE_OBJS) $(TEST_OBJS) \
	      $(TARGET) $(TEST_TARGET)

.PHONY: all test clean
