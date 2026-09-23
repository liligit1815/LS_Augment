package ls.augment.com;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.Spanned;
import android.text.style.URLSpan;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Installed only in the instrumentation APK. Exercises navigation without changing Hook configuration.
 * The launcher icon switch is toggled and its exact package-manager state is restored.
 * Consent clicks are synthetic test input; the complete original preference is restored.
 */
final class UiNavigationRegression implements Application.ActivityLifecycleCallbacks {
    private final Instrumentation instrumentation;
    private final Context context;
    private final Application application;
    private final boolean suppressEnvironmentProbe;
    private final List<Activity> activities = new ArrayList<>();
    private final JSONArray cases = new JSONArray();
    private final JSONArray screenshots = new JSONArray();
    private final JSONObject report = new JSONObject();
    private volatile Activity resumed;
    private volatile Throwable lifecycleFailure;
    private File directory;
    private SharedPreferences consent;
    private String consentName, versionKey;

    private UiNavigationRegression(Instrumentation instrumentation) {
        this(instrumentation, true);
    }

    private UiNavigationRegression(Instrumentation instrumentation, boolean suppressEnvironmentProbe) {
        this.instrumentation = instrumentation;
        this.suppressEnvironmentProbe = suppressEnvironmentProbe;
        context = instrumentation.getTargetContext();
        application = (Application) context.getApplicationContext();
    }

    static JSONObject run(Instrumentation instrumentation) throws Exception {
        return new UiNavigationRegression(instrumentation).execute();
    }

    /** Three clean delivery captures with the device's real environment status. */
    static JSONObject runPreview(Instrumentation instrumentation) throws Exception {
        return new UiNavigationRegression(instrumentation, false).executePreview();
    }

    private JSONObject executePreview() throws Exception {
        directory = new File(context.getExternalFilesDir(null), "ui-redesign");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IllegalStateException("Cannot create UI result directory");
        consentName = constant("CONSENT_PREFS");
        versionKey = constant("ACCEPTED_VERSION");
        consent = context.getSharedPreferences(consentName, Context.MODE_PRIVATE);
        Map<String, Object> originalConsent = copy(consent.getAll());
        SharedPreferences mainPreferences = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, Object> originalConfig = copy(mainPreferences.getAll());
        boolean originalNeedsConsent = OnboardingActivity.needsConsent(context);
        write("consent-preview-original.json", new JSONObject().put("preference", consentName)
                .put("originallyNeededConsent", originalNeedsConsent).put("values", typedValues(originalConsent)));
        report.put("operation", "ui-preview").put("moduleVersion", BuildConfig.VERSION_NAME)
                .put("syntheticConsentOnly", true).put("originallyNeededConsent", originalNeedsConsent)
                .put("rootEnvironmentProbe", "real existing application status read")
                .put("featureControlsChanged", false).put("screenshots", screenshots);
        Throwable failure = null;
        application.registerActivityLifecycleCallbacks(this);
        try {
            require(consent.edit().putInt(versionKey, ModuleLegal.VERSION)
                    .putBoolean("ui_navigation_test", true).commit(), "Cannot prepare preview-only consent marker");
            launchSettings();
            Activity home = awaitActivity(SettingsActivity.class, null);
            await(() -> onMain(() -> {
                Field loading = SettingsActivity.class.getDeclaredField("environmentLoading");
                loading.setAccessible(true);
                return loading.getBoolean(home) ? null : Boolean.TRUE;
            }), "real module environment status");
            // Let a pre-authorized Root provider's transient status toast finish naturally.
            SystemClock.sleep(2500);
            testColdHome(home);
            screenshot("60-preview-home");
            clickDescription(home, "设置");
            requireNavigation(home, "设置");
            screenshot("61-preview-settings");
            clickDescription(home, "关于");
            requireNavigation(home, "关于");
            screenshot("62-preview-about");
        } catch (Throwable error) {
            failure = error;
            report.put("failure", android.util.Log.getStackTraceString(error));
        } finally {
            try { finishAll(); } catch (Throwable cleanup) { if (failure == null) failure = cleanup; }
            application.unregisterActivityLifecycleCallbacks(this);
            boolean restored = restore(consent, originalConsent)
                    && originalConsent.equals(copy(consent.getAll()))
                    && originalNeedsConsent == OnboardingActivity.needsConsent(context);
            boolean unchanged = originalConfig.equals(copy(mainPreferences.getAll()));
            report.put("consentRestoredExactly", restored).put("mainConfigurationUnchanged", unchanged)
                    .put("resultDirectory", directory.getAbsolutePath());
            if (!restored && failure == null) failure = new AssertionError("Preview did not restore original consent");
            if (!unchanged && failure == null) failure = new AssertionError("Preview changed main configuration");
            report.put("status", failure == null ? "pass" : "fail");
            write("ui-preview-report.json", report);
        }
        if (failure != null) throw new AssertionError("UI preview failed; report: "
                + new File(directory, "ui-preview-report.json"), failure);
        return report;
    }

    private JSONObject execute() throws Exception {
        directory = new File(context.getExternalFilesDir(null), "ui-redesign");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IllegalStateException("Cannot create UI result directory");
        consentName = constant("CONSENT_PREFS");
        versionKey = constant("ACCEPTED_VERSION");
        consent = context.getSharedPreferences(consentName, Context.MODE_PRIVATE);
        Map<String, Object> originalConsent = copy(consent.getAll());
        SharedPreferences mainPreferences = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, Object> originalConfig = copy(mainPreferences.getAll());
        boolean originalNeedsConsent = OnboardingActivity.needsConsent(context);
        // A process crash cannot run Java finally. Keep a small, typed consent-only recovery
        // record on disk before test injection; never persist the user's main configuration here.
        JSONObject recovery = new JSONObject().put("preference", consentName)
                .put("originallyNeededConsent", originalNeedsConsent)
                .put("values", typedValues(originalConsent));
        write("consent-original.json", recovery);
        report.put("moduleVersion", BuildConfig.VERSION_NAME)
                .put("consentPreference", consentName)
                .put("originallyNeededConsent", originalNeedsConsent)
                .put("syntheticConsentOnly", true)
                .put("rootEnvironmentProbe", "skipped through temporary Activity memory state")
                .put("featureControlsChanged", false).put("featureControlsScope", "Hook configuration")
                .put("launcherAliasTemporarilyToggled", false).put("launcherAliasRestored", true)
                .put("cases", cases).put("screenshots", screenshots);
        Throwable failure = null;
        application.registerActivityLifecycleCallbacks(this);
        try {
            // This marker is confined to the consent preference and removed in finally.
            require(consent.edit().remove(versionKey).remove("accepted_at")
                    .putBoolean("ui_navigation_test", true).commit(), "Cannot prepare synthetic consent state");
            require(OnboardingActivity.needsConsent(context), "Missing consent must require first use");
            launchSettings();
            Activity welcome = awaitActivity(OnboardingActivity.class, null);
            testInitialAnimation((OnboardingActivity) welcome);
            requireText(welcome, "欢迎使用\nLS_Augment");
            screenshot("01-welcome");
            clickText(welcome, "阅读并开始");
            requireText(welcome, "开始之前");
            Button disabled = button(welcome, "同意并继续");
            require(!onMain(() -> disabled.isEnabled()), "Consent action was enabled before checking");
            onMain(() -> { disabled.performClick(); return null; });
            require(OnboardingActivity.needsConsent(context), "Unchecked synthetic click recorded consent");
            screenshot("02-agreement-unchecked");
            clickText(welcome, "不同意，退出");
            awaitNoActivities();
            require(OnboardingActivity.needsConsent(context), "Declining recorded consent");
            passed("first-use-disabled-and-decline");

            testAnimationLifecycle();

            launchSettings();
            Activity reading = awaitActivity(OnboardingActivity.class, welcome);
            testAnimationSkip((OnboardingActivity) reading);
            clickText(reading, "阅读并开始");
            CheckBox box = onMain(() -> findType(reading.getWindow().getDecorView(), CheckBox.class));
            require(box != null && !onMain(() -> box.isChecked()), "Consent was checked by default");
            onMain(() -> { box.performClick(); return null; });
            require(onMain(() -> buttonDirect(reading, "同意并继续").isEnabled()), "Checking did not enable consent action");
            onMain(() -> { reading.recreate(); return null; });
            Activity recreated = awaitActivity(OnboardingActivity.class, reading);
            require(!onMain(() -> ((OnboardingActivity) recreated).animationVisible()),
                    "Agreement recreation replayed the opening animation");
            requireText(recreated, "开始之前");
            require(onMain(() -> findType(recreated.getWindow().getDecorView(), CheckBox.class).isChecked()),
                    "Recreation lost checked state");
            require(onMain(() -> buttonDirect(recreated, "同意并继续").isEnabled()), "Recreation disabled checked consent");
            screenshot("03-agreement-recreated");
            clickText(recreated, "同意并继续");
            Activity home = awaitActivity(SettingsActivity.class, null);
            require(!OnboardingActivity.needsConsent(context), "Synthetic agreement did not finish first use");
            require(consent.getInt(versionKey, -1) == ModuleLegal.VERSION, "Wrong accepted agreement version");
            passed("first-use-explicit-agreement-and-recreation");
            finishAll();
            launchSettings();
            home = awaitActivity(SettingsActivity.class, null);
            require(!(resumed instanceof OnboardingActivity), "Current agreement version unexpectedly reopened first use");
            require(consent.edit().putInt(versionKey, ModuleLegal.VERSION - 1).commit(), "Cannot test previous version");
            require(OnboardingActivity.needsConsent(context), "Previous agreement version must request confirmation");
            require(consent.edit().putInt(versionKey, ModuleLegal.VERSION).commit(), "Cannot resume navigation test state");
            passed("versioned-consent-gate");

            requireNavigation(home, "主页");
            requireText(home, "应用配置");
            require(HookAppCatalog.targets().size() == 18, "Expected 18 application destinations");
            testColdHome(home);
            screenshot("04-home");
            testLiquidGlassBackdrop(home);
            testThemedApplicationIcons(home);
            testFeatureHelpMetadata();
            testFeatureHelpInteractions(home);
            testSearch(home);
            testSearchPositionAndSectionRestore(home);
            testTargets(home);
            testSettings(home);
            home = testAbout(home);
            clickDescription(home, "主页");
            requireNavigation(home, "主页");
            screenshot("30-home-returned");
        } catch (Throwable error) {
            failure = error;
            report.put("failure", android.util.Log.getStackTraceString(error));
            try { screenshot("99-failure"); } catch (Throwable ignored) { }
        } finally {
            try { finishAll(); } catch (Throwable cleanup) { if (failure == null) failure = cleanup; }
            application.unregisterActivityLifecycleCallbacks(this);
            boolean restored = restore(consent, originalConsent)
                    && originalConsent.equals(copy(consent.getAll()))
                    && originalNeedsConsent == OnboardingActivity.needsConsent(context);
            report.put("consentRestoredExactly", restored);
            if (!restored && failure == null) failure = new AssertionError("Original consent preference was not restored");
            Map<String, Object> finalConfig = copy(mainPreferences.getAll());
            boolean configPreserved = originalConfig.equals(finalConfig);
            report.put("mainConfigurationUnchanged", configPreserved);
            if (!configPreserved) {
                Set<String> changed = new LinkedHashSet<>(originalConfig.keySet());
                changed.addAll(finalConfig.keySet());
                changed.removeIf(key -> java.util.Objects.equals(originalConfig.get(key), finalConfig.get(key)));
                report.put("changedConfigurationKeys", new JSONArray(changed));
                if (failure == null) failure = new AssertionError("Opening UI changed configuration: " + changed);
            }
            report.put("status", failure == null ? "pass" : "fail");
            report.put("resultDirectory", directory.getAbsolutePath());
            write("ui-navigation-report.json", report);
        }
        if (failure != null) throw new AssertionError("UI navigation failed; report: "
                + new File(directory, "ui-navigation-report.json"), failure);
        return report;
    }

    private void awaitWelcome(OnboardingActivity activity) {
        await(() -> onMain(() -> !activity.animationVisible()
                && findText(activity.getWindow().getDecorView(), "阅读并开始", false) != null
                ? Boolean.TRUE : null), "welcome after opening animation");
    }

    private void testInitialAnimation(OnboardingActivity activity) throws Exception {
        Map<String, Object> before = copy(consent.getAll());
        if (!onMain(ValueAnimator::areAnimatorsEnabled)) {
            awaitWelcome(activity);
            require(!onMain(activity::animationVisible), "Animation ignored the current reduced-motion setting");
            passed("first-start-respects-disabled-system-animations");
            return;
        }
        require(onMain(activity::animationVisible), "Enabled first-start animation did not appear");
        int first = onMain(activity::positionMs);
        await(() -> onMain(() -> activity.animationVisible() && activity.positionMs() >= first + 400
                ? Boolean.TRUE : null), "original RedMagic animation advances");
        require(!hasText(activity, "阅读并开始"), "Welcome appeared before the animation completed");
        screenshot("00-redmagic-start");
        final int[] lastPosition = {onMain(activity::positionMs)};
        await(() -> onMain(() -> {
            lastPosition[0] = Math.max(lastPosition[0], activity.positionMs());
            return !activity.animationVisible() ? Boolean.TRUE : null;
        }), "original RedMagic animation completes normally");
        require(lastPosition[0] >= 1750, "Opening animation ended early: " + lastPosition[0] + " ms");
        awaitWelcome(activity);
        require(before.equals(copy(consent.getAll())) && OnboardingActivity.needsConsent(context),
                "Opening animation recorded agreement");
        passed("redmagic-opening-advances-and-completes-before-welcome", new JSONObject()
                .put("observedPositionMs", lastPosition[0]).put("consentUnchanged", true));
    }

