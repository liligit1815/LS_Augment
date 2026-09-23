package ls.augment.com.hook;

import android.content.*;
import android.content.pm.ApplicationInfo;
import android.os.*;
import ls.augment.com.ConfigSchema;

/** Uses the app's existing bound data service, without a module foreground notification. */
final class HealthBackgroundHook {
    private static HealthBackgroundHook instance;
    Context context;final Handler worker;boolean bound;Context boundContext;
    final ServiceConnection connection=new ServiceConnection(){
        public void onServiceConnected(ComponentName name,IBinder service){report("原生数据服务已连接");}
        public void onServiceDisconnected(ComponentName name){report("原生数据服务等待重连");}
        public void onBindingDied(ComponentName name){worker.post(()->{release();worker.postDelayed(refresh,5000);});}
        public void onNullBinding(ComponentName name){worker.post(()->{release();report("原生数据服务未提供连接");});}
    };
    static synchronized void attach(Context c){if(instance==null&&c!=null)instance=new HealthBackgroundHook(c);}
    HealthBackgroundHook(Context c){context=c;HandlerThread t=new HandlerThread("LS-health-background");t.start();worker=new Handler(t.getLooper());FeatureSettings.addSnapshotListener(c,()->worker.post(refresh));worker.postDelayed(tick,15000);}
    final Runnable refresh=()->{
        boolean desired=FeatureSettings.enabled(context,ConfigSchema.HEALTH_ENABLED)&&FeatureSettings.enabled(context,ConfigSchema.HEALTH_BACKGROUND);
        if(!desired){release();return;}if(bound)return;
        try{
            Context user=(Context)TargetReflection.call(context,"createContextAsUser",TargetReflection.call(UserHandle.class,"of",0),0);
            ApplicationInfo app=user.getPackageManager().getApplicationInfo("com.mi.health",0);
            if((app.flags&ApplicationInfo.FLAG_STOPPED)!=0){report("健康应用已被停止，打开一次后恢复后台计划");return;}
            Intent intent=new Intent().setComponent(new ComponentName("com.mi.health","com.xiaomi.fitness.device.manager.internal.DeviceManagerService"));
            // A waived-priority connection leaves the only health process cached
            // and eligible for Android's freezer. Keep it at background-service
            // importance so its real timetable can run without foreground UI.
            bound=user.bindService(intent,connection,Context.BIND_AUTO_CREATE|Context.BIND_NOT_FOREGROUND);
            if(bound)boundContext=user;
            if(!bound)report("后台服务未能启动，请在系统电池优化中允许小米运动健康自启动");
        }catch(Throwable e){report("后台接入失败："+e.getClass().getSimpleName());}
    };
    final Runnable tick=new Runnable(){public void run(){refresh.run();worker.postDelayed(this,60000);}};
    void release(){if(bound){try{boundContext.unbindService(connection);}catch(Throwable ignored){}bound=false;boundContext=null;}report("后台执行已关闭");}
    void report(String text){FeatureSettings.diagnostic(context,"ls_augment_health_background_runtime",text);}
}
