package ls.augment.com.hook;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Configuration;
import android.database.ContentObserver;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.net.TrafficStats;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.libxposed.api.XposedInterface.HookHandle;
import ls.augment.com.StatusBarLayoutSpec;

/**
 * Runtime-compatible SystemUI layer.
 *
 * <p>The status bar itself is the preview. Configuration changes are observed
 * in-process and reapplied to the real views. Every change is reversible: the
 * native view hierarchy is never re-parented, and every translation, clip flag,
 * clock style and height can be restored without restarting SystemUI.</p>
 */
final class SystemUiHook {
    private static final String PHONE_STATUS_BAR =
            "com.android.systemui.statusbar.phone.PhoneStatusBarView";
    private static final String CLOCK = "com.android.systemui.statusbar.policy.Clock";
    private static final String NOTIFICATION_ICONS =
            "com.android.systemui.statusbar.phone.NotificationIconContainer";
    private static final String SYSTEM_BAR_UTILS = "com.android.internal.policy.SystemBarUtils";
    private static final Uri CONFIG_CHANGES =
            Uri.parse("content://ls.augment.com.config/config");

    private static final int TAG_OVERLAY = 0x6c730001;
    private static final int TAG_METRIC_NET = 0x6c730002;
    private static final int TAG_METRIC_THERMAL = 0x6c730003;
    private static final int TAG_METRIC_POWER = 0x6c730004;

    private static final Map<TextView, ClockState> CLOCK_STATES =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<ViewGroup, RootState> ROOT_STATES =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<View, Integer> FORCED_ICON_VISIBILITY =
            Collections.synchronizedMap(new WeakHashMap<>());

    private SystemUiHook() { }

    static int install(AugmentModule module, ClassLoader classLoader) {
        int installed = 0;
        StringBuilder compatibility = new StringBuilder();
        installed += installStatusBar(module, classLoader, compatibility);
        installed += installClock(module, classLoader, compatibility);
        installed += installNotificationLimit(module, classLoader, compatibility);
        installed += installSystemBarHeight(module, classLoader, compatibility);
        Context context = FeatureSettings.from(null);
        FeatureSettings.diagnostic(context, FeatureSettings.SYSTEMUI_INSTALLED,
                "hooks=" + installed);
        FeatureSettings.diagnostic(context, FeatureSettings.SYSTEMUI_COMPAT,
                compatibility.toString());
        if (installed > 0) {
            FeatureSettings.diagnostic(context, FeatureSettings.SYSTEMUI_LAST_ERROR, "");
        }
        module.logFeatureInfo("SYSTEMUI_READY hooks=" + installed
                + " compat=" + compatibility);
        return installed;
    }

