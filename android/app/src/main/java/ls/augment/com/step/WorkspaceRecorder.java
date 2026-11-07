package ls.augment.com.step;

import android.os.SystemClock;
import java.lang.reflect.*;
import java.util.*;

/** Finish the OEM tile's queued collapse action when Step invoked it from an already closed shade. */
final class WorkspaceRecorder {
    static final Map<Object,Request> pending=Collections.synchronizedMap(new WeakHashMap<>());
    static Class<?> recorder;
    static Field needed;
    static Method dependency,shade,expanded,moving,complete;
    static Class<?> central;
    static final class Request {final int user;final long until;Request(int id){user=id;until=SystemClock.uptimeMillis()+2000;}}
    static void install(ClassLoader cl,Class<?> anchor){
        try{
            Class<?> type=Class.forName("com.zte.qs.tiles.VideoScreenTile",false,cl);
            Method handle=OwnershipBridge.method(type,"handleClick",anchor);
            Field flag=StepMembers.findField(type,"mNeedScreenRecord");
            Class<?> host=Class.forName("com.android.systemui.statusbar.phone.CentralSurfaces",false,cl);
            Method getShade=OwnershipBridge.method(host,"getShadeController");
            Class<?> controller=Class.forName("com.android.systemui.shade.ShadeControllerImpl",false,cl);
            Method visible=OwnershipBridge.method(controller,"isExpandedVisible");
            Method motion=OwnershipBridge.method(controller,"isExpandingOrCollapsing");
            Method run=OwnershipBridge.method(controller,"runPostCollapseActions");
            Method get=Class.forName("com.android.systemui.Dependency",false,cl).getMethod("get",Class.class);
            if(handle.getReturnType()!=void.class || flag.getType()!=boolean.class || !Modifier.isStatic(flag.getModifiers())
                    || visible.getReturnType()!=boolean.class || motion.getReturnType()!=boolean.class || run.getReturnType()!=void.class
                    || !getShade.getReturnType().isAssignableFrom(controller))throw new NoSuchMethodException("OEM recorder collapse contract");
            needed=flag;central=host;shade=getShade;expanded=visible;moving=motion;complete=run;dependency=get;
            StepHooks.hookMethod(handle,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                Request request=pending.remove(p.thisObject);
                if(request==null || p.hasThrowable())return;
                StepRuntime.diagnostic("RECORDER_HANDLE","native_handler_returned;recording_state_not_assumed");
                Object tile=p.thisObject;
                StepRuntime.Shell.main.post(()->finish(tile,request));
            }});
            recorder=type;
        }catch(ReflectiveOperationException|RuntimeException|LinkageError unknown){
            StepRuntime.diagnostic("RECORDER_CAPABILITY",unknown.getClass().getSimpleName()+";native_click_preserved");
        }
    }
    static void mark(Object tile,int user,String key){
        if("videoscreen".equals(key) && recorder!=null && recorder.isInstance(tile)){
            Request request=new Request(user);pending.put(tile,request);
            StepRuntime.Shell.main.postDelayed(()->{
                if(pending.get(tile)==request){pending.remove(tile);StepRuntime.diagnostic("RECORDER_TIMEOUT","native_handler_not_reached");}
            },2100);
        }
    }
    static void finish(Object tile,Request request){
        try{
            if(SystemClock.uptimeMillis()>request.until || NativeTiles.find(request.user,"videoscreen")!=tile
                    || !StepRuntime.enabled || !StepRuntime.interactive(StepRuntime.Shell.context) || !needed.getBoolean(null))return;
            Object controller=shade.invoke(dependency.invoke(null,central));
            if(controller==null || !expanded.getDeclaringClass().isInstance(controller))return;
            // The expanded/animating path owns its normal completion; do not
            // enqueue a second start or bypass the OEM tile's disable checks.
            if(Boolean.TRUE.equals(expanded.invoke(controller)) || Boolean.TRUE.equals(moving.invoke(controller)))return;
            complete.invoke(controller);
            StepRuntime.diagnostic("RECORDER_DISPATCH","closed_shade_actions_completed;recording_state_not_assumed");
        }catch(ReflectiveOperationException|RuntimeException|LinkageError failure){
            StepRuntime.diagnostic("RECORDER_DISPATCH_FAILED",failure.getClass().getSimpleName());
        }
    }
}
