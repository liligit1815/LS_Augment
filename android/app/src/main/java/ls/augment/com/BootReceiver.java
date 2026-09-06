package ls.augment.com;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/** Removes obsolete service state and signals the system-owned event listener. */
public final class BootReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent == null ? "" : intent.getAction();
        if (Intent.ACTION_BOOT_COMPLETED.equals(action)
                || Intent.ACTION_LOCKED_BOOT_COMPLETED.equals(action)
                || Intent.ACTION_MY_PACKAGE_REPLACED.equals(action)) {
            ScreenAutomation.sync(context);
            PendingResult pending = goAsync();
            BatteryLifeControl.schedule(context, pending::finish);
        }
    }
}
