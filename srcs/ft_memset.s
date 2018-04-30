section .text align=16
	global _ft_memset

;				rdi			rsi		rdx
;void *ftmemset(void *dst, int c, size_t size);
_ft_memset:
	push rbp		; backup of the stack pointer
	mov rbp, rsp	; adding the function on the stack

	push rdi		; backing up dst

	mov rcx, rdx	; setting counter to size
	mov rax, rsi	; setting value to set in the loop
	cld				; setting loop direction to forward
	rep stosb		; perform a copy of size "rcx" with "rax" value

	; exiting
	pop rax			; setting back rax to "dst"
	pop rbp			; restoring the stack pointer
	ret				; returning
