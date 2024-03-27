#include <stdio.h>

int main(){
	int n, i;
	unsigned long long factorial = 1;
	printf("Enter an integer: ");
	scanf("%d", &n);

//error if there is a negative number entered

	if (n<0)
		printf("Error! Entered number is negative.");

	else{
		for (i=1;i<=n;++i){
			factorial*=i;
		}
		printf("Factorial of %d = %llu",n,factorial);
		printf(" \n");
	}
	return 0;
}
