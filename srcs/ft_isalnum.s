section .text align=16
	global _ft_isalnum
	extern _ft_isdigit
	extern _ft_isalpha

;				rdi
;int ft_isalnum(int c);
_ft_isalnum:
	push rbp
	mov rbp, rsp

	; int ft_isdigit(int c);
	call _ft_isdigit
	cmp rax, 1
	je .quit
	; int ft_isalpha(int c);
	call _ft_isalpha

	.quit:
		pop rbp
		ret
