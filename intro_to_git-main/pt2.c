#include <stdio.h>
#include <string.h>

int main(){

//declaring the array.
const char* arr[]={"Sytems", "Programming", "Deep", "Learning", "Internet", "Things", "Robotics", "Course"};
int n = sizeof(arr)/sizeof(arr[0]);
int i;
char sort[2];

//ask user for sorting method
    printf("Enter A or a or D or d\n");
    scanf("%s", sort);

//sort using function
sort_alphabetic(sort,arr,n);

//print sorted
printf("Sorted array is\n");
for (i = 0; i < n; i++){
    printf("%d: %s \n", i, arr[i]);
}
return 0;
}

//helper function
int myCompare(const void* a, const void* b){
    return strcmp((const char)a, *(const char*)b);
}

//sort function
sort_alphabetic(char* sort, const char* arr[], int n){
    //checks input and if loops only for inputs A or a
    if(sort[0]==65 || sort[0]==97){
        qsort(arr, n, sizeof(const char*), myCompare);
    }
    else{
        return 0;
    }
}