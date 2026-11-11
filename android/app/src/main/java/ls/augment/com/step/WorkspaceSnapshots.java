package ls.augment.com.step;

import android.graphics.Point;
import android.graphics.Rect;
import android.util.Pair;
import java.lang.reflect.Method;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Capture a stable Step-local landscape through the native task snapshot pipeline. */
final class WorkspaceSnapshots {
    static Class<?> taskType;
    static boolean available;
    static Method record;
    static Object controller;
    static final ThreadLocal<Object> recording=new ThreadLocal<>();
    static final ThreadLocal<Frame> capturing=new ThreadLocal<>();
    static final ThreadLocal<Object> checking=new ThreadLocal<>();
    static final ThreadLocal<Frame> captureRoot=new ThreadLocal<>();
    static final class Frame {
        final Object task,app,state,surface;
        final int rotation,width,height,mode;
        final Rect crop;
        boolean ready;
        Frame(Object task,Object app,LocalLandscape.Token token,boolean side){
            this.task=task;this.app=app;state=token.state;surface=token.surface;rotation=token.rotation;mode=side?6:1;
            width=WorkspaceMainBounds.height(task);height=logical.width();
            // Both roles capture Activity children below rotation and task scaling.
            crop=new Rect(0,0,width,height);
        }
        boolean current(){
            return LocalLandscape.scene() && !LocalLandscape.changing && flip==null && Thread.holdsLock(Wm.lock)
                    && WorkspaceMainBounds.height(task)==width && logical.width()==height && LocalLandscape.owned(app)
                    && field(app,"mFixedRotationTransformState")==state && call(app,"getSurfaceControl")==surface
                    && call(app,"getTask")==task && call(task,"topRunningActivity")==app
                    && (Integer)call(task,"getWindowingMode")==mode && LocalLandscape.side(app)==(mode==6)
                    && call(task,"getDisplayContent")==Wm.display;
        }
    }
    static Object captureSurface(Object source){
        Frame f=captureRoot.get();
        return f!=null && f.task==source && f.current()?f.surface:null;
    }
    static void describe(Frame frame,Object builder){
        call(builder,"setTaskSize",new Point(frame.width,frame.height));
        call(builder,"setOrientation",2);call(builder,"setRotation",frame.rotation);
        // Side admission accepts only native fullscreen root tasks. Mode 6 is
        // Step's temporary hosting state, not the app's Recents presentation.
        call(builder,"setWindowingMode",1);
    }
    static void recordTask(Object task,String reason){
        if(!available || record==null || !active || ending || flip!=null || !Thread.holdsLock(Wm.lock))return;
        Object previous=recording.get();
        try{
            if(!taskType.isInstance(task) || task!=call(Wm.display,"getFocusedRootTask")
                    || task!=call(task,"getRootTask") || call(task,"getDisplayContent")!=Wm.display
                    || (Integer)call(task,"getActivityType")!=1 || (Integer)call(task,"getWindowingMode")!=1
                    || !WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId")))return;
            // Reordering tasks directly does not always create a native closing
            // transition. Ask the native recorder while the outgoing app is still
            // visible; it retains secure/theme policy, cache and persistence.
            recording.set(task);long start=android.os.SystemClock.uptimeMillis();record.invoke(controller,task);
            diagnostic("SNAPSHOT_HANDOFF","task="+field(task,"mTaskId")+";reason="+reason+";nativeRecorderMs="+(android.os.SystemClock.uptimeMillis()-start));
        }catch(Exception|LinkageError e){diagnostic("SNAPSHOT_HANDOFF","native_fallback;reason="+e);}
        finally{if(previous==null)recording.remove();else recording.set(previous);}
    }
    static Method method(Class<?> controller,String name,Class<?> result,Class<?> container,Class<?>... tail)throws ReflectiveOperationException{
        ReflectiveOperationException missing=null;
        for(Class<?> source:new Class<?>[]{container,taskType}){
            Class<?>[] args=new Class<?>[tail.length+1];args[0]=source;System.arraycopy(tail,0,args,1,tail.length);
            try{return LocalLandscape.exact(controller,name,result,args);}catch(NoSuchMethodException e){missing=e;}
        }
        throw missing;
    }
    static void install(ClassLoader cl){
        try{
            taskType=Class.forName("com.android.server.wm.Task",false,cl);
            Class<?> controller=Class.forName("com.android.server.wm.TaskSnapshotController",false,cl),
                    container=Class.forName("com.android.server.wm.WindowContainer",false,cl),
                    token=Class.forName("com.android.server.wm.WindowToken",false,cl),
                    snapshot=Class.forName("android.window.TaskSnapshot",false,cl),
                    builder=Class.forName("android.window.TaskSnapshot$Builder",false,cl);
            Method take=method(controller,"snapshot",snapshot,container,float.class,boolean.class);
            Method ready=method(controller,"checkIfReadyToScreenshot",Pair.class,container);
            Method prepare=method(controller,"prepareTaskSnapshot",Rect.class,container,builder);
            Method create=null;
            for(Method candidate:take.getDeclaringClass().getDeclaredMethods()){
                Class<?>[] a=candidate.getParameterTypes();
                if(candidate.getName().equals("createSnapshot") && a.length==5 && a[0]==take.getParameterTypes()[0]
                        && a[1]==float.class && a[2]==Rect.class && a[3]==builder && a[4]==boolean.class
                        && candidate.getReturnType().getSimpleName().equals("ScreenshotHardwareBuffer")
                        && !java.lang.reflect.Modifier.isStatic(candidate.getModifiers())){create=candidate;candidate.setAccessible(true);break;}
            }
            if(create==null)throw new NoSuchMethodException("native snapshot capture with exclusions");
            Method fixed=LocalLandscape.exact(token,"hasFixedRotationTransform",boolean.class);
            Method surface=LocalLandscape.exact(container,"getSurfaceControl",android.view.SurfaceControl.class);
            LocalLandscape.exact(builder,"setTaskSize",builder,Point.class);
            LocalLandscape.exact(builder,"setOrientation",builder,int.class);LocalLandscape.exact(builder,"setRotation",builder,int.class);
            LocalLandscape.exact(builder,"setWindowingMode",builder,int.class);
            StepHooks.hookMethod(fixed,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                Frame f=capturing.get();
                // Only the native readiness call may treat our stable local transform
                // as settled. No rotation state or secure/theme policy is changed.
                if(available && checking.get()==p.thisObject && f!=null && f.app==p.thisObject && f.current()
                        && !p.hasThrowable() && Boolean.TRUE.equals(p.getResult()))p.setResult(false);
            }});
            StepHooks.hookMethod(take,new StepHook(){
                protected void beforeHookedMethod(MethodHookParam p){
                    p.setObjectExtra("previousCapture",capturing.get());capturing.remove();
                    try{Frame f=frame(p.args[0]);if(f!=null)capturing.set(f);}catch(Exception e){diagnostic("SNAPSHOT","native_fallback;reason="+e);}
                }
                protected void afterHookedMethod(MethodHookParam p){
                    Frame f=capturing.get();
                    try{if(f!=null || recording.get()==p.args[0])diagnostic("SNAPSHOT","task="+field(p.args[0],"mTaskId")+";ownedRotation="+(f==null?"native":f.rotation)
                            +";ready="+(f!=null&&f.ready)+";result="+(p.getResult()==null?"null":p.getResult().toString()));}
                    finally{Frame old=(Frame)p.getObjectExtra("previousCapture");if(old==null)capturing.remove();else capturing.set(old);}
                }
            });
            StepHooks.hookMethod(ready,new StepHook(){protected void afterHookedMethod(MethodHookParam p)throws Throwable{
                Frame f=capturing.get();
                if(p.hasThrowable() || p.getResult()!=null || f==null || p.args[0]!=f.task || !f.current() || checking.get()!=null)return;
                Object result;
                checking.set(f.app);
                try{result=StepHooks.invokeOriginalMethod(ready,p.thisObject,p.args);}
                finally{checking.remove();}
                if(result instanceof Pair<?,?> pair && pair.first==f.app && f.current()){
                    f.ready=true;p.setResult(result);
                    diagnostic("SNAPSHOT","task="+field(f.task,"mTaskId")+";nativeReady=null;localRotationReady=true");
                }
            }});
            StepHooks.hookMethod(prepare,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                Frame f=capturing.get();
                if(p.hasThrowable() || p.getResult()==null || f==null || !f.ready || p.args[0]!=f.task)return;
                if(!f.current()){p.setResult(null);return;}
                // Capture the original landscape frame in Activity-local coordinates.
                describe(f,p.args[1]);p.setResult(new Rect(f.crop));
            }});
            StepHooks.hookMethod(surface,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(p.hasThrowable())return;
                Object root=captureSurface(p.thisObject);if(root!=null)p.setResult(root);
            }});
            StepHooks.hookMethod(create,new StepHook(){
                protected void beforeHookedMethod(MethodHookParam p){
                    p.setObjectExtra("previousCaptureRoot",captureRoot.get());captureRoot.remove();
                    Frame f=capturing.get();if(f==null || !f.ready || p.args[0]!=f.task)return;
                    if(!f.current() || !f.crop.equals(p.args[2])){p.setResult(null);return;}
                    captureRoot.set(f);
                }
                protected void afterHookedMethod(MethodHookParam p){
                    Frame old=(Frame)p.getObjectExtra("previousCaptureRoot");
                    if(old==null)captureRoot.remove();else captureRoot.set(old);
                }
            });
            StepHooks.module.deoptimize(create);StepHooks.module.deoptimize(surface);
            StepHooks.module.deoptimize(ready);StepHooks.module.deoptimize(prepare);StepHooks.module.deoptimize(take);
            available=true;diagnostic("SNAPSHOT_CAPABILITY","native_pipeline;ready="+ready+";capture="+create);
            try{
                java.lang.reflect.Field holder=StepMembers.findField(Wm.service.getClass(),"mTaskSnapshotController");
                if(!controller.isAssignableFrom(holder.getType()))throw new NoSuchFieldException("native task snapshot controller type");
                WorkspaceSnapshots.controller=holder.get(Wm.service);
                record=LocalLandscape.exact(controller,"recordSnapshot",void.class,taskType);
            }catch(Exception|LinkageError e){record=null;diagnostic("SNAPSHOT_HANDOFF_UNAVAILABLE",e.toString());}
        }catch(Exception|LinkageError e){diagnostic("SNAPSHOT_UNAVAILABLE",e.toString());}
    }
    static Frame frame(Object task){
        if(!available || !LocalLandscape.scene() || LocalLandscape.changing || flip!=null || !Thread.holdsLock(Wm.lock)
                || !taskType.isInstance(task) || call(task,"getDisplayContent")!=Wm.display
                || !WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId")))return null;
        Object app=call(task,"topRunningActivity");
        if(app==null || !LocalLandscape.owned(app) || !Boolean.TRUE.equals(call(app,"fillsParent")))return null;
        boolean side=LocalLandscape.side(app);
        if(!side && !LocalLandscape.retained(app))return null;
        LocalLandscape.Token held=LocalLandscape.tokens.get(app);
        if(held.surface==null || held.surface!=call(app,"getSurfaceControl") || !Boolean.TRUE.equals(call(held.surface,"isValid")))return null;
        Rect bounds=(Rect)call(app,"getFixedRotationTransformDisplayBounds");
        if(bounds==null || bounds.width()!=logical.height() || bounds.height()!=logical.width())return null;
        return new Frame(task,app,held,side);
    }
}
