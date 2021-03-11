#include <stdio.h>
#include <stdlib.h>

#define MICE "/dev/input/mice"

int main (int argc, char** argv) {
    FILE* mice = fopen(MICE, "r");

    if (mice == NULL) {
        printf("ERROR: Failed to open %s\n", MICE);
        return 1;
    }
    
    size_t bytes;
    unsigned char* event[3];
    printf("Size: %d\n", sizeof(*event));
    while(1) {
        bytes = fread(event, sizeof(*event), 1, mice);
        if (bytes > 0) {
            printf("%hhu  %hhu  %hhu\n", event[0], event[1], event[2]);
            //free(event);
            //event = (unsigned char*) malloc(3);
        }
    }
    return 0;
}
