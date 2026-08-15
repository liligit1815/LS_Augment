package ls.augment.com;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Binder;
import android.os.Process;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Set;

/** Read-only feature configuration bridge for statically scoped Hook processes. */
public final class LSConfigProvider extends ContentProvider {
    private static final Set<String> ALLOWED_CALLERS = new HashSet<>(Arrays.asList(
            "ls.augment.com", "com.android.settings", "com.android.systemui",
            "com.zte.beautify", "com.zte.beautifyadapter", "com.zte.cn.doubleapp",
            "com.zte.mifavor.launcher",
            "cn.nubia.gamelauncher", "cn.nubia.gameassist", "cn.nubia.gamehelpmodule",
            "cn.nubia.gamehelperline"));
    @Override
    public boolean onCreate() { return true; }

    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        Bundle result = new Bundle();
        if (getContext() == null || !allowedCaller()) return result;
        if ("get".equals(method) && arg != null && arg.startsWith("ls_augment_")
                && !AppConfig.HIDE_TARGETS.equals(arg)) {
            result.putString("value", new AppConfig(getContext()).get(arg));
            return result;
        }
        // Debug builds expose an app-UID/Root-only bridge for ADB integration
        // tests. Release builds and ordinary external UIDs cannot mutate
        // configuration through the exported read-only provider.
        if ("debug_set".equals(method) && BuildConfig.DEBUG
                && (Binder.getCallingUid() == Process.myUid()
                || Binder.getCallingUid() == Process.ROOT_UID)
                && arg != null && arg.startsWith("ls_augment_") && extras != null) {
            LinkedHashMap<String, String> update = new LinkedHashMap<>();
            update.put(arg, extras.getString("value", ""));
            AppConfig.SaveResult saved = new AppConfig(getContext()).save(update);
            result.putBoolean("ok", saved.success);
            result.putString("message", saved.message);
            return result;
        }
        if ("diagnostic".equals(method) && arg != null && arg.startsWith("ls_augment_")) {
            String value = extras == null ? "" : extras.getString("value", "");
            value = value.replace('\r', ' ').replace('\n', ' ');
            if (value.length() > 2000) value = value.substring(0, 2000);
            getContext().getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .edit().putString(arg, value).apply();
            result.putBoolean("ok", true);
            return result;
        }
        if ("diagnostic_get".equals(method) && arg != null && arg.startsWith("ls_augment_")) {
            result.putString("value", getContext().getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .getString(arg, ""));
        }
        return result;
    }

    private boolean allowedCaller() {
        try {
            if (getContext() == null) return false;
            int uid = Binder.getCallingUid();
            if (uid == Process.myUid()) return true;
            if (BuildConfig.DEBUG && uid == Process.ROOT_UID) return true;
            String[] packages = getContext().getPackageManager().getPackagesForUid(uid);
            if (packages == null) return false;
            for (String packageName : packages) {
                if (ALLOWED_CALLERS.contains(packageName)) return true;
            }
            return false;
        } catch (Throwable ignored) { return false; }
    }

    @Override public Cursor query(Uri uri, String[] projection, String selection,
            String[] selectionArgs, String sortOrder) { return null; }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int delete(Uri uri, String selection, String[] selectionArgs) { return 0; }
    @Override public int update(Uri uri, ContentValues values, String selection,
            String[] selectionArgs) { return 0; }
}
