#include <stdio.h>
#include <stdlib.h>

int main (int argc, char** argv) {
    const char* path = "/dev/mem";
    FILE* mem = fopen(path, "rb");;

    if (mem == NULL) {
        printf("ERROR: Unable to open the '/dev/mem' file\n");
        return 1;
    }
    fclose(mem);
    return 0;
}
