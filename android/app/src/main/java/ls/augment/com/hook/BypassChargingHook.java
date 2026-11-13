package ls.augment.com.hook;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import ls.augment.com.BypassChargingOptions;
import ls.augment.com.BypassSettingsLease;

/** Owns only configuration and presentation. The OEM service retains battery/thermal/manual rules. */
final class BypassChargingHook {
    private static final String CONTROLLER="cn.zte.chargeseparation.ChargeSeparationController";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static NativeSettings state;
    private BypassChargingHook(){}
    static void install(AugmentModule module,ClassLoader loader,String pkg){
        if(!pkg.equals(BypassChargingOptions.SERVICE_PACKAGE)&&!pkg.equals("com.android.systemui")
                &&!pkg.equals("cn.nubia.gameassist")&&!pkg.equals("com.zte.powersavemode"))return;
        BypassPromptHook.install(module,pkg);
        if(pkg.equals("com.zte.powersavemode"))BypassNativeRangeHook.power(module,loader);
        if(pkg.equals("com.android.systemui"))installTile(module,loader);
        if(!pkg.equals(BypassChargingOptions.SERVICE_PACKAGE))return;
        BypassNotificationHook.install(module,loader);
        try{
            Class<?> type=Class.forName(CONTROLLER,false,loader);
            Field context=HookCompatibility.field(type,Context.class,false,"mContext");
            // Complete automatic-policy capability, not a model/version allowlist.
            for(String name:new String[]{"getChargeSeparationThreshold"})HookCompatibility.inheritedMethod(type,int.class,false,new String[]{name});
            for(String name:new String[]{"isAutoSwitchOn","isEnable","isSwitchOn"})HookCompatibility.inheritedMethod(type,boolean.class,false,new String[]{name});
            for(String name:new String[]{"updateThresholdStatus","updateAutoSwitchStatus","closeChargeSeparation"})HookCompatibility.inheritedMethod(type,void.class,false,new String[]{name});
            HookCompatibility.inheritedMethod(type,android.content.BroadcastReceiver.class,true,new String[]{"getBatteryReceiver"});
            HookCompatibility.field(type,boolean.class,false,"mPluggedIn");
            HookCompatibility.field(type,int.class,false,"mLevel");
            Method start=HookCompatibility.inheritedMethod(type,void.class,false,new String[]{"startChargeSeparation"});
            Method init=HookCompatibility.inheritedMethod(type,void.class,false,new String[]{"init"});
            Method show=HookCompatibility.inheritedMethod(type,void.class,false,new String[]{"showAlertDialog"});
            BypassNativeRangeHook.controller(module,type,context);
            module.registerFeatureHook(module.prepareFeatureHook(init,"bypass.native.init",false).intercept(chain->{
                Object result=chain.proceed();
                try{Context c=(Context)context.get(chain.getThisObject());MAIN.post(()->bind(c));}
                catch(Exception e){module.logFeatureError("BYPASS_BIND",e);}return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(show,"bypass.native.confirm",true).intercept(chain->{
                Context c=(Context)context.get(chain.getThisObject());
                if(!FeatureSettings.enabled(c,BypassChargingOptions.HIDE_PROMPTS))return chain.proceed();
                // startChargeSeparation itself checks plug state and the 20% floor.
                Method enabled=HookCompatibility.inheritedMethod(type,boolean.class,false,new String[]{"isEnable"});
                if(!Boolean.TRUE.equals(enabled.invoke(chain.getThisObject())))return chain.proceed();
                start.invoke(chain.getThisObject());
                FeatureSettings.diagnostic(c,"ls_augment_bypass_prompt_runtime","confirmation_skipped;native_start");return null;
            }));
            module.logFeatureInfo("BYPASS_NATIVE_READY controller="+type.getName()+";battery_policy=OEM;driver_write=none");
        }catch(ReflectiveOperationException|RuntimeException e){
            module.logFeatureInfo("BYPASS_NATIVE_UNAVAILABLE "+e);
            FeatureSettings.diagnostic(FeatureSettings.from(null),"ls_augment_bypass_capability","unavailable:"+e.getClass().getSimpleName()+":"+e.getMessage());
        }
    }
    private static void installTile(AugmentModule module,ClassLoader loader){
        try{
            Class<?> type=Class.forName("com.zte.qs.tiles.ChargeSeparationTile",false,loader);
            Method show=HookCompatibility.inheritedMethod(type,void.class,false,new String[]{"showAlertDialog"});
            Method start=HookCompatibility.inheritedMethod(type,void.class,false,new String[]{"startChargeSeparation"});
            Method charging=HookCompatibility.inheritedMethod(type,boolean.class,false,new String[]{"isCharging"});
            module.registerFeatureHook(module.prepareFeatureHook(show,"bypass.tile.confirm",true).intercept(chain->{
                Context c=FeatureSettings.from(chain.getThisObject());
                if(!FeatureSettings.enabled(c,BypassChargingOptions.HIDE_PROMPTS)
                        ||!Boolean.TRUE.equals(charging.invoke(chain.getThisObject())))return chain.proceed();
                start.invoke(chain.getThisObject());return null;
            }));
        }catch(ReflectiveOperationException|RuntimeException e){module.logFeatureInfo("BYPASS_TILE_UNAVAILABLE "+e);}
    }
    private static void bind(Context context){
        if(context==null)return;
        if(state==null)state=new NativeSettings(context.getApplicationContext());
        FeatureSettings.diagnostic(context,"ls_augment_bypass_capability","ready:native_auto_threshold;range=20..100;device_validation=pending");
        state.refresh();
    }
    private static final class NativeSettings implements BypassSettingsLease.Store {
        final Context context;final SharedPreferences backup;final Runnable listener=()->MAIN.post(this::refresh);
        final ContentObserver observer=new ContentObserver(MAIN){@Override public void onChange(boolean self){schedule();}};
        final Runnable pending=this::refresh;
        boolean refreshing;
        String signature="",report="";
        NativeSettings(Context c){
            context=c;backup=c.createDeviceProtectedStorageContext().getSharedPreferences("duo_bypass_native_backup",0);
            FeatureSettings.addSnapshotListener(c,listener);
            c.getContentResolver().registerContentObserver(Settings.Global.getUriFor(BypassSettingsLease.THRESHOLD),false,observer);
            c.getContentResolver().registerContentObserver(Settings.Global.getUriFor(BypassSettingsLease.AUTO),false,observer);
        }
        void schedule(){MAIN.removeCallbacks(pending);MAIN.post(pending);}
        void refresh(){
            if(refreshing)return;refreshing=true;
            try{
                // The bootstrap placeholder is not an explicit saved OFF value.
                // Never restore a durable lease before configuration is verified.
                if(!FeatureSettings.hasVerifiedSnapshot(context))return;
                boolean enabled=FeatureSettings.enabled(context,BypassChargingOptions.AUTO);
                int level=FeatureSettings.integer(context,BypassChargingOptions.LEVEL,BypassChargingOptions.DEFAULT,BypassChargingOptions.MIN,BypassChargingOptions.MAX);
                String next=enabled+"|"+level;
                // All surfaces read the same native settings. While enabled, Duo
                // owns these two parameters; closing the feature restores the lease.
                if(next.equals(signature)&&(!enabled||Integer.toString(level).equals(get(BypassSettingsLease.THRESHOLD))
                        &&"1".equals(get(BypassSettingsLease.AUTO))))return;
                String result=BypassSettingsLease.apply(this,enabled,level);
                if(!result.contains("failed"))signature=next;
                if(!result.equals(report)){report=result;FeatureSettings.diagnostic(context,"ls_augment_bypass_auto_runtime",result+";native_switch="+get("charge_separation_switch"));}
            }catch(RuntimeException e){FeatureSettings.diagnostic(context,"ls_augment_bypass_auto_runtime","error:"+e);}
            finally{refreshing=false;}
        }
        @Override public String get(String key){return Settings.Global.getString(context.getContentResolver(),key);}
        @Override public boolean put(String key,String value){return Settings.Global.putString(context.getContentResolver(),key,value);}
        @Override public String saved(String key){return backup.getString(key,null);}
        @Override public boolean save(String level,String auto,String desired,String owned){return backup.edit().putString("level",level).putString("auto",auto).putString("desired",desired).putString("owned",owned).commit();}
        @Override public boolean clear(){return backup.edit().clear().commit();}
    }
}
