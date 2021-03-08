/*
 * This program read some significant mouse events and use
 * them to generate analog signals through the Raspberry PI
 * GPIOs.
 */

#include "event.h"

int main(int argc, char** argv) {
    FILE *devices, *mouse;
    struct input_event systemEvent;
    struct str_event myEvent;

    /* Open the devices file */
    devices = fopen("/proc/bus/input/devices", "r");
    if (devices == NULL) {
        printf("ERROR: Unable to read /proc/bus/input/devices\n");
    }

    /* Get the file path corresponding to the mouse */
    char filePath[18] = "/dev/input/";
    char name[10];
    if (getFileName(devices, name))
        strcat(filePath, name);
    else
        printf("ERROR: Unable to find the mouse file\n");

    /* Open the mouse file */
    mouse = fopen(filePath, "r");
    if(mouse == NULL) {
        printf("ERROR: Unable to read %s\n", filePath);
        return EXIT_FAILURE;
    } else {
        printf("OPENINIG %s\n", filePath);
    }

    unsigned int i = 0;
    while(1) {
        size_t bytes = fread(&systemEvent, sizeof(struct input_event), 1, mouse);

        /* If we managed to read some bytes, print the relative events */
        if (bytes > 0) {
            //printRaw(i, &systemEvent);
            setStrEvent(&systemEvent, &myEvent);
            //printHuman(i, &myEvent);
	        //printFunctional(&myEvent, &rec, &mode);
            handle(&systemEvent);
            i++;
        }
    }
    return EXIT_SUCCESS;
}
