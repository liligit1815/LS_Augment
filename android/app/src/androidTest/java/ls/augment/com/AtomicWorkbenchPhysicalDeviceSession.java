package ls.augment.com;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/** A test-APK-only physical input/observation session; never installed in the product APK. */
final class AtomicWorkbenchPhysicalDeviceSession {
    interface StateReader { JSONObject read() throws Exception; }
    interface PasteProbe { JSONObject readOnly(int window) throws Exception; }
    private static int touchDeviceId;
    private AtomicWorkbenchPhysicalDeviceSession() { }

    static JSONObject run(Instrumentation test, Activity activity, File folder, StateReader reader, PasteProbe probe) throws Exception {
        if (!folder.isDirectory() && !folder.mkdirs()) throw new IllegalStateException("Cannot create physical acceptance directory");
        File commandFile = new File(folder, "command.json"), responseFile = new File(folder, "response.json");
        Files.deleteIfExists(commandFile.toPath());
        UiAutomation ui = test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
        AccessibilityServiceInfo info = ui.getServiceInfo();
        info.flags |= AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;
        ui.setServiceInfo(info);
        Point size = new Point(); activity.getWindowManager().getDefaultDisplay().getRealSize(size);
        touchDeviceId = actualTouchDeviceId();
        JSONArray history = new JSONArray();
        long last = 0, deadline = SystemClock.uptimeMillis() + 1_200_000L;
        write(responseFile, capture(ui, activity, folder, reader, 0, "ready", "capture", size));
        android.os.Bundle progress = new android.os.Bundle();
        progress.putString("stream", "Physical fixture session ready: " + folder.getAbsolutePath() + "\n");
        test.sendStatus(1, progress);
        while (SystemClock.uptimeMillis() < deadline) {
            JSONObject command;
            try {
                if (!commandFile.isFile()) { SystemClock.sleep(100L); continue; }
                command = new JSONObject(new String(Files.readAllBytes(commandFile.toPath()), StandardCharsets.UTF_8));
            } catch (Exception incomplete) { SystemClock.sleep(100L); continue; }
            long id = command.optLong("id", -1);
            if (id <= last) { SystemClock.sleep(100L); continue; }
            last = id;
            String label = command.optString("label", "step" + id), action = command.optString("action", "");
            JSONObject response;
            JSONObject beforeRelease = null;
            JSONObject pasteProbe = null;
            JSONArray injected = new JSONArray();
            try {
                if (!label.matches("[A-Za-z0-9_.-]{1,64}")) throw new IllegalArgumentException("Invalid evidence label");
                if ("tap".equals(action)) {
                    float x = coordinate(command, "x", size.x), y = coordinate(command, "y", size.y);
                    long down = SystemClock.uptimeMillis();
                    touch(ui, down, MotionEvent.ACTION_DOWN, x, y, injected); SystemClock.sleep(48L);
                    touch(ui, down, MotionEvent.ACTION_UP, x, y, injected);
                } else if ("swipe".equals(action)) {
                    float x = coordinate(command, "x", size.x), y = coordinate(command, "y", size.y);
                    float endX = coordinate(command, "toX", size.x), endY = coordinate(command, "toY", size.y);
                    int duration = command.optInt("durationMs", 250), hold = command.optInt("holdMs", 0);
                    if (duration < 80 || duration > 1500 || hold < 0 || hold > 1500) throw new IllegalArgumentException("Invalid gesture duration");
                    long down = SystemClock.uptimeMillis();
                    touch(ui, down, MotionEvent.ACTION_DOWN, x, y, injected);
                    int steps = Math.max(4, duration / 16);
                    for (int step = 1; step <= steps; step++) {
                        SystemClock.sleep(Math.max(1L, down + duration * step / steps - SystemClock.uptimeMillis()));
                        touch(ui, down, MotionEvent.ACTION_MOVE, x + (endX - x) * step / steps, y + (endY - y) * step / steps, injected);
                    }
                    if (hold > 0) SystemClock.sleep(hold);
                    touch(ui, down, MotionEvent.ACTION_UP, endX, endY, injected);
                } else if ("drag".equals(action)) {
                    if (!reader.read().has("extractionFixture")) throw new IllegalArgumentException("Drag action requires the explicit extracted-text fixture");
                    float x = coordinate(command, "x", size.x), y = coordinate(command, "y", size.y);
                    float endX = coordinate(command, "toX", size.x), endY = coordinate(command, "toY", size.y);
                    int press = command.optInt("pressMs", 900), duration = command.optInt("durationMs", 400);
                    String release = command.getString("release");
                    if (press < 400 || press > 2000 || duration < 80 || duration > 1500
                            || !("cancel".equals(release) || "drop".equals(release))) throw new IllegalArgumentException("Invalid bounded drag parameters");
                    long down = SystemClock.uptimeMillis(); boolean held = false; float lastX = x, lastY = y;
                    try {
                        held = true; touch(ui, down, MotionEvent.ACTION_DOWN, x, y, injected); SystemClock.sleep(press);
                        int steps = Math.max(4, duration / 16);
                        for (int step = 1; step <= steps; step++) {
                            SystemClock.sleep(Math.max(1, duration / steps));
                            lastX = x + (endX - x) * step / steps; lastY = y + (endY - y) * step / steps;
                            touch(ui, down, MotionEvent.ACTION_MOVE, lastX, lastY, injected);
                        }
                        SystemClock.sleep(180L);
                        beforeRelease = capture(ui, activity, folder, reader, id, label + "-held", "drag-held", size);
                        write(new File(folder, id + "-" + label + "-held.json"), beforeRelease);
                        if ("drop".equals(release)) {
                            int expected = command.optInt("expectedDropWindow", -1);
                            String rejected = ownedDropRejection(beforeRelease, expected);
                            beforeRelease.put("releaseAdmission", new JSONObject().put("expectedWindow", expected)
                                    .put("accepted", rejected.isEmpty()).put("reason", rejected));
                            write(new File(folder, id + "-" + label + "-held.json"), beforeRelease);
                            if (!rejected.isEmpty()) throw new AssertionError("DROP cancelled before UP: " + rejected);
                        }
                        touch(ui, down, "cancel".equals(release) ? MotionEvent.ACTION_CANCEL : MotionEvent.ACTION_UP, lastX, lastY, injected);
                        held = false;
                    } finally {
                        if (held) touch(ui, down, MotionEvent.ACTION_CANCEL, lastX, lastY, injected);
                    }
                } else if ("source-kernel-longpress".equals(action)) {
                    JSONObject fresh = capture(ui, activity, folder, reader, id, label + "-before", "capture", size);
                    float[] point = ownedSourcePoint(fresh, command.getInt("expectedDropWindow"));
                    pasteProbe = kernelSourceLongpress(ui, folder, id, label, point, size);
                } else if ("source-longpress".equals(action)) {
                    JSONObject fresh = capture(ui, activity, folder, reader, id, label + "-before", "capture", size);
                    float[] point = ownedSourcePoint(fresh, command.getInt("expectedDropWindow"));
                    long down = SystemClock.uptimeMillis(); boolean held = true;
                    try {
                        touch(ui, down, MotionEvent.ACTION_DOWN, point[0], point[1], injected);
                        SystemClock.sleep(1100L);
                        beforeRelease = capture(ui, activity, folder, reader, id, label + "-held", "source-held", size);
                        File input = new File(folder, id + "-" + label + "-input.txt");
                        shellSnapshot(ui, "dumpsys -t 3 input", input);
                        beforeRelease.put("inputDiagnostics", input.getAbsolutePath());
                        touch(ui, down, MotionEvent.ACTION_UP, point[0], point[1], injected); held = false;
                    } finally { if (held) touch(ui, down, MotionEvent.ACTION_CANCEL, point[0], point[1], injected); }
                } else if ("paste-probe".equals(action)) {
                    pasteProbe = probe.readOnly(command.getInt("expectedDropWindow"));
                } else if ("back".equals(action)) {
                    long now = SystemClock.uptimeMillis();
                    KeyEvent down = new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK, 0, 0,
                            KeyCharacterMap.VIRTUAL_KEYBOARD, 0, 0, InputDevice.SOURCE_KEYBOARD);
                    if (!ui.injectInputEvent(down, true) || !ui.injectInputEvent(KeyEvent.changeAction(down, KeyEvent.ACTION_UP), true))
                        throw new IllegalStateException("Physical BACK was not accepted");
                } else if (!"capture".equals(action) && !"finish".equals(action)) throw new IllegalArgumentException("Unsupported developer command");
                response = capture(ui, activity, folder, reader, id, label, action, size).put("command", command).put("success", true);
            } catch (Exception | AssertionError failure) {
                response = new JSONObject().put("id", id).put("action", action).put("label", label)
                        .put("success", false).put("failure", failure.getClass().getSimpleName() + ": " + failure.getMessage());
            }
            response.put("injectedEvents", injected);
            if (beforeRelease != null) response.put("beforeRelease", beforeRelease);
            if (pasteProbe != null) response.put("source-kernel-longpress".equals(action) ? "kernelSourceInput" : "readOnlyPasteProbe", pasteProbe);
            write(new File(folder, id + "-" + label + ".json"), response);
            write(responseFile, response);
            history.put(new JSONObject().put("id", id).put("action", action).put("label", label)
                    .put("success", response.optBoolean("success")).put("path", new File(folder, id + "-" + label + ".json").getAbsolutePath()));
            if ("finish".equals(action)) return new JSONObject().put("success", response.optBoolean("success"))
                    .put("scope", "PHYSICAL_DISPLAY_0_INPUT_AND_LIVE_FIXTURE_OBSERVATION")
                    .put("history", history).put("finalState", reader.read());
        }
        return new JSONObject().put("success", false).put("failure", "Physical acceptance session deadline reached")
                .put("history", history).put("finalState", reader.read());
    }

    /** Developer fixture guard: a failed pre-release observation sends CANCEL in the original finally. */
    private static String ownedDropRejection(JSONObject held, int expected) throws Exception {
        if (expected < 0 || expected > 7) return "expected_owned_window_missing";
        JSONObject state = held.getJSONObject("state"), source = state.getJSONObject("extractionFixture");
        JSONArray hovered = source.getJSONArray("hoveredWindowIds");
        if (hovered.length() != 1 || hovered.getInt(0) != expected) return "owned_target_not_hovered";
        boolean ownedSource=source.optBoolean("syntheticAlreadyExtractedText")
                ||source.optBoolean("realSourceRequested")&&source.optBoolean("realAcceptedSourceOwned")
                    &&source.optBoolean("realAcceptedTextMatchesOwned")
                    &&"原子工作台开发验收".equals(source.optString("ownedTestText"))
                    &&source.optString("realAcceptedSourcePackage").matches("ls\\.augment\\.workbench\\.fixture\\.(one|two|three|four)");
        if (!ownedSource || !source.optBoolean("frozenTextIsOwnedTestText")
                || source.optBoolean("frozenHasFiles") || !source.optBoolean("activeDrag")
                || source.optBoolean("dragConsumed") || source.optBoolean("dragEnded")
                || !source.optBoolean("sourceStarted") || source.optBoolean("sourceFinishing") || source.optBoolean("sourceDestroyed")
                || !source.optBoolean("receiverActive") || !source.optBoolean("receiverForeground")) return "owned_source_not_live";
        if (source.optDouble("sourceWindowAlpha", -1) != 0 || (source.optInt("sourceWindowFlags") & 24) != 24
                || source.optDouble("toolWindowAlpha", -1) != 0 || (source.optInt("toolWindowFlags") & 24) != 24)
            return "source_windows_not_released";
        JSONArray windows = state.getJSONObject("workspace").getJSONArray("windows");
        JSONObject target = null;
        for (int i = 0; i < windows.length(); i++) if (windows.getJSONObject(i).optInt("window_id", -1) == expected) target = windows.getJSONObject(i);
        if (target == null || target.optBoolean("native_home") || !target.optBoolean("visible")) return "owned_window_not_visible";
        String component = target.optString("top_component"), pkg = component.split("/", 2)[0];
        if (!pkg.matches("ls\\.augment\\.workbench\\.fixture\\.(one|two|three|four)")) return "target_is_not_owned_fixture";
        JSONArray fixtures = state.getJSONArray("fixtures");
        for (int i = 0; i < fixtures.length(); i++) {
            JSONObject fixture = fixtures.getJSONObject(i);
            if (pkg.equals(fixture.optString("fixture_package")) && fixture.optInt("task_id", -1) == target.optInt("task_id", -2)
                    && fixture.optInt("display_id", -1) == target.optInt("display_id", -2)) return "";
        }
        return "owned_task_or_display_changed";
    }

    /** Use only the current visible native title of the same owned task, mapped through its real surface. */
    private static float[] ownedSourcePoint(JSONObject fresh, int expected) throws Exception {
        JSONObject state = fresh.getJSONObject("state"), source = state.getJSONObject("extractionFixture");
        JSONObject workspace = state.getJSONObject("workspace");
        if (!source.optBoolean("realSourceRequested") || source.optBoolean("syntheticAlreadyExtractedText")
                || !source.optBoolean("sourceMissing") || !source.optBoolean("pasteServiceAvailable")
                || !source.optBoolean("systemPermissionsUnchanged") || !state.optBoolean("hostResumed")
                || !state.optBoolean("mainReady") || workspace.getInt("mainWindow") != expected)
            throw new AssertionError("Real source longpress is not admitted in this current owned workspace");
        JSONObject target = null;
        JSONArray slots = workspace.getJSONArray("windows");
        for (int i = 0; i < slots.length(); i++) if (slots.getJSONObject(i).getInt("window_id") == expected) target = slots.getJSONObject(i);
        if (target == null || !target.optBoolean("visible") || target.optBoolean("native_home")
                || target.getInt("display_id") != fresh.getInt("mainDisplayId")) throw new AssertionError("Source display is not the rendered main surface");
        String pkg = target.getString("top_component").split("/", 2)[0];
        boolean same = false;
        JSONArray fixtures = state.getJSONArray("fixtures");
        for (int i = 0; i < fixtures.length(); i++) {
            JSONObject fixture = fixtures.getJSONObject(i);
            same |= pkg.equals(fixture.optString("fixture_package")) && fixture.optInt("task_id", -1) == target.getInt("task_id")
                    && fixture.optInt("display_id", -1) == target.getInt("display_id");
        }
        if (!same || !pkg.matches("ls\\.augment\\.workbench\\.fixture\\.(one|two|three|four)")) throw new AssertionError("Source is not the same owned fixture");
        java.util.ArrayList<JSONObject> titles = new java.util.ArrayList<>();
        JSONArray windows = fresh.getJSONArray("mainDisplayWindows");
        for (int i = 0; i < windows.length(); i++) {
            JSONObject window = windows.getJSONObject(i);
            if (window.optInt("type") == AccessibilityWindowInfo.TYPE_APPLICATION && window.has("root"))
                collectOwnedTitles(window.getJSONObject("root"), pkg, source.getString("ownedTestText"), titles);
        }
        if (titles.size() != 1) throw new AssertionError("Expected one visible owned native title");
        Rect nativeBounds = Rect.unflattenFromString(titles.get(0).getString("bounds"));
        Rect surface = Rect.unflattenFromString(target.getString("visibleBounds"));
        int width = fresh.getInt("mainDisplayWidth"), height = fresh.getInt("mainDisplayHeight");
        if (nativeBounds == null || nativeBounds.isEmpty() || surface == null || surface.isEmpty()
                || nativeBounds.left < 0 || nativeBounds.top < 0 || nativeBounds.right > width || nativeBounds.bottom > height)
            throw new AssertionError("Native source title geometry is outside its actual display");
        float x = surface.left + nativeBounds.exactCenterX() * surface.width() / width;
        float y = surface.top + nativeBounds.exactCenterY() * surface.height() / height;
        JSONArray physical = fresh.getJSONArray("physicalWindows");
        for (int i = 0; i < physical.length(); i++) if (physical.getJSONObject(i).optInt("type") == AccessibilityWindowInfo.TYPE_INPUT_METHOD) {
            Rect keyboard = Rect.unflattenFromString(physical.getJSONObject(i).getString("bounds"));
            if (keyboard != null && keyboard.contains((int)x, (int)y)) throw new AssertionError("Owned title point is covered by the actual phone IME");
        }
        if (!surface.contains((int)x, (int)y) || x < 0 || y < 0 || x >= fresh.getInt("physicalWidth") || y >= fresh.getInt("physicalHeight"))
            throw new AssertionError("Mapped source point is not inside the visible owned surface");
        return new float[]{x,y};
    }
    private static void collectOwnedTitles(JSONObject node, String pkg, String text, java.util.List<JSONObject> found) throws Exception {
        if (pkg.equals(node.optString("package")) && node.optBoolean("visible") && !node.optBoolean("password")
                && !node.optBoolean("editable") && text.equals(node.optString("text"))) found.add(node);
        JSONArray children = node.optJSONArray("children");
        if (children != null) for (int i = 0; i < children.length(); i++) collectOwnedTitles(children.getJSONObject(i), pkg, text, found);
    }

    /** Test-only kernel event validation. No driver install, capability bypass or product dependency. */
    private static JSONObject kernelSourceLongpress(UiAutomation ui, File folder, long id, String label, float[] point, Point size) throws Exception {
        File capsFile = new File(folder, id + "-" + label + "-kernel-capabilities.txt");
        File beforeFile = new File(folder, id + "-" + label + "-kernel-before.txt");
        rootShellSnapshot("getevent -lp", capsFile);
        shellSnapshot(ui, "dumpsys -t 3 input", beforeFile);
        String caps = new String(Files.readAllBytes(capsFile.toPath()), StandardCharsets.UTF_8);
        String dump = new String(Files.readAllBytes(beforeFile.toPath()), StandardCharsets.UTF_8);
        InputDevice device = InputDevice.getDevice(touchDeviceId);
        if (device == null || device.isVirtual()) throw new AssertionError("No current physical touchscreen for the kernel fixture");
        java.util.regex.Matcher named = java.util.regex.Pattern.compile("add device \\d+: (/dev/input/event\\d+)\\s+name:\\s+\""
                + java.util.regex.Pattern.quote(device.getName()) + "\"([\\s\\S]*?)(?=add device |\\z)").matcher(caps);
        if (!named.find()) throw new AssertionError("Physical touchscreen kernel path not found");
        String path = named.group(1), properties = named.group(2);
        if (named.find()) throw new AssertionError("Ambiguous physical touchscreen kernel path");
        for (String capability : new String[]{"BTN_TOUCH", "BTN_TOOL_FINGER", "ABS_X", "ABS_Y", "ABS_MT_SLOT", "ABS_MT_TRACKING_ID", "ABS_MT_POSITION_X", "ABS_MT_POSITION_Y", "ABS_MT_TOUCH_MAJOR", "ABS_MT_TOUCH_MINOR", "INPUT_PROP_DIRECT"})
            if (!properties.contains(capability)) throw new AssertionError("Kernel touchscreen capability missing: " + capability);
        int maxX = kernelAxisMaximum(properties, "ABS_MT_POSITION_X"), maxY = kernelAxisMaximum(properties, "ABS_MT_POSITION_Y");
        if (kernelAxisMaximum(properties, "ABS_X") != maxX || kernelAxisMaximum(properties, "ABS_Y") != maxY
                || kernelAxisMaximum(properties, "ABS_MT_TOUCH_MAJOR") < 12 || kernelAxisMaximum(properties, "ABS_MT_TOUCH_MINOR") < 12
                || kernelAxisMaximum(properties, "ABS_MT_SLOT") < 0 || kernelAxisMaximum(properties, "ABS_MT_TRACKING_ID") < 60123)
            throw new AssertionError("Unsupported native multi-touch slot/tracking range");
        java.util.regex.Matcher reader = java.util.regex.Pattern.compile("(?m)^  Device " + touchDeviceId + ": "
                + java.util.regex.Pattern.quote(device.getName()) + "\\r?\\n([\\s\\S]*?)(?=^  Device |\\z)").matcher(dump);
        if (!reader.find()) throw new AssertionError("Native InputReader touchscreen identity not found");
        String mapping = reader.group(1);
        if (!mapping.contains("InputDeviceOrientation: Rotation0") || !mapping.contains("Last Cooked Touch: pointerCount=0")
                || !mapping.contains("logicalFrame=[0, 0, " + size.x + ", " + size.y + "]")
                || !mapping.contains("physicalFrame=[0, 0, " + size.x + ", " + size.y + "]"))
            throw new AssertionError("Native touchscreen viewport or idle contact state not confirmed");
        java.util.regex.Matcher matrix = java.util.regex.Pattern.compile("RawToDisplay Transform:[^\\n]*\\n\\s*([0-9.-]+)\\s+([0-9.-]+)\\s+([0-9.-]+)\\s*\\n\\s*([0-9.-]+)\\s+([0-9.-]+)\\s+([0-9.-]+)").matcher(mapping);
        if (!matrix.find()) throw new AssertionError("Native touchscreen calibration matrix missing");
        double sx = Double.parseDouble(matrix.group(1)), sy = Double.parseDouble(matrix.group(5));
        for (int index : new int[]{2,3,4,6}) if (Double.parseDouble(matrix.group(index)) != 0)
            throw new AssertionError("Kernel fixture requires the actual unrotated axis-aligned calibration");
        if (sx <= 0 || sy <= 0 || Math.abs(sx * (maxX + 1) - size.x) > .01 || Math.abs(sy * (maxY + 1) - size.y) > .01)
            throw new AssertionError("Native raw ranges and display calibration disagree");
        int rawX = (int)Math.round(point[0] / sx), rawY = (int)Math.round(point[1] / sy);
        if (rawX < 0 || rawX > maxX || rawY < 0 || rawY > maxY) throw new AssertionError("Owned source point outside calibrated touchscreen axes");
        File held = new File(folder, id + "-" + label + "-kernel-held-input.txt");
        if (!held.getAbsolutePath().matches("[A-Za-z0-9_./-]+")) throw new AssertionError("Unexpected test evidence path");
        String send = "sendevent " + path + " ";
        int longPress = android.view.ViewConfiguration.getLongPressTimeout();
        if (longPress < 250 || longPress > 1200) throw new AssertionError("Native longpress timeout is outside the supported detector range");
        String hold = String.format(java.util.Locale.ROOT, "%.3f", (longPress + 1000) / 1000d);
        String release = send + "3 47 0; " + send + "3 57 -1; " + send + "1 330 0; " + send + "1 325 0; " + send + "0 0 0";
        String script = "set -eu\nrelease() { " + release + "; }\ntrap release EXIT HUP INT TERM\n"
                + send + "1 330 1\n" + send + "1 325 1\n" + send + "3 47 0\n" + send + "3 57 60123\n"
                + send + "3 53 " + rawX + "\n" + send + "3 54 " + rawY + "\n" + send + "3 0 " + rawX + "\n" + send + "3 1 " + rawY + "\n"
                + send + "3 48 12\n" + send + "3 49 12\n" + send + "0 0 0\nsleep " + hold + "\n"
                + "dumpsys -t 3 input > " + held.getAbsolutePath() + "\nrelease\ntrap - EXIT HUP INT TERM\nprintf OWNED_KERNEL_GESTURE_FINISHED\n";
        File terminal = new File(folder, id + "-" + label + "-kernel-terminal.txt");
        rootShellSnapshot(script, terminal);
        if (!new String(Files.readAllBytes(terminal.toPath()), StandardCharsets.UTF_8).trim().equals("OWNED_KERNEL_GESTURE_FINISHED"))
            throw new AssertionError("Kernel gesture did not confirm its terminal release");
        return new JSONObject().put("scope", "DEVELOPER_KERNEL_INPUT_READER_VALIDATION_ONLY").put("phoneFeatureDependency", false)
                .put("physicalInputDevice", touchDeviceId).put("deviceName", device.getName()).put("kernelPath", path)
                .put("rawX", rawX).put("rawY", rawY).put("scaleX", sx).put("scaleY", sy)
                .put("physicalX", rawX * sx).put("physicalY", rawY * sy).put("terminalReleased", true)
                .put("systemLongPressMs", longPress).put("holdMs", longPress + 1000)
                .put("inputDiagnostics", held.getAbsolutePath()).put("capabilities", capsFile.getAbsolutePath());
    }
    private static int kernelAxisMaximum(String properties, String axis) {
        java.util.regex.Matcher value = java.util.regex.Pattern.compile(java.util.regex.Pattern.quote(axis)
                + "\\s*:\\s*value -?\\d+, min 0, max (\\d+),").matcher(properties);
        if (!value.find()) throw new AssertionError("Unknown kernel axis range: " + axis);
        return Integer.parseInt(value.group(1));
    }
    private static void rootShellSnapshot(String script, File output) throws Exception {
        // ProcessBuilder preserves the entire -c argument; UiAutomation command tokenization does not.
        Process process = new ProcessBuilder("su", "-c", script).redirectErrorStream(true).redirectOutput(output).start();
        if (!process.waitFor(12L, java.util.concurrent.TimeUnit.SECONDS)) {
            process.destroy(); throw new IllegalStateException("Owned kernel validation command timed out");
        }
        if (process.exitValue() != 0) throw new IllegalStateException("Owned kernel validation command failed");
    }

    private static JSONObject capture(UiAutomation ui, Activity activity, File folder, StateReader reader, long id,
            String label, String action, Point size) throws Exception {
        JSONObject result = new JSONObject().put("id", id).put("label", label).put("action", action)
                .put("at_uptime", SystemClock.uptimeMillis()).put("physicalWidth", size.x).put("physicalHeight", size.y)
                .put("injectedTouchDeviceId", touchDeviceId)
                .put("state", reader.read());
        android.util.SparseArray<List<AccessibilityWindowInfo>> displays = ui.getWindowsOnAllDisplays();
        JSONObject fixture = result.getJSONObject("state").optJSONObject("extractionFixture");
        if ("drag-held".equals(action) && fixture != null && fixture.optBoolean("testDragHandlerWitness")) {
            File input = new File(folder, id + "-" + label + "-input.txt");
            File windows = new File(folder, id + "-" + label + "-windows.txt");
            shellSnapshot(ui, "dumpsys -t 3 input", input);
            shellSnapshot(ui, "dumpsys -t 3 window windows", windows);
            result.put("inputDiagnostics", input.getAbsolutePath()).put("windowDiagnostics", windows.getAbsolutePath());
        }
        String onlyOwnedText = fixture == null ? null : fixture.optString("ownedTestText", "");
        try {
            result.put("physicalWindows", windows(displays.get(0), onlyOwnedText));
            JSONObject workspace = result.getJSONObject("state").optJSONObject("workspace");
            JSONArray slots = workspace == null ? new JSONArray() : workspace.getJSONArray("windows");
            if (workspace == null) result.put("mainDisplayObservation", "workspace_unavailable");
            for (int index = 0; index < slots.length(); index++) {
                JSONObject slot = slots.getJSONObject(index);
                if (slot.getInt("window_id") != workspace.getInt("mainWindow")) continue;
                int displayId = slot.getInt("display_id");
                android.view.Display display = activity.getSystemService(android.hardware.display.DisplayManager.class).getDisplay(displayId);
                if (display == null || !slot.getString("display_unique_id").equals(
                        android.view.Display.class.getMethod("getUniqueId").invoke(display)))
                    throw new IllegalStateException("Main display identity changed before native-window observation");
                Point nativeSize = new Point(); display.getRealSize(nativeSize);
                result.put("mainDisplayId", displayId).put("mainDisplayWidth", nativeSize.x).put("mainDisplayHeight", nativeSize.y)
                        .put("mainDisplayWindows", windows(displays.get(displayId), onlyOwnedText));
            }
        } finally {
            for (int index = 0; index < displays.size(); index++)
                for (AccessibilityWindowInfo window : displays.valueAt(index)) window.recycle();
        }
        Bitmap bitmap = ui.takeScreenshot();
        if (bitmap == null) throw new IllegalStateException("Physical screenshot unavailable");
        File screen = new File(folder, id + "-" + label + ".png");
        try (FileOutputStream output = new FileOutputStream(screen)) {
            if (!bitmap.compress(Bitmap.CompressFormat.PNG, 100, output)) throw new IllegalStateException("Cannot encode screenshot");
        } finally { bitmap.recycle(); }
        return result.put("screen", screen.getAbsolutePath()).put("success", true);
    }

    private static JSONArray windows(List<AccessibilityWindowInfo> source, String onlyOwnedText) throws Exception {
        JSONArray windows = new JSONArray();
        if (source != null) for (AccessibilityWindowInfo window : source) {
            Rect bounds = new Rect(); window.getBoundsInScreen(bounds);
            JSONObject value = new JSONObject().put("type", window.getType()).put("focused", window.isFocused())
                    .put("active", window.isActive()).put("bounds", bounds.flattenToString());
            AccessibilityNodeInfo root = window.getRoot();
            if (root != null) value.put("root", node(root, new int[]{0}, 0, onlyOwnedText));
            windows.put(value);
        }
        return windows;
    }

    private static JSONObject node(AccessibilityNodeInfo node, int[] count, int depth, String onlyOwnedText) throws Exception {
        try {
            Rect bounds = new Rect(); node.getBoundsInScreen(bounds);
            JSONObject value = new JSONObject().put("text", observedText(node.getText(), onlyOwnedText))
                    .put("description", observedText(node.getContentDescription(), onlyOwnedText))
                    .put("id", string(node.getViewIdResourceName())).put("package", string(node.getPackageName()))
                    .put("class", string(node.getClassName())).put("bounds", bounds.flattenToString())
                    .put("password", node.isPassword()).put("editable", node.isEditable())
                    .put("visible", node.isVisibleToUser()).put("clickable", node.isClickable()).put("focused", node.isFocused());
            count[0]++;
            JSONArray children = new JSONArray();
            if (depth < 25 && count[0] < 2000) for (int index = 0; index < node.getChildCount() && count[0] < 2000; index++) {
                AccessibilityNodeInfo child = node.getChild(index);
                if (child != null) children.put(node(child, count, depth + 1, onlyOwnedText));
            }
            return value.put("children", children);
        } finally { node.recycle(); }
    }

    private static String string(CharSequence value) { return value == null ? "" : value.toString(); }
    /** The optional synthetic-text fixture records only its own text and the relevant fixed UI labels. */
    private static String observedText(CharSequence value, String ownedText) {
        String text = string(value);
        if (ownedText == null || text.isEmpty() || ownedText.contains(text)
                || java.util.Set.of("提取文字", "复制全文", "分词与更多操作", "文字分词", "分词", "全文", "更多",
                        "全选", "取消", "划选", "拆词", "关闭", "启用文字填入", "打开设置",
                        "请在系统无障碍设置中启用“原子工作台文字填入”，然后重新拖入。素材会继续保留。").contains(text)) return text;
        return "<redacted>";
    }
    private static float coordinate(JSONObject value, String key, int maximum) throws Exception {
        float coordinate = (float) value.getDouble(key);
        if (!Float.isFinite(coordinate) || coordinate < 0 || coordinate >= maximum) throw new IllegalArgumentException("Invalid physical coordinate");
        return coordinate;
    }
    private static void touch(UiAutomation ui, long down, int action, float x, float y, JSONArray injected) throws Exception {
        MotionEvent.PointerProperties pointer = new MotionEvent.PointerProperties();
        pointer.id = 0; pointer.toolType = MotionEvent.TOOL_TYPE_FINGER;
        MotionEvent.PointerCoords position = new MotionEvent.PointerCoords();
        position.x = x; position.y = y; position.pressure = 1f; position.size = 1f;
        MotionEvent event = MotionEvent.obtain(down, SystemClock.uptimeMillis(), action, 1,
                new MotionEvent.PointerProperties[]{pointer}, new MotionEvent.PointerCoords[]{position},
                0, 0, 1f, 1f, touchDeviceId, 0, InputDevice.SOURCE_TOUCHSCREEN, 0, 0, 0);
        JSONObject record = new JSONObject().put("action", action).put("downTime", event.getDownTime())
                .put("eventTime", event.getEventTime()).put("x", x).put("y", y)
                .put("displayId", displayId(event)).put("source", event.getSource())
                .put("toolType", event.getToolType(0)).put("pointerId", event.getPointerId(0)).put("deviceId", event.getDeviceId());
        injected.put(record);
        try {
            boolean accepted = ui.injectInputEvent(event, true);
            record.put("injectionReturnedAt", SystemClock.uptimeMillis()).put("accepted", accepted);
            if (!accepted) throw new IllegalStateException("Physical touch was not accepted");
        }
        finally { event.recycle(); }
    }
    private static int actualTouchDeviceId() {
        int selected = -1;
        for (int id : InputDevice.getDeviceIds()) {
            InputDevice device = InputDevice.getDevice(id);
            if (device == null || device.isVirtual() || device.isExternal() || !device.isEnabled()
                    || (device.getSources() & InputDevice.SOURCE_TOUCHSCREEN) != InputDevice.SOURCE_TOUCHSCREEN) continue;
            if (selected != -1) throw new IllegalStateException("Physical touchscreen identity is ambiguous");
            selected = id;
        }
        if (selected == -1) throw new IllegalStateException("No actual internal touchscreen available for acceptance");
        return selected;
    }
    private static void shellSnapshot(UiAutomation ui, String command, File output) throws Exception {
        try (java.io.InputStream input = new android.os.ParcelFileDescriptor.AutoCloseInputStream(ui.executeShellCommand(command));
                FileOutputStream stream = new FileOutputStream(output)) {
            stream.write(input.readNBytes(2 * 1024 * 1024));
        }
    }
    private static Object displayId(MotionEvent event) {
        try { return MotionEvent.class.getMethod("getDisplayId").invoke(event); }
        catch (ReflectiveOperationException unavailable) { return "UNAVAILABLE_" + unavailable.getClass().getSimpleName(); }
    }
    private static void write(File file, JSONObject value) throws Exception {
        File temporary = new File(file.getParentFile(), file.getName() + ".tmp");
        Files.write(temporary.toPath(), value.toString().getBytes(StandardCharsets.UTF_8));
        Files.move(temporary.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
    }
}
