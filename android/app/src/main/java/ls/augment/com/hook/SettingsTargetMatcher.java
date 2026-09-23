package ls.augment.com.hook;

import java.util.Collections;
import java.util.HashSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import ls.augment.com.HideTargetCodec;

/**
 * Pure target parser/matcher shared by the Settings hook.
 *
 * Worker-side validation retains the serial in immutable authorizations.
 * Numeric lookup keys are retained only for compatibility diagnostics.
 */
final class SettingsTargetMatcher {
    private SettingsTargetMatcher() {}

    static Set<String> verifiedTargets(String raw, SerialReader reader) {
        HashSet<String> result = new HashSet<>();
        for (HideTargetCodec.Entry entry : verifiedBindings(raw, reader))
            result.add(target(entry.userId, entry.packageName));
        return result.isEmpty() ? Collections.emptySet() : Collections.unmodifiableSet(result);
    }

    static Set<HideTargetCodec.Entry> verifiedBindings(String raw, SerialReader reader) {
        HideTargetCodec.Selection selection = HideTargetCodec.parse(raw);
        if (!selection.valid || reader == null) return Collections.emptySet();
        HashSet<HideTargetCodec.Entry> result = new HashSet<>();
        Map<Integer, Long> serials = new HashMap<>();
        for (HideTargetCodec.Entry entry : selection.entries) {
            if (!entry.isValid() || !entry.isBound() || !entry.confirmed) continue;
            if (!serials.containsKey(entry.userId)) {
                long serial;
                try { serial = reader.read(entry.userId); }
                catch (Exception unavailable) { serial = -1; }
                serials.put(entry.userId, serial);
            }
            long serial = serials.get(entry.userId);
            if (serial >= 0 && serial == entry.userSerial)
                result.add(entry);
        }
        return result.isEmpty() ? Collections.emptySet() : Collections.unmodifiableSet(result);
    }

    static String target(int userId, String packageName) {
        if (userId < 0 || userId > 99999 || !isPackageName(packageName)) return null;
        return userId + ":" + packageName;
    }

    static boolean matches(Set<String> targets, int userId, String packageName) {
        if (targets == null || targets.isEmpty()) return false;
        String target = target(userId, packageName);
        return target != null && targets.contains(target);
    }

    interface SerialReader { long read(int userId) throws Exception; }

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
