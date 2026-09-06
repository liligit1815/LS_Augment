package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;

/** Persistent crash marker protecting system_server from repeated native installs. */
final class RapidFireCrashFuse {
    static final String PENDING = "ls_augment_tgk_fuse_pending";
    static final String ATTEMPTS = "ls_augment_tgk_fuse_attempts";
    static final String FUSED = "ls_augment_tgk_fuse_tripped";
    private static boolean startupChecked;

    private RapidFireCrashFuse() { }

    static synchronized void onSystemStart(Context context) {
        if (startupChecked || context == null) return;
        startupChecked = true;
        try {
            int attempts = Settings.Global.getInt(context.getContentResolver(), ATTEMPTS, 0);
            int pending = Settings.Global.getInt(context.getContentResolver(), PENDING, 0);
            if (pending == 1) attempts++;
            Settings.Global.putInt(context.getContentResolver(), PENDING, 0);
            Settings.Global.putInt(context.getContentResolver(), ATTEMPTS, attempts);
            if (attempts >= 3) Settings.Global.putInt(context.getContentResolver(), FUSED, 1);
            publish(context, attempts >= 3 ? "fused" : "ready", attempts);
        } catch (Throwable ignored) {
            // A missing SettingsProvider is treated as unavailable by beforeInstall().
        }
    }

    static synchronized boolean beforeInstall(Context context) {
        if (context == null) return false;
        onSystemStart(context);
        try {
            if (Settings.Global.getInt(context.getContentResolver(), FUSED, 0) == 1) {
                publish(context, "fused", Settings.Global.getInt(
                        context.getContentResolver(), ATTEMPTS, 3));
                return false;
            }
            if (!Settings.Global.putInt(context.getContentResolver(), PENDING, 1)) return false;
            Settings.Global.putLong(context.getContentResolver(),
                    "ls_augment_tgk_fuse_started_at", System.currentTimeMillis());
            publish(context, "pending", Settings.Global.getInt(
                    context.getContentResolver(), ATTEMPTS, 0));
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    static void installationFailed(Context context) {
        if (context == null) return;
        try { Settings.Global.putInt(context.getContentResolver(), PENDING, 0); }
        catch (Throwable ignored) { }
    }

    static void armStableClear(Context context) {
        if (context == null) return;
        try {
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                if (!TgkRapidFireNative.isLoaded()) return;
                try {
                    Settings.Global.putInt(context.getContentResolver(), PENDING, 0);
                    Settings.Global.putInt(context.getContentResolver(), ATTEMPTS, 0);
                    publish(context, "stable", 0);
                } catch (Throwable ignored) { }
            }, 60_000L);
        } catch (Throwable ignored) { }
    }

    static boolean isFused(Context context) {
        if (context == null) return true;
        onSystemStart(context);
        try { return Settings.Global.getInt(context.getContentResolver(), FUSED, 0) == 1; }
        catch (Throwable ignored) { return true; }
    }

    private static void publish(Context context, String state, int attempts) {
        FeatureSettings.diagnostic(context, "ls_augment_tgk_rapid_fire_fuse_state",
                state + "|attempts=" + attempts);
    }
}
