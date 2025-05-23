# SPDX-License-Identifier: Apache-2.0
.PHONY: all clean

# ==== 目標 ====
BIN     := bench bench_divstepx20 bench_update_VS_mont bench_update_FG bench_dummy

# ==== Compiler / Linker ====
CC ?= gcc
LD := $(CC)

# ==== 檔案分類 ====
BENCH_SRC          := bench.c
BENCH_DIVSTEP_SRC  := bench_divstepx20.c
BENCH_UPDATE_VS_MONT_SRC  := bench_update_VS_mont.c
BENCH_UPDATE_FG_SRC  := bench_update_FG.c
BENCH_DUMMY_SRC  := bench_dummy.c

COMMON_SRC := \
  hal/hal.c \
  ../external/sole_inv25519/fe25519_intmul_invert.c \
  ../external/sole_inv25519/fe25519_intmul.S \
  ../external/sole_inv25519/fe25519_intmul_nsquare.S \
  ../external/sole_inv25519/fe25519_intmul_square.S \
  ../src/cpt_inv_func6.c \
  ../src/i_loop/i_loop.S \
  ../src/divstepx20/divstepx20.S \
  ../src/big30_and_uint256/big30_from_uint256.S \
  ../src/big30_and_uint256/uint256_from_big30.S \
  ../src/j_loop/j_loop.S \
  ../src/j_loop_final/j_loop_final.S \
  ../src/final_adjustment/final_adjustment.S \
  ../src/update_FG/update_FG.S \
  ../src/update_VS/update_VS_mont.S \
  64cycl.S \

# ==== 把 .c / .S 各自換成 .o ====
OBJ_COMMON         := \
  $(patsubst %.c,%.o,$(filter %.c,$(COMMON_SRC))) \
  $(patsubst %.S,%.o,$(filter %.S,$(COMMON_SRC)))

OBJ_BENCH          := $(patsubst %.c,%.o,$(BENCH_SRC))
OBJ_BENCH_DIVSTEP  := $(patsubst %.c,%.o,$(BENCH_DIVSTEP_SRC))
OBJ_BENCH_UPDATE_VS_MONT   := $(patsubst %.c,%.o,$(BENCH_UPDATE_VS_MONT_SRC))
OBJ_BENCH_UPDATE_FG   := $(patsubst %.c,%.o,$(BENCH_UPDATE_FG_SRC))
OBJ_BENCH_DUMMY   := $(patsubst %.c,%.o,$(BENCH_DUMMY_SRC))
# ==== 編譯旗標 ====
CFLAGS := -Wall -Wextra -Werror -Wshadow -Wpointer-arith \
          -Wredundant-decls -Wno-long-long -Wno-unknown-pragmas \
          -Wno-unused-command-line-argument \
          -O3 -fomit-frame-pointer -std=c99 -pedantic \
          -Ihal -MMD

ifeq ($(CYCLES),PMU)
  CFLAGS += -DPMU_CYCLES
endif
ifeq ($(CYCLES),PERF)
  CFLAGS += -DPERF_CYCLES
endif
ifeq ($(CYCLES),MAC)
  CFLAGS += -DMAC_CYCLES
endif

# ==== 最終目標 ====
all: $(BIN)

# bench
bench: $(OBJ_COMMON) $(OBJ_BENCH)
	$(LD) $^ -o $@

# bench_divstepx20
bench_divstepx20: $(OBJ_COMMON) $(OBJ_BENCH_DIVSTEP)
	$(LD) $^ -o $@

# bench_update_VS_mont
bench_update_VS_mont: $(OBJ_COMMON) $(OBJ_BENCH_UPDATE_VS_MONT)
	$(LD) $^ -o $@

# bench_update_FG
bench_update_FG: $(OBJ_COMMON) $(OBJ_BENCH_UPDATE_FG)
	$(LD) $^ -o $@

# bench_dummy
bench_dummy: $(OBJ_COMMON) $(OBJ_BENCH_DUMMY)
	$(LD) $^ -o $@

# ==== 通用規則 ====
# .c → .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# .S → .o
%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

# ==== 依賴自動包含 (.d 由 -MMD 產生) ====
-include $(wildcard *.d */*.d */*/*.d)

# ==== 清理 ====
clean:
	$(RM) -f $(BIN) $(OBJ_COMMON) $(OBJ_BENCH) \
	       $(OBJ_BENCH_DIVSTEP) $(OBJ_BENCH_UPDATE_VS_MONT) $(OBJ_BENCH_UPDATE_FG) $(OBJ_BENCH_DUMMY) *.d

