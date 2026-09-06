package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Fail-closed discovery and parsing for physical shoulder-key input devices. */
public final class RapidFireInputDetector {
    private static final Pattern NAME = Pattern.compile("^N:\\s+Name=\\\"(.*)\\\"$");
    private static final Pattern EVENT_HANDLER = Pattern.compile("\\bevent([0-9]+)\\b");
    private static final Pattern RAW_KEY_EVENT = Pattern.compile(
            "(?im)^.*?(/dev/input/event[0-9]+):\\s+(?:\\[[^\\]\\r\\n]+\\]\\s+)?0001\\s+"
                    + "([0-9a-f]{4,8})\\s+([0-9a-f]{8})\\s*$");

    private RapidFireInputDetector() { }

    public static final class Device {
        public final String path;
        public final String name;

        Device(String path, String name) {
            this.path = path;
            this.name = name;
        }
    }

    public static final class Capture {
        public final String path;
        public final String name;
        public final int code;

        Capture(String path, String name, int code) {
            this.path = path;
            this.name = name;
            this.code = code;
        }
    }

    /**
     * Discovers only input sources that explicitly identify themselves as gaming shoulder
     * triggers. Generic touchscreens, GPIO keys and volume/power devices are never candidates.
     */
    public static List<Device> discover(String procInputDevices) {
        if (procInputDevices == null || procInputDevices.trim().isEmpty()) {
            return Collections.emptyList();
        }
        ArrayList<Device> devices = new ArrayList<>();
        String name = null;
        String event = null;
        for (String raw : procInputDevices.split("\\r?\\n", -1)) {
            String line = raw.trim();
            if (line.startsWith("I:") || line.isEmpty()) {
                addCandidate(devices, name, event);
                name = null;
                event = null;
                continue;
            }
            Matcher nameMatcher = NAME.matcher(line);
            if (nameMatcher.matches()) {
                name = nameMatcher.group(1).trim();
                continue;
            }
            if (line.startsWith("H:")) {
                Matcher eventMatcher = EVENT_HANDLER.matcher(line);
                if (eventMatcher.find()) event = "event" + eventMatcher.group(1);
            }
        }
        addCandidate(devices, name, event);
        return Collections.unmodifiableList(devices);
    }

    public static boolean isLikelyShoulderName(String name) {
        if (name == null) return false;
        String compact = name.toLowerCase(Locale.ROOT).replaceAll("[^a-z0-9]+", "");
        return compact.contains("tgk") || compact.contains("shoulder")
                || compact.contains("airtrigger") || compact.contains("gametrigger");
    }

    /** Accepts complete pairs from exactly one physical key; mixed sides are ambiguous. */
    public static Capture parseCapture(String geteventOutput, List<Device> allowedDevices) {
        if (geteventOutput == null || allowedDevices == null || allowedDevices.isEmpty()) {
            return null;
        }
        Map<String, Device> allowed = new LinkedHashMap<>();
        for (Device device : allowedDevices) {
            if (device != null && device.path != null && isLikelyShoulderName(device.name)) {
                allowed.put(device.path, device);
            }
        }
        Set<String> pressed = new LinkedHashSet<>();
        Capture completed = null;
        Matcher matcher = RAW_KEY_EVENT.matcher(geteventOutput);
        while (matcher.find()) {
            Device device = allowed.get(matcher.group(1));
            if (device == null) continue;
            try {
                int code = Integer.parseInt(matcher.group(2), 16);
                long value = Long.parseLong(matcher.group(3), 16);
                if (code <= 0 || code > 65535) continue;
                String key = device.path + ":" + code;
                if (value == 1L) {
                    pressed.add(key);
                } else if (value == 0L && pressed.remove(key)) {
                    if (completed != null && (!completed.path.equals(device.path)
                            || completed.code != code)) return null;
                    completed = new Capture(device.path, device.name, code);
                }
            } catch (Throwable ignored) {
                // Malformed or unexpected lines are ignored; absence of a pair fails closed.
            }
        }
        return completed;
    }

    private static void addCandidate(List<Device> out, String name, String event) {
        if (name == null || event == null || !isLikelyShoulderName(name)) return;
        String path = "/dev/input/" + event;
        for (Device existing : out) if (path.equals(existing.path)) return;
        out.add(new Device(path, name));
    }
}
