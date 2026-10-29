package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.View;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Exercises real enable authorization, first-use persistence, recreation and animation ownership. */
final class AtomicWorkbenchGestureGuideDeviceCases {
    private final Instrumentation test;
    private final Context context;
    private final AppConfig config;
    private final UiAutomation automation;
    private final JSONArray screens = new JSONArray();
    private Activity activity;
    private File directory;
    private int checks;

    private AtomicWorkbenchGestureGuideDeviceCases(Instrumentation test) {
        this.test = test; context = test.getTargetContext(); config = new AppConfig(context);
        automation = test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
    }
    static JSONObject run(Instrumentation test) throws Exception {
        return new AtomicWorkbenchGestureGuideDeviceCases(test).execute();
    }
    private JSONObject execute() throws Exception {
        String enabled = config.get(AtomicWorkbenchConfig.ENABLED);
        SharedPreferences prefs = context.getSharedPreferences(AtomicWorkbenchGestureGuide.PREFS, 0);
        boolean hadSeen = prefs.contains(AtomicWorkbenchGestureGuide.SEEN);
        boolean seen = prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN, false);
        directory = new File(context.getExternalFilesDir(null), "step-guide-" + BuildConfig.VERSION_CODE
                + "-font-" + context.getResources().getConfiguration().fontScale);
        require(directory.isDirectory() || directory.mkdirs(), "Screenshot directory");
        JSONObject result = new JSONObject().put("screens", screens);
        try {
            String issue = AtomicWorkbenchConfig.readinessProblem(config.diagnostic(AtomicWorkbenchConfig.READY),
                    BuildConfig.VERSION_CODE, RuntimeEnvironment.bootCount(context), 0, SystemClock.elapsedRealtime());
            require(issue.isEmpty(), "Current system hook required: " + issue);
            require(!AtomicWorkbenchCleanup.pending(), "Prior cleanup must finish");
            save("0"); prefs.edit().remove(AtomicWorkbenchGestureGuide.SEEN).commit();
            open();
            require(main(() -> guide() == null), "Disabled page must not teach an enabled gesture");
            float gap = main(() -> (bounds(tag("section-title:全局手势")).top - bounds(tag("page-path")).bottom)
                    / activity.getResources().getDisplayMetrics().density);
            require(gap >= 7.5f && gap <= 12.5f, "Navigation gap " + gap);
            capture("01-before-enable");
            main(() -> { tag("config:" + AtomicWorkbenchConfig.ENABLED).performClick(); return null; });
            await(() -> config.getBoolean(AtomicWorkbenchConfig.ENABLED) && main(() -> guide() != null && guide().isShowing()),
                    "First authorized enable shows guide");
            AtomicWorkbenchGestureGuide.Demonstration oldAnimation = main(this::animation);
            await(() -> main(() -> field(oldAnimation, "animator") != null), "Animation starts with visible dialog");
            float phase = main(() -> (Float) field(oldAnimation, "phase"));
            SystemClock.sleep(350);
            require(main(() -> (Float) field(oldAnimation, "phase")) != phase, "Animation actually advances");
            capture("02-right-gesture");
            await(() -> main(() -> ((TextView) guide().getWindow().getDecorView()
                    .findViewWithTag("step-gesture-guide-caption")).getText().toString().startsWith("左")), "Left demonstration follows right");
            capture("03-left-gesture");
            require(!prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN, false), "Showing is not acknowledgment");
            Object session = main(() -> field(activity, "session"));
            Activity old = activity;
            main(() -> { old.recreate(); return null; });
            await(() -> main(() -> {
                Object owner = ((WeakReference<?>) field(session, "owner")).get();
                return owner instanceof Activity && owner != old;
            }), "Recreated owner attached");
            activity = main(() -> (Activity) ((WeakReference<?>) field(session, "owner")).get());
            await(() -> main(() -> guide() != null && guide().isShowing()), "Unacknowledged guide survives recreation");
            require(main(() -> field(oldAnimation, "animator") == null), "Detached animation stopped");
            main(() -> { guide().cancel(); return null; });
            SystemClock.sleep(600);
            require(main(() -> guide() == null), "Cancel stays dismissed during same visit");
            require(!prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN, false), "Cancel does not mark seen");
            close(); open();
            await(() -> main(() -> guide() != null), "Unacknowledged guide is offered next visit");
            main(() -> { guide().getButton(AlertDialog.BUTTON_POSITIVE).performClick(); return null; });
            // AlertDialog dispatches the button callback through its Handler after performClick returns.
            await(() -> prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN, false) && main(() -> guide() == null),
                    "Acknowledgment persists");
            close(); open();
            require(main(() -> guide() == null), "Acknowledged guide does not repeat on entry");
            main(() -> { tag("config:" + AtomicWorkbenchConfig.ENABLED).performClick(); return null; });
            await(() -> !config.getBoolean(AtomicWorkbenchConfig.ENABLED), "Disable completes");
            await(() -> main(() -> !((Boolean) field(field(activity, "session"), "busy"))), "Disable request settles");
            main(() -> { tag("config:" + AtomicWorkbenchConfig.ENABLED).performClick(); return null; });
            await(() -> config.getBoolean(AtomicWorkbenchConfig.ENABLED), "Reenable completes");
            require(main(() -> guide() == null), "Reenable does not repeat acknowledged guide");
            // Find the existing fold instead of depending on a scroll position or visible text.
            main(() -> { ((UiKit.Fold) field(activity, "fold")).show(true); return null; });
            main(() -> { tag("step-gesture-guide-replay").performClick(); return null; });
            await(() -> main(() -> guide() != null), "Manual replay available");
            capture("04-replay");
            Rect button = main(() -> bounds(guide().getButton(AlertDialog.BUTTON_POSITIVE)));
            Rect window = main(() -> bounds(guide().getWindow().getDecorView()));
            require(window.contains(button) && button.height() > 0, "Acknowledgment button remains inside dialog");
            result.put("contentGapDp", gap).put("checks", checks).put("success", true);
        } finally {
            try { close(); }
            finally {
                save(enabled);
                SharedPreferences.Editor edit = prefs.edit();
                if (hadSeen) edit.putBoolean(AtomicWorkbenchGestureGuide.SEEN, seen); else edit.remove(AtomicWorkbenchGestureGuide.SEEN);
                require(edit.commit(), "Guide preference restored");
                result.put("settingsRestored", enabled.equals(config.get(AtomicWorkbenchConfig.ENABLED)))
                        .put("guideStateRestored", prefs.contains(AtomicWorkbenchGestureGuide.SEEN) == hadSeen
                                && prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN, false) == seen);
            }
        }
        return result;
    }
    private AlertDialog guide() throws Exception { return (AlertDialog) field(activity, "gestureGuide"); }
    private AtomicWorkbenchGestureGuide.Demonstration animation() throws Exception {
        return (AtomicWorkbenchGestureGuide.Demonstration) guide().getWindow().getDecorView()
                .findViewWithTag("step-gesture-guide-animation");
    }
    private void open() {
        activity = test.startActivitySync(new Intent(context, AtomicWorkbenchSettingsActivity.class)
                .putExtra(ModuleNavigation.EXTRA_ROUTE, "atomic_workbench").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        test.runOnMainSync(() -> activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON));
        test.waitForIdleSync(); SystemClock.sleep(300);
    }
    private void close() throws Exception {
        if (activity != null) { main(() -> { activity.finish(); return null; }); test.waitForIdleSync(); activity = null; }
    }
    private View tag(String tag) { return activity.getWindow().getDecorView().findViewWithTag(tag); }
    private void save(String value) { require(config.save(Map.of(AtomicWorkbenchConfig.ENABLED, value)).success, "Save enabled state"); }
    private void capture(String name) throws Exception {
        Bitmap bitmap = automation.takeScreenshot(); require(bitmap != null, "Screenshot available");
        File file = new File(directory, name + ".png");
        try (FileOutputStream output = new FileOutputStream(file)) { bitmap.compress(Bitmap.CompressFormat.PNG, 100, output); }
        finally { bitmap.recycle(); }
        screens.put(file.getAbsolutePath());
    }
    private static Object field(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(owner);
    }
    private static Rect bounds(View view) { int[] point = new int[2]; view.getLocationOnScreen(point);
        return new Rect(point[0], point[1], point[0] + view.getWidth(), point[1] + view.getHeight()); }
    private interface Work<T> { T run() throws Exception; }
    private <T> T main(Work<T> work) throws Exception {
        AtomicReference<T> value = new AtomicReference<>(); AtomicReference<Throwable> error = new AtomicReference<>();
        test.runOnMainSync(() -> { try { value.set(work.run()); } catch (Throwable failure) { error.set(failure); } });
        if (error.get() != null) throw new AssertionError(error.get()); return value.get();
    }
    private interface Check { boolean get() throws Exception; }
    private void await(Check check, String message) throws Exception {
        long deadline = SystemClock.uptimeMillis() + 15000;
        while (!check.get() && SystemClock.uptimeMillis() < deadline) SystemClock.sleep(100);
        require(check.get(), message);
    }
    private void require(boolean value, String message) { checks++; if (!value) throw new AssertionError(message); }
}
