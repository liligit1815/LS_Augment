package ls.augment.com;

import android.os.Bundle;
import android.os.SystemClock;

/** Runs in the module process, using the module's existing Root authorization. */
final class PowerModeControl {
    private static boolean busy;
    private static long lastAccepted = -10000;
    static Bundle reboot(String reason) {
        Bundle result = new Bundle();
        String command = PowerModePolicy.command(reason);
        if (command == null) return result;
        synchronized (PowerModeControl.class) {
            if (busy || SystemClock.elapsedRealtime() - lastAccepted < 5000) {
                result.putString("message", "重启请求正在处理，请稍候");
                return result;
            }
            busy = true;
        }
        try {
            RootShell.Result operation = RootShell.run(command, null, 8, 4096);
            boolean ok = operation.exitCode == 0 && !operation.timedOut;
            result.putBoolean("ok", ok);
            result.putString("message", ok ? "已提交重启请求"
                    : operation.timedOut ? "Root 请求超时，请检查红魔Duo的 Root 授权"
                    : "Root 重启失败，请检查红魔Duo的 Root 授权（退出码 " + operation.exitCode + "）");
            if (ok) synchronized (PowerModeControl.class) { lastAccepted = SystemClock.elapsedRealtime(); }
            return result;
        } finally {
            synchronized (PowerModeControl.class) { busy = false; }
        }
    }
}
