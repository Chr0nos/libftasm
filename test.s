%define MACH_SYSCALL(nb)		0x2000000 | nb
%define STDOUT					1
%define WRITE					4
%define EXIT					1

section .data
	hello_world		db		"hello world!", 0x0a
	.len			equ		$ - hello_world

section .text
	global start

start:
	; write(1, hello_world", 14)
	mov rax, MACH_SYSCALL(WRITE)		; syscall write 		    param 0
	mov rdi, STDOUT						; write to stdout			param 1
	mov rsi, hello_world				; ptr						param 2
	mov rdx, hello_world.len			; len						param 3
	syscall								; invoke the kernel
	; exit(0)
	mov rax, MACH_SYSCALL(EXIT)			; syscall exit
	mov rdi, 0							; exit success
	syscall

