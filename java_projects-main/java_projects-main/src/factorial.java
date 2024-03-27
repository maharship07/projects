import java.util.Scanner;

public class factorial {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter \"R\" for recursive solution or \"N\" for normal solution: ");
        String str = sc.next().toLowerCase();
        System.out.println("Enter a non-negative number to get factorial value: ");
        int num = sc.nextInt();
        while (num < 0) {
            System.out.println("Please enter a non-negative number!");
            num = sc.nextInt();
        }
        if (num == 0) {
            System.out.println(1);
        } else {
            switch (str) {
                case "r" -> System.out.println(recursiveCall(num));
                case "n" -> System.out.println(normalCall(num));
                default -> System.out.println("Invalid Entry!");
            }
        }

        /* simplified version of the switch case
        switch (str) {
            case "r":
                System.out.println(recursiveCall(num));
                break;
            case "n":
                System.out.println(normalCall(num));
                break;
            default:
                System.out.println("Invalid Entry!");
        }
        */
    }
    public static int recursiveCall(int num) {
        if (num <= 1) {
            return num;
        } else {
            num = num * recursiveCall(num - 1);
        }
        return num;
    }

    public static int normalCall(int num) {
        int temp = num;
        for (int i = 1; i < temp; i++) {
            num *= i;
        }
        return num;
    }
}
