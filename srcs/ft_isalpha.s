section .text align=16
	global _ft_isalpha
	extern _ft_isupper
	extern _ft_islower

;               rdi
;int ft_isalpha(int c);
;by design i use the rax return from ft_isupper for the return
_ft_isalpha:
	push rbp
	mov rbp, rsp

	call _ft_islower
	cmp rax, 0
	jnz .quit ; the char is a lower

	call _ft_isupper ; let's do the resturn of rax, if not upper: not an alpha

	.quit:
		pop rbp
		ret
