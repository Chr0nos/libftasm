section .text align=16
	global _ft_memdel
	extern	_free

;					rdi
;void	ft_memdel(void **ptr);
_ft_memdel:
	cmp rdi, 0				; check for ptr = NULL
	je .quit
	push rbx				; storing memptr in non volatile
	mov rbx, rdi
	mov rdi, [rbx]			; getting *ptr
	call _free				; calling free
	mov QWORD [rbx],  0		; setting *ptr to 0
	pop rbx

	.quit:
		ret
