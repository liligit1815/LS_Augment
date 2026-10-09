package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Handler;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.CompoundButton;
import android.widget.Button;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real fan settings, automatic saves and read-only observations of applied hardware levels. */
final class FanSettingsUiCases {
    private final Instrumentation test;
    private final JSONArray screenshots = new JSONArray();
    private final JSONArray levelCases = new JSONArray();
    private Activity activity;
    private FeatureEditorController editor;
    private File directory;
    private int checks;
    private float navigationGapDp;
    private float parameterGapDp;
    private float parameterToTileGapDp;
    private float measurementCardGapDp;
    private boolean layoutOnly;

    private FanSettingsUiCases(Instrumentation test) { this.test = test; }
    static JSONObject run(Instrumentation test) throws Exception {
        return run(test, false);
    }
    static JSONObject run(Instrumentation test, boolean layoutOnly) throws Exception {
        FanSettingsUiCases cases = new FanSettingsUiCases(test);
        cases.layoutOnly = layoutOnly;
        return cases.run();
    }

    private JSONObject run() throws Exception {
        Context context = test.getTargetContext();
        AppConfig config = new AppConfig(context);
        Map<String, String> before = new LinkedHashMap<>(config.snapshot());
        Map<String, String> oemBefore = readOemState(context);
        int[] hardwareBefore = !layoutOnly && isModel("NX809J") ? readHardware() : null;
        boolean supported = false;
        int toggleCases = 0;
        Throwable failure = null;
        try {
            try (android.os.ParcelFileDescriptor ignored = test.getUiAutomation().executeShellCommand("cmd statusbar collapse")) {
                SystemClock.sleep(300);
            }
            activity = test.startActivitySync(new Intent(context, FeatureActivity.class)
                    .putExtra(FeatureActivity.EXTRA_MODULE, FeatureActivity.MODULE_FAN_CONTROL)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE, "fan_control")
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            onMain(() -> {
                activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                return null;
            });
            settle();
            editor = (FeatureEditorController) get(activity, "editor");
            directory = new File(context.getExternalFilesDir(null), "fan-settings-ui-regression");
            require(directory.isDirectory() || directory.mkdirs(), "Screenshot directory is available");
            supported = onMain(() -> {
                View root = activity.getWindow().getDecorView();
                for (String title : new String[]{"固定风扇转速", "本机转速测量", "散热风扇磁贴增强", "息屏风扇不停止运转"})
                    require(findText(root, title) != null, "Real fan page contains " + title);
                for (String removed : new String[]{"风扇最高转速", "固定方式", "目标转速 RPM", "转速"})
                    require(findText(root, removed) == null, "Removed fan control is absent: " + removed);
                Object choice = fixedChoice();
                Map<String, Button> options = choiceButtons(choice);
                require(options.keySet().equals(new LinkedHashSet<>(java.util.Arrays.asList("1", "2", "3", "4", "5"))),
                        "Fixed-level choice exposes exactly hardware levels 1–5");
                String[] labels = {"一档", "二档", "三档", "四档", "五档"};
                for (int i = 0; i < labels.length; i++)
                    require(labels[i].contentEquals(options.get(String.valueOf(i + 1)).getText()),
                            "Each fixed-level option displays the corresponding hardware level: " + labels[i]);
                require(findText(root, "固定档位") != null, "Fixed-level choice uses the current public label");
                require(root.findViewWithTag("config:ls_augment_fan_unlock_max") == null,
                        "The removed maximum-speed switch is absent from the real view hierarchy");
                require(!((Map<?, ?>) get(editor, "sliders")).containsKey("ls_augment_fan_target_rpm"),
                        "The removed RPM slider is absent from the real editor model");
                View fixed = root.findViewWithTag("config:" + AppConfig.FAN_FIXED_ENABLED);
                View tile = root.findViewWithTag("config:" + AppConfig.FAN_TILE_ENHANCEMENT_ENABLED);
                View screenOff = root.findViewWithTag("config:" + AppConfig.FAN_SCREEN_OFF_ENABLED);
                require(screenOff instanceof CompoundButton && screenOff != fixed && screenOff != tile,
                        "Screen-off preservation exposes its own real switch");
                require(screenOff.isEnabled() == FanScreenOffPolicy.supportedDevice(
                                android.os.Build.DEVICE, android.os.Build.PRODUCT, android.os.Build.MODEL),
                        "Screen-off control is available only on the audited device");
                require(fixed instanceof CompoundButton && tile instanceof CompoundButton && fixed != tile,
                        "Tile enhancement and fixed speed expose separate switches");
                View fixedCard = (View) fixed.getParent().getParent();
                require(tile.getParent().getParent() == fixedCard,
                        "Fixed speed and tile enhancement share the same public card");
                require(screenOff.getParent().getParent() == fixedCard,
                        "Screen-off preservation reuses the same public fan card");
                View tileRow = (View) tile.getParent();
                UiKit.Fold fixedFold = fixedFold();
                ViewGroup card = (ViewGroup) fixedCard;
                require(card.indexOfChild((View) fixed.getParent()) < card.indexOfChild(fixedFold.content)
                                && card.indexOfChild(fixedFold.content) < card.indexOfChild(tileRow),
                        "The independent tile row follows the fixed-speed parameters in the shared card");
                ViewGroup page = (ViewGroup) fixedCard.getParent();
                View measurementCard = directChildContaining(page, findText(root, "本机转速测量"));
                require(measurementCard != null && page.indexOfChild(fixedCard) < page.indexOfChild(measurementCard),
                        "The merged fan card precedes the measurement card");
                require(tileRow.getHeight() / activity.getResources().getDisplayMetrics().density >= 43.5f,
                        "The relocated tile row preserves the public 44dp touch height");
                require(fixed.getLeft() == tile.getLeft() && fixed.getWidth() == tile.getWidth(),
                        "The two switches use the same aligned public switch column");
                require(tile.getLeft() == screenOff.getLeft() && tile.getWidth() == screenOff.getWidth(),
                        "The screen-off switch uses the same aligned public switch column");
                require(((CompoundButton) screenOff).isChecked() == ConfigSchema.truthy(before.get(AppConfig.FAN_SCREEN_OFF_ENABLED)),
                        "Opening the page preserves the screen-off setting");
                require(((CompoundButton) fixed).isChecked() == ConfigSchema.truthy(before.get(AppConfig.FAN_FIXED_ENABLED)),
                        "Opening the page preserves the fixed-speed switch");
                require(((CompoundButton) tile).isChecked() == ConfigSchema.truthy(before.get(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED)),
                        "Opening the page preserves the tile-enhancement switch");
                View navigation = root.findViewWithTag("page-path");
                View firstCard = (View) fixed.getParent().getParent();
                require(navigation != null, "Fan page uses the public breadcrumb navigation");
                int[] navPoint = new int[2], cardPoint = new int[2];
                navigation.getLocationInWindow(navPoint); firstCard.getLocationInWindow(cardPoint);
                navigationGapDp = (cardPoint[1] - navPoint[1] - navigation.getHeight())
                        / activity.getResources().getDisplayMetrics().density;
                require(navigationGapDp >= 7.5f && navigationGapDp <= 12.5f,
                        "Actual navigation-to-card gap is within 8–12dp: " + navigationGapDp);
                require(!((Boolean) get(editor, "dirty")), "Opening the page queues no configuration change");
                return tile.isEnabled();
            });
            capture("01-initial-page.png");
            checkDisabledFixedFold();
            if (supported) checkSharedCardLayout();
            require(before.equals(config.snapshot()), "The in-memory fold check changes no saved setting");
            if (supported) {
                setTile(false, config);
                assertIndependent(config, before, oemBefore);
                revealTile(); capture("02-enhancement-disabled.png");
                setTile(true, config);
                assertIndependent(config, before, oemBefore);
                revealTile(); capture("03-enhancement-enabled.png");
                toggleCases = 2;
            } else {
                onMain(() -> {
                    require(!switchFor(AppConfig.FAN_FIXED_ENABLED).isEnabled(), "Unverified fixed-speed switch is disabled");
                    require(!switchFor(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED).isEnabled(), "Unverified tile enhancement is disabled");
                    return null;
                });
            }
            checkHelp("固定风扇转速", !supported
                    ? "此机型的定速档位仍待验证，暂不支持固定转速。"
                    : FeatureHelp.fanFixedSpeed(), "04-fixed-speed-help.png", config);
            checkHelp("本机转速测量", !supported
                    ? "此机型暂不执行逐档测量，避免使用其他型号的驱动档位。"
                    : FeatureHelp.fanMeasurement(), "05-measurement-help.png", config);
            checkHelp("散热风扇磁贴增强", supported
                    ? FeatureHelp.fanTileEnhancement()
                    : "此机型的固定档位尚未验证，暂不支持磁贴固定转速增强。原厂风扇磁贴仍可正常使用。",
                    "06-tile-enhancement-help.png", config);
            if (supported) setTile(false, config);
            assertIndependent(config, before, oemBefore);
            if (supported && !layoutOnly) checkFixedLevels(config, before, oemBefore, hardwareBefore[0] == 1);
        } catch (Throwable problem) {
            failure = problem;
            try { if (activity != null && directory != null) capture("failure.png"); }
            catch (Throwable captureFailure) { problem.addSuppressed(captureFailure); }
        } finally {
            try {
                if (activity != null) onMain(() -> {
                    if (editor != null) discardPendingSave();
                    activity.finish();
                    return null;
                });
                test.waitForIdleSync();
                // Await any save already submitted before restoring the original value.
                if (editor != null) {
                    java.util.concurrent.ExecutorService worker = (java.util.concurrent.ExecutorService) get(editor, "executor");
                    boolean drained = worker.awaitTermination(15, java.util.concurrent.TimeUnit.SECONDS);
                    if (!drained) {
                        worker.shutdownNow();
                        drained = worker.awaitTermination(5, java.util.concurrent.TimeUnit.SECONDS);
                    }
                    require(drained, "Fan editor save worker drains before restoration");
                }
            } catch (Throwable cleanupFailure) {
                if (failure == null) failure = cleanupFailure; else failure.addSuppressed(cleanupFailure);
            }
            try {
                Map<String, String> current = config.snapshot();
                LinkedHashMap<String, String> restore = new LinkedHashMap<>();
                for (Map.Entry<String, String> item : before.entrySet())
                    if (!item.getValue().equals(current.get(item.getKey()))) restore.put(item.getKey(), item.getValue());
                if (!restore.isEmpty()) require(config.save(restore).success, "Original configuration is restored");
                require(before.equals(config.snapshot()), "All original configuration values are preserved after cleanup");
            } catch (Throwable cleanupFailure) {
                if (failure == null) failure = cleanupFailure; else failure.addSuppressed(cleanupFailure);
            }
            try {
                restoreOemState(context, oemBefore);
                require(oemBefore.equals(readOemState(context)), "The original OEM fan switch and mode are restored after cleanup");
            } catch (Throwable cleanupFailure) {
                if (failure == null) failure = cleanupFailure; else failure.addSuppressed(cleanupFailure);
            }
        }
        if (failure != null) throw new AssertionError("Fan settings UI regression failed", failure);
        return new JSONObject().put("success", true).put("checks", checks).put("toggleCases", toggleCases)
                .put("tileEnhancementSupported", supported).put("separateSwitches", true)
                .put("sharedCard", true).put("tileRemainsVisibleWhenFixedCollapsedOrDisabled", true)
                .put("disabledFixedCannotExpand", true).put("helpCases", 3)
                .put("navigationGapDp", navigationGapDp).put("configurationRestored", true)
                .put("parameterGapDp", parameterGapDp).put("parameterToTileGapDp", parameterToTileGapDp)
                .put("measurementCardGapDp", measurementCardGapDp).put("layoutOnly", layoutOnly)
                .put("fixedLevelCases", levelCases).put("measurementUsedForFixedControl", false)
                .put("hardwareChecked", supported && !layoutOnly && hardwareBefore[0] == 1)
                .put("oemFanStateRestored", true).put("screenshots", screenshots);
    }

