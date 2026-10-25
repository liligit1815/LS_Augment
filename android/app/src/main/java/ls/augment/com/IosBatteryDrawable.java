package ls.augment.com;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/** One correctly indexed frame, preserving the supplied transparency and state colors. */
public final class IosBatteryDrawable extends Drawable {
    private final IosBatteryAssets.Sheet sheet;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Rect frame = new Rect();
    private final int width, height;
    private int batteryLevel;
    public IosBatteryDrawable(IosBatteryAssets.Sheet sheet, int level, float density) {
        this.sheet = sheet;
        width = Math.round(sheet.bitmap.getWidth() * density / 3f);
        height = Math.round(IosBatteryPolicy.FRAME_HEIGHT * density / 3f);
        updateLevel(level);
    }
    public void updateLevel(int level) {
        if (batteryLevel == level && !frame.isEmpty()) return;
        batteryLevel = level;
        int top = IosBatteryPolicy.frame(level, sheet.frames) * IosBatteryPolicy.FRAME_HEIGHT;
        frame.set(0, top, sheet.bitmap.getWidth(), top + IosBatteryPolicy.FRAME_HEIGHT);
        setLevel(Math.max(0, Math.min(100, level))); invalidateSelf();
    }
    @Override public void draw(Canvas canvas) { canvas.drawBitmap(sheet.bitmap, frame, getBounds(), paint); }
    @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
    @Override public int getAlpha() { return paint.getAlpha(); }
    @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    @Override public int getIntrinsicWidth() { return width; }
    @Override public int getIntrinsicHeight() { return height; }
}
