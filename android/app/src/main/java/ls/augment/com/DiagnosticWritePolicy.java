package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/** Provider-side quota, shared across Binder threads and measured with a monotonic clock. */
final class DiagnosticWritePolicy {
    static final int MAX_KEYS = 512;
    static final long MAX_UTF8_BYTES = 512 * 1024;
    static final long WINDOW_MS = 10_000;
    static final int PER_UID_REQUESTS = 64;
    static final int GLOBAL_REQUESTS = 256;
    static final int MAX_CALLERS = 64;
    private final Map<Integer, Integer> callers = new HashMap<>();
    private long windowStart = -1;
    private int requests;

    synchronized boolean allowRequest(int uid, long now) {
        if (windowStart < 0 || now < windowStart || now - windowStart >= WINDOW_MS) {
            windowStart = now; requests = 0; callers.clear();
        }
        if (uid < 0 || requests >= GLOBAL_REQUESTS) return false;
        int used = callers.getOrDefault(uid, 0);
        if (used >= PER_UID_REQUESTS || (used == 0 && callers.size() >= MAX_CALLERS)) return false;
        callers.put(uid, used + 1); requests++;
        return true;
    }

    static boolean fits(Map<String, ?> stored, String key, String value) {
        long before = 0;
        for (Map.Entry<String, ?> entry : stored.entrySet())
            before += bytes(entry.getKey()) + bytes(String.valueOf(entry.getValue()));
        boolean exists = stored.containsKey(key);
        long after = before + bytes(key) + bytes(value);
        if (exists) after -= bytes(key) + bytes(String.valueOf(stored.get(key)));
        int count = stored.size() + (exists ? 0 : 1);
        if (count <= MAX_KEYS && after <= MAX_UTF8_BYTES) return true;
        // Do not delete pre-existing diagnostics or block shrinking an old oversized store.
        return exists && after < before;
    }

    static String normalize(String key, String value) {
        if (value == null) value = "";
        int limit = key.startsWith("ls_augment_rm_support_") ? 32768 : 2000;
        if (value.length() > limit) {
            if (Character.isHighSurrogate(value.charAt(limit - 1))) limit--;
            value = value.substring(0, limit);
        }
        return value.replace('\r', ' ').replace('\n', ' ');
    }

    private static int bytes(String value) { return value.getBytes(StandardCharsets.UTF_8).length; }
}
