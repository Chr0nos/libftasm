section .text align=16
	global ft_strlen

;size_t ft_strlen(const char *s);
_ft_strlen:
	push rbp
	mov rbp, rsp
	

	pop rbp
	ret
