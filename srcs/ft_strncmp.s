section .text align=16
	global _ft_strncmp

;						rdi				rsi				rdx
;int		ft_strcmp(const char *s1, const char *s2, size_t n);
_ft_strncmp:
	push rbp
	mov rbp, rsp
	push r11
	push r12
	push r13
	push r15

	mov r15, 0							; setting counter to 0
	mov r11, rdx						; storing n as max counter
	.loop:
		xor r12, r12					; reset register
		xor r13, r13						; reset register
		mov r12b, byte[rdi + r15]		; storing char 1 in r12b
		mov r13b, byte[rsi + r15]		; storing char 2 in r9b
		cmp r12d, 0						; checking for end of line for char 1
		je .quit						; quit if so
		inc r15							; otherwise incrase the counter
		cmp r12d, r13d					; check of char 1 == char 2
		jne .quit						; loop is equal, otherwise quit
		cmp r15, r11
		jge .quit
		jmp .loop

	.quit:
		xor rax, rax					; reset rax
		mov eax, r12d					; setting char 2 to value
		sub eax, r13d					; substractif char 1 value
		pop r15
		pop r13
		pop r12
		pop r11
		pop rbp
		ret
