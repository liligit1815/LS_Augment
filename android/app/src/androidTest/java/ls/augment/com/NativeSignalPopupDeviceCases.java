package ls.augment.com;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import org.json.JSONArray;
import org.json.JSONObject;

/** Exercises the real Settings process without opening any Duo Activity. Test APK only. */
final class NativeSignalPopupDeviceCases {
    private static final String SETTINGS = "com.android.settings";
    private static final String TITLE = "双卡信号样式";
    private static final String ENTRY = "ls_augment_signal_style";
    private static final String NATIVE_NOTIFICATION = "show_notification_icons_enable";
    private final Instrumentation test;
    private final Context context;
    private final UiAutomation automation;
    private final AppConfig config;
    private final JSONArray screens = new JSONArray(), events = new JSONArray(), actions = new JSONArray();
    private final JSONObject report = new JSONObject();
    private File directory;
    private int checks;
    private volatile boolean conflictToast;
    private volatile boolean duoActivityObserved;

    private NativeSignalPopupDeviceCases(Instrumentation test) {
        this.test = test;
        context = test.getTargetContext();
        automation = test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
        config = new AppConfig(context);
    }

    static JSONObject run(Instrumentation test, Bundle arguments) throws Exception {
        return new NativeSignalPopupDeviceCases(test).execute();
    }

