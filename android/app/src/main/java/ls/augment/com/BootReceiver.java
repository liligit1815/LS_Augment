package ls.augment.com;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/** Dispatch only: JobScheduler owns the lifetime of post-unlock recovery work. */
public final class BootReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent == null ? "" : intent.getAction();
        if (Intent.ACTION_BOOT_COMPLETED.equals(action)) BootJobService.schedule(context, false);
        else if (Intent.ACTION_MY_PACKAGE_REPLACED.equals(action)) BootJobService.schedule(context, true);
    }
}
