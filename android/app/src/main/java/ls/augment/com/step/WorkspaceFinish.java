package ls.augment.com.step;

import android.os.IBinder;
import android.view.SurfaceControl;
import java.lang.reflect.*;
import java.util.*;
import static ls.augment.com.step.StepRuntime.*;

/** Recognize only Shell's actual native completion transaction at the moment it applies. */
final class WorkspaceFinish {
    static boolean startAvailable;
    static final ThreadLocal<Scope> current=new ThreadLocal<>();
    static final class Scope {
        final LiveWorkspace host;
        final boolean finishing;
        final Set<Object> transactions=Collections.newSetFromMap(new IdentityHashMap<>());
        final ArrayList<IBinder> tokens=new ArrayList<>();
        Scope(LiveWorkspace host){this(host,true);}
        Scope(LiveWorkspace host,boolean finishing){this.host=host;this.finishing=finishing;}
        void add(Object transition){
            Object info=field(transition,"mInfo");
            int count=(Integer)call(info,"getRootCount");
            if(count!=1 || (Integer)call(call(info,"getRoot",0),"getDisplayId")!=0)throw new IllegalStateException("non-primary finish");
            tokens.add((IBinder)field(transition,"mToken"));
            Object tx=field(transition,finishing?"mFinishT":"mStartT");if(tx!=null)transactions.add(tx);
            if(finishing)try{tx=field(transition,"mAfterMergeFinishT");if(tx!=null)transactions.add(tx);}catch(RuntimeException absent){}
        }
    }
    static void install(ClassLoader loader){
        try{
            Class<?> transitions=Class.forName("com.android.wm.shell.transition.Transitions",false,loader);
            Class<?> wct=Class.forName("android.window.WindowContainerTransaction",false,loader);
            Method finish=null;
            for(String name:new String[]{"onFinish","lambda$playTransition$2"}){
                try{finish=OwnershipBridge.method(transitions,name,IBinder.class,wct);break;}catch(NoSuchMethodException absent){}
            }
            if(finish==null || finish.getReturnType()!=void.class || Modifier.isStatic(finish.getModifiers()))throw new NoSuchMethodException("Shell finish contract");
            Field known=StepMembers.findField(transitions,"mKnownTransitions");
            if(!Map.class.isAssignableFrom(known.getType()))throw new NoSuchFieldException("Shell transition identity map");
            Method apply=OwnershipBridge.method(SurfaceControl.Transaction.class,"apply",boolean.class);
            Method clear=OwnershipBridge.method(SurfaceControl.Transaction.class,"clear");
            if(apply.getReturnType()!=void.class || clear.getReturnType()!=void.class)throw new NoSuchMethodException("Surface transaction apply/clear");
            StepHooks.hookMethod(finish,new StepHook(){
                protected void beforeHookedMethod(MethodHookParam p){
                    p.setObjectExtra("previous",current.get());current.remove();
                    LiveWorkspace host=LiveWorkspace.current;
                    if(host==null || !host.ready || host.closing || host.closed || host.channel==null)return;
                    try{
                        Object transition=((Map<?,?>)known.get(p.thisObject)).get(p.args[0]);if(transition==null)return;
                        Scope scope=new Scope(host);scope.add(transition);
                        Object merged=field(transition,"mMerged");
                        if(merged instanceof List)for(Object child:(List<?>)merged)scope.add(child);
                        if(scope.tokens.size()<=16)current.set(scope);
                    }catch(Exception|LinkageError missing){diagnostic("TRANSITION_FINISH","native_fallback;reason="+missing);}
                }
                protected void afterHookedMethod(MethodHookParam p){
                    Scope previous=(Scope)p.getObjectExtra("previous");if(previous==null)current.remove();else current.set(previous);
                }
            });
            StepHooks.hookMethod(apply,new StepHook(){protected void beforeHookedMethod(MethodHookParam p){
                Scope scope=current.get();if(scope==null || !scope.transactions.remove(p.thisObject))return;
                LiveWorkspace host=scope.host;
                if(host!=LiveWorkspace.current || host.closed || host.closing || host.channel==null)return;
                try{
                    SurfaceControl.Transaction tx=(SurfaceControl.Transaction)p.thisObject;
                    // Keep native originals untouched if the server rejects a
                    // stale session. Merge the settled side pose only under its lock.
                    try(SurfaceControl.Transaction previews=new SurfaceControl.Transaction()){
                        int[] previewSlots=host.stageFinishedPreviews(previews);
                        if(WorkspaceChannel.finish(host.channel,host.owner,scope.tokens,tx,previews,previewSlots,(Boolean)p.args[0],scope.finishing)){clear.invoke(tx);p.setResult(null);}
                    }
                }catch(Exception|LinkageError missing){diagnostic("TRANSITION_FINISH","native_fallback;reason="+missing);}
            }});
            diagnostic("TRANSITION_FINISH_CAPABILITY",finish.toGenericString());
            try{
                Class<?> running=Class.forName("com.android.wm.shell.transition.Transitions$ActiveTransition",false,loader);
                Method start=OwnershipBridge.method(transitions,"playTransition",running);
                if(start.getReturnType()!=void.class || Modifier.isStatic(start.getModifiers())
                        || StepMembers.findField(running,"mStartT").getType()!=SurfaceControl.Transaction.class)
                    throw new NoSuchMethodException("Shell start contract");
                StepHooks.hookMethod(start,new StepHook(){
                    protected void beforeHookedMethod(MethodHookParam p){
                        p.setObjectExtra("previous",current.get());current.remove();
                        LiveWorkspace h=LiveWorkspace.current;
                        if(h==null || !h.ready || h.closing || h.closed || h.channel==null)return;
                        try{Scope scope=new Scope(h,false);scope.add(p.args[0]);current.set(scope);}
                        catch(RuntimeException|LinkageError missing){diagnostic("TRANSITION_START","native_fallback;reason="+missing);}
                    }
                    protected void afterHookedMethod(MethodHookParam p){
                        Scope previous=(Scope)p.getObjectExtra("previous");if(previous==null)current.remove();else current.set(previous);
                    }
                });
                startAvailable=true;diagnostic("TRANSITION_START_CAPABILITY",start.toGenericString());
            }catch(Exception|LinkageError missing){diagnostic("TRANSITION_START_UNAVAILABLE",missing.toString());}
        }catch(Exception|LinkageError missing){diagnostic("TRANSITION_FINISH_UNAVAILABLE",missing.toString());}
    }
}
