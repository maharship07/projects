#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() {

	//initialize
	int score=0, uppcount=0, lowcount=0, numcount=0;
        char chars;
        int i = 0;
        
	printf("Enter your password: ");

        //while loops stores each character while it is not empty space (space bar)
	while ((chars = getchar()) != '\n') {

		//iterates lowcount for every lower case character
		if(chars>='a' && chars<='z') {

			lowcount++;
		}

		//iterates uppcount for every uppercase character
		if(chars>='A' && chars<='Z') {
			uppcount++;
		}

		//iterates numcount for every number character
		if(chars>='0' && chars<='9') {
			numcount++;
		}
		
		//if loops will count the score according to the lowcount, uppcount, and numcount
		if(lowcount==0){
			score+=20;
		}
		if(uppcount==0){
			score+=20;
		}
		if(numcount==0){
			score+=20;
		}
	}

	//print the score
	printf("nScore = %d\n",(-score));

	//if loop checks whether password is safe, depending on the score
	if(score>30){
		printf("The password is unsafe! Please reset.n");
	}
	else{
		printf("The password is safe.n");
	}
return 0;
}