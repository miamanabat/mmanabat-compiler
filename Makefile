
all: bminor

main.o: main.c
	gcc -c main.c -o main.o

scanner.c: scanner.flex
	flex -o scanner.c scanner.flex

scanner.o: scanner.c
	gcc -c scanner.c -o scanner.o

bminor: scanner.o main.o
	gcc scanner.o main.o -o bminor

clean:
	@echo "Removing objects"
	rm scanner.o main.o scanner.c *.out bminor

