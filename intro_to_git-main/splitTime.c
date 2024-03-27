#include <stdio.h>

//write the declaration of function split_time

int main(){
	int n,hr,min,sec;
	printf("Enter seconds:");
	scanf("%d",&n);
	
	if(n<0){
	printf("Seconds cannot be negative. Please enter a positive number\n");
	}
	
	else{
	split_time(n,&hr,&min,&sec);
	printf("Converted format: %d hours %d mins %d secs\n",hr,min,sec);
	}

	return 0;
}

split_time(long total_sec,int *hr,int *min,int *sec){
	int remsec = 0;
	*hr = total_sec / 3600;
	remsec = total_sec % 3600;
	*min = remsec/60;
	*sec = remsec%60;
}

