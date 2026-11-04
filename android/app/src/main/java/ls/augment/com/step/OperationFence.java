package ls.augment.com.step;

/** Late binder replies cannot commit an abandoned operation or reopen a closed workspace. */
public final class OperationFence {
    private long sequence;
    private boolean busy, closed;
    public synchronized long begin() {
        if (closed || busy) throw new IllegalStateException("workspace busy or closed");
        busy = true; return ++sequence;
    }
    public synchronized boolean current(long ticket) { return !closed && busy && ticket == sequence; }
    public synchronized boolean complete(long ticket) {
        if (!current(ticket)) return false;
        busy = false; return true;
    }
    public synchronized void close() { closed = true; busy = false; sequence++; }
    public synchronized boolean busy() { return busy; }
    public synchronized boolean closed() { return closed; }
}
