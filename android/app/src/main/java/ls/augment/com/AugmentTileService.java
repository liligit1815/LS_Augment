package ls.augment.com;

import android.os.Handler;
import android.os.Looper;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;

import java.util.concurrent.atomic.AtomicBoolean;

/** Quick Settings frontend backed by the APK-owned RootHideManager. */
public final class AugmentTileService extends TileService {
    private static final AtomicBoolean IN_FLIGHT = new AtomicBoolean();
    private final Handler main = new Handler(Looper.getMainLooper());

    @Override public void onTileAdded() { super.onTileAdded(); refreshAsync(); }
    @Override public void onStartListening() { super.onStartListening(); refreshAsync(); }

    @Override
    public void onClick() {
        super.onClick();
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
            RootHideManager manager = new RootHideManager(this);
            RootHideManager.RootStatus root = manager.rootStatus();
            RootHideManager.OperationResult result;
            if (root.state != RootHideManager.RootState.GRANTED) {
                result = RootHideManager.OperationResult.failure(root.message);
            } else {
                RootHideManager.Summary summary = manager.summary();
                if (summary.aggregate == RootHideManager.Aggregate.ALL_VISIBLE) {
                    result = manager.hideAll(false);
                } else {
                    // ALL_HIDDEN / MIXED / ERROR recover to visible.
                    result = manager.showAll();
                }
            }
            AuditLog.write(this, "TILE", result.message);
            main.post(() -> {
                IN_FLIGHT.set(false);
                refreshAsync();
            });
        }, "ls-augment-tile-action").start();
    }

    private void refreshAsync() {
        new Thread(() -> {
            RootHideManager manager = new RootHideManager(this);
            RootHideManager.RootStatus root = manager.rootStatus();
            RootHideManager.ConflictState conflict = root.state == RootHideManager.RootState.GRANTED
                    ? manager.conflictState() : new RootHideManager.ConflictState(false, false, "");
            RootHideManager.Summary summary = root.state == RootHideManager.RootState.GRANTED
                    ? manager.summary() : new RootHideManager.Summary(
                    RootHideManager.Aggregate.ERROR, 0, 0, 0, 0, 1);
            main.post(() -> apply(root, conflict, summary));
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
