package ls.augment.com;

import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Always-on workbench witnesses contain identifiers and state, never Intent/media payloads. */
public final class AtomicWorkbenchLogPolicy {
    public static final String FEATURE = "ATOMIC_WORKBENCH", FILE = "detail-ATOMIC_WORKBENCH.log";
    private static final int MAX_INPUT = 4096, MAX_VALUE = 1536, MAX_STACK = 1536;
    private static final Pattern EVENT = Pattern.compile("(?:^|\\s)(ATOMIC_[A-Z0-9_]{1,72})(?=$|[\\s;])");
    private static final Pattern FIELD = Pattern.compile("(?:^|[\\s;|])([A-Za-z][A-Za-z0-9_]*)=([^\\s;|]+)");
    private static final Pattern PRIVATE = Pattern.compile("(?i)(?:^|[\\s;|,{?&])['\"]?(?:[a-z0-9]+_)*(?:token|password|passwd|secret|authorization|credential|account|extras|clipdata|payload|content|data|wallpaperuri|wallpapername)(?:_[a-z0-9]+)*['\"]?\\s*[:=]");
    private static final Set<String> FIELDS = Set.of(
            "seq", "wall", "elapsed", "session", "dropped", "thread", "event", "stage", "phase", "reason", "state", "status", "source",
            "task", "taskId", "homeTask", "previous_task", "target_task", "actual_task", "observed_task", "nativeHome", "component", "package",
            "window", "windowId", "user", "userId", "display", "displayId", "source_display", "target_display", "observed_display", "manager_display", "launch_display",
            "success", "result", "native_result", "error", "errorClass", "auth", "branch", "gesture", "container", "interface_matched", "gesture_runtime",
            "firstFrame", "frame", "first_frame", "firstFrameState", "frameElapsed", "firstFrameElapsed", "latencyMs", "durationMs", "frameCount",
            "input", "action", "actionMasked", "inputResult", "inputSuccess", "eventTime", "downTime", "pointerCount", "device", "deviceId", "inputSource",
            "recents", "recentsResult", "recents_display", "recents_task", "switchResult", "switchState", "from_window", "to_window", "from_display", "to_display",
            "width", "height", "rotation", "surface", "surfaceGeneration", "generation", "ready", "visible", "focused", "primary_home_focus", "recovery_pending",
            "currentCompatible", "currentEngine", "fallbackEngine", "currentEngineReference", "fallbackEngineReference", "fallbackCompatible", "connected", "shown",
            "engineAttached", "wallpaperState", "wallpaperSource", "currentShown", "fallbackShown", "currentSurface", "fallbackSurface", "attempt", "count", "registered",
            "home_task", "home_drawn", "wallpaper_drawn", "home_surface_ready", "wallpaper_interface_ready", "wallpaper_frame_verified", "readiness_state", "readiness_error",
            "home_transfer", "retained_display", "connector_reused", "observed_elapsed", "build", "route_session", "side", "config_revision",
            "readiness_started_uptime", "home_drawn_uptime", "wallpaper_drawn_uptime", "draw_evidence",
            "tokenPresent", "clientVisible", "target", "decors", "initializationCount", "remaining", "remainingTokens",
            "observation_trigger", "probe_delay_ms", "readiness_age_ms", "interface_observer", "elapsed_ms", "scanned", "scan_limited",
            "input_action", "copy_action", "consumer_class", "unchecked_consumer_class", "in_swipe_region", "gesture_state_present",
            "stream_down_time", "delegate_chain_status", "delegate_chain_classes", "delegate_chain_states", "delegate_leaf_class",
            "first_active_delegate_state_class", "requested_synthetic", "running_task", "running_display", "transition",
            "field_mask", "remote_present", "remote_error", "has_session", "has_guidance",
            "owner_id", "diag_abi", "server_pid", "boot_id", "hook_bits", "diag_dropped", "install_stage", "install_failure",
            "attempt_seq", "caller_uid", "caller_pid", "root_pid", "registration_generation", "binding_id", "binding_state",
            "first_gate", "first_stage", "visited_mask", "passed_mask", "observed_fields", "permission_override",
            "original_state", "add_result", "throw_kind", "registry_state", "suppressed", "allowed_private", "fit_types",
            "a_type", "a_width", "a_height", "a_flags", "a_private", "a_x", "a_y", "a_dim", "a_animation",
            "a_format", "a_alpha", "a_soft", "a_gravity", "a_insets");

