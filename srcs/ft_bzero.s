section TEXT align=16
	global _ft_bzero

;void ft_bzero(void *s, size_t n);
_ft_bzero:
	push rsp		; mise de rsp sur la stack
	
	pop rsp			; remise de la valeur originele de rsp
