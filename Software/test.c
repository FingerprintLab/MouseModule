#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/time.h>
#include <linux/input.h>

#define TYPE(t) t##
/*
typedef struct input_event {
    struct timeval time;
    unsigned short type;
    unsigned short code;
    unsigned int value;
} input_event;
*/
int main(int argc, char** argv) {
    FILE *mouse;
    struct input_event event;

    mouse = fopen("/dev/input/event0", "r");
    if(mouse == NULL) {
        printf("ERROR Opening %s\n", mouse);
        return EXIT_FAILURE;
    }

    int i = 0;
    while(1) {
        size_t bytes = fread(&event, sizeof(struct input_event), 1, mouse);
	
        if (bytes > 0) {
            printf("************ EVENT %d ************\nsec: %ld, usec: %ld type: %hu, TYPE: %s,code: %hu, value: %d\n",
                    i, event.time.tv_sec, event.time.tv_usec, event.type, TYPE(event.type), event.code, event.value);
            i++;
        }
    }
    return EXIT_SUCCESS;
}

