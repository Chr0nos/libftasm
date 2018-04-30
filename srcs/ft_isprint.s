%define MINCHAR 0x20
%define MAXCHAR 0x7e

section .text align=16
	global _ft_isprint

;int	ft_isprint(int c);
_ft_isprint:
	push rbp
	mov rbp, rsp

	cmp rdi, MINCHAR
	jl .notprint
	cmp rdi, MAXCHAR
	jg .notprint

	; charactere is printable
	mov rax, 1
	jmp .quit

	.notprint:
		mov rax, 0

	.quit:
		pop rbp
		ret
