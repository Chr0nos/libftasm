# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snicolet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/14 22:57:10 by snicolet          #+#    #+#              #
#    Updated: 2018/04/30 19:50:23 by snicolet         ###   ########.fr        #
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
	ld $(OBJS) -o $(NAME)


test:
	nasm -f macho64 test.s
	ld test.o
	./a.out
