#ifndef PRINTER_H
#define PRINTER_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "symbolTable.h"

int leyendoString = 0;
char printVars[20][2048];
int contadorVars = 0;

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
    int existeVariable= VarExists(nombreVariable);
    if(existeVariable==0){
        if (leyendoString == 1){
            printf("\tchar %s[2048] = %s;\n", nombreVariable, valor);
            AddVariable(nombreVariable,1);
        }else{
            printf("\tint %s = %s;\n", nombreVariable, valor);
            AddVariable(nombreVariable,2);
        }
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
    
    int esString = VarIsString(valor);
    if (esString == 1){
        strcpy(origen, "%s");
    } else if (esString == 2){
        strcpy(origen,"%d");
    }
}

void imprimirTexto(char* valor, char* origen){
    strcpy(printVars[contadorVars],valor);
    contadorVars++;
    strcpy(origen,"%s");
}
//comprueba si es una variable numerica entera, curiosamente lo que imprime siempre es lo mismo
//pide el numero de linea ya que es un susceptible a errores semanticos
void validarVariableCondicional(char* nombreVariable, int numeroLinea){
    if(VarExists(nombreVariable)==1){
        if(VarIsString(nombreVariable)==2){//es un entero
            printf("%s>0",nombreVariable);
        }else{
            printf("TE MANDASTE EL MEDIO semantic error EN LA LINEA %d \n como se te ocurre poner un string como condicional!!",numeroLinea);
        }
    }else{
        printf("TE MANDASTE EL MEDIO semantic error EN LA LINEA %d \n como se te ocurre poner una variable que no existe!!",numeroLinea);
    }
}


void validacionIf(char* val){
    printf("\tif(%s > 0){\n",val);
}

void FinalIfCiclo(){
    printf("\n}\n");
}


#endif