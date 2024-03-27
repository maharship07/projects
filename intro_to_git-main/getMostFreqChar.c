#include <stdio.h>
#include <string.h>

void frequency(char *c,int arr[]){
	int i;
	for(i=0;i<strlen(c);i++){
		if(c[i]>64 && c[i]<91){
			c[i]=c[i]+32;
		}
	}
	
	for(i=0;i<strlen(c);i++){
		if(c[i]>96&&c[i]<123){
			arr[c[i]-97]++;
		}
	}
}
	
	int main(){
	int i, arr[26]={0};
	int num, count;
	
	char c[1000];
	printf("Enter string: ");
	fgets(c,sizeof(c),stdin);

	frequency(c,arr);
	count=arr[0];
	
	for(i=1;i<26;i++){
		if(arr[i]>count){
			count=arr[i];
		num=i;
		}
	}

	printf("The Most frequent letter is '%c'. It appeared %d times.\n",(char)num+97,arr[num]);
}
