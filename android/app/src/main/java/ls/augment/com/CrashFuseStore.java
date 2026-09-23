package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;

/** Durable crash fuse. Only the checked system-server provider route may arm it. */
public final class CrashFuseStore {
    private static final String PREFS = "ls_augment_crash_fuse_v2";
    private static final Object LOCK = new Object();
    private static volatile DurablePreferences durable;
    private static DurablePreferences preferences(Context context) {
        DurablePreferences value = durable;
        if (value != null) return value;
        synchronized (LOCK) {
            if (durable == null) durable = new DurablePreferences(context.getSharedPreferences(PREFS, 0));
            return durable;
        }
    }
    private CrashFuseStore() { }

    public static boolean isFused(Context context) {
        DurablePreferences prefs = preferences(context);
        return !prefs.getBoolean("migrated", false) || prefs.getBoolean("fused", false);
    }

    public static boolean reset(Context context) {
        synchronized (LOCK) {
            return preferences(context).edit().putBoolean("migrated", true)
                    .putBoolean("fused", false).putBoolean("pending", false)
                    .putInt("attempts", 0).putString("armedSession", "").commit();
        }
    }

    /** Import only the previous safety state; never reset a tripped fuse during upgrade. */
    static boolean importLegacy(Context context) {
        synchronized (LOCK) {
            DurablePreferences prefs = preferences(context);
            if (prefs.getBoolean("migrated", false)) return true;
            RootShell.Result read = RootShell.run("set -e; settings get global ls_augment_tgk_fuse_pending; "
                    + "settings get global ls_augment_tgk_fuse_attempts; settings get global ls_augment_tgk_fuse_tripped",
                    null, 8, 4096);
            if (!read.isSuccess()) return false;
            String[] fields = read.output.trim().split("\\s+");
            if (fields.length != 3) return false;
            int[] values = new int[3];
            for (int i = 0; i < fields.length; i++) {
                if ("null".equals(fields[i])) continue;
                try { values[i] = Integer.parseInt(fields[i]); }
                catch (NumberFormatException invalid) { return false; }
                if (values[i] < 0) return false;
            }
            return prefs.edit().putBoolean("pending", values[0] != 0).putInt("attempts", Math.min(3, values[1]))
                    .putBoolean("fused", values[2] != 0).putBoolean("migrated", true).commit();
        }
    }

    static Bundle refresh(Context context, Bundle request) {
        Bundle result = new Bundle();
        if (request == null) return result;
        String session = request.getString("session", "");
        if (!session.matches("[0-9a-f-]{36}")) return result;
        synchronized (LOCK) {
            DurablePreferences prefs = preferences(context);
            if (!prefs.getBoolean("migrated", false)) return result;
            int attempts = prefs.getInt("attempts", 0);
            boolean pending = prefs.getBoolean("pending", false), fused = prefs.getBoolean("fused", false);
            String armedSession = prefs.getString("armedSession", "");
            if (!session.equals(prefs.getString("session", ""))) {
                attempts = Math.min(3, attempts + (pending ? 1 : 0));
                fused |= attempts >= 3;
                pending = false; armedSession = "";
            }
            if (request.getBoolean("clearPending")) pending = false;
            if (request.getBoolean("clearAttempts")) attempts = 0;
            if (request.getBoolean("disarm")) armedSession = "";
            if (!fused && request.getBoolean("arm") && !session.equals(armedSession)) {
                pending = true; armedSession = session;
            }
            // A single durable commit precedes the ARMED acknowledgement. Failure stays UNKNOWN.
            if (!prefs.edit().putString("session", session).putString("armedSession", armedSession)
                    .putInt("attempts", attempts).putBoolean("pending", pending).putBoolean("fused", fused).commit())
                return result;
            result.putBoolean("ok", true); result.putInt("attempts", attempts);
            result.putString("state", fused ? "FUSED" : session.equals(armedSession) ? "ARMED" : "READY");
            return result;
        }
    }
}
