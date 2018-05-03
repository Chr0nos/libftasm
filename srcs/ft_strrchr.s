section .text align=16
	global _ft_strrchr
	extern	_ft_strlen

;char	*ft_strrchr(char *src, int c);
_ft_strrchr:
	mov r8b, rdi						; backup original src in r8
	call _ft_strlen
	cmp rax, 0
	je .quit
	add rdi, rax						; set the src ptr to the end

	; check if c == '\0', if so i return the current position and go
	cmp sil, 0
	jne .loop
	mov rax, rdi
	jmp .quit

	.loop:
		cmp BYTE [rdi], sil				; read char and cmp with c
		je .found
		dec rdi							; go to previous char
		cmp BYTE [rdi], r8b				; check if ptr < src
		jge .loop						; if not then next loop iteration

	.found:
		mov rax, rdi

	.quit:	
		ret