    private AtomicWorkbenchLogPolicy() { }

    public static boolean level(String level) {
        return "INFO".equals(level) || "WARN".equals(level) || "ERROR".equals(level);
    }

    public static boolean runtime(String feature, String level) {
        return FEATURE.equals(feature) && level(level);
    }

    public static boolean accepts(String message) {
        return message != null && message.startsWith("ATOMIC_") && EVENT.matcher(bounded(message, MAX_INPUT)).find();
    }

    /** Re-applied at the receiving provider; unknown fields and opaque payload tails never reach disk. */
    public static String safe(String message) {
        String input = bounded(message == null ? "" : message, MAX_INPUT).replace('\r', ' ').replace('\n', ' ');
        Matcher privateField = PRIVATE.matcher(input);
        if (privateField.find()) input = input.substring(0, privateField.start());
        StringBuilder output = new StringBuilder();
        Matcher event = EVENT.matcher(input);
        if (!event.find()) return "";
        output.append(event.group(1));
        Matcher fields = FIELD.matcher(input);
        int count = 0;
        while (fields.find() && count++ < 64) {
            String key = fields.group(1), value = fields.group(2);
            if (!FIELDS.contains(key) || !value.matches("[A-Za-z0-9_.$:/,+-]{1,160}")) continue;
            String field = key + '=' + value;
            if (output.length() + field.length() + 1 > MAX_VALUE) break;
            if (output.length() > 0) output.append(' ');
            output.append(field);
        }
        return output.toString();
    }

    public static String errorType(Throwable error) {
        return error == null ? "" : className(error.getClass().getName());
    }

    public static String className(String value) {
        return value != null && value.matches("[A-Za-z0-9_.$]{1,160}") ? value : "";
    }

    /** Exception messages can contain app content. Keep only types and bounded source frames. */
    public static String stack(Throwable error) {
        StringBuilder output = new StringBuilder();
        for (int cause = 0; error != null && cause < 3; cause++) {
            String type = (cause > 0 ? " <- " : "") + error.getClass().getName();
            if (output.length() + type.length() > MAX_STACK) break;
            output.append(type);
            StackTraceElement[] frames = error.getStackTrace();
            for (int i = 0; i < Math.min(12, frames.length); i++) {
                String frame = " at " + frames[i];
                if (output.length() + frame.length() > MAX_STACK) break;
                output.append(frame);
            }
            Throwable next = error.getCause();
            if (next == error) break;
            error = next;
        }
        return safeStack(output.toString());
    }

    public static String safeStack(String text) {
        if (text == null || text.isEmpty()) return "";
        if (text.length() > MAX_STACK) return "[stack_omitted]";
        // Parse types and frames; accepting arbitrary printable words could retain exception messages.
        String[] causes = text.split(" <- ", -1);
        if (causes.length > 3) return "[stack_omitted]";
        for (String cause : causes) {
            String[] parts = cause.split(" at ", -1);
            if (className(parts[0]).isEmpty() || parts.length > 13) return "[stack_omitted]";
            for (int i = 1; i < parts.length; i++)
                if (!parts[i].matches("[A-Za-z0-9_.$/<>]+\\((?:[A-Za-z0-9_.$:-]+|Native Method|Unknown Source)\\)"))
                    return "[stack_omitted]";
        }
        return text;
    }

    private static String bounded(String value, int limit) {
        if (value.length() <= limit) return value;
        int end = limit;
        if (Character.isHighSurrogate(value.charAt(end - 1))) end--;
        return value.substring(0, end);
    }
}
