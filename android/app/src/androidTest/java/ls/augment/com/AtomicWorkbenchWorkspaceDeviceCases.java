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
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.Surface;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Predicate;
import org.json.JSONArray;
import org.json.JSONObject;

/** Four isolated sample packages; this backend test does not operate the workspace toolbar or HOME. */
final class AtomicWorkbenchWorkspaceDeviceCases {
    private static final String[] PACKAGES = {"ls.augment.workbench.fixture.one",
            "ls.augment.workbench.fixture.two", "ls.augment.workbench.fixture.three", "ls.augment.workbench.fixture.four"};
    private static final int WIDTH = 720, HEIGHT = 1280, DENSITY = 320;
    private final Context target;
    private final Instrumentation instrumentation;
    private String stage = "starting";
    private final String nonce = UUID.randomUUID().toString().replace("-", "");
    private final Object lock = new Object();
    private final Map<String, Integer> uids = new HashMap<>();
    private final Map<String, Bundle> states = new HashMap<>();
    private final BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (intent == null || !nonce.equals(intent.getStringExtra("nonce"))) return;
            String pkg = intent.getStringExtra("fixture_package");
            Integer expected = uids.get(pkg);
            if (expected == null || getSentFromUid() != expected) return;
            synchronized (lock) { states.put(pkg, new Bundle(intent.getExtras())); lock.notifyAll(); }
        }
    };

    private AtomicWorkbenchWorkspaceDeviceCases(Instrumentation instrumentation) {
        this.instrumentation = instrumentation;
        target = instrumentation.getTargetContext();
    }

    static JSONObject run(Instrumentation instrumentation) throws Exception {
        return new AtomicWorkbenchWorkspaceDeviceCases(instrumentation).run();
    }

    private JSONObject run() throws Exception {
        JSONObject report = new JSONObject().put("scope", "PHONE_MULTI_DISPLAY_BACKEND_NOT_UI_GESTURE")
                .put("nativeHomeUi", "NOT_EXERCISED").put("workspaceToolbarUi", "NOT_EXERCISED");
        JSONArray inputHandles = new JSONArray();
        JSONArray inputActions = new JSONArray();
        report.put("inputHandles", inputHandles);
        report.put("inputActions", inputActions);
        HandlerThread thread = new HandlerThread("workbench-multi-fixture-frames");
        thread.start();
        ImageReader[] readers = new ImageReader[PACKAGES.length];
        Surface[] outputs = new Surface[PACKAGES.length];
        AtomicInteger[] frames = new AtomicInteger[PACKAGES.length];
        int[] taskIds = new int[PACKAGES.length], displayIds = new int[PACKAGES.length], clicks = new int[PACKAGES.length];
        for (int index = 0; index < PACKAGES.length; index++) frames[index] = new AtomicInteger();
        AtomicWorkbenchClient client = null;
        boolean registered = false, passed = false, restored = false;
        try {
            stage = "phone_interactive_precondition";
            long unlockDeadline = SystemClock.uptimeMillis() + 3_000L;
            android.os.PowerManager power = target.getSystemService(android.os.PowerManager.class);
            android.app.KeyguardManager keyguard = target.getSystemService(android.app.KeyguardManager.class);
            while ((!power.isInteractive() || keyguard.isKeyguardLocked())
                    && SystemClock.uptimeMillis() < unlockDeadline) SystemClock.sleep(50L);
            require(power.isInteractive(), "Phone must be awake for real input verification");
            require(!keyguard.isKeyguardLocked(), "Unlock phone before real input verification");
            for (String pkg : PACKAGES) uids.put(pkg, target.getPackageManager().getApplicationInfo(pkg, 0).uid);
            require(new java.util.HashSet<>(uids.values()).size() == PACKAGES.length, "Samples must be separate application UIDs");
            target.registerReceiver(receiver, new IntentFilter(AtomicWorkbenchFixtureActivity.ACTION_STATE), Context.RECEIVER_EXPORTED);
            registered = true;
            control(AtomicWorkbenchFixtureActivity.ACTION_FINISH);
            Thread.sleep(250L);
            client = AtomicWorkbenchClient.connect(target);
            for (int index = 0; index < PACKAGES.length; index++) {
                stage = "open_sample_" + index;
                final AtomicInteger count = frames[index];
                readers[index] = ImageReader.newInstance(WIDTH, HEIGHT, PixelFormat.RGBA_8888, 3);
                readers[index].setOnImageAvailableListener(reader -> {
                    try (Image image = reader.acquireLatestImage()) { if (image != null) count.incrementAndGet(); }
                    catch (IllegalStateException ignored) { }
                }, new Handler(thread.getLooper()));
                outputs[index] = readers[index].getSurface();
                ComponentName component = new ComponentName(PACKAGES[index], PACKAGES[index] + ".AtomicWorkbenchFixtureActivity");
                Bundle opened = client.openWindow(index, outputs[index], WIDTH, HEIGHT, DENSITY, component);
                require(opened.getBoolean("success"), opened.getString("message", "Open failed"));
                Bundle ready = awaitWindow(client, index);
                displayIds[index] = ready.getInt("display_id", -1);
                Bundle state = awaitFixture(index, value -> value.getInt("fixture_protocol") == AtomicWorkbenchFixtureActivity.PROTOCOL
                        && value.getInt("display_id", -1) > 0
                        && value.getBoolean("geometry_ready") && !value.getBoolean("destroyed"));
                taskIds[index] = state.getInt("task_id", -1);
                require(taskIds[index] > 0 && state.getInt("display_id") == displayIds[index], "Wrong fixture task/display");
                require(ready.getInt("task_id", -1) == taskIds[index], "Backend observed a different task than the fixture");
                stage = "focus_before_first_click_" + index;
                final long focusedAt = SystemClock.uptimeMillis();
                require(client.focusWindow(index).getBoolean("success"), "Unable to focus sample");
                final int expectedDisplay = displayIds[index];
                state = awaitFixture(index, value -> value.getInt("display_id", -1) == expectedDisplay
                        && value.getLong("at_uptime", -1) >= focusedAt && inputReady(value));
                stage = "input_handle_before_first_click_" + index;
                inputHandles.put(AtomicWorkbenchInputWindowDeviceProbe.awaitReady(instrumentation,
                        PACKAGES[index], uids.get(PACKAGES[index]), expectedDisplay, WIDTH, HEIGHT));
                final long inputReadyAt = SystemClock.uptimeMillis();
                state = awaitFixture(index, value -> value.getInt("display_id", -1) == expectedDisplay
                        && value.getLong("at_uptime", -1) >= inputReadyAt && inputReady(value));
                stage = "first_click_" + index;
                tap(client, index, state.getFloat("button_x"), state.getFloat("button_y"));
                Bundle clicked = awaitFixture(index, value -> value.getInt("click_count") == 1);
                require(clicked.getInt("touch_down_count") == 1 && clicked.getInt("touch_up_count") == 1
                        && clicked.getInt("touch_cancel_count") == 0, "First action was not one complete sample tap");
                require(Math.abs(clicked.getFloat("last_touch_x") - state.getFloat("button_x")) < 1f
                        && Math.abs(clicked.getFloat("last_touch_y") - state.getFloat("button_y")) < 1f,
                        "System transformed sample tap coordinates during an unfinished transition");
                clicks[index] = 1;
                inputActions.put(actionEvidence(index, "first_tap", clicked));
                stage = "scroll_" + index;
                scroll(client, index, clicked);
                Bundle scrolled = awaitFixture(index, value -> value.getInt("scroll_offset_y") > 0
                        && value.getInt("touch_up_count") == 2);
                inputActions.put(actionEvidence(index, "scroll", scrolled));
                stage = "long_press_" + index;
                longPress(client, index, scrolled.getFloat("button_x"), scrolled.getFloat("button_y"));
                Bundle held = awaitFixture(index, value -> value.getInt("long_click_count") == 1
                        && value.getInt("touch_up_count") == 3);
                require(held.getInt("click_count") == clicks[index], "Long press unexpectedly clicked the button");
                inputActions.put(actionEvidence(index, "long_press", held));
                stage = "two_pointer_" + index;
                multiTouch(client, index, held.getFloat("scroll_x"), held.getFloat("scroll_y")
                        + held.getInt("scroll_height") / 4f);
                Bundle multi = awaitFixture(index, value -> value.getInt("max_pointer_count") == 2
                        && value.getInt("pointer_down_count") == 1 && value.getInt("pointer_up_count") == 1
                        && value.getInt("touch_up_count") == 4);
                inputActions.put(actionEvidence(index, "two_pointer", multi));
            }
            java.util.HashSet<Integer> distinctDisplays = new java.util.HashSet<>();
            for (int display : displayIds) distinctDisplays.add(display);
            require(distinctDisplays.size() == PACKAGES.length, "Samples did not retain distinct displays");
            for (int index : new int[]{3, 0, 2, 1, 3, 2, 0}) {
                stage = "focus_exchange_" + index;
                final long focusedAt = SystemClock.uptimeMillis();
                require(client.focusWindow(index).getBoolean("success"), "Focus exchange failed");
                Bundle ready = awaitWindow(client, index, taskIds[index]);
                final int expectedTask = taskIds[index], expectedDisplay = displayIds[index];
                require(ready.getInt("display_id") == expectedDisplay && ready.getInt("task_id", -1) == expectedTask,
                        "Focus changed the fixture task/display identity");
                final int expectedClicks = clicks[index];
                Bundle active = awaitFixture(index, value -> value.getInt("task_id") == expectedTask
                        && value.getInt("display_id") == expectedDisplay && value.getInt("click_count") == expectedClicks
                        && value.getLong("at_uptime", -1) >= focusedAt && inputReady(value));
                inputHandles.put(AtomicWorkbenchInputWindowDeviceProbe.awaitReady(instrumentation,
                        PACKAGES[index], uids.get(PACKAGES[index]), expectedDisplay, WIDTH, HEIGHT));
                tap(client, index, active.getFloat("button_x"), active.getFloat("button_y"));
                Bundle clicked = awaitFixture(index, value -> value.getInt("click_count") == expectedClicks + 1);
                clicks[index]++;
                inputActions.put(actionEvidence(index, "focus_exchange_tap", clicked));
            }
            stage = "cancel_old_touch_during_focus_exchange";
            Bundle heldStart = awaitFixture(0, value -> value.getInt("click_count") == clicks[0] && inputReady(value));
            final int oldDowns = heldStart.getInt("touch_down_count");
            final int oldCancels = heldStart.getInt("touch_cancel_count");
            final int oldClicks = clicks[0];
            long heldAt = SystemClock.uptimeMillis();
            event(client, 0, heldAt, MotionEvent.ACTION_DOWN, heldStart.getFloat("button_x"), heldStart.getFloat("button_y"));
            awaitFixture(0, value -> value.getInt("touch_down_count") == oldDowns + 1);
            require(client.focusWindow(1).getBoolean("success"), "Unable to interrupt old touch with focus exchange");
            inputHandles.put(AtomicWorkbenchInputWindowDeviceProbe.awaitReady(instrumentation,
                    PACKAGES[1], uids.get(PACKAGES[1]), displayIds[1], WIDTH, HEIGHT));
            Bundle cancelled = awaitFixture(0, value -> value.getInt("touch_cancel_count") == oldCancels + 1);
            require(cancelled.getInt("click_count") == oldClicks, "Cancelled old touch clicked its original button");
            inputActions.put(actionEvidence(0, "cancel_on_exchange", cancelled));
            Bundle newTarget = awaitFixture(1, AtomicWorkbenchWorkspaceDeviceCases::inputReady);
            final int targetDowns = newTarget.getInt("touch_down_count"), targetUps = newTarget.getInt("touch_up_count");
            event(client, 0, heldAt, MotionEvent.ACTION_MOVE, heldStart.getFloat("button_x"), heldStart.getFloat("button_y"));
            event(client, 0, heldAt, MotionEvent.ACTION_UP, heldStart.getFloat("button_x"), heldStart.getFloat("button_y"));
            require(client.status().getBoolean("success"), "Backend failed after stale old-window events");
            final long staleCheckedAt = SystemClock.uptimeMillis();
            Bundle untouched = awaitFixture(1, value -> value.getLong("at_uptime") >= staleCheckedAt && inputReady(value));
            require(untouched.getInt("touch_down_count") == targetDowns && untouched.getInt("touch_up_count") == targetUps
                    && untouched.getInt("click_count") == clicks[1], "Old-window events reached the new active sample");
            report.put("oldTouchCancelledAndLatePacketsIsolated", true);
            require(client.focusWindow(0).getBoolean("success"), "Unable to return to editor sample");
            inputHandles.put(AtomicWorkbenchInputWindowDeviceProbe.awaitReady(instrumentation,
                    PACKAGES[0], uids.get(PACKAGES[0]), displayIds[0], WIDTH, HEIGHT));
            stage = "focus_editor";
            Bundle editor = awaitFixture(0, value -> value.getInt("task_id") == taskIds[0] && inputReady(value));
            tap(client, 0, editor.getFloat("editor_x"), editor.getFloat("editor_y"));
            Bundle focusedEditor = awaitFixture(0, value -> value.getBoolean("editor_focused") && inputReady(value));
            report.put("editorFocused", true).put("virtualImeInsetsVisible", focusedEditor.getBoolean("ime_visible"));
            stage = "verify_phone_ime_and_virtual_input_target";
            JSONObject imeEvidence = AtomicWorkbenchImeDeviceProbe.awaitVisible(instrumentation, PACKAGES[0],
                    uids.get(PACKAGES[0]), displayIds[0], 12_000L);
            report.put("imeEvidence", imeEvidence);
            require(imeEvidence.optBoolean("success"), "Phone IME/virtual editor target unconfirmed: " + imeEvidence);
            report.put("realImeVisible", true);
            stage = "type_into_virtual_editor";
            final String expectedText = "workbench42";
            AtomicWorkbenchImeDeviceProbe.sendLatinText(instrumentation, displayIds[0], expectedText);
            awaitFixture(0, value -> expectedText.equals(value.getString("editor_text", "")));
            report.put("actualInputTextVerified", true);
            for (AtomicInteger count : frames) require(count.get() > 0, "No real frame received from a sample");
            Bundle closed = client.close();
            restored = closed.getBoolean("success") && !closed.getBoolean("recovery_pending");
            require(restored, closed.getString("message", "Recovery not confirmed"));
            JSONArray samples = new JSONArray();
            for (int index = 0; index < PACKAGES.length; index++) {
                final int expected = taskIds[index];
                final int expectedClicks = clicks[index];
                Bundle returned = awaitFixture(index, value -> value.getInt("task_id") == expected
                        && value.getInt("display_id", -1) == 0 && value.getInt("click_count") == expectedClicks
                        && !value.getBoolean("destroyed"));
                samples.put(new JSONObject().put("package", PACKAGES[index]).put("taskId", expected)
                        .put("originalVirtualDisplay", displayIds[index]).put("restoredDisplay", returned.getInt("display_id"))
                        .put("frames", frames[index].get()).put("clickCount", returned.getInt("click_count")));
            }
            report.put("samples", samples); passed = true;
        } catch (Exception | AssertionError failure) {
            report.put("failure", failure.getClass().getSimpleName() + ": " + failure.getMessage()).put("stage", stage);
        } finally {
            if (client == null) restored = true; // No session or owned display was created.
            JSONArray observations = new JSONArray();
            synchronized (lock) {
                for (String pkg : PACKAGES) {
                    Bundle state = states.get(pkg);
                    JSONObject observation = new JSONObject().put("package", pkg);
                    if (state != null) for (String key : state.keySet()) {
                        if (!"nonce".equals(key)) observation.put(key, state.get(key));
                    }
                    observations.put(observation);
                }
            }
            report.put("fixtureObservations", observations);
            if (client != null && !restored) try {
                Bundle closed = client.close();
                restored = closed.getBoolean("success") && !closed.getBoolean("recovery_pending");
            } catch (Exception failure) { report.put("cleanupFailure", failure.getClass().getSimpleName()); }
            if (registered) { control(AtomicWorkbenchFixtureActivity.ACTION_FINISH); target.unregisterReceiver(receiver); }
            if (client != null && !restored) try {
                Bundle closed = client.close(); restored = closed.getBoolean("success") && !closed.getBoolean("recovery_pending");
            } catch (Exception ignored) { }
            for (ImageReader reader : readers) if (reader != null) reader.close();
            for (Surface output : outputs) if (output != null) output.release();
            thread.quitSafely(); thread.join(1000L);
        }
        return report.put("recoveryConfirmed", restored).put("success", passed && restored);
    }

    private Bundle awaitWindow(AtomicWorkbenchClient client, int id) throws Exception {
        return awaitWindow(client, id, -1);
    }

    private Bundle awaitWindow(AtomicWorkbenchClient client, int id, int expectedTask) throws Exception {
        long deadline = SystemClock.uptimeMillis() + 10_000L;
        Bundle latest = null;
        do {
            Bundle status = client.status();
            ArrayList<Bundle> windows = status.getParcelableArrayList("windows", Bundle.class);
            if (windows != null) for (Bundle window : windows) if (window.getInt("window_id", -1) == id) {
                latest = window;
                if (fixtureWindow(window, PACKAGES[id], PACKAGES[id] + ".AtomicWorkbenchFixtureActivity", expectedTask))
                    return window;
            }
            Thread.sleep(100L);
        } while (SystemClock.uptimeMillis() < deadline);
        throw new AssertionError("Sample application never became active: " + id + ";expectedTask=" + expectedTask
                + ";last=" + (latest == null ? "none" : "task=" + latest.getInt("task_id", -1)
                + ",top=" + latest.getString("top_component", "") + ",homeOnly=" + latest.getBoolean("home_only")
                + ",state=" + latest.getString("state", "")));
    }

    private static boolean fixtureWindow(Bundle window, String pkg, String className, int expectedTask) {
        ComponentName top = ComponentName.unflattenFromString(window.getString("top_component", ""));
        ArrayList<String> running = window.getStringArrayList("running_packages");
        return window.getBoolean("success") && "active".equals(window.getString("state"))
                && !window.getBoolean("recovery_pending") && !window.getBoolean("home_only")
                && window.getInt("display_id", -1) > 0 && window.getInt("task_count", 0) > 0
                && window.getInt("task_id", -1) > 0 && (expectedTask < 0 || window.getInt("task_id") == expectedTask)
                && top != null && pkg.equals(top.getPackageName()) && className.equals(top.getClassName())
                && running != null && running.contains(pkg)
                && window.getInt("ime_policy", -1) == AtomicWorkbenchProtocol.IME_POLICY_PHONE_DISPLAY;
    }

    private Bundle awaitFixture(int index, Predicate<Bundle> condition) throws Exception {
        long deadline = SystemClock.uptimeMillis() + 12_000L;
        while (SystemClock.uptimeMillis() < deadline) {
            synchronized (lock) {
                Bundle state = states.get(PACKAGES[index]);
                if (state != null && condition.test(state)) return new Bundle(state);
            }
            control(AtomicWorkbenchFixtureActivity.ACTION_QUERY);
            synchronized (lock) { lock.wait(150L); }
        }
        Bundle latest;
        synchronized (lock) { latest = states.get(PACKAGES[index]); }
        throw new AssertionError("Missing matching sample state: " + PACKAGES[index] + ";stage=" + stage
                + ";last=" + summarize(latest));
    }

    private static boolean inputReady(Bundle value) {
        return value.getBoolean("window_focused") && value.getBoolean("geometry_ready")
                && value.getInt("button_width", 0) > 0 && value.getInt("button_height", 0) > 0
                && value.getInt("editor_width", 0) > 0 && value.getInt("editor_height", 0) > 0
                && !value.getBoolean("destroyed");
    }

    private static JSONObject actionEvidence(int index, String action, Bundle state) throws Exception {
        JSONObject result = new JSONObject().put("package", PACKAGES[index]).put("action", action);
        for (String key : new String[]{"display_id", "task_id", "click_count", "long_click_count", "scroll_offset_y",
                "touch_down_count", "touch_up_count", "touch_cancel_count", "pointer_down_count", "pointer_up_count",
                "max_pointer_count", "last_touch_action", "last_touch_x", "last_touch_y", "button_x", "button_y"})
            result.put(key, state.get(key));
        return result;
    }

    private static String summarize(Bundle state) {
        if (state == null) return "none";
        return "display=" + state.getInt("display_id", -1) + ",task=" + state.getInt("task_id", -1)
                + ",clicks=" + state.getInt("click_count", -1) + ",windowFocused=" + state.getBoolean("window_focused")
                + ",geometryReady=" + state.getBoolean("geometry_ready")
                + ",button=" + state.getInt("button_width", 0) + "x" + state.getInt("button_height", 0)
                + "@" + state.getFloat("button_x") + "," + state.getFloat("button_y")
                + ",touch=" + state.getInt("touch_down_count") + "/" + state.getInt("touch_up_count")
                + "/" + state.getInt("touch_cancel_count") + ",lastTouch=" + state.getInt("last_touch_action", -1)
                + "@" + state.getFloat("last_touch_x") + "," + state.getFloat("last_touch_y")
                + ",editorFocused=" + state.getBoolean("editor_focused") + ",destroyed=" + state.getBoolean("destroyed");
    }

    private void control(String action) {
        for (String pkg : uids.keySet()) target.sendBroadcast(new Intent(action).setPackage(pkg).putExtra("nonce", nonce),
                null, BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
    }

    private static void tap(AtomicWorkbenchClient client, int id, float x, float y) throws Exception {
        require(Float.isFinite(x) && Float.isFinite(y) && x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT, "Invalid sample coordinates");
        long downAt = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(downAt, downAt, MotionEvent.ACTION_DOWN, x, y, 0);
        down.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { client.touchWindow(id, down); } finally { down.recycle(); }
        Thread.sleep(80L);
        MotionEvent up = MotionEvent.obtain(downAt, SystemClock.uptimeMillis(), MotionEvent.ACTION_UP, x, y, 0);
        up.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { client.touchWindow(id, up); } finally { up.recycle(); }
    }

    private static void event(AtomicWorkbenchClient client, int id, long downAt, int action, float x, float y) {
        MotionEvent event = MotionEvent.obtain(downAt, SystemClock.uptimeMillis(), action, x, y, 0);
        event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { client.touchWindow(id, event); } finally { event.recycle(); }
    }

    private void longPress(AtomicWorkbenchClient client, int id, float x, float y) throws Exception {
        long downAt = SystemClock.uptimeMillis();
        event(client, id, downAt, MotionEvent.ACTION_DOWN, x, y);
        try { awaitFixture(id, value -> value.getInt("long_click_count") == 1); }
        finally { event(client, id, downAt, MotionEvent.ACTION_UP, x, y); }
    }

    private static void scroll(AtomicWorkbenchClient client, int id, Bundle state) throws Exception {
        float x = state.getFloat("scroll_x"), center = state.getFloat("scroll_y");
        float range = state.getInt("scroll_height") / 3f;
        long downAt = SystemClock.uptimeMillis();
        event(client, id, downAt, MotionEvent.ACTION_DOWN, x, center + range);
        for (int step = 1; step <= 8; step++) {
            SystemClock.sleep(20L);
            event(client, id, downAt, MotionEvent.ACTION_MOVE, x, center + range - 2 * range * step / 8f);
        }
        event(client, id, downAt, MotionEvent.ACTION_UP, x, center - range);
    }

    private static void multiTouch(AtomicWorkbenchClient client, int id, float x, float y) {
        long downAt = SystemClock.uptimeMillis();
        event(client, id, downAt, MotionEvent.ACTION_DOWN, x - 30, y);
        MotionEvent.PointerProperties[] properties = {new MotionEvent.PointerProperties(), new MotionEvent.PointerProperties()};
        MotionEvent.PointerCoords[] coordinates = {new MotionEvent.PointerCoords(), new MotionEvent.PointerCoords()};
        for (int index = 0; index < 2; index++) {
            properties[index].id = index; properties[index].toolType = MotionEvent.TOOL_TYPE_FINGER;
            coordinates[index].x = x + (index == 0 ? -30 : 30); coordinates[index].y = y;
            coordinates[index].pressure = 1; coordinates[index].size = 1;
        }
        for (int action : new int[]{MotionEvent.ACTION_POINTER_DOWN | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT),
                MotionEvent.ACTION_MOVE, MotionEvent.ACTION_POINTER_UP | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT)}) {
            MotionEvent event = MotionEvent.obtain(downAt, SystemClock.uptimeMillis(), action, 2, properties,
                    coordinates, 0, 0, 1f, 1f, 0, 0, InputDevice.SOURCE_TOUCHSCREEN, 0);
            try { client.touchWindow(id, event); } finally { event.recycle(); }
        }
        event(client, id, downAt, MotionEvent.ACTION_UP, x - 30, y);
    }

    private static void require(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
}
