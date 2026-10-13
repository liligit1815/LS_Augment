package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Process;
import android.os.Looper;
import java.util.Arrays;
import java.util.Iterator;
import org.json.JSONObject;

/** Durable native-property undo journal. Never erase this while recovery is pending. */
final class GfrcRecoveryStore {
    static final String PREFS = "native-gfrc-recovery-v1";
    private static final String KEY = "owner";
    private static final int LIMIT = 4096;
    private static SharedPreferences storage;
    private static DurablePreferences confirmed;

    private GfrcRecoveryStore() { }

    /** Binder identity must be captured by the provider before clearCallingIdentity. */
    static Bundle call(Context context, String method, int uid, int pid,
            String caller, String[] packages, Bundle extras) {
        synchronized (ResetWriteFence.class) {
            return callLocked(context, method, uid, pid, caller, packages, extras);
        }
    }

    private static Bundle callLocked(Context context, String method, int uid, int pid,
            String caller, String[] packages, Bundle extras) {
        if (uid != Process.SYSTEM_UID || pid <= 0 || uid / 100000 != Process.myUid() / 100000
                || !"android".equals(caller) || packages == null
                || !Arrays.asList(packages).contains("android")) return reply(false, "caller_identity", null);
        if (extras == null || !(extras.get("build") instanceof Integer)
                || extras.getInt("build", -1) != BuildConfig.VERSION_CODE)
            return reply(false, "source_version", null);
        try {
            DurablePreferences prefs = preferences(context);
            String current = prefs.getString(KEY, null);
            if (prefs.contains(KEY) && current == null) return reply(false, "owner_record_unavailable", null);
            if ("gfrc_recovery_read".equals(method)) {
                if (extras.size() != 1) return reply(false, "read_contract", null);
                if (current != null) validate(current);
                return reply(true, "loaded", current);
            }
            if (!"gfrc_recovery_write".equals(method) || extras.size() != 3
                    || !extras.containsKey("expected") || !extras.containsKey("payload")
                    || extras.get("expected") != null && !(extras.get("expected") instanceof String)
                    || extras.get("payload") != null && !(extras.get("payload") instanceof String))
                return reply(false, "write_contract", null);
            String expected = extras.getString("expected"), next = extras.getString("payload");
            if (expected != null) validate(expected);
            if (next != null) validate(next);
            // A stale enabled snapshot must not acquire or confirm native ownership
            // while total reset is running. Existing undo progress must remain writable.
            if (ResetWriteFence.active() && next != null
                    && !"restoring".equals(new JSONObject(next).getString("phase")))
                return reply(false, "reset_in_progress", null);
            // Retrying a committed write with a lost Binder ACK is a no-op.
            if (java.util.Objects.equals(next, current)) return reply(true, "saved", current);
            if (!java.util.Objects.equals(expected, current)) return reply(false, "owner_changed", null);
            if (!prefs.edit().clear().putString(KEY, next).commit())
                return reply(false, "owner_record_not_saved", null);
            return reply(true, "saved", next);
        } catch (Exception unavailable) { return reply(false, "owner_record_unavailable", null); }
    }

    /** Reset must wait for actual native restoration, never discard the undo record. */
    static boolean hasPending(Context context) {
        synchronized (ResetWriteFence.class) {
            try { return preferences(context).contains(KEY); }
            catch (RuntimeException unavailable) { return true; }
        }
    }

    /** Called by the reset worker after disabled configuration was published. */
    static boolean awaitRestored(Context context) {
        if (Looper.myLooper() == Looper.getMainLooper()) return false;
        for (int attempt = 0; attempt <= 50; attempt++) {
            if (!hasPending(context)) return true;
            if (attempt == 50) return false;
            try { Thread.sleep(100L); }
            catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                return false;
            }
        }
        return false;
    }

    private static DurablePreferences preferences(Context context) {
        SharedPreferences next = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (confirmed == null || storage != next) {
            storage = next;
            confirmed = new DurablePreferences(next);
        }
        return confirmed;
    }

    private static void validate(String raw) throws Exception {
        if (raw.isEmpty() || raw.length() > LIMIT) throw new IllegalArgumentException("owner_record_size");
        JSONObject value = new JSONObject(raw);
        if (value.length() != 6 || value.getInt("version") != 1
                || !value.getString("boot").matches("[a-fA-F0-9-]{36}"))
            throw new IllegalArgumentException("owner_record_schema");
        String phase = value.getString("phase");
        if (!"applying".equals(phase) && !"applied".equals(phase) && !"restoring".equals(phase))
            throw new IllegalArgumentException("owner_record_phase");
        boolean owned = value.getBoolean("capabilityOwned"), stopped = value.getBoolean("modesStopped");
        JSONObject properties = value.getJSONObject("properties");
        if (properties.length() > 3 || properties.length() == 0
                && !("restoring".equals(phase) && owned && !stopped))
            throw new IllegalArgumentException("owner_record_properties");
        for (Iterator<String> keys = properties.keys(); keys.hasNext();) {
            String key = keys.next();
            String intended = switch (key) {
                case "vendor.gpp.allgame.enable" -> "1";
                case "vendor.gpp.maxw" -> "1080";
                case "vendor.gpp.maxh" -> "2400";
                default -> throw new IllegalArgumentException("owner_record_key");
            };
            JSONObject property = properties.getJSONObject(key);
            Object original = property.get("original"), savedIntended = property.get("intended");
            if (property.length() != 2 || !(original instanceof String) || ((String) original).length() > 91
                    || !intended.equals(savedIntended)) throw new IllegalArgumentException("owner_record_value");
        }
    }

    private static Bundle reply(boolean ok, String reason, String payload) {
        Bundle result = new Bundle();
        result.putBoolean("ok", ok); result.putString("reason", reason);
        if (ok) result.putString("payload", payload);
        return result;
    }
}
