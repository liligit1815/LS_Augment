package ls.augment.com.hook;

import android.content.Context;
import android.os.Process;
import android.system.Os;
import android.system.StructStat;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import org.json.JSONObject;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.Callable;
import java.util.function.Consumer;

/** Metadata only. Call on an existing database reader or a worker, never hash database contents. */
final class LauncherDatabaseIdentity {
    private LauncherDatabaseIdentity() { }
    private static final ThreadPoolExecutor READERS = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<>(16), task -> { Thread thread = new Thread(task, "LSA-LauncherDatabaseIdentity"); thread.setDaemon(true); return thread; });
    static void request(Callable<Snapshot> reader, Consumer<Snapshot> result) {
        try { READERS.execute(() -> {
            Snapshot value;
            try { value = reader.call(); }
            catch (Exception error) { value = new Snapshot(); value.error = error.getClass().getSimpleName(); }
            result.accept(value);
        }); } catch (java.util.concurrent.RejectedExecutionException busy) {
            Snapshot value = new Snapshot(); value.error = "reader_busy"; result.accept(value);
        }
    }
    static final class Snapshot {
        String basename = "", pathHash = "", storage = "unknown", contextClass = "", error = "";
        int uid = Process.myUid(), user = uid / 100000, display = -1, contextIdentity;
        long device, inode; boolean exists, ownerMatches;
        Object idp; long observedAt;
        boolean valid() { return exists && ownerMatches && !pathHash.isEmpty() && inode != 0; }
        String signature() {
            return valid() ? "LDI1|" + uid + "|" + user + "|" + storage + "|" + basename
                    + "|" + pathHash + "|" + device + "|" + inode : "";
        }
        boolean sameLocation(Snapshot other) {
            return other != null && uid == other.uid && user == other.user && storage.equals(other.storage)
                    && basename.equals(other.basename) && !pathHash.isEmpty() && pathHash.equals(other.pathHash);
        }
        JSONObject json() throws Exception {
            return new JSONObject().put("basename", basename).put("canonicalPathHash", pathHash)
                    .put("storage", storage).put("uid", uid).put("user", user).put("display", display)
                    .put("contextClass", contextClass).put("contextIdentity", contextIdentity)
                    .put("device", device).put("inode", inode).put("exists", exists)
                    .put("ownerMatches", ownerMatches).put("observedAt", observedAt)
                    .put("evidence", "file_metadata_snapshot").put("error", error);
        }
    }
    static Snapshot read(Context context, String name) {
        Snapshot value = new Snapshot();
        value.observedAt = System.currentTimeMillis();
        if (context == null || name == null || !name.matches("[A-Za-z0-9_\\-]+\\.db")) {
            value.error = "source_contract"; return value;
        }
        value.basename = name; value.contextClass = context.getClass().getName();
        value.contextIdentity = System.identityHashCode(context);
        try { value.storage = context.isDeviceProtectedStorage() ? "device" : "credential"; }
        catch (RuntimeException unavailable) { value.error = unavailable.getClass().getSimpleName(); return value; }
        try {
            android.view.Display display = context.getDisplay();
            value.display = display == null ? -1 : display.getDisplayId();
        } catch (RuntimeException unassociated) { /* An Application has no display association. */ }
        try {
            File file = context.getDatabasePath(name);
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(file.getCanonicalPath().getBytes(StandardCharsets.UTF_8));
            char[] hex = new char[digest.length * 2], digits = "0123456789abcdef".toCharArray();
            for (int i = 0; i < digest.length; i++) { hex[i * 2] = digits[(digest[i] >>> 4) & 15]; hex[i * 2 + 1] = digits[digest[i] & 15]; }
            value.pathHash = new String(hex); value.exists = file.isFile();
            if (value.exists) {
                StructStat stat = Os.stat(file.getCanonicalPath());
                value.device = stat.st_dev; value.inode = stat.st_ino; value.ownerMatches = stat.st_uid == value.uid;
            }
        } catch (Exception unavailable) { value.error = unavailable.getClass().getSimpleName(); }
        value.observedAt = System.currentTimeMillis();
        return value;
    }
}
