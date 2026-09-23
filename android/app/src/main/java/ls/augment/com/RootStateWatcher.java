package ls.augment.com;

import com.android.server.utils.Watchable;
import com.android.server.utils.Watcher;
import java.util.function.Consumer;

/**
 * The only module class loaded through the services-parent bridge loader.
 * Its callback is wrapped by RootWatcherBridgeFactory in the original module
 * loader; only boot-library types cross that loader boundary.
 */
public final class RootStateWatcher extends Watcher {
    private final Consumer<Object> callback;

    public RootStateWatcher(Consumer<Object> callback) {
        this.callback = callback;
    }

    @Override public void onChange(Watchable what) {
        callback.accept(what);
    }
}
