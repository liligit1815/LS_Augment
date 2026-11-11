package ls.augment.com.step;

import android.content.res.Configuration;
import android.graphics.Rect;
import java.lang.reflect.Method;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** A normal landscape app canvas, fitted uniformly into the physical upper slot. */
final class UpperAppLayout {
    static boolean available,fullscreenConfig,requestedOrientation;
    static Rect canvas(Rect viewport,int shortEdge){
        if(viewport==null || viewport.width()<=viewport.height() || viewport.height()<=0 || shortEdge<=0)
            throw new IllegalArgumentException("顶部横屏尺寸无效");
        return new Rect(0,0,Math.round(shortEdge*(viewport.width()/(float)viewport.height())),shortEdge);
    }
    static Rect landscapeCanvas(Rect viewport,int shortEdge,int density){
        // Keep enough vertical layout room for a phone's landscape controls.
        // This changes the app canvas only, not physical panes or display density.
        int height=fullscreenConfig && density>0?Math.max(shortEdge,Math.round(density*480f/160f)):shortEdge;
        return canvas(viewport,height);
    }
    static float scale(Rect app,Rect viewport){
        return Math.min(viewport.width()/(float)app.width(),viewport.height()/(float)app.height());
    }
    static void install(ClassLoader loader){
        try{
            Class<?> task=Class.forName("com.android.server.wm.Task",false,loader);
            Class<?> activity=Class.forName("com.android.server.wm.ActivityRecord",false,loader);
            Class<?> window=Class.forName("android.app.WindowConfiguration",false,loader);
            Method taskResolve=LocalLandscape.exact(task,"resolveOverrideConfiguration",void.class,Configuration.class);
            Method activityResolve=LocalLandscape.exact(activity,"resolveOverrideConfiguration",void.class,Configuration.class);
            LocalLandscape.exact(task,"getResolvedOverrideConfiguration",Configuration.class);
            LocalLandscape.exact(activity,"getResolvedOverrideConfiguration",Configuration.class);
            LocalLandscape.exact(activity,"getTask",task);
            if(StepMembers.findField(Configuration.class,"windowConfiguration").getType()!=window)
                throw new NoSuchFieldException("windowConfiguration");
            LocalLandscape.exact(window,"setDisplayRotation",void.class,int.class);
            LocalLandscape.exact(window,"setMaxBounds",void.class,Rect.class);
            // Older systems can keep the existing upper layout if the complete
            // app-canvas contract is unavailable; do not disable their path.
            try{
                LocalLandscape.exact(window,"setBounds",void.class,Rect.class);
                LocalLandscape.exact(window,"setAppBounds",void.class,Rect.class);
                LocalLandscape.exact(window,"setWindowingMode",void.class,int.class);
                LocalLandscape.exact(task,"getConfiguration",Configuration.class);
                for(String name:new String[]{"compatScreenWidthDp","compatScreenHeightDp","compatSmallestScreenWidthDp"})
                    if(StepMembers.findField(Configuration.class,name).getType()!=int.class)throw new NoSuchFieldException(name);
                fullscreenConfig=true;
            }catch(ReflectiveOperationException|LinkageError missing){
                fullscreenConfig=false;report(null,0,"顶部完整应用画布能力缺失，保留既有横屏路径："+missing,-1);
            }
            try{
                LocalLandscape.exact(activity,"getRequestedOrientation",int.class);
                Method request=LocalLandscape.exact(activity,"setRequestedOrientation",void.class,int.class);
                LocalLandscape.exact(activity,"onConfigurationChanged",void.class,Configuration.class);
                LocalLandscape.exact(activity,"ensureActivityConfiguration",boolean.class,boolean.class);
                StepHooks.hookMethod(request,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                    if(p.hasThrowable() || !requestedOrientation)return;
                    try{
                        Object t=call(p.thisObject,"getTask");if(!owns(t))return;
                        call(p.thisObject,"onConfigurationChanged",call(t,"getConfiguration"));
                        call(p.thisObject,"ensureActivityConfiguration",false);
                        diagnostic("UPPER_ORIENTATION","requested="+p.args[0]+";task="+NativeTopTask.held(t).id);
                    }catch(RuntimeException|LinkageError error){recover(error);}
                }});
                requestedOrientation=true;
            }catch(ReflectiveOperationException|LinkageError missing){
                requestedOrientation=false;report(null,0,"顶部应用方向切换能力缺失，保留既有横屏路径："+missing,-1);
            }
            Class<?> tx=Class.forName("android.view.SurfaceControl$Transaction",false,loader);
            LocalLandscape.exact(tx,"setWindowCrop",tx,android.view.SurfaceControl.class,Rect.class);
            Method prepare=LocalLandscape.exact(task,"prepareSurfaces",void.class);
            Method clear=LocalLandscape.exact(task,"clearMagnificationSpec",void.class,tx);
            LocalLandscape.exact(task,"getSyncTransaction",tx);
            StepHooks.hookMethod(taskResolve,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(!p.hasThrowable())update(p.thisObject,p.thisObject);
            }});
            StepHooks.hookMethod(activityResolve,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(!p.hasThrowable() && available && active && !ending && Thread.holdsLock(Wm.lock))
                    update(call(p.thisObject,"getTask"),p.thisObject);
            }});
            StepHooks.hookMethod(prepare,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(!p.hasThrowable() && available && active && !ending && Thread.holdsLock(Wm.lock))
                    fit(p.thisObject,call(p.thisObject,"getSyncTransaction"));
            }});
            StepHooks.hookMethod(clear,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(!p.hasThrowable())fit(p.thisObject,p.args[0]);
            }});
            available=true;
            report(null,0,"顶部应用横屏配置能力已核实",-1);
        }catch(ReflectiveOperationException|LinkageError missing){
            report(null,0,"顶部应用横屏配置能力缺失，保留原生顶窗："+missing,-1);
        }
    }
    static boolean owns(Object task){
        SavedTask r=NativeTopTask.held(task);
        if(!available || !active || ending || !Wm.active || !Thread.holdsLock(Wm.lock)
                || r==null || !r.dirty || r.task!=task || NativeTopTask.bounds==null
                || (Integer)call(task,"getWindowingMode")!=6)return false;
        if(liveTask(r.id,r.token)!=task || call(task,"getParent")!=r.parent
                || call(task,"getDisplayContent")!=Wm.display || task!=call(task,"getRootTask")
                || (Integer)call(call(task,"getSurfaceControl"),"getLayerId")!=r.layerId
                || !WorkspaceUsers.allows(Wm.context,principal,r.user)
                || !NativeTopTask.bounds.equals(call(task,"getRequestedOverrideBounds")))
            throw new IllegalStateException("顶部横屏窗口身份已变化");
        return true;
    }
    static void update(Object task,Object container){
        try{
            if(!owns(task))return;
            Configuration config=(Configuration)call(container,"getResolvedOverrideConfiguration");
            // The upper slot is a landscape app window. A portrait request must
            // not select portrait resources inside this short, wide canvas.
            config.orientation=Configuration.ORIENTATION_LANDSCAPE;
            Object window=field(config,"windowConfiguration");
            // App display queries must describe this landscape canvas too. The
            // physical rotation/matrix is left to the existing native surface path.
            call(window,"setDisplayRotation",1);
            call(window,"setMaxBounds",new Rect(NativeTopTask.bounds));
            if(fullscreenConfig){
                int dpi=config.densityDpi;
                if(dpi<=0)dpi=((Configuration)call(task,"getConfiguration")).densityDpi;
                completeCanvas(config,NativeTopTask.bounds,container!=task,dpi);
            }
        }catch(RuntimeException|LinkageError error){recover(error);}
    }
    static void completeCanvas(Configuration config,Rect canvas,boolean activity,int density){
        if(density<=0)throw new IllegalStateException("顶部应用显示密度不可用");
        Object window=field(config,"windowConfiguration");
        call(window,"setBounds",new Rect(canvas));call(window,"setAppBounds",new Rect(canvas));
        config.screenWidthDp=Math.round(canvas.width()*160f/density);
        config.screenHeightDp=Math.round(canvas.height()*160f/density);
        config.smallestScreenWidthDp=Math.min(config.screenWidthDp,config.screenHeightDp);
        try{
            StepMembers.findField(Configuration.class,"compatScreenWidthDp").setInt(config,config.screenWidthDp);
            StepMembers.findField(Configuration.class,"compatScreenHeightDp").setInt(config,config.screenHeightDp);
            StepMembers.findField(Configuration.class,"compatSmallestScreenWidthDp").setInt(config,config.smallestScreenWidthDp);
        }catch(IllegalAccessException unavailable){throw new IllegalStateException(unavailable);}
        // The task remains an organized mode-6 surface. Its child activity fills
        // that independent canvas and must not inherit a split-screen player UI.
        // Restore/release stops owns() before Android resolves its normal config.
        if(activity)call(window,"setWindowingMode",1);
    }
    static void fit(Object task,Object transaction){
        try{
            if(!owns(task))return;
            android.graphics.Point at=(android.graphics.Point)call(task,"getRelativePosition");
            UpperMotion.position((android.view.SurfaceControl.Transaction)transaction,
                    (android.view.SurfaceControl)call(task,"getSurfaceControl"),NativeTopTask.bounds,
                    NativeTopTask.viewport,at.x,at.y,NativeTopTask.upper!=null && NativeTopTask.upper.task==task?NativeTopTask.progress:1f);
        }catch(RuntimeException|LinkageError error){recover(error);}
    }
    static void recover(Throwable error){
        report(null,-1,"顶部横屏配置未完成，归还原窗口："+error,-1);
        android.os.IBinder expected=owner;
        Wm.handler.post(()->{if(active && !ending && owner==expected)finish("恢复顶部应用原窗口");});
    }
}
