package ls.augment.com;

import android.content.Context;
import android.os.SystemClock;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.json.JSONArray;
import org.json.JSONObject;

/** Calls the shipped capture implementation with real input discovery and no input injection. */
final class RapidFirePhysicalCaptureDeviceCases {
    private static final String DIAGNOSTIC = "ls_augment_tgk_rapid_fire_physical_capture";
    private static final String DRIVER_SHA256 =
            "3211fdc4b97aabe3c0db8f06f3ec07da8c3c382a6273412adb089940e9d4b532";
    private static final long CANCEL_DELAY_MS = 250L;
    private static final long WINDOW_TOLERANCE_MS = 300L;
    // Fixed read-only commands; no caller-controlled paths or hardware writes.
    private static final String STATE_COMMAND =
            "sed -n 's/^mode : \\([12]\\), .*/LSA_PROBE_MODE0=\\1/p' /sys/class/leds/sar0/mode_operation\n"
            + "sed -n 's/^mode : \\([12]\\), .*/LSA_PROBE_MODE1=\\1/p' /sys/class/leds/sar1/mode_operation\n"
            + "if [ -e /dev/.lsaugment_rapid_input_capture ]; then echo LSA_PROBE_LOCK=present; else echo LSA_PROBE_LOCK=absent; fi";

    private RapidFirePhysicalCaptureDeviceCases() { }

    static JSONObject run(Context context) throws Exception {
        JSONObject report = new JSONObject().put("success", false)
                .put("entry", "RapidFirePhysicalCapture.run")
                .put("syntheticInputEvents", 0).put("mappingWrites", 0)
                .put("configurationWrites", 0).put("compatibilityApproved", false)
                .put("naturalWindowMs", RapidFirePhysicalCapture.CAPTURE_MS)
                .put("windowToleranceMs", WINDOW_TOLERANCE_MS);
        Map<String, ?> configBefore = config(context);
        JSONArray cases = new JSONArray();
        report.put("cases", cases);
        boolean casesPassed = false;
        try {
            RootShell.Result proc = RootShell.run("cat /proc/bus/input/devices", null, 3, 64 * 1024);
            require(proc.isSuccess(), "Cannot read actual input-device inventory");
            List<RapidFireInputDetector.Device> devices = RapidFireInputDetector.discover(proc.output);
            JSONArray inventory = new JSONArray();
            RapidFireInputDetector.Device left = null, right = null;
            for (RapidFireInputDetector.Device device : devices) {
                inventory.put(new JSONObject().put("path", device.path).put("name", device.name));
                if ("nubia_tgk_aw_sar0_ch0".equals(device.name)) left = device;
                if ("nubia_tgk_aw_sar1_ch0".equals(device.name)) right = device;
            }
            report.put("discoveredShoulderDevices", inventory);
            require(left != null && right != null, "Both actual sar shoulder inputs are required");
            RootShell.Result driver = RootShell.run(
                    "sha256sum /vendor_dlkm/lib/modules/aw9620x.ko", null, 3, 256);
            String hash = driver.output.trim().split("\\s+", 2)[0];
            report.put("driverSha256", hash);
            require(driver.isSuccess() && DRIVER_SHA256.equals(hash), "Driver does not match the verified wake profile");

            JSONObject cancelled = captureCase(context, devices, left, true);
            cases.put(cancelled);
            // Never start another hardware lease if the first one did not verifiably restore.
            if (cancelled.optBoolean("stateRestored") && cancelled.optBoolean("leaseAndLockClean")) {
                JSONObject natural = captureCase(context, devices, right, false);
                cases.put(natural);
                casesPassed = cancelled.getBoolean("passed") && natural.getBoolean("passed");
            } else {
                cases.put(new JSONObject().put("name", "natural_window")
                        .put("passed", false).put("executed", false)
                        .put("reason", "Previous capture restoration or lease cleanup was not verified"));
            }
        } catch (Throwable failure) {
            report.put("error", failure.getClass().getSimpleName() + ": " + failure.getMessage());
        } finally {
            Map<String, ?> configAfter = config(context);
            boolean unchanged = configBefore.equals(configAfter);
            report.put("configurationUnchanged", unchanged)
                    .put("compatibilityTokenUnchanged", same(configBefore, configAfter, ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN))
                    .put("testSessionUnchanged", same(configBefore, configAfter, ConfigSchema.TGK_RAPID_FIRE_TEST_SESSION))
                    .put("success", casesPassed && unchanged);
        }
        return report;
    }

