package ls.augment.com.hook;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Pure target parser/matcher shared by the Settings hook.
 *
 * The only application-instance identity accepted by LS_Augment is
 * userId:packageName. Package-name-only matching is intentionally impossible.
 */
final class SettingsTargetMatcher {
    private SettingsTargetMatcher() {}

    static Set<String> parse(String raw) {
        if (raw == null || raw.trim().isEmpty()) return Collections.emptySet();
        HashSet<String> result = new HashSet<>();
        for (String item : raw.split(";")) {
            String value = item == null ? "" : item.trim();
            int sep = value.indexOf(':');
            if (sep <= 0 || sep >= value.length() - 1 || value.indexOf(':', sep + 1) >= 0) continue;
            String user = value.substring(0, sep);
            String pkg = value.substring(sep + 1);
            if (!isDigits(user) || !isPackageName(pkg)) continue;
            result.add(user + ":" + pkg);
        }
        return result.isEmpty() ? Collections.<String>emptySet() : Collections.unmodifiableSet(result);
    }

    static String target(int userId, String packageName) {
        if (userId < 0 || !isPackageName(packageName)) return null;
        return userId + ":" + packageName;
    }

    static boolean matches(Set<String> targets, int userId, String packageName) {
        if (targets == null || targets.isEmpty()) return false;
        String target = target(userId, packageName);
        return target != null && targets.contains(target);
    }

    private static boolean isDigits(String value) {
        if (value == null || value.isEmpty()) return false;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c < '0' || c > '9') return false;
        }
        return true;
    }

    private static boolean isPackageName(String value) {
        if (value == null || value.isEmpty()) return false;
        if (value.startsWith(".") || value.endsWith(".") || value.contains("..")) return false;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            boolean ok = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
                    || (c >= '0' && c <= '9') || c == '_' || c == '.';
            if (!ok) return false;
        }
        return true;
    }
}
