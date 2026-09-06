package ls.augment.com;

import java.util.Collections;
import java.util.Set;
import java.util.TreeSet;

/** Canonical package-list configuration, without labels or shell syntax. */
public final class AppPackageSet {
    private AppPackageSet() { }
    public static String normalize(String raw) {
        if (raw == null || raw.length() > 65536) return null;
        TreeSet<String> result = new TreeSet<>();
        for (String part : raw.split("[;,\\s]+")) {
            if (part.isEmpty()) continue;
            if (part.length() > 255 || !part.matches(
                    "[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z0-9_]+)+")) return null;
            result.add(part);
        }
        return String.join(";", result);
    }
    public static Set<String> parse(String raw) {
        String value = normalize(raw == null ? "" : raw);
        if (value == null || value.isEmpty()) return Collections.emptySet();
        TreeSet<String> packages = new TreeSet<>();
        Collections.addAll(packages, value.split(";"));
        return Collections.unmodifiableSet(packages);
    }
}
