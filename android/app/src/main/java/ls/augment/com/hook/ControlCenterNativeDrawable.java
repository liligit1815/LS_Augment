package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.graphics.*;
import android.graphics.drawable.Drawable;

/** Delegates native state/level/animation without cloning or owning the system drawable. */
abstract class ControlCenterNativeDrawable extends Drawable implements Drawable.Callback {
    final Drawable original;
    private Drawable.Callback previousCallback;
    ControlCenterNativeDrawable(Drawable original){this.original=original;}
    void bind(){if(original!=null){previousCallback=original.getCallback();original.setCallback(this);}}
    void release(){if(original!=null&&original.getCallback()==this)original.setCallback(previousCallback);previousCallback=null;}
    void drawNative(Canvas canvas){if(original!=null)original.draw(canvas);}
    @Override protected void onBoundsChange(Rect bounds){if(original!=null)original.setBounds(bounds);}
    @Override public void setAlpha(int alpha){if(original!=null)original.setAlpha(alpha);}
    @Override public int getAlpha(){return original==null?255:original.getAlpha();}
    @Override public void setColorFilter(ColorFilter filter){if(original!=null)original.setColorFilter(filter);}
    @Override public ColorFilter getColorFilter(){return original==null?null:original.getColorFilter();}
    @Override public void setTintList(ColorStateList tint){if(original!=null)original.setTintList(tint);}
    @Override public void setTintMode(PorterDuff.Mode mode){if(original!=null)original.setTintMode(mode);}
    @Override public boolean isStateful(){return original!=null&&original.isStateful();}
    @Override protected boolean onStateChange(int[] state){return original!=null&&original.setState(state);}
    @Override protected boolean onLevelChange(int level){return original!=null&&original.setLevel(level);}
    @Override public boolean setVisible(boolean visible,boolean restart){boolean changed=super.setVisible(visible,restart);return (original!=null&&original.setVisible(visible,restart))||changed;}
    @Override public void setHotspot(float x,float y){if(original!=null)original.setHotspot(x,y);}
    @Override public void setHotspotBounds(int l,int t,int r,int b){if(original!=null)original.setHotspotBounds(l,t,r,b);}
    @Override public boolean getPadding(Rect rect){return original!=null?original.getPadding(rect):super.getPadding(rect);}
    @Override public int getIntrinsicWidth(){return original==null?-1:original.getIntrinsicWidth();}
    @Override public int getIntrinsicHeight(){return original==null?-1:original.getIntrinsicHeight();}
    @Override public int getMinimumWidth(){return original==null?0:original.getMinimumWidth();}
    @Override public int getMinimumHeight(){return original==null?0:original.getMinimumHeight();}
    @Override public void getOutline(Outline outline){if(original!=null)original.getOutline(outline);}
    @Override public void jumpToCurrentState(){if(original!=null)original.jumpToCurrentState();}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    @Override public void invalidateDrawable(Drawable who){invalidateSelf();}
    @Override public void scheduleDrawable(Drawable who,Runnable task,long when){scheduleSelf(task,when);}
    @Override public void unscheduleDrawable(Drawable who,Runnable task){unscheduleSelf(task);}
}
