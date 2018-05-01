section .text align=16
	global _ft_strcpy

;					rdi			rsi
;char* ft_strcpy(char *dst, const char *src);
_ft_strcpy:
	push rbp				; backup of rbp on the stack
	mov rbp, rsp			; adding this function in rbp
	mov r8, rsi				; adding (src) to r8

	.copy:
		mov al, [rsi]
		mov [rdi], al
		cmp al, 0
		je .quit
		inc rdi
		inc rsi
		jmp .copy

	.quit:
		mov rax, r8			; getting the original dest
		pop rbp
		ret
	
