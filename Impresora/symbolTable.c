#ifndef SYMBOL_TABLE
#define SYMBOL_TABLE

#include <string.h>
#include <stdio.h>

char nombreVariable[50000][2048];
int variableTipoString[50000];
int contador = 0;

void AddVariable(char* varName, int isString){
    strcpy(nombreVariable[contador],varName);
    variableTipoString[contador] = isString;
    contador++;
}
int VarExists (char* varName){
    for(int i=0;i< contador; i++){
        if(strcmp(nombreVariable[i],varName)==0) return 1;
    }
    return 0;
}

int VarIsString(char* varName){
    for(int i=0;i< contador; i++){
        if(strcmp(nombreVariable[i],varName)==0) return variableTipoString[i];
    }
    return -1;
}
#endif /* SYMBOL_TABLE */