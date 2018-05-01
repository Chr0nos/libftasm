# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snicolet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/14 22:57:10 by snicolet          #+#    #+#              #
#    Updated: 2018/05/02 01:09:47 by snicolet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libftasm.a
BUILDIR=./build
SRCDIR=./srcs/
ARCH=macho64
SRCS=ft_bzero.s ft_strcat.s ft_strlen.s ft_isalpha.s ft_islower.s ft_isupper.s \
	 ft_isdigit.s ft_isprint.s ft_toupper.s ft_tolower.s ft_strlen.s \
	 ft_memset.s ft_memcpy.s ft_puts.s ft_strdup.s ft_strcpy.s ft_cat.s \
	 ft_strchr.s ft_isalnum.s ft_isascii.s

OBJS=$(SRCS:%.s=$(BUILDIR)/%.o)

all: $(NAME)

$(BUILDIR):
	mkdir -p $(BUILDIR)

list:
	@echo $(OBJS)

$(BUILDIR)/%.o: $(SRCDIR)%.s
	nasm -f $(ARCH) $< -o $@

$(NAME): $(BUILDIR) $(OBJS)
	ar rc $(NAME) $(OBJS)

clean:
	$(RM) -r $(BUILDIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

test: $(NAME)
	clang -Wall -Werror -Wextra main.c -o test -L. -lftasm -I.
