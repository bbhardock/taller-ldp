#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main() {
	char nombre_bueno[2048] = "Marcos Chait";
	char nombre_malo[2048] = "Charcos Mait";
	int var_1 = 1;
	var_1 = 2;
	printf("%s%s%s%s", "Hola soy ", nombre_bueno, " no ", nombre_malo);
	printf("%s", "\nTonterias Chait es muy feliz conmigo a que si mi amor");
	printf("%s", "\nClaro cielo pero no mates a nadie por favor");
	int contador_chait = 3*3;
	printf("%s%s%s%d%s", "\n", nombre_bueno, " tiene ", contador_chait, " paros cardiacos en su haber, buen trabajo!");

 return 0;
}