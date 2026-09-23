package ls.augment.com;

import android.graphics.*;
import android.graphics.drawable.Drawable;

/** Small exclamation glyph; UiKit supplies the larger, accessible hit area. */
final class FeatureHelpIcon extends Drawable {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final int color, size;
    FeatureHelpIcon(int color, int size) { this.color = color; this.size = size; }
    @Override public int getIntrinsicWidth() { return size; }
    @Override public int getIntrinsicHeight() { return size; }
    @Override public void draw(Canvas canvas) {
        Rect b = getBounds(); float cx=b.exactCenterX(), cy=b.exactCenterY(), r=Math.min(b.width(),b.height())*.43f;
        paint.setColor(color); paint.setStyle(Paint.Style.STROKE); paint.setStrokeWidth(Math.max(1, r*.13f));
        canvas.drawCircle(cx,cy,r,paint); paint.setStrokeCap(Paint.Cap.ROUND);
        canvas.drawLine(cx,cy-r*.46f,cx,cy+r*.10f,paint);
        paint.setStyle(Paint.Style.FILL); canvas.drawCircle(cx,cy+r*.46f,r*.095f,paint);
    }
    @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
    @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
