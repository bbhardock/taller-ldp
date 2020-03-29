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

%type<textValue> linea_logica  linea_logica_rec statement_linea statement_condicional_ciclo def_var muestra bloque_if bloque_for bloque_while si_Marcos
%type <textValue> VARIABLE NUMERO TEXTO definir unir valor operacion_matematica termino factor factor_primario validacion


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
                    ;
statement_condicional_ciclo:    bloque_if  
                                | bloque_for   
                                | bloque_while 
                                ;

def_var:    VARIABLE '=' valor { CrearVariable($1,$3); }
            ;
valor:      TEXTO { leyendoTipoString(1); strcpy($$,$1); }
            |operacion_matematica { leyendoTipoString(0); strcpy($$,$1);}
            ;
operacion_matematica:   termino
                        | termino '+' operacion_matematica { concatenaOperacion($$,$1,"+",$3); }
                        | termino '-' operacion_matematica { concatenaOperacion($$,$1,"-",$3); }
                        ;
termino:    factor
            | factor '*' termino { concatenaOperacion($$,$1,"*",$3); }
            | factor '/' termino { concatenaOperacion($$,$1,"/",$3); }
            ;
factor:     factor_primario
            ;
factor_primario:    VARIABLE { strcpy($$,$1); }
                    | NUMERO { strcpy($$,$1); }
                    |'('operacion_matematica')' { concatenaOperacion($$,"(",$2,")"); }
                    ;  
muestra:    mostrar '('unir')' { imprimir($3); }
            |mostrar '('import_chait')' { importChait(); }
            ;
unir:       definir '+' unir { strcat($1,$3); strcpy($$,$1);} | 
            definir { strcpy($$,$1);}
            ;
definir:    TEXTO { imprimirTexto($1,$$); } 
            |VARIABLE { imprimirVariable($1,$$); } 
            ;
bloque_if:  si_Marcos validacion '?' '(' {encabezadoIf($2,lineCounter);} linea_logica_rec ')'{FinalIfCiclo();} 
            
            ;
bloque_while:   mientras_Chait '{'validacion'}' '('linea_logica_rec ')'{printf("CICLO WHILE");}
                ;
bloque_for:     por_cada_Bollo '{'validacion'}' '('linea_logica_rec ')'{printf("CICLO FOR");}
                ;
validacion: VARIABLE { strcpy($$,$1); }
            ;
%%

void yyerror(char* texto){
    printf("\n\tprintf(\"");
    printf("TE PASO EL MEDIO %s EN LA LINEA %i --- CUANDO VAS A APRENDER CHAIT??",texto,lineCounter);
    printf("\");\n\n}");
}

int main(void){
    yyparse();

}