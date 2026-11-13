package ls.augment.com.step;

import android.animation.*;
import android.app.ActivityManager;
import android.graphics.*;
import android.os.SystemClock;
import android.view.*;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import java.util.concurrent.*;
import static ls.augment.com.step.StepRuntime.*;

/** A short, task-scoped frame bridge while native upper/main configurations redraw.
 * Captures never include secure/protected layers; no desktop-sized screenshot or per-frame readback.
 * Native task ownership and drawing acknowledgements remain the authority for completion. */
final class RegionTransition extends View {
    static final ExecutorService capture=Executors.newSingleThreadExecutor();
    final LiveWorkspace host;
    final long ticket;
    final LiveWorkspace.Lease[] leases;
    final RectF[] from,to;
    final Bitmap[] images;
    final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
    final RectF box=new RectF(),fit=new RectF();
    final Bitmap backdrop;
    final int backdropColor;
    ValueAnimator animator;
    Runnable completion;
    boolean cancelled, moved, landed, submitted;
    float progress;
    final long began=SystemClock.uptimeMillis();

    RegionTransition(LiveWorkspace h,long ticket,LiveWorkspace.Lease[] leases,RectF[] from,RectF[] to){
        super(h.input.context);host=h;this.ticket=ticket;this.leases=leases;this.from=from;this.to=to;
        images=new Bitmap[leases.length];backdrop=h.quickBar.wallpaper;
        backdropColor=StepMaterial.dark(getContext())?0xff303742:0xffdce5ed;
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }
    static RectF main(LiveWorkspace h){
        WorkspaceLayout l=h.geometry;return new RectF(l.mainX,l.top,l.mainX+l.width*l.mainScale,l.height);
    }
    static RectF upper(LiveWorkspace h){return new RectF(0,0,h.geometry.width,h.geometry.contentHeight);}
    static void prepare(LiveWorkspace h,long ticket,LiveWorkspace.Lease incoming,LiveWorkspace.Lease outgoing,boolean release,Runnable submit){
        if(!h.homeBackdropAvailable || outgoing!=null && (h.upperId!=outgoing.id || !h.quickBar.upper.visible)){
            diagnostic("REGION_MOTION","native_fallback;draw_capability_or_visible_origin_missing");submit.run();return;
        }
        // Hidden upper pages have no visible origin. Preserve their existing native return semantics.
        if(release && (h.upperId!=incoming.id || !h.quickBar.upper.visible)){submit.run();return;}
        LiveWorkspace.Lease[] actors=outgoing==null?new LiveWorkspace.Lease[]{incoming}:new LiveWorkspace.Lease[]{incoming,outgoing};
        RectF[] from=outgoing==null?new RectF[]{release?upper(h):main(h)}:new RectF[]{main(h),upper(h)};
        RectF[] to=outgoing==null?new RectF[]{release?main(h):upper(h)}:new RectF[]{upper(h),main(h)};
        RegionTransition bridge=new RegionTransition(h,ticket,actors,from,to);h.regionTransition=bridge;
        capture.execute(()->{
            String unavailable=null;
            try{
                for(int n=0;n<actors.length;n++){
                    Object surface;Rect bounds;
                    synchronized(h.organizerLock){
                        ActivityManager.RunningTaskInfo info=actors[n].checkedInfo();
                        if(info==null)throw new IllegalStateException("原任务已结束");
                        bounds=new Rect((Rect)call(field(field(info,"configuration"),"windowConfiguration"),"getBounds"));
                        surface=actors[n].checkedLeash();
                    }
                    Bitmap frame=UpperRoll.permittedFrame(surface,bounds.width(),bounds.height());
                    synchronized(bridge){
                        if(bridge.cancelled){if(frame!=null)frame.recycle();return;}
                        bridge.images[n]=frame;
                    }
                    if(frame==null || !visibleFrame(frame))throw new IllegalStateException("原任务不允许采样、未绘制或缺少图层采样能力");
                }
            }catch(Exception|LinkageError error){unavailable=error.toString();}
            final String reason=unavailable;
            h.main.post(()->{
                if(!bridge.current()){bridge.close();return;}
                if(reason!=null){diagnostic("REGION_MOTION","native_fallback;reason="+reason);bridge.close();submit.run();return;}
                try{
                    for(LiveWorkspace.Lease actor:actors)if(actor.checkedInfo()==null)throw new IllegalStateException("转场前任务已变化");
                    ((FrameLayout)h.input.view).addView(bridge,new FrameLayout.LayoutParams(-1,-1));
                    h.input.afterFrame(h.input.expectedTicket(),()->{
                        if(!bridge.current())return;
                        bridge.submitted=true;submit.run();bridge.move();
                    });
                }catch(RuntimeException error){bridge.close();h.fail("分区转场准备失败："+error);}
            });
        });
        // Sampling is optional. A stalled capture cannot consume the input lease indefinitely.
        h.main.postDelayed(()->{
            if(bridge.current() && !bridge.submitted){diagnostic("REGION_MOTION","native_fallback;capture_timeout");bridge.close();submit.run();}
        },650);
    }
    boolean current(){return !cancelled && host.regionTransition==this && host.fence.current(ticket) && !host.closing && !host.closed;}
    static boolean visibleFrame(Bitmap frame){
        int visible=0,samples=0;
        for(int y=0;y<frame.getHeight();y+=Math.max(1,frame.getHeight()/32))
            for(int x=0;x<frame.getWidth();x+=Math.max(1,frame.getWidth()/32)){
                int p=frame.getPixel(x,y);samples++;
                if(Color.alpha(p)>240 && Math.max(Color.red(p),Math.max(Color.green(p),Color.blue(p)))>16)visible++;
            }
        return visible>samples/100;
    }
    void move(){
        if(!current())return;
        animator=ValueAnimator.ofFloat(0,1);animator.setDuration(280);
        animator.setInterpolator(new PathInterpolator(.25f,.1f,.25f,1));
        animator.addUpdateListener(a->{progress=(Float)a.getAnimatedValue();invalidate();});
        animator.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator a){
            if(!current())return;animator=null;moved=true;finishIfReady();
        }});animator.start();
    }
    void landed(Runnable done){completion=done;landed=true;finishIfReady();}
    void finishIfReady(){
        if(!current() || !moved || !landed || animator!=null)return;
        // Native task draw + final host frame must both be confirmed before the bridge fades.
        host.input.afterFrame(host.input.expectedTicket(),()->{
            if(!current() || animator!=null)return;
            animator=ValueAnimator.ofFloat(1,0);animator.setDuration(80);
            animator.addUpdateListener(a->setAlpha((Float)a.getAnimatedValue()));
            animator.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator a){
                if(!current())return;
                Runnable done=completion;diagnostic("REGION_MOTION","committed;actors="+leases.length+";elapsedMs="+(SystemClock.uptimeMillis()-began));
                close();if(done!=null)done.run();
            }});animator.start();
        });
    }
    @Override protected void onDraw(Canvas c){
        // Only the two participating regions are covered; side tasks keep their live buffers.
        paint.setAlpha(255);
        for(int n=0;n<from.length;n++){
            background(c,from[n]);background(c,to[n]);
        }
        for(int n=0;n<images.length;n++){
            Bitmap image=images[n];if(image==null || image.isRecycled())continue;
            RegionMotion.interpolate(from[n],to[n],progress,box);
            RegionMotion.cover(image.getWidth(),image.getHeight(),box,fit);
            int saved=c.save();c.clipRect(box);paint.setColor(Color.WHITE);
            c.drawBitmap(image,null,fit,paint);c.restoreToCount(saved);
        }
    }
    void background(Canvas c,RectF area){
        paint.setColor(backdropColor);c.drawRect(area,paint);
        if(backdrop==null || backdrop.isRecycled())return;
        int saved=c.save();c.clipRect(area);
        box.set(0,0,getWidth(),getHeight());RegionMotion.cover(backdrop.getWidth(),backdrop.getHeight(),box,fit);
        paint.setColor(Color.WHITE);c.drawBitmap(backdrop,null,fit,paint);c.restoreToCount(saved);
    }
    synchronized void close(){
        if(cancelled)return;cancelled=true;
        if(host.regionTransition==this)host.regionTransition=null;
        if(animator!=null){animator.removeAllListeners();animator.removeAllUpdateListeners();animator.cancel();animator=null;}
        if(getParent() instanceof android.view.ViewGroup group)group.removeView(this);
        // RenderThread may still reference the last submitted frame. Let Bitmap ownership/GC release it.
        for(int n=0;n<images.length;n++)images[n]=null;
        completion=null;
    }
}
