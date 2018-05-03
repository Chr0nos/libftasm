section .text align=16
	global _ft_strnew
	extern _ft_memalloc

;char *ft_strnew(size_t size);
_ft_strnew:
	push rbp
	mov rbp, rsp

	inc rdi
	call _ft_memalloc

	.quit:
		pop rbp
		ret
