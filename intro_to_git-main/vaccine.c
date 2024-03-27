#include <stdio.h>
#include <string.h>
#include <time.h>

//user structure initializes and holds user info
struct user{  
    char first[30];
    char last[30];
    int dd,mm,yy;
    char gender[6];
    int pdd,pmm,pyy;
    int dnumber;
    char vaccine[30];
    char zip[6];
};  

int main(void) {
    //initialize
    struct user u1[10];
    int gen;
    char id[8];
    char age[2];
    int i;
    int vtype;

    //for loops 5 times for 5 different entries
    for(i=0;i<1;i++){
        
        //asks user for first name
        printf("Enter detail for %d person: \n",i+1);
        printf("Enter First Name : ");
        scanf("%s", u1[i].first);

        //asks user for last name
        printf("Enter Last Name: ");
        scanf("%s", u1[i].last);

        //asks user for birthdate
        printf("Enter Birth Date(mm/dd/yyyy): ");
        scanf("%d/%d/%d",&u1[i].dd,&u1[i].mm,&u1[i].yy);

        //asks user for gender
        printf("Choose gender: \n");
        printf("1. Male\n");
        printf("2. Female\n");
        printf("Enter gender: ");
        scanf("%d", &gen);
    
        //if loop checks if gender input is correct or else it asks again
        if(gen == 1){
            strcpy(u1[i].gender, "Male");
        }
        else if(gen == 2){
            strcpy(u1[i].gender, "Female");
        }
        else{
            printf("Please choose valid gender.\n");
            return 1;
        }

        //asks user for dose number 
        printf("Enter Dose Number: ");
        scanf("%d", &u1[i].dnumber);
        //if the dose number is not 1 or 2, then asks to enter valid number
        if(!(u1[i].dnumber == 1 || u1[i].dnumber == 2)){
            printf("Please enter valid dose number.\n");
            return 1;
        }

        //if second dose was received, then asks to enter date received
        if(u1[i].dnumber == 2){
            printf("Enter Previous Dose Date(mm/dd/yyyy): ");
            scanf("%d/%d/%d",&u1[i].dd,&u1[i].mm,&u1[i].yy);  
        }

        //asks user for vaccine type
        printf("Choose type of vaccine: \n");
        printf("1. Moderna\n");
        printf("2. Pfizer\n");
        printf("3. Johnson&Johnson\n");
        scanf("%d", &vtype);

        //if, else if, and else loops for each condition to determine the type of vaccine
        if(vtype == 1){
            strcpy(u1[i].vaccine, "Moderna");
        }
        else if(vtype == 2){
            strcpy(u1[i].vaccine, "Pfizer");
        }
        else if(vtype == 3){
            strcpy(u1[i].vaccine, "Johnson&Johnson");
        }
        else{
            printf("Please choose valid type of vaccine.\n");
            return 1;
        }

        //asks user for zipcode
        printf("Enter zipcode: \n");
        scanf("%s", u1[i].zip);
    
        //put first letters of first and last names
        id[0] = u1[i].first[0];
        id[1] = u1[i].last[0];

        //today's date
        time_t t = time(NULL);
        struct tm tm = *localtime(&t);

        //use getage() to calculate age
        int ageTemp = getage( tm.tm_mday,tm.tm_mon + 1,tm.tm_year + 1900,u1[i].dd,u1[i].mm,u1[i].yy);
    
        //put age
        id[2] = (char)(ageTemp/10+ '0');
        id[3] = (char)(ageTemp%10+ '0');
    
        //put first letter of vaccine type
        id[4] = u1[i].vaccine[0];
    
        //put last 3 digits of zipcode
        id[5] = u1[i].zip[3];
        id[6] = u1[i].zip[4];
        id[7] = u1[i].zip[5];

        //print entered details of users
        printf("First Name: %s\n",u1[i].first);
        printf("Last Name: %s\n",u1[i].last);
        printf("Birthdate: %d/%d/%d\n",u1[i].mm,u1[i].dd,u1[i].yy);
        printf("Gender: %s\n",u1[i].gender);
        printf("Dose Number: %d\n",u1[i].dnumber);
        
        //if dose number is 2, then print dose date as well
        if(u1[i].dnumber == 2){
            printf("Previous Dose Date: %d/%d/%d\n",u1[i].pmm,u1[i].pdd,u1[i].pyy);
        }
        
        //print the rest of the details
        printf("Vaccine type: %s\n",u1[i].vaccine);
        printf("Zip : %s\n",u1[i].zip);
    
        //print alphanumeric code
        printf("8 letter alphanumeric code: %s\n\n",id);
    }

    return 0;
}

int getage(int currdate, int currmonth, int curryear, int bday, int bmonth, int byear) {
    //initialize
    int fdate, fmonth, fyear;    
    //initialize each month's most dates
    int month[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    
    //if loops check whether birthday value is greater than current day and assigns currdate using month array
    if (bday > currdate) {
        currdate = currdate + month[bmonth - 1];
        currmonth = currmonth - 1;
    }
    //if loop check whether birthmonth value is greater than current month and reassigns curryear
    if (bmonth > currmonth) {
        curryear = curryear - 1;
        currmonth = currmonth + 12;
    }
    
    fyear = curryear - byear;
   
    return fyear;
}