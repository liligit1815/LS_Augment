package ls.augment.com.hook;

import java.lang.ref.WeakReference;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

/** NMS-lock-owned lifetime registry. An update is not a removal/repost, even with the same key. */
final class AtomicWorkbenchNotificationRecords {
    private static final int MAX = 256;
    private static final String BOOT = UUID.randomUUID().toString().replace("-", "");
    private static long next;
    static void prepare() { /* Force the boot nonce's initialization before installing any locked callback. */ }
    static final class Lease {
        final WeakReference<Object> record;
        final String key, pkg, generation;
        final int uid, user;
        final long revision;
        final long publishedWall, publishedElapsed;
        final boolean publishedClockKnown;
        Lease(Object record, String key, String pkg, int uid, int user, String generation, long revision, long wall, long elapsed, boolean clockKnown) {
            this.record = new WeakReference<>(record); this.key = key; this.pkg = pkg; this.uid = uid;
            this.user = user; this.generation = generation; this.revision = revision;
            publishedWall = wall; publishedElapsed = elapsed; publishedClockKnown = clockKnown;
        }
        boolean owner(String pkg, int uid, int user) { return this.uid == uid && this.user == user && this.pkg.equals(pkg); }
        boolean same(Lease other) { return other != null && record.get() != null && record.get() == other.record.get()
                && generation.equals(other.generation) && revision == other.revision && key.equals(other.key)
                && owner(other.pkg, other.uid, other.user); }
    }
    private final Map<String, Lease> entries = new LinkedHashMap<>();
    Lease current(Object record, String key, String pkg, int uid, int user) {
        Lease old = entries.get(key);
        if (old != null && old.record.get() == record && old.owner(pkg, uid, user)) return old;
        return committed(record, null, key, pkg, uid, user);
    }
    Lease committed(Object record, Object previous, String key, String pkg, int uid, int user) {
        return committed(record, previous, key, pkg, uid, user, 0, 0, false);
    }
    Lease published(Object record, Object previous, String key, String pkg, int uid, int user, long wall, long elapsed) {
        return committed(record, previous, key, pkg, uid, user, wall, elapsed, wall > 0 && elapsed >= 0);
    }
    private Lease committed(Object record, Object previous, String key, String pkg, int uid, int user, long wall, long elapsed, boolean clockKnown) {
        if (record == null || !AtomicWorkbenchMediaEvidenceReflect.text(key, 1024)
                || !AtomicWorkbenchMediaEvidenceReflect.text(pkg, 256) || uid < 0 || user < 0 || uid / 100000 != user)
            throw new SecurityException();
        Lease old = entries.get(key);
        if (old != null && old.record.get() == record && old.owner(pkg, uid, user)) return old;
        boolean update = old != null && previous != null && old.record.get() == previous && old.owner(pkg, uid, user);
        if (!entries.containsKey(key) && entries.size() >= MAX) { entries.clear(); throw new IllegalStateException("notification evidence limited"); }
        String generation = update ? old.generation : newId();
        Lease result = new Lease(record, key, pkg, uid, user, generation, update ? old.revision + 1 : 1, wall, elapsed, clockKnown);
        entries.put(key, result); return result;
    }
    void removed(String key) { entries.remove(key); }
    private static synchronized String newId() { return BOOT + Long.toHexString(++next); }
}
