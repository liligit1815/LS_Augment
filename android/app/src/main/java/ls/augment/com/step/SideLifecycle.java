package ls.augment.com.step;

import java.lang.reflect.Method;
import java.util.function.Predicate;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Native multi-resume needs focusable tasks, while keyboard focus stays in the main pane. */
final class SideLifecycle {
    static boolean available;
    static void install(ClassLoader loader) {
        try {
            Class<?> area=Class.forName("com.android.server.wm.TaskDisplayArea",false,loader);
            Class<?> task=Class.forName("com.android.server.wm.Task",false,loader);
            Class<?> activity=Class.forName("com.android.server.wm.ActivityRecord",false,loader);
            Method focused=probe(area,task,activity);
            StepHooks.hookMethod(focused,new StepHook(){
                @Override protected void afterHookedMethod(MethodHookParam p) {
                    if(!available || p.hasThrowable() || !active || ending || !Thread.holdsLock(Wm.lock))return;
                    Object candidate=p.getResult();
                    try {
                        p.setResult(selectFocus(candidate,p.thisObject));
                    }catch(RuntimeException|LinkageError missing){
                        final android.os.IBinder expected=owner;
                        diagnostic("SIDE_LIFECYCLE","focus_restore_failed;reason="+missing);
                        Wm.handler.post(()->{if(owner==expected)finish("副区运行状态与主区焦点无法同时确认");});
                    }
                }
            });
            available=true;
            diagnostic("SIDE_LIFECYCLE_CAPABILITY",focused.toGenericString());
        }catch(Exception|LinkageError missing){
            available=false;diagnostic("SIDE_LIFECYCLE_CAPABILITY","native_fallback;reason="+missing);
        }
    }
    static Method probe(Class<?> area,Class<?> task,Class<?> activity)throws ReflectiveOperationException {
        Method focused=LocalLandscape.exact(area,"getFocusedRootTask",task);
        LocalLandscape.exact(area,"getRootTask",task,Predicate.class,boolean.class);
        LocalLandscape.exact(task,"isFocusable",boolean.class);
        LocalLandscape.exact(activity,"shouldResumeActivity",boolean.class,activity);
        LocalLandscape.exact(activity,"shouldPauseActivity",boolean.class,activity);
        return focused;
    }
    static Object selectFocus(Object candidate,Object area) {
        if(!available || !active || ending)return candidate;
        SavedTask side=owned(candidate);
        if(side==null || WorkspaceReadmit.allowsFocus(side,candidate))return candidate;
        // Keep the platform lifecycle decision intact. Redirect only its choice
        // of focused root; WindowState's existing key/IME guard still applies.
        Object main=eligibleMain(lastMain);
        if(!mainCandidate(main,area))main=call(area,"getRootTask",(Predicate<Object>)t->mainCandidate(t,area),true);
        return main==null?candidate:main;
    }
    static SavedTask owned(Object task) {
        if(task==null || !active || ending || call(task,"getDisplayContent")!=Wm.display)return null;
        int id=(Integer)field(task,"mTaskId");SavedTask record=saved.get(id);
        if((slots.index(id)<0 && !(WorkspaceBackFocus.mainPreferred && NativeTopTask.held(id))) || record==null || !record.dirty || record.task!=task
                || !WorkspaceUsers.allows(Wm.context,principal,record.user)
                || liveTask(id,record.token)!=task || call(task,"getParent")!=record.parent
                || (Integer)call(task,"getWindowingMode")!=6
                || (Integer)call(call(task,"getSurfaceControl"),"getLayerId")!=record.layerId)return null;
        return record;
    }
    static boolean mainCandidate(Object task,Object area) {
        if(task==null || call(task,"getTaskDisplayArea")!=area || call(task,"getDisplayContent")!=Wm.display
                || task!=call(task,"getRootTask") || WorkspaceMainFocus.secondary(task) || (Integer)call(task,"getWindowingMode")!=1
                || !Boolean.TRUE.equals(call(task,"isFocusable")) || !runningActivity(task)
                || !WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId")))return false;
        int type=(Integer)call(task,"getActivityType");
        return (type==1 || type==2) && Boolean.TRUE.equals(field(call(task,"getTaskInfo"),"isVisible"));
    }
    static boolean keepResumed() { return available && active && !ending; }
}
