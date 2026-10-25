package ls.augment.com.hook;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.*;
import java.util.concurrent.*;
import java.util.function.Consumer;

/** Host storage is migration-only. Normal reads/writes use the authenticated private provider. */
final class NativeIslandRecoveryClient {
    private static final String LEGACY="ls_augment_native_record_recovery";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ThreadPoolExecutor IO=new ThreadPoolExecutor(1,1,0,TimeUnit.SECONDS,new ArrayBlockingQueue<>(8),r->{Thread t=new Thread(r,"Duo-RecorderRecovery");t.setDaemon(true);return t;});
    static void request(Context context,String operation,Bundle data,Consumer<Bundle> callback){
        Context app=context.getApplicationContext();Bundle input=new Bundle(data);input.putString("op",operation);
        try{IO.execute(()->{
            Bundle result=null;
            try{
                result=call(app,input);
                if("get".equals(operation)&&result!=null&&result.getBoolean("ok")){
                    SharedPreferences legacy=app.getSharedPreferences(LEGACY,Context.MODE_PRIVATE);
                    if(!result.getBoolean("migrated")){
                        Bundle migration=new Bundle();migration.putString("op","import");migration.putString("epoch",result.getString("epoch"));
                        int boot=android.provider.Settings.Global.getInt(app.getContentResolver(),android.provider.Settings.Global.BOOT_COUNT,-1);
                        String key=legacy.getString("key",""),duration=legacy.getString("duration",""),raw=legacy.getString("rawCount",duration);
                        long posted=legacy.getLong("posted",0);
                        if(key.length()<=1024&&raw.length()<=128&&duration.length()<=128&&NativeIslandRecordingRecovery.matches(
                                legacy.getInt("status",-1),legacy.getInt("boot",-1),boot,key,key,posted,posted,duration,true)){
                            migration.putInt("status",2);migration.putInt("boot",boot);migration.putLong("posted",legacy.getLong("posted",0));
                            migration.putString("key",key);migration.putString("duration",duration);migration.putString("rawCount",raw);
                        }
                        result=call(app,migration);
                    }
                    // Never remove the only durable recovery copy before provider acknowledgement.
                    if(result!=null&&result.getBoolean("ok")&&result.getBoolean("migrated")){
                        if((!legacy.getAll().isEmpty()&&!legacy.edit().clear().commit())||!app.deleteSharedPreferences(LEGACY))
                            FeatureSettings.diagnostic(app,"ls_augment_native_record_recovery_cleanup","pending");
                    }
                }
            }catch(RuntimeException unavailable){result=null;}
            Bundle response=result;MAIN.post(()->callback.accept(response));
        });}catch(RejectedExecutionException busy){MAIN.post(()->callback.accept(null));}
    }
    private static Bundle call(Context context,Bundle input){return context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"native_island_record_recovery",null,input);}
}