    private void testAnimationSkip(OnboardingActivity activity) throws Exception {
        Map<String, Object> before = copy(consent.getAll());
        boolean animations = onMain(ValueAnimator::areAnimatorsEnabled);
        if (animations) {
            require(onMain(activity::animationVisible), "Opening animation is absent before skip");
            clickDescription(activity, "跳过开场动画");
        }
        awaitWelcome(activity);
        require(before.equals(copy(consent.getAll())) && OnboardingActivity.needsConsent(context),
                "Skipping the opening animation recorded agreement");
        passed("opening-skip-keeps-consent-unaccepted", new JSONObject().put("skipExercised", animations));
    }

    /** Cover real Activity recreation and another opaque Activity stopping the video. */
    private void testAnimationLifecycle() throws Exception {
        if (!onMain(ValueAnimator::areAnimatorsEnabled)) return;
        Map<String, Object> before = copy(consent.getAll());
        launchSettings();
        OnboardingActivity original = (OnboardingActivity) awaitActivity(OnboardingActivity.class, null);
        await(() -> onMain(() -> original.animationVisible() && original.positionMs() >= 300
                ? Boolean.TRUE : null), "playback before recreation");
        int savedPosition = onMain(() -> { int value = original.positionMs(); original.recreate(); return value; });
        OnboardingActivity rotated = (OnboardingActivity) awaitActivity(OnboardingActivity.class, original);
        require(onMain(rotated::animationVisible), "Recreating an unfinished opening discarded playback");
        require(onMain(rotated::positionMs) >= savedPosition - 50, "Recreation restarted the opening at zero");
        await(() -> onMain(() -> rotated.positionMs() >= savedPosition + 100 ? Boolean.TRUE : null),
                "playback continues from the restored position");
        // This existing, read-only help Activity creates an actual pause/stop transition.
        onMain(() -> { rotated.startActivity(new Intent(rotated, ModuleHelpActivity.class)); return null; });
        Activity covering = awaitActivity(ModuleHelpActivity.class, rotated);
        await(() -> onMain(() -> !rotated.hasWindowFocus() ? Boolean.TRUE : null), "opening loses foreground");
        int stopped = onMain(rotated::positionMs);
        SystemClock.sleep(450);
        require(Math.abs(onMain(rotated::positionMs) - stopped) <= 40,
                "Opening animation kept playing behind another Activity");
        clickDescription(covering, "返回上一页");
        awaitSame(rotated);
        require(onMain(rotated::positionMs) >= savedPosition - 50, "Returning from background restarted playback");
        awaitWelcome(rotated);
        require(before.equals(copy(consent.getAll())), "Animation lifecycle changed agreement state");
        clickText(rotated, "暂不使用");
        awaitNoActivities();
        passed("opening-recreation-and-background-pause", new JSONObject()
                .put("savedPositionMs", savedPosition).put("pausedPositionMs", stopped)
                .put("consentUnchanged", true));
    }

    /** Check every public option, including entries that are not visible on this device. */
    private void testFeatureHelpMetadata() throws Exception {
        int count = 0, numeric = 0, choices = 0;
        Set<String> checked = new LinkedHashSet<>();
        for (EnhancementOption option : EnhancementCatalog.options()) {
            if (option.kind == EnhancementOption.Kind.INTERNAL) continue;
            String help = FeatureHelp.forOption(option);
            require(help != null && !help.trim().isEmpty(), "Missing feature explanation: " + option.key);
            require(!help.trim().equals("关闭后恢复原厂行为；个别组件需重启系统界面。"),
                    "Generic placeholder remains for " + option.key);
            require(!help.contains("TODO") && !help.contains("待补充") && !help.contains("暂无说明"),
                    "Unfinished feature explanation: " + option.key);
            require(checked.add(option.key), "Duplicate explained option: " + option.key);
            if (option.kind == EnhancementOption.Kind.INTEGER || option.kind == EnhancementOption.Kind.DECIMAL) {
                require(help.contains(numberText(option.minimum)) && help.contains(numberText(option.maximum)),
                        "Explanation omits numeric limits for " + option.key);
                require(help.contains("默认"), "Explanation omits default for " + option.key);
                numeric++;
            }
            if (option.kind == EnhancementOption.Kind.CHOICE) {
                for (String choice : option.choices) require(help.contains(choice),
                        "Explanation omits choice " + choice + " for " + option.key);
                require(help.contains("默认"), "Explanation omits default choice for " + option.key);
                choices++;
            }
            count++;
        }
        require(count == 204, "Expected explanations for all 204 public options, got " + count);
        passed("feature-help-complete-catalog", new JSONObject().put("publicOptions", count)
                .put("numericOptionsWithLimits", numeric).put("choiceOptionsWithValues", choices));
    }

    private static String numberText(double number) {
        return java.math.BigDecimal.valueOf(number).stripTrailingZeros().toPlainString();
    }

    private EnhancementOption option(String key) {
        for (EnhancementOption option : EnhancementCatalog.options()) if (key.equals(option.key)) return option;
        throw new AssertionError("Missing option " + key);
    }

    /** Clicking the nearby ! must only open an explanation, never operate its setting. */
    private void testFeatureHelpInteractions(Activity home) throws Exception {
        EnhancementOption brightness = option(SystemUiOptions.QS_BRIGHTNESS_PERCENT);
        setSearch(home, brightness.title);
        clickText(home, "系统界面");
        Activity booleanPage = awaitDifferent(home);
        require(booleanPage instanceof EnhancementSettingsActivity, "Boolean help opened wrong editor");
        testHelpDialog(booleanPage, brightness.title, FeatureHelp.forOption(brightness),
                new String[]{"百分比"}, "70-help-boolean");
        requireFeatureTextSize(booleanPage, brightness.title);
        clickDescription(booleanPage, "返回上一页");
        awaitSame(home);
        setSearch(home, "");

        clickDescription(home, "设置");
        // The appearance editor remains available internally for its explanation test;
        // it is no longer a standalone entry in the Settings navigation.
        onMain(() -> { EnhancementSettingsActivity.open(home, "appearance"); return null; });
        Activity choicePage = awaitDifferent(home);
        EnhancementOption appearance = option(AppearanceOptions.THEME);
        testHelpDialog(choicePage, appearance.title, FeatureHelp.forOption(appearance),
                new String[]{"冰蓝浅色", "冰蓝深色", "跟随系统"}, "71-help-choice");
        requireFeatureTextSize(choicePage, appearance.title);
        clickDescription(choicePage, "返回上一页");
        awaitSame(home);
        requireNavigation(home, "设置");

        clickDescription(home, "主页");
        setSearch(home, "com.mi.health");
        clickText(home, "小米运动健康");
        Activity complexPage = awaitDifferent(home);
        require(complexPage instanceof HealthSettingsActivity, "Complex help opened wrong editor");
        testHelpDialog(complexPage, "当日步数上限", null,
                new String[]{"步数", "上限"}, "72-help-complex");
        requireFeatureTextSize(complexPage, "当日步数上限");
        clickDescription(complexPage, "返回上一页");
        awaitSame(home);
        setSearch(home, "");
        requireNavigation(home, "主页");
        passed("help-dialogs-do-not-change-boolean-choice-or-complex-configuration");
    }

    private void testHelpDialog(Activity activity, String title, String expectedBody,
            String[] requiredFragments, String captureName) throws Exception {
        SharedPreferences preferences = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, Object> before = copy(preferences.getAll());
        Map<View, Object> controls = onMain(() -> controlValues(activity.getWindow().getDecorView()));
        View help = onMain(() -> findDescription(activity.getWindow().getDecorView(), "查看" + title + "说明"));
        require(help != null && onMain(() -> help.isClickable() && help.isEnabled()),
                "Missing enabled explanation button: " + title);
        require(!(help instanceof CompoundButton), "Explanation is implemented by the feature switch: " + title);
        onMain(() -> {
            help.requestRectangleOnScreen(new Rect(0, 0, help.getWidth(), help.getHeight()), true);
            return null;
        });
        ScrollView scroll = onMain(() -> parentScroll(help));
        if (scroll != null) awaitStableWindow(activity, scroll);
        require(onMain(() -> substantiallyVisible(help)), "Explanation button cannot be reached: " + title);
        require(onMain(() -> {
            View label = help.getParent() instanceof View
                    ? findText((View) help.getParent(), title, false) : null;
            if (label == null || label == help) return false;
            int[] labelPosition = new int[2], helpPosition = new int[2];
            label.getLocationInWindow(labelPosition);
            help.getLocationInWindow(helpPosition);
            return helpPosition[0] >= labelPosition[0] + label.getWidth() - 1
                    && Math.min(labelPosition[1] + label.getHeight(), helpPosition[1] + help.getHeight())
                    > Math.max(labelPosition[1], helpPosition[1]);
        }), "Explanation button does not follow its title on the same row: " + title);
        int beforeY = scroll == null ? 0 : onMain(() -> scroll.getScrollY());
        clickDescription(activity, "查看" + title + "说明");
        String dialogText = await(() -> {
            AccessibilityNodeInfo root = instrumentation.getUiAutomation().getRootInActiveWindow();
            if (root == null) return null;
            try {
                String text = accessibilityText(root);
                return text.contains(title) && hasAccessibleText(root, "知道了") ? text : null;
            } finally { root.recycle(); }
        }, "feature explanation dialog for " + title);
        for (String fragment : requiredFragments) require(dialogText.contains(fragment),
                "Wrong explanation for " + title + ": missing " + fragment);
        if (expectedBody != null) require(normalizeWhitespace(dialogText).contains(normalizeWhitespace(expectedBody)),
                "Explanation does not present this option's complete metadata: " + title);
        screenshot(captureName);
        require(clickActiveWindowText("知道了"), "Cannot close explanation: " + title);
        instrumentation.waitForIdleSync();
        awaitSame(activity);
        // This exceeds the existing 600 ms auto-save debounce, exposing an accidental
        // switch event or draft mutation instead of checking only the immediate frame.
        SystemClock.sleep(750);
        instrumentation.waitForIdleSync();
        require(before.equals(copy(preferences.getAll())), "Explanation changed saved configuration: " + title);
        require(controls.equals(onMain(() -> controlValues(activity.getWindow().getDecorView()))),
                "Explanation changed a switch, selection, slider or input: " + title);
        if (scroll != null) require(Math.abs(onMain(() -> scroll.getScrollY()) - beforeY) <= 2,
                "Closing explanation moved away from its feature: " + title);
        passed("help-" + captureName, new JSONObject().put("title", title)
                .put("configurationUnchanged", true).put("controlsChecked", controls.size()));
    }

    private void requireFeatureTextSize(Activity activity, String title) {
        TextView label = onMain(() -> {
            View help = findDescription(activity.getWindow().getDecorView(), "查看" + title + "说明");
            View view = help != null && help.getParent() instanceof View
                    ? findText((View) help.getParent(), title, false) : null;
            return view instanceof TextView ? (TextView) view : null;
        });
        require(label != null, "Missing feature title: " + title);
        float sp = onMain(() -> label.getTextSize() / label.getResources().getDisplayMetrics().scaledDensity);
        require(sp <= 13f, "Feature title is still too large: " + title + " = " + sp + " sp");
    }

    private static Map<View, Object> controlValues(View root) {
        Map<View, Object> values = new LinkedHashMap<>();
        collectControlValues(root, values);
        return values;
    }