    private void checkDisabledFixedFold() throws Exception {
        onMain(() -> {
            Switch fixed = switchFor(AppConfig.FAN_FIXED_ENABLED);
            UiKit.Fold fold = fixedFold();
            require(fold != null, "Fixed speed retains the original public Fold");
            boolean oldLoading = (Boolean) get(editor, "loading"), oldChecked = fixed.isChecked();
            boolean oldExpanded = fold.content.getVisibility() == View.VISIBLE;
            Switch tile = switchFor(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED);
            boolean tileChecked = tile.isChecked();
            try {
                set(editor, "loading", true); fixed.setChecked(false); fold.sync();
                require(fold.content.getVisibility() == View.GONE && !fold.arrow.isEnabled(),
                        "Disabled fixed speed collapses its configuration and disables its arrow");
                require(tile.isShown() && tile.isChecked() == tileChecked,
                        "Disabling fixed speed preserves the visible independent tile row and its state");
                require(switchFor(AppConfig.FAN_SCREEN_OFF_ENABLED).isShown(),
                        "Screen-off preservation remains available when fixed speed is disabled");
                fold.show(true);
                require(fold.content.getVisibility() == View.GONE, "Disabled fixed speed cannot expand programmatically");
            } finally {
                fixed.setChecked(oldChecked); fold.sync(); fold.show(oldExpanded); set(editor, "loading", oldLoading);
            }
            require(fixed.isChecked() == oldChecked && (fold.content.getVisibility() == View.VISIBLE) == oldExpanded,
                    "Fixed-speed switch and fold return to their original state");
            return null;
        });
    }

