package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.Process;

import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSchema;
import ls.augment.com.RapidFireCompatibility;
import ls.augment.com.RapidFireLifecyclePolicy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import io.github.libxposed.api.XposedInterface.Chain;
import io.github.libxposed.api.XposedInterface.HookHandle;

/**
 * Bridges the GameSpace TGK request into the native EventProducer profile in
 * system_server. The native layer is loaded only when a target above the OEM
 * 10 CPS ceiling is actually requested.
 */
final class TgkRapidFireSystemHook {
    private static final String INPUT_MANAGER_SERVICE =
            "com.android.server.input.InputManagerService";
    private static final String NATIVE_INPUT_MANAGER_IMPL =
            "com.android.server.input.NativeInputManagerService$NativeImpl";
    private static final String INPUT_MANAGER_STUB =
            "android.hardware.input.IInputManager$Stub";
    private static final String INPUT_MANAGER_DESCRIPTOR =
            "android.hardware.input.IInputManager";
    private static final int OEM_MAX_CPS = 10;
    private static final int MAX_CPS = 50;

    private static volatile long lastDiagnostic;
    private static volatile long lastInstalledPublish;
    private static volatile String installedDescriptor;
    private static volatile boolean snapshotListenerInstalled;
    private static volatile boolean snapshotListenerRetryScheduled;
    private static volatile int snapshotListenerAttempts;
    private static volatile int contextReadyAttempts;
    private static volatile boolean installedRepublishScheduled;
    private static volatile AugmentModule moduleReference;
    private static volatile String observationSessionKey = "";
    private static volatile long observationBaseline;
    private static volatile boolean observationPollScheduled;
    private static Handler testCleanupHandler;
    private static Runnable testCleanup;
    private static final ThreadLocal<Boolean> INTERCEPTING = new ThreadLocal<>();
    private static final Runnable NO_AFTER_CALL = () -> { };

    private TgkRapidFireSystemHook() { }

