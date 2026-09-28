package ls.augment.com;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.HardwareBuffer;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.view.SurfaceControl;
import android.view.View;
import android.view.ViewParent;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.ObjIntConsumer;

/** Private compositor backdrop, excluding every window of the host process.
 * No disk/network paths. Hidden APIs are capability-checked; no unfiltered fallback exists.
 * All public lifecycle methods and draw() run on the host's UI thread. */
public final class LayerBackdropSource implements LiquidGlassDrawable.BackdropSource {
    private static final long MIN_INTERVAL=200,MAX_FRAME_AGE=1200,TIMEOUT=700;
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Handler WORKER;
    // Only accessed on WORKER; bounded by the verified capture pixel budget.
    private static int[] signaturePixels=new int[0];
    static{HandlerThread thread=new HandlerThread("LSA-GlassBackdrop");thread.start();WORKER=new Handler(thread.getLooper());}
    private final WeakReference<View> host;
    private final Paint paint=new Paint(Paint.FILTER_BITMAP_FLAG);
    private final Rect region=new Rect(),screenRegion=new Rect(),frameRegion=new Rect();
    private final int[] location=new int[2];
    private final Point displaySize=new Point();
    private Bitmap frame;
    private long[] frameLayers;
    private long requestedAt,frameAt,lastSignature,revision;
    private volatile long generation;
    private volatile boolean released;
    private boolean blocked,pending;
    private int unchanged;
    private String failure="not_requested";
    private volatile Object retainedConsumer,retainedListener;
    private final Runnable poll=()->{View view=hostView();if(view!=null&&view.isShown())request();};

    public LayerBackdropSource(View view){if(view==null)throw new IllegalArgumentException("Host required");host=new WeakReference<>(view);}
    public String failureReason(){return failure;}
    @Override public long revision(){return revision;}
    public void setRegion(Rect localBounds){
        if(!region.equals(localBounds)){region.set(localBounds);generation++;frame=null;frameAt=0;}
    }
    /** Schedules at most one asynchronous capture; never blocks drawing on Binder/GPU readback. */
    public void request(){
        View view=hostView();long now=SystemClock.uptimeMillis();
        if(view==null||blocked||pending||region.isEmpty()||!view.isShown()||view.getWindowVisibility()!=View.VISIBLE)return;
        long interval=unchanged>=3?1000:MIN_INTERVAL;
        if(now-requestedAt<interval){schedule(interval-(now-requestedAt));return;}
        if(!untransformed(view)){drop("transformed_host");return;}
        view.getLocationOnScreen(location);
        screenRegion.set(region);screenRegion.offset(location[0],location[1]);
        if(view.getDisplay()==null){drop("display_unavailable");return;}
        view.getDisplay().getRealSize(displaySize);
        if(screenRegion.left<0||screenRegion.top<0||screenRegion.right>displaySize.x||screenRegion.bottom>displaySize.y){drop("offscreen_region");return;}
        final Exclusions excluded;
        try{excluded=exclusions(view);}catch(ReflectiveOperationException|RuntimeException error){block("layer_exclusion_unavailable");return;}
        final Rect crop=new Rect(screenRegion);final long epoch=generation;
        final int displayId=view.getDisplay()==null?-1:view.getDisplay().getDisplayId();
        if(displayId<0){releaseSurfaces(excluded.surfaces);drop("display_unavailable");return;}
        requestedAt=now;pending=true;
        WORKER.post(()->capture(excluded,crop,displayId,epoch));
        MAIN.postDelayed(()->{if(pending&&requestedAt==now&&!released){block("capture_timeout");}},TIMEOUT);
    }
    @Override public boolean isValid(){
        View view=hostView();if(view==null||blocked||frame==null||frame.isRecycled())return false;
        if(!untransformed(view)||!view.isShown()||view.getWindowVisibility()!=View.VISIBLE)return false;
        view.getLocationOnScreen(location);Rect current=new Rect(region);current.offset(location[0],location[1]);
        if(!current.equals(frameRegion)||SystemClock.uptimeMillis()-frameAt>MAX_FRAME_AGE)return false;
        // A root can acquire a new SurfaceControl during relayout. Never reuse a frame across that boundary.
        try{if(!Arrays.equals(frameLayers,layerIds(roots())))return false;}
        catch(ReflectiveOperationException|RuntimeException failure){return false;}
        return true;
    }
    @Override public boolean draw(Canvas canvas,int width,int height){
        if(!isValid())return false;
        canvas.drawBitmap(frame,null,new Rect(0,0,width,height),paint);return true;
    }
    /** Draw a host-local control from the same captured frame; no per-tile capture requests. */
    public boolean drawRegion(Canvas canvas,Rect localBounds,int width,int height){
        if(!isValid()||localBounds==null||width<=0||height<=0||localBounds.isEmpty()
                ||localBounds.left<region.left||localBounds.top<region.top
                ||localBounds.right>region.right||localBounds.bottom>region.bottom)return false;
        float sx=frame.getWidth()/(float)region.width(),sy=frame.getHeight()/(float)region.height();
        Rect crop=new Rect(Math.max(0,(int)Math.floor((localBounds.left-region.left)*sx)),
                Math.max(0,(int)Math.floor((localBounds.top-region.top)*sy)),
                Math.min(frame.getWidth(),(int)Math.ceil((localBounds.right-region.left)*sx)),
                Math.min(frame.getHeight(),(int)Math.ceil((localBounds.bottom-region.top)*sy)));
        if(crop.isEmpty())return false;
        canvas.drawBitmap(frame,crop,new Rect(0,0,width,height),paint);return true;
    }
    public void release(){released=true;generation++;frame=null;frameLayers=null;frameAt=0;retainedConsumer=null;retainedListener=null;MAIN.removeCallbacks(poll);}
    private View hostView(){View view=host.get();return released||view==null||!view.isAttachedToWindow()?null:view;}
    private void schedule(long delay){MAIN.removeCallbacks(poll);if(!released&&!blocked)MAIN.postDelayed(poll,Math.max(1,delay));}
    private void drop(String reason){frame=null;frameLayers=null;frameAt=0;failure=reason;}
    private void block(String reason){blocked=true;drop(reason);MAIN.removeCallbacks(poll);View v=host.get();if(v!=null)v.invalidate();}

