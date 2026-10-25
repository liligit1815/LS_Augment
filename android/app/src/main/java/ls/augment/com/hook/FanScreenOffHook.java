package ls.augment.com.hook;

import android.content.Context;
import android.os.Build;
import android.os.Handler;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import ls.augment.com.ConfigSchema;
import ls.augment.com.FanScreenOffPolicy;

/** Remove only the audited OEM screen gate for an already running fan session. */
final class FanScreenOffHook {
    private static final String INSTALLED = "ls_augment_fan_screen_off_installed";
    private static final String ACTIVE = "ls_augment_fan_screen_off_active";
    private static final String ERROR = "ls_augment_fan_screen_off_last_error";
    private static final ThreadLocal<ScreenQuery> QUERY = new ThreadLocal<>();

    private FanScreenOffHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        return install(module,loader,null);
    }
    static int install(AugmentModule module,ClassLoader loader,String source) {
        if (!FanScreenOffPolicy.supportedDevice(Build.DEVICE, Build.PRODUCT, Build.MODEL)&&!FanOemContract.screenGate(source)) {
            FeatureSettings.diagnostic(FeatureSettings.from(null),INSTALLED,"");
            module.logFeatureInfo("FAN_SCREEN_OFF_UNAVAILABLE capability=oem_screen_predicate_order");return 0;
        }
        try {
            Class<?> type = Class.forName("cn.nubia.fan.policy.FanControllerImpl", false, loader);
            Class<?> stateType = Class.forName("cn.nubia.fan.bean.FanState", false, loader);
            Method update = method(type, "handleUpdateTheStateOfFan", void.class);
            Method notify = method(type, "notifyFanStateChanged", void.class);
            Method screen = method(stateType, "isScreenUnlocked", boolean.class);
            Method calling = method(stateType, "isCalling", boolean.class);
            Method charging = method(stateType, "isQuickCharge", boolean.class);
            Field current = field(type, "mCurrentFanState", stateType);
            Field running = field(type, "mLastFanEnable", boolean.class);
            Field shutdown = field(type, "mShutDown", boolean.class);
            Field handler = field(type, "mHandler", Handler.class);
            Runtime runtime = new Runtime(module, notify, handler);

            module.registerFeatureHook(module.prepareFeatureHook(screen,
                    "fan.screen_off_predicate", false).intercept(chain -> {
                Object original = chain.proceed();
                ScreenQuery query = QUERY.get();
                if (query != null && query.consume(chain.getThisObject())) {
                    return true;
                }
                return original;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(update,
                    "fan.screen_off_session", false).intercept(chain -> {
                ScreenQuery previous = QUERY.get();
                QUERY.remove();
                try {
                    Object owner = chain.getThisObject();
                    try {
                        runtime.observe(owner);
                        Object state = current.get(owner);
                        boolean unlocked = Boolean.TRUE.equals(screen.invoke(state));
                        boolean keep = FanScreenOffPolicy.preserveRunningSession(runtime.enabled(),
                                unlocked, running.getBoolean(owner),
                                Boolean.TRUE.equals(calling.invoke(state)),
                                Boolean.TRUE.equals(charging.invoke(state)), shutdown.getBoolean(owner));
                        if (keep) QUERY.set(new ScreenQuery(state));
                        else runtime.status(unlocked ? "idle;reason=screen_on" : "idle;reason=oem_policy");
                    } catch (Throwable error) {
                        runtime.error("state", error);
                    }
                    // OEM still evaluates manual/game requests and performs all writes.
                    // Only its first screen query is overridden; the real FanState and
                    // updateManualFanSwitchState's later screen queries stay unchanged.
                    Object result = chain.proceed();
                    ScreenQuery query = QUERY.get();
                    if (query != null && query.consumed) {
                        try {
                            runtime.status(running.getBoolean(owner)
                                    ? "kept_running;reason=screen_off" : "idle;reason=oem_policy");
                        } catch (Throwable error) { runtime.error("result", error); }
                    }
                    return result;
                } finally {
                    if (previous == null) QUERY.remove(); else QUERY.set(previous);
                }
            }));
            // The ROM precompiles these small state methods and may inline both
            // the controller calculation and its screen predicate.
            module.deoptimize(update);
            for (Method method : type.getDeclaredMethods()) {
                if (method.getName().startsWith("notify")) module.deoptimize(method);
            }
            FeatureSettings.diagnostic(FeatureSettings.from(null), INSTALLED,
                    "hooks=2;device=" + Build.DEVICE + ";scope=running_session;fan_enable_writes=0;hardware_identity="+ls.augment.com.FanHardwareIdentity.current());
            FeatureSettings.diagnostic(FeatureSettings.from(null), ERROR, "");
            return 2;
        } catch (Throwable error) {
            FeatureSettings.diagnostic(FeatureSettings.from(null),INSTALLED,"");
            FeatureSettings.diagnostic(FeatureSettings.from(null), ERROR,
                    "install:" + error.getClass().getSimpleName());
            module.logFeatureError("FAN_SCREEN_OFF_INSTALL", error);
            return 0;
        }
    }

    private static Method method(Class<?> type, String name, Class<?> result) throws Exception {
        Method method = type.getDeclaredMethod(name);
        if (method.getReturnType() != result || java.lang.reflect.Modifier.isStatic(method.getModifiers())
                || java.lang.reflect.Modifier.isAbstract(method.getModifiers())) throw new NoSuchMethodException(name);
        method.setAccessible(true);
        return method;
    }

    private static Field field(Class<?> type, String name, Class<?> valueType) throws Exception {
        Field field = type.getDeclaredField(name);
        if (field.getType() != valueType || java.lang.reflect.Modifier.isStatic(field.getModifiers())) throw new NoSuchFieldException(name);
        field.setAccessible(true);
        return field;
    }

    private static final class ScreenQuery {
        private final Object state;
        private boolean consumed;
        ScreenQuery(Object state) { this.state = state; }
        boolean consume(Object target) {
            if (consumed || state != target) return false;
            consumed = true;
            return true;
        }
    }

    private static final class Runtime {
        private final AugmentModule module;
        private final Method notify;
        private final Field handler;
        private volatile Context context;
        private volatile Object owner;
        private boolean listening;
        private volatile boolean lastEnabled;

        Runtime(AugmentModule module, Method notify, Field handler) {
            this.module = module; this.notify = notify; this.handler = handler;
        }

        boolean enabled() {
            return FeatureSettings.enabled(context, ConfigSchema.GAME_MASTER, false)
                    && FeatureSettings.enabled(context, ConfigSchema.FAN_SCREEN_OFF_ENABLED, false);
        }

        synchronized void observe(Object current) {
            owner = current;
            context = FeatureSettings.from(current);
            if (context == null || listening) return;
            lastEnabled = enabled();
            FeatureSettings.diagnostic(context, INSTALLED,
                    "hooks=2;device=" + Build.DEVICE + ";scope=running_session;fan_enable_writes=0;hardware_identity="+ls.augment.com.FanHardwareIdentity.current());
            listening = FeatureSettings.addSnapshotListener(context, () -> {
                boolean next = enabled();
                if (lastEnabled == next) return;
                lastEnabled = next;
                try {
                    Object target = owner;
                    Handler thread = (Handler) handler.get(target);
                    if (thread != null) thread.post(() -> {
                        if (target != owner) return;
                        try { notify.invoke(target); }
                        catch (Throwable error) { error("refresh", error); }
                    });
                } catch (Throwable error) { error("refresh_handler", error); }
            });
        }

        void status(String value) { FeatureSettings.diagnostic(context, ACTIVE, value); }
        void error(String stage, Throwable error) {
            FeatureSettings.diagnostic(context, ERROR, stage + ':' + error.getClass().getSimpleName());
            module.logFeatureError("FAN_SCREEN_OFF_" + stage, error);
        }
    }
}
