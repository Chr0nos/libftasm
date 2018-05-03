section .text align=16
	global _ft_memalloc
	extern _malloc
	extern _ft_bzero

;void *ft_memalloc(size_t size);
_fT_memalloc:
	call _malloc
	cmp rax, 0
	je .quit
	mov rdi, rax
	mov rsi, rdi
	call _ft_bzero
	.quit:
		ret
