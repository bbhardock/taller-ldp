%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    int yylex();
    void yyerror(char*);

    int lineCounter = 1;
%}

%union{
    char textValue[2048];
    int intValue;
}

%token Poner_Boina mostrar si_Marcos mientras_Chait por_cada_Bollo import_chait Sacar_Boina contrario
%token NUMERO TEXTO VARIABLE termino_linea

%type <textValue> VARIABLE 

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
def_var:    VARIABLE {printf("Chait dijo que la varaible %s\n se declaro",$2);}'=' valor
            ;
valor:      
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
factor:     '('operacion_matematica')' 
            | factor_primario
            ;
factor_primario:    TEXTO 
                    | NUMERO
                    ;  
muestra:    mostrar {printf("Chait dice que se va a imprimir: ");}'('unir')'
            ;
unir:       definir '+' unir { printf("%s junto con %s", $1, $3);} | 
            definir { printf("%1, $1);}
            ;
definir:    TEXTO {strcpy( $$, $1);} 
            |VARIABLE {strcpy( $$, $1);} 
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
    printf("¡ERROR! ¿¿CUANDO VA A APRENDER CHAIT?? Linea: %i %s\n",lineCounter,texto);
}

int main(void){
    yyparse();

}