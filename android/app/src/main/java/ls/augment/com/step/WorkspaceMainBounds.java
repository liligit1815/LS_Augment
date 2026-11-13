package ls.augment.com.step;

import android.content.res.Configuration;
import android.graphics.Rect;
import java.lang.reflect.Method;
import java.util.IdentityHashMap;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Reflows fullscreen content in its native task; no nonuniform scale or crop is used. */
final class WorkspaceMainBounds {
    static boolean available,refreshing;
    static WorkspaceLayout layout;
    static Method recompute,ensure;
    static final IdentityHashMap<Object,Object> touched=new IdentityHashMap<>();
    static void install(ClassLoader loader){
        try{
            Class<?> task=Class.forName("com.android.server.wm.Task",false,loader);
            Class<?> activity=Class.forName("com.android.server.wm.ActivityRecord",false,loader);
            Method resolve=LocalLandscape.exact(task,"resolveOverrideConfiguration",void.class,Configuration.class);
            recompute=LocalLandscape.exact(task,"computeConfigResourceOverrides",void.class,Configuration.class,Configuration.class);
            LocalLandscape.exact(task,"onConfigurationChanged",void.class,Configuration.class);
            LocalLandscape.exact(task,"getResolvedOverrideConfiguration",Configuration.class);
            LocalLandscape.exact(task,"getRequestedOverrideConfiguration",Configuration.class);
            try{ensure=LocalLandscape.exact(activity,"ensureActivityConfiguration",boolean.class);}
            catch(NoSuchMethodException older){ensure=LocalLandscape.exact(activity,"ensureActivityConfiguration",boolean.class,int.class,boolean.class);}
            Method activityResolve=LocalLandscape.exact(activity,"resolveOverrideConfiguration",void.class,Configuration.class);
            Class<?> wc=Class.forName("android.app.WindowConfiguration",false,loader);
            if(StepMembers.findField(Configuration.class,"windowConfiguration").getType()!=wc)throw new NoSuchFieldException("windowConfiguration");
            LocalLandscape.exact(wc,"setBounds",void.class,Rect.class);
            LocalLandscape.exact(wc,"setAppBounds",void.class,Rect.class);
            StepHooks.hookMethod(resolve,new StepHook(){@Override protected void afterHookedMethod(MethodHookParam p){
                if(p.hasThrowable() || !eligible(p.thisObject))return;
                try{overrideTask(p.thisObject,(Configuration)p.args[0]);}catch(Throwable error){failed(error);}
            }});
            StepHooks.hookMethod(activityResolve,new StepHook(){@Override protected void afterHookedMethod(MethodHookParam p){
                if(p.hasThrowable() || !scene() || !LocalLandscape.owned(p.thisObject))return;
                Object taskObject=call(p.thisObject,"getTask");if(!eligible(taskObject))return;
                try{
                    Configuration resolved=(Configuration)call(p.thisObject,"getResolvedOverrideConfiguration");
                    Configuration rotatedParent=new Configuration((Configuration)p.args[0]);
                    Rect bounds=new Rect(0,0,layout.mainLogicalHeight,layout.width);
                    dimensions(rotatedParent,bounds);dimensions(resolved,bounds);
                    recompute.invoke(taskObject,resolved,rotatedParent);
                }catch(Throwable error){failed(error);}
            }});
            available=true;report(null,0,"主工作区原生重排能力已核实："+ensure.toString(),-1);
        }catch(Throwable missing){report(null,0,"主工作区原生重排能力缺失："+missing,-1);}
    }
    static boolean scene(){return available && layout!=null && active && !ending && Wm.active && Thread.holdsLock(Wm.lock);}
    static boolean eligible(Object task){
        if(!scene() || task==null)return false;
        try{
            int type=(Integer)call(task,"getActivityType");
            if((type!=1 && type!=2) || call(task,"getDisplayContent")!=Wm.display || task!=call(task,"getRootTask")
                    || (Integer)call(task,"getWindowingMode")!=1
                    || !WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId")))return false;
            // Native launches can briefly put a held upper task in fullscreen
            // while its explicit landscape bounds still belong to that task.
            // Use the same ownership rule for both override and verification.
            Rect requested=(Rect)call(task,"getRequestedOverrideBounds");
            if(requested!=null && !requested.isEmpty() && !requested.equals(logical))return false;
            Object previous=touched.get(task);
            if(previous!=null && previous!=call(task,"getParent"))return false;
            return true;
        }catch(RuntimeException unknown){return false;}
    }
    static void dimensions(Configuration configuration,Rect bounds){
        Object window=field(configuration,"windowConfiguration");
        call(window,"setBounds",bounds);call(window,"setAppBounds",(Object)null);
        configuration.screenWidthDp=0;configuration.screenHeightDp=0;configuration.smallestScreenWidthDp=0;
        configuration.orientation=bounds.width()>bounds.height()?Configuration.ORIENTATION_LANDSCAPE:Configuration.ORIENTATION_PORTRAIT;
    }
    static void overrideTask(Object task,Configuration parent)throws Exception{
        Object originalParent=call(task,"getParent");
        if(originalParent==null)return;
        Object previous=touched.get(task);
        if(previous!=null && previous!=originalParent)return;
        Configuration resolved=(Configuration)call(task,"getResolvedOverrideConfiguration");
        // Explicit bounds owned by another feature remain native.
        Rect requested=(Rect)call(task,"getRequestedOverrideBounds");
        if(requested!=null && !requested.isEmpty() && !requested.equals(logical))return;
        touched.put(task,originalParent);
        dimensions(resolved,new Rect(0,0,layout.width,layout.mainLogicalHeight));
        // Home grids often keep a fixed row count. Preserve their native vertical
        // dp budget within the shorter task so icons/widgets remain usable.
        if((Integer)call(task,"getActivityType")==2 && parent.densityDpi>0)
            resolved.densityDpi=Math.max(1,Math.round(parent.densityDpi*layout.mainLogicalHeight/(float)logical.height()));
        recompute.invoke(task,resolved,parent);
    }
    static void use(WorkspaceLayout target){
        if(target!=null && !available)throw new IllegalStateException("当前系统缺少主工作区原生重排能力");
        layout=target;refresh();
    }
    static void refresh(){
        if(refreshing || !Thread.holdsLock(Wm.lock))return;
        refreshing=true;
        try{
            Object focused=call(Wm.display,"getFocusedRootTask");
            if(eligible(focused))refreshTask(focused);
            if(sessionHome!=null){Object home=liveTask(sessionHome.id,sessionHome.token);if(home!=focused && eligible(home))refreshTask(home);}
            for(Object task:touched.keySet().toArray()){
                if(call(task,"getParent")!=touched.get(task) || call(task,"getDisplayContent")!=Wm.display){touched.remove(task);continue;}
                if(task!=focused && !eligible(task))refreshTask(task);
            }
            call(Wm.service,"requestTraversal");
        }catch(Throwable error){failed(error);}finally{refreshing=false;}
    }
    static void refreshTask(Object task)throws Exception{
        Object parent=call(task,"getParent");if(parent==null)return;
        Rect bounds=(Rect)call(task,"getBounds");
        boolean wanted=eligible(task);
        if(wanted && bounds.width()==layout.width && bounds.height()==layout.mainLogicalHeight)return;
        call(task,"onConfigurationChanged",call(parent,"getConfiguration"));
        Object app=call(task,"topRunningActivity");if(app!=null)ensure(app);
        if(wanted && eligible(task) && !new Rect(0,0,layout.width,layout.mainLogicalHeight).equals(call(task,"getBounds")))
            throw new IllegalStateException("原生主区边界未接受重排；task="+field(task,"mTaskId")+";actual="+call(task,"getBounds")
                    +";requested="+call(task,"getRequestedOverrideBounds"));
        if(!wanted)touched.remove(task);
    }
    static void clear(){
        layout=null;
        if(touched.isEmpty())return;
        if(!Thread.holdsLock(Wm.lock))throw new IllegalStateException("归还主区尺寸必须持有窗口锁");
        boolean previous=refreshing;refreshing=true;
        try{
            for(Object task:touched.keySet().toArray()){
                if(call(task,"getParent")==touched.get(task) && call(task,"getDisplayContent")==Wm.display)refreshTask(task);
                else touched.remove(task);
            }
        }catch(Exception failure){throw new IllegalStateException("主区原始尺寸尚未归还",failure);}
        finally{refreshing=previous;}
    }
    static int height(Object task){return eligible(task)?layout.mainLogicalHeight:logical.height();}
    static void activity(Object app)throws Exception{
        if(scene() && eligible(call(app,"getTask"))){
            Object task=call(app,"getTask");call(app,"onConfigurationChanged",call(task,"getConfiguration"));ensure(app);
        }
    }
    static void ensure(Object app)throws Exception{
        if(ensure.getParameterCount()==0)ensure.invoke(app);else ensure.invoke(app,0,false);
    }
    static void failed(Throwable error){
        report(null,-1,"主工作区重排未完成，归还原窗口："+error,-1);
        android.os.IBinder expected=owner;Wm.handler.post(()->{if(active && owner==expected && !ending)finish("恢复原应用尺寸");});
    }
}