    private void capture(Exclusions excluded,Rect crop,int displayId,long epoch){
        try{
            if(released||epoch!=generation){MAIN.post(()->{pending=false;schedule(MIN_INTERVAL);});return;}
            Class<?> argsType=Class.forName("android.window.ScreenCapture$CaptureArgs");
            Class<?> builderType=Class.forName("android.window.ScreenCapture$CaptureArgs$Builder");
            Object builder=builderType.getConstructor().newInstance();
            invoke(builder,"setCaptureSecureLayers",new Class<?>[]{boolean.class},false);
            invoke(builder,"setAllowProtected",new Class<?>[]{boolean.class},false);
            invoke(builder,"setExcludeLayers",new Class<?>[]{SurfaceControl[].class},(Object)excluded.surfaces.toArray(new SurfaceControl[0]));
            invoke(builder,"setSourceCrop",new Class<?>[]{Rect.class},crop);
            int[] sample=LiquidGlassPolicy.sampleSize(crop.width(),crop.height());
            invoke(builder,"setFrameScale",new Class<?>[]{float.class,float.class},sample[0]/(float)crop.width(),sample[1]/(float)crop.height());
            Object args=invoke(builder,"build",new Class<?>[0]);
            // Verify that the builder did not ignore the required flags on an OEM fork.
            if(!Boolean.FALSE.equals(read(args,"mCaptureSecureLayers"))||!Boolean.FALSE.equals(read(args,"mAllowProtected")))
                throw new IllegalStateException("Unsafe capture flags");
            Object layers=read(args,"mExcludeLayers");
            if(layers==null||Array.getLength(layers)!=excluded.surfaces.size())throw new IllegalStateException("Missing exclusions");
            Class<?> listenerType=Class.forName("android.window.ScreenCapture$ScreenCaptureListener");
            Object consumer,listener;
            try{
                Constructor<?> constructor=listenerType.getConstructor(ObjIntConsumer.class);
                consumer=(ObjIntConsumer<Object>)(buffer,status)->received(buffer,status,crop,epoch,excluded.ids);
                listener=constructor.newInstance(consumer);
            }catch(NoSuchMethodException older){
                Constructor<?> constructor=listenerType.getConstructor(Consumer.class);
                consumer=(Consumer<Object>)(buffer)->received(buffer,buffer==null?-1:0,crop,epoch,excluded.ids);
                listener=constructor.newInstance(consumer);
            }
            // Android's native listener only keeps a weak consumer reference.
            retainedConsumer=consumer;retainedListener=listener;
            Class<?> global=Class.forName("android.view.WindowManagerGlobal");
            Object service=global.getMethod("getWindowManagerService").invoke(null);
            Class<?> serviceType=Class.forName("android.view.IWindowManager");
            serviceType.getMethod("captureDisplay",int.class,argsType,listenerType).invoke(service,displayId,args,listener);
        }catch(ReflectiveOperationException|RuntimeException|LinkageError error){
            MAIN.post(()->{pending=false;retainedConsumer=null;retainedListener=null;if(!released)block("filtered_capture_unavailable");});
        }finally{releaseSurfaces(excluded.surfaces);}
    }
    private void received(Object result,int status,Rect crop,long epoch,long[] capturedLayers){
        // Readback/copy never runs on Binder or the drawing thread.
        WORKER.post(()->{
            Bitmap software=null;HardwareBuffer buffer=null;Bitmap hardware=null;String error="capture_rejected";long hash=0;
            try{
                if(status!=0||result==null)throw new IllegalStateException("Capture rejected");
                buffer=(HardwareBuffer)invoke(result,"getHardwareBuffer",new Class<?>[0]);
                if(buffer==null)throw new IllegalStateException("No buffer");
                if(!Boolean.FALSE.equals(invoke(result,"containsSecureLayers",new Class<?>[0]))
                        ||(buffer.getUsage()&HardwareBuffer.USAGE_PROTECTED_CONTENT)!=0)
                    throw new IllegalStateException("Protected buffer");
                if(buffer.getWidth()>LiquidGlassPolicy.MAX_EDGE||buffer.getHeight()>LiquidGlassPolicy.MAX_EDGE
                        ||(long)buffer.getWidth()*buffer.getHeight()>LiquidGlassPolicy.MAX_PIXELS)
                    throw new IllegalStateException("Oversize buffer");
                hardware=(Bitmap)invoke(result,"asBitmap",new Class<?>[0]);
                if(hardware==null)throw new IllegalStateException("No bitmap");
                software=hardware.copy(Bitmap.Config.ARGB_8888,false);
                if(software==null)throw new IllegalStateException("Copy failed");
                hash=signature(software);
                error="";
            }catch(ReflectiveOperationException|RuntimeException|LinkageError|OutOfMemoryError ignored){ }
            finally{if(hardware!=null)hardware.recycle();if(buffer!=null)buffer.close();}
            final Bitmap ready=software;final String outcome=error;
            final long signature=hash;
            MAIN.post(()->{
                pending=false;retainedConsumer=null;retainedListener=null;
                if(released||blocked||epoch!=generation){if(ready!=null)ready.recycle();if(!released&&!blocked)schedule(MIN_INTERVAL);return;}
                if(!outcome.isEmpty()||ready==null){block(outcome);return;}
                try{
                    if(!Arrays.equals(capturedLayers,layerIds(roots()))){
                        ready.recycle();drop("window_layers_changed");schedule(MIN_INTERVAL);return;
                    }
                }catch(ReflectiveOperationException|RuntimeException failure){ready.recycle();block("layer_validation_unavailable");return;}
                frame=ready;frameLayers=capturedLayers;frameRegion.set(crop);frameAt=SystemClock.uptimeMillis();failure="";
                unchanged=signature==lastSignature?unchanged+1:0;lastSignature=signature;
                // Avoid blurring identical static frames again; optical interaction remains independent.
                if(unchanged==0)revision++;
                View view=hostView();if(view!=null)view.invalidate(region);
                schedule(unchanged>=3?1000:MIN_INTERVAL);
            });
        });
    }
    private static long signature(Bitmap bitmap){long hash=0xcbf29ce484222325L;
        int width=bitmap.getWidth(),height=bitmap.getHeight(),count=width*height;
        if(signaturePixels.length<count)signaturePixels=new int[count];
        bitmap.getPixels(signaturePixels,0,width,0,0,width,height);
        for(int i=0;i<count;i++)hash=(hash^signaturePixels[i])*0x100000001b3L;
        hash=(hash^width)*0x100000001b3L;hash=(hash^height)*0x100000001b3L;
        return hash;
    }
    private static boolean untransformed(View view){
        for(View v=view;v!=null;){if(v.getScaleX()!=1||v.getScaleY()!=1||v.getRotation()!=0||v.getRotationX()!=0||v.getRotationY()!=0)return false;
            ViewParent parent=v.getParent();v=parent instanceof View?(View)parent:null;}
        android.view.ViewGroup.LayoutParams p=view.getRootView().getLayoutParams();
        return !(p instanceof WindowManager.LayoutParams)||((((WindowManager.LayoutParams)p).flags&WindowManager.LayoutParams.FLAG_SECURE)==0);
    }
    private static List<?> roots() throws ReflectiveOperationException{
        Class<?> global=Class.forName("android.view.WindowManagerGlobal");
        Object manager=global.getMethod("getInstance").invoke(null);
        Object lock=read(manager,"mLock");List<Object> roots=new ArrayList<>();
        synchronized(lock){
            roots.addAll((List<?>)read(manager,"mRoots"));
            roots.addAll((List<?>)read(manager,"mWindowlessRoots"));
        }
        if(roots.isEmpty()||roots.size()>64)throw new IllegalStateException("Unexpected roots");
        return roots;
    }
    private static long[] layerIds(List<?> roots) throws ReflectiveOperationException{
        long[] ids=new long[roots.size()];
        for(int i=0;i<roots.size();i++){
            Object root=roots.get(i);SurfaceControl surface=(SurfaceControl)invoke(root,"getSurfaceControl",new Class<?>[0]);
            int id=surface==null||!surface.isValid()?0:((Number)invoke(surface,"getLayerId",new Class<?>[0])).intValue();
            ids[i]=((long)System.identityHashCode(root)<<32)|(id&0xffffffffL);
        }
        return ids;
    }
    private static final class Exclusions{
        final List<SurfaceControl> surfaces;final long[] ids;
        Exclusions(List<SurfaceControl> surfaces,long[] ids){this.surfaces=surfaces;this.ids=ids;}
    }
    private static Exclusions exclusions(View host) throws ReflectiveOperationException{
        List<?> roots=roots();long[] ids=layerIds(roots);
        List<SurfaceControl> copy=new ArrayList<>();boolean hostFound=false;
        Constructor<SurfaceControl> clone=SurfaceControl.class.getConstructor(SurfaceControl.class,String.class);
        try{
            for(Object root:roots){
                Object rootView=invoke(root,"getView",new Class<?>[0]);
                SurfaceControl surface=(SurfaceControl)invoke(root,"getSurfaceControl",new Class<?>[0]);
                if(surface==null||!surface.isValid()){
                    if(rootView==host.getRootView())throw new IllegalStateException("Invalid host surface");
                    continue;
                }
                copy.add(clone.newInstance(surface,"LSA filtered glass backdrop"));
                if(rootView==host.getRootView())hostFound=true;
            }
            if(!hostFound||copy.isEmpty())throw new IllegalStateException("Host exclusion missing");
            return new Exclusions(copy,ids);
        }catch(ReflectiveOperationException|RuntimeException failure){releaseSurfaces(copy);throw failure;}
    }
    private static Object read(Object object,String name) throws ReflectiveOperationException{
        for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(object);}
        catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);
    }
    private static Object invoke(Object object,String name,Class<?>[] types,Object... args) throws ReflectiveOperationException{
        Method method=object.getClass().getMethod(name,types);method.setAccessible(true);return method.invoke(object,args);
    }
    private static void releaseSurfaces(List<SurfaceControl> surfaces){for(SurfaceControl surface:surfaces)surface.release();}
}
