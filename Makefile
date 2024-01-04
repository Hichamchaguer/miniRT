# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: elel-yak <elel-yak@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/27 13:14:37 by elel-yak          #+#    #+#              #
#    Updated: 2023/12/27 20:58:00 by elel-yak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = miniRT

BNAME = miniRT-bonus

CC = cc
CFLAGS = -Wall -Wextra -Werror 
CFLAGS += -Ofast
# CFLAGS += -fsanitize=address -fsanitize=leak -g3 
LDFLAGS = -lmlx -lm -lXext -lX11 -lz

SRCS = 	mandatory/parsing/miniRT.c\
	  	mandatory/parsing/check_elements.c\
	  	mandatory/parsing/rt_utils.c\
	  	mandatory/parsing/rt_utils1.c\
	  	mandatory/parsing/get_next_line/get_next_line.c\
	  	mandatory/parsing/get_next_line/get_next_line_utils.c\
		mandatory/parsing/check_objects.c\
		mandatory/parsing/myatoi.c\
		mandatory/vector.c \
		mandatory/vector1.c \
		mandatory/vector2.c \
		mandatory/camera.c \
		mandatory/Image/image.c \
		mandatory/Image/image_utils.c \
		mandatory/Transformation/init_matrix.c \
		mandatory/Transformation/transfor_matrix.c\
		mandatory/Matrix/init.c \
		mandatory/Matrix/matrix.c \
		mandatory/Matrix/inverse.c \
		mandatory/Matrix/minor.c \
		mandatory/Matrix/Multiplication.c \
		mandatory/Objects/Sphere.c \
		mandatory/Objects/Plane.c \
		mandatory/raytrace_utils.c \
		mandatory/raytrace.c \
		mandatory/Material/material.c \
		mandatory/Material/Diffuse.c \
		mandatory/Material/specular.c \
		mandatory/Objects/Cylinder.c \
 		mandatory/Objects/Cylinder_utils.c \
		mandatory/main.c 

BSRCS = bonus/parsing/miniRT.c\
	  	bonus/parsing/check_elements.c\
	  	bonus/parsing/rt_utils.c\
	  	bonus/parsing/rt_utils1.c\
	  	bonus/parsing/get_next_line/get_next_line.c\
	  	bonus/parsing/get_next_line/get_next_line_utils.c\
		bonus/parsing/check_objects.c\
		bonus/parsing/myatoi.c\
		bonus/vector.c \
		bonus/vector1.c \
		bonus/vector2.c \
		bonus/camera.c \
		bonus/Image/image.c \
		bonus/Image/image_utils.c \
		bonus/Transformation/init_matrix.c \
		bonus/Transformation/transfor_matrix.c\
		bonus/Matrix/init.c \
		bonus/Matrix/matrix.c \
		bonus/Matrix/inverse.c \
		bonus/Matrix/minor.c \
		bonus/Matrix/Multiplication.c \
		bonus/Objects/Sphere.c \
		bonus/Objects/Plane.c \
		bonus/raytrace_utils.c \
		bonus/raytrace.c \
		bonus/Material/material.c \
		bonus/Material/Diffuse.c \
		bonus/Material/specular.c \
		bonus/Objects/Cylinder.c \
 		bonus/Objects/Cylinder_utils.c \
		bonus/main.c 

OBJS = $(SRCS:.c=.o)

BOBJS = $(BSRCS:.c=.o)

all : $(NAME)

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME) : $(OBJS)
	make -C mandatory/libft -j4
	$(CC) $(CFLAGS) $(OBJS) mandatory/libft/libft.a $(LDFLAGS) -o $(NAME)

bonus : $(BNAME)

$(BNAME) : $(BOBJS)
	make -C bonus/libft -j4
	$(CC) $(CFLAGS) $(BOBJS) bonus/libft/libft.a $(LDFLAGS) -o $(BNAME) 

clean :
	make clean -C mandatory/libft
	make clean -C bonus/libft
	rm -rf $(OBJS)
	rm -rf $(BOBJS)

fclean : clean
	make fclean -C mandatory/libft
	rm -rf $(NAME)
	make fclean -C bonus/libft
	rm -rf $(BNAME)

re : fclean all

.PHONY : all clean fclean re
