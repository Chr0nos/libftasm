section .text align=16
	global _ft_strcat

;					rdi			rsi
;char	*ft_strcat(char *dest, const char *src);
_ft_strcat:
	push rbp
	mov rbp, rsp

	.seek:
		; storing destination pointer to the end
		mov rdx, rdi
		cmp byte[rdx], 0
		je .copy
		inc rdx

	.copy:
		; performs the real copy
		; destination is in rdx pointer
		cmp byte[rsi], 0
		je .end
		mov r8, [rsi]
		mov [rdx], r8
		inc rdx
		inc rsi
		jmp .copy

	.end:
		; adding \0 at the end of dest
		mov byte[rdx], 0
		
	.quit:
		; prepairing return value
		mov rax, rdi
		pop rbp
		ret