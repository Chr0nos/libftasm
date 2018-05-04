%define SYSCALL(x)	0x2000000 | x
%define READ		3
%define WRITE		4
%define STDOUT		1
%define BUFF_SIZE	2048

section .bss align=16
	buffer resb BUFF_SIZE

section .text align=16
	global _ft_cat

;				rdi
;void	ft_cat(const int fd);
_ft_cat:
	push rbp
	mov rbp, rsp
	push r12
	push r15

	mov r12, rdi					; storing fd in r12

	; event is the case of a valid fd
	.event:
		; ssize_t read(int fd, void * ptr, size_t size);
		mov rax, SYSCALL(READ)	; setting read as syscall
		mov rdi, r12			; reading on fd
		lea rsi, [rel buffer]	; setting the buffer as target
		mov rdx, BUFF_SIZE		; setting buffer size
		syscall
		jc .quit				; quit in case of error
		cmp rax, 0				; checking if read worked
		jle .quit
		mov r15, rax			; storing read size in rax
	
		; ssize_t write(int fd, void *ptr, size_t size);
		mov rax, SYSCALL(WRITE)	; setting write syscall
		mov rdi, STDOUT			; setting fd to stdout
		lea rsi, [rel buffer]	; setting buffer as source
		mov rdx, r15			; setting len returned by read
		syscall
		jc .quit				; quit in case of error
		; i know i can compare with r15 but i dont think it's a good idea
		cmp rax, 0				; check for a write error
		jle .quit
		jmp .event				; do the new read/write event.

	.quit:
		pop r15
		pop r12
		pop rbp
		ret
