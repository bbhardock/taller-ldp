
%{    
    #include <stdio.h>
    #include <stdlib.h>

    #include "y.tab.h"

    extern int lineCounter = 1;
%}

%%

"Poner_Boina"           return Poner_Boina;

"mostrar"               return mostrar;
"si_Marcos"             return si_Marcos;
"mientras_Chait"        return mientras_Chait;
"por_cada_Bollo"        return por_cada_Bollo;
"import_chait"          return import_chait;
"contrario"             return contrario;

"Sacar_Boina"           return Sacar_Boina;

"!"                     return termino_linea;

[=+-/*!()¿?{}]          return *yytext;

[0-9]+                  {strcpy(yylval.textValue,yytext); return NUMERO;}

[A-Za-z][A-Za-z0-9]*    {strcpy(yylval.textValue,yytext); return VARIABLE;}

\"([A-Za-z0-9 ]|(\\(\"|\\|n|t)))*\"  {strcpy(yylval.textValue,yytext); return TEXTO;}

[\r]                    // Ignora los retornos de carro
[\n]                    {lineCounter++}// Ignora los saltos de linea
[ \t]*                   //Ignora los espacios vacios y tabulaciones

.                       printf("CHAIT QUEDO invalido: %s\n",yytext);
%%