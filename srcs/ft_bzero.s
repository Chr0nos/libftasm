section TEXT align=16
	global ft_bzero

;             (rdi, rsi)
;void ft_bzero(void *s, size_t n);
ft_bzero:
	push rbp
	mov rbp, rsp

	; creating a loop counter into rdx
	mov rdx, 0
	.loop:
		cmp rdx, rsi
		jge .quit
		; statement: setting 0 to the address and reenter into the loop
		.stmt:
			mov byte[rdi + rdx], 0
			jp .loop

	; removing the function from the stack
	.quit:
		pop rbp
		ret
