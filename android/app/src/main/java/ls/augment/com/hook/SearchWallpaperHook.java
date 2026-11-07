package ls.augment.com.hook;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.LauncherOptions;

/** Remove only the factory search background. The window manager renders the current wallpaper. */
final class SearchWallpaperHook {
    private static final String PACKAGE = "com.zte.mifavor.zsearch";
    private static final int WALLPAPER = WindowManager.LayoutParams.FLAG_SHOW_WALLPAPER;

    static void install(AugmentModule module, ClassLoader loader) {
        try {
            Class<? extends Activity> owner = Class.forName(PACKAGE + ".SearchMainAty", false, loader).asSubclass(Activity.class);
            Method create = owner.getDeclaredMethod("onCreate", Bundle.class);
            Method destroy = owner.getDeclaredMethod("onDestroy");
            if (create.getReturnType() != void.class || destroy.getReturnType() != void.class)
                throw new NoSuchMethodException("SearchMainAty lifecycle");
            Blur blur = new Blur();
            blur.install(module, loader, owner);
            WeakHashMap<Activity, Session> sessions = new WeakHashMap<>();
            module.registerFeatureHook(module.prepareFeatureHook(destroy, "search_wallpaper.destroy", false).intercept(chain -> {
                Session session = sessions.remove((Activity) chain.getThisObject());
                if (session != null) try { session.close(); }
                catch (RuntimeException error) { module.logFeatureError("SEARCH_WALLPAPER_DESTROY", error); }
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(create, "search_wallpaper.create", false).intercept(chain -> {
                Object result = chain.proceed();
                Activity activity = (Activity) chain.getThisObject();
                Session session = new Session(activity, module, blur);
                sessions.put(activity, session);
                session.start();
                return result;
            }));
        } catch (ReflectiveOperationException | RuntimeException error) {
            module.logFeatureError("SEARCH_WALLPAPER_ACTIVITY", error);
        }
    }

    // Keep the latest radius requested by the OEM, including changes while the mask is hidden.
    private static final class Blur {
        final WeakHashMap<View, Float> nativeRadius = new WeakHashMap<>();
        final WeakHashMap<View, Boolean> suppressed = new WeakHashMap<>();
        Method setter;
        View replaying;
        void install(AugmentModule module, ClassLoader loader, Class<?> owner) {
            try {
                Method method = Class.forName("com.zte.mifavor.liquidglass.util.a", false, loader)
                        .getDeclaredMethod("h", Object.class, float.class);
                if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != void.class)
                    throw new NoSuchMethodException("static search blur setter");
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method, "search_wallpaper.blur", false).intercept(chain -> {
                    Object target = chain.getArg(0);
                    if (Looper.myLooper() == Looper.getMainLooper() && target != replaying
                            && target instanceof FrameLayout && named((View) target, "search_aty_bg_blur")) {
                        View view = (View) target;
                        nativeRadius.put(view, (Float) chain.getArg(1));
                        if (suppressed.containsKey(view)) return chain.proceed(new Object[]{view, 0f});
                    }
                    return chain.proceed();
                }));
                setter = method;
                // The factory wrapper is small enough for ART to inline. Re-enter the hook from the
                // known blur, resume and theme-change callers when these signatures are present.
                for (String name : new String[]{"J", "onResume", "a"}) {
                    try {
                        Method caller = "a".equals(name) ? owner.getDeclaredMethod(name, boolean.class) : owner.getDeclaredMethod(name);
                        if (caller.getReturnType() == void.class && !Modifier.isStatic(caller.getModifiers()))
                            module.deoptimize(caller);
                    } catch (NoSuchMethodException absent) { /* Other search builds can call the wrapper directly. */ }
                }
            } catch (ReflectiveOperationException | RuntimeException missing) {
                module.logFeatureInfo("SEARCH_WALLPAPER_BLUR_UNAVAILABLE " + missing);
            }
        }
        void suppress(View view, boolean enable) throws ReflectiveOperationException {
            if (view == null) return;
            Float radius = nativeRadius.get(view);
            if (enable) suppressed.put(view, true);
            else suppressed.remove(view);
            if (radius != null) {
                replaying = view;
                try { setter.invoke(null, view, enable ? 0f : radius.floatValue()); }
                finally { replaying = null; }
            }
        }
    }

    private static boolean named(View view, String name) {
        if (view == null || view.getId() == View.NO_ID) return false;
        try { return name.equals(view.getResources().getResourceEntryName(view.getId()))
                && PACKAGE.equals(view.getResources().getResourcePackageName(view.getId())); }
        catch (android.content.res.Resources.NotFoundException missing) { return false; }
    }

    private static boolean instance(View view, String type) {
        for (Class<?> c = view.getClass(); c != null; c = c.getSuperclass())
            if (type.equals(c.getName())) return true;
        return false;
    }
    private static boolean decoration(View view) {
        return view.getClass() == ImageView.class && !view.isClickable() && !view.isLongClickable() && !view.isFocusable();
    }
    private static final class Layers {
        final ViewGroup root;
        final View background, mask, blur;
        final boolean legacy;
        Rect backgroundClip, maskClip;
        Drawable rootBackground, windowBackground;
        boolean hadWallpaper;
        Layers(ViewGroup root, View background, View mask, View blur, boolean legacy) {
            this.root = root; this.background = background; this.mask = mask; this.blur = blur; this.legacy = legacy;
        }
    }

    // Resource IDs belong to the installed OEM search APK and vary between builds.
    //noinspection DiscouragedApi
    private static Layers find(Activity activity, Blur blur) {
        int bgId = activity.getResources().getIdentifier("search_aty_bg", "id", PACKAGE);
        int contentId = activity.getResources().getIdentifier("search_main_aty_layout", "id", PACKAGE);
        View bg = bgId == 0 ? null : activity.findViewById(bgId);
        View content = contentId == 0 ? null : activity.findViewById(contentId);
        if (bg == null || !decoration(bg) || !(bg.getParent() instanceof ViewGroup))
            throw new IllegalArgumentException("missing decorative search_aty_bg ImageView");
        if (content == null || !instance(content, PACKAGE + ".SearchMainAtyLayout"))
            throw new IllegalArgumentException("missing SearchMainAtyLayout content");
        ViewGroup root = (ViewGroup) bg.getParent();
        if (root.getChildAt(0) != bg) throw new IllegalArgumentException("search_aty_bg is not the backmost layer");
        if (instance(root, PACKAGE + ".homepage.SearchBgLayout") && root.getChildCount() == 2 && root.getChildAt(1) == content)
            return new Layers(root, bg, null, null, true);
        if (root.getClass() != FrameLayout.class || !(content.getParent() instanceof FrameLayout))
            throw new IllegalArgumentException("unknown search content container");
        FrameLayout panel = (FrameLayout) content.getParent();
        if (panel.getParent() != root || panel.getChildAt(0) != content)
            throw new IllegalArgumentException("unknown search content parentage");
        if (root.getChildCount() == 2 && root.getChildAt(1) == panel && panel.getId() == View.NO_ID)
            return new Layers(root, bg, null, null, false);
        if (root.getChildCount() != 3 || root.getChildAt(2) != panel || !named(panel, "search_aty_bg_blur")
                || blur.setter == null) throw new IllegalArgumentException("missing three-layer search_aty_bg_blur contract");
        View mask = root.getChildAt(1);
        ViewGroup.LayoutParams size = mask.getLayoutParams();
        if (!decoration(mask) || mask.getId() != View.NO_ID || mask.getBackground() == null
                || size == null || size.width != -1 || size.height != -1)
            throw new IllegalArgumentException("unknown full-screen decorative search mask");
        return new Layers(root, bg, mask, panel, false);
    }

    private static final class Session implements Runnable, ViewTreeObserver.OnGlobalLayoutListener {
        final Activity activity;
        final AugmentModule module;
        final Blur blur;
        final Window window;
        Layers applied;
        boolean reported, closed;
        Session(Activity activity, AugmentModule module, Blur blur) {
            this.activity = activity; this.module = module; this.blur = blur; window = activity.getWindow();
        }
        void start() {
            window.getDecorView().getViewTreeObserver().addOnGlobalLayoutListener(this);
            FeatureSettings.addSnapshotListener(activity, this);
            run();
        }
        @Override public void onGlobalLayout() { run(); }
        @Override public void run() {
            if (closed) return;
            ConfigSnapshot config = FeatureSettings.verifiedSnapshot(activity);
            boolean enabled = config != null && "1".equals(config.get(LauncherOptions.SEARCH_NO_SCRIM));
            if (applied != null && (!enabled || applied.root.getRootView() != window.getDecorView().getRootView())) restore();
            if (!enabled || applied != null) return;
            Layers layers;
            try { layers = find(activity, blur); }
            catch (IllegalArgumentException missing) {
                if (!reported) module.logFeatureInfo("SEARCH_WALLPAPER_UNSUPPORTED " + missing.getMessage());
                reported = true;
                return;
            }
            layers.windowBackground = window.getDecorView().getBackground();
            layers.hadWallpaper = (window.getAttributes().flags & WALLPAPER) != 0;
            layers.rootBackground = layers.root.getBackground();
            layers.backgroundClip = layers.background.getClipBounds();
            if (layers.mask != null) layers.maskClip = layers.mask.getClipBounds();
            applied = layers;
            try {
                blur.suppress(layers.blur, true);
                window.addFlags(WALLPAPER);
                window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                if (layers.legacy) layers.root.setBackground(null);
                // Clipping just these decorative images leaves OEM entrance/exit alpha and visibility intact.
                layers.background.setClipBounds(new Rect());
                if (layers.mask != null) layers.mask.setClipBounds(new Rect());
            } catch (ReflectiveOperationException | RuntimeException error) {
                module.logFeatureError("SEARCH_WALLPAPER_APPLY", error);
                close();
            }
        }
        void restore() {
            Layers layers = applied;
            if (layers == null) return;
            applied = null;
            layers.background.setClipBounds(layers.backgroundClip);
            if (layers.mask != null) layers.mask.setClipBounds(layers.maskClip);
            if (layers.legacy) layers.root.setBackground(layers.rootBackground);
            window.setBackgroundDrawable(layers.windowBackground);
            if (!layers.hadWallpaper) window.clearFlags(WALLPAPER);
            try { blur.suppress(layers.blur, false); }
            catch (ReflectiveOperationException | RuntimeException error) { module.logFeatureError("SEARCH_WALLPAPER_RESTORE", error); }
        }
        void close() {
            closed = true;
            FeatureSettings.removeSnapshotListener(this);
            ViewTreeObserver tree = window.getDecorView().getViewTreeObserver();
            if (tree.isAlive()) tree.removeOnGlobalLayoutListener(this);
            restore();
        }
    }
}
