
all: bminor

parser.c: parser.bison type.o decl.o stmt.o expr.o param_list.o
	bison --defines=token.h --output=parser.c parser.bison

parser.o: parser.c
	gcc -c parser.c -o parser.o

scanner.c: scanner.flex
	flex -o scanner.c scanner.flex

scanner.o: scanner.c
	gcc -c scanner.c -o scanner.o

main.o: main.c
	gcc -c main.c -o main.o

type.o: type.c
	gcc -c type.c -o type.o

decl.o: decl.c
	gcc -c decl.c -o decl.o

stmt.o: stmt.c
	gcc -c stmt.c -o stmt.o

expr.o: expr.c
	gcc -c expr.c -o expr.o

param_list.o: param_list.c
	gcc -c param_list.c -o param_list.o

symbol.o: symbol.c
	gcc -c symbol.c -o symbol.o

scope.o: scope.c
	gcc -c scope.c -o scope.o

hash_table.o: hash_table.c
	gcc -c hash_table.c -o hash_table.o

bminor: parser.o scanner.o main.o type.o expr.o decl.o stmt.o param_list.o symbol.o scope.o hash_table.o
	gcc scanner.o parser.o main.o type.o decl.o stmt.o expr.o param_list.o symbol.o scope.o hash_table.o -o bminor

clean:
	@echo "Removing objects"
	rm -f token.h scanner.o parser.o main.o type.o decl.o stmt.o expr.o param_list.o symbol.o scope.o hash_table.o scanner.c parser.c parser.output *.out bminor

