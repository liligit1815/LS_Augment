package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Decode only after a configuration change; never perform provider I/O in a draw callback. */
final class CleanupIconImage {
    static final String C17="preset:c17";
    private static final ExecutorService IO=Executors.newSingleThreadExecutor(task->{Thread t=new Thread(task,"duo-cleanup-icon");t.setDaemon(true);return t;});
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private final WeakReference<View> owner;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
    private final RectF bounds=new RectF();
    private String requested="";
    private long generation;
    private Bitmap bitmap;
    private boolean drawn;
    private final CleanupCapsule capsule=new CleanupCapsule();
    CleanupIconImage(View view){owner=new WeakReference<>(view);}
    void update(String hash){
        String next=C17.equals(hash)||hash!=null&&hash.matches("[0-9a-f]{64}")?hash:"";
        View view=owner.get();
        // Inflation/theme callbacks can run before attachment. Do not cache a request
        // that cannot be delivered: the attachment callback must be able to load it.
        if(view==null||!view.isAttachedToWindow()){clear();return;}
        if(next.equals(requested))return;
        capsule.clear();requested=next;long ticket=++generation;bitmap=null;drawn=false;view.invalidate();
        if(next.isEmpty())return;
        // The preset is native vector drawing: crisp at any launcher density,
        // with live system font scaling and no asynchronous asset dependency.
        if(C17.equals(next))return;
        Context context=view.getContext().getApplicationContext();
        IO.execute(()->{
            Bitmap decoded=null;String failure="";int sample=1;
            try(InputStream input=open(context,next)){
                if(input==null)throw new IllegalArgumentException("empty stream");
                BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;
                BitmapFactory.decodeStream(input,null,options);
                int maximum=2048;
                if(options.outWidth<=0||options.outHeight<=0||options.outWidth>maximum||options.outHeight>maximum)
                    throw new IllegalArgumentException("invalid image bounds");
                while(Math.max(options.outWidth,options.outHeight)/sample>512)sample*=2;
            }catch(Exception error){failure=error.getClass().getSimpleName();}
            if(failure.isEmpty())try(InputStream input=open(context,next)){
                BitmapFactory.Options options=new BitmapFactory.Options();options.inSampleSize=sample;
                decoded=BitmapFactory.decodeStream(input,null,options);
                if(decoded==null)throw new IllegalArgumentException("image decode failed");
            }catch(Exception error){failure=error.getClass().getSimpleName();}
            Bitmap result=decoded;String error=failure;
            MAIN.post(()->{
                View current=owner.get();
                if(ticket!=generation){if(result!=null)result.recycle();return;}
                if(current==null||!current.isAttachedToWindow()){clear();if(result!=null)result.recycle();return;}
                bitmap=result;if(result==null)requested="";current.invalidate();
                FeatureSettings.diagnostic(context,"ls_augment_cleanup_icon_runtime",result==null?"native_fallback:"+error:"loaded:custom");
            });
        });
    }
    private static InputStream open(Context context,String source)throws Exception{
        return context.getContentResolver().openInputStream(Uri.parse("content://ls.augment.com.config/icon/"+source));
    }
    boolean ready(){return C17.equals(requested)||bitmap!=null;}
    boolean draw(Canvas canvas,float x,float y,float radius){
        if(C17.equals(requested))return drawC17(canvas,x,y);
        if(bitmap==null)return false;
        View view=owner.get();
        float scale=radius*2/Math.max(bitmap.getWidth(),bitmap.getHeight());
        float width=bitmap.getWidth()*scale,height=bitmap.getHeight()*scale;
        bounds.set(x-width/2,y-height/2,x+width/2,y+height/2);
        canvas.drawBitmap(bitmap,null,bounds,paint);
        if(!drawn&&view!=null){drawn=true;FeatureSettings.diagnostic(view.getContext(),"ls_augment_cleanup_icon_runtime",
                "drawn:"+(C17.equals(requested)?"c17":"custom")+";view="+view.getClass().getName()+";size="+view.getWidth()+"x"+view.getHeight());}
        return true;
    }
    private boolean drawC17(Canvas canvas,float x,float y){
        View view=owner.get();if(view==null||view.getWidth()<=0||view.getHeight()<=0)return false;
        capsule.draw(view,canvas,x,y);
        if(!drawn){drawn=true;FeatureSettings.diagnostic(view.getContext(),"ls_augment_cleanup_icon_runtime",
                "drawn:c17;style=oppo_reference;material="+capsule.material()+";body="+CleanupCapsule.width(view)+"x"+CleanupCapsule.height(view)+";view="+view.getWidth()+"x"+view.getHeight());}
        return true;
    }
    void clear(){capsule.clear();generation++;requested="";bitmap=null;drawn=false;}
}
