package ls.augment.com.step;

import android.content.Intent;
import android.os.IBinder;
import android.view.SurfaceControl;
import java.util.Arrays;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Revalidate the entire prepared set before the common reveal and final readiness. */
final class NativeEntry {
    static SurfaceControl stage;
    static IBinder expectedOwner;
    static int[] expectedSlots;
    static boolean revealed;

    static void prepare(Intent request){
        if(stage!=null || WorkspaceZoom.entered)throw new IllegalStateException("工作区入场已经开始");
        int[] requested=request.getIntArrayExtra("entrySlots");
        validate(requested);
        SurfaceControl incoming=request.getParcelableExtra("entryStage",SurfaceControl.class);
        validSurface(incoming);
        stage=incoming;expectedOwner=owner;expectedSlots=requested.clone();revealed=false;
        diagnostic("ENTRY_GROUP","prepared;slots="+Arrays.toString(expectedSlots));
    }
    static void validate(int[] requested){
        if(!active || ending || !Wm.active || owner==null || !interactive(Wm.context)
                || field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec
                || requested==null || !Arrays.equals(requested,slots.snapshot()) || WorkspaceReadmit.pending!=null)
            throw new IllegalStateException("整组工作区任务或会话已经变化");
        for(int id:requested){
            if(id<0)continue;
            SavedTask r=saved.get(id);
            if(r==null || !r.dirty || !WorkspaceUsers.allows(Wm.context,principal,r.user)
                    || liveTask(id,r.token)!=r.task || call(r.task,"getParent")!=r.parent
                    || call(r.task,"getDisplayContent")!=Wm.display
                    || (Integer)call(r.task,"getWindowingMode")!=6 || !logical.equals(call(r.task,"getBounds"))
                    || (Integer)call(call(r.task,"getSurfaceControl"),"getLayerId")!=r.layerId || !runningActivity(r.task))
                throw new IllegalStateException("整组副任务身份未确认："+id);
            validSurface(call(r.task,"getSurfaceControl"));
            if(!WorkspaceReadmit.available)throw new IllegalStateException("缺少副任务绘制确认能力");
            Object activity=call(r.task,"topRunningActivity"),window=call(activity,"findMainWindow");
            if(window==null || !Boolean.TRUE.equals(call(window,"isDrawn")) || !Boolean.TRUE.equals(call(activity,"isReportedDrawn")))
                throw new IllegalStateException("整组副任务绘制尚未完成："+id);
        }
    }
    static void frame(Object transaction,float progress){
        if(stage==null)return;
        if(owner!=expectedOwner || ending)throw new IllegalStateException("整组入场会话已经结束");
        validSurface(stage);
        // The original main transform and every prepared side task's shared
        // alpha are submitted in the same display transaction.
        call(transaction,"setAlpha",stage,progress);
    }
    static void checkReady(Intent request){
        if(stage==null || !revealed || owner!=expectedOwner || !WorkspaceZoom.entered
                || !Arrays.equals(expectedSlots,request.getIntArrayExtra("entrySlots")))
            throw new IllegalStateException("整组入场末帧未确认");
        validSurface(stage);validate(expectedSlots);
    }
    static void reset(){
        if(stage!=null)stage.release();
        stage=null;expectedOwner=null;expectedSlots=null;revealed=false;
    }
}