    private void checkSharedCardLayout() throws Exception {
        Switch fixed = onMain(() -> switchFor(AppConfig.FAN_FIXED_ENABLED));
        UiKit.Fold fold = onMain(this::fixedFold);
        boolean oldLoading = onMain(() -> (Boolean) get(editor, "loading"));
        boolean oldChecked = onMain(fixed::isChecked);
        boolean oldExpanded = onMain(() -> fold.content.getVisibility() == View.VISIBLE);
        boolean tileChecked = onMain(() -> switchFor(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED).isChecked());
        try {
            onMain(() -> {
                set(editor, "loading", true);
                fixed.setChecked(true); fold.sync(); fold.show(true);
                return null;
            });
            settle();
            onMain(() -> {
                View root = activity.getWindow().getDecorView();
                View fixedRow = (View) fixed.getParent();
                View heading = (View) findText(root, "固定档位").getParent();
                View choices = (View) choiceButtons(fixedChoice()).get("1").getParent();
                View tileRow = (View) switchFor(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED).getParent();
                View card = (View) fixedRow.getParent();
                View measurement = directChildContaining((ViewGroup) card.getParent(), findText(root, "本机转速测量"));
                parameterGapDp = gapDp(fixedRow, heading);
                parameterToTileGapDp = gapDp(choices, tileRow);
                measurementCardGapDp = gapDp(card, measurement);
                require(parameterGapDp >= 7.5f && parameterGapDp <= 12.5f,
                        "Fixed-header-to-parameter gap is within 8–12dp without stacked margins: " + parameterGapDp);
                require(parameterToTileGapDp >= -.5f && parameterToTileGapDp <= 12.5f,
                        "Parameter-to-tile gap uses the public compact rhythm: " + parameterToTileGapDp);
                require(measurementCardGapDp >= 7.5f && measurementCardGapDp <= 12.5f,
                        "Merged card-to-measurement gap is within 8–12dp: " + measurementCardGapDp);
                require(heading.getHeight() / activity.getResources().getDisplayMetrics().density >= 43.5f,
                        "Compact parameter spacing retains the full help touch target");
                return null;
            });
            capture("layout-expanded.png");
            onMain(() -> {
                require(fold.arrow.performClick(), "The production fold arrow accepts a collapse tap");
                require(fold.content.getVisibility() == View.GONE && fixed.isChecked(),
                        "Collapsing parameters preserves the enabled fixed-speed feature");
                Switch tile = switchFor(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED);
                require(tile.isShown() && tile.isChecked() == tileChecked,
                        "Collapsing parameters preserves the visible tile row and independent state");
                return null;
            });
            capture("layout-fixed-collapsed.png");
            onMain(() -> {
                fixed.setChecked(false); fold.sync();
                Switch tile = switchFor(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED);
                require(tile.isShown() && tile.isChecked() == tileChecked,
                        "The tile row remains visible with fixed speed disabled");
                return null;
            });
            capture("layout-fixed-disabled.png");
        } finally {
            onMain(() -> {
                fixed.setChecked(oldChecked); fold.sync(); fold.show(oldExpanded);
                set(editor, "loading", oldLoading);
                return null;
            });
            settle();
        }
    }

