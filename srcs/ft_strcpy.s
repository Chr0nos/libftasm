section .text align=16
	global _ft_strcpy

;					rdi			rsi
;char* ft_strcpy(char *dst, const char *src);
_ft_strcpy:
	push rbp
	mov rbp, rsp
	push rsi
	.copy:
		mov rcx, [rsi]
		cmp rcx, 0
		je .quit
		mov [rdi], rcx
		inc rdi
		inc rsi
		jmp .copy

	.quit:
		pop rax
		pop rbp
		ret
	
