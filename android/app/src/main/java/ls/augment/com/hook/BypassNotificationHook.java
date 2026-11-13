package ls.augment.com.hook;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.service.notification.StatusBarNotification;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.BypassChargingOptions;

/** Only the inspected ordinary notice is owned here. Thermal notices share its ID. */
final class BypassNotificationHook {
    private static final String KEY = "ls_augment_bypass_notification_runtime";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private final AugmentModule module;
    private final Class<?> type;
    private final Field context, visible, thermalVisible, thermalMode, thermalOpen;
    private final Method send, switchedOn;
    private final Map<Object, State> states = new WeakHashMap<>();

    static void install(AugmentModule module, ClassLoader loader) {
        try {
            install(module, Class.forName("cn.zte.chargeseparation.ChargeSeparationController", false, loader));
        } catch (ClassNotFoundException error) { module.logFeatureInfo("BYPASS_NOTIFICATION_UNAVAILABLE " + error); }
    }

    static void install(AugmentModule module, Class<?> type) {
        try { new BypassNotificationHook(module, type).install(); }
        catch (ReflectiveOperationException | RuntimeException error) {
            module.logFeatureInfo("BYPASS_NOTIFICATION_UNAVAILABLE " + error);
        }
    }

    private BypassNotificationHook(AugmentModule module, Class<?> type) throws ReflectiveOperationException {
        this.module = module; this.type = type;
        context = field(type, Context.class, "mContext");
        visible = field(type, boolean.class, "mNotificationVisible");
        thermalVisible = field(type, boolean.class, "m3CNotificationVisible");
        thermalMode = field(type, boolean.class, "mIsSend3CNotification");
        thermalOpen = field(type, boolean.class, "mIsOpenFor3C");
        send = method("sendNotification", void.class);
        switchedOn = method("isSwitchOn", boolean.class);
        method("send3CNotification", void.class); // Must have a separate, untouched safety path.
        method("init", void.class);
    }

    private void install() throws ReflectiveOperationException {
        module.registerFeatureHook(module.prepareFeatureHook(send, "bypass.notification.ordinary", true).intercept(chain -> {
            if (type.isInstance(chain.getThisObject())) try {
                State state = bind(chain.getThisObject());
                if (state != null && state.suppress()) return null;
            } catch (ReflectiveOperationException | RuntimeException error) { module.logFeatureError("BYPASS_NOTIFICATION_SEND", error); }
            return chain.proceed();
        }));
        Method init = method("init", void.class);
        module.registerFeatureHook(module.prepareFeatureHook(init, "bypass.notification.init", false).intercept(chain -> {
            Object result = chain.proceed();
            if (type.isInstance(chain.getThisObject())) try {
                State state = bind(chain.getThisObject());
                if (state != null) state.schedule();
            } catch (ReflectiveOperationException | RuntimeException error) { module.logFeatureError("BYPASS_NOTIFICATION_BIND", error); }
            return result;
        }));
        module.deoptimize(send); module.deoptimize(init);
        module.logFeatureInfo("BYPASS_NOTIFICATION_READY ordinary=sendNotification;thermal=untouched");
    }

    private synchronized State bind(Object controller) throws ReflectiveOperationException {
        State old = states.get(controller);
        if (old != null) { old.listen(); return old; }
        Context c = (Context) context.get(controller);
        if (c == null || !BypassChargingOptions.SERVICE_PACKAGE.equals(c.getPackageName())) return null;
        State state = new State(controller, c);
        states.put(controller, state); state.listen(); return state;
    }

