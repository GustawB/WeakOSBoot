%ifndef IO_ASM
%define IO_ASM

%macro	GetCursorLoc	0
	mov	ah, 03h
	mov 	bh, 0
	int	10h
%endmacro

%macro	MovCursor	0
	mov	ah, 02h
	mov 	bh, 00h	; clear bh because it's the page number
	; Interrupt for screen functions. This one will set the cursor
	; to the location (dl, dh)
	int	10h
%endmacro

%macro	PutChar	0
%%print_loop:
	mov	ah, 0Eh
	int 	10h
	loop	%%print_loop
%endmacro

%macro	Print	0
	GetCursorLoc		; get starting position
	inc	dh		; add row of space
	MovCursor		;update cursor positioning
%%print_loop:
	lodsb			; load ds:esi into al
	cmp	al, 00h		; check if null char
	je	%%finish_print
	mov	cx, 1		; parameter for PutChar (nr of reputs)
	PutChar			; write read char
	inc	dl
	MovCursor
	jmp	%%print_loop

%%finish_print:			; move cursor to next line
	xor	dl, dl
	inc	dh
	int	10h

%endmacro

%endif
