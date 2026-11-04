package ls.augment.com.step;

import java.lang.reflect.Method;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** An original side task is only always-on-top for its preview. Keep other recents filters native. */
final class WorkspaceRecents {
    static final ThreadLocal<SavedTask> querying=new ThreadLocal<>();
    static void installShade(ClassLoader cl){
        try{
            Class<?> ws=Class.forName("com.android.server.wm.WindowState",false,cl);
            Method touch=LocalLandscape.exact(ws,"getSurfaceTouchableRegion",void.class,android.graphics.Region.class,android.view.WindowManager.LayoutParams.class);
            Method frame=LocalLandscape.exact(ws,"getFrame",android.graphics.Rect.class);
            if(StepMembers.findField(ws,"mInvGlobalScale").getType()!=float.class)throw new NoSuchFieldException("window scale");
            StepHooks.hookMethod(touch,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(!active || ending || p.hasThrowable())return;
                android.view.WindowManager.LayoutParams a=(android.view.WindowManager.LayoutParams)p.args[1];
                if(a==null || a.type!=2040 || !"NotificationShade".contentEquals(a.getTitle()) || !"com.android.systemui".equals(a.packageName))return;
                try{
                    if(call(p.thisObject,"getDisplayContent")!=Wm.display || field(p.thisObject,"mActivityRecord")!=null
                            || StepMembers.getFloatField(p.thisObject,"mInvGlobalScale")!=1f)return;
                    android.graphics.Rect bounds=(android.graphics.Rect)frame.invoke(p.thisObject);
                    if(bounds!=null && !bounds.isEmpty())((android.graphics.Region)p.args[0]).op(0,0,bounds.width(),bounds.height(),android.graphics.Region.Op.INTERSECT);
                }catch(ReflectiveOperationException e){report(null,0,"通知面板保留原触区："+e,-1);}
            }});
        }catch(Throwable e){report(null,0,"通知面板物理边界接口不可用："+e,-1);}
    }
    static void install(ClassLoader cl){
        try{
            Class<?> task=Class.forName("com.android.server.wm.Task",false,cl),recents=Class.forName("com.android.server.wm.RecentTasks",false,cl);
            Method visible=LocalLandscape.exact(recents,"isVisibleRecentTask",boolean.class,task);
            Method onTop=LocalLandscape.exact(task,"isAlwaysOnTop",boolean.class);
            StepHooks.hookMethod(onTop,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                SavedTask r=querying.get();
                if(r!=null && r.task==p.thisObject && active && !ending && r.dirty && saved.get(r.id)==r && slots.index(r.id)>=0
                        && !p.hasThrowable() && Boolean.TRUE.equals(p.getResult()))p.setResult(false);
            }});
            StepHooks.hookMethod(visible,new StepHook(){
                protected void beforeHookedMethod(MethodHookParam p){
                    p.setObjectExtra("stepPrevious",querying.get());querying.remove();
                    if(!active || ending || !Thread.holdsLock(Wm.lock) || p.args[0]==null)return;
                    SavedTask r=saved.get((Integer)field(p.args[0],"mTaskId"));
                    if(r!=null && r.task==p.args[0] && r.dirty && slots.index(r.id)>=0)querying.set(r);
                }
                protected void afterHookedMethod(MethodHookParam p){
                    SavedTask previous=(SavedTask)p.getObjectExtra("stepPrevious");if(previous==null)querying.remove();else querying.set(previous);
                }
            });
        }catch(Throwable error){report(null,0,"最近任务沿用原厂过滤："+error,-1);}
    }
}
