%define ASCII_MIN 0
%define ASCII_MAX 0x7f

section .text align=16
	global _ft_isascii

;					rdi
;int	ft_isascii(int c);
_ft_isascii:
	push rbp
	mov rbp, rsp
	cmp rdi, ASCII_MIN
	jl .failed
	cmp rdi, ASCII_MAX
	jg .failed
	mov rax, 1
	jmp .quit

	.failed:
		mov rax, 0

	.quit:
		pop rbp
		ret
