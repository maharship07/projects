import java.util.Scanner;
// not finished
public class num_guess {
    static int num;
    static final int MAX_GUESSES = 5;
    static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        num = (int) (1 + Math.random() * 100);
        System.out.println(num);
        generateMessage();
    }
    public static int generateNum() {
        return sc.nextInt();
    }

    public static void generateMessage() {
        System.out.println("Enter a number between 1 and 100 to guess: \n");
        System.out.println("You can only guess 5 times so be careful!!!");
        int enteredNum = generateNum();
        while (enteredNum < 1 || enteredNum > 100) {
            System.out.println("You have entered a number out of range!\nTry Again!!! \n");
            enteredNum = generateNum();
        }
        compareNum(enteredNum);
    }

    public static void compareNum(int enteredNum) {
        int i = 0;
        boolean flag = true;
        while (i < MAX_GUESSES && flag) {
            while (i != MAX_GUESSES && (enteredNum < 1 || enteredNum > 100)) {
                System.out.println("You have entered a number out of range!\nTry Again!!! \n");
                enteredNum = generateNum();
            }
            if (enteredNum == num) {
                System.out.println("You are correct!\nYou know your numbers!!!!!");
                flag = false;
            } else if (enteredNum < num && i != MAX_GUESSES - 1) {
                System.out.println("Your number is less than the generated number.");
                enteredNum = generateNum();
                i++;
            } else if (enteredNum > num && i != MAX_GUESSES - 1) {
                System.out.println("Your number is more than the generated number.");
                enteredNum = generateNum();
                i++;
            }
        }
        if (flag) {
            System.out.println("You have exhausted your attempts! Try Again!!!\n" +
                    "The generated number was: " + num);
        }
    }
}
