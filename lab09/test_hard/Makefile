# Makefile generated at Tue 04 Aug 14:49 AEST 2020

CC = gcc
CFLAGS = -Wall -g

circmain:	circ2.o circmain.o circ1.o
	$(CC) $(CFLAGS) -o $@ circ2.o circmain.o circ1.o

circ2.o:	circ2.h circ1.h circ2.c
circmain.o:	circ1.h circ2.h circmain.c
circ1.o:	circ1.h circ2.h circ1.c
