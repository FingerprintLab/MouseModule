#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <fcntl.h>
#include <sys/time.h>
#include <linux/input.h>
#include <regex.h>

//ritorna la stringa "eventX"
char* getEvent(){

	char *out = NULL;
    	size_t line_buf_size = 0;
        FILE *event;
	char *token;

	char *str;
	regex_t regex;
	int value;
	
	
	event = fopen("/proc/bus/input/devices","r");
	
	
	 if(event == NULL) {
        	printf("ERROR Opening %s\n", event);
        	return EXIT_FAILURE;
	}


	while(getline(&out, &line_buf_size, event)>0){

		if(strstr(out, "Handlers=mouse0")){
			token = strtok(out, " ");
			value = regcomp(&regex, "event[0-9]", 0);
			value = regexec(&regex, token, 0, NULL, 0);
		while(value!=0){
			token = strtok(NULL, " ");
			value = regcomp(&regex, "event[0-9]", 0);
			value = regexec(&regex, token, 0, NULL, 0);
		}
		return token;
		

		/*token = strtok(out, " ");
		token=strtok(NULL, " ");
		token=strtok(NULL, " ");
		return token;*/
		
		
  		 
		}
	}

	return EXIT_FAILURE;

}


int main(int argc, char *argv[])
{
	printf("%s\n",getEvent());

return 0;

	
}
