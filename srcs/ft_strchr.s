section .text align=16
	global _ft_strchr

;					rdi,	rsi (sil = 8 bits low)
;char *ft_strchr(char *str, int c)
_ft_strchr:
	push rbp
	mov rbp, rsp
	mov r8, 0							; creating a counter in r8

	.loop:
		mov r15b, byte[rdi + r8]		; reading a byte at str[i]
		cmp r15b, 0						; checking of the current char is \0
		je .loopend
		cmp r15b, sil
		je .charfound
		inc r8							; incrementing the pos counter
		jmp .loop						; loop again

	.charfound:
		add rdi, r8
		mov rax, rdi
		jmp .quit

	.loopend:
		cmp r15b, sil					; check if the end == c
		jne .notfound					; if not, we quit with NULL
		add rdi, r8						; adding counter value to str ptr
		mov rax, rdi					; setting str to rax
		jmp .quit

	.notfound:
		mov rax, 0

	.quit:
		pop rbp
		ret
