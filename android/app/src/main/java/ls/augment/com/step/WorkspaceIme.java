package ls.augment.com.step;

import android.animation.ValueAnimator;
import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.graphics.Rect;
import android.os.IBinder;
import android.view.WindowManager;
import android.view.animation.PathInterpolator;
import java.lang.reflect.Method;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Read the owning display's actual IME source; move the app and its native input transform together. */
final class WorkspaceIme {
    static Method sourceProvider,source,frame,visible,windowFrame;
    static Object controller;
    static boolean available,queued,reportedFailure;
    static ValueAnimator motion;
    static WorkspaceImeGeometry.Pose requested;
    static String lastEvidence="";

    static void install(ClassLoader cl){
        try{
            controller=field(Wm.display,"mInsetsStateController");
            sourceProvider=OwnershipBridge.method(controller.getClass(),"getImeSourceProvider");
            Object provider=sourceProvider.invoke(controller);
            source=OwnershipBridge.method(provider.getClass(),"getSource");
            Object current=source.invoke(provider);
            frame=LocalLandscape.exact(current.getClass(),"getFrame",Rect.class);
            visible=LocalLandscape.exact(current.getClass(),"isVisible",boolean.class);
            windowFrame=LocalLandscape.exact(Class.forName("com.android.server.wm.WindowState",false,cl),"getFrame",Rect.class);
            Method layout=LocalLandscape.exact(controller.getClass(),"onPostLayout",void.class);
            StepHooks.hookMethod(layout,new StepHook(){
                @Override protected void afterHookedMethod(MethodHookParam p){if(!p.hasThrowable() && p.thisObject==controller)request();}
            });
            // This runs before/without a layout on some IME hide and editor-switch paths.
            Method client=OwnershipBridge.method(provider.getClass(),"setClientVisible",boolean.class);
            if(client.getReturnType()!=void.class && client.getReturnType()!=boolean.class)throw new NoSuchMethodException("IME client visibility result");
            StepHooks.hookMethod(client,new StepHook(){
                @Override protected void afterHookedMethod(MethodHookParam p){if(!p.hasThrowable())request();}
            });
            available=true;
            report(null,0,"键盘避让接口已核验：原屏 IME source / 窗口边界",-1);
        }catch(Exception|LinkageError missing){available=false;report(null,0,"键盘避让接口缺失，保留原厂布局："+missing,-1);}
    }
    static void request(){
        if(!available || !active || ending || Wm.handler==null)return;
        synchronized(WorkspaceIme.class){if(queued)return;queued=true;}
        IBinder expected=owner;
        Wm.handler.post(()->{
            synchronized(WorkspaceIme.class){queued=false;}
            synchronized(Wm.lock){
                if(owner!=expected || !active || ending || !WorkspaceZoom.entered || WorkspaceZoom.motion!=null || flip!=null || pendingCommit!=null)return;
                try{update(expected);}catch(Exception|LinkageError error){
                    cancel();
                    // A disappearing editor must not strand the next app above its main region.
                    try{
                        if(Wm.active && field(Wm.display,"mMagnificationSpec")==Wm.ownedSpec)
                            Wm.moveWorkspace(new WorkspaceLayout(logical.width(),logical.height(),Wm.context.getResources().getDisplayMetrics().density,sideLeft));
                    }catch(Exception|LinkageError restore){report(null,0,"键盘避让归位未确认："+restore,-1);}
                    if(!reportedFailure){reportedFailure=true;report(null,0,"键盘避让读回不可用："+error,-1);}
                }
            }
        });
    }
    static void update(IBinder expected)throws Exception{
        WorkspaceLayout layout=new WorkspaceLayout(logical.width(),logical.height(),Wm.context.getResources().getDisplayMetrics().density,sideLeft);
        WorkspaceImeGeometry.Pose target=WorkspaceImeGeometry.pose(layout,false,0,0,0);
        Object item=source.invoke(sourceProvider.invoke(controller));
        Rect keyboard=new Rect((Rect)frame.invoke(item));
        Object input=call(Wm.display,"getImeInputTarget");
        Object win=input==null?null:call(input,"getWindowState");
        Object task=win==null?null:call(win,"getTask");
        boolean shown=Boolean.TRUE.equals(visible.invoke(item));
        String evidence="session="+session+";shown="+shown+";ime="+keyboard.toShortString();
        if(shown && task!=null && task==call(Wm.display,"getFocusedRootTask")
                && !ownsTask(task) && !physicalNativeWindow(task) && (Integer)call(task,"getWindowingMode")==1){
            Rect bounds=(Rect)windowFrame.invoke(win);
            WindowManager.LayoutParams attrs=(WindowManager.LayoutParams)field(win,"mAttrs");
            boolean docked=keyboard.left<=0 && keyboard.right>=logical.width() && keyboard.bottom>=logical.height()-Math.round(96*Wm.context.getResources().getDisplayMetrics().density);
            int bottom=WorkspaceImeGeometry.visibleBottom(bounds.bottom,keyboard.top);
            target=WorkspaceImeGeometry.pose(layout,docked,keyboard.top,bottom,layout.gap*2);
            evidence+=";task="+field(task,"mTaskId")+";window="+bounds.toShortString()
                    +";adjust="+(attrs.softInputMode&WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST)
                    +";docked="+docked+";visibleBottom="+bottom;
        }
        evidence+=";targetY="+target.y+";targetX="+target.x+";scale="+target.scale+";toolbarBottom="+layout.top;
        if(!evidence.equals(lastEvidence)){lastEvidence=evidence;diagnostic("IME_GEOMETRY",evidence);}
        if(!Wm.active || field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec || Wm.ownedSpec==null)return;
        WorkspaceImeGeometry.Pose current=new WorkspaceImeGeometry.Pose(StepMembers.getFloatField(Wm.ownedSpec,"scale"),
                StepMembers.getFloatField(Wm.ownedSpec,"offsetX"),StepMembers.getFloatField(Wm.ownedSpec,"offsetY"));
        if(close(target,motion!=null?requested:current))return;
        cancel();requested=target;
        final WorkspaceImeGeometry.Pose destination=target;
        ValueAnimator run=ValueAnimator.ofFloat(0,1);motion=run;
        run.setDuration(180);run.setInterpolator(new PathInterpolator(.2f,0,0,1));
        run.addUpdateListener(a->{
            synchronized(Wm.lock){
                if(motion!=run || owner!=expected || !active || ending || flip!=null || WorkspaceZoom.motion!=null){if(motion==run)cancel();return;}
                try{
                    float t=(Float)a.getAnimatedValue();
                    Wm.moveSpec(current.scale+(destination.scale-current.scale)*t,
                            current.x+(destination.x-current.x)*t,current.y+(destination.y-current.y)*t);
                }
                catch(Exception|LinkageError error){cancel();report(null,0,"键盘避让停止："+error,-1);}
            }
        });
        run.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator a){
            if(motion!=run)return;motion=null;
            report(null,0,"键盘避让位置与输入已同步；y="+destination.y+"；scale="+destination.scale+"；键盘顶边="+keyboard.top,-1);
        }});
        run.start();
    }
    static boolean close(WorkspaceImeGeometry.Pose a,WorkspaceImeGeometry.Pose b){
        return b!=null && Math.abs(a.scale-b.scale)<.0001f && Math.abs(a.x-b.x)<.5f && Math.abs(a.y-b.y)<.5f;
    }
    static void cancel(){
        ValueAnimator old=motion;motion=null;requested=null;
        if(old!=null){old.removeAllUpdateListeners();old.removeAllListeners();old.cancel();}
    }
}
