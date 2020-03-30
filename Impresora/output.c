#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
int main() {
	int a = 0;
	int b = 1;
	int n = 10;
	n = n+1;
	printf("%d%s", b, " ");
	int comprobacion = n-2;

	while (comprobacion>0){
	int c = a+b;
	a = b;
	b = c;
	printf("%d%s", c, " ");
	n = n-1;
	comprobacion = n-2;
	}

 return 0;
}