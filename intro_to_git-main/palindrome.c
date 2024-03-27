#include <stdio.h>
#include<string.h>
#define MAX_LENGTH 100

int main() {
    //length of char array str is set MAX_LENGTH
    char str[MAX_LENGTH];
    
    //print and then scan word
    printf("Write a word for palindrome check: \n");
    scanf("%s",str);
    
    //checks whether str is palindrome
    if (palin(str,strlen(str))) {
        printf("%s is a palindrome\n",str);
    }
    else {
        printf("%s is not palindrome\n",str);
    }

    return 0;
}

int palin(char *str, int str_length) {
    //initialize 
    int num = 1;
    char rev[MAX_LENGTH];
    int j = 0;
    
    //for loops and reassigns elements in the rev char array
    for (int i = str_length - 1; i >= 0; i--) {
        rev[j] = str[i];
        j++;
    }
    
    rev[j]='\0';
    
    //checks whether both arrays are not same
    for (int i = 0; i < str_length; i++) {
        if (str[i] != rev[i]) {
            num = 0;
            break;
        }
    }
    return num;
}
