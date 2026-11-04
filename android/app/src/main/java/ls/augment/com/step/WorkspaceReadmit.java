package ls.augment.com.step;

import android.os.IBinder;
import android.os.SystemClock;
import java.lang.reflect.Method;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Reconnect an existing activity's rendering process. Never resolve or launch a package. */
final class WorkspaceReadmit {
    static boolean available;
    static void probe(ClassLoader loader){
        try{
            Class<?> activity=Class.forName("com.android.server.wm.ActivityRecord",false,loader);
            Class<?> window=Class.forName("com.android.server.wm.WindowState",false,loader);
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
    static void settle(SavedTask r,IBinder expected,TaskIdentity main,long start,Runnable complete){
        if(owner!=expected || !active || ending)return;
        try{
            synchronized(Wm.lock){
                if(liveTask(r.id,r.token)!=r.task || !r.dirty || !runningActivity(r.task))throw new IllegalStateException("原任务已离开");
                Object a=call(r.task,"topRunningActivity"),w=call(a,"findMainWindow");
                boolean frame=w!=null && Boolean.TRUE.equals(call(w,"isDrawn")) && Boolean.TRUE.equals(call(a,"isReportedDrawn"));
                long elapsed=SystemClock.uptimeMillis()-start;
                if((!frame || elapsed<200) && elapsed<1050){Wm.handler.postDelayed(()->settle(r,expected,main,start,complete),32);return;}
                if(frame)drawn++;else report(null,0,"原副任务尚未确认首帧，继续监听原任务",r.id);
                Object wct=transaction();call(wct,"setFocusable",r.token,false);
                if(main!=null && main.id!=r.id && WorkspaceUsers.allows(Wm.context,principal,main.user)){
                    Object previous=liveTask(main.id,main.token);
                    if(runningActivity(previous) && !ownsTask(previous) && (Integer)call(previous,"getWindowingMode")==1)call(wct,"reorder",main.token,true);
                }
                call(wct,"reorder",r.token,true);apply(wct);replay();
                CommitBarrier group=pendingCommit=new CommitBarrier();Object tx=call(Wm.display,"getPendingTransaction");
                trackCommit(tx,group);call(tx,"apply");group.seal();
                awaitCommit(group,expected,SystemClock.uptimeMillis()+1000,complete,()->finish("副格绘制交接未确认"));
            }
        }catch(Exception|LinkageError e){finish("副格绘制交接失败："+e);}
    }
}
