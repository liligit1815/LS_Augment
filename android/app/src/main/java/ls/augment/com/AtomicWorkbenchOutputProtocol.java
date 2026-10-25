package ls.augment.com;

/** Serial output high-water fence, independent of tasks, rendering views and Android IPC. */
final class AtomicWorkbenchOutputProtocol {
    enum Decision { APPLY, DETACHED_ALREADY, STALE, REUSED, DETACH_REQUIRED }
    private long generation;
    private boolean desiredAttached, attached, known = true, pending;

    Decision begin(long next, boolean attach) {
        if (next <= 0 || next < generation) return Decision.STALE;
        if (next == generation) {
            if (attach || desiredAttached) return Decision.REUSED;
            if (!pending && known && !attached) return Decision.DETACHED_ALREADY;
        } else if (pending && attach) return Decision.DETACH_REQUIRED;
        generation = next; desiredAttached = attach; pending = true;
        return Decision.APPLY;
    }

    void completed(boolean attached) { this.attached = attached; known = true; pending = false; }
    void uncertain() { known = false; pending = true; }
    void externalAttached() { desiredAttached = true; completed(true); }
    void released() { desiredAttached = false; completed(false); }
    long generation() { return generation; }
    boolean attached() { return attached; }
    boolean known() { return known; }
    boolean pending() { return pending; }
    boolean acceptsInput() { return attached && known && !pending; }
}
