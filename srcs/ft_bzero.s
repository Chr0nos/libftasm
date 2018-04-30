section .text align=16
	global _ft_bzero

;             (rdi, rsi)
;void ft_bzero(void *s, size_t n);
_ft_bzero:
	push rbp
	mov rbp, rsp

	; creating a loop counter into rdx
	mov rdx, 0
	.loop:
		cmp rdx, rsi
		jge .quit
		; statement: setting 0 to the address and reenter into the loop
		mov byte[rdi + rdx], 0
		inc rdx
		jmp .loop

	; removing the function from the stack
	.quit:
		pop rbp
		ret
