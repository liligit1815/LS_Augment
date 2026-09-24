package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

/** Retain changes immediately, coalesce identical events using monotonic time. */
final class LogRepeatPolicy {
    private final Map<String, Entry> recent = new LinkedHashMap<>();

    synchronized String record(String category, String message, long now) {
        Entry last = recent.get(category);
        long window = category.equals("CONFIG_SAVE") ? 5000L : 60000L;
        if (last != null && last.message.equals(message) && now >= last.at && now - last.at < window) {
            last.repeats++;
            return null;
        }
        String summary = last != null && last.repeats > 0
                ? " [previous_event_repeats=" + last.repeats + "]" : "";
        if (recent.size() >= 64 && last == null) recent.remove(recent.keySet().iterator().next());
        recent.put(category, new Entry(message, now));
        return message + summary;
    }

    private static final class Entry {
        final String message;
        final long at;
        long repeats;
        Entry(String message, long at) { this.message = message; this.at = at; }
    }
}
