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
                    // The original launcher call is still waiting for this reply.
                    // Its focus notification may follow only after that call resumes.
                    // Confirm the exact completed role handoff, independently of focus.
                    ActivityManager.RunningTaskInfo now=host.info(id);
                    ok=!host.fence.busy() && host.slots.index(id)<0 && now!=null && now.taskId==id
                            && token.equals(field(now,"token")) && (Integer)call(now,"getWindowingMode")==1;
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
        installLauncherApps(cl);
        try{
            Class<?> service=Class.forName("com.android.server.wm.ActivityTaskManagerService",false,cl);
            Class<?> caller=Class.forName("android.app.IApplicationThread",false,cl),profile=Class.forName("android.app.ProfilerInfo",false,cl);
            Class<?>[] args={caller,String.class,String.class,Intent.class,String.class,IBinder.class,String.class,
                    int.class,int.class,profile,Bundle.class};
            Class<?>[] asUser=java.util.Arrays.copyOf(args,args.length+1);asUser[11]=int.class;
            String[] names={"startActivity","startActivityAsUser","startActivityFromRecents"};
            Class<?>[][] signatures={args,asUser,new Class<?>[]{int.class,Bundle.class}};
            for(int n=0;n<names.length;n++){
                Method method;
                try{method=OwnershipBridge.method(service,names[n],signatures[n]);}
                catch(NoSuchMethodException missing){report(null,0,"桌面启动能力缺失："+names[n],-1);continue;}
                if(method.getReturnType()!=int.class || java.lang.reflect.Modifier.isStatic(method.getModifiers()))continue;
                final boolean recents=n==2;
                StepHooks.module.deoptimize(method);
                StepHooks.hookMethod(method,new StepHook(){@Override protected void beforeHookedMethod(MethodHookParam p){
                    // The launch still owns its security checks, result token and
                    // onNewIntent delivery after the exact task returns to main.
                    try{before(p.args,recents);}
                    catch(Throwable e){if(NativeWorkspaceGuard.active)diagnostic("DESKTOP_ROUTE","native_fallback;entry="+method.getName()+";error="+e.getClass().getSimpleName());}
                }});
                diagnostic("DESKTOP_ROUTE","entry_installed;owner=ATMS;entry="+method.getName());
            }
        }catch(ReflectiveOperationException|LinkageError e){report(null,0,"桌面／最近任务接口未接入："+e,-1);}
    }
    /** LauncherApps delegates to ATMS.LocalService, bypassing the public ATMS hooks. */
    static void installLauncherApps(ClassLoader cl){
        try{
            Class<?> impl=Class.forName("com.android.server.pm.LauncherAppsService$LauncherAppsImpl",false,cl);
            Class<?> caller=Class.forName("android.app.IApplicationThread",false,cl);
            Method access=OwnershipBridge.method(impl,"canAccessProfile",int.class,String.class);
            Method intent=OwnershipBridge.method(impl,"getMainActivityLaunchIntent",ComponentName.class,UserHandle.class,boolean.class);
            if(access.getReturnType()!=boolean.class || intent.getReturnType()!=Intent.class)throw new NoSuchMethodException("LauncherApps validation");
            int installed=0;
            for(boolean withToken:new boolean[]{true,false}){
                Class<?>[] signature=withToken
                        ?new Class<?>[]{IBinder.class,caller,String.class,String.class,ComponentName.class,android.graphics.Rect.class,Bundle.class,UserHandle.class}
                        :new Class<?>[]{caller,String.class,String.class,ComponentName.class,android.graphics.Rect.class,Bundle.class,UserHandle.class};
                Method start;
                try{start=OwnershipBridge.method(impl,"startActivityAsUser",signature);}
                catch(NoSuchMethodException absent){continue;}
                if(start.getReturnType()!=void.class || java.lang.reflect.Modifier.isStatic(start.getModifiers()))continue;
                final int offset=withToken?1:0;
                StepHooks.module.deoptimize(start);
                StepHooks.hookMethod(start,new StepHook(){@Override protected void beforeHookedMethod(MethodHookParam p){
                    if(!NativeWorkspaceGuard.active || NativeWorkspaceGuard.ending)return;
                    try{
                        ComponentName component=(ComponentName)p.args[3+offset];UserHandle user=(UserHandle)p.args[6+offset];
                        if(component==null || user==null){routeSkip("launcherapps_missing_target");return;}
                        int target=WorkspaceUsers.id(user);
                        if(!Boolean.TRUE.equals(access.invoke(p.thisObject,target,"Step desktop route"))
                                || intent.invoke(p.thisObject,component,user,true)==null){routeSkip("launcherapps_native_validation");return;}
                        routeNative(component,target,-1,(String)p.args[1+offset],(Bundle)p.args[5+offset]);
                        // Always preserve the original security checks and launch intent delivery.
                    }catch(Exception|LinkageError unavailable){report(null,0,"桌面副任务归还未接入："+unavailable.getClass().getSimpleName(),-1);}
                }});installed++;
                diagnostic("DESKTOP_ROUTE","entry_installed;owner=LauncherApps;token="+withToken);
            }
            if(installed==0)throw new NoSuchMethodException("LauncherApps.startActivityAsUser signature");
        }catch(ReflectiveOperationException|LinkageError unavailable){report(null,0,"桌面 LauncherApps 接口未接入："+unavailable,-1);}
    }
    static boolean before(Object[] args,boolean recents)throws Exception{
        ComponentName component=null;
        if(!recents){
            Intent i=(Intent)args[3];
            // Activity.startActivity supplies its own resultTo token even with
            // requestCode == -1. Launcher metadata extras also belong to the
            // original launch; neither makes an ordinary MAIN launch a result request.
            if(args[4]!=null || args[6]!=null || (Integer)args[7]>=0 || (Integer)args[8]!=0 || args[9]!=null
                    || i==null || !Intent.ACTION_MAIN.equals(i.getAction()) || !i.hasCategory(Intent.CATEGORY_LAUNCHER)
                    || i.getData()!=null || i.getSelector()!=null
                    || (i.getFlags() & (Intent.FLAG_ACTIVITY_CLEAR_TASK|Intent.FLAG_ACTIVITY_CLEAR_TOP|Intent.FLAG_ACTIVITY_MULTIPLE_TASK
                            |Intent.FLAG_ACTIVITY_NEW_DOCUMENT|Intent.FLAG_ACTIVITY_FORWARD_RESULT))!=0 || (component=i.getComponent())==null)return routeSkip("intent_contract");
        }
        int callerUser=WorkspaceUsers.id(UserHandle.getUserHandleForUid(Binder.getCallingUid()));
        return routeNative(component,!recents && args.length>11?(Integer)args[11]:callerUser,
                recents?(Integer)args[0]:-1,recents?null:(String)args[1],(Bundle)args[recents?1:10]);
    }
    static boolean routeNative(ComponentName component,int user,int recentId,String callingPackage,Bundle options)throws Exception{
        boolean recents=recentId>=0;
        if(!NativeWorkspaceGuard.active || NativeWorkspaceGuard.ending)return false;
        if(Wm.handler==null || Looper.myLooper()==Wm.handler.getLooper() || Thread.holdsLock(Wm.lock))return routeSkip("native_thread_or_lock");
        if(!interactive(Wm.context))return routeSkip("not_interactive");
        int uid=Binder.getCallingUid();if(uid==android.os.Process.myUid())return routeSkip("system_caller");
        PackageManager pm=Wm.context.getPackageManager();Intent home=new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME);
        ResolveInfo defaultHome=pm.resolveActivity(home,PackageManager.MATCH_DEFAULT_ONLY);
        if(defaultHome==null || defaultHome.activityInfo==null || defaultHome.activityInfo.applicationInfo.uid!=uid
                || (defaultHome.activityInfo.applicationInfo.flags&ApplicationInfo.FLAG_SYSTEM)==0)return routeSkip("caller_not_native_home");
        String launcher=defaultHome.activityInfo.packageName;int callerUser=WorkspaceUsers.id(UserHandle.getUserHandleForUid(uid));
        if(!recents && !launcher.equals(callingPackage))return routeSkip("caller_package");
        if(callerUser!=NativeWorkspaceGuard.principal || !routeUserAllowed(callerUser,user))
            return routeSkip("user_scope;caller="+callerUser+";owner="+NativeWorkspaceGuard.principal+";target="+user);
        if(options!=null){
            ActivityOptions opt=(ActivityOptions)StepMembers.callStaticMethod(ActivityOptions.class,"fromBundle",options);
            if(opt==null)return routeSkip("invalid_options");
            int mode=(Integer)call(opt,"getLaunchWindowingMode");
            if(mode!=0 && mode!=1 || opt.getLaunchDisplayId()>0 || opt.getLaunchBounds()!=null){
                diagnostic("DESKTOP_ROUTE","native_options;mode="+mode+";display="+opt.getLaunchDisplayId()+";bounded="+(opt.getLaunchBounds()!=null));return false;
            }
        }
        // Some apps replace their launcher/splash activity and rewrite the task's
        // base intent. Match that case only when the OS confirms exactly one
        // enabled launcher entry, then require one live task in this user below.
        // Query LauncherApps before taking the WM lock (it calls other services).
        boolean singleEntry=!recents && singleLauncherEntry(component,user);
        Bundle event;ResultReceiver host;CountDownLatch latch=new CountDownLatch(1);AtomicBoolean success=new AtomicBoolean();
        synchronized(Wm.lock){
            if(NativeWorkspaceGuard.pendingCommit!=null || NativeWorkspaceGuard.flip!=null || NativeWorkspaceGuard.events==null)return routeSkip("handoff_busy_or_host_missing");
            Object focus=field(Wm.display,"mCurrentFocus");
            Object front=focus==null?null:call(focus,"getTask");
            if(!recents && (front==null || (Integer)call(front,"getActivityType")!=2))return routeSkip("focus_not_home");
            NativeWorkspaceGuard.SavedTask candidate=null,related=null;
            int exactCount=0,relatedCount=0;
            for(int id:NativeWorkspaceGuard.slots.snapshot()){
                NativeWorkspaceGuard.SavedTask r=NativeWorkspaceGuard.saved.get(id);
                if(r==null || !r.dirty || (recents ? r.id!=recentId || !routeUserAllowed(callerUser,r.user) : r.user!=user)
                        || NativeWorkspaceGuard.liveTask(r.id,r.token)!=r.task)continue;
                ActivityManager.RunningTaskInfo t=(ActivityManager.RunningTaskInfo)call(r.task,"getTaskInfo");
                if(t.baseActivity==null || (Integer)call(t,"getWindowingMode")!=6)continue;
                if(recents || launchComponentMatches(component,t)){candidate=r;exactCount++;}
                else if(singleEntry && component.getPackageName().equals(t.baseActivity.getPackageName())){related=r;relatedCount++;}
            }
            if(exactCount>1 || exactCount==0 && relatedCount>1){diagnostic("DESKTOP_ROUTE","ambiguous_tasks");return false;}
            if(candidate==null && relatedCount==1)candidate=related;
            if(candidate==null){diagnostic("DESKTOP_ROUTE","no_matching_side_task;singleEntry="+singleEntry);return false;}
            ActivityManager.RunningTaskInfo t=(ActivityManager.RunningTaskInfo)call(candidate.task,"getTaskInfo");
            host=NativeWorkspaceGuard.events;event=NativeWorkspaceGuard.base();
            event.putString("pkg",t.baseActivity.getPackageName());event.putInt("id",t.taskId);event.putInt("routeUser",candidate.user);
            event.putParcelable("token",(Parcelable)candidate.token);event.putLong("deadline",SystemClock.uptimeMillis()+600);
            event.putParcelable("routeReply",remote(new ResultReceiver(Wm.handler){
                protected void onReceiveResult(int code,Bundle data){success.set(code==1);latch.countDown();}
            }));
            diagnostic("DESKTOP_ROUTE","matched;task="+candidate.id+";path="+(exactCount>0?"exact_component":"single_launcher_entry"));
        }
        host.send(96,event);
        // Do not hold the WM lock or the service handler while Shell commits the original surfaces.
        boolean restored=latch.await(2500,TimeUnit.MILLISECONDS) && success.get();
        if(restored)synchronized(Wm.lock){
            NativeWorkspaceGuard.SavedTask current=NativeWorkspaceGuard.saved.get(event.getInt("id"));
            restored=NativeWorkspaceGuard.active && !NativeWorkspaceGuard.ending && current!=null && !current.dirty
                    && event.getParcelable("token").equals(current.token)
                    && NativeWorkspaceGuard.liveTask(current.id,current.token)==current.task
                    && (Integer)call(current.task,"getWindowingMode")==1;
        }
        report(null,0,"桌面副任务路由：task="+event.getInt("id")+"；restored="+restored,event.getInt("id"));
        return restored;
    }
    static boolean routeUserAllowed(int owner,int user){
        // The caller has already been authenticated as the native HOME package.
        // Foreground/profile state is a server-owned read: do not make its privileged
        // service queries inherit the launcher's Binder identity. Restore that exact
        // identity before dispatching or continuing the original native launch.
        long identity=Binder.clearCallingIdentity();
        try{return WorkspaceUsers.allows(Wm.context,owner,user);}
        finally{Binder.restoreCallingIdentity(identity);}
    }
    static boolean routeSkip(String reason){
        if(NativeWorkspaceGuard.active && !NativeWorkspaceGuard.ending){
            long now=SystemClock.uptimeMillis();
            synchronized(RouteNotes.last){
                Long before=RouteNotes.last.get(reason);
                if(before!=null && now-before<1000)return false;
                RouteNotes.last.put(reason,now);
            }
            diagnostic("DESKTOP_ROUTE","native_continue;reason="+reason);
        }
        return false;
    }
    static final class RouteNotes {static final java.util.Map<String,Long> last=new java.util.HashMap<>();}
    static boolean launchComponentMatches(ComponentName component,ActivityManager.RunningTaskInfo task){
        return component!=null && (component.equals(task.baseActivity) || component.equals(task.origActivity)
                || task.baseIntent!=null && component.equals(task.baseIntent.getComponent()));
    }
    static boolean singleLauncherEntry(ComponentName component,int user){
        if(component==null)return false;
        long identity=Binder.clearCallingIdentity();
        try{
            LauncherApps launcher=Wm.context.getSystemService(LauncherApps.class);
            UserHandle profile=(UserHandle)StepMembers.callStaticMethod(UserHandle.class,"of",user);
            if(launcher==null || !launcher.isActivityEnabled(component,profile))return false;
            java.util.List<LauncherActivityInfo> entries=launcher.getActivityList(component.getPackageName(),profile);
            return entries!=null && entries.size()==1 && component.equals(entries.get(0).getComponentName());
        }catch(RuntimeException|LinkageError missing){diagnostic("DESKTOP_ROUTE","launcher_entry_unavailable;error="+missing.getClass().getSimpleName());return false;}
        finally{Binder.restoreCallingIdentity(identity);}
    }
}
