package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test-APK-only acceptance of the real workbench and two installed applications. */
final class AtomicWorkbenchInteractionDeviceCases {
    private static final String DOUYIN = "com.ss.android.ugc.aweme", WECHAT = "com.tencent.mm";
    private final Instrumentation test;
    private final Context context;
    private final File directory;
    private final JSONArray screens = new JSONArray();
    private Activity activity;
    private String step = "launch_workbench";

    private AtomicWorkbenchInteractionDeviceCases(Instrumentation test) {
        this.test = test;
        context = test.getTargetContext();
        directory = new File(context.getExternalFilesDir(null), "atomic-workbench-interaction");
    }

    static JSONObject run(Instrumentation test, Bundle arguments) throws Exception {
        return new AtomicWorkbenchInteractionDeviceCases(test).execute(arguments);
    }

    private JSONObject execute(Bundle arguments) throws Exception {
        String requested = arguments.getString("stage", "home");
        require("setup-only".equals(requested) || "home".equals(requested), "Unknown stage: " + requested);
        JSONObject result = new JSONObject().put("scope", "REAL_PHONE_WORKBENCH_TWO_APP_INTERACTION")
                .put("requestedStage", requested).put("messagesSent", false)
                .put("recipientSelection", "NOT_EXERCISED").put("dragAndSwipe", "MANUAL_ACCEPTANCE_REQUIRED")
                .put("device", android.os.Build.MODEL).put("screens", screens);
        try {
            require(new AppConfig(context).getBoolean(AtomicWorkbenchConfig.ENABLED), "Enable workbench before this test");
            require(directory.isDirectory() || directory.mkdirs(), "Cannot create screenshot directory");
            activity = test.startActivitySync(new Intent(context, AtomicWorkbenchActivity.class)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE, "atomic_workbench")
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            await(() -> main(() -> field("client") != null && !(Boolean) field("busy")
                    && (Boolean) invoke("mainReady", new Class<?>[0])
                    && (Boolean) get(((Object[]) field("slots"))[model().mainWindowId()], "nativeHome")),
                    "Initial HOME/client ready", 15_000L);
            AtomicWorkbenchAppRepository.App douyin = awaitApp(DOUYIN);
            AtomicWorkbenchAppRepository.App wechat = awaitApp(WECHAT);
            step = "open_douyin";
            launch(douyin);
            awaitMainPackage(DOUYIN);
            Bundle douyinState = windowForPackage(status(), DOUYIN);
            require(douyinState != null, "Douyin did not enter a real window");
            int douyinWindow = douyinState.getInt("window_id", -1);
            int douyinDisplay = douyinState.getInt("display_id", -1), douyinTask = douyinState.getInt("task_id", -1);

            step = "open_wechat";
            launch(wechat);
            awaitMainPackage(WECHAT);
            Bundle twoApps = status();
            Bundle wechatState = windowForPackage(twoApps, WECHAT);
            Bundle retainedDouyin = window(twoApps, douyinWindow);
            require(wechatState != null && retainedDouyin != null, "Both application windows must remain present");
            require(douyinDisplay > 0 && douyinTask > 0 && retainedDouyin.getInt("display_id", -1) == douyinDisplay
                    && retainedDouyin.getInt("task_id", -1) == douyinTask, "Opening WeChat moved or replaced Douyin");
            require(wechatState.getInt("display_id", -1) > 0 && wechatState.getInt("display_id", -1) != douyinDisplay
                    && wechatState.getInt("task_id", -1) > 0 && wechatState.getInt("task_id", -1) != douyinTask,
                    "Two applications share a task or display");
            result.put("twoApps", snapshot(twoApps));
            capture("01-two-apps");
            result.put("twoAppsHaveIndependentTasksAndDisplays", true);
            if ("setup-only".equals(requested)) {
                result.put("success", true).put("stage", "setup_ready")
                        .put("keptForManualInspection", true).put("homeButton", "NOT_EXERCISED");
                long holdMs = Math.max(0L, Math.min(300_000L, Long.parseLong(arguments.getString("holdMs", "0"))));
                if (holdMs > 0L) {
                    result.put("holding", true).put("holdMs", holdMs)
                            .put("holdingMessage", "Setup is ready; instrumentation is holding for manual swipe and drag acceptance.");
                    File report = new File(directory, "setup-ready.json");
                    try (FileOutputStream output = new FileOutputStream(report)) {
                        output.write(result.toString(2).getBytes(StandardCharsets.UTF_8));
                    }
                    Bundle progress = new Bundle();
                    progress.putString("atomicWorkbenchInteraction", result.toString());
                    progress.putString("stream", "Setup ready; holding " + holdMs + " ms for manual swipe and drag acceptance.\n");
                    test.sendStatus(1, progress);
                    long deadline = SystemClock.uptimeMillis() + holdMs;
                    while (SystemClock.uptimeMillis() < deadline && !main(() -> activity.isFinishing() || activity.isDestroyed()))
                        SystemClock.sleep(100L);
                    result.put("holding", false).put("holdFinished", true);
                }
                return result;
            }

            step = "click_home_button";
            int mainBefore = main(() -> model().mainWindowId());
            main(() -> {
                View button = activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-home");
                require(button != null && button.isShown() && button.isEnabled(), "HOME button is not actionable");
                require(button.performClick(), "HOME button did not accept click");
                return null;
            });
            String homePackage = context.getPackageManager().resolveActivity(new Intent(Intent.ACTION_MAIN)
                    .addCategory(Intent.CATEGORY_HOME), android.content.pm.PackageManager.MATCH_DEFAULT_ONLY)
                    .activityInfo.packageName;
            await(() -> {
                Bundle state = window(status(), mainBefore);
                return state != null && state.getBoolean("native_home", false)
                        && packageOf(state.getString("top_component", "")).equals(homePackage)
                        && main(() -> !(Boolean) field("busy") && model().mainWindowId() == mainBefore);
            }, "HOME becomes the current main foreground", 15_000L);
            Bundle afterHome = status();
            Bundle sideAfter = window(afterHome, douyinWindow);
            require(sideAfter != null && sideAfter.getInt("display_id", -1) == douyinDisplay
                    && sideAfter.getInt("task_id", -1) == douyinTask
                    && DOUYIN.equals(packageOf(sideAfter.getString("top_component", ""))),
                    "Main HOME click changed the side application's task/display");
            require(afterHome.getInt("focused_window_id", -1) == mainBefore, "Input focus does not belong to main HOME");
            result.put("afterHome", snapshot(afterHome)).put("homeButton", "FOREGROUND_HOME_CONFIRMED")
                    .put("sideTaskAndDisplayUnchanged", true).put("mainInputFocusConfirmed", true);
            capture("02-home-main");
            return result.put("success", true).put("stage", "home_ready").put("keptForManualInspection", true);
        } catch (Exception | AssertionError failure) {
            result.put("success", false).put("stage", step)
                    .put("failure", failure.getClass().getSimpleName() + ": " + failure.getMessage());
            if (activity != null) {
                try { result.put("failureState", snapshot(status())); } catch (Exception ignored) { }
                try { capture("99-failure"); } catch (Exception ignored) { }
            }
            return result;
        }
    }

