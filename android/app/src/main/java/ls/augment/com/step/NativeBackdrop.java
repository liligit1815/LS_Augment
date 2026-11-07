package ls.augment.com.step;

import android.content.Intent;
import android.os.SystemClock;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Draw the real desktop behind the still-fullscreen task before revealing it. */
final class NativeBackdrop {
    final SavedTask foreground;
    final int homeId, homeLayer;
    final Object homeToken, home, parent;

    NativeBackdrop(Intent request, SavedTask foreground) {
        if(!WorkspaceReadmit.available)throw new IllegalStateException("缺少桌面绘制确认接口");
        this.foreground=foreground;
        homeId=request.getIntExtra("home",-1);homeToken=request.getParcelableExtra("homeToken");
        home=liveTask(homeId,homeToken);
        if(home==null)throw new IllegalStateException("桌面原任务不可用");
        parent=call(home,"getParent");
        homeLayer=(Integer)call(call(home,"getSurfaceControl"),"getLayerId");
        validate();
    }
    void validate() {
        if(liveTask(homeId,homeToken)!=home || call(home,"getRootTask")!=home
                || call(home,"getParent")!=parent || (Integer)call(home,"getActivityType")!=2
                || (Integer)field(home,"mUserId")!=principal || call(home,"getDisplayContent")!=Wm.display
                || (Integer)call(call(home,"getSurfaceControl"),"getLayerId")!=homeLayer
                || liveTask(foreground.id,foreground.token)!=foreground.task
                || call(foreground.task,"getParent")!=foreground.parent
                || (Integer)call(foreground.task,"getWindowingMode")!=1)
            throw new IllegalStateException("桌面或主任务身份已变化");
    }
    void prepare(NativeFlip moving, Runnable ready) {
        // Leave the current task's original frame in place while WM resumes HOME.
        // Do not sleep or apply a WCT from inside the WM lock.
        Wm.handler.post(()->{
            if(flip!=moving || ending)return;
            try {
                Object wct=transaction();
                synchronized(Wm.lock){
                    validate();moving.validate();
                    foreground.dirty=true;
                    call(wct,"setForceTranslucent",foreground.token,true);
                    call(wct,"reorder",homeToken,true);
                    call(wct,"reorder",foreground.token,true);
                }
                apply(wct);
                awaitDraw(moving,ready,SystemClock.uptimeMillis()+1200);
            }catch(Throwable error){finish("桌面入场准备失败："+error);}
        });
    }
    void awaitDraw(NativeFlip moving,Runnable ready,long deadline) {
        if(flip!=moving || ending)return;
        try {
            synchronized(Wm.lock){
                validate();moving.validate();
                Object activity=call(home,"topRunningActivity");
                Object window=activity==null?null:call(activity,"findMainWindow");
                Object info=call(home,"getTaskInfo");
                if(window!=null && Boolean.TRUE.equals(field(info,"isVisible"))
                        && Boolean.TRUE.equals(call(window,"isDrawn"))
                        && Boolean.TRUE.equals(call(activity,"isReportedDrawn"))){
                    // Reapply the owned workspace pose before the first transparent frame.
                    replay();
                    diagnostic("BACKDROP","home_drawn;home="+homeId+";task="+foreground.id);
                    ready.run();return;
                }
            }
            if(SystemClock.uptimeMillis()>=deadline){finish("桌面首帧未确认，保留原任务并归还工作区");return;}
            Wm.handler.postDelayed(()->awaitDraw(moving,ready,deadline),16);
        }catch(Throwable error){finish("桌面首帧核验失败："+error);}
    }
}
