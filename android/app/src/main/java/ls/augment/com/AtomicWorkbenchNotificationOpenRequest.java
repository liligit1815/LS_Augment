package ls.augment.com;

import android.content.ComponentName;
import android.os.Bundle;
import java.util.Set;

/** Notification identity stays distinct from the media-session source namespace. */
final class AtomicWorkbenchNotificationOpenRequest {
    private static final Set<String> KEYS = Set.of("schema", "source", "generation", "revision", "component", "package", "user", "uid", "deadline");
    final String sourceId, generation, component, packageName;
    final long revision, deadline;
    final int userId, ownerUid;
    private AtomicWorkbenchNotificationOpenRequest(String source, String generation, long revision, String component, String pkg, int user, int uid, long deadline) {
        ComponentName parsed = ComponentName.unflattenFromString(component);
        if (source == null || !source.matches("[0-9a-f]{32}") || generation == null || !generation.matches("[0-9a-f]{33,48}")
                || revision < 1 || component == null || component.length() > 512 || parsed == null || pkg == null || pkg.length() > 256
                || !parsed.getPackageName().equals(pkg) || user < 0 || uid < 0 || uid / 100000 != user || deadline < 1)
            throw new IllegalArgumentException("invalid_notification_open");
        sourceId = source; this.generation = generation; this.revision = revision; this.component = parsed.flattenToString();
        packageName = pkg; userId = user; ownerUid = uid; this.deadline = deadline;
    }
    static AtomicWorkbenchNotificationOpenRequest of(String source, String generation, long revision, String component, String pkg, int user, int uid, long deadline) {
        return new AtomicWorkbenchNotificationOpenRequest(source, generation, revision, component, pkg, user, uid, deadline);
    }
    static AtomicWorkbenchNotificationOpenRequest parse(Bundle b) {
        if (b == null || !b.keySet().equals(KEYS) || i(b,"schema") != 1) throw new IllegalArgumentException("invalid_notification_open_metadata");
        return of(s(b,"source"),s(b,"generation"),n(b,"revision"),s(b,"component"),s(b,"package"),i(b,"user"),i(b,"uid"),n(b,"deadline"));
    }
    static AtomicWorkbenchNotificationOpenRequest fromDescriptor(Bundle b) {
        return of(s(b,"open_source_id"),s(b,"open_notification_generation"),n(b,"open_notification_revision"),s(b,"open_component"),s(b,"open_package"),i(b,"open_user_id"),i(b,"open_owner_uid"),n(b,"open_deadline_elapsed"));
    }
    boolean fresh(long now) { return now >= 0 && deadline > now && deadline - now <= 5000; }
    Bundle metadata() {
        Bundle b = new Bundle(); b.putInt("schema",1); b.putString("source",sourceId); b.putString("generation",generation); b.putLong("revision",revision);
        b.putString("component",component); b.putString("package",packageName); b.putInt("user",userId); b.putInt("uid",ownerUid); b.putLong("deadline",deadline); return b;
    }
    Bundle descriptor() {
        Bundle b = new Bundle(); b.putString("open_source_id",sourceId); b.putString("open_notification_generation",generation); b.putLong("open_notification_revision",revision);
        b.putString("open_component",component); b.putString("open_package",packageName); b.putInt("open_user_id",userId); b.putInt("open_owner_uid",ownerUid); b.putLong("open_deadline_elapsed",deadline); return b;
    }
    private static String s(Bundle b,String k){Object v=b==null?null:b.get(k);if(!(v instanceof String))throw new IllegalArgumentException("notification_open_type");return(String)v;}
    private static int i(Bundle b,String k){Object v=b==null?null:b.get(k);if(!(v instanceof Integer))throw new IllegalArgumentException("notification_open_type");return(Integer)v;}
    private static long n(Bundle b,String k){Object v=b==null?null:b.get(k);if(!(v instanceof Long))throw new IllegalArgumentException("notification_open_type");return(Long)v;}
}
