package ls.augment.com;

/** Pure policy, also exercised without Android. Indices are Android UTF-16 indices. */
final class AtomicWorkbenchPastePolicy {
    static final int MAX_TEXT = 32768, CONTEXT = 4096, MAX_READ = 16384;
    static final long MAX_DURATION = 15000;

    static String invalid(AtomicWorkbenchPasteRequest r, long now) {
        if (r == null || r.id == null || !r.id.matches("[0-9a-f]{32}") || r.session < 0
                || r.resetGeneration < 0 || r.uiEpoch < 0 || r.windowId < 0 || r.windowId > 7
                || r.displayId <= 0 || r.userId < 0 || r.moduleUid < 10000 || r.targetUid < 10000
                || r.moduleUid / 100000 != r.userId || r.targetUid / 100000 != r.userId || r.taskId < 0
                || !identifier(r.packageName, 256) || "ls.augment.com".equals(r.packageName)
                || !identifier(r.sourcePayloadId, 128) || r.sourceRevision < 0
                || !identifier(r.displayUniqueId, 512)
                || r.displayName == null || !r.displayName.matches("DuoAtomic-" + r.moduleUid + "-w" + r.windowId
                    + "-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")) return "invalid_identity";
        if (r.text == null || r.text.isEmpty() || r.text.length() > MAX_TEXT || !unicode(r.text)) return "invalid_text";
        if (r.createdAt < 0 || r.deadlineAt <= r.createdAt || r.deadlineAt - r.createdAt > MAX_DURATION
                || now < r.createdAt || now >= r.deadlineAt) return "deadline";
        return null;
    }

    static boolean identifier(String value, int max) {
        if (value == null || value.isEmpty() || value.length() > max) return false;
        for (int i = 0; i < value.length(); i++) if (Character.isISOControl(value.charAt(i))) return false;
        return true;
    }

    static boolean password(int type) {
        int cls = type & 15, variation = type & 4080;
        return cls == 1 && (variation == 128 || variation == 144 || variation == 224)
                || cls == 2 && variation == 16;
    }

    static boolean unicode(String value) {
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (Character.isHighSurrogate(c)) {
                if (++i >= value.length() || !Character.isLowSurrogate(value.charAt(i))) return false;
            } else if (Character.isLowSurrogate(c)) return false;
        }
        return true;
    }

    static boolean boundary(String text, int index) {
        return index >= 0 && index <= text.length() && (index == 0 || index == text.length()
                || !(Character.isHighSurrogate(text.charAt(index - 1)) && Character.isLowSurrogate(text.charAt(index))));
    }

    static final class Snapshot {
        final String text;
        final int start, end, offset;
        Snapshot(String text, int start, int end, int offset) {
            if (text == null || text.length() > MAX_READ || offset < 0
                    || !boundary(text, start) || !boundary(text, end) || !unicode(text)
                    || (long) offset + text.length() > Integer.MAX_VALUE)
                throw new IllegalArgumentException("invalid_surrounding_text");
            this.text = text; this.start = start; this.end = end; this.offset = offset;
        }
        boolean same(Snapshot other) {
            return other != null && offset == other.offset && start == other.start && end == other.end
                    && text.equals(other.text);
        }
    }

    static boolean verifies(Snapshot before, String insertion, Snapshot after) {
        if (before == null || after == null || insertion == null || after.start != after.end) return false;
        int lo = Math.min(before.start, before.end), hi = Math.max(before.start, before.end);
        long position = (long) before.offset + lo + insertion.length();
        if (position > Integer.MAX_VALUE || (long) after.offset + after.start != position) return false;
        String expected = before.text.substring(0, lo) + insertion + before.text.substring(hi);
        // Require the entire inserted text and up to 32 known characters on either side.
        int left = Math.max(0, lo - 32), right = Math.min(expected.length(), lo + insertion.length() + 32);
        long observedLeft = (long) before.offset + left - after.offset;
        long observedRight = (long) before.offset + right - after.offset;
        return observedLeft >= 0 && observedRight <= after.text.length()
                && expected.substring(left, right).equals(after.text.substring((int) observedLeft, (int) observedRight));
    }
    private AtomicWorkbenchPastePolicy() { }
}
