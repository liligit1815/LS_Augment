package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.widget.Toast;
import java.lang.reflect.Method;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import ls.augment.com.NativeIslandMode;
import ls.augment.com.ConfigSchema;
import ls.augment.com.SystemUiOptions;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Observe the OEM user action, not page entry or a previously persisted ON value. */
final class NativeIslandSettingsHook {
    private static final String KEY="dynamic_island_switch_state";
    private static String mode=NativeIslandMode.UNKNOWN;
    private static Context observed;
    private static boolean imported;
    private static android.database.ContentObserver observer;
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final AtomicLong GENERATION=new AtomicLong();
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->{
        Thread thread=new Thread(r,"Duo-NativeIslandSelection");thread.setDaemon(true);return thread;
    });
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> app=Class.forName("com.zte.tools.AppTools",false,loader);
            try{
                Field flag=app.getField("ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN");
                if(flag.getType()!=boolean.class||!Modifier.isStatic(flag.getModifiers()))return 0;
                mode=flag.getBoolean(null)?NativeIslandMode.MODERN:NativeIslandMode.LEGACY;
            }catch(NoSuchFieldException old){mode=NativeIslandMode.LEGACY;}
            if(NativeIslandMode.MODERN.equals(mode)){
                Class<?> type=Class.forName("com.zte.feature.dynamicisland.settings.DynamicIslandSwitchFullScreenSettingsFragment",false,loader);
                Method update=type.getDeclaredMethod("handleSubSwitchPreference",String.class,Class.forName("androidx.preference.SwitchPreference",false,loader));
                if(update.getReturnType()!=void.class||Modifier.isStatic(update.getModifiers()))throw new NoSuchMethodException("modern_sub_switch");
                module.registerFeatureHook(module.prepareFeatureHook(update,"native_island.modern_selection",false).intercept(chain->{
                    Object result=chain.proceed();Object raw=call(chain.getThisObject(),"getContext");
                    // Only an explicit ON action changes ownership. Opening settings never does.
                    if(raw instanceof Context&&Boolean.TRUE.equals(call(chain.getThisObject(),"isSubSwitchOn",chain.getArg(0)))){
                        Context context=(Context)raw;
                        if(NativeIslandMode.enabled(context,mode))queue(context,true);
                    }
                    return result;
                }));
                return 1;
            }
        }catch(Throwable unavailable){mode=NativeIslandMode.UNKNOWN;module.logFeatureError("NATIVE_ISLAND_MODE_UNAVAILABLE",unavailable);return 0;}
        try{
            Class<?> type=Class.forName("com.zte.feature.dynamicisland.settings.DynamicIslandSwitchSettingsFragment",false,loader);
            Method update=type.getDeclaredMethod("updateDynamicIslandSwitchState",int.class);
            if(update.getReturnType()!=void.class)return 0;
            module.registerFeatureHook(module.prepareFeatureHook(update,"native_island.settings_selection",false).intercept(chain->{
                Object result=chain.proceed();
                int value=(Integer)chain.getArg(0);
                Object page=chain.getThisObject();
                Object raw=call(page,"getContext");
                if((value==0||value==1)&&raw instanceof Context){
                    Context context=(Context)raw;
                    if(Settings.System.getInt(context.getContentResolver(),KEY,-1)==value){
                        long generation=GENERATION.incrementAndGet();
                        WORKER.execute(()->publish(context,page,value==1,generation));
                    }
                }
                return result;
            }));
            return 1;
        }catch(Throwable unavailable){module.logFeatureError("NATIVE_ISLAND_SETTINGS_UNAVAILABLE",unavailable);return 0;}
    }
    static void attach(Context context){
        if(!NativeIslandMode.known(mode))return;
        FeatureSettings.diagnostic(context,NativeIslandMode.DIAGNOSTIC,NativeIslandMode.stamp(context,mode));
        if(!NativeIslandMode.MODERN.equals(mode))return;
        if(observed==null){
            observed=context;observer=new android.database.ContentObserver(MAIN){
                @Override public void onChange(boolean selfChange){queue(observed,NativeIslandMode.enabled(observed,mode));}
            };
            context.getContentResolver().registerContentObserver(Settings.System.getUriFor(NativeIslandMode.key(mode)),false,observer);
            FeatureSettings.addSnapshotListener(context,()->MAIN.post(()->reconcile(context)));
        }
        reconcile(context);
    }
    private static void reconcile(Context context){
        if(imported||!FeatureSettings.hasVerifiedSnapshot(context))return;
        imported=true;
        // DuoIslandCompatibility rejects this native fullscreen host. Retire a stale unsupported
        // Duo selection instead of disabling a working OEM island after an upgrade/restart.
        queue(context,NativeIslandMode.enabled(context,mode));
    }
    private static void queue(Context context,boolean enabled){
        long generation=GENERATION.incrementAndGet();WORKER.execute(()->publish(context,null,enabled,generation));
    }
    private static void publish(Context context,Object page,boolean enabled,long generation){
        publish(context,page,enabled,generation,0);
    }
    private static void publish(Context context,Object page,boolean enabled,long generation,int attempt){
        if(generation!=GENERATION.get())return;
        boolean ok=false;
        try{
            Bundle args=new Bundle();args.putBoolean("enabled",enabled);
            if(NativeIslandMode.MODERN.equals(mode))args.putString("mode",mode);
            Bundle result=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),
                    "native_island_selection",null,args);
            ok=result!=null&&result.getBoolean("ok");
        }catch(RuntimeException error){FeatureSettings.diagnostic(context,"ls_augment_native_island_selection_error",error.getClass().getSimpleName());}
        if(ok){FeatureSettings.invalidateSnapshot();return;}
        if(NativeIslandMode.MODERN.equals(mode)&&attempt<2){
            MAIN.postDelayed(()->{
                if(generation==GENERATION.get()&&enabled==NativeIslandMode.enabled(context,mode))
                    WORKER.execute(()->publish(context,page,enabled,generation,attempt+1));
            },500L*(attempt+1));
            return;
        }
        MAIN.post(()->{
            if(generation!=GENERATION.get())return;
            // Do not leave an apparent successful ON action with Duo still enabled.
            if(page!=null&&enabled&&Settings.System.getInt(context.getContentResolver(),KEY,-1)==1){
                Settings.System.putInt(context.getContentResolver(),KEY,0);
                try{call(field(page,"mDynamicIslandSwitchPref"),"setChecked",false);}catch(Exception ignored){}
            }
            FeatureSettings.diagnostic(context,"ls_augment_native_island_selection_error","selection_publish_failed:"+mode);
            if(page!=null)Toast.makeText(context,"原厂岛联动未保存，请重试",Toast.LENGTH_LONG).show();
        });
    }
}
