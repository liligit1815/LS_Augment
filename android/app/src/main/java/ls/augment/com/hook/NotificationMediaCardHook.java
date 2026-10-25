package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface.HookHandle;
import ls.augment.com.SystemUiOptions;

/** Only the OEM notification-list card; media sessions, the island and control center stay native. */
final class NotificationMediaCardHook {
    private static final String PANEL = "com.zte.feature.notification.module.NotificationMediaPanel";
    private static final String CONTROLLER = "com.android.systemui.media.controls.ui.controller.KeyguardMediaController";
    private static final String DIAGNOSTIC = "ls_augment_notification_media_card";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<View, State> STATES = new WeakHashMap<>();
    private static final Map<Object, Boolean> CONTROLLERS = new WeakHashMap<>();
    private static final Runnable SETTINGS_CHANGED = () -> MAIN.post(NotificationMediaCardHook::refresh);
    private static boolean installed, observing;
    private static AugmentModule module;
    private static Field controllerContext, controllerStatus;
    private static Method statusState, refreshPosition;
    private static int panelHooks, controllerHooks;
    private static long panelCalls, controllerCalls;
    private static String lastPanelReport = "", lastControllerReport = "";

    private NotificationMediaCardHook() { }

    static synchronized int install(AugmentModule owner, ClassLoader loader) {
        if (installed) return 0;
        module = owner;
        panelHooks = installPanel(owner, loader);
        controllerHooks = installController(owner, loader);
        installed = panelHooks + controllerHooks > 0;
        reportInstall(FeatureSettings.from(null));
        owner.logFeatureInfo("NOTIFICATION_MEDIA_READY panelHooks=" + panelHooks + ";controllerHooks=" + controllerHooks);
        return panelHooks + controllerHooks;
    }

    private static int installPanel(AugmentModule owner, ClassLoader loader) {
        List<HookHandle> handles = new ArrayList<>();
        try {
            Class<?> type = Class.forName(PANEL, false, loader);
            if (!View.class.isAssignableFrom(type)) throw new IllegalStateException("Not a notification view");
            Method visibility = type.getDeclaredMethod("setVisibility", int.class);
            Method inflate = type.getDeclaredMethod("onFinishInflate");
            Method attach = type.getDeclaredMethod("onAttachedToWindow");
            if (visibility.getReturnType() != void.class || inflate.getReturnType() != void.class
                    || attach.getReturnType() != void.class) throw new NoSuchMethodException("Notification card contract");
            module = owner;
            visibility.setAccessible(true); inflate.setAccessible(true); attach.setAccessible(true);
            handles.add(owner.prepareFeatureHook(visibility, "notification_media.visibility", false).intercept(chain -> {
                Object[] args = chain.getArgs().toArray();
                try {
                    View view = (View) chain.getThisObject();
                    State state = remember(view);
                    panelCalls++;
                    if (!state.refreshing) state.nativeVisibility = (Integer) args[0];
                    state.hidden = enabled(view);
                    if (state.hidden) args[0] = View.GONE;
                    reportPanel(view, state, "setVisibility");
                } catch (Throwable error) { owner.logFeatureError("NOTIFICATION_MEDIA_VISIBILITY", error); }
                return chain.proceed(args);
            }));
            for (Method lifecycle : new Method[]{inflate, attach}) {
                handles.add(owner.prepareFeatureHook(lifecycle, "notification_media." + lifecycle.getName(), false).intercept(chain -> {
                    Object result = chain.proceed();
                    try { View view = (View) chain.getThisObject(); apply(view, remember(view)); }
                    catch (Throwable error) { owner.logFeatureError("NOTIFICATION_MEDIA_ATTACH", error); }
                    return result;
                }));
            }
            for (HookHandle handle : handles) owner.registerFeatureHook(handle);
            // bind/remove and session callbacks can inline this small OEM override.
            for (Method method : type.getDeclaredMethods()) if (method.getName().equals("bindPlayer")
                    || method.getName().equals("removePlayer")) owner.deoptimize(method);
            owner.logFeatureInfo("NOTIFICATION_MEDIA_READY adapter=NotificationMediaPanel hooks=" + handles.size());
            return handles.size();
        } catch (Throwable error) {
            for (HookHandle handle : handles) try { handle.unhook(); } catch (Throwable ignored) { }
            owner.logFeatureError("NOTIFICATION_MEDIA_PANEL_UNAVAILABLE", error);
            return 0;
        }
    }

