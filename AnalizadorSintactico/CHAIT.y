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

%type <textValue> VARIABLE NUMERO TEXTO definir unir

%%
inicio:     Poner_Boina {printf("Se ha iniciado el programa \n");} linea_logica_rec Sacar_Boina {printf("Se ha finalizado el programa \n");}
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
def_var:    VARIABLE {printf("Chait dijo que la variable %s se declaro \n",$1);}'=' valor
            ;
valor:      
            |TEXTO
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
factor_primario:    VARIABLE
                    | NUMERO
                    ;  
muestra:    mostrar {printf("Chait dice que se va a imprimir: ");}'('unir')' {printf("\n");}
            ;
unir:       definir '+' unir { printf("%s junto con %s", $1, $3);} | 
            definir { printf("%s", $1);}
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
    printf("\n TE PASO EL MEDIO %s EN LA LINEA %i --- CUANDO VAS A APRENDER CHAIT?? \n",texto,lineCounter);
}

int main(void){
    yyparse();

}