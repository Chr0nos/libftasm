section .text align=16
	global _ft_strrchr
	extern	_ft_strlen

;								sil
;					rdi			rsi
;char	*ft_strrchr(char *src, int c);
_ft_strrchr:
	; uses registers:
	; r12, rdi, rsi
	; ensure protect value of: r12
	push rbp
	mov rbp, rsp
	push r12						; backup r12
	mov r12, rdi					; putting src in r12 (origin)

	call _ft_strlen
	mov rdi, r12					; putting back src in rdi
	add rdi, rax					; adding ft_strlen to rdi (seek to end)
	.loop:
		cmp byte[rdi], sil			; check for "c" char
		je .found					; if match then go to found
		dec rdi						; ptr--;
		cmp rdi, r12				; check if ptr < origin
		jge .loop
		jmp .quit

	.found:
		mov rax, rdi

	.quit:
		pop r12						; restore r12
		pop rbp
		ret

