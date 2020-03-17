%{
    #include <stdio.h>
    #include <stdlib.h>
 
%}

%union{
    char textValue[2048];
    int intValue;
}

%token Poner Boina mostrar si Marcos mientras Chait por cada Bollo import chait Sacar Boina
%token NUMERO TEXTO VARIABLE

%%
inicio:     Poner Boina '{'linea_logica'}' Sacar Boina
            ;
linea_logica:   '[''{'espacio_blanco'}'']''['statement_linea']'termino_linea 
                | '[''{'espacio_blanco'}'']'statement_condicional_ciclo
                | '[''{'espacio_blanco'}'']'
                ;
statement_linea:    def_var 
                    | muestra 
                    | operacion_matematica
                    ;
statement_condicional_ciclo:    bloque_if 
                                | bloque_for 
                                | bloque_while
                                ;
espacio_blanco:   caracteres blancos 
                    | caracteres de tabulación 
                    | retornos de carro 
                    | saltos de linea
                    ;
def_var:    VARIABLE '=' valor
            ;
valor:      NUMERO
            |TEXTO
            |VARIABLE 
            |operacion_matematica
            ;
operacion_matematica:   termino 
                        | termino '+' operacion_matematica
                        | termino '-' operacion_matematica
                        ;
termino:    factor
            | factor '*' termino 
            | factor '/' termino
            ;
factor:     '('operacion_matematica ')' 
            | factor_primario
            ;
factor_primario:    VARIABLE 
                    | NUMERO
                    ;  
muestra:    mostrar'('unir')'
            ;
unir:       definir '+' unir|
            definir
            ;
definir:    TEXTO 
            |VARIABLE
            ;
validacion: VARIABLE
            |NUMERO
            ;
bloque_if:  si Marcos '¿'validacion '?' '('linea_logica')''['contrario '('linea_logica')'']'
            ;
bloque_while:   mientras Chait '{'validacion'}' '('linea_logica')'
                ;
bloque_for:     por cada Bollo '{'validacion'}' '('linea_logica')'
                ;
%%
int main(void){
    yyparse();

}