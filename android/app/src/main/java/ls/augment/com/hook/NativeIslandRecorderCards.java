package ls.augment.com.hook;

import android.app.Activity;
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
import android.os.SystemClock;
import android.provider.Settings;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import ls.augment.com.ConfigSchema;
import ls.augment.com.NativeIslandSceneOptions;
import ls.augment.com.SystemUiOptions;

/** Adds the recorder's own transcription cards; ordinary audio keeps its cancel/save panel. */
final class NativeIslandRecorderCards {
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Method fullScreen, fragment, update, updateState, connect, release, remove,
            setListener, getPusher, registerCallback, providerUri, cancelDelayed, ordinaryVisible;
    private final Method[] register, unregister;
    private final Field handler, connected, client, target, fragmentsField;
    private final Object helper, recordType;
    private final Class<?> transcription;
    private Binding current;

    static void install(AugmentModule module, ClassLoader loader) {
        try { new NativeIslandRecorderCards(module, loader); }
        catch (Throwable missing) { module.logFeatureError("NATIVE_RECORDER_CARDS_CONTRACT", missing); }
    }

    private NativeIslandRecorderCards(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> activity = Class.forName("cn.zte.recorder.RecordingActivity", false, loader);
        Class<?> fragments = Class.forName("androidx.fragment.app.Fragment", false, loader);
        transcription = Class.forName("com.zte.voicesecretary.view.VoiceSecretaryHomeFragment", false, loader);
        Class<?> common = Class.forName("cn.zte.recorder.common.config.CommonConfig", false, loader);
        Class<?> source = Class.forName("cn.zte.recorder.common.helper.CardPusherHelper", false, loader);
        Class<?> type = Class.forName(source.getName() + "$CardType", false, loader);
        Class<?> state = Class.forName(source.getName() + "$RecordState", false, loader);
        Class<?> actions = Class.forName(source.getName() + "$CardActionListener", false, loader);
        Class<?> pusher = Class.forName("com.zte.toolsdk.producer.CardPusher", false, loader);
        Class<?> contract = Class.forName("com.zte.toolsdk.common.CardProviderContract", false, loader);
        Class<?> service = Class.forName("com.zte.voicesecretary.RecordAndRecognitionService", false, loader);
        Class<?> publisher = Class.forName("com.zte.voicesecretary.view.SystemUiResolver", false, loader);
        if (!Activity.class.isAssignableFrom(activity) || !actions.isAssignableFrom(activity)
                || !fragments.isAssignableFrom(transcription) || !state.isEnum())
            throw new IllegalStateException("recorder_card_types");
        fullScreen = require(common, "supportFullScreenLiveIsland", boolean.class);
        fragment = require(activity, "getCurrentFragment", fragments);
        fragmentsField = field(activity, "fragments", java.util.List.class);
        updateState = require(activity, "updateIslandCardByAppState", void.class);
        Method stateChange = require(activity, "handleIslandCardStateChange", void.class, state);
        handler = field(activity, "mIslandCardHandler", Handler.class);
        field(activity, "mIsAppInForeground", boolean.class);
        field(activity, "mIsStoppedByIslandCard", boolean.class);
        cancelDelayed = require(activity, "cancelIslandCardDelayedTasks", void.class);
        register = new Method[3]; unregister = new Method[3];
        String[] observers = {"RecorderStateReceiver", "ProcessLifecycleObserver", "FrontCameraObserver"};
        for (int i = 0; i < observers.length; i++) {
            register[i] = require(activity, "register" + observers[i], void.class);
            unregister[i] = require(activity, "unregister" + observers[i], void.class);
        }
        helper = field(source, "INSTANCE", source).get(null);
        recordType = field(type, "TYPE_RECORD", type).get(null);
        if (!"recorder_background".equals(require(type, "getCardId", String.class).invoke(recordType)))
            throw new IllegalStateException("recorder_card_id");
        connected = field(source, "isConnected", boolean.class);
        connect = require(source, "connect", void.class);
        release = require(source, "release", void.class);
        remove = require(source, "removeCard", void.class, type);
        setListener = require(source, "setCardActionListener", void.class, actions);
        getPusher = require(source, "getMCardPusher", pusher);
        update = require(source, "updateCard", void.class, type, state, long.class, boolean.class);
        Method sourceConnect = require(pusher, "connect", boolean.class);
        client = field(pusher, "mClient", ContentProviderClient.class);
        target = field(pusher, "mTargetPackage", String.class);
        registerCallback = require(pusher, "registerCallback", void.class);
        providerUri = require(contract, "getProviderUri", Uri.class, String.class);
        Method setState = require(service, "setState", void.class, int.class);
        ordinaryVisible = require(publisher, "updateVisible", void.class, Context.class, int.class);
        Method ordinaryInfo = require(publisher, "updateInfo", void.class, Context.class, String.class, String.class);
        for (Method method : new Method[]{fullScreen, connect, remove, setListener, update, providerUri, setState, ordinaryVisible, ordinaryInfo})
            if (!Modifier.isStatic(method.getModifiers())) throw new NoSuchMethodException("static:" + method.getName());
        require(transcription, "onCardItemClick", void.class, type, int.class);
        Method create = require(activity, "onCreate", void.class, Bundle.class);
        Method destroy = require(activity, "onDestroy", void.class);

        module.registerFeatureHook(module.prepareFeatureHook(create, "rm.recorder.native_cards.create", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Activity instance = (Activity) chain.getThisObject();
            // An already supported full-screen producer retains its own entire lifecycle.
            if (!instance.isFinishing() && !Boolean.TRUE.equals(fullScreen.invoke(null))
                    && fragmentsField.get(instance) instanceof java.util.List
                    && !((java.util.List<?>) fragmentsField.get(instance)).isEmpty()) {
                if (current != null) current.close();
                Binding binding = new Binding(instance); current = binding;
                try { binding.start(); }
                catch (Exception failure) { binding.close(); module.logFeatureError("NATIVE_RECORDER_CARDS_BINDING", failure); }
            }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(destroy, "rm.recorder.native_cards.destroy", false).intercept(chain -> {
            Binding binding = current;
            if (binding != null && binding.activity.get() == chain.getThisObject()) binding.close();
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.registerFeatureHook(module.prepareFeatureHook(sourceConnect, "rm.recorder.native_cards.connection", false).intercept(chain -> {
            Binding binding = current;
            if (binding == null || !binding.connecting || !"com.android.systemui".equals(target.get(chain.getThisObject())))
                return chain.proceed(chain.getArgs().toArray());
            Activity instance = binding.activity.get();
            if (instance == null) return false;
            Object pusherObject = chain.getThisObject();
            if (client.get(pusherObject) != null) return true;
            ContentProviderClient provider = instance.getContentResolver().acquireUnstableContentProviderClient(
                    (Uri) providerUri.invoke(null, "com.android.systemui"));
            if (provider == null) return false;
            try { client.set(pusherObject, provider); registerCallback.invoke(pusherObject); return true; }
            catch (Exception failure) { client.set(pusherObject, null); provider.close(); return false; }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(update, "rm.recorder.native_cards.publish", false).intercept(chain -> {
            Binding binding = current;
            if (binding == null) return chain.proceed(chain.getArgs().toArray());
            if (!binding.canPublish()) return null;
            Object result = chain.proceed(chain.getArgs().toArray());
            binding.lastState = chain.getArgs().get(1);
            binding.lastTime = (Long) chain.getArgs().get(2);
            binding.lastCamera = (Boolean) chain.getArgs().get(3);
            binding.report("published_transcription:" + binding.lastState + ";time=" + binding.lastTime);
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(stateChange, "rm.recorder.native_cards.result", false).intercept(chain -> {
            Binding binding = current;
            if (binding != null && binding.activity.get() == chain.getThisObject()) {
                String stateName = ((Enum<?>) chain.getArgs().get(0)).name();
                if ("SAVING".equals(stateName) && binding.isTranscription()) binding.resultUntil = SystemClock.elapsedRealtime() + 5300;
                if ("IDLE".equals(stateName)) { binding.resultUntil = 0; binding.lastState = null; }
            }
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.registerFeatureHook(module.prepareFeatureHook(setState, "rm.recorder.native_cards.state", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            if (current != null) current.schedule();
            return result;
        }));
        module.logFeatureInfo("NATIVE_RECORDER_CARDS_READY transcription_native_callbacks");
        module.registerFeatureHook(module.prepareFeatureHook(ordinaryVisible, "rm.recorder.native_cards.ordinary_visibility", false).intercept(chain -> {
            Binding binding = current;
            if (binding != null && !Integer.valueOf(0).equals(chain.getArgs().get(1)) && binding.canPublish()) {
                ordinaryVisible.invoke(null, chain.getArgs().get(0), 0);
                return null;
            }
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.registerFeatureHook(module.prepareFeatureHook(ordinaryInfo, "rm.recorder.native_cards.ordinary_info", false).intercept(chain -> {
            Binding binding = current;
            if (binding != null && binding.canPublish()) return null;
            return chain.proceed(chain.getArgs().toArray());
        }));
    }

    private final class Binding {
        final WeakReference<Activity> activity;
        final Runnable changed = this::schedule, refresh = this::sync;
        final ContentObserver setting = new ContentObserver(main) {
            @Override public void onChange(boolean selfChange) { schedule(); }
        };
        final BroadcastReceiver recovery = new BroadcastReceiver() {
            @Override public void onReceive(Context context, Intent intent) {
                if (intent != null && NativeIslandScenePolicy.RECORDER_SYNC_ACTION.equals(intent.getAction())) {
                    NativeIslandCardClient.invalidate(); reconnect = true; schedule();
                }
            }
        };
        boolean closed, observing, receiving, connecting, reconnect;
        int registered;
        Object lastState;
        long lastTime, resultUntil;
        boolean lastCamera;
        Binding(Activity instance) { activity = new WeakReference<>(instance); }
        void start() throws Exception {
            Activity instance = activity.get();
            handler.set(instance, new Handler(Looper.getMainLooper()));
            // These OEM observers provide the actual foreground/camera/state lifecycle.
            for (int i = 0; i < register.length; i++) { registered = i + 1; register[i].invoke(instance); }
            FeatureSettings.addSnapshotListener(instance, changed);
            instance.getContentResolver().registerContentObserver(Settings.System.getUriFor("dynamic_island_switch_state"), false, setting);
            observing = true;
            instance.registerReceiver(recovery, new IntentFilter(NativeIslandScenePolicy.RECORDER_SYNC_ACTION),
                    NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION, main, Context.RECEIVER_EXPORTED);
            receiving = true;
            report("bound_native_observers");
            schedule();
        }
        boolean isTranscription() throws Exception {
            Activity instance = activity.get();
            return instance != null && transcription.isInstance(fragment.invoke(instance));
        }
        boolean enabled() throws Exception {
            Activity instance = activity.get();
            return !closed && instance != null && !instance.isFinishing()
                    && !Boolean.TRUE.equals(fullScreen.invoke(null))
                    && FeatureSettings.enabled(instance, ConfigSchema.NATIVE_ISLAND_SELECTED)
                    && !FeatureSettings.enabled(instance, SystemUiOptions.ISLAND)
                    && FeatureSettings.enabled(instance, NativeIslandSceneOptions.ENABLED)
                    && FeatureSettings.enabled(instance, NativeIslandSceneOptions.key("record"))
                    && Settings.System.getInt(instance.getContentResolver(), "dynamic_island_switch_state", 0) == 1
                    && NativeIslandCardClient.available(instance, "record");
        }
        boolean canPublish() throws Exception { return isTranscription() && enabled() && connected.getBoolean(null); }
        void schedule() { if (!closed) { main.removeCallbacks(refresh); main.post(refresh); } }
        void sync() {
            Activity instance = activity.get();
            if (closed || instance == null) return;
            try {
                if (!enabled()) { disconnect(); return; }
                if (reconnect) { disconnect(); reconnect = false; }
                if (!connected.getBoolean(null)) {
                    connecting = true;
                    try { connect.invoke(null); } finally { connecting = false; }
                    // The OEM helper sets isConnected even when CardPusher.connect failed.
                    if (client.get(getPusher.invoke(helper)) == null) { release.invoke(helper); report("connection_unavailable"); return; }
                    setListener.invoke(null, instance);
                }
                if (!isTranscription()) { remove.invoke(null, recordType); return; }
                ordinaryVisible.invoke(null, instance, 0);
                if (resultUntil > SystemClock.elapsedRealtime() && lastState != null)
                    update.invoke(null, recordType, lastState, lastTime, lastCamera);
                else updateState.invoke(instance);
            } catch (Exception failure) { report("sync_failed:" + failure.getClass().getSimpleName() + ":" + failure.getMessage()); }
        }
        void disconnect() throws Exception {
            if (connected.getBoolean(null)) remove.invoke(null, recordType);
            release.invoke(helper);
        }
        void close() {
            if (closed) return;
            closed = true; main.removeCallbacks(refresh); FeatureSettings.removeSnapshotListener(changed);
            Activity instance = activity.get();
            try { disconnect(); } catch (Exception ignored) { }
            if (instance != null) {
                for (int i = registered - 1; i >= 0; i--) try { unregister[i].invoke(instance); } catch (Exception ignored) { }
                try { cancelDelayed.invoke(instance); handler.set(instance, null); } catch (Exception ignored) { }
                if (observing) try { instance.getContentResolver().unregisterContentObserver(setting); } catch (RuntimeException ignored) { }
                if (receiving) try { instance.unregisterReceiver(recovery); } catch (RuntimeException ignored) { }
            }
            if (current == this) current = null;
        }
        void report(String value) { Activity instance = activity.get(); if (instance != null)
            FeatureSettings.diagnostic(instance, "ls_augment_native_island_recorder_cards", value); }
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
