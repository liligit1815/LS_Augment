package ls.augment.com.step;

import android.content.pm.ActivityInfo;
import android.os.IBinder;
import java.lang.reflect.Method;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** A WM fixed-rotation token belongs to one activity, even when its task survives a relaunch. */
final class LocalLandscape {
    static boolean available, changing, manual;
    static final java.util.IdentityHashMap<Object,Token> tokens=new java.util.IdentityHashMap<>();
    static Object manualApp;
    static final class Token{
        final Object state;final int rotation;
        Token(Object state,int rotation){this.state=state;this.rotation=rotation;}
    }
    static int rotation, applied, released;
    static Method start, finish;
    static Method exact(Class<?> owner,String name,Class<?> result,Class<?>... args)throws ReflectiveOperationException{
        Method m=OwnershipBridge.method(owner,name,args);
        if(m.getReturnType()!=result || java.lang.reflect.Modifier.isStatic(m.getModifiers()))throw new NoSuchMethodException(name);
        return m;
    }
    static void install(ClassLoader cl){
        try{
            Class<?> dc=Wm.display.getClass(), ar=Class.forName("com.android.server.wm.ActivityRecord",false,cl),
                    token=Class.forName("com.android.server.wm.WindowToken",false,cl), dr=Class.forName("com.android.server.wm.DisplayRotation",false,cl);
            start=exact(dc,"startFixedRotationTransform",void.class,token,int.class);finish=exact(token,"finishFixedRotationTransform",void.class);
            exact(ar,"getRequestedOrientation",int.class);exact(dc,"getRotation",int.class);
            if(!StepMembers.findField(token,"mFixedRotationTransformState").getType().getName().equals(token.getName()+"$FixedRotationTransformState")
                    || !StepMembers.findField(dr,"mDisplayContent").getType().isAssignableFrom(dc))throw new NoSuchFieldException("rotation state");
            Class<?> window=Class.forName("com.android.server.wm.WindowState",false,cl);
            Method crop=exact(window,"cropRegionToRootTaskBoundsIfNeeded",void.class,android.graphics.Region.class);
            exact(token,"getFixedRotationTransformDisplayBounds",android.graphics.Rect.class);
            StepHooks.hookMethod(crop,new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                if(!scene() || !Thread.holdsLock(Wm.lock) || tokens.isEmpty())return;
                try{
                    Object w=p.thisObject;
                    Object app=field(w,"mActivityRecord");Token held=tokens.get(app);
                    if(held==null || field(app,"mFixedRotationTransformState")!=held.state || call(w,"getDisplayContent")!=Wm.display)return;
                    Object task=call(w,"getTask");
                    if(task==null || (Integer)call(task,"getWindowingMode")!=1 || task!=call(task,"getRootTask") || !logical.equals(call(task,"getBounds")))return;
                    android.graphics.Rect rotated=(android.graphics.Rect)call(app,"getFixedRotationTransformDisplayBounds");
                    if(rotated==null || rotated.width()!=logical.height() || rotated.height()!=logical.width())return;
                    ((android.graphics.Region)p.args[0]).op(rotated,android.graphics.Region.Op.INTERSECT);p.setResult(null);
                }catch(Throwable e){error(e);}
            }});
            Method request=exact(ar,"setRequestedOrientation",void.class,int.class);
            Method resolver=exact(dr,"rotationForOrientation",int.class,int.class,int.class);
            StepHook launching=new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                if(!scene() || p.thisObject!=Wm.display || !Thread.holdsLock(Wm.lock))return;
                try{if(refresh(p.args[0],null))p.setResult(true);}catch(Throwable e){error(e);}
            }};
            int count=0;
            for(Class<?>[] sig:new Class<?>[][]{{ar,boolean.class},{ar,ar,boolean.class},{ar,boolean.class,int.class},{ar,ar,boolean.class,int.class}}){
                Method m;try{m=exact(dc,"handleTopActivityLaunchingInDifferentOrientation",boolean.class,sig);}catch(NoSuchMethodException missing){continue;}
                StepHooks.hookMethod(m,launching);count++;
            }
            if(count==0)throw new NoSuchMethodException("activity launch orientation");
            StepHooks.hookMethod(request,new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                if(scene() && Thread.holdsLock(Wm.lock))try{refresh(p.thisObject,(Integer)p.args[0]);}catch(Throwable e){error(e);}
            }});
            StepHooks.hookMethod(resolver,new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                if(scene() && Thread.holdsLock(Wm.lock) && (!tokens.isEmpty() || changing || flip!=null)){
                    if(field(p.thisObject,"mDisplayContent")==Wm.display)p.setResult(rotation);
                }
            }});
            available=true;
        }catch(Throwable e){report(null,0,"独立横屏入口不可用："+e,-1);}
    }
    static boolean scene(){return available && active && !ending && logical!=null && logical.width()<logical.height() && Wm.active;}
    static Object main(){
        Object task=call(Wm.display,"getFocusedRootTask");
        if(task==null || (Integer)call(task,"getActivityType")!=1 || (Integer)call(task,"getWindowingMode")!=1
                || ownsTask(task) || !WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId")))return null;
        return call(task,"topRunningActivity");
    }
    static boolean landscape(int request){
        return request==ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE || request==ActivityInfo.SCREEN_ORIENTATION_REVERSE_LANDSCAPE
                || request==ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE || request==ActivityInfo.SCREEN_ORIENTATION_USER_LANDSCAPE;
    }
    static boolean side(Object activity){
        if(activity==null)return false;
        Object task=call(activity,"getTask");
        if(task==null || call(task,"getDisplayContent")!=Wm.display)return false;
        SavedTask r=saved.get((Integer)field(task,"mTaskId"));
        if(r==null || r.task!=task || !((slots.index(r.id)>=0 && r.dirty) || flip!=null && flip.moves(r)))return false;
        return call(task,"topRunningActivity")==activity;
    }
    static boolean refresh(Object target,Integer requested)throws Exception{
        if(!scene() || changing || target==null || (target!=main() && !side(target)))return false;
        int req=requested!=null?requested:(Integer)call(target,"getRequestedOrientation");
        if(target!=manualApp && !landscape(req)){release(target);return false;}
        int desired=req==ActivityInfo.SCREEN_ORIENTATION_REVERSE_LANDSCAPE?3:1;
        Token existing=tokens.get(target);
        if(existing!=null && existing.rotation==desired && field(target,"mFixedRotationTransformState")==existing.state)return true;
        release(target);
        if(field(target,"mFixedRotationTransformState")!=null)return false;
        changing=true;
        try{
            start.invoke(Wm.display,target,desired);
            Object state=field(target,"mFixedRotationTransformState");
            if(state==null)return false;
            tokens.put(target,new Token(state,desired));applied++;
            call(Wm.service,"requestTraversal");return true;
        }finally{changing=false;}
    }
    static void release(Object a)throws Exception{
        Token held=tokens.get(a);
        if(held==null)return;
        changing=true;
        try{
            if(field(a,"mFixedRotationTransformState")==held.state){finish.invoke(a);released++;}
            tokens.remove(a);
        }finally{changing=false;}
    }
    static void clear()throws Exception{
        manualApp=null;manual=false;
        for(Object a:tokens.keySet().toArray())release(a);
    }
    static void releaseTask(Object task)throws Exception{
        for(Object a:tokens.keySet().toArray())if(call(a,"getTask")==task){
            if(a==manualApp){manualApp=null;manual=false;}release(a);
        }
    }
    static void toggle(Object task)throws Exception{
        Object a=main();
        if(!scene() || a==null || call(a,"getTask")!=task)throw new IllegalStateException("当前主应用已变化");
        if(a==manualApp){manualApp=null;manual=false;refresh(a,null);return;}
        manualApp=a;manual=true;
        try{if(!refresh(a,null))throw new IllegalStateException("系统未应用方向");}
        catch(Exception e){manualApp=null;manual=false;throw e;}
    }
    static void watch(IBinder expected){
        rotation=(Integer)call(Wm.display,"getRotation");
        Wm.handler.postDelayed(new Runnable(){public void run(){
            synchronized(Wm.lock){
                if(!available || owner!=expected || !active || ending)return;
                try{
                    rememberMain();
                    GameInput.refresh();
                    Object a=main();
                    for(Object old:tokens.keySet().toArray())if(old!=a && !side(old)){
                        if(manualApp==old){manualApp=null;manual=false;}release(old);
                    }
                    if(scene()){
                        refresh(a,null);
                        for(int id:slots.snapshot()){
                            SavedTask r=saved.get(id);if(r!=null && r.dirty)refresh(call(r.task,"topRunningActivity"),null);
                        }
                    }
                }catch(Throwable e){error(e);return;}
            }
            Wm.handler.postDelayed(this,250);
        }},250);
    }
    static void error(Throwable e){
        report(null,-1,"独立横屏已中断："+e,-1);
        IBinder expected=owner;Wm.handler.post(()->{if(active && owner==expected && !ending)NativeWorkspaceGuard.finish("恢复应用原方向");});
    }
}
