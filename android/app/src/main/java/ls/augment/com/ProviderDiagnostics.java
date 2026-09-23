package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import java.util.Map;

/** Atomic quota check and in-memory publication; existing diagnostic readers keep their keys. */
final class ProviderDiagnostics {
    enum Result { ACCEPTED, INVALID, THROTTLED, FULL }
    private static final Object LOCK = new Object();
    private static final DiagnosticWritePolicy POLICY = new DiagnosticWritePolicy();
    private ProviderDiagnostics() { }

    static Result record(Context context, int callerUid, String key, String value) {
        if (key == null || !key.matches("ls_augment_[a-zA-Z0-9_]{1,140}")
                || ConfigSchema.contains(key) || key.startsWith("ls_augment_tgk_fuse_")) return Result.INVALID;
        // Bound expensive normalization, preference snapshots and disk requests at the boundary.
        if (!POLICY.allowRequest(callerUid, SystemClock.elapsedRealtime())) return Result.THROTTLED;
        String normalized = DiagnosticWritePolicy.normalize(key, value);
        synchronized (LOCK) {
            SharedPreferences prefs = context.getSharedPreferences(AppConfig.DIAGNOSTICS, 0);
            Map<String, ?> stored = prefs.getAll();
            if (normalized.equals(stored.get(key))) return Result.ACCEPTED;
            if (!DiagnosticWritePolicy.fits(stored, key, normalized)) return Result.FULL;
            prefs.edit().putString(key, normalized).apply();
            return Result.ACCEPTED;
        }
    }
}
