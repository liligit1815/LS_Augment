package ls.augment.com.step;

import android.view.View;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Set;

/** Step's unlocked button has its own touch stream, outside the QS falsing collector. */
final class WorkspaceRecorderTap {
    static final ThreadLocal<Tap> active=new ThreadLocal<>();
    static final Set<Method> hooked=new HashSet<>();
    static final class Tap {
        final Object manager;final View anchor;final int user;
        Tap(Object manager,View anchor,int user){this.manager=manager;this.anchor=anchor;this.user=user;}
    }
    static boolean owns(Object manager){
        Tap tap=active.get();
        LiveWorkspace host=LiveWorkspace.current;
        return tap!=null && tap.manager==manager && StepRuntime.enabled
                && android.os.Looper.myLooper()==android.os.Looper.getMainLooper()
                && host!=null && !host.closed && !host.closing && host.quickBar!=null
                && !host.quickBar.closed && host.quickBar.recorder==tap.anchor
                && host.quickBar.userId==tap.user && host.quickBar.currentUser()
                && tap.anchor.isAttachedToWindow() && tap.anchor.isShown() && tap.anchor.isEnabled()
                && StepRuntime.interactive(StepRuntime.Shell.context);
    }
    static void click(Object tile,int user,View anchor,Object source)throws ReflectiveOperationException{
        Tap previous=active.get();
        try{
            active.remove();
            try{
                Object manager=StepMembers.findField(tile.getClass(),"mFalsingManager").get(tile);
                Method method=OwnershipBridge.method(manager.getClass(),"isFalseTap",int.class);
                if(method.getReturnType()!=boolean.class)throw new NoSuchMethodException("QS falsing signature");
                if(!hooked.contains(method)){
                    StepHooks.hookMethod(method,new StepHook(){
                        @Override protected void afterHookedMethod(MethodHookParam p){
                            if(!p.hasThrowable() && Boolean.TRUE.equals(p.getResult()) && owns(p.thisObject)){
                                p.setResult(false);
                                StepRuntime.diagnostic("RECORDER_TAP","accepted_unlocked_step_button;native_tile_policy_retained");
                            }
                        }
                    });
                    hooked.add(method);
                }
                active.set(new Tap(manager,anchor,user));
            }catch(ReflectiveOperationException|RuntimeException|LinkageError missing){
                StepRuntime.diagnostic("RECORDER_TAP_CAPABILITY",missing.getClass().getSimpleName()+";native_click_preserved");
            }
            // Keep QSTile.click and its worker queue: disabled-by-policy and OEM checks still run.
            NativeTiles.click.invoke(tile,source);
        }finally{if(previous==null)active.remove();else active.set(previous);}
    }
}
