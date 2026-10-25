package ls.augment.com;

import android.app.Instrumentation;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONObject;

/** Developer-test evidence from current IMMS state, never from its input history. */
final class AtomicWorkbenchImeDeviceProbe {
    private static final int MAX_DUMP_BYTES = 512 * 1024;
    private static final long POLL_MS = 200L;

    private AtomicWorkbenchImeDeviceProbe() { }

    static JSONObject observeCurrent(Instrumentation instrumentation, String pkg, int uid, int display) throws Exception {
        ShellResult result = shell(instrumentation, "dumpsys input_method", MAX_DUMP_BYTES);
        return parseCurrent(result.text, pkg, uid, display, result.truncated);
    }

    static JSONObject awaitVisible(Instrumentation instrumentation, String pkg, int uid,
            int display, long timeout) throws Exception {
        validateTarget(pkg, uid, display);
        long started = SystemClock.uptimeMillis();
        long budget = Math.max(0L, Math.min(timeout, 60_000L));
        JSONObject last = new JSONObject().put("success", false).put("reason", "not_sampled");
        int samples = 0, stable = 0;
        do {
            try {
                ShellResult result = shell(instrumentation, "dumpsys input_method", MAX_DUMP_BYTES);
                last = parseCurrent(result.text, pkg, uid, display, result.truncated);
                samples++;
                stable = last.optBoolean("success", false) ? stable + 1 : 0;
                last.put("samples", samples).put("stable_samples", stable)
                        .put("elapsed_ms", SystemClock.uptimeMillis() - started);
                if (stable >= 2) return last;
            } catch (Exception error) {
                stable = 0;
                last = new JSONObject().put("success", false).put("current_only", true)
                        .put("reason", "probe_" + error.getClass().getSimpleName())
                        .put("samples", samples).put("stable_samples", stable);
            }
            long remaining = budget - (SystemClock.uptimeMillis() - started);
            if (remaining <= 0L) break;
            SystemClock.sleep(Math.min(POLL_MS, remaining));
        } while (SystemClock.uptimeMillis() - started <= budget);
        return last.put("success", false).put("timed_out", true)
                .put("elapsed_ms", SystemClock.uptimeMillis() - started);
    }

    /** Only fixed alphanumeric fixtures can enter the shell command. No IME settings change. */
    static void sendLatinText(Instrumentation instrumentation, int display, String value) throws Exception {
        if (display < 0 || value == null || !value.matches("[A-Za-z0-9]{1,96}"))
            throw new IllegalArgumentException("Expected a display and an alphanumeric sample");
        ShellResult result = shell(instrumentation, "input -d " + display + " text " + value, 4096);
        if (result.truncated || !result.text.trim().isEmpty())
            throw new IllegalStateException("Sample input command returned diagnostic output");
    }

    // Package-private so offline diagnostic fixtures can verify rejection of historical matches.
    static JSONObject parseCurrent(String dump, String pkg, int uid, int display,
            boolean truncated) throws Exception {
        validateTarget(pkg, uid, display);
        String all = dump == null ? "" : dump;
        int currentUser = integer(value(all, "mCurrentImeUserId", 2), -1);
        String repository = block(all, "mUserDataRepository:", 2);
        String userData = block(repository, "userId=" + currentUser, 4);
        String current = block(all, "UserId=" + currentUser, 2);
        String binding = block(current, "mBindingController:", 4);
        String visibility = block(current, "mVisibilityStateComputer:", 4);
        String focused = block(current, "mImeBindingState:", 4);
        String editor = block(userData, "curEditorInfo:", 6);

        String editorPackage = token(editor, "packageName", 8);
        int inputType = integer(token(editor, "inputType", 8), -1);
        String client = value(current, "mCurClient", 4);
        String repositoryClient = value(userData, "curClient", 6);
        String focusedClient = value(focused, "mFocusedWindowClient", 6);
        int actualUid = clientNumber(client, "mUid");
        int targetDisplay = clientNumber(client, "mSelfReportedDisplayId");
        boolean clientConsistent = clientId(client).length() > 0
                && clientId(client).equals(clientId(repositoryClient))
                && clientId(client).equals(clientId(focusedClient))
                && clientNumber(repositoryClient, "mUid") == uid
                && clientNumber(repositoryClient, "mSelfReportedDisplayId") == display
                && clientNumber(focusedClient, "mUid") == uid
                && clientNumber(focusedClient, "mSelfReportedDisplayId") == display;
        int imeDisplay = integer(value(binding, "mCurTokenDisplayId", 6), -1);
        int showDisplay = integer(value(binding, "mDisplayIdToShowIme", 6), -1);
        int windowVis = integer(value(binding, "mImeWindowVis", 6), -1);
        boolean inputShown = "true".equals(value(visibility, "mInputShown", 6));
        boolean hiddenByPolicy = !"false".equals(value(visibility, "mImeHiddenByDisplayPolicy", 6));
        String focusedToken = value(focused, "mFocusedWindow", 6);
        String targetToken = value(visibility, "mLastImeTargetWindow", 6);
        boolean tokenMatch = !focusedToken.isEmpty() && !"null".equals(focusedToken)
                && focusedToken.equals(targetToken);
        boolean visible = windowVis >= 0 && (windowVis & 2) != 0 && inputShown && !hiddenByPolicy;
        boolean targetMatches = pkg.equals(editorPackage) && inputType > 0 && actualUid == uid
                && targetDisplay == display && clientConsistent && tokenMatch;
        boolean success = !truncated && currentUser >= 0 && visible && targetMatches
                && imeDisplay == 0 && showDisplay == 0;
        String reason = truncated ? "dump_truncated" : currentUser < 0 ? "current_user_missing"
                : current.isEmpty() || userData.isEmpty() ? "current_sections_missing"
                : !targetMatches ? "current_editor_target_mismatch"
                : imeDisplay != 0 || showDisplay != 0 ? "ime_not_on_phone_display"
                : !visible ? "ime_not_visible" : "visible_on_phone_for_requested_editor";
        return new JSONObject().put("success", success).put("visible", visible)
                .put("reason", reason).put("current_only", true).put("dump_truncated", truncated)
                .put("ime_user_id", currentUser).put("ime_display_id", imeDisplay)
                .put("show_ime_display_id", showDisplay).put("ime_window_vis", windowVis)
                .put("input_shown", inputShown).put("hidden_by_display_policy", hiddenByPolicy)
                .put("target_display_id", targetDisplay).put("target_uid", actualUid)
                .put("editor_package", editorPackage).put("input_type", inputType)
                .put("current_client_consistent", clientConsistent).put("target_window_match", tokenMatch);
    }

