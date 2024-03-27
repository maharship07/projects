#include<stdio.h>

int main(){     
	
	int original_integer = 9;
	printf("Original integer: %d\n", original_integer);
	
	int new_integer = ((original_integer) << 3) + (original_integer);
	printf("New integer: %d\n", new_integer);
}
