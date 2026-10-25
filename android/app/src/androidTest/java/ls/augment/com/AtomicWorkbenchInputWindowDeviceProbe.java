package ls.augment.com;

import android.app.Instrumentation;
import android.app.UiAutomation;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONObject;

/** Checks the current dispatcher handle, including the transform applied by launch animations. */
final class AtomicWorkbenchInputWindowDeviceProbe {
    private AtomicWorkbenchInputWindowDeviceProbe() { }

    static JSONObject awaitReady(Instrumentation instrumentation, String pkg, int uid,
            int display, int width, int height) throws Exception {
        long started = SystemClock.uptimeMillis();
        JSONObject last = new JSONObject();
        JSONObject lastUnready = null;
        int stable = 0, samples = 0;
        do {
            last = parseCurrent(dump(instrumentation), pkg, uid, display, width, height);
            samples++;
            stable = last.optBoolean("success") ? stable + 1 : 0;
            if (stable == 0) lastUnready = last;
            last.put("samples", samples).put("stable_samples", stable)
                    .put("elapsed_ms", SystemClock.uptimeMillis() - started);
            if (stable >= 2) return last.put("last_unready", lastUnready == null ? JSONObject.NULL : lastUnready);
            SystemClock.sleep(80L);
        } while (SystemClock.uptimeMillis() - started < 10_000L);
        throw new AssertionError("Sample input handle not ready: " + last);
    }

    static JSONObject parseCurrent(String dump, String pkg, int uid, int display, int width, int height)
            throws Exception {
        if (pkg == null || !pkg.matches("ls\\.augment\\.workbench\\.fixture\\.[a-z]+")
                || uid < 0 || display <= 0 || width <= 0 || height <= 0)
            throw new IllegalArgumentException("Expected isolated workbench sample identity");
        String dispatcher = section(dump, "Input Dispatcher State:", 0);
        String focused = section(dispatcher, "FocusedWindows:", 2);
        String windows = section(dispatcher, "Display: " + display, 2);
        String component = pkg + "/" + pkg + ".AtomicWorkbenchFixtureActivity";
        boolean dispatching = dispatcher.contains("  DispatchEnabled: true\n")
                && dispatcher.contains("  DispatchFrozen: false\n");
        boolean focusedDisplay = Pattern.compile("(?m)^  FocusedDisplayId: " + display + "$")
                .matcher(dispatcher).find();
        boolean focusedWindow = Pattern.compile("(?m)^    displayId=" + display + ", name='[^'\\r\\n]* "
                + Pattern.quote(component) + "'$").matcher(focused).find();
        Matcher handle = Pattern.compile("(?m)^      \\d+: name=[^\\r\\n]* " + Pattern.quote(component)
                + ", id=\\d+, displayId=" + display + ", inputConfig=0x0, alpha=1, frame=\\[0,0\\]\\["
                + width + "," + height + "\\], globalScale=1,[^\\r\\n]*ownerUid=" + uid
                + ",[^\\r\\n]*\\r?\\n      transform \\(ROT_0\\) \\(IDENTITY\\)$").matcher(windows);
        boolean identityHandle = handle.find();
        boolean unobstructed = identityHandle;
        if (identityHandle) {
            String preceding = windows.substring(0, handle.start());
            for (String line : preceding.split("\\r?\\n")) {
                if (line.matches("      \\d+: name=.*")
                        && !line.contains("NOT_TOUCHABLE") && !line.contains("NOT_VISIBLE")
                        && !line.contains("NO_INPUT_CHANNEL")) unobstructed = false;
            }
        }
        return new JSONObject().put("success", dispatching && focusedDisplay && focusedWindow
                        && identityHandle && unobstructed)
                .put("display_id", display).put("uid", uid).put("dispatching", dispatching)
                .put("focused_display", focusedDisplay).put("focused_window", focusedWindow)
                .put("identity_handle", identityHandle).put("unobstructed", unobstructed);
    }

    private static String section(String input, String title, int indent) {
        StringBuilder result = new StringBuilder();
        boolean found = false;
        for (String line : input.split("\\r?\\n")) {
            int spaces = 0;
            while (spaces < line.length() && line.charAt(spaces) == ' ') spaces++;
            if (!found) { if (spaces == indent && line.trim().equals(title)) found = true; continue; }
            if (!line.trim().isEmpty() && spaces <= indent) break;
            result.append(line).append('\n');
        }
        return result.toString();
    }

    private static String dump(Instrumentation instrumentation) throws Exception {
        ParcelFileDescriptor descriptor = instrumentation.getUiAutomation(
                UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).executeShellCommand("dumpsys input");
        if (descriptor == null) throw new IllegalStateException("Missing input dump descriptor");
        try (InputStream input = new ParcelFileDescriptor.AutoCloseInputStream(descriptor);
                ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] bytes = new byte[8192];
            int count;
            while ((count = input.read(bytes)) >= 0) {
                if (output.size() + count > 512 * 1024) throw new IllegalStateException("Input dump truncated");
                output.write(bytes, 0, count);
            }
            return new String(output.toByteArray(), StandardCharsets.UTF_8);
        }
    }
}