    /** Current NX809J firmware uses this native notification container, not the full-screen-island panel. */

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static int installController(AugmentModule owner, ClassLoader loader) {
        List<HookHandle> handles = new ArrayList<>();
        try {
            Class<?> type = Class.forName(CONTROLLER, false, loader);
            Class<?> status = Class.forName("com.android.systemui.plugins.statusbar.StatusBarStateController", false, loader);
            controllerContext = type.getDeclaredField("context");
            controllerStatus = type.getDeclaredField("statusBarStateController");
            if (controllerContext.getType() != Context.class || !status.isAssignableFrom(controllerStatus.getType()))
                throw new NoSuchFieldException("Notification controller state");
            controllerContext.setAccessible(true); controllerStatus.setAccessible(true);
            statusState = status.getMethod("getState"); statusState.setAccessible(true);
            refreshPosition = type.getDeclaredMethod("refreshMediaPosition", String.class);
            Method allowed = type.getDeclaredMethod("shouldBeVisibleForSplitShade");
            if (refreshPosition.getReturnType() != void.class || allowed.getReturnType() != boolean.class)
                throw new NoSuchMethodException("Notification controller visibility contract");
            refreshPosition.setAccessible(true); allowed.setAccessible(true);
            handles.add(owner.prepareFeatureHook(allowed, "notification_media.container_allowed", false).intercept(chain -> {
                Object original = chain.proceed();
                try {
                    Object target = chain.getThisObject(); Context context = rememberController(target);
                    controllerCalls++;
                    int state = (Integer) statusState.invoke(controllerStatus.get(target));
                    boolean hidden = FeatureSettings.enabled(context, SystemUiOptions.NOTIFICATION_MEDIA_HIDE)
                            && (state == 0 || state == 2); // SHADE / SHADE_LOCKED; preserve KEYGUARD.
                    String report = "adapter=KeyguardMediaController;hidden=" + hidden + ";status=" + state
                            + ";nativeAllowed=" + original + ";observing=" + observing;
                    if (!report.equals(lastControllerReport)) {
                        lastControllerReport = report;
                        FeatureSettings.diagnostic(context, DIAGNOSTIC, report + ";calls=" + controllerCalls);
                    }
                    return hidden ? Boolean.FALSE : original;
                } catch (Throwable error) {
                    reportError("container_allowed", error);
                    return original;
                }
            }));
            handles.add(owner.prepareFeatureHook(refreshPosition, "notification_media.container_refresh", false).intercept(chain -> {
                try { rememberController(chain.getThisObject()); }
                catch (Throwable error) { reportError("container_refresh", error); }
                return chain.proceed();
            }));
            // refreshMediaPosition directly invokes the small visibility predicate on the audited ROM.
            owner.deoptimize(refreshPosition);
            for (HookHandle handle : handles) owner.registerFeatureHook(handle);
            return handles.size();
        } catch (Throwable error) {
            for (HookHandle handle : handles) try { handle.unhook(); } catch (Throwable ignored) { }
            owner.logFeatureError("NOTIFICATION_MEDIA_CONTAINER_UNAVAILABLE", error);
            return 0;
        }
    }

    private static Context rememberController(Object target) throws IllegalAccessException {
        CONTROLLERS.put(target, Boolean.TRUE);
        Context context = (Context) controllerContext.get(target);
        observe(context);
        return context;
    }

    private static void observe(Context context) {
        if (!observing) {
            observing = FeatureSettings.addSnapshotListener(context, SETTINGS_CHANGED);
            if (observing) reportInstall(context);
        }
    }

    private static void reportInstall(Context context) {
        FeatureSettings.diagnostic(context, DIAGNOSTIC + "_installed",
                "panelHooks=" + panelHooks + ";controllerHooks=" + controllerHooks + ";observing=" + observing);
    }

    private static void reportError(String stage, Throwable error) {
        if (module != null) module.logFeatureError("NOTIFICATION_MEDIA_" + stage, error);
        FeatureSettings.diagnostic(FeatureSettings.from(null), DIAGNOSTIC + "_error", stage + ':' + error.getClass().getSimpleName());
    }

    private static State remember(View view) {
        State state = STATES.get(view);
        if (state == null) { state = new State(view.getVisibility()); STATES.put(view, state); }
        observe(view.getContext());
        return state;
    }

    private static boolean enabled(View view) {
        return FeatureSettings.enabled(view.getContext(), SystemUiOptions.NOTIFICATION_MEDIA_HIDE);
    }

    private static void apply(View view, State state) {
        boolean hidden = enabled(view);
        int visibility = hidden ? View.GONE : state.nativeVisibility;
        state.hidden = hidden;
        if (view.getVisibility() == visibility) { reportPanel(view, state, "unchanged"); return; }
        state.refreshing = true;
        try { view.setVisibility(visibility); }
        finally { state.refreshing = false; }
        reportPanel(view, state, "refresh");
    }

    private static void reportPanel(View view, State state, String source) {
        String report = "adapter=NotificationMediaPanel;hidden=" + state.hidden + ";native=" + state.nativeVisibility
                + ";observing=" + observing;
        if (!report.equals(lastPanelReport)) {
            lastPanelReport = report;
            FeatureSettings.diagnostic(view.getContext(), DIAGNOSTIC, report + ";calls=" + panelCalls + ";source=" + source);
        }
    }

    private static void refresh() {
        for (Object controller : new ArrayList<>(CONTROLLERS.keySet())) try {
            refreshPosition.invoke(controller, "RedMagicDuo notification music card setting changed");
        } catch (Throwable error) { reportError("refresh_container", error); }
        for (View view : new ArrayList<>(STATES.keySet())) try {
            State state = STATES.get(view);
            if (state != null) apply(view, state);
        } catch (Throwable error) { if (module != null) module.logFeatureError("NOTIFICATION_MEDIA_REFRESH", error); }
    }

    private static final class State {
        int nativeVisibility;
        boolean hidden, refreshing;
        State(int visibility) { nativeVisibility = visibility; }
    }
}
