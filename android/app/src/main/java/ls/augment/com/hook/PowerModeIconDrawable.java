package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;

/** Small vector glyphs: Android bootloader/userspace, recovery, Qualcomm EDL download. */
final class PowerModeIconDrawable extends Drawable {
    private final String mode;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private int alpha=255;
    PowerModeIconDrawable(String mode){this.mode=mode;}
    @Override public int getIntrinsicWidth(){return 96;}
    @Override public int getIntrinsicHeight(){return 96;}
    @Override public void draw(Canvas canvas){
        int save=canvas.save();
        try{
            canvas.translate(getBounds().exactCenterX(),getBounds().exactCenterY());
            float size=Math.min(getBounds().width(),getBounds().height())/48f;
            canvas.scale(size,size);canvas.translate(-24,-24);
            paint.setColor(0xffffffff);paint.setAlpha(alpha);paint.setStrokeWidth(1.9f);
            paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStyle(Paint.Style.STROKE);
            if("Recovery".equals(mode))recovery(canvas);
            else if("9008".equals(mode))edl(canvas);
            else android(canvas,"Fastbootd".equals(mode));
        }finally{canvas.restoreToCount(save);}
    }
    private void android(Canvas c,boolean userspace){
        c.drawArc(13,13,35,31,180,180,false,paint);
        c.drawLine(13,22,35,22,paint);
        c.drawLine(17,15,14,11,paint);c.drawLine(31,15,34,11,paint);
        c.drawRoundRect(14,24,34,34,2,2,paint);
        c.drawLine(10,25,10,32,paint);c.drawLine(38,25,38,32,paint);
        c.drawLine(19,35,19,39,paint);c.drawLine(29,35,29,39,paint);
        paint.setStyle(Paint.Style.FILL);c.drawCircle(19,19,1,paint);c.drawCircle(29,19,1,paint);
        if(userspace){
            paint.setTypeface(Typeface.create("sans-serif",Typeface.BOLD));
            paint.setTextAlign(Paint.Align.CENTER);paint.setTextSize(12);c.drawText("d",24,33,paint);
        }else{
            paint.setStyle(Paint.Style.STROKE);
            path(c,19,27,22,29,19,31);c.drawLine(25,31,29,31,paint);
        }
    }
    private void recovery(Canvas c){
        c.drawArc(10,10,38,38,-45,295,false,paint);
        path(c,31,10,35,14,39,10);
        c.drawLine(24,33,24,18,paint);path(c,18,24,24,18,30,24);
        c.drawLine(19,35,29,35,paint);
    }
    private void edl(Canvas c){
        c.drawRoundRect(14,14,34,34,3,3,paint);
        for(int p=18;p<=30;p+=6){
            c.drawLine(p,10,p,14,paint);c.drawLine(p,34,p,38,paint);
            c.drawLine(10,p,14,p,paint);c.drawLine(34,p,38,p,paint);
        }
        c.drawLine(24,18,24,28,paint);path(c,20,24,24,28,28,24);
        c.drawLine(20,31,28,31,paint);
    }
    private void path(Canvas c,float ax,float ay,float bx,float by,float cx,float cy){
        Path p=new Path();p.moveTo(ax,ay);p.lineTo(bx,by);p.lineTo(cx,cy);c.drawPath(p,paint);
    }
    @Override public void setAlpha(int value){alpha=value;invalidateSelf();}
    @Override public void setColorFilter(ColorFilter value){paint.setColorFilter(value);invalidateSelf();}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
}
