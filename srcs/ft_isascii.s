%define ASCII_MIN 0
%define ASCII_MAX 0x7f

section .text align=16
	global _ft_isascii

_ft_isascii:
	push rbp
	mov rbp, rsp
	cmp sil, ASCII_MIN
	jl .failed
	cmp sil, ASCII_MAX
	jg .quit
	mov rax, 1
	jmp .quit

	.failed:
		mov rax, 0

	.quit:
		pop rbp
		ret
