##
## EPITECH PROJECT, 2021
## B-ASM-400-NAN-4-1-asmminilibc-gildas.gonzalez
## File description:
## Makefile
##

SRC		=	sources/strlen.asm\
			sources/strchr.asm\
			sources/memset.asm\
			sources/memcpy.asm\
			sources/memmove.asm\
			sources/strcmp.asm\
			sources/strncmp.asm\
			sources/strcasecmp.asm\
			sources/rindex.asm\
			sources/strstr.asm\
			sources/strpbrk.asm\
			sources/strcspn.asm\

NAME	=	libasm.so

OBJ		=	$(SRC:%.asm=%.o)

ASM		=	nasm -f elf64

CC		=	gcc

CFLAGS	=	-Wall -Wshadow

LDFLAGS	=	-fPIC -shared -nolibc

all		:	$(OBJ)
			$(CC) -o $(NAME) $(LDFLAGS) $(OBJ)
			make clean

%.o		:	%.asm
			$(ASM) -o $@ $<

clean	:
			$(RM) $(OBJ)

fclean	:	clean
			$(RM) $(NAME)

re		:	fclean all

.PHONY	=	all clean fclean re