section .text align=16
	global _ft_strcmp

;						rdi				rsi
;int		ft_strcmp(const char *s1, const char *s2);
_ft_strcmp:
	push rbp
	mov rbp, rsp

	mov r15, 0							; setting counter to 0
	.loop:
		xor r8, r8						; reset register
		xor r9, r9						; reset register
		mov r8b, byte[rdi + r15]		; storing char 1 in r8b
		mov r9b, byte[rsi + r15]		; storing char 2 in r9b
		cmp r8d, 0						; checking for end of line for char 1
		je .quit						; quit if so
		inc r15							; otherwise incrase the counter
		cmp r8d, r9d					; check of char 1 == char 2
		je .loop						; loop is equal, otherwise quit

	.quit:
		xor rax, rax					; reset rax
		mov eax, r8d						; setting char 2 to value
		sub eax, r9d						; substractif char 1 value
		pop rbp
		ret
