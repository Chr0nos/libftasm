section .text align=16
	global _ft_toupper
	extern _ft_islower

;                   rdi
;int	ft_toupper(int c);
_ft_toupper:
	push rbp
	mov rbp, rsp
	call _ft_islower
	cmp rax, 0
	je .invalid

	; doing real conversion
	mov rax, rdi
	sub rax, 0x20
	jmp .quit

	.invalid:
		mov rax, rdi

	.quit:
		pop rbp
		ret
