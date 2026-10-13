package ls.augment.com.hook;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import android.provider.Settings;
import java.util.Objects;
import ls.augment.com.BuildConfig;

/** Used only by the native GFRC worker; the host process never owns module files. */
final class GfrcRecoveryClient {
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    static final String LEGACY_KEY = "redmagic_duo_native_gfrc_recovery_v1";
    private static boolean migrated;

    private GfrcRecoveryClient() { }

    static String read(Context context) throws Exception {
        requireWorker();
        String saved = request(context, "gfrc_recovery_read", new Bundle()).getString("payload");
        if (migrated) return saved;
        // Only the new system_server hook migrates its own obsolete journal.
        // App-side copying while an older hook still writes it could save stale ownership.
        String legacy = Settings.Global.getString(context.getContentResolver(), LEGACY_KEY);
        if (legacy != null && !legacy.isEmpty()) {
            if (saved == null) {
                write(context, null, legacy);
                saved = legacy;
            } else if (!saved.equals(legacy)) {
                throw new IllegalStateException("legacy_owner_conflict");
            }
        }
        // The durable provider ACK precedes deletion of every nonempty source.
        // getString(null) cannot distinguish an absent row from a stored null value.
        if (!Objects.equals(legacy, Settings.Global.getString(context.getContentResolver(), LEGACY_KEY)))
            throw new IllegalStateException("legacy_owner_changed");
        context.getContentResolver().delete(Settings.Global.CONTENT_URI, "name=?", new String[]{LEGACY_KEY});
        try (Cursor remaining = context.getContentResolver().query(Settings.Global.CONTENT_URI,
                new String[]{"name"}, "name=?", new String[]{LEGACY_KEY}, null)) {
            if (remaining == null || remaining.moveToFirst())
                throw new IllegalStateException("legacy_owner_cleanup_failed");
        }
        migrated = true;
        return saved;
    }

    static void write(Context context, String expected, String payload) throws Exception {
        requireWorker();
        Bundle extras = new Bundle();
        extras.putString("expected", expected); extras.putString("payload", payload);
        Bundle result = request(context, "gfrc_recovery_write", extras);
        if (!Objects.equals(payload, result.getString("payload")))
            throw new IllegalStateException("owner_record_not_accepted");
    }

    private static Bundle request(Context context, String method, Bundle extras) throws Exception {
        extras.putInt("build", BuildConfig.VERSION_CODE);
        Bundle result = null;
        int attempts = "gfrc_recovery_write".equals(method) ? 2 : 1;
        for (int attempt = 0; attempt < attempts; attempt++) {
            try { result = context.getContentResolver().call(PROVIDER, method, null, extras); }
            catch (RuntimeException unavailable) {
                if (attempt + 1 == attempts) throw unavailable;
            }
            // One duplicate-safe retry: a lost Binder ACK may follow a real commit.
            if (result != null) break;
        }
        if (result == null || !result.getBoolean("ok", false))
            throw new IllegalStateException(result == null ? "owner_provider_unavailable"
                    : result.getString("reason", "owner_provider_rejected"));
        if (!result.containsKey("payload")) throw new IllegalStateException("owner_reply_incomplete");
        return result;
    }

    private static void requireWorker() {
        if (Looper.myLooper() == Looper.getMainLooper()) throw new IllegalStateException("owner_io_on_main");
    }
}
