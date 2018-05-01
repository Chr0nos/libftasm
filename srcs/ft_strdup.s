section .text align=16
	global _ft_strdup
	extern _ft_strlen
;	extern _ft_memcpy
	extern _ft_strcpy
	extern _malloc

;					rdi
;char *ft_strdup(const char *src);
_ft_strdup:
	push rbp
	mov rbp, rsp
	mov rcx, rdi

	; size_t ft_strlen(char *src);
	call _ft_strlen
	mov r8, rax				; storing the len into r8

	; void *malloc(size_t size);
	lea rdi, [rax + 1]		; adding 1 to the len of the string for malloc
	call _malloc			; allocated pointer is in rax
	cmp rax, 0				; checking for malloc failure
	je .quit

	;char* ft_strcpy(char *dst, const char *src);
	mov rdi, rax
	mov rsi, rcx
	call _ft_strcpy

	;rax is already on dst

	.quit:
		pop rbp
		ret