    private static void validateTarget(String pkg, int uid, int display) {
        if (pkg == null || !pkg.matches("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+")
                || uid < 0 || display <= 0)
            throw new IllegalArgumentException("Expected fixture package, UID and virtual display");
    }

    /** Exact indentation keeps current-state lookup out of client lists and history blocks. */
    private static String block(String input, String title, int indent) {
        String[] lines = input.split("\\r?\\n", -1);
        int start = -1;
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < lines.length; i++) {
            String line = lines[i];
            if (start < 0) {
                if (indent(line) == indent && line.trim().equals(title)) start = i;
                continue;
            }
            if (!line.trim().isEmpty() && indent(line) <= indent) break;
            result.append(line).append('\n');
        }
        return result.toString();
    }

    private static int indent(String line) {
        int count = 0;
        while (count < line.length() && line.charAt(count) == ' ') count++;
        return count;
    }

    private static String value(String input, String name, int indent) {
        Matcher match = Pattern.compile("(?m)^ {" + indent + "}" + Pattern.quote(name)
                + "=([^\\r\\n]*)$").matcher(input);
        return match.find() ? match.group(1).trim() : "";
    }

    private static String token(String input, String name, int indent) {
        Matcher match = Pattern.compile("(?m)^ {" + indent + "}" + Pattern.quote(name)
                + "=([^\\s]+)").matcher(input);
        return match.find() ? match.group(1) : "";
    }

    private static int clientNumber(String client, String name) {
        Matcher match = Pattern.compile("(?:[ {])" + Pattern.quote(name) + "=(-?\\d+)(?:[ }]|$)")
                .matcher(client);
        return match.find() ? integer(match.group(1), -1) : -1;
    }

    private static String clientId(String client) {
        Matcher match = Pattern.compile("^ClientState\\{([0-9a-fA-F]+) ").matcher(client);
        return match.find() ? match.group(1) : "";
    }

    private static int integer(String text, int fallback) {
        try { return Integer.decode(text); }
        catch (RuntimeException ignored) { return fallback; }
    }

    private static final class ShellResult {
        final String text;
        final boolean truncated;
        ShellResult(String text, boolean truncated) { this.text = text; this.truncated = truncated; }
    }

    private static ShellResult shell(Instrumentation instrumentation, String command, int limit)
            throws Exception {
        ParcelFileDescriptor descriptor = instrumentation.getUiAutomation(
                android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).executeShellCommand(command);
        if (descriptor == null) throw new IllegalStateException("Missing shell descriptor");
        try (InputStream input = new ParcelFileDescriptor.AutoCloseInputStream(descriptor);
                ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int read;
            while (output.size() < limit && (read = input.read(buffer, 0,
                    Math.min(buffer.length, limit - output.size()))) >= 0) {
                if (read > 0) output.write(buffer, 0, read);
            }
            boolean truncated = output.size() == limit && input.read() >= 0;
            return new ShellResult(new String(output.toByteArray(), StandardCharsets.UTF_8), truncated);
        }
    }
}
