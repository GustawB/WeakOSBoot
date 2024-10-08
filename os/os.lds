ENTRY(main);

PHDRS
{
    headers PT_LOAD FILEHDR PHDRS;
    code PT_LOAD;
}

SECTIONS
{
    . = 0x600;
    .text BLOCK(0x100) : ALIGN(0x100) { *(.text) } :code
    .data : { *(.data) }
    .bss : { *(.bss) }
    /DISCARD/ : { *(.eh_frame) }
}