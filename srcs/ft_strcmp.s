section .text align=16
	global _ft_strcmp

;						rdi				rsi
;int		ft_strcmp(const char *s1, const char *s2);
_ft_strcmp:
	push rbp
	mov rbp, rsp
	push r12
	push r13
	push r15

	mov r15, 0							; setting counter to 0
	.loop:
		xor r12, r12					; reset register
		xor r13, r13						; reset register
		mov r12b, byte[rdi + r15]		; storing char 1 in r12b
		mov r13b, byte[rsi + r15]		; storing char 2 in r9b
		cmp r12d, 0						; checking for end of line for char 1
		je .quit						; quit if so
		inc r15							; otherwise incrase the counter
		cmp r12d, r13d					; check of char 1 == char 2
		je .loop						; loop is equal, otherwise quit

	.quit:
		xor rax, rax					; reset rax
		mov eax, r12d					; setting char 2 to value
		sub eax, r13d					; substractif char 1 value
		pop r15
		pop r13
		pop r12
		pop rbp
		ret
