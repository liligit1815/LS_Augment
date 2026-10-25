package ls.augment.com;

import java.util.UUID;
import java.util.function.BooleanSupplier;
import java.util.function.LongSupplier;

/** A single short-lived, one-use handoff of already extracted text. Contains no source authority. */
final class AtomicWorkbenchExtractionHandoff {
    static final long MAX_AGE_MS = 5000;
    static final class Value {
        final String requestId, text, sourcePackage, checksum;
        final long reset;
        Value(String requestId, String text, String sourcePackage, String checksum, long reset) {
            if (requestId == null || !requestId.matches("[0-9a-f]{32}") || checksum == null
                    || !checksum.matches("[0-9a-f]{64}") || reset < 0 || text == null || text.isBlank()
                    || text.length() > 32768 || !validText(text) || sourcePackage == null
                    || sourcePackage.length() > 256 || !sourcePackage.matches("[A-Za-z0-9_.]+"))
                throw new IllegalArgumentException("invalid_extracted_text");
            this.requestId = requestId; this.text = text; this.sourcePackage = sourcePackage;
            this.checksum = checksum; this.reset = reset;
        }
        private static boolean validText(String text) {
            for (int i = 0; i < text.length(); i++) {
                char c = text.charAt(i);
                if (Character.isHighSurrogate(c)) {
                    if (++i >= text.length() || !Character.isLowSurrogate(text.charAt(i))) return false;
                } else if (Character.isLowSurrogate(c)) return false;
            }
            return true;
        }
    }
    private final LongSupplier clock, reset;
    private final BooleanSupplier blocked;
    private String nonce;
    private Value value;
    private long offered;

    AtomicWorkbenchExtractionHandoff(LongSupplier clock, LongSupplier reset, BooleanSupplier blocked) {
        if (clock == null || reset == null || blocked == null) throw new IllegalArgumentException("missing_handoff_clock");
        this.clock = clock; this.reset = reset; this.blocked = blocked;
    }
    synchronized String offer(Value next) {
        if (next == null || blocked.getAsBoolean() || next.reset != reset.getAsLong()) return null;
        long now = clock.getAsLong(); if (now < 0) return null;
        nonce = UUID.randomUUID().toString().replace("-", ""); value = next; offered = now;
        return nonce;
    }
    synchronized Value consume(String candidate) {
        if (!current()) { clear(); return null; }
        if (candidate == null || !candidate.equals(nonce)) return null;
        Value accepted = value; clear(); return accepted;
    }
    synchronized void expire(String candidate) { if (candidate != null && candidate.equals(nonce)) clear(); }
    synchronized void clear() { nonce = null; value = null; offered = -1; }
    private boolean current() {
        long now = clock.getAsLong();
        return value != null && now >= offered && now - offered <= MAX_AGE_MS
                && value.reset == reset.getAsLong() && !blocked.getAsBoolean();
    }
}
