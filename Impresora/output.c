#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
int main() {
	int cantidad_pruebas = 3;
	int nota_prueba_uno = 10;
	int nota_prueba_dos = 10;
	int nota_prueba_tres = 10;
	int promedio = (nota_prueba_uno+nota_prueba_dos+nota_prueba_tres)/cantidad_pruebas;
	promedio = promedio/40;

	if (promedio>0){
	printf("%s", "Aprobaste");
	}
	else{
	printf("%s", "No aprobaste na mano");
	}

 return 0;
}