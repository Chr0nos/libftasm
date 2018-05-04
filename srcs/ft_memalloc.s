section .text align=16
	global _ft_memalloc
	extern _malloc
	extern _ft_bzero

;                    rdi (r15)
;void *ft_memalloc(size_t size);
_ft_memalloc:
	push rbp
	mov rbp, rsp

	call _malloc
	push rax
	cmp rax, 0
	je .quit

	mov rdi, rax
	mov rsi, rdi
	call _ft_bzero

	.quit:
		pop rax
		pop rbp
		ret
