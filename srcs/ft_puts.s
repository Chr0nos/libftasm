%define SYSCALL(x)	0x2000000 | x
%define WRITE 4
%define STDOUT 1

section .data
	eol db 10 ; '\n'
	nul db '(null)', 0

section .text align=16
	global _ft_puts
	extern _ft_strlen

;                   rdi
;int		ft_puts(const char *s);
_ft_puts:
	push rbp
	mov rbp, rsp
	push r12

	; protecton against NULL
	cmp rdi, 0
	jne .valid
	lea rdi, [rel nul]

	.valid:
		mov r15, rdi
		.len:
			call _ft_strlen
			push rax
			mov r12, rax

		.write:
			;ssize_t write(int fd, const void *src, size_t size);
			mov rax, SYSCALL(WRITE)
			mov rdi, STDOUT
			mov rsi, r15
			mov rdx, r12
			syscall

		.newline:
			mov rax, SYSCALL(WRITE);
			lea rsi, [rel eol]
			mov rdx, 1
			syscall
		
		pop rax

	.quit:
		pop r12
		pop rbp
		ret
