section .text align=16
	global _ft_isupper

;				rdi
;int ft_isupper(int c);
_ft_isupper:
	push rbp
	mov rbp, rsp
	cmp rdi, 'A'
	jl .noequal
	cmp rdi, 'Z'
	jg .noequal

	.equal:
		mov rax, 1
		jmp .quit

	.noequal:
		mov rax, 0

	.quit:
		pop rbp
		ret
