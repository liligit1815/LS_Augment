package ls.augment.com.step;

import android.content.Intent;
import android.os.Parcelable;
import android.os.ResultReceiver;
import android.view.SurfaceControl;
import android.view.Choreographer;
import android.view.animation.PathInterpolator;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** A system_server lease on the participating original surfaces, before changing any task roles. */
final class NativeFlip {
    final Intent request;
    final int selected, outgoing, promoted, count;
    final boolean targetLeft;
    final WorkspaceLayout from, to;
    final SurfaceControl band;
    final Parcelable[] lanes;
    final SurfaceControl[] hints;
    final NativeBackdrop backdrop;
    final SavedTask[] actors=new SavedTask[SideSlots.MAX_COUNT+1];
    final SurfaceControl[] surfaces=new SurfaceControl[actors.length];
    final WorkspaceMotion[] starts=new WorkspaceMotion[actors.length], ends=new WorkspaceMotion[actors.length];
    Choreographer clock;
    Choreographer.FrameCallback callback;
    SurfaceControl.Transaction animationTx;
    final PathInterpolator easing=new PathInterpolator(.22f,.7f,.12f,1);
    long firstFrameNanos,lastFrameNanos,maxFrameGapNanos;
    boolean attached, committed, ownsTransforms;
    int frames;

