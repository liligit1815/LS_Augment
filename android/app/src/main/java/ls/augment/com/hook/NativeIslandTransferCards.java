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

/** OEM transfer state, RemoteViews and cancel callbacks; never starts or fabricates a transfer. */
final class NativeIslandTransferCards {
    private static final String PACKAGE = "com.zte.cn.zteshare", ID = "share_transfer";
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Field sourceContext, sourcePusher, client, target, producerContext;
    private final Method cardId, push, remove, register, unregister, providerUri;
    private volatile Binding binding;

    static void install(AugmentModule module, ClassLoader loader) {
        try {
            Method property = require(Class.forName("android.os.SystemProperties", false, loader),
                    "getBoolean", boolean.class, String.class, boolean.class);
            if (Boolean.TRUE.equals(property.invoke(null, "ro.vendor.feature.zte_feature_live_island_full_screen", false))) {
                module.logFeatureInfo("NATIVE_TRANSFER_CARDS original_fullscreen_preserved"); return;
            }
            new NativeIslandTransferCards(module, loader);
        } catch (Throwable missing) { module.logFeatureError("NATIVE_TRANSFER_CARDS_CONTRACT", missing); }
    }

    private NativeIslandTransferCards(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> manager = Class.forName(PACKAGE + ".o", false, loader);
        Class<?> state = Class.forName(PACKAGE + ".d", false, loader);
        Class<?> producer = Class.forName("com.zte.toolsdk.producer.CardPusher", false, loader);
        Class<?> message = Class.forName("com.zte.toolsdk.common.CardMessage", false, loader);
        requireStates(state);
        sourceContext = field(manager, "t", Context.class);
        sourcePusher = field(manager, "a", producer);
        field(manager, "d", state);
        Method instance = require(manager, "x", manager, Context.class);
        Method gate = require(manager, "A", boolean.class);
        Method applicationCreate = require(Class.forName(PACKAGE + ".ZteShareApplication", false, loader), "onCreate", void.class);
        if (!Modifier.isStatic(instance.getModifiers()) || !Modifier.isStatic(gate.getModifiers())
                || !Modifier.isStatic(sourceContext.getModifiers())) throw new IllegalStateException("transfer_static_contract");
        require(manager, "F", void.class); // Real source removal also clears its state/timers.
        require(manager, "Y", void.class, int.class, long.class, long.class);
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

        module.registerFeatureHook(module.prepareFeatureHook(applicationCreate, "rm.transfer.native_cards.application", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            FeatureSettings.diagnostic((Context) chain.getThisObject(), NativeIslandSceneOptions.key("transfer") + "_source_capability",
                    "ready:" + ls.augment.com.BuildConfig.VERSION_CODE);
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(instance, "rm.transfer.native_cards.instance", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            if (result != null && binding == null) synchronized (this) {
                if (binding == null) {
                    try { Binding next = new Binding(result); next.start(); binding = next; }
                    catch (Exception missing) { module.logFeatureError("NATIVE_TRANSFER_CARDS_SOURCE", missing); }
                }
            }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(gate, "rm.transfer.native_cards.gate", false).intercept(chain -> {
            Object original = chain.proceed(chain.getArgs().toArray());
            Binding current = binding;
            if (Boolean.TRUE.equals(original) || current == null) return original;
            return current.activate();
        }));
        module.registerFeatureHook(module.prepareFeatureHook(connect, "rm.transfer.native_cards.connection", false).intercept(chain -> {
            Binding current = binding;
            if (current == null || current.producer != chain.getThisObject() || !current.selected)
                return chain.proceed(chain.getArgs().toArray());
            synchronized (current) { return current.connect(); }
        }));
        for (Method send : new Method[]{push, update}) module.registerFeatureHook(module.prepareFeatureHook(send,
                "rm.transfer.native_cards." + send.getName(), false).intercept(chain -> {
            Binding current = binding; Object card = chain.getArgs().get(0);
            if (current == null || !current.selected || current.producer != chain.getThisObject()
                    || card == null || !knownId((String) cardId.invoke(card))) return chain.proceed(chain.getArgs().toArray());
            synchronized (current) {
                if (current.internal) return chain.proceed(chain.getArgs().toArray());
                if (!current.configured()) { current.lastCard = null; return false; }
                current.lastCard = card;
                if (!NativeIslandCardClient.available(current.context, "transfer") || !current.connect()) return false;
                Object result = chain.proceed(chain.getArgs().toArray());
                current.published |= Boolean.TRUE.equals(result);
                return result;
            }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(remove, "rm.transfer.native_cards.remove", false).intercept(chain -> {
            Binding current = binding;
            if (current != null && current.producer == chain.getThisObject() && knownId((String) chain.getArgs().get(0)))
                synchronized (current) { if (!current.internal) { current.lastCard = null; current.published = false; } }
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.registerFeatureHook(module.prepareFeatureHook(disconnect, "rm.transfer.native_cards.disconnect", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Binding current = binding;
            if (current != null && current.producer == chain.getThisObject()) synchronized (current) {
                current.lastCard = null; current.published = false; current.connection = null;
            }
            return result;
        }));
        module.logFeatureInfo("NATIVE_TRANSFER_CARDS_READY genuine_transfer_messages");
    }

    static boolean knownId(String value) { return ID.equals(value) || (PACKAGE + "_" + ID).equals(value); }

    static void requireStates(Class<?> state) {
        if (!state.isEnum()) throw new IllegalStateException("transfer_state_enum");
        // OEM fields are a..l; the constructor retains the semantic Enum.name().
        // JADX's restored field labels are not runtime reflection names.
        java.util.Set<String> names = new java.util.HashSet<>();
        for (Object value : state.getEnumConstants()) names.add(((Enum<?>) value).name());
        for (String name : new String[]{"SENDING_IN_PROGRESS", "RECEIVING_IN_PROGRESS", "SENDING_SUCCESS",
                "RECEIVING_SUCCESS", "SENDING_CANCELED", "RECEIVING_CANCELED", "SENDING_FAILED", "RECEIVING_FAILED"})
            if (!names.contains(name)) throw new IllegalStateException("transfer_state_missing:" + name);
    }

    private final class Binding {
        final Context context;
        final Object producer;
        final Runnable refresh = this::sync, changed = this::schedule;
        final ContentObserver settings = new ContentObserver(main) {
            @Override public void onChange(boolean selfChange) { schedule(); }
        };
        final BroadcastReceiver recovery = new BroadcastReceiver() {
            @Override public void onReceive(Context ignored, Intent intent) {
                if (intent != null && NativeIslandScenePolicy.TRANSFER_SYNC_ACTION.equals(intent.getAction())) {
                    NativeIslandCardClient.invalidate(); synchronized (Binding.this) { reconnect = true; } schedule();
                }
            }
        };
        volatile boolean selected;
        boolean adopted, published, reconnect, internal;
        Object lastCard;
        ContentProviderClient connection;
        Binding(Object manager) throws Exception {
            context = ((Context) sourceContext.get(null)).getApplicationContext();
            producer = sourcePusher.get(manager);
            if (!PACKAGE.equals(context.getPackageName()) || producer == null
                    || !"com.android.systemui".equals(target.get(producer))
                    || !PACKAGE.equals(((Context) producerContext.get(producer)).getPackageName()))
                throw new IllegalStateException("transfer_producer_identity");
        }
        void start() {
            boolean observing = false;
            try {
                FeatureSettings.addSnapshotListener(context, changed);
                for (String key : new String[]{"dynamic_island_switch_state", "dynamic_island_keys_close"}) {
                    context.getContentResolver().registerContentObserver(Settings.System.getUriFor(key), false, settings);
                    observing = true;
                }
                context.registerReceiver(recovery, new IntentFilter(NativeIslandScenePolicy.TRANSFER_SYNC_ACTION),
                        NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION, main, Context.RECEIVER_EXPORTED);
            } catch (RuntimeException failure) {
                FeatureSettings.removeSnapshotListener(changed);
                if (observing) context.getContentResolver().unregisterContentObserver(settings);
                main.removeCallbacks(refresh); throw failure;
            }
        }
        boolean configured() {
            String excluded = Settings.System.getString(context.getContentResolver(), "dynamic_island_keys_close");
            return FeatureSettings.enabled(context, ConfigSchema.NATIVE_ISLAND_SELECTED)
                    && !FeatureSettings.enabled(context, SystemUiOptions.ISLAND)
                    && FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED)
                    && FeatureSettings.enabled(context, NativeIslandSceneOptions.key("transfer"))
                    && Settings.System.getInt(context.getContentResolver(), "dynamic_island_switch_state", 0) == 1
                    && (excluded == null || !excluded.contains(ID));
        }
        synchronized boolean activate() {
            if (!configured()) return false;
            if (!selected) selected = NativeIslandCardClient.available(context, "transfer");
            // Once selected, let the OEM producer finish its real removal timers during host loss.
            // Sending still checks the live host independently; no card is created by this gate.
            return selected;
        }
        void schedule() { main.removeCallbacks(refresh); main.post(refresh); }
        boolean connect() throws Exception {
            if (connection != null && client.get(producer) == connection) return true;
            if (connection != null) release();
            Object existing = client.get(producer);
            if (existing != null) {
                if (adopted) return false; // A later owner replaced our connection.
                // This exact verified manager creates its original stable SDK connection before x() returns.
                try { unregister.invoke(producer); } catch (Exception unavailable) { report("original_callback_release_unavailable"); }
                finally { client.set(producer, null); ((ContentProviderClient) existing).close(); }
            }
            adopted = true;
            ContentProviderClient next = context.getContentResolver().acquireUnstableContentProviderClient(
                    (Uri) providerUri.invoke(null, "com.android.systemui"));
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
                if (!configured()) {
                    lastCard = null;
                    if (published && connection != null && client.get(producer) == connection) {
                        internal = true; try { remove.invoke(producer, ID); } finally { internal = false; }
                    }
                    published = false; release(); return;
                }
                if (!activate() || lastCard == null || !NativeIslandCardClient.available(context, "transfer")) return;
                if (connect()) {
                    internal = true;
                    try { published = Boolean.TRUE.equals(push.invoke(producer, lastCard)); }
                    finally { internal = false; }
                }
            } catch (Exception failure) { report("sync_failed:" + failure.getClass().getSimpleName()); }
        }
        void report(String message) { FeatureSettings.diagnostic(context, "ls_augment_native_island_transfer_cards", message); }
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
}
