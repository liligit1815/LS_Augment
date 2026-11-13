package ls.augment.com.step;

import java.util.ArrayList;
import java.util.List;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Settled side previews are not participants in a main desktop launch/back animation. */
final class SideTransitionTargets {
    static void isolate(Object info)throws ReflectiveOperationException{
        if(!settledSideSnapshot(slots.snapshot()))return;
        List<?> changes=(List<?>)call(info,"getChanges");
        boolean main=false;
        for(Object change:changes){
            Object task=call(change,"getTaskInfo");
            if(task==null)continue;
            int id=(Integer)field(task,"taskId");
            if(slots.index(id)>=0 || NativeTopTask.held(id))continue;
            Object config=field(field(task,"configuration"),"windowConfiguration");
            if((Integer)call(config,"getWindowingMode")==1)main=true;
        }
        if(!main)return;
        int mode=StepMembers.findField(android.view.WindowManager.class,"TRANSIT_CHANGE").getInt(null);
        ArrayList<Object> excluded=new ArrayList<>();
        for(Object change:changes){
            Object task=call(change,"getTaskInfo");
            if(task==null || (Integer)call(change,"getMode")!=mode)continue;
            int id=(Integer)field(task,"taskId");
            SavedTask record=saved.get(id);
            if(slots.index(id)<0 || record==null || !record.token.equals(field(task,"token"))
                    || (Integer)call(call(change,"getLeash"),"getLayerId")!=record.layerId)continue;
            excluded.add(change);
        }
        changes.removeAll(excluded);
        if(!excluded.isEmpty())diagnostic("SIDE_TRANSITION","isolated="+excluded.size()+";evidence=settled_native_task_leash");
    }
}