    private static int installStatusBar(
            AugmentModule module, ClassLoader loader, StringBuilder compatibility) {
        final Class<?> type;
        try {
            type = Class.forName(PHONE_STATUS_BAR, false, loader);
            addCompat(compatibility, "statusbar_class", true);
        } catch (Throwable error) {
            addCompat(compatibility, "statusbar_class", false);
            report(module, "STATUSBAR_CLASS_MISSING", error);
            return 0;
        }

        int installed = 0;
        Method inflate = findNoArg(type, "onFinishInflate");
        if (inflate != null) {
            try {
                inflate.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                inflate, "systemui.statusbar.inflate", false)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            Object owner = chain.getThisObject();
                            if (owner instanceof ViewGroup) {
                                ensureRoot((ViewGroup) owner).attach();
                            }
                            return result;
                        });
                module.registerFeatureHook(handle);
                installed++;
                addCompat(compatibility, "inflate", true);
            } catch (Throwable error) {
                addCompat(compatibility, "inflate", false);
                report(module, "STATUSBAR_INFLATE_HOOK_FAILED", error);
            }
        } else {
            addCompat(compatibility, "inflate", false);
        }

        Method height = findNoArg(type, "updateStatusBarHeight");
        if (height != null) {
            try {
                height.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                height, "systemui.statusbar.height", false)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            Object owner = chain.getThisObject();
                            if (owner instanceof ViewGroup) {
                                ensureRoot((ViewGroup) owner).nativeHeightUpdated();
                            }
                            return result;
                        });
                module.registerFeatureHook(handle);
                installed++;
                addCompat(compatibility, "height", true);
            } catch (Throwable error) {
                addCompat(compatibility, "height", false);
                report(module, "STATUSBAR_HEIGHT_HOOK_FAILED", error);
            }
        } else {
            addCompat(compatibility, "height", false);
        }

        Method detach = findNoArg(type, "onDetachedFromWindow");
        if (detach != null) {
            try {
                detach.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                detach, "systemui.statusbar.detach", true)
                        .intercept(chain -> {
                            Object owner = chain.getThisObject();
                            if (owner instanceof ViewGroup) detachRoot((ViewGroup) owner);
                            return chain.proceed();
                        });
                module.registerFeatureHook(handle);
                installed++;
                addCompat(compatibility, "detach", true);
            } catch (Throwable error) {
                addCompat(compatibility, "detach", false);
                report(module, "STATUSBAR_DETACH_HOOK_FAILED", error);
            }
        } else {
            addCompat(compatibility, "detach", false);
        }
        return installed;
    }

    private static int installClock(
            AugmentModule module, ClassLoader loader, StringBuilder compatibility) {
        final Class<?> type;
        try {
            type = Class.forName(CLOCK, false, loader);
            addCompat(compatibility, "clock_class", true);
        } catch (Throwable error) {
            addCompat(compatibility, "clock_class", false);
            report(module, "CLOCK_CLASS_MISSING", error);
            return 0;
        }
        Method update = findNoArg(type, "updateClock");
        if (update == null) {
            addCompat(compatibility, "clock_update", false);
            return 0;
        }
        try {
            update.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                            update, "systemui.clock.update", false)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        Object owner = chain.getThisObject();
                        if (owner instanceof TextView) updateClock((TextView) owner, true);
                        return result;
                    });
            module.registerFeatureHook(handle);
            addCompat(compatibility, "clock_update", true);
            return 1;
        } catch (Throwable error) {
            addCompat(compatibility, "clock_update", false);
            report(module, "CLOCK_HOOK_FAILED", error);
            return 0;
        }
    }

    private static int installNotificationLimit(
            AugmentModule module, ClassLoader loader, StringBuilder compatibility) {
        final Class<?> type;
        try {
            type = Class.forName(NOTIFICATION_ICONS, false, loader);
            addCompat(compatibility, "notif_class", true);
        } catch (Throwable error) {
            addCompat(compatibility, "notif_class", false);
            report(module, "NOTIFICATION_CLASS_MISSING", error);
            return 0;
        }
        Method calculate = findNoArg(type, "calculateIconXTranslations");
        if (calculate == null) calculate = findNoArg(type, "calculateIconTranslations");
        if (calculate == null) {
            addCompat(compatibility, "notif_layout", false);
            return 0;
        }
        try {
            calculate.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                            calculate, "systemui.notifications.max", false)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        Object owner = chain.getThisObject();
                        if (owner instanceof ViewGroup) {
                            ViewGroup icons = (ViewGroup) owner;
                            limitNotificationIcons(icons);
                            scheduleContainingRoot(icons);
                        }
                        return result;
                    });
            module.registerFeatureHook(handle);
            addCompat(compatibility, "notif_layout", true);
            return 1;
        } catch (Throwable error) {
            addCompat(compatibility, "notif_layout", false);
            report(module, "NOTIFICATION_HOOK_FAILED", error);
            return 0;
        }
    }

    private static int installSystemBarHeight(
            AugmentModule module, ClassLoader loader, StringBuilder compatibility) {
        final Class<?> type;
        try {
            type = Class.forName(SYSTEM_BAR_UTILS, false, loader);
        } catch (Throwable error) {
            addCompat(compatibility, "inset_height", false);
            return 0;
        }
        Method target = null;
        for (Method method : allMethods(type)) {
            if (!"getStatusBarHeight".equals(method.getName())) continue;
            if (method.getReturnType() != int.class || method.getParameterCount() < 1) continue;
            if (!Context.class.isAssignableFrom(method.getParameterTypes()[0])) continue;
            target = method;
            break;
        }
        if (target == null) {
            addCompat(compatibility, "inset_height", false);
            return 0;
        }
        try {
            target.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                            target, "systemui.insets.height", true)
                    .intercept(chain -> {
                        Object first = chain.getArg(0);
                        Context context = first instanceof Context
                                ? (Context) first : FeatureSettings.from(null);
                        if (!FeatureSettings.enabled(context, FeatureSettings.SYSTEMUI_MASTER)) {
                            return chain.proceed();
                        }
                        int height = FeatureSettings.integer(
                                context, FeatureSettings.STATUSBAR_HEIGHT_DP, 0, 0, 160);
                        if (height > 0) return dp(context, height);
                        return chain.proceed();
                    });
            module.registerFeatureHook(handle);
            addCompat(compatibility, "inset_height", true);
            return 1;
        } catch (Throwable error) {
            addCompat(compatibility, "inset_height", false);
            report(module, "INSET_HEIGHT_HOOK_FAILED", error);
            return 0;
        }
    }

    private static RootState ensureRoot(ViewGroup root) {
        synchronized (ROOT_STATES) {
            RootState state = ROOT_STATES.get(root);
            if (state == null) {
                state = new RootState(root);
                ROOT_STATES.put(root, state);
            }
            return state;
        }
    }

    private static void detachRoot(ViewGroup root) {
        RootState state;
        synchronized (ROOT_STATES) {
            state = ROOT_STATES.remove(root);
        }
        if (state != null) state.detach();
    }

    private static void scheduleContainingRoot(View view) {
        View cursor = view;
        while (cursor != null) {
            RootState state;
            synchronized (ROOT_STATES) {
                state = cursor instanceof ViewGroup ? ROOT_STATES.get(cursor) : null;
            }
            if (state != null) {
                state.scheduleInspect();
                return;
            }
            ViewParent parent = cursor.getParent();
            cursor = parent instanceof View ? (View) parent : null;
        }
    }

    private static void updateClock(TextView clock, boolean nativeTextJustRendered) {
        Context context = clock.getContext();
        ClockState state = CLOCK_STATES.get(clock);
        if (state != null && nativeTextJustRendered) state.nativeText = clock.getText();
        boolean enabled = FeatureSettings.enabled(context, FeatureSettings.SYSTEMUI_MASTER)
                && FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_CUSTOM);
        if (!enabled) {
            if (state != null) {
                CLOCK_STATES.remove(clock);
                state.restore(!nativeTextJustRendered);
            }
            return;
        }
        if (state == null) {
            state = new ClockState(clock);
            CLOCK_STATES.put(clock, state);
        }
        if (nativeTextJustRendered) state.nativeText = clock.getText();
        renderClock(state);
    }

    private static void renderClock(ClockState state) {
        TextView clock = state.clock;
        Context context = clock.getContext();
        String secondPattern = FeatureSettings.text(
                context, FeatureSettings.STATUSBAR_CLOCK_PATTERN_SECOND, "").trim();
        state.applyStyle(!secondPattern.isEmpty());
        Configuration configuration = context.getResources().getConfiguration();
        Locale locale = configuration.getLocales().isEmpty()
                ? Locale.getDefault() : configuration.getLocales().get(0);
        StatusBarClockFormatter.FormatResult result = StatusBarClockFormatter.formatDetailed(
                System.currentTimeMillis(), locale,
                FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_24H, true),
                FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_SECONDS),
                FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_PERIOD),
                FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_CLOCK_WEEK),
                FeatureSettings.text(context, FeatureSettings.STATUSBAR_CLOCK_PATTERN, ""),
                secondPattern);
        if (result.valid) {
            clock.setText(result.text);
            state.lastValidText = result.text;
            state.publishError("");
        } else {
            if (state.lastValidText != null) clock.setText(state.lastValidText);
            state.publishError(result.error);
        }
        state.setSecondTicker(result.valid && result.refreshEverySecond);
        scheduleContainingRoot(clock);
    }

    private static void limitNotificationIcons(ViewGroup container) {
        for (int index = 0; index < container.getChildCount(); index++) {
            View child = container.getChildAt(index);
            Integer forced = FORCED_ICON_VISIBILITY.remove(child);
            if (forced != null) child.setVisibility(forced);
        }
        Context context = container.getContext();
        if (!FeatureSettings.enabled(context, FeatureSettings.SYSTEMUI_MASTER)) return;
        int max = FeatureSettings.integer(
                context, FeatureSettings.STATUSBAR_NOTIFICATION_MAX, 0, 0, 20);
        if (max <= 0) return;
        int visible = 0;
        for (int index = 0; index < container.getChildCount(); index++) {
            View child = container.getChildAt(index);
            if (child.getVisibility() != View.VISIBLE) continue;
            if (visible++ >= max) {
                FORCED_ICON_VISIBILITY.put(child, child.getVisibility());
                child.setVisibility(View.GONE);
            }
        }
    }

    private static void restoreForcedVisibility(View root) {
        Integer forced = FORCED_ICON_VISIBILITY.remove(root);
        if (forced != null) root.setVisibility(forced);
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        for (int index = 0; index < group.getChildCount(); index++) {
            restoreForcedVisibility(group.getChildAt(index));
        }
    }

    private static TextView createMetricsView(Context context, int tag) {
        TextView view = new TextView(context);
        view.setTag(tag, Boolean.TRUE);
        view.setGravity(Gravity.CENTER);
        view.setSingleLine(true);
        view.setIncludeFontPadding(false);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 8.0f);
        view.setText("");
        view.setClickable(false);
        view.setFocusable(false);
        return view;
    }

    private static View findByNames(View root, String... names) {
        Context context = root.getContext();
        for (String name : names) {
            int id = context.getResources().getIdentifier(
                    name, "id", context.getPackageName());
            if (id == 0) id = context.getResources().getIdentifier(name, "id", "android");
            if (id == 0) continue;
            View value = root.findViewById(id);
            if (value != null) return value;
        }
        return null;
    }

    private static String resourceName(View view) {
        try {
            int id = view.getId();
            return id == View.NO_ID ? "" : view.getResources().getResourceEntryName(id);
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static void collectRiskViews(View view, Map<String, View> output) {
        String name = resourceName(view).toLowerCase(Locale.ROOT);
        if (name.contains("cutout") || name.contains("privacy")
                || name.contains("ongoing_call") || name.contains("call_chip")) {
            output.put(name, view);
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            collectRiskViews(group.getChildAt(index), output);
        }
    }

    private static void collectIconViews(View view, Map<String, List<View>> output) {
        String slot = slotOf(view);
        if (slot != null && !slot.isEmpty()) {
            output.computeIfAbsent(slot, ignored -> new ArrayList<>()).add(view);
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            collectIconViews(group.getChildAt(index), output);
        }
    }

    private static String slotOf(View view) {
        String className = view.getClass().getName();
        if (!className.contains("StatusBar") && !className.contains("StatusIcon")
                && !className.contains("IconView")) {
            return null;
        }
        for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Method method = type.getDeclaredMethod("getSlot");
                if (method.getParameterCount() == 0) {
                    method.setAccessible(true);
                    Object value = method.invoke(view);
                    if (value instanceof String) return cleanSlot((String) value);
                }
            } catch (NoSuchMethodException ignored) {
                // Continue through the hierarchy.
            } catch (Throwable ignored) {
                break;
            }
        }
        for (String name : new String[]{"mSlot", "slot"}) {
            for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass()) {
                try {
                    Field field = type.getDeclaredField(name);
                    field.setAccessible(true);
                    Object value = field.get(view);
                    if (value instanceof String) return cleanSlot((String) value);
                } catch (NoSuchFieldException ignored) {
                    // Continue through the hierarchy.
                } catch (Throwable ignored) {
                    break;
                }
            }
        }
        return null;
    }

    private static String cleanSlot(String value) {
        if (value == null) return null;
        String clean = value.trim().replace(',', '_').replace(';', '_');
        return clean.matches("[A-Za-z0-9_.:-]{1,80}") ? clean : null;
    }

    private static Method findNoArg(Class<?> type, String name) {
        for (Method method : allMethods(type)) {
            if (name.equals(method.getName()) && method.getParameterCount() == 0
                    && !Modifier.isAbstract(method.getModifiers())) return method;
        }
        return null;
    }

    private static List<Method> allMethods(Class<?> type) {
        List<Method> methods = new ArrayList<>();
        for (Class<?> cursor = type; cursor != null; cursor = cursor.getSuperclass()) {
            Collections.addAll(methods, cursor.getDeclaredMethods());
        }
        return methods;
    }

    private static int dp(Context context, int value) {
        if (context == null) return value;
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static float dp(Context context, float value) {
        if (context == null) return value;
        return value * context.getResources().getDisplayMetrics().density;
    }

    private static void addCompat(StringBuilder value, String key, boolean present) {
        if (value.length() > 0) value.append(';');
        value.append(key).append('=').append(present ? '1' : '0');
    }

    private static void report(AugmentModule module, String stage, Throwable error) {
        Context context = FeatureSettings.from(null);
        FeatureSettings.diagnostic(context, FeatureSettings.SYSTEMUI_LAST_ERROR,
                stage + ":" + error.getClass().getSimpleName() + ":" + safeMessage(error));
        module.logFeatureError("SYSTEMUI_" + stage, error);
    }

    private static String safeMessage(Throwable error) {
        String value = error == null ? "" : error.getMessage();
        return value == null ? "" : value.replace('\n', ' ').replace('\r', ' ');
    }

    private static final class RootState {
        final ViewGroup root;
        final Handler handler = new Handler(Looper.getMainLooper());
        final Map<View, Offset> offsets = new IdentityHashMap<>();
        final Map<ViewGroup, ClipState> clips = new IdentityHashMap<>();
        final ContentObserver observer;
        final View.OnLayoutChangeListener layoutListener;
        final Runnable applyRunnable = this::applyNow;
        final Runnable inspectRunnable = this::applyPositionsAndDiagnostics;
        boolean attached;
        boolean applying;
        boolean active;
        boolean dualLeft;
        boolean dualRight;
        boolean clockAcross;
        boolean freePosition;
        int nativeHeight = Integer.MIN_VALUE;
        int lastWidth = -1;
        int lastHeight = -1;
        FrameLayout overlay;
        TextView net;
        TextView thermal;
        TextView power;
        MetricsState metrics;
        StatusBarLayoutSpec layout = StatusBarLayoutSpec.empty();
        StatusBarLayoutSpec lastValidLayout = StatusBarLayoutSpec.empty();
        String layoutParseError = "";
        String lastSlots = null;
        String lastLayoutState = null;

        RootState(ViewGroup root) {
            this.root = root;
            observer = new ContentObserver(handler) {
                @Override public void onChange(boolean selfChange) { scheduleApply(); }
                @Override public void onChange(boolean selfChange, Uri uri) { scheduleApply(); }
            };
            layoutListener = (view, left, top, right, bottom,
                    oldLeft, oldTop, oldRight, oldBottom) -> {
                int width = Math.max(0, right - left);
                int height = Math.max(0, bottom - top);
                if (width != lastWidth || height != lastHeight) {
                    lastWidth = width;
                    lastHeight = height;
                    scheduleApply();
                } else {
                    scheduleInspect();
                }
            };
        }

        void attach() {
            if (attached) {
                scheduleApply();
                return;
            }
            attached = true;
            captureNativeHeight();
            root.addOnLayoutChangeListener(layoutListener);
            ContentResolver resolver = root.getContext().getContentResolver();
            try { resolver.registerContentObserver(CONFIG_CHANGES, true, observer); }
            catch (Throwable ignored) { }
            for (String key : FeatureSettings.STATUSBAR_KEYS) {
                try {
                    resolver.registerContentObserver(Settings.Global.getUriFor(key), false, observer);
                } catch (Throwable ignored) { }
            }
            lastWidth = root.getWidth();
            lastHeight = root.getHeight();
            scheduleApply();
        }

        void nativeHeightUpdated() {
            if (!applying) captureNativeHeight();
            attach();
        }

        void captureNativeHeight() {
            ViewGroup.LayoutParams params = root.getLayoutParams();
            if (params != null) nativeHeight = params.height;
        }

        void scheduleApply() {
            if (!attached) return;
            handler.removeCallbacks(applyRunnable);
            handler.postDelayed(applyRunnable, 70L);
        }

        void scheduleInspect() {
            if (!attached || !active) return;
            handler.removeCallbacks(inspectRunnable);
            handler.postDelayed(inspectRunnable, 48L);
        }

        void applyNow() {
            if (!attached || applying) return;
            applying = true;
            try {
                clearAugmentation();
                Context context = root.getContext();
                active = FeatureSettings.enabled(context, FeatureSettings.SYSTEMUI_MASTER);
                if (!active) {
                    restoreHeight();
                    restoreForcedVisibility(root);
                    disableClockInRoot();
                    publish(FeatureSettings.SYSTEMUI_ACTIVE, "0");
                    publishLayout("inactive;size=" + root.getWidth() + "x" + root.getHeight());
                    return;
                }

                applyConfiguredHeight();
                dualLeft = FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_DUAL_LEFT);
                dualRight = FeatureSettings.enabled(context, FeatureSettings.STATUSBAR_DUAL_RIGHT);
                clockAcross = FeatureSettings.enabled(
                        context, FeatureSettings.STATUSBAR_CLOCK_ACROSS);
                freePosition = FeatureSettings.enabled(
                        context, FeatureSettings.STATUSBAR_FREE_POSITION);
                parseLayout();
                createMetricsOverlay();
                TextView clock = clockView();
                if (clock != null) updateClock(clock, false);

                publish(FeatureSettings.SYSTEMUI_ACTIVE, "1");
                publish(FeatureSettings.SYSTEMUI_LAST_HIT,
                        "realtime_apply;free=" + freePosition
                                + ";dual_left=" + dualLeft + ";dual_right=" + dualRight
                                + ";ts=" + System.currentTimeMillis());
                publish(FeatureSettings.SYSTEMUI_LAST_ERROR, "");
                handler.post(inspectRunnable);
            } catch (Throwable error) {
                publish(FeatureSettings.SYSTEMUI_LAST_ERROR,
                        "STATUSBAR_REALTIME_APPLY:" + error.getClass().getSimpleName()
                                + ":" + safeMessage(error));
            } finally {
                applying = false;
            }
        }

        void parseLayout() {
            StatusBarLayoutSpec.ParseResult parsed = StatusBarLayoutSpec.parse(
                    FeatureSettings.text(root.getContext(),
                            FeatureSettings.STATUSBAR_LAYOUT_SPEC, ""));
            if (parsed.valid) {
                layout = parsed.spec;
                lastValidLayout = parsed.spec;
                layoutParseError = "";
            } else {
                layout = lastValidLayout;
                layoutParseError = parsed.error;
            }
        }

        void applyConfiguredHeight() {
            ViewGroup.LayoutParams params = root.getLayoutParams();
            if (params == null) return;
            int configured = FeatureSettings.integer(
                    root.getContext(), FeatureSettings.STATUSBAR_HEIGHT_DP, 0, 0, 160);
            int target = configured > 0 ? dp(root.getContext(), configured) : nativeHeight;
            if (target == Integer.MIN_VALUE || params.height == target) return;
            params.height = target;
            root.setLayoutParams(params);
            root.requestLayout();
        }

        void restoreHeight() {
            if (nativeHeight == Integer.MIN_VALUE || root.getLayoutParams() == null) return;
            ViewGroup.LayoutParams params = root.getLayoutParams();
            if (params.height == nativeHeight) return;
            params.height = nativeHeight;
            root.setLayoutParams(params);
            root.requestLayout();
        }

        void createMetricsOverlay() {
            Context context = root.getContext();
            boolean networkEnabled = FeatureSettings.enabled(
                    context, FeatureSettings.STATUSBAR_NET_SPEED);
            boolean thermalEnabled = FeatureSettings.enabled(
                    context, FeatureSettings.STATUSBAR_THERMAL);
            boolean powerEnabled = FeatureSettings.enabled(
                    context, FeatureSettings.STATUSBAR_BATTERY_POWER);
            if (!networkEnabled && !thermalEnabled && !powerEnabled) return;

            overlay = new FrameLayout(context);
            overlay.setTag(TAG_OVERLAY, Boolean.TRUE);
            overlay.setClipChildren(false);
            overlay.setClipToPadding(false);
            overlay.setClickable(false);
            overlay.setFocusable(false);
            overlay.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            root.addView(overlay, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            TextView clock = clockView();
            if (networkEnabled) net = addMetric(TAG_METRIC_NET, clock);
            if (thermalEnabled) thermal = addMetric(TAG_METRIC_THERMAL, clock);
            if (powerEnabled) power = addMetric(TAG_METRIC_POWER, clock);
            metrics = new MetricsState(root, net, thermal, power);
            metrics.start();
        }

        TextView addMetric(int tag, TextView styleSource) {
            TextView view = createMetricsView(root.getContext(), tag);
            if (styleSource != null) {
                view.setTextColor(styleSource.getCurrentTextColor());
                view.setTypeface(styleSource.getTypeface());
            }
            overlay.addView(view, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            return view;
        }

        void applyPositionsAndDiagnostics() {
            if (!attached || !active || applying) return;
            try {
                clearOffsets();
                restoreClips();
                LinkedHashMap<String, View> measured = new LinkedHashMap<>();
                applyNativeRows(measured);
                applyMetricPositions(measured);

                Map<String, List<View>> iconViews = new LinkedHashMap<>();
                collectIconViews(root, iconViews);
                publishSlots(iconViews.keySet());
                if (freePosition) {
                    applyCommonPositions(measured);
                    applyIconPositions(iconViews, measured);
                }
                publishLayoutDiagnostics(measured);
            } catch (Throwable error) {
                publish(FeatureSettings.SYSTEMUI_LAST_ERROR,
                        "STATUSBAR_MEASURE:" + error.getClass().getSimpleName()
                                + ":" + safeMessage(error));
            }
        }

        void applyNativeRows(Map<String, View> measured) {
            Context context = root.getContext();
            View left = leftSide();
            View right = rightSide();
            int height = Math.max(root.getHeight(), root.getMeasuredHeight());
            int rowShift = Math.min(Math.max(0, height / 4), dp(context, 14));
            int vertical = dp(context, FeatureSettings.integer(context,
                    FeatureSettings.STATUSBAR_TOP_MARGIN_DP, 0, 0, 80)
                    - FeatureSettings.integer(context,
                    FeatureSettings.STATUSBAR_BOTTOM_MARGIN_DP, 0, 0, 80));
            if (left != null) {
                applyOffset(left,
                        dp(context, FeatureSettings.integer(context,
                                FeatureSettings.STATUSBAR_LEFT_MARGIN_DP, 0, 0, 80)),
                        vertical + (dualLeft ? -rowShift : 0));
            }
            if (right != null) {
                applyOffset(right,
                        -dp(context, FeatureSettings.integer(context,
                                FeatureSettings.STATUSBAR_RIGHT_MARGIN_DP, 0, 0, 80)),
                        vertical + (dualRight ? -rowShift : 0));
            }
            TextView clock = clockView();
            if (clock != null && dualLeft && clockAcross && left != null) {
                // The parent moved to the first row; cancel only the clock's Y
                // shift so it remains centred across the real two-row height.
                applyOffset(clock, 0.0f, rowShift);
            }
            if (clock != null && FeatureSettings.enabled(
                    context, FeatureSettings.STATUSBAR_CLOCK_CUSTOM)) {
                measured.put("clock", clock);
            }
        }

        void applyMetricPositions(Map<String, View> measured) {
            int leftY = dualLeft ? 760 : 500;
            int rightY = dualRight ? 760 : 500;
            placeMetric("metric.net", net, 180, leftY, measured);
            placeMetric("metric.thermal", thermal, 420, leftY, measured);
            placeMetric("metric.power", power, 820, rightY, measured);
        }

        void placeMetric(String id, TextView view, int defaultX, int defaultY,
                Map<String, View> measured) {
            if (view == null || overlay == null) return;
            StatusBarLayoutSpec.Position custom = freePosition ? layout.get(id) : null;
            int x = custom == null ? defaultX : custom.x;
            int y = custom == null ? defaultY : custom.y;
            view.measure(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            int width = Math.max(view.getMeasuredWidth(), view.getWidth());
            int height = Math.max(view.getMeasuredHeight(), view.getHeight());
            view.setX(StatusBarLayoutSpec.pixel(x, root.getWidth()) - width / 2.0f);
            view.setY(StatusBarLayoutSpec.pixel(y, root.getHeight()) - height / 2.0f);
            measured.put(id, view);
        }

        void applyCommonPositions(Map<String, View> measured) {
            LinkedHashMap<String, View> components = new LinkedHashMap<>();
            components.put("clock", clockView());
            components.put("notifications", notificationIcons());
            components.put("system_icons", systemIcons());
            components.put("battery", findByNames(root,
                    "battery", "batteryRemainingIcon", "battery_icon", "battery_view"));
            components.put("fan", findByNames(root,
                    "coolingFanView", "cooling_fan", "status_bar_fan", "fan"));
            for (Map.Entry<String, View> entry : components.entrySet()) {
                if (entry.getValue() == null) continue;
                StatusBarLayoutSpec.Position position = layout.get(entry.getKey());
                if (position == null) continue;
                applyAbsoluteCentre(entry.getValue(), position);
                measured.put(entry.getKey(), entry.getValue());
            }
        }

        void applyIconPositions(Map<String, List<View>> icons, Map<String, View> measured) {
            for (Map.Entry<String, List<View>> entry : icons.entrySet()) {
                String id = "slot." + entry.getKey();
                StatusBarLayoutSpec.Position position = layout.get(id);
                if (position == null) continue;
                for (View view : entry.getValue()) applyAbsoluteCentre(view, position);
                if (!entry.getValue().isEmpty()) measured.put(id, entry.getValue().get(0));
            }
        }

        void applyAbsoluteCentre(View view, StatusBarLayoutSpec.Position position) {
            if (view.getWidth() <= 0 || view.getHeight() <= 0) return;
            allowOverflow(view);
            int[] rootLocation = new int[2];
            int[] viewLocation = new int[2];
            root.getLocationOnScreen(rootLocation);
            view.getLocationOnScreen(viewLocation);
            float desiredX = rootLocation[0]
                    + StatusBarLayoutSpec.pixel(position.x, root.getWidth());
            float desiredY = rootLocation[1]
                    + StatusBarLayoutSpec.pixel(position.y, root.getHeight());
            float currentX = viewLocation[0] + view.getWidth() / 2.0f;
            float currentY = viewLocation[1] + view.getHeight() / 2.0f;
            applyOffset(view, desiredX - currentX, desiredY - currentY);
        }

        void applyOffset(View view, float dx, float dy) {
            Offset existing = offsets.get(view);
            if (existing == null) {
                existing = new Offset();
                offsets.put(view, existing);
            }
            view.setTranslationX(view.getTranslationX() + dx);
            view.setTranslationY(view.getTranslationY() + dy);
            existing.dx += dx;
            existing.dy += dy;
        }

        void allowOverflow(View view) {
            ViewParent parent = view.getParent();
            while (parent instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) parent;
                if (!clips.containsKey(group)) {
                    clips.put(group, new ClipState(
                            group.getClipChildren(), group.getClipToPadding()));
                }
                group.setClipChildren(false);
                group.setClipToPadding(false);
                if (group == root) break;
                parent = group.getParent();
            }
        }

        void publishSlots(Set<String> values) {
            ArrayList<String> slots = new ArrayList<>(values);
            slots.sort(String.CASE_INSENSITIVE_ORDER);
            String joined = join(slots, ",");
            if (joined.equals(lastSlots)) return;
            lastSlots = joined;
            publish(FeatureSettings.SYSTEMUI_DISCOVERED_ICONS, joined);
        }

        void publishLayoutDiagnostics(Map<String, View> measured) {
            int width = root.getWidth();
            int height = root.getHeight();
            LinkedHashMap<String, Rect> bounds = new LinkedHashMap<>();
            for (Map.Entry<String, View> entry : measured.entrySet()) {
                Rect rect = boundsInRoot(entry.getValue());
                if (rect != null) bounds.put(entry.getKey(), rect);
            }

            ArrayList<String> overflow = new ArrayList<>();
            for (Map.Entry<String, Rect> entry : bounds.entrySet()) {
                Rect rect = entry.getValue();
                if (rect.left < 0 || rect.top < 0 || rect.right > width || rect.bottom > height) {
                    overflow.add(entry.getKey());
                }
            }
            ArrayList<String> collisions = new ArrayList<>();
            ArrayList<Map.Entry<String, Rect>> items = new ArrayList<>(bounds.entrySet());
            for (int first = 0; first < items.size(); first++) {
                for (int second = first + 1; second < items.size(); second++) {
                    String a = items.get(first).getKey();
                    String b = items.get(second).getKey();
                    if (nestedDiagnosticPair(a, b)) continue;
                    if (Rect.intersects(items.get(first).getValue(), items.get(second).getValue())) {
                        collisions.add(a + "+" + b);
                    }
                }
            }

            Map<String, View> riskViews = new LinkedHashMap<>();
            collectRiskViews(root, riskViews);
            ArrayList<String> risks = new ArrayList<>();
            for (Map.Entry<String, Rect> component : bounds.entrySet()) {
                for (Map.Entry<String, View> risk : riskViews.entrySet()) {
                    if (risk.getValue() == componentView(measured, component.getKey())) continue;
                    Rect riskBounds = boundsInRoot(risk.getValue(), false);
                    if (riskBounds != null && Rect.intersects(component.getValue(), riskBounds)) {
                        risks.add(component.getKey() + "@" + risk.getKey());
                    }
                }
            }

            StringBuilder detail = new StringBuilder();
            int count = 0;
            for (Map.Entry<String, Rect> entry : bounds.entrySet()) {
                if (count++ >= 10) break;
                if (detail.length() > 0) detail.append(',');
                Rect rect = entry.getValue();
                detail.append(entry.getKey()).append(':')
                        .append(rect.width()).append('x').append(rect.height())
                        .append('@').append(rect.left).append(':').append(rect.top);
            }
            String value = "size=" + width + "x" + height
                    + ";density=" + String.format(Locale.ROOT, "%.2f",
                    root.getResources().getDisplayMetrics().density)
                    + ";measured=" + (detail.length() == 0 ? "none" : detail)
                    + ";overflow=" + (overflow.isEmpty() ? "none" : join(overflow, ","))
                    + ";collision=" + (collisions.isEmpty() ? "none" : join(collisions, ","))
                    + ";risk=" + (risks.isEmpty() ? "none" : join(risks, ","))
                    + (layoutParseError.isEmpty() ? "" : ";config_error=" + layoutParseError);
            publishLayout(value);
        }

        View componentView(Map<String, View> values, String key) {
            return values.get(key);
        }

        boolean nestedDiagnosticPair(String first, String second) {
            return ("system_icons".equals(first) && second.startsWith("slot."))
                    || ("system_icons".equals(second) && first.startsWith("slot."))
                    || ("system_icons".equals(first)
                    && ("battery".equals(second) || "fan".equals(second)))
                    || ("system_icons".equals(second)
                    && ("battery".equals(first) || "fan".equals(first)));
        }

        Rect boundsInRoot(View view) {
            return boundsInRoot(view, true);
        }

        Rect boundsInRoot(View view, boolean requireVisible) {
            if (view == null || (requireVisible && view.getVisibility() != View.VISIBLE)
                    || view.getWidth() <= 0 || view.getHeight() <= 0) return null;
            int[] rootLocation = new int[2];
            int[] location = new int[2];
            root.getLocationOnScreen(rootLocation);
            view.getLocationOnScreen(location);
            int left = location[0] - rootLocation[0];
            int top = location[1] - rootLocation[1];
            return new Rect(left, top, left + view.getWidth(), top + view.getHeight());
        }

        void publishLayout(String value) {
            if (value.equals(lastLayoutState)) return;
            lastLayoutState = value;
            publish(FeatureSettings.SYSTEMUI_LAYOUT_STATE, value);
        }

        void publish(String key, String value) {
            FeatureSettings.diagnostic(root.getContext(), key, value);
        }

        TextView clockView() {
            View view = findByNames(root, "clock", "status_bar_clock");
            return view instanceof TextView ? (TextView) view : null;
        }

        View leftSide() {
            return findByNames(root,
                    "status_bar_start_side_content", "status_bar_start_side_container",
                    "status_bar_left_side", "notification_icon_area");
        }

        View rightSide() {
            return findByNames(root,
                    "status_bar_end_side_content", "status_bar_end_side_container",
                    "status_bar_right_side", "system_icon_area", "system_icons");
        }

        View notificationIcons() {
            return findByNames(root, "notificationIcons", "notification_icons",
                    "notification_icon_area_inner", "notification_icon_area");
        }

        View systemIcons() {
            return findByNames(root, "system_icons", "system_icon_area",
                    "statusIcons", "status_icons");
        }

        void disableClockInRoot() {
            TextView clock = clockView();
            if (clock != null) updateClock(clock, false);
        }

        void clearAugmentation() {
            if (metrics != null) metrics.stop();
            metrics = null;
            net = null;
            thermal = null;
            power = null;
            if (overlay != null && overlay.getParent() == root) root.removeView(overlay);
            overlay = null;
            clearOffsets();
            restoreClips();
        }

        void clearOffsets() {
            for (Map.Entry<View, Offset> entry : offsets.entrySet()) {
                View view = entry.getKey();
                Offset offset = entry.getValue();
                view.setTranslationX(view.getTranslationX() - offset.dx);
                view.setTranslationY(view.getTranslationY() - offset.dy);
            }
            offsets.clear();
        }

        void restoreClips() {
            for (Map.Entry<ViewGroup, ClipState> entry : clips.entrySet()) {
                entry.getKey().setClipChildren(entry.getValue().children);
                entry.getKey().setClipToPadding(entry.getValue().padding);
            }
            clips.clear();
        }

        void detach() {
            attached = false;
            handler.removeCallbacksAndMessages(null);
            try { root.getContext().getContentResolver().unregisterContentObserver(observer); }
            catch (Throwable ignored) { }
            root.removeOnLayoutChangeListener(layoutListener);
            clearAugmentation();
            restoreForcedVisibility(root);
            TextView clock = clockView();
            if (clock != null) {
                ClockState state = CLOCK_STATES.remove(clock);
                if (state != null) state.restore(false);
            }
        }
    }

    private static final class Offset {
        float dx;
        float dy;
    }

    private static final class ClipState {
        final boolean children;
        final boolean padding;

        ClipState(boolean children, boolean padding) {
            this.children = children;
            this.padding = padding;
        }
    }

    private static final class ClockState implements Runnable {
        final TextView clock;
        final Typeface originalTypeface;
        final float originalTextSize;
        final float originalLetterSpacing;
        final float originalLineSpacingExtra;
        final float originalLineSpacingMultiplier;
        final int originalGravity;
        final int originalMinLines;
        final int originalMaxLines;
        final boolean originalSingleLine;
        final boolean originalIncludeFontPadding;
        final int originalWidth;
        CharSequence nativeText;
        String lastValidText;
        String lastReportedError = null;
        boolean ticking;

        ClockState(TextView clock) {
            this.clock = clock;
            originalTypeface = clock.getTypeface();
            originalTextSize = clock.getTextSize();
            originalLetterSpacing = clock.getLetterSpacing();
            originalLineSpacingExtra = clock.getLineSpacingExtra();
            originalLineSpacingMultiplier = clock.getLineSpacingMultiplier();
            originalGravity = clock.getGravity();
            originalMinLines = clock.getMinLines();
            originalMaxLines = clock.getMaxLines();
            originalSingleLine = originalMaxLines == 1;
            originalIncludeFontPadding = clock.getIncludeFontPadding();
            originalWidth = clock.getLayoutParams() == null
                    ? ViewGroup.LayoutParams.WRAP_CONTENT : clock.getLayoutParams().width;
            nativeText = clock.getText();
        }

        void applyStyle(boolean twoLines) {
            Context context = clock.getContext();
            String family = FeatureSettings.text(context,
                    FeatureSettings.STATUSBAR_CLOCK_FONT_FAMILY, "sans-serif").trim();
            Typeface base = Typeface.create(family.isEmpty() ? "sans-serif" : family,
                    Typeface.NORMAL);
            int weight = FeatureSettings.integer(context,
                    FeatureSettings.STATUSBAR_CLOCK_WEIGHT, 400, 100, 900);
            clock.setTypeface(Typeface.create(base, weight, false));
            float size = FeatureSettings.decimal(context,
                    FeatureSettings.STATUSBAR_CLOCK_SIZE_SP, 0.0f, 0.0f, 40.0f);
            clock.setTextSize(size > 0.0f ? TypedValue.COMPLEX_UNIT_SP
                    : TypedValue.COMPLEX_UNIT_PX, size > 0.0f ? size : originalTextSize);
            clock.setLetterSpacing(FeatureSettings.decimal(context,
                    FeatureSettings.STATUSBAR_CLOCK_LETTER_SPACING,
                    0.0f, -0.20f, 1.0f));
            clock.setLineSpacing(dp(context, FeatureSettings.decimal(context,
                            FeatureSettings.STATUSBAR_CLOCK_LINE_SPACING_DP,
                            0.0f, 0.0f, 32.0f)), 1.0f);
            String align = FeatureSettings.text(context,
                    FeatureSettings.STATUSBAR_CLOCK_TEXT_ALIGN, "center");
            int horizontal = "left".equals(align) ? Gravity.START
                    : "right".equals(align) ? Gravity.END : Gravity.CENTER_HORIZONTAL;
            clock.setGravity(horizontal | Gravity.CENTER_VERTICAL);
            clock.setIncludeFontPadding(false);
            clock.setSingleLine(!twoLines);
            if (twoLines) {
                clock.setMinLines(2);
                clock.setMaxLines(2);
            } else {
                clock.setMinLines(1);
                clock.setMaxLines(1);
            }
            ViewGroup.LayoutParams params = clock.getLayoutParams();
            if (params != null) {
                int width = FeatureSettings.integer(context,
                        FeatureSettings.STATUSBAR_CLOCK_WIDTH_DP, 0, 0, 240);
                params.width = width > 0 ? dp(context, width) : originalWidth;
                clock.setLayoutParams(params);
            }
        }

        void setSecondTicker(boolean enabled) {
            if (enabled) {
                if (!ticking) {
                    ticking = true;
                    schedule();
                }
            } else {
                ticking = false;
                clock.removeCallbacks(this);
            }
        }

        void schedule() {
            long delay = 1000L - (SystemClock.uptimeMillis() % 1000L);
            clock.postDelayed(this, Math.max(100L, delay));
        }

        void publishError(String value) {
            String clean = value == null ? "" : value;
            if (clean.equals(lastReportedError)) return;
            lastReportedError = clean;
            FeatureSettings.diagnostic(clock.getContext(),
                    FeatureSettings.SYSTEMUI_CLOCK_ERROR, clean);
        }

        void restore(boolean restoreText) {
            ticking = false;
            clock.removeCallbacks(this);
            clock.setTypeface(originalTypeface);
            clock.setTextSize(TypedValue.COMPLEX_UNIT_PX, originalTextSize);
            clock.setLetterSpacing(originalLetterSpacing);
            clock.setLineSpacing(originalLineSpacingExtra, originalLineSpacingMultiplier);
            clock.setGravity(originalGravity);
            clock.setSingleLine(originalSingleLine);
            clock.setMinLines(originalMinLines);
            clock.setMaxLines(originalMaxLines);
            clock.setIncludeFontPadding(originalIncludeFontPadding);
            ViewGroup.LayoutParams params = clock.getLayoutParams();
            if (params != null) {
                params.width = originalWidth;
                clock.setLayoutParams(params);
            }
            if (restoreText && nativeText != null) clock.setText(nativeText);
            publishError("");
        }

        @Override public void run() {
            if (!ticking || !clock.isAttachedToWindow()) {
                ticking = false;
                return;
            }
            renderClock(this);
            if (ticking) schedule();
        }
    }

    private static final class MetricsState implements Runnable {
        final ViewGroup root;
        final TextView net;
        final TextView thermal;
        final TextView power;
        final Handler handler = new Handler(Looper.getMainLooper());
        final ThermalReader thermalReader = new ThermalReader();
        long lastBytes = -1L;
        long lastTime = -1L;
        boolean running;

        MetricsState(ViewGroup root, TextView net, TextView thermal, TextView power) {
            this.root = root;
            this.net = net;
            this.thermal = thermal;
            this.power = power;
        }

        void start() {
            if (running) return;
            running = true;
            handler.post(this);
        }

        void stop() {
            running = false;
            handler.removeCallbacks(this);
        }

        @Override public void run() {
            if (!running || !root.isAttachedToWindow()) {
                running = false;
                return;
            }
            Context context = root.getContext();
            if (!FeatureSettings.enabled(context, FeatureSettings.SYSTEMUI_MASTER)) {
                running = false;
                return;
            }
            View clockView = findByNames(root, "clock", "status_bar_clock");
            if (clockView instanceof TextView) {
                TextView source = (TextView) clockView;
                for (TextView metric : new TextView[]{net, thermal, power}) {
                    if (metric == null) continue;
                    metric.setTextColor(source.getTextColors());
                    metric.setTypeface(source.getTypeface());
                }
            }
            long now = SystemClock.elapsedRealtime();
            long bytes = safeTrafficBytes();
            long rate = lastBytes < 0L || now <= lastTime
                    ? 0L : Math.max(0L, (bytes - lastBytes) * 1000L / (now - lastTime));
            lastBytes = bytes;
            lastTime = now;

            if (net != null) net.setText(StatusBarMetricsFormatter.rate(rate));
            if (thermal != null) {
                ArrayList<String> parts = new ArrayList<>();
                Double cpu = thermalReader.cpu();
                Double gpu = thermalReader.gpu();
                Double battery = thermalReader.battery();
                if (cpu != null) parts.add(String.format(Locale.ROOT, "CPU %.0f°", cpu));
                if (gpu != null) parts.add(String.format(Locale.ROOT, "GPU %.0f°", gpu));
                if (battery != null) parts.add(String.format(Locale.ROOT, "B %.1f°", battery));
                thermal.setText(join(parts, " "));
                thermal.setVisibility(parts.isEmpty() ? View.GONE : View.VISIBLE);
            }
            if (power != null) {
                ArrayList<String> parts = new ArrayList<>();
                Long current = readLong("/sys/class/power_supply/battery/current_now");
                Long voltage = readLong("/sys/class/power_supply/battery/voltage_now");
                if (current != null) {
                    parts.add(String.format(Locale.ROOT, "I %.0fmA",
                            Math.abs(StatusBarMetricsFormatter.currentMilliAmp(current))));
                }
                if (current != null && voltage != null) {
                    parts.add(String.format(Locale.ROOT, "P %.1fW",
                            StatusBarMetricsFormatter.powerWatt(current, voltage)));
                }
                power.setText(join(parts, " "));
                power.setVisibility(parts.isEmpty() ? View.GONE : View.VISIBLE);
            }
            scheduleContainingRoot(root);
            handler.postDelayed(this, 1000L);
        }

        static long safeTrafficBytes() {
            long rx = TrafficStats.getTotalRxBytes();
            long tx = TrafficStats.getTotalTxBytes();
            return Math.max(0L, rx) + Math.max(0L, tx);
        }
    }

    private static final class ThermalReader {
        File cpu;
        File gpu;
        boolean discovered;

        Double cpu() {
            discover();
            return readTemperature(cpu);
        }

        Double gpu() {
            discover();
            return readTemperature(gpu);
        }

        Double battery() {
            Long raw = readLong("/sys/class/power_supply/battery/temp");
            return raw == null ? null : StatusBarMetricsFormatter.temperatureCelsius(raw);
        }

        void discover() {
            if (discovered) return;
            discovered = true;
            File thermal = new File("/sys/class/thermal");
            File[] zones = thermal.listFiles((dir, name) -> name.startsWith("thermal_zone"));
            if (zones == null) return;
            for (File zone : zones) {
                String type = readText(new File(zone, "type"));
                if (type == null) continue;
                String lower = type.toLowerCase(Locale.ROOT);
                if (gpu == null && lower.contains("gpu")) gpu = new File(zone, "temp");
                if (cpu == null && (lower.contains("cpu") || lower.contains("cpuss")
                        || lower.contains("soc") || lower.contains("ap_"))) {
                    cpu = new File(zone, "temp");
                }
            }
        }

        static Double readTemperature(File file) {
            if (file == null) return null;
            Long raw = readLong(file.getAbsolutePath());
            return raw == null ? null : StatusBarMetricsFormatter.temperatureCelsius(raw);
        }
    }

    private static Long readLong(String path) {
        String value = readText(new File(path));
        if (value == null) return null;
        try { return Long.parseLong(value.trim()); }
        catch (NumberFormatException ignored) { return null; }
    }

    private static String readText(File file) {
        if (file == null || !file.isFile() || !file.canRead()) return null;
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            return reader.readLine();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String join(List<String> values, String separator) {
        StringBuilder output = new StringBuilder();
        for (String value : values) {
            if (output.length() > 0) output.append(separator);
            output.append(value);
        }
        return output.toString();
    }
}
