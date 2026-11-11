package ls.augment.com.hook;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
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

/** Re-publishes the recorder's actual ordinary state. Never starts, pauses or saves audio. */
final class NativeIslandRecorderSource {
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Method currentState, foreground, fullScreen, nubia, publishVisible, publishCount;
    private final Uri visibleUri;
    private volatile Binding current;
    private boolean snapshotReady;

    static void install(AugmentModule module, ClassLoader loader) {
        try { new NativeIslandRecorderSource(module, loader); }
        catch (Throwable missing) { module.logFeatureError("NATIVE_RECORDER_SOURCE_CONTRACT", missing); }
    }

    private NativeIslandRecorderSource(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> service = Class.forName("cn.zte.recorder.RecorderService", false, loader);
        Class<?> state = Class.forName("cn.zte.recorder.manager.RecorderState", false, loader);
        Class<?> config = Class.forName("cn.zte.recorder.Config", false, loader);
        Class<?> common = Class.forName("cn.zte.recorder.common.config.CommonConfig", false, loader);
        Class<?> publisher = Class.forName("cn.zte.recorder.notification.SystemUiResolver", false, loader);
        if (!Service.class.isAssignableFrom(service)) throw new IllegalStateException("recorder_service_type");
        currentState = require(state, "getCurrentState", int.class);
        foreground = require(service, "isForeGroundRecording", boolean.class);
        fullScreen = require(common, "supportFullScreenLiveIsland", boolean.class);
        nubia = require(config, "isFlavorNubia", boolean.class);
        publishVisible = require(publisher, "updateVisible", void.class, Context.class, int.class);
        publishCount = require(service, "updateCount", void.class, Context.class, int.class);
        for (Method method : new Method[]{currentState, foreground, fullScreen, nubia, publishVisible, publishCount})
            if (!Modifier.isStatic(method.getModifiers())) throw new NoSuchMethodException("static:" + method.getName());
        Field uri = NativeIslandSceneContract.field(publisher, "RECORD_VISIBLE_URI", String.class);
        if (uri == null || !Modifier.isStatic(uri.getModifiers())
                || !"content://com.android.systemui.zte/record_visible_status".equals(uri.get(null)))
            throw new IllegalStateException("recorder_visible_uri_contract");
        visibleUri = Uri.parse((String) uri.get(null));
        Method create = require(service, "onCreate", void.class);
        Method destroy = require(service, "onDestroy", void.class);
        module.registerFeatureHook(module.prepareFeatureHook(create, "rm.recorder.native_island.create", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Binding previous = current;
            if (previous != null) previous.close();
            Binding binding = new Binding((Service) chain.getThisObject());
            current = binding;
            try { binding.start(); }
            catch (RuntimeException failure) { binding.close(); module.logFeatureError("NATIVE_RECORDER_SOURCE_BINDING", failure); }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(destroy, "rm.recorder.native_island.destroy", false).intercept(chain -> {
            Binding binding = current;
            try { return chain.proceed(chain.getArgs().toArray()); }
            finally { if (binding != null && binding.service.get() == chain.getThisObject()) binding.close(); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(publishCount, "rm.recorder.native_island.tick", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Binding binding = current;
            if (binding != null && !binding.samplingHere()) binding.request(false);
            return result;
        }));
        Method info=NativeIslandSceneContract.method(publisher,"updateInfo",void.class,Context.class,String.class);
        if (info!=null && Modifier.isStatic(info.getModifiers())) {
            module.registerFeatureHook(module.prepareFeatureHook(info,"rm.recorder.native_island.count",false).intercept(chain->{
                Object result=chain.proceed(chain.getArgs().toArray());
                Binding binding=current;
                if (binding!=null) {
                    if (binding.samplingHere()) binding.count=(String)chain.getArgs().get(1);
                    else binding.request(true);
                }
                return result;
            }));
            snapshotReady=true;
            // The ordinary producer publishes through these methods at state/front transitions.
            // Re-read its model after the call; never infer audio state from the callback argument.
            for (Method event:new Method[]{publishVisible,
                    NativeIslandSceneContract.method(service,"setForeGround",void.class,boolean.class)}) {
                if (event==null || !Modifier.isStatic(event.getModifiers())) continue;
                module.registerFeatureHook(module.prepareFeatureHook(event,"rm.recorder.native_island.event."+event.getName(),false).intercept(chain->{
                    Object result=chain.proceed(chain.getArgs().toArray()); Binding binding=current;
                    if (binding!=null && !binding.samplingHere()) binding.request(true);
                    return result;
                }));
            }
        } else module.logFeatureInfo("NATIVE_RECORDER_SNAPSHOT_MISSING updateInfo(Context,String):void;legacy_provider");
        module.logFeatureInfo("NATIVE_RECORDER_SOURCE_READY ordinary_state");
    }

    private boolean requested(Context context) throws Exception {
        return FeatureSettings.enabled(context, SystemUiOptions.ISLAND)
                && Settings.System.getInt(context.getContentResolver(), "dynamic_island_switch_state", 0) == 1
                && !Boolean.TRUE.equals(fullScreen.invoke(null)) && !Boolean.TRUE.equals(nubia.invoke(null));
    }

    private final class Binding {
        private final WeakReference<Service> service;
        private final Runnable tick = () -> sync(false), changed = () -> request(true), refresh = () -> sync(true);
        // Paused recordings also renew ownership; no service restart or audio command is used.
        private final Runnable pulse = () -> sync(true);
        private final long generation=SystemClock.elapsedRealtimeNanos();
        private long sequence;
        private volatile String count;
        private volatile Thread samplingThread;
        private boolean transported;
        private final ContentObserver setting = new ContentObserver(main) {
            @Override public void onChange(boolean selfChange) { request(true); }
        };
        private final BroadcastReceiver recovery = new BroadcastReceiver() {
            @Override public void onReceive(Context context, Intent intent) {
                if (intent != null && NativeIslandScenePolicy.RECORDER_SYNC_ACTION.equals(intent.getAction())) request(true);
            }
        };
        private volatile boolean closed;
        private boolean observing, receiving;
        Binding(Service instance) { service = new WeakReference<>(instance); }
        void start() {
            Service instance = service.get();
            if (instance == null) return;
            FeatureSettings.addSnapshotListener(instance, changed);
            instance.getContentResolver().registerContentObserver(Settings.System.getUriFor("dynamic_island_switch_state"), false, setting);
            observing = true;
            instance.registerReceiver(recovery, new IntentFilter(NativeIslandScenePolicy.RECORDER_SYNC_ACTION),
                    NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION, main, Context.RECEIVER_EXPORTED);
            receiving = true;
            request(true);
        }
        void request(boolean force) {
            if (!closed) { Runnable callback = force ? refresh : tick; main.removeCallbacks(callback); main.post(callback); }
        }
        boolean samplingHere() { return samplingThread==Thread.currentThread(); }
        void sync(boolean force) {
            Service instance = service.get();
            if (closed || instance == null) return;
            try {
                main.removeCallbacks(pulse);
                if (!requested(instance)) return;
                int state = (Integer) currentState.invoke(null);
                boolean front=Boolean.TRUE.equals(foreground.invoke(null));
                int visible = !front && (state == 1 || state == 2) ? state : 0;
                if (snapshotReady) {
                    if (state!=1 && state!=2) count=null;
                    else {
                        // Sample the current model, not a delayed updateInfo argument from an old session.
                        count=null; samplingThread=Thread.currentThread();
                        try { publishCount.invoke(null,instance,state); }
                        finally { samplingThread=null; }
                    }
                    // A state change during sampling must not combine old duration with new state.
                    if (state!=(Integer)currentState.invoke(null) || front!=Boolean.TRUE.equals(foreground.invoke(null))) {
                        request(true); return;
                    }
                    boolean accepted=NativeIslandRecorderBridge.publish(instance,generation,++sequence,
                            state==1 || state==2?state:0,front,count);
                    transported|=accepted;
                    main.postDelayed(pulse,1000);
                    if (accepted) {
                        report("atomic_model;state="+state+";foreground="+front+";countReady="+(count!=null));
                        return;
                    }
                }
                if (!force && matches(instance, visible)) return;
                // updateCount carries the OEM duration and localized pause suffix. Its hook
                // queues one non-forced check, which stops once provider and model match.
                samplingThread=Thread.currentThread();
                try {
                    if (force && !snapshotReady && (state == 1 || state == 2)) publishCount.invoke(null, instance, state);
                    publishVisible.invoke(null, instance, visible);
                } finally { samplingThread=null; }
                report("published_actual_state=" + state + ";visible=" + visible);
            } catch (Exception failure) { report("publish_failed:" + failure.getClass().getSimpleName() + ":" + failure.getMessage()); }
        }
        boolean matches(Context context, int state) {
            try (Cursor cursor = context.getContentResolver().query(visibleUri, null, null, null, null)) {
                if (cursor == null || !cursor.moveToFirst()) return false;
                int column = cursor.getColumnIndex("record_visible_status");
                return column >= 0 && !cursor.isNull(column) && Integer.toString(state).equals(cursor.getString(column));
            } catch (RuntimeException missing) { return false; }
        }
        void close() {
            if (closed) return;
            closed = true;
            FeatureSettings.removeSnapshotListener(changed);
            main.removeCallbacks(refresh); main.removeCallbacks(tick);
            main.removeCallbacks(pulse);
            Service instance = service.get();
            if (instance != null) {
                if (transported) NativeIslandRecorderBridge.publish(instance,generation,++sequence,0,true,null);
                if (observing) try { instance.getContentResolver().unregisterContentObserver(setting); } catch (RuntimeException ignored) { }
                if (receiving) try { instance.unregisterReceiver(recovery); } catch (RuntimeException ignored) { }
            }
            if (current == this) current = null;
        }
        void report(String value) { Service instance = service.get(); if (instance != null) FeatureSettings.diagnostic(instance,
                "ls_augment_native_island_recorder_source", value); }
    }

    private static Method require(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method method = NativeIslandSceneContract.method(type, name, result, args);
        if (method == null) throw new NoSuchMethodException(type.getName() + "." + name);
        return method;
    }
}