    private final class State {
        final WeakReference<Object> controller;
        final Context c;
        final Runnable refresh = this::refresh;
        final Runnable listener = this::schedule;
        boolean listening, hidden, missingLogged;
        String lastDiagnostic;
        State(Object controller, Context c) { this.controller = new WeakReference<>(controller); this.c = c; }
        void listen() { if (!listening) listening = FeatureSettings.addSnapshotListener(c, listener); }
        void schedule() { MAIN.removeCallbacks(refresh); MAIN.post(refresh); }
        boolean hide() { return FeatureSettings.hasVerifiedSnapshot(c) && FeatureSettings.enabled(c, BypassChargingOptions.HIDE_PROMPTS); }
        String resource(String name) {
            int id = c.getResources().getIdentifier(name, "string", c.getPackageName());
            return id == 0 ? null : c.getString(id);
        }
        String ordinaryText() {
            String ordinary = resource("game_charge_separation_notification_summit");
            String thermal = resource("game_charge_separation_3c_notification_new");
            if (ordinary != null && !ordinary.isEmpty() && thermal != null && !thermal.isEmpty() && !ordinary.equals(thermal)) return ordinary;
            if (!missingLogged) { missingLogged = true; report("unavailable:ordinary_or_thermal_resource;native_preserved"); }
            return null;
        }
        NotificationManager manager() { return (NotificationManager) c.getSystemService(Context.NOTIFICATION_SERVICE); }
        boolean ordinary(StatusBarNotification item, String text) {
            Notification n = item.getNotification();
            // The package's ordinary and thermal notifications BOTH use ID 100 and this channel.
            if (item.getId() != 100 || !BypassChargingOptions.SERVICE_PACKAGE.equals(item.getPackageName())
                    || !"ChargeSeparation".equals(n.getChannelId()) || (n.flags & Notification.FLAG_FOREGROUND_SERVICE) != 0
                    || n.extras == null) return false;
            CharSequence content = n.extras.getCharSequence(Notification.EXTRA_TEXT);
            CharSequence big = n.extras.getCharSequence(Notification.EXTRA_BIG_TEXT);
            return text.contentEquals(content == null ? "" : content) && (big == null || text.contentEquals(big));
        }
        void cancelOrdinary(Object target, String text) throws ReflectiveOperationException {
            NotificationManager manager = manager();
            if (manager == null) return;
            for (StatusBarNotification item : manager.getActiveNotifications()) if (ordinary(item, text)) {
                manager.cancel(item.getTag(), item.getId());
                visible.setBoolean(target, false); hidden = true;
                report("ordinary_removed;thermal_preserved");
            }
        }
        synchronized boolean suppress() throws ReflectiveOperationException {
            Object target = controller.get();
            if (target == null || !hide()) return false;
            String text = ordinaryText();
            if (text == null) return false;
            cancelOrdinary(target, text);
            visible.setBoolean(target, false); hidden = true;
            report("ordinary_suppressed;thermal_preserved");
            return true;
        }
        synchronized void refresh() {
            Object target = controller.get();
            if (target == null || !FeatureSettings.hasVerifiedSnapshot(c)) return;
            try {
                String text = ordinaryText();
                if (text == null) return;
                if (hide()) { cancelOrdinary(target, text); return; }
                if (!hidden) return;
                // Never recreate an ordinary card over a safety/unknown/foreground notification.
                if (!Boolean.TRUE.equals(switchedOn.invoke(target)) || thermalVisible.getBoolean(target)
                        || thermalMode.getBoolean(target) || thermalOpen.getBoolean(target)) { hidden = false; return; }
                NotificationManager manager = manager();
                if (manager == null) return;
                for (StatusBarNotification item : manager.getActiveNotifications()) {
                    if (item.getId() == 100 && !ordinary(item, text)) { hidden = false; report("restore_skipped:non_ordinary_present"); return; }
                }
                visible.setBoolean(target, false);
                send.invoke(target);
                hidden = false;
                report("ordinary_restored;native_sender");
            } catch (ReflectiveOperationException | RuntimeException error) { module.logFeatureError("BYPASS_NOTIFICATION_REFRESH", error); }
        }
        void report(String value) {
            if (!value.equals(lastDiagnostic)) { lastDiagnostic = value; FeatureSettings.diagnostic(c, KEY, value); }
        }
    }

    private Method method(String name, Class<?> result) throws NoSuchMethodException {
        return HookCompatibility.inheritedMethod(type, result, false, new String[]{name});
    }
    private static Field field(Class<?> type, Class<?> result, String name) throws NoSuchFieldException {
        for (Class<?> at = type; at != null; at = at.getSuperclass()) try {
            return HookCompatibility.field(at, result, false, name);
        } catch (NoSuchFieldException ignored) { }
        throw new NoSuchFieldException(type.getName() + "." + name + ":" + result.getName());
    }
}
