section TEXT align=16
	global _ft_bzero

;void ft_bzero(void *s, size_t n);
_ft_bzero:
	push rsp		; mise de rsp sur la stack
	mov rbp, rsp	; copie de rsp dans rbp
	
	pop rsp			; remise de la valeur originele de rsp