    private UiKit.Fold fixedFold() {
        Switch fixed = switchFor(AppConfig.FAN_FIXED_ENABLED);
        for (UiKit.Fold fold : folds()) if (fold.control == fixed) return fold;
        throw new AssertionError("Fixed-speed public Fold is missing");
    }

    private float gapDp(View upper, View lower) {
        int[] top = new int[2], bottom = new int[2];
        upper.getLocationInWindow(top); lower.getLocationInWindow(bottom);
        return (bottom[1] - top[1] - upper.getHeight()) / activity.getResources().getDisplayMetrics().density;
    }

    private static View directChildContaining(ViewGroup parent, View descendant) {
        View current = descendant;
        while (current != null && current.getParent() != parent)
            current = current.getParent() instanceof View ? (View) current.getParent() : null;
        return current;
    }

    private void setTile(boolean enabled, AppConfig config) throws Exception {
        String expected = enabled ? "1" : "0";
        onMain(() -> {
            Switch tile = switchFor(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED);
            require(tile.isEnabled(), "Verified tile-enhancement switch accepts input");
            if (tile.isChecked() != enabled) tile.performClick();
            require(tile.isChecked() == enabled, "Tile switch reaches the requested state");
            return null;
        });
        awaitSaved(config, AppConfig.FAN_TILE_ENHANCEMENT_ENABLED, expected);
    }

