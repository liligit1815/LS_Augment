package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/** IDs are leases on authenticated live system tokens, never package-only placeholders. */
final class AtomicWorkbenchMediaSources<K> {
    static final class Source<K> {
        final K token;
        final int uid, user;
        final String id, packageName;
        Source(K token, int uid, int user, String packageName) {
            this.token = token; this.uid = uid; this.user = user; this.packageName = packageName;
            id = UUID.randomUUID().toString().replace("-", "");
        }
    }

    private final Map<K, Source<K>> entries = new LinkedHashMap<>();
    private String preference = "";
    private String reason = "fallback";
    private long revision;

    Source<K> observe(K token, int uid, int user, String packageName) {
        if (token == null || uid < 0 || user < 0 || uid / 100000 != user
                || packageName == null || packageName.isEmpty()) throw new IllegalArgumentException("invalid media identity");
        Source<K> old = entries.get(token);
        if (old != null && (old.uid != uid || old.user != user || !old.packageName.equals(packageName))) {
            if (preference.equals(old.id)) preference = "";
            entries.remove(token); old = null;
        }
        if (old == null) { old = new Source<>(token, uid, user, packageName); entries.put(token, old); }
        return old;
    }

    void retain(Set<K> live) {
        entries.entrySet().removeIf(entry -> !live.contains(entry.getKey()));
        if (find(preference) == null) preference = "";
    }

    Source<K> find(String id) {
        if (id != null) for (Source<K> entry : entries.values()) if (id.equals(entry.id)) return entry;
        return null;
    }

    void select(String id) {
        if (find(id) == null) throw new IllegalArgumentException("media source expired");
        preference = id; reason = "manual"; revision++;
    }

    void playingEdge(String id) {
        if (find(id) == null) throw new IllegalArgumentException("media source expired");
        preference = id; reason = "new_playing"; revision++;
    }

    void revoke(K token) {
        Source<K> old = entries.remove(token);
        if (old != null && preference.equals(old.id)) preference = "";
    }

    String preference() { return preference; }
    String reason() { return preference.isEmpty() ? "fallback" : reason; }
    long revision() { return revision; }
    void clear() { entries.clear(); preference = ""; reason = "fallback"; revision++; }
}
