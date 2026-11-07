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
    static float requested=Float.NaN;

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
        float target=layout.top;
        Object item=source.invoke(sourceProvider.invoke(controller));
        Rect keyboard=new Rect((Rect)frame.invoke(item));
        Object input=call(Wm.display,"getImeInputTarget");
        Object win=input==null?null:call(input,"getWindowState");
        Object task=win==null?null:call(win,"getTask");
        if(Boolean.TRUE.equals(visible.invoke(item)) && task!=null && task==call(Wm.display,"getFocusedRootTask")
                && !ownsTask(task) && !physicalNativeWindow(task) && (Integer)call(task,"getWindowingMode")==1){
            Rect bounds=(Rect)windowFrame.invoke(win);
            WindowManager.LayoutParams attrs=(WindowManager.LayoutParams)field(win,"mAttrs");
            boolean docked=keyboard.left<=0 && keyboard.right>=logical.width() && keyboard.bottom>=logical.height()-Math.round(96*Wm.context.getResources().getDisplayMetrics().density);
            int bottom=(attrs.softInputMode&WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST)==WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING
                    ?bounds.bottom:Math.min(bounds.bottom,keyboard.top);
            target=WorkspaceImeGeometry.top(layout,docked,keyboard.top,bottom,layout.gap*2);
        }
        if(!Wm.active || field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec || Wm.ownedSpec==null)return;
        float current=StepMembers.getFloatField(Wm.ownedSpec,"offsetY");
        if(motion!=null && Math.abs(target-requested)<.5f || motion==null && Math.abs(target-current)<.5f)return;
        cancel();requested=target;
        final float destination=target;
        ValueAnimator run=ValueAnimator.ofFloat(current,destination);motion=run;
        run.setDuration(180);run.setInterpolator(new PathInterpolator(.2f,0,0,1));
        run.addUpdateListener(a->{
            synchronized(Wm.lock){
                if(motion!=run || owner!=expected || !active || ending || flip!=null || WorkspaceZoom.motion!=null){if(motion==run)cancel();return;}
                try{Wm.moveSpec(layout.mainScale,layout.mainX,(Float)a.getAnimatedValue());}
                catch(Exception|LinkageError error){cancel();report(null,0,"键盘避让停止："+error,-1);}
            }
        });
        run.addListener(new AnimatorListenerAdapter(){@Override public void onAnimationEnd(Animator a){
            if(motion!=run)return;motion=null;
            report(null,0,"键盘避让位置与输入已同步；y="+destination+"；键盘顶边="+keyboard.top,-1);
        }});
        run.start();
    }
    static void cancel(){
        ValueAnimator old=motion;motion=null;requested=Float.NaN;
        if(old!=null){old.removeAllUpdateListeners();old.removeAllListeners();old.cancel();}
    }
}
