package ls.augment.com;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/** Bounded pure content policy; it neither opens files nor deletes source content. */
final class AtomicWorkbenchContentPolicy {
    static final int MEDIA_LIMIT = 600, FILE_LIMIT = 1000, SNAPSHOT_LIMIT = 200, CLIPBOARD_LIMIT = 50;
    static final int TEXT_LIMIT = 32768, MAX_SELECTION = 16, MAX_HIDDEN = 20000;
    static final long REFRESH_TTL_MS = 30_000L;
    enum DateGroup { TODAY, YESTERDAY, LAST_SEVEN_DAYS, LAST_THIRTY_DAYS, EARLIER }
    private AtomicWorkbenchContentPolicy() { }

    static String mime(String value) {
        if (value == null || value.length() > 127 || !value.matches("[A-Za-z0-9!#$&^_.+-]+/[A-Za-z0-9!#$&^_.+-]+"))
            return "application/octet-stream";
        return value.toLowerCase(Locale.ROOT);
    }

    static String name(String value) {
        String cleaned = value == null ? "" : value.replaceAll("[\\p{Cntrl}/\\\\]", "_").trim();
        if (cleaned.isEmpty() || cleaned.equals(".") || cleaned.equals("..")) return "分享文件";
        int end = Math.min(cleaned.length(), 120);
        if (end < cleaned.length() && Character.isHighSurrogate(cleaned.charAt(end - 1))) end--;
        return cleaned.substring(0, end);
    }

    static String clipboardText(CharSequence value) {
        if (value == null) return "";
        if (value.length() > TEXT_LIMIT) throw new IllegalArgumentException("Clipboard text exceeds transfer limit");
        // Preserve intentional whitespace and cursor semantics; ignore a purely empty clip.
        String text = value.toString().replace("\u0000", "");
        return text.trim().isEmpty() ? "" : text;
    }

    static long copiedAt(long suppliedTimestamp, long now) {
        // Older clips remain valid indefinitely; reopening history must not rename yesterday
        // as today. Only missing/negative or implausibly future timestamps use this observation.
        long latest = now > Long.MAX_VALUE - 300_000L ? Long.MAX_VALUE : now + 300_000L;
        return suppliedTimestamp > 0 && suppliedTimestamp <= latest ? suppliedTimestamp : now;
    }

    static int limit(AtomicWorkbenchContentItem.Kind kind) {
        return kind == AtomicWorkbenchContentItem.Kind.MEDIA ? MEDIA_LIMIT
                : kind == AtomicWorkbenchContentItem.Kind.FILES ? FILE_LIMIT : CLIPBOARD_LIMIT;
    }

    static List<AtomicWorkbenchContentItem> merge(AtomicWorkbenchContentItem.Kind kind,
            List<AtomicWorkbenchContentItem> input, Set<String> hidden) {
        ArrayList<AtomicWorkbenchContentItem> sorted = new ArrayList<>();
        if (input != null) for (AtomicWorkbenchContentItem item : input)
            if (item != null && item.kind == kind && (hidden == null || !hidden.contains(item.historyKey()))) sorted.add(item);
        sorted.sort(Comparator.comparingLong((AtomicWorkbenchContentItem item) -> item.modifiedMillis).reversed()
                .thenComparing(item -> item.key));
        LinkedHashMap<String, AtomicWorkbenchContentItem> unique = new LinkedHashMap<>();
        for (AtomicWorkbenchContentItem item : sorted) {
            // A URI discovered by both MediaStore and a granted document source is represented once.
            String identity = item.kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD ? item.key : item.uri;
            unique.putIfAbsent(identity, item);
            if (unique.size() >= limit(kind)) break;
        }
        return List.copyOf(unique.values());
    }

    static DateGroup dateGroup(long timestamp, long now, ZoneId zone) {
        LocalDate current = Instant.ofEpochMilli(now).atZone(zone).toLocalDate();
        long days = ChronoUnit.DAYS.between(Instant.ofEpochMilli(timestamp).atZone(zone).toLocalDate(), current);
        if (days <= 0) return DateGroup.TODAY;
        if (days == 1) return DateGroup.YESTERDAY;
        if (days < 7) return DateGroup.LAST_SEVEN_DAYS;
        if (days < 30) return DateGroup.LAST_THIRTY_DAYS;
        return DateGroup.EARLIER;
    }
}
