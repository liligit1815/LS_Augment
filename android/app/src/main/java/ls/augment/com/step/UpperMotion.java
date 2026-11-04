package ls.augment.com.step;

import android.animation.*;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.*;
import android.view.SurfaceControl;
import android.view.animation.AccelerateDecelerateInterpolator;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Scale only the live task surface; the physical input guard remains in front until commit. */
final class UpperMotion {
    static ValueAnimator current;
    static void cancel(){
        ValueAnimator run=current;current=null;
        if(run!=null){run.removeAllUpdateListeners();run.removeAllListeners();run.cancel();}
    }
    static void position(SurfaceControl.Transaction tx,SurfaceControl sc,Rect bounds,float x,float y,float scale){
        call(tx,"setMatrix",sc,scale,0f,0f,scale);
        tx.setPosition(sc,x+bounds.width()*(1-scale)/2f,y+bounds.height()*(1-scale)/2f);
    }
    static void play(SavedTask record,boolean entering,Runnable done){play(record,entering,false,done);}
    static void play(SavedTask record,boolean entering,boolean mainPane,Runnable done){
        IBinder expected=owner;
        CommitBarrier group=pendingCommit=new CommitBarrier();
        ValueAnimator run=ValueAnimator.ofFloat(entering?.02f:1,entering?1:.02f);current=run;
        run.setDuration(entering?180:160);run.setInterpolator(new AccelerateDecelerateInterpolator());
        Wm.handler.postDelayed(()->{if(current==run && !ending)finish("顶部收展超时");},1600);
        run.addUpdateListener(a->{
            if(current!=run || ending)return;
            try{frame(expected,record,(Float)a.getAnimatedValue(),mainPane,null);}
            catch(Throwable error){finish("顶窗收展中断："+error);}
        });
        run.addListener(new AnimatorListenerAdapter(){public void onAnimationEnd(Animator a){
            if(current!=run || ending)return;
            try{
                frame(expected,record,entering?1:.02f,mainPane,group);
                current=null;group.seal();awaitCommit(group,expected,SystemClock.uptimeMillis()+1200,done,()->finish("顶窗收展末帧未确认"));
            }catch(Throwable error){finish("顶窗末帧中断："+error);}
        }});
        run.start();
    }
    static void mainScale(float progress)throws Exception{
        WorkspaceLayout layout=new WorkspaceLayout(logical.width(),logical.height(),Wm.context.getResources().getDisplayMetrics().density,sideLeft);
        float scale=layout.mainScale*progress,margin=layout.mainScale-scale;
        Wm.moveSpec(scale,layout.mainX+layout.width*margin/2,layout.top+layout.height*margin/2);
    }
    static void frame(IBinder expected,SavedTask record,float scale,boolean mainPane,CommitBarrier last)throws Exception{
        synchronized(Wm.lock){
                if(mainPane){
                    if(owner!=expected || liveTask(record.id,record.token)!=record.task || call(record.task,"getParent")!=record.parent
                            || (Integer)call(record.task,"getWindowingMode")!=1 || call(Wm.display,"getFocusedRootTask")!=record.task)
                        throw new IllegalStateException("主区收展目标已变化");
                    mainScale(scale);
                    if(last!=null){Object tx=call(Wm.display,"getPendingTransaction");trackCommit(tx,last);call(tx,"apply");}
                    return;
                }
                if(owner!=expected || record!=NativeTopTask.upper || liveTask(record.id,record.token)!=record.task
                        || call(record.task,"getParent")!=record.parent || !NativeTopTask.bounds.equals(call(record.task,"getBounds")))
                    throw new IllegalStateException("顶窗收展目标已变化");
                SurfaceControl sc=(SurfaceControl)call(record.task,"getSurfaceControl");
                if((Integer)call(sc,"getLayerId")!=record.layerId)throw new IllegalStateException("顶窗图层已变化");
                Point pos=(Point)call(record.task,"getRelativePosition");
                try(SurfaceControl.Transaction tx=new SurfaceControl.Transaction()){
                    position(tx,sc,NativeTopTask.bounds,pos.x,pos.y,scale);
                    if(last!=null)trackCommit(tx,last);
                    tx.apply();
                }
            }
    }
}
