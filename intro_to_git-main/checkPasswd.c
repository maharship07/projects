#include <stdio.h>
#include <string.h>

int main() {

//initialize
        char chars;
        int i = 0;
        printf("Enter your password: ");

        //do while loops and stores each character while it is not empty space (space bar)
        //also, increments i so it can be used for difference
        do {
                chars = getchar();
                i++;
        } while(chars != '\n');

        //stores value of password and compares with recommended length
        int difference = 10 - i + 1;
        int score = -(difference * 5);
        printf("Score: %d\n",score);

        //if loops and determines if the password is safe
        if(score <= -30) {
                printf("The password is unsafe! Please reset.");
	}
        else {
                printf("The password is safe.");
	}
        return 0;
}