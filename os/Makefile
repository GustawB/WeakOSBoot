BUILD_DIR=../build/os
OS=$(BUILD_DIR)/os

CFLAGS=-ffreestanding -nostdlib -gdwarf-4 -m32 -ggdb3

OS_SRCS := $(wildcard *.c)
OS_OBJS := $(patsubst %.c,$(BUILD_DIR)/%.o,$(OS_SRCS))

all: $(OS)

$(BUILD_DIR)/os.o: os.c
	@mkdir -p $(BUILD_DIR)
	i686-elf-gcc $(CFLAGS) -c $< -o $@

$(OS): $(OS_OBJS)
	i686-elf-ld -nmagic -T os.lds $(OS).o -o $(OS)
clean:
	rm -rf $(BUILD_DIR)
