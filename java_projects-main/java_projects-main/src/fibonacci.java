import java.util.Scanner;

public class fibonacci {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a number for its fibonacci series:");
        int num = sc.nextInt();
        if (num <= 0) {
            System.out.println(0);
        } else if (num == 1) {
            System.out.println(1);
        } else {
            for (int i = 1; i <= num; i++) {
                if (i == num) {
                    System.out.print(recurseFibonacci(i));
                } else {
                    System.out.print(recurseFibonacci(i) + ", ");
                }
            }
        }
    }

    public static int recurseFibonacci(int num) {
        if (num == 1 || num == 2) {
            return 1;
        }
        return recurseFibonacci(num - 1) + recurseFibonacci(num - 2);
    }
}
