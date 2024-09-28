; Bootloader
org 0x7c00	; loads bootloader under this address. this is standard location for bootloaders
bits 16
%include	"io.asm"
start:
	jmp boot

;; constants and vars
msg db "Welcome to WiseOS", 0ah, 0dh, 0h
; 0ah is Line Feed (LF) character
; 0dh is Carriage Return (CR) character
; 0h null terminates string

boot:
	cli                     ; interrupts disabled
        cld                     ; default direction

	xor	ax, ax
	mov	ds, ax
	mov	si, msg
	Print

	mov	ax, 0x50
	mov	es, ax		; buffer for kernel
	xor	bx, bx		; int 13h loads data read from disk under es:bx

	mov	al, 2		; read two sectors
	mov	ch, 0
	mov	cl, 2		; read second sector
	mov	dh, 0
	mov	dl, 0

	mov	ah, 02h
	int	13h		; BIOS interrupt for reading from disk
	xor	di, di
	jmp	0x0:0x500	; apparently some BIOSes will jump to reverse (seemed to be a case)

	hlt

times 510 - ($-$$) db 0	; fill remaining bytes (of 512 - boot sign = 510) with 0
dw 0xAA55	; Boot signature
