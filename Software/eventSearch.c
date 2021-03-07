#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

bool getEvent(FILE *event, char *token){
	char *out = NULL;
    size_t line_buf_size = 0;

	while(getline(&out, &line_buf_size, event)>0){
		if(strstr(out, "Handlers=mouse0")){
			token = strtok(out, " ");
			token = strtok(NULL, " ");
			token = strtok(NULL, " ");
			return true;
		}
	}
	return false;
}


int main(int argc, char *argv[]){
	char *token;
	FILE *event;
	event = fopen("/proc/bus/input/devices","r");
	
	if(event == NULL) {
		printf("ERROR Opening %s\n", event);
		return EXIT_FAILURE;
	}

	if (getEvent(event, token))
		printf("%s\n", token);
	else
		printf("Not found\n");
	return 0;
}
