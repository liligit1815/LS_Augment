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
            case "card-corners":
                path(canvas,4,9,4,4,9,4);path(canvas,15,4,20,4,20,9);
                path(canvas,20,15,20,20,15,20);path(canvas,9,20,4,20,4,15);break;
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
            case "module":
                // The Duo logo's two curved sails and hull, outlined for navigation.
                Path boat=new Path();boat.moveTo(6.5f,2.5f);
                boat.cubicTo(12.8f,3.8f,18.7f,9.5f,20.3f,16.6f);boat.lineTo(12.5f,18.1f);
                boat.cubicTo(13.1f,12.7f,10.1f,6.6f,6.5f,2.5f);boat.close();
                boat.moveTo(9.7f,8.5f);boat.cubicTo(10.6f,12.3f,11.1f,15.6f,10.7f,18.6f);
                boat.lineTo(3.5f,20.3f);boat.cubicTo(7.1f,16.6f,9.3f,12.8f,9.7f,8.5f);boat.close();
                boat.moveTo(2.5f,21.6f);boat.lineTo(22,17.4f);boat.lineTo(17.5f,22.2f);
                boat.cubicTo(17.1f,22.7f,16.3f,22.8f,15.3f,22.8f);boat.lineTo(7.7f,22.8f);
                boat.cubicTo(5.7f,22.8f,3.8f,22.4f,2.5f,21.6f);boat.close();canvas.drawPath(boat,paint);break;
            case "system":
                canvas.drawRoundRect(5,3,19,21,4,4,paint); path(canvas,10,6,14,6); path(canvas,10,18,14,18); break;
            case "scope":
                canvas.drawRoundRect(4,4,20,20,5,5,paint); canvas.drawCircle(12,12,4,paint);
                path(canvas,12,1,12,5); path(canvas,12,19,12,23); break;
            case "download":
                path(canvas,12,3,12,15); path(canvas,7,10,12,15,17,10); path(canvas,4,15,4,21,20,21,20,15); break;
            case "upload":
                path(canvas,12,16,12,3); path(canvas,7,8,12,3,17,8); path(canvas,4,15,4,21,20,21,20,15); break;
            case "reset":
                canvas.drawArc(4,4,20,20,-135,315,false,paint); path(canvas,4,3,4,9,10,9); break;
            case "heart":
                Path heart=new Path();heart.moveTo(12,21);heart.cubicTo(-7,8,6,-3,12,6);heart.cubicTo(18,-3,31,8,12,21);canvas.drawPath(heart,paint);break;
            case "people":
                canvas.drawCircle(9,7,3,paint);canvas.drawArc(3,13,15,25,180,180,false,paint);canvas.drawArc(14,4,20,10,-90,180,false,paint);canvas.drawArc(13,13,23,25,-90,90,false,paint);break;
            case "document":
                path(canvas,5,2,14,2,20,8,20,22,5,22,5,2);path(canvas,14,2,14,8,20,8);path(canvas,9,12,16,12);path(canvas,9,17,16,17);break;
            case "shield":
                Path shield=new Path();shield.moveTo(12,2);shield.lineTo(21,6);shield.cubicTo(21,14,20,18,12,22);shield.cubicTo(4,18,3,14,3,6);shield.close();canvas.drawPath(shield,paint);break;
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
