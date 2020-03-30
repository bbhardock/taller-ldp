#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
int main() {
	int variable_uno = -1;
	int variable_dos = 2;
	int variable_tres = 3;
	int variable_cuatro = 4;
	int variable_3 = (variable_uno+variable_dos+variable_tres)/variable_cuatro;
	int suma = variable_uno+variable_dos*(6/3);
	int suma_final = variable_3+suma;
	printf("%d", suma_final);

 return 0;
}