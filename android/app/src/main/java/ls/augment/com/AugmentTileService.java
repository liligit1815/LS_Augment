package ls.augment.com;

import android.os.Handler;
import android.os.Looper;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;
import android.widget.Toast;

import java.util.concurrent.atomic.AtomicBoolean;

/** Quick Settings frontend backed by the APK-owned RootHideManager. */
public final class AugmentTileService extends TileService {
    private static final AtomicBoolean IN_FLIGHT = new AtomicBoolean();
    private final AtomicBoolean refreshing = new AtomicBoolean();
    private final AtomicBoolean refreshAgain = new AtomicBoolean();
    private final Handler main = new Handler(Looper.getMainLooper());
    private volatile boolean destroyed;
    private boolean unlocking;

    @Override public void onTileAdded() { super.onTileAdded(); refreshAsync(); }
    @Override public void onStartListening() { super.onStartListening(); unlocking = false; refreshAsync(); }
    @Override public void onDestroy() { destroyed = true; super.onDestroy(); }

    @Override
    public void onClick() {
        super.onClick();
        if (destroyed || unlocking) return;
        if (isLocked()) {
            unlocking = true;
            try {
                unlockAndRun(() -> {
                    unlocking = false;
                    if (!destroyed) toggleConfiguredApps();
                });
            } catch (RuntimeException error) { unlocking = false; }
        } else toggleConfiguredApps();
    }

    private void toggleConfiguredApps() {
        if (!new AppConfig(this).getBoolean(AppConfig.TILE_ENABLED)) {
            Tile tile = getQsTile();
            if (tile != null) {
                tile.setState(Tile.STATE_UNAVAILABLE);
                tile.updateTile();
            }
            return;
        }
        if (!IN_FLIGHT.compareAndSet(false, true)) return;
        Tile tile = getQsTile();
        if (tile != null) { tile.setState(Tile.STATE_INACTIVE); tile.updateTile(); }
        new Thread(() -> {
            RootHideManager.OperationResult completed;
            try {
                completed = new RootHideManager(this).toggleAll();
                AuditLog.write(this, "TILE", completed.message);
            } catch (RuntimeException error) {
                completed = RootHideManager.OperationResult.failure("操作未完成："
                        + error.getClass().getSimpleName());
            } finally {
                IN_FLIGHT.set(false);
            }
            RootHideManager.OperationResult result = completed;
            main.post(() -> {
                if (destroyed) return;
                Toast.makeText(this, result.message, Toast.LENGTH_LONG).show();
                refreshAsync();
            });
        }, "ls-augment-tile-action").start();
    }

    private void refreshAsync() {
        if (destroyed) return;
        if (!refreshing.compareAndSet(false, true)) { refreshAgain.set(true); return; }
        new Thread(() -> {
          try {
            RootHideManager manager = new RootHideManager(this);
            RootHideManager.RootStatus root = manager.rootStatus();
            RootHideManager.ConflictState conflict = root.state == RootHideManager.RootState.GRANTED
                    ? manager.conflictState() : new RootHideManager.ConflictState(false, false, "");
            RootHideManager.Summary summary = root.state == RootHideManager.RootState.GRANTED
                    ? manager.summary() : new RootHideManager.Summary(
                    RootHideManager.Aggregate.ERROR, 0, 0, 0, 0, 1);
            main.post(() -> { if (!destroyed && !IN_FLIGHT.get()) apply(root, conflict, summary); });
          } finally {
            main.post(() -> {
                refreshing.set(false);
                if (!destroyed && refreshAgain.getAndSet(false)) refreshAsync();
            });
          }
        }, "ls-augment-tile-refresh").start();
    }

    private void apply(RootHideManager.RootStatus root,
            RootHideManager.ConflictState conflict, RootHideManager.Summary summary) {
        Tile tile = getQsTile();
        if (tile == null) return;
        if (!new AppConfig(this).getBoolean(AppConfig.TILE_ENABLED)) {
            tile.setState(Tile.STATE_UNAVAILABLE);
            tile.updateTile();
            return;
        }
        String state = summary.aggregate.name();
        TilePresentation.apply(this, tile, state);
        if (root.state != RootHideManager.RootState.GRANTED || conflict.hasConflict()
                || summary.aggregate == RootHideManager.Aggregate.EMPTY) {
            tile.setState(Tile.STATE_UNAVAILABLE);
        } else if (summary.aggregate == RootHideManager.Aggregate.ALL_VISIBLE) {
            tile.setState(Tile.STATE_ACTIVE);
        } else tile.setState(Tile.STATE_INACTIVE);
        tile.updateTile();
    }
}
