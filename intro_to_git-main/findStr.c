#include <stdio.h>
#include <string.h>

int main(){
	char input[21], smallest_word[21],largest_word[21];
	printf("BEWARE! THIS PROGRAM ENDS ONCE A 4-LETTER WORD IS INPUTTED BY THE USER! \n");
	printf("Enter word: ");
	scanf("%s",input);

	strcpy(smallest_word,input);
	strcpy(largest_word,input);

	while(strlen(input) != 4){
		if(strcmp(input,smallest_word) < 0){
			strcpy(smallest_word,input);
		}
		else if(strcmp(input,largest_word) > 0) {
			strcpy(largest_word,input);
		}
		
		printf("Enter word: ");
		scanf("%s",input);
	}	
	
	printf("Smallest Word: %s\n", smallest_word);
	printf("Largest Word: %s\n", largest_word);

	return 0;
}
