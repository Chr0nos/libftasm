/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: snicolet <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/30 18:49:44 by snicolet          #+#    #+#             */
/*   Updated: 2018/05/02 01:01:22 by snicolet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H
# include <string.h>

void			ft_bzero(void *s, size_t size);
void			ft_strcat(char *dest, const char *src);
int				ft_isalpha(int c);
int				ft_isupper(int c);
int				ft_islower(int c);
int				ft_isdigit(int c);
int				ft_isprint(int c);
int				ft_toupper(int c);
int				ft_tolower(int c);
int				ft_isalnum(int c);
int				ft_isascii(int c);
size_t			ft_strlen(const char *src);
void			*ft_memset(void *dst, int c, size_t size);
void			*ft_memcpy(void *dst, const void *src, size_t size);
int				ft_puts(const char *src);
char			*ft_strdup(const char *src);
char			*ft_strcpy(char *dst, const char *src);
void			ft_cat(const int fd);
char			*ft_strchr(char *str, int c);

#endif
