package ls.augment.com.hook;

import android.app.Application;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ContentProviderClient;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Constructor;
import java.lang.reflect.Modifier;
import ls.augment.com.ConfigSchema;
import ls.augment.com.NativeIslandSceneOptions;
import ls.augment.com.SystemUiOptions;

/** Selects the OEM card producer only while a compatible, live phone display host is available. */
final class NativeIslandClockCards {
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Method appInstance, modelInstance, modelState, timeUp, setTimeUp, background,
            foreground, modelTime, modelEnd, getPusher, connect, registerCallback, push, removeCard,
            getActionListener, startCard, pauseCard, notificationCard, alertStart, disconnect;
    private final Field client, target, managerField, alertStarted;
    private final Constructor<?> managerConstructor;
    private final Object model;
    private final Runnable changed = this::refresh;
    private final ContentObserver setting = new ContentObserver(main) {
        @Override public void onChange(boolean selfChange) { schedule(); }
    };
    private final BroadcastReceiver recovery = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (intent != null && NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION.equals(intent.getAction())) {
                NativeIslandCardClient.invalidate(); reconnectNeeded = true; schedule();
            }
        }
    };
    private Context context;
    private boolean bound, owned, priming, reconnectNeeded, fallbackDisplay;
    private Object lastCard;
    private boolean lastWasTimeUp;
    private boolean expirationOwned, alertFallback;
    private long timeUpTotal, timeUpWall;
    private String timeUpTitle = "";
    private WeakReference<Service> alert = new WeakReference<>(null);

    static void install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> feature = Class.forName("zte.com.cn.utils.FeatureUtils", false, loader);
            Method gate = NativeIslandSceneContract.method(feature, "isSupportLiveIslandFullScreen", Boolean.class);
            if (gate == null) gate = require(feature, "isSupportLiveIslandFullScreen", boolean.class);
            requireStatic(gate);
            if (Boolean.TRUE.equals(gate.invoke(null))) { module.logFeatureInfo("NATIVE_CLOCK_CARDS original_fullscreen_preserved"); return; }
            new NativeIslandClockCards(module, loader);
        }
        catch (Throwable missing) { module.logFeatureError("NATIVE_CLOCK_CARDS_CONTRACT", missing); }
    }

    private NativeIslandClockCards(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> feature = Class.forName("zte.com.cn.utils.FeatureUtils", false, loader);
        Method gate = NativeIslandSceneContract.method(feature, "isSupportLiveIslandFullScreen", Boolean.class);
        if (gate == null) gate = require(feature, "isSupportLiveIslandFullScreen", boolean.class);
        Class<?> app = Class.forName("zte.com.cn.AlarmApplication", false, loader);
        Class<?> counter = Class.forName("zte.com.cn.timer.CountdownCount", false, loader);
        Class<?> manager = Class.forName("zte.com.cn.timer.IslandManager", false, loader);
        Class<?> pusher = Class.forName("com.zte.toolsdk.producer.CardPusher", false, loader);
        Class<?> message = Class.forName("com.zte.toolsdk.common.CardMessage", false, loader);
        Class<?> actions = Class.forName("com.zte.toolsdk.producer.CardPusher$OnCardMessageActionListener", false, loader);
        Class<?> alarm = Class.forName("zte.com.cn.timer.CountdownAlertFloatService", false, loader);
        Class<?> shortTimer = Class.forName("zte.com.cn.timer.CountdownShortTimeService", false, loader);
        if (!Application.class.isAssignableFrom(app) || !Service.class.isAssignableFrom(alarm)) throw new IllegalStateException("clock_card_source_types");
        appInstance = require(app, "getInstance", app); foreground = require(app, "isAppInForeground", boolean.class);
        modelInstance = require(counter, "getInstance", counter); model = modelInstance.invoke(null);
        modelState = require(counter, "getState", int.class); modelTime = require(counter, "getTime", long.class);
        modelEnd = require(counter, "getEndTimeElapsedRealtime", long.class);
        timeUp = require(counter, "isTimeUpCardShowing", boolean.class); setTimeUp = require(counter, "setTimeUpCardShowing", void.class, boolean.class);
        background = require(counter, "onAppWentToBackground", void.class, Context.class);
        managerField = fieldRequired(counter, "mIslandManager", manager);
        managerConstructor = manager.getDeclaredConstructor(); managerConstructor.setAccessible(true);
        getPusher = require(pusher, "getInstance", pusher, Context.class, String.class);
        connect = require(pusher, "connect", boolean.class); registerCallback = require(pusher, "registerCallback", void.class);
        disconnect = require(pusher, "disconnect", void.class);
        push = require(pusher, "updateCard", boolean.class, message);
        Method create = require(pusher, "pushCard", boolean.class, message);
        removeCard = require(pusher, "removeCard", boolean.class, String.class);
        getActionListener = require(pusher, "getOnMessageActionListener", actions);
        client = fieldRequired(pusher, "mClient", ContentProviderClient.class); target = fieldRequired(pusher, "mTargetPackage", String.class);
        startCard = require(manager, "startCountDownCard", void.class, Context.class, Long.class);
        pauseCard = require(manager, "pauseCountdownCard", void.class, Context.class);
        notificationCard = require(manager, "startNotificationCard", void.class, Context.class, long.class);
        alertStart = require(alarm, "onStartCommand", int.class, Intent.class, int.class, int.class);
        Method alertDestroy = require(alarm, "onDestroy", void.class);
        Method timeUpEntry = require(shortTimer, "timeUp", void.class);
        Method title = require(counter, "getTitle", String.class);
        alertStarted = fieldRequired(alarm, "startTime", long.class);
        Method playTone = require(alarm, "startPlayTone", void.class), gesture = require(alarm, "startGestureBroadcast", void.class);
        Method applicationCreate = require(app, "onCreate", void.class);
        Method messagePriority = require(message, "getDisplayPriority", int.class);
        Method messageId = require(message, "getCardId", String.class);
        Class<?> contract = Class.forName("com.zte.toolsdk.common.CardProviderContract", false, loader);
        Method providerUri = require(contract, "getProviderUri", Uri.class, String.class);
        for (Method method : new Method[]{gate, appInstance, modelInstance, foreground, getPusher, providerUri}) requireStatic(method);

        module.registerFeatureHook(module.prepareFeatureHook(gate, "rm.clock.native_cards.gate", false).intercept(chain -> {
            Object original = chain.proceed(chain.getArgs().toArray());
            if (Boolean.TRUE.equals(original)) return original;
            Context appContext = (Context) appInstance.invoke(null);
            if (enabled(appContext)) { owned = true; return Boolean.TRUE; }
            return original;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(applicationCreate, "rm.clock.native_cards.application", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray()); bind((Context) chain.getThisObject()); return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(connect, "rm.clock.native_cards.connection", false).intercept(chain -> {
            Object object = chain.getThisObject();
            if (!owned || !"com.android.systemui".equals(target.get(object))) return chain.proceed(chain.getArgs().toArray());
            if (client.get(object) != null) return true;
            Context source = context != null ? context : (Context) appInstance.invoke(null);
            if (source == null) return false;
            ContentProviderClient connection = source.getContentResolver().acquireUnstableContentProviderClient(
                    (Uri) providerUri.invoke(null, "com.android.systemui"));
            if (connection == null) return false;
            try { client.set(object, connection); registerCallback.invoke(object); return true; }
            catch (Exception failure) { client.set(object, null); connection.close(); report("connection_failed"); return false; }
        }));
        for (Method send : new Method[]{create, push}) module.registerFeatureHook(module.prepareFeatureHook(send,
                "rm.clock.native_cards." + send.getName(), false).intercept(chain -> {
            boolean ours = owned && "com.android.systemui".equals(target.get(chain.getThisObject()));
            if (ours && priming) return true;
            Object result = chain.proceed(chain.getArgs().toArray());
            Object card = chain.getArgs().get(0);
            if (ours && Boolean.TRUE.equals(result) && card != null
                    && "zte.com.cn.alarmclock_timer_countdown".equals(messageId.invoke(card))) {
                lastCard = card; lastWasTimeUp = Integer.valueOf(1).equals(messagePriority.invoke(card));
                report(lastWasTimeUp ? "time_up_card_sent" : "countdown_card_sent");
            }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(removeCard, "rm.clock.native_cards.remove", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            if (owned && "com.android.systemui".equals(target.get(chain.getThisObject())) && "timer_countdown".equals(chain.getArgs().get(0))) {
                lastCard = null; lastWasTimeUp = false;
            }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(notificationCard, "rm.clock.native_cards.expired", false).intercept(chain -> {
            if (owned) {
                timeUpTotal = (Long) chain.getArgs().get(1); timeUpWall = System.currentTimeMillis();
                expirationOwned = true; alertFallback = false;
            }
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.registerFeatureHook(module.prepareFeatureHook(timeUpEntry, "rm.clock.native_cards.expiry_title", false).intercept(chain -> {
            if (owned) timeUpTitle = (String) title.invoke(model);
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.registerFeatureHook(module.prepareFeatureHook(alertStart, "rm.clock.native_cards.alert", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Intent intent = (Intent) chain.getArgs().get(0);
            if (expirationOwned && intent != null && intent.getBooleanExtra("countdown_ringtone_only", false)) {
                alert = new WeakReference<>((Service) chain.getThisObject());
                // A display can disappear between the expiry publication and asynchronous service start.
                if (!enabled(context)) {
                    restoreAlert(); removePublished(); setTimeUp.invoke(model, false); owned = false;
                }
            }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(alertDestroy, "rm.clock.native_cards.alert_end", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            if (alert.get() == chain.getThisObject()) {
                alert.clear();
                if (expirationOwned) { removePublished(); setTimeUp.invoke(model, false); }
                expirationOwned = false; alertFallback = false;
            }
            return result;
        }));
        for (Method method : new Method[]{playTone, gesture}) module.registerFeatureHook(module.prepareFeatureHook(method,
                "rm.clock.native_cards.fallback_" + method.getName(), false).intercept(chain ->
                fallbackDisplay && alert.get() == chain.getThisObject() ? null : chain.proceed(chain.getArgs().toArray())));
        Context existing = (Context) appInstance.invoke(null);
        if (existing != null) bind(existing);
        module.logFeatureInfo("NATIVE_CLOCK_CARDS_READY live_host_required");
    }

    private boolean enabled(Context source) {
        return bound && source != null && FeatureSettings.enabled(source, ConfigSchema.NATIVE_ISLAND_SELECTED)
                && !FeatureSettings.enabled(source, SystemUiOptions.ISLAND)
                && FeatureSettings.enabled(source, NativeIslandSceneOptions.ENABLED)
                && FeatureSettings.enabled(source, NativeIslandSceneOptions.key("countdown"))
                && Settings.System.getInt(source.getContentResolver(), "dynamic_island_switch_state", 0) == 1
                && arithmeticSafe()
                && NativeIslandCardClient.available(source, "countdown");
    }

    private boolean arithmeticSafe() {
        // This OEM factory converts both the absolute elapsed-time deadline and duration to int.
        // Preserve the ordinary producer if those actual values cannot be represented safely.
        try {
            long now = SystemClock.elapsedRealtime(), remaining = (Long) modelTime.invoke(model);
            long end = (Long) modelEnd.invoke(model);
            return now >= 0 && now <= Integer.MAX_VALUE && remaining >= 0
                    && remaining <= Integer.MAX_VALUE - now && end >= 0 && end <= Integer.MAX_VALUE;
        } catch (Exception unavailable) { return false; }
    }

    private void bind(Context application) {
        if (bound) return;
        context = application.getApplicationContext();
        boolean receiver = false, observer = false;
        try {
            context.registerReceiver(recovery, new IntentFilter(NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION),
                    NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION, main, Context.RECEIVER_EXPORTED);
            receiver = true;
            context.getContentResolver().registerContentObserver(Settings.System.getUriFor("dynamic_island_switch_state"), false, setting);
            observer = true;
            if (!FeatureSettings.addSnapshotListener(context, changed)) throw new IllegalStateException("config_listener");
            bound = true; schedule();
        } catch (RuntimeException unavailable) {
            bound = false; main.removeCallbacks(changed); FeatureSettings.removeSnapshotListener(changed);
            if (observer) try { context.getContentResolver().unregisterContentObserver(setting); } catch (RuntimeException ignored) { }
            if (receiver) try { context.unregisterReceiver(recovery); } catch (RuntimeException ignored) { }
            report("source_binding_failed:" + unavailable.getClass().getSimpleName());
        }
    }
    private void schedule() { main.removeCallbacks(changed); main.post(changed); }
    private Object pusher() throws Exception { return getPusher.invoke(null, context, "com.android.systemui"); }

    private void refresh() {
        if (context == null) return;
        try {
            if (!enabled(context)) {
                if (owned) {
                    restoreAlert(); removePublished();
                    if (expirationOwned) setTimeUp.invoke(model, false);
                    disconnect.invoke(pusher()); owned = false;
                }
                return;
            }
            owned = true;
            Object producer = pusher();
            if (reconnectNeeded) {
                ContentProviderClient old = (ContentProviderClient) client.get(producer); client.set(producer, null);
                if (old != null) old.close();
                reconnectNeeded = false;
            }
            if (!Boolean.TRUE.equals(connect.invoke(producer))) return;
            int state = (Integer) modelState.invoke(model);
            if (Boolean.TRUE.equals(timeUp.invoke(model)) && lastWasTimeUp && lastCard != null && alert.get() != null) {
                push.invoke(producer, lastCard); return;
            }
            if ((state == 2 || state == 3) && !Boolean.TRUE.equals(foreground.invoke(null))) {
                Object manager = managerField.get(model);
                if (state == 3 && getActionListener.invoke(producer) == null) {
                    if (manager == null) { manager = managerConstructor.newInstance(); managerField.set(model, manager); }
                    priming = true;
                    try { startCard.invoke(manager, context, Long.valueOf((Long) modelTime.invoke(model))); }
                    finally { priming = false; }
                }
                background.invoke(model, context);
            } else if (lastCard != null && !lastWasTimeUp) removePublished();
        } catch (Exception failure) { report("source_refresh_failed:" + failure.getClass().getSimpleName() + ":" + failure.getMessage()); }
    }

    private void restoreAlert() throws Exception {
        Service ringing = alert.get();
        if (!expirationOwned || alertFallback || ringing == null || timeUpTotal <= 0) return;
        // Restore the original alert UI without replaying its already-started audio/gesture setup.
        Intent original = new Intent(context, ringing.getClass()).putExtra("countdown_totaltime", timeUpTotal)
                .putExtra("countdown_title", timeUpTitle);
        fallbackDisplay = true;
        try {
            alertStart.invoke(ringing, original, 0, 0); alertStarted.setLong(ringing, timeUpWall);
            alertFallback = true;
        } finally { fallbackDisplay = false; }
    }

    private void removePublished() throws Exception {
        if (lastCard == null) return;
        removeCard.invoke(pusher(), "timer_countdown"); lastCard = null; lastWasTimeUp = false;
    }
    private void report(String value) {
        if (context != null) FeatureSettings.diagnostic(context, "ls_augment_native_island_clock_cards", value);
    }
    private static Field fieldRequired(Class<?> type, String name, Class<?> fieldType) throws NoSuchFieldException {
        Field result = NativeIslandSceneContract.field(type, name, fieldType);
        if (result == null) throw new NoSuchFieldException(type.getName() + "." + name);
        return result;
    }
    private static Method require(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method method = NativeIslandSceneContract.method(type, name, result, args);
        if (method == null) throw new NoSuchMethodException(type.getName() + "." + name);
        return method;
    }
    private static void requireStatic(Method method) throws NoSuchMethodException {
        if (!Modifier.isStatic(method.getModifiers())) throw new NoSuchMethodException("static:" + method.getName());
    }
}
