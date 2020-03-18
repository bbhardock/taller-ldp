%{
    #include <stdio.h>
    #include <stdlib.h>
    
    int yylex();
    void yyerror(char*);
%}

%union{
    char textValue[2048];
    int intValue;
}

%token Poner_Boina mostrar si_Marcos mientras_Chait por_cada_Bollo import_chait Sacar_Boina contrario
%token NUMERO TEXTO VARIABLE termino_linea

%%
inicio:     Poner_Boina linea_logica_rec Sacar_Boina
            ;
linea_logica_rec:   linea_logica  linea_logica_rec
                    | linea_logica
                    ;
linea_logica:   statement_linea termino_linea
                |statement_condicional_ciclo
                ;
statement_linea:    def_var 
                    | muestra 
                    | operacion_matematica
                    ;
statement_condicional_ciclo:    bloque_if 
                                | bloque_for 
                                | bloque_while
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
bloque_if:  si_Marcos '¿'validacion '?' '('linea_logica')''['contrario '('linea_logica')'']'
            ;
bloque_while:   mientras_Chait '{'validacion'}' '('linea_logica')'
                ;
bloque_for:     por_cada_Bollo '{'validacion'}' '('linea_logica')'
                ;
%%

void yyerror(char* texto){
    printf("ERROR: %s\n",texto);
}

int main(void){
    yyparse();

}