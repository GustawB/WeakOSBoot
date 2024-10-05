define hook-stop
	# Translate the segment:offset into a physical address
	printf "[%4x:%4x] ", $cs, $eip
	x/i $cs*16+$eip
end

target remote localhost:26000

# Beginning of bootloader
b *0x7c00

set disassembly-flavor intel

layout asm
layout reg

# rn for bootloader which is 16-bit
set architecture i8086
