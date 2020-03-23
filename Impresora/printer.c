#ifndef PRINTER_H
#define PRINTER_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int leyendoString = 0;

void inicio(){
    printf("#include <studio.h>\n#include <stdlib.h>\n#include <string.h>\n");
    printf("int main() {\n");
}

void fin(){
    printf("return 0;\n}");
}

void leyendoTipoString(int esString){
    leyendoString = esString;
}

void CrearVariable(char* nombreVariable,char* valor){
    if (leyendoString == 1){
        printf("\tchar %s[2048] = %s;\n", nombreVariable, valor);
    }else{
        printf("\tint %s = %s;\n", nombreVariable, valor);
    }
}
#endif