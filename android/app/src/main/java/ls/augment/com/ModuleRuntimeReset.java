package ls.augment.com;

import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.service.notification.StatusBarNotification;

/** Explicitly retires the two obsolete module notification channels; no other application's UI is touched. */
final class ModuleRuntimeReset {
    private static final String[] CHANNELS = { "ls_augment_automation", "ls_augment_fan_control" };
    private ModuleRuntimeReset() { }
    static Result clearNotifications(Context context) {
        try {
            context.stopService(new Intent().setClassName("ls.augment.com", "ls.augment.com.ScreenAutomationService"));
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            if (manager == null) return new Result(false, 0, "无法读取模块通知状态");
            int count = 0;
            for (StatusBarNotification notification : manager.getActiveNotifications())
                if (notification.getId() == 20001 || notification.getId() == 2044) {
                    manager.cancel(notification.getTag(), notification.getId()); count++;
                }
            manager.cancel(20001); manager.cancel(2044);
            for (String channel : CHANNELS) {
                if (manager.getNotificationChannel(channel) != null) count++;
                manager.deleteNotificationChannel(channel);
                if (manager.getNotificationChannel(channel) != null)
                    return new Result(false, count, "旧模块通知渠道清理未确认");
            }
            for (StatusBarNotification notification : manager.getActiveNotifications())
                if (notification.getId() == 20001 || notification.getId() == 2044)
                    return new Result(false, count, "旧模块通知仍在运行");
            return new Result(true, count, "旧模块通知已清理");
        } catch (RuntimeException denied) { return new Result(false, 0, "旧模块服务或通知无法安全清理"); }
    }
    static final class Result {
        final boolean success; final int count; final String message;
        Result(boolean success, int count, String message) { this.success = success; this.count = count; this.message = message; }
    }
}
