#include <stdio.h>
#include <math.h>

 int main(){
     int binary, decimal=0, remainder, num=0;

     printf("Enter Binary number: \n");
     scanf("%d",&binary);

     while(binary!=0){
         remainder = binary % 10;
         decimal += (remainder * pow(2,num));
         binary /= 10;
         num++;
     }
     printf("Decimal = %d \n",decimal);
     return 0;
 }

