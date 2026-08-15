package ls.augment.com;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.IBinder;
import android.os.PowerManager;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/** User-enabled event-driven screen-off automation. No polling is used. */
public final class ScreenAutomationService extends Service {
    private static final String CHANNEL = "ls_augment_automation";
    private static final String EXTRA_RUN_IF_SCREEN_OFF = "run_if_screen_off";
    private static final int NOTIFICATION_ID = 20001;
    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final AtomicBoolean inFlight = new AtomicBoolean();
    private boolean registered;

    private final BroadcastReceiver screenReceiver = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (Intent.ACTION_SCREEN_OFF.equals(intent.getAction())) runScreenOff();
            else record(AppConfig.AUTOMATION_LAST_EVENT,
                    "armed;event=" + intent.getAction() + ";ts=" + System.currentTimeMillis());
        }
    };

    static void sync(Context context) {
        sync(context, false);
    }

    static void sync(Context context, boolean runIfScreenOff) {
        AppConfig config = new AppConfig(context);
        Intent intent = new Intent(context, ScreenAutomationService.class)
                .putExtra(EXTRA_RUN_IF_SCREEN_OFF, runIfScreenOff);
        if (config.getBoolean(AppConfig.AUTOMATION_ENABLED)) {
            context.startForegroundService(intent);
        } else context.stopService(intent);
    }

    @Override
    public void onCreate() {
        super.onCreate();
        createChannel();
        startForeground(NOTIFICATION_ID, notification());
        IntentFilter filter = new IntentFilter();
        filter.addAction(Intent.ACTION_SCREEN_OFF);
        filter.addAction(Intent.ACTION_SCREEN_ON);
        filter.addAction(Intent.ACTION_USER_PRESENT);
        if (Build.VERSION.SDK_INT >= 33) registerReceiver(screenReceiver, filter, RECEIVER_NOT_EXPORTED);
        else registerReceiver(screenReceiver, filter);
        registered = true;
        record(AppConfig.AUTOMATION_LAST_EVENT, "service_started;ts=" + System.currentTimeMillis());
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (!new AppConfig(this).getBoolean(AppConfig.AUTOMATION_ENABLED)) {
            stopSelf();
            return START_NOT_STICKY;
        }
        if (intent != null && intent.getBooleanExtra(EXTRA_RUN_IF_SCREEN_OFF, false)) {
            PowerManager power = getSystemService(PowerManager.class);
            if (power != null && !power.isInteractive()) runScreenOff();
        }
        return START_STICKY;
    }

    private void runScreenOff() {
        if (!inFlight.compareAndSet(false, true)) return;
        executor.execute(() -> {
            try {
                AppConfig config = new AppConfig(this);
                if (!config.getBoolean(AppConfig.AUTOMATION_ENABLED)) return;
                RootHideManager manager = new RootHideManager(this);
                RootHideManager.ConflictState conflict = manager.conflictState();
                if (conflict.hasConflict()) {
                    record(AppConfig.AUTOMATION_LAST_ERROR,
                            "legacy_conflict;ts=" + System.currentTimeMillis());
                    return;
                }
                boolean currentOnly = !"all".equals(config.get(AppConfig.AUTOMATION_SCOPE));
                RootHideManager.OperationResult result = manager.hideAll(currentOnly);
                record(result.success ? AppConfig.AUTOMATION_LAST_EVENT : AppConfig.AUTOMATION_LAST_ERROR,
                        "screen_off;scope=" + (currentOnly ? "current" : "all")
                                + ";result=" + result.message + ";ts=" + System.currentTimeMillis());
                AuditLog.write(this, "AUTOMATION", result.message);
            } finally {
                inFlight.set(false);
            }
        });
    }

    private void record(String key, String value) {
        getSharedPreferences(AppConfig.DIAGNOSTICS, 0).edit().putString(key, value).apply();
    }

    private Notification notification() {
        Intent open = new Intent(this, SettingsActivity.class);
        PendingIntent pending = PendingIntent.getActivity(this, 0, open,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        Notification.Builder builder = new Notification.Builder(this, CHANNEL);
        return builder.setSmallIcon(R.drawable.ic_tile)
                .setContentTitle(getString(R.string.automation_notification))
                .setContentText("屏幕关闭时执行一次已配置隐藏动作")
                .setContentIntent(pending)
                .setOngoing(true)
                .setCategory(Notification.CATEGORY_SERVICE)
                .build();
    }

    private void createChannel() {
        NotificationManager manager = getSystemService(NotificationManager.class);
        if (manager == null) return;
        NotificationChannel channel = new NotificationChannel(CHANNEL,
                getString(R.string.automation_channel), NotificationManager.IMPORTANCE_LOW);
        channel.setDescription("仅在用户开启锁屏自动隐藏时运行");
        manager.createNotificationChannel(channel);
    }

    @Override public IBinder onBind(Intent intent) { return null; }

    @Override
    public void onDestroy() {
        if (registered) {
            try { unregisterReceiver(screenReceiver); } catch (Throwable ignored) { }
        }
        executor.shutdownNow();
        record(AppConfig.AUTOMATION_LAST_EVENT, "service_stopped;ts=" + System.currentTimeMillis());
        super.onDestroy();
    }
}