    private static JSONObject captureCase(Context context, List<RapidFireInputDetector.Device> devices,
            RapidFireInputDetector.Device target, boolean cancelAfterReady) throws Exception {
        JSONObject report = new JSONObject().put("name", cancelAfterReady ? "cancel_after_ready" : "natural_window")
                .put("target", target.path).put("executed", false).put("passed", false);
        State before = state(context);
        report.put("before", before.json());
        if (!before.valid || before.lockPresent || before.leases.length != 0) {
            return report.put("reason", "Readable sar modes and a clean capture lock/lease baseline are required")
                    .put("stateRestored", false).put("leaseAndLockClean", false);
        }
        Map<String, ?> configBefore = config(context);
        String diagnosticBefore = diagnostic(context);
        RapidFirePhysicalCapture capture = new RapidFirePhysicalCapture();
        AtomicInteger readyCount = new AtomicInteger(), pairCount = new AtomicInteger();
        AtomicLong readyAt = new AtomicLong(-1), pairAt = new AtomicLong(-1), cancelAt = new AtomicLong(-1);
        ScheduledExecutorService scheduler = cancelAfterReady ? Executors.newSingleThreadScheduledExecutor() : null;
        long startedAt = SystemClock.elapsedRealtime(), wallStartedAt = System.currentTimeMillis();
        RapidFirePhysicalCapture.Result result = null;
        String exception = null;
        report.put("executed", true);
        try {
            result = capture.run(context, devices, "nubia_tgk_aw_sar0_ch0".equals(target.name), () -> {
                readyCount.incrementAndGet();
                readyAt.compareAndSet(-1, SystemClock.elapsedRealtime());
                if (scheduler != null) scheduler.schedule(() -> {
                    cancelAt.set(SystemClock.elapsedRealtime());
                    capture.cancel();
                }, CANCEL_DELAY_MS, TimeUnit.MILLISECONDS);
            }, () -> {
                pairCount.incrementAndGet();pairAt.compareAndSet(-1, SystemClock.elapsedRealtime());
            });
        } catch (Throwable failure) {
            capture.cancel();
            exception = failure.getClass().getSimpleName() + ": " + failure.getMessage();
        } finally {
            if (scheduler != null) scheduler.shutdownNow();
        }
        long finishedAt = SystemClock.elapsedRealtime();
        String diagnostic = diagnostic(context);
        State after = state(context);
        boolean unchanged = configBefore.equals(config(context));
        String source = marker(diagnostic, "LSA_CAPTURE_SOURCE="), ready = marker(diagnostic, "LSA_CAPTURE_READY=");
        String end = marker(diagnostic, "LSA_CAPTURE_END="), restored = marker(diagnostic, "LSA_CAPTURE_RESTORED=");
        String shellExit = headerField(diagnostic, "exit="), shellTimeout = headerField(diagnostic, "timeout=");
        String shellCancelled = headerField(diagnostic, "cancelled=");
        boolean transportValid = "false".equals(shellTimeout) && (cancelAfterReady
                ? "0".equals(shellExit) || "130".equals(shellExit) : "0".equals(shellExit));
        boolean fresh = !diagnostic.equals(diagnosticBefore) && diagnosticTime(diagnostic) >= wallStartedAt;
        boolean restoredState = after.valid && before.mode0.equals(after.mode0) && before.mode1.equals(after.mode1);
        boolean clean = after.valid && !after.lockPresent && after.leases.length == 0;
        boolean markers = target.path.equals(source) && before.modes().equals(ready) && ready.equals(restored)
                && !end.isEmpty() && diagnostic.indexOf("LSA_CAPTURE_SOURCE=") < diagnostic.indexOf("LSA_CAPTURE_READY=")
                && diagnostic.indexOf("LSA_CAPTURE_READY=") < diagnostic.indexOf("LSA_CAPTURE_END=")
                && diagnostic.indexOf("LSA_CAPTURE_END=") < diagnostic.indexOf("LSA_CAPTURE_RESTORED=")
                && !diagnostic.contains("LSA_CAPTURE_ERROR=");
        long readyToReturn = readyAt.get() < 0 ? -1 : finishedAt - readyAt.get();
        boolean physicalPair = result != null && result.capture != null;
        boolean fullWindow = "window_elapsed".equals(end)
                && readyToReturn >= RapidFirePhysicalCapture.CAPTURE_MS - WINDOW_TOLERANCE_MS;
        boolean earlyPhysicalPair = "pair_received".equals(end) && physicalPair && pairCount.get() == 1
                && RapidFireCaptureProtocol.isComplete(diagnostic, target);
        boolean outcome = cancelAfterReady
                ? cancelAt.get() >= readyAt.get() + CANCEL_DELAY_MS && readyAt.get() >= 0
                    && ("cancelled".equals(end) || "interrupted".equals(end)) && result != null && result.capture == null
                    && "true".equals(shellCancelled) && !RapidFireCaptureProtocol.isComplete(diagnostic, target)
                : RapidFireCaptureProtocol.isComplete(diagnostic, target) && (fullWindow || earlyPhysicalPair);
        report.put("after", after.json()).put("readyCallbacks", readyCount.get()).put("pairCallbacks", pairCount.get())
                .put("elapsedMs", finishedAt - startedAt).put("readyToReturnMs", readyToReturn)
                .put("cancelAfterReadyMs", cancelAt.get() < 0 || readyAt.get() < 0 ? -1 : cancelAt.get() - readyAt.get())
                .put("pairAfterReadyMs", pairAt.get() < 0 || readyAt.get() < 0 ? -1 : pairAt.get() - readyAt.get())
                .put("source", source).put("ready", ready).put("end", end).put("restored", restored)
                .put("shellExit", shellExit).put("shellTimedOut", shellTimeout).put("transportValid", transportValid)
                .put("shellCancelled", shellCancelled)
                .put("diagnosticFresh", fresh).put("protocolMarkersValid", markers)
                .put("fullNaturalWindowObserved", !cancelAfterReady && fullWindow)
                .put("endedEarlyOnRealPhysicalPair", !cancelAfterReady && earlyPhysicalPair)
                .put("physicalPairCaptured", physicalPair).put("configurationUnchanged", unchanged)
                .put("stateRestored", restoredState).put("leaseAndLockClean", clean)
                .put("resultMessage", result == null ? "" : result.message)
                .put("captureLog", diagnostic.substring(0, Math.min(diagnostic.length(), 16384)))
                .put("captureLogTruncated", diagnostic.length() > 16384);
        if (exception != null) report.put("exception", exception);
        if (physicalPair) report.put("physicalPair", new JSONObject().put("path", result.capture.path)
                .put("name", result.capture.name).put("code", result.capture.code).put("persisted", false));
        return report.put("passed", exception == null && result != null && readyCount.get() == 1
                && fresh && markers && transportValid && outcome && restoredState && clean && unchanged);
    }

