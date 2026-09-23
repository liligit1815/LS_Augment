package ls.augment.com.hook;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

/** Stable screen IDs only: negative IDs belong to temporary/vendor pages. */
final class LauncherPageOrder {
    static final int MAX_PAGES = 128;

    static List<Integer> parse(String value) {
        ArrayList<Integer> result = new ArrayList<>();
        if (value == null || value.length() > 4096) return result;
        for (String part : value.split(",")) {
            try {
                int id = Integer.parseInt(part);
                if (id >= 0 && !result.contains(id)) result.add(id);
            } catch (NumberFormatException ignored) {}
            if (result.size() == MAX_PAGES) break;
        }
        return result;
    }

    static String encode(List<Integer> ids) {
        StringBuilder result = new StringBuilder();
        for (int id : new LinkedHashSet<>(ids)) {
            if (id < 0) continue;
            if (result.length() > 0) result.append(',');
            result.append(id);
        }
        return result.toString();
    }

    static boolean preserveEmpty(boolean verified, boolean enabled, boolean previouslyEnabled) {
        return enabled || (!verified && previouslyEnabled);
    }

    static List<Integer> merge(List<Integer> nativeIds, List<Integer> savedIds, boolean keepEmpty) {
        ArrayList<Integer> merged = new ArrayList<>();
        for (int id : savedIds) {
            if (id >= 0 && (keepEmpty || nativeIds.contains(id)) && !merged.contains(id)) merged.add(id);
        }
        for (int id : nativeIds) if (id >= 0 && !merged.contains(id)) merged.add(id);
        // Drag placeholders belong after real pages; other vendor negatives retain position.
        for (int i = 0; i < nativeIds.size(); i++) {
            int id = nativeIds.get(i);
            if (id < 0 && !merged.contains(id)) {
                if (id == -201 || id == -200) merged.add(id);
                else merged.add(Math.min(i, merged.size()), id);
            }
        }
        return merged;
    }

    static List<Integer> move(List<Integer> ids, int fromId, int toId) {
        ArrayList<Integer> result = new ArrayList<>(ids);
        int from = result.indexOf(fromId), to = result.indexOf(toId);
        if (fromId < 0 || toId < 0 || from < 0 || to < 0 || from == to) return result;
        result.remove(from);
        result.add(to, fromId);
        return result;
    }

    static int selectedIndex(List<Integer> ids, int selectedId, int fallback) {
        int index = ids.indexOf(selectedId);
        return index >= 0 ? index : Math.max(0, Math.min(fallback, ids.size() - 1));
    }

    private LauncherPageOrder() {}
}
