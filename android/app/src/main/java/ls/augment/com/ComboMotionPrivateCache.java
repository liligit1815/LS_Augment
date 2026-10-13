package ls.augment.com;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.Arrays;

/** Module-owned disposable motion cache. No caller supplies a destination path. */
final class ComboMotionPrivateCache {
    static final String CALL = "combo_motion_prepare";
    static final String PATH = "combo-motion";
    private static final String HOST = "cn.nubia.gamehelpmodule";
    private static final String DIRECTORY = "combo-motion-v1";
    private static final Object LOCK = new Object();

    private ComboMotionPrivateCache() { }

    static boolean allowed(Context context, int uid, String caller, String[] packages) {
        if (uid < 0 || uid / 100000 != Process.myUid() / 100000 || !HOST.equals(caller)
                || packages == null || !Arrays.asList(packages).contains(HOST)) return false;
        try { return context.getPackageManager().getApplicationInfo(HOST, 0).uid == uid; }
        catch (Exception ignored) { return false; }
    }

    /** The provider captures and checks Binder identity before clearing it. */
    static Bundle prepare(Context context, int uid, String caller, String[] packages, Bundle extras) {
        Bundle out = new Bundle();
        if (!allowed(context, uid, caller, packages)) return out;
        if (extras == null || extras.size() != 7 || extras.getInt("version", -1) != BuildConfig.VERSION_CODE)
            return out;
        ParcelFileDescriptor source = extras.getParcelable("source");
        if (source == null) return out;
        try (ParcelFileDescriptor received = source) {
            String digest = extras.getString("digest", "");
            String sourceId = extras.getString("source_id", "");
            long size = extras.getLong("size", -1), modified = extras.getLong("modified", -1);
            float rate = extras.getFloat("rate", Float.NaN);
            if (!digest.matches("[0-9a-f]{64}") || !sourceId.matches("[0-9a-f]{64}")
                    || size <= 0 || size > ComboMotionPrivateScaler.MAX_FILE_BYTES || modified < 0
                    || !ls.augment.com.hook.ComboSpeedPolicy.isValidRate(rate)) return out;
            StructStat stat = Os.fstat(received.getFileDescriptor());
            if (!OsConstants.S_ISREG(stat.st_mode) || stat.st_size != size
                    || (Os.fcntlInt(received.getFileDescriptor(), OsConstants.F_GETFL, 0)
                        & OsConstants.O_ACCMODE) != OsConstants.O_RDONLY) return out;
            synchronized (ResetWriteFence.class) {
                if (ResetWriteFence.active()) return out;
                synchronized (LOCK) {
                    File root = root(context);
                    File[] abandoned = root.listFiles((dir, name) -> name.matches("source-[0-9a-f]{64}"));
                    if (abandoned == null) throw new IOException("private_cache_unreadable");
                    for (File old : abandoned) if (!old.delete()) throw new IOException("staging_cleanup");
                    // Stable private staging identity preserves cache hits without exposing host paths.
                    File stage = new File(root, "source-" + sourceId);
                    try {
                        try (ParcelFileDescriptor copy = ParcelFileDescriptor.dup(received.getFileDescriptor());
                             ParcelFileDescriptor.AutoCloseInputStream input = new ParcelFileDescriptor.AutoCloseInputStream(copy);
                             FileOutputStream output = new FileOutputStream(stage, false)) {
                            byte[] buffer = new byte[8192]; long total = 0; int count;
                            MessageDigest actual = MessageDigest.getInstance("SHA-256");
                            while ((count = input.read(buffer)) != -1) {
                                total += count;
                                if (total > size) throw new IOException("source_size_changed");
                                output.write(buffer, 0, count); actual.update(buffer, 0, count);
                            }
                            if (total != size || !digest.equals(hex(actual.digest())))
                                throw new IOException("source_digest_changed");
                            output.getFD().sync();
                        }
                        if (!stage.setLastModified(modified)) throw new IOException("source_time");
                        ComboMotionPrivateScaler.Result scaled = ComboMotionPrivateScaler.scale(root,
                                ComboMotionPrivateScaler.Request.capture(root, stage.getPath(), rate, 0));
                        if (!scaled.success) { out.putString("error", scaled.error); return out; }
                        out.putBoolean("ok", true);
                        out.putInt("version", BuildConfig.VERSION_CODE);
                        out.putString("identity", scaled.cacheIdentity);
                        out.putBoolean("cache_hit", scaled.cacheHit);
                        out.putInt("events", scaled.eventCount);
                        out.putLong("source_span", scaled.sourceSpanMs);
                        out.putLong("output_span", scaled.outputSpanMs);
                        out.putString("evidence", scaled.evidenceSource);
                    } finally { if (stage.exists()) stage.delete(); }
                }
            }
        } catch (Exception error) { out.putString("error", error.getClass().getSimpleName()); }
        return out;
    }

