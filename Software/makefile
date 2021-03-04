# why does it output "a.out" and not "event"?

OPTIONS = -Wall -pedantic

event: event.o
	gcc -o event event.o

event.o: event.c
	gcc -c $(OPTIONS) event.c

clean:
	rm event.o event
