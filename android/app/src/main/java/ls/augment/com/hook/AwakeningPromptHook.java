package ls.augment.com.hook;

import android.content.Context;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import ls.augment.com.GameOptions;

/** Suppress only the OEM high-gear informational message before it enters the toast queue. */
final class AwakeningPromptHook {
    private AwakeningPromptHook(){}
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> type=Class.forName("cn.zte.gamefloat.gamekeys.entity.PerformanceModeChangeToast",false,loader);
            Field context=HookCompatibility.field(type,Context.class,false,"mContext");
            HookCompatibility.field(type,java.util.Queue.class,false,"queue");
            HookCompatibility.inheritedMethod(type,void.class,false,new String[]{"showToast"});
            Method enqueue=HookCompatibility.inheritedMethod(type,void.class,false,new String[]{"setType"},String.class);
            module.registerFeatureHook(module.prepareFeatureHook(enqueue,"game.awakening.high_toast",true).intercept(chain->{
                Context c=(Context)context.get(chain.getThisObject());
                if(!"high".equals(chain.getArg(0))||c==null||!FeatureSettings.enabled(c,GameOptions.HIDE_AWAKENING_TIP))return chain.proceed();
                int resource=c.getResources().getIdentifier("performance_mode_high_toast","string",c.getPackageName());
                if(resource==0){
                    FeatureSettings.diagnostic(c,GameOptions.HIDE_AWAKENING_TIP+"_runtime","native_fallback:missing_high_toast_resource");
                    return chain.proceed();
                }
                FeatureSettings.diagnostic(c,GameOptions.HIDE_AWAKENING_TIP+"_runtime","high_toast_not_enqueued;mode_switch_unchanged");
                return null;
            }));
            module.logFeatureInfo("AWAKENING_PROMPT_READY high_toast_queue;device_validation=pending");return 1;
        }catch(ReflectiveOperationException|RuntimeException e){
            module.logFeatureInfo("AWAKENING_PROMPT_UNAVAILABLE "+e);return 0;
        }
    }
}
