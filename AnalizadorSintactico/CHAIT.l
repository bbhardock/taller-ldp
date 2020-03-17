
%{    
    #include <stdio.h>
    #include <stdlib.h>

    #include <y.tab.h>
%}

%%

"Poner Boina"           return Poner Boina;

"mostrar"               return mostrar;
"si Marcos"             return si Marcos;
"mientras Chait"        return mientras Chait;
"por cada Bollo"        return por cada Bollo;
"import chait"          return import chait;

"Sacar Boina"           return Sacar Boina;

[=+-/*!()¿?{}]          return *yytext;

[0-9]+                  {strcpy(yylval.textValue,yytext); return NUMERO;}

[A-Za-z][A-Za-z0-9]*    {strcpy(yylval.textValue,yytext); return VARIABLE;}

\"([A-Za-z0-9 ]|(\\(\"|\\|n|t)))*\"  {strcpy(yylval.textValue,yytext); return TEXTO;}

[\r]                    // Ignora los retornos de carro
[\n]                    // Ignora los saltos de linea
[ \t]*                   //Ignora los espacios vacios y tabulaciones

.                       printf("CHAIT QUEDO invalido: %s\n",yytext);
%%