#include<stdio.h>
#include<math.h>
 int main(){
     int decimal, binary=0, remainder, num=1;

     printf("Enter Decimal number: ");
     scanf("%d",&decimal);

     while(decimal!=0){
         remainder = decimal % 2;
         binary += (remainder*num);
         decimal /= 2;
         num *= 10;
     }
     printf("Binary= %d\n",binary);
     return 0;
 }