    private static void collectControlValues(View view, Map<View, Object> values) {
        if (view instanceof CompoundButton) values.put(view, ((CompoundButton) view).isChecked());
        else if (view instanceof EditText) values.put(view, ((EditText) view).getText().toString());
        else if (view instanceof SeekBar) values.put(view, ((SeekBar) view).getProgress());
        else if (view instanceof Spinner) values.put(view, ((Spinner) view).getSelectedItemPosition());
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++)
            collectControlValues(((ViewGroup) view).getChildAt(i), values);
    }

    private static String normalizeWhitespace(String value) { return value.replaceAll("\\s+", " ").trim(); }

    private static String accessibilityText(AccessibilityNodeInfo node) {
        StringBuilder result = new StringBuilder();
        if (node.getText() != null) result.append(node.getText()).append('\n');
        for (int i = 0; i < node.getChildCount(); i++) {
            AccessibilityNodeInfo child = node.getChild(i);
            if (child == null) continue;
            try { result.append(accessibilityText(child)); } finally { child.recycle(); }
        }
        return result.toString();
    }

    private static boolean hasAccessibleText(AccessibilityNodeInfo root, String text) {
        List<AccessibilityNodeInfo> found = root.findAccessibilityNodeInfosByText(text);
        boolean matches = false;
        for (AccessibilityNodeInfo node : found) {
            matches |= text.contentEquals(node.getText() == null ? "" : node.getText());
            node.recycle();
        }
        return matches;
    }

    private boolean clickActiveWindowText(String text) {
        AccessibilityNodeInfo root = instrumentation.getUiAutomation().getRootInActiveWindow();
        if (root == null) return false;
        try {
            List<AccessibilityNodeInfo> found = root.findAccessibilityNodeInfosByText(text);
            boolean clicked = false;
            for (AccessibilityNodeInfo node : found) {
                if (!clicked && text.contentEquals(node.getText() == null ? "" : node.getText())
                        && node.isClickable() && node.isEnabled()) clicked = node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                node.recycle();
            }
            return clicked;
        } finally { root.recycle(); }
    }

    private void testSearch(Activity home) throws Exception {
        setSearch(home, "com.mi.health");
        requireText(home, "小米运动健康");
        requireText(home, "1 个应用");
        require(!hasText(home, "系统框架"), "Package search retained unrelated app");
        screenshot("05-search-package");
        setSearch(home, "时钟");
        requireText(home, "系统界面");
        requireText(home, "系统桌面");
        require(!hasText(home, "小米运动健康"), "Feature search retained unrelated health app");
        screenshot("06-search-feature");
        setSearch(home, "ui_navigation_no_match_20260911");
        requireTextContaining(home, "没有找到相关应用或功能");
        screenshot("07-search-empty");
        clickDescription(home, "清除搜索");
        requireText(home, "18 个应用");
        passed("search-package-feature-empty-clear");
    }

    private void testColdHome(Activity home) throws Exception {
        ScrollView scroll = onMain(() -> parentScroll(findDescription(
                home.getWindow().getDecorView(), "搜索应用或功能")));
        require(scroll != null, "Missing home scroll container");
        awaitStableWindow(home, scroll);
        require(onMain(() -> scroll.getScrollY()) == 0, "Cold home did not start at the top");
        TextView title = onMain(() -> (TextView) findText(home.getWindow().getDecorView(), "主页", false));
        require(title != null, "Missing home title");
        float titleSp = onMain(() -> title.getTextSize() / title.getResources().getDisplayMetrics().scaledDensity);
        require(titleSp <= 24.5f, "Home title is still oversized: " + titleSp + " sp");
        if (Build.VERSION.SDK_INT >= 30) require(onMain(() -> {
            WindowInsets insets = home.getWindow().getDecorView().getRootWindowInsets();
            return insets != null && !insets.isVisible(WindowInsets.Type.ime());
        }), "Keyboard appeared automatically on cold home");
        passed("cold-home-top-and-keyboard-hidden", new JSONObject().put("scrollY", 0)
                .put("titleSp", titleSp)
                .put("imeAssertion", Build.VERSION.SDK_INT >= 30 ? "hidden" : "unavailable-before-api30"));
    }

    /** Compare the framework's current themed icons without changing the device theme. */
    private void testThemedApplicationIcons(Activity home) throws Exception {
        require(home instanceof SettingsActivity, "Icon test requires the existing home Activity");
        SettingsActivity settings = (SettingsActivity) home;
        SharedPreferences preferences = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, Object> before = copy(preferences.getAll());
        ScrollView scroll = onMain(() -> parentScroll(findDescription(
                home.getWindow().getDecorView(), "搜索应用或功能")));
        require(scroll != null, "Missing home scroll container for application icons");
        int originalY = onMain(scroll::getScrollY);
        await(() -> onMain(() -> settings.iconGeneration() > 0 ? Boolean.TRUE : null),
                "application icon inventory applied to home");
        awaitStableWindow(home, scroll);
        int initialGeneration = onMain(settings::iconGeneration);
        JSONArray installed = new JSONArray(), absent = new JSONArray(), comparisons = new JSONArray();
        for (HookAppCatalog.Target target : HookAppCatalog.targets()) {
            onMain(() -> { requirePlainApplicationIcon(home, target); return null; });
            String packageName = installedIconPackage(target);
            (packageName == null ? absent : installed).put(target.id);
        }
        require(HookAppCatalog.targets().size() == 18, "Icon coverage must include all 18 destinations");
        HookAppCatalog.Target system = HookAppCatalog.find(HookAppCatalog.SYSTEM);
        require("system".equals(system.packageName), "Display icon selection changed the framework hook scope");
        onMain(() -> { requireCurrentThemedIcon(home, system, "android"); return null; });
        for (String targetId : new String[]{HookAppCatalog.SETTINGS, HookAppCatalog.THEME, HookAppCatalog.STORE}) {
            HookAppCatalog.Target target = HookAppCatalog.find(targetId);
            String packageName = installedIconPackage(target);
            if (packageName == null) {
                comparisons.put(new JSONObject().put("target", targetId)
                        .put("comparison", "application not installed on this device"));
                continue;
            }
            onMain(() -> { requireCurrentThemedIcon(home, target, packageName); return null; });
            int previousGeneration = onMain(settings::iconGeneration);
            clickText(home, target.title);
            Activity detail = awaitDifferent(home);
            if (detail instanceof EnhancementSettingsActivity) {
                require(targetId.equals(detail.getIntent().getStringExtra("target")),
                        "Icon refresh test opened the wrong application configuration: " + targetId);
            } else {
                List<HookAppCatalog.Entry> entries = HookAppCatalog.entries(targetId);
                require(detail instanceof FeatureActivity && entries.size() == 1
                                && entries.get(0).route.equals(detail.getIntent().getStringExtra(FeatureActivity.EXTRA_MODULE)),
                        "Icon refresh test opened the wrong dedicated editor: " + targetId);
            }
            clickDescription(detail, "返回上一页");
            awaitSame(home);
            requireNavigation(home, "主页");
            await(() -> onMain(() -> settings.iconGeneration() > previousGeneration ? Boolean.TRUE : null),
                    "current theme icons refreshed after returning from " + targetId);
            awaitStableWindow(home, scroll);
            // The async load rebuilds rows; look up the newly applied ImageView each time.
            onMain(() -> { requireCurrentThemedIcon(home, target, packageName); return null; });
            comparisons.put(new JSONObject().put("target", targetId).put("package", packageName)
                    .put("pixelsMatchCurrentPackageManagerIcon", true)
                    .put("generationBefore", previousGeneration)
                    .put("generationAfter", onMain(settings::iconGeneration)));
        }
        // Refreshes must retain the same styling for every row, including offscreen rows.
        for (HookAppCatalog.Target target : HookAppCatalog.targets())
            onMain(() -> { requirePlainApplicationIcon(home, target); return null; });
        onMain(() -> { scroll.scrollTo(0, originalY); return null; });
        awaitStableWindow(home, scroll);
        require(before.equals(copy(preferences.getAll())), "Application icon refresh changed saved configuration");
        passed("themed-application-icons-and-resume-refresh", new JSONObject()
                .put("destinationsChecked", HookAppCatalog.targets().size())
                .put("installedTargets", installed).put("uninstalledTargets", absent)
                .put("currentThemeComparisons", comparisons).put("initialGeneration", initialGeneration)
                .put("systemDisplayIconPackage", "android").put("systemHookScope", system.packageName)
                .put("finalGeneration", onMain(settings::iconGeneration))
                .put("sameHomeActivity", true).put("deviceThemeChanged", false)
                .put("mainConfigurationUnchanged", true));
    }

    /** The framework package represents the system icon, not the hook's process name. */
    private String installedIconPackage(HookAppCatalog.Target target) throws Exception {
        List<String> packages = HookAppCatalog.SYSTEM.equals(target.id)
                ? Arrays.asList("android") : target.packages;
        for (String packageName : packages) {
            try {
                require(context.getPackageManager().getApplicationIcon(packageName) != null,
                        "Installed package returned no icon: " + packageName);
                return packageName;
            } catch (PackageManager.NameNotFoundException ignored) { }
        }
        return null;
    }

    /** Runs on the UI thread; View.VISIBLE/isShown includes children outside the viewport. */
    private static ImageView requirePlainApplicationIcon(Activity home, HookAppCatalog.Target target) {
        View view = home.getWindow().getDecorView().findViewWithTag("hook-app-icon:" + target.id);
        require(view instanceof ImageView, "Missing application ImageView: " + target.id);
        ImageView icon = (ImageView) view;
        require(icon.isShown(), "Application icon is hidden: " + target.id);
        require(icon.getDrawable() != null, "Application icon is empty: " + target.id);
        require(icon.getBackground() == null, "Application icon has an extra background: " + target.id);
        require(icon.getPaddingLeft() == 0 && icon.getPaddingTop() == 0
                        && icon.getPaddingRight() == 0 && icon.getPaddingBottom() == 0,
                "Application icon has extra padding: " + target.id);
        require(icon.getImageTintList() == null && icon.getColorFilter() == null,
                "Application icon has an extra tint: " + target.id);
        require(icon.getImageAlpha() == 255, "Application icon has reduced opacity: " + target.id);
        return icon;
    }

    /** Draw the displayed drawable at its existing bounds; never modify the original View. */
    private void requireCurrentThemedIcon(Activity home, HookAppCatalog.Target target,
            String packageName) throws Exception {
        ImageView icon = requirePlainApplicationIcon(home, target);
        Drawable actual = icon.getDrawable();
        Rect actualBounds = new Rect(actual.getBounds());
        require(actualBounds.width() > 0 && actualBounds.height() > 0,
                "Application icon has not been laid out: " + target.id);
        Drawable expected = context.getPackageManager().getApplicationIcon(packageName);
        // Some framework implementations cache instances as well as constant states.
        // Isolate the reference before setting bounds if the same object was returned.
        if (expected == actual) {
            require(expected.getConstantState() != null, "Cannot isolate reference icon: " + packageName);
            expected = expected.getConstantState().newDrawable(context.getResources()).mutate();
        }
        expected.setBounds(actualBounds);
        Bitmap actualPixels = Bitmap.createBitmap(actualBounds.width(), actualBounds.height(), Bitmap.Config.ARGB_8888);
        Bitmap expectedPixels = Bitmap.createBitmap(actualBounds.width(), actualBounds.height(), Bitmap.Config.ARGB_8888);
        try {
            Canvas actualCanvas = new Canvas(actualPixels);
            actualCanvas.translate(-actualBounds.left, -actualBounds.top);
            actual.draw(actualCanvas);
            Canvas expectedCanvas = new Canvas(expectedPixels);
            expectedCanvas.translate(-actualBounds.left, -actualBounds.top);
            expected.draw(expectedCanvas);
            require(actualPixels.sameAs(expectedPixels),
                    "Home icon differs from the current themed PackageManager icon: " + packageName);
            require(icon.getDrawable() == actual && actualBounds.equals(actual.getBounds()),
                    "Icon pixel comparison modified the displayed drawable: " + packageName);
        } finally {
            actualPixels.recycle();
            expectedPixels.recycle();
        }
    }

    /** The floating navigation must sample the actual scrolling content below it. */
    private void testLiquidGlassBackdrop(Activity home) throws Exception {
        await(() -> onMain(() -> ((SettingsActivity) home).iconGeneration() > 0 ? Boolean.TRUE : null),
                "themed icons before glass capture");
        LiquidGlassLayout glass = onMain(() -> (LiquidGlassLayout) home.getWindow().getDecorView()
                .findViewWithTag("liquid-glass-navigation"));
        require(glass != null, "Home has no content-sampling liquid-glass navigation");
        ScrollView scroll = onMain(() -> parentScroll(findDescription(
                home.getWindow().getDecorView(), "搜索应用或功能")));
        require(scroll != null, "Missing home content behind liquid glass");
        awaitStableWindow(home, scroll);
        await(() -> onMain(() -> glass.captureGeneration() > 0 ? Boolean.TRUE : null),
                "initial liquid-glass backdrop capture");
        int initialGeneration = onMain(glass::captureGeneration);
        long initialSignature = onMain(glass::backdropSignature);
        boolean hardware = onMain(glass::isHardwareAccelerated);
        boolean optical = onMain(glass::opticalEffectActive);
        if (Build.VERSION.SDK_INT >= 33 && hardware) require(optical,
                "API 33+ hardware window did not activate the optical refraction effect");
        List<LiquidGlassLayout> cards = onMain(() -> {
            List<LiquidGlassLayout> found = new ArrayList<>();
            collectGlass(home.getWindow().getDecorView(), found);
            found.remove(glass);
            found.removeIf(card -> !card.getGlobalVisibleRect(new Rect()));
            return found;
        });
        require(cards.size() >= 2, "Home does not use glass for multiple content cards");
        await(() -> onMain(() -> {
            for (LiquidGlassLayout card : cards) if (card.captureGeneration() == 0) return null;
            return Boolean.TRUE;
        }), "content cards share a prepared backdrop");
        Object sharedBitmap = onMain(() -> field(cards.get(0), "bitmap"));
        Object sharedScene = onMain(() -> ((UiKit) field(cards.get(0), "ui")).appearance.glassScene);
        require(sharedBitmap != null && sharedScene != null, "Content cards have no shared background");
        for (LiquidGlassLayout card : cards) onMain(() -> {
            require(Boolean.TRUE.equals(field(card, "contentSurface")), "Unexpected content glass kind");
            require(field(card, "bitmap") == sharedBitmap, "Content card allocated an independent background bitmap");
            require(((UiKit) field(card, "ui")).appearance.glassScene == sharedScene,
                    "Content card does not share the page's GlassScene");
            if (Build.VERSION.SDK_INT >= 33 && card.isHardwareAccelerated())
                require(card.opticalEffectActive(), "Content card did not enable optical refraction");
            return null;
        });
        LiquidGlassLayout movingCard = cards.get(cards.size() - 1);
        long originalCardSignature = onMain(movingCard::backdropSignature);
        int originalY = onMain(scroll::getScrollY);
        int cardStep = Math.round(context.getResources().getDisplayMetrics().density * 72);
        onMain(() -> { scroll.scrollTo(0, originalY + cardStep); return null; });
        awaitStableWindow(home, scroll);
        require(onMain(() -> movingCard.getGlobalVisibleRect(new Rect())),
                "Small glass movement unexpectedly hid the sampled content card");
        require(onMain(movingCard::backdropSignature) != originalCardSignature,
                "Small scrolling did not move the visible card's shared-background sampling");
        require(onMain(() -> field(movingCard, "bitmap")) == sharedBitmap,
                "Small scrolling replaced the shared content bitmap");
        onMain(() -> { scroll.scrollTo(0, Math.max(scroll.getHeight(), 1)); return null; });
        awaitStableWindow(home, scroll);
        int movedY = onMain(scroll::getScrollY);
        require(movedY > originalY, "Home content did not scroll for the glass test");
        await(() -> onMain(() -> glass.captureGeneration() > initialGeneration
                && glass.backdropSignature() != initialSignature ? Boolean.TRUE : null),
                "new application content sampled behind liquid glass");
        int movedGeneration = onMain(glass::captureGeneration);
        long movedSignature = onMain(glass::backdropSignature);
        for (String id : new String[]{HookAppCatalog.SETTINGS, HookAppCatalog.THEME, HookAppCatalog.STORE}) {
            HookAppCatalog.Target target = HookAppCatalog.find(id);
            String packageName = installedIconPackage(target);
            if (packageName != null) onMain(() -> {
                requireCurrentThemedIcon(home, target, packageName); return null;
            });
        }
        screenshot("73-liquid-glass-scrolled");
        onMain(() -> { scroll.scrollTo(0, originalY); return null; });
        awaitStableWindow(home, scroll);
        await(() -> onMain(() -> glass.captureGeneration() > movedGeneration
                && glass.backdropSignature() != movedSignature ? Boolean.TRUE : null),
                "liquid-glass backdrop after returning home to the top");
        requireNavigation(home, "主页");
        passed("liquid-glass-resamples-scrolling-content", new JSONObject()
                .put("initialGeneration", initialGeneration).put("scrolledGeneration", movedGeneration)
                .put("initialSignature", initialSignature).put("scrolledSignature", movedSignature)
                .put("scrolledY", movedY).put("opticalEffectActive", optical)
                .put("contentCards", cards.size()).put("sharedSceneAndBitmap", true)
                .put("themeIconsUnchanged", true)
                .put("hardwareAccelerated", hardware).put("androidApi", Build.VERSION.SDK_INT));
    }

    private static void collectGlass(View view, List<LiquidGlassLayout> found) {
        if (view instanceof LiquidGlassLayout) found.add((LiquidGlassLayout) view);
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++)
            collectGlass(((ViewGroup) view).getChildAt(i), found);
    }

    private static Object field(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(target);
    }

    private void testSearchPositionAndSectionRestore(Activity home) throws Exception {
        EnhancementOption brightness = null;
        HookAppCatalog.Section lockscreen = null;
        for (HookAppCatalog.Section section : HookAppCatalog.sections(HookAppCatalog.SYSTEM_UI)) {
            if ("lockscreen".equals(section.id)) lockscreen = section;
            for (EnhancementOption option : section.options)
                if (SystemUiOptions.QS_BRIGHTNESS_PERCENT.equals(option.key)) brightness = option;
        }
        require(brightness != null && brightness.title.contains("百分比"), "Missing brightness percentage option");
        require(lockscreen != null, "Missing SystemUI lockscreen section");
        final String query = brightness.title; // Current source title: 亮度显示百分比.
        final String sectionTitle = lockscreen.title;
        setSearch(home, query);
        requireText(home, "系统界面");
        clickText(home, "系统界面");
        Activity detail = awaitDifferent(home);
        require(detail instanceof EnhancementSettingsActivity, "SystemUI search did not open the application page");
        require(HookAppCatalog.SYSTEM_UI.equals(detail.getIntent().getStringExtra("target")), "Search opened another target");
        require(query.equals(detail.getIntent().getStringExtra("query")), "Search text was not passed to the application page");
        View option = onMain(() -> findText(detail.getWindow().getDecorView(), query, false));
        require(option != null, "Search option is absent from SystemUI page");
        ScrollView scroll = onMain(() -> parentScroll(option));
        require(scroll != null, "Missing SystemUI scroll container");
        awaitStableWindow(detail, scroll);
        int queryY = onMain(() -> scroll.getScrollY());
        require(queryY > 0, "Search did not position the page at the matching option");
        require(onMain(() -> substantiallyVisible(option)), "Matching option is outside the visible viewport");
        screenshot("08-search-systemui-position");

        clickDescription(detail, "跳转到" + sectionTitle);
        awaitStableWindow(detail, scroll);
        View heading = onMain(() -> findSectionHeading(detail.getWindow().getDecorView(), sectionTitle));
        require(heading != null && onMain(() -> substantiallyVisible(heading)), "Section button did not reveal its heading");
        int sectionY = onMain(() -> scroll.getScrollY());
        require(sectionY > queryY, "Lockscreen section jump did not advance past the brightness option");
        screenshot("09-systemui-section-jump");

        onMain(() -> { detail.recreate(); return null; });
        Activity recreated = awaitActivity(EnhancementSettingsActivity.class, detail);
        View restoredHeading = onMain(() -> findSectionHeading(recreated.getWindow().getDecorView(), sectionTitle));
        require(restoredHeading != null, "Recreated SystemUI page lost its section heading");
        ScrollView restoredScroll = onMain(() -> parentScroll(restoredHeading));
        require(restoredScroll != null, "Recreated SystemUI page lost its scroll container");
        awaitStableWindow(recreated, restoredScroll);
        int restoredY = onMain(() -> restoredScroll.getScrollY());
        int tolerance = Math.max(2, Math.round(context.getResources().getDisplayMetrics().density * 2));
        require(Math.abs(restoredY - sectionY) <= tolerance,
                "Recreation lost scroll position: " + sectionY + " -> " + restoredY);
        require(onMain(() -> substantiallyVisible(restoredHeading)), "Recreation scrolled away from the chosen section");
        screenshot("09b-systemui-recreated");
        clickDescription(recreated, "返回上一页");
        awaitSame(home);
        requireNavigation(home, "主页");
        setSearch(home, "");
        passed("systemui-search-section-and-scroll-recreation", new JSONObject().put("query", query)
                .put("section", sectionTitle).put("queryScrollY", queryY)
                .put("sectionScrollY", sectionY).put("restoredScrollY", restoredY));
    }

    private void testTargets(Activity home) throws Exception {
        int number = 10;
        for (HookAppCatalog.Target target : HookAppCatalog.targets()) {
            clickText(home, target.title);
            Activity detail = awaitDifferent(home);
            require(!(detail instanceof OnboardingActivity), "Consent unexpectedly reopened for " + target.id);
            if (detail instanceof EnhancementSettingsActivity) {
                require(target.id.equals(detail.getIntent().getStringExtra("target")), "Wrong target route: " + target.id);
                requireText(detail, target.title);
            } else if (HookAppCatalog.HEALTH.equals(target.id)) {
                require(detail instanceof HealthSettingsActivity, "Health did not open its dedicated editor");
                requireText(detail, "步数修改");
                requireText(detail, "当日步数上限");
            } else {
                require(detail instanceof FeatureActivity, "Unexpected destination for " + target.id);
                String route = detail.getIntent().getStringExtra(FeatureActivity.EXTRA_MODULE);
                boolean owned = false;
                for (HookAppCatalog.Entry entry : HookAppCatalog.entries(target.id)) owned |= entry.route.equals(route);
                require(owned && !FeatureActivity.MODULE_SHOULDER.equals(route), "Unexpected or unsafe direct editor: " + route);
            }
            int textCount = onMain(() -> textCount(detail.getWindow().getDecorView()));
            require(textCount >= 3, "Destination has too little content: " + target.id);
            screenshot(String.format(java.util.Locale.ROOT, "%02d-target-%s", number++, target.id));
            clickDescription(detail, "返回上一页");
            awaitSame(home);
            requireNavigation(home, "主页");
            passed("target-" + target.id, new JSONObject().put("activity", detail.getClass().getSimpleName())
                    .put("textViews", textCount).put("returnedHome", true));
        }
    }

    private void testSettings(Activity home) throws Exception {
        clickDescription(home, "设置");
        requireNavigation(home, "设置");
        String[] labels = {"作用域同步", "备份与还原"};
        for (String label : new String[]{"桌面图标", "作用域同步", "备份与还原", "日志及运行诊断"}) requireText(home, label);
        for (String removed : new String[]{"额外作用域", "界面外观", "运行诊断", "帮助"})
            require(!hasText(home, removed), "Settings still contains a removed standalone entry: " + removed);
        android.content.ComponentName alias = new android.content.ComponentName(context, context.getPackageName() + ".LauncherAlias");
        int aliasBefore = context.getPackageManager().getComponentEnabledSetting(alias);
        boolean expectedIconVisible = aliasBefore == PackageManager.COMPONENT_ENABLED_STATE_DEFAULT
                ? context.getPackageManager().getActivityInfo(alias, PackageManager.MATCH_DISABLED_COMPONENTS).enabled
                : aliasBefore == PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
        onMain(() -> {
            View value = home.getWindow().getDecorView().findViewWithTag("settings-launcher-icon-switch");
            require(value instanceof android.widget.Switch && value.isEnabled() && value.isClickable(),
                    "Settings must expose the launcher icon as an operable inline switch");
            require(((android.widget.Switch) value).isChecked() == expectedIconVisible,
                    "Inline launcher icon switch differs from the actual package alias state");
            return null;
        });
        report.put("launcherAliasRestored", false).put("launcherAliasOriginalState", aliasBefore);
        try {
            for (int step = 0; step < 2; step++) {
                boolean expectedVisible = step == 0 ? !expectedIconVisible : expectedIconVisible;
                onMain(() -> {
                    android.widget.Switch toggle = home.getWindow().getDecorView()
                            .findViewWithTag("settings-launcher-icon-switch");
                    require(toggle != null && toggle.isEnabled() && toggle.isClickable(),
                            "Launcher icon switch is not available for clicking");
                    // CompoundButton toggles before super.performClick(); a missing
                    // OnClickListener may return false even when the toggle succeeds.
                    toggle.performClick();
                    report.put("launcherAliasTemporarilyToggled", true);
                    int expectedState = expectedVisible ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                            : PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
                    require(context.getPackageManager().getComponentEnabledSetting(alias) == expectedState
                            && toggle.isChecked() == expectedVisible,
                            "Launcher icon switch did not update the actual alias enabled state");
                    require(resumed == home && !home.isFinishing(), "Launcher icon switch opened a subpage or closed Settings");
                    return null;
                });
                instrumentation.waitForIdleSync();
                require(resumed == home && !home.isFinishing(), "Launcher icon switch navigated away from Settings");
                requireNavigation(home, "设置");
            }
        } finally {
            boolean restored = onMain(() -> {
                context.getPackageManager().setComponentEnabledSetting(alias, aliasBefore, PackageManager.DONT_KILL_APP);
                return context.getPackageManager().getComponentEnabledSetting(alias) == aliasBefore;
            });
            report.put("launcherAliasRestored", restored).put("launcherAliasFinalState",
                    context.getPackageManager().getComponentEnabledSetting(alias));
            require(restored, "Launcher icon test did not restore the exact original alias state");
        }
        screenshot("40-module-settings");
        int index = 41;
        for (String label : labels) {
            clickText(home, label);
            Activity detail = awaitDifferent(home);
            require(!(detail instanceof OnboardingActivity), "Settings reopened onboarding");
            require(onMain(() -> textCount(detail.getWindow().getDecorView())) >= 3, "Empty module setting: " + label);
            if ("作用域同步".equals(label)) {
                await(() -> onMain(() -> findDescription(detail.getWindow().getDecorView(), "查看额外作用域说明")),
                        "scope explanation after reading framework state");
                boolean pending = ModuleScopeService.isSynchronizing();
                testHelpDialog(detail, "额外作用域", null, new String[]{"固定作用域", "不会修改作用域"}, "74-help-scope");
                require(ModuleScopeService.isSynchronizing() == pending, "Scope explanation submitted a scope request");
                requireFeatureTextSize(detail, "额外作用域");
            }
            screenshot((index++) + "-setting");
            clickDescription(detail, "返回上一页");
            awaitSame(home);
            requireNavigation(home, "设置");
        }
        testCompatibilityHelp(home);
        require(context.getPackageManager().getComponentEnabledSetting(alias) == aliasBefore,
                "Settings navigation did not preserve the restored launcher alias state");
        onMain(() -> { home.onBackPressed(); return null; });
        requireNavigation(home, "主页");
        passed("module-settings-inline-icon-and-three-destinations", new JSONObject()
                .put("launcherIconStateMatchesPackageManager", true).put("launcherIconToggleExercised", true)
                .put("launcherIconRoundTrip", true).put("launcherAliasRestored", true).put("standaloneDestinations", 3));
    }

    private Activity testAbout(Activity initialHome) throws Exception {
        Activity home = testAboutMotion(initialHome);
        clickDescription(home, "关于");
        requireNavigation(home, "关于");
        Map<String, Object> consentBefore = copy(consent.getAll());
        DeviceInfo device = new DeviceInfo(context);
        String[] fields = {"设备型号", "安卓版本", "系统版本", "桌面版本"};
        String[] keys = {"name", "model", "android", "system", "launcher"};
        String[] values = {device.name, device.model, device.androidVersion, device.systemVersion, device.launcherVersion};
        ViewGroup hardware = onMain(() -> {
            View card = home.getWindow().getDecorView().findViewWithTag("about-device-card");
            require(card instanceof ViewGroup, "About device card is missing");
            return (ViewGroup) card;
        });
        onMain(() -> {
            require(findText(hardware, "设备名称", false) == null,
                    "Phone name must be shown directly without a device-name label");
            for (int i = 0; i < keys.length; i++) {
                View view = hardware.findViewWithTag("device-info:" + keys[i]);
                require(view instanceof TextView && values[i].contentEquals(((TextView) view).getText()),
                        "Wrong tagged device value: " + keys[i]);
            }
            TextView phoneName = hardware.findViewWithTag("device-info:name");
            for (int i = 0; i < fields.length; i++) {
                View labelView = findText(hardware, fields[i], false);
                require(labelView instanceof TextView, "Missing device label: " + fields[i]);
                TextView label = (TextView) labelView;
                TextView value = hardware.findViewWithTag("device-info:" + keys[i + 1]);
                require(value.getTextSize() > label.getTextSize(),
                        "Device value should be larger than its small label: " + fields[i]);
                require(phoneName.getTextSize() > label.getTextSize(), "Phone name is not visually emphasized");
                int[] labelPosition = new int[2], valuePosition = new int[2];
                label.getLocationInWindow(labelPosition);
                value.getLocationInWindow(valuePosition);
                require(valuePosition[1] >= labelPosition[1] + label.getHeight() - 1,
                        "Device label must appear above its value: " + fields[i]);
            }
            View legalView = home.getWindow().getDecorView().findViewWithTag("about-legal-card");
            require(legalView instanceof ViewGroup, "Terms and privacy must share one legal card");
            View terms = findText(legalView, "用户协议", false);
            View privacy = findText(legalView, "隐私政策", false);
            require(terms != null && privacy != null, "Shared legal card is missing an entry");
            while (!terms.isClickable() && terms.getParent() instanceof View) terms = (View) terms.getParent();
            while (!privacy.isClickable() && privacy.getParent() instanceof View) privacy = (View) privacy.getParent();
            require(terms != privacy && terms != legalView && privacy != legalView
                    && terms.isClickable() && terms.isEnabled() && privacy.isClickable() && privacy.isEnabled(),
                    "Terms and privacy must retain separate enabled click targets");
            return null;
        });
        testLiveDeviceInformation(home);
        for (String text : Arrays.asList(BuildConfig.VERSION_NAME + " | " + BuildConfig.BUILD_TYPE,
                "当前设备", "开发者", "贡献者", "支持",
                "liligit1815", "问题反馈、版本查询，请点击前往 GitHub",
                "用户协议", "隐私政策", "您可以在此处捐赠以支持我们。")) requireText(home, text);
        for (String removed : new String[]{"帮助", "日志及运行诊断", "项目地址", "设备名称", "问题反馈", "发布记录", "卒迹", "绀漓|Sevtnge", "绀漓丨Sevtinge", "红魔助手开发团队", "HyperCeiler开发团队"})
            require(!hasText(home, removed), "About still contains a removed inline entry: " + removed);
        onMain(() -> {
            View profile = home.getWindow().getDecorView().findViewWithTag("about-developer-profile");
            require(profile instanceof ViewGroup && profile.isClickable(), "Missing independent developer profile");
            ImageView avatar = findType(profile, ImageView.class);
            require(avatar != null && avatar.getDrawable() != null, "Missing developer avatar");
            Bitmap actual = drawableCopyPixels(avatar.getDrawable());
            Bitmap expected = drawableCopyPixels(context.getDrawable(R.drawable.avatar_liligit1815));
            Bitmap module = drawableCopyPixels(context.getDrawable(R.drawable.ic_ls_augment_boat));
            try {
                require(actual.sameAs(expected), "Developer image is not the packaged avatar");
                require(!actual.sameAs(module), "Developer avatar reuses the module logo");
            } finally { actual.recycle(); expected.recycle(); module.recycle(); }
            return null;
        });
        screenshot("50-about");
        scrollToText(home, "当前设备");
        screenshot("52-about-device");
        scrollToText(home, "开发者");
        screenshot("53-about-support");
        testDeveloperProjectLink(home);
        testContributorsPage(home);
        testSupportPage(home);
        testLegalDocument(home, "用户协议", new String[]{"使用前请了解", "签名不一致覆盖仅用于可信 APK"},
                "本地信息与用途", "51-terms-review");
        testLegalDocument(home, "隐私政策", new String[]{"本地信息与用途", "本模块未申请网络权限"},
                "使用前请了解", "54-privacy-review");
        requireNavigation(home, "关于");
        require(consentBefore.equals(copy(consent.getAll())) && !OnboardingActivity.needsConsent(context),
                "Reviewing About changed consent");
        passed("about-hardware-developer-and-legal-review", new JSONObject()
                .put("deviceLayout", "name-plus-four-stacked-values")
                .put("legalLinksShareCard", true).put("separateProjectAddress", false));
        return home;
    }

    /** The brand is a fixed sibling of the list, with independent scroll-linked fades. */
    private Activity testAboutMotion(Activity home) throws Exception {
        SharedPreferences preferences = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, Object> configBefore = copy(preferences.getAll());
        Map<String, Object> consentBefore = copy(consent.getAll());
        clickDescription(home, "主页");
        AboutScrollView scroll = aboutScroll(home);
        onMain(() -> { scroll.scrollTo(0, dp(110)); return null; });
        awaitStableWindow(home, scroll);
        int homeY = onMain(scroll::getScrollY);
        clickDescription(home, "设置");
        onMain(() -> { scroll.scrollTo(0, dp(55)); return null; });
        awaitStableWindow(home, scroll);
        int settingsY = onMain(scroll::getScrollY);
        clickDescription(home, "关于");
        onMain(() -> { scroll.scrollTo(0, 0); return null; });
        awaitStableWindow(home, scroll);
        onMain(() -> {
            View placeholder = aboutView(home, "placeholder"), hero = aboutView(home, "hero");
            require(parentScroll(placeholder) == scroll, "About list lost its transparent header placeholder");
            require(parentScroll(hero) == null, "About brand scrolls inside the content list instead of its fixed overlay");
            View version = aboutView(home, "version");
            require(version instanceof TextView && ((TextView) version).getMaxLines() == 1,
                    "About version must remain on one line");
            require((BuildConfig.VERSION_NAME + " | " + BuildConfig.BUILD_TYPE)
                    .contentEquals(((TextView) version).getText()), "About version omitted the build type");
            return null;
        });
        float[] fixedBrand = onMain(() -> scaledCenter(aboutView(home, "brand")));
        float[] fixedHero = onMain(() -> scaledCenter(aboutView(home, "hero")));
        JSONArray samples = new JSONArray();
        int[] positions = {0, 95, 210, 240, 389};
        for (int y : positions) {
            int actualY = setAboutY(home, scroll, y);
            require(y == 389 || actualY == dp(y), "About content cannot reach the required intermediate sample: " + y);
            assertAboutMotion(home, scroll, actualY, fixedBrand, fixedHero);
            samples.put(aboutSample(home, scroll).put("requestedDp", y)
                    .put("clampedByContent", actualY < dp(y)));
            if (y == 0) screenshot("90-about-expanded");
            if (y == 210) screenshot("91-about-fading");
            if (y == 389) screenshot("92-about-collapsed");
        }
        for (int y : new int[]{240, 210, 95, 0}) {
            setAboutY(home, scroll, y);
            assertAboutMotion(home, scroll, dp(y), fixedBrand, fixedHero);
        }
        screenshot("93-about-restored");
        passed("about-fixed-header-scroll-fade-and-reverse", new JSONObject().put("samples", samples));
        testAboutPull(home, scroll, fixedBrand, fixedHero);
        testAboutLogoDrag(home, scroll, fixedBrand, fixedHero);

        setAboutY(home, scroll, 210);
        clickDescription(home, "主页");
        awaitStableWindow(home, scroll);
        require(onMain(scroll::getScrollY) == homeY, "About navigation lost the Home scroll position");
        require(onMain(() -> Math.abs(scroll.reboundOffset()) < .5f), "About rebound leaked into Home");
        assertAboutDisposed(home);
        clickDescription(home, "设置");
        awaitStableWindow(home, scroll);
        require(onMain(scroll::getScrollY) == settingsY, "About navigation lost the Settings scroll position");
        assertAboutDisposed(home);
        clickDescription(home, "关于");
        awaitStableWindow(home, scroll);
        assertAboutMotion(home, scroll, dp(210), fixedBrand, fixedHero);
        onMain(() -> { home.recreate(); return null; });
        Activity recreated = awaitActivity(SettingsActivity.class, home);
        AboutScrollView restored = aboutScroll(recreated);
        // Check the first completed layout before the normal screenshot settling delay.
        await(() -> onMain(() -> restored.isLaidOut() && aboutView(recreated, "brand").getWidth() > 0
                ? Boolean.TRUE : null), "first recreated About layout");
        requireNavigation(recreated, "关于");
        assertAboutMotion(recreated, restored, dp(210), fixedBrand, fixedHero);
        awaitStableWindow(recreated, restored);
        assertAboutMotion(recreated, restored, dp(210), fixedBrand, fixedHero);
        setAboutY(recreated, restored, 0);
        assertAboutMotion(recreated, restored, 0, fixedBrand, fixedHero);
        require(configBefore.equals(copy(preferences.getAll())), "About motion changed feature configuration");
        require(consentBefore.equals(copy(consent.getAll())), "About motion changed agreement state");
        passed("about-tab-scroll-memory-and-recreate", new JSONObject().put("homeScrollY", homeY)
                .put("settingsScrollY", settingsY).put("restoredAboutDp", 210)
                .put("firstLayoutCorrect", true).put("preferencesUnchanged", true));
        return recreated;
    }

    private AboutScrollView aboutScroll(Activity activity) {
        return onMain(() -> {
            Object view = field(activity, "scroll");
            require(view instanceof AboutScrollView, "Settings must share the About-aware scroll container");
            return (AboutScrollView) view;
        });
    }

    private static View aboutView(Activity activity, String suffix) {
        View view = activity.getWindow().getDecorView().findViewWithTag("about-motion-" + suffix);
        require(view != null, "Missing About motion view: " + suffix);
        return view;
    }

    private int dp(float value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }

    private int setAboutY(Activity activity, AboutScrollView scroll, int yDp) {
        int expectedY = onMain(() -> {
            require(scroll.getChildCount() == 1 && scroll.isLaidOut(), "About scroll layout is not ready");
            int viewport = scroll.getHeight() - scroll.getPaddingTop() - scroll.getPaddingBottom();
            int maximum = Math.max(0, scroll.getChildAt(0).getHeight() - viewport);
            int target = Math.min(Math.max(0, dp(yDp)), maximum);
            scroll.scrollTo(0, target);
            return target;
        });
        awaitStableWindow(activity, scroll);
        int actualY = onMain(scroll::getScrollY);
        require(actualY == expectedY, "About scroll did not reach its requested or natural maximum position: expected "
                + expectedY + ", actual " + actualY);
        return actualY;
    }

    private JSONObject aboutSample(Activity activity, AboutScrollView scroll) {
        return onMain(() -> new JSONObject().put("scrollY", scroll.getScrollY())
                .put("brandAlpha", aboutView(activity, "brand").getAlpha())
                .put("brandScale", aboutView(activity, "brand").getScaleX())
                .put("versionAlpha", aboutView(activity, "version").getAlpha())
                .put("versionScale", aboutView(activity, "version").getScaleX())
                .put("backgroundAlpha", aboutView(activity, "background").getAlpha())
                .put("titleAlpha", aboutView(activity, "title").getAlpha()));
    }

    private void assertAboutDisposed(Activity activity) {
        onMain(() -> {
            View decor = activity.getWindow().getDecorView();
            require(decor.findViewWithTag("about-motion-hero") == null
                    && decor.findViewWithTag("about-motion-title") == null,
                    "Leaving About retained an overlay above another page");
            assertAboutBackground(activity, 1f);
            return null;
        });
    }

    private static void assertAboutBackground(Activity activity, float expected) throws Exception {
        assertNear(aboutView(activity, "background").getAlpha(), expected, .01f, "About background alpha");
        UiKit ui = (UiKit) field(activity, "ui");
        assertNear(ui.appearance.backdropEmphasis(), expected, .01f, "About background emphasis state");
    }

    private void assertAboutMotion(Activity activity, AboutScrollView scroll, int expectedY,
            float[] fixedBrand, float[] fixedHero) {
        onMain(() -> {
            require(Math.abs(scroll.getScrollY() - expectedY) <= 1, "About scroll was not restored: expected "
                    + expectedY + ", actual " + scroll.getScrollY());
            float y = scroll.getScrollY() / context.getResources().getDisplayMetrics().density;
            float brandProgress = Math.max(0f, Math.min(1f, (y - 190f) / 40f));
            View brand = aboutView(activity, "brand"), version = aboutView(activity, "version");
            assertNear(brand.getAlpha(), 1f - brandProgress, .025f, "About brand alpha at " + y);
            assertNear(brand.getScaleX(), 1f - .1f * brandProgress, .015f, "About brand scaleX at " + y);
            assertNear(brand.getScaleY(), brand.getScaleX(), .001f, "About brand scale is not uniform");
            assertNear(version.getAlpha(), Math.max(0f, 1f - y / 190f), .025f, "About version alpha at " + y);
            assertNear(version.getScaleX(), 1f - .1f * Math.min(1f, y / 389f), .015f,
                    "About version scale at " + y);
            assertNear(version.getScaleY(), version.getScaleX(), .001f, "About version scale is not uniform");
            assertAboutBackground(activity, Math.max(0f, 1f - y / 389f));
            assertNear(aboutView(activity, "title").getAlpha(), y >= 230f ? 1f : 0f, .01f,
                    "Collapsed About title alpha at " + y);
            int[] scrollLocation = new int[2];
            scroll.getLocationOnScreen(scrollLocation);
            assertNear(scaledCenter(aboutView(activity, "title"))[0],
                    scrollLocation[0] + scroll.getWidth() / 2f, dp(2), "About title is not horizontally centered");
            assertFixedCenter(brand, fixedBrand, "About brand was carried by list scrolling");
            assertFixedCenter(aboutView(activity, "hero"), fixedHero, "About hero moved with the list");
            return null;
        });
    }

    /** Screen location includes pivot scaling; comparing centers removes that expected shift. */
    private static float[] scaledCenter(View view) {
        int[] location = new int[2];
        view.getLocationOnScreen(location);
        return new float[]{location[0] + view.getWidth() * view.getScaleX() / 2f,
                location[1] + view.getHeight() * view.getScaleY() / 2f};
    }

    private static void assertFixedCenter(View view, float[] expected, String message) {
        float[] actual = scaledCenter(view);
        assertNear(actual[0], expected[0], 2f, message + " (x)");
        assertNear(actual[1], expected[1], 2f, message + " (y)");
    }

    private static void assertNear(float actual, float expected, float tolerance, String message) {
        require(Math.abs(actual - expected) <= tolerance, message + ": expected " + expected + ", actual " + actual);
    }

    private void testAboutPull(Activity activity, AboutScrollView scroll,
            float[] fixedBrand, float[] fixedHero) throws Exception {
        boolean motionEnabled = ValueAnimator.areAnimatorsEnabled();
        float maximumPull = injectAboutPull(activity, scroll, fixedBrand, fixedHero, false, motionEnabled);
        if (motionEnabled) injectAboutPull(activity, scroll, fixedBrand, fixedHero, true, true);
        passed("about-physical-pull-rebound-fixed-brand", new JSONObject().put("motionEnabled", motionEnabled)
                .put("pulledPixels", maximumPull).put("releaseReturnedToZero", true)
                .put("cancelChecked", motionEnabled));
    }

    private float injectAboutPull(Activity activity, AboutScrollView scroll, float[] fixedBrand,
            float[] fixedHero, boolean cancel, boolean motionEnabled) throws Exception {
        setAboutY(activity, scroll, 0);
        Rect viewport = onMain(() -> {
            require(resumed == activity && activity.hasWindowFocus(), "Gesture target is not the foreground app");
            Rect rect = new Rect();
            require(scroll.getGlobalVisibleRect(rect), "About scroll is not visible for a real pull");
            return rect;
        });
        float x = viewport.left + viewport.width() * .35f;
        float start = viewport.top + viewport.height() * .58f;
        float end = Math.min(viewport.bottom - dp(115), start + dp(160));
        require(end - start > dp(60), "About viewport is too short for the in-app pull gesture");
        long down = SystemClock.uptimeMillis();
        float lastY = start, pulled = 0;
        boolean finished = false;
        injectTouch(down, MotionEvent.ACTION_DOWN, x, start);
        try {
            for (int step = 1; step <= 8; step++) {
                SystemClock.sleep(16);
                lastY = start + (end - start) * step / 8f;
                injectTouch(down, MotionEvent.ACTION_MOVE, x, lastY);
            }
            instrumentation.waitForIdleSync();
            pulled = onMain(scroll::reboundOffset);
            if (motionEnabled) require(pulled > dp(5), "A physical downward drag did not pull the About list");
            else assertNear(pulled, 0f, .5f, "About rebound ignored the system's disabled-animation setting");
            require(pulled <= dp(96) + 1, "About pull exceeded its bounded rebound distance");
            onMain(() -> {
                assertNear(scroll.getChildAt(0).getTranslationY(), scroll.reboundOffset(), .5f,
                        "About rebound did not move the list content");
                return null;
            });
            assertAboutMotion(activity, scroll, 0, fixedBrand, fixedHero);
            if (!cancel) screenshot("94-about-pull");
            injectTouch(down, cancel ? MotionEvent.ACTION_CANCEL : MotionEvent.ACTION_UP, x, lastY);
            finished = true;
        } finally {
            if (!finished) injectTouch(down, MotionEvent.ACTION_CANCEL, x, lastY);
        }
        await(() -> onMain(() -> Math.abs(scroll.reboundOffset()) < .5f ? Boolean.TRUE : null),
                cancel ? "cancel About rebound" : "release About rebound");
        onMain(() -> {
            assertNear(scroll.getChildAt(0).getTranslationY(), 0f, .5f, "About content remained displaced after release");
            return null;
        });
        assertAboutMotion(activity, scroll, 0, fixedBrand, fixedHero);
        return pulled;
    }

    private void injectTouch(long downTime, int action, float x, float y) {
        MotionEvent event = MotionEvent.obtain(downTime, SystemClock.uptimeMillis(), action, x, y, 0);
        event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { require(instrumentation.getUiAutomation().injectInputEvent(event, true), "Cannot inject in-app touch event"); }
        finally { event.recycle(); }
    }

    private void testAboutLogoDrag(Activity activity, AboutScrollView scroll,
            float[] fixedBrand, float[] fixedHero) throws Exception {
        setAboutY(activity, scroll, 0);
        List<Object> tapsBefore = hiddenVersionTapState();
        float[] gesture = onMain(() -> {
            require(resumed == activity && activity.hasWindowFocus(), "Logo gesture target is not the foreground app");
            ImageView logo = findType(aboutView(activity, "brand"), ImageView.class);
            Rect logoRect = new Rect(), viewport = new Rect();
            require(logo != null && logo.isClickable() && logo.getGlobalVisibleRect(logoRect)
                    && scroll.getGlobalVisibleRect(viewport), "Visible About logo is unavailable for dragging");
            float end = Math.max(viewport.top + dp(12), logoRect.exactCenterY() - dp(150));
            require(logoRect.exactCenterY() - end > dp(24), "Insufficient space above the logo for an in-app drag");
            return new float[]{logoRect.exactCenterX(), logoRect.exactCenterY(), end};
        });
        long down = SystemClock.uptimeMillis();
        float lastY = gesture[1];
        boolean finished = false;
        injectTouch(down, MotionEvent.ACTION_DOWN, gesture[0], lastY);
        try {
            for (int step = 1; step <= 8; step++) {
                SystemClock.sleep(20);
                lastY = gesture[1] + (gesture[2] - gesture[1]) * step / 8f;
                injectTouch(down, MotionEvent.ACTION_MOVE, gesture[0], lastY);
            }
            // Let velocity settle before release; this checks dragging rather than flinging.
            SystemClock.sleep(120);
            injectTouch(down, MotionEvent.ACTION_MOVE, gesture[0], lastY);
            injectTouch(down, MotionEvent.ACTION_UP, gesture[0], lastY);
            finished = true;
        } finally {
            if (!finished) injectTouch(down, MotionEvent.ACTION_CANCEL, gesture[0], lastY);
        }
        awaitStableWindow(activity, scroll);
        int movedY = onMain(scroll::getScrollY);
        require(movedY > dp(12), "Dragging upward from the fixed logo did not scroll the list");
        assertAboutMotion(activity, scroll, movedY, fixedBrand, fixedHero);
        require(tapsBefore.equals(hiddenVersionTapState()), "A logo drag was incorrectly recorded as a version tap");
        setAboutY(activity, scroll, 0);
        passed("about-logo-physical-drag-passes-through-overlay", new JSONObject().put("scrolledY", movedY)
                .put("versionTapStateUnchanged", true));
    }

    /** Read the in-memory tap gate without unlocking it or altering the user's state. */
    private List<Object> hiddenVersionTapState() {
        return onMain(() -> {
            List<Object> result = new ArrayList<>();
            for (String name : new String[]{"unlocked", "tapCount", "lastTapAt"}) {
                Field value = HiddenEntrySession.class.getDeclaredField(name);
                value.setAccessible(true);
                result.add(value.get(null));
            }
            return result;
        });
    }

    /** Tap the diagnostics menu entry on Settings without changing a feature control. */
    private void tapSettingsDiagnostics(Activity activity) {
        AboutScrollView scroll = aboutScroll(activity);
        onMain(() -> { scroll.scrollTo(0, scroll.getChildAt(0).getHeight()); return null; });
        awaitStableWindow(activity, scroll);
        Rect bounds = onMain(() -> {
            require(resumed == activity && activity.hasWindowFocus(), "Diagnostics target is not the foreground app");
            View help = findText(activity.getWindow().getDecorView(), "日志及运行诊断", false);
            Rect rect = new Rect();
            require(help != null && substantiallyVisible(help) && help.getGlobalVisibleRect(rect),
                    "Settings diagnostics entry is not visibly tappable");
            return rect;
        });
        long down = SystemClock.uptimeMillis();
        injectTouch(down, MotionEvent.ACTION_DOWN, bounds.exactCenterX(), bounds.exactCenterY());
        try { SystemClock.sleep(70); }
        finally { injectTouch(down, MotionEvent.ACTION_UP, bounds.exactCenterX(), bounds.exactCenterY()); }
    }

    private static Bitmap drawableCopyPixels(Drawable source) {
        require(source != null && source.getConstantState() != null, "Cannot copy packaged image");
        Drawable copy = source.getConstantState().newDrawable().mutate();
        copy.setBounds(0, 0, 96, 96);
        Bitmap bitmap = Bitmap.createBitmap(96, 96, Bitmap.Config.ARGB_8888);
        copy.draw(new Canvas(bitmap));
        return bitmap;
    }

    private void testDeveloperProjectLink(Activity home) throws Exception {
        Map<String, Object> before = copy(consent.getAll());
        AtomicReference<Intent> launched = new AtomicReference<>();
        Instrumentation.ActivityMonitor monitor = new Instrumentation.ActivityMonitor() {
            @Override public Instrumentation.ActivityResult onStartActivity(Intent intent) {
                launched.set(new Intent(intent));
                // Block every launch during this single click, including an incorrect destination.
                return new Instrumentation.ActivityResult(Activity.RESULT_CANCELED, null);
            }
        };
        instrumentation.addMonitor(monitor);
        try {
            click(home, () -> home.getWindow().getDecorView().findViewWithTag("about-developer-profile"),
                    "developer project link");
            Intent intent = launched.get();
            require(intent != null && Intent.ACTION_VIEW.equals(intent.getAction())
                    && "https://github.com/liligit1815/LS_Augment".equals(intent.getDataString()),
                    "Developer card did not target the project GitHub address");
        } finally { instrumentation.removeMonitor(monitor); }
        requireNavigation(home, "关于");
        require(before.equals(copy(consent.getAll())), "Developer link changed agreement state");
        passed("about-developer-project-link-intercepted", new JSONObject().put("externalActivityLaunched", false));
    }

    private void testLiveDeviceInformation(Activity home) throws Exception {
        String systemBefore=android.provider.Settings.System.getString(context.getContentResolver(),
                DeviceInfo.SYSTEM_PHONE_NAME);
        String globalBefore=android.provider.Settings.Global.getString(context.getContentResolver(),
                DeviceInfo.GLOBAL_DEVICE_NAME);
        TextView name=onMain(()->home.getWindow().getDecorView().findViewWithTag("device-info:name"));
        require(name!=null,"About device name field missing");
        AboutScrollView about=aboutScroll(home);
        int y=onMain(about::getScrollY);
        try {
            // Simulate a stale display, then deliver the real provider URI invalidation.
            // The system setting is never written, even temporarily.
            onMain(()->{name.setText("界面测试：等待设备信息刷新");return null;});
            context.getContentResolver().notifyChange(android.provider.Settings.System.getUriFor(
                    DeviceInfo.SYSTEM_PHONE_NAME),null);
            await(()->onMain(()->new DeviceInfo(context).name.contentEquals(name.getText())?Boolean.TRUE:null),
                    "live device information notification refresh");
            require(onMain(about::getScrollY)==y,"Live device refresh moved About scroll position");
            require(java.util.Objects.equals(systemBefore,android.provider.Settings.System.getString(
                    context.getContentResolver(),DeviceInfo.SYSTEM_PHONE_NAME))
                    && java.util.Objects.equals(globalBefore,android.provider.Settings.Global.getString(
                    context.getContentResolver(),DeviceInfo.GLOBAL_DEVICE_NAME)),"Device name setting changed during read-only test");
            require("Phone".equals(DeviceInfo.chooseDeviceName(" Phone ","Model","Fallback")),"System phone-name priority wrong");
            require("Global".equals(DeviceInfo.chooseDeviceName("null"," Global ","Fallback")),"Invalid phone-name fallback wrong");
            require("Fallback".equals(DeviceInfo.chooseDeviceName("unknown"," ","Fallback")),"Missing name fallback wrong");
            passed("about-device-name-live-notification",new JSONObject().put("settingsWritten",false)
                    .put("scrollPreserved",true).put("fiveFieldsMatchCurrentRead",true));
        } finally {
            onMain(()->{ModuleAbout.refreshDevice(home,home.getWindow().getDecorView().findViewWithTag("about-device-card"));return null;});
        }
    }

    private void testContributorsPage(Activity home) throws Exception {
        AboutScrollView scroll = aboutScroll(home);
        clickText(home, "贡献者");
        int originY = onMain(scroll::getScrollY);
        Activity contributors = awaitDifferent(home);
        require("ContributorsActivity".equals(contributors.getClass().getSimpleName()), "Contributors did not open its own page");
        for (String name : new String[]{"贡献者", "卒迹", "绀漓丨Sevtinge", "红魔助手开发团队", "HyperCeiler开发团队"})
            requireText(contributors, name);
        require(!hasText(contributors, "绀漓|Sevtnge"), "Contributor still contains the previous spelling");
        require(!hasText(contributors, "微信") && !hasText(contributors, "支付宝"), "Contribution list contains payment actions");
        screenshot("56-about-contributors");
        returnToAbout(contributors, home, originY);
        passed("about-contributors-secondary-page-and-scroll-return", new JSONObject().put("returnedScrollY", originY));
    }

    private void testSupportPage(Activity home) throws Exception {
        SharedPreferences preferences = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, Object> before = copy(preferences.getAll());
        AboutScrollView scroll = aboutScroll(home);
        clickText(home, "支持");
        int originY = onMain(scroll::getScrollY);
        Activity support = awaitDifferent(home);
        require("SupportActivity".equals(support.getClass().getSimpleName()), "Support did not open its own page");
        requireText(support, "支持");
        TextView description = onMain(() -> {
            View view = support.getWindow().getDecorView().findViewWithTag("support-description");
            require(view instanceof TextView, "Support description missing");
            TextView text = (TextView) view;
            require("感谢您的支持！\n捐赠并不能为您带来特权，但能帮助我继续进行维护。\n您可以在此处联系到我。"
                    .contentEquals(text.getText()), "Support description does not match the requested wording");
            require(text.getText() instanceof Spanned && text.getMovementMethod() != null,
                    "Support email text is not clickable");
            return text;
        });
        ScrollView supportPageScroll = onMain(() -> parentScroll(description));
        require(supportPageScroll != null, "Support content is not in a scrollable page");
        awaitStableWindow(support, supportPageScroll);
        URLSpan emailSpan = onMain(() -> {
            Spanned text = (Spanned) description.getText();
            URLSpan[] links = text.getSpans(0, text.length(), URLSpan.class);
            require(links.length == 1 && "mailto:lililimailq@qq.com".equals(links[0].getURL()),
                    "Support description has an incorrect email destination");
            require("此处".contentEquals(text.subSequence(text.getSpanStart(links[0]), text.getSpanEnd(links[0]))),
                    "Support email link must cover only 此处");
            return links[0];
        });
        AtomicReference<Intent> launched = new AtomicReference<>();
        Instrumentation.ActivityMonitor monitor = new Instrumentation.ActivityMonitor() {
            @Override public Instrumentation.ActivityResult onStartActivity(Intent intent) {
                launched.set(new Intent(intent));
                return new Instrumentation.ActivityResult(Activity.RESULT_CANCELED, null);
            }
        };
        instrumentation.addMonitor(monitor);
        try {
            onMain(() -> { emailSpan.onClick(description); return null; });
            Intent intent = launched.get();
            require(intent != null && Intent.ACTION_SENDTO.equals(intent.getAction())
                    && "mailto:lililimailq@qq.com".equals(intent.getDataString()),
                    "Support email link did not open the expected mailto intent");
        } finally { instrumentation.removeMonitor(monitor); }
        JSONObject columnMetrics = onMain(() -> {
            View view = support.getWindow().getDecorView().findViewWithTag("support-code-columns");
            require(view instanceof LinearLayout, "Support code columns missing");
            LinearLayout columns = (LinearLayout) view;
            require(columns.getOrientation() == LinearLayout.HORIZONTAL && columns.getChildCount() == 2,
                    "Support originals are not arranged in two horizontal columns");
            View left = columns.getChildAt(0), right = columns.getChildAt(1);
            require(left.getWidth() > 0 && right.getWidth() > 0
                    && Math.abs(left.getWidth() - right.getWidth()) <= 1
                    && left.getHeight() > 0 && Math.abs(left.getHeight() - right.getHeight()) <= 1
                    && left.getTop() == right.getTop() && left.getRight() <= right.getLeft(),
                    "Support original columns are not equal width and height, aligned side by side");
            return new JSONObject().put("leftWidth", left.getWidth()).put("rightWidth", right.getWidth())
                    .put("leftHeight", left.getHeight()).put("rightHeight", right.getHeight())
                    .put("gap", right.getLeft() - left.getRight());
        });
        JSONArray images = new JSONArray();
        String[] kinds = {"wechat", "alipay"};
        for (int i = 0; i < kinds.length; i++) {
            String kind = kinds[i];
            ImageView code = onMain(() -> {
                View view = support.getWindow().getDecorView().findViewWithTag("support-" + kind + "-code");
                require(view instanceof ImageView, "Missing original support image: " + kind);
                view.requestRectangleOnScreen(new Rect(0, 0, view.getWidth(), view.getHeight()), true);
                return (ImageView) view;
            });
            ScrollView supportScroll = onMain(() -> parentScroll(code));
            require(supportScroll != null, "Support images are not in a scrollable page");
            awaitStableWindow(support, supportScroll);
            images.put(onMain(() -> {
                int resource = context.getResources().getIdentifier("support_" + kind, "drawable", context.getPackageName());
                require(resource != 0, "Missing packaged original support image: " + kind);
                Drawable expected = context.getDrawable(resource);
                require(expected != null && code.getDrawable() != null, "Support image failed to load: " + kind);
                require(code.getImageTintList() == null && code.getColorFilter() == null,
                        "Support image was recolored: " + kind);
                require(code.getScaleType() == ImageView.ScaleType.FIT_CENTER && code.getAdjustViewBounds(),
                        "Support original is cropped or stretched: " + kind);
                require(!code.isClickable() && !code.isLongClickable(), "Support image unexpectedly starts an external action");
                Bitmap actualPixels = drawableCopyPixels(code.getDrawable()), expectedPixels = drawableCopyPixels(expected);
                try { require(actualPixels.sameAs(expectedPixels), "Support image is not the packaged original: " + kind); }
                finally { actualPixels.recycle(); expectedPixels.recycle(); }
                RectF drawn = new RectF(0, 0, code.getDrawable().getIntrinsicWidth(), code.getDrawable().getIntrinsicHeight());
                code.getImageMatrix().mapRect(drawn);
                View card = (View) code.getParent();
                int columnWidth = card.getWidth() - card.getPaddingLeft() - card.getPaddingRight();
                require(columnWidth > 0 && drawn.width() >= columnWidth * .9f - 2,
                        "Support original does not use its column width: " + kind + " (" + drawn.width() + ")");
                require(drawn.width() <= code.getWidth() - code.getPaddingLeft() - code.getPaddingRight() + 2
                        && drawn.height() <= code.getHeight() - code.getPaddingTop() - code.getPaddingBottom() + 2,
                        "Support original image is clipped: " + kind);
                float originalRatio = (float) code.getDrawable().getIntrinsicWidth() / code.getDrawable().getIntrinsicHeight();
                require(Math.abs(drawn.width() / drawn.height() - originalRatio) < .005f,
                        "Support original aspect ratio changed: " + kind);
                return new JSONObject().put("image", kind).put("drawnWidth", drawn.width())
                        .put("drawnHeight", drawn.height()).put("columnWidth", columnWidth)
                        .put("originalPixelsMatch", true).put("aspectRatioPreserved", true);
            }));
            screenshot(i == 0 ? "57-support-wechat" : "58-support-alipay");
        }
        returnToAbout(support, home, originY);
        require(before.equals(copy(preferences.getAll())), "Viewing support images changed feature configuration");
        passed("about-support-original-images-and-scroll-return", new JSONObject().put("images", images)
                .put("sideBySide", true).put("cardsEqualSize", true).put("cards", columnMetrics)
                .put("emailLinkIntercepted", true)
                .put("externalActivityLaunched", false)
                .put("paymentActionsPerformed", false).put("returnedScrollY", originY));
    }

    private void returnToAbout(Activity child, Activity home, int expectedY) {
        clickDescription(child, "返回上一页");
        awaitSame(home);
        AboutScrollView scroll = aboutScroll(home);
        awaitStableWindow(home, scroll);
        requireNavigation(home, "关于");
        require(onMain(scroll::getScrollY) == expectedY, "Returning to About lost its scroll position: expected "
                +expectedY+", actual "+onMain(scroll::getScrollY));
        DeviceInfo current=new DeviceInfo(context);
        String[] keys={"name","model","android","system","launcher"};
        String[] values={current.name,current.model,current.androidVersion,current.systemVersion,current.launcherVersion};
        onMain(()->{
            for(int i=0;i<keys.length;i++) {
                TextView shown=home.getWindow().getDecorView().findViewWithTag("device-info:"+keys[i]);
                require(shown!=null && values[i].contentEquals(shown.getText()),"Returning to About did not refresh device field "+keys[i]);
            }
            return null;
        });
        onMain(() -> {
            assertAboutBackground(home, Math.max(0f, 1f - expectedY / (389f * context.getResources().getDisplayMetrics().density)));
            return null;
        });
    }

    private void testLegalDocument(Activity home, String title, String[] required,
            String excluded, String capture) throws Exception {
        Map<String, Object> before = copy(consent.getAll());
        clickText(home, title);
        await(() -> {
            AccessibilityNodeInfo root = instrumentation.getUiAutomation().getRootInActiveWindow();
            if (root == null) return null;
            try { return hasAccessibleText(root, title) && hasAccessibleText(root, "关闭") ? Boolean.TRUE : null; }
            finally { root.recycle(); }
        }, "separate legal document: " + title);
        screenshot(capture);
        StringBuilder body = new StringBuilder();
        for (int page = 0; page < 16; page++) {
            AccessibilityNodeInfo root = instrumentation.getUiAutomation().getRootInActiveWindow();
            require(root != null, "Legal document window disappeared");
            boolean advanced;
            try {
                body.append(accessibilityText(root)).append('\n');
                advanced = scrollAccessibleDocument(root);
            } finally { root.recycle(); }
            if (!advanced) break;
            SystemClock.sleep(180);
        }
        String text = body.toString();
        for (String fragment : required) require(text.contains(fragment), title + " omitted: " + fragment);
        require(!text.contains(excluded), title + " incorrectly includes the other document's section");
        require(clickActiveWindowText("关闭"), "Cannot close " + title);
        instrumentation.waitForIdleSync();
        requireNavigation(home, "关于");
        require(before.equals(copy(consent.getAll())), "Reviewing " + title + " changed agreement state");
        passed("separate-legal-document-" + capture, new JSONObject().put("title", title).put("consentUnchanged", true));
    }

    private static boolean scrollAccessibleDocument(AccessibilityNodeInfo node) {
        if (node.isScrollable() && node.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD)) return true;
        for (int i = 0; i < node.getChildCount(); i++) {
            AccessibilityNodeInfo child = node.getChild(i);
            if (child == null) continue;
            boolean moved;
            try { moved = scrollAccessibleDocument(child); } finally { child.recycle(); }
            if (moved) return true;
        }
        return false;
    }

    private void testCompatibilityHelp(Activity home) throws Exception {
        SharedPreferences preferences = context.getSharedPreferences(AppConfig.PREFS, Context.MODE_PRIVATE);
        Map<String, Object> before = copy(preferences.getAll());
        requireNavigation(home, "设置");
        tapSettingsDiagnostics(home);
        AboutScrollView settings = aboutScroll(home);
        int originY = onMain(settings::getScrollY);
        Activity help = awaitActivity(ModuleHelpActivity.class, home);
        for (String text : new String[]{"日志及运行诊断", "框架兼容性", "当前版本兼容性", "修改版桌面兼容性", "日志与诊断"})
            requireText(help, text);
        require(onMain(() -> taggedViewCount(help.getWindow().getDecorView(), "help-menu:")) == 4,
                "Help must show exactly four menu entries");
        require(!hasText(help, "刷新检查") && !hasText(help, "框架连接") && !hasText(help, "设备与系统"),
                "Help menu still contains inline compatibility results");
        screenshot("55-help-menu");
        JSONArray checks = new JSONArray();
        for (String section : new String[]{"framework", "version"}) {
            click(help, () -> help.getWindow().getDecorView().findViewWithTag("help-menu:" + section), section);
            Activity detail = awaitDifferent(help);
            require("CompatibilityDetailsActivity".equals(detail.getClass().getSimpleName())
                    && section.equals(detail.getIntent().getStringExtra("section")), "Help opened the wrong compatibility section");
            awaitCompatibility(detail);
            String[] required = "framework".equals(section)
                    ? new String[]{"框架兼容性", "框架连接", "框架 API", "当前模块加载"}
                    : new String[]{"当前版本兼容性", "系统兼容性", "软件适配情况", "设备与系统", "系统构建", "运行架构"};
            for (String text : required) requireText(detail, text);
            require(!hasText(detail, "framework".equals(section) ? "系统兼容性" : "框架连接"),
                    "Compatibility detail includes another menu's result group");
            int initialGeneration = onMain(() -> (Integer) field(detail, "generation"));
            screenshot("framework".equals(section) ? "80-help-framework" : "81-help-version");
            clickText(detail, "刷新检查");
            awaitCompatibility(detail);
            require(onMain(() -> (Integer) field(detail, "generation")) > initialGeneration,
                    "Compatibility refresh did not perform another check");
            require(before.equals(copy(preferences.getAll())), "Compatibility checking changed module configuration");
            checks.put(new JSONObject().put("section", section).put("initialGeneration", initialGeneration));
            clickDescription(detail, "返回上一页");
            awaitSame(help);
        }
        click(help, () -> help.getWindow().getDecorView().findViewWithTag("help-menu:launcher"), "launcher compatibility");
        Activity launcher = awaitActivity(LauncherCompatibilityActivity.class, help);
        requireText(launcher, "修改版桌面兼容性");
        await(() -> onMain(() -> ((Button) field(launcher, "refresh")).isEnabled()
                && !"正在检测…".contentEquals(((TextView) field(launcher, "result")).getText()) ? Boolean.TRUE : null),
                "complete read-only modified launcher compatibility check");
        screenshot("82-help-launcher");
        clickDescription(launcher, "返回上一页");
        awaitSame(help);
        click(help, () -> help.getWindow().getDecorView().findViewWithTag("help-menu:diagnostics"), "diagnostics");
        Activity diagnostics = awaitActivity(FeatureActivity.class, help);
        require("diagnostics".equals(diagnostics.getIntent().getStringExtra(FeatureActivity.EXTRA_MODULE)),
                "Help diagnostics opened another feature editor");
        requireText(diagnostics, "运行诊断");
        screenshot("83-help-diagnostics");
        clickDescription(diagnostics, "返回上一页");
        awaitSame(help);
        require(before.equals(copy(preferences.getAll())), "Compatibility checking changed module configuration");
        clickDescription(help, "返回上一页");
        awaitSame(home);
        awaitStableWindow(home, settings);
        requireNavigation(home, "设置");
        require(onMain(settings::getScrollY) == originY, "Returning from diagnostics lost the Settings scroll position");
        passed("help-framework-system-software-read-only-refresh", new JSONObject()
                .put("mainConfigurationUnchanged", true).put("checks", checks).put("internalMenuDestinations", 4)
                .put("entryTab", "设置").put("returnedSettingsScrollY", originY));
    }

    private static int taggedViewCount(View view, String prefix) {
        int count = view.getTag() instanceof String && ((String) view.getTag()).startsWith(prefix) ? 1 : 0;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++)
            count += taggedViewCount(((ViewGroup) view).getChildAt(i), prefix);
        return count;
    }

    private void awaitCompatibility(Activity help) {
        await(() -> onMain(() -> {
            Button button = (Button) field(help, "refreshButton");
            TextView checked = (TextView) field(help, "checkedAt");
            return Boolean.FALSE.equals(field(help, "loading")) && button.isEnabled()
                    && "刷新检查".contentEquals(button.getText()) && checked.getText().toString().startsWith("检查时间：")
                    ? Boolean.TRUE : null;
        }), "complete read-only compatibility check");
    }

    private void launchSettings() {
        instrumentation.startActivitySync(new Intent(context, SettingsActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        instrumentation.waitForIdleSync();
    }

    private Activity awaitActivity(Class<? extends Activity> type, Activity previous) {
        return await(() -> resumed != null && resumed != previous && type.isInstance(resumed)
                && !resumed.isFinishing() ? resumed : null, "resume " + type.getSimpleName());
    }

    private Activity awaitDifferent(Activity previous) {
        return await(() -> resumed != null && resumed != previous && !resumed.isFinishing()
                ? resumed : null, "open destination");
    }

    private void awaitSame(Activity expected) {
        await(() -> resumed == expected && !expected.isFinishing() ? expected : null, "return to previous page");
    }

    private void awaitNoActivities() {
        await(() -> onMain(() -> {
            for (Activity activity : activities) if (!activity.isFinishing() && !activity.isDestroyed()) return null;
            return Boolean.TRUE;
        }), "finish all test activities");
    }

    private <T> T await(Task<T> query, String message) {
        long deadline = SystemClock.uptimeMillis() + 10000;
        do {
            if (lifecycleFailure != null) throw new AssertionError("Lifecycle test setup failed", lifecycleFailure);
            try {
                T value = query.run();
                if (value != null) { instrumentation.waitForIdleSync(); return value; }
            } catch (Exception error) { throw new AssertionError(message, error); }
            SystemClock.sleep(50);
        } while (SystemClock.uptimeMillis() < deadline);
        throw new AssertionError("Timed out: " + message);
    }

    private void finishAll() {
        onMain(() -> {
            for (int i = activities.size() - 1; i >= 0; i--) {
                Activity activity = activities.get(i);
                if (!activity.isFinishing() && !activity.isDestroyed()) activity.finish();
            }
            return null;
        });
        awaitNoActivities();
        instrumentation.waitForIdleSync();
        resumed = null;
    }

    private void requireNavigation(Activity activity, String selected) {
        for (String name : new String[]{"主页", "设置", "关于"}) {
            View item = onMain(() -> findDescription(activity.getWindow().getDecorView(), name));
            require(item != null && onMain(() -> item.isClickable()), "Missing clickable navigation: " + name);
            require(onMain(() -> item.isSelected()) == name.equals(selected), "Wrong navigation selection: " + selected);
        }
    }

    private void setSearch(Activity activity, String value) {
        onMain(() -> {
            View search = findDescription(activity.getWindow().getDecorView(), "搜索应用或功能");
            require(search instanceof EditText, "Missing search field");
            ((EditText) search).setText(value);
            return null;
        });
        instrumentation.waitForIdleSync();
    }

    private void scrollToText(Activity activity, String text) {
        onMain(() -> {
            View view = findText(activity.getWindow().getDecorView(), text, false);
            require(view != null, "Cannot scroll to: " + text);
            view.requestRectangleOnScreen(new android.graphics.Rect(0, 0, view.getWidth(), view.getHeight()), true);
            return null;
        });
        instrumentation.waitForIdleSync();
    }

    /** Wait for measured geometry, viewport and IME insets to settle before asserting or capturing. */
    private void awaitStableWindow(Activity activity, ScrollView scroll) {
        instrumentation.waitForIdleSync();
        SystemClock.sleep(250);
        final String[] previous = {null};
        final long[] unchangedSince = {0};
        await(() -> {
            String geometry = onMain(() -> {
                View decor = activity.getWindow().getDecorView();
                if (!decor.isLaidOut() || decor.isLayoutRequested() || decor.getWidth() == 0
                        || scroll.isLayoutRequested()) return null;
                WindowInsets insets = decor.getRootWindowInsets();
                if (insets == null) return null;
                Rect visible = new Rect();
                decor.getWindowVisibleDisplayFrame(visible);
                String ime = Build.VERSION.SDK_INT >= 30
                        ? insets.isVisible(WindowInsets.Type.ime()) + ":" + insets.getInsets(WindowInsets.Type.ime())
                        : "legacy";
                return decor.getWidth() + ":" + decor.getHeight() + ":" + scroll.getScrollY()
                        + ":" + scroll.getHeight() + ":" + visible.toShortString() + ":" + ime;
            });
            if (geometry == null || !geometry.equals(previous[0])) {
                previous[0] = geometry;
                unchangedSince[0] = SystemClock.uptimeMillis();
                return null;
            }
            return SystemClock.uptimeMillis() - unchangedSince[0] >= 500 ? Boolean.TRUE : null;
        }, "stable page layout and keyboard insets");
    }

    private static ScrollView parentScroll(View view) {
        while (view != null) {
            if (view instanceof ScrollView) return (ScrollView) view;
            view = view.getParent() instanceof View ? (View) view.getParent() : null;
        }
        return null;
    }

    private static boolean substantiallyVisible(View view) {
        Rect visible = new Rect();
        return view.getGlobalVisibleRect(visible) && visible.height() >= Math.max(1, view.getHeight() * .8f)
                && visible.width() >= Math.max(1, view.getWidth() * .8f);
    }

    private static View findSectionHeading(View root, String title) {
        if (root.getVisibility() != View.VISIBLE) return null;
        if (root instanceof TextView && !(root instanceof Button)
                && title.contentEquals(((TextView) root).getText())) return root;
        if (root instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) root).getChildCount(); i++) {
            View found = findSectionHeading(((ViewGroup) root).getChildAt(i), title);
            if (found != null) return found;
        }
        return null;
    }

    private void clickDescription(Activity activity, String description) {
        click(activity, () -> findDescription(activity.getWindow().getDecorView(), description), description);
    }

    private void clickText(Activity activity, String text) {
        click(activity, () -> findText(activity.getWindow().getDecorView(), text, false), text);
    }

    private void click(Activity activity, Task<View> find, String label) {
        onMain(() -> {
            View view = find.run();
            require(view != null, "Cannot find: " + label);
            while (!view.isClickable() && view.getParent() instanceof View) view = (View) view.getParent();
            require(view.isClickable() && view.isEnabled(), "Cannot click: " + label);
            require(!(view instanceof android.widget.Switch), "Test cannot toggle a feature switch");
            view.requestRectangleOnScreen(new android.graphics.Rect(0, 0, view.getWidth(), view.getHeight()), true);
            view.performClick();
            return null;
        });
        instrumentation.waitForIdleSync();
    }

    private Button button(Activity activity, String text) { return onMain(() -> buttonDirect(activity, text)); }

    private Button buttonDirect(Activity activity, String text) {
        View view = findText(activity.getWindow().getDecorView(), text, false);
        require(view instanceof Button, "Missing button: " + text);
        return (Button) view;
    }

    private boolean hasText(Activity activity, String text) {
        return onMain(() -> findText(activity.getWindow().getDecorView(), text, false) != null);
    }

    private void requireText(Activity activity, String text) { require(hasText(activity, text), "Missing text: " + text); }

    private void requireTextContaining(Activity activity, String text) {
        require(onMain(() -> findText(activity.getWindow().getDecorView(), text, true) != null), "Missing text containing: " + text);
    }

    private static View findText(View root, String text, boolean contains) {
        if (root.getVisibility() != View.VISIBLE) return null;
        if (root instanceof TextView) {
            String value = ((TextView) root).getText().toString();
            if (contains ? value.contains(text) : value.equals(text)) return root;
        }
        if (root instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) root).getChildCount(); i++) {
            View found = findText(((ViewGroup) root).getChildAt(i), text, contains);
            if (found != null) return found;
        }
        return null;
    }

    private static View findDescription(View root, String description) {
        if (root.getVisibility() != View.VISIBLE) return null;
        if (description.contentEquals(root.getContentDescription() == null ? "" : root.getContentDescription())) return root;
        if (root instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) root).getChildCount(); i++) {
            View found = findDescription(((ViewGroup) root).getChildAt(i), description);
            if (found != null) return found;
        }
        return null;
    }

    private static <T extends View> T findType(View root, Class<T> type) {
        if (type.isInstance(root)) return type.cast(root);
        if (root instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) root).getChildCount(); i++) {
            T found = findType(((ViewGroup) root).getChildAt(i), type);
            if (found != null) return found;
        }
        return null;
    }

    private static int textCount(View view) {
        if (view.getVisibility() != View.VISIBLE) return 0;
        int count = view instanceof TextView && ((TextView) view).length() > 0 ? 1 : 0;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) count += textCount(((ViewGroup) view).getChildAt(i));
        return count;
    }

    private void screenshot(String name) throws Exception {
        instrumentation.waitForIdleSync();
        SystemClock.sleep(200);
        Bitmap bitmap = instrumentation.getUiAutomation().takeScreenshot();
        require(bitmap != null, "Cannot capture " + name);
        File file = new File(directory, name + ".png");
        try (FileOutputStream output = new FileOutputStream(file)) {
            require(bitmap.compress(Bitmap.CompressFormat.PNG, 100, output), "Cannot save " + name);
        } finally { bitmap.recycle(); }
        screenshots.put(file.getAbsolutePath());
    }

    private void passed(String name) throws Exception { passed(name, new JSONObject()); }

    private void passed(String name, JSONObject details) throws Exception {
        details.put("case", name).put("status", "pass");
        cases.put(details);
        write("ui-navigation-progress.json", report);
    }

    private void write(String name, JSONObject value) throws Exception {
        Files.write(new File(directory, name).toPath(), value.toString(2).getBytes(StandardCharsets.UTF_8));
    }

    private static String constant(String name) throws Exception {
        Field field = OnboardingActivity.class.getDeclaredField(name);
        field.setAccessible(true);
        return (String) field.get(null);
    }

    private static Map<String, Object> copy(Map<String, ?> values) {
        Map<String, Object> snapshot = new LinkedHashMap<>();
        for (Map.Entry<String, ?> entry : values.entrySet()) snapshot.put(entry.getKey(),
                entry.getValue() instanceof Set ? new LinkedHashSet<>((Set<?>) entry.getValue()) : entry.getValue());
        return snapshot;
    }

    @SuppressWarnings("unchecked")
    private static boolean restore(SharedPreferences preferences, Map<String, Object> values) {
        SharedPreferences.Editor editor = preferences.edit().clear();
        for (Map.Entry<String, Object> entry : values.entrySet()) {
            String key = entry.getKey(); Object value = entry.getValue();
            if (value instanceof String) editor.putString(key, (String) value);
            else if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
            else if (value instanceof Integer) editor.putInt(key, (Integer) value);
            else if (value instanceof Long) editor.putLong(key, (Long) value);
            else if (value instanceof Float) editor.putFloat(key, (Float) value);
            else if (value instanceof Set) editor.putStringSet(key, new LinkedHashSet<>((Set<String>) value));
            else throw new AssertionError("Unsupported preference type: " + key);
        }
        return editor.commit();
    }

    private static JSONObject typedValues(Map<String, Object> values) throws Exception {
        JSONObject result = new JSONObject();
        for (Map.Entry<String, Object> entry : values.entrySet()) {
            Object value = entry.getValue();
            result.put(entry.getKey(), new JSONObject().put("type", value instanceof Set ? "StringSet" : value.getClass().getSimpleName())
                    .put("value", value instanceof Set ? new JSONArray((Set<?>) value) : value));
        }
        return result;
    }

    private interface Task<T> { T run() throws Exception; }

    private <T> T onMain(Task<T> task) {
        AtomicReference<T> result = new AtomicReference<>();
        AtomicReference<Throwable> error = new AtomicReference<>();
        instrumentation.runOnMainSync(() -> {
            try { result.set(task.run()); } catch (Throwable failure) { error.set(failure); }
        });
        if (error.get() != null) throw new AssertionError("UI operation failed", error.get());
        return result.get();
    }

    private static void require(boolean condition, String message) { if (!condition) throw new AssertionError(message); }

    @Override public void onActivityCreated(Activity activity, Bundle state) {
        activities.add(activity);
        if (suppressEnvironmentProbe && activity instanceof SettingsActivity) {
            try {
                // onActivityCreated runs before onResume: stop automatic Root requests and
                // runtime mirror initialization without editing any persistent configuration.
                Field field = SettingsActivity.class.getDeclaredField("environmentLoading");
                field.setAccessible(true); field.setBoolean(activity, true);
                Field requested = SettingsActivity.class.getDeclaredField("requestedRoot");
                requested.setAccessible(true); requested.setBoolean(activity, true);
            } catch (Throwable failure) { lifecycleFailure = failure; }
        }
    }
    @Override public void onActivityResumed(Activity activity) { resumed = activity; }
    @Override public void onActivityPaused(Activity activity) { if (resumed == activity) resumed = null; }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
    @Override public void onActivityDestroyed(Activity activity) { if (resumed == activity) resumed = null; }
}
