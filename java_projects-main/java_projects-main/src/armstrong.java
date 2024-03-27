import java.util.Scanner;

public class armstrong {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a number to check if it is an Armstrong number, that is each digit cubed equals to the same number: ");
        int num = sc.nextInt();
        checkArmstrongNum(num);
    }

    public static void checkArmstrongNum(int num) {
        int sum = 0;
        int remainder = 0;
        int temp = num;
        while (temp != 0) {
            remainder = temp % 10;
            sum += Math.pow(remainder, 3);
            temp /= 10;
        }

        if (sum == num) {
            System.out.println("This number is an Armstrong number!");
        } else {
            System.out.println("This number is not an Armstrong number!");
        }
    }
}
