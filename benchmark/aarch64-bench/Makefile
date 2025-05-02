# SPDX-License-Identifier: Apache-2.0

.PHONY: clean

TARGET = bench
CC  ?= gcc
LD  := $(CC)

SOURCES = hal/hal.c \
					bench.c \
					../ref_intmul/fe25519_intmul_invert.c \
					../ref_intmul/fe25519_intmul.S \
					../ref_intmul/fe25519_intmul_nsquare.S \
					../ref_intmul/fe25519_intmul_square.S \
					../my_invert/cpt_inv_func4.c \
					../my_invert/divstepx20.S \
					../my_invert/big30_from_uint256.S \
					../my_invert/j_loop.S \
					../my_invert/final_adjustment.S \
					../my_invert/j_loop_final.S \
					../my_invert/update_FG.S \
					../my_invert/update_VS_mont_neon.c \

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