    static int install(AugmentModule module, ClassLoader classLoader) {
        try {
            moduleReference = module;
            Class<?> service = Class.forName(INPUT_MANAGER_SERVICE, false, classLoader);
            List<String> entryPoints = new ArrayList<>();
            int installed = 0;

            Method method = findMethod(service, "setTgkRapidFireCount",
                    int.class, int.class);
            if (method != null) {
                method.setAccessible(true);
                boolean deoptimized = module.deoptimize(method);
                HookHandle handle = module.prepareFeatureHook(
                                method, "tgk.rapid_fire_system", true)
                        .intercept(chain -> intercept(module, chain));
                module.registerFeatureHook(handle);
                installed++;
                entryPoints.add(method.toGenericString() + ":deopt=" + deoptimized);
            }

            // Some ART builds inline the tiny InputManagerService wrapper.
            // Hook the concrete native bridge too, so compatibility testing
            // observes the real binder-to-native call without guessing any
            // native memory offsets. The ThreadLocal below prevents handling
            // the same call twice when the wrapper was not inlined.
            try {
                Class<?> nativeImpl = Class.forName(
                        NATIVE_INPUT_MANAGER_IMPL, false, classLoader);
                Method nativeMethod = findMethod(nativeImpl, "setTgkRapidFireCount",
                        int.class, int.class);
                if (nativeMethod != null) {
                    nativeMethod.setAccessible(true);
                    HookHandle nativeHandle = module.prepareFeatureHook(
                                    nativeMethod, "tgk.rapid_fire_native_bridge", true)
                            .intercept(chain -> intercept(module, chain));
                    module.registerFeatureHook(nativeHandle);
                    installed++;
                    entryPoints.add(nativeMethod.toGenericString());
                }
            } catch (Throwable nativeBridgeError) {
                module.logFeatureInfo("TGK_NATIVE_BRIDGE_UNAVAILABLE "
                        + nativeBridgeError.getClass().getSimpleName());
            }

            // The generated AIDL dispatcher is the narrowest stable boundary
            // that cannot be skipped when ART inlines both service wrappers.
            // Resolve the OEM transaction code from its generated field so a
            // different framework build never inherits a hard-coded number.
            try {
                Class<?> stub = Class.forName(INPUT_MANAGER_STUB, false, classLoader);
                Field transactionField = stub.getDeclaredField(
                        "TRANSACTION_setTgkRapidFireCount");
                transactionField.setAccessible(true);
                int transactionCode = transactionField.getInt(null);
                Method onTransact = findMethod(stub, "onTransact", int.class,
                        Parcel.class, Parcel.class, int.class);
                if (transactionCode > 0 && onTransact != null) {
                    onTransact.setAccessible(true);
                    HookHandle binderHandle = module.prepareFeatureHook(
                                    onTransact, "tgk.rapid_fire_binder", true)
                            .intercept(chain -> interceptBinder(
                                    module, chain, transactionCode));
                    module.registerFeatureHook(binderHandle);
                    installed++;
                    entryPoints.add(onTransact.toGenericString()
                            + ":transaction=" + transactionCode);
                }
            } catch (Throwable binderError) {
                module.logFeatureInfo("TGK_BINDER_ENTRY_UNAVAILABLE "
                        + binderError.getClass().getSimpleName());
            }

            if (installed == 0) throw new NoSuchMethodException(
                    INPUT_MANAGER_SERVICE + "/" + NATIVE_INPUT_MANAGER_IMPL
                            + ".setTgkRapidFireCount");
            installedDescriptor = String.join("+", entryPoints)
                    + "|module=" + BuildConfig.VERSION_NAME
                    + "|schema=" + ConfigSchema.VERSION
                    + "|pid=" + Process.myPid();
            initializeWhenContextReady();
            for (String lifecycleName : new String[]{"start", "systemRunning"}) {
                Method lifecycle = findMethod(service, lifecycleName);
                if (lifecycle == null) continue;
                lifecycle.setAccessible(true);
                HookHandle lifecycleHandle = module.prepareFeatureHook(
                                lifecycle, "tgk.system_context." + lifecycleName, false)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            initializeWithContext(FeatureSettings.from(chain.getThisObject()));
                            return result;
                        });
                module.registerFeatureHook(lifecycleHandle);
                installed++;
            }
            module.logFeatureInfo("TGK_RAPID_FIRE_SYSTEM_INSTALLED "
                    + installedDescriptor);
            return installed;
        } catch (Throwable error) {
            writeDiagnostic(FeatureSettings.from(null),
                    FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_ERROR,
                    "java_install=" + error.getClass().getSimpleName()
                            + ":" + safe(error.getMessage()));
            module.logFeatureError("TGK_RAPID_FIRE_SYSTEM_FAILED", error);
            return 0;
        }
    }

    private static Object intercept(AugmentModule module, Chain chain) throws Throwable {
        if (Boolean.TRUE.equals(INTERCEPTING.get())) return chain.proceed();
        INTERCEPTING.set(Boolean.TRUE);
        try {
            return interceptOnce(module, chain);
        } finally {
            INTERCEPTING.remove();
        }
    }

    private static Object interceptOnce(AugmentModule module, Chain chain) throws Throwable {
        Object keyValue = chain.getArg(1);
        int keyCode = keyValue instanceof Number ? ((Number) keyValue).intValue() : -1;
        if (keyCode <= 0 || keyCode > 65535) return chain.proceed();

        Context context = FeatureSettings.from(chain.getThisObject());
        Object countValue = chain.getArg(0);
        int requested = countValue instanceof Number ? ((Number) countValue).intValue() : 0;
        Runnable afterCall = beforeCall(module, context, requested, keyCode);
        Object result = chain.proceed();
        afterCall.run();
        return result;
    }

    private static Object interceptBinder(AugmentModule module, Chain chain,
            int transactionCode) throws Throwable {
        Object codeValue = chain.getArg(0);
        int code = codeValue instanceof Number ? ((Number) codeValue).intValue() : -1;
        if (code != transactionCode || Boolean.TRUE.equals(INTERCEPTING.get())) {
            return chain.proceed();
        }
        int[] values = readRapidFireParcel(chain.getArg(1));
        if (values == null) return chain.proceed();
        INTERCEPTING.set(Boolean.TRUE);
        try {
            Context context = FeatureSettings.from(chain.getThisObject());
            Runnable afterCall = beforeCall(module, context, values[0], values[1]);
            Object result = chain.proceed();
            afterCall.run();
            return result;
        } finally {
            INTERCEPTING.remove();
        }
    }

    private static int[] readRapidFireParcel(Object parcelValue) {
        if (!(parcelValue instanceof Parcel)) return null;
        Parcel source = (Parcel) parcelValue;
        int size = source.dataSize();
        if (size <= 0 || size > 1024) return null;
        Parcel copy = Parcel.obtain();
        try {
            copy.appendFrom(source, 0, size);
            copy.setDataPosition(0);
            copy.enforceInterface(INPUT_MANAGER_DESCRIPTOR);
            int requested = copy.readInt();
            int keyCode = copy.readInt();
            if(android.os.Build.VERSION.SDK_INT>=33)copy.enforceNoDataAvail();
            else if(copy.dataAvail()!=0)return null;
            return new int[]{requested, keyCode};
        } catch (Throwable ignored) {
            return null;
        } finally {
            copy.recycle();
        }
    }

    private static Runnable beforeCall(AugmentModule module, Context context,
            int requestedValue, int keyCode) {
        if (keyCode <= 0 || keyCode > 65535) return NO_AFTER_CALL;
        publishInstalled(context, false);
        ensureSnapshotListener(context);
        int requested = Math.max(0, Math.min(MAX_CPS, requestedValue));

        long now = System.currentTimeMillis();
        RapidFireCompatibility.Session session = RapidFireCompatibility.Session.parse(
                FeatureSettings.text(context,
                        FeatureSettings.TGK_RAPID_FIRE_TEST_SESSION, ""));
        if (testWindowActive(session, now, context)) {
            if (session.state == RapidFireCompatibility.State.WAIT_LEFT
                    || session.state == RapidFireCompatibility.State.WAIT_RIGHT) {
                // A settings refresh may contain BOTH keys. It is not physical-side
                // evidence. Only the native observer selects a side's system code.
                return NO_AFTER_CALL;
            }
            String side = testSide(session, keyCode);
            if (side != null) {
                writeDiagnostic(context, "ls_augment_tgk_rapid_fire_test_system_" + side,
                        "id=" + session.id + "|code=" + keyCode
                                + "|count=" + requested + "|time=" + now);
                if (!TgkRapidFireNative.ensureInstalled(module, context)) {
                    writeDiagnostic(context, FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_ERROR,
                            "test_fallback|state=" + safe(TgkRapidFireNative.state(context)));
                    return NO_AFTER_CALL;
                }
                TgkRapidFireNative.configureTestKey(context, side, keyCode);
                TgkRapidFireNative.setTarget(context, keyCode,
                        RapidFireCompatibility.TEST_CPS);
                scheduleSessionCleanup(context, session);
                return () -> scheduleNativeWitness(context, session, side, keyCode);
            }
        } else if (session != null && session.state != RapidFireCompatibility.State.PASSED) {
            TgkRapidFireNative.clearTargets(context);
        }

        RapidFireCompatibility.Token token = RapidFireCompatibility.Token.parse(
                FeatureSettings.text(context,
                        FeatureSettings.TGK_RAPID_FIRE_COMPAT_TOKEN, ""));

        boolean enabled = FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER, false)
                && FeatureSettings.enabled(context, FeatureSettings.TGK_RAPID_FIRE_ENABLED,
                false) && token != null
                && token.validFor(RapidFireCompatibility.currentFingerprint(context))
                && token.acceptsSystem(keyCode)
                && !RapidFireCrashFuse.isFused(context);
        if (!enabled) {
            TgkRapidFireNative.clearTargets(context);
            return NO_AFTER_CALL;
        }
        if (requested <= OEM_MAX_CPS) {
            // Clearing the native target is enough to restore the OEM path.
            // The inline hook remains installed for the lifetime of
            // system_server to avoid an unsafe concurrent unhook.
            TgkRapidFireNative.setTarget(context, keyCode, 0);
            return NO_AFTER_CALL;
        }

        writeDiagnostic(context, FeatureSettings.TGK_RAPID_FIRE_NATIVE_STATE,
                "java_hit|key=" + keyCode + "|requested=" + requested);

        if (!TgkRapidFireNative.ensureInstalled(module, context)) {
            writeDiagnostic(context, FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_ERROR,
                    "fallback|state=" + safe(TgkRapidFireNative.state(context)));
            return NO_AFTER_CALL;
        }

        TgkRapidFireNative.configureKeys(context, token.systemLeft, token.systemRight);
        TgkRapidFireNative.setTarget(context, keyCode, requested);
        hit(context, keyCode, requested);
        return NO_AFTER_CALL;
    }

    private static String testSide(RapidFireCompatibility.Session session, int keyCode) {
        if (session.state == RapidFireCompatibility.State.VERIFYING) {
            if (keyCode == session.systemLeft) return "left";
            if (keyCode == session.systemRight) return "right";
        }
        return null;
    }

    private static boolean testWindowActive(RapidFireCompatibility.Session session, long now,
            Context context) {
        return session != null && session.active(now)
                && session.validFor(RapidFireCompatibility.currentFingerprint(context))
                && (session.state != RapidFireCompatibility.State.VERIFYING
                || now - session.verifyingSince
                <= RapidFireCompatibility.STABILITY_REQUIRED_MS);
    }

    private static synchronized void ensureSnapshotListener(Context context) {
        if (snapshotListenerInstalled || context == null) return;
        snapshotListenerInstalled = FeatureSettings.addSnapshotListener(
                context, () -> onSnapshotChanged(context));
        if (snapshotListenerInstalled) {
            snapshotListenerAttempts = 0;
            snapshotListenerRetryScheduled = false;
            writeDiagnostic(context, "ls_augment_tgk_rapid_fire_snapshot_listener",
                    "ready|module=" + BuildConfig.VERSION_NAME
                            + "|pid=" + Process.myPid()
                            + "|time=" + System.currentTimeMillis());
            return;
        }
        scheduleSnapshotListenerRetry();
    }

    private static synchronized void scheduleSnapshotListenerRetry() {
        if (snapshotListenerInstalled || snapshotListenerRetryScheduled
                || snapshotListenerAttempts >= 60) return;
        Looper looper = Looper.getMainLooper();
        if (looper == null) return;
        snapshotListenerRetryScheduled = true;
        snapshotListenerAttempts++;
        new Handler(looper).postDelayed(() -> {
            synchronized (TgkRapidFireSystemHook.class) {
                snapshotListenerRetryScheduled = false;
            }
            Context context = FeatureSettings.from(null);
            ensureSnapshotListener(context);
            if (snapshotListenerInstalled && context != null) {
                FeatureSettings.invalidateSnapshot();
                onSnapshotChanged(context);
            }
        }, 1_000L);
    }

    /** system_server may load the module before ActivityThread exposes a Context. */
    private static void initializeWhenContextReady() {
        Context context = FeatureSettings.from(null);
        if (context != null) {
            initializeWithContext(context);
            return;
        }
        int attempt = ++contextReadyAttempts;
        if (attempt > 60) return;
        try {
            Looper looper = Looper.getMainLooper();
            if (looper == null) return;
            new Handler(looper).postDelayed(
                    TgkRapidFireSystemHook::initializeWhenContextReady, 1_000L);
        } catch (Throwable ignored) { }
    }

    private static void initializeWithContext(Context context) {
        if (context == null) return;
        contextReadyAttempts = 0;
        RapidFireCrashFuse.onSystemStart(context);
        ensureSnapshotListener(context);
        publishInstalled(context, false);
        scheduleInstalledRepublish(context);
        onSnapshotChanged(context);
    }

    static void onSystemContextReady(Context context) {
        initializeWithContext(context);
        publishInstalled(context, true);
    }

    private static void onSnapshotChanged(Context context) {
        TgkRapidFireNative.clearTargets(context);
        long now = System.currentTimeMillis();
        RapidFireCompatibility.Session session = RapidFireCompatibility.Session.parse(
                FeatureSettings.text(context,
                        FeatureSettings.TGK_RAPID_FIRE_TEST_SESSION, ""));
        writeDiagnostic(context, "ls_augment_tgk_rapid_fire_snapshot_seen",
                "module=" + BuildConfig.VERSION_NAME + "|state="
                        + (session == null ? "none" : session.state.name())
                        + "|time=" + now);
        boolean validSession = session != null && session.active(now)
                && session.validFor(RapidFireCompatibility.currentFingerprint(context));
        if (validSession) scheduleSessionCleanup(context, session);
        else cancelSessionCleanup();
        if (validSession && (session.state == RapidFireCompatibility.State.WAIT_LEFT
                || session.state == RapidFireCompatibility.State.WAIT_RIGHT
                || session.state == RapidFireCompatibility.State.VERIFYING)) {
            AugmentModule module = moduleReference;
            if (module == null || !TgkRapidFireNative.ensureInstalled(module, context)) {
                writeDiagnostic(context, FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_ERROR,
                        "test_install_unavailable|state="
                                + safe(TgkRapidFireNative.state(context)));
                return;
            }
            if (session.state == RapidFireCompatibility.State.WAIT_LEFT
                    || session.state == RapidFireCompatibility.State.WAIT_RIGHT) {
                beginNativeObservation(context, session);
                return;
            }
        }

        if (validSession && session.state == RapidFireCompatibility.State.VERIFYING
                && session.verifyingSince > 0L
                && now - session.verifyingSince
                <= RapidFireCompatibility.STABILITY_REQUIRED_MS
                && session.systemLeft > 0 && session.systemLeft <= 65535
                && session.systemRight > 0 && session.systemRight <= 65535
                && session.systemLeft != session.systemRight
                && TgkRapidFireNative.isLoaded()) {
            TgkRapidFireNative.configureKeys(context, session.systemLeft, session.systemRight);
            TgkRapidFireNative.setTarget(context, session.systemLeft,
                    RapidFireCompatibility.TEST_CPS);
            TgkRapidFireNative.setTarget(context, session.systemRight,
                    RapidFireCompatibility.TEST_CPS);
            scheduleStabilityWitness(context, session);
            return;
        }

        RapidFireCompatibility.Token token = RapidFireCompatibility.Token.parse(
                FeatureSettings.text(context,
                        FeatureSettings.TGK_RAPID_FIRE_COMPAT_TOKEN, ""));
        boolean enabled = FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER, false)
                && FeatureSettings.enabled(context,
                        FeatureSettings.TGK_RAPID_FIRE_ENABLED, false)
                && token != null
                && token.validFor(RapidFireCompatibility.currentFingerprint(context))
                && !RapidFireCrashFuse.isFused(context);
        if (!enabled) {
            resetNativeObservation();
            return;
        }
        AugmentModule module = moduleReference;
        if (module == null || !TgkRapidFireNative.ensureInstalled(module, context)) return;
        TgkRapidFireNative.configureKeys(context, token.systemLeft, token.systemRight);
        int count = FeatureSettings.integer(context,
                FeatureSettings.TGK_RAPID_FIRE_COUNT, 20, 10, MAX_CPS);
        TgkRapidFireNative.setTarget(context, token.systemLeft, count);
        TgkRapidFireNative.setTarget(context, token.systemRight, count);
    }

    private static synchronized void beginNativeObservation(Context context,
            RapidFireCompatibility.Session session) {
        if (context == null || session == null || !TgkRapidFireNative.isLoaded()) return;
        String key = session.id + "|" + session.state.name();
        if (!key.equals(observationSessionKey)) {
            NativeObservation observation = NativeObservation.parse(
                    TgkRapidFireNative.observation());
            observationSessionKey = key;
            observationBaseline = observation == null ? 0L : observation.sequence;
        }
        if (observationPollScheduled) return;
        Looper looper = Looper.getMainLooper();
        if (looper == null) return;
        observationPollScheduled = true;
        new Handler(looper).postDelayed(() -> pollNativeObservation(context), 100L);
    }

    private static void pollNativeObservation(Context context) {
        synchronized (TgkRapidFireSystemHook.class) {
            observationPollScheduled = false;
        }
        long now = System.currentTimeMillis();
        RapidFireCompatibility.Session session = RapidFireCompatibility.Session.parse(
                FeatureSettings.text(context,
                        FeatureSettings.TGK_RAPID_FIRE_TEST_SESSION, ""));
        if (session == null || !session.active(now)
                || !session.validFor(RapidFireCompatibility.currentFingerprint(context))
                || (session.state != RapidFireCompatibility.State.WAIT_LEFT
                && session.state != RapidFireCompatibility.State.WAIT_RIGHT)) {
            resetNativeObservation();
            return;
        }
        String expectedKey = session.id + "|" + session.state.name();
        if (!expectedKey.equals(observationSessionKey)) {
            beginNativeObservation(context, session);
            return;
        }
        NativeObservation observation = NativeObservation.parse(
                TgkRapidFireNative.observation());
        if (observation != null && observation.sequence > observationBaseline
                && observation.keyCode > 0 && observation.keyCode <= 65535) {
            String side = session.state == RapidFireCompatibility.State.WAIT_LEFT
                    ? "left" : "right";
            writeDiagnostic(context, "ls_augment_tgk_rapid_fire_test_system_" + side,
                    "id=" + session.id + "|code=" + observation.keyCode
                            + "|count=" + RapidFireCompatibility.TEST_CPS
                            + "|source=native_observer|time=" + now);
            TgkRapidFireNative.configureTestKey(
                    context, side, observation.keyCode);
            TgkRapidFireNative.setTarget(context, observation.keyCode,
                    RapidFireCompatibility.TEST_CPS);
            TgkRapidFireNative.armCadence(session.id,session.state.name(),observation.keyCode);
            scheduleCadenceWitness(context,session,side);
            if (!replayRapidFireCall(observation.keyCode)) {
                writeDiagnostic(context, FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_ERROR,
                        "test_replay_failed|key=" + observation.keyCode);
            }
            scheduleNativeWitness(context, session, side, observation.keyCode);
            return;
        }
        beginNativeObservation(context, session);
    }

    private static boolean replayRapidFireCall(int keyCode) {
        if (keyCode <= 0 || keyCode > 65535) return false;
        try {
            Class<?> serviceManager = Class.forName("android.os.ServiceManager");
            Object binder = serviceManager.getMethod("getService", String.class)
                    .invoke(null, "input");
            if (binder == null) return false;
            Class<?> binderType = Class.forName("android.os.IBinder");
            Class<?> stub = Class.forName(INPUT_MANAGER_STUB);
            Object service = stub.getMethod("asInterface", binderType)
                    .invoke(null, binder);
            if (service == null) return false;
            Method method = service.getClass().getMethod(
                    "setTgkRapidFireCount", int.class, int.class);
            INTERCEPTING.set(Boolean.TRUE);
            try {
                method.invoke(service, RapidFireCompatibility.TEST_CPS, keyCode);
            } finally {
                INTERCEPTING.remove();
            }
            return true;
        } catch (Throwable ignored) {
            INTERCEPTING.remove();
            return false;
        }
    }

    private static void scheduleCadenceWitness(Context context,RapidFireCompatibility.Session expected,String side){
        Handler handler=new Handler(Looper.getMainLooper());
        handler.postDelayed(new Runnable(){public void run(){
            RapidFireCompatibility.Session current=RapidFireCompatibility.Session.parse(FeatureSettings.text(context,FeatureSettings.TGK_RAPID_FIRE_TEST_SESSION,""));
            if(current==null||!current.id.equals(expected.id)||current.state!=expected.state||!current.active(System.currentTimeMillis()))return;
            String evidence=TgkRapidFireNative.cadence();
            writeDiagnostic(context,"ls_augment_tgk_rapid_fire_test_cadence_"+side,
                    "id="+current.id+"|phase="+current.state.name()+"|"+evidence+"|pid="+Process.myPid()+"|time="+System.currentTimeMillis());
            if(!evidence.endsWith("|passed=1"))handler.postDelayed(this,500);
        }},500);
    }

    private static synchronized void resetNativeObservation() {
        observationSessionKey = "";
        observationBaseline = 0L;
    }

    private static final class NativeObservation {
        final int keyCode;
        final long sequence;

        NativeObservation(int keyCode, long sequence) {
            this.keyCode = keyCode;
            this.sequence = sequence;
        }

        static NativeObservation parse(String value) {
            if (value == null || value.isEmpty()) return null;
            int keyCode = -1;
            long sequence = -1L;
            for (String part : value.split("\\|")) {
                try {
                    if (part.startsWith("key=")) {
                        keyCode = Integer.parseInt(part.substring(4));
                    } else if (part.startsWith("sequence=")) {
                        sequence = Long.parseLong(part.substring(9));
                    }
                } catch (Throwable ignored) { return null; }
            }
            return sequence >= 0L ? new NativeObservation(keyCode, sequence) : null;
        }
    }

    private static void scheduleStabilityWitness(Context context,
            RapidFireCompatibility.Session session) {
        try {
            long completedAt = session.verifyingSince
                    + RapidFireCompatibility.STABILITY_REQUIRED_MS;
            long delay = Math.max(1L, completedAt - System.currentTimeMillis());
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                RapidFireCompatibility.Session current = RapidFireCompatibility.Session.parse(
                        FeatureSettings.text(context,
                                FeatureSettings.TGK_RAPID_FIRE_TEST_SESSION, ""));
                if (current == null || current.state != RapidFireCompatibility.State.VERIFYING
                        || !session.id.equals(current.id)
                        || !current.validFor(RapidFireCompatibility.currentFingerprint(context))
                        || System.currentTimeMillis() < completedAt) {
                    // A callback from a completed/cancelled/replaced test no longer
                    // owns the native targets. The latest snapshot owns recovery.
                    return;
                }
                if (current.isExpired(System.currentTimeMillis())) {
                    onSnapshotChanged(context);
                    return;
                }
                String state = TgkRapidFireNative.state(context);
                TgkRapidFireNative.clearTargets(context);
                writeDiagnostic(context, "ls_augment_tgk_rapid_fire_test_stability",
                        "id=" + session.id + "|complete=1|pid=" + Process.myPid()
                                + "|state=" + diagnosticState(state)
                                + "|time=" + System.currentTimeMillis());
            }, delay);
        } catch (Throwable ignored) {
            TgkRapidFireNative.clearTargets(context);
        }
    }

    private static synchronized void cancelSessionCleanup() {
        if (testCleanupHandler != null && testCleanup != null) {
            testCleanupHandler.removeCallbacks(testCleanup);
        }
        testCleanup = null;
    }

    private static synchronized void scheduleSessionCleanup(Context context,
            RapidFireCompatibility.Session scheduled) {
        try {
            cancelSessionCleanup();
            long delay = Math.max(1L, Math.min(RapidFireCompatibility.SESSION_MAX_MS,
                    scheduled.expiresAt - System.currentTimeMillis() + 100L));
            testCleanupHandler = new Handler(Looper.getMainLooper());
            testCleanup = () -> {
                FeatureSettings.invalidateSnapshot();
                RapidFireCompatibility.Session current = RapidFireCompatibility.Session.parse(
                        FeatureSettings.text(context, FeatureSettings.TGK_RAPID_FIRE_TEST_SESSION, ""));
                if (current == null || !RapidFireLifecyclePolicy.ownsExpiredTest(
                        scheduled.id, current.id, current.state.name(),
                        System.currentTimeMillis(), current.expiresAt)) return;
                // Reconcile the latest configuration; never blindly zero an approved
                // feature or a newer test's targets from this old timer.
                onSnapshotChanged(context);
            };
            testCleanupHandler.postDelayed(testCleanup, delay);
        } catch (Throwable ignored) { }
    }

    private static void scheduleNativeWitness(Context context,
            RapidFireCompatibility.Session session, String side, int keyCode) {
        if (context == null || session == null || side == null) return;
        try {
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                String state = TgkRapidFireNative.state(context);
                writeDiagnostic(context, "ls_augment_tgk_rapid_fire_test_native_" + side,
                        "id=" + session.id + "|code=" + keyCode + "|state="
                                + diagnosticState(state) + "|time=" + System.currentTimeMillis());
            }, 500L);
        } catch (Throwable ignored) { }
    }

    private static void hit(Context context, int keyCode, int cps) {
        long now = System.currentTimeMillis();
        if (now - lastDiagnostic < 500L) return;
        lastDiagnostic = now;
        writeDiagnostic(context, FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_HIT,
                "key=" + keyCode + "|cps=" + cps + "|" + now);
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... parameters) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try { return current.getDeclaredMethod(name, parameters); }
            catch (NoSuchMethodException ignored) { }
        }
        return null;
    }

    private static void writeDiagnostic(Context context, String key, String value) {
        try { FeatureSettings.diagnostic(context, key, value); }
        catch (Throwable ignored) { }
    }

    private static void publishInstalled(Context context, boolean force) {
        String descriptor = installedDescriptor;
        if (context == null || descriptor == null) return;
        long now = System.currentTimeMillis();
        if (!force && now - lastInstalledPublish < 5_000L) return;
        lastInstalledPublish = now;
        writeDiagnostic(context, "ls_augment_tgk_rapid_fire_system_installed", descriptor);
    }

    private static synchronized void scheduleInstalledRepublish(Context context) {
        if (context == null || installedRepublishScheduled) return;
        Looper looper = Looper.getMainLooper();
        if (looper == null) return;
        installedRepublishScheduled = true;
        Handler handler = new Handler(looper);
        handler.postDelayed(() -> publishInstalled(context, true), 5_000L);
        handler.postDelayed(() -> publishInstalled(context, true), 20_000L);
    }

    private static String safe(String value) {
        return value == null ? "" : value.replace('|', '_').replace('\n', ' ');
    }

    private static String diagnosticState(String value) {
        return value == null ? "" : value.replace('\n', ' ').replace('\r', ' ');
    }
}
