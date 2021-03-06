#include <stdio.h>
#include <stdlib.h>

#define FILENAME "event.c"

int main() {
    char *line_buf = NULL;
    size_t line_buf_size = 0;
    int line_count = 0;
    size_t line_size;
    
    FILE *fp = fopen(FILENAME, "r");
    if (!fp) {
        fprintf(stderr, "Error opening file '%s'\n", FILENAME);
        return EXIT_FAILURE;
    }

    /* Get the first line of the file. */
    line_size = getline(&line_buf, &line_buf_size, fp);
    if (line_size > 0) {
        printf("%s\n", line_buf);
    }
    return 0;
}