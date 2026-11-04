package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;
import ls.augment.com.NativeIslandMode;
import ls.augment.com.SystemUiOptions;

/** The OEM settings page and Duo edit the same switch; page entry never imports stale state. */
final class NativeIslandSettingsHook {
    private static String mode=NativeIslandMode.UNKNOWN;
    private static Context observed;
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final AtomicLong GENERATION=new AtomicLong();
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->{
        Thread t=new Thread(r,"Duo-IslandSettings");t.setDaemon(true);return t;
    });
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> app=Class.forName("com.zte.tools.AppTools",false,loader);
            Field flag;
            try{flag=app.getField("ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN");}
            catch(NoSuchFieldException missing){mode=NativeIslandMode.LEGACY;return 0;}
            if(flag.getType()!=boolean.class||!Modifier.isStatic(flag.getModifiers()))throw new NoSuchFieldException("fullscreen_flag_type");
            mode=flag.getBoolean(null)?NativeIslandMode.MODERN:NativeIslandMode.LEGACY;
        }catch(Throwable missing){mode=NativeIslandMode.UNKNOWN;module.logFeatureError("DUO_ISLAND_SETTINGS_CONTRACT",missing);}
        return 0;
    }
    static void attach(Context context){
        if(!NativeIslandMode.known(mode))return;
        FeatureSettings.diagnostic(context,NativeIslandMode.DIAGNOSTIC,NativeIslandMode.stamp(context,mode));
        if(observed!=null)return;
        observed=context;
        context.getContentResolver().registerContentObserver(Settings.System.getUriFor(NativeIslandMode.key(mode)),false,
                new android.database.ContentObserver(MAIN){
            @Override public void onChange(boolean selfChange){
                if(!FeatureSettings.hasVerifiedSnapshot(context))return;
                boolean enabled=NativeIslandMode.enabled(context,mode);
                if(enabled==FeatureSettings.enabled(context,SystemUiOptions.ISLAND))return;
                long generation=GENERATION.incrementAndGet();
                WORKER.execute(()->publish(context,enabled,generation));
            }
        });
    }
    static void synchronize(Context context,boolean enabled){
        if(!NativeIslandMode.known(mode)||!FeatureSettings.hasVerifiedSnapshot(context))return;
        GENERATION.incrementAndGet();
        if(NativeIslandMode.enabled(context,mode)==enabled)return;
        try{
            if(!Settings.System.putInt(context.getContentResolver(),NativeIslandMode.key(mode),enabled?1:0))
                FeatureSettings.diagnostic(context,"ls_augment_native_island_selection_error","system_switch_write_failed");
        }catch(RuntimeException failure){FeatureSettings.diagnostic(context,"ls_augment_native_island_selection_error",failure.getClass().getSimpleName());}
    }
    private static void publish(Context context,boolean enabled,long generation){
        publish(context,enabled,generation,0);
    }
    private static void publish(Context context,boolean enabled,long generation,int attempt){
        if(generation!=GENERATION.get()||NativeIslandMode.enabled(context,mode)!=enabled)return;
        boolean saved=false;
        try{
            Bundle args=new Bundle();args.putBoolean("enabled",enabled);args.putString("mode",mode);
            Bundle result=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"native_island_selection",null,args);
            if(result!=null&&result.getBoolean("ok")){saved=true;FeatureSettings.invalidateSnapshot();}
            else FeatureSettings.diagnostic(context,"ls_augment_native_island_selection_error","switch_publish_failed");
        }catch(RuntimeException failure){FeatureSettings.diagnostic(context,"ls_augment_native_island_selection_error",failure.getClass().getSimpleName());}
        if(!saved&&attempt<2)MAIN.postDelayed(()->{
            if(generation==GENERATION.get()&&NativeIslandMode.enabled(context,mode)==enabled)
                WORKER.execute(()->publish(context,enabled,generation,attempt+1));
        },500L*(attempt+1));
    }
    private NativeIslandSettingsHook(){}
}
