package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.ContentProviderClient;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import ls.augment.com.ConfigSchema;
import ls.augment.com.NativeIslandSceneOptions;
import ls.augment.com.SystemUiOptions;

/** Uses the NFC service's real notification events and original card/action factories. */
final class NativeIslandNfcTransferCards {
    private static final String PACKAGE = "com.zte.multscr", SCENE = "nfc_transfer";
    private static final String ID = "com.zte.multscr.share_transfer";
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ThreadLocal<Event> event = new ThreadLocal<>();
    private final Field managerInstance, sourcePusher, nativeSupport, notificationCardShown;
    private final Field client, target, producerContext;
    private final Method initialize, cardId, push, remove, register, unregister, providerUri;
    private volatile Binding binding;

    static void install(AugmentModule module, ClassLoader loader) {
        try {
            Method property = require(Class.forName("android.os.SystemProperties", false, loader),
                    "getBoolean", boolean.class, String.class, boolean.class);
            if (Boolean.TRUE.equals(property.invoke(null, "ro.vendor.feature.zte_feature_live_island_full_screen", false))) {
                module.logFeatureInfo("NATIVE_NFC_CARDS original_fullscreen_preserved"); return;
            }
            new NativeIslandNfcTransferCards(module, loader);
        } catch (Throwable missing) { module.logFeatureError("NATIVE_NFC_CARDS_CONTRACT", missing); }
    }

