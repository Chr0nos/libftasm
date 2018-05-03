section .text align=16
	global _ft_memalloc
	extern _malloc
	extern _ft_bzero

;                    rdi (r8)
;void *ft_memalloc(size_t size);
_ft_memalloc:
	push rbp
	mov rbp, rsp

	; void *malloc(size_t)
	call _malloc			; malloc with size
	cmp rax, 0				; check for NULL ptr
	je .quit
	mov r8, rax				; r8 = ptr
	mov r15, rdi			; r15 = size

	;			rdi			rsi
	; bzero(void *ptr, size_t size);
	mov rdi, r8				; ptr
	mov rsi, r15			; size
	call _ft_bzero

;	mov rax, r8		; return ptr
	.quit:
		pop rbp
		ret
