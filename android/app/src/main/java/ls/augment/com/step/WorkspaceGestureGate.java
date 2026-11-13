package ls.augment.com.step;

import android.app.Application;
import android.app.BroadcastOptions;
import android.content.*;
import android.content.pm.ResolveInfo;
import android.os.*;
import java.lang.reflect.Method;
import java.util.WeakHashMap;
import ls.augment.com.hook.AugmentModule;

/** Use the launcher's own deferred-down branch only during a live native workspace lease. */
public final class WorkspaceGestureGate {
    private static final String STATE="ls.augment.com.STEP_GESTURE_STATE",QUERY="ls.augment.com.STEP_GESTURE_QUERY";
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static final java.util.Map<Object,Boolean> consumers=java.util.Collections.synchronizedMap(new WeakHashMap<>());
    private static volatile long validUntil;
    private static volatile long traceUntil;
    private static boolean bound;
    private WorkspaceGestureGate(){}
    static boolean leased(long now){return validUntil>now;}
    static boolean accepts(int sender,int version,long deadline,long now){
        return sender==1000 && version==ls.augment.com.BuildConfig.VERSION_CODE && deadline>now && deadline-now<=5000;
    }
    static boolean deferFor(Object owner,boolean nativeValue,int display,boolean running,long now){
        Boolean delayed=consumers.get(owner);
        if(delayed==null){
            delayed=validUntil>now && display==0 && !running;
            consumers.put(owner,delayed);
            if(delayed)StepRuntime.diagnostic("GESTURE","native_deferred_down;display=0");
        }
        return nativeValue || delayed;
    }
    static void beginGesture(Object owner){consumers.remove(owner);}
    static String gestureField(Object owner,String name){
        try{return String.valueOf(StepMembers.findField(owner.getClass(),name).get(owner));}
        catch(ReflectiveOperationException|RuntimeException|LinkageError missing){return "unavailable:"+missing.getClass().getSimpleName();}
    }
    public static void installLauncher(AugmentModule module,ClassLoader loader){
        try{
            Class<?> consumer=Class.forName("com.android.quickstep.inputconsumers.OtherActivityInputConsumer",false,loader);
            Method defer=OwnershipBridge.method(consumer,"needDeferDown");
            Method events=OwnershipBridge.method(consumer,"onMotionEvent",android.view.MotionEvent.class);
            java.lang.reflect.Field gesture=StepMembers.findField(consumer,"mGestureState");
            java.lang.reflect.Field animation=StepMembers.findField(consumer,"mTaskAnimationManager");
            Method display=OwnershipBridge.method(gesture.getType(),"getDisplayId");
            Method running=OwnershipBridge.method(animation.getType(),"isRecentsAnimationRunning");
            if(defer.getReturnType()!=boolean.class || events.getReturnType()!=void.class || display.getReturnType()!=int.class || running.getReturnType()!=boolean.class)
                throw new NoSuchMethodException("native deferred gesture signature");
            WorkspaceGestureRecovery.install(module,consumer,animation.getType(),gesture.getType(),loader);
            module.deoptimize(defer);
            module.deoptimize(events); // The tiny private predicate can be inlined into the native motion loop.
            module.hook(events).intercept(chain->{
                Object owner=chain.getThisObject();
                android.view.MotionEvent event=(android.view.MotionEvent)chain.getArgs().get(0);
                int action=event.getActionMasked();
                // Some launchers reuse the consumer. Freeze the choice for this
                // gesture, not for the entire lifetime of that native object.
                if(action==android.view.MotionEvent.ACTION_DOWN)beginGesture(owner);
                boolean trace=validUntil>SystemClock.uptimeMillis() || traceUntil>SystemClock.uptimeMillis() || Boolean.TRUE.equals(consumers.get(owner));
                try{return chain.proceed();}
                finally{
                    if(trace && (action==android.view.MotionEvent.ACTION_DOWN || action==android.view.MotionEvent.ACTION_UP
                            || action==android.view.MotionEvent.ACTION_CANCEL))try{
                        StepRuntime.diagnostic("GESTURE_EVENT","consumer="+System.identityHashCode(owner)+";action="+action
                                +";deferred="+consumers.get(owner)+";display="+display.invoke(gesture.get(owner))
                                +";recentsRunning="+running.invoke(animation.get(owner))
                                +";controller="+gestureField(animation.get(owner),"mController")
                                +";endTarget="+gestureField(gesture.get(owner),"mEndTarget")
                                +";leaseRemainingMs="+Math.max(0,validUntil-SystemClock.uptimeMillis())
                                +";windowSlop="+gestureField(owner,"mPassedWindowMoveSlop")
                                +";pilferSlop="+gestureField(owner,"mPassedPilferInputSlop"));
                    }catch(ReflectiveOperationException|RuntimeException missing){StepRuntime.diagnostic("GESTURE_TRACE_UNAVAILABLE",missing.toString());}
                }
            });
            module.hook(defer).intercept(chain->{
                boolean nativeValue=(Boolean)chain.proceed();
                Object owner=chain.getThisObject();
                try{
                    return deferFor(owner,nativeValue,(Integer)display.invoke(gesture.get(owner)),
                            (Boolean)running.invoke(animation.get(owner)),SystemClock.uptimeMillis());
                }catch(ReflectiveOperationException|RuntimeException unknown){return nativeValue;}
            });
            Method attach=Application.class.getDeclaredMethod("attach",Context.class);
            module.hook(attach).intercept(chain->{Object result=chain.proceed();bind((Context)chain.getThisObject());return result;});
            // Package-ready callbacks can occur after Application.attach on some loaders.
            Method application=Class.forName("android.app.ActivityThread").getMethod("currentApplication");
            main.post(()->{try{Object context=application.invoke(null);if(context instanceof Context)bind((Context)context);}
                catch(ReflectiveOperationException ignored){/* Application.attach remains the normal binding path. */}});
            StepRuntime.diagnostic("GESTURE_CAPABILITY","defer="+defer.toGenericString()+";events="+events.toGenericString());
        }catch(ReflectiveOperationException|RuntimeException|LinkageError missing){StepRuntime.diagnostic("GESTURE_UNAVAILABLE",missing.toString());}
    }
    private static void bind(Context context){
        if(bound)return;
        try{
            context.registerReceiver(new BroadcastReceiver(){public void onReceive(Context c,Intent i){
                long deadline=i.getLongExtra("until",0);
                if(getSentFromUid()!=1000)return;
                if(i.getIntExtra("version",0)!=ls.augment.com.BuildConfig.VERSION_CODE)return;
                boolean wasActive=validUntil>SystemClock.uptimeMillis();
                // Trace the first gestures after release too. This does not extend
                // deferred-down ownership and never logs coordinates or input text.
                if(validUntil>0 && deadline==0)traceUntil=SystemClock.uptimeMillis()+15000;
                validUntil=accepts(getSentFromUid(),i.getIntExtra("version",0),deadline,SystemClock.uptimeMillis())?deadline:0;
                if(wasActive!=(validUntil>0))StepRuntime.diagnostic("GESTURE_LEASE","active="+(validUntil>0)+";traceAfterExit="+(traceUntil>SystemClock.uptimeMillis()));
            }},new IntentFilter(STATE),NativeWorkspaceGuard.SYSTEM_CONTROL,main,Context.RECEIVER_EXPORTED);
            bound=true;
            context.sendBroadcast(new Intent(QUERY).setPackage("android"),null,
                    BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
        }catch(RuntimeException error){StepRuntime.diagnostic("GESTURE_BIND_FAILED",error.getClass().getSimpleName());}
    }
    static ResolveInfo launcher(Context context){
        return context.getPackageManager().resolveActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME),android.content.pm.PackageManager.MATCH_DEFAULT_ONLY);
    }
    static void installServer(){
        GameGestureGate.installServer();
        StepRuntime.Wm.context.registerReceiver(new BroadcastReceiver(){public void onReceive(Context c,Intent i){
            ResolveInfo home=launcher(c);
            if(home!=null && home.activityInfo!=null && home.activityInfo.applicationInfo.uid==getSentFromUid())publish();
        }},new IntentFilter(QUERY),NativeWorkspaceGuard.SYSTEM_CONTROL,StepRuntime.Wm.handler,Context.RECEIVER_EXPORTED);
    }
    static void publish(){
        GameGestureGate.publish();
        try{
            ResolveInfo home=launcher(StepRuntime.Wm.context);
            if(home==null || home.activityInfo==null)return;
            long deadline=NativeWorkspaceGuard.active && !NativeWorkspaceGuard.ending && StepRuntime.Wm.active?SystemClock.uptimeMillis()+4500:0;
            StepRuntime.Wm.context.sendBroadcast(new Intent(STATE).setPackage(home.activityInfo.packageName)
                    .putExtra("version",ls.augment.com.BuildConfig.VERSION_CODE).putExtra("until",deadline),null,
                    BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
        }catch(RuntimeException error){StepRuntime.diagnostic("GESTURE_STATE_FAILED",error.getClass().getSimpleName());}
    }
    static void keepAlive(IBinder owner){
        if(NativeWorkspaceGuard.owner!=owner || !NativeWorkspaceGuard.active || NativeWorkspaceGuard.ending)return;
        publish();StepRuntime.Wm.handler.postDelayed(()->keepAlive(owner),2000);
    }
}
