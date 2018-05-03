section .text align=16
	global _ft_strdup
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc

;					rdi
;char *ft_strdup(const char *src);
_ft_strdup:
	push rbp
	mov rbp, rsp
	mov r15, rdi			; putting src in r15

	; size_t ft_strlen(char *src);
	call _ft_strlen
	mov r8, rax				; storing the len into r8

	; void *malloc(size_t size);
	mov rdi, r8				; passing the len to malloc
	inc rdi					; adding 1 for malloc '\0'
	call _malloc			; allocated pointer is in rax
	cmp rax, 0				; checking for malloc failure
	je .quit

	;char* ft_strcpy(char *dst, const char *src);
	mov rdi, rax			; rax contains malloc return
	mov rsi, r15			; rsi contains copy of src
	call _ft_strcpy

	;rax is already on dst
	.quit:
		pop rbp
		ret
