%define MACH_SYSCALL(nb)		0x2000000 | nb
%define STDOUT					1
%define WRITE					4
%define EXIT					1

section .data
	hello_world		db		"hello world!", 0x0a

section .text
	global start

start:
	; write(1, hello_world", 14)
	mov rax, MACH_SYSCALL(WRITE)		; syscall write 		    param 0
	mov rbx, STDOUT						; write to stdout			param 1
	mov rcx, hello_world				; ptr						param 2
	mov rdx, 14							; len						param 3
	syscall								; invoke the kernel
	; exit(0)
	mov rax, MACH_SYSCALL(EXIT)			; syscall exit
	mov rbx, 0							; exit success
	syscall

