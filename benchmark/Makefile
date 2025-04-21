# benchmark/Makefile — build the benchmark binary (all sources live inside benchmark/)
# ----------------------------------------------------------------------
# Usage:
#   $ make               # generate common/data.h (if needed) and build ./bench
#   $ make clean         # remove object files and executable
#
# Directory layout (everything under benchmark/):
#   benchmark/
#     ├── benchmark.c
#     ├── Makefile            (this file)
#     ├── common/             (data.h, make_data.py, helper asm/c)
#     ├── ref_intmul/         (reference implementation 1)
#     ├── ref_redmul/         (reference implementation 2)
#     └── my_invert/          (your optimized implementation)
#
# ----------------------------------------------------------------------

# ----------------- user‑tunable variables -----------------
CC      ?= clang                     # or gcc
CFLAGS  ?= -O3 -march=native -std=gnu11 -Icommon
ASMFLAGS?=                           # extra flags for assembling .S files

# ----------------- source lists -----------------
SRC_ROOT     := $(wildcard *.c *.S)
SRC_COMMON   := $(wildcard common/*.c common/*.S)
SRC_REF_INT  := $(wildcard ref_intmul/*.c ref_intmul/*.S)
SRC_REF_RED  := $(wildcard ref_redmul/*.c ref_redmul/*.S)
# SRC_FAST     := $(wildcard my_invert/*.c  my_invert/*.S)

SRCS := $(SRC_ROOT) $(SRC_COMMON) $(SRC_REF_INT) $(SRC_REF_RED)
# SRCS := $(SRC_ROOT) $(SRC_COMMON) $(SRC_REF_INT) $(SRC_REF_RED) $(SRC_FAST)
OBJS := $(SRCS:%.S=%.o)
OBJS := $(OBJS:%.c=%.o)

TARGET := bench

# data generation
DATA_PY := common/make_data.py
DATA_H  := common/data.h

# ----------------- rules -----------------
.PHONY: all clean data

all: $(TARGET)

# produce common/data.h if missing or generator is newer
$(DATA_H): $(DATA_PY)
	python3 $<

data: $(DATA_H)

# compile/assemble — use same compiler for simplicity
%.o: %.S $(DATA_H)
	$(CC) $(ASMFLAGS) -c $< -o $@

%.o: %.c $(DATA_H)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): data $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

clean:
	rm -f $(TARGET) $(OBJS)

