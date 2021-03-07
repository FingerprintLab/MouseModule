/*
 * This program captures some significant mouse events
 * and displays them in a human readable format. The 
 * strings are taken from the definitions in "linux/input.h"
 * 
 * TODO:
 *  - Change the way events are recorded. the 'relevant'
 *    variable is not suitable since it pushes also the last
 *    RECORD event
 *  - Not allow the main handler to work while in playback
 *    mode (except for the ERASE event)
 *  - Complete 'handlePlayback()'
 */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <fcntl.h> 
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <pthread.h>
#include <linux/input.h>
#include <regex.h>

/*
 * Uncomment these lines to skip some events or some infos
 */
#define NO_INDEX
//#define NO_TIME
#define NO_OTHER
#define NO_SYN
//#define NO_BTN
//#define NO_REL
//#define NO_ABS

/* 
 * Human readable event struct
 */
struct str_event {
    long double timestamp;
    const char* type;
    const char* code;
    int value;
};

typedef struct {
    struct input_event* array;
    unsigned int length;
} List;

/*
 * Get the file name corresponding to the mouse
 */
bool getFileName(FILE* fp, char* name) {
    char* out = NULL;
    size_t line_buf_size = 0;
	char* token;

	regex_t regex;
	int value;

	while(getline(&out, &line_buf_size, fp) > 0) {
		if(strstr(out, "Handlers=mouse0")) {
			token = strtok(out, " ");
			value = regcomp(&regex, "event[0-9]", 0);
			value = regexec(&regex, token, 0, NULL, 0);
            while(value != 0) {
                token = strtok(NULL, " ");
                value = regcomp(&regex, "event[0-9]", 0);
                value = regexec(&regex, token, 0, NULL, 0);
            }
		    strcpy(name, token);
            return true; 
		}
	}
	return false;
}

/*
 * Print the raw event
 */
void printRaw(unsigned int i, const struct input_event* event) {
    printf("%d.\nsec: %ld, usec: %ld type: 0x%x, code: 0x%x, value: %d\n",
    i, event->time.tv_sec, event->time.tv_usec, event->type, event->code, event->value);
}

/* 
 * Transform CODE field in a string value based 
 * on the TYPE field
 */
const char* getCode(const char* type, const unsigned short c) {
    //printf("B) TYPE: %s, CODE: 0x%x\n", type, c);
    if (strcmp(type,"EV_SYN") == 0) {
        switch(c) {
            case SYN_REPORT:
                return "SYN_REPORT";
                break;
            case SYN_CONFIG:
                return "SYN_CONFIG";
                break;
            case SYN_MT_REPORT:
                return "SYN_MT_REPORT";
                break;
            case SYN_DROPPED:
                return "SYN_DROPPED";
                break;
            case SYN_MAX:
                return "SYN_MAX";
                break;
            case SYN_CNT:
                return "SYN_CNT";
                break;
            default:
                return "SYN_NOT_KNOWN";
                break;
        }
    } else if (strcmp(type,"EV_KEY") == 0) {
        switch(c) {
            case BTN_LEFT:
                return "BTN_LEFT";
                break;
            case BTN_RIGHT:
                return "BTN_RIGHT";
                break;
            case BTN_MIDDLE:
                return "BTN_MIDDLE";
                break;
            case BTN_SIDE:
                return "BTN_SIDE";
                break;
            case BTN_EXTRA:
                return "BTN_EXTRA";
                break;
            case BTN_FORWARD:
                return "BTN_FORWARD";
                break;
            case BTN_BACK:
                return "BTN_BACK";
                break;
            case BTN_TASK:
                return "BTN_TASK";
                break;
            default:
                return "BTN_OTHER";
                break;
        }
    } else if (strcmp(type, "EV_REL") == 0) {
        switch(c) {
            case REL_X:
                return "REL_X";
                break;
            case REL_Y:
                return "REL_Y";
                break;
            case REL_RX:
                return "REL_RX";
                break;
            case REL_RY:
                return "REL_RY";
                break;
            case REL_HWHEEL:
                return "REL_HWHEEL";
                break;
            case REL_WHEEL:
                return "REL_WHEEL";
                break;
            default:
                return "REL_OTHER";
                break;
        }
    } else if (strcmp(type,"EV_ABS") == 0) {
        switch(c) {
            case ABS_X:
                return "ABS_X";
                break;
            case ABS_Y:
                return "ABS_Y";
                break;
            case ABS_RX:
                return "ABS_RX";
                break;
            case ABS_RY:
                return "ABS_RY";
                break;
            case ABS_WHEEL:
                return "ABS_WHEEL";
                break;
            default:
                return "ABS_OTHER";
                break;
        }
    } else {
        return "CODE_OTHER";
    }
}

/*
 * Set the human readable event from the raw event
 */
