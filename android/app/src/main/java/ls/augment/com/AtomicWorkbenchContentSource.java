package ls.augment.com;

import java.util.List;

/** Phone data boundary. A source never returns a successful empty list for a failed scan. */
interface AtomicWorkbenchContentSource extends AutoCloseable {
    enum State { READY, PARTIAL, PERMISSION_REQUIRED, LOCKED, UNAVAILABLE, ERROR }
    final class Result {
        final List<AtomicWorkbenchContentItem> items;
        final AtomicWorkbenchContentPermissionState permission;
        final State state;
        Result(List<AtomicWorkbenchContentItem> items, AtomicWorkbenchContentPermissionState permission, State state) {
            this.items = List.copyOf(items); this.permission = java.util.Objects.requireNonNull(permission);
            this.state = java.util.Objects.requireNonNull(state);
        }
        boolean replaceSnapshot() { return state == State.READY || state == State.PARTIAL; }
        @Override public String toString() { return "WorkbenchContentResult(" + state + ",count=" + items.size() + ')'; }
    }
    Result scan(AtomicWorkbenchContentItem.Kind kind);
    /** Register only while a repository is displayed; callback is a hint, not a data payload. */
    void start(Runnable changed);
    /** Pause observation without invalidating the source; a later start is allowed. */
    void stop();
    @Override void close();
}
