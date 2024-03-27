#include <stdio.h>

int main (void){

	int item, quantity;
	float price;
	char date[12];
	
	printf("Enter item number: ");
	scanf("%d",&item);

	printf("Enter unit price: ");
	scanf("%f",&price);

	printf("Enter quantity: ");
	scanf("%d",&quantity);

	printf("Enter purchase date (mm/dd/yyyy): ");
	scanf("%s",date);
	
	float total=price*quantity;

	printf("Item Unit\tPrice\tQTY\tPurchase Date\tTotal Amount\n");
	printf("%d\t\t%-.1f\t%d\t%s\t\t%-.1f\n",item,price,quantity,date,total);

	return 0;

}
