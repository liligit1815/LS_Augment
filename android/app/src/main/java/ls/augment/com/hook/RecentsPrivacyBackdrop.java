package ls.augment.com.hook;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Shader;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import ls.augment.com.GlassBackdropBlur;

/** Only small, already blurred pixels reach the Recents canvas. Native bitmaps are read-only. */
final class RecentsPrivacyBackdrop {
    static final int MAX_EDGE = 192;
    private static final ThreadPoolExecutor WORKER = new ThreadPoolExecutor(1,1,15,TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(4), runnable -> {
                Thread thread=new Thread(runnable,"Duo-RecentsBlur");thread.setDaemon(true);return thread;
            },new ThreadPoolExecutor.AbortPolicy());
    static { WORKER.allowCoreThreadTimeOut(true); }
    private final Map<View, Entry> entries = new WeakHashMap<>();
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Matrix matrix = new Matrix();
    private final AugmentModule module;
    private boolean errorLogged;

    RecentsPrivacyBackdrop(AugmentModule module) { this.module=module; }

    void clear() { entries.clear(); }
    void release(View view) { entries.remove(view); }

    void draw(View view, Object task, Bitmap source, Matrix nativeMatrix, Canvas canvas,
            float left,float top,float right,float bottom,float corner) {
        if(source!=null&&source.isRecycled())source=null;
        int generation=source==null?0:source.getGenerationId();
        Entry entry=entries.get(view);
        if(entry==null||entry.task.get()!=task||entry.source.get()!=source||entry.generation!=generation){
            entry=new Entry(task,source,generation);entries.put(view,entry);
        }
        if(source!=null&&entry.blurred==null&&!entry.pending&&!entry.failed)submit(view,entry,source);
        if(entry.blurred!=null){
            if(entry.shader==null)entry.shader=new BitmapShader(entry.blurred,Shader.TileMode.CLAMP,Shader.TileMode.CLAMP);
            if(nativeMatrix!=null&&source!=null){
                matrix.set(nativeMatrix);
                matrix.preScale((float)source.getWidth()/entry.blurred.getWidth(),(float)source.getHeight()/entry.blurred.getHeight());
            }else{
                float scale=Math.max((right-left)/entry.blurred.getWidth(),(bottom-top)/entry.blurred.getHeight());
                matrix.setScale(scale,scale);
                matrix.postTranslate((left+right-entry.blurred.getWidth()*scale)/2,(top+bottom-entry.blurred.getHeight()*scale)/2);
            }
            entry.shader.setLocalMatrix(matrix);paint.setShader(entry.shader);
        }else{
            // A protected/no-snapshot app has no pixels to blur. Never expose the
            // live surface or reuse a previous task's image while loading.
            paint.setShader(new LinearGradient(left,top,right,bottom,
                    new int[]{0xff384657,0xff77879b,0xff485b73},null,Shader.TileMode.CLAMP));
        }
        paint.setColor(0xffffffff);canvas.drawRoundRect(left,top,right,bottom,corner,corner,paint);
        paint.setShader(null);paint.setColor(0x24000000);
        canvas.drawRoundRect(left,top,right,bottom,corner,corner,paint);
    }

    private void submit(View view,Entry entry,Bitmap source){
        WeakReference<View> target=new WeakReference<>(view);entry.pending=true;
        try { WORKER.execute(()->{
            Bitmap blurred=null;Throwable failure=null;
            try { blurred=createBlur(source); }catch(RuntimeException|OutOfMemoryError error){failure=error;}
            Bitmap result=blurred;Throwable error=failure;View current=target.get();
            if(current!=null)current.post(()->{
                if(entries.get(current)!=entry)return;
                entry.pending=false;
                if(source.isRecycled()||source.getGenerationId()!=entry.generation){entries.remove(current);current.postInvalidateOnAnimation();return;}
                entry.blurred=result;entry.failed=result==null;
                if(error!=null&&!errorLogged){errorLogged=true;module.logFeatureError("RECENTS_PRIVACY_BLUR",error);}
                current.postInvalidateOnAnimation();
            });
        }); }catch(java.util.concurrent.RejectedExecutionException busy){
            entry.pending=false;view.postInvalidateDelayed(80);
        }
    }

    static Bitmap createBlur(Bitmap source){
        if(source==null||source.isRecycled())return null;
        Bitmap readable=source,small=null;
        try{
            // Hardware screenshots cannot be drawn into a software bitmap. The
            // readback and all filtering happen on the single bounded worker.
            if(source.getConfig()==Bitmap.Config.HARDWARE)readable=source.copy(Bitmap.Config.ARGB_8888,false);
            if(readable==null)return null;
            float scale=Math.min(1f,(float)MAX_EDGE/Math.max(readable.getWidth(),readable.getHeight()));
            int width=Math.max(1,Math.round(readable.getWidth()*scale)),height=Math.max(1,Math.round(readable.getHeight()*scale));
            small=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);
            Canvas canvas=new Canvas(small);canvas.drawColor(0xff384657);
            Paint filter=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
            canvas.drawBitmap(readable,null,new android.graphics.Rect(0,0,width,height),filter);
            int[] pixels=new int[width*height],scratch=new int[pixels.length];
            small.getPixels(pixels,0,width,0,0,width,height);
            GlassBackdropBlur.blur(pixels,scratch,width,height,Math.max(3,Math.round(Math.min(width,height)*.075f)));
            small.setPixels(pixels,0,width,0,0,width,height);
            return small;
        }catch(RuntimeException|OutOfMemoryError failure){if(small!=null)small.recycle();throw failure;}
        finally{if(readable!=source&&readable!=null)readable.recycle();}
    }

    private static final class Entry {
        final WeakReference<Object> task;
        final WeakReference<Bitmap> source;
        final int generation;
        Bitmap blurred;BitmapShader shader;
        boolean pending,failed;
        Entry(Object task,Bitmap source,int generation){this.task=new WeakReference<>(task);this.source=new WeakReference<>(source);this.generation=generation;}
    }
}
