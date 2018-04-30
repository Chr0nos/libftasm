# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snicolet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/14 22:57:10 by snicolet          #+#    #+#              #
#    Updated: 2018/04/30 20:58:13 by snicolet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libftasm.a
BUILDIR=./build
SRCDIR=./srcs/
ARCH=macho64
SRCS=ft_bzero.s ft_strcat.s

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
