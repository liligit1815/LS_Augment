package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.widget.Toast;
import java.lang.reflect.Method;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Observe the OEM user action, not page entry or a previously persisted ON value. */
final class NativeIslandSettingsHook {
    private static final String KEY="dynamic_island_switch_state";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final AtomicLong GENERATION=new AtomicLong();
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->{
        Thread thread=new Thread(r,"Duo-NativeIslandSelection");thread.setDaemon(true);return thread;
    });
    static int install(AugmentModule module,ClassLoader loader){
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
    private static void publish(Context context,Object page,boolean enabled,long generation){
        if(generation!=GENERATION.get())return;
        boolean ok=false;
        try{
            Bundle args=new Bundle();args.putBoolean("enabled",enabled);
            Bundle result=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),
                    "native_island_selection",null,args);
            ok=result!=null&&result.getBoolean("ok");
        }catch(RuntimeException error){FeatureSettings.diagnostic(context,"ls_augment_native_island_selection_error",error.getClass().getSimpleName());}
        if(ok){FeatureSettings.invalidateSnapshot();return;}
        MAIN.post(()->{
            if(generation!=GENERATION.get())return;
            // Do not leave an apparent successful ON action with Duo still enabled.
            if(enabled&&Settings.System.getInt(context.getContentResolver(),KEY,-1)==1){
                Settings.System.putInt(context.getContentResolver(),KEY,0);
                try{call(field(page,"mDynamicIslandSwitchPref"),"setChecked",false);}catch(Exception ignored){}
            }
            Toast.makeText(context,"星云岛联动未保存，请重试",Toast.LENGTH_LONG).show();
        });
    }
}
