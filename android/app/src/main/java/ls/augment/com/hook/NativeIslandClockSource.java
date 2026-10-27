package ls.augment.com.hook;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSchema;
import ls.augment.com.NativeIslandSceneOptions;
import ls.augment.com.SystemUiOptions;

/** Enables the clock's own ordinary countdown publisher, never its timer or full-screen flag. */
final class NativeIslandClockSource {
    private static final String SERVICE = "zte.com.cn.timer.CountdownNotificationService";
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Map<Service, Binding> bindings = new WeakHashMap<>();
    private final Method gate, fullScreen, reconcile, cancelPublisher, publishStatus, publishTime;
    private WeakReference<Context> application = new WeakReference<>(null);
    private volatile boolean nativeSupported;

    static void install(AugmentModule module, ClassLoader loader) {
        try { new NativeIslandClockSource(module, loader); }
        catch (Throwable missing) { module.logFeatureError("NATIVE_CLOCK_SOURCE_CONTRACT", missing); }
    }

    private NativeIslandClockSource(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> service = Class.forName(SERVICE, false, loader);
        Class<?> feature = Class.forName("zte.com.cn.utils.FeatureUtils", false, loader);
        Class<?> publisher = Class.forName("zte.com.cn.timer.LiveIslandManager", false, loader);
        Class<?> model = Class.forName("zte.com.cn.timer.CountdownCount", false, loader);
        if (!Service.class.isAssignableFrom(service)
                || NativeIslandSceneContract.field(service, "mCountdownCount", model) == null)
            throw new NoSuchFieldException("countdown_service_model");
        gate = booleanMethod(feature, "isSupportLiveIsland");
        fullScreen = booleanMethod(feature, "isSupportLiveIslandFullScreen");
        reconcile = require(service, "updateLiveIslandStateByCountdownStatus", void.class);
        cancelPublisher = require(service, "cancelTimer", void.class);
        publishStatus = require(publisher, "updateCountdownStatus", void.class, Context.class, int.class);
        publishTime = require(publisher, "updateCountdownCount", void.class, Context.class, String.class);
        require(service, "updateLiveIslandState4SystemUI", void.class, Context.class, int.class);
        Method arrive = require(service, "arriveLiveIsland", void.class, Context.class, int.class);
        Method create = require(service, "onCreate", void.class);
        Method destroy = require(service, "onDestroy", void.class);
        require(model, "getState", int.class);
        require(model, "getTimeStrFromSurfaceView", String.class);
        for (Method method : new Method[]{gate, fullScreen, publishStatus, publishTime})
            if (!Modifier.isStatic(method.getModifiers())) throw new NoSuchMethodException("static:" + method.getName());
        nativeSupported = Boolean.TRUE.equals(gate.invoke(null));
        module.registerFeatureHook(module.prepareFeatureHook(gate, "rm.clock.native_island.gate", false).intercept(chain -> {
            Object original = chain.proceed(chain.getArgs().toArray());
            nativeSupported = Boolean.TRUE.equals(original);
            return nativeSupported || requested(application.get()) ? Boolean.TRUE : original;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(create, "rm.clock.native_island.create", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Service instance = (Service) chain.getThisObject();
            application = new WeakReference<>(instance.getApplicationContext());
            Binding binding = new Binding(instance);
            Binding previous = bindings.put(instance, binding);
            if (previous != null) previous.close();
            try { binding.start(); }
            catch (RuntimeException failure) {
                binding.close(); bindings.remove(instance);
                module.logFeatureError("NATIVE_CLOCK_SOURCE_BINDING", failure);
            }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(destroy, "rm.clock.native_island.destroy", false).intercept(chain -> {
            Binding binding = bindings.remove(chain.getThisObject());
            try { return chain.proceed(chain.getArgs().toArray()); }
            finally { if (binding != null) binding.close(); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(arrive, "rm.clock.native_island.publisher", false).intercept(chain -> {
            Binding binding = bindings.get(chain.getThisObject());
            if (!nativeSupported && binding != null && requested(application.get())) {
                // OEM start/resume and screen-on can schedule twice. Retire only its island publisher.
                if (Integer.valueOf(1).equals(chain.getArgs().get(1))) cancelPublisher.invoke(chain.getThisObject());
                binding.owned = true;
            }
            return chain.proceed(chain.getArgs().toArray());
        }));
        module.logFeatureInfo("NATIVE_CLOCK_SOURCE_READY ordinary_publisher");
    }

    private boolean requested(Context context) {
        if (context == null || !FeatureSettings.enabled(context, ConfigSchema.NATIVE_ISLAND_SELECTED)
                || FeatureSettings.enabled(context, SystemUiOptions.ISLAND)
                || !FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED)
                || !FeatureSettings.enabled(context, NativeIslandSceneOptions.key("countdown"))) return false;
        try {
            return !Boolean.TRUE.equals(fullScreen.invoke(null))
                    && Settings.System.getInt(context.getContentResolver(), "dynamic_island_switch_state", 0) == 1;
        } catch (Exception unavailable) { return false; }
    }

    private final class Binding {
        private final WeakReference<Service> service;
        private final Runnable changed = this::sync;
        private final ContentObserver setting = new ContentObserver(main) {
            @Override public void onChange(boolean selfChange) { main.removeCallbacks(changed); main.post(changed); }
        };
        private final BroadcastReceiver recovery = new BroadcastReceiver() {
            @Override public void onReceive(Context context, Intent intent) {
                Service instance = service.get();
                if (!closed && instance != null && intent != null
                        && NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION.equals(intent.getAction()) && !nativeSupported) {
                    boolean wasActive = active;
                    sync();
                    if (wasActive && active) republish(instance);
                }
            }
        };
        private boolean owned, active, closed, observing, receiving;
        Binding(Service instance) { service = new WeakReference<>(instance); }
        void start() {
            Service instance = service.get();
            if (instance == null) return;
            FeatureSettings.addSnapshotListener(instance, changed);
            try {
                instance.getContentResolver().registerContentObserver(Settings.System.getUriFor("dynamic_island_switch_state"), false, setting);
                observing = true;
            } catch (RuntimeException missing) { report("setting_observer_unavailable:" + missing.getClass().getSimpleName()); }
            try {
                instance.registerReceiver(recovery, new IntentFilter(NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION),
                        NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION, main, Context.RECEIVER_EXPORTED);
                receiving = true;
            } catch (RuntimeException missing) { report("recovery_receiver_unavailable:" + missing.getClass().getSimpleName()); }
            main.post(changed);
        }
        void sync() {
            Service instance = service.get();
            if (closed || instance == null) return;
            boolean next = !nativeSupported && requested(instance);
            if (next == active) return;
            active = next;
            try {
                if (next) republish(instance);
                else withdraw(instance);
            } catch (Exception error) { report("publisher_failed:" + error.getClass().getSimpleName()); }
        }
        void republish(Service instance) {
            try {
                owned = true;
                cancelPublisher.invoke(instance);
                reconcile.invoke(instance);
                report("publisher_active");
            } catch (Exception error) { report("publisher_failed:" + error.getClass().getSimpleName() + ":" + error.getMessage()); }
        }
        void withdraw(Service instance) throws Exception {
            if (!owned) return;
            owned = false;
            cancelPublisher.invoke(instance);
            publishStatus.invoke(null, instance, 0);
            publishTime.invoke(null, instance, "0");
            report("publisher_released");
        }
        void close() {
            if (closed) return;
            closed = true;
            FeatureSettings.removeSnapshotListener(changed); main.removeCallbacks(changed);
            Service instance = service.get();
            if (instance != null) {
                if (receiving) try { instance.unregisterReceiver(recovery); }
                catch (RuntimeException ignored) { }
                if (observing) try { instance.getContentResolver().unregisterContentObserver(setting); }
                catch (RuntimeException ignored) { }
                try { withdraw(instance); }
                catch (Exception error) { report("publisher_release_failed:" + error.getClass().getSimpleName()); }
            }
        }
        void report(String state) { FeatureSettings.diagnostic(application.get(), "ls_augment_native_island_clock_source", state); }
    }

    private static Method booleanMethod(Class<?> type, String name) throws NoSuchMethodException {
        Method method = NativeIslandSceneContract.method(type, name, Boolean.class);
        return method != null ? method : require(type, name, boolean.class);
    }
    private static Method require(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method method = NativeIslandSceneContract.method(type, name, result, args);
        if (method == null) throw new NoSuchMethodException(type.getName() + "." + name);
        return method;
    }
}
