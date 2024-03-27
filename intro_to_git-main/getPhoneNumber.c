#include <stdio.h>

int main(void){
	int a, b, c;
	int address;

	printf("Enter phone number [(999)999-9999]:\n");
	address = scanf("(%d)%d-%d",&a,&b,&c);

	printf("You entered %d-%d-%d\n",a,b,c);

	return 0;

}
