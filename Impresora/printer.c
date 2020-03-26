#ifndef PRINTER_H
#define PRINTER_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int leyendoString = 0;
char printVars[20][2048];
int contadorVars;

void inicio(){
    printf("#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n");
    printf("int main() {\n");
}

void fin(){
    printf("\n return 0;\n}");
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

void concatenaOperacion (char* origen, char* primero, char* operando, char* segundo) {
    strcat(primero,operando);
    strcat(primero,segundo);
    strcpy(origen,primero);
}

void RedefiniendoVariable (char* nombreVariable, char* valor) {
    printf("\t%s = %s;\n",nombreVariable,valor);
}

void imprimir(char* comodines){
    printf("\tprintf(%s",comodines);
    for(int i = 0; i<contadorVars;i++){
        printf(", %s",printVars[i]);
    }
    print(");\n");
    contadorVars = 0;
}

#endif