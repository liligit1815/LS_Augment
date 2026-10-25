package ls.augment.com;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/** Authenticated, bounded current-user NMS snapshot. Unknown schema is unavailable, never an empty successful list. */
final class AtomicWorkbenchNotificationEvidenceClient {
    private static final Set<String> KEYS = Set.of("schema", "success", "nonce", "sample_elapsed", "sample_wall", "records");
    private final int user;
    private final AtomicWorkbenchMediaSessionEvidenceClient.Principal principal;
    AtomicWorkbenchNotificationEvidenceClient(int user, AtomicWorkbenchMediaSessionEvidenceClient.Principal principal) { this.user = user; this.principal = principal; }
    static final class Snapshot {
        final List<AtomicWorkbenchNotificationRecord> records;
        final long elapsed, wall;
        Snapshot(List<AtomicWorkbenchNotificationRecord> records, long elapsed, long wall) { this.records = List.copyOf(records); this.elapsed = elapsed; this.wall = wall; }
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    Snapshot query() {
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            if (Process.myUid() != 0 || principal == null) return null;
            Bundle auth = principal.current(); if (auth == null) return null;
            String nonce = UUID.randomUUID().toString().replace("-", ""); long start = SystemClock.elapsedRealtime(), deadline = start + 2000;
            Object service = Class.forName("android.os.ServiceManager").getMethod("getService", String.class).invoke(null, "notification");
            if (!(service instanceof IBinder) || !((IBinder) service).isBinderAlive()) return null;
            data.writeInterfaceToken("ls.augment.com.atomic_notification_evidence.v1"); data.writeInt(1); data.writeBundle(auth); data.writeString(nonce); data.writeLong(deadline);
            if (!((IBinder) service).transact(0x00D04E04, data, reply, 0) || reply.dataSize() > 96 * 1024) return null;
            reply.readException(); Bundle result = reply.readBundle(getClass().getClassLoader()); long now = SystemClock.elapsedRealtime();
            if (result == null || reply.dataAvail() != 0 || !result.keySet().equals(KEYS) || !(result.get("schema") instanceof Integer) || result.getInt("schema") != 1
                    || !(result.get("success") instanceof Boolean) || !result.getBoolean("success") || !nonce.equals(result.get("nonce"))
                    || !(result.get("sample_elapsed") instanceof Long) || !(result.get("sample_wall") instanceof Long)
                    || result.getLong("sample_elapsed") < start || result.getLong("sample_elapsed") > now || now < start || now >= deadline || result.getLong("sample_wall") <= 0)
                return null;
            ArrayList<Bundle> rows = result.getParcelableArrayList("records", Bundle.class); if (rows == null || rows.size() > 256) return null;
            List<AtomicWorkbenchNotificationRecord> records = new ArrayList<>(); Set<String> keys = new HashSet<>();
            for (Bundle row : rows) {
                AtomicWorkbenchNotificationRecord record = new AtomicWorkbenchNotificationRecord(row, user);
                if (!keys.add(record.key) || record.publishedClockKnown && record.publishedElapsed > result.getLong("sample_elapsed")) return null; records.add(record);
            }
            return new Snapshot(records, result.getLong("sample_elapsed"), result.getLong("sample_wall"));
        } catch (Exception | LinkageError unavailable) { return null; }
        finally { data.recycle(); reply.recycle(); }
    }
}
