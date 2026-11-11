package ls.augment.com.step;

import android.animation.*;
import android.os.*;
import android.view.animation.PathInterpolator;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

final class WorkspaceZoom {
    static ValueAnimator motion;
    static boolean entered;
    static void cancel(){
        ValueAnimator old=motion;motion=null;
        if(old!=null){old.removeAllUpdateListeners();old.removeAllListeners();old.cancel();}
    }
    static void start(boolean enter,long starts,ResultReceiver reply){
        if(enter==entered || motion!=null || flip!=null || !interactive(Wm.context))
            throw new IllegalStateException("当前工作区不能切换缩放");
        WorkspaceIme.cancel();
        WorkspaceLayout layout=WorkspaceLayout.create(logical.width(),logical.height(),Wm.context.getResources().getDisplayMetrics().density,sideLeft,layoutCount,layoutInset,mainReflow);
        synchronized(Wm.lock){if(layout.reflow)WorkspaceMainBounds.use(enter?layout:null);}
        IBinder expected=owner;ValueAnimator run=ValueAnimator.ofFloat(enter?0:1,enter?1:0);
        motion=run;run.setInterpolator(new PathInterpolator(.34f,.69f,.1f,1));run.setDuration(300);
        long delay=starts-SystemClock.uptimeMillis();run.setStartDelay(Math.max(0,Math.min(delay,80)));
        run.addUpdateListener(a->{
            if(motion!=run || expected!=owner || ending)return;
            float p=(Float)a.getAnimatedValue();
            try{synchronized(Wm.lock){
                Wm.moveSpec(p==0?1:1+(layout.mainScale-1)*p,layout.mainX*p,layout.top*p);
                if(enter){Object tx=call(Wm.display,"getPendingTransaction");NativeEntry.frame(tx,p);call(tx,"apply");}
            }}
            catch(Throwable error){finish("主屏转场中断："+error);}
        });
        run.addListener(new AnimatorListenerAdapter(){public void onAnimationEnd(Animator a){
            if(motion!=run || expected!=owner || ending)return;
            motion=null;entered=enter;
            CommitBarrier group=pendingCommit=new CommitBarrier();
            try{
                synchronized(Wm.lock){
                    Wm.moveSpec(enter?layout.mainScale:1,enter?layout.mainX:0,enter?layout.top:0);
                    Object tx=call(Wm.display,"getPendingTransaction");if(enter)NativeEntry.frame(tx,1);
                    trackCommit(tx,group);call(tx,"apply");
                }
                group.seal();awaitCommit(group,expected,SystemClock.uptimeMillis()+1200,()->{
                    if(enter)NativeEntry.revealed=true;
                    respond(reply,0,base(),"工作区缩放末帧已提交");WorkspaceIme.request();},
                        ()->finish("主屏缩放末帧未确认"));
            }catch(Throwable error){finish("主屏转场提交失败："+error);}
        }});
        run.start();
        if(delay<0)run.setCurrentPlayTime(Math.min(-delay,299));
    }
}
