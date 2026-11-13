package ls.augment.com.hook;

import android.content.Context;
import android.provider.Settings;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.BypassChargingOptions;
import ls.augment.com.BypassSettingsLease;

/** Retain valid 91–100% values across the two OEM upgrade migrations and native UI. */
final class BypassNativeRangeHook {
    private static final ThreadLocal<Boolean> STARTING=new ThreadLocal<>();
    private static final Map<Object,Integer> MAXIMA=Collections.synchronizedMap(new WeakHashMap<>());
    private BypassNativeRangeHook(){}
    static boolean extended(int value){return value>90&&value<=BypassChargingOptions.MAX;}
    static void controller(AugmentModule module,Class<?> type,Field context)throws ReflectiveOperationException{
        Method migrate=HookCompatibility.inheritedMethod(type,void.class,false,new String[]{"updateThresholdForInit"});
        module.registerFeatureHook(module.prepareFeatureHook(migrate,"bypass.range.service",true).intercept(chain->{
            Context c=(Context)context.get(chain.getThisObject());
            int value=Settings.Global.getInt(c.getContentResolver(),BypassSettingsLease.THRESHOLD,80);
            // This migration only reduces values >90. It does not perform any
            // battery/temperature checks; those remain in the native controller.
            return extended(value)?null:chain.proceed();
        }));
    }
    static void power(AugmentModule module,ClassLoader loader){
        try{
            Class<?> app=Class.forName("com.zte.powersavemode.main.PowerSaveModeApp",false,loader);
            Method create=HookCompatibility.inheritedMethod(app,void.class,false,new String[]{"onCreate"});
            Class<?> utility=Class.forName("com.zte.powersavemode.common.utils.SwitchTools",false,loader);
            Method set=HookCompatibility.method(utility,void.class,true,new String[]{"setSeparationThreshold"},Context.class,int.class);
            module.registerFeatureHook(module.prepareFeatureHook(create,"bypass.range.power_start",false).intercept(chain->{
                Boolean previous=STARTING.get();STARTING.set(true);
                try{return chain.proceed();}finally{if(previous==null)STARTING.remove();else STARTING.set(previous);}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(set,"bypass.range.power_migration",true).intercept(chain->{
                Context c=(Context)chain.getArg(0);
                if(Boolean.TRUE.equals(STARTING.get())&&(Integer)chain.getArg(1)==90&&c!=null
                        &&extended(Settings.Global.getInt(c.getContentResolver(),BypassSettingsLease.THRESHOLD,80)))return null;
                return chain.proceed();
            }));
        }catch(ReflectiveOperationException|RuntimeException e){module.logFeatureInfo("BYPASS_POWER_MIGRATION_UNAVAILABLE "+e);}
        try{
            Class<?> preference=Class.forName("com.zte.powersavemode.common.ui.CustomSeekBarPreference",false,loader);
            Class<?> holder=Class.forName("androidx.preference.PreferenceViewHolder",false,loader);
            Method bind=HookCompatibility.inheritedMethod(preference,void.class,false,new String[]{"onBindViewHolder"},holder);
            Method key=HookCompatibility.inheritedMethod(preference,String.class,false,new String[]{"getKey"});
            Method context=HookCompatibility.inheritedMethod(preference,Context.class,false,new String[]{"getContext"});
            Field maximum=HookCompatibility.field(preference,int.class,false,"MAX");
            Field minimum=HookCompatibility.field(preference,int.class,false,"MIN");
            module.registerFeatureHook(module.prepareFeatureHook(bind,"bypass.range.native_slider",false).intercept(chain->{
                Object target=chain.getThisObject();
                if("separation_charge_seek_bar".equals(key.invoke(target))&&minimum.getInt(target)==BypassChargingOptions.MIN){
                    Context c=(Context)context.invoke(target);
                    int original=MAXIMA.computeIfAbsent(target,ignored->{try{return maximum.getInt(target);}catch(IllegalAccessException e){throw new IllegalStateException(e);}});
                    boolean extended=FeatureSettings.enabled(c,BypassChargingOptions.AUTO)
                            ||extended(Settings.Global.getInt(c.getContentResolver(),BypassSettingsLease.THRESHOLD,80));
                    // Both old and new native fragments use this same preference.
                    maximum.setInt(target,extended?BypassChargingOptions.MAX:original);
                }
                return chain.proceed();
            }));
        }catch(ReflectiveOperationException|RuntimeException e){module.logFeatureInfo("BYPASS_POWER_SLIDER_UNAVAILABLE "+e);}
    }
}
