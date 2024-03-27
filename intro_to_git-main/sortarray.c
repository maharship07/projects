#include <stdio.h>

int main(){
    //initialize
    char ch[2];
    double arr[]={10, 0.25, -2342, 12123, 3.145435, 6, 6, 5.999, -2, -5, -109.56};
    double size = 11.0;
    
    //ask user for sorting method
    printf("Enter A or a for ascending sorting and D or d for descending sorting\n");
    scanf("%s", ch);
    
    //pass ch,size,arr to sort_numeric() function
    sort_numeric(ch,size, arr);
    return 0;
}

void sort_numeric(char *ch, double size, double *arr){

    //initialize
    int i, j;
    double temp;
    
    //if loops checks ch array input and determines sorting order
    if(ch[0]==65 || ch[0]==97){
        
        //nested for loops and stores values in ascending order
        for (i = 0; i < size; i++){
            for (j = i + 1; j < size; j++){
                //if checks and compares previous and next elements
		if (*(arr + j) < *(arr + i)){
                    temp = *(arr + i);
                    *(arr + i) = *(arr + j);
                    *(arr + j) = temp;
                }
            }
        }
        //print each number in ascending order
        for (i = 0; i < size; i++){
            printf("%f, ", *(arr + i));
        }
    }
    
    //else loops for any other ch for descending order
    else{
        //nested for loops and stores values in descending order
        for (i = 0; i < size; i++) {
            for (j = i + 1; j < size; j++) {
                //if checks and compares previous and next elements
		if (*(arr + j) > *(arr + i)) {
                    temp = *(arr + i);
                    *(arr + i) = *(arr + j);
                    *(arr + j) = temp;
                }
            }
        }   
        //print each number in descending order
        for (i = 0; i < size; i++){
            printf("%f, ", *(arr + i));
        }
    }
}