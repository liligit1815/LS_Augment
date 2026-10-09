package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.lang.ref.WeakReference;
import ls.augment.com.StatusBarThemeSpec;

/** One decoded drawable per displayed binding; encoded bytes may be shared, callbacks may not. */
final class StatusBarArtwork implements Drawable.Callback {
    private final Drawable drawable;
    private final float inkLeft, inkTop, inkWidth, inkHeight;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final WeakReference<View> target;
    private boolean disposed, running;
    private int tint;
    private int appliedAlpha=-1;
    private boolean colored;
    StatusBarArtwork(Drawable drawable, View target) {
        this(drawable, target, null);
    }
    StatusBarArtwork(Drawable drawable, View target, Rect inkBounds) {
        this.drawable = drawable;
        float left=0,top=0,width=0,height=0;
        if(inkBounds!=null&&drawable instanceof BitmapDrawable){
            Bitmap bitmap=((BitmapDrawable)drawable).getBitmap();
            if(bitmap!=null&&!bitmap.isRecycled()&&bitmap.getWidth()>0&&bitmap.getHeight()>0
                    &&!inkBounds.isEmpty()&&(inkBounds.left>0||inkBounds.top>0
                    ||inkBounds.right<bitmap.getWidth()||inkBounds.bottom<bitmap.getHeight())){
                float sx=Math.max(1,drawable.getIntrinsicWidth())/(float)bitmap.getWidth();
                float sy=Math.max(1,drawable.getIntrinsicHeight())/(float)bitmap.getHeight();
                left=inkBounds.left*sx;top=inkBounds.top*sy;width=inkBounds.width()*sx;height=inkBounds.height()*sy;
            }
        }
        inkLeft=left;inkTop=top;inkWidth=width;inkHeight=height;
        this.target = new WeakReference<>(target);
        drawable.setCallback(this);
    }
    /** Decode-worker only: retain PNG bytes and cache the nontransparent pixel extent once. */
    static Rect staticPngInkBounds(Drawable drawable,byte[] encoded){
        if(!(drawable instanceof BitmapDrawable)||encoded==null||encoded.length<8
                ||encoded[0]!=(byte)0x89||encoded[1]!=0x50||encoded[2]!=0x4e||encoded[3]!=0x47
                ||encoded[4]!=0x0d||encoded[5]!=0x0a||encoded[6]!=0x1a||encoded[7]!=0x0a)return null;
        try{
            Bitmap bitmap=((BitmapDrawable)drawable).getBitmap();
            if(bitmap==null||bitmap.isRecycled())return null;
            int width=bitmap.getWidth(),height=bitmap.getHeight();
            if(width<=0||height<=0||(long)width*height>1024*1024)return null;
            if(!bitmap.hasAlpha())return new Rect(0,0,width,height);
            int[] pixels=new int[width*height];bitmap.getPixels(pixels,0,width,0,0,width,height);
            int left=width,top=height,right=0,bottom=0;
            for(int y=0;y<height;y++)for(int x=0;x<width;x++)if((pixels[y*width+x]>>>24)!=0){
                left=Math.min(left,x);top=Math.min(top,y);right=Math.max(right,x+1);bottom=Math.max(bottom,y+1);
            }
            return right>left&&bottom>top?new Rect(left,top,right,bottom):null;
        }catch(RuntimeException|OutOfMemoryError ignored){return null;}
    }
    boolean animated() { return drawable instanceof AnimatedImageDrawable; }
    boolean running() { return !disposed && animated() && ((AnimatedImageDrawable)drawable).isRunning(); }
    void playing(boolean play) {
        if (disposed || !animated() || running == play) return;
        running = play;
        AnimatedImageDrawable animation = (AnimatedImageDrawable) drawable;
        if (play) { animation.setRepeatCount(AnimatedImageDrawable.REPEAT_INFINITE); animation.start(); }
        else { animation.stop(); main.removeCallbacksAndMessages(null); }
    }
    void draw(Canvas canvas, Rect area, StatusBarThemeSpec.Binding binding, int color, float density) {
        draw(canvas,area,binding,color,density,255);
    }
    void draw(Canvas canvas, Rect area, StatusBarThemeSpec.Binding binding, int color, float density,int nativeAlpha) {
        draw(canvas,area,binding,color,density,nativeAlpha,false);
    }
    void draw(Canvas canvas, Rect area, StatusBarThemeSpec.Binding binding, int color, float density,int nativeAlpha,boolean fitStaticPngInk) {
        if (disposed || area.isEmpty()) return;
        if (colored != !binding.originalColor || tint != color) {
            colored = !binding.originalColor; tint = color;
            drawable.setColorFilter(colored ? new PorterDuffColorFilter(color, PorterDuff.Mode.SRC_IN) : null);
        }
        // AnimatedImageDrawable invalidates even when setAlpha receives the same value.
        // Reapplying it from draw would make paused cover frames redraw continuously.
        int alpha=Math.round(Math.max(0,Math.min(255,nativeAlpha)) * binding.opacity / 100f);
        if(appliedAlpha!=alpha){appliedAlpha=alpha;drawable.setAlpha(alpha);}
        float width = Math.max(1, drawable.getIntrinsicWidth()), height = Math.max(1, drawable.getIntrinsicHeight());
        // Only the dual-SIM signal rows opt in. Animations retain their canvas to avoid frame jitter.
        boolean fitInk=fitStaticPngInk&&inkWidth>0&&inkHeight>0;
        float scale = Math.min(area.width() / (fitInk?inkWidth:width), area.height() / (fitInk?inkHeight:height)) * binding.scale / 100f;
        int save = canvas.save();
        try {
            canvas.clipRect(area);
            canvas.translate(area.exactCenterX() + binding.offsetX * density, area.exactCenterY() + binding.offsetY * density);
            canvas.scale(binding.mirror ? -scale : scale, scale);
            if(fitInk){
                canvas.translate(-inkLeft-inkWidth/2,-inkTop-inkHeight/2);
                drawable.setBounds(0,0,Math.round(width),Math.round(height));
            }else drawable.setBounds(Math.round(-width / 2), Math.round(-height / 2), Math.round(width / 2), Math.round(height / 2));
            drawable.draw(canvas);
        } finally { canvas.restoreToCount(save); }
    }
    void dispose() {
        if (disposed) return;
        playing(false); disposed = true;
        drawable.setCallback(null); target.clear(); main.removeCallbacksAndMessages(null);
    }
    @Override public void invalidateDrawable(Drawable who) {
        View view = target.get();
        if (disposed || view == null) { dispose(); return; }
        if (!view.isAttachedToWindow() || !view.isShown()) { playing(false); return; }
        view.postInvalidateOnAnimation();
    }
    @Override public void scheduleDrawable(Drawable who, Runnable what, long when) {
        if (!disposed && running) main.postAtTime(what, when);
    }
    @Override public void unscheduleDrawable(Drawable who, Runnable what) { main.removeCallbacks(what); }
}