    private static final class State {
        final String mode0, mode1;final boolean valid, lockPresent;final String[] leases;
        State(String mode0, String mode1, boolean valid, boolean lockPresent, String[] leases) {
            this.mode0=mode0;this.mode1=mode1;this.valid=valid;this.lockPresent=lockPresent;this.leases=leases;
        }
        String modes() { return mode0 + ":" + mode1; }
        JSONObject json() throws Exception {
            return new JSONObject().put("valid", valid).put("sar0Mode", mode0).put("sar1Mode", mode1)
                    .put("captureLockPresent", lockPresent).put("cacheCaptureArtifacts", new JSONArray(Arrays.asList(leases)));
        }
    }

    private static State state(Context context) {
        RootShell.Result result = RootShell.run(STATE_COMMAND, null, 3, 1024);
        String mode0=marker(result.output,"LSA_PROBE_MODE0="),mode1=marker(result.output,"LSA_PROBE_MODE1=");
        String lock=marker(result.output,"LSA_PROBE_LOCK=");
        String[] leases=context.getCacheDir().list((directory,name)->name.startsWith("rapid-input-"));
        boolean listed=leases!=null;if(leases==null)leases=new String[0];Arrays.sort(leases);
        return new State(mode0,mode1,result.isSuccess()&&mode0.matches("[12]")&&mode1.matches("[12]")
                && (lock.equals("present")||lock.equals("absent"))&&listed,lock.equals("present"),leases);
    }
    private static String diagnostic(Context context) {
        return context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(DIAGNOSTIC,"");
    }
    private static Map<String, ?> config(Context context) {
        return new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
    }
    private static boolean same(Map<String, ?> before,Map<String, ?> after,String key) {
        return before.containsKey(key)==after.containsKey(key)&&java.util.Objects.equals(before.get(key),after.get(key));
    }
    private static String marker(String output,String prefix) {
        String value=null;
        for(String line:output.split("\\r?\\n"))if(line.startsWith(prefix)){
            if(value!=null)return "";value=line.substring(prefix.length()).trim();
        }
        return value==null?"":value;
    }
    private static long diagnosticTime(String output) {
        try{return Long.parseLong(headerField(output,"time="));}catch(NumberFormatException ignored){return -1;}
    }
    private static String headerField(String output,String prefix) {
        String header=output.split("\\r?\\n",2)[0];
        for(String field:header.split("\\|"))if(field.startsWith(prefix))return field.substring(prefix.length());
        return "";
    }
    private static void require(boolean condition,String message) {
        if(!condition)throw new IllegalStateException(message);
    }
}