    private void awaitSaved(AppConfig config, String key, String expected) throws Exception {
        long deadline = SystemClock.elapsedRealtime() + 15_000;
        while (SystemClock.elapsedRealtime() < deadline) {
            test.waitForIdleSync();
            if (expected.equals(config.get(key))
                    && onMain(() -> !(Boolean) get(editor, "dirty") && ((Integer) get(editor, "pendingSaves")) == 0)) return;
            SystemClock.sleep(100);
        }
        throw new AssertionError("Fan editor auto-save did not complete: " + key + "=" + expected);
    }

    private void checkFixedLevels(AppConfig config, Map<String, String> before,
            Map<String, String> oemBefore, boolean hardwareOn) throws Exception {
        require(!FanCalibrationData.validRequest(config.get(ConfigSchema.FAN_CALIBRATION_REQUEST), System.currentTimeMillis()),
                "Fixed-level regression starts with no active measurement request");
        onMain(() -> {
            Switch fixed = switchFor(AppConfig.FAN_FIXED_ENABLED);
            require(fixed.isEnabled(), "Verified fixed-speed switch accepts real user input");
            if (!fixed.isChecked()) fixed.performClick();
            require(fixed.isChecked(), "Fixed-speed switch is enabled through its production click handler");
            for (UiKit.Fold fold : folds()) if (fold.control == fixed) fold.show(true);
            return null;
        });
        awaitSaved(config, AppConfig.FAN_FIXED_ENABLED, "1");
        require(config.getBoolean(ConfigSchema.GAME_MASTER), "Enabling fixed speed automatically enables its runtime scope");
        double previousRpm = 0;
        for (int level = 1; level <= 5; level++) {
            final String selected = String.valueOf(level);
            onMain(() -> {
                Object choice = fixedChoice();
                Button option = choiceButtons(choice).get(selected);
                require(option != null && option.isEnabled() && option.isShown(),
                        "Actual fixed-level choice button is available: " + selected);
                option.requestRectangleOnScreen(new Rect(0, 0, option.getWidth(), option.getHeight()), true);
                require(option.performClick(), "Actual fixed-level button invokes its production handler: " + selected);
                require(selected.equals(get(choice, "selected")), "Production choice state follows the clicked level: " + selected);
                return null;
            });
            awaitSaved(config, ConfigSchema.FAN_FIXED_LEVEL, selected);
            require(selected.equals(config.get(ConfigSchema.FAN_FIXED_LEVEL)), "Automatic save persists the requested hardware level: " + selected);
            require(before.get(ConfigSchema.FAN_MEASUREMENT).equals(config.get(ConfigSchema.FAN_MEASUREMENT))
                            && before.get(ConfigSchema.FAN_CALIBRATION_REQUEST).equals(config.get(ConfigSchema.FAN_CALIBRATION_REQUEST)),
                    "Selecting a fixed level preserves measurement data and requests: " + selected);
            JSONObject result = new JSONObject().put("target", level).put("savedLevel", config.get(ConfigSchema.FAN_FIXED_LEVEL))
                    .put("hardwareChecked", hardwareOn);
            levelCases.put(result);
            if (hardwareOn) {
                double rpm = awaitHardwareLevel(level, result);
                require(rpm > previousRpm + 100, "Measured RPM increases with the requested hardware level: " + previousRpm + " -> " + rpm);
                previousRpm = rpm;
            }
            require(oemBefore.equals(readOemState(test.getTargetContext())),
                    "Selecting a fixed level preserves the OEM fan switch and mode: " + selected);
            capture("level-" + level + "-saved.png");
        }
    }

