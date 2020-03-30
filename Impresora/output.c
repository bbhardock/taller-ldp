#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
int main() {
	int cantidad_pruebas = 3;
	int nota_prueba_uno = 50;
	int nota_prueba_dos = 90;
	int nota_prueba_tres = 50;
	int promedio = (nota_prueba_uno+nota_prueba_dos+nota_prueba_tres)/cantidad_pruebas;
	promedio = promedio/40;

	if (promedio>0){
	printf("%s", "Aprobaste");
	printf("%d",promedio);
	}
	else{
	printf("%s", "No aprobaste na mano");
	printf("%d",promedio);
	}

 return 0;
}