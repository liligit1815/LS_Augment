package ls.augment.com.hook;

import android.content.Context;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.BypassChargingOptions;

/** Match only named OEM informational strings; never silence errors or unrelated toasts. */
final class BypassPromptHook {
    private static final String[] NAMES={"ic_qs_charge_separation_open_warning_text","ic_qs_charge_separation_close_warning_text",
        "ic_qs_charge_separation_open_warning_text_bypass","ic_qs_charge_separation_close_warning_text_bypass",
        "separation_charge_on_msg","separation_charge_on_msg_2","separation_charge_off_msg","separation_charge_off_msg_2",
        "main_screen_charge_separation_open_warning_text","main_screen_charge_separation_close_warning_text"};
    private static final Map<Toast,State> STATES=Collections.synchronizedMap(new WeakHashMap<>());
    private BypassPromptHook(){}
    static void install(AugmentModule module,String pkg){
        try{
            for(Class<?> value:new Class<?>[]{int.class,CharSequence.class}){
                Method make=Toast.class.getDeclaredMethod("makeText",Context.class,value,int.class);
                module.registerFeatureHook(module.prepareFeatureHook(make,"bypass.toast.make."+value.getSimpleName(),false).intercept(chain->{
                    Object result=chain.proceed();
                    if(result instanceof Toast)try{
                        Context context=(Context)chain.getArg(0);
                        if(pkg.equals(context.getPackageName()))STATES.put((Toast)result,new State(context,matches(context,chain.getArg(1))));
                    }catch(RuntimeException ignored){}return result;
                }));
                Method set=Toast.class.getDeclaredMethod("setText",value);
                module.registerFeatureHook(module.prepareFeatureHook(set,"bypass.toast.text."+value.getSimpleName(),false).intercept(chain->{
                    Object result=chain.proceed();State state=STATES.get(chain.getThisObject());
                    if(state!=null)try{state.matched=matches(state.context.get(),chain.getArg(0));}catch(RuntimeException ignored){state.matched=false;}
                    return result;
                }));
            }
            Method show=Toast.class.getDeclaredMethod("show");
            module.registerFeatureHook(module.prepareFeatureHook(show,"bypass.toast.show",true).intercept(chain->{
                State state=STATES.get(chain.getThisObject());Context context=state==null?null:state.context.get();
                if(state!=null&&state.matched&&context!=null&&FeatureSettings.enabled(context,BypassChargingOptions.HIDE_PROMPTS)){
                    FeatureSettings.diagnostic(context,"ls_augment_bypass_prompt_runtime","informational_toast_hidden;package="+pkg);return null;
                }
                return chain.proceed();
            }));
        }catch(ReflectiveOperationException|RuntimeException e){module.logFeatureInfo("BYPASS_TOAST_UNAVAILABLE package="+pkg+";"+e);}
    }
    static boolean matches(Context context,Object value){
        if(context==null||value==null)return false;
        for(String name:NAMES){
            int id=context.getResources().getIdentifier(name,"string",context.getPackageName());
            if(id==0)continue;
            if(value instanceof Integer){if((Integer)value==id)return true;}
            else if(value instanceof CharSequence&&android.text.TextUtils.equals(context.getText(id),(CharSequence)value))return true;
        }
        return false;
    }
    private static final class State {
        final WeakReference<Context> context;boolean matched;
        State(Context c,boolean m){context=new WeakReference<>(c);matched=m;}
    }
}
