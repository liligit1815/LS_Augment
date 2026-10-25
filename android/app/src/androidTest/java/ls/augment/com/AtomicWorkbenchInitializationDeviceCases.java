package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Process;
import android.os.SystemClock;
import android.view.View;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test APK only: one real initialization, cached observation, explicit release; no fixture/input/Root RPC. */
final class AtomicWorkbenchInitializationDeviceCases {
    private static final long READY_MS = 15_000L;
    private final Instrumentation test;
    private final Context target;
    private final File directory;
    private final String caseId, nonce, boot;
    private Activity activity;
    private String stage = "PRECONDITION";
    private boolean ready, releaseAccepted, exitAttempted;

    private AtomicWorkbenchInitializationDeviceCases(Instrumentation test, Bundle args) throws Exception {
        this.test = test; target = test.getTargetContext();
        caseId = args.getString("init_case", ""); nonce = args.getString("capture_nonce", "");
        require(caseId.matches("[a-f0-9]{32}") && nonce.matches("[a-f0-9]{32}"), "CASE_NONCE");
        require(Process.myUid() == target.getApplicationInfo().uid && "ls.augment.com".equals(target.getPackageName()), "TARGET_UID");
        boot = text(new File("/proc/sys/kernel/random/boot_id"), 128).trim();
        require(boot.matches("[a-f0-9]{8}(-[a-f0-9]{4}){3}-[a-f0-9]{12}"), "BOOT");
        directory = new File(new File(target.getFilesDir(), "atomic-workbench-initialization"), caseId);
    }

    static JSONObject run(Instrumentation test, Bundle args) throws Exception {
        return new AtomicWorkbenchInitializationDeviceCases(test, args).execute();
    }

