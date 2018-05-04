section .text align=16
	global _ft_strchr

;					rdi,	rsi (sil = 8 bits low)
;char *ft_strchr(char *str, int c)
_ft_strchr:
	push rbp
	mov rbp, rsp
	push r12
	mov r12, 0							; creating a counter in r12

	.loop:
		mov r15b, byte[rdi + r12]		; reading a byte at str[i]
		cmp r15b, 0						; checking of the current char is \0
		je .loopend
		cmp r15b, sil
		je .charfound
		inc r12							; incrementing the pos counter
		jmp .loop						; loop again

	.charfound:
		add rdi, r12
		mov rax, rdi
		jmp .quit

	.loopend:
		cmp r15b, sil					; check if the end == c
		jne .notfound					; if not, we quit with NULL
		add rdi, r12					; adding counter value to str ptr
		mov rax, rdi					; setting str to rax
		jmp .quit

	.notfound:
		mov rax, 0

	.quit:
		pop r12
		pop rbp
		ret
