package ls.augment.com.step;

import java.util.ArrayList;

/** Every submitted surface must acknowledge before input or recovery ownership is released. */
public final class CommitBarrier {
    private final ArrayList<Boolean> commits = new ArrayList<>();
    private boolean sealed, cancelled;
    public synchronized int add() {
        if (sealed || cancelled) throw new IllegalStateException("commit group closed");
        commits.add(false); return commits.size()-1;
    }
    public synchronized void commit(int index) {
        if (!cancelled && index >= 0 && index < commits.size()) commits.set(index, true);
    }
    public synchronized void seal() { sealed = true; }
    public synchronized void cancel() { cancelled = true; }
    public synchronized boolean ready() { return sealed && !cancelled && !commits.contains(false); }
}
