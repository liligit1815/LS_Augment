package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.ContentProviderClient;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import ls.augment.com.ConfigSchema;
import ls.augment.com.NativeIslandSceneOptions;
import ls.augment.com.SystemUiOptions;

/** Selects the dialer's own call cards and floating controls without creating a call. */
final class NativeIslandCallCards {
    private static final String PACKAGE = "com.android.dialer", ID = "call_background";
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ThreadLocal<Boolean> originalNotification = new ThreadLocal<>();
    private final Field hardware, managerInstance, sourcePusher, producerContext, target, client, floatInstance, floatContext;
    private final Method getContext, removeCards, maybeShow, hideLegacy, stopLegacyTimer, register, unregister, providerUri, cardId, stopFloat;
    private volatile Context context;
    private volatile boolean resources, selected, published, floating, transportFailed;
    private boolean adopted, reconnect, syncing, observers;
    private ContentProviderClient connection;
    private final Runnable refresh = this::sync;
    private final Runnable changed = () -> { transportFailed = false; schedule(); };
    private final ContentObserver settings = new ContentObserver(main) {
        @Override public void onChange(boolean self) { changed.run(); }
    };
    private final BroadcastReceiver recovery = new BroadcastReceiver() {
        @Override public void onReceive(Context ignored, Intent intent) {
            if (intent != null && NativeIslandScenePolicy.CALL_SYNC_ACTION.equals(intent.getAction())) {
                NativeIslandCardClient.invalidate(); transportFailed = false;
                synchronized (NativeIslandCallCards.this) { reconnect = true; }
                schedule();
            }
        }
    };

    static void install(AugmentModule module, ClassLoader loader) {
        try { new NativeIslandCallCards(module, loader); }
        catch (Throwable missing) { module.logFeatureError("NATIVE_CALL_CARDS_CONTRACT", missing); }
    }

