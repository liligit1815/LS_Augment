package ls.augment.com;

/** A void editing call is only dispatched; verified requires fresh content evidence. */
final class AtomicWorkbenchPasteResult {
    enum State { REJECTED, CANCELLED, DISPATCHED, VERIFIED, UNVERIFIED, FAILED }
    final String requestId, reason;
    final State state;
    final boolean located, dispatched, verified, focusRestored;

    AtomicWorkbenchPasteResult(String id, State state, String reason, boolean located,
            boolean dispatched, boolean focusRestored) {
        if (id == null || state == null || reason == null || !reason.matches("[a-z_]{1,64}")
                || state == State.VERIFIED && (!located || !dispatched)
                || dispatched && !(state == State.DISPATCHED || state == State.VERIFIED || state == State.UNVERIFIED))
            throw new IllegalArgumentException("invalid_paste_result");
        requestId = id; this.state = state; this.reason = reason; this.located = located;
        this.dispatched = dispatched; verified = state == State.VERIFIED; this.focusRestored = focusRestored;
    }

    AtomicWorkbenchPasteResult restoration(boolean restored) {
        return new AtomicWorkbenchPasteResult(requestId, state, reason, located, dispatched, restored);
    }
}
