package ls.augment.com.step;

import android.graphics.Rect;
import android.os.IBinder;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Keep a calibrated workspace pose above native HOME/RECENTS animation leashes. */
final class NativeTransitionPose {
    static final ThreadLocal<Object> preparing=new ThreadLocal<>();
    static final IdentityHashMap<Object,Pose> poses=new IdentityHashMap<>();
    static Method ancestor,wallpaper;
    static Class<?> taskType;
    static final class Pose {
        final IBinder owner;final Object root,parent;final ArrayList<Object> tasks;
        WorkspaceTransform last;
        Pose(IBinder owner,Object root,Object parent,ArrayList<Object> tasks){this.owner=owner;this.root=root;this.parent=parent;this.tasks=tasks;}
    }
    static Method exact(Class<?> type,String name,Class<?> result,boolean isStatic,Class<?>... args)throws NoSuchMethodException{
        Method method=OwnershipBridge.method(type,name,args);
        if(method.getReturnType()!=result || Modifier.isStatic(method.getModifiers())!=isStatic)
            throw new NoSuchMethodException(type.getName()+"."+name+" contract");
        return method;
    }
    static void install(ClassLoader loader){
        try{
            Class<?> transition=Class.forName("com.android.server.wm.Transition",false,loader);
            Class<?> container=Class.forName("com.android.server.wm.WindowContainer",false,loader);
            Class<?> change=Class.forName("com.android.server.wm.Transition$ChangeInfo",false,loader);
            Class<?> info=Class.forName("android.window.TransitionInfo",false,loader);
            Class<?> tx=Class.forName("android.view.SurfaceControl$Transaction",false,loader);
            Class<?> spec=Class.forName("android.view.MagnificationSpec",false,loader);
            Class<?> task=Class.forName("com.android.server.wm.Task",false,loader);
            exact(task,"getRootTask",task,false);exact(task,"getWindowingMode",int.class,false);
            Method ready=exact(transition,"onTransactionReady",void.class,false,int.class,tx);
            Method build=exact(transition,"calculateTransitionInfo",info,true,int.class,int.class,ArrayList.class,tx);
            Method common=exact(transition,"findCommonAncestor",container,true,ArrayList.class,container);
            Method wall=exact(transition,"isWallpaper",boolean.class,true,container);
            Method finish=TransitionCompletion.resolve(transition,StepMembers.findClassIfExists("com.android.server.wm.ActionChain",loader));
            if(StepMembers.findField(change,"mContainer").getType()!=container)throw new NoSuchFieldException("ChangeInfo.mContainer");
            WorkspaceTransform.requireCache(container,spec);
            ancestor=common;wallpaper=wall;taskType=task;
            StepHooks.hookMethod(ready,new StepHook.Discovery(){
                protected void beforeHookedMethod(MethodHookParam p){p.setObjectExtra("previous",preparing.get());preparing.set(p.thisObject);}
                protected void afterHookedMethod(MethodHookParam p){Object old=p.getObjectExtra("previous");if(old==null)preparing.remove();else preparing.set(old);}
            });
            StepHooks.hookMethod(build,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(p.hasThrowable() || preparing.get()==null || !active || ending)return;
                synchronized(Wm.lock){
                    try{capture(preparing.get(),p.getResult(),(ArrayList<?>)p.args[2],p.args[3]);}
                    catch(Exception|LinkageError missing){
                        diagnostic("TRANSITION_POSE","native_fallback;reason="+missing);
                        if(poses.containsKey(preparing.get())){
                            IBinder expected=owner;
                            Wm.handler.post(()->{if(owner==expected)finish("转场图层交接未完成，归还工作区");});
                        }
                    }
                }
            }});
            StepHooks.hookMethod(finish,new StepHook.Discovery(){protected void beforeHookedMethod(MethodHookParam p){
                synchronized(Wm.lock){
                    Pose old=poses.remove(p.thisObject);
                    if(old!=null){diagnostic("TRANSITION_POSE","native_finish;root="+call(old.root,"getLayerId")+";tasks="+old.tasks.size());call(old.root,"release");}
                }
            }});
            diagnostic("TRANSITION_POSE_CAPABILITY","build="+build.toGenericString()+";finish="+finish.toGenericString());
        }catch(Exception|LinkageError missing){diagnostic("TRANSITION_POSE_UNAVAILABLE",missing.toString());}
    }
    static void capture(Object transition,Object info,ArrayList<?> changes,Object tx)throws Exception{
        if(!active || ending || !Wm.active || Wm.ownedSpec==null || field(Wm.display,"mMagnificationSpec")!=Wm.ownedSpec
                || !WorkspaceZoom.entered || WorkspaceZoom.motion!=null || flip!=null || poses.containsKey(transition))return;
        if(poses.size()>=8)throw new IllegalStateException("too many unfinished transitions");
        if((Integer)call(info,"getRootCount")!=1)throw new IllegalStateException("multiple transition displays");
        Object root=call(info,"getRoot",0),leash=call(root,"getLeash");
        if((Integer)call(root,"getDisplayId")!=0)throw new IllegalStateException("non-primary transition");
        android.graphics.Point offset=(android.graphics.Point)call(root,"getOffset");
        if(offset.x!=0 || offset.y!=0)throw new IllegalStateException("non-zero transition origin");
        validSurface(leash);
        ArrayList<Object> tasks=new ArrayList<>();Object first=null;boolean home=false;
        for(Object change:changes){
            Object task=field(change,"mContainer");
            if(Boolean.TRUE.equals(wallpaper.invoke(null,task)))continue;
            // ChangeInfo can target an IME/system WindowToken or an ActivityRecord.
            // Those are not task containers, and cannot share the task-only root pose.
            if(taskType==null || !taskType.isInstance(task)){
                diagnostic("TRANSITION_POSE","native_container;type="+(task==null?"null":task.getClass().getName()));
                return;
            }
            if(transitionStart && ownsTask(task) && call(task,"getDisplayContent")==Wm.display
                    && (Integer)call(task,"getWindowingMode")==6)continue;
            if(call(task,"getDisplayContent")!=Wm.display || call(task,"getRootTask")!=task
                    || (Integer)call(task,"getWindowingMode")!=1 || !WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId"))
                    || ownsTask(task) || contains(task))throw new IllegalStateException("non-fullscreen or already owned animation target");
            int type=(Integer)call(task,"getActivityType");
            if(type!=1 && type!=2 && type!=3)throw new IllegalStateException("unknown task activity type="+type);
            home|=type==2 || type==3;tasks.add(task);if(first==null)first=task;
        }
        if(first==null || !home && !transitionStart)return;
        Object parent=ancestor.invoke(null,changes,first);
        Rect bounds=(Rect)call(parent,"getBounds");
        if(bounds.left!=0 || bounds.top!=0 || bounds.width()!=logical.width() || bounds.height()!=logical.height())
            throw new IllegalStateException("animation parent is not the full logical display");
        // Calibrate against the real ancestor caches, not a model name or guessed scale.
        WorkspaceTransform local=spec(Wm.ownedSpec).inside(inherited(parent));
        java.util.List<?> targets=(java.util.List<?>)call(info,"getChanges");
        for(Object task:tasks){
            Object surface=call(task,"getSurfaceControl");validSurface(surface);
            int layer=(Integer)call(surface,"getLayerId");boolean matched=false;
            for(Object target:targets){
                Object taskInfo=call(target,"getTaskInfo");
                if(taskInfo!=null && field(taskInfo,"token").equals(field(call(task,"getTaskInfo"),"token"))
                        && Integer.valueOf(layer).equals(call(call(target,"getLeash"),"getLayerId")))matched=true;
            }
            if(!matched)throw new IllegalStateException("animation leash differs from verified native task surface");
        }
        // TransitionInfo releases its Java wrapper when delivered to Shell.
        // Keep an independent native reference for the actual start and exit.
        Pose pose=new Pose(owner,retainSurface(leash),parent,tasks);poses.put(transition,pose);
        for(Object task:tasks)call(task,"clearMagnificationSpec",tx);
        applyPose(pose,local);
        diagnostic("TRANSITION_POSE","captured;session="+session+";root="+call(leash,"getLayerId")
                +";tasks="+tasks.size()+";scale="+local.scale+";x="+local.x+";y="+local.y+";evidence=calibrated_wm_tree");
    }
    static Object retainSurface(Object surface){
        android.os.Parcel parcel=android.os.Parcel.obtain();
        try{
            ((android.view.SurfaceControl)surface).writeToParcel(parcel,0);parcel.setDataPosition(0);
            return android.view.SurfaceControl.CREATOR.createFromParcel(parcel);
        }finally{parcel.recycle();}
    }
    static boolean contains(Object task){
        synchronized(Wm.lock){
            for(Pose pose:poses.values())if(pose.owner==owner && pose.tasks.contains(task))return true;
            return false;
        }
    }
    static void finishIn(Object tx,java.util.List<IBinder> tokens){
        java.util.Iterator<java.util.Map.Entry<Object,Pose>> items=poses.entrySet().iterator();
        while(items.hasNext()){
            java.util.Map.Entry<Object,Pose> entry=items.next();
            if(entry.getValue().owner==owner && tokens.contains(call(entry.getKey(),"getToken"))){
                int count=entry.getValue().tasks.size();
                call(entry.getValue().root,"release");
                items.remove();
                diagnostic("TRANSITION_POSE","atomic_finish;tasks="+count);
            }
        }
    }
    static void startIn(Object tx,java.util.List<IBinder> tokens){
        for(java.util.Map.Entry<Object,Pose> entry:poses.entrySet()){
            Pose pose=entry.getValue();
            if(pose.owner!=owner || !tokens.contains(call(entry.getKey(),"getToken")))continue;
            WorkspaceTransform local=spec(Wm.ownedSpec).inside(inherited(pose.parent));
            stage(tx,pose.root,local);pose.last=local;
        }
    }
    static void retire(IBinder expected){
        synchronized(Wm.lock){
            java.util.Iterator<Pose> items=poses.values().iterator();
            while(items.hasNext()){
                Pose pose=items.next();
                if(pose.owner!=expected)continue;
                if(Boolean.TRUE.equals(call(pose.root,"isValid")) && (pose.last==null || !pose.last.identity()))
                    throw new IllegalStateException("animation pose still owned at exit");
                call(pose.root,"release");
                items.remove();
            }
        }
    }
    static boolean owns(Object task){
        if(!active || ending || !Wm.active)return false;
        synchronized(Wm.lock){
            if(poses.isEmpty())return false;
            Object current=field(Wm.display,"mMagnificationSpec");
            return current!=null && (current==Wm.ownedSpec || current==Wm.applyingSpec) && contains(task);
        }
    }
    static WorkspaceTransform spec(Object spec){
        return spec==null?new WorkspaceTransform(1,0,0):new WorkspaceTransform(StepMembers.getFloatField(spec,"scale"),
                StepMembers.getFloatField(spec,"offsetX"),StepMembers.getFloatField(spec,"offsetY"));
    }
    static WorkspaceTransform inherited(Object parent){
        WorkspaceTransform result=new WorkspaceTransform(1,0,0);int depth=0;
        for(Object node=parent;node!=Wm.display;node=call(node,"getParent")){
            if(node==null || ++depth>32)throw new IllegalStateException("animation ancestor chain changed");
            Rect bounds=(Rect)call(node,"getBounds");
            if(bounds.left!=0 || bounds.top!=0)throw new IllegalStateException("non-zero animation ancestor origin");
            result=result.then(spec(field(node,"mLastMagnificationSpec")));
        }
        return result;
    }
    static void stage(Object tx,Object root,WorkspaceTransform pose){
        call(tx,"setMatrix",root,pose.scale,0f,0f,pose.scale);call(tx,"setPosition",root,pose.x,pose.y);
    }
    static void applyPose(Pose pose,WorkspaceTransform value)throws Exception{
        if(pose.last!=null && pose.last.scale==value.scale && pose.last.x==value.x && pose.last.y==value.y)return;
        // Never put a Step matrix in Shell's deferred start/finish transaction:
        // that transaction can arrive after this workspace has already exited.
        Object tx=surfaceTransaction();
        try{
            stage(tx,pose.root,value);
            if(ending && pendingCommit!=null)trackCommit(tx,pendingCommit);
            final String captured=session;final int layer=(Integer)call(pose.root,"getLayerId");
            SurfaceCommit.observe(tx,command->Wm.handler.post(command),()->{
                if(pose.owner==owner)diagnostic("TRANSITION_POSE_COMMIT","session="+captured+";root="+layer
                        +";scale="+value.scale+";x="+value.x+";y="+value.y+";evidence=transaction_committed_not_screen_capture");
            });
            call(tx,"apply");pose.last=value;
        }finally{call(tx,"close");}
    }
    static void refresh(Object tx){
        synchronized(Wm.lock){
            if(poses.isEmpty())return;
            Object current=field(Wm.display,"mMagnificationSpec");
            for(Pose pose:poses.values()){
                if(pose.owner!=owner || !Boolean.TRUE.equals(call(pose.root,"isValid")))continue;
                // On exit remove only our root transform. A new workspace or another
                // magnifier must never inherit a late animation's Step matrix.
                WorkspaceTransform local=Wm.active && current!=null && (current==Wm.ownedSpec || current==Wm.applyingSpec)
                        ?spec(current).inside(inherited(pose.parent)):new WorkspaceTransform(1,0,0);
                try{applyPose(pose,local);}
                catch(Exception error){throw new IllegalStateException("animation root transaction unconfirmed",error);}
            }
        }
    }
}
