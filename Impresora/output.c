#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
int main() {
	char chait[2048] = "Marcos ";
	char marcos[2048] = "CHAIT";
	char prueba[2048] = "tOdo maYuscula 69";
	strcat(chait,marcos);
	printf("%s%s", chait, "\n");
	printf("%s%s", prueba, "\n");

	for(int i = 0; i < 2048; i++){
		if(prueba[i] != 0){
			for(int j = 97;j <= 122;j++){
				if(prueba[i] == j){
					prueba[i] = j-32;
				}
			}
		}else{break;}
	}
	printf("%s%s", prueba, "\n");

	if(true){
	int tamanio = 0;
	for(int i = 0; i < 2048; i++){
		if(marcos[i]!=0){
			tamanio++;
		}else{break;}
	}
	printf("El tamanio del string es: %d ",tamanio);
	}
 return 0;
}