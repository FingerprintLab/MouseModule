OPTIONS = -Wall -pedantic -pthread

event: event.o
	gcc -pthread -o event event.o

event.o: event.c
	gcc -c $(OPTIONS) event.c

clean:
	rm event.o event