void setStrEvent(const struct input_event* systemEvent, struct str_event* event) {
    if (systemEvent->type == EV_SYN) {
        event->type = "EV_SYN";
    } else if (systemEvent->type == EV_KEY) {
        event->type = "EV_KEY";
    } else if (systemEvent->type == EV_REL) {
        event->type = "EV_REL";
    } else if (systemEvent->type == EV_ABS) {
        event->type = "EV_ABS";
    } else {
        event->type = "TYPE_OTHER";
    }

    event->timestamp = (double) systemEvent->time.tv_sec + 0.000001 * (double) systemEvent->time.tv_usec;
    event->value = systemEvent->value;
    event->code = getCode(event->type, systemEvent->code);
}

/*
 * Print the human readable event
 */
void printHuman(unsigned int i, const struct str_event* event) {
    #ifdef NO_OTHER
        if(strcmp(event->type, "TYPE_OTHER") == 0) return;
    #endif

    #ifdef NO_SYN
        if (strcmp(event->type,"EV_SYN") == 0) return;
    #endif
    
    #ifdef NO_BTN
        if (strcmp(event->type,"EV_KEY") == 0) return;
    #endif
    
    #ifdef NO_REL
        if (strcmp(event->type,"EV_REL") == 0) return;
    #endif

    #ifdef NO_ABS
        if (strcmp(event->type,"EV_ABS") == 0) return;
    #endif
    
    #ifdef NO_TIME
        #ifdef NO_INDEX 
            printf("Type: %s, Code: %s, Value: %d\n",
            event->type, event->code, event->value);
        #else
            printf("%d.\nType: %s, Code: %s, Value: %d\n",
                i, event->type, event->code, event->value);
        #endif
    #else
        #ifdef NO_INDEX
            printf("Time: %Lf, Type: %s, Code: %s, Value: %d\n",
            event->timestamp, event->type, event->code, event->value);
        #else
            printf("%d.\nTime: %Lf, Type: %s, Code: %s, Value: %d\n",
                i, event->timestamp, event->type, event->code, event->value);
        #endif
    #endif
}

/*
 * Print the operation that each event should trigger
 */
void printFunctional(const struct str_event* event, bool* rec, bool* mode) {
    if (strcmp(event->type, "TYPE_OTHER") == 0) return;
    else if (strcmp(event->type, "EV_SYN") == 0) return;
#ifndef NO_BTN
    else if (strcmp(event->type, "EV_KEY") == 0) {
        if ((strcmp(event->code, "BTN_LEFT") == 0) && event->value == 1)
            printf("TRIGGER PULSE _|_\n");
        else if (strcmp(event->code, "BTN_RIGHT") == 0) {
            if ((event->value) == 0)
                printf("GATE OFF\n");
            else
                printf("GATE ON\n");
            }
        else if ((strcmp(event->code, "BTN_MIDDLE") == 0) && event->value == 1) {
            *mode = !(*mode);
            if (!(*mode))
                printf("Change mode to ATTENUATION\n");
            else
                printf("Change mode to OFFSET\n");
        }
        else if ((strcmp(event->code, "BTN_SIDE") == 0) && event->value == 1)
            printf("ERASE\n");
        else if ((strcmp(event->code, "BTN_EXTRA") == 0) && event->value == 1) {
            *rec = !(*rec);
            if (!(*rec))
                printf("Stop recording. Start playback\n");
            else
                printf("Start recording\n");
        }
#endif
#ifndef NO_REL
    } else if (strcmp(event->type, "EV_REL") == 0) {
        if (strcmp(event->code, "REL_X") == 0)
                printf("REL X: %d\n", event->value);
        else if (strcmp(event->code, "REL_Y") == 0)
            printf("REL Y: %d\n", event->value);
        else if (strcmp(event->code, "REL_WHEEL") == 0)
            printf("REL WHEEL: %d\n", event->value);
#endif
#ifndef NO_ABS
    } else if (strcmp(event->type, "EV_ABS") == 0) {
        if (strcmp(event->code, "ABS_X") == 0)
            printf("ABS X: %d\n", event->value);
        else if (strcmp(event->code, "ABS_Y") == 0)
            printf("ABS Y: %d\n", event->value);
        else if (strcmp(event->code, "ABS_WHEEL") == 0)
                printf("ABS WHEEL: %d\n", event->value);
    }
#endif
}

/*
 * Add events to a dynamic allocated array to record them
 */
void pushEvent(List* list, const struct input_event* event) {
    list->array = (struct input_event*) realloc(list->array, sizeof(*event) * (list->length + 1));
    list->array[list->length] = *event;
    list->length += 1;
}

/*
 * Erase the event list
 */
void emptyList(List* list) {
    free(list->array);
    list->length = 0;
}

/*
 * Event handlers
 */
