package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Process;
import java.util.Arrays;

/** Process-lifetime endpoint only. No persisted claim that a display host is still alive. */
final class NativeIslandCardEndpoint {
    private static volatile IBinder host;
    static synchronized Bundle call(Context context, String arg, Bundle input, int uid, String caller, String[] packages) {
        Bundle result = new Bundle();
        if (arg != null || input == null || uid / 100000 != Process.myUid() / 100000
                || caller == null || packages == null || !Arrays.asList(packages).contains(caller)) return result;
        try {
            if (context.getPackageManager().getApplicationInfo(caller, 0).uid != uid) return result;
            String operation = input.getString("op", "");
            if ("register".equals(operation) && input.size() == 2 && "com.android.systemui".equals(caller)) {
                IBinder next = input.getBinder("host");
                if (next != null && next.isBinderAlive()) { host = next; result.putBoolean("ok", true); }
            } else if ("release".equals(operation) && input.size() == 2 && "com.android.systemui".equals(caller)) {
                IBinder expected = input.getBinder("host");
                if (expected != null && expected.equals(host)) host = null;
            } else if ("get".equals(operation) && input.size() == 1
                    && ("zte.com.cn.alarmclock".equals(caller) || "cn.zte.recorder".equals(caller)
                        || "com.zte.nebulatranslation".equals(caller) || "com.zte.cn.zteshare".equals(caller)
                        || "com.zte.multscr".equals(caller) || "com.android.dialer".equals(caller)
                        || "com.zte.personalagent".equals(caller))) {
                IBinder current = host;
                if (current != null && current.isBinderAlive()) result.putBinder("host", current);
            }
        } catch (RuntimeException | android.content.pm.PackageManager.NameNotFoundException unavailable) {
            result.clear();
        }
        return result;
    }
    private NativeIslandCardEndpoint() { }
}
