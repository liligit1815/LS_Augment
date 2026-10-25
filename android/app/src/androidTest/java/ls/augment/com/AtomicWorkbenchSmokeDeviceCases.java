package ls.augment.com;

import android.app.BroadcastOptions;
import android.app.Instrumentation;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.PixelFormat;
import android.media.Image;
import android.media.ImageReader;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.Surface;
import java.util.ArrayList;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Predicate;
import org.json.JSONObject;

/** End-to-end sample backend test; workspace HOME, app-list and toolbar UI need separate device acceptance. */
final class AtomicWorkbenchSmokeDeviceCases {
    private static final int WIDTH = 720, HEIGHT = 1280, DENSITY = 320;
    private final Context target, testContext;
    private final Instrumentation instrumentation;
    private String stage = "starting";
    private final String nonce = UUID.randomUUID().toString().replace("-", "");
    private final Object stateLock = new Object();
    private final int fixtureUid;
    private Bundle lastState;
    private long lastQuery;
    private final BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (intent == null || getSentFromUid() != fixtureUid
                    || !nonce.equals(intent.getStringExtra("nonce"))) return;
            synchronized (stateLock) {
                lastState = new Bundle(intent.getExtras());
                stateLock.notifyAll();
            }
        }
    };

    private AtomicWorkbenchSmokeDeviceCases(Instrumentation instrumentation) {
        this.instrumentation = instrumentation;
        target = instrumentation.getTargetContext();
        testContext = instrumentation.getContext();
        fixtureUid = testContext.getApplicationInfo().uid;
    }

    static JSONObject run(Instrumentation instrumentation, Bundle ignored) throws Exception {
        if (Looper.myLooper() == Looper.getMainLooper())
            throw new IllegalStateException("Smoke test must run off the main thread");
        return new AtomicWorkbenchSmokeDeviceCases(instrumentation).run();
    }

    private JSONObject run() throws Exception {
        JSONObject report = new JSONObject().put("scope", "PHONE_SAMPLE_BACKEND_NOT_WORKSPACE_UI")
                .put("nativeHomeUi", "NOT_EXERCISED").put("workspaceToolbarUi", "NOT_EXERCISED");
        HandlerThread framesThread = new HandlerThread("atomic-workbench-smoke-frames");
        framesThread.start();
        ImageReader images = null;
        Surface output = null;
        AtomicWorkbenchClient client = null;
        AtomicInteger frames = new AtomicInteger();
        boolean registered = false, passed = false, restored = false;
        int observedTask = -1, observedDisplay = -1;
        long started = SystemClock.uptimeMillis();
        try {
            target.registerReceiver(receiver, new IntentFilter(AtomicWorkbenchFixtureActivity.ACTION_STATE),
                    Context.RECEIVER_EXPORTED);
            registered = true;
            // Remove only a prior copy of this developer-owned sample.
            control(AtomicWorkbenchFixtureActivity.ACTION_FINISH);
            Thread.sleep(250L);
            images = ImageReader.newInstance(WIDTH, HEIGHT, PixelFormat.RGBA_8888, 3);
            images.setOnImageAvailableListener(reader -> {
                try (Image image = reader.acquireLatestImage()) {
                    if (image != null) frames.incrementAndGet();
                } catch (IllegalStateException ignored) { }
            }, new Handler(framesThread.getLooper()));
            output = images.getSurface();
            ComponentName fixture = new ComponentName(testContext, AtomicWorkbenchFixtureActivity.class);
            report.put("fixture", fixture.flattenToString());
            report.put("touchTransport", "complete MotionEvent via private Binder");
            stage = "open_sample";
            client = AtomicWorkbenchClient.connect(target);
            Bundle opened = client.open(output, WIDTH, HEIGHT, DENSITY, fixture);
            report.put("open", stateJson(opened));
            require(opened.getBoolean("success", false), "VD launch failed: " + opened.getString("message", ""));
            Bundle ready = awaitClientReady(client, 12_000L);
            observedDisplay = ready.getInt("display_id", -1);
            final int hostedDisplay = observedDisplay;
            Bundle fixtureState = awaitState(value -> value.getInt("display_id", -1) == hostedDisplay
                    && value.getInt("task_id", -1) > 0 && value.getBoolean("geometry_ready")
                    && !value.getBoolean("destroyed"), 10_000L);
            observedTask = fixtureState.getInt("task_id");
            require(ready.getInt("task_id", -1) == observedTask, "Backend observed a different task than the fixture");
            require(fixtureState.getInt("click_count", -1) == 0, "Fixture was not fresh");
            report.put("hostedDisplayId", observedDisplay).put("hostedTaskId", observedTask);
            stage = "focus_before_first_click";
            final long focusedAt = SystemClock.uptimeMillis();
            require(client.focusWindow(0).getBoolean("success"), "Unable to focus sample");
            fixtureState = awaitState(value -> value.getInt("display_id", -1) == hostedDisplay
                    && value.getLong("at_uptime", -1) >= focusedAt && inputReady(value), 10_000L);
            report.put("windowFocusVerified", true).put("geometryReady", true);
            stage = "first_click";
            tap(client, fixtureState.getFloat("button_x"), fixtureState.getFloat("button_y"));
            Bundle clicked = awaitState(value -> value.getInt("display_id", -1) == hostedDisplay
                    && value.getInt("click_count", -1) == 1 && !value.getBoolean("destroyed"), 6_000L);
            report.put("buttonClickCount", clicked.getInt("click_count"));
            stage = "focus_editor";
            clicked = awaitState(value -> value.getInt("display_id", -1) == hostedDisplay
                    && value.getInt("click_count", -1) == 1 && inputReady(value), 6_000L);
            tap(client, clicked.getFloat("editor_x"), clicked.getFloat("editor_y"));
            Bundle keyboard = awaitState(value -> value.getInt("display_id", -1) == hostedDisplay
                    && value.getBoolean("editor_focused") && inputReady(value), 12_000L);
            report.put("editorFocused", true).put("virtualImeInsetsVisible", keyboard.getBoolean("ime_visible"));
            report.put("virtualImeBottomInset", keyboard.getInt("ime_bottom"));
            stage = "verify_phone_ime_and_virtual_input_target";
            JSONObject imeEvidence = AtomicWorkbenchImeDeviceProbe.awaitVisible(instrumentation,
                    testContext.getPackageName(), fixtureUid, hostedDisplay, 12_000L);
            report.put("imeEvidence", imeEvidence);
            require(imeEvidence.optBoolean("success"), "Phone IME/virtual editor target unconfirmed: " + imeEvidence);
            report.put("actualImeVisible", true);
            stage = "type_into_virtual_editor";
            final String expectedText = "smoke42";
            AtomicWorkbenchImeDeviceProbe.sendLatinText(instrumentation, hostedDisplay, expectedText);
            awaitState(value -> value.getInt("display_id", -1) == hostedDisplay
                    && expectedText.equals(value.getString("editor_text", "")), 6_000L);
            report.put("actualInputTextVerified", true);
            require(frames.get() > 0, "No rendered frame reached ImageReader");
            Bundle closed = client.close();
            report.put("close", stateJson(closed));
            restored = closed.getBoolean("success", false) && !closed.getBoolean("recovery_pending", false);
            require(restored, "Close did not confirm recovery");
            final int expectedTask = observedTask;
            Bundle returned = awaitState(value -> value.getInt("display_id", -1) == 0
                    && value.getInt("task_id", -1) == expectedTask
                    && value.getInt("click_count", -1) == 1 && !value.getBoolean("destroyed"), 10_000L);
            report.put("restoredDisplayId", returned.getInt("display_id"));
            report.put("restoredTaskId", returned.getInt("task_id"));
            report.put("restoredClickCount", returned.getInt("click_count"));
            passed = true;
        } catch (Exception | AssertionError failure) {
            report.put("failure", failure.getClass().getSimpleName() + ": " + safe(failure.getMessage())).put("stage", stage);
        } finally {
            if (client != null && !restored) {
                try {
                    Bundle closed = client.close();
                    report.put("cleanupClose", stateJson(closed));
                    restored = closed.getBoolean("success", false) && !closed.getBoolean("recovery_pending", false);
                } catch (Exception failure) { report.put("cleanupCloseError", failure.getClass().getSimpleName()); }
            }
            if (registered) {
                long finishRequestedAt = SystemClock.uptimeMillis();
                control(AtomicWorkbenchFixtureActivity.ACTION_FINISH);
                try {
                    awaitState(value -> value.getBoolean("destroyed")
                            && value.getLong("at_uptime", 0) >= finishRequestedAt,
                            4_000L, AtomicWorkbenchFixtureActivity.ACTION_FINISH);
                    report.put("fixtureFinished", true);
                } catch (Exception | AssertionError failure) {
                    report.put("fixtureFinished", false);
                    if (observedTask > 0) passed = false;
                }
                target.unregisterReceiver(receiver);
            }
            if (client != null && !restored) try {
                Bundle finalClose = client.close();
                report.put("afterFixtureClose", stateJson(finalClose));
                restored = finalClose.getBoolean("success", false) && !finalClose.getBoolean("recovery_pending", false);
            } catch (Exception failure) { report.put("afterFixtureCloseError", failure.getClass().getSimpleName()); }
            if (images != null) { images.setOnImageAvailableListener(null, null); images.close(); }
            if (output != null) output.release();
            framesThread.quitSafely();
            framesThread.join(1000L);
            report.put("renderedFrames", frames.get());
            report.put("recoveryConfirmed", restored);
            report.put("elapsedMs", SystemClock.uptimeMillis() - started);
            report.put("success", passed && restored);
        }
        return report;
    }

    private Bundle awaitClientReady(AtomicWorkbenchClient client, long timeout) throws Exception {
        long deadline = SystemClock.uptimeMillis() + timeout;
        Bundle latest = null;
        while (SystemClock.uptimeMillis() < deadline) {
            Bundle workspace = client.status();
            latest = null;
            ArrayList<Bundle> windows = workspace.getParcelableArrayList("windows", Bundle.class);
            if (windows != null) for (Bundle window : windows)
                if (window.getInt("window_id", -1) == 0) { latest = window; break; }
            // Background HOME bookkeeping is allowed; only the real sample on top is evidence.
            if (latest != null && latest.getBoolean("success", false) && "active".equals(latest.getString("state", ""))
                    && !latest.getBoolean("recovery_pending", false)
                    && latest.getInt("display_id", -1) > 0 && latest.getInt("task_count", 0) > 0
                    && latest.getInt("task_id", -1) > 0 && !latest.getBoolean("home_only")
                    && fixtureOnTop(latest)
                    && latest.getInt("ime_policy", -1) == AtomicWorkbenchProtocol.IME_POLICY_PHONE_DISPLAY) return latest;
            Thread.sleep(150L);
        }
        throw new AssertionError("Hosted application was not ready: "
                + (latest == null ? "no status" : latest.getString("message", "")));
    }

    private boolean fixtureOnTop(Bundle window) {
        ComponentName top = ComponentName.unflattenFromString(window.getString("top_component", ""));
        ArrayList<String> running = window.getStringArrayList("running_packages");
        return top != null && testContext.getPackageName().equals(top.getPackageName())
                && AtomicWorkbenchFixtureActivity.class.getName().equals(top.getClassName())
                && running != null && running.contains(testContext.getPackageName());
    }

    private Bundle awaitState(Predicate<Bundle> matches, long timeout) throws Exception {
        return awaitState(matches, timeout, AtomicWorkbenchFixtureActivity.ACTION_QUERY);
    }

    private Bundle awaitState(Predicate<Bundle> matches, long timeout, String controlAction) throws Exception {
        long deadline = SystemClock.uptimeMillis() + timeout;
        while (SystemClock.uptimeMillis() < deadline) {
            synchronized (stateLock) {
                if (lastState != null && matches.test(lastState)) return new Bundle(lastState);
            }
            long now = SystemClock.uptimeMillis();
            if (now - lastQuery > 400L) {
                lastQuery = now;
                control(controlAction);
            }
            synchronized (stateLock) { stateLock.wait(Math.min(150L, Math.max(1L, deadline - now))); }
        }
        Bundle latest;
        synchronized (stateLock) { latest = lastState == null ? null : new Bundle(lastState); }
        throw new AssertionError("No matching fixture state;stage=" + stage + ";last=" + summarize(latest));
    }

    private static boolean inputReady(Bundle value) {
        return value.getBoolean("window_focused") && value.getBoolean("geometry_ready")
                && value.getInt("button_width", 0) > 0 && value.getInt("button_height", 0) > 0
                && value.getInt("editor_width", 0) > 0 && value.getInt("editor_height", 0) > 0
                && !value.getBoolean("destroyed");
    }

    private static String summarize(Bundle state) {
        if (state == null) return "none";
        return "display=" + state.getInt("display_id", -1) + ",task=" + state.getInt("task_id", -1)
                + ",clicks=" + state.getInt("click_count", -1) + ",windowFocused=" + state.getBoolean("window_focused")
                + ",geometryReady=" + state.getBoolean("geometry_ready")
                + ",button=" + state.getInt("button_width", 0) + "x" + state.getInt("button_height", 0)
                + ",editorFocused=" + state.getBoolean("editor_focused") + ",destroyed=" + state.getBoolean("destroyed");
    }

    private void control(String action) {
        Intent intent = new Intent(action).setPackage(testContext.getPackageName());
        intent.putExtra("nonce", nonce);
        intent.addFlags(Intent.FLAG_RECEIVER_FOREGROUND);
        target.sendBroadcast(intent, null, BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
    }

    private static void tap(AtomicWorkbenchClient client, float x, float y) throws Exception {
        require(Float.isFinite(x) && Float.isFinite(y) && x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT,
                "Fixture supplied invalid virtual coordinates");
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0);
        down.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { client.touch(down); } finally { down.recycle(); }
        Thread.sleep(80L);
        MotionEvent up = MotionEvent.obtain(now, SystemClock.uptimeMillis(), MotionEvent.ACTION_UP, x, y, 0);
        up.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { client.touch(up); } finally { up.recycle(); }
    }

    private static JSONObject stateJson(Bundle state) throws Exception {
        return new JSONObject().put("success", state.getBoolean("success", false))
                .put("recoveryPending", state.getBoolean("recovery_pending", false))
                .put("displayId", state.getInt("display_id", -1))
                .put("taskId", state.getInt("task_id", -1))
                .put("nativeHome", state.getBoolean("native_home", false))
                .put("homeTaskId", state.getInt("home_task_id", -1))
                .put("taskCount", state.getInt("task_count", 0))
                .put("imePolicy", state.getInt("ime_policy", -1))
                .put("message", state.getString("message", ""));
    }

    private static String safe(String text) {
        if (text == null) return "";
        return text.replace('\n', ' ').replace('\r', ' ').substring(0, Math.min(text.length(), 500));
    }

    private static void require(boolean condition, String detail) {
        if (!condition) throw new AssertionError(detail);
    }
}