    private AtomicWorkbenchAppRepository.App awaitApp(String packageName) throws Exception {
        AtomicReference<AtomicWorkbenchAppRepository.App> found = new AtomicReference<>();
        await(() -> main(() -> {
            for (Object item : (ArrayList<?>) field("apps")) {
                AtomicWorkbenchAppRepository.App app = (AtomicWorkbenchAppRepository.App) item;
                if (packageName.equals(app.component.getPackageName())) { found.set(app); return true; }
            }
            return false;
        }), "Installed app entry: " + packageName, 15_000L);
        return found.get();
    }

    private void launch(AtomicWorkbenchAppRepository.App app) throws Exception {
        await(() -> main(() -> (Boolean) invoke("canInteract", new Class<?>[0])), "Workspace accepts launch", 15_000L);
        main(() -> { invoke("launchApp", new Class<?>[]{AtomicWorkbenchAppRepository.App.class, int.class}, app, -1); return null; });
    }

    private void awaitMainPackage(String expected) throws Exception {
        await(() -> {
            int id = main(() -> model().mainWindowId());
            Bundle state = window(status(), id);
            return state != null && state.getInt("display_id", -1) > 0 && state.getInt("task_id", -1) > 0
                    && expected.equals(packageOf(state.getString("top_component", "")))
                    && main(() -> !(Boolean) field("busy") && (Boolean) invoke("mainReady", new Class<?>[0]));
        }, "Main foreground package: " + expected, 15_000L);
    }

