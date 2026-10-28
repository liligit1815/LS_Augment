package ls.augment.com.hook;

import android.content.Context;
import android.content.res.Configuration;
import ls.augment.com.NotificationAppearanceOptions;
import ls.augment.com.SystemUiOptions;

/** Shared configuration semantics for native grouping and card projection. */
final class NotificationStackGate {
    private NotificationStackGate() { }

    static boolean enabled(Context context, boolean keyguard) {
        return context != null && FeatureSettings.enabled(context, SystemUiOptions.NOTIFICATION_STACK)
                && FeatureSettings.enabled(context, keyguard ? NotificationAppearanceOptions.STACK_LOCK
                    : NotificationAppearanceOptions.STACK_SHADE, true)
                && (context.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE
                    || FeatureSettings.enabled(context, NotificationAppearanceOptions.STACK_LANDSCAPE));
    }
}
