package ls.augment.com.step;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.os.*;
import android.view.View;
import java.lang.reflect.Method;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Consumer;
import static ls.augment.com.step.StepRuntime.*;

/** Only a unique, current-user original task may take over an ordinary launcher or notification open. */
final class WorkspaceRoutes {
    static void installNotification(ClassLoader cl){
        try{
            Class<?> type=Class.forName("com.android.systemui.statusbar.phone.StatusBarNotificationActivityStarter",false,cl);
            Class<?> entry=Class.forName("com.android.systemui.statusbar.notification.collection.NotificationEntry",false,cl);
            Class<?> row=Class.forName("com.android.systemui.statusbar.notification.row.ExpandableNotificationRow",false,cl);
            Method dispatch=OwnershipBridge.method(type,"startNotificationIntent",PendingIntent.class,Intent.class,entry,row,boolean.class,boolean.class);
            Method target=OwnershipBridge.method(PendingIntent.class,"getIntent");
            if(dispatch.getReturnType()!=void.class || target.getReturnType()!=Intent.class)throw new NoSuchMethodException("通知活动签名");
            StepHooks.hookMethod(dispatch,new StepHook(){@Override protected void beforeHookedMethod(MethodHookParam p){
                LiveWorkspace h=LiveWorkspace.current;
                if(h==null || !h.ready || h.closing || h.quickBar==null || !h.quickBar.currentUser() || Looper.myLooper()!=Looper.getMainLooper())return;
                try{
                    PendingIntent pending=(PendingIntent)p.args[0];
                    if(pending==null || !pending.isActivity() || pending.getCreatorUserHandle()==null || !interactive(Shell.context))return;
                    int targetUser=WorkspaceUsers.id(pending.getCreatorUserHandle());
                    if(!WorkspaceUsers.allows(Shell.context,h.quickBar.userId,targetUser))return;
                    Intent open=(Intent)target.invoke(pending);
                    if(open==null)return;
                    ComponentName cn=open.getComponent();
                    if(cn==null && targetUser==h.quickBar.userId)cn=open.resolveActivity(Shell.context.getPackageManager());
                    if(cn==null)return;
                    int slot=match(h,cn.getPackageName(),targetUser,-1,null);
                    if(slot<0)return;
                    Object receiver=p.thisObject;Object[] arguments=p.args.clone();
                    boolean accepted=promote(h,slot,ok->{
                        if(!interactive(Shell.context) || !WorkspaceUsers.allows(Shell.context,WorkspaceUsers.id(h.quickUser),targetUser)
                                || !Shell.context.getSystemService(UserManager.class).isUserForeground())return;
                        try{StepHooks.invokeOriginalMethod(dispatch,receiver,arguments);}
                        catch(Throwable e){h.log("原通知交付失败："+e.getClass().getSimpleName());}
                    });
                    if(accepted)p.setResult(null);
                }catch(Throwable unavailable){h.log("通知保留原生分发："+unavailable.getClass().getSimpleName());}
            }});
        }catch(ReflectiveOperationException|LinkageError e){report(null,0,"通知启动接口未接入："+e,-1);}
    }
    static int match(LiveWorkspace h,String pkg,int targetUser,int id,Object token){
        int found=-1;
        for(int slot=0;slot<h.visibleSlots;slot++){
            int task=h.slots.task(slot);if(task<0 || id>=0 && task!=id)continue;
            ActivityManager.RunningTaskInfo info=h.info(task);
            if(info==null || info.baseActivity==null || !pkg.equals(info.baseActivity.getPackageName())
                    || LiveWorkspace.number(info,"userId")!=targetUser || LiveWorkspace.number(info,"displayId")!=0
                    || (Integer)call(info,"getWindowingMode")!=6 || token!=null && !token.equals(field(info,"token")))continue;
            if(found>=0)return -1;found=slot;
        }
        return found;
    }
    static boolean promote(LiveWorkspace host,int slot,Consumer<Boolean> done){
        if(host.retained!=null || host.quickBar==null || host.quickBar.picker!=null || host.quickBar.tools.clipboard!=null)return false;
        host.preflight();
        int id=host.slots.task(slot);ActivityManager.RunningTaskInfo before=host.info(id);
        if(before==null)return false;Object token=field(before,"token");host.change(slot);
        if(!host.fence.busy())return false;
        long limit=SystemClock.uptimeMillis()+2300;
        host.main.post(new Runnable(){public void run(){
            boolean ok=false;
            try{
                if(!host.closing && !host.closed){
                    if(host.fence.busy() && SystemClock.uptimeMillis()<limit){host.main.postDelayed(this,30);return;}
                    ActivityManager.RunningTaskInfo now=host.focused();
                    ok=now!=null && now.taskId==id && token.equals(field(now,"token")) && (Integer)call(now,"getWindowingMode")==1;
                }
            }catch(RuntimeException ignored){}
            done.accept(ok);
        }});
        return true;
    }
    static void hostRoute(LiveWorkspace h,Bundle b){
        ResultReceiver reply=b.getParcelable("routeReply");
        if(reply==null)return;
        try{
            if(h.quickBar!=null && h.quickBar.currentUser() && b.getLong("deadline")>SystemClock.uptimeMillis()){
                int targetUser=b.getInt("routeUser",-1);
                if(!WorkspaceUsers.allows(Shell.context,h.quickBar.userId,targetUser)){reply.send(0,new Bundle());return;}
                int slot=match(h,b.getString("pkg"),targetUser,b.getInt("id"),b.getParcelable("token"));
                if(slot>=0 && promote(h,slot,ok->reply.send(ok?1:0,new Bundle())))return;
            }
        }catch(RuntimeException ignored){}
        reply.send(0,new Bundle());
    }
    static void installDesktop(ClassLoader cl){
        try{
            Class<?> service=Class.forName("com.android.server.wm.ActivityTaskManagerService",false,cl);
            Class<?> caller=Class.forName("android.app.IApplicationThread",false,cl),profile=Class.forName("android.app.ProfilerInfo",false,cl);
            Class<?>[] args={caller,String.class,String.class,Intent.class,String.class,IBinder.class,String.class,
                    int.class,int.class,profile,Bundle.class};
            Class<?>[] asUser=java.util.Arrays.copyOf(args,args.length+1);asUser[11]=int.class;
            Method start=OwnershipBridge.method(service,"startActivity",args),user=OwnershipBridge.method(service,"startActivityAsUser",asUser);
            Method recent=OwnershipBridge.method(service,"startActivityFromRecents",int.class,Bundle.class);
            int front=ActivityManager.class.getField("START_TASK_TO_FRONT").getInt(null);
            for(Method method:new Method[]{start,user,recent}){
                if(method.getReturnType()!=int.class)continue;
                StepHooks.hookMethod(method,new StepHook(){@Override protected void beforeHookedMethod(MethodHookParam p){
                    try{if(before(p.args,method==recent) && method!=recent)p.setResult(front);}
                    catch(Throwable e){/* Unrecognised launch semantics always continue through the original call. */}
                }});
            }
        }catch(ReflectiveOperationException|LinkageError e){report(null,0,"桌面／最近任务接口未接入："+e,-1);}
    }
    static boolean before(Object[] args,boolean recents)throws Exception{
        if(!NativeWorkspaceGuard.active || NativeWorkspaceGuard.ending || Wm.handler==null || Looper.myLooper()==Wm.handler.getLooper()
                || Thread.holdsLock(Wm.lock) || !interactive(Wm.context))return false;
        int uid=Binder.getCallingUid();if(uid==android.os.Process.myUid())return false;
        PackageManager pm=Wm.context.getPackageManager();Intent home=new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME);
        ResolveInfo defaultHome=pm.resolveActivity(home,PackageManager.MATCH_DEFAULT_ONLY);
        if(defaultHome==null || defaultHome.activityInfo==null || defaultHome.activityInfo.applicationInfo.uid!=uid
                || (defaultHome.activityInfo.applicationInfo.flags&ApplicationInfo.FLAG_SYSTEM)==0)return false;
        String launcher=defaultHome.activityInfo.packageName;int callerUser=WorkspaceUsers.id(UserHandle.getUserHandleForUid(uid));
        int user=!recents && args.length>11?(Integer)args[11]:callerUser;
        if(callerUser!=NativeWorkspaceGuard.principal || !WorkspaceUsers.allows(Wm.context,callerUser,user))return false;
        Bundle options=(Bundle)args[recents?1:10];
        if(options!=null){
            ActivityOptions opt=(ActivityOptions)StepMembers.callStaticMethod(ActivityOptions.class,"fromBundle",options);
            if(opt==null || (Integer)call(opt,"getLaunchWindowingMode")!=0 || opt.getLaunchDisplayId()>0 || opt.getLaunchBounds()!=null)return false;
        }
        ComponentName component=null;
        if(!recents){
            Intent i=(Intent)args[3];
            if(!launcher.equals(args[1]) || args[4]!=null || args[5]!=null || (Integer)args[7]>=0 || (Integer)args[8]!=0
                    || args[9]!=null
                    || i==null || !Intent.ACTION_MAIN.equals(i.getAction()) || !i.hasCategory(Intent.CATEGORY_LAUNCHER)
                    || i.getData()!=null || i.getSelector()!=null || i.getExtras()!=null && !i.getExtras().isEmpty()
                    || (i.getFlags() & (Intent.FLAG_ACTIVITY_CLEAR_TASK|Intent.FLAG_ACTIVITY_CLEAR_TOP|Intent.FLAG_ACTIVITY_MULTIPLE_TASK
                            |Intent.FLAG_ACTIVITY_NEW_DOCUMENT|Intent.FLAG_ACTIVITY_FORWARD_RESULT))!=0 || (component=i.getComponent())==null)return false;
        }
        Bundle event;ResultReceiver host;CountDownLatch latch=new CountDownLatch(1);AtomicBoolean success=new AtomicBoolean();
        synchronized(Wm.lock){
            if(NativeWorkspaceGuard.pendingCommit!=null || NativeWorkspaceGuard.flip!=null || NativeWorkspaceGuard.events==null)return false;
            Object focus=field(Wm.display,"mCurrentFocus");
            Object front=focus==null?null:call(focus,"getTask");
            if(!recents && (front==null || (Integer)call(front,"getActivityType")!=2))return false;
            NativeWorkspaceGuard.SavedTask candidate=null;
            for(int id:NativeWorkspaceGuard.slots.snapshot()){
                NativeWorkspaceGuard.SavedTask r=NativeWorkspaceGuard.saved.get(id);
                if(r==null || !r.dirty || (recents ? r.id!=(Integer)args[0] || !WorkspaceUsers.allows(Wm.context,callerUser,r.user) : r.user!=user)
                        || NativeWorkspaceGuard.liveTask(r.id,r.token)!=r.task)continue;
                ActivityManager.RunningTaskInfo t=(ActivityManager.RunningTaskInfo)call(r.task,"getTaskInfo");
                if(t.baseActivity==null || !recents && !component.equals(t.baseActivity)
                        || (Integer)call(t,"getWindowingMode")!=6)continue;
                if(candidate!=null)return false;candidate=r;
            }
            if(candidate==null)return false;
            ActivityManager.RunningTaskInfo t=(ActivityManager.RunningTaskInfo)call(candidate.task,"getTaskInfo");
            host=NativeWorkspaceGuard.events;event=NativeWorkspaceGuard.base();
            event.putString("pkg",t.baseActivity.getPackageName());event.putInt("id",t.taskId);event.putInt("routeUser",candidate.user);
            event.putParcelable("token",(Parcelable)candidate.token);event.putLong("deadline",SystemClock.uptimeMillis()+600);
            event.putParcelable("routeReply",remote(new ResultReceiver(Wm.handler){
                protected void onReceiveResult(int code,Bundle data){success.set(code==1);latch.countDown();}
            }));
        }
        host.send(96,event);
        // Do not hold the WM lock or the service handler while Shell commits the original surfaces.
        return latch.await(2500,TimeUnit.MILLISECONDS) && success.get();
    }
}
