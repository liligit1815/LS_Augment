package ls.augment.com.hook;

import android.content.Context;
import android.provider.Settings;
import java.lang.reflect.Method;
import ls.augment.com.SystemOptions;

/** Keep the OEM extended choices and the parent page's validation in agreement. */
final class ScreenTimeoutHook {
    private static final String CONTROLLER="com.android.settings.display.ScreenTimeoutPreferenceController";
    private static final String ADAPTER="com.zte.adapt.display.ScreenTimeoutSettingsAdapt";
    private static final String KEY=SystemOptions.key("settings_long_timeout");
    private static String lastObservation="";

    private ScreenTimeoutHook() { }


    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    static int install(AugmentModule module,ClassLoader loader) {
        // The OEM summary calls this writer for values above ten minutes, even
        // when they are present in its own full values/entries arrays. Merely
        // un-hiding those choices leaves a write of 60,000ms on page return.
        int guard=OemHooks.methods(module,loader,CONTROLLER,"setDefaultTimeValue",String.class,1,KEY,chain->{
            Object owner=chain.getThisObject();
            Context context=FeatureSettings.from(owner);
            String preserved=null;
            try {
                if(context!=null) {
                    long current=Settings.System.getLong(context.getContentResolver(),"screen_off_timeout",-1L);
                    long maximum=(Long)chain.getArg(0);
                    Object entries=OemHooks.field(owner,"mTimeoutEntries"),values=OemHooks.field(owner,"mTimeoutValues");
                    int index=extendedIndex(current,maximum,entries,values);
                    if(index>=0) {
                        CharSequence label=((CharSequence[])entries)[index];
                        // This private method's result is ignored by the known
                        // caller. Still return a valid, localized OEM summary.
                        int format=context.getResources().getIdentifier("screen_timeout_summary","string","com.android.settings");
                        preserved=current==Integer.MAX_VALUE||format==0?label.toString():context.getString(format,label);
                        record(context,"preserved;value_ms="+current+";maximum_ms="+maximum);
                    }
                }
            } catch(RuntimeException error) {
                record(context,"guard_unavailable;exception="+error.getClass().getSimpleName());
            }
            // No global Settings write interception: invalid/unknown choices,
            // disabled mode and device policy limits retain OEM behavior.
            return preserved!=null?preserved:chain.proceed();
        },new Class<?>[]{long.class});
        if(guard==0)return 0; // Do not expose choices that cannot be retained.
        if(!deoptimizeCallers(module,loader))return guard;
        return guard+OemHooks.methods(module,loader,ADAPTER,"getInitialValuesLength",int.class,2,KEY,chain->{
            Object values=chain.getArg(1);
            return values instanceof CharSequence[]?((CharSequence[])values).length:chain.proceed();
        },new Class<?>[]{int.class,CharSequence[].class});
    }

    static int extendedIndex(long current,long maximum,Object entries,Object values) {
        if(current<=600_000L||current>maximum||!(entries instanceof CharSequence[])||!(values instanceof CharSequence[]))return -1;
        CharSequence[] labels=(CharSequence[])entries,choices=(CharSequence[])values;
        if(labels.length!=choices.length)return -1;
        for(int i=0;i<choices.length;i++) {
            if(choices[i]==null||labels[i]==null||labels[i].length()==0)continue;
            try {if(Long.parseLong(choices[i].toString())==current)return i;}
            catch(NumberFormatException ignored) { }
        }
        return -1;
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static boolean deoptimizeCallers(AugmentModule module,ClassLoader loader) {
        try {
            Class<?> type=Class.forName(CONTROLLER,false,loader);
            boolean summary=false,update=false,protectedCallers=true;
            // setDefaultTimeValue may have been inlined into the summary, and
            // that summary is called twice by updateState on this OEM build.
            for(Method method:type.getDeclaredMethods()) {
                if((method.getName().equals("getTimeoutSummary")&&method.getReturnType()==CharSequence.class
                        &&java.util.Arrays.equals(method.getParameterTypes(),new Class<?>[]{long.class}))
                        ||(method.getName().equals("updateState")&&method.getReturnType()==void.class&&method.getParameterCount()==1)) {
                    method.setAccessible(true);
                    if(method.getName().equals("getTimeoutSummary"))summary=true;else update=true;
                    if(!module.deoptimize(method)){
                        protectedCallers=false;
                        module.logFeatureInfo("SCREEN_TIMEOUT deopt_unavailable;method="+method.getName());
                    }
                }
            }
            if(!summary||!update)module.logFeatureInfo("SCREEN_TIMEOUT caller_contract_incomplete");
            return summary&&update&&protectedCallers;
        } catch(ReflectiveOperationException|RuntimeException error) {
            module.logFeatureError("SCREEN_TIMEOUT caller_lookup",error);
            return false;
        }
    }

    private static synchronized void record(Context context,String value) {
        if(context==null||value.equals(lastObservation))return;
        lastObservation=value;
        FeatureSettings.diagnostic(context,KEY+"_runtime",value);
    }
}
