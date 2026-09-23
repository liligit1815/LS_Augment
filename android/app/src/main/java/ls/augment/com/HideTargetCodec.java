package ls.augment.com;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Objects;
import java.util.regex.Pattern;

/** Versioned selection data. Parsing never turns a saved user number into an identity. */
public final class HideTargetCodec {
    public static final int MAX_LENGTH = 64 * 1024;
    private static final Pattern NUMBER = Pattern.compile("0|[1-9][0-9]*");
    private static final Pattern PACKAGE = Pattern.compile(
            "[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+");

    private HideTargetCodec() { }

    /** Immutable value; the manager's Target subtype adds no identity fields. */
    public static class Entry {
        public final int userId;
        public final long userSerial;
        public final String packageName;
        public final boolean confirmed;

        public Entry(int userId, long userSerial, String packageName, boolean confirmed) {
            this.userId = userId;
            this.userSerial = userSerial;
            this.packageName = packageName == null ? "" : packageName;
            this.confirmed = confirmed;
        }

        public boolean isValid() {
            return userId >= 0 && userId <= 99999 && userSerial >= -1
                    && (!confirmed || userSerial >= 0)
                    && packageName.length() <= 255 && PACKAGE.matcher(packageName).matches();
        }

        public boolean isBound() { return isValid() && confirmed && userSerial >= 0; }

        public Entry asPending() { return new Entry(userId, userSerial, packageName, false); }

        /** Same display slot, not necessarily the same user instance or authorization. */
        public boolean sameTarget(Entry other) {
            return other != null && userId == other.userId && packageName.equals(other.packageName);
        }

        public String encode() {
            if (!isValid()) throw new IllegalArgumentException("应用选择包含无效身份或包名");
            if (userSerial < 0) return toString();
            return (confirmed ? "v3:" : "p3:") + userId + ":" + userSerial + ":" + packageName;
        }

        /** Human-readable legacy label; never use this as a bound execution record. */
        @Override public String toString() { return userId + ":" + packageName; }

        @Override public boolean equals(Object other) {
            if (!(other instanceof Entry)) return false;
            Entry value = (Entry) other;
            return userId == value.userId && userSerial == value.userSerial
                    && confirmed == value.confirmed && packageName.equals(value.packageName);
        }

        @Override public int hashCode() {
            return Objects.hash(userId, userSerial, packageName, confirmed);
        }
    }

    public static final class Selection {
        public final boolean valid;
        public final String raw;
        public final String message;
        public final List<Entry> entries;

        private Selection(boolean valid, String raw, String message, Collection<Entry> entries) {
            this.valid = valid;
            this.raw = raw;
            this.message = message;
            this.entries = Collections.unmodifiableList(new ArrayList<>(entries));
        }
    }

    /**
     * Legacy rows remain pending. A single malformed/unknown row rejects the whole
     * selection while retaining raw; callers must not treat invalid as empty.
     * Newline separators are accepted for archived Root lists; writes use ';'.
     */
    public static Selection parse(String source) {
        String raw = source == null ? "" : source;
        if (raw.length() > MAX_LENGTH) return invalid(raw, "应用选择超过允许长度，原文已保留");
        if (raw.isEmpty()) return new Selection(true, raw, "", Collections.emptyList());
        LinkedHashSet<Entry> entries = new LinkedHashSet<>();
        String[] rows = raw.split(";|\\r\\n|\\n|\\r", -1);
        for (int i = 0; i < rows.length; i++) {
            String row = rows[i];
            // A Root text file may end in one line terminator, not an empty entry.
            if (row.isEmpty() && i == rows.length - 1
                    && (raw.endsWith("\n") || raw.endsWith("\r"))) continue;
            Entry entry = parseEntry(row);
            if (entry == null) return invalid(raw, "应用选择包含未知版本或无效记录，原文已保留");
            entries.add(entry);
        }
        if (entries.isEmpty()) return invalid(raw, "应用选择不包含有效记录，原文已保留");
        return new Selection(true, raw, "", entries);
    }

    /** Parses one canonical record without querying Android or filling missing identity. */
    public static Entry parseEntry(String row) {
        if (row == null || row.isEmpty() || row.length() > 340) return null;
        String[] fields = row.split(":", -1);
        try {
            Entry entry;
            if (fields.length == 2 && NUMBER.matcher(fields[0]).matches()) {
                entry = new Entry(Integer.parseInt(fields[0]), -1, fields[1], false);
            } else if (fields.length == 4 && ("v3".equals(fields[0]) || "p3".equals(fields[0]))
                    && NUMBER.matcher(fields[1]).matches() && NUMBER.matcher(fields[2]).matches()) {
                entry = new Entry(Integer.parseInt(fields[1]), Long.parseLong(fields[2]), fields[3],
                        "v3".equals(fields[0]));
            } else return null;
            return entry.isValid() ? entry : null;
        } catch (NumberFormatException invalid) {
            return null;
        }
    }

    public static String encode(Collection<? extends Entry> values) {
        if (values == null) throw new IllegalArgumentException("应用选择不可用");
        LinkedHashSet<Entry> unique = new LinkedHashSet<>();
        for (Entry entry : values) {
            if (entry == null || !entry.isValid())
                throw new IllegalArgumentException("应用选择包含无效身份或包名");
            unique.add(entry);
        }
        List<Entry> sorted = new ArrayList<>(unique);
        sorted.sort(Comparator.comparingInt((Entry e) -> e.userId)
                .thenComparing(e -> e.packageName).thenComparingLong(e -> e.userSerial)
                .thenComparing(e -> e.confirmed));
        StringBuilder text = new StringBuilder();
        for (Entry entry : sorted) {
            if (text.length() > 0) text.append(';');
            text.append(entry.encode());
            if (text.length() > MAX_LENGTH) throw new IllegalArgumentException("应用选择超过允许长度");
        }
        return text.toString();
    }

    private static Selection invalid(String raw, String message) {
        return new Selection(false, raw, message, Collections.emptyList());
    }
}