    NativeFlip(Intent i) {
        request=new Intent(i);
        selected=i.getIntExtra("slot",-1); outgoing=i.getIntExtra("task",-1); promoted=i.getIntExtra("previous",-1);
        count=i.getIntExtra("visible",0);targetLeft=WorkspaceMotion.targetLeft(sideLeft,outgoing,promoted);
        if(!SideSlots.validCount(count) || count!=layoutCount || selected<0 || selected>=count || promoted< -1 || outgoing< -1
                || outgoing<0 && promoted<0 || i.getBooleanExtra("background",false)
                || slots.task(selected)!=promoted || i.getBooleanExtra("leftSide",!sideLeft)!=sideLeft)
            throw new IllegalStateException("交换格或方向已经变化");
        float density=Wm.context.getResources().getDisplayMetrics().density;
        from=WorkspaceLayout.create(logical.width(),logical.height(),density,sideLeft,layoutCount,layoutInset,mainReflow);
        to=WorkspaceLayout.create(logical.width(),logical.height(),density,targetLeft,layoutCount,layoutInset,mainReflow);
        if(i.getIntExtra("fromX",-1)!=from.mainX || i.getIntExtra("toX",-1)!=to.mainX
                || i.getIntExtra("top",-1)!=from.top || i.getIntExtra("width",-1)!=from.sideWidth
                || i.getIntExtra("height",-1)!=from.rowHeight(selected,count)
                || i.getIntExtra("rowTop",-1)!=from.rowTop(selected,count))
            throw new IllegalStateException("主副物理尺寸不一致");
        band=i.getParcelableExtra("band",SurfaceControl.class);
        lanes=i.getParcelableArrayExtra("lanes");hints=i.getParcelableArrayExtra("hints",SurfaceControl.class);
        validSurface(band);
        if(lanes==null || lanes.length!=actors.length)throw new IllegalStateException("换边容器不完整");
        for(int k=0;k<actors.length;k++){
            int id=k==0?outgoing:slots.task(k-1);
            if(id<0)continue;
            if(k>count)throw new IllegalStateException("有不可见的副任务");
            validSurface(lanes[k]);
            SavedTask actor=actors[k]=saved.get(id);
            if(actor==null || (k>0 && !actor.dirty) || !WorkspaceUsers.allows(Wm.context,principal,actor.user))
                throw new IllegalStateException("参与换边的原任务不可用");
            starts[k]=WorkspaceMotion.place(from,k-1,count);
            if(k==0 && Wm.ownedSpec!=null)starts[k]=new WorkspaceMotion(from.mainX,StepMembers.getFloatField(Wm.ownedSpec,"offsetY"),from.mainScale);
            ends[k]=WorkspaceMotion.place(to,WorkspaceMotion.destinationSlot(k-1,selected),count);
            surfaces[k]=(SurfaceControl)call(actor.task,"getSurfaceControl");
        }
        if(actors[0]!=null && !actors[0].token.equals(i.getParcelableExtra("token")))throw new IllegalStateException("主任务令牌已变更");
        backdrop=outgoing>=0 && promoted<0?new NativeBackdrop(i,actors[0]):null;
        validate();
    }
    void validate() {
        validSurface(band);
        if(!Wm.active || field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec)
            throw new IllegalStateException("失去原屏缩放所有权");
        for(int k=0;k<actors.length;k++){
            SavedTask r=actors[k];if(r==null)continue;
            if(liveTask(r.id,r.token)!=r.task || call(r.task,"getParent")!=r.parent
                    || (Integer)call(r.task,"getWindowingMode")!=(k==0?1:6)
                    || (Integer)call(call(r.task,"getSurfaceControl"),"getLayerId")!=r.layerId)
                throw new IllegalStateException("换边任务身份或模式变化："+r.id);
            validSurface(lanes[k]);
        }
        if(actors[0]!=null && !WorkspaceMainFocus.matches(actors[0].task))
            throw new IllegalStateException("换边期间主任务失去焦点");
    }
    void start(ResultReceiver reply) {
        WorkspaceIme.cancel();
        if(actors[0]!=null)actors[0].dirty=true; // Includes a fullscreen task moved before the role WCT.
        Wm.handler.postDelayed(()->{
            if(flip==this && !ending)finish("换边等待宿主落位超时");
        },5000);
        Runnable begin=()->{
            if(flip!=this || ending)return;
            try {frame(0,true,false,reply);}
            catch(Throwable error){finish("原任务转场失败："+error);}
        };
        WorkspaceImeHandoff.prepare(this,()->{
            if(backdrop!=null)backdrop.prepare(this,begin);else begin.run();
        });
    }
    private void animate(ResultReceiver reply){
        if(flip!=this || ending)return;
        try{
            clock=Choreographer.getInstance();
            callback=new Choreographer.FrameCallback(){
                @Override public void doFrame(long nanos){
                    if(callback!=this || flip!=NativeFlip.this || ending)return;
                    if(firstFrameNanos==0)firstFrameNanos=nanos;
                    if(lastFrameNanos!=0)maxFrameGapNanos=Math.max(maxFrameGapNanos,nanos-lastFrameNanos);
                    lastFrameNanos=nanos;
                    float time=Math.min(1f,(nanos-firstFrameNanos)/320_000_000f);
                    try{
                        synchronized(Wm.lock){frame(easing.getInterpolation(time),false,time==1,reply);}
                        if(time<1 && callback==this)clock.postFrameCallback(this);
                    }catch(Throwable error){finish("换边画面中断："+error);}
                }
            };
            clock.postFrameCallback(callback);
        }catch(Throwable error){finish("原任务转场失败："+error);}
    }
    void frame(float progress,boolean first,boolean last,ResultReceiver reply) throws Exception {
        if(!Wm.active || field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec)
            throw new IllegalStateException("换边时原屏缩放已被其他窗口接管");
        if(first || last)validate();
        if(animationTx==null)animationTx=new SurfaceControl.Transaction();
        SurfaceControl.Transaction tx=animationTx;
        {
            if(hints!=null && hints.length==2){
                if(hints[0]!=null && hints[0].isValid())tx.setAlpha(hints[0],targetLeft==sideLeft?1:1-progress);
                if(hints[1]!=null && hints[1].isValid())tx.setAlpha(hints[1],progress);
            }

            if(first){
                // With all actors isolated, remove ancestor magnification in the
                // SAME transaction that moves them to physical animation lanes.
                // Until this point HOME preparation still needs the native main
                // transform. A logical flip request alone cannot remove it.
                ownsTransforms=true;
                stageMagnification(tx);
                tx.setVisibility(band,true);
            }
            for(int k=0;k<actors.length;k++){
                SavedTask r=actors[k];if(r==null)continue;
                SurfaceControl sc=surfaces[k];
                SurfaceControl lane=(SurfaceControl)lanes[k];
                if(!sc.isValid() || !lane.isValid())
                    throw new IllegalStateException("动画中的任务父层已变更："+r.id);
                if(first){
                    // Preview tasks can retain descendant specs from an earlier
                    // native launch. Every actor enters the physical lane at unity.
                    call(r.task,"clearMagnificationSpec",tx);
                    tx.reparent(sc,lane).setScale(sc,1,1).setPosition(sc,0,0).setAlpha(sc,1).setVisibility(sc,true);
                    call(tx,"setWindowCrop",sc,logical);
                }
                WorkspaceMotion pos=starts[k].towards(ends[k],progress);
                // Animate our container, not the task surface that WM may reposition.
                // Identity/mode checks stay at both transaction boundaries.
                tx.setScale(lane,pos.scale,pos.scale).setPosition(lane,pos.x,pos.y-from.top);
            }
            if(first)SurfaceCommit.observe(tx,Wm.handler::post,()->animate(reply));
            if(last)SurfaceCommit.observe(tx,Wm.handler::post,()->finishFrame(reply));
            tx.apply();attached=true;frames++;
        }
    }
    void finishFrame(ResultReceiver reply){
        if(flip!=this || ending)return;
        committed=true;
        String message="工作区转场末帧已提交；路径="+(outgoing<0?"副区展开":"主副交换")
                +"；回调帧数="+frames+"；最大回调间隔ms="+(maxFrameGapNanos/1_000_000f)+"；非屏幕呈现帧率";
        if(targetLeft==sideLeft){
            // Fixed placement needs no host relayout. Land the original tasks now,
            // while their final animation pose is still owned, without waiting for
            // SystemUI's render queue to round-trip another roles request.
            report(null,0,message,-1);
            try{roles(new Intent(request).putExtra("flipLanded",true),reply);}
            catch(Exception|LinkageError failure){
                respond(reply,-1,base(),"转场末帧交接失败："+failure);
                finish("转场末帧交接失败，归还原任务");
            }
        }else{
            android.os.Bundle b=base();b.putBoolean("targetLeft",targetLeft);
            respond(reply,0,b,message);
        }
    }
    void checkRoles(Intent i) {
        if(!attached || !committed || i.getIntExtra("slot",-1)!=selected
                || i.getIntExtra("task",-1)!=outgoing || i.getIntExtra("previous",-1)!=promoted)
            throw new IllegalStateException("换边末帧与任务交接不匹配");
        validate();
    }
    /** Merge peer return and the reveal of the destination into the same role transaction. */
    void land(SurfaceControl.Transaction tx,SurfaceControl preview) {
        for(int k=1;k<actors.length;k++){
            if(k==selected+1 || actors[k]==null)continue;
            SurfaceControl sc=(SurfaceControl)call(actors[k].task,"getSurfaceControl");
            WorkspaceMotion end=ends[k];
            tx.reparent(sc,preview);
            call(tx,"setMatrix",sc,end.scale,0f,0f,end.scale);
            tx.setPosition(sc,end.x-to.sideX,end.y-to.top);
        }
        // A returning task leaves a transparent band with only the empty-cell
        // backing. SystemUI removes it after its actual slot frame commits.
        if(outgoing>=0)tx.setVisibility(band,false);
    }
    void cancelAnimator(){
        if(clock!=null && callback!=null)clock.removeFrameCallback(callback);
        callback=null;
        if(animationTx!=null){animationTx.close();animationTx=null;}
    }
    boolean moves(SavedTask r){
        for(SavedTask actor:actors)if(actor==r)return true;
        return false;
    }
    /** A fullscreen task can have no bounds change to trigger a deferred WCT transaction. */
    void restoreParents(SurfaceControl.Transaction tx){
        for(SavedTask r:actors){
            if(r==null || !r.dirty || liveTask(r.id,r.token)!=r.task || call(r.task,"getParent")!=r.parent)continue;
            SurfaceControl sc=(SurfaceControl)call(r.task,"getSurfaceControl");
            if((Integer)call(sc,"getLayerId")!=r.layerId)continue;
            tx.reparent(sc,(SurfaceControl)call(r.parent,"getSurfaceControl"));
            call(tx,"setMatrix",sc,1f,0f,0f,1f);call(tx,"setWindowCrop",sc,(Object)null);
            tx.setPosition(sc,r.position.x,r.position.y).setAlpha(sc,1).setVisibility(sc,true);
        }
        if(band.isValid())tx.setVisibility(band,false);
    }
    void close(){
        cancelAnimator();
        for(Parcelable lane:lanes)if(lane instanceof SurfaceControl)((SurfaceControl)lane).release();
        if(hints!=null)for(SurfaceControl hint:hints)if(hint!=null)hint.release();
        band.release();
    }
}
