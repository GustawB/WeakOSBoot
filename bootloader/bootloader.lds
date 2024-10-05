OUTPUT_FORMAT("elf32-i386")

SECTIONS    /* custom program sections */
{
    . = 0x7c00;    /* base address */
    .text : { *(.text) }    /* combine all .text sections into one final and "store" the, in code segment */
    .data : { *(.data) }
    .bss : { *(.bss) }
    
    . = 0x7dfe;
    .bootsig : {
        SHORT(0xAA55);
    }
}