section .text align=16
	global _ft_strcmp

;						rdi				rsi
;int		ft_strcmp(const char *s1, const char *s2);
_ft_strcmp:
	push rbp
	mov rbp, rsp

	xor r8, r8
	xor r9, r9
	mov r15, 0
	.loop:
		mov r8b, byte[rdi + r15]
		mov r9b, byte[rsi + r15]
		cmp r8b, 0
		je .quit
		inc r15
		cmp r8b, r9b
		je .loop

	.quit:
		; al = 8bits rax (xor to be sure it value 0)
		xor rax, rax
		mov al, r9b
		sub al, r8b
		pop rbp
		ret
