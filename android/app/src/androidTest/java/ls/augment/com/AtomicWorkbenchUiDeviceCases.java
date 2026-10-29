package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.SystemClock;
import android.os.Bundle;
import android.text.Layout;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Shared real controls and host UI only; this suite never opens a privileged app/display. */
final class AtomicWorkbenchUiDeviceCases {
    private final Instrumentation test;
    private final Context context;
    private final AppConfig config;
    private final File directory;
    private final JSONArray screens = new JSONArray();
    private final JSONArray navigationLayouts = new JSONArray();
    private Activity current;

    private AtomicWorkbenchUiDeviceCases(Instrumentation test) {
        this.test = test;
        context = test.getTargetContext();
        config = new AppConfig(context);
        directory = new File(context.getExternalFilesDir(null), "atomic-workbench-ui");
    }

    static JSONObject run(Instrumentation test) throws Exception {
        return new AtomicWorkbenchUiDeviceCases(test).execute();
    }

    private JSONObject execute() throws Exception {
        Map<String, String> before = new LinkedHashMap<>();
        for (String key : new String[]{AtomicWorkbenchConfig.ENABLED, AtomicWorkbenchConfig.SHOW_MEDIA,
                AtomicWorkbenchConfig.QUICK_OPEN_APPS}) before.put(key, config.get(key));
        require("0".equals(ConfigSchema.defaultValue(AtomicWorkbenchConfig.QUICK_OPEN_APPS)), "Quick opening defaults off");
        require(directory.isDirectory() || directory.mkdirs(), "Screenshot directory");
        android.content.SharedPreferences guide = context.getSharedPreferences(AtomicWorkbenchGestureGuide.PREFS, 0);
        boolean hadGuide = guide.contains(AtomicWorkbenchGestureGuide.SEEN);
        boolean guideSeen = guide.getBoolean(AtomicWorkbenchGestureGuide.SEEN, false);
        guide.edit().putBoolean(AtomicWorkbenchGestureGuide.SEEN, true).commit();
        try {
            save(Map.of(AtomicWorkbenchConfig.ENABLED, "1", AtomicWorkbenchConfig.SHOW_MEDIA, "0",
                    AtomicWorkbenchConfig.QUICK_OPEN_APPS, "0"));
            launch(AtomicWorkbenchSettingsActivity.class);
            float gap = main(() -> {
                View path = tag("page-path"), title = tag("section-title:全局手势");
                require(path != null && title != null, "Shared navigation and section title");
                return (top(title) - top(path) - path.getHeight()) / current.getResources().getDisplayMetrics().density;
            });
            require(gap >= 7.5f && gap <= 12.5f, "Navigation gap: " + gap);
            require(main(() -> !quickSwitch(current.getWindow().getDecorView()).isChecked()), "Editor displays saved off state");
            capture("01-settings-quick-off");
            main(() -> { quickSwitch(current.getWindow().getDecorView()).performClick(); return null; });
            await(() -> config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS), "Editor saves quick opening");
            capture("02-settings-quick-on");
            close();
            launch(AtomicWorkbenchSettingsActivity.class);
            require(main(() -> quickSwitch(current.getWindow().getDecorView()).isChecked()), "Reopened editor retains preference");
            close();

            // An invalid entry proof prevents automatic HOME handoff; no production bypass is added.
            launch(AtomicWorkbenchActivity.class);
            await(() -> main(() -> tag("atomic-workbench-app-strip").isShown()
                    && ((ViewGroup) tag("atomic-workbench-app-strip-items")).getChildCount() > 0),
                    "Enabled preference shows horizontal app icons");
            require(main(this::iconsOnly), "App row contains only app icons, without the four-square list button");
            float enabledGap = main(this::toolbarWorkspaceGap);
            require(enabledGap >= 48, "Visible app row reserves touchable height: " + enabledGap);
            require(main(() -> tag("atomic-workbench-window-action-0").getContentDescription().toString().contains("原生桌面")),
                    "Enabled app row does not change plus into app picker");
            capture("03-workspace-strip-on");
            View previousQuickTile = main(() -> ((ViewGroup) tag("atomic-workbench-app-strip-items")).getChildAt(0));
            require(main(() -> field("client") == null), "Showing icons does not start a Root session");
            main(() -> { tag("atomic-workbench-settings").performClick(); return null; });
            Dialog dialog = main(() -> (Dialog) field("settingsDialog"));
            require(dialog != null && main(dialog::isShowing), "In-place shared settings dialog");
            main(() -> { quickSwitch(dialog.getWindow().getDecorView()).performClick(); return null; });
            await(() -> !config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS)
                    && main(() -> tag("atomic-workbench-app-strip").getVisibility() == View.GONE),
                    "Disabling quick opening hides the horizontal app icons");
            require(main(() -> field("client") == null), "Hiding app row does not request a HOME lease");
            main(() -> { dialog.dismiss(); return null; });
            test.waitForIdleSync();
            float disabledGap = main(this::toolbarWorkspaceGap);
            require(disabledGap >= 0 && disabledGap <= 12 && disabledGap < enabledGap,
                    "Hidden strip leaves no reserved row: " + disabledGap);
            require(main(() -> {
                View toolbar = tag("atomic-workbench-toolbar"), workspace = tag("atomic-workbench-workspace");
                float density = current.getResources().getDisplayMetrics().density;
                return tag("atomic-workbench-transfer") == null
                        && Math.abs(top(workspace) - top(toolbar) - toolbar.getHeight()) / density <= 0.5f;
            }), "Material tools leave no permanent row or empty space above the workspace");
            require(main(() -> tag("atomic-workbench-window-action-0").getContentDescription().toString().contains("原生桌面")),
                    "Disabled app row keeps native HOME plus behavior");
            main(() -> { previousQuickTile.performClick(); return null; });
            require(main(() -> field("client") == null && tag("atomic-workbench-app-list") == null),
                    "Detached app icon cannot launch while disabled, and list button remains absent");
            capture("04-workspace-strip-off");
            main(() -> { tag("atomic-workbench-settings").performClick(); return null; });
            Dialog toolsSettings = main(() -> (Dialog) field("settingsDialog"));
            main(() -> {
                View entry = toolsSettings.getWindow().getDecorView().findViewWithTag("atomic-workbench-material-tools");
                require(entry != null && entry.isShown() && entry.getHeight() / current.getResources().getDisplayMetrics().density >= 47.5f,
                        "Material history remains reachable through a 48dp settings entry");
                entry.performClick(); return null;
            });
            test.waitForIdleSync();
            AtomicWorkbenchTransfer transfer = main(() -> (AtomicWorkbenchTransfer) field("transfer"));
            Dialog toolsDialog = main(() -> (Dialog) value(transfer, "dialog"));
            require(main(() -> toolsDialog.isShowing() && !toolsSettings.isShowing() && tag("atomic-workbench-transfer") == null),
                    "Tools open separately after settings dismiss without occupying workspace");
            capture("04a-material-tools");
            main(() -> { toolsDialog.dismiss(); return null; });
            main(() -> { transfer.showTools(); return null; });
            require(main(() -> ((Dialog) value(transfer, "dialog")).isShowing()), "Material tools can be reopened after dismissal");
            main(() -> { ((Dialog) value(transfer, "dialog")).dismiss(); return null; });
            close();
            launch(AtomicWorkbenchActivity.class);
            require(main(() -> tag("atomic-workbench-app-strip").getVisibility() == View.GONE), "Reopened workspace retains hidden row");
            main(() -> { tag("atomic-workbench-settings").performClick(); return null; });
            Dialog reopenDialog = main(() -> (Dialog) field("settingsDialog"));
            main(() -> { quickSwitch(reopenDialog.getWindow().getDecorView()).performClick(); return null; });
            await(() -> config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS)
                    && main(() -> tag("atomic-workbench-app-strip").isShown()
                        && ((ViewGroup) tag("atomic-workbench-app-strip-items")).getChildCount() > 0),
                    "Enabling again restores horizontal app icons");
            require(main(this::iconsOnly), "Re-enabling never restores the removed list button");
            require(main(() -> field("client") == null), "Showing app row does not open ROOT session");
            main(() -> { reopenDialog.dismiss(); return null; });
            capture("05-workspace-strip-restored");
            long previousSession = main(() -> ((Number) field("sessionGeneration")).longValue());
            int priorEpoch = main(() -> ((Number) field("epoch")).intValue());
            main(() -> {
                AtomicWorkbenchWorkspaceModel model = (AtomicWorkbenchWorkspaceModel) field("model");
                require(model.commitLaunch(model.planLaunch("test.previous/.Main")), "Seed visible session model");
                Object slot = ((Object[]) field("slots"))[0];
                setField(slot, "message", "test-old-window-error"); setField(slot, "displayId", 88);
                invoke("onStart", new Class<?>[0]);
                return null;
            });
            test.waitForIdleSync();
            require(main(() -> ((Number) field("sessionGeneration")).longValue() == previousSession
                    && ((AtomicWorkbenchWorkspaceModel) field("model")).appCount() == 1),
                    "Ordinary start does not replace current workspace generation or model");
            main(() -> {
                Intent next = new Intent(context, AtomicWorkbenchActivity.class)
                        .putExtra(AtomicWorkbenchConfig.EXTRA_ENTRY, "gesture");
                invoke("onNewIntent", new Class<?>[]{Intent.class}, next);
                return null;
            });
            awaitRejectedEntryWorker();
            require(main(() -> ((Number) field("sessionGeneration")).longValue() > previousSession
                    && ((AtomicWorkbenchWorkspaceModel) field("model")).appCount() == 0
                    && field("client") == null && !((Boolean) field("recoveryPending"))),
                    "Explicit singleTask entry starts an empty isolated session");
            require(main(() -> {
                for (Object slot : (Object[]) field("slots"))
                    if (!"".equals(value(slot, "message")) || ((Number) value(slot, "displayId")).intValue() != -1) return false;
                return true;
            }), "New entry does not inherit slot errors or display IDs");
            AtomicReference<Boolean> staleApplied = new AtomicReference<>(false);
            main(() -> { invoke("completeOperation", new Class<?>[]{int.class, Runnable.class}, priorEpoch,
                    (Runnable) () -> staleApplied.set(true)); return null; });
            require(!staleApplied.get(), "Prior session completion cannot apply to the new model");
            main(() -> {
                // A UI fixture verifies exact route text without creating a map route or a Root session.
                // Keep the host's render state consistent with the visible fixture. A queued
                // workspace layout must not hide it using the deliberately disabled preference.
                setField(current, "showMedia", true);
                ((View) field("mediaCard")).setVisibility(View.VISIBLE);
                Bundle guidance = new Bundle();
                guidance.putBoolean("available", true); guidance.putBoolean("has_session", true);
                guidance.putBoolean("has_guidance", true); guidance.putString("package", "com.autonavi.minimap");
                guidance.putString("title", "350米后右转进入示例道路");
                guidance.putString("subtitle", "沿示例道路行驶");
                guidance.putString("subtext", "剩余5公里 · 12分钟");
                invoke("applyNavigationState", new Class<?>[]{Bundle.class}, guidance);
                require(((AtomicWorkbenchCardPager) field("cardPager")).performAccessibilityAction(4096, null),
                        "Navigation page becomes reachable with current guidance");
                return null;
            });
            test.waitForIdleSync();
            require(main(() -> {
                TextView title = (TextView) field("navigationTitle"), subtitle = (TextView) field("navigationSubtitle");
                return title.isShown() && "350米后右转进入示例道路".contentEquals(title.getText())
                        && "沿示例道路行驶\n剩余5公里 · 12分钟".contentEquals(subtitle.getText())
                        && title.getLayout() != null && title.getLayout().getEllipsisCount(0) == 0
                        && subtitle.getLineCount() <= 2 && field("client") == null;
            }), "Current instruction, road and remaining route fit the actual card");
            capture("06-navigation-text-fixture");
            main(() -> {
                Bundle metrics = routeMetrics();
                metrics.putDouble("segmentRemainDist", 29);
                metrics.putDouble("speed", 4);
                metrics.putDouble("routeRemainTime", 240);
                metrics.putDouble("routeRemainDist", 1400);
                invoke("applyNavigationState", new Class<?>[]{Bundle.class}, structuredGuidance(metrics));
                return null;
            });
            awaitNavigationLayout();
            capture("07-navigation-structured-fixture");
            main(() -> {
                require("29 米".contentEquals(((TextView) field("navigationTitle")).getText()), "Actual next-turn distance");
                require("当前路 → 下一路".contentEquals(((TextView) field("navigationSubtitle")).getText()), "Current and next road order");
                require("4".contentEquals(((TextView) field("navigationSpeed")).getText())
                        && "km/h".contentEquals(((TextView) field("navigationSpeedUnit")).getText()), "Actual speed and unit");
                require("4 分钟 · 1.4 公里".contentEquals(((TextView) field("navigationRemaining")).getText()), "Actual remaining time and length");
                require("左转".contentEquals(((View) field("navigationIcon")).getContentDescription()), "Verified maneuver arrow");
                require("○ ●".contentEquals(((TextView) field("cardPageHint")).getText()), "Compact navigation page dots");
                navigationLayouts.put(navigationBounds("full-metrics"));
                return null;
            });
            main(() -> {
                invoke("applyNavigationState", new Class<?>[]{Bundle.class}, structuredGuidance(routeMetrics()));
                return null;
            });
            awaitNavigationLayout();
            main(() -> {
                require("左转".contentEquals(((TextView) field("navigationTitle")).getText()), "Missing turn distance keeps real maneuver label");
                require(((TextView) field("navigationSpeed")).getText().length() == 0
                        && ((TextView) field("navigationRemaining")).getText().length() == 0
                        && ((View) field("navigationSpeedColumn")).getVisibility() == View.GONE
                        && ((View) field("navigationRemaining")).getVisibility() == View.GONE
                        && ((View) field("navigationMetricsColumn")).getVisibility() == View.GONE,
                        "Missing metrics hide the complete right column without zero placeholders");
                navigationLayouts.put(navigationBounds("missing-metrics"));
                Bundle zero = routeMetrics();
                zero.putDouble("segmentRemainDist", 0); zero.putDouble("speed", 0);
                zero.putDouble("routeRemainTime", 0); zero.putDouble("routeRemainDist", 0);
                invoke("applyNavigationState", new Class<?>[]{Bundle.class}, structuredGuidance(zero));
                return null;
            });
            awaitNavigationLayout();
            main(() -> {
                require("0 米".contentEquals(((TextView) field("navigationTitle")).getText())
                        && "0".contentEquals(((TextView) field("navigationSpeed")).getText())
                        && "0 分钟 · 0 米".contentEquals(((TextView) field("navigationRemaining")).getText())
                        && ((View) field("navigationSpeedColumn")).isShown()
                        && ((View) field("navigationRemaining")).isShown(), "Real zero metrics stay visible");
                navigationLayouts.put(navigationBounds("real-zero-metrics"));
                return null;
            });
            main(() -> { invoke("applyNavigationState", new Class<?>[]{Bundle.class}, (Object) null); return null; });
            require(main(() -> ((TextView) field("navigationTitle")).getText().length() == 0
                    && ((TextView) field("navigationSubtitle")).getText().length() == 0
                    && ((TextView) field("navigationSpeed")).getText().length() == 0
                    && ((TextView) field("navigationRemaining")).getText().length() == 0
                    && ((View) field("navigationSpeedColumn")).getVisibility() == View.GONE
                    && ((View) field("navigationRemaining")).getVisibility() == View.GONE
                    && ((View) field("navigationMetricsColumn")).getVisibility() == View.GONE
                    && !((AtomicWorkbenchCardPager) field("cardPager")).hasNavigation()),
                    "Navigation ending clears actual card text, all metrics and page");
            main(() -> {
                AtomicWorkbenchWorkspaceModel model = (AtomicWorkbenchWorkspaceModel) field("model");
                require(model.commitLaunch(model.planLaunch("test.exit/.Main")), "Seed exiting model");
                tag("atomic-workbench-exit").performClick();
                require(current.isFinishing() && model.appCount() == 0 && field("client") == null,
                        "Explicit exit finishes immediately and clears all UI windows");
                return null;
            });
            await(() -> main(() -> current.isFinishing() || current.isDestroyed()), "Exit releases the host");
            current = null;
            return new JSONObject().put("success", true).put("device", android.os.Build.MODEL)
                    .put("navigationGapDp", gap).put("enabledRowGapDp", enabledGap).put("disabledRowGapDp", disabledGap)
                    .put("quickOpenPersists", true).put("appRowVisibilityPersists", true).put("listButtonAbsent", true)
                    .put("materialAreaRemoved", true).put("materialToolsReachable", true)
                    .put("disabledIconInert", true).put("freshEntryClearsUi", true).put("ordinaryStartPreservesSession", true)
                    .put("staleCompletionRejected", true).put("exitImmediatelyClearsUi", true)
                    .put("rejectedEntryKeepsRootDisconnected", true)
                    .put("navigationTextFixtureFits", true).put("navigationEndClearsText", true)
                    .put("navigationStructuredFixtureFits", true).put("navigationMissingMetricsHidden", true)
                    .put("navigationRealZeroVisible", true).put("navigationEndClearsMetrics", true)
                    .put("navigationLayouts", navigationLayouts)
                    .put("noRootSession", true).put("screens", screens);
        } finally { close(); save(before); android.content.SharedPreferences.Editor guideEdit = guide.edit();
                if (hadGuide) guideEdit.putBoolean(AtomicWorkbenchGestureGuide.SEEN, guideSeen);
                else guideEdit.remove(AtomicWorkbenchGestureGuide.SEEN);
                guideEdit.commit(); }
    }

    private void launch(Class<? extends Activity> type) throws Exception {
        Intent intent = new Intent(context, type).putExtra(ModuleNavigation.EXTRA_ROUTE, "atomic_workbench")
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        if (type == AtomicWorkbenchActivity.class) intent.putExtra(AtomicWorkbenchConfig.EXTRA_ENTRY, "gesture");
        current = test.startActivitySync(intent);
        test.waitForIdleSync();
        SystemClock.sleep(500);
    }
    private void close() throws Exception {
        if (current == null) return;
        Activity page = current;
        main(() -> { if (!page.isDestroyed()) page.finish(); return null; });
        current = null;
        test.waitForIdleSync();
    }
    private void save(Map<String, String> values) {
        AppConfig.SaveResult result = config.save(values);
        require(result.success, result.message);
    }
    private static Bundle routeMetrics() {
        Bundle metrics = new Bundle();
        metrics.putInt("eventType", 1); metrics.putInt("curManeuverID", 2);
        metrics.putString("curRouteName", "当前路"); metrics.putString("nextRouteName", "下一路");
        return metrics;
    }
    private static Bundle structuredGuidance(Bundle metrics) {
        Bundle guidance = new Bundle();
        guidance.putBoolean("available", true); guidance.putBoolean("has_session", true);
        guidance.putBoolean("has_guidance", true); guidance.putString("package", "com.autonavi.minimap");
        guidance.putString("navigation_source", "amap_memory_structured");
        guidance.putBundle("metrics", metrics);
        return guidance;
    }
    private void awaitNavigationLayout() throws Exception {
        test.waitForIdleSync();
        await(() -> main(() -> ((View) field("navigationPage")).isShown()
                && !((View) field("navigationPage")).isLayoutRequested()
                && ((TextView) field("navigationTitle")).getLayout() != null), "Structured navigation layout settles");
        awaitDraw("Structured navigation layout");
    }
    private void awaitRejectedEntryWorker() throws Exception {
        // Drain actual asynchronous work before accepting client==null. A
        // synchronous check can miss a HOME connection queued by onNewIntent.
        ExecutorService worker = main(() -> (ExecutorService) field("WORKER"));
        worker.submit(() -> { }).get(30, TimeUnit.SECONDS);
        main(() -> {
            require(field("client") == null && !((Boolean) field("nativeHomePending")),
                    "Rejected gesture does not queue HOME or connect Root after worker completion");
            require((Boolean) field("active"), "No-Root fixture remains an active host");
            return null;
        });
    }
    private JSONObject navigationBounds(String state) throws Exception {
        View card = (View) field("mediaCard"), page = (View) field("navigationPage");
        View icon = (View) field("navigationIcon"), metrics = (View) field("navigationMetricsColumn");
        TextView title = (TextView) field("navigationTitle"), roads = (TextView) field("navigationSubtitle");
        Rect pageBounds = bounds(page), titleBounds = bounds(title), roadsBounds = bounds(roads);
        require(field("client") == null, "Structured fixture does not start Root or real navigation");
        require(inside(pageBounds, bounds(card)) && inside(bounds(icon), pageBounds), "Navigation page and maneuver fit card");
        require(bounds(icon).right <= titleBounds.left && titleBounds.bottom <= roadsBounds.top + 1,
                "Maneuver, distance and roads stay in separate left areas");
        JSONObject result = new JSONObject().put("state", state)
                .put("fontScale", current.getResources().getConfiguration().fontScale)
                .put("density", current.getResources().getDisplayMetrics().density)
                .put("card", rectangle(card)).put("page", rectangle(page)).put("maneuver", rectangle(icon))
                .put("distance", textFits(title, page)).put("roads", textFits(roads, page));
        if (metrics.isShown()) {
            Rect metricBounds = bounds(metrics);
            require(inside(metricBounds, pageBounds) && titleBounds.right <= metricBounds.left
                    && roadsBounds.right <= metricBounds.left, "Navigation left and right columns do not overlap");
            TextView speed = (TextView) field("navigationSpeed"), unit = (TextView) field("navigationSpeedUnit");
            View speedColumn = (View) field("navigationSpeedColumn");
            if (speedColumn.isShown()) {
                require(inside(bounds(speedColumn), metricBounds) && bounds(speed).right <= bounds(unit).left + 1,
                        "Speed and km/h occupy separate bounds inside the right column");
                result.put("speed", textFits(speed, speedColumn)).put("speedUnit", textFits(unit, speedColumn));
            }
            TextView remaining = (TextView) field("navigationRemaining");
            if (remaining.isShown()) {
                if (speedColumn.isShown()) require(bounds(speedColumn).bottom <= bounds(remaining).top,
                        "Remaining route is below the speed row");
                result.put("remaining", textFits(remaining, metrics));
            }
            result.put("metrics", rectangle(metrics));
        } else result.put("metricsHidden", true);
        return result;
    }
    private static JSONObject textFits(TextView text, View container) throws Exception {
        Layout layout = text.getLayout();
        require(text.isShown() && text.getWidth() > 0 && text.getHeight() > 0 && layout != null
                && inside(bounds(text), bounds(container)), "Visible text fits container: " + text.getText()
                        + ", text=" + bounds(text) + ", container=" + bounds(container));
        int width = text.getWidth() - text.getCompoundPaddingLeft() - text.getCompoundPaddingRight();
        int height = text.getHeight() - text.getCompoundPaddingTop() - text.getCompoundPaddingBottom();
        require(layout.getLineCount() > 0 && layout.getLineCount() <= text.getMaxLines()
                && layout.getHeight() <= height + 1, "Text lines fit height: " + text.getText());
        for (int i = 0; i < layout.getLineCount(); i++)
            require(layout.getEllipsisCount(i) == 0 && layout.getLineMax(i) <= width + 1,
                    "Text is fully visible without ellipsis: " + text.getText());
        require(layout.getLineEnd(layout.getLineCount() - 1) == text.getText().length(),
                "All text is laid out: " + text.getText());
        return new JSONObject().put("text", text.getText().toString()).put("bounds", rectangle(text))
                .put("lines", layout.getLineCount()).put("lineHeightPx", layout.getHeight())
                .put("textSizePx", text.getTextSize()).put("ellipsis", false);
    }
    private static Rect bounds(View view) {
        int[] location = new int[2]; view.getLocationInWindow(location);
        return new Rect(location[0], location[1], location[0] + view.getWidth(), location[1] + view.getHeight());
    }
    private static boolean inside(Rect child, Rect parent) {
        return child.left >= parent.left - 1 && child.top >= parent.top - 1
                && child.right <= parent.right + 1 && child.bottom <= parent.bottom + 1;
    }
    private static JSONObject rectangle(View view) throws Exception {
        Rect rect = bounds(view);
        return new JSONObject().put("left", rect.left).put("top", rect.top)
                .put("right", rect.right).put("bottom", rect.bottom);
    }
    private void capture(String name) throws Exception {
        test.waitForIdleSync();
        SystemClock.sleep(400); // Let the shared dialog dismissal animation finish before visual comparison.
        awaitDraw("Capture " + name);
        Bitmap screenshot = test.getUiAutomation().takeScreenshot();
        require(screenshot != null, "Capture " + name);
        File file = new File(directory, name + ".png");
        try (FileOutputStream output = new FileOutputStream(file)) { screenshot.compress(Bitmap.CompressFormat.PNG, 100, output); }
        finally { screenshot.recycle(); }
        screens.put(new JSONObject().put("name", name).put("path", file.getAbsolutePath())
                .put("density", current.getResources().getDisplayMetrics().density)
                .put("fontScale", current.getResources().getConfiguration().fontScale)
                .put("drawObserved", true).put("animationFramesAfterDraw", 2));
    }
    private void awaitDraw(String detail) throws Exception {
        CountDownLatch drawn = new CountDownLatch(1);
        AtomicReference<ViewTreeObserver.OnDrawListener> listener = new AtomicReference<>();
        ViewTreeObserver observer = main(() -> {
            View decor = current.getWindow().getDecorView();
            require(decor.isAttachedToWindow(), "Window ready: " + detail);
            ViewTreeObserver tree = decor.getViewTreeObserver();
            ViewTreeObserver.OnDrawListener callback = new ViewTreeObserver.OnDrawListener() {
                private boolean observed;
                @Override public void onDraw() {
                    if (observed) return;
                    observed = true;
                    decor.postOnAnimation(() -> decor.postOnAnimation(drawn::countDown));
                }
            };
            listener.set(callback);
            tree.addOnDrawListener(callback);
            decor.invalidate();
            return tree;
        });
        try {
            require(drawn.await(8, TimeUnit.SECONDS), "Actual draw followed by two animation frames: " + detail);
        } finally {
            main(() -> {
                if (observer.isAlive()) observer.removeOnDrawListener(listener.get());
                return null;
            });
        }
        test.waitForIdleSync();
    }
    private Object field(String name) throws Exception {
        Field field = AtomicWorkbenchActivity.class.getDeclaredField(name);
        field.setAccessible(true);
        return field.get(current);
    }
    private Object invoke(String name, Class<?>[] types, Object... arguments) throws Exception {
        Method method = AtomicWorkbenchActivity.class.getDeclaredMethod(name, types);
        method.setAccessible(true); return method.invoke(current, arguments);
    }
    private static Object value(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(owner);
    }
    private static void setField(Object owner, String name, Object value) throws Exception {
        Field field = owner.getClass().getDeclaredField(name); field.setAccessible(true); field.set(owner, value);
    }
    private View tag(String value) { return current.getWindow().getDecorView().findViewWithTag(value); }
    private boolean iconsOnly() {
        if (tag("atomic-workbench-app-list") != null) return false;
        ViewGroup items = (ViewGroup) tag("atomic-workbench-app-strip-items");
        if (items == null || items.getChildCount() == 0) return false;
        for (int i = 0; i < items.getChildCount(); i++) {
            Object tag = items.getChildAt(i).getTag();
            if (!(tag instanceof String) || !((String) tag).startsWith("atomic-workbench-quick-app:")) return false;
        }
        return true;
    }
    private float toolbarWorkspaceGap() {
        View toolbar = tag("atomic-workbench-toolbar"), workspace = tag("atomic-workbench-workspace");
        return (top(workspace) - top(toolbar) - toolbar.getHeight()) / current.getResources().getDisplayMetrics().density;
    }
    private static Switch quickSwitch(View root) {
        Switch control = root.findViewWithTag("config:" + AtomicWorkbenchConfig.QUICK_OPEN_APPS);
        require(control != null, "Shared quick opening switch");
        return control;
    }
    private static int top(View view) { int[] location = new int[2]; view.getLocationInWindow(location); return location[1]; }
    private interface Check { boolean get() throws Exception; }
    private void await(Check check, String detail) throws Exception {
        long deadline = SystemClock.uptimeMillis() + 8000;
        while (!check.get() && SystemClock.uptimeMillis() < deadline) SystemClock.sleep(100);
        require(check.get(), detail);
        test.waitForIdleSync();
    }
    private interface Work<T> { T get() throws Exception; }
    private <T> T main(Work<T> work) throws Exception {
        AtomicReference<T> result = new AtomicReference<>();
        AtomicReference<Throwable> error = new AtomicReference<>();
        test.runOnMainSync(() -> { try { result.set(work.get()); } catch (Throwable failure) { error.set(failure); } });
        if (error.get() != null) throw new AssertionError(error.get());
        return result.get();
    }
    private static void require(boolean condition, String detail) { if (!condition) throw new AssertionError(detail); }
}
