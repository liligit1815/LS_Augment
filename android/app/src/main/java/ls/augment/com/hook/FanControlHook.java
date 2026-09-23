package ls.augment.com.hook;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.PowerManager;
import android.provider.Settings;

import java.io.File;
import java.lang.reflect.Method;

import ls.augment.com.ConfigSchema;
import ls.augment.com.FanCalibrationData;
import ls.augment.com.FanCalibrationOutcome;
import ls.augment.com.FanHardwareIdentity;

import io.github.libxposed.api.XposedInterface.HookHandle;

/** OEM-session-bound control, with separate verified-level and OEM-only capabilities. */
final class FanControlHook {
    private static final String CONTROLLER_CLASS = "cn.nubia.fan.policy.FanControllerImpl";
    private static final String UTILS_CLASS = "cn.nubia.fan.util.Utils";
    private static final String FAN_LEVEL = "sys/kernel/fan/fan_speed_level";
    private static final String FAN_RPM = "sys/kernel/fan/fan_speed_count";
    private static final String OEM_MANUAL = "fan_state_of_manual";
    private static final String OEM_MODE = "fan_state_of_mode";
    private static final long POLL_MS = 900L;
    private static final int MAX_BATTERY_TENTHS_C = 500;

    private static volatile Controller controller;

    private FanControlHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> type = Class.forName(CONTROLLER_CLASS, false, loader);
            Class<?> utils = Class.forName(UTILS_CLASS, false, loader);
            Method writeNode = utils.getDeclaredMethod(
                    "setNodeValue", String.class, String.class);
            Method readNode = utils.getDeclaredMethod("readNodeValue", String.class);
            writeNode.setAccessible(true);
            readNode.setAccessible(true);
            FanCompatibilityProfile profile = FanCompatibilityProfile.resolve(
                    Build.DEVICE, Build.PRODUCT, Build.MODEL,
                    hasVoidMethod(type, "fanMaxSpeed"), hasVoidMethod(type, "fanFullSpeed"),
                    hasVoidMethod(type, "cancelFanFullSpeed"), hasVoidMethod(type, "notifyCubeFan"),
                    path -> new File("/" + path).exists());
            Controller installedController = new Controller(module, writeNode, readNode, profile);
            controller = installedController;