    private double awaitHardwareLevel(int requested, JSONObject result) throws Exception {
        JSONArray samples = new JSONArray();
        result.put("hardwareSamples", samples);
        long started = SystemClock.elapsedRealtime(), deadline = started + 35_000;
        int streak = 0;
        java.util.ArrayDeque<Integer> recentRpm = new java.util.ArrayDeque<>();
        while (SystemClock.elapsedRealtime() < deadline) {
            int[] observed = readHardware();
            samples.put(new JSONObject().put("enabled", observed[0]).put("level", observed[1]).put("rpm", observed[2])
                    .put("elapsedMs", SystemClock.elapsedRealtime() - started));
            boolean stable = observed[0] == 1 && observed[1] == requested && observed[2] > 500;
            if (stable) {
                streak++;
                recentRpm.addLast(observed[2]);
                if (recentRpm.size() > 3) recentRpm.removeFirst();
            } else {
                streak = 0;
                recentRpm.clear();
            }
            // Allow the rotor to settle; changing only the saved choice cannot satisfy these observations.
            if (streak >= 5 && SystemClock.elapsedRealtime() - started >= 5_000) {
                long total = 0;
                int low = Integer.MAX_VALUE, high = 0;
                for (int rpm : recentRpm) { total += rpm; low = Math.min(low, rpm); high = Math.max(high, rpm); }
                double rpm = total / (double) recentRpm.size();
                if (high - low <= Math.max(300, rpm * .08)) {
                    result.put("observedLevel", observed[1]).put("meanRpm", rpm);
                    require(true, "The running fan reaches the clicked hardware level with stable nonzero RPM: " + requested);
                    return rpm;
                }
            }
            SystemClock.sleep(750);
        }
        throw new AssertionError("Actual fan hardware did not follow the fixed-level choice: " + requested + "; samples=" + samples);
    }

