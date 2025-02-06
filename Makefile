# === 編譯器與旗標設定 ===
CC      = gcc
CFLAGS  = -Wall -Wextra -Iinclude

# === 主要程式 (可選) ===
MAIN_SRC   = src/main.c

# === 核心程式的 .c 與 .S ===
CORE_C_SRCS = src/int128_adds_int128.c
CORE_S_SRCS = src/int128_times_int128.S \
              src/int64_times_int256.S \
              src/int64_times_int64.S

MAIN_OBJS   = $(MAIN_SRC:.c=.o)
CORE_C_OBJS = $(CORE_C_SRCS:.c=.o)
CORE_S_OBJS = $(CORE_S_SRCS:.S=.o)
CORE_OBJS   = $(CORE_C_OBJS) $(CORE_S_OBJS)

# === Python 測試檔 (.py) 與對應的 C 檔 (.c) ===
TEST_PY = test/int64_times_int64_test.py \
          test/int64_times_int256_test.py \
		  test/int128_times_int128_test.py

TEST_C  = $(TEST_PY:.py=.c)

# === 對應的 .o
TEST_OBJS = $(TEST_C:.c=.o)

# === 執行檔清單 (一個測試檔對應一個 runner)
TEST_RUNNERS = int64_times_int64_test_runner \
               int64_times_int256_test_runner \
			   int128_times_int128_test_runner

# === 正式程式 (可有可無)
TARGET = ed25519_app


# -------------------------
#     Build Rules
# -------------------------

# (A) 預設目標: 建置正式應用
all: $(TARGET)

# (B) 連結: 正式應用程式 (含 main + 核心 .o)
$(TARGET): $(MAIN_OBJS) $(CORE_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# (C) test: 先執行 Python → .c，再編譯所有 runner，依序執行
test: $(TEST_C) $(TEST_RUNNERS)
	@echo "=== Running All Tests ==="
	@for runner in $(TEST_RUNNERS); do \
	    echo ">> $$runner"; \
	    ./$$runner || exit 1; \
	done

# --- 每個測試檔各自有專屬的連結規則 ---

# (C1) int64_times_int64_test_runner
int64_times_int64_test_runner: test/int64_times_int64_test.o $(CORE_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# (C2) int64_times_int256_test_runner
int64_times_int256_test_runner: test/int64_times_int256_test.o $(CORE_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# (C3) int64_times_int256_test_runner
int128_times_int128_test_runner: test/int128_times_int128_test.o $(CORE_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# (D) 編譯 Python → C
test/%.c: test/%.py
	python3 $<

# (E) 編譯 .c → .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# (F) 編譯 .S → .o
%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

# (G) clean
clean:
	rm -f $(MAIN_OBJS) $(CORE_OBJS) $(TEST_OBJS) \
	      $(TARGET) $(TEST_RUNNERS)
	rm -f $(TEST_C)  

.PHONY: all test clean
