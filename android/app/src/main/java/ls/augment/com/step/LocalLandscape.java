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
        Object surface;
        Token(Object state,int rotation){this.state=state;this.rotation=rotation;}
    }
    static int rotation, applied, released;
    static Method start, finish, leash;
    static Method updateRotation;
    static Method displayRotation,displayOrientation,nativeOrientation,sendConfiguration;
    static IBinder entryOwner;
    static long entryDeadline;
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
            Class<?> surface=Class.forName("android.view.SurfaceControl",false,cl),tx=Class.forName("android.view.SurfaceControl$Transaction",false,cl);
            leash=exact(token,"getOrCreateFixedRotationLeash",surface,tx);
            exact(token,"getFixedRotationLeash",surface);
            exact(token,"getLastSurfacePosition",android.graphics.Point.class);
            Method surfaceRotation=exact(token,"updateSurfaceRotation",void.class,tx,int.class,surface);
            exact(ar,"getRequestedOrientation",int.class);exact(dc,"getRotation",int.class);
            try{updateRotation=exact(Wm.service.getClass(),"updateRotation",void.class,boolean.class,boolean.class);}
            catch(NoSuchMethodException missing){updateRotation=null;report(null,0,"横屏原应用入口方向准备不可用，保留原生方向："+missing,-1);}
            try{
                displayRotation=exact(dc,"getDisplayRotation",dr);
                displayOrientation=exact(dc,"getOrientation",int.class);
                nativeOrientation=exact(dr,"updateOrientation",boolean.class,int.class,boolean.class);
                sendConfiguration=exact(dc,"sendNewConfiguration",boolean.class);
            }catch(NoSuchMethodException missing){nativeOrientation=null;report(null,0,"原屏方向主动恢复入口缺失："+missing,-1);}
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
            StepHook finishing=new StepHook(){
                protected void beforeHookedMethod(MethodHookParam p){
                    Token held=tokens.get(p.thisObject);
                    if(held!=null && field(p.thisObject,"mFixedRotationTransformState")==held.state)p.setObjectExtra("stepRotation",held);
                }
                protected void afterHookedMethod(MethodHookParam p){
                    Token held=(Token)p.getObjectExtra("stepRotation");
                    if(held==null || p.hasThrowable() || field(p.thisObject,"mFixedRotationTransformState")!=null)return;
                    try{resetSurface(p.thisObject,held);}catch(Exception|LinkageError e){error(e);}
                }
            };
            StepHooks.hookMethod(finish,finishing);
            try{StepHooks.hookMethod(exact(token,"finishFixedRotationTransform",void.class,Runnable.class),finishing);}
            catch(NoSuchMethodException absent){/* Older native callers use the no-argument contract. */}
            StepHooks.hookMethod(surfaceRotation,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(!scene() || !Thread.holdsLock(Wm.lock))return;
                try{fit(p.thisObject,p.args[0],p.args[2]);}catch(Exception|LinkageError e){error(e);}
            }});
            StepHooks.hookMethod(leash,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(p.hasThrowable() || !scene() || !Thread.holdsLock(Wm.lock))return;
                try{fit(p.thisObject,p.args[0],p.getResult());}catch(Exception|LinkageError e){error(e);}
            }});
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
            // A side activity's private transform must never become a display launch.
            // Otherwise the native rotation listener waits for a launch that Step keeps alive.
            for(String name:new String[]{"setFixedRotationLaunchingApp","setFixedRotationLaunchingAppUnchecked"}){
                for(Class<?>[] signature:new Class<?>[][]{{ar,int.class},{ar}}){
                    Method promote;try{promote=exact(dc,name,void.class,signature);}catch(NoSuchMethodException absent){continue;}
                    StepHooks.hookMethod(promote,new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                        if(!scene() || p.thisObject!=Wm.display || !Thread.holdsLock(Wm.lock) || p.args[0]==null)return;
                        Token held=tokens.get(p.args[0]);
                        if(held!=null && field(p.args[0],"mFixedRotationTransformState")==held.state)p.setResult(null);
                    }});
                }
            }
            StepHooks.hookMethod(request,new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                if(scene() && Thread.holdsLock(Wm.lock))try{refresh(p.thisObject,(Integer)p.args[0]);}catch(Throwable e){error(e);}
            }});
            StepHooks.hookMethod(resolver,new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                if(Thread.holdsLock(Wm.lock) && field(p.thisObject,"mDisplayContent")==Wm.display){
                    if(entryOwner!=null && entryOwner.isBinderAlive() && android.os.SystemClock.uptimeMillis()<entryDeadline)p.setResult(0);
                    else if(scene())p.setResult(rotation);
                }
            }});
            available=true;
        }catch(Throwable e){report(null,0,"独立横屏入口不可用："+e,-1);}
    }
    static boolean scene(){return available && active && !ending && logical!=null && logical.width()<logical.height() && Wm.active;}
    static void prepareEntry(android.content.Intent request,android.os.ResultReceiver reply)throws Exception{
        IBinder candidate=request.getExtras().getBinder("owner");
        if(!available || updateRotation==null || nativeOrientation==null || !StepRuntime.enabled || active || ending || Wm.active
                || candidate==null || !candidate.isBinderAlive() || !interactive(Wm.context)
                || request.getIntExtra("user",-1)!=WorkspaceUsers.foreground())throw new IllegalStateException("方向准备条件不满足");
        synchronized(Wm.lock){
            if(entryOwner!=null && entryOwner!=candidate && android.os.SystemClock.uptimeMillis()<entryDeadline)
                throw new IllegalStateException("已有工作区正在准备方向");
            entryOwner=candidate;entryDeadline=android.os.SystemClock.uptimeMillis()+5000;
        }
        updateRotation.invoke(Wm.service,false,false);
        Wm.handler.postDelayed(()->{
            synchronized(Wm.lock){
                if(entryOwner!=candidate)return;
                entryOwner=null;
            }
            try{synchronized(Wm.lock){restoreOrientation();}}catch(Exception error){report(null,0,"方向准备结束："+error,-1);}
        },5000);
        android.os.Bundle result=new android.os.Bundle();result.putString("session",request.getStringExtra("session"));
        result.putString("state","PREPARING");respond(reply,0,result,"已请求工作区竖屏方向");
    }
    static void restoreOrientation()throws Exception{
        entryOwner=null;entryDeadline=0;
        if(nativeOrientation==null)return;
        // Recompute from the restored foreground task, not DisplayRotation's cached
        // portrait request from entry. Keep native user/sensor orientation policy.
        Object dr=displayRotation.invoke(Wm.display);
        if(Boolean.TRUE.equals(nativeOrientation.invoke(dr,(Integer)displayOrientation.invoke(Wm.display),true)))
            sendConfiguration.invoke(Wm.display);
    }
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
        if(existing!=null && existing.rotation==desired && field(target,"mFixedRotationTransformState")==existing.state){
            Object tx=call(target,"getSyncTransaction");fit(target,tx,leash.invoke(target,tx));
            // A side app can redraw without causing another display traversal.
            // Submit the corrected local pose instead of leaving it queued until
            // a later foreground/Recents transition happens to flush the transaction.
            call(Wm.service,"requestTraversal");return true;
        }
        release(target);
        if(field(target,"mFixedRotationTransformState")!=null)return false;
        changing=true;
        try{
            start.invoke(Wm.display,target,desired);
            Object state=field(target,"mFixedRotationTransformState");
            if(state==null)return false;
            tokens.put(target,new Token(state,desired));applied++;
            Object tx=call(target,"getSyncTransaction");fit(target,tx,leash.invoke(target,tx));
            call(Wm.service,"requestTraversal");return true;
        }finally{changing=false;}
    }
    static void release(Object a)throws Exception{
        Token held=tokens.get(a);
        if(held==null)return;
        changing=true;
        try{
            if(field(a,"mFixedRotationTransformState")==held.state){
                finish.invoke(a);released++;
                // Shell rotation teardown removes its leash but does not reset a
                // custom activity matrix. Restore our exact surface in the same WM tx.
                resetSurface(a,held);
            }
            tokens.remove(a);
        }finally{changing=false;}
    }
    static boolean owned(Object a){
        Token token=tokens.get(a);
        return token!=null && field(a,"mFixedRotationTransformState")==token.state;
    }
    static void resetSurface(Object a,Token held)throws Exception{
        if(held.surface==null || held.surface!=call(a,"getSurfaceControl") || !Boolean.TRUE.equals(call(held.surface,"isValid")))return;
        Object tx=call(a,"getSyncTransaction");
        android.graphics.Point at=(android.graphics.Point)call(a,"getLastSurfacePosition");
        call(tx,"setMatrix",held.surface,1f,0f,0f,1f);call(tx,"setPosition",held.surface,(float)at.x,(float)at.y);
        held.surface=null;call(Wm.service,"requestTraversal");
    }
    static void fit(Object a,Object tx,Object rotationLeash)throws Exception{
        if(!owned(a))return;
        android.graphics.Rect bounds=(android.graphics.Rect)call(a,"getFixedRotationTransformDisplayBounds");
        if(bounds==null || bounds.width()!=logical.height() || bounds.height()!=logical.width())
            throw new IllegalStateException("横屏原始尺寸未确认");
        validSurface(rotationLeash);Object surface=call(a,"getSurfaceControl");validSurface(surface);
        // Both roles use the same quarter turn and full portrait footprint.
        // The main magnification or side task parent supplies the only scale;
        // native input windows inherit this exact rotation when roles change.
        float turn=tokens.get(a).rotation==1?1f:-1f;
        call(tx,"setMatrix",surface,1f,0f,0f,1f);
        call(tx,"setMatrix",rotationLeash,0f,turn,-turn,0f);
        call(tx,"setPosition",rotationLeash,turn>0?(float)logical.width():0f,turn>0?0f:(float)logical.height());
        call(tx,"setPosition",surface,0f,0f);
        tokens.get(a).surface=surface;
    }
    static boolean retained(Object a){
        if(side(a))return true;
        Object task=call(a,"getTask");
        return task!=null && call(task,"getDisplayContent")==Wm.display && task==call(task,"getRootTask")
                && (Integer)call(task,"getWindowingMode")==1 && call(task,"topRunningActivity")==a
                && WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId"))
                && (a==manualApp || landscape((Integer)call(a,"getRequestedOrientation")));
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
                    for(Object old:tokens.keySet().toArray())if(old!=a && !retained(old)){
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