    /** Standard openFile transport transfers ownership of this read-only descriptor to Binder. */
    static ParcelFileDescriptor open(Context context, int uid, String caller, String[] packages,
            Uri uri, String mode) throws FileNotFoundException {
        if (!allowed(context, uid, caller, packages) || !"r".equals(mode) || uri == null
                || !"ls.augment.com.config".equals(uri.getAuthority())
                || uri.getQuery() != null || uri.getFragment() != null
                || uri.getPathSegments().size() != 2 || !PATH.equals(uri.getPathSegments().get(0))
                || !uri.getLastPathSegment().matches("[0-9a-f]{64}"))
            throw new FileNotFoundException("invalid_motion_request");
        synchronized (ResetWriteFence.class) {
            if (ResetWriteFence.active()) throw new FileNotFoundException("reset_active");
            synchronized (LOCK) {
                try {
                    File directory = new File(root(context), "ls_augment_combo");
                    File file = new File(directory, "motion-v3-" + uri.getLastPathSegment() + ".json");
                    if (!file.getCanonicalFile().getParentFile().equals(directory.getCanonicalFile())
                            || !OsConstants.S_ISREG(Os.lstat(file.getPath()).st_mode)
                            || file.length() <= 0 || file.length() > ComboMotionPrivateScaler.MAX_FILE_BYTES * 2)
                        throw new IOException("invalid_motion_file");
                    return ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
                } catch (Exception error) { throw new FileNotFoundException("motion_unavailable"); }
            }
        }
    }

    /** Reset calls this after pausing playback; open consumer FDs remain valid until native close. */
    static boolean clear(Context context) {
        synchronized (LOCK) {
            try {
                File directory = new File(context.getCacheDir().getCanonicalFile(), DIRECTORY);
                if (!directory.exists()) return true;
                if (!directory.getCanonicalFile().equals(directory.getAbsoluteFile())) return false;
                File[] children = directory.listFiles();
                if (children == null) return false;
                for (File child : children) {
                    if (child.isDirectory() && "ls_augment_combo".equals(child.getName())) {
                        if (!child.getCanonicalFile().equals(child.getAbsoluteFile())) return false;
                        File[] files = child.listFiles(); if (files == null) return false;
                        for (File file : files) if (!file.isFile() || !file.delete()) return false;
                        if (!child.delete()) return false;
                    } else if (!child.getName().matches("source-[0-9a-f]{64}") || !child.isFile() || !child.delete()) return false;
                }
                return directory.delete();
            } catch (Exception ignored) { return false; }
        }
    }

    private static File root(Context context) throws IOException {
        File directory = new File(context.getCacheDir().getCanonicalFile(), DIRECTORY);
        if ((!directory.isDirectory() && !directory.mkdirs())
                || !directory.getCanonicalFile().equals(directory.getAbsoluteFile()))
            throw new IOException("private_cache_unavailable");
        return directory;
    }

    private static String hex(byte[] bytes) {
        StringBuilder out = new StringBuilder(bytes.length * 2);
        for (byte item : bytes) out.append(String.format(java.util.Locale.ROOT, "%02x", item & 255));
        return out.toString();
    }
}
