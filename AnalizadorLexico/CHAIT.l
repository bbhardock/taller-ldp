
%%

"Poner Boina"           printf("Se lee la palabra reservada Poner Boina \n");  

"mostrar"               printf("Se lee la palabra reservada mostrar \n");
"si Marcos"             printf("Se lee la palabra reservada si Marcos \n");
"mientras Chait"        printf("Se lee la palabra reservada mientras Chait \n");
"por cada Bollo"        printf("Se lee la palabra reservada por cada Bollo \n");
"import chait"          printf("Se lee la palabra reservada import chait \n");

"Sacar Boina"           printf("Se lee la palabra reservada Sacar Boina \n");

"+"                     printf("Se lee el TOKEN de suma (+)\n");
"-"                     printf("Se lee el TOKEN de resta (-)\n");
"/"                     printf("Se lee el TOKEN de divicion (/)\n");
"*"                     printf("Se lee el TOKEN de multiplicacion (*)\n");
"!"                     printf("Se lee el TOKEN de fin de linea (!)");
"("                     printf("Se lee el TOKEN de abre parentesis ( () )");
")"                     printf("Se lee el TOKEN DE cierra parentesis ( ) )");


[0-9]+                  printf("Se lee un numero: %s\n",yytext);

[A-Za-z][A-Za-z0-9]*    printf("Se lee un nombre de variable: %s\n",yytext);

\"([A-Za-z0-9 ]|(\\(\"|\\|n|t)))*\" printf("Se lee un texto");

[\r]                    // Ignora los retornos de carro
[\n]                    // Ignora los saltos de linea
[\t]*                   //Ignora los espacios vacios y tabulaciones

.                       printf("Texto invalido: %s\n",yytext);
%%