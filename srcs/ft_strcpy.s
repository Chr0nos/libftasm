section .text align=16
	global _ft_strcpy
	extern _ft_strlen
	extern _ft_memcpy

;					rdi			rsi
;char* ft_strcpy(char *dst, const char *src);
;_ft_strcpy:
;	push rbp				; backup of rbp on the stack
;	mov rbp, rsp			; adding this function in rbp
;	mov r8, rdi				; adding (dest) to r8
;
;	.copy:
;		mov al, [rsi]
;		mov [rdi], al
;		cmp al, 0
;		je .quit
;		inc rdi
;		inc rsi
;		jmp .copy
;
;	.quit:
;		mov rax, r8			; getting the original dest
;		pop rbp
;		ret


;						rdi			rsi
;char *_ft_strcpy(char *dest, const char *src);
_ft_strcpy:
	push rbp
	mov rbp, rsp
	push r12
	push r15

	; size_t ft_strlen(const char *src);
	mov r12, rdi		; backup of dest
	mov rdi, rsi		; setting src as dest
	call _ft_strlen		; calling ft_strlen
	mov r15, rax		; storing the len in r15
	mov rdi, r12		; restoring rdi (for ft_memcpy call)

	;void *ft_memcpy(void *dest, const void *src, size_t size);
	mov rdx, rax
	inc rdx						; adding 1 to copy size (copy the \0)
	call _ft_memcpy				; copy the string

	.quit:
		pop r15
		pop r12
		;rax is already on dest
		pop rbp
		ret
