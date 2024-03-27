#include <stdio.h>

//group both country name and the code num
struct dialing_code {
    char *country;
    int num;
};

int main(int argc, char* argv[]) {
    
    //initialize
    int input, i;
    
    //input names and code num in struct
    const struct dialing_code country_codes[] = {
        {"Argentina", 54}, {"Bangladesh", 880}, {"Brazil", 55}, {"Burma (Myanmar)", 95},
        {"China", 86}, {"Colombia", 57}, {"Congo,Dem.", 243}, {"Egypt", 20},
        {"Ethiopia", 251}, {"France", 33}, {"Germany", 49}, {"India", 91}, 
        {"Indonesia", 62}, {"Iran", 98}, {"Italy", 39}, {"Japan", 81},
        {"Mexico", 52}, {"Nigeria", 234}, {"Pakistan", 92}, {"Philippines", 63},
        {"United States", 1}
    };
    
    //assign value to entry
    int entry = sizeof(country_codes) / sizeof(*country_codes);
    
    //do while loops forever
    do {
        //initialize and print and then scan input code
        int found = 0;
        printf("Please input the international code(-1 to exit): ");
        scanf("%d", &input);
        
        //if loop to stop the code once input is -1.
        //it also stops the whole program
        if (input == -1){
            break;
        }
        
        //for loop until condition is met
        for (i = 0; i <= entry; i++) {
            
            //if input value is one of the elements in country_codes,
            //then print the country name using struct
            if (country_codes[i].num == input) {
                printf("The country is: %s\n", country_codes[i].country);
                found = 1;
            }
        }
        
        //if found is 0, then state that code not found
        if (!found) {
            printf("Code not found.\n");
        }
    } while(1);
    return 0;
}