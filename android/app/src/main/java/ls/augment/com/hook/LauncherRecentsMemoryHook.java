package ls.augment.com.hook;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
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
import ls.augment.com.LauncherMemoryLayout;
import ls.augment.com.LauncherMemoryGeometry;
import ls.augment.com.LauncherMemorySizing;
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


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
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
                    recents.getDeclaredMethod("onWindowVisibilityChanged", int.class),
                    recents.getDeclaredMethod("setLayoutRotation", int.class, int.class)
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
        String lastPortraitGeometry = "";
        String lastLandscapeGeometry = "";
        LauncherMemorySizing.Screen memoryScreen;
        String lastDiagnosticReason = "";
        long lastDiagnosticAt;
        int rotation;
        boolean landscape;
        Method orientationGetter, degreesGetter;
        Class<?> orientationType;

        Controller(AugmentModule module, View view, Field overview, Field alpha) {
            this.module = module;
            this.owner = new WeakReference<>(view);
            Context application = view.getContext().getApplicationContext();
            this.context = application == null ? view.getContext() : application;
            this.overview = overview;
            this.contentAlpha = alpha;
            try { orientationGetter = view.getClass().getMethod("getPagedOrientationHandler"); }
            catch (NoSuchMethodException unavailable) { module.logFeatureError("LAUNCHER_RECENTS_ORIENTATION", unavailable); }
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


        // Physical screen/driver/stock-layout coordinates, not logical reading order; changing LEFT/RIGHT would change geometry.
        //noinspection RtlHardcoded
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
            if (totalBytes <= 0 || memoryScreen == null) { hide(); report("waiting_memory"); return; }

            rotation = ((Math.round(recentsRotation(view)/90f)*90)%360+360)%360;
            boolean sideways = rotation == 90 || rotation == 270;
            landscape = (view.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE) != sideways;
            LauncherMemoryLayout region = contentRegion(host, rotation);
            rotation = region.rotation;
            boolean detailed = FeatureSettings.integer(context, PREFIX + "style", 0, 0, 1) == 1;
            String orientation = landscape ? "landscape_" : "portrait_";
            float size = FeatureSettings.decimal(context, PREFIX + (detailed ? "detailed_size" : "simple_size"),
                    12, 6, 40);
            int defaultHeight = landscape ? 60 : 65;
            int height = FeatureSettings.integer(context, PREFIX + orientation + "height",
                    defaultHeight, 24, landscape ? 200 : 240);
            int top = FeatureSettings.integer(context, PREFIX + orientation + "top", landscape?28:50, 0, LauncherOptions.RECENTS_MEMORY_MAX_TOP_DP);
            int left = FeatureSettings.integer(context, PREFIX + orientation + "left", landscape?660:220,
                    landscape ? 0 : LauncherMemoryLayout.CENTER, 2000);
            int content = FeatureSettings.integer(context, PREFIX + "content", 5, 0, LauncherMemoryPresentation.FULL_LABELS);
            LauncherMemorySizing.Result measured=LauncherMemorySizing.measure(label,memoryScreen,region,
                    totalBytes,availableBytes,detailed?1:0,content,size,height);
            label.setTextColor(color(view));
            int neededWidth=measured.width,neededHeight=measured.height;
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) label.getLayoutParams();
            // Use the same integer-dp limits shown by the settings editor.
            int topPixels=memoryScreen.px(Math.min(top,measured.maximumTopDp));
            int leftPixels=!landscape&&left==LauncherMemoryLayout.CENTER?measured.centerPx
                    :memoryScreen.px(Math.max(0,Math.min(left,measured.maximumDp)));
            if(view.getDisplay()!=null){
                android.util.DisplayMetrics screen=new android.util.DisplayMetrics();
                view.getDisplay().getRealMetrics(screen);
                String geometry=new LauncherMemoryGeometry(screen.widthPixels,screen.heightPixels,screen.density,
                        memoryScreen.density,memoryScreen.density*memoryScreen.fontScale,memoryScreen.fontScale,landscape,
                        detailed?1:0,content,size,height,measured.centerDp,measured.maximumDp,measured.maximumTopDp).encode();
                if(!geometry.equals(landscape?lastLandscapeGeometry:lastPortraitGeometry)){
                    if(landscape)lastLandscapeGeometry=geometry;else lastPortraitGeometry=geometry;
                    FeatureSettings.diagnostic(context,landscape?LauncherMemoryGeometry.LANDSCAPE_KEY:LauncherMemoryGeometry.KEY,geometry);
                }
            }
            // The handler angle is relative to the host. Do not rotate a second
            // time when Android has already rotated the whole launcher window.
            int hostLeft = region.x(leftPixels, topPixels) - host.getPaddingLeft();
            int hostTop = region.y(leftPixels, topPixels) - host.getPaddingTop();
            label.setPivotX(0);
            label.setPivotY(0);
            label.setRotation(rotation);
            if (params.width != neededWidth || params.height != neededHeight
                    || params.topMargin != hostTop || params.leftMargin != hostLeft
                    || params.gravity != (Gravity.TOP | Gravity.LEFT)) {
                params.width = neededWidth;
                params.leftMargin = hostLeft;
                params.height = neededHeight;
                params.topMargin = hostTop;
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

        int recentsRotation(View view) throws ReflectiveOperationException {
            if (orientationGetter == null) return 0;
            Object handler = orientationGetter.invoke(view);
            if (handler == null) return rotation;
            if (handler.getClass() != orientationType) {
                degreesGetter = handler.getClass().getMethod("getDegreesRotated");
                orientationType = handler.getClass();
            }
            return Math.round(((Number) degreesGetter.invoke(handler)).floatValue());
        }

        LauncherMemoryLayout contentRegion(FrameLayout host, int rotation) {
            int left = host.getPaddingLeft(), top = host.getPaddingTop();
            int right = host.getWidth() - host.getPaddingRight();
            int bottom = host.getHeight() - host.getPaddingBottom();
            boolean sideways=rotation==90||rotation==270;
            boolean physicalLandscape=landscape!=sideways;
            LauncherMemoryLayout screen=memoryScreen.region(landscape,rotation,0,0,
                    physicalLandscape?memoryScreen.height:memoryScreen.width,
                    physicalLandscape?memoryScreen.width:memoryScreen.height);
            int[] location=new int[2];host.getLocationOnScreen(location);
            // Intersect in screen coordinates: an already inset OEM host must
            // not lose the navigation bar height a second time.
            return new LauncherMemoryLayout(rotation,Math.max(left,screen.left-location[0]),Math.max(top,screen.top-location[1]),
                    Math.min(right,screen.right-location[0]),Math.min(bottom,screen.bottom-location[1]));
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
                    String orientation = landscape ? "landscape_" : "portrait_";
                    value.append(";rotation=").append(rotation).append(";orientation=").append(orientation);
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


        // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
        //noinspection DiscouragedApi
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
            int mode = FeatureSettings.integer(context, PREFIX + "color_mode", 1, 0, 2);
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
                LauncherMemorySizing.Sample read=null;
                View view=owner.get();
                try { if(view!=null)read=LauncherMemorySizing.read(context,view.getDisplay()); }
                catch(RuntimeException error){module.logFeatureError("LAUNCHER_RECENTS_MEMORY_SAMPLE",error);}
                LauncherMemorySizing.Sample sample=read;
                main.post(() -> {
                    memoryPending = false;
                    if (closed) return;
                    sampledAt = SystemClock.elapsedRealtime();
                    if(sample!=null){memoryScreen=sample.screen;totalBytes=sample.total;availableBytes=sample.available;}
                    main.removeCallbacks(update);
                    main.postDelayed(update, sample!=null ? 0 : 2000);
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
            // Re-entering Recents republishes current measurements after cache/log resets.
            lastPortraitGeometry="";lastLandscapeGeometry="";
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
