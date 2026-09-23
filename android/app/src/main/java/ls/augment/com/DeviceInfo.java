package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.provider.Settings;

/** Five local, non-sensitive device fields used by About. */
final class DeviceInfo {
    static final String SYSTEM_PHONE_NAME = "system_device_name";
    static final String GLOBAL_DEVICE_NAME = "device_name";
    final String name, model, androidVersion, systemVersion, launcherVersion;

    DeviceInfo(Context context) {
        name = deviceName(context);
        model = value(Build.MODEL);
        androidVersion = value(Build.VERSION.RELEASE);
        systemVersion = value(Build.DISPLAY);
        launcherVersion = launcherVersion(context);
    }

    private static String deviceName(Context context) {
        String systemName = null, globalName = null;
        try {
            // RedMagic Settings DeviceUtils.loadMyPhoneName()/saveName() use this
            // System key; the AOSP Global name can still contain the model code.
            systemName = Settings.System.getString(context.getContentResolver(), SYSTEM_PHONE_NAME);
        } catch (RuntimeException ignored) { }
        if (provided(systemName)) return systemName.trim();
        try {
            globalName = Settings.Global.getString(context.getContentResolver(), GLOBAL_DEVICE_NAME);
        } catch (RuntimeException ignored) { }
        return chooseDeviceName(systemName, globalName, Build.MODEL);
    }

    static String chooseDeviceName(String systemName, String globalName, String model) {
        if (provided(systemName)) return systemName.trim();
        if (provided(globalName)) return globalName.trim();
        return value(model);
    }

    private static String launcherVersion(Context context) {
        PackageManager pm = context.getPackageManager();
        try {
            ComponentName home = null;
            ResolveInfo resolved = pm.resolveActivity(new Intent(Intent.ACTION_MAIN)
                    .addCategory(Intent.CATEGORY_HOME), PackageManager.MATCH_DEFAULT_ONLY);
            if (resolved != null && resolved.activityInfo != null
                    && !"android".equals(resolved.activityInfo.packageName)) {
                home = new ComponentName(resolved.activityInfo.packageName, resolved.activityInfo.name);
            }
            if (home == null) return "尚未选择默认桌面";
            PackageInfo info = pm.getPackageInfo(home.getPackageName(), 0);
            String version = provided(info.versionName) ? info.versionName : String.valueOf(info.getLongVersionCode());
            CharSequence label = pm.getApplicationLabel(pm.getApplicationInfo(home.getPackageName(), 0));
            return (label == null || label.length() == 0 ? "桌面" : label.toString()) + " · " + version;
        } catch (PackageManager.NameNotFoundException | RuntimeException ignored) {
            return "系统未提供";
        }
    }

    private static boolean provided(String text) {
        return text != null && !text.trim().isEmpty()
                && !"unknown".equalsIgnoreCase(text.trim()) && !"null".equalsIgnoreCase(text.trim());
    }

    private static String value(String text) { return provided(text) ? text.trim() : "系统未提供"; }
}
