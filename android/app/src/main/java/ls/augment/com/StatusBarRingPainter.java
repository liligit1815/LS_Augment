package ls.augment.com;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;

/** Crisp shared ring artwork for Bluetooth battery and VPN status-bar icons. */
public final class StatusBarRingPainter {
    public static final float VIEWPORT_SIZE = 18;
    public static final float STROKE_WIDTH = 2.1f;
    private static final float RING_LEFT = 2;
    private static final float RING_RIGHT = 16;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF oval = new RectF();

    public static void inkBounds(RectF bounds) {
        float halfStroke = STROKE_WIDTH / 2;
        bounds.set(RING_LEFT - halfStroke, RING_LEFT - halfStroke,
                RING_RIGHT + halfStroke, RING_RIGHT + halfStroke);
    }

    /** Bluetooth's existing dim track and clockwise battery arc. */
    public void drawBattery(Canvas canvas, float x, float y, int battery, int color) {
        prepare(x, y, color);
        paint.setAlpha(Math.round(((color >>> 24) & 255) * .23f));
        canvas.drawOval(oval, paint);
        paint.setColor(color);
        canvas.drawArc(oval, -90, 360 * battery / 100f, false, paint);
    }

    /** A full single ring, with the native icon color and alpha. */
    public void drawFull(Canvas canvas, float x, float y, int color) {
        prepare(x, y, color);
        canvas.drawOval(oval, paint);
    }

    private void prepare(float x, float y, int color) {
        oval.set(x + RING_LEFT, y + RING_LEFT, x + RING_RIGHT, y + RING_RIGHT);
        paint.setColor(color);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(STROKE_WIDTH);
        paint.setStrokeCap(Paint.Cap.BUTT);
    }
}
