package ls.augment.com.step;

import android.graphics.Point;
import android.view.SurfaceControl;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Reconcile the held upper surface in the actual native start/finish transaction. */
final class UpperTaskPresentation {
    static void isolateTransition(Object info,SurfaceControl.Transaction tx)throws ReflectiveOperationException{
        if(!active || ending || pendingCommit!=null || UpperMotion.current!=null || flip!=null)return;
        java.util.List<?> changes=(java.util.List<?>)call(info,"getChanges");
        boolean main=false;
        for(Object change:changes){
            Object task=call(change,"getTaskInfo");
            if(task==null || NativeTopTask.held(((Integer)field(task,"taskId")).intValue()))continue;
            Object window=field(field(task,"configuration"),"windowConfiguration");
            if((Integer)call(window,"getWindowingMode")==1)main=true;
        }
        if(!main)return;
        int changeMode=StepMembers.findField(android.view.WindowManager.class,"TRANSIT_CHANGE").getInt(null);
        java.util.ArrayList<Object> excluded=new java.util.ArrayList<>();
        for(Object change:changes){
            Object task=call(change,"getTaskInfo");
            if(task==null || (Integer)call(change,"getMode")!=changeMode)continue;
            SavedTask record=saved.get((Integer)field(task,"taskId"));
            if(record==null || !owns(record.task) || !record.token.equals(field(task,"token"))
                    || (Integer)call(call(change,"getLeash"),"getLayerId")!=record.layerId)continue;
            excluded.add(change);
        }
        if(excluded.isEmpty())return;
        // Remote launchers create and animate their own leashes after Shell's
        // start hook has returned. A held top page is not a main-region animation
        // participant: restore its verified surface in the native start and do
        // not hand that CHANGE target to the remote animation at all.
        stage(tx);
        changes.removeAll(excluded);
        diagnostic("UPPER_TRANSITION","isolated="+excluded.size()+";evidence=verified_task_leash");
    }
    static boolean owns(Object task){
        SavedTask record=NativeTopTask.held(task);
        return active && !ending && Thread.holdsLock(Wm.lock) && record!=null && record.dirty
                && saved.get(record.id)==record && WorkspaceUsers.allows(Wm.context,principal,record.user)
                && liveTask(record.id,record.token)==task && call(task,"getParent")==record.parent
                && call(task,"getDisplayContent")==Wm.display && (Integer)call(task,"getWindowingMode")==6
                && (Integer)call(call(task,"getSurfaceControl"),"getLayerId")==record.layerId;
    }
    static void stage(SurfaceControl.Transaction tx){
        if(!active || ending || pendingCommit!=null || UpperMotion.current!=null
                || NativeTopTask.bounds==null || NativeTopTask.viewport==null)return;
        for(SavedTask record:new SavedTask[]{NativeTopTask.app,NativeTopTask.navigation}){
            if(record==null || !owns(record.task) || !runningActivity(record.task)
                    || !NativeTopTask.bounds.equals(call(record.task,"getBounds")))continue;
            SurfaceControl surface=(SurfaceControl)call(record.task,"getSurfaceControl");
            SurfaceControl parent=(SurfaceControl)call(record.parent,"getSurfaceControl");
            validSurface(parent);
            Point at=(Point)call(record.task,"getRelativePosition");
            tx.reparent(surface,parent);
            UpperMotion.position(tx,surface,NativeTopTask.bounds,NativeTopTask.viewport,at.x,at.y,1f);
            boolean visible=record==NativeTopTask.upper && !NativeTopTask.hidden
                    && !Boolean.TRUE.equals(call(record.task,"isForceHidden"));
            tx.setAlpha(surface,1f).setVisibility(surface,visible);
        }
    }
}
