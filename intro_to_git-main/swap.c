#include <stdio.h>

int main() {
    char str1[20]= "1234abcd";
    char str2[20]= "abcd1234";
    
    //runs only if both strings are same sizes
    if(strlen(str1) == strlen(str2)) {
    
    //for loops until string length of sentence1 in met
    for(int i = 0; i < strlen(str1); i++) {
        
        //if loops check alphanumeric elements in both strings
        //and swaps numbers for letters and vice versa
        if(str1[i]>='0' && str1[i]<='9') {
            str1[i] = str2[i]-str1[i];
            str2[i] = str2[i]-str1[i];
            str1[i] = str1[i]+str2[i];
        }
         
        if(str2[i]>='a' && str2[i]<='z') {
            str2[i] = str1[i]-str2[i];
            str1[i] = str1[i]-str2[i];
            str2[i] = str2[i]+str1[i];
        }
    }
        
    }

    printf("sentence1: %s\n",str1);
    printf("sentence2: %s\n",str2);
    return 0;
}
