section .text align=16
	global _ft_strrchr
	extern	_ft_strlen

;					rdi			rsi
;char	*ft_strrchr(char *src, int c);
_ft_strrchr:
	mov r8, rdi							; backup original src in r8
	call _ft_strlen
	cmp rax, 0
	je .quit
	add rdi, rax						; set the src ptr to the end

	.loop:
		cmp BYTE [rdi], sil				; read char and cmp with c
		je .found
		dec rdi							; go to previous char
		cmp rdi, r8						; check if ptr < src
		jge .loop						; if not then next loop iteration
		mov rax, 0						; return NULL (not found)
		jmp .quit

	.found:
		mov rax, rdi

	.quit:	
		ret

