run: calculator
	./calculator < test.txt
bison:
	bison calculator.y --defines=calculator.h -o calculator.c
calculator.o: bison
	gcc -c -Wall calculator.c
flex: calculator.o
	flex -o calculator_lex.c calculator_lex.l
calculator_lex.o: flex
	gcc -c -Wall -w calculator_lex.c
calculator: calculator_lex.o
	gcc -Wall -w calculator.o calculator_lex.o -o calculator
clean:
	rm calculator calculator_lex.c calculator.o calculator.c calculator.h calculator_lex.o
