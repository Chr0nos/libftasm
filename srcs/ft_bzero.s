section .text align=16
	global _ft_bzero

;             (rdi, rsi)
;void ft_bzero(void *ptr,  size_t n);
_ft_bzero:
	push rbp
	mov rbp, rsp

	push rdi			; backup of ptr
	mov rcx, rsi		; setting the size to bzero
	mov rax, 0			; setting pattern to copy

	cld
	rep stosb			; repstring for effective copy
	
	pop rax				; restoring ptr
	pop rbp
	ret
