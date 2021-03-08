OPTIONS = -Wall -pedantic -pthread

main: main.o event.o
	gcc -pthread -o main main.o event.o

main.o: event.h main.c
	gcc -c $(OPTIONS) main.c

event.o: event.h analog.h event.c
	gcc -c $(OPTIONS) event.c

clean:
	rm event.o main.o main
