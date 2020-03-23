
%%

"Poner_Boina"           printf("Se lee la palabra reservada Poner Boina \n");  

"mostrar"               printf("Se lee la palabra reservada mostrar \n");
"si_Marcos"             printf("Se lee la palabra reservada si Marcos \n");
"mientras_Chait"        printf("Se lee la palabra reservada mientras Chait \n");
"por_cada_Bollo"        printf("Se lee la palabra reservada por cada Bollo \n");
"import_chait"          printf("Se lee la palabra reservada import chait \n");
"contrario"             printf("Se lee la palabra reservada contrario \n");

"Sacar_Boina"           printf("Se lee la palabra reservada Sacar Boina \n");

"="                     printf("Se lee el TOKEN igualdad (=)\n");

"+"                     printf("Se lee el TOKEN de suma (+)\n");
"-"                     printf("Se lee el TOKEN de resta (-)\n");
"/"                     printf("Se lee el TOKEN de division (/)\n");
"*"                     printf("Se lee el TOKEN de multiplicacion (*)\n");

"!"                     printf("Se lee el TOKEN de termino_linea (!)\n");

"("                     printf("Se lee el TOKEN de abre parentesis \n");
")"                     printf("Se lee el TOKEN DE cierra parentesis \n");
"¿"                     printf("Se lee el TOKEN de abre pregunta \n");
"?"                     printf("Se lee el TOKEN de cierra pregunta"\n);
"{"                     printf("Se lee el TOKEN de abre corchete \n");
"}"                     printf("Se lee el TOKEN de cierra corchete \n");

[0-9]+                  printf("Se lee un numero: %s\n",yytext);

[A-Za-z][A-Za-z0-9_]*    printf("Se lee un nombre de variable: %s\n",yytext);

\"([A-Za-z0-9 ]|(\\(\"|\\|n|t)))*\" printf("Se lee un texto \n");

[\r]                    // Ignora los retornos de carro
[\n]                    // Ignora los saltos de linea
[ \t]*                   //Ignora los espacios vacios y tabulaciones

.                       printf("Texto invalido: %s\n",yytext);
%%