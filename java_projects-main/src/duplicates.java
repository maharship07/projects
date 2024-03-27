import java.util.*;

public class duplicates {
    public static void main(String[] args) {
        List<Integer> list = new LinkedList<>();
        for (int i = 0; i < 10; i++) {
            list.add(i);
            if (i % 2 == 0) {
                list.add(i);
            }
        }
        System.out.println("Duplicate elements array: " + Arrays.toString(list.toArray()));
        Set<Integer> hashSet = new HashSet<>(list);
        System.out.println("Elements array after removing duplicates: " + Arrays.toString(hashSet.toArray()));
    }
}
