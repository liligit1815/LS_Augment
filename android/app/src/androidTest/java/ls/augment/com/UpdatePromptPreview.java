package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Instrumentation;
import android.content.Intent;
import android.os.SystemClock;
import org.json.JSONObject;

/** Exercises the production prompt renderer without publishing a feed or starting a download. */
final class UpdatePromptPreview {
    @SuppressWarnings({"unchecked", "rawtypes"})
    static JSONObject run(Instrumentation test, String manifest, int seconds) throws Exception {
        Activity activity = test.startActivitySync(new Intent(test.getTargetContext(), SettingsActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        AppUpdater updater = new AppUpdater(activity);
        AppUpdateManifest release = AppUpdateManifest.parse(manifest);
        test.runOnMainSync(() -> {
            try {
                updater.attach(activity);
                java.lang.reflect.Field foreground = AppUpdater.class.getDeclaredField("foreground");
                foreground.setAccessible(true); foreground.set(updater, true);
                java.lang.reflect.Field data = AppUpdater.class.getDeclaredField("release");
                data.setAccessible(true); data.set(updater, release);
                java.lang.reflect.Field state = AppUpdater.class.getDeclaredField("state");
                state.setAccessible(true); state.set(updater, Enum.valueOf((Class)state.getType(), "AVAILABLE"));
                java.lang.reflect.Method render = AppUpdater.class.getDeclaredMethod("render");
                render.setAccessible(true); render.invoke(updater);
                java.lang.reflect.Field dialog = AppUpdater.class.getDeclaredField("dialog");
                dialog.setAccessible(true); AlertDialog shown = (AlertDialog)dialog.get(updater);
                shown.setTitle("发现新版本 · 界面预览");
                for (int button : new int[]{-1, -2, -3}) shown.getButton(button).setOnClickListener(v ->
                        android.widget.Toast.makeText(activity, "当前为界面预览，未下载或修改提醒设置。", 0).show());
                shown.setOnCancelListener(d -> {});
            } catch (ReflectiveOperationException error) { throw new IllegalStateException(error); }
        });
        SystemClock.sleep(Math.max(1, Math.min(seconds, 300)) * 1000L);
        test.runOnMainSync(() -> updater.pause(activity));
        return new JSONObject().put("renderer", "AppUpdater.AVAILABLE").put("preview", true);
    }
}
