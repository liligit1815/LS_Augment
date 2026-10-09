package ls.augment.com;

import android.database.ContentObserver;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;
import android.widget.Toast;

public final class ExtraDimTileService extends TileService {
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ContentObserver observer = new ContentObserver(main) {
        @Override public void onChange(boolean self) { read(); }
    };
    private boolean busy, listening;
    @Override public void onStartListening() {
        super.onStartListening();
        if (!listening) {
            getContentResolver().registerContentObserver(Settings.Secure.getUriFor(ExtraDimControl.ACTIVE), false, observer);
            getContentResolver().registerContentObserver(Settings.Secure.getUriFor(ExtraDimControl.LEVEL), false, observer);
            listening = true;
        }
        refresh();read();
    }
    @Override public void onStopListening() {
        if (listening) getContentResolver().unregisterContentObserver(observer);
        listening = false; super.onStopListening();
    }
    @Override public void onDestroy() { onStopListening(); super.onDestroy(); }
    @Override public void onClick() {
        super.onClick();
        if (isLocked()) unlockAndRun(this::toggle); else toggle();
    }
    private void toggle() {
        if (busy) return;
        busy = true;
        new Thread(() -> {
            boolean ok = ExtraDimControl.read(this) && ExtraDimControl.set(this, !ExtraDimControl.active(this), ExtraDimControl.strength(this));
            main.post(() -> {
                busy = false; refresh();
                if (!ok) Toast.makeText(this, "极暗设置未生效，请检查红魔Duo的 Root 授权", Toast.LENGTH_LONG).show();
            });
        }, "LSA-ExtraDimTile").start();
    }
    private boolean reading;
    private void read() {
        if(reading||busy)return;reading=true;
        new Thread(() -> {ExtraDimControl.read(this);main.post(() -> {reading=false;refresh();});},"LSA-ExtraDimRead").start();
    }
    private void refresh() {
        Tile tile = getQsTile(); if (tile == null) return;
        boolean enabled = ExtraDimControl.active(this);
        tile.setLabel("极暗"); tile.setSubtitle("强度 " + ExtraDimControl.strength(this) + "%");
        tile.setState(!ExtraDimControl.ready() ? Tile.STATE_UNAVAILABLE : enabled ? Tile.STATE_ACTIVE : Tile.STATE_INACTIVE);
        tile.setContentDescription("极暗，" + (enabled ? "已开启" : "已关闭") + "，长按调节强度");
        tile.updateTile();
    }
}