            int installed = 0;
            Method start = type.getDeclaredMethod("start");
            start.setAccessible(true);
            HookHandle startHandle = module.prepareFeatureHook(
                            start, "fan.controller_start", false)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        Controller active = controller;
                        if (active != null) active.start(
                                FeatureSettings.from(chain.getThisObject()),
                                chain.getThisObject());
                        return result;
                    });
            module.registerFeatureHook(startHandle);
            installed++;

            Method notifyMode = type.getDeclaredMethod("notifyCubeFan");
            notifyMode.setAccessible(true);
            HookHandle modeHandle = module.prepareFeatureHook(
                            notifyMode, "fan.observe_oem_mode", false)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        Controller active = controller;
                        if (active != null) active.start(
                                FeatureSettings.from(chain.getThisObject()),
                                chain.getThisObject());
                        return result;
                    });
            module.registerFeatureHook(modeHandle);
            installed++;

            Method setEnable = type.getDeclaredMethod("setFanEnable", boolean.class);
            setEnable.setAccessible(true);
            HookHandle enableHandle = module.prepareFeatureHook(
                            setEnable, "fan.observe_oem_enable", false)
                    .intercept(chain -> {
                        Controller active = controller;
                        if (active != null) active.enableRequested(chain.getThisObject(),
                                Boolean.TRUE.equals(chain.getArg(0)));
                        Object result = chain.proceed();
                        active = controller;
                        if (active != null) active.start(
                                FeatureSettings.from(chain.getThisObject()),
                                chain.getThisObject());
                        return result;
                    });
            module.registerFeatureHook(enableHandle);
            installed++;

            if (hasVoidMethod(type, "onShutDown")) {
                Method shutdown = type.getDeclaredMethod("onShutDown");
                shutdown.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(
                        shutdown, "fan.observe_oem_shutdown", false).intercept(chain -> {
                    Controller active = controller;
                    if (active != null) active.shutdown(chain.getThisObject());
                    return chain.proceed();
                }));
                installed++;
            }
            installedController.hookCount = installed;

            Context context = FeatureSettings.from(null);
            FeatureSettings.diagnostic(context, FeatureSettings.FAN_CONTROL_INSTALLED,
                    "hooks=" + installed + ";device=" + Build.DEVICE
                            + installedController.capabilityDiagnostic());
            FeatureSettings.diagnostic(context, FeatureSettings.FAN_CONTROL_LAST_ERROR, "");
            module.logFeatureInfo("FAN_CONTROL_READY hooks=" + installed
                    + " device=" + Build.DEVICE + " oem_session_only=true");
            return installed;
        } catch (Throwable error) {
            Context context = FeatureSettings.from(null);
            FeatureSettings.diagnostic(context, FeatureSettings.FAN_CONTROL_LAST_ERROR,
                    "install:" + safeMessage(error));
            module.logFeatureError("FAN_CONTROL_INSTALL", error);
            return 0;
        }
    }

    private enum ControlKind { NONE, FIXED_LEVEL, OEM_EXTREME, OEM_FULL_SPEED, CALIBRATION }

    private static final class Controller implements Runnable {
        private final AugmentModule module;
        private final Method writeNode;
        private final Method readNode;
        private final FanCompatibilityProfile profile;
        private final Object lock = new Object();
        private HandlerThread thread;
        private Handler handler;
        private long wakeGeneration;
        private Context context;
        private Object owner;
        private final FanPowerLease powerLease = new FanPowerLease();
        private volatile boolean shuttingDown;
        private volatile boolean oemOffRequested;
        private int hookCount;
        private boolean listenerInstalled;
        private boolean diagnosticsInitialized;
        private boolean lastOemEnabled;
        private boolean sessionLocked;
        private int validRpmSamples;
        private int actualRpm;
        private final FanLevelCommand levelCommand = new FanLevelCommand();
        private final FanNativeSettle nativeSettle = new FanNativeSettle();
        private int capturedLevel = -1;
        private int capturedMode = Integer.MIN_VALUE;
        private int capturedManual = Integer.MIN_VALUE;
        private ControlKind controlKind = ControlKind.NONE;
        private long lastDiagnosticAt;
        private String lastCalibrationRequest = "";
        private String lastTileRequest = "";
        private String activeCalibrationRequest = "";
        private int[][] calibrationSamples;
        private int calibrationLevel;
        private int calibrationSample;
        private FanCalibrationData calibrationResult;
        private long calibrationRestoreStarted;

        Controller(AugmentModule module, Method writeNode, Method readNode,
                FanCompatibilityProfile profile) {
            this.module = module;
            this.writeNode = writeNode;
            this.readNode = readNode;
            this.profile = profile;
        }

        private String capabilityDiagnostic() {
            return ";oem_session_only=1;fan_enable_writes=0;capability=" + profile.capability()
                    + ";enable_node=" + profile.enableNode + ";rpm_node=" + profile.rpmNode
                    + ";power_method=" + profile.powerMethod
                    + ";speed_interface=" + (profile.allowsLevelWrites() ? "level" : "oem_api")
                    + ";level_writes=" + (profile.allowsLevelWrites() ? 1 : 0)
                    + ";reason=" + profile.reason;
        }

        void start(Context newContext, Object newOwner) {
            if (newContext == null || newOwner == null || shuttingDown) return;
            // OEM restoration invokes a hooked method. Do not hold the worker lock
            // while invoking it, or another OEM callback could invert the lock order.
            if (owner != null && owner != newOwner && controlKind != ControlKind.NONE) {
                safeRelease("vendor_owner_changed", false);
                sessionLocked = true;
            }
            synchronized (lock) {
                Context application = newContext.getApplicationContext();
                context = application;
                owner = newOwner;
                if (controlKind == ControlKind.NONE) {
                    nativeSettle.nativeEvent(android.os.SystemClock.elapsedRealtime());
                }
                FeatureSettings.diagnostic(application,
                        FeatureSettings.FAN_CONTROL_INSTALLED,
                        "hooks=" + hookCount + ";device=" + Build.DEVICE
                                + capabilityDiagnostic());
                if (!diagnosticsInitialized) {
                    diagnosticsInitialized = true;
                    lastCalibrationRequest = FeatureSettings.diagnosticValue(application,
                            "ls_augment_fan_calibration_consumed");
                    FeatureSettings.diagnostic(application,
                            FeatureSettings.FAN_CONTROL_LAST_ERROR, "");
                    FeatureSettings.diagnostic(application,
                            FeatureSettings.FAN_CONTROL_ACTIVE,
                            "idle;reason=controller_started;ts=" + System.currentTimeMillis());
                }
                if (!listenerInstalled) {
                    listenerInstalled = true;
                    FeatureSettings.addSnapshotListener(application, () -> {
                        synchronized (lock) {
                            ensureThreadLocked();
                            requestImmediateLocked();
                        }
                    });
                }
                ensureThreadLocked();
                requestImmediateLocked();
            }
        }

        void enableRequested(Object requestOwner, boolean enabled) {
            if (profile.allowsLevelWrites() || (owner != null && owner != requestOwner)) return;
            oemOffRequested = !enabled;
            try { powerLease.nativeEnableRequested(enabled); }
            catch (Throwable error) { report("oem_off_power_release", error); }
        }

        void shutdown(Object requestOwner) {
            if (owner != null && owner != requestOwner) return;
            shuttingDown = true;
            try { powerLease.shutdown(); }
            catch (Throwable error) { report("shutdown_power_release", error); }
            synchronized (lock) {
                if (handler != null) requestImmediateLocked();
            }
        }

        private void ensureThreadLocked() {
            if (handler != null) return;
            thread = new HandlerThread("LSAugmentFanControl");
            thread.start();
            handler = new Handler(thread.getLooper());
        }

        private void requestImmediateLocked() {
            if (handler == null) return;
            wakeGeneration++;
            handler.removeCallbacks(this);
            handler.post(this);
        }

        @Override public void run() {
            final Handler executingHandler;
            final long wakeAtStart;
            synchronized (lock) {
                executingHandler = handler;
                // A stopped handler can still drain ready messages. Those old
                // callbacks must not run against, or shut down, a newer worker.
                if (executingHandler == null
                        || Looper.myLooper() != executingHandler.getLooper()) return;
                wakeAtStart = wakeGeneration;
            }
            boolean keepRunning = true;
            try {
                Context current = context;
                if (shuttingDown) {
                    safeRelease("vendor_shutdown", false);
                    status("idle;reason=vendor_shutdown", 0L);
                    keepRunning = false;
                    return;
                }
                if (current == null || !profile.supported()) {
                    safeRelease("unsupported_device", false);
                    status("idle;reason=" + profile.reason + ";device=" + Build.DEVICE, 10_000L);
                    keepRunning = false;
                    return;
                }

                boolean master = FeatureSettings.enabled(
                        current, FeatureSettings.GAME_MASTER, false);
                boolean fixed = master && FeatureSettings.enabled(
                        current, FeatureSettings.FAN_FIXED_ENABLED, false);
                int fixedLevel = fixed ? FeatureSettings.integer(current,
                        ConfigSchema.FAN_FIXED_LEVEL, 0, 0, 5) : 0;
                String tileRequest = FeatureSettings.text(current, ConfigSchema.FAN_TILE_REQUEST, "");
                if (!tileRequest.equals(lastTileRequest)) {
                    lastTileRequest = tileRequest;
                    // Explicit user selection starts a fresh request. It may follow an
                    // external OEM mode change which correctly suspended the old request.
                    safeRelease("tile_selection", true);
                    sessionLocked = false;
                    validRpmSamples = 0;
                    nativeSettle.nativeEvent(android.os.SystemClock.elapsedRealtime());
                    FeatureSettings.diagnostic(current, FeatureSettings.FAN_CONTROL_LAST_ERROR, "");
                }
                boolean unlock = master && FeatureSettings.enabled(
                        current, FeatureSettings.FAN_UNLOCK_MAX, false);
                String request = FeatureSettings.text(current,
                        ConfigSchema.FAN_CALIBRATION_REQUEST, "");
                boolean validRequest = FanCalibrationData.validRequest(request,
                        System.currentTimeMillis());
                if (controlKind == ControlKind.CALIBRATION
                        && (!validRequest || !request.equals(activeCalibrationRequest))) {
                    safeRelease("calibration_cancelled", true);
                }
                boolean calibrationPending = validRequest
                        && !request.equals(lastCalibrationRequest);
                boolean requested = fixed || unlock || calibrationPending
                        || controlKind == ControlKind.CALIBRATION;

                if (!profile.allowsLevelWrites()) {
                    if (calibrationPending) {
                        // The existing calibration writes every level before measuring it.
                        // It must never be used to discover unknown driver bounds.
                        lastCalibrationRequest = request;
                        FeatureSettings.diagnostic(current,
                                "ls_augment_fan_calibration_consumed", request);
                        reportCalibrationOutcome(request, "calibration_levels_unverified");
                    }
                    if (!unlock) {
                        safeRelease("feature_off", true);
                        String reason = fixed ? "fixed_speed_unverified"
                                : calibrationPending ? "calibration_levels_unverified" : "feature_off";
                        FeatureSettings.diagnostic(current, FeatureSettings.FAN_CONTROL_LAST_ERROR,
                                "feature_off".equals(reason) ? "" : reason);
                        status("idle;reason=" + reason, 0L);
                        keepRunning = false;
                        return;
                    }
                }

                ReadResult enable = readInt(profile.enableNode);
                if (!enable.valid || (enable.value != 0 && enable.value != 1)) {
                    failSession("fan_enable_read", false);
                    return;
                }
                boolean oemEnabled = enable.value != 0 && !oemOffRequested;
                if (!oemEnabled) {
                    // The module never writes fan_enable. If it previously
                    // selected a speed, restore the captured OEM level while
                    // the enable node remains 0 so the next OEM session does
                    // not inherit a module-selected speed.
                    safeRelease("oem_off", true);
                    lastOemEnabled = false;
                    sessionLocked = false;
                    validRpmSamples = 0;
                    resetCapture();
                    status(requested ? "armed;waiting_for_oem_fan"
                            : "idle;reason=feature_off", requested ? 3_000L : 0L);
                    keepRunning = requested;
                    FeatureSettings.diagnostic(current,
                            FeatureSettings.FAN_CONTROL_LAST_ERROR, "");
                    return;
                }
                // Observe OEM OFF even while both features are disabled, so an
                // earlier failed session cannot stay locked across a real OFF/ON.
                if (!requested) {
                    safeRelease("feature_off", true);
                    status("idle;reason=feature_off", 0L);
                    keepRunning = false;
                    return;
                }
                if (!lastOemEnabled) {
                    lastOemEnabled = true;
                    sessionLocked = false;
                    validRpmSamples = 0;
                    resetCapture();
                    FeatureSettings.diagnostic(current,
                            FeatureSettings.FAN_CONTROL_LAST_ERROR, "");
                }
                if (sessionLocked) {
                    status("locked;until_next_oem_session", 3_000L);
                    return;
                }

                int mode;
                int manual;
                try {
                    mode = Settings.System.getInt(current.getContentResolver(), OEM_MODE);
                    manual = Settings.System.getInt(current.getContentResolver(), OEM_MANUAL);
                } catch (Throwable error) {
                    failSession("vendor_state_read", false);
                    return;
                }
                if (controlKind != ControlKind.NONE
                        && (mode != capturedMode || manual != capturedManual)) {
                    // The OEM took ownership between polls. Never overwrite
                    // its new state with the values captured by this module.
                    safeRelease("vendor_state_changed", false);
                    sessionLocked = profile.allowsLevelWrites();
                    validRpmSamples = 0;
                    FeatureSettings.diagnostic(current,
                            FeatureSettings.FAN_CONTROL_LAST_ERROR,
                            sessionLocked ? "vendor_state_changed" : "");
                    status(sessionLocked ? "locked;reason=vendor_state_changed;until_next_oem_session"
                            : "armed;reason=vendor_state_changed", 0L);
                    return;
                }
                if (!thermalNormal(current)) {
                    failSession("thermal_unsafe");
                    return;
                }

                if (!profile.allowsLevelWrites()) {
                    requestOemFullSpeed(unlock, fixed, mode, manual);
                    return;
                }

                ReadResult rpm = readInt(FAN_RPM);
                if (!rpm.valid || !FanControlPolicy.isReasonableRpm(rpm.value)) {
                    failSession("rpm_invalid");
                    return;
                }
                actualRpm = rpm.value;
                validRpmSamples++;
                if (validRpmSamples < 2) {
                    status("armed;rpm_check=" + validRpmSamples + "/2;actual=" + actualRpm,
                            0L);
                    return;
                }

                if (controlKind == ControlKind.NONE && (calibrationPending || fixed
                        || FanControlPolicy.shouldForceUnlockedExtreme(unlock, false, mode, true))) {
                    ReadResult nativeLevel = readInt(FAN_LEVEL);
                    if (!nativeLevel.valid || nativeLevel.value < 0 || nativeLevel.value > 5) {
                        failSession("capture_failed");
                        return;
                    }
                    if (!nativeSettle.ready(mode, manual, nativeLevel.value,
                            android.os.SystemClock.elapsedRealtime())) {
                        status("armed;waiting_for_oem_settle;actual=" + actualRpm, 0L);
                        return;
                    }
                }

                if (calibrationPending || controlKind == ControlKind.CALIBRATION) {
                    if (controlKind != ControlKind.CALIBRATION) {
                        if (controlKind == ControlKind.NONE && !captureOemState(mode, manual)) {
                            failSession("calibration_capture_failed");
                            return;
                        }
                        lastCalibrationRequest = request;
                        activeCalibrationRequest = request;
                        FeatureSettings.diagnostic(current,
                                "ls_augment_fan_calibration_consumed", request);
                        controlKind = ControlKind.CALIBRATION;
                        calibrationSamples = new int[5][5];
                        calibrationLevel = 1;
                        calibrationSample = 0;
                        calibrationResult = null;
                        levelCommand.reset();
                        ensureLevel(1);
                    } else calibrationStep();
                    return;
                }

                if (fixed) {
                    FanCalibrationData measurement = FanCalibrationData.parse(
                            FeatureSettings.text(current, ConfigSchema.FAN_MEASUREMENT, ""));
                    if (fixedLevel == 0 && (measurement == null
                            || !measurement.currentFor(FanHardwareIdentity.current()))) {
                        safeRelease("measurement_required", true);
                        status("armed;reason=measurement_required;actual=" + actualRpm, 3_000L);
                        return;
                    }
                    boolean allowLevelFive = unlock && mode == 0;
                    if (controlKind != ControlKind.FIXED_LEVEL) {
                        // Internal priorities share one OEM session. Releasing
                        // and recapturing here can capture our own level while
                        // the asynchronous OEM restoration is still in flight.
                        if (controlKind == ControlKind.NONE && !captureOemState(mode, manual)) {
                            failSession("capture_failed");
                            return;
                        }
                        controlKind = ControlKind.FIXED_LEVEL;
                    }
                    int requestedRpm = FeatureSettings.integer(current,
                            FeatureSettings.FAN_TARGET_RPM, 12_000,
                            500, 100_000);
                    // A numbered selection addresses the verified driver directly. In
                    // particular, identical calibration RPMs must not merge two levels.
                    int level = fixedLevel > 0 ? fixedLevel
                            : FanControlPolicy.targetLevel(requestedRpm, allowLevelFive, measurement);
                    boolean applied = ensureLevel(level);
                    int effective = fixedLevel > 0 ? 0 : FanControlPolicy.effectiveTargetRpm(
                            requestedRpm, allowLevelFive, measurement);
                    status((applied ? "controlled" : "applying")
                            + ";kind=" + (fixedLevel > 0 ? "fixed_level" : "fixed") + ";target=" + effective
                            + ";actual=" + actualRpm + ";level=" + level
                            + ";measured=" + (measurement == null ? 0 : measurement.rpm(level))
                            + ";restore_level=" + capturedLevel
                            + ";oem_extreme=" + (mode == 0), 3_000L);
                } else if (FanControlPolicy.shouldForceUnlockedExtreme(
                        unlock, false, mode, true)) {
                    if (controlKind != ControlKind.OEM_EXTREME) {
                        if (controlKind == ControlKind.NONE && !captureOemState(mode, manual)) {
                            failSession("capture_failed");
                            return;
                        }
                        controlKind = ControlKind.OEM_EXTREME;
                    }
                    boolean applied = ensureLevel(FanControlPolicy.UNLOCKED_MAX_LEVEL);
                    status((applied ? "controlled" : "applying")
                                    + ";kind=oem_extreme;level=5;actual=" + actualRpm
                                    + ";restore_level=" + capturedLevel,
                            3_000L);
                } else {
                    safeRelease("waiting_for_oem_extreme", true);
                    status("armed;waiting_for_oem_extreme", 3_000L);
                }
                FeatureSettings.diagnostic(current,
                        FeatureSettings.FAN_CONTROL_LAST_ERROR, "");
            } catch (Throwable error) {
                failSession("control_exception");
                report("loop", error);
            } finally {
                synchronized (lock) {
                    if (handler == executingHandler) {
                        if (keepRunning || wakeGeneration != wakeAtStart) {
                            // A snapshot/OEM callback arriving during this run
                            // must not leave a second independent polling loop,
                            // or be discarded as the idle worker shuts down.
                            executingHandler.removeCallbacks(this);
                            executingHandler.postDelayed(this, POLL_MS);
                        } else {
                            handler = null;
                            HandlerThread currentThread = thread;
                            thread = null;
                            if (currentThread != null) currentThread.quitSafely();
                        }
                    }
                }
            }
        }

        private void calibrationStep() throws Exception {
            if (calibrationResult != null) {
                finishCalibrationRestore();
                return;
            }
            if (calibrationLevel == 5 && !powerLease.held()) {
                activateMaxPower();
                levelCommand.reset();
            }
            if (!ensureLevel(calibrationLevel)) return;
            // Time spent waiting for the native write is not settled motor
            // time. Start the sampling dwell only after the level is observed.
            if (levelCommand.confirmedDuration(android.os.SystemClock.elapsedRealtime()) < 3_000L) return;
            calibrationSamples[calibrationLevel - 1][calibrationSample++] = actualRpm;
            status("measuring;level=" + calibrationLevel + ";sample=" + calibrationSample
                    + "/5;actual=" + actualRpm, 0L);
            if (calibrationSample < 5) return;
            if (calibrationLevel < 5) {
                calibrationLevel++;
                calibrationSample = 0;
                ensureLevel(calibrationLevel);
                return;
            }
            FanCalibrationData data = FanCalibrationData.fromSamples(FanHardwareIdentity.current(),
                    System.currentTimeMillis(), calibrationSamples);
            if (data == null) {
                failSession("measurement_unstable");
                return;
            }
            calibrationResult = data;
            calibrationRestoreStarted = android.os.SystemClock.elapsedRealtime();
            restoreOemPower();
            write(FAN_LEVEL, String.valueOf(capturedLevel));
            status("restoring;level=" + capturedLevel + ";actual=" + actualRpm, 0L);
        }

        private void requestOemFullSpeed(boolean unlock, boolean fixed, int mode, int manual)
                throws Exception {
            if (!FanControlPolicy.shouldForceUnlockedExtreme(unlock, false, mode, true)) {
                safeRelease("waiting_for_oem_extreme", true);
                status("armed;waiting_for_oem_extreme", 3_000L);
                return;
            }
            if (controlKind == ControlKind.NONE) {
                // No level capture or write: the old ROM only proves its own full-speed API.
                capturedMode = mode;
                capturedManual = manual;
                controlKind = ControlKind.OEM_FULL_SPEED;
            }
            activateMaxPower();
            ReadResult rpm = profile.rpmNode.isEmpty() ? ReadResult.invalid() : readInt(profile.rpmNode);
            String actual = rpm.valid && FanControlPolicy.isReasonableRpm(rpm.value)
                    ? String.valueOf(rpm.value) : "unavailable";
            // The vendor wrapper returns void and may swallow errors. Report the request,
            // never claim a measured speed increase or an unlocked hardware maximum.
            status("oem_full_speed_requested;power_type=113;actual=" + actual
                    + ";fixed=" + (fixed ? "unverified" : "off"), 3_000L);
            FeatureSettings.diagnostic(context, FeatureSettings.FAN_CONTROL_LAST_ERROR,
                    fixed ? "fixed_speed_unverified" : "");
        }

        private void finishCalibrationRestore() {
            ReadResult restored = readInt(FAN_LEVEL);
            if (!restored.valid || restored.value != capturedLevel) {
                if (android.os.SystemClock.elapsedRealtime() - calibrationRestoreStarted
                        >= FanLevelCommand.ACK_TIMEOUT_MS) failSession("calibration_restore_failed");
                return;
            }
            FanCalibrationData data = calibrationResult;
            String completedRequest = activeCalibrationRequest;
            // The original level is now observed. Do not send another native
            // restore that could race the next fixed/extreme control session.
            safeRelease("calibration_complete", false);
            android.os.Bundle extras = new android.os.Bundle();
            extras.putString("request", completedRequest);
            extras.putString("value", data.serialize());
            android.os.Bundle reply;
            try {
                reply = context.getContentResolver().call(
                        android.net.Uri.parse("content://ls.augment.com.config"),
                        "fan_measurement", null, extras);
            } catch (RuntimeException error) {
                reportCalibrationOutcome(completedRequest, "measurement_save_failed");
                throw error;
            }
            if (reply == null || !reply.getBoolean("ok")) {
                reportCalibrationOutcome(completedRequest, "measurement_save_failed");
                failSession("measurement_save_failed");
                return;
            }
            status("measured;highest_level=5;median=" + data.rpm(5)
                    + ";peak=" + data.peak(5) + ";restored=1", 0L);
            FeatureSettings.diagnostic(context, FeatureSettings.FAN_CONTROL_LAST_ERROR, "");
        }

        private boolean captureOemState(int mode, int manual) {
            ReadResult oldLevel = readInt(FAN_LEVEL);
            // The NX809J PWM node accepts writes but does not control this
            // firmware. The readable, verified level node is both the control
            // interface and the stable OEM restore point.
            if (!oldLevel.valid || oldLevel.value < 0 || oldLevel.value > 5) return false;
            capturedLevel = oldLevel.value;
            capturedMode = mode;
            capturedManual = manual;
            return true;
        }

        private void failSession(String reason) {
            failSession(reason, true);
        }

        private void failSession(String reason, boolean restoreIfRunning) {
            safeRelease(reason, restoreIfRunning);
            sessionLocked = true;
            validRpmSamples = 0;
            Context current = context;
            if (current != null) {
                FeatureSettings.diagnostic(current,
                        FeatureSettings.FAN_CONTROL_LAST_ERROR, reason);
            }
            status("locked;reason=" + reason + ";until_next_oem_session", 0L);
        }

        private void safeRelease(String reason, boolean restoreIfRunning) {
            boolean wasControlling = controlKind != ControlKind.NONE;
            boolean wasMeasuring = controlKind == ControlKind.CALIBRATION;
            String interruptedRequest = activeCalibrationRequest;
            try {
                restoreOemPower();
            } catch (Throwable error) {
                report("restore_power_" + reason, error);
            }
            try {
                if (wasControlling && restoreIfRunning
                        && capturedLevel >= 0 && restoreStateStillOwned()) {
                    write(FAN_LEVEL, String.valueOf(capturedLevel));
                }
            } catch (Throwable error) {
                report("restore_" + reason, error);
            } finally {
                controlKind = ControlKind.NONE;
                activeCalibrationRequest = "";
                calibrationSamples = null;
                calibrationResult = null;
                levelCommand.reset();
                resetCapture();
                if (wasMeasuring && !"calibration_complete".equals(reason)) {
                    reportCalibrationOutcome(interruptedRequest, reason);
                }
                Context current = context;
                if (wasControlling && current != null) {
                    FeatureSettings.diagnostic(current, FeatureSettings.FAN_CONTROL_ACTIVE,
                            "idle;reason=" + reason + ";ts=" + System.currentTimeMillis());
                    // Let the caller immediately publish the next truthful
                    // state instead of leaving a transient idle reason visible.
                    lastDiagnosticAt = 0L;
                }
            }
        }

        private void reportCalibrationOutcome(String request, String reason) {
            String value = FanCalibrationOutcome.encode(request, reason);
            if (!value.isEmpty()) FeatureSettings.diagnostic(context,
                    FanCalibrationOutcome.DIAGNOSTIC, value);
        }

        private boolean ensureLevel(int desiredLevel) throws Exception {
            if (!profile.allowsLevelWrites()) throw new IllegalStateException("level_control_unverified");
            if (desiredLevel < FanControlPolicy.MIN_LEVEL
                    || desiredLevel > FanControlPolicy.UNLOCKED_MAX_LEVEL) {
                throw new IllegalArgumentException("invalid_fan_level");
            }
            if (desiredLevel == 5 && controlKind != ControlKind.CALIBRATION) activateMaxPower();
            else if (desiredLevel < 5 && powerLease.held()) {
                restoreOemPower();
                levelCommand.reset();
                // Let the native power request settle before a lower level is
                // written through the separate GameAssist command queue.
                return false;
            }
            ReadResult observed = readInt(FAN_LEVEL);
            if (!observed.valid || observed.value < 0
                    || observed.value > FanControlPolicy.UNLOCKED_MAX_LEVEL) {
                throw new IllegalStateException("fan_level_read_failed");
            }
            switch (levelCommand.observe(desiredLevel, observed.value,
                    android.os.SystemClock.elapsedRealtime())) {
                case READY: return true;
                case WAIT: return false;
                case FAIL: throw new IllegalStateException("fan_level_not_applied");
                case WRITE:
                    write(FAN_LEVEL, String.valueOf(desiredLevel));
                    return false;
            }
            throw new IllegalStateException("invalid_fan_command_state");
        }

        private void activateMaxPower() throws Exception {
            powerLease.acquire(owner, profile.powerMethod);
        }

        private void restoreOemPower() throws Exception {
            if (!powerLease.held()) return;
            ReadResult enabled = readInt(profile.enableNode);
            powerLease.restore(enabled.valid && enabled.value == 1 && !shuttingDown && !oemOffRequested);
        }

        private boolean oemStateStillCaptured() {
            Context current = context;
            if (current == null || capturedMode == Integer.MIN_VALUE
                    || capturedManual == Integer.MIN_VALUE) return false;
            try {
                return Settings.System.getInt(current.getContentResolver(), OEM_MODE)
                        == capturedMode
                        && Settings.System.getInt(current.getContentResolver(), OEM_MANUAL)
                        == capturedManual;
            } catch (Throwable ignored) {
                return false;
            }
        }

        private boolean restoreStateStillOwned() {
            ReadResult enabled = readInt(profile.enableNode);
            if (!enabled.valid) return false;
            if (enabled.value == 1) return oemStateStillCaptured();
            if (enabled.value != 0 || context == null
                    || capturedMode == Integer.MIN_VALUE) return false;
            try {
                // Turning the OEM master switch off legitimately changes the
                // manual-state setting. Mode is the ownership guard here.
                return Settings.System.getInt(
                        context.getContentResolver(), OEM_MODE) == capturedMode;
            } catch (Throwable ignored) {
                return false;
            }
        }

        private void resetCapture() {
            capturedLevel = -1;
            capturedMode = Integer.MIN_VALUE;
            capturedManual = Integer.MIN_VALUE;
        }

        private boolean thermalNormal(Context current) {
            try {
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) return false;
                PowerManager power = (PowerManager) current.getSystemService(Context.POWER_SERVICE);
                if (power == null
                        || power.getCurrentThermalStatus() >= PowerManager.THERMAL_STATUS_SEVERE) {
                    return false;
                }
                Intent battery = current.registerReceiver(null,
                        new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
                if (battery == null) return false;
                int temperature = battery.getIntExtra(
                        BatteryManager.EXTRA_TEMPERATURE, Integer.MIN_VALUE);
                return temperature != Integer.MIN_VALUE
                        && temperature >= 0 && temperature < MAX_BATTERY_TENTHS_C;
            } catch (Throwable ignored) {
                return false;
            }
        }

        private void write(String path, String value) throws Exception {
            if (!profile.allowsLevelWrites() || !FAN_LEVEL.equals(path))
                throw new IllegalStateException("level_control_unverified");
            writeNode.invoke(null, path, value);
        }

        private ReadResult readInt(String path) {
            try {
                Object raw = readNode.invoke(null, path);
                if (raw == null) return ReadResult.invalid();
                return ReadResult.valid(Integer.parseInt(raw.toString().trim()));
            } catch (Throwable ignored) {
                return ReadResult.invalid();
            }
        }

        private void status(String value, long throttleMs) {
            long now = System.currentTimeMillis();
            if (throttleMs > 0L && now - lastDiagnosticAt < throttleMs) return;
            lastDiagnosticAt = now;
            FeatureSettings.diagnostic(context, FeatureSettings.FAN_CONTROL_ACTIVE,
                    value + ";capability=" + profile.capability()
                            + ";selection=" + lastTileRequest
                            + (controlKind == ControlKind.CALIBRATION
                            ? ";request=" + activeCalibrationRequest : "") + ";ts=" + now);
        }

        private void report(String stage, Throwable error) {
            Context current = context != null ? context : FeatureSettings.from(null);
            FeatureSettings.diagnostic(current, FeatureSettings.FAN_CONTROL_LAST_ERROR,
                    stage + ':' + safeMessage(error));
            module.logFeatureError("FAN_CONTROL_" + stage, error);
        }
    }

    private static final class ReadResult {
        final boolean valid;
        final int value;
        private ReadResult(boolean valid, int value) { this.valid = valid; this.value = value; }
        static ReadResult valid(int value) { return new ReadResult(true, value); }
        static ReadResult invalid() { return new ReadResult(false, 0); }
    }

    private static boolean hasVoidMethod(Class<?> type, String name) {
        try {
            Method method = type.getDeclaredMethod(name);
            return method.getReturnType() == void.class
                    && !java.lang.reflect.Modifier.isStatic(method.getModifiers());
        } catch (ReflectiveOperationException missing) { return false; }
    }

    private static String safeMessage(Throwable error) {
        Throwable cause = error;
        while (cause != null && cause.getCause() != null && cause.getCause() != cause) {
            cause = cause.getCause();
        }
        String message = cause == null ? "unknown" : cause.getMessage();
        if (message == null || message.isEmpty()) {
            message = cause == null ? "unknown" : cause.getClass().getSimpleName();
        }
        return message.replace('\n', ' ').replace('\r', ' ');
    }
}
