package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Handler;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Switch;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;
import org.json.JSONArray;
import org.json.JSONObject;

/** Actual routes and public folds; preview switch callbacks never leave a pending save. */
final class RealtimeActivitiesUiCases {
    private static final String PREFIX = SystemUiOptions.PREFIX + "island_";
    private final Instrumentation test;
    private final Context context;
    private final JSONArray pages = new JSONArray(), screenshots = new JSONArray();
    private Activity page;
    private File directory;
    private Map<String, String> initialDraft;
    private int checks;

    private RealtimeActivitiesUiCases(Instrumentation test) { this.test = test; context = test.getTargetContext(); }
    static JSONObject run(Instrumentation test) throws Exception { return new RealtimeActivitiesUiCases(test).execute(); }

    private JSONObject execute() throws Exception {
        AppConfig config = new AppConfig(context);
        Map<String, String> before = new LinkedHashMap<>(config.snapshot());
        Map<String, ?> preferences = new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS, 0).getAll());
        Map<String, ?> memory = new LinkedHashMap<>(context.getSharedPreferences("native_value_overrides", 0).getAll());
        String scale = String.valueOf(context.getResources().getConfiguration().fontScale).replace('.', '_');
        directory = new File(context.getExternalFilesDir(null), "realtime-activities-ui-" + BuildConfig.VERSION_CODE + "-font-" + scale);
        require(directory.isDirectory() || directory.mkdirs(), "Evidence directory exists");
        Throwable failure = null;
        try {
            open("island");
            JSONObject island = measure("island", SystemUiOptions.ISLAND, before);
            pages.put(island);
            inspectParameters(before);
            capture("01-island-initial");
            previewToggle(SystemUiOptions.ISLAND, false);
            onMain(() -> {
                View content = islandContent(); ImageButton arrow = islandArrow();
                require(content.getVisibility() == View.GONE && !arrow.isEnabled(), "Disabled island collapses parameters and disables disclosure");
                foldSetter().accept(true);
                require(content.getVisibility() == View.GONE, "Disabled island cannot expand through the public fold setter");
                return null;
            });
            capture("02-island-disabled");
            previewToggle(SystemUiOptions.ISLAND, true);
            onMain(() -> {
                require(islandContent().getVisibility() == View.VISIBLE, "Enabling island expands its parameters");
                require(islandArrow().performClick(), "Public island disclosure handles collapse");
                require(toggle(SystemUiOptions.ISLAND).isChecked() && islandContent().getVisibility() == View.GONE,
                        "Collapsing parameters leaves the island switch enabled");
                require(islandArrow().performClick() && islandContent().getVisibility() == View.VISIBLE,
                        "Public island disclosure reopens parameters without navigation");
                return null;
            });
            capture("03-island-expanded-top");
            onMain(() -> {
                ScrollView scroll = (ScrollView) tag("detail-scroll");
                require(scroll != null && scroll.getChildCount() == 1, "Island uses public detail scrolling");
                scroll.scrollTo(0, scroll.getChildAt(0).getHeight());
                return null;
            });
            settle();
            onMain(() -> {
                View last = controls().get(PREFIX + "notice_seconds"); Rect visible = new Rect();
                require(last != null && last.getGlobalVisibleRect(visible) && visible.height() >= last.getHeight() - 1,
                        "Last island parameter is fully reachable at current font size");
                island.put("lastParameterFullyVisible", true);
                return null;
            });
            capture("04-island-expanded-bottom");
            unchanged(config, before, preferences, memory);
            close();

            open("notification_center");
            JSONObject notification = measure("notification_center", SystemUiOptions.NOTIFICATION_MEDIA_HIDE, before);
            pages.put(notification);
            onMain(() -> {
                ViewGroup feature = (ViewGroup) tag("native-feature:systemui:notification_media_hide");
                require(feature != null && feature.getChildCount() == 1, "Media-card switch has no artificial parameter page");
                require(controls().isEmpty(), "Notification media-card feature needs no unused parameters");
                return null;
            });
            capture("05-notification-initial");
            previewToggle(SystemUiOptions.NOTIFICATION_MEDIA_HIDE, true); capture("06-notification-enabled");
            previewToggle(SystemUiOptions.NOTIFICATION_MEDIA_HIDE, false); capture("07-notification-disabled");
            unchanged(config, before, preferences, memory);
        } catch (Throwable error) {
            failure = error;
            try { if (page != null) capture("failure"); } catch (Throwable captureError) { error.addSuppressed(captureError); }
        } finally {
            try { close(); } catch (Throwable cleanup) { if (failure == null) failure = cleanup; else failure.addSuppressed(cleanup); }
            try { unchanged(config, before, preferences, memory); }
            catch (Throwable cleanup) { if (failure == null) failure = cleanup; else failure.addSuppressed(cleanup); }
        }
        JSONObject report = new JSONObject().put("success", failure == null).put("version", BuildConfig.VERSION_NAME)
                .put("checks", checks).put("pages", pages).put("screenshots", screenshots)
                .put("configurationUnchanged", before.equals(config.snapshot())).put("runtimeFeatureStateChanged", false)
                .put("fontScale", context.getResources().getConfiguration().fontScale);
        if (failure != null) report.put("failure", android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory, "report.json").toPath(), report.toString(2).getBytes(StandardCharsets.UTF_8));
        if (failure != null) throw new AssertionError("Realtime activities UI regression failed", failure);
        return report;
    }

    private void open(String section) throws Exception {
        page = test.startActivitySync(new Intent(context, EnhancementSettingsActivity.class)
                .putExtra("target", "systemui").putExtra(ModuleNavigation.EXTRA_ROUTE, "group/systemui/" + section)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        onMain(() -> { page.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON); return null; });
        settle();
        initialDraft = onMain(() -> new LinkedHashMap<>(map("draft")));
        require(onMain(() -> map("pending").isEmpty()), "Opening the route schedules no configuration save");
    }

    private JSONObject measure(String section, String key, Map<String, String> before) throws Exception {
        return onMain(() -> {
            String route = "group/systemui/" + section;
            require(page instanceof EnhancementSettingsActivity && route.equals(ModuleNavigation.route(page)), "Real application route resolves: " + route);
            View path = tag("page-path"), card = tag("application-category:systemui:" + section);
            require(path != null && card != null, "Route reuses public breadcrumb and category card");
            for (String level : new String[]{"home", "target-systemui", route})
                require(tag("breadcrumb:" + level) != null, "Public breadcrumb contains " + level);
            float density = page.getResources().getDisplayMetrics().density;
            float gap = (top(card) - top(path) - path.getHeight()) / density;
            require(Math.abs(gap - UiKit.DETAIL_CONTENT_GAP_DP) <= .6f, "Actual navigation gap is the default 8dp: " + gap);
            Switch control = toggle(key);
            require(control.isChecked() == ConfigSchema.truthy(before.get(key)), "Opening preserves saved feature switch");
            require(Math.abs(control.getWidth() / density - 46) <= .6f, "Switch reuses public 46dp width");
            require(Math.abs(control.getTrackDrawable().getIntrinsicHeight() / density - 28) <= .6f, "Switch reuses public 28dp track");
            View row = (View) control.getParent();
            require(row.getHeight() / density >= 43.5f, "Feature row retains at least 44dp touch height");
            return new JSONObject().put("route", route).put("navigationGapDp", gap).put("density", density)
                    .put("fontScale", page.getResources().getConfiguration().fontScale);
        });
    }

    private void inspectParameters(Map<String, String> before) throws Exception {
        onMain(() -> {
            Map<String, View> controls = controls();
            require(controls.size() == 7, "Island exposes three activity choices and four geometry/time parameters");
            for (String name : new String[]{"music", "notifications", "charging"}) {
                String key = PREFIX + name; View view = controls.get(key);
                require(view instanceof Spinner && ((Spinner) view).getAdapter().getCount() == 2, "Real activity choice has off/on options: " + name);
                require(((Spinner) view).getSelectedItemPosition() == Integer.parseInt(before.get(key)), "Activity choice preserves its saved value: " + name);
            }
            for (String name : new String[]{"width", "height", "offset_x", "notice_seconds"}) {
                String key = PREFIX + name; View view = controls.get(key);
                require(view instanceof EditText && before.get(key).contentEquals(((EditText) view).getText()), "Real parameter input preserves its saved value: " + name);
            }
            return null;
        });
    }

    private void previewToggle(String key, boolean checked) throws Exception {
        onMain(() -> {
            try { toggle(key).setChecked(checked); require(toggle(key).isChecked() == checked, "Real switch callback accepts preview state"); }
            finally { discardPreviewSave(); }
            return null;
        });
        settle();
    }

    /** Runs in the same main-thread turn as setChecked, before the 280ms save can execute. */
    private void discardPreviewSave() throws Exception {
        ((Handler) get(page, "main")).removeCallbacks((Runnable) get(page, "autoSave"));
        map("pending").clear();
        if (initialDraft != null) { map("draft").clear(); map("draft").putAll(initialDraft); }
    }

    private void close() throws Exception {
        if (page == null) return;
        Activity closing = page;
        ExecutorService worker = (ExecutorService) get(closing, "worker");
        onMain(() -> { discardPreviewSave(); closing.finish(); return null; });
        test.waitForIdleSync();
        require(worker.awaitTermination(15, TimeUnit.SECONDS), "Page worker drains with no queued save");
        page = null; initialDraft = null;
    }

    private void unchanged(AppConfig config, Map<String, String> before, Map<String, ?> prefs, Map<String, ?> memory) {
        require(before.equals(config.snapshot()), "Every runtime feature value stays unchanged");
        require(prefs.equals(context.getSharedPreferences(AppConfig.PREFS, 0).getAll()), "Complete saved preference storage stays unchanged");
        require(memory.equals(context.getSharedPreferences("native_value_overrides", 0).getAll()), "Feature UI memory stays unchanged");
    }
    private View tag(String value) { return page.getWindow().getDecorView().findViewWithTag(value); }
    private Switch toggle(String key) { View view = tag("config:" + key); require(view instanceof Switch, "Native switch exists: " + key); return (Switch) view; }
    private View islandContent() { return ((ViewGroup) tag("native-feature:systemui:island_enabled")).getChildAt(1); }
    private ImageButton islandArrow() { ViewGroup row = (ViewGroup) toggle(SystemUiOptions.ISLAND).getParent(); return (ImageButton) row.getChildAt(row.getChildCount() - 1); }
    @SuppressWarnings("unchecked") private Consumer<Boolean> foldSetter() throws Exception { return ((Map<String, Consumer<Boolean>>) get(get(page, "ui"), "foldSetters")).get("switch:config:" + SystemUiOptions.ISLAND); }
    @SuppressWarnings("unchecked") private Map<String, View> controls() throws Exception { return (Map<String, View>) get(page, "controls"); }
    @SuppressWarnings("unchecked") private Map<String, String> map(String field) throws Exception { return (Map<String, String>) get(page, field); }
    private static Object get(Object owner, String name) throws Exception { Field field = owner.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(owner); }
    private static int top(View view) { int[] location = new int[2]; view.getLocationInWindow(location); return location[1]; }
    private void settle() { test.waitForIdleSync(); SystemClock.sleep(300); }
    private void capture(String name) throws Exception {
        settle(); Bitmap bitmap = test.getUiAutomation().takeScreenshot(); require(bitmap != null, "Screenshot is available");
        File file = new File(directory, name + ".png");
        try (FileOutputStream out = new FileOutputStream(file)) { require(bitmap.compress(Bitmap.CompressFormat.PNG, 100, out), "Screenshot is written"); }
        finally { bitmap.recycle(); }
        screenshots.put(file.getAbsolutePath());
    }
    private void require(boolean value, String message) { checks++; if (!value) throw new AssertionError(message); }
    private interface Main<T> { T run() throws Exception; }
    private <T> T onMain(Main<T> action) throws Exception {
        AtomicReference<T> result = new AtomicReference<>(); AtomicReference<Throwable> error = new AtomicReference<>();
        test.runOnMainSync(() -> { try { result.set(action.run()); } catch (Throwable failure) { error.set(failure); } });
        if (error.get() != null) throw new AssertionError("UI operation failed", error.get()); return result.get();
    }
}