    private Bundle status() throws Exception {
        AtomicWorkbenchClient client = main(() -> (AtomicWorkbenchClient) field("client"));
        require(client != null, "Workbench client disconnected");
        return client.status();
    }

    private JSONObject snapshot(Bundle status) throws Exception {
        JSONObject result = new JSONObject().put("mainWindow", main(() -> model().mainWindowId()))
                .put("focusedWindow", status.getInt("focused_window_id", -1))
                .put("density", context.getResources().getDisplayMetrics().density)
                .put("fontScale", context.getResources().getConfiguration().fontScale);
        JSONArray windows = new JSONArray();
        ArrayList<Bundle> values = status.getParcelableArrayList("windows", Bundle.class);
        if (values != null) for (Bundle state : values) {
            int id = state.getInt("window_id", -1);
            JSONObject item = new JSONObject().put("window", id).put("display", state.getInt("display_id", -1))
                    .put("task", state.getInt("task_id", -1)).put("homeTask", state.getInt("home_task_id", -1))
                    .put("nativeHome", state.getBoolean("native_home", false))
                    .put("topComponent", state.getString("top_component", ""));
            if (id >= 0 && id < AtomicWorkbenchProtocol.WINDOW_COUNT) main(() -> {
                Object slot = ((Object[]) field("slots"))[id];
                View surface = (View) get(slot, "surface"); Rect bounds = new Rect();
                boolean visible = surface.getGlobalVisibleRect(bounds);
                item.put("visible", visible).put("bounds", bounds.flattenToString())
                        .put("receivedFrames", ((AtomicWorkbenchSurface) surface).frameCount());
                return null;
            });
            windows.put(item);
        }
        return result.put("windows", windows);
    }

    private void capture(String name) throws Exception {
        SystemClock.sleep(350L);
        Bitmap image = test.getUiAutomation().takeScreenshot();
        require(image != null, "Screenshot capture failed");
        File file = new File(directory, name + ".png");
        try (FileOutputStream output = new FileOutputStream(file)) {
            require(image.compress(Bitmap.CompressFormat.PNG, 100, output), "Screenshot encoding failed");
        } finally { image.recycle(); }
        screens.put(file.getAbsolutePath());
    }

    private AtomicWorkbenchWorkspaceModel model() throws Exception { return (AtomicWorkbenchWorkspaceModel) field("model"); }
    private Object field(String name) throws Exception { return get(activity, name); }
    private static Object get(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(owner);
    }
    private Object invoke(String name, Class<?>[] parameters, Object... values) throws Exception {
        Method method = activity.getClass().getDeclaredMethod(name, parameters); method.setAccessible(true);
        return method.invoke(activity, values);
    }
    private static Bundle window(Bundle status, int id) {
        ArrayList<Bundle> values = status.getParcelableArrayList("windows", Bundle.class);
        if (values != null) for (Bundle state : values) if (state.getInt("window_id", -1) == id) return state;
        return null;
    }
    private static Bundle windowForPackage(Bundle status, String pkg) {
        ArrayList<Bundle> values = status.getParcelableArrayList("windows", Bundle.class);
        if (values != null) for (Bundle state : values)
            if (pkg.equals(packageOf(state.getString("top_component", "")))) return state;
        return null;
    }
    private static String packageOf(String component) {
        int separator = component.indexOf('/'); return separator < 0 ? "" : component.substring(0, separator);
    }
    private void await(Check check, String message, long timeout) throws Exception {
        long deadline = SystemClock.uptimeMillis() + timeout;
        do { if (check.run()) return; SystemClock.sleep(150L); } while (SystemClock.uptimeMillis() < deadline);
        throw new AssertionError(message + " (timeout " + timeout + " ms)");
    }
    private <T> T main(Work<T> work) throws Exception {
        AtomicReference<T> result = new AtomicReference<>(); AtomicReference<Throwable> error = new AtomicReference<>();
        test.runOnMainSync(() -> { try { result.set(work.run()); } catch (Throwable failure) { error.set(failure); } });
        if (error.get() != null) {
            if (error.get() instanceof Exception) throw (Exception) error.get();
            if (error.get() instanceof AssertionError) throw (AssertionError) error.get();
            throw new RuntimeException(error.get());
        }
        return result.get();
    }
    private static void require(boolean passed, String message) { if (!passed) throw new AssertionError(message); }
    private interface Check { boolean run() throws Exception; }
    private interface Work<T> { T run() throws Exception; }
}