    private int[] readHardware() {
        RootShell.Result hardware = RootShell.run("cat /sys/kernel/fan/fan_enable /sys/kernel/fan/fan_speed_level /sys/kernel/fan/fan_speed_count", null, 5, 512);
        require(hardware.isSuccess(), "Read-only fan hardware observation succeeds");
        String[] values = hardware.output.trim().split("\\s+");
        require(values.length == 3, "Fan hardware returns enable, level and RPM");
        int enabled = FanTilePolicy.parseHardware(values[0], 0, 1);
        int level = FanTilePolicy.parseHardware(values[1], 0, 5);
        int rpm = FanTilePolicy.parseHardware(values[2], 0, 100000);
        require(enabled >= 0 && level >= 0 && rpm >= 0, "Fan hardware observations have valid ranges");
        return new int[]{enabled, level, rpm};
    }

    @SuppressWarnings("unchecked") private Object fixedChoice() {
        Object choice = ((Map<String, ?>) get(editor, "choices")).get(ConfigSchema.FAN_FIXED_LEVEL);
        require(choice != null, "Fixed levels use the real editor choice model");
        return choice;
    }

    @SuppressWarnings("unchecked") private Map<String, Button> choiceButtons(Object choice) {
        return (Map<String, Button>) get(choice, "values");
    }

    private void assertIndependent(AppConfig config, Map<String, String> before, Map<String, String> oemBefore) {
        Map<String, String> actual = new LinkedHashMap<>(config.snapshot());
        Map<String, String> expected = new LinkedHashMap<>(before);
        actual.remove(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED); expected.remove(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED);
        require(expected.equals(actual), "Changing tile enhancement preserves every other configuration key, including fixed speed and GAME_MASTER");
        require(oemBefore.equals(readOemState(test.getTargetContext())), "Changing tile enhancement preserves the OEM fan switch and mode");
    }

    private void checkHelp(String title, String expected, String screenshot, AppConfig config) throws Exception {
        Map<String, String> beforeHelp = new LinkedHashMap<>(config.snapshot());
        onMain(() -> {
            View help = findDescription(activity.getWindow().getDecorView(), "查看" + title + "说明");
            require(help != null && help.isEnabled(), "The public help button is available: " + title);
            help.performClick();
            return null;
        });
        settle();
        AccessibilityNodeInfo window = test.getUiAutomation().getRootInActiveWindow();
        require(window != null && accessibleText(window).contains(expected), "The accessible help dialog contains the complete corresponding explanation: " + title);
        capture(screenshot);
        require(beforeHelp.equals(config.snapshot()), "Opening help changes no configuration: " + title);
        test.sendKeyDownUpSync(KeyEvent.KEYCODE_BACK); settle();
        require(beforeHelp.equals(config.snapshot()), "Closing help changes no configuration: " + title);
    }

    private Map<String, String> readOemState(Context context) {
        LinkedHashMap<String, String> result = new LinkedHashMap<>();
        result.put("manual", String.valueOf(Settings.System.getInt(context.getContentResolver(), "fan_state_of_manual", -1)));
        result.put("mode", String.valueOf(Settings.System.getInt(context.getContentResolver(), "fan_state_of_mode", -1)));
        RootShell.Result hardware = RootShell.run("cat /sys/kernel/fan/fan_enable", null, 5, 128);
        if (isModel("NX809J")) require(hardware.isSuccess() && hardware.output.trim().matches("[01]"), "Read-only OEM fan-enable observation is available");
        result.put("enable", hardware.isSuccess() ? hardware.output.trim() : "unavailable");
        return result;
    }

