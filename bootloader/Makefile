BUILD_DIR=../build/bootloader

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/bootloader.o, $(BOOTLOADER_SRCS))

all: $(BOOTLOADER_OBJS)

$(BUILD_DIR)/bootloader.o: bootloader.asm
	@mkdir -p $(BUILD_DIR)
	nasm -f elf $< -F dwarf -g -o $@
	ld -m elf_i386 -T bootloader.lds -g $@ -o $@.elf
	objcopy -O binary $(BUILD_DIR)/bootloader.o.elf $@
	
clean:
	@rm -rf $(BUILD_DIR)
