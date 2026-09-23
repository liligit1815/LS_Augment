package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public final class TestStepRecordSelection {
    private static void selected(List<String> keys, boolean replaceAll, Set<String> existing,
            String message, Integer... expected) {
        List<Integer> actual = StepRecordSelection.effective(keys, replaceAll, existing);
        if (!actual.equals(Arrays.asList(expected)))
            throw new AssertionError(message + ": expected " + Arrays.asList(expected) + ", got " + actual);
    }

    private static Set<String> existing(String... keys) {
        return new HashSet<>(Arrays.asList(keys));
    }

    public static void main(String[] args) {
        selected(Collections.emptyList(), false, existing("old"), "empty batch");
        selected(Arrays.asList("old"), false, existing("old"), "small batch replaces old key", 0);
        selected(Arrays.asList("a", "b", "c", "d", "a"), false, existing("a"),
                "five rows use replacement and the last duplicate survives", 4, 1, 2, 3);
        selected(Arrays.asList("a", "b", "c", "d", "e", "a"), false, existing(),
                "sixth duplicate cannot overwrite replacement prefix", 0, 1, 2, 3, 4);
        selected(Arrays.asList("a", "b", "c", "d", "e", "a"), true, existing("a"),
                "explicit replacement uses the last duplicate even beyond five", 5, 1, 2, 3, 4);
        selected(Arrays.asList("a", "a", "b", "b", "a", "f", "f", "g", "h", "g"),
                false, existing("a", "h"),
                "prefix last wins, suffix first new wins, old suffix rows remain untouched", 4, 3, 5, 7);
        selected(Arrays.asList("a", "b", "c", "d", "e", "soft-deleted", "new"),
                false, existing("soft-deleted"), "soft-deleted existing key also blocks insertion", 0, 1, 2, 3, 4, 6);
        selected(Arrays.asList("old", "old", "old", "old", "old", "old"),
                false, existing("old"), "last prefix duplicate wins over all ignored duplicates", 4);
        selected(Arrays.asList("a", "b", "c", "d", "e", "old", "old"),
                false, existing("a", "b", "c", "d", "e", "old"),
                "preexisting keys are changed only inside replacement prefix", 0, 1, 2, 3, 4);
        selected(Arrays.asList("a", "b", "a", "c", "b", "d", "a"),
                true, existing("a", "b", "c", "d"),
                "returned order follows first appearance of retained keys", 6, 4, 3, 5);
        List<String> keys = new ArrayList<>(Arrays.asList("a", "b", "c", "d", "e", "new", "old"));
        List<String> before = new ArrayList<>(keys);Set<String> old = existing("old");
        selected(keys, false, old, "new suffix row is retained", 0, 1, 2, 3, 4, 5);
        if (!keys.equals(before) || !old.equals(existing("old")))
            throw new AssertionError("selection must not mutate caller inputs");
        System.out.println("PASS TestStepRecordSelection");
    }
}