void trigger(const long double t, const struct input_event* event, const bool* rec) {
    printf("%Lf, TRIGGER PULSE\n", t);
}
void gate(const long double t, const struct input_event* event, const bool* rec) {
    if (event->value == 1) {
        printf("GATE ON\n");
    } else {
        printf("GATE OFF\n");
    }
}
void changeMode(const long double t, const struct input_event* event, bool* mode, const bool* rec) {
    *mode = !(*mode);
    if (*mode) {
        printf("OFFSET MODE\n");
    } else {
        printf("ATTENUATION MODE\n");
    }
}
void* handlePlayback(void* arg) {
    List* list = (List*)arg;
    clock_t start, end;
    double elapsed;

    while(1) {
        printf("list length: %d\n", list->length);
        for (unsigned int i = 1; i < list->length; i++) {
            start = clock();
            long double time1 = (long double)list->array[i-1].time.tv_sec + 0.000001 * (long double)list->array[i-1].time.tv_usec;
            long double time2 = (long double)list->array[i].time.tv_sec + 0.000001 * (long double)list->array[i].time.tv_usec;
            double interval = time2- time1;
            printf("PLAYBACK | TIME: %Lf, TYPE: %hu, CODE: %hu\n", time2, list->array[i].type, list->array[i].code);
            do {
                end = clock();
                elapsed = ((double) (end - start))/CLOCKS_PER_SEC;
            } while(elapsed < interval);
        }
    }
    pthread_exit(NULL);
    return NULL;
}
void playback(bool* pb, List* list) {
    *pb = !(*pb);
    if (*pb) {
	    printf("START PLAYBACK, registered %d events\n", list->length);
	    
        pthread_t thread;
        //pthread_create(&thread, NULL, handlePlayback, (void*)&list);
        //pthread_join(thread, NULL);

        int error = pthread_create(&thread, NULL, &handlePlayback, (void*)list);
        if (error != 0)
            printf("Unable to create thread: %s\n", strerror(error));
    } else {
	    printf("STOP PLAYBACK\n");
        emptyList(list);
    }
}
void erase(bool* pb, List* list) {
    if (*pb) {
	    playback(pb, list);
    }
    printf("ERASE\n");
    emptyList(list);
}
void record(const long double t, const struct input_event* event, bool* rec, bool* pb, List* list) {
    *rec = !(*rec);
    if (*rec) {
        if (*pb) {
            playback(pb, list);
        }
        printf("START RECORDING\n");
    } else {
        printf("STOP RECORDING\n");
	    playback(pb, list);
    }
}
void move(const long double t, const struct input_event* event, const bool axis, const bool* rec) {
    if (axis) {
        printf("X: %d\n", event->value);
    } else {
        printf("Y: %d\n", event->value);
    }
}
void wheel(const long double t, const struct input_event* event, const bool* mode, const bool* rec) {
    static unsigned int attenuation = 0;
    static int offset = 0;
    
    if (*mode) {
        if (event->value < 0) {
            printf("DECREASING OFFSET: %d\n", --offset);
        } else { 
            printf("INCREASING OFFSET: %d\n", ++offset);
        }
    } else {
        if (event->value < 0) {
            printf("DECREASING ATTENUATION: %d\n", --attenuation);
        } else {
            printf("INCREASING ATTENUATION: %d\n", ++attenuation);
        }
    }
}

/* 
 * Main handling function
 */
void handle(const struct input_event* event) {
    static bool rec = false; // recording state
    static bool pb = false; // playback state
    static bool mode = false; // false: attenuation | true: offset
    const long double timestamp = (long double) event->time.tv_sec +
	    0.000001 * (long double) event->time.tv_usec;
    bool relevant = false;
    static List list = {NULL, 0}; // array containing all recorded events
    
    if (event->type == EV_KEY) {
        if (event->code == BTN_LEFT && event->value == 1) {
            trigger(timestamp, event, &rec);
	        relevant = true;
        } else if (event->code == BTN_RIGHT) {
            gate(timestamp, event, &rec);
	        relevant = true;
        } else if (event->code == BTN_MIDDLE && event->value == 1) {

            /*
             * CLICK THE MOUSE WHEEL TO START/STOP RECORDING
             * (for mice without extra buttons)
             */
            //changeMode(timestamp, event, &mode, &rec);
            record(timestamp, event, &rec, &pb, &list);
	        relevant = true;
        } else if (event->code == BTN_SIDE && event->value == 1) {
            if (rec) {
                record(timestamp, event, &rec, &pb, &list);
            }
            erase(&pb, &list);
        } else if (event->code == BTN_EXTRA && event->value == 1) {
            record(timestamp, event, &rec, &pb, &list);
	        relevant = true;
        }
    } else if (event->type == EV_REL) {
        if (event->code == REL_X) {
            move(timestamp, event, true, &rec);
	        relevant = true;
        } else if (event->code == REL_Y) {
            move(timestamp, event, false, &rec);
	        relevant = true;
        } else if (event->code == REL_WHEEL) {
            wheel(timestamp, event, &mode, &rec);
	        relevant = true;
        }
    } else if (event->type == EV_ABS) {
        if (event->code == ABS_X) {
            move(timestamp, event, true, &rec);
	        relevant = true;
        } else if (event->code == ABS_Y) {
            move(timestamp, event, false, &rec);
	        relevant = true;
        } else if (event->code == ABS_WHEEL) {
            wheel(timestamp, event, &mode, &rec);
	        relevant = true;
        }
    }
    
    if (relevant && rec) {
	    pushEvent(&list, event);
    }
}

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
