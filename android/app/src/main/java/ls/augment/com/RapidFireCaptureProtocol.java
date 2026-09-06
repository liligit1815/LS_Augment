package ls.augment.com;

import java.util.Collections;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Only events fenced before hardware restoration can become physical evidence. */
public final class RapidFireCaptureProtocol {
    private static final Pattern EVENT = Pattern.compile(
            "^\\[\\s*[0-9]+\\.[0-9]+\\]\\s+(0001)\\s+([0-9a-fA-F]{4,8})\\s+([0-9a-fA-F]{8})$");

    private RapidFireCaptureProtocol() { }

    public static boolean isComplete(String output, RapidFireInputDetector.Device target) {
        if (output == null || target == null || output.contains("LSA_CAPTURE_ERROR=")) return false;
        String source = singleValue(output, "LSA_CAPTURE_SOURCE=");
        String ready = singleValue(output, "LSA_CAPTURE_READY=");
        String end = singleValue(output, "LSA_CAPTURE_END=");
        String restored = singleValue(output, "LSA_CAPTURE_RESTORED=");
        return target.path.equals(source) && ready != null && ready.matches("[12]:[12]")
                && ready.equals(restored)
                && ("pair_received".equals(end) || "window_elapsed".equals(end))
                && output.indexOf("LSA_CAPTURE_SOURCE=") < output.indexOf("LSA_CAPTURE_READY=")
                && output.indexOf("LSA_CAPTURE_READY=") < output.indexOf("LSA_CAPTURE_END=")
                && output.indexOf("LSA_CAPTURE_END=") < output.indexOf("LSA_CAPTURE_RESTORED=");
    }

    /** Progress is provisional: callers MUST verify isComplete before saving any mapping. */
    public static RapidFireInputDetector.Capture observedPair(String output,
            RapidFireInputDetector.Device target) {
        if (output == null || target == null || output.contains("LSA_CAPTURE_ERROR=")) return null;
        if (!target.path.equals(singleValue(output, "LSA_CAPTURE_SOURCE="))) return null;
        String ready = singleValue(output, "LSA_CAPTURE_READY=");
        if (ready == null || !ready.matches("[12]:[12]")) return null;
        int start = output.indexOf('\n', output.indexOf("LSA_CAPTURE_READY="));
        if (start < 0 || output.indexOf("LSA_CAPTURE_SOURCE=") > start) return null;
        int end = output.indexOf("LSA_CAPTURE_END=");
        if (end < 0) end = output.length();
        if (end <= start) return null;
        StringBuilder events = new StringBuilder();
        for (String line : output.substring(start, end).split("\\r?\\n")) {
            Matcher event = EVENT.matcher(line.trim());
            if (event.matches()) events.append(target.path).append(": ")
                    .append(event.group(1)).append(' ').append(event.group(2)).append(' ')
                    .append(event.group(3)).append('\n');
        }
        return RapidFireInputDetector.parseCapture(events.toString(), Collections.singletonList(target));
    }

    private static String singleValue(String output, String prefix) {
        String result = null;
        for (String raw : output.split("\\r?\\n")) {
            String line = raw.trim();
            if (!line.startsWith(prefix)) continue;
            if (result != null) return null;
            result = line.substring(prefix.length());
        }
        return result;
    }
}
