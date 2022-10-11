
all: bminor

parser.c: parser.bison
	bison --defines=token.h --output=parser.c parser.bison

parser.o: parser.c
	gcc -c parser.c -o parser.o

scanner.c: scanner.flex
	flex -o scanner.c scanner.flex

scanner.o: scanner.c
	gcc -c scanner.c -o scanner.o

main.o: main.c
	gcc -c main.c -o main.o

bminor: parser.o scanner.o main.o
	gcc scanner.o parser.o main.o -o bminor

clean:
	@echo "Removing objects"
	rm token.h scanner.o parser.o main.o scanner.c parser.c parser.output *.out bminor

