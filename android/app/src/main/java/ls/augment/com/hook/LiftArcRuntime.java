package ls.augment.com.hook;

import android.content.Context;
import org.json.JSONObject;

/** Runtime witnesses are separate from the 39 portable settings. */
final class LiftArcRuntime {
    private static LiftArcConfig config;
    private static Context context;
    private static boolean installed, views, unlock, wallpaper, shader, attemptedWallpaper;
    private static boolean paused, conflict;
    private static int errors;
    private static final long PROCESS_STARTED_AT = android.os.SystemClock.elapsedRealtime();
    private static String lastStatus="";
    private static boolean heartbeatStarted;
    private static volatile int bootCount=-1;
    private static final Runnable HEARTBEAT = new Runnable() {
        @Override public void run() {
            publish(true);
            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(this,30_000);
        }
    };
    private static String reason="等待系统界面建立锁屏适配";
    static void bind(LiftArcConfig value,Context ctx) {
        config=value; context=ctx;
        if(!heartbeatStarted) {
            heartbeatStarted=true;
            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(HEARTBEAT,30_000);
            new Thread(() -> {
                try { bootCount=android.provider.Settings.Global.getInt(ctx.getContentResolver(),android.provider.Settings.Global.BOOT_COUNT,-1); }
                catch(RuntimeException unavailable) { }
                new android.os.Handler(android.os.Looper.getMainLooper()).post(LiftArcRuntime::publish);
            },"Duo-LiftArc-boot-witness").start();
        }
        publish();
    }
    static void installed(boolean value) { installed=value; publish(); }
    static boolean paused() { return paused; }
    static boolean conflicted() { return conflict; }
    static void unlockReady(boolean value) { unlock=value; publish(); }
    static void views(boolean value) { views=value; publish(); }
    static void wallpaperPending() { wallpaper=false;attemptedWallpaper=false;publish(); }
    static void wallpaper(boolean value,boolean shaderReady) {
        attemptedWallpaper=true; wallpaper=value; shader=shaderReady; publish();
    }
    static void conflict(boolean value) {
        if(conflict==value)return; conflict=value;
        if(value&&config!=null)config.pause();
        else if(config!=null)config.refreshEffective();
        publish();
    }
    /** Protective exceptions disable only this phase; other Duo hooks keep running. */
    static void effectError(String source,Throwable error) {
        boolean recorded=LiftArcLog.e(source,error);
        if(recorded&&context!=null)FeatureSettings.diagnosticError(context,LiftArcConfig.PREFIX+"error",source,error);
    }
    static void error(String source,Throwable error) {
        boolean recorded=LiftArcLog.e(source,error);
        if(recorded&&context!=null)FeatureSettings.diagnosticError(context,LiftArcConfig.PREFIX+"error",source,error);
        if(config!=null&&config.requested&&++errors>=3) {
            paused=true; reason="锁屏上滑效果在本进程多次异常，已暂停新增效果";
            config.pause(); publish();
        }
    }
    static void publish() { publish(false); }
    private static void publish(boolean heartbeat) {
        if(context==null||config==null)return;
        boolean gesture=installed&&views&&unlock;
        String state=paused?"paused":conflict?"conflict":!installed?"unsupported":config.enabled&&gesture?"ready":"disabled";
        String why=paused?reason:conflict?"检测到另一个已接管锁屏的LiftArc叠加层":!installed?"当前系统缺少锁屏窗口或原厂解锁入口":!views?"等待原厂锁屏内容建立":!unlock?"等待原厂解锁管理器建立":"";
        try {
            JSONObject value=new JSONObject(); value.put("state",state); value.put("reason",why);
            value.put("installed",installed); value.put("gesture",gesture); value.put("arc",installed&&views);
            value.put("blur",installed&&views&&wallpaper); value.put("glass",installed&&views&&wallpaper&&shader);
            value.put("wallpaper",wallpaper?"ready":attemptedWallpaper?"unsupported":"pending");
            value.put("build",ls.augment.com.BuildConfig.VERSION_CODE);
            value.put("moduleVersion",ls.augment.com.BuildConfig.VERSION_NAME);
            value.put("pid",android.os.Process.myPid());value.put("processStartedAt",PROCESS_STARTED_AT);
            value.put("bootCount",bootCount);
            ls.augment.com.ConfigSnapshot snapshot=FeatureSettings.snapshot(context);
            value.put("configRevision",snapshot.revision);value.put("configChecksum",snapshot.checksum);
            String signature=value.toString();if(!heartbeat&&signature.equals(lastStatus))return;lastStatus=signature;
            value.put("observedAt",System.currentTimeMillis());
            value.put("observedElapsed",android.os.SystemClock.elapsedRealtime());
            FeatureSettings.diagnostic(context,LiftArcConfig.PREFIX+"status",value.toString());
            FeatureSettings.diagnostic(context,LiftArcConfig.PREFIX+"installed",installed?"1":"0");
            FeatureSettings.diagnostic(context,LiftArcConfig.PREFIX+"safety",paused?"paused":"normal");
        } catch(org.json.JSONException ignored) { }
    }
    private LiftArcRuntime() { }
}
