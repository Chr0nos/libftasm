section .text align=16
	global _ft_strcat
	extern _ft_strlen

;					rdi			rsi
;char	*ft_strcat(char *dest, const char *src);
_ft_strcat:
	push rbp
	mov rbp, rsp
	push rdi

	.seek:
		; seeks for the dest last pointer
		mov r8, rdi			; backup of rdi
		call _ft_strlen		; calling ft_strlen
		mov rdx, r8			; putting the destination begin to rdx
		add rdx, rax		; seek with the strlen return

	.copy:
		; performs the real copy to rdx from rsi
		; destination is in rdx pointer
		cmp byte[rsi], 0
		je .end
		mov r8b, [rsi]
		mov [rdx], r8b
		inc rdx
		inc rsi
		jmp .copy

	.end:
		; adding \0 at the end of dest
		mov byte[rdx], 0
		
	.quit:
		; prepairing return value
		pop rax
		pop rbp
		ret
