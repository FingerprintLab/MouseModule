/*
 * Event header file
 */

#ifndef EVENT_H
#define EVENT_H
#endif

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
 * from being printed
 */
#define NO_INDEX
//#define NO_TIME
#define NO_OTHER
#define NO_SYN
//#define NO_BTN
//#define NO_REL
//#define NO_ABS

/*
 * Maximum & minimum mouse position
 */
#define MAX_POS 1000
#define MIN_POS -MAX_POS

/* 
 * Human readable event struct
 */
struct str_event {
    long double timestamp;
    const char* type;
    const char* code;
    int value;
};

/*
 * Dynamically allocated event array
 */
typedef struct {
    struct input_event* array;
    unsigned int length;
} List;

/*
 * Thread data
 */
typedef struct {
    pthread_t id;
    List list;
    bool* stop;
} Thread;

/*
 * Function declarations
 */
bool getFileName(FILE* fp, char* name);
void printRaw(unsigned long i, const struct input_event* event);
const char* getCode(const char* type, const unsigned short c);
void setStrEvent(const struct input_event* systemEvent, struct str_event* event);
void printHuman(unsigned long i, const struct str_event* event);
void printFunctional(const struct str_event* event, bool* rec, bool* mode);
void pushEvent(Thread* thread, const struct input_event* event);
void stopThread(Thread* thread);
void trigger(const long double t, const struct input_event* event);
void gate(const long double t, const struct input_event* event);
void changeMode(const long double t, const struct input_event* event, bool* mode);
void* handlePlayback(void* arg);
void playback(bool* pb, Thread* thread);
void erase(bool* pb, Thread* thread, bool* stop);
void record(const long double t, const struct input_event* event, bool* rec, bool* pb, Thread* thread);
void move(const long double t, const struct input_event* event, const bool axis, int* val);
void wheel(const long double t, const struct input_event* event, const bool* mode);
void handle(const struct input_event* event);
