section .text align=16
	global _ft_memalloc
	extern _malloc
	extern _ft_bzero

;                    rdi (r15)
;void *ft_memalloc(size_t size);
_ft_memalloc:
	push rbp
	mov rbp, rsp
	push r14
	push r15						; backup r15
	mov r15, rdi					; storing size into r15

	; void *malloc(size_t size);
	call _malloc
	mov r14, rax
	cmp rax, 0						; checking for null pointer
	je .quit

	; void ft_bzero(void *ptr, size_t size);
	mov rdi, r14
	mov rsi, r15
	call _ft_bzero

	.quit:
		mov rax, r14				; malloc returned pointer (may be NULL)
		pop r15						; restore r15
		pop r14
		pop rbp
		ret
