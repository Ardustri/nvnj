#!/usr/bin/make
# ? MIT License
# Copyright (c) 2019 Jonah Alligood
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
CC=llvm-gcc
ARC=ar rcs
CFLAGS=-c -g -Wall -I include
LDFLAGS=-g -I include
SHRFLAGS=-fPIC -shared -Wall
SRC=${wildcard src/*.c}
HDR=${wildcard include/*.h}
TST=${wildcard tests/*.c}
OBJ=${SRC:.c=.o}
EXEC=nvn

all: ${SRC} ${OBJ} ${EXEC}

debug: all
debug: CFLAGS += -DDEBUG

${EXEC}: ${OBJ}
	${CC} ${LDFLAGS} $^ -o $@

%.o: %.c ${HDR}
	${CC} ${CFLAGS} $< -o $@

nvn.o: $(HDR) $(SRC)
	$(CC) $(LDFLAGS) $(CFLAGS) src/main.c -o nvn.o

nvn.so: $(HDR) $(SRC)
	$(CC) $(LDFLAGS) $(SHRFLAGS) -o $@ src/main.c -lc

nvn.a:
	$(ARC) nvn.a nvn.o

test: $(HDR) $(SRC) $(TST)
	$(CC) $(LDFLAGS) test/main.c

# clean script
clean:
	rm -rf src/*.o ${EXEC} ./*.so a.out ./*.o ./*.a *.dSYM
