section .text align=16
	global _ft_isdigit

;              rdi
;int ft_isdigit(int c);
_ft_isdigit:
	push rbp
	mov rbp, rsp
	cmp rdi, '0'
	jl .notdigit
	cmp rdi, '9'
	jg .notdigit

	.digit:
		mov rax, 1
		jmp .quit

	.notdigit:
		mov rax, 0

	.quit:
		pop rbp
		ret

