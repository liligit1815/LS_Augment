package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.ContentProviderClient;
import android.content.ContentValues;
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
import java.util.LinkedHashMap;
import java.util.Map;
import ls.augment.com.ConfigSchema;
import ls.augment.com.NativeIslandCardProtocol;
import ls.augment.com.NativeIslandSceneOptions;
import ls.augment.com.SystemUiOptions;

/** Relays genuine translation producer messages; never starts a meeting or call. */
final class NativeIslandTranslationCards {
    private static final String PKG = "com.zte.nebulatranslation";
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Class<?> supportedType, meetingType, aiType;
    private final Field appContext, pusher, supported, feature, client, target, meetingInstance, aiInstance;
    private final Method featureBoolean, cardId, cardVisible, visible, setVisible, push, remove,
            registerCallback, unregisterCallback, providerUri;
    private final NativeIslandMeetingState meetingState;
    private volatile Binding binding;

    static void install(AugmentModule module, ClassLoader loader) {
        try { new NativeIslandTranslationCards(module, loader); }
        catch (Throwable missing) { module.logFeatureError("NATIVE_TRANSLATION_CARDS_CONTRACT", missing); }
    }

    private NativeIslandTranslationCards(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> manager = Class.forName(PKG + ".ui.IslandManager", false, loader);
        Class<?> message = Class.forName("com.zte.toolsdk.common.CardMessage", false, loader);
        Class<?> continuation = Class.forName("kotlin.coroutines.Continuation", false, loader);
        Class<?> producer = Class.forName("com.zte.toolsdk.producer.CardPusher", false, loader);
        Class<?> capability = Class.forName("com.zte.domain.api.IsIslandSupportedUseCase", false, loader);
        supportedType = Class.forName("com.zte.domain.impl.DefaultIslandSupportedUseCase", false, loader);
        Class<?> featureType = Class.forName("com.zte.android.api.Feature", false, loader);
        Class<?> base = Class.forName(PKG + ".domain.BaseSystemUiResolver", false, loader);
        meetingType = Class.forName(PKG + ".domain.MeetingSystemUiResolver", false, loader);
        aiType = Class.forName(PKG + ".domain.NCSystemUiResolver", false, loader);
        if (!base.isAssignableFrom(meetingType) || !base.isAssignableFrom(aiType)
                || !capability.isAssignableFrom(supportedType)) throw new IllegalStateException("translation_types");
        appContext = field(manager, "appCtx", Context.class);
        pusher = field(manager, "cardPusher", producer);
        supported = field(manager, "isIslandSupported", capability);
        feature = field(supportedType, "feature", featureType);
        featureBoolean = require(featureType, "getBoolean", boolean.class, String.class, boolean.class);
        cardId = require(message, "getCardId", String.class);
        cardVisible = require(manager, "isCardVisible", boolean.class, message);
        visible = require(base, "isVisible", boolean.class);
        setVisible = require(base, "setVisible", void.class, boolean.class);
        meetingInstance = field(meetingType, "INSTANCE", meetingType);
        aiInstance = field(aiType, "INSTANCE", aiType);
        client = field(producer, "mClient", ContentProviderClient.class);
        target = field(producer, "mTargetPackage", String.class);
        push = require(producer, "pushCard", boolean.class, message);
        remove = require(producer, "removeCard", boolean.class, String.class);
        registerCallback = require(producer, "registerCallback", void.class);
        unregisterCallback = require(producer, "unregisterCallback", void.class);
        providerUri = require(Class.forName("com.zte.toolsdk.common.CardProviderContract", false, loader),
                "getProviderUri", Uri.class, String.class);
        Method notify = require(manager, "notify", Object.class, message, continuation);
        Method cancel = require(manager, "cancel", Object.class, String.class, continuation);
        Method updateVisible = require(base, "updateVisible", void.class, Context.class, int.class);
        Method updateInfo = require(base, "updateInfo", void.class, Context.class, String.class, String.class);
        meetingState = NativeIslandMeetingState.install(module, loader, () -> {
            Binding current = binding;
            if (current != null) current.schedule();
        });

        module.registerFeatureHook(module.prepareFeatureHook(notify, "rm.translation.native_cards.notify", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Object owner = chain.getThisObject(), messageObject = chain.getArgs().get(0);
            String scene = sourceScene(messageObject == null ? null : (String) cardId.invoke(messageObject));
            try { if (scene != null && !nativeFull(owner)) main.post(() -> {
                try {
                    Binding current = binding;
                    if (current == null) { current = new Binding(owner); current.start(); binding = current; }
                    if (current.owner == owner) { current.messages.put(scene, messageObject); current.sync(); }
                } catch (Exception failure) { module.logFeatureError("NATIVE_TRANSLATION_CARDS_NOTIFY", failure); }
            }); } catch (Exception failure) { module.logFeatureError("NATIVE_TRANSLATION_CARDS_CAPABILITY", failure); }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(cancel, "rm.translation.native_cards.cancel", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            String scene = sourceScene((String) chain.getArgs().get(0));
            Object owner = chain.getThisObject();
            if (scene != null) main.post(() -> {
                Binding current = binding;
                if (current != null && current.owner == owner) { current.messages.remove(scene); current.sync(); }
            });
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(updateVisible, "rm.translation.native_cards.visibility", false).intercept(chain -> {
            Binding current = binding;
            String scene = resolverScene(chain.getThisObject());
            int desired = (Integer) chain.getArgs().get(1);
            Object[] args = chain.getArgs().toArray();
            boolean suppress = current != null && current.isPublished(scene);
            if (suppress) args[1] = 0;
            Object result = chain.proceed(args);
            // Preserve the source's business/foreground flag, even while withdrawing its old island.
            if (suppress) setVisible.invoke(chain.getThisObject(), desired == 1);
            if (current != null && scene != null) current.schedule();
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(updateInfo, "rm.translation.native_cards.info", false).intercept(chain -> {
            Binding current = binding;
            String scene = resolverScene(chain.getThisObject());
            if (current != null && scene != null) {
                String text = (String) chain.getArgs().get(1);
                main.post(() -> current.information.put(scene, text));
            }
            if (current != null && current.isPublished(scene)) return null;
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.logFeatureInfo("NATIVE_TRANSLATION_CARDS_READY genuine_compact_messages");
    }

    private boolean nativeFull(Object owner) throws Exception {
        Object support = supported.get(owner);
        // Unknown use cases may have additional eligibility rules. Do not replace them.
        return !supportedType.isInstance(support) || Boolean.TRUE.equals(
                featureBoolean.invoke(feature.get(support), "ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN", false));
    }

    static String sourceScene(String id) {
        if ("transcription".equals(id) || (PKG + "_transcription").equals(id)) return "meeting";
        if ("call".equals(id) || (PKG + "_call").equals(id)) return "ai";
        return null;
    }
    private String resolverScene(Object resolver) {
        return meetingType.isInstance(resolver) ? "meeting" : aiType.isInstance(resolver) ? "ai" : null;
    }

    private final class Binding {
        final Object owner, producer, meeting, ai;
        final Context context;
        final Map<String, Object> messages = new LinkedHashMap<>();
        final Map<String, String> information = new LinkedHashMap<>();
        final Runnable refresh = this::sync, changed = this::schedule;
        final ContentObserver setting = new ContentObserver(main) {
            @Override public void onChange(boolean selfChange) { schedule(); }
        };
        final BroadcastReceiver recovery = new BroadcastReceiver() {
            @Override public void onReceive(Context context, Intent intent) {
                if (intent != null && NativeIslandScenePolicy.TRANSLATION_SYNC_ACTION.equals(intent.getAction())) {
                    NativeIslandCardClient.invalidate(); reconnect = true; schedule();
                }
            }
        };
        volatile int published;
        ContentProviderClient connection;
        boolean reconnect;
        Binding(Object owner) throws Exception {
            this.owner = owner;
            context = ((Context) appContext.get(owner)).getApplicationContext();
            producer = pusher.get(owner);
            if (!"com.android.systemui".equals(target.get(producer))) throw new IllegalStateException("translation_target");
            meeting = meetingInstance.get(null); ai = aiInstance.get(null);
        }
        void start() {
            boolean observing = false;
            try {
                FeatureSettings.addSnapshotListener(context, changed);
                context.getContentResolver().registerContentObserver(Settings.System.getUriFor("dynamic_island_switch_state"), false, setting);
                observing = true;
                context.registerReceiver(recovery, new IntentFilter(NativeIslandScenePolicy.TRANSLATION_SYNC_ACTION),
                        NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION, main, Context.RECEIVER_EXPORTED);
            } catch (RuntimeException failure) {
                FeatureSettings.removeSnapshotListener(changed);
                if (observing) context.getContentResolver().unregisterContentObserver(setting);
                main.removeCallbacks(refresh);
                throw failure;
            }
        }
        void schedule() { main.removeCallbacks(refresh); main.post(refresh); }
        boolean enabled(String scene) throws Exception {
            return !nativeFull(owner) && FeatureSettings.enabled(context, ConfigSchema.NATIVE_ISLAND_SELECTED)
                    && !FeatureSettings.enabled(context, SystemUiOptions.ISLAND)
                    && FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED)
                    && FeatureSettings.enabled(context, NativeIslandSceneOptions.key(scene))
                    && Settings.System.getInt(context.getContentResolver(), "dynamic_island_switch_state", 0) == 1
                    && NativeIslandCardClient.available(context, scene);
        }
        boolean isPublished(String scene) { return (published & NativeIslandCardProtocol.sceneBit(scene)) != 0; }
        boolean connect() throws Exception {
            if (connection != null && client.get(producer) == connection) return true;
            if (client.get(producer) != null) return false; // Never take another producer's connection.
            ContentProviderClient next = context.getContentResolver().acquireUnstableContentProviderClient(
                    (Uri) providerUri.invoke(null, "com.android.systemui"));
            if (next == null) return false;
            try { client.set(producer, next); registerCallback.invoke(producer); connection = next; return true; }
            catch (Exception failure) { client.set(producer, null); next.close(); return false; }
        }
        void sync() {
            try {
                if (reconnect) { disconnect(); reconnect = false; }
                for (String scene : new String[]{"meeting", "ai"}) {
                    Object message = messages.get(scene);
                    boolean wasPublished = isPublished(scene);
                    boolean allowed = message != null && enabled(scene);
                    if (allowed) {
                        Boolean actual = "meeting".equals(scene) && meetingState != null ? meetingState.visible(owner) : null;
                        if (actual != null) setVisible.invoke(meeting, actual);
                        allowed = actual != null ? actual : Boolean.TRUE.equals(cardVisible.invoke(owner, message));
                    }
                    boolean sent = allowed && connect() && Boolean.TRUE.equals(push.invoke(producer, message));
                    int bit = NativeIslandCardProtocol.sceneBit(scene);
                    if (sent) published |= bit;
                    else {
                        published &= ~bit;
                        if (wasPublished && connection != null) remove.invoke(producer, "meeting".equals(scene) ? "transcription" : "call");
                    }
                    if (wasPublished != sent) ordinaryVisibility(scene, sent);
                }
                if (published == 0) disconnect();
                report("published=" + published + ";sources=" + messages.size());
            } catch (Exception failure) {
                int previous = published; published = 0;
                try { disconnect(); } catch (Exception ignored) { }
                for (String scene : new String[]{"meeting", "ai"})
                    if ((previous & NativeIslandCardProtocol.sceneBit(scene)) != 0) try { ordinaryVisibility(scene, false); } catch (Exception ignored) { }
                report("sync_failed:" + failure.getClass().getSimpleName());
            }
        }
        void ordinaryVisibility(String scene, boolean hide) throws Exception {
            String key = "meeting".equals(scene) ? "meeting_visible_status" : "ai_visible_status";
            Object resolver = "meeting".equals(scene) ? meeting : ai;
            ContentValues values = new ContentValues();
            values.put(key, !hide && Boolean.TRUE.equals(visible.invoke(resolver)) ? 1 : 0);
            context.getContentResolver().update(Uri.parse("content://com.android.systemui.zte/" + key), values, null, null);
            if (!hide && information.containsKey(scene)) {
                String info = "meeting".equals(scene) ? "meeting_count_status" : "ai_wording_status";
                ContentValues text = new ContentValues(); text.put(info, information.get(scene));
                context.getContentResolver().update(Uri.parse("content://com.android.systemui.zte/" + info), text, null, null);
            }
        }
        void disconnect() throws Exception {
            ContentProviderClient previous = connection; connection = null;
            if (previous == null) return;
            try {
                if (client.get(producer) == previous) {
                    try { unregisterCallback.invoke(producer); }
                    catch (Exception unavailable) { report("callback_release_unavailable"); }
                    finally { client.set(producer, null); }
                }
            }
            finally { previous.close(); }
        }
        void report(String message) { FeatureSettings.diagnostic(context, "ls_augment_native_island_translation_cards", message); }
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
