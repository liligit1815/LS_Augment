package ls.augment.com;

import android.view.Surface;
import java.util.concurrent.CancellationException;

/** The Binder waiter and an engine operation may finish in either order. */
final class AtomicWorkbenchSurfaceHandoff implements AutoCloseable {
    private Surface pending;
    private boolean claimed, closed;

    AtomicWorkbenchSurfaceHandoff(Surface surface) { pending = surface; }

    synchronized Surface take() {
        if (closed || claimed) throw new CancellationException("output_handoff_ended");
        claimed = true;
        Surface result = pending;
        pending = null;
        return result;
    }

    @Override public synchronized void close() {
        closed = true;
        Surface remaining = pending;
        pending = null;
        if (remaining != null) remaining.release();
    }
}