    private NativeIslandNfcTransferCards(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> manager = Class.forName(PACKAGE + ".nfc.NfcFileTransCardMgr", false, loader);
        Class<?> notifications = Class.forName(PACKAGE + ".nfc.NfcFileTransNotificationMgr", false, loader);
        Class<?> type = Class.forName(notifications.getName() + "$NotificationType", false, loader);
        Class<?> producer = Class.forName("com.zte.toolsdk.producer.CardPusher", false, loader);
        Class<?> message = Class.forName("com.zte.toolsdk.common.CardMessage", false, loader);
        managerInstance = staticField(manager, "INSTANCE", manager);
        sourcePusher = staticField(manager, "cardPusher", producer);
        staticField(manager, "isConnected", boolean.class);
        staticField(manager, "currentIsSend", boolean.class);
        nativeSupport = staticField(notifications, "supportFullScreenLiveIsland", boolean.class);
        notificationCardShown = staticField(notifications, "isCardShown", boolean.class);
        initialize = require(manager, "init", void.class, Context.class);
        require(manager, "removeCard", void.class, Context.class);
        require(manager, "handleCardAction", void.class, Context.class, int.class);
        Method build = require(notifications, "buildAndShowNotification", void.class,
                Context.class, android.widget.RemoteViews.class, Bundle.class, type);
        Method dismiss = require(notifications, "cancelNotification", void.class, Context.class);
        Method destroyed = require(Class.forName(PACKAGE + ".nfc.NfcTagDiscoveredService", false, loader), "onDestroy", void.class);
        Method applicationCreate = require(Class.forName(PACKAGE + ".MultiScreenApplication", false, loader), "onCreate", void.class);
        client = field(producer, "mClient", ContentProviderClient.class);
        target = field(producer, "mTargetPackage", String.class);
        producerContext = field(producer, "mContext", Context.class);
        register = require(producer, "registerCallback", void.class);
        unregister = require(producer, "unregisterCallback", void.class);
        push = require(producer, "pushCard", boolean.class, message);
        Method update = require(producer, "updateCard", boolean.class, message);
        remove = require(producer, "removeCard", boolean.class, String.class);
        Method connect = require(producer, "connect", boolean.class), disconnect = require(producer, "disconnect", void.class);
        cardId = require(message, "getCardId", String.class);
        providerUri = require(Class.forName("com.zte.toolsdk.common.CardProviderContract", false, loader),
                "getProviderUri", Uri.class, String.class);
        // Resolve the entire contract without initializing NotificationMgr before Application.onCreate.
        String[] sources = {"showProgressNotification", "updateProgressNotification", "showSucceedNotification",
                "showSendCmdReceivedNotification", "showWaitToReceiveNotification", "showPeerRefusedCanceledNotification",
                "showSelfRefuseCancelNotification", "showFailedNotification"};
        String[] factories = {"showProgressCard", "showProgressCard", "showSucceedCard", "showWaitConfirmCard",
                "showWaitReceiveCard", "showRefusedCanceledCard", "showRefusedCanceledCard", "showFailedCard"};
        Class<?>[][] sourceArgs = {{Context.class, boolean.class}, {Context.class, Integer.class, boolean.class},
                {Context.class, String.class, boolean.class}, {Context.class}, {Context.class},
                {Context.class, boolean.class}, {Context.class, boolean.class}, {Context.class, String.class, boolean.class}};
        Method[] sourceMethods = new Method[sources.length], cardMethods = new Method[sources.length];
        for (int i = 0; i < sources.length; i++) {
            sourceMethods[i] = require(notifications, sources[i], void.class, sourceArgs[i]);
            Class<?>[] args = i == 0 ? sourceArgs[1] : (i == 5 || i == 6)
                    ? new Class<?>[]{Context.class, boolean.class, boolean.class} : sourceArgs[i];
            cardMethods[i] = require(manager, factories[i], void.class, args);
        }
        module.registerFeatureHook(module.prepareFeatureHook(applicationCreate, "rm.nfc.native_cards.application", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            FeatureSettings.diagnostic((Context) chain.getThisObject(), NativeIslandSceneOptions.key(SCENE) + "_source_capability",
                    "ready:" + ls.augment.com.BuildConfig.VERSION_CODE);
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(initialize, "rm.nfc.native_cards.init", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            if (binding == null && !nativeSupport.getBoolean(null) && sourcePusher.get(null) != null) synchronized (this) {
                if (binding == null) try {
                    Binding next = new Binding((Context) chain.getArgs().get(0), sourcePusher.get(null)); next.start(); binding = next;
                } catch (Exception missing) { module.logFeatureError("NATIVE_NFC_CARDS_SOURCE", missing); }
            }
            return result;
        }));
        for (int i = 0; i < sources.length; i++) {
            int index = i;
            module.registerFeatureHook(module.prepareFeatureHook(sourceMethods[i], "rm.nfc.native_cards." + sources[i], false).intercept(chain -> {
                if (nativeSupport.getBoolean(null)) return chain.proceed(chain.getArgs().toArray());
                Event previous = event.get();
                event.set(new Event(chain.getThisObject(), cardMethods[index], factoryArgs(index, chain.getArgs().toArray()), index == 7,
                        index == 2 || index >= 5));
                try { return chain.proceed(chain.getArgs().toArray()); }
                finally { if (previous == null) event.remove(); else event.set(previous); }
            }));
        }
        for (Method end : new Method[]{dismiss, destroyed}) module.registerFeatureHook(module.prepareFeatureHook(end,
                "rm.nfc.native_cards." + end.getName(), false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Binding source = binding;
            if (source != null) try { source.retireActive(); }
            catch (Exception failure) { module.logFeatureError("NATIVE_NFC_CARDS_RETIRE", failure); }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(build, "rm.nfc.native_cards.notification", false).intercept(chain -> {
            Event current = event.get();
            if (current == null || current.owner != chain.getThisObject()) return chain.proceed(chain.getArgs().toArray());
            Context context = (Context) chain.getArgs().get(0);
            if (current.args[0] != context || !configured(context)) return chain.proceed(chain.getArgs().toArray());
            boolean original = notificationCardShown.getBoolean(null), shown = false;
            try {
                boolean live = NativeIslandCardClient.available(context, SCENE);
                Binding prior = binding;
                // Keep genuine terminal events and their OEM removal timers while an adopted host restarts.
                if (live || prior != null && prior.adopted) {
                    if (!current.alreadyProduced) {
                        initialize.invoke(managerInstance.get(null), context);
                        Binding source = binding;
                        if (source != null && source.activate()) current.factory.invoke(managerInstance.get(null), current.args);
                    }
                    Binding source = binding;
                    shown = live && (current.attempted ? current.accepted : source != null && source.published && source.lastCard != null);
                }
            } catch (Exception failure) { module.logFeatureError("NATIVE_NFC_CARDS_EVENT", failure); }
            // Only quiet the OEM notification when our verified live host actually accepted its card.
            notificationCardShown.setBoolean(null, shown);
            try { return chain.proceed(chain.getArgs().toArray()); }
            finally { notificationCardShown.setBoolean(null, original); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(connect, "rm.nfc.native_cards.connection", false).intercept(chain -> {
            Binding source = binding;
            if (source == null || source.producer != chain.getThisObject() || !source.selected)
                return chain.proceed(chain.getArgs().toArray());
            synchronized (source) { return source.connect(); }
        }));
        for (Method send : new Method[]{push, update}) module.registerFeatureHook(module.prepareFeatureHook(send,
                "rm.nfc.native_cards." + send.getName(), false).intercept(chain -> {
            Binding source = binding; Object card = chain.getArgs().get(0);
            if (source == null || source.producer != chain.getThisObject() || card == null
                    || !knownId((String) cardId.invoke(card))) return chain.proceed(chain.getArgs().toArray());
            synchronized (source) {
                if (source.internal) return chain.proceed(chain.getArgs().toArray());
                if (!source.selected && !source.activate()) return chain.proceed(chain.getArgs().toArray());
                Event current = event.get();
                if (current != null) { current.attempted = true; current.accepted = false; }
                if (!configured(source.context)) { source.lastCard = null; return false; }
                source.lastCard = card;
                source.terminal = current != null && current.terminal;
                if (!NativeIslandCardClient.available(source.context, SCENE) || !source.connect()) return false;
                Object result = chain.proceed(chain.getArgs().toArray());
                if (current != null) current.accepted = Boolean.TRUE.equals(result);
                source.published |= Boolean.TRUE.equals(result); return result;
            }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(remove, "rm.nfc.native_cards.remove", false).intercept(chain -> {
            Binding source = binding;
            if (source != null && source.producer == chain.getThisObject() && knownId((String) chain.getArgs().get(0)))
                synchronized (source) { if (!source.internal) { source.lastCard = null; source.published = false; } }
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.registerFeatureHook(module.prepareFeatureHook(disconnect, "rm.nfc.native_cards.disconnect", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray()); Binding source = binding;
            if (source != null && source.producer == chain.getThisObject()) synchronized (source) {
                source.lastCard = null; source.published = false; source.connection = null;
            }
            return result;
        }));
        module.logFeatureInfo("NATIVE_NFC_CARDS_READY genuine_notification_events");
    }

    static boolean knownId(String value) { return ID.equals(value) || (PACKAGE + "_" + ID).equals(value); }
    static Object[] factoryArgs(int index, Object[] args) {
        if (index == 0) return new Object[]{args[0], Integer.valueOf(0), args[1]};
        if (index == 5 || index == 6) return new Object[]{args[0], args[1], Boolean.valueOf(index == 6)};
        return args;
    }
    private boolean configured(Context context) throws IllegalAccessException {
        String excluded = Settings.System.getString(context.getContentResolver(), "dynamic_island_keys_close");
        return !nativeSupport.getBoolean(null) && FeatureSettings.enabled(context, ConfigSchema.NATIVE_ISLAND_SELECTED)
                && !FeatureSettings.enabled(context, SystemUiOptions.ISLAND)
                && FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED)
                && FeatureSettings.enabled(context, NativeIslandSceneOptions.key(SCENE))
                && Settings.System.getInt(context.getContentResolver(), "dynamic_island_switch_state", 0) == 1
                && (excluded == null || !excluded.contains("share_transfer"));
    }
    private static final class Event {
        final Object owner; final Method factory; final Object[] args; final boolean alreadyProduced, terminal;
        boolean attempted, accepted;
        Event(Object owner, Method factory, Object[] args, boolean alreadyProduced, boolean terminal) {
            this.owner = owner; this.factory = factory; this.args = args; this.alreadyProduced = alreadyProduced; this.terminal = terminal;
        }
    }
    private final class Binding {
        final Context context; final Object producer;
        final Runnable changed = this::schedule, refresh = this::sync;
        final ContentObserver settings = new ContentObserver(main) { @Override public void onChange(boolean selfChange) { schedule(); } };
        final BroadcastReceiver recovery = new BroadcastReceiver() {
            @Override public void onReceive(Context ignored, Intent intent) {
                if (intent != null && NativeIslandScenePolicy.NFC_TRANSFER_SYNC_ACTION.equals(intent.getAction())) {
                    NativeIslandCardClient.invalidate(); synchronized (Binding.this) { reconnect = true; } schedule();
                }
            }
        };
        volatile boolean selected;
        boolean adopted, published, reconnect, internal, terminal;
        Object lastCard; ContentProviderClient connection;
        Binding(Context sourceContext, Object producer) throws Exception {
            context = sourceContext.getApplicationContext(); this.producer = producer;
            if (!PACKAGE.equals(context.getPackageName()) || !"com.android.systemui".equals(target.get(producer))
                    || !PACKAGE.equals(((Context) producerContext.get(producer)).getPackageName()))
                throw new IllegalStateException("nfc_producer_identity");
        }
        void start() {
            boolean observing = false;
            try {
                FeatureSettings.addSnapshotListener(context, changed);
                for (String key : new String[]{"dynamic_island_switch_state", "dynamic_island_keys_close"}) {
                    context.getContentResolver().registerContentObserver(Settings.System.getUriFor(key), false, settings); observing = true;
                }
                context.registerReceiver(recovery, new IntentFilter(NativeIslandScenePolicy.NFC_TRANSFER_SYNC_ACTION),
                        NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION, main, Context.RECEIVER_EXPORTED);
            } catch (RuntimeException failure) {
                FeatureSettings.removeSnapshotListener(changed);
                if (observing) context.getContentResolver().unregisterContentObserver(settings);
                main.removeCallbacks(refresh); throw failure;
            }
        }
        synchronized boolean activate() throws IllegalAccessException {
            if (!configured(context)) return false;
            if (!selected) selected = NativeIslandCardClient.available(context, SCENE);
            return selected;
        }
        void schedule() { main.removeCallbacks(refresh); main.post(refresh); }
        synchronized void retireActive() throws Exception {
            if (!selected || terminal) return;
            // Disconnection can dismiss the notification without producing a terminal card.
            lastCard = null;
            try {
                if (published && connection != null && client.get(producer) == connection) {
                    internal = true; try { remove.invoke(producer, ID); } finally { internal = false; }
                }
            } finally { published = false; }
        }
        boolean connect() throws Exception {
            if (connection != null && client.get(producer) == connection) return true;
            if (connection != null) release();
            Object existing = client.get(producer);
            if (existing != null) {
                if (adopted) return false;
                try { unregister.invoke(producer); } catch (Exception unavailable) { report("original_callback_release_unavailable"); }
                finally { client.set(producer, null); ((ContentProviderClient) existing).close(); }
            }
            adopted = true;
            ContentProviderClient next = context.getContentResolver().acquireUnstableContentProviderClient((Uri) providerUri.invoke(null, "com.android.systemui"));
            if (next == null) return false;
            try { client.set(producer, next); register.invoke(producer); connection = next; return true; }
            catch (Exception failure) { client.set(producer, null); next.close(); return false; }
        }
        void release() throws Exception {
            ContentProviderClient previous = connection; connection = null;
            if (previous == null) return;
            try {
                if (client.get(producer) == previous) {
                    try { unregister.invoke(producer); } catch (Exception ignored) { }
                    finally { client.set(producer, null); }
                }
            } finally { previous.close(); }
        }
        synchronized void sync() {
            try {
                if (reconnect) { release(); reconnect = false; published = false; }
                if (!configured(context)) {
                    lastCard = null;
                    if (published && connection != null && client.get(producer) == connection) {
                        internal = true; try { remove.invoke(producer, ID); } finally { internal = false; }
                    }
                    published = false; release(); return;
                }
                if (!activate() || lastCard == null || !NativeIslandCardClient.available(context, SCENE)) return;
                if (connect()) {
                    internal = true; try { published = Boolean.TRUE.equals(push.invoke(producer, lastCard)); } finally { internal = false; }
                }
            } catch (Exception failure) { report("sync_failed:" + failure.getClass().getSimpleName()); }
        }
        void report(String text) { FeatureSettings.diagnostic(context, "ls_augment_native_island_nfc_transfer_cards", text); }
    }
    private static Method require(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method method = NativeIslandSceneContract.method(type, name, result, args);
        if (method == null) throw new NoSuchMethodException(type.getName() + "." + name);
        return method;
    }
    private static Field field(Class<?> type, String name, Class<?> value) throws NoSuchFieldException {
        Field field = NativeIslandSceneContract.field(type, name, value);
        if (field == null) throw new NoSuchFieldException(type.getName() + "." + name);
        return field;
    }
    private static Field staticField(Class<?> type, String name, Class<?> value) throws NoSuchFieldException {
        Field field = field(type, name, value);
        if (!Modifier.isStatic(field.getModifiers())) throw new NoSuchFieldException("static:" + type.getName() + "." + name);
        return field;
    }
}
