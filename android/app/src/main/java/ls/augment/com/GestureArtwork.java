package ls.augment.com;

import android.graphics.*;
import android.graphics.drawable.*;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.io.*;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;

/** Bounded decoding off the UI thread; animated sources retain their original encoded bytes. */
public final class GestureArtwork implements Drawable.Callback, View.OnAttachStateChangeListener {
    public static final int MAX_BYTES = 8 * 1024 * 1024;
    private final Drawable drawable;
    private boolean rendered;
    private boolean stopping;
    private final Bitmap bitmap;
    private final Canvas buffer;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private WeakReference<View> target = new WeakReference<>(null);
    private final Runnable timeout = this::stop;

    private GestureArtwork(Drawable source, boolean square, boolean mirror) {
        drawable = source;
        int w = Math.max(1, source.getIntrinsicWidth()), h = Math.max(1, source.getIntrinsicHeight());
        int width = square ? Math.max(w,h) : w, height = square ? Math.max(w,h) : h;
        bitmap = Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);
        buffer = new Canvas(bitmap);
        if (mirror) buffer.scale(-1,1,width/2f,height/2f);
        drawable.setBounds((width-w)/2,(height-h)/2,(width+w)/2,(height+h)/2);
        drawable.setCallback(this);
        frame();
    }
    public static byte[] read(InputStream in) throws IOException {
        if (in == null) throw new IOException("无法读取图片");
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] chunk = new byte[8192]; int n;
        while ((n=in.read(chunk))!=-1) {
            if (out.size()+n>MAX_BYTES) throw new IOException("图片不能超过 8 MiB");
            out.write(chunk,0,n);
        }
        return out.toByteArray();
    }
    public static GestureArtwork decode(byte[] bytes, boolean square, boolean mirror) throws IOException {
        if (bytes.length==0 || bytes.length>MAX_BYTES) throw new IOException("图片大小无效");
        Drawable image = ImageDecoder.decodeDrawable(ImageDecoder.createSource(ByteBuffer.wrap(bytes)),(decoder,info,source)->{
            int w=info.getSize().getWidth(),h=info.getSize().getHeight();
            if(w<1||h<1||w>4096||h>4096) throw new IllegalArgumentException("图片边长不能超过 4096 像素");
            int limit=square?512:1024;
            float scale=Math.min(1f,limit/(float)Math.max(w,h));
            decoder.setTargetSize(Math.max(1,Math.round(w*scale)),Math.max(1,Math.round(h*scale)));
            decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);
        });
        return new GestureArtwork(image,square,mirror);
    }
    public Bitmap frame() {
        if(rendered&&!animated())return bitmap;
        rendered=true;
        bitmap.eraseColor(Color.TRANSPARENT);
        drawable.draw(buffer);
        return bitmap;
    }
    public boolean animated() { return drawable instanceof AnimatedImageDrawable; }
    public void start(View view) {
        stop();
        if(!animated())return;
        target=new WeakReference<>(view);
        view.addOnAttachStateChangeListener(this);
        AnimatedImageDrawable animation=(AnimatedImageDrawable)drawable;
        animation.setRepeatCount(AnimatedImageDrawable.REPEAT_INFINITE);
        animation.start();
        // A missing OEM up/cancel callback must never leave a decoder running forever.
        handler.postDelayed(timeout,15000);
    }
    public void stop() {
        if(stopping)return;
        stopping=true;
        try{
            View view=target.get();target.clear();
            if(view!=null)view.removeOnAttachStateChangeListener(this);
            if(animated())((AnimatedImageDrawable)drawable).stop();
            handler.removeCallbacksAndMessages(null);
        }finally{stopping=false;}
    }
    @Override public void invalidateDrawable(Drawable who) {
        View view=target.get();
        if(view==null||!view.isAttachedToWindow()||!view.isShown()){stop();return;}
        view.postInvalidateOnAnimation();
    }
    @Override public void scheduleDrawable(Drawable who,Runnable what,long when) { handler.postAtTime(what,when); }
    @Override public void unscheduleDrawable(Drawable who,Runnable what) { handler.removeCallbacks(what); }
    @Override public void onViewAttachedToWindow(View view) { }
    @Override public void onViewDetachedFromWindow(View view) { stop(); }
}
