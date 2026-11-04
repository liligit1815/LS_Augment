package ls.augment.com;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.os.*;
import android.service.notification.StatusBarNotification;
import android.text.TextUtils;
import java.lang.reflect.Method;
import java.util.concurrent.*;
import java.util.function.Consumer;

/** Read the foreground user's active guidance, only while the Step workspace is open. */
public final class StepRouteFeed implements AutoCloseable {
    public static final class Route {
        public final String app,title,detail;
        Route(String app,String title,String detail){this.app=app;this.title=title;this.detail=detail;}
    }
    private final Context ctx;
    private final UserHandle user;
    private final Handler main;
    private final Consumer<Route> changed;
    private final Consumer<String> diagnostics;
    private final ScheduledExecutorService worker=Executors.newSingleThreadScheduledExecutor();
    private volatile boolean closed;
    private AtomicWorkbenchAmapLinkClient link;
    private String linkKey;
    private long retryAt;
    private String lastError="";
    private Method query;
    private Object service;

    public StepRouteFeed(Context ctx,UserHandle user,Handler main,Consumer<Route> changed,Consumer<String> diagnostics){
        this.ctx=ctx;this.user=user;this.main=main;this.changed=changed;this.diagnostics=diagnostics;
        worker.scheduleWithFixedDelay(this::refresh,0,1100,TimeUnit.MILLISECONDS);
    }
    private boolean unlocked(){
        return user!=null && user.equals(android.os.Process.myUserHandle()) && ctx.getSystemService(UserManager.class).isUserForeground()
                && !ctx.getSystemService(android.app.KeyguardManager.class).isKeyguardLocked();
    }
    private void refresh(){
        Route result=null;
        try{if(!closed && unlocked())result=read();}
        catch(Exception|LinkageError unavailable){
            service=null;query=null;
            Throwable cause=unavailable.getCause()==null?unavailable:unavailable.getCause();
            String reason=cause.getClass().getSimpleName();
            if(!reason.equals(lastError)){lastError=reason;main.post(()->{if(!closed)diagnostics.accept("顶栏导航通知接口不可用："+reason);});}
        }
        if(result==null)releaseLink();
        final Route snapshot=result;
        if(!closed)main.post(()->{if(!closed)changed.accept(unlocked()?snapshot:null);});
    }
    private Route read()throws Exception{
        if(service==null){
            Method get=NotificationManager.class.getDeclaredMethod("getService");get.setAccessible(true);
            service=get.invoke(null);
            query=Class.forName("android.app.INotificationManager").getMethod("getActiveNotificationsWithAttribution",String.class,String.class);
            if(query.getReturnType()!=StatusBarNotification[].class)throw new NoSuchMethodException("notification snapshot");
        }
        StatusBarNotification best=null; String heading="",line="";
        StatusBarNotification[] items=(StatusBarNotification[])query.invoke(service,ctx.getPackageName(),null);
        if(items==null)return null;
        for(StatusBarNotification s:items){
            if(s==null || !user.equals(s.getUser()) || !user.equals(UserHandle.getUserHandleForUid(s.getUid())))continue;
            Notification n=s.getNotification();if(n==null || n.visibility==Notification.VISIBILITY_SECRET ||
                    (n.flags&Notification.FLAG_GROUP_SUMMARY)!=0 || n.extras==null)continue;
            String pkg=s.getPackageName();
            boolean category=Notification.CATEGORY_NAVIGATION.equals(n.category);
            boolean amapRoute=AtomicWorkbenchAmapData.PACKAGE.equals(pkg) && "ROUTE_CHANNEL_ID".equals(n.getChannelId());
            if(!category && !amapRoute)continue;
            if((n.flags&Notification.FLAG_ONGOING_EVENT)==0)continue;
            String title=text(n.extras,Notification.EXTRA_TITLE),body=text(n.extras,Notification.EXTRA_BIG_TEXT);
            if(body.isEmpty())body=text(n.extras,Notification.EXTRA_TEXT);
            String words=title+" "+body;
            if(words.contains("导航已结束") || words.contains("导航结束") || words.contains("已退出导航") ||
                    words.contains("已到达目的地") || words.contains("规划路线") || words.contains("算路中"))continue;
            if(AtomicWorkbenchAmapData.PACKAGE.equals(pkg) && "ended".equals(n.extras.getString(AtomicWorkbenchAmapData.STATUS)))continue;
            if(best==null || s.getPostTime()>best.getPostTime()){best=s;heading=title;line=body;}
        }
        if(best==null)return null;
        String pkg=best.getPackageName(),app=pkg;
        android.content.pm.ApplicationInfo info=ctx.getPackageManager().getApplicationInfo(pkg,0);
        if(info.uid!=best.getUid())return null;
        app=ctx.getPackageManager().getApplicationLabel(info).toString();
        Bundle state=new Bundle();state.putBoolean("owner_user_current",true);state.putBoolean("available",true);
        state.putBoolean("has_session",true);state.putBoolean("has_guidance",true);state.putString("navigation_status","active");
        state.putString("package",pkg);state.putString("title",heading.isEmpty() || heading.equals(app)?(line.isEmpty()?"导航进行中":line):heading);
        state.putString("subtitle",line.equals(state.getString("title"))?"":line);
        if(AtomicWorkbenchAmapData.PACKAGE.equals(pkg)){
            long now=SystemClock.elapsedRealtime();
            Bundle extras=best.getNotification().extras;
            if(extras.getInt(AtomicWorkbenchAmapData.VERSION,0)==AtomicWorkbenchAmapData.CONTRACT &&
                    "active".equals(extras.getString(AtomicWorkbenchAmapData.STATUS)) &&
                    AtomicWorkbenchAmapData.fresh(now,extras.getLong(AtomicWorkbenchAmapData.UPDATED,-1),
                            "spoken".equals(extras.getString(AtomicWorkbenchAmapData.SOURCE)))){
                String road=text(extras,AtomicWorkbenchAmapData.TITLE),turn=text(extras,AtomicWorkbenchAmapData.CONTENT);
                if(!road.isEmpty())state.putString("title",road);
                if(!turn.isEmpty())state.putString("subtitle",turn);
                Bundle metrics=AtomicWorkbenchAmapData.structured(extras.getBundle(AtomicWorkbenchAmapData.METRICS));
                if(metrics!=null)state.putBundle(AtomicWorkbenchAmapData.METRICS,metrics);
            }
            if(!best.getKey().equals(linkKey) || link!=null && link.isClosed() && now>=retryAt){
                releaseLink();linkKey=best.getKey();retryAt=now+60000;
                link=new AtomicWorkbenchAmapLinkClient(ctx,now);link.routeState(1,false);
            }
            if(link!=null && !link.isClosed()){link.touch();state=link.merge(state);}
        }else releaseLink();
        AtomicWorkbenchNavigationCardData data=AtomicWorkbenchNavigationCardData.from(state);
        String title=join(data.maneuver,data.title),detail=join(data.subtitle,data.remaining);
        lastError="";
        return new Route(app,title,detail);
    }
    private static String join(String a,String b){return a.isEmpty()?b:b.isEmpty() || a.equals(b)?a:a+" · "+b;}
    private static String text(Bundle extras,String field){
        CharSequence t=extras.getCharSequence(field);
        return TextUtils.isEmpty(t)?"":t.subSequence(0,Math.min(t.length(),160)).toString().trim();
    }
    private void releaseLink(){if(link!=null)link.close();link=null;linkKey=null;}
    @Override public void close(){closed=true;worker.execute(this::releaseLink);worker.shutdown();}
}
