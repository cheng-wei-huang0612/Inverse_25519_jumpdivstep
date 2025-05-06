# SPDX-License-Identifier: Apache-2.0

.PHONY: clean

TARGET = bench
CC  ?= gcc
LD  := $(CC)

SOURCES = hal/hal.c \
					bench.c \
					../external/sole_inv25519/fe25519_intmul_invert.c \
					../external/sole_inv25519/fe25519_intmul.S \
					../external/sole_inv25519/fe25519_intmul_nsquare.S \
					../external/sole_inv25519/fe25519_intmul_square.S \
					../src/cpt_inv_func4.c \
					../src/divstepx20/divstepx20.S \
					../src/big30_and_uint256/big30_from_uint256.S \
					../src/big30_and_uint256/uint256_from_big30.S \
					../src/j_loop/j_loop.S \
					../src/j_loop_final/j_loop_final.S \
					../src/final_adjustment/final_adjustment.S \
					../src/update_FG/update_FG.S \
					../src/update_VS/update_VS_mont_neon.c \

	# -Wmissing-prototypes \

CFLAGS := \
	-Wall \
	-Wextra \
	-Werror=unused-result \
	-Wpedantic \
	-Werror \
	-Wshadow \
	-Wpointer-arith \
	-Wredundant-decls \
	-Wno-long-long \
	-Wno-unknown-pragmas \
	-Wno-unused-command-line-argument \
	-O3 \
	-fomit-frame-pointer \
	-std=c99 \
	-pedantic \
	-Ihal \
	-MMD \
	$(CFLAGS)

ifeq ($(CYCLES),PMU)
	CFLAGS += -DPMU_CYCLES
endif

ifeq ($(CYCLES),PERF)
	CFLAGS += -DPERF_CYCLES
endif

ifeq ($(CYCLES),MAC)
	CFLAGS += -DMAC_CYCLES
endif

all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) $(SOURCES) -o $(TARGET)

clean:
	-$(RM) -rf $(TARGET) *.d
