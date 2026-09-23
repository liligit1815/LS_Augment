package ls.augment.com;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

/** Establishes same-user Provider visibility for the already authorized hook packages. */
final class ConfigVisibilityGrant {
    static void refresh(Context context) {
        Context app = context.getApplicationContext();
        Thread worker = new Thread(() -> {
            Uri config = Uri.parse("content://ls.augment.com.config/config");
            for (String target : HookTargetRegistry.packages()) {
                if ("system".equals(target)) continue;
                try {
                    // The Provider is already exported; Android records the interaction
                    // so scoped callers without QUERY_ALL_PACKAGES can discover it.
                    // Provider caller checks still authorize every actual operation.
                    app.grantUriPermission(target, config, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                } catch (RuntimeException unavailable) {
                    // An optional target may not be installed for this Android user.
                    if (BuildConfig.DEBUG) android.util.Log.d("LS_Augment",
                            "CONFIG_VISIBILITY target unavailable: " + target);
                }
            }
        }, "LSA-ConfigVisibility");
        worker.setDaemon(true);
        worker.start();
    }
    private ConfigVisibilityGrant() { }
}
