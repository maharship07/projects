#include <stdio.h>

int main(){
    int num;
    
    //asks user for size array.
    printf("Enter the size of the array: ");
    scanf("%d", &num);
    
    //initialize
    int arr[num];
    int element;
    char sort;
    
    //asks user for elements in array.
    printf("Enter the elements of the array (int): ");
    
    //for loops and stores each element in arr
    for(int i = 0 ; i < num; i++){
        scanf("%d", &element ) ;
        *(arr + i ) = element ;
    }
    printf("\n");
    
    //asks user input for sort type
    printf("Enter the sort type(A or a or D or d: ");
    scanf("%c",&sort);
    scanf("%c",&sort);
    
    //calls sort_numeric() function.
    sort_numeric(arr, num, sort);
    
    //print array arr
    printf("Your array after sorting:\n");
    for(int i = 0 ; i < num; i++){
        printf("%d, ", *(arr + i));
    }
    printf("\n");
    return 0;
}

void sort_numeric(int arr[], int num, char input){
    int i,j;
    double temp;
    
    //if loop checks input character
    if(input == 'a' || input == 'A'){
        
        //nested for loops for array size-1
        for(i = 0; i < num - 1; i++){
            for(j = 0; j < num - 1; j++){
                
                //if loops and checks and compares previous and next elements and sorts in ascending order
                if(*(arr + j) > *(arr + j + 1)){
                    temp = *(arr + j) ;
                    *(arr + j) = *(arr + j + 1) ;
                    *(arr + j + 1) = temp ;
                }
            }
        }
    }
    
    //else loop for descending order
    else{
        //nested for loops for array size-1
        for(i = 0; i < num - 1; i++){
            for(j = 0; j < num - 1; j++){
                //if loops and checks and compares previous and next elements and sorts in descending order
                if(*(arr + j) < *(arr + j + 1)){
                    temp = *(arr + j) ;
                    *(arr + j) = *(arr + j + 1) ;
                    *(arr + j + 1) = temp ;
                }
            }
        }
    }
}