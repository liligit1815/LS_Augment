package ls.augment.com.hook;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.PowerManager;
import android.provider.Settings;

import java.io.File;
import java.lang.reflect.Method;

import ls.augment.com.ConfigSchema;
import ls.augment.com.FanCalibrationData;
import ls.augment.com.FanHardwareIdentity;

import io.github.libxposed.api.XposedInterface.HookHandle;

/** OEM-session-bound fan adjustment for the verified NX809J driver. */
final class FanControlHook {
    private static final String CONTROLLER_CLASS = "cn.nubia.fan.policy.FanControllerImpl";
    private static final String UTILS_CLASS = "cn.nubia.fan.util.Utils";
    /** Read-only: the module never writes fan_enable. */
    private static final String FAN_ENABLE = "sys/kernel/fan/fan_enable";
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
            Controller installedController = new Controller(module, writeNode, readNode);
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
                        Object result = chain.proceed();
                        Controller active = controller;
                        if (active != null) active.start(
                                FeatureSettings.from(chain.getThisObject()),
                                chain.getThisObject());
                        return result;
                    });
            module.registerFeatureHook(enableHandle);
            installed++;

            Context context = FeatureSettings.from(null);
            FeatureSettings.diagnostic(context, FeatureSettings.FAN_CONTROL_INSTALLED,
                    "hooks=" + installed + ";device=" + Build.DEVICE
                            + ";oem_session_only=1;fan_enable_writes=0;speed_interface=level");
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

    private enum ControlKind { NONE, FIXED_LEVEL, OEM_EXTREME, CALIBRATION }

    private static final class Controller implements Runnable {
        private final AugmentModule module;
        private final Method writeNode;
        private final Method readNode;
        private final Object lock = new Object();
        private HandlerThread thread;
        private Handler handler;
        private Context context;
        private Object owner;
        private boolean maxPowerOwned;
        private boolean listenerInstalled;
        private boolean diagnosticsInitialized;
        private boolean lastOemEnabled;
        private boolean sessionLocked;
        private int validRpmSamples;
        private int actualRpm;
        private int commandedLevel = -1;
        private int capturedLevel = -1;
        private int capturedMode = Integer.MIN_VALUE;
        private int capturedManual = Integer.MIN_VALUE;
        private ControlKind controlKind = ControlKind.NONE;
        private long lastDiagnosticAt;
        private String lastCalibrationRequest = "";
        private String activeCalibrationRequest = "";
        private int[][] calibrationSamples;
        private int calibrationLevel;
        private int calibrationSample;
        private long calibrationLevelSince;

        Controller(AugmentModule module, Method writeNode, Method readNode) {
            this.module = module;
            this.writeNode = writeNode;
            this.readNode = readNode;
        }

        void start(Context newContext, Object newOwner) {
            if (newContext == null || newOwner == null) return;
            synchronized (lock) {
                Context application = newContext.getApplicationContext();
                if (owner != null && owner != newOwner && controlKind != ControlKind.NONE) {
                    safeRelease("vendor_owner_changed", false);
                    sessionLocked = true;
                }
                context = application;
                owner = newOwner;
                FeatureSettings.diagnostic(application,
                        FeatureSettings.FAN_CONTROL_INSTALLED,
                        "hooks=3;device=" + Build.DEVICE
                                + ";oem_session_only=1;fan_enable_writes=0;speed_interface=level");
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

        private void ensureThreadLocked() {
            if (handler != null) return;
            thread = new HandlerThread("LSAugmentFanControl");
            thread.start();
            handler = new Handler(thread.getLooper());
        }

        private void requestImmediateLocked() {
            if (handler == null) return;
            handler.removeCallbacks(this);
            handler.post(this);
        }

        @Override public void run() {
            boolean keepRunning = true;
            try {
                Context current = context;
                if (current == null || !supportedDevice()) {
                    safeRelease("unsupported_device", false);
                    status("idle;reason=unsupported;device=" + Build.DEVICE, 10_000L);
                    keepRunning = false;
                    return;
                }

                boolean master = FeatureSettings.enabled(
                        current, FeatureSettings.GAME_MASTER, false);
                boolean fixed = master && FeatureSettings.enabled(
                        current, FeatureSettings.FAN_FIXED_ENABLED, false);
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
                if (!fixed && !unlock && !calibrationPending
                        && controlKind != ControlKind.CALIBRATION) {
                    safeRelease("feature_off", true);
                    status("idle;reason=feature_off", 0L);
                    keepRunning = false;
                    return;
                }

                ReadResult enable = readInt(FAN_ENABLE);
                if (!enable.valid || (enable.value != 0 && enable.value != 1)) {
                    failSession("fan_enable_read", false);
                    return;
                }
                boolean oemEnabled = enable.value != 0;
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
                    status("armed;waiting_for_oem_fan", 3_000L);
                    FeatureSettings.diagnostic(current,
                            FeatureSettings.FAN_CONTROL_LAST_ERROR, "");
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
                    sessionLocked = true;
                    validRpmSamples = 0;
                    FeatureSettings.diagnostic(current,
                            FeatureSettings.FAN_CONTROL_LAST_ERROR, "vendor_state_changed");
                    status("locked;reason=vendor_state_changed;until_next_oem_session", 0L);
                    return;
                }
                if (!thermalNormal(current)) {
                    failSession("thermal_unsafe");
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

                if (calibrationPending || controlKind == ControlKind.CALIBRATION) {
                    if (controlKind != ControlKind.CALIBRATION) {
                        safeRelease("calibration_start", true);
                        if (!captureOemState(mode, manual)) {
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
                        calibrationLevelSince = android.os.SystemClock.elapsedRealtime();
                        ensureLevel(1);
                    } else calibrationStep();
                    return;
                }

                if (fixed) {
                    FanCalibrationData measurement = FanCalibrationData.parse(
                            FeatureSettings.text(current, ConfigSchema.FAN_MEASUREMENT, ""));
                    if (measurement == null || !measurement.currentFor(FanHardwareIdentity.current())) {
                        safeRelease("measurement_required", true);
                        status("armed;reason=measurement_required;actual=" + actualRpm, 3_000L);
                        return;
                    }
                    boolean allowLevelFive = unlock && mode == 0;
                    if (controlKind != ControlKind.FIXED_LEVEL) {
                        safeRelease("control_mode_change", true);
                        if (!captureOemState(mode, manual)) {
                            failSession("capture_failed");
                            return;
                        }
                        controlKind = ControlKind.FIXED_LEVEL;
                    }
                    int requested = FeatureSettings.integer(current,
                            FeatureSettings.FAN_TARGET_RPM, 12_000,
                            500, 100_000);
                    int level = FanControlPolicy.targetLevel(requested, allowLevelFive, measurement);
                    boolean applied = ensureLevel(level);
                    int effective = FanControlPolicy.effectiveTargetRpm(
                            requested, allowLevelFive, measurement);
                    status((applied ? "controlled" : "applying")
                            + ";kind=fixed;target=" + effective
                            + ";actual=" + actualRpm + ";level=" + level
                            + ";measured=" + measurement.rpm(level)
                            + ";oem_extreme=" + (mode == 0), 3_000L);
                } else if (FanControlPolicy.shouldForceUnlockedExtreme(
                        unlock, false, mode, true)) {
                    if (controlKind != ControlKind.OEM_EXTREME) {
                        safeRelease("control_mode_change", true);
                        if (!captureOemState(mode, manual)) {
                            failSession("capture_failed");
                            return;
                        }
                        controlKind = ControlKind.OEM_EXTREME;
                    }
                    boolean applied = ensureLevel(FanControlPolicy.UNLOCKED_MAX_LEVEL);
                    status((applied ? "controlled" : "applying")
                                    + ";kind=oem_extreme;level=5;actual=" + actualRpm,
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
                    Handler currentHandler = handler;
                    if (keepRunning && currentHandler != null) {
                        currentHandler.postDelayed(this, POLL_MS);
                    } else {
                        handler = null;
                        HandlerThread currentThread = thread;
                        thread = null;
                        if (currentThread != null) currentThread.quitSafely();
                    }
                }
            }
        }

        private void calibrationStep() throws Exception {
            if (calibrationLevel == 5 && !maxPowerOwned) {
                activateMaxPower();
                calibrationLevelSince = android.os.SystemClock.elapsedRealtime();
            }
            if (!ensureLevel(calibrationLevel)) {
                calibrationLevelSince = android.os.SystemClock.elapsedRealtime();
                return;
            }
            if (android.os.SystemClock.elapsedRealtime() - calibrationLevelSince < 3_000L) return;
            calibrationSamples[calibrationLevel - 1][calibrationSample++] = actualRpm;
            status("measuring;level=" + calibrationLevel + ";sample=" + calibrationSample
                    + "/5;actual=" + actualRpm, 0L);
            if (calibrationSample < 5) return;
            if (calibrationLevel < 5) {
                calibrationLevel++;
                calibrationSample = 0;
                calibrationLevelSince = android.os.SystemClock.elapsedRealtime();
                ensureLevel(calibrationLevel);
                return;
            }
            FanCalibrationData data = FanCalibrationData.fromSamples(FanHardwareIdentity.current(),
                    System.currentTimeMillis(), calibrationSamples);
            String completedRequest = activeCalibrationRequest;
            safeRelease("calibration_complete", true);
            if (data == null) {
                failSession("measurement_unstable");
                return;
            }
            android.os.Bundle extras = new android.os.Bundle();
            extras.putString("request", completedRequest);
            extras.putString("value", data.serialize());
            android.os.Bundle reply = context.getContentResolver().call(
                    android.net.Uri.parse("content://ls.augment.com.config"),
                    "fan_measurement", null, extras);
            if (reply == null || !reply.getBoolean("ok")) {
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
                commandedLevel = -1;
                resetCapture();
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

        private boolean ensureLevel(int desiredLevel) throws Exception {
            if (desiredLevel < FanControlPolicy.MIN_LEVEL
                    || desiredLevel > FanControlPolicy.UNLOCKED_MAX_LEVEL) {
                throw new IllegalArgumentException("invalid_fan_level");
            }
            if (desiredLevel == 5 && controlKind != ControlKind.CALIBRATION) activateMaxPower();
            else if (desiredLevel < 5 && maxPowerOwned) restoreOemPower();
            ReadResult observed = readInt(FAN_LEVEL);
            if (!observed.valid || observed.value < 0
                    || observed.value > FanControlPolicy.UNLOCKED_MAX_LEVEL) {
                throw new IllegalStateException("fan_level_read_failed");
            }
            if (observed.value == desiredLevel) {
                commandedLevel = desiredLevel;
                return true;
            }
            if (commandedLevel == desiredLevel) {
                // The previous write had a full polling period to settle.
                // A mismatch now is a control failure, so hand ownership back
                // within this same cycle instead of continuing to overwrite OEM.
                throw new IllegalStateException("fan_level_not_applied");
            } else {
                commandedLevel = desiredLevel;
            }
            write(FAN_LEVEL, String.valueOf(desiredLevel));
            return false;
        }

        private void activateMaxPower() throws Exception {
            if (maxPowerOwned) return;
            if (owner == null) throw new IllegalStateException("missing_oem_power_owner");
            Method method = owner.getClass().getDeclaredMethod("fanMaxSpeed");
            method.setAccessible(true);
            // Set ownership before invoking: a throwing OEM call may still have acquired its token.
            maxPowerOwned = true;
            method.invoke(owner);
        }

        private void restoreOemPower() throws Exception {
            if (!maxPowerOwned || owner == null) return;
            ReadResult enabled = readInt(FAN_ENABLE);
            Method method = owner.getClass().getDeclaredMethod(enabled.valid && enabled.value == 1
                    ? "notifyCubeFan" : "cancelFanFullSpeed");
            method.setAccessible(true);
            method.invoke(owner);
            maxPowerOwned = false;
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
            ReadResult enabled = readInt(FAN_ENABLE);
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
                    value + ";ts=" + now);
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

    private static boolean supportedDevice() {
        boolean nx809j = "NX809J".equalsIgnoreCase(Build.DEVICE)
                || "NX809J".equalsIgnoreCase(Build.PRODUCT)
                || "NX809J".equalsIgnoreCase(Build.MODEL);
        return nx809j
                && new File("/sys/kernel/fan/fan_enable").exists()
                && new File("/sys/kernel/fan/fan_speed_level").exists()
                && new File("/sys/kernel/fan/fan_speed_count").exists();
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
