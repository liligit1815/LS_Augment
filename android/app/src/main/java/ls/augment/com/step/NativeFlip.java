package ls.augment.com.step;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Intent;
import android.os.Parcelable;
import android.os.ResultReceiver;
import android.view.SurfaceControl;
import android.view.animation.PathInterpolator;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** A system_server lease on the participating original surfaces, before changing any task roles. */
final class NativeFlip {
    final int selected, outgoing, promoted, count;
    final boolean targetLeft;
    final WorkspaceLayout from, to;
    final SurfaceControl band;
    final Parcelable[] lanes;
    final SurfaceControl[] hints;
    final SavedTask[] actors=new SavedTask[SideSlots.MAX_COUNT+1];
    final SurfaceControl[] surfaces=new SurfaceControl[actors.length];
    final WorkspaceMotion[] starts=new WorkspaceMotion[actors.length], ends=new WorkspaceMotion[actors.length];
    ValueAnimator animator;
    boolean attached, committed;
    int frames;

    NativeFlip(Intent i) {
        selected=i.getIntExtra("slot",-1); outgoing=i.getIntExtra("task",-1); promoted=i.getIntExtra("previous",-1);
        count=i.getIntExtra("visible",0);targetLeft=promoted<0?sideLeft:!sideLeft;
        if(!SideSlots.validCount(count) || selected<0 || selected>=count || promoted< -1 || outgoing<0
                || slots.task(selected)!=promoted || i.getBooleanExtra("leftSide",!sideLeft)!=sideLeft)
            throw new IllegalStateException("交换格或方向已经变化");
        float density=Wm.context.getResources().getDisplayMetrics().density;
        from=new WorkspaceLayout(logical.width(),logical.height(),density,sideLeft);
        to=new WorkspaceLayout(logical.width(),logical.height(),density,targetLeft);
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
            ends[k]=WorkspaceMotion.place(to,WorkspaceMotion.destinationSlot(k-1,selected),count);
            surfaces[k]=(SurfaceControl)call(actor.task,"getSurfaceControl");
        }
        if(!actors[0].token.equals(i.getParcelableExtra("token")))throw new IllegalStateException("主任务令牌已变更");
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
        if(!Boolean.TRUE.equals(field(call(actors[0].task,"getTaskInfo"),"isFocused")))
            throw new IllegalStateException("换边期间主任务失去焦点");
    }
    void start(ResultReceiver reply) {
        actors[0].dirty=true; // Includes a fullscreen task temporarily moved before the role WCT.
        Wm.handler.postDelayed(()->{
            if(flip==this && !ending)finish("换边等待宿主落位超时");
        },3500);
        try {
            frame(0,true,false,reply);
        }catch(Throwable error){finish("原任务转场失败："+error);}
    }
    private void animate(ResultReceiver reply){
        if(flip!=this || ending)return;
        try{
            animator=ValueAnimator.ofFloat(0,1);
            animator.setDuration(300);animator.setInterpolator(new PathInterpolator(.34f,.69f,.1f,1));
            animator.addUpdateListener(a->{
                if(flip!=this || ending)return;
                try{synchronized(Wm.lock){frame((Float)a.getAnimatedValue(),false,false,reply);}}
                catch(Throwable error){finish("换边画面中断："+error);}
            });
            animator.addListener(new AnimatorListenerAdapter(){
                @Override public void onAnimationEnd(Animator a){
                    if(flip!=NativeFlip.this || ending)return;
                    try{synchronized(Wm.lock){frame(1,false,true,reply);}}
                    catch(Throwable error){finish("换边末帧失败："+error);}
                }
            });
            animator.start();
        }catch(Throwable error){finish("原任务转场失败："+error);}
    }
    void frame(float progress,boolean first,boolean last,ResultReceiver reply) throws Exception {
        if(!Wm.active || field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec)
            throw new IllegalStateException("换边时原屏缩放已被其他窗口接管");
        if(first || last)validate();
        try(SurfaceControl.Transaction tx=new SurfaceControl.Transaction()){
            if(hints!=null && hints.length==2){
                if(hints[0]!=null && hints[0].isValid())tx.setAlpha(hints[0],targetLeft==sideLeft?1:1-progress);
                if(hints[1]!=null && hints[1].isValid())tx.setAlpha(hints[1],progress);
            }

            if(first)tx.setVisibility(band,true);
            for(int k=0;k<actors.length;k++){
                SavedTask r=actors[k];if(r==null)continue;
                SurfaceControl sc=surfaces[k];
                if(!sc.isValid() || call(r.task,"getParent")!=r.parent
                        || (Integer)call(call(r.task,"getSurfaceControl"),"getLayerId")!=r.layerId
                        || (Integer)call(r.task,"getWindowingMode")!=(k==0?1:6))
                    throw new IllegalStateException("动画中的任务父层已变更："+r.id);
                if(first){
                    if(k==0)call(r.task,"clearMagnificationSpec",tx);
                    tx.reparent(sc,(SurfaceControl)lanes[k]);
                    call(tx,"setWindowCrop",sc,logical);
                }
                WorkspaceMotion pos=starts[k].towards(ends[k],progress);
                call(tx,"setMatrix",sc,pos.scale,0f,0f,pos.scale);
                tx.setPosition(sc,pos.x,pos.y-from.top).setAlpha(sc,1).setVisibility(sc,true);
            }
            if(first)SurfaceCommit.observe(tx,Wm.handler::post,()->animate(reply));
            if(last)SurfaceCommit.observe(tx,Wm.handler::post,()->{
                if(flip!=this || ending)return;
                committed=true;
                android.os.Bundle b=base();b.putBoolean("targetLeft",targetLeft);
                respond(reply,0,b,"主副同步换边末帧已提交；帧数="+frames);
            });
            tx.apply();attached=true;frames++;
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
        tx.setVisibility(band,false);
    }
    void cancelAnimator(){
        if(animator!=null){animator.removeAllUpdateListeners();animator.removeAllListeners();animator.cancel();animator=null;}
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
