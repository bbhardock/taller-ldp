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
    //comprobar si estoy redefiniendo un string como string y un int como int
    //ademas en c no se puede redefinir un string
    }else{
        if(VarIsString(nombreVariable)==1){
            printf("\n\tprintf(\"");
            printf("Error semantico (no se pueden redefinir strings)\");\n");
        }else{
            if(leyendoString==0){
                printf("\t%s = %s;\n",nombreVariable,valor);
            }else{
                printf("\n\tprintf(\"");
                printf("Error semantico (no se puede redefinir un int como string)\");\n");    
            }
        }
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
void validarVariableCondicional(char* nombreVariable, int numeroLinea, int caso){
    if(VarExists(nombreVariable)==1){
        if(VarIsString(nombreVariable)==2){//es un entero
            if(caso == 1){
                printf("(%s>0)",nombreVariable);
            }
            else if(caso == 2){
                printf("(%s>0)",nombreVariable);
            }
        }else{
            printf("\nTE MANDASTE EL MEDIO semantic error EN LA LINEA %d \n como se te ocurre poner un string como condicional!!",numeroLinea);
        }
    }else{
        printf("\nTE MANDASTE EL MEDIO semantic error EN LA LINEA %d \n como se te ocurre poner una variable que no existe!!",numeroLinea);
    }
}

void encabezadoIf(char* nombreVariable, int numeroLinea){
    printf("\n\tif ");
    validarVariableCondicional(nombreVariable,numeroLinea,1);
    printf("{\n");
}
void encabezadoWhile(char* nombreVariable, int numeroLinea){
    printf("\n\twhile ");
    validarVariableCondicional(nombreVariable,numeroLinea,2);
    printf("{\n");
}
void encabezadoFor(char* nombreVariable, int numeroLinea){
    printf("\n\twhile ");
    validarVariableCondicional(nombreVariable,numeroLinea,2);
    printf("{\n");
}
void encabezadoElse(){
    printf("\telse{\n");
}
void FinalFor(char* nombreVariable){
    printf("\t%s--;\n\t}\n",nombreVariable);
}
void FinalIfCiclo(){
    printf("\t}\n");
}
void tabulacion(){
    printf("\t");
}
void funcionConcatenar(char* texto1,char* texto2, int numeroLinea){
    if(VarIsString(texto1)==1){
        if(leyendoString == 1 || VarIsString(texto2) == 1){
            printf("\tstrcat(%s,%s);\n",texto1,texto2);
        }else{
            printf("\t\nprintf(TE MANDASTE EL MEDIO semantic error EN LA LINEA %d \n como se te ocurre concatenar una variable con un entero!!);\n",numeroLinea);
        }
    }else{
         printf("\t\nprintf(TE MANDASTE EL MEDIO semantic error EN LA LINEA %d \n como se te ocurre concatenar sin poner la variable del inicio!!);\n",numeroLinea);
    }
}
void funcionLen(char* texto,int numeroLinea){
    if(VarIsString(texto)==1){
        printf("\n\tif(true){for(int i = 0; i < 2048; i++){\n\t\tint tamaño = 0;\n\t\tif(%s[i]!=0){\n\t\t\ttamaño++;\n\t\t}\n\t}else{break;}\n\t}");
    }else{
         printf("\t\nprintf(TE MANDASTE EL MEDIO semantic error EN LA LINEA %d \n como se te ocurre tratar de convertir un entero en mayusculas!!);\n",numeroLinea);
    }
}
void funcionUpper(char* texto, int numeroLinea){
    if(VarIsString(texto)==1){
        printf("\n\tfor(int i = 0; i < 2048; i++){\n\t\tif(%s[i] != 0){\n\t\t\tfor(int j = 97;j <= 122;j++){\n\t\t\t\tif(%s[i] == j){\n\t\t\t\t\t%s[i] = j-32;\n\t\t\t\t}\n\t\t\t}\n\t\t}else{break;}\n\t}\n",texto,texto,texto);
    }else{
         printf("\t\nprintf(TE MANDASTE EL MEDIO semantic error EN LA LINEA %d \n como se te ocurre tratar de convertir un entero en mayusculas!!);\n",numeroLinea);
    }
}

#endif