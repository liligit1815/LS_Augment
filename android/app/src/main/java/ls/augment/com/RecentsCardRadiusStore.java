package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.os.SystemClock;

import org.json.JSONObject;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/** One last measured range, owned by the module and excluded from feature configuration. */
final class RecentsCardRadiusStore {
    static final String PREFS = "recents-card-radius-range-v2";
    static final String KEY = "latest";
    private static final String LAUNCHER = "com.zte.mifavor.launcher";
    private static final int MAX_PAYLOAD = 4096;
    private static final Uri RESET_URI = Uri.parse("content://ls.augment.com.config/recents-radius-reset");
    private static final AtomicBoolean providerCheckScheduled = new AtomicBoolean();
    // Guarded by ResetWriteFence.class, also excluding a concurrent module reset.
    private static SharedPreferences storage;
    private static DurablePreferences confirmed;
    private static long storageGeneration = -1;
    private static long resetCutoffElapsed = -1;

    private RecentsCardRadiusStore() { }

    /** Provider creation runs on main; even the first private preference read stays off it. */
    static void onProviderCreated(Context context) {
        if (!providerCheckScheduled.compareAndSet(false, true)) return;
        Context app = context.getApplicationContext();
        Thread check = new Thread(() -> {
            synchronized (ResetWriteFence.class) {
                if (ResetWriteFence.active()) return;
                try {
                    if (!app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).contains(KEY))
                        notifyReset(app);
                } catch (RuntimeException unavailable) { /* A later real sample can still publish. */ }
            }
        }, "lsa-recents-radius-cache-check");
        check.setDaemon(true);
        try { check.start(); }
        catch (RuntimeException unavailable) { /* No retry loop or main-thread disk fallback. */ }
    }

    /** Called only after module-owned storage was cleared, while the reset fence is held. */
    static void onStorageReset(Context context) {
        synchronized (ResetWriteFence.class) {
            confirmed = null; storage = null; storageGeneration = -1;
            resetCutoffElapsed = SystemClock.elapsedRealtime();
            notifyReset(context);
        }
    }

    private static void notifyReset(Context context) {
        try { context.getContentResolver().notifyChange(RESET_URI, null); }
        catch (RuntimeException unavailable) { /* Do not change the outcome of module reset. */ }
    }

    static Bundle publish(Context context, int callerUid, int callerPid,
            String callerPackage, Bundle extras) {
        long generation = ResetWriteFence.generation();
        if (ResetWriteFence.active()) return reply(false, "reset_in_progress", false);
        try {
            PackageManager pm = context.getPackageManager();
            if (callerUid < 0 || callerPid <= 0 || callerUid / 100000 != Process.myUid() / 100000
                    || !LAUNCHER.equals(callerPackage)
                    || pm.getApplicationInfo(LAUNCHER, 0).uid != callerUid) {
                return reply(false, "caller_identity", false);
            }
            String[] packages = pm.getPackagesForUid(callerUid);
            if (packages == null || !Arrays.asList(packages).contains(LAUNCHER))
                return reply(false, "caller_identity", false);
            String payload = extras == null ? null : extras.getString("payload");
            if (payload == null || payload.isEmpty() || payload.length() > MAX_PAYLOAD)
                return reply(false, "payload_invalid", false);
            JSONObject incoming = new JSONObject(payload);
            Map<String, Number> numbers = numbers(incoming);
            PackageInfo launcher = pm.getPackageInfo(LAUNCHER, 0);
            if (RecentsCardRadiusUiRange.integer(numbers, "pid") != callerPid
                    || RecentsCardRadiusUiRange.integer(numbers, "build") != BuildConfig.VERSION_CODE
                    || RecentsCardRadiusUiRange.integer(numbers, "launcherVersion") != launcher.getLongVersionCode())
                return reply(false, "source_mismatch", false);
            if (launcher.getLongVersionCode() <= 0 || launcher.lastUpdateTime <= 0
                    || Build.FINGERPRINT == null || Build.FINGERPRINT.isEmpty()
                    || Build.FINGERPRINT.length() > 1024 || RecentsCardRadiusUiRange.geometry(numbers) == null)
                return reply(false, "geometry_invalid", false);

            JSONObject record = new JSONObject().put("schema", 2)
                    .put("launcherVersion", launcher.getLongVersionCode())
                    .put("launcherLastUpdateTime", launcher.lastUpdateTime)
                    .put("firmware", Build.FINGERPRINT);
            for (String key : new String[]{"densityDpi", "displayWidthPx", "displayHeightPx",
                    "rotation", "minOffsetDp", "maxOffsetDp"})
                record.put(key, RecentsCardRadiusUiRange.integer(numbers, key));
            for (String key : new String[]{"nativeRadiusDp", "maxRadiusDp"}) {
                double value = RecentsCardRadiusUiRange.decimal(numbers, key);
                record.put(key, value == 0d ? 0d : value);
            }
            String normalized = record.toString();
            synchronized (ResetWriteFence.class) {
                if (ResetWriteFence.active() || ResetWriteFence.stale(generation))
                    return reply(false, "reset_in_progress", false);
                // Explicit reset must not be undone by an old Binder request
                // arriving after the fence ended. This is not a cache age limit.
                if (resetCutoffElapsed >= 0
                        && RecentsCardRadiusUiRange.integer(numbers, "observedElapsed") <= resetCutoffElapsed)
                    return reply(false, "observation_before_reset", false);
                DurablePreferences prefs = preferences(context);
                boolean changed = !sameRange(prefs.getString(KEY, ""), record);
                if (changed && !prefs.edit().clear().putString(KEY, normalized).commit())
                    return reply(false, "storage_failed", false);
                // These were diagnostic observations, never feature settings or OEM data.
                removeLegacy(context, AppConfig.DIAGNOSTICS);
                removeLegacy(context, DiagnosticEvidenceStore.STORE);
                return reply(true, "saved", changed);
            }
        } catch (Exception unavailable) {
            return reply(false, "unavailable", false);
        }
    }

    static RecentsCardRadiusUiRange load(Context context, int density, int width, int height) {
        try {
            synchronized (ResetWriteFence.class) {
                if (ResetWriteFence.active()) return null;
                String value = preferences(context).getString(KEY, "");
                if (value.isEmpty() || value.length() > MAX_PAYLOAD) return null;
                JSONObject record = new JSONObject(value);
                PackageInfo launcher = context.getPackageManager().getPackageInfo(LAUNCHER, 0);
                return RecentsCardRadiusUiRange.verified(numbers(record), launcher.getLongVersionCode(),
                        launcher.lastUpdateTime, record.optString("firmware"), Build.FINGERPRINT,
                        density, width, height);
            }
        } catch (Exception unavailable) { return null; }
    }

    private static DurablePreferences preferences(Context context) {
        SharedPreferences next = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        long generation = ResetWriteFence.generation();
        if (confirmed == null || storage != next || storageGeneration != generation) {
            storage = next;
            confirmed = new DurablePreferences(next);
            storageGeneration = generation;
        }
        return confirmed;
    }

    private static void removeLegacy(Context context, String name) {
        SharedPreferences prefs = context.getSharedPreferences(name, Context.MODE_PRIVATE);
        if (prefs.contains(RecentsCardRadiusRange.DIAGNOSTIC))
            prefs.edit().remove(RecentsCardRadiusRange.DIAGNOSTIC).apply();
    }

    /** Native float noise must not rewrite a slider with the same effective endpoints. */
    private static boolean sameRange(String saved, JSONObject next) {
        try {
            JSONObject previous = new JSONObject(saved);
            Map<String, Number> before = numbers(previous), after = numbers(next);
            if (RecentsCardRadiusUiRange.geometry(before) == null
                    || !previous.optString("firmware").equals(next.optString("firmware"))) return false;
            for (String key : new String[]{"schema", "launcherVersion", "launcherLastUpdateTime",
                    "densityDpi", "displayWidthPx", "displayHeightPx", "rotation", "minOffsetDp", "maxOffsetDp"}) {
                if (RecentsCardRadiusUiRange.integer(before, key) != RecentsCardRadiusUiRange.integer(after, key))
                    return false;
            }
            return true;
        } catch (Exception invalid) { return false; }
    }

    private static Map<String, Number> numbers(JSONObject json) {
        Map<String, Number> values = new HashMap<>();
        for (Iterator<String> keys = json.keys(); keys.hasNext();) {
            String key = keys.next(); Object value = json.opt(key);
            if (value instanceof Number) values.put(key, (Number) value);
        }
        return values;
    }

    private static Bundle reply(boolean ok, String reason, boolean changed) {
        Bundle reply = new Bundle();
        reply.putBoolean("ok", ok); reply.putString("reason", reason); reply.putBoolean("changed", changed);
        return reply;
    }
}
