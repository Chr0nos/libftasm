%define SYSCALL	0x2000000 | x
%define WRITE 4
%define STDOUT 1

section .text align=16
	global _ft_puts
	extern _ft_strlen

section .data

;                   rdi
;int		ft_puts(const char *s);
_ft_puts:
	push rbp
	mov rbp, rsp
	; protecton against NULL
	cmp rdi, 0
	je .quit
	; valid string
	; storing len into rcx
	call _ft_strlen
	mov rcx, rax
	; backup of rdi
	mov r8, rdi

	.write:
		; ssize_t write(int fd, const char *src, size_t len);
		mov rax, SYSCALL(WRITE)
		mov rdi, STDOUT
		mov rsi, r8
		mov rdx, rcx
		syscall

	.newline:
		mov rax, SYSCALL(WRITE)
		mov rdi, STDOUT
		mov rsi

	.quit:
		pop rbp
		ret
