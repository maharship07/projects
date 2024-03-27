import java.util.Scanner;

public class palindrome {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter your string or number: ");
        String input = sc.next();
        int right = input.length() - 1;
        System.out.println(isPalindrome(input, right));
    }
    public static boolean isPalindrome(String input, int right) {
        for (int i = 0; i < input.length(); i++) {
            if (input.charAt(i) == input.charAt(right)) {
                right--;
            } else {
                return false;
            }
        }
        return true;
    }
}
