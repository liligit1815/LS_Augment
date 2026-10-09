package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/** An instance-local adapter; never intercepts ImageView/View rendering throughout SystemUI. */
final class StatusBarAssetDrawable extends Drawable implements Drawable.Callback {
    interface Painter { void draw(Canvas canvas,Rect area); }
    private final Drawable original;
    private final Painter painter;
    private int nativeAlpha;
    StatusBarAssetDrawable(Drawable original,Painter painter){
        this.original=original;this.painter=painter;nativeAlpha=original==null?255:original.getAlpha();
    }
    void attach(){if(original!=null)original.setCallback(this);}
    Drawable original(){return original;}
    int originalAlpha(){return original==null?nativeAlpha:original.getAlpha();}
    void release(){if(original!=null&&original.getCallback()==this)original.setCallback(null);}
    void drawOriginal(Canvas canvas){if(original!=null){original.setBounds(getBounds());original.draw(canvas);}}
    @Override public void draw(Canvas canvas){painter.draw(canvas,getBounds());}
    @Override protected void onBoundsChange(Rect bounds){if(original!=null)original.setBounds(bounds);}
    @Override public int getIntrinsicWidth(){return original==null?-1:original.getIntrinsicWidth();}
    @Override public int getIntrinsicHeight(){return original==null?-1:original.getIntrinsicHeight();}
    @Override public boolean isStateful(){return original!=null&&original.isStateful();}
    @Override protected boolean onStateChange(int[] state){return original!=null&&original.setState(state);}
    @Override protected boolean onLevelChange(int level){return original!=null&&original.setLevel(level);}
    @Override public boolean setVisible(boolean visible,boolean restart){boolean changed=super.setVisible(visible,restart);return (original!=null&&original.setVisible(visible,restart))||changed;}
    @Override public void setAlpha(int alpha){nativeAlpha=Math.max(0,Math.min(255,alpha));if(original!=null)original.setAlpha(alpha);}
    @Override public int getAlpha(){return nativeAlpha;}
    @Override public void setColorFilter(ColorFilter filter){if(original!=null)original.setColorFilter(filter);}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    @Override public void invalidateDrawable(Drawable who){invalidateSelf();}
    @Override public void scheduleDrawable(Drawable who,Runnable what,long when){scheduleSelf(what,when);}
    @Override public void unscheduleDrawable(Drawable who,Runnable what){unscheduleSelf(what);}
}
