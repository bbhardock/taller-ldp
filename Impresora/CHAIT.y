%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #include "printer.h"

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

%type <textValue> VARIABLE NUMERO TEXTO definir unir valor operacion_matematica termino factor factor_primario
 
%%
inicio:     Poner_Boina { inicio(); } linea_logica_rec Sacar_Boina { fin(); }
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
def_var:    VARIABLE '=' valor { CrearVariable($1,$3);}
            ;
valor:      TEXTO { leyendoTipoString(1); strcpy($$,$1); }
            |operacion_matematica { leyendoTipoString(0); strcpy($$,$1);}
            ;
operacion_matematica:   termino { strcpy($$,$1); }
                        | termino '+' operacion_matematica { concatenaOperacion($$,$1,'+',$3); }
                        | termino '-' operacion_matematica { concatenaOperacion($$,$1,'-',$3); }
                        ;
termino:    factor { strcpy($$,$1); }
            | factor '*' termino { concatenaOperacion($$,$1,'*',$3); }
            | factor '/' termino { concatenaOperacion($$,$1,'/',$3); }
            ;
factor:     '('operacion_matematica')' { concatenaOperacion($$,'(',$2,')'); }
            | factor_primario { strcpy($$,$1); }
            ;
factor_primario:    VARIABLE { strcpy($$,$1); }
                    | NUMERO { strcpy($$,$1); }
                    ;  
muestra:    mostrar {printf("Chait dice que se va a imprimir: ");}'('unir')'
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