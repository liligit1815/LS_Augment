package ls.augment.com;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/** Selects the rows retained by Xiaomi's replace-prefix, then insert-ignore DAO path. */
public final class StepRecordSelection {
    private StepRecordSelection() { }

    /**
     * Keys must describe the complete incoming list, including deleted records.
     * Existing keys include soft-deleted database rows, which still conflict on insert.
     * Returned indices follow each retained key's first appearance in the replacement
     * prefix, followed by newly inserted keys in their original order.
     */
    public static List<Integer> effective(List<String> keys, boolean replaceAll, Set<String> existing) {
        Objects.requireNonNull(keys, "keys");Objects.requireNonNull(existing, "existing");
        Map<String, Integer> selected = new LinkedHashMap<>();
        int replacing = replaceAll || keys.size() <= 5 ? keys.size() : 5;
        for (int index = 0; index < replacing; index++)
            selected.put(Objects.requireNonNull(keys.get(index), "record key"), index);
        Set<String> occupied = new HashSet<>(existing);
        occupied.addAll(selected.keySet());
        for (int index = replacing; index < keys.size(); index++) {
            String key = Objects.requireNonNull(keys.get(index), "record key");
            if (occupied.add(key)) selected.put(key, index);
        }
        return new ArrayList<>(selected.values());
    }
}
