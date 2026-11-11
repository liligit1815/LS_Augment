package ls.augment.com.step;

import android.app.ActivityManager;
import android.app.TaskInfo;
import java.lang.reflect.Method;
import java.util.List;
import java.util.function.Predicate;
import static ls.augment.com.step.StepRuntime.*;

/** Read the live root selection; TaskInfo.isFocused can lag behind multi-resume. */
final class WorkspaceMainFocus {
    // This code runs in the hooked SystemUI process, which owns task-management
    // access. Resolve and verify its platform interface before using it.
    @android.annotation.SuppressLint("BlockedPrivateApi")
    static ActivityManager.RunningTaskInfo read(LiveWorkspace host) {
        try {
            Class<?> manager=Class.forName("android.app.ActivityTaskManager");
            Method get=manager.getDeclaredMethod("getService");get.setAccessible(true);
            Object service=get.invoke(null);
            Method focus=service.getClass().getMethod("getFocusedRootTaskInfo");focus.setAccessible(true);
            if(!TaskInfo.class.isAssignableFrom(focus.getReturnType()))
                throw new NoSuchMethodException("getFocusedRootTaskInfo result");
            TaskInfo selected=(TaskInfo)focus.invoke(service);
            if(selected==null)return null;
            if(host.slots.index(selected.taskId)>=0 || host.holdsUpper(selected.taskId)){
                Method roots=service.getClass().getMethod("getAllRootTaskInfos");roots.setAccessible(true);
                if(!List.class.isAssignableFrom(roots.getReturnType()))throw new NoSuchMethodException("getAllRootTaskInfos result");
                TaskInfo main=null;
                for(Object value:(List<?>)roots.invoke(service)){
                    if(!(value instanceof TaskInfo item))throw new IllegalStateException("未知根任务结构");
                    if(!candidate(item,host))continue;
                    if(main!=null)throw new IllegalStateException("可见主区任务不唯一");
                    main=item;
                }
                selected=main;
            }
            if(selected==null)return null;
            if(LiveWorkspace.number(selected,"displayId")!=0 || Boolean.TRUE.equals(call(selected,"hasParentTask")))return null;
            ActivityManager.RunningTaskInfo cached=host.info(selected.taskId);
            if(cached==null || !field(selected,"token").equals(field(cached,"token"))
                    || LiveWorkspace.number(cached,"userId")!=LiveWorkspace.number(selected,"userId")
                    || !LiveWorkspace.root(cached) || LiveWorkspace.number(cached,"displayId")!=0
                    || !call(selected,"getWindowingMode").equals(call(cached,"getWindowingMode")))
                throw new IllegalStateException("主区任务监听尚未同步");
            return cached;
        }catch(java.lang.reflect.InvocationTargetException failed){
            throw new IllegalStateException("系统主区查询失败",failed.getCause());
        }catch(ReflectiveOperationException|LinkageError missing){
            // Preserve the existing path only when the newer query cannot be resolved.
            diagnostic("MAIN_FOCUS","legacy_snapshot;reason="+missing);
            return host.cachedFocus();
        }
    }
    static boolean candidate(TaskInfo item,LiveWorkspace host){
        int type=(Integer)call(item,"getActivityType");
        return !Boolean.TRUE.equals(call(item,"hasParentTask")) && LiveWorkspace.number(item,"displayId")==0
                && (Integer)call(item,"getWindowingMode")==1 && (type==1 || type==2)
                && LiveWorkspace.flag(item,"isVisible") && item.topActivity!=null
                && host.slots.index(item.taskId)<0 && !host.holdsUpper(item.taskId)
                && WorkspaceUsers.allows(Shell.context,WorkspaceUsers.id(host.quickUser),LiveWorkspace.number(item,"userId"));
    }
    static boolean secondary(Object task){
        if(task==null)return false;
        int id=(Integer)field(task,"mTaskId");
        return NativeWorkspaceGuard.slots.index(id)>=0
                || NativeTopTask.held(task)!=null;
    }
    static boolean nativeCandidate(Object task){
        if(task==null || secondary(task) || call(task,"getDisplayContent")!=Wm.display
                || task!=call(task,"getRootTask") || (Integer)call(task,"getWindowingMode")!=1
                || !NativeWorkspaceGuard.runningActivity(task)
                || !WorkspaceUsers.allows(Wm.context,NativeWorkspaceGuard.principal,(Integer)field(task,"mUserId")))return false;
        int type=(Integer)call(task,"getActivityType");
        return (type==1 || type==2) && Boolean.TRUE.equals(call(task,"isFocusable"))
                && Boolean.TRUE.equals(field(call(task,"getTaskInfo"),"isVisible"));
    }
    static boolean matches(Object task){
        if(!Thread.holdsLock(Wm.lock) || !NativeWorkspaceGuard.active || NativeWorkspaceGuard.ending || !nativeCandidate(task))return false;
        Object current=call(Wm.display,"getFocusedRootTask");
        if(current==task)return true;
        if(!secondary(current))return false;
        Object area=call(current,"getTaskDisplayArea");
        if(area!=call(task,"getTaskDisplayArea"))return false;
        Predicate<Object> eligible=WorkspaceMainFocus::nativeCandidate;
        // A top app or a multi-resumed side app may own input focus. Only the
        // unique visible ordinary root beneath it can be the main participant.
        return call(area,"getRootTask",eligible,true)==task && call(area,"getRootTask",eligible,false)==task;
    }
}
