package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import java.util.LinkedHashMap;
import java.util.Map;

/** Verified device state, separate from the user's desired feature configuration. */
final class RuntimeStateStore {
    private static final String PREFS = "ls_augment_runtime_v2";
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
    private RuntimeStateStore() { }

    static RootShell.Result publishHidden(Context context, String hidden, String tile) {
        if (hidden == null || hidden.length() > 131072 || tile == null || !tile.matches("[A-Z_]{1,32}"))
            return new RootShell.Result(2, "应用状态无效", false);
        synchronized (LOCK) {
            DurablePreferences prefs = preferences(context);
            if (hidden.equals(prefs.getString(RemoteConfig.HIDDEN, ""))
                    && tile.equals(prefs.getString(RemoteConfig.TILE, "EMPTY")))
                return new RootShell.Result(0, "应用状态已同步", false);
            long revision = Math.max(1L, prefs.getLong(RemoteConfig.RUNTIME_REVISION, 0L) + 1L);
            if (!prefs.edit().putString(RemoteConfig.HIDDEN, hidden).putString(RemoteConfig.TILE, tile)
                    .putLong(RemoteConfig.RUNTIME_REVISION, revision).commit())
                return new RootShell.Result(1, "无法保存应用状态", false);
        }
        try { context.getContentResolver().notifyChange(Uri.parse("content://ls.augment.com.config/config/runtime"), null); }
        catch (RuntimeException ignored) { }
        FrameworkConfigSync.request();
        return new RootShell.Result(0, "应用状态已同步", false);
    }

    static Map<String, ?> values(Context context) {
        synchronized (LOCK) {
            Map<String, ?> all = preferences(context).getAll();
            Map<String, Object> result = new LinkedHashMap<>();
            result.put(RemoteConfig.HIDDEN, all.containsKey(RemoteConfig.HIDDEN) ? all.get(RemoteConfig.HIDDEN) : "");
            result.put(RemoteConfig.TILE, all.containsKey(RemoteConfig.TILE) ? all.get(RemoteConfig.TILE) : "EMPTY");
            result.put(RemoteConfig.RUNTIME_REVISION, all.containsKey(RemoteConfig.RUNTIME_REVISION) ? all.get(RemoteConfig.RUNTIME_REVISION) : 0L);
            return result;
        }
    }

    static Bundle snapshot(Context context) {
        Map<String, ?> values = values(context);
        Bundle result = new Bundle(); result.putBoolean("ok", true);
        result.putString(RemoteConfig.HIDDEN, (String) values.get(RemoteConfig.HIDDEN));
        result.putString(RemoteConfig.TILE, (String) values.get(RemoteConfig.TILE));
        result.putLong(RemoteConfig.RUNTIME_REVISION, (Long) values.get(RemoteConfig.RUNTIME_REVISION));
        return result;
    }
}
