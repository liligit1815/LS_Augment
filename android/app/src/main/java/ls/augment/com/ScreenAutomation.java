package ls.augment.com;

import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

/** App-side migration and configuration signal. Screen events belong to system_server. */
final class ScreenAutomation {
    private ScreenAutomation() { }

    static void sync(Context context) {
        removeLegacyNotification(context);
        context.getContentResolver().notifyChange(
                Uri.parse("content://ls.augment.com.config/config"), null);
    }

    static void removeLegacyNotification(Context context) {
        try {
            context.stopService(new Intent().setClassName(
                    context.getPackageName(), "ls.augment.com.ScreenAutomationService"));
        } catch (RuntimeException ignored) {
            // An upgrade may already have removed the obsolete service component.
        }
        try {
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            if (manager != null) {
                manager.cancel(20001);
                manager.deleteNotificationChannel("ls_augment_automation");
            }
        } catch (RuntimeException ignored) {
            // Notification cleanup must also be attempted when stopService failed.
        }
    }
}
