#ifndef PRINTER_H
#define PRINTER_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int leyendoString = 0;
char printVars[20][2048];
int contadorVars = 0;
char varExiste[100][2048];
int cantVar = 0;

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
    bool noOcupado = true;
    for(int i = 0;i < cantVar; i++){
        if(strcmp(varExiste[i],nombreVariable) == 0){
            noOcupado = false;
            break;
        }
    }
    if(noOcupado){
        if (leyendoString == 1){
            printf("\tchar %s[2048] = %s;\n", nombreVariable, valor);
        }else{
            printf("\tint %s = %s;\n", nombreVariable, valor);
        }
        strcpy(varExiste[cantVar],nombreVariable);
        cantVar++;
    }else{
        printf("\t%s = %s;\n",nombreVariable,valor);
    }
}

void concatenaOperacion (char* origen, char* primero, char* operando, char* segundo) {
    if (strcmp("(",primero)==0 && strcmp(")",segundo)==0){
        int mamanio=strlen("(")+strlen(operando)+strlen(")");
        char retorno[mamanio-2];
        strcpy(retorno,"(");
        strcat(retorno,operando);
        strcat(retorno,")");
        strcpy(origen,retorno);
        free(retorno);
    }else{
        strcat(primero,operando);
        strcat(primero,segundo);
        strcpy(origen,primero);       
    }
}

void imprimir(char* comodines){
    printf("\tprintf(\"%s\"",comodines);
    for(int i = 0; i<contadorVars;i++){
        printf(", %s",printVars[i]);
    }
    printf(");\n");
    contadorVars = 0;
}

void importChait(){
    printf("\tprintf(\"%s\"");
}

void imprimirVariable(char* valor, char* origen){
    strcpy(printVars[contadorVars],valor);
    contadorVars++;
    strcpy(origen,"%i");
}

void imprimirTexto(char* valor, char* origen){
    strcpy(printVars[contadorVars],valor);
    contadorVars++;
    strcpy(origen,"%s");
}

void validacionIf(char* val){
    printf("\tif(%s > 0){\n",val);
}

void FinalIfCiclo(){
    printf("\n}\n");
}


#endif