    private void restoreOemState(Context context, Map<String, String> before) {
        Map<String, String> current = readOemState(context);
        for (String name : new String[]{"mode", "manual"}) {
            if (before.get(name).equals(current.get(name))) continue;
            int value = Integer.parseInt(before.get(name));
            require(value >= -1 && value <= 10, "Saved OEM fan setting has a valid restore value: " + name);
            String key = "mode".equals(name) ? "fan_state_of_mode" : "fan_state_of_manual";
            RootShell.Result restored = RootShell.run(value == -1
                    ? "settings delete system " + key
                    : "settings put system " + key + " " + value, null, 5, 512);
            require(restored.isSuccess(), "The original OEM fan setting is restored: " + name);
        }
        if (!"unavailable".equals(before.get("enable"))) {
            long deadline = SystemClock.elapsedRealtime() + 5_000;
            while (SystemClock.elapsedRealtime() < deadline) {
                if (before.get("enable").equals(readOemState(context).get("enable"))) return;
                SystemClock.sleep(250);
            }
            require(before.get("enable").matches("[01]"), "Saved fan-enable state has a valid restore value");
            RootShell.Result restored = RootShell.run("echo " + before.get("enable") + " > /sys/kernel/fan/fan_enable", null, 5, 512);
            require(restored.isSuccess(), "The original hardware fan-enable state is restored");
        }
    }

    private void revealTile() throws Exception {
        onMain(() -> {
            View card = (View) switchFor(AppConfig.FAN_TILE_ENHANCEMENT_ENABLED).getParent().getParent();
            card.requestRectangleOnScreen(new Rect(0, 0, card.getWidth(), card.getHeight()), true);
            return null;
        }); settle();
    }
    private Switch switchFor(String key) { return (Switch) activity.getWindow().getDecorView().findViewWithTag("config:" + key); }
    @SuppressWarnings("unchecked") private List<UiKit.Fold> folds() { return (List<UiKit.Fold>) get(editor, "folds"); }
    private void discardPendingSave() {
        ((Handler) get(editor, "main")).removeCallbacks((Runnable) get(editor, "statusAutoSave"));
        set(editor, "dirty", false);
    }
    private static boolean isModel(String model) {
        return model.equalsIgnoreCase(android.os.Build.MODEL) || model.equalsIgnoreCase(android.os.Build.DEVICE)
                || model.equalsIgnoreCase(android.os.Build.PRODUCT);
    }
    private static View findText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            View found = findText(((ViewGroup) view).getChildAt(i), text); if (found != null) return found;
        }
        return null;
    }
    private static View findDescription(View view, String text) {
        if (text.contentEquals(view.getContentDescription() == null ? "" : view.getContentDescription())) return view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            View found = findDescription(((ViewGroup) view).getChildAt(i), text); if (found != null) return found;
        }
        return null;
    }
    private static String accessibleText(AccessibilityNodeInfo node) {
        StringBuilder text = new StringBuilder(node.getText() == null ? "" : node.getText());
        for (int i = 0; i < node.getChildCount(); i++) {
            AccessibilityNodeInfo child = node.getChild(i); if (child != null) text.append('\n').append(accessibleText(child));
        }
        return text.toString();
    }
    private void capture(String name) throws Exception {
        settle(); Bitmap bitmap = test.getUiAutomation().takeScreenshot(); require(bitmap != null, "Screenshot is available");
        File file = new File(directory, name);
        try (FileOutputStream output = new FileOutputStream(file)) { require(bitmap.compress(Bitmap.CompressFormat.PNG, 100, output), "Screenshot is encoded"); }
        finally { bitmap.recycle(); }
        screenshots.put(file.getAbsolutePath());
    }
    private void settle() { SystemClock.sleep(220); test.waitForIdleSync(); }
    private void require(boolean value, String message) { checks++; if (!value) throw new AssertionError(message); }
    private interface Main<T> { T run() throws Exception; }
    private <T> T onMain(Main<T> action) throws Exception {
        AtomicReference<T> result = new AtomicReference<>(); AtomicReference<Throwable> error = new AtomicReference<>();
        test.runOnMainSync(() -> { try { result.set(action.run()); } catch (Throwable problem) { error.set(problem); } });
        if (error.get() != null) throw new AssertionError("Fan UI action failed", error.get()); return result.get();
    }
    private static Object get(Object target, String name) {
        try { Field field = target.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(target); }
        catch (Exception error) { throw new AssertionError(error); }
    }
    private static void set(Object target, String name, Object value) {
        try { Field field = target.getClass().getDeclaredField(name); field.setAccessible(true); field.set(target, value); }
        catch (Exception error) { throw new AssertionError(error); }
    }
}
