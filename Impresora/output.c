#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main() {
	int n = 2;
	int factorial = 1;

	while (n>0){
	factorial = factorial*n;
	n--;
	}
	printf("%d", factorial);

 return 0;
}