    private NativeIslandCallCards(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> feature = Class.forName("com.android.incallui.zte.Feature", false, loader);
        Class<?> app = Class.forName("com.android.incallui.InCallApp", false, loader);
        Class<?> manager = Class.forName("com.android.incallui.zte.island.IslandCardManager", false, loader);
        Class<?> floats = Class.forName("com.android.incallui.zte.FloatViewManager", false, loader);
        Class<?> window = Class.forName("com.android.incallui.zte.FloatWindowService", false, loader);
        Class<?> producer = Class.forName("com.zte.toolsdk.producer.CardPusher", false, loader);
        Class<?> message = Class.forName("com.zte.toolsdk.common.CardMessage", false, loader);
        Class<?> call = Class.forName("com.android.incallui.Call", false, loader);
        Class<?> callList = Class.forName("com.android.incallui.CallList", false, loader);
        hardware = staticField(feature, "ZTE_FEATURE_ISLAND_CARD_MODE", boolean.class);
        managerInstance = staticField(manager, "sInstance", manager);
        sourcePusher = field(manager, "mCardPusher", producer);
        field(manager, "mContext", Context.class); field(manager, "mCurrentCardMessage", message);
        field(manager, "mCall", call); field(manager, "mCallId", String.class);
        field(manager, "mCallListListenerRegistered", boolean.class);
        floatInstance = staticField(floats, "sInstance", floats);
        floatContext = field(floats, "mContext", Context.class);
        getContext = require(app, "getAppContext", Context.class);
        removeCards = require(manager, "removeAllCards", void.class);
        maybeShow = require(floats, "maybeShowFloatView", void.class);
        hideLegacy = require(floats, "updateVisibilityDB", void.class, boolean.class);
        stopLegacyTimer = require(floats, "removeTimeUpdateMessage", void.class);
        stopFloat = require(window, "stopMyService", void.class, Context.class);
        require(window, "isFloatWindowServiceRunning", boolean.class);
        require(manager, "handleSmallIslandClick", void.class);
        require(manager, "showIslandCardForActiveCall", void.class, Context.class);
        require(manager, "resolveCallForIslandUi", call, callList);
        require(manager, "wouldShowStarIslandWhenLeavingInCallUi", boolean.class, Context.class);
        require(callList, "getInstance", callList); require(callList, "getLiveCallCount", int.class);
        require(call, "getState", int.class); require(call, "getConnectTimeMillis", long.class);
        producerContext = field(producer, "mContext", Context.class);
        target = field(producer, "mTargetPackage", String.class);
        client = field(producer, "mClient", ContentProviderClient.class);
        register = require(producer, "registerCallback", void.class);
        unregister = require(producer, "unregisterCallback", void.class);
        providerUri = require(Class.forName("com.zte.toolsdk.common.CardProviderContract", false, loader),
                "getProviderUri", Uri.class, String.class);
        cardId = require(message, "getCardId", String.class);
        Method create = require(app, "onCreate", void.class);
        Method capability = require(feature, "isSupportIslandCardMode", boolean.class);
        Method initialize = require(manager, "init", void.class, Context.class);
        Method destroy = require(manager, "destroy", void.class);
        Method wait = require(manager, "tryWaitLauncherIslandEnterAnimEndThenShow", boolean.class, Context.class, boolean.class);
        Method connect = require(producer, "connect", boolean.class), disconnect = require(producer, "disconnect", void.class);
        Method push = require(producer, "pushCard", boolean.class, message), update = require(producer, "updateCard", boolean.class, message);
        Method remove = require(producer, "removeCard", boolean.class, String.class);
        Method startWindow = require(window, "onStartCommand", int.class, Intent.class, int.class, int.class);
        Method destroyWindow = require(window, "onDestroy", void.class);
        Method notification = require(Class.forName("com.android.incallui.StatusBarNotifier", false, loader),
                "buildAndSendNotification", void.class, call,
                Class.forName("com.android.incallui.ContactInfoCache$ContactCacheEntry", false, loader));

        module.registerFeatureHook(module.prepareFeatureHook(create, "rm.call.native_cards.application", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            try { start((Context) getContext.invoke(null)); }
            catch (Exception missing) { module.logFeatureError("NATIVE_CALL_CARDS_RESOURCES", missing); }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(capability, "rm.call.native_cards.capability", false).intercept(chain -> {
            Object original = chain.proceed(chain.getArgs().toArray());
            if (hardware.getBoolean(null)) return original;
            // Preserve native notification buttons even while our compact card is selected.
            if (Boolean.TRUE.equals(originalNotification.get())) return original;
            return floating || enabled();
        }));
        module.registerFeatureHook(module.prepareFeatureHook(notification, "rm.call.native_cards.notification", false).intercept(chain -> {
            Boolean prior = originalNotification.get(); originalNotification.set(true);
            try { return chain.proceed(chain.getArgs().toArray()); }
            finally { if (prior == null) originalNotification.remove(); else originalNotification.set(prior); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(wait, "rm.call.native_cards.launcher_wait", false).intercept(chain -> {
            // Ordinary SystemUI has no matching full-screen launcher transition callback.
            if (!hardware.getBoolean(null) && enabled()) return false;
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.registerFeatureHook(module.prepareFeatureHook(initialize, "rm.call.native_cards.init", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            if (enabled()) selected = true;
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(connect, "rm.call.native_cards.connection", false).intercept(chain -> {
            if (!ours(chain.getThisObject()) || !selected) return chain.proceed(chain.getArgs().toArray());
            synchronized (this) { return enabled() && connect(chain.getThisObject()); }
        }));
        for (Method send : new Method[]{push, update}) module.registerFeatureHook(module.prepareFeatureHook(send,
                "rm.call.native_cards." + send.getName(), false).intercept(chain -> {
            Object producerObject = chain.getThisObject(), card = chain.getArgs().get(0);
            if (!ours(producerObject) || card == null || !knownId((String) cardId.invoke(card)) || !selected)
                return chain.proceed(chain.getArgs().toArray());
            synchronized (this) {
                if (!enabled() || !connect(producerObject)) { transportFailed = true; schedule(); return false; }
                Object result = chain.proceed(chain.getArgs().toArray());
                published = Boolean.TRUE.equals(result);
                if (!published) { transportFailed = true; schedule(); }
                else {
                    Object legacy = floatInstance.get(null);
                    if (legacy != null && floatContext.get(legacy) != null) {
                        hideLegacy.invoke(legacy, false); stopLegacyTimer.invoke(legacy);
                    }
                }
                return result;
            }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(remove, "rm.call.native_cards.remove", false).intercept(chain -> {
            if (ours(chain.getThisObject()) && knownId((String) chain.getArgs().get(0))) published = false;
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.registerFeatureHook(module.prepareFeatureHook(hideLegacy, "rm.call.native_cards.legacy_visibility", false).intercept(chain -> {
            Object[] args = chain.getArgs().toArray();
            if (published && enabled()) args[0] = false;
            return chain.proceed(args);
        }));
        for (Method end : new Method[]{destroy, disconnect}) module.registerFeatureHook(module.prepareFeatureHook(end,
                "rm.call.native_cards." + end.getName(), false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            if (end == destroy || ours(chain.getThisObject())) synchronized (this) {
                if (selected) {
                    published = false;
                    if (end == disconnect && client.get(chain.getThisObject()) == null) connection = null;
                    else release();
                }
            }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(startWindow, "rm.call.native_cards.float_start", false).intercept(chain -> {
            Intent intent = (Intent) chain.getArgs().get(0);
            if (enabled() && intent != null && intent.getBooleanExtra("from_island_click", false)) floating = true;
            try { return chain.proceed(chain.getArgs().toArray()); }
            catch (Throwable failure) { floating = false; throw failure; }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(destroyWindow, "rm.call.native_cards.float_destroy", false).intercept(chain -> {
            try { return chain.proceed(chain.getArgs().toArray()); }
            finally { if (floating) { floating = false; schedule(); } }
        }));
        module.logFeatureInfo("NATIVE_CALL_CARDS_READY original_call_list_and_float_controls");
    }

    private void start(Context candidate) throws Exception {
        if (candidate == null || !PACKAGE.equals(candidate.getPackageName()) || hardware.getBoolean(null)) return;
        for (String name : new String[]{"call_small_island_card", "call_mini_island_card", "call_large_island_card"})
            if (candidate.getResources().getIdentifier(name, "layout", PACKAGE) == 0) throw new IllegalStateException("call_layout:" + name);
        for (String name : new String[]{"call_island_layout", "call_mini_island_layout"})
            if (candidate.getResources().getIdentifier(name, "id", PACKAGE) == 0) throw new IllegalStateException("call_action:" + name);
        context = candidate.getApplicationContext(); resources = true;
        if (!observers) {
            boolean observing = false;
            try {
                FeatureSettings.addSnapshotListener(context, changed);
                context.getContentResolver().registerContentObserver(Settings.System.getUriFor("dynamic_island_switch_state"), false, settings);
                observing = true;
                context.registerReceiver(recovery, new IntentFilter(NativeIslandScenePolicy.CALL_SYNC_ACTION),
                        NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION, main, Context.RECEIVER_EXPORTED);
                observers = true;
            } catch (RuntimeException failure) {
                resources = false; FeatureSettings.removeSnapshotListener(changed);
                if (observing) context.getContentResolver().unregisterContentObserver(settings);
                throw failure;
            }
        }
        FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key("call") + "_source_capability", "ready:" + ls.augment.com.BuildConfig.VERSION_CODE);
    }
    private boolean enabled() throws IllegalAccessException {
        Context c = context;
        boolean allowed = c != null && resources && !hardware.getBoolean(null) && !transportFailed
                && FeatureSettings.enabled(c, ConfigSchema.NATIVE_ISLAND_SELECTED)
                && !FeatureSettings.enabled(c, SystemUiOptions.ISLAND)
                && FeatureSettings.enabled(c, NativeIslandSceneOptions.ENABLED)
                && FeatureSettings.enabled(c, NativeIslandSceneOptions.key("call"))
                && Settings.System.getInt(c.getContentResolver(), "dynamic_island_switch_state", 0) == 1
                && NativeIslandCardClient.available(c, "call");
        if (allowed) selected = true;
        return allowed;
    }
    private boolean ours(Object producer) throws Exception {
        Object owner = managerInstance.get(null);
        return owner != null && producer != null && producer == sourcePusher.get(owner) && !hardware.getBoolean(null)
                && "com.android.systemui".equals(target.get(producer))
                && producerContext.get(producer) instanceof Context
                && PACKAGE.equals(((Context) producerContext.get(producer)).getPackageName());
    }
    static boolean knownId(String id) { return ID.equals(id) || (PACKAGE + "_" + ID).equals(id); }
    private boolean connect(Object producer) throws Exception {
        if (connection != null && client.get(producer) == connection) return true;
        if (connection != null) release();
        Object existing = client.get(producer);
        if (existing != null) {
            if (adopted) return false;
            try { unregister.invoke(producer); }
            catch (Exception missing) { report("original_callback_release_unavailable"); }
            finally { client.set(producer, null); ((ContentProviderClient) existing).close(); }
        }
        adopted = true;
        ContentProviderClient next = context.getContentResolver().acquireUnstableContentProviderClient((Uri) providerUri.invoke(null, "com.android.systemui"));
        if (next == null) return false;
        try { client.set(producer, next); register.invoke(producer); connection = next; return true; }
        catch (Exception failure) { client.set(producer, null); next.close(); return false; }
    }
    private void release() throws Exception {
        ContentProviderClient previous = connection; connection = null;
        Object owner = managerInstance.get(null), producer = owner == null ? null : sourcePusher.get(owner);
        if (previous == null) return;
        try {
            if (producer != null && client.get(producer) == previous) {
                try { unregister.invoke(producer); } catch (Exception ignored) { }
                finally { client.set(producer, null); }
            }
        } finally { previous.close(); }
    }
    private void schedule() { main.removeCallbacks(refresh); main.post(refresh); }
    private synchronized void sync() {
        if (syncing || !selected || context == null) return;
        syncing = true;
        try {
            if (reconnect) { release(); reconnect = false; }
            boolean allowed = enabled();
            Object owner = managerInstance.get(null), legacy = floatInstance.get(null);
            if (owner != null) removeCards.invoke(owner);
            published = false;
            if (!allowed) {
                if (floating) stopFloat.invoke(null, context); // Only our island-opened UI, never a call.
                release();
            }
            // Re-evaluate actual CallList, foreground, game, driving and ringing-card conditions.
            // Never replay a cached call card after a process or configuration change.
            if (legacy != null && floatContext.get(legacy) != null && !floating) maybeShow.invoke(legacy);
        } catch (Exception failure) { report("sync_failed:" + failure.getClass().getSimpleName()); }
        finally { syncing = false; }
    }
    private void report(String detail) { FeatureSettings.diagnostic(context, "ls_augment_native_island_call_cards", detail); }
    private static Method require(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method m = NativeIslandSceneContract.method(type, name, result, args);
        if (m == null) throw new NoSuchMethodException(type.getName() + "." + name); return m;
    }
    private static Field field(Class<?> type, String name, Class<?> value) throws NoSuchFieldException {
        Field f = NativeIslandSceneContract.field(type, name, value);
        if (f == null) throw new NoSuchFieldException(type.getName() + "." + name); return f;
    }
    private static Field staticField(Class<?> type, String name, Class<?> value) throws NoSuchFieldException {
        Field f = field(type, name, value);
        if (!Modifier.isStatic(f.getModifiers())) throw new NoSuchFieldException("static:" + name); return f;
    }
}
