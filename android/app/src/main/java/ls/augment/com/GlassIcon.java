package ls.augment.com;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/** Small, consistent outline icons. Drawn as vectors at the device's own density. */
final class GlassIcon extends Drawable {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final String kind;
    GlassIcon(String kind, int color) {
        this.kind = kind; paint.setColor(color); paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(1.7f); paint.setStrokeCap(Paint.Cap.ROUND); paint.setStrokeJoin(Paint.Join.ROUND);
    }
    @Override public void draw(Canvas canvas) {
        Rect b = getBounds(); canvas.save(); canvas.translate(b.left, b.top);
        canvas.scale(b.width()/24f, b.height()/24f);
        switch (kind) {
            case "home":
                path(canvas, 3,10,12,3,21,10); path(canvas,5,9,5,21,10,21,10,14,14,14,14,21,19,21,19,9); break;
            case "about":
                canvas.drawCircle(12,12,9,paint); path(canvas,12,11,12,17);
                canvas.drawCircle(12,7.5f,.55f,paint); break;
            case "search":
                canvas.drawCircle(10.5f,10.5f,6.5f,paint); path(canvas,15.5f,15.5f,21,21); break;
            case "settings":
                path(canvas,4,6,20,6); path(canvas,4,12,20,12); path(canvas,4,18,20,18);
                circle(canvas,9,6); circle(canvas,16,12); circle(canvas,8,18); break;
            case "system":
                canvas.drawRoundRect(5,3,19,21,4,4,paint); path(canvas,10,6,14,6); path(canvas,10,18,14,18); break;
            case "scope":
                canvas.drawRoundRect(4,4,20,20,5,5,paint); canvas.drawCircle(12,12,4,paint);
                path(canvas,12,1,12,5); path(canvas,12,19,12,23); break;
            case "backup":
                path(canvas,5,5,19,5,21,10,21,20,3,20,3,10,5,5); path(canvas,3,10,8,10,9,13,15,13,16,10,21,10); break;
            case "arrow": path(canvas,9,5,16,12,9,19); break;
            default:
                canvas.drawRoundRect(3,3,10,10,2,2,paint); canvas.drawRoundRect(14,3,21,10,2,2,paint);
                canvas.drawRoundRect(3,14,10,21,2,2,paint); canvas.drawRoundRect(14,14,21,21,2,2,paint);
        }
        canvas.restore();
    }
    private void circle(Canvas canvas,float x,float y) {
        Paint cover = new Paint(paint); cover.setStyle(Paint.Style.FILL); cover.setColor(0xffe9f6ff);
        canvas.drawCircle(x,y,2.5f,cover); canvas.drawCircle(x,y,2.5f,paint);
    }
    private void path(Canvas canvas, float... points) {
        Path path = new Path(); path.moveTo(points[0],points[1]);
        for(int i=2;i<points.length;i+=2)path.lineTo(points[i],points[i+1]); canvas.drawPath(path,paint);
    }
    @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
    @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
