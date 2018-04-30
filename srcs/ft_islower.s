section .text align=16
	global _ft_islower

;			rdi
;ft_isalpha(int c);
_ft_islower:
	push rbp
	mov rbp, rsp
	cmp rdi, 'a'
	jl .noequal
	cmp rdi, 'z'
	jg .noequal
	jmp .equal

	.noequal:
		mov rax, 0
		jmp .quit

	.equal:
		mov rax, 1

	.quit:
		pop rbp
		ret
