package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.graphics.BlendMode;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/** Only the native fallback layer changes. The OEM resource identity remains nativeResource. */
final class WifiStandardDrawable extends Drawable implements Drawable.Callback {
    final int nativeResource;
    private final Drawable original, plain;
    private boolean hidden;
    WifiStandardDrawable(int resource, Drawable original, Drawable plain) {
        nativeResource=resource;this.original=original;this.plain=plain;
        setBounds(original.getBounds());setState(original.getState());setLevel(original.getLevel());
        setVisible(original.isVisible(),false);setAlpha(original.getAlpha());
        setColorFilter(original.getColorFilter());setLayoutDirection(original.getLayoutDirection());
        setAutoMirrored(original.isAutoMirrored());
    }
    Drawable original(){return original;}
    void attach(){original.setCallback(this);plain.setCallback(this);}
    void hidden(boolean value){if(hidden!=value){hidden=value;invalidateSelf();}}
    boolean hidden(){return hidden;}
    @Override public void draw(Canvas canvas){(hidden?plain:original).draw(canvas);}
    @Override protected void onBoundsChange(Rect bounds){original.setBounds(bounds);plain.setBounds(bounds);}
    @Override public int getIntrinsicWidth(){return original.getIntrinsicWidth();}
    @Override public int getIntrinsicHeight(){return original.getIntrinsicHeight();}
    @Override public int getMinimumWidth(){return original.getMinimumWidth();}
    @Override public int getMinimumHeight(){return original.getMinimumHeight();}
    @Override public boolean getPadding(Rect out){return original.getPadding(out);}
    @Override public void getOutline(Outline out){(hidden?plain:original).getOutline(out);}
    @Override public boolean isStateful(){return original.isStateful()||plain.isStateful();}
    @Override protected boolean onStateChange(int[] state){boolean a=original.setState(state);return plain.setState(state)||a;}
    @Override protected boolean onLevelChange(int level){boolean a=original.setLevel(level);return plain.setLevel(level)||a;}
    @Override public boolean onLayoutDirectionChanged(int direction){boolean a=original.setLayoutDirection(direction);return plain.setLayoutDirection(direction)||a;}
    @Override public boolean setVisible(boolean value,boolean restart){boolean a=super.setVisible(value,restart);boolean b=original.setVisible(value,restart);return plain.setVisible(value,restart)||a||b;}
    @Override public void setAlpha(int alpha){original.setAlpha(alpha);plain.setAlpha(alpha);}
    @Override public int getAlpha(){return original.getAlpha();}
    @Override public void setColorFilter(ColorFilter filter){original.setColorFilter(filter);plain.setColorFilter(filter);}
    @Override public ColorFilter getColorFilter(){return original.getColorFilter();}
    @Override public void setTintList(ColorStateList tint){original.setTintList(tint);plain.setTintList(tint);}
    @Override public void setTintMode(PorterDuff.Mode mode){original.setTintMode(mode);plain.setTintMode(mode);}
    @Override public void setTintBlendMode(BlendMode mode){original.setTintBlendMode(mode);plain.setTintBlendMode(mode);}
    @Override public void setAutoMirrored(boolean value){original.setAutoMirrored(value);plain.setAutoMirrored(value);}
    @Override public boolean isAutoMirrored(){return original.isAutoMirrored();}
    @Override public int getOpacity(){return original.getOpacity();}
    @Override public void jumpToCurrentState(){original.jumpToCurrentState();plain.jumpToCurrentState();}
    @Override public void invalidateDrawable(Drawable who){invalidateSelf();}
    @Override public void scheduleDrawable(Drawable who,Runnable what,long when){scheduleSelf(what,when);}
    @Override public void unscheduleDrawable(Drawable who,Runnable what){unscheduleSelf(what);}
}
