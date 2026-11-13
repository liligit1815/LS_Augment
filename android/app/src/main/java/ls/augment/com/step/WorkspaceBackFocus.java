package ls.augment.com.step;

import android.view.InputDevice;
import android.view.MotionEvent;
import java.lang.reflect.Method;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Select the touched region before native predictive Back resolves its target. */
final class WorkspaceBackFocus {
    static boolean mainPreferred;
    static void install(ClassLoader loader){
        try{
            Class<?> type=Class.forName("com.android.systemui.navigationbar.gestural.EdgeBackGestureHandler",false,loader);
            Method motion=LocalLandscape.exact(type,"onMotionEvent",void.class,MotionEvent.class);
            StepHooks.hookMethod(motion,new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                observe((MotionEvent)p.args[0]);
            }});
            diagnostic("BACK_FOCUS_CAPABILITY",motion.toGenericString());
        }catch(ReflectiveOperationException|LinkageError missing){diagnostic("BACK_FOCUS_CAPABILITY","native_fallback;reason="+missing);}
    }
    static void observe(MotionEvent event){
        LiveWorkspace host=LiveWorkspace.current;
        if(event.getActionMasked()!=MotionEvent.ACTION_DOWN || !event.isFromSource(InputDevice.SOURCE_TOUCHSCREEN)
                || host==null || !host.ready || host.closing || host.closed || host.fence.busy() || host.channel==null
                || host.upperId<0 || host.quickBar==null || host.quickBar.upper==null || !host.quickBar.upper.visible
                || host.quickBar.sideToolbar!=null && host.quickBar.sideToolbar.panelAttached)return;
        try{
            if((Integer)call(event,"getDisplayId")!=0)return;
            WorkspaceChannel.focusRegion(host.channel,host.owner,event.getRawX(),event.getRawY());
        }catch(Exception|LinkageError missing){diagnostic("BACK_FOCUS","native_fallback;reason="+missing);}
    }
    static boolean select(float x,float y){
        if(!active || ending || pendingCommit!=null || flip!=null || !SideLifecycle.available
                || !interactive(Wm.context) || NativeTopTask.upper==null || NativeTopTask.hidden
                || !UpperTaskPresentation.owns(NativeTopTask.upper.task) || logical==null
                || !Float.isFinite(x) || !Float.isFinite(y) || x<0 || y<0 || x>=logical.width() || y>=logical.height())return false;
        boolean main=y>=NativeTopTask.viewport.bottom;
        if(main==mainPreferred)return true;
        mainPreferred=main;
        call(Wm.service,"updateFocusedWindowLocked",0,true);
        call(field(Wm.display,"mInputMonitor"),"updateInputWindowsLw",true);
        diagnostic("BACK_FOCUS","region="+(main?"main":"upper")+";upper="+NativeTopTask.upper.id);
        return true;
    }
}
