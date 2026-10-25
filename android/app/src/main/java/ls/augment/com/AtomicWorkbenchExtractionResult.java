package ls.augment.com;

/** No node, Binder credentials or source URI escapes into this immutable result. No content toString. */
public final class AtomicWorkbenchExtractionResult {
    public enum State { READY, UNAVAILABLE, REJECTED, CANCELLED, STALE, PROTECTED, NO_NODE, TOO_LARGE, TRAVERSAL_LIMIT, TIMEOUT, BUSY }
    public enum Kind { NODE_TEXT, NODE_DESCRIPTION, NONE }
    public final State state;
    public final Kind kind;
    public final String requestId, text, sourcePackage;
    public final int displayId, accessibilityWindowId, targetUid, taskId, left, top, right, bottom;
    private AtomicWorkbenchExtractionResult(AtomicWorkbenchExtractionRequest r, State state, Kind kind, String text,
            AtomicWorkbenchExtractionAuthority.Proof p, int l, int t, int right, int bottom) {
        requestId = r.id; this.state = state; this.kind = kind; this.text = text;
        sourcePackage = p == null ? null : p.packageName; displayId = p == null ? -1 : p.displayId;
        accessibilityWindowId = p == null ? -1 : p.accessibilityWindowId; targetUid = p == null ? -1 : p.targetUid;
        taskId = p == null ? -1 : p.taskId; left = l; top = t; this.right = right; this.bottom = bottom;
    }
    static AtomicWorkbenchExtractionResult ready(AtomicWorkbenchExtractionRequest r, Kind kind, String text,
            AtomicWorkbenchExtractionAuthority.Proof p, int l, int t, int right, int bottom) {
        if (p == null || kind == Kind.NONE || text == null || text.isBlank() || text.length() > AtomicWorkbenchExtractionPolicy.MAX_TEXT)
            throw new IllegalArgumentException("invalid_extraction_result");
        return new AtomicWorkbenchExtractionResult(r, State.READY, kind, text, p, l, t, right, bottom);
    }
    static AtomicWorkbenchExtractionResult failure(AtomicWorkbenchExtractionRequest r, State state) {
        if (state == State.READY) throw new IllegalArgumentException("invalid_extraction_failure");
        return new AtomicWorkbenchExtractionResult(r, state, Kind.NONE, null, null, 0, 0, 0, 0);
    }
}
