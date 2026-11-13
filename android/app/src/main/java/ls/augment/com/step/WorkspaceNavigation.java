package ls.augment.com.step;

import android.app.ActivityManager;
import android.app.Notification;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import android.util.SparseArray;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Set;
import static ls.augment.com.step.StepRuntime.*;

/** A navigation notification discovers an existing task; the page is always that task's real UI. */
final class WorkspaceNavigation {
    final WorkspaceDeck deck;
    final LiveWorkspace host;
    boolean polling,unavailable,opening;
    int task=-1;
    Object token;
    WorkspaceNavigation(WorkspaceDeck deck){this.deck=deck;host=deck.owner.host;}
    void poll(){
        if(polling || unavailable || deck.closed || !host.ready || host.closing)return;
        polling=true;
        deck.owner.worker.execute(()->{
            Set<String> packages=new HashSet<>();String failure=null;
            try{
                Class<?> manager=Class.forName("android.app.NotificationManager");
                Method get=OwnershipBridge.method(manager,"getService");
                Object service=get.invoke(null);
                Method active=OwnershipBridge.method(service.getClass(),"getActiveNotificationsWithAttribution",String.class,String.class);
                if(active.getReturnType()!=StatusBarNotification[].class)throw new NoSuchMethodException("active notification result");
                for(StatusBarNotification n:(StatusBarNotification[])active.invoke(service,deck.ctx.getPackageName(),null)){
                    if(n==null || n.getUserId()!=deck.owner.userId)continue;
                    Notification value=n.getNotification();
                    if(value!=null && Notification.CATEGORY_NAVIGATION.equals(value.category)
                            && (value.flags&Notification.FLAG_ONGOING_EVENT)!=0)packages.add(n.getPackageName());
                }
            }catch(Exception|LinkageError error){failure=error.toString();}
            final String error=failure;
            host.main.post(()->{
                polling=false;if(deck.closed || host.closing)return;
                if(error!=null){unavailable=true;host.log("导航任务发现能力缺失，保留原生地图："+error);return;}
                int candidate=-1;Object identity=null;boolean ambiguous=false;
                synchronized(host.organizerLock){
                    SparseArray<?> tasks=(SparseArray<?>)field(host.organizer,"mTasks");
                    for(int n=0;n<tasks.size();n++){
                        ActivityManager.RunningTaskInfo t=(ActivityManager.RunningTaskInfo)call(tasks.valueAt(n),"getTaskInfo");
                        if(!LiveWorkspace.root(t) || LiveWorkspace.number(t,"displayId")!=0 || LiveWorkspace.number(t,"userId")!=deck.owner.userId
                                || t.baseActivity==null || !packages.contains(t.baseActivity.getPackageName()) || (Integer)call(t,"getActivityType")!=1)continue;
                        if(candidate>=0){ambiguous=true;break;}
                        candidate=t.taskId;identity=field(t,"token");
                    }
                }
                task=ambiguous?-1:candidate;token=ambiguous?null:identity;
                deck.navigationChanged(host.upperNavigationId>=0 || task>=0 && task!=host.upperAppId);
            });
        });
    }
    void open(){
        if(opening || !deck.owner.upper.canSwitch())return;
        if(!host.upperEnabled){deck.owner.logUnavailable("请先在布局设置中启用顶部工作区");return;}
        if(host.upperNavigationId>=0){host.upperActionFor(host.upperNavigationId,"show",null);return;}
        final int id=task;final Object expected=token;
        ActivityManager.RunningTaskInfo t=host.info(id);
        if(t==null || expected==null || !expected.equals(field(t,"token"))){deck.owner.logUnavailable("导航原任务已结束");poll();return;}
        if(id==host.upperAppId){host.upperActionFor(id,"show",null);return;}
        opening=true;
        Runnable start=()->{
            int side=host.slots.index(id);
            try{
                if(side>=0){
                    if(!WorkspaceRoutes.promote(host,side,ok->{if(ok)focus(id,expected);else refuse();}))refuse();
                }else focus(id,expected);
            }catch(RuntimeException error){refuse();host.log("导航原任务未切换："+error);}
        };
        if(deck.owner.upper.visible && host.upperId>=0)host.upperAction("park",start);else start.run();
    }
    // Runs inside SystemUI; the host permission is checked immediately before the call.
    @android.annotation.SuppressLint("MissingPermission")
    void focus(int id,Object expected){
        ActivityManager.RunningTaskInfo before=host.info(id);
        if(before==null || !expected.equals(field(before,"token")) || (Integer)call(before,"getWindowingMode")!=1){refuse();return;}
        ActivityManager.RunningTaskInfo current=host.focused();
        try{if(current==null || current.taskId!=id){
            if(deck.ctx.checkSelfPermission(android.Manifest.permission.REORDER_TASKS)!=android.content.pm.PackageManager.PERMISSION_GRANTED){refuse();return;}
            deck.ctx.getSystemService(ActivityManager.class).moveTaskToFront(id,0);
        }}
        catch(RuntimeException error){refuse();return;}
        long deadline=SystemClock.uptimeMillis()+2200;
        host.main.post(new Runnable(){long idleSince=-1;public void run(){
            if(deck.closed || host.closing){opening=false;return;}
            ActivityManager.RunningTaskInfo now=host.info(id),front=host.focused();
            if(now==null || !expected.equals(field(now,"token"))){refuse();return;}
            // Shell can briefly report idle between the native finish and a
            // queued follow-up. Require stable focus/idle across several frames.
            long time=SystemClock.uptimeMillis();
            boolean settled=!host.fence.busy() && Boolean.TRUE.equals(call(host.nativeTransitions,"isIdle"))
                    && front!=null && front.taskId==id;
            if(!settled)idleSince=-1;else if(idleSince<0)idleSince=time;
            if(settled && time-idleSince>=160){
                opening=false;deck.jump(WorkspaceDeck.NAVIGATION);host.change(-1,-1,true);return;
            }
            if(SystemClock.uptimeMillis()<deadline)host.main.postDelayed(this,40);else refuse();
        }});
    }
    void refuse(){opening=false;deck.owner.logUnavailable("导航原任务暂不可收纳，请稍后重试");}
}
