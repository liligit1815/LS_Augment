package ls.augment.com.hook;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Process;

/** Provider attribution belongs to this process, even when a hook receives an OEM resource context. */
final class ConfigHostContext {
    static Context select(Context retained, Context candidate) {
        if (valid(retained)) return retained;
        if (candidate == null) return null;
        try {
            Context app = candidate.getApplicationContext();
            if (valid(app)) return app;
        } catch (RuntimeException ignored) { }
        return valid(candidate) ? candidate : null;
    }

    private static boolean valid(Context context) {
        if (context == null) return false;
        try {
            ApplicationInfo info = context.getApplicationInfo();
            String opPackage = context.getOpPackageName();
            // No PackageManager/Binder call in a hooked getter. Shared-UID packages
            // remain valid when the context attributes to its own package.
            return info != null && info.uid == Process.myUid() && info.packageName != null
                    && info.packageName.equals(opPackage);
        } catch (RuntimeException unavailable) { return false; }
    }

    private ConfigHostContext() { }
}
