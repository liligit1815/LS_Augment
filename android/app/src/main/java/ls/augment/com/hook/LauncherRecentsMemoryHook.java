package ls.augment.com.hook;

import android.app.ActivityManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import ls.augment.com.LauncherMemoryPresentation;
import ls.augment.com.LauncherOptions;

/** Adds only a Recents decoration; the native pager and task geometry stay native. */
final class LauncherRecentsMemoryHook {
    private static final String PREFIX = "ls_augment_rm_recents_memory_";
    private static final String RECENTS = "com.android.quickstep.views.RecentsView";
    private static final Map<View, Controller> CONTROLLERS = new WeakHashMap<>();
    private static final ExecutorService MEMORY_WORKER = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "LSA-RecentsMemory");
        thread.setDaemon(true);
        return thread;
    });
    private static boolean installed;

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Class<?> recents = Class.forName(RECENTS, false, loader);
            Field overview = recents.getDeclaredField("mOverviewStateEnabled");
            Field alpha = recents.getDeclaredField("mContentAlpha");
            if (overview.getType() != boolean.class || alpha.getType() != float.class)
                throw new NoSuchFieldException("Recents state field types");
            overview.setAccessible(true);
            alpha.setAccessible(true);
            Method[] methods = {
                    recents.getDeclaredMethod("onAttachedToWindow"),
                    recents.getDeclaredMethod("onDetachedFromWindow"),
                    recents.getDeclaredMethod("onLayout", boolean.class, int.class, int.class, int.class, int.class),
                    recents.getDeclaredMethod("setOverviewStateEnabled", boolean.class),
                    recents.getDeclaredMethod("setContentAlpha", float.class),
                    recents.getDeclaredMethod("setVisibility", int.class),
                    recents.getDeclaredMethod("onWindowVisibilityChanged", int.class)
            };
            for (Method method : methods) {
                boolean detach = method.getName().equals("onDetachedFromWindow");
                module.registerFeatureHook(module.prepareFeatureHook(method,
                        "launcher.recents.memory." + method.getName(), true).intercept(chain -> {
                    Object result = chain.proceed();
                    try {
                        View view = (View) chain.getThisObject();
                        Controller controller = CONTROLLERS.get(view);
                        if (detach) {
                            if (controller != null) controller.close();
                            CONTROLLERS.remove(view);
                        } else {
                            if (controller == null) {
                                controller = new Controller(module, view, overview, alpha);
                                CONTROLLERS.put(view, controller);
                            }
                            controller.changed();
                        }
                    } catch (Throwable error) {
                        module.logFeatureError("LAUNCHER_RECENTS_MEMORY_UPDATE", error);
                    }
                    return result;
                }));
            }
            installed = true;
        } catch (Throwable error) {
            module.logFeatureError("LAUNCHER_RECENTS_MEMORY_INSTALL", error);
        }
    }

    private static final class Controller {
        final AugmentModule module;
        final WeakReference<View> owner;
        final Context context;
        final Field overview, contentAlpha;
        final Handler main = new Handler(Looper.getMainLooper());
        final Runnable update = this::renderSafely;
        final Runnable snapshotChanged = this::changed;
        TextView label;
        View nativeContainer;
        ColorStateList nativeColor;
        float savedNativeAlpha;
        int savedNativeAccessibility;
        boolean ownsNative, closed, memoryPending;
        long totalBytes, availableBytes, sampledAt;
        String lastDiagnostic = "";
        String lastDiagnosticReason = "";
        long lastDiagnosticAt;

        Controller(AugmentModule module, View view, Field overview, Field alpha) {
            this.module = module;
            this.owner = new WeakReference<>(view);
            Context application = view.getContext().getApplicationContext();
            this.context = application == null ? view.getContext() : application;
            this.overview = overview;
            this.contentAlpha = alpha;
            FeatureSettings.addSnapshotListener(context, snapshotChanged);
        }

        void changed() {
            if (closed) return;
            // Hide immediately at HOME/lock/window transitions, before the next draw.
            View view = owner.get();
            if (!visible(view)) hide();
            main.removeCallbacks(update);
            main.post(update);
        }

        boolean visible(View view) {
            if (view == null || !view.isAttachedToWindow() || !view.isShown()
                    || view.getWindowVisibility() != View.VISIBLE
                    || !FeatureSettings.enabled(context, PREFIX + "custom")) return false;
            try {
                return overview.getBoolean(view) && contentAlpha.getFloat(view) > 0.001f;
            } catch (Throwable error) { return false; }
        }

        void renderSafely() {
            if (closed) return;
            try { render(); }
            catch (Throwable error) {
                hide();
                report("render_error:" + error.getClass().getSimpleName());
                module.logFeatureError("LAUNCHER_RECENTS_MEMORY_RENDER", error);
            }
        }

        void render() throws ReflectiveOperationException {
            View view = owner.get();
            if (view == null || !view.isAttachedToWindow()) { hide(); report("detached"); return; }
            if (!(view.getParent() instanceof FrameLayout)) { hide(); report("unsupported_parent"); return; }
            FrameLayout host = (FrameLayout) view.getParent();
            findNativeViews(host);
            // The module is the sole visibility switch. Never change launcher
            // preferences; legacy decorations remain suppressed while attached.
            if (FeatureSettings.hasVerifiedSnapshot(context)) hideNative();
            if (!visible(view)) { hide(); report("visibility_gate"); return; }
            if (host.getWidth() <= 0 || host.getHeight() <= 0) { report("waiting_layout"); return; }
            if (label == null || label.getParent() != host) {
                removeLabel();
                label = new TextView(view.getContext());
                label.setTag("ls_augment_recents_memory");
                label.setVisibility(View.GONE);
                // Both text styles share the same top anchor and layout region.
                label.setGravity(Gravity.LEFT | Gravity.TOP);
                label.setTextDirection(View.TEXT_DIRECTION_LOCALE);
                label.setIncludeFontPadding(true);
                label.setClickable(false);
                label.setFocusable(false);
                // addView generates the launcher's own BaseDragLayer.LayoutParams.
                host.addView(label);
            }
            requestMemory();
            if (totalBytes <= 0) { hide(); report("waiting_memory"); return; }

            boolean landscape = view.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
            boolean detailed = FeatureSettings.integer(context, PREFIX + "style", 0, 0, 1) == 1;
            String orientation = landscape ? "landscape_" : "portrait_";
            float size = FeatureSettings.decimal(context, PREFIX + (detailed ? "detailed_size" : "simple_size"),
                    12, 6, 40);
            int defaultHeight = landscape ? 60 : 65;
            int height = FeatureSettings.integer(context, PREFIX + orientation + "height",
                    defaultHeight, 24, landscape ? 200 : 240);
            int top = FeatureSettings.integer(context, PREFIX + orientation + "top", 5, 0, LauncherOptions.RECENTS_MEMORY_MAX_TOP_DP);
            int left = FeatureSettings.integer(context, PREFIX + orientation + "left", 16, 0, 2000);
            int content = FeatureSettings.integer(context, PREFIX + "content", 0, 0, 5);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, size);
            String text = LauncherMemoryPresentation.format(totalBytes, availableBytes, detailed ? 1 : 0, content);
            if (!text.contentEquals(label.getText())) label.setText(text);
            label.setTextColor(color(view));
            label.setPadding(0, 0, 0, 0);
            int width = Math.max(1, host.getWidth() - host.getPaddingLeft() - host.getPaddingRight());
            // The selected height is the actual height. If a detailed value
            // wraps, reduce its text size to fit instead of silently overriding
            // the user's minimum with the natural text height.
            int availableHeight = visibleContentHeight(host);
            int targetHeight = Math.min(dp(view, height), availableHeight);
            label.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.AT_MOST),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            int contentHeight = Math.max(1, targetHeight - label.getPaddingTop() - label.getPaddingBottom());
            if (label.getMeasuredHeight() > targetHeight && label.getMeasuredHeight() > 0) {
                float fitted = Math.max(6f, size * contentHeight / label.getMeasuredHeight());
                if (fitted < size) {
                    label.setTextSize(TypedValue.COMPLEX_UNIT_SP, fitted);
                    label.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.AT_MOST),
                            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                }
            }
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) label.getLayoutParams();
            int neededHeight = targetHeight;
            // Keep the user's saved distance, but clamp this layout to its actual
            // visible region. Rotation and density changes recalculate the bound.
            int topPixels = Math.min(dp(view, top), Math.max(0, availableHeight - targetHeight));
            int neededWidth = Math.max(1, Math.min(width, label.getMeasuredWidth()));
            int leftPixels = Math.min(dp(view, left), Math.max(0, width - neededWidth));
            if (params.width != neededWidth || params.height != neededHeight
                    || params.topMargin != topPixels || params.leftMargin != leftPixels
                    || params.gravity != (Gravity.TOP | Gravity.LEFT)) {
                params.width = neededWidth;
                params.leftMargin = leftPixels;
                params.height = neededHeight;
                params.topMargin = topPixels;
                params.gravity = Gravity.TOP | Gravity.LEFT;
                label.setLayoutParams(params);
            }
            hideNative();
            label.setAlpha(Math.max(0f, Math.min(1f, contentAlpha.getFloat(view))));
            label.setVisibility(View.VISIBLE);
            report("visible");
            main.removeCallbacks(update);
            main.postDelayed(update, 2000);
        }

        int visibleContentHeight(FrameLayout host) {
            int bottom = host.getHeight() - host.getPaddingBottom();
            android.view.WindowInsets insets = host.getRootWindowInsets();
            View root = host.getRootView();
            if (insets != null && root.getHeight() > 0) {
                int insetBottom = insets.getInsetsIgnoringVisibility(android.view.WindowInsets.Type.systemBars()
                        | android.view.WindowInsets.Type.displayCutout()).bottom;
                int[] hostLocation = new int[2], rootLocation = new int[2];
                host.getLocationInWindow(hostLocation);
                root.getLocationInWindow(rootLocation);
                // Both bounds are in window coordinates, so a host already inset
                // above the navigation bar is not inset a second time.
                bottom = Math.min(bottom, rootLocation[1] + root.getHeight() - insetBottom - hostLocation[1]);
            }
            return Math.max(1, bottom - host.getPaddingTop());
        }

        // These local values distinguish a missing hook from a gated/unsampled label.
        // No provider or memory-service call runs on the launcher draw thread.
        void report(String reason) {
            long now = SystemClock.elapsedRealtime();
            if (reason.equals(lastDiagnosticReason) && now - lastDiagnosticAt < 1000) return;
            View view = owner.get();
            StringBuilder value = new StringBuilder(reason).append(";ready=")
                    .append(FeatureSettings.hasVerifiedSnapshot(context)).append(";enabled=")
                    .append(FeatureSettings.enabled(context, PREFIX + "custom"));
            if (view != null) {
                value.append(";attached=").append(view.isAttachedToWindow()).append(";shown=").append(view.isShown())
                        .append(";window=").append(view.getWindowVisibility());
                try { value.append(";overview=").append(overview.getBoolean(view))
                        .append(";alpha=").append(contentAlpha.getFloat(view)); }
                catch (IllegalAccessException unavailable) { value.append(";state=unavailable"); }
                Object parent = view.getParent();
                value.append(";parent=").append(parent == null ? "null" : parent.getClass().getName());
                if (parent instanceof View) value.append(";host_width=").append(((View) parent).getWidth())
                        .append(";host_height=").append(((View) parent).getHeight());
            }
            value.append(";memory_ready=").append(totalBytes > 0);
            if (label != null && label.getLayoutParams() instanceof FrameLayout.LayoutParams) {
                FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) label.getLayoutParams();
                value.append(";height=").append(params.height).append(";top=").append(params.topMargin).append(";left=").append(params.leftMargin).append(";width=").append(params.width);
                if (view != null) {
                    String orientation = view.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE
                            ? "landscape_" : "portrait_";
                    value.append(";requested_top_dp=").append(FeatureSettings.integer(context, PREFIX + orientation + "top",
                            5, 0, LauncherOptions.RECENTS_MEMORY_MAX_TOP_DP));
                }
            }
            String next = value.toString();
            if (!next.equals(lastDiagnostic)) {
                lastDiagnostic = next;
                lastDiagnosticReason = reason;
                lastDiagnosticAt = now;
                FeatureSettings.diagnostic(context, PREFIX + "state", next);
            }
        }

        void findNativeViews(FrameLayout host) {
            if (nativeContainer != null && nativeContainer.getRootView() == host.getRootView()) return;
            restoreNative();
            String pkg = context.getPackageName();
            int containerId = host.getResources().getIdentifier("recents_stack_memory_container", "id", pkg);
            int availableId = host.getResources().getIdentifier("recents_stack_memory_available", "id", pkg);
            nativeContainer = containerId == 0 ? null : host.findViewById(containerId);
            View available = availableId == 0 ? null : host.findViewById(availableId);
            nativeColor = available instanceof TextView ? ((TextView) available).getTextColors() : null;
        }

        ColorStateList color(View view) {
            int mode = FeatureSettings.integer(context, PREFIX + "color_mode", 0, 0, 2);
            boolean dark = (view.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
            int fallback = dark ? Color.WHITE : Color.BLACK;
            if (mode == 2) {
                try { return ColorStateList.valueOf(Color.parseColor(FeatureSettings.text(context,
                        PREFIX + (dark ? "dark_color" : "light_color"), dark ? "#FFFFFFFF" : "#FF000000"))); }
                catch (IllegalArgumentException invalid) { return ColorStateList.valueOf(fallback); }
            }
            if (mode == 1) return ColorStateList.valueOf(fallback);
            if (nativeColor != null) return nativeColor;
            TypedArray colors = view.getContext().obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
            try {
                ColorStateList value = colors.getColorStateList(0);
                return value == null ? ColorStateList.valueOf(fallback) : value;
            } finally { colors.recycle(); }
        }

        void requestMemory() {
            if (memoryPending || (totalBytes > 0 && SystemClock.elapsedRealtime() - sampledAt < 1900)) return;
            memoryPending = true;
            MEMORY_WORKER.execute(() -> {
                ActivityManager.MemoryInfo sample = new ActivityManager.MemoryInfo();
                try {
                    ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
                    if (manager != null) manager.getMemoryInfo(sample);
                } catch (RuntimeException error) { module.logFeatureError("LAUNCHER_RECENTS_MEMORY_SAMPLE", error); }
                main.post(() -> {
                    memoryPending = false;
                    if (closed) return;
                    sampledAt = SystemClock.elapsedRealtime();
                    if (sample.totalMem > 0) {
                        totalBytes = sample.totalMem;
                        availableBytes = sample.availMem;
                    }
                    main.removeCallbacks(update);
                    main.postDelayed(update, sample.totalMem > 0 ? 0 : 2000);
                });
            });
        }

        void hideNative() {
            if (nativeContainer == null) return;
            if (!ownsNative) {
                savedNativeAlpha = nativeContainer.getAlpha();
                savedNativeAccessibility = nativeContainer.getImportantForAccessibility();
                ownsNative = true;
            }
            nativeContainer.setAlpha(0f);
            nativeContainer.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        }

        void restoreNative() {
            if (ownsNative && nativeContainer != null) {
                nativeContainer.setAlpha(savedNativeAlpha);
                nativeContainer.setImportantForAccessibility(savedNativeAccessibility);
            }
            ownsNative = false;
        }

        void hide() {
            if (label != null) label.setVisibility(View.GONE);
        }

        void removeLabel() {
            if (label != null && label.getParent() instanceof ViewGroup)
                ((ViewGroup) label.getParent()).removeView(label);
            label = null;
        }

        void close() {
            closed = true;
            main.removeCallbacks(update);
            FeatureSettings.removeSnapshotListener(snapshotChanged);
            hide();
            restoreNative();
            removeLabel();
            report("detached");
        }

        int dp(View view, int value) { return Math.round(value * view.getResources().getDisplayMetrics().density); }
    }
}
