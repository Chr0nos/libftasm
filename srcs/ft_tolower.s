section .text align=16
	global _ft_tolower
	extern _ft_isupper

;                      rdi
;int		ft_tolower(int c);
_ft_tolower:
	push rbp
	mov rbp, rsp
	call _ft_isupper
	cmp rax, 0
	je .quit

	; real conversion
	add rdi, 0x20

	.quit:
		mov rax, rdi
		pop rbp
		ret
