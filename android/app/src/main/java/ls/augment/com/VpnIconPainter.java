package ls.augment.com;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.RectF;

/** Shared editor/SystemUI VPN artwork using the existing Bluetooth vector ring. */
public final class VpnIconPainter {
    public static final float VIEWPORT_SIZE = StatusBarRingPainter.VIEWPORT_SIZE;
    private final StatusBarRingPainter ring = new StatusBarRingPainter();

    /** Keep the editor/SystemUI constructor API; vector artwork needs no resources. */
    public VpnIconPainter(Context context) {}

    public boolean isReady() { return true; }

    public static void inkBounds(RectF bounds) { StatusBarRingPainter.inkBounds(bounds); }

    public boolean draw(Canvas canvas, float x, float y, float width, float height, int color) {
        if (width <= 0 || height <= 0) return false;
        float scale = Math.min(width / VIEWPORT_SIZE, height / VIEWPORT_SIZE);
        int save = canvas.save();
        try {
            canvas.translate(x + (width - VIEWPORT_SIZE * scale) / 2,
                    y + (height - VIEWPORT_SIZE * scale) / 2);
            canvas.scale(scale, scale);
            ring.drawFull(canvas, 0, 0, color);
        } finally { canvas.restoreToCount(save); }
        return true;
    }
}
