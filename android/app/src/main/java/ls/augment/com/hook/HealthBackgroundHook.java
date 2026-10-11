package ls.augment.com.hook;

import android.content.*;
import android.content.pm.ApplicationInfo;
import android.os.*;
import ls.augment.com.ConfigSchema;

/** Uses the app's existing bound data service, without a module foreground notification. */
final class HealthBackgroundHook {
    private static HealthBackgroundHook instance;
    private static final long CHECK_INTERVAL_MS=60_000;
    Context context;final Handler worker;
    boolean bound,connected;Context boundContext;long generation;
    String state="";ServiceConnection connection;

    private ServiceConnection newConnection(long token) {
        return new ServiceConnection(){
            private void deliver(Runnable callback){worker.post(()->{
                if(token==generation&&bound&&desired())callback.run();
            });}
            public void onServiceConnected(ComponentName name,IBinder service){deliver(()->{
                connected=true;reportState("CONNECTED",false,"原生数据服务已连接");
            });}
            public void onServiceDisconnected(ComponentName name){deliver(()->{
                connected=false;reportState("WAITING_FOR_SERVICE",false,"原生数据服务等待重连");
            });}
            public void onBindingDied(ComponentName name){deliver(()->{
                releaseBinding();reportState("WAITING_FOR_SERVICE",false,"原生数据服务等待重连",5000);
                worker.removeCallbacks(tick);worker.postDelayed(tick,5000);
            });}
            public void onNullBinding(ComponentName name){deliver(()->{
                releaseBinding();reportState("NO_SERVICE_CONNECTION",false,"原生数据服务未提供连接");
                worker.removeCallbacks(tick);worker.postDelayed(tick,CHECK_INTERVAL_MS);
            });}
        };
    }
    static synchronized void attach(Context c){if(instance==null&&c!=null)instance=new HealthBackgroundHook(c);}
    HealthBackgroundHook(Context c){context=c;HandlerThread t=new HandlerThread("LS-health-background");t.start();worker=new Handler(t.getLooper());connection=newConnection(generation);FeatureSettings.addSnapshotListener(c,this::queueRefresh);worker.postDelayed(tick,15000);}
    void queueRefresh(){worker.removeCallbacks(tick);worker.post(tick);}
    final Runnable refresh=()->{
        boolean desired=desired();
        if(!desired){release();return;}
        try{
            Context user=(Context)TargetReflection.call(context,"createContextAsUser",TargetReflection.call(UserHandle.class,"of",0),0);
            ApplicationInfo app=user.getPackageManager().getApplicationInfo("com.mi.health",0);
            // A stopped application must remain stopped, including when it was bound
            // before the stop. Recheck the flag instead of treating a binding as proof
            // that the remote service is still connected.
            if((app.flags&ApplicationInfo.FLAG_STOPPED)!=0){
                releaseBinding();
                reportState("WAITING_FOR_APP",true,"健康应用已被停止，打开一次后恢复后台计划");return;
            }
            if(bound){
                reportState(connected?"CONNECTED":"WAITING_FOR_SERVICE",false,
                        connected?"原生数据服务已连接":"原生数据服务等待连接");return;
            }
            Intent intent=new Intent().setComponent(new ComponentName("com.mi.health","com.xiaomi.fitness.device.manager.internal.DeviceManagerService"));
            // A waived-priority connection leaves the only health process cached
            // and eligible for Android's freezer. Keep it at background-service
            // importance so its real timetable can run without foreground UI.
            connection=newConnection(++generation);connected=false;
            bound=user.bindService(intent,connection,Context.BIND_AUTO_CREATE|Context.BIND_NOT_FOREGROUND);
            if(bound)boundContext=user;
            reportState(bound?"WAITING_FOR_SERVICE":"BIND_REJECTED",false,
                    bound?"原生数据服务等待连接":"后台服务未能启动，请在系统电池优化中允许小米运动健康自启动");
        }catch(Throwable e){
            releaseBinding();reportState("FAILED",null,"后台接入失败："+e.getClass().getSimpleName());
        }
    };
    boolean desired(){return MiHealthHook.Controller.configured(FeatureSettings.snapshot(context))&&FeatureSettings.enabled(context,ConfigSchema.HEALTH_BACKGROUND);}
    final Runnable tick=new Runnable(){public void run(){refresh.run();if(desired())worker.postDelayed(this,CHECK_INTERVAL_MS);}};
    void release(){
        worker.removeCallbacks(tick);releaseBinding();
        // Defaults stay silent, but disabling a waiting feature must clear its old
        // stopped/failure message just as disabling a connected feature does.
        if(!state.isEmpty()&&!"DISABLED".equals(state))reportState("DISABLED",null,"后台执行已关闭");
    }
    private void releaseBinding(){
        generation++;
        if(bound){try{boundContext.unbindService(connection);}catch(Throwable ignored){}}
        bound=false;connected=false;boundContext=null;
    }
    private void reportState(String next,Boolean stopped,String message){
        reportState(next,stopped,message,"DISABLED".equals(next)?0:CHECK_INTERVAL_MS);
    }
    private void reportState(String next,Boolean stopped,String message,long nextCheck){
        state=next;report(message);
        // The human message is deduplicated. This bounded, minute-level observation
        // keeps a repeated stopped/connected state distinguishable from an old boot.
        FeatureSettings.diagnostic(context,"ls_augment_health_background_state",
                "state="+next+";target_user=0;stopped="+(stopped==null?"unknown":stopped)
                +";bound="+bound+";connected="+connected+";checked_at="+System.currentTimeMillis()
                +";next_check_ms="+nextCheck);
    }
    void report(String text){FeatureSettings.diagnostic(context,"ls_augment_health_background_runtime",text);}
}
