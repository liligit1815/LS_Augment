package ls.augment.com.hook;

/** One outstanding OEM write, with a bounded acknowledgement window. */
final class FanLevelCommand {
    enum Action { READY, WRITE, WAIT, FAIL }
    static final long ACK_TIMEOUT_MS = 3000L;
    private int level = -1;
    private long issuedAt;
    private boolean pending;
    private long confirmedAt = -1;

    Action observe(int requested, int actual, long now) {
        if (requested != level) {
            boolean superseding = pending;
            level = requested;
            if (actual == requested && !superseding) {
                pending = false;
                confirmedAt = now;
                return Action.READY;
            }
            // Even a return to the current native value must supersede an older
            // queued write; otherwise that older command could arrive later.
            pending = true;
            issuedAt = now;
            confirmedAt = -1;
            return Action.WRITE;
        }
        if (actual == requested) {
            if (pending || confirmedAt < 0) confirmedAt = now;
            pending = false;
            return Action.READY;
        }
        if (pending && now - issuedAt < ACK_TIMEOUT_MS) return Action.WAIT;
        // A confirmed level changed elsewhere, or the single write timed out.
        confirmedAt = -1;
        return Action.FAIL;
    }

    long confirmedDuration(long now) {
        return pending || confirmedAt < 0 ? 0 : Math.max(0, now - confirmedAt);
    }

    void reset() {
        level = -1;
        issuedAt = 0;
        pending = false;
        confirmedAt = -1;
    }
}
