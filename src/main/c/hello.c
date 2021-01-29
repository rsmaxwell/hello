
#include <stdio.h>
#include "version.h"

int main(int argc, char *argv[]) {
    printf("Hello World!\n");
    printf("    BUILD_ID   = %s\n", BUILD_ID);
    printf("    BUILD_DATE = %s\n", BUILD_DATE);
    printf("    GIT_COMMIT = %s\n", GIT_COMMIT);
    printf("    GIT_BRANCH = %s\n", GIT_BRANCH);
    printf("    GIT_URL    = %s\n", GIT_URL);
    return 0;
}

