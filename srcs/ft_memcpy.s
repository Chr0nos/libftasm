section .text align=16
	global _ft_memcpy

;					rdi		rsi			rdx
;void *ft_memcpy(void *dst, void *src, size_t n);
_ft_memcpy:
	push rbp
	mov rbp, rsp
	push rdi

	mov rcx, rdx
	cld
	rep movsb

	pop rax
	pop rbp
	ret