    private JSONObject execute() throws Exception {
        directory = new File(context.getExternalFilesDir(null), "native-signal-popup-" + BuildConfig.VERSION_CODE);
        require(directory.isDirectory() || directory.mkdirs(), "Evidence directory is available");
        Map<String, String> before = config.snapshot();
        Map<String, String> restore = new LinkedHashMap<>();
        for (String key : new String[]{ConfigSchema.SYSTEMUI_MASTER, SystemUiOptions.SIGNAL_DUAL, SystemUiOptions.SIGNAL_DUAL_STYLE,
                ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP}) restore.put(key, before.get(key));
        String notificationBefore = notificationValue();
        String fontSettingBefore = Settings.System.getString(context.getContentResolver(), Settings.System.FONT_SCALE);
        float fontScale = context.getResources().getConfiguration().fontScale;
        int densityDpi = context.getResources().getDisplayMetrics().densityDpi;
        AccessibilityServiceInfo service = automation.getServiceInfo();
        int serviceFlags = service.flags;
        service.flags |= AccessibilityServiceInfo.FLAG_REPORT_VIEW_IDS
                | AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS
                | AccessibilityServiceInfo.FLAG_INCLUDE_NOT_IMPORTANT_VIEWS;
        automation.setServiceInfo(service);
        automation.setOnAccessibilityEventListener(event -> {
            if (event.getEventType() == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED
                    && context.getPackageName().contentEquals(event.getPackageName() == null ? "" : event.getPackageName())
                    && String.valueOf(event.getClassName()).endsWith("Activity")) duoActivityObserved = true;
            if (event.getEventType() != AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED) return;
            String text = event.getText().toString();
            if (text.contains(SignalStylePolicy.CONFLICT_MESSAGE)) conflictToast = true;
            synchronized (events) {
                if (events.length() < 32) events.put(new JSONObjectMap()
                        .put("package", String.valueOf(event.getPackageName()))
                        .put("class", String.valueOf(event.getClassName()))
                        .put("text", text).put("at", SystemClock.uptimeMillis()).value);
            }
        });
        Throwable failure = null;
        try {
            save(Map.of(ConfigSchema.SYSTEMUI_MASTER, "1", SystemUiOptions.SIGNAL_DUAL, "0",
                    ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP, "0"));
            String launched = shell("su -c \"am start -n com.android.settings/.SubSettings -f 0x10008000"
                    + " --es :settings:show_fragment com.zte.settings.notification.StatusBarIconsSettingsFragment\"");
            require(!launched.contains("Error:"), "Open the OEM status-bar icon fragment: " + launched.trim());
            await(this::pageVisible, "OEM status-bar icon page is visible");
            require(summary("平铺"), "Initial signal summary is flat");
            assertEntryPlacement();
            capture("01-oem-statusbar-icons-flat");

            click("通知图标");
            await(() -> nativeListVisible("不显示", "显示图标", "显示数字"), "Original notification choices are visible");
            JSONObject original = dialogContract("notification_icons", new String[]{"不显示", "显示图标", "显示数字"});
            report.put("notificationPopup", original);
            capture("02-oem-notification-popup");
            cancel();
            require(Objects.equals(notificationBefore, notificationValue()), "Cancelling the OEM notification popup writes no setting");

            openSignal();
            JSONObject custom = dialogContract(ENTRY, new String[]{"平铺", "荣耀双排", "iOS双排"});
            require(original.getString("fragmentClass").equals(custom.getString("fragmentClass"))
                    && original.getString("tag").equals(custom.getString("tag"))
                    && original.getString("titleClass").equals(custom.getString("titleClass"))
                    && original.getString("cancelClass").equals(custom.getString("cancelClass")),
                    "Both popups retain the same OEM DialogFragment, title and Cancel shell");
            report.put("signalPopup", custom);
            capture("03-dual-signal-popup-flat-selected");
            click("荣耀双排");
            await(() -> config.getBoolean(SystemUiOptions.SIGNAL_DUAL) && pageVisible() && summary("荣耀双排"),
                    "Selecting merge saves the shared dual-signal value and updates the OEM row");
            require(config.getBoolean(ConfigSchema.SYSTEMUI_MASTER), "Merge retains the SystemUI feature gate");
            capture("04-oem-statusbar-icons-merged");

            openSignal();
            report.put("signalPopupMerged", dialogContract(ENTRY, new String[]{"平铺", "荣耀双排", "iOS双排"}));
            capture("05-dual-signal-popup-merged-selected");
            click("iOS双排");
            await(() -> config.getBoolean(SystemUiOptions.SIGNAL_DUAL)
                    && "1".equals(config.get(SystemUiOptions.SIGNAL_DUAL_STYLE)) && pageVisible() && summary("iOS双排"),
                    "Selecting iOS atomically saves the dual gate and iOS style");
            openSignal();
            report.put("signalPopupIos", dialogContract(ENTRY, new String[]{"平铺", "荣耀双排", "iOS双排"}));
            capture("05b-dual-signal-popup-ios-selected");
            click("平铺");
            await(() -> !config.getBoolean(SystemUiOptions.SIGNAL_DUAL) && pageVisible() && summary("平铺"),
                    "Selecting flat saves the shared dual-signal value and updates the OEM row");
            capture("06-oem-statusbar-icons-flat-again");

            long cancelRevision = config.configSnapshot().revision;
            openSignal();
            cancel();
            require(config.configSnapshot().revision == cancelRevision && !config.getBoolean(SystemUiOptions.SIGNAL_DUAL),
                    "Cancelling signal selection leaves the value and configuration revision unchanged");
            report.put("cancelWithoutWrite", true);

            save(Map.of(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP, "1"));
            await(() -> pageVisible() && summary("平铺"), "OEM row reflects the active three-in-one state");
            long conflictRevision = config.configSnapshot().revision;
            openSignal();
            capture("07-dual-signal-popup-three-in-one-active");
            click("荣耀双排");
            await(() -> conflictToast && pageVisible(), "Actual OEM-process toast explains the three-in-one conflict");
            require(!config.getBoolean(SystemUiOptions.SIGNAL_DUAL)
                    && config.getBoolean(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)
                    && config.configSnapshot().revision == conflictRevision && summary("平铺"),
                    "Rejected merge preserves flat, three-in-one and the saved revision");
            capture("08-oem-statusbar-icons-conflict-rejected");
            report.put("threeInOneConflictToast", true).put("threeInOneConflictKeepsFlat", true);
            require(Objects.equals(notificationBefore, notificationValue()), "Native notification setting stays unchanged throughout");
            require(Float.compare(fontScale, context.getResources().getConfiguration().fontScale) == 0
                    && densityDpi == context.getResources().getDisplayMetrics().densityDpi,
                    "Normal-font comparisons retain the same device font and display size");
            largeFontEvidence(fontScale);
            require(!duoActivityObserved, "No Duo Activity is opened by any OEM preference action");
        } catch (Throwable error) {
            failure = error;
            try { capture("99-failure"); } catch (Throwable captureError) { error.addSuppressed(captureError); }
        } finally {
            try {
                if (signalPopupVisible() || nativeListVisible("不显示", "显示图标", "显示数字")) cancel();
            } catch (Throwable cleanup) {
                if (failure == null) failure = cleanup; else failure.addSuppressed(cleanup);
            }
            try {
                restoreFontScale(fontSettingBefore, fontScale);
                report.put("fontScaleRestored", true);
            } catch (Throwable cleanup) {
                if (failure == null) failure = cleanup; else failure.addSuppressed(cleanup);
            }
            try {
                save(restore);
                require(before.equals(config.snapshot()), "All original module feature values are restored");
                require(Objects.equals(notificationBefore, notificationValue()), "Original native notification setting is preserved");
                report.put("baselineRestored", true).put("nativeNotificationUnchanged", true);
            } catch (Throwable cleanup) {
                if (failure == null) failure = cleanup; else failure.addSuppressed(cleanup);
            }
            automation.setOnAccessibilityEventListener(null);
            service.flags = serviceFlags;
            automation.setServiceInfo(service);
        }
        report.put("success", failure == null).put("version", BuildConfig.VERSION_NAME)
                .put("versionCode", BuildConfig.VERSION_CODE).put("checks", checks)
                .put("fontScale", fontScale).put("densityDpi", densityDpi)
                .put("nativeNotificationBefore", notificationBefore == null ? JSONObject.NULL : notificationBefore)
                .put("screenshots", screens).put("actions", actions).put("toastEvents", events)
                .put("duoActivitiesOpened", duoActivityObserved).put("evidenceDirectory", directory.getAbsolutePath());
        if (failure != null) report.put("failure", android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory, "report.json").toPath(), report.toString(2).getBytes(StandardCharsets.UTF_8));
        if (failure != null) throw new AssertionError("OEM native signal popup regression failed; see " + directory, failure);
        return report;
    }

    private void openSignal() throws Exception {
        require(pageVisible(), "Signal selector is opened from the OEM status-bar page");
        click(TITLE);
        await(this::signalPopupVisible, "OEM popup offers three accessible graphic signal choices");
    }

    private void cancel() throws Exception {
        require(automation.performGlobalAction(AccessibilityService.GLOBAL_ACTION_BACK), "Cancel popup with the real system Back action");
        await(this::pageVisible, "Cancelling returns to the same OEM page");
    }

    private void click(String label) throws Exception {
        await(() -> hasText(label), "Visible OEM action: " + label);
        AccessibilityNodeInfo root = automation.getRootInActiveWindow();
        require(root != null && SETTINGS.contentEquals(root.getPackageName()), "Click remains in the OEM Settings process");
        List<AccessibilityNodeInfo> matches = root.findAccessibilityNodeInfosByText(label);
        root.recycle();
        boolean clicked = false;
        for (AccessibilityNodeInfo node : matches) {
            if (clicked || !matchesLabel(node, label) || !node.isVisibleToUser()) continue;
            AccessibilityNodeInfo action = AccessibilityNodeInfo.obtain(node);
            while (action != null && !action.isClickable()) {
                AccessibilityNodeInfo parent = action.getParent(); action.recycle(); action = parent;
            }
            if (action != null) {
                clicked = action.isEnabled() && action.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                action.recycle();
            }
        }
        for (AccessibilityNodeInfo node : matches) node.recycle();
        require(clicked, "Click a real accessible node without coordinate guesses: " + label);
        actions.put(new JSONObject().put("label", label).put("package", SETTINGS).put("method", "ACTION_CLICK"));
    }

    private boolean pageVisible() {
        return hasText("通知图标") && hasText(TITLE) && !signalPopupVisible();
    }

    private boolean signalPopupVisible() {
        AccessibilityNodeInfo root = automation.getRootInActiveWindow();
        if (root == null) return false;
        try {
            if (!SETTINGS.contentEquals(root.getPackageName())) return false;
            AccessibilityNodeInfo flat = row(root, "平铺"), honor = row(root, "荣耀双排"), ios = row(root, "iOS双排");
            try {
                return flat != null && honor != null && ios != null
                        && flat.isCheckable() && honor.isCheckable() && ios.isCheckable()
                        && flat.isClickable() && honor.isClickable() && ios.isClickable()
                        && !sameBounds(flat, honor) && !sameBounds(honor, ios);
            } finally { if (flat != null) flat.recycle(); if (honor != null) honor.recycle(); if (ios != null) ios.recycle(); }
        } finally { root.recycle(); }
    }

    private boolean hasText(String label) {
        AccessibilityNodeInfo root = automation.getRootInActiveWindow();
        if (root == null) return false;
        try { return SETTINGS.contentEquals(root.getPackageName()) && hasExact(root, label); }
        finally { root.recycle(); }
    }

    private boolean nativeListVisible(String... labels) {
        AccessibilityNodeInfo root = automation.getRootInActiveWindow();
        if (root == null) return false;
        try {
            if (!SETTINGS.contentEquals(root.getPackageName())) return false;
            AccessibilityNodeInfo list = nativeList(root);
            if (list == null) return false;
            try { for (String label : labels) if (!hasExact(list, label)) return false; return true; }
            finally { list.recycle(); }
        } finally { root.recycle(); }
    }

    private boolean summary(String expected) {
        AccessibilityNodeInfo root = automation.getRootInActiveWindow();
        if (root == null) return false;
        try {
            AccessibilityNodeInfo row = row(root, TITLE);
            if (row == null) return false;
            try { return hasExact(row, expected); } finally { row.recycle(); }
        } finally { root.recycle(); }
    }

    private void assertEntryPlacement() throws Exception {
        AccessibilityNodeInfo root = automation.getRootInActiveWindow();
        require(root != null, "OEM status-bar page has an accessibility root");
        try {
            AccessibilityNodeInfo battery = row(root, "电池电量百分比"), signal = row(root, TITLE);
            require(battery != null && signal != null, "Battery and renamed signal rows exist");
            try {
                Rect batteryBounds = new Rect(), signalBounds = new Rect();
                battery.getBoundsInScreen(batteryBounds); signal.getBoundsInScreen(signalBounds);
                require(signalBounds.top >= batteryBounds.bottom, "Dual-SIM signal style follows battery percentage");
                require(!hasExact(root, "信号栏"), "Obsolete signal row title is absent");
                report.put("entryBounds", new JSONObject().put("battery", batteryBounds.toShortString())
                        .put("signal", signalBounds.toShortString()));
            } finally { if (battery != null) battery.recycle(); if (signal != null) signal.recycle(); }
        } finally { root.recycle(); }
    }

    private JSONObject dialogContract(String key, String[] labels) throws Exception {
        String dump = shell("dumpsys activity top");
        require(dump.contains("ListPreferenceDialogFragmentCompat{")
                && dump.contains("tag=androidx.preference.PreferenceFragment.DIALOG")
                && dump.contains("mArguments=Bundle[{key=" + key + "}]"),
                "Real OEM ListPreferenceDialogFragmentCompat owns selection for " + key);
        AccessibilityNodeInfo root = automation.getRootInActiveWindow();
        require(root != null, "Native popup has an accessibility root");
        try {
            require(SETTINGS.contentEquals(root.getPackageName()), "The dialog shell belongs to OEM Settings");
            String titleClass = nodeClass(root, ENTRY.equals(key) ? TITLE : "通知图标");
            String cancelClass = nodeClass(root, "取消");
            require(!titleClass.isEmpty() && !cancelClass.isEmpty(), "Original title and Cancel controls remain accessible");
            if (ENTRY.equals(key)) return graphicDialogContract(root)
                    .put("fragmentClass", "androidx.preference.ListPreferenceDialogFragmentCompat")
                    .put("tag", "androidx.preference.PreferenceFragment.DIALOG").put("key", key)
                    .put("titleClass", titleClass).put("cancelClass", cancelClass)
                    .put("package", String.valueOf(root.getPackageName()));
            AccessibilityNodeInfo list = nativeList(root);
            require(list != null, "Native popup has a real list");
            try {
                require(list.getChildCount() == labels.length, "Native list contains exactly " + labels.length + " choice rows");
                List<AccessibilityNodeInfo> options = list.findAccessibilityNodeInfosByText(labels[0]);
                String optionClass = "";
                for (AccessibilityNodeInfo option : options) {
                    if (option.getText() != null && labels[0].contentEquals(option.getText())) optionClass = String.valueOf(option.getClassName());
                    option.recycle();
                }
                require(!optionClass.isEmpty(), "Native list choice label is accessible");
                JSONArray choices = new JSONArray(); for (String label : labels) choices.put(label);
                return new JSONObject().put("fragmentClass", "androidx.preference.ListPreferenceDialogFragmentCompat")
                        .put("tag", "androidx.preference.PreferenceFragment.DIALOG").put("key", key)
                        .put("listClass", String.valueOf(list.getClassName())).put("optionClass", optionClass)
                        .put("titleClass", titleClass).put("cancelClass", cancelClass)
                        .put("choices", choices).put("package", String.valueOf(root.getPackageName()));
            } finally { list.recycle(); }
        } finally { root.recycle(); }
    }

    private JSONObject graphicDialogContract(AccessibilityNodeInfo root) throws Exception {
        String[] labels = {"平铺", "荣耀双排", "iOS双排"};
        AccessibilityNodeInfo[] options = new AccessibilityNodeInfo[labels.length];
        Rect windowBounds = bounds(root), previous = null;
        float density = context.getResources().getDisplayMetrics().density;
        int tolerance = Math.max(1, Math.round(density * 2));
        int selected = SignalStylePolicy.choice(config.getBoolean(SystemUiOptions.SIGNAL_DUAL),
                SignalStylePolicy.style(config.get(SystemUiOptions.SIGNAL_DUAL_STYLE)));
        JSONArray choices = new JSONArray(), geometry = new JSONArray();
        try {
            require(countSelectable(root) == 3, "The popup exposes exactly three selectable option nodes");
            int checked = 0;
            for (int i = 0; i < labels.length; i++) {
                AccessibilityNodeInfo option = options[i] = row(root, labels[i]);
                require(option != null, "Illustrated signal option exists: " + labels[i]);
                require(option.isVisibleToUser() && option.isClickable() && option.isEnabled() && option.isCheckable(),
                        "Each choice exposes a visible, clickable, enabled and checkable accessibility node");
                if (option.isChecked()) checked++;
                require(option.isChecked() == (i == selected), "Radio selection matches exact saved gate and style: " + labels[i]);
                Rect current = bounds(option);
                require(current.width() >= Math.round(density * 48) && current.height() >= Math.round(density * 48),
                        "Each illustrated choice retains a 48dp touch area: " + labels[i]);
                if (previous != null) require(previous.right <= current.left + tolerance
                        && Math.abs(previous.top - current.top) <= tolerance,
                        "Flat, Honor and iOS stay left to right in one horizontal row at the current font scale");
                require(windowBounds.contains(current), "Each option touch area fits within the OEM popup");
                choices.put(labels[i]);geometry.put(optionGeometry(option, labels[i], windowBounds, tolerance));
                previous = current;
            }
            require(checked == 1, "Exactly one signal option is selected");
            return new JSONObject().put("content", "illustrated-single-choice").put("layout", "left-flat-center-honor-right-ios")
                    .put("choices", choices).put("selected", labels[selected]).put("geometry", geometry)
                    .put("optionClass", String.valueOf(options[0].getClassName()))
                    .put("windowBounds", windowBounds.toShortString())
                    .put("fontScale", context.getResources().getConfiguration().fontScale)
                    .put("allContentBoundsInsidePopup", true);
        } finally { for (AccessibilityNodeInfo option : options) if (option != null) option.recycle(); }
    }

    private JSONObject optionGeometry(AccessibilityNodeInfo option, String label, Rect windowBounds, int tolerance)
            throws Exception {
        AccessibilityNodeInfo preview = descendantId(option, "android:id/icon");
        AccessibilityNodeInfo text = descendantId(option, "android:id/title");
        require(preview != null && text != null, "Illustration and label have real accessible view bounds: " + label);
        try {
            require(preview.isVisibleToUser() && text.isVisibleToUser() && matchesLabel(text, label),
                    "Illustration and complete label remain visible: " + label);
            require((label + "信号图示").contentEquals(preview.getContentDescription() == null ? "" : preview.getContentDescription()),
                    "Illustration is identified within its matching signal option: " + label);
            Rect optionBounds = bounds(option), previewBounds = bounds(preview), labelBounds = bounds(text);
            require(previewBounds.width() > 0 && previewBounds.height() > 0
                    && labelBounds.width() > 0 && labelBounds.height() > 0,
                    "Illustration and label have nonempty layout bounds: " + label);
            require(previewBounds.bottom <= labelBounds.top + tolerance,
                    "Signal illustration sits above its radio label: " + label);
            require(optionBounds.contains(previewBounds) && optionBounds.contains(labelBounds)
                    && windowBounds.contains(previewBounds) && windowBounds.contains(labelBounds),
                    "Illustration and label are not clipped by their option or popup bounds: " + label);
            return new JSONObject().put("optionBounds", optionBounds.toShortString())
                    .put("previewBounds", previewBounds.toShortString()).put("labelBounds", labelBounds.toShortString())
                    .put("selected", option.isChecked()).put("label", label);
        } finally { if (preview != null) preview.recycle(); if (text != null) text.recycle(); }
    }

    private void largeFontEvidence(float initialFontScale) throws Exception {
        save(Map.of(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP, "0", SystemUiOptions.SIGNAL_DUAL, "0"));
        shell("settings put system font_scale 1.3");
        await(() -> Math.abs(context.getResources().getConfiguration().fontScale - 1.3f) < 0.02f,
                "Large-font test applies the actual system font scale 1.3");
        await(() -> pageVisible() && summary("平铺"), "OEM page survives font-scale recreation with the current signal value");
        int density = context.getResources().getDisplayMetrics().densityDpi;
        click("通知图标");
        await(() -> nativeListVisible("不显示", "显示图标", "显示数字"), "Original notification popup remains available at font scale 1.3");
        JSONObject original = dialogContract("notification_icons", new String[]{"不显示", "显示图标", "显示数字"});
        capture("09-large-font-notification-popup");
        cancel();
        openSignal();
        JSONObject flat = dialogContract(ENTRY, new String[]{"平铺", "荣耀双排", "iOS双排"});
        require(original.getString("fragmentClass").equals(flat.getString("fragmentClass"))
                && original.getString("titleClass").equals(flat.getString("titleClass"))
                && original.getString("cancelClass").equals(flat.getString("cancelClass")),
                "Large-font signal popup preserves the original dialog title and Cancel shell");
        capture("10-large-font-signal-popup-flat");
        click("荣耀双排");
        await(() -> config.getBoolean(SystemUiOptions.SIGNAL_DUAL) && pageVisible() && summary("荣耀双排"),
                "Large-font merge selection saves through the same module bridge");
        openSignal();
        JSONObject merged = dialogContract(ENTRY, new String[]{"平铺", "荣耀双排", "iOS双排"});
        capture("11-large-font-signal-popup-merged");
        long revision = config.configSnapshot().revision;
        cancel();
        require(config.configSnapshot().revision == revision && config.getBoolean(SystemUiOptions.SIGNAL_DUAL),
                "Cancelling the large-font graphic popup does not write the current selection");
        require(context.getResources().getDisplayMetrics().densityDpi == density,
                "Large-font comparison retains the same display density");
        report.put("largeFont", new JSONObject().put("fontScale", 1.3).put("initialFontScale", initialFontScale)
                .put("notificationPopup", original).put("flatPopup", flat).put("mergedPopup", merged)
                .put("horizontalColumnsRetained", true).put("contentBoundsNotClipped", true));
    }

    private void restoreFontScale(String originalSetting, float originalScale) throws Exception {
        String current = Settings.System.getString(context.getContentResolver(), Settings.System.FONT_SCALE);
        if (!Objects.equals(originalSetting, current)) {
            if (originalSetting != null) Float.parseFloat(originalSetting);
            shell(originalSetting == null ? "settings delete system font_scale"
                    : "settings put system font_scale '" + originalSetting.replace("'", "'\\''") + "'");
        }
        await(() -> Math.abs(context.getResources().getConfiguration().fontScale - originalScale) < 0.02f,
                "Original system font scale is restored after all popup checks");
        require(Objects.equals(originalSetting, Settings.System.getString(context.getContentResolver(), Settings.System.FONT_SCALE)),
                "Original font-scale setting is restored exactly");
    }

    private void capture(String name) throws Exception {
        AccessibilityNodeInfo root = automation.getRootInActiveWindow();
        require(root != null, "Screenshot has an active window");
        JSONObject state;
        try {
            require(SETTINGS.contentEquals(root.getPackageName()), "Screenshot focus stays in OEM Settings");
            state = new JSONObject().put("name", name).put("activePackage", String.valueOf(root.getPackageName()))
                    .put("focusedPackages", focusedPackages()).put("tree", describe(root, 0));
        } finally { root.recycle(); }
        Bitmap bitmap = automation.takeScreenshot(); require(bitmap != null, "Take screenshot " + name);
        File png = new File(directory, name + ".png");
        try (FileOutputStream out = new FileOutputStream(png)) {
            require(bitmap.compress(Bitmap.CompressFormat.PNG, 100, out), "Write screenshot " + name);
        } finally { bitmap.recycle(); }
        File tree = new File(directory, name + ".json");
        Files.write(tree.toPath(), state.toString(2).getBytes(StandardCharsets.UTF_8));
        screens.put(new JSONObject().put("name", name).put("path", png.getAbsolutePath())
                .put("tree", tree.getAbsolutePath()).put("activePackage", SETTINGS));
    }

    private JSONArray focusedPackages() {
        JSONArray result = new JSONArray();
        for (AccessibilityWindowInfo window : automation.getWindows()) {
            if (!window.isFocused() && !window.isActive()) continue;
            AccessibilityNodeInfo root = window.getRoot();
            if (root == null) continue;
            try { result.put(new JSONObjectMap().put("package", String.valueOf(root.getPackageName()))
                    .put("focused", window.isFocused()).put("active", window.isActive()).value); }
            finally { root.recycle(); }
        }
        return result;
    }

    private static JSONObject describe(AccessibilityNodeInfo node, int depth) throws Exception {
        Rect bounds = new Rect(); node.getBoundsInScreen(bounds);
        JSONObject result = new JSONObject().put("class", String.valueOf(node.getClassName()))
                .put("text", node.getText() == null ? "" : node.getText().toString())
                .put("description", node.getContentDescription() == null ? "" : node.getContentDescription().toString())
                .put("id", node.getViewIdResourceName() == null ? "" : node.getViewIdResourceName())
                .put("bounds", bounds.toShortString()).put("clickable", node.isClickable())
                .put("checkable", node.isCheckable()).put("checked", node.isChecked()).put("selected", node.isSelected())
                .put("enabled", node.isEnabled()).put("visible", node.isVisibleToUser());
        JSONArray children = new JSONArray();
        if (depth < 30) for (int i = 0; i < node.getChildCount(); i++) {
            AccessibilityNodeInfo child = node.getChild(i); if (child == null) continue;
            try { children.put(describe(child, depth + 1)); } finally { child.recycle(); }
        }
        return result.put("children", children);
    }

    private static AccessibilityNodeInfo nativeList(AccessibilityNodeInfo node) {
        String cls = String.valueOf(node.getClassName());
        if (node.isVisibleToUser() && ("android.widget.ListView".equals(cls) || cls.endsWith("RecycleListView")))
            return AccessibilityNodeInfo.obtain(node);
        for (int i = 0; i < node.getChildCount(); i++) {
            AccessibilityNodeInfo child = node.getChild(i); if (child == null) continue;
            try { AccessibilityNodeInfo found = nativeList(child); if (found != null) return found; }
            finally { child.recycle(); }
        }
        return null;
    }

    private static boolean matchesLabel(AccessibilityNodeInfo node, String label) {
        return node.getText() != null && label.contentEquals(node.getText())
                || node.getContentDescription() != null && label.contentEquals(node.getContentDescription());
    }

    private static Rect bounds(AccessibilityNodeInfo node) {
        Rect result = new Rect(); node.getBoundsInScreen(result); return result;
    }

    private static boolean sameBounds(AccessibilityNodeInfo first, AccessibilityNodeInfo second) {
        return bounds(first).equals(bounds(second));
    }

    private static int countSelectable(AccessibilityNodeInfo node) {
        int result = node.isVisibleToUser() && node.isClickable() && node.isCheckable() ? 1 : 0;
        for (int i = 0; i < node.getChildCount(); i++) {
            AccessibilityNodeInfo child = node.getChild(i); if (child == null) continue;
            try { result += countSelectable(child); } finally { child.recycle(); }
        }
        return result;
    }

    private static AccessibilityNodeInfo descendantId(AccessibilityNodeInfo node, String id) {
        if (id.equals(node.getViewIdResourceName())) return AccessibilityNodeInfo.obtain(node);
        for (int i = 0; i < node.getChildCount(); i++) {
            AccessibilityNodeInfo child = node.getChild(i); if (child == null) continue;
            try { AccessibilityNodeInfo found = descendantId(child, id); if (found != null) return found; }
            finally { child.recycle(); }
        }
        return null;
    }

    private static String nodeClass(AccessibilityNodeInfo root, String label) {
        List<AccessibilityNodeInfo> matches = root.findAccessibilityNodeInfosByText(label);
        String result = "";
        for (AccessibilityNodeInfo node : matches) {
            if (result.isEmpty() && node.isVisibleToUser() && matchesLabel(node, label)) result = String.valueOf(node.getClassName());
            node.recycle();
        }
        return result;
    }

    private static AccessibilityNodeInfo row(AccessibilityNodeInfo root, String label) {
        List<AccessibilityNodeInfo> matches = root.findAccessibilityNodeInfosByText(label);
        AccessibilityNodeInfo found = null;
        for (AccessibilityNodeInfo node : matches) {
            if (found != null || !matchesLabel(node, label) || !node.isVisibleToUser()) continue;
            AccessibilityNodeInfo current = AccessibilityNodeInfo.obtain(node);
            while (current != null && !current.isClickable()) {
                AccessibilityNodeInfo parent = current.getParent(); current.recycle(); current = parent;
            }
            if (current != null) found = current;
        }
        for (AccessibilityNodeInfo node : matches) node.recycle();
        return found;
    }

    private static boolean hasExact(AccessibilityNodeInfo node, String label) {
        List<AccessibilityNodeInfo> matches = node.findAccessibilityNodeInfosByText(label);
        boolean found = false;
        for (AccessibilityNodeInfo match : matches) {
            found |= match.isVisibleToUser() && matchesLabel(match, label);
            match.recycle();
        }
        return found;
    }

    private String notificationValue() { return Settings.System.getString(context.getContentResolver(), NATIVE_NOTIFICATION); }
    private void save(Map<String, String> values) {
        AppConfig.SaveResult result = config.save(values); require(result.success, "Save test-only signal configuration: " + result.message);
    }
    private String shell(String command) throws Exception {
        // UiAutomation tokenizes its command; feed the script to sh so quotes keep their meaning.
        ParcelFileDescriptor[] pipes = automation.executeShellCommandRw("/system/bin/sh");
        require(pipes != null && pipes.length == 2 && pipes[0] != null && pipes[1] != null,
                "Shell exposes stdout and stdin");
        try (InputStream in = new ParcelFileDescriptor.AutoCloseInputStream(pipes[0]);
                ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            try (OutputStream stdin = new ParcelFileDescriptor.AutoCloseOutputStream(pipes[1])) {
                stdin.write((command + "\n").getBytes(StandardCharsets.UTF_8));
            }
            byte[] buffer = new byte[8192]; int count;
            while ((count = in.read(buffer)) != -1) out.write(buffer, 0, count);
            return out.toString(StandardCharsets.UTF_8.name());
        }
    }
    private interface Check { boolean get() throws Exception; }
    private void await(Check check, String message) throws Exception {
        long deadline = SystemClock.uptimeMillis() + 12000;
        while (!check.get() && SystemClock.uptimeMillis() < deadline) SystemClock.sleep(80);
        require(check.get(), message); SystemClock.sleep(400);
    }
    private void require(boolean condition, String message) {
        checks++; if (!condition) throw new AssertionError(message);
    }
    /** Accessibility callbacks cannot throw checked JSON exceptions. */
    private static final class JSONObjectMap {
        final JSONObject value = new JSONObject();
        JSONObjectMap put(String key, Object content) {
            try { value.put(key, content); } catch (org.json.JSONException error) { throw new AssertionError(error); }
            return this;
        }
    }
}
