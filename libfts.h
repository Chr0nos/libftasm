/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: snicolet <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/30 18:49:44 by snicolet          #+#    #+#             */
/*   Updated: 2018/05/01 01:06:39 by snicolet         ###   ########.fr       */
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
size_t			ft_strlen(const char *src);
void			*ft_memset(void *dst, int c, size_t size);

#endif
