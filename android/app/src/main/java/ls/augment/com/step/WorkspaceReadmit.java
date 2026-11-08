package ls.augment.com.step;

import android.os.IBinder;
import android.os.SystemClock;
import java.lang.reflect.Method;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Reconnect an existing activity's rendering process. Never resolve or launch a package. */
final class WorkspaceReadmit {
    static boolean available;
    static SavedTask pending;
    static Method activityState;
    static void probe(ClassLoader loader){
        try{
            Class<?> activity=Class.forName("com.android.server.wm.ActivityRecord",false,loader);
            Class<?> window=Class.forName("com.android.server.wm.WindowState",false,loader);
            activityState=OwnershipBridge.method(activity,"getState");
            if(!activityState.getReturnType().isEnum())throw new NoSuchMethodException("activity lifecycle state");
            available=OwnershipBridge.method(activity,"findMainWindow").getReturnType()==window
                    && OwnershipBridge.method(activity,"isReportedDrawn").getReturnType()==boolean.class
                    && OwnershipBridge.method(window,"isDrawn").getReturnType()==boolean.class;
            if(!available)report(null,0,"副格绘制接口返回类型不匹配",-1);
        }catch(ReflectiveOperationException|LinkageError e){report(null,0,"副格绘制确认不可用："+e,-1);}
    }
    static void wake(Object task,IBinder sessionOwner){
        try{
            Object a=call(task,"topRunningActivity"),windowProcess=field(a,"app");
            Object process=field(windowProcess,"mListener"),thread=call(windowProcess,"getThread");
            int pid=(Integer)call(windowProcess,"getPid"),uid=(Integer)call(windowProcess,"getUid");
            if(pid<=0 || thread==null || uid<10000 || windowProcess!=call(process,"getWindowProcessController"))return;
            Object am=field(process,"mService");
            Class<?> record=Class.forName("com.android.server.am.ProcessRecord",false,Wm.loader);
            Class<?> appThread=Class.forName("android.app.IApplicationThread",false,Wm.loader);
            Method lookup=OwnershipBridge.method(am.getClass(),"getRecordForAppLOSP",appThread);
            if(!record.isInstance(process) || !appThread.isInstance(thread) || lookup.getReturnType()!=record
                    || java.lang.reflect.Modifier.isStatic(lookup.getModifiers()))return;
            // Never nest the AM lock under the WM lock. Check the exact application thread
            // again under the AM lock before asking the platform for a temporary thaw.
            Wm.handler.post(()->{
                if(!active || ending || owner!=sessionOwner)return;
                try{synchronized(am){
                    if(!active || ending || owner!=sessionOwner || (Integer)call(process,"getPid")!=pid || (Integer)call(process,"getUid")!=uid ||
                            lookup.invoke(am,thread)!=process || call(process,"getThread")!=thread)return;
                    Object opt=field(process,"mOptRecord");
                    if(!Boolean.TRUE.equals(call(opt,"isFrozen")) && !Boolean.TRUE.equals(call(opt,"isPendingFreeze")))return;
                    java.lang.reflect.Field constant=Class.forName("android.app.ActivityManagerInternal",false,Wm.loader).getDeclaredField("OOM_ADJ_REASON_ACTIVITY");
                    constant.setAccessible(true);int reason=constant.getInt(null);
                    Object target=am;Method method;
                    try{method=OwnershipBridge.method(am.getClass(),"unfreezeTemporarily",record,int.class);}
                    catch(NoSuchMethodException older){target=field(am,"mOomAdjuster");method=OwnershipBridge.method(target.getClass(),"unfreezeTemporarily",record,int.class);}
                    if(method.getReturnType()==void.class){method.invoke(target,process,reason);thaws++;}
                }}catch(Exception|LinkageError e){report(null,0,"无法请求原任务绘制："+e,-1);}
            });
        }catch(RuntimeException|ReflectiveOperationException|LinkageError e){report(null,0,"无法核验原任务进程："+e,-1);}
    }
    static int thaws,drawn;
    static boolean allowsFocus(SavedTask record,Object task){
        return record!=null && pending==record && record.task==task && record.dirty;
    }
    static void settle(SavedTask r,IBinder expected,TaskIdentity main,long start,Runnable complete,Runnable skipped){
        if(owner!=expected || !active || ending)return;
        try{
            synchronized(Wm.lock){
                if(liveTask(r.id,r.token)!=r.task || !r.dirty){skip(r,expected,skipped,"原任务已结束或身份改变");return;}
                long elapsed=SystemClock.uptimeMillis()-start;
                // Mode/bounds changes can relaunch the activity without removing its task.
                // A process attachment is not a task identity or a drawing acknowledgement.
                if(!runningActivity(r.task)){
                    if(elapsed<1500){Wm.handler.postDelayed(()->settle(r,expected,main,start,complete,skipped),32);return;}
                    skip(r,expected,skipped,"原任务重建未完成");return;
                }
                Object a=call(r.task,"topRunningActivity"),w=call(a,"findMainWindow");
                boolean frame=w!=null && Boolean.TRUE.equals(call(w,"isDrawn")) && Boolean.TRUE.equals(call(a,"isReportedDrawn"));
                boolean resumed="RESUMED".equals(((Enum<?>)activityState.invoke(a)).name());
                boolean focused=w!=null && field(Wm.display,"mCurrentFocus")==w;
                if(elapsed<32)diagnostic("READMIT_DRAW","task="+r.id+";state="+activityState.invoke(a)+";decorDrawn="+frame+";windowFocused="+focused);
                // A drawn decor can predate onResume and the game's SurfaceView.
                // Keep the native focus lease until resume has actually occurred.
                if((!frame || !resumed || !focused || elapsed<500) && elapsed<1500){Wm.handler.postDelayed(()->settle(r,expected,main,start,complete,skipped),32);return;}
                if(!frame || !resumed || !focused){skip(r,expected,skipped,"原副任务未完成恢复绘制");return;}
                diagnostic("READMIT_DRAW","task="+r.id+";state=RESUMED;decorDrawn=true;windowFocused=true;elapsedMs="+elapsed);
                drawn++;
                Object wct=transaction();call(wct,"setFocusable",r.token,false);
                if(main!=null && main.id!=r.id && WorkspaceUsers.allows(Wm.context,principal,main.user)){
                    Object previous=liveTask(main.id,main.token);
                    if(runningActivity(previous) && !ownsTask(previous) && (Integer)call(previous,"getWindowingMode")==1)call(wct,"reorder",main.token,true);
                }
                call(wct,"reorder",r.token,true);apply(wct);replay();
                CommitBarrier group=pendingCommit=new CommitBarrier();Object tx=call(Wm.display,"getPendingTransaction");
                trackCommit(tx,group);call(tx,"apply");group.seal();
                awaitCommit(group,expected,SystemClock.uptimeMillis()+1000,()->{pending=null;complete.run();},()->finish("副格绘制交接未确认"));
            }
        }catch(Exception|LinkageError e){finish("副格绘制交接失败："+e);}
    }
    static void skip(SavedTask r,IBinder expected,Runnable skipped,String reason)throws Exception{
        int slot=slots.index(r.id);
        if(slot<0 || saved.get(r.id)!=r)throw new IllegalStateException("待恢复副格身份改变");
        CommitBarrier group=pendingCommit=new CommitBarrier();
        Object wct=transaction();
        // Restore only the exact borrowed task. restore() refuses a replacement task,
        // a different parent, and a native freeform/PiP owner.
        if(r.dirty)restore(wct,r,group);
        apply(wct);group.seal();
        awaitCommit(group,expected,SystemClock.uptimeMillis()+1800,()->{
            synchronized(Wm.lock){
                if(r.dirty)verifyRestored(r);
                slots.replace(slot,r.id,-1);r.dirty=false;
                readmitting.consumed(slot);
                replay();
                report(null,0,"跳过原副格恢复："+reason,r.id);
                pending=null;
            }
            skipped.run();
        },()->finish("单个副格归还未确认"));
    }
}
