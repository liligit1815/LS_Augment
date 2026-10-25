package ls.augment.com;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.RectF;

/** Shared by the SystemUI overlay and the two phone-side previews. */
public final class IosSignalPainter {
    // Common ink bounds include the unavailable X, preserving the bar baseline across states.
    private static final Rect SOURCE = new Rect(8, 7, 55, 49);
    // The new dual-card artwork already contains tall upper bars and short lower dots.
    // Select each physical SIM's section rather than stacking the complete artwork twice.
    private static final Rect DUAL_UPPER = new Rect(8, 13, 55, 39);
    private static final Rect DUAL_LOWER = new Rect(8, 41, 55, 50);
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final RectF destination = new RectF();
    private int tint;
    private boolean hasTint;

    public boolean drawRow(Context context, Canvas canvas, float left, float top, float right, float bottom,
            int level, int bars, boolean unavailable, int foreground, Runnable invalidated) {
        return drawRow(context, canvas, left, top, right, bottom, level, bars, unavailable,
                foreground, 0, true, invalidated);
    }

    public boolean drawRow(Context context, Canvas canvas, float left, float top, float right, float bottom,
            int level, int bars, boolean unavailable, int foreground, int row, boolean single, Runnable invalidated) {
        if (!(right > left) || !(bottom > top)) return false;
        if (!single && row != 0 && row != 1) return false;
        Rect source = single ? SOURCE : row == 0 ? DUAL_UPPER : DUAL_LOWER;
        String name = IosSignalPolicy.filename(level, bars, unavailable, foreground, single);
        Bitmap bitmap = IosSignalAssets.cached(name);
        if (bitmap == null) { IosSignalAssets.ready(context, name, invalidated); return false; }
        float scale = Math.min((right - left) / source.width(), (bottom - top) / source.height());
        float width = source.width() * scale, height = source.height() * scale;
        float x = left + (right - left - width) / 2, y = top + (bottom - top - height) / 2;
        destination.set(x, y, x + width, y + height);
        if (!hasTint || tint != foreground) {
            tint = foreground; hasTint = true;
            paint.setColorFilter(new PorterDuffColorFilter(foreground, PorterDuff.Mode.SRC_IN));
        }
        canvas.drawBitmap(bitmap, source, destination, paint);
        return true;
    }
}
