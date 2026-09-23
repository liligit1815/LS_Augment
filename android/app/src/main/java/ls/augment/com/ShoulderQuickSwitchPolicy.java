package ls.augment.com;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/** Candidate membership is independent of the OEM's single active-case flag. */
public final class ShoulderQuickSwitchPolicy {
    public static final String KEY = "ls_augment_tgk_quick_candidates";
    public static final String EMPTY = "TQ1";
    public static final String CALL = "shoulder_candidate_set";
    public static final String GAME_SPACE = "cn.nubia.gamelauncher";
    public static final int MAX_ENTRIES = 512;
    public static final int MAX_LENGTH = 49152;

    public static final class CaseRef {
        public final int userId;
        public final String gamePackage;
        public final int tableId;
        public final long caseId;

        public CaseRef(int userId, String gamePackage, int tableId, long caseId) {
            if (userId < 0 || userId > 99999 || gamePackage == null || gamePackage.length() > 255
                    || !gamePackage.matches("[A-Za-z0-9_]+(?:\\.[A-Za-z0-9_]+)+")
                    || (tableId != 0 && tableId != 1) || caseId <= 0) {
                throw new IllegalArgumentException("invalid shoulder candidate");
            }
            this.userId = userId;
            this.gamePackage = gamePackage;
            this.tableId = tableId;
            this.caseId = caseId;
        }

        public String key() { return userId + ":" + gamePackage + ":" + tableId + ":" + caseId; }
        @Override public boolean equals(Object value) {
            return value instanceof CaseRef && key().equals(((CaseRef) value).key());
        }
        @Override public int hashCode() { return key().hashCode(); }
    }

    private final Set<String> selected;
    private ShoulderQuickSwitchPolicy(Collection<String> selected) {
        this.selected = Collections.unmodifiableSet(new TreeSet<>(selected));
    }
    public static ShoulderQuickSwitchPolicy empty() { return new ShoulderQuickSwitchPolicy(Collections.emptySet()); }
    public boolean contains(CaseRef ref) { return ref != null && selected.contains(ref.key()); }
    public ShoulderQuickSwitchPolicy with(CaseRef ref, boolean checked) {
        TreeSet<String> next = new TreeSet<>(selected);
        if (checked) next.add(ref.key()); else next.remove(ref.key());
        ShoulderQuickSwitchPolicy result = new ShoulderQuickSwitchPolicy(next);
        if (next.size() > MAX_ENTRIES || result.serialize().length() > MAX_LENGTH)
            throw new IllegalArgumentException("肩键候选配置已达到容量上限");
        return result;
    }
    public String serialize() {
        return selected.isEmpty() ? EMPTY : EMPTY + ";" + String.join(";", selected);
    }
    public static String normalize(String value) {
        ShoulderQuickSwitchPolicy parsed = parse(value);
        return parsed == null ? null : parsed.serialize();
    }
    public static ShoulderQuickSwitchPolicy parse(String value) {
        if (value == null || value.length() > MAX_LENGTH) return null;
        if (value.isEmpty() || EMPTY.equals(value)) return empty();
        try {
            String[] rows = value.split(";", -1);
            if (!EMPTY.equals(rows[0]) || rows.length > MAX_ENTRIES + 1) return null;
            Set<String> values = new TreeSet<>();
            for (int i = 1; i < rows.length; i++) {
                String[] parts = rows[i].split(":", -1);
                if (parts.length != 4) return null;
                CaseRef ref = new CaseRef(Integer.parseInt(parts[0]), parts[1],
                        Integer.parseInt(parts[2]), Long.parseLong(parts[3]));
                if (!ref.key().equals(rows[i]) || !values.add(ref.key())) return null;
            }
            return new ShoulderQuickSwitchPolicy(values);
        } catch (IllegalArgumentException invalid) { return null; }
    }

    /** Preserve OEM ordering; stale/deleted candidates never become another case by position. */
    public List<CaseRef> visible(List<CaseRef> catalog) {
        List<CaseRef> result = new ArrayList<>();
        Set<CaseRef> seen = new LinkedHashSet<>();
        for (CaseRef ref : catalog) if (contains(ref) && seen.add(ref)) result.add(ref);
        return result;
    }

    /** Null means use the OEM menu. A single current case means an intentional no-op. */
    public static CaseRef directTarget(List<CaseRef> candidates, CaseRef current) {
        if (candidates == null || candidates.isEmpty() || candidates.size() > 2) return null;
        if (candidates.size() == 1) return candidates.get(0);
        return candidates.get(0).equals(current) ? candidates.get(1) : candidates.get(0);
    }

    /** The provider checks this again after its broader read-scope check. */
    public static boolean canWrite(int uid, String callingPackage, String[] actualPackages) {
        if (uid < 0 || !GAME_SPACE.equals(callingPackage) || actualPackages == null) return false;
        for (String pkg : actualPackages) if (GAME_SPACE.equals(pkg)) return true;
        return false;
    }
    public static boolean canWriteForUser(int uid, int providerUid, String callingPackage, String[] actualPackages) {
        return uid >= 0 && providerUid >= 0 && uid / 100000 == providerUid / 100000
                && canWrite(uid, callingPackage, actualPackages);
    }
    private ShoulderQuickSwitchPolicy() { selected = Collections.emptySet(); }
}
