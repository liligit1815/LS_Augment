package ls.augment.com;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.os.Process;
import android.widget.Toast;
import java.util.concurrent.ExecutorService;

/** Opens the installed OEM page. Browsing never changes either island switch. */
final class NativeIslandSettings {
    static final String PACKAGE = "com.android.systemui";
    static final String PAGE = "com.zte.feature.dynamicisland.settings.DynamicIslandSettingsActivity";
    private NativeIslandSettings() { }

    static void open(Activity activity, ExecutorService worker) {
        worker.execute(() -> {
            String mode=NativeIslandMode.detect(activity);
            if(!NativeIslandMode.known(mode)){
                activity.runOnUiThread(()->Toast.makeText(activity,"等待原厂岛能力检测，请确认系统界面作用域后重启",Toast.LENGTH_LONG).show());return;
            }
            ComponentName component = new ComponentName(PACKAGE, NativeIslandMode.page(mode));
            PackageManager pm = activity.getPackageManager();
            int previous = PackageManager.COMPONENT_ENABLED_STATE_DEFAULT;
            boolean changed = false;
            try {
                ActivityInfo info = pm.getActivityInfo(component, PackageManager.MATCH_DISABLED_COMPONENTS);
                previous = pm.getComponentEnabledSetting(component);
                boolean enabled = previous == PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                        || previous == PackageManager.COMPONENT_ENABLED_STATE_DEFAULT && info.enabled;
                if (!enabled) {
                    RootShell.Result result = RootShell.run("pm enable --user " + user() + " " + component.flattenToString(), null, 8, 4096);
                    if (!result.isSuccess()) throw new IllegalStateException("无法启用原厂设置入口，请检查Root授权");
                    changed = true;
                }
                // The OEM activity can require a system-only permission. Use the phone's
                // existing root transport, not a PC command or an exported proxy activity.
                RootShell.Result started = RootShell.run("am start -W --user " + user() + " -n "
                        + component.flattenToString(), null, 12, 8192);
                if (!started.isSuccess() || !started.output.contains("Status: ok"))
                    throw new IllegalStateException("原厂"+NativeIslandMode.name(mode)+"设置未能打开");
            } catch (Exception failure) {
                if (changed) {
                    String action = previous == PackageManager.COMPONENT_ENABLED_STATE_DEFAULT ? "default-state"
                            : previous == PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER ? "disable-user" : "disable";
                    RootShell.run("pm " + action + " --user " + user() + " " + component.flattenToString(), null, 8, 4096);
                }
                String message = failure instanceof PackageManager.NameNotFoundException
                        ? "当前系统未提供"+NativeIslandMode.name(mode)+"设置界面" : failure.getMessage();
                activity.runOnUiThread(() -> { if (!activity.isDestroyed())
                    Toast.makeText(activity, message, Toast.LENGTH_LONG).show(); });
            }
        });
    }
    private static int user() { return Process.myUid() / 100000; }
}
