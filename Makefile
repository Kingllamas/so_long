# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mllamas- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/19 17:20:49 by mllamas-          #+#    #+#              #
#    Updated: 2023/12/28 15:22:56 by mllamas-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = so_long
SRCS = main.c srcs/check_map.c srcs/draw_map.c srcs/ft_aux.c srcs/check_components.c srcs/move_player.c gnl/get_next_line.c gnl/get_next_line_utils.c
OBJS = $(SRCS:.c=.o)
CFLAGS = -Wall -Wextra -Werror 
CC = cc
LIBFT = libft/libft.a
PRINTF = ft_printf/libftprintf.a

.PHONY: all clean fclean re

all: $(NAME)

%.o: %.c 
	$(CC) $(CFLAGS) -c $< -o $@

$(LIBFT):
	make -C libft/

$(PRINTF):
	make -C ft_printf/

clean:
	rm -f $(OBJS)
	make -C libft/ fclean
	make -C ft_printf/ fclean

fclean: clean
	rm -f $(NAME)

re: fclean all

$(NAME): $(OBJS) $(LIBFT) $(PRINTF)
	$(CC) $(CFLAGS) -Imlx -lmlx -framework OpenGL -framework AppKit -o $(NAME) $(OBJS) $(LIBFT) $(PRINTF)
