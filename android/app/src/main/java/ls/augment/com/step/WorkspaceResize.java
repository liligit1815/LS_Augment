package ls.augment.com.step;

import java.lang.reflect.Method;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Override only a leased original task, starting with its own admission transaction. */
final class WorkspaceResize {
    static boolean available;
    static int overrides;
    static Object checkingTop;
    static void install(ClassLoader cl){
        try{
            Class<?> task=Class.forName("com.android.server.wm.Task",false,cl);
            Method base=LocalLandscape.exact(task,"isResizeable",boolean.class);
            StepHook rule=new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(p.hasThrowable() || Boolean.TRUE.equals(p.getResult()) || !available || !active || ending || !Thread.holdsLock(Wm.lock))return;
                Object t=p.thisObject;
                SavedTask record=saved.get(StepMembers.getIntField(t,"mTaskId"));
                if(record==null || record.task!=t || (!record.dirty && t!=checkingTop && (flip==null || !flip.moves(record))))return;
                if(call(t,"getDisplayContent")!=Wm.display || call(t,"getParent")!=record.parent)return;
                int mode=(Integer)call(t,"getWindowingMode");
                if(mode==1 || mode==6){p.setResult(true);overrides++;}
            }};
            StepHooks.hookMethod(base,rule);
            for(Class<?>[] args:new Class<?>[][]{{boolean.class},{boolean.class,boolean.class}}){
                try{StepHooks.hookMethod(LocalLandscape.exact(task,"isResizeable",boolean.class,args),rule);}
                catch(NoSuchMethodException missing){}
            }
            available=true;
        }catch(Throwable e){report(null,0,"任务强制调整大小不可用："+e,-1);}
    }
    static void installUpperBounds(ClassLoader cl){
        try{
            Class<?> task=Class.forName("com.android.server.wm.Task",false,cl);
            Method adjust=LocalLandscape.exact(task,"adjustForMinimalTaskDimensions",void.class,android.graphics.Rect.class,
                    android.graphics.Rect.class,android.content.res.Configuration.class);
            StepHooks.hookMethod(adjust,new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                if(!active || ending || !Thread.holdsLock(Wm.lock))return;
                SavedTask top=NativeTopTask.upper;
                if(top==null || !top.dirty || top.task!=p.thisObject || NativeTopTask.bounds==null ||
                        !NativeTopTask.bounds.equals(p.args[0]) || call(top.task,"getParent")!=top.parent ||
                        call(top.task,"getDisplayContent")!=Wm.display || (Integer)call(top.task,"getWindowingMode")!=6)return;
                // Only this previously validated, physical upper viewport may be shorter than the ROM's desktop minimum.
                p.setResult(null);
            }});
        }catch(Throwable e){report(null,0,"原厂最小顶窗尺寸仍适用："+e,-1);}
    }
    static boolean supportsUpper(Object task){
        checkingTop=task;
        try{return Boolean.TRUE.equals(call(task,"supportsMultiWindowInDisplayArea",call(task,"getTaskDisplayArea")));}
        finally{checkingTop=null;}
    }
}
