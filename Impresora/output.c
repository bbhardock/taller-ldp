#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main() {
	char wea[2048] = "CHAIT estas de suerte";
	int nueva_wea = 2;
	int prueba = 5;
	printf("%s%s%d%s", wea, " te ganaste ", nueva_wea, " Tulas\n");

	if (nueva_wea>0){
	char amiga_eri_pegante[2048] = "wea";
	nueva_wea = 3;

	}

	while (nueva_wea>0){
	printf("%s", "Esta funcionando la raja el while\n");
	nueva_wea = nueva_wea-1;

	}
	nueva_wea = 4;

	while (nueva_wea>0){
	prueba = prueba+2;
	printf("%d%s", prueba, "\n");
	nueva_wea--;
	}

 return 0;
}