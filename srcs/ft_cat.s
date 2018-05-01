%define SYSCALL(x)	0x2000000 | x
%define READ		3
%define WRITE		4
%define STDOUT		1
%define BUFF_SIZE	2048

section .bss align=16
	buffer resb BUFF_SIZE

section .text align=16
	global _ft_cat

;void	ft_cat(const int fd);
_ft_cat:
	push rbp
	mov rbp, rsp

	cmp rdi, 0					; if fd < 0 : quit
	jl .quit
	mov r8, rdi					; storing fd in r8

	; event is the case of a valid fd
	.event:
		; ssize_t read(int fd, void * ptr, size_t size);
		mov rax, SYSCALL(READ)	; setting read as syscall
		mov rdi, r8				; reading on fd
		lea rsi, [rel buffer]	; setting the buffer as target
		mov rdx, BUFF_SIZE		; setting buffer size
		syscall
		cmp rax, 0				; checking if read worked
		jl .quit
		je .quit
		mov r15, rax			; storing read size in rax
	
		; ssize_t write(int fd, void *ptr, size_t size);
		mov rax, SYSCALL(WRITE)	; setting write syscall
		mov rdi, STDOUT			; setting fd to stdout
		lea rsi, [rel buffer]	; setting buffer as source
		mov rdx, r15			; setting len returned by read
		syscall
		jmp .event				; do the new read/write event.

	.quit:
		pop rbp
		ret
