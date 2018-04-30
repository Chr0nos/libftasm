section .text align=16
	global _ft_strlen

;size_t ft_strlen(const char *s);
_ft_strlen:
	push rbp		; saving rbp on the stack
	mov rbp, rsp	; adding the function of the stack

	cld				; setting loop direction to forward
	mov al, 0		; setting stop character
	mov rcx, -1		; putting counter at -1
	repne scasb		; running the loop

	mov rax, -2		; setting rax to -2
	sub rax, rcx	; substracting the count of rcx to rax
	pop rbp			; removing the function from the stack
	ret				; returninig
