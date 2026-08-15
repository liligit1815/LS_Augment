package ls.augment.com;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/** Restarts only the explicitly enabled foreground automation after normal boot/update. */
public final class BootReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent == null ? "" : intent.getAction();
        if (Intent.ACTION_BOOT_COMPLETED.equals(action)
                || Intent.ACTION_LOCKED_BOOT_COMPLETED.equals(action)
                || Intent.ACTION_MY_PACKAGE_REPLACED.equals(action)) {
            ScreenAutomationService.sync(context, true);
        }
    }
}
