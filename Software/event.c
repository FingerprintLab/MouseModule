#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/time.h>
#include <linux/input.h>

/*
 * Uncomment these lines to avoid printing specific types of events
 */
#define NO_SYN
//#define NO_BTN
//#define NO_REL
//#define NO_ABS

struct str_event {
    struct timeval time;
    const char* type;
    const char* code;
    unsigned int value;
};

void printRaw(unsigned int i, const struct input_event* event) {
    printf("%d.\nsec: %ld, usec: %ld type: %hu, code: %hu, value: %d\n",
    i, event->time.tv_sec, event->time.tv_usec, event->type, event->code, event->value);
}

const char* getCode(const char* type, const unsigned short c) {
    if (strcmp(type,"EV_SYN")) {
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
                return "NOT_KNOWN";
                break;
        }
    } else if (strcmp(type,"EV_KEY")) {
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
    } else if (strcmp(type, "EV_REL")) {
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
    } else if (strcmp(type,"EV_ABS")) {
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

void setStrEvent(const struct input_event* systemEvent, struct str_event* event) {
    event->time = systemEvent->time;
    switch(systemEvent->type) {
        case EV_SYN:
            event->type = "EV_SYN";
            break;
        case EV_KEY:
            event->type = "EV_KEY";
            break;
        case EV_REL:
            event->type = "EV_REL";
            break;
        case EV_ABS:
            event->type = "EV_ABS";
            break;
        default:
            event->type = "TYPE_OTHER";
            break;
    }
    event->code = getCode(event->type, systemEvent->code);
}

void printStr(unsigned int i, const struct str_event* event) {
    #ifdef NO_SYN
        if (strcmp(event->type,"EV_SYN")) return;
    #endif
    
    #ifdef NO_BTN
        if (strcmp(event->type,"EV_KEY")) return;
    #endif
    
    #ifdef NO_REL
        if (strcmp(event->type,"EV_REL")) return;
    #endif

    #ifdef NO_ABS
        if (strcmp(event->type,"EV_ABS")) return;
    #endif
    
    printf("%d.\nSec: %ld, uSec: %ld Type: %s, Code: %s\n",
    i, event->time.tv_sec, event->time.tv_usec, event->type, event->code);
}

int main(int argc, char** argv) {
    FILE *mouse;
    struct input_event systemEvent;
    struct str_event myEvent;
    const char* filePath = "/dev/input/event6";

    mouse = fopen(filePath, "r");
    if(mouse == NULL) {
        printf("ERROR Opening %s\n", filePath);
        return EXIT_FAILURE;
    }

    unsigned int i = 0;
    while(1) {
        size_t bytes = fread(&systemEvent, sizeof(struct input_event), 1, mouse);
	
        if (bytes > 0) {
            //printRaw(i, &systemEvent);
            setStrEvent(&systemEvent, &myEvent);
            printStr(i, &myEvent);
            i++;
        }
    }
    return EXIT_SUCCESS;
}

