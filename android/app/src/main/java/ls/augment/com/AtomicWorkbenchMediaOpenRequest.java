package ls.augment.com;

import android.content.ComponentName;
import android.os.Bundle;
import java.util.Set;
import java.util.UUID;

/** Immutable identity and deadline from a verified media entry; never authorizes itself. */
final class AtomicWorkbenchMediaOpenRequest {
    final String sourceId, component, packageName;
    final int userId, ownerUid;
    final long deadline;
    private AtomicWorkbenchMediaOpenRequest(String source, String component, String pkg, int user, int uid, long deadline) {
        ComponentName parsed = ComponentName.unflattenFromString(component);
        if (source == null || !source.matches("[0-9a-f]{32}") || component == null || component.length() > 512
                || parsed == null || !parsed.getPackageName().equals(pkg) || pkg.length() > 256
                || user < 0 || uid < 0 || uid / 100000 != user || deadline < 1) throw new IllegalArgumentException("invalid_media_open");
        sourceId=source; this.component=parsed.flattenToString(); packageName=pkg; userId=user; ownerUid=uid; this.deadline=deadline;
    }
    static AtomicWorkbenchMediaOpenRequest fromDescriptor(Bundle b) {
        if (b == null) throw new IllegalArgumentException("missing_media_descriptor");
        return new AtomicWorkbenchMediaOpenRequest(string(b,"open_source_id"),string(b,"open_component"),string(b,"open_package"),
                integer(b,"open_user_id"),integer(b,"open_owner_uid"),number(b,"open_deadline_elapsed"));
    }
    static AtomicWorkbenchMediaOpenRequest parse(Bundle b) {
        if (b == null || !b.keySet().equals(Set.of("schema","source","component","package","user","uid","deadline"))
                || integer(b,"schema") != 1) throw new IllegalArgumentException("invalid_media_metadata");
        return new AtomicWorkbenchMediaOpenRequest(string(b,"source"),string(b,"component"),string(b,"package"),
                integer(b,"user"),integer(b,"uid"),number(b,"deadline"));
    }
    boolean fresh(long now) { return now >= 0 && deadline > now && deadline - now <= 5000L; }
    Bundle metadata() {
        Bundle b=new Bundle();b.putInt("schema",1);b.putString("source",sourceId);b.putString("component",component);
        b.putString("package",packageName);b.putInt("user",userId);b.putInt("uid",ownerUid);b.putLong("deadline",deadline);return b;
    }
    Bundle descriptor() {
        Bundle b=new Bundle();b.putString("open_source_id",sourceId);b.putString("open_component",component);b.putString("open_package",packageName);
        b.putInt("open_user_id",userId);b.putInt("open_owner_uid",ownerUid);b.putLong("open_deadline_elapsed",deadline);return b;
    }
    Bundle actionMetadata(long now) {
        if (!fresh(now)) throw new IllegalStateException("media_open_expired");
        Bundle b=new Bundle();b.putInt("schema",1);b.putString("request_id",UUID.randomUUID().toString().replace("-",""));
        b.putString("source_id",sourceId);b.putString("track_id","");b.putLong("created_elapsed",now);b.putLong("deadline_elapsed",deadline);return b;
    }
    boolean matches(Bundle descriptor) {
        try {
            AtomicWorkbenchMediaOpenRequest other=fromDescriptor(descriptor);
            return sourceId.equals(other.sourceId)&&component.equals(other.component)&&packageName.equals(other.packageName)
                    &&userId==other.userId&&ownerUid==other.ownerUid&&deadline==other.deadline;
        } catch (RuntimeException invalid) { return false; }
    }
    private static String string(Bundle b,String key){Object v=b.get(key);if(!(v instanceof String))throw new IllegalArgumentException("media_metadata_type");return (String)v;}
    private static int integer(Bundle b,String key){Object v=b.get(key);if(!(v instanceof Integer))throw new IllegalArgumentException("media_metadata_type");return (Integer)v;}
    private static long number(Bundle b,String key){Object v=b.get(key);if(!(v instanceof Long))throw new IllegalArgumentException("media_metadata_type");return (Long)v;}
}