    private JSONObject execute() throws Exception {
        require(!directory.exists() && directory.mkdirs(), "FRESH_DIRECTORY");
        AppConfig config = new AppConfig(target);
        require(config.getBoolean(AtomicWorkbenchConfig.ENABLED) && !AtomicWorkbenchCleanup.pending(), "PRIOR_SCOPE");
        String quick = config.get(AtomicWorkbenchConfig.QUICK_OPEN_APPS);
        writeNew("setup.json", base().put("host", self()).put("quick", quick));
        JSONObject observed = base().put("initialReady", false);
        long awaitStart = -1L, awaitDeadline = -1L, awaitEnd = -1L;
        String ledger = "setup.json";
        try {
            stage = "START_ACTIVITY";
            activity = test.startActivitySync(new Intent(target, AtomicWorkbenchActivity.class)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE, "atomic_workbench").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            test.runOnMainSync(() -> activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON));
            stage = "INITIAL_HOME";
            awaitStart = SystemClock.uptimeMillis(); awaitDeadline = awaitStart + READY_MS;
            long end = awaitDeadline;
            while (SystemClock.uptimeMillis() < end) {
                long remaining = end - SystemClock.uptimeMillis();
                if (remaining <= 0) break;
                Boolean value = onMain(() -> get(activity, "client") != null
                        && (Boolean) call(activity, "mainReady") && !(Boolean) get(activity, "busy"), remaining);
                if (value && SystemClock.uptimeMillis() <= end) { ready = true; break; }
                SystemClock.sleep(Math.min(150L, Math.max(0L, end - SystemClock.uptimeMillis())));
            }
            require(ready, "INITIAL_HOME");
            stage = "INITIAL_HOME_READY_CACHED_ONLY";
        } catch (Throwable failure) {
            observed.put("failureType", failure.getClass().getName());
            observed.put("ownReason", failure instanceof AssertionError && "INITIAL_HOME".equals(failure.getMessage())
                    ? "INITIAL_HOME" : "UNAVAILABLE_NOT_WHITELISTED");
        }
        awaitEnd = awaitStart < 0L ? -1L : SystemClock.uptimeMillis();
        observed.put("readinessAwaitStartUptime", awaitStart).put("readinessDeadlineUptime", awaitDeadline)
                .put("readinessAwaitEndUptime", awaitEnd);
        observed.put("stage", stage).put("initialReady", ready).put("fixtureActions", 0).put("inputActions", 0)
                .put("extraRootRpc", 0).put("setupSha256", sha(new File(directory, "setup.json")));
        try { observed.put("cached", onMain(this::cached, 2_000L)); }
        catch (Throwable unavailable) { observed.put("cachedCaptureErrorType", unavailable.getClass().getName()); }
        try { writeNew("observation.json", observed); ledger = "observation.json"; }
        catch (Throwable unavailable) { signal("EVIDENCE_UNAVAILABLE_EXPLICIT_RELEASE_REQUIRED", ledger); }
        signal("INITIALIZATION_HELD_AWAIT_EXPLICIT_RELEASE", ledger);
        // No normal return/Runner.finish is permitted before an exact explicit release.
        JSONObject release;
        for (;;) {
            try {
                if (new File(directory, "release.json").isFile()) {
                    release = new JSONObject(text(new File(directory, "release.json"), 16_384));
                    requireBase(release);
                    require(sha(new File(directory, ledger)).equals(release.getString("ledgerSha256"))
                            && release.getBoolean("finishMayStopHostAcknowledged")
                            && release.getBoolean("automaticEvidenceAlreadyCopied")
                            && release.getBoolean("explicitCleanupResponsibilityAccepted"), "RELEASE_ACK");
                    releaseAccepted = true; break;
                }
            } catch (Throwable unconfirmed) { /* Never finish an alive owner on a malformed release. */ }
            SystemClock.sleep(100L);
        }
        JSONObject result = base().put("observation", observed).put("releaseAccepted", true)
                .put("releaseSha256", sha(new File(directory, "release.json"))).put("automaticRecoveryConfirmed", false)
                .put("noExtraRootRpc", true).put("fixtureActions", 0).put("inputActions", 0);
        try {
            if (activity != null && !activity.isDestroyed()) {
                exitAttempted = true;
                result.put("exitControlAccepted", onMain(() -> {
                    View exit = activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-exit");
                    require(exit != null && exit.isEnabled() && exit.performClick(), "REAL_EXIT_CONTROL"); return true;
                }, 2_000L));
            }
            long until = SystemClock.uptimeMillis() + READY_MS;
            while (activity != null && !activity.isDestroyed() && SystemClock.uptimeMillis() < until) SystemClock.sleep(50L);
        } catch (Throwable failure) { result.put("exitErrorType", failure.getClass().getName()); }
        finally {
            result.put("exitAttempted", exitAttempted).put("activityDestroyed", activity == null || activity.isDestroyed())
                    .put("cleanupPending", AtomicWorkbenchCleanup.pending())
                    .put("quickUnchanged", quick.equals(config.get(AtomicWorkbenchConfig.QUICK_OPEN_APPS)))
                    .put("resourceRecoveryConfirmedByThisEntry", false);
            result.put("success", ready && observed.has("cached") && result.optBoolean("exitControlAccepted")
                    && !result.has("exitErrorType") && result.getBoolean("activityDestroyed")
                    && !result.getBoolean("cleanupPending") && result.getBoolean("quickUnchanged"));
            writeNew("explicit-release-result.json", result);
        }
        return result;
    }

    /** Main thread, existing objects only. No client.status/connect/open or force-ready writes. */
    private JSONObject cached() throws Exception {
        JSONObject out = new JSONObject().put("sampleUptime", SystemClock.uptimeMillis());
        for (String key : new String[]{"active","destroyed","busy","closing","surfaceUnavailable","recoveryPending",
                "waitingForCleanup","nativeHomePending","outputsSyncing","outputsParked","outputFocusPending",
                "connectionRetryRequired","mainLayoutPresented","exitRequested","outputsNeedRetry","hostDialogActive"}) out.put(key, get(activity, key));
        for (String key : new String[]{"epoch","sessionGeneration","focusedWindow","mainLayoutWindow","mainLayoutWidth",
                "mainLayoutHeight","mainLayoutDisplayWidth","mainLayoutDisplayHeight","displayWidth","displayHeight","density","hostInputPending"})
            out.put(key, get(activity, key));
        long launch = (Long) get(activity, "launchGeneration");
        out.put("launchGeneration", launch).put("resetGeneration", ResetWriteFence.generation())
                .put("resetBlocked", ResetWriteFence.blocked()).put("resetStale", ResetWriteFence.stale(launch));
        out.put("cleanupPending", AtomicWorkbenchCleanup.pending()).put("mainReady", call(activity, "mainReady"));
        AtomicWorkbenchWorkspaceModel model = (AtomicWorkbenchWorkspaceModel) get(activity, "model");
        int main = model.mainWindowId(); out.put("mainWindow", main).put("desktopVisible", model.desktopVisible())
                .put("mainLayoutMatches", call(activity, "mainLayoutMatches", new Class<?>[]{int.class}, main));
        Object client = get(activity, "client"), cleanup = get(activity, "connectionCleanupClient");
        out.put("clientPresent", client != null).put("connectionCleanupClientPresent", cleanup != null)
                .put("connectionCleanupSameClient", cleanup != null && cleanup == client)
                .put("connectionCleanupSession", get(activity, "connectionCleanupSession"))
                .put("connectionCleanupSameSession", get(activity, "connectionCleanupSession").equals(get(activity, "sessionGeneration")));
        if (client != null) {
            Object endpoint = get(client, "endpoint"), pending = get(client, "pending");
            out.put("clientClosed", get(client, "closed"))
                    .put("clientFailurePresent", ((AtomicReference<?>) get(client, "failure")).get() != null)
                    .put("endpointPresent", endpoint != null).put("endpointKnownAlive", endpoint instanceof IBinder && ((IBinder) endpoint).isBinderAlive());
            if (pending != null) out.put("cachedRootPid", get(pending, "rootPid")).put("cachedRootStartedAt", get(pending, "startedAt"));
        }
        JSONArray slots = new JSONArray();
        for (Object slot : (Object[]) get(activity, "slots")) {
            JSONObject row = new JSONObject();
            for (String key : new String[]{"id","ready","wasActive","nativeHome","displayId","displayWidth","displayHeight",
                    "homeTaskId","targetTaskId","outputAwaitingFrame","outputRetainsProducer","surfaceLifecycle","surfaceChanges"}) row.put(key, get(slot, key));
            AtomicWorkbenchSurface surface = (AtomicWorkbenchSurface) get(slot, "surface");
            row.put("surfacePresent", surface != null);
            if (surface != null) row.put("surfaceAvailable", surface.isAvailable()).put("surfaceValid", surface.getHolder().isValid())
                    .put("frameCount", surface.frameCount()).put("surfaceWidth", surface.getWidth()).put("surfaceHeight", surface.getHeight());
            row.put("cachedRunningPackageCount", ((java.util.List<?>) get(slot, "runningPackages")).size());
            slots.put(row);
        }
        out.put("slots", slots);
        View status = activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-session-status");
        out.put("statusCode", status instanceof TextView ? statusCode(((TextView) status).getText()) : "STATUS_CONTROL_UNAVAILABLE");
        return out;
    }

    private static String statusCode(CharSequence value) {
        if (value == null || value.length() == 0) return "EMPTY";
        String text = value.toString();
        if (text.startsWith("工作区连接中断，手机正在后台归还任务。未确认前会保留恢复责任，可直接退出。")) return "CONNECTION_INTERRUPTED_BACKGROUND_RECOVERY";
        if (text.equals("正在释放桌面资源，请稍后再试。")) return "WAITING_CLEANUP";
        if (text.startsWith("应用任务尚未归还完成")) return "TASK_RECOVERY_UNCONFIRMED";
        return "UNMAPPED_OWN_STATUS_TEXT_OMITTED";
    }

    private <T> T onMain(Read<T> read, long timeout) throws Exception {
        AtomicReference<T> value = new AtomicReference<>(); AtomicReference<Throwable> error = new AtomicReference<>();
        CountDownLatch latch = new CountDownLatch(1); AtomicBoolean cancelled = new AtomicBoolean();
        test.getTargetContext().getMainExecutor().execute(() -> {
            if (cancelled.get()) { latch.countDown(); return; }
            try { value.set(read.read()); } catch (Throwable failure) { error.set(failure); } finally { latch.countDown(); }
        });
        if (!latch.await(Math.max(1L, timeout), TimeUnit.MILLISECONDS)) { cancelled.set(true); throw new IllegalStateException("MAIN_CAPTURE_TIMEOUT"); }
        if (error.get() != null) throw new IllegalStateException("MAIN_CAPTURE_UNAVAILABLE", error.get());
        return value.get();
    }
    private interface Read<T> { T read() throws Exception; }
    private static Object get(Object owner, String name) throws Exception { Field f = owner.getClass().getDeclaredField(name); f.setAccessible(true); return f.get(owner); }
    private static Object call(Object owner, String name) throws Exception { return call(owner, name, new Class<?>[0]); }
    private static Object call(Object owner, String name, Class<?>[] types, Object... values) throws Exception { Method m = owner.getClass().getDeclaredMethod(name, types); m.setAccessible(true); return m.invoke(owner, values); }
    private JSONObject base() throws Exception { return new JSONObject().put("schema", 1).put("case", caseId).put("captureNonce", nonce).put("boot", boot).put("uid", Process.myUid()).put("pid", Process.myPid()).put("moduleVersion", BuildConfig.VERSION_NAME); }
    private void requireBase(JSONObject value) throws Exception { require(value.getInt("schema") == 1 && caseId.equals(value.getString("case")) && nonce.equals(value.getString("captureNonce")) && boot.equals(value.getString("boot")) && value.getInt("uid") == Process.myUid() && value.getInt("pid") == Process.myPid(), "RELEASE_IDENTITY"); }
    private JSONObject self() throws Exception { String st = text(new File("/proc/self/stat"), 8192); String[] words = st.substring(st.lastIndexOf(')') + 2).trim().split("\\s+"); String cmd = text(new File("/proc/self/cmdline"), 8192); int zero = cmd.indexOf(0); require(zero > 0, "HOST_NUL_ELEMENT"); String argv0 = cmd.substring(0, zero); require("ls.augment.com".equals(argv0) && words.length > 19, "HOST_IDENTITY"); return new JSONObject().put("pid", Process.myPid()).put("uid", Process.myUid()).put("startTicks", words[19]).put("argv0", argv0); }
    private void signal(String phase, String ledger) { Bundle b = new Bundle(); b.putString("initializationPhase", phase); b.putString("case", caseId); b.putString("ledger", ledger); b.putString("evidencePath", directory.getAbsolutePath()); test.sendStatus(1, b); }
    private void writeNew(String name, JSONObject value) throws Exception { File file = new File(directory, name), tmp = new File(directory, name + ".pending"); require(!file.exists() && !tmp.exists(), "IMMUTABLE_RECORD"); byte[] bytes = value.toString().getBytes(StandardCharsets.UTF_8); try (FileOutputStream o = new FileOutputStream(tmp)) { o.write(bytes); o.getFD().sync(); } require(tmp.renameTo(file), "COMMIT_RECORD"); }
    private static String text(File f, int cap) throws Exception { byte[] bytes = Files.readAllBytes(f.toPath()); require(bytes.length <= cap, "BOUNDED_RECORD"); return new String(bytes, StandardCharsets.UTF_8); }
    private static String sha(File f) throws Exception { byte[] v = MessageDigest.getInstance("SHA-256").digest(Files.readAllBytes(f.toPath())); StringBuilder out = new StringBuilder(); for (byte x : v) out.append(String.format(java.util.Locale.ROOT, "%02X", x & 255)); return out.toString(); }
    private static void require(boolean value, String code) { if (!value) throw new AssertionError(code); }
}
