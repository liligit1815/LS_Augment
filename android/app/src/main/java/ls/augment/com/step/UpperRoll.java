package ls.augment.com.step;

import android.animation.*;
import android.graphics.*;
import android.hardware.HardwareBuffer;
import android.view.*;
import android.view.animation.DecelerateInterpolator;
import java.lang.reflect.Method;
import java.util.concurrent.*;
import static ls.augment.com.step.StepRuntime.*;

/** Transient upper flip faces. Only the verified upper task itself is eligible for a live-frame capture. */
final class UpperRoll extends View {
    final UpperPane pane;
    final Paint paint=new Paint(Paint.FILTER_BITMAP_FLAG|Paint.ANTI_ALIAS_FLAG);
    final ExecutorService worker=Executors.newSingleThreadExecutor();
    Bitmap control,app;
    ValueAnimator settling;
    volatile int epoch;
    int direction=1;
    volatile boolean running;
    boolean origin;
    float progress;
    UpperRoll(UpperPane pane){super(pane.owner.ctx);this.pane=pane;setClickable(true);setVisibility(GONE);}
    boolean begin(){
        if(running || !pane.canSwitch())return false;
        running=true;origin=pane.visible;progress=0;int ticket=++epoch;
        control=controls();
        if(origin && pane.host.upperId>=0)sample(ticket,pane.host.upperId);
        WindowManager.LayoutParams lp=(WindowManager.LayoutParams)pane.owner.bar.getLayoutParams();
        lp.height=pane.host.geometry.top;pane.owner.windowsUpdate(lp);
        setVisibility(VISIBLE);bringToFront();invalidate();return true;
    }
    Bitmap controls(){
        View band=pane.owner.band;
        if(band.getWidth()<1 || band.getHeight()<1)return null;
        Bitmap b=null;
        try{
            b=Bitmap.createBitmap(Math.max(1,band.getWidth()/2),Math.max(1,band.getHeight()/2),Bitmap.Config.ARGB_8888);
            Canvas canvas=new Canvas(b);canvas.drawColor(StepMaterial.dark(getContext())?0xff303742:0xffdce5ed);
            canvas.scale(b.getWidth()/(float)band.getWidth(),b.getHeight()/(float)band.getHeight());band.draw(canvas);return b;
        }catch(RuntimeException unsupported){if(b!=null)b.recycle();return null;}
    }
    void sample(int ticket,int id){
        LiveWorkspace h=pane.host;
        final LiveWorkspace.Lease lease=h.leases.get(id);
        if(lease==null || !WorkspaceUsers.allows(pane.owner.ctx,pane.owner.userId,lease.user))return;
        final Rect bounds=pane.bounds();
        worker.execute(()->{
            Bitmap frame=null;
            try{
                if(!running || epoch!=ticket || !interactive(pane.owner.ctx)
                        || !WorkspaceUsers.allows(pane.owner.ctx,pane.owner.userId,lease.user))return;
                Object source;
                synchronized(h.organizerLock){if(lease.checkedInfo()==null)return;source=lease.checkedLeash();}
                frame=permittedFrame(source,bounds.width(),bounds.height());
            }catch(ReflectiveOperationException|RuntimeException|LinkageError unavailable){/* Use the neutral task face. */}
            finally{
                Bitmap result=frame;
                h.main.post(()->{
                    if(result==null)return;
                    if(running && epoch==ticket && h.upperId==id && !pane.owner.closed && interactive(pane.owner.ctx)
                            && WorkspaceUsers.allows(pane.owner.ctx,pane.owner.userId,lease.user)){
                        app=result;invalidate();
                    }else result.recycle();
                });
            }
        });
    }
    static Bitmap permittedFrame(Object task,int w,int h)throws ReflectiveOperationException{
        for(String name:new String[]{"android.window.ScreenCaptureInternal","android.window.ScreenCapture"}){
            try{
                ClassLoader cl=StepRuntime.Shell.loader;
                Class<?> api=Class.forName(name,false,cl),args=Class.forName(name+"$LayerCaptureArgs",false,cl);
                Class<?> builder=Class.forName(name+"$LayerCaptureArgs$Builder",false,cl),result=Class.forName(name+"$ScreenshotHardwareBuffer",false,cl);
                Method read=OwnershipBridge.method(api,"captureLayers",args);
                Method secure=OwnershipBridge.method(builder,"setCaptureSecureLayers",boolean.class);
                Method protectedContent=OwnershipBridge.method(builder,"setAllowProtected",boolean.class);
                if(read.getReturnType()!=result || OwnershipBridge.method(result,"containsSecureLayers").getReturnType()!=boolean.class)continue;
                Object b=builder.getConstructor(SurfaceControl.class).newInstance(task);
                secure.invoke(b,false);protectedContent.invoke(b,false);
                call(b,"setSourceCrop",new Rect(0,0,w,h));call(b,"setFrameScale",.5f);
                Object capture=read.invoke(null,call(b,"build"));if(capture==null)return null;
                try(HardwareBuffer buffer=(HardwareBuffer)call(capture,"getHardwareBuffer")){
                    if(buffer==null || !Boolean.FALSE.equals(call(capture,"containsSecureLayers")))return null;
                    Bitmap raw=(Bitmap)call(capture,"asBitmap");
                    if(raw==null)return null;
                    try{
                        if(Math.abs(raw.getWidth()-w*.5f)>1 || Math.abs(raw.getHeight()-h*.5f)>1)return null;
                        return raw.copy(Bitmap.Config.ARGB_8888,false);
                    }finally{raw.recycle();}
                }
            }catch(ClassNotFoundException|NoSuchMethodException unsupported){continue;}
        }
        return null;
    }
    void drag(float dy){if(!running || settling!=null)return;direction=dy>=0?1:-1;progress=Math.min(1,Math.abs(dy)/Math.max(1,pane.host.geometry.top));invalidate();}
    void settle(boolean change){
        if(!running || settling!=null)return;
        int ticket=epoch;
        float target=change?1:0;ValueAnimator a=ValueAnimator.ofFloat(progress,target);settling=a;
        a.setDuration(Math.max(90,Math.min(280,Math.round(260*Math.abs(target-progress)))));a.setInterpolator(new DecelerateInterpolator());
        a.addUpdateListener(v->{if(epoch==ticket){progress=(Float)v.getAnimatedValue();invalidate();}});
        a.addListener(new AnimatorListenerAdapter(){public void onAnimationEnd(Animator v){
            if(epoch!=ticket)return;
            boolean destination=change?!origin:origin;
            reset();pane.applyFace(destination);
        }});a.start();
    }
    void reset(){
        epoch++;running=false;ValueAnimator old=settling;settling=null;
        if(old!=null){old.removeAllListeners();old.cancel();}
        setVisibility(GONE);app=null;control=null;
    }
    void close(){reset();worker.shutdownNow();}
    @Override protected void onDraw(Canvas canvas){
        int w=getWidth(),h=getHeight();if(w<1||h<1)return;
        canvas.drawColor(0xff222933);
        float theta=(float)(progress*Math.PI/2),cs=(float)Math.cos(theta),sn=(float)Math.sin(theta);
        float seam=h*cs/Math.max(.001f,cs+sn),inset=w*.06f*sn*cs;
        boolean down=direction>0;float edge=down?h-seam:seam;
        if(progress<.999f)face(canvas,origin,down?edge:0,down?h:edge,down?inset:0,down?0:inset,progress*.25f);
        if(progress>.001f)face(canvas,!origin,down?0:edge,down?edge:h,down?0:inset,down?inset:0,(1-progress)*.25f);
    }
    void face(Canvas c,boolean task,float top,float bottom,float a,float b,float shade){
        int w=getWidth(),h=getHeight();if(bottom-top<1)return;
        float[] src={0,0,w,0,w,h,0,h},dst={a,top,w-a,top,w-b,bottom,b,bottom};
        Matrix m=new Matrix();if(!m.setPolyToPoly(src,0,dst,0,4))return;
        int save=c.save();c.concat(m);c.clipRect(0,0,w,h);c.drawColor(task?0xff353e49:0xff415365);
        Bitmap image=task?app:control;
        if(image!=null && !image.isRecycled()){paint.setColor(-1);c.drawBitmap(image,null,new Rect(0,task?pane.caption:0,w,h),paint);}
        else{paint.setColor(-1);paint.setTextAlign(Paint.Align.CENTER);paint.setTextSize(pane.owner.dp(19));
            c.drawText(task?(pane.host.upperId<0?"＋":"顶部任务"):"红魔 Step",w*.5f,h*.56f,paint);}
        c.drawColor(Color.argb(Math.round(255*shade),0,0,0));c.restoreToCount(save);
    }
}
