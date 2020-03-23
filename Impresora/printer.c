#ifndef PRINTER_H
#define PRINTER_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void inicio(){
    printf("#include <studio.h>\n#include <stdlib.h>\n#include <string.h>\n");
    printf("int main() {\n");
}

void fin(){
    printf("return 0;\n}");
}

#endif