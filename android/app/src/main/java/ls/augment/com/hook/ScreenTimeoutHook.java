package ls.augment.com.hook;

import android.content.Context;
import android.provider.Settings;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import ls.augment.com.SystemOptions;

/** Keep the OEM extended choices and the parent page's validation in agreement. */
final class ScreenTimeoutHook {
    private static final String CONTROLLER="com.android.settings.display.ScreenTimeoutPreferenceController";
    private static final String ADAPTER="com.zte.adapt.display.ScreenTimeoutSettingsAdapt";
    private static final String PICKER="com.android.settings.display.ScreenTimeoutSettings";
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
        int choices=OemHooks.methods(module,loader,ADAPTER,"getInitialValuesLength",int.class,2,KEY,chain->{
            Object values=chain.getArg(1);
            return values instanceof CharSequence[]?((CharSequence[])values).length:chain.proceed();
        },new Class<?>[]{int.class,CharSequence[].class});
        // Some Settings builds inline/remove the optional ZTE adaptor. The
        // picker still owns the localized arrays, policy limit and native rows.
        if(choices==0)choices=installCandidates(module,loader);
        return guard+choices;
    }

    // Resolve the actual row type from the OEM result: its nested class may be
    // renamed. Never construct our own preferences or invent timeout values.
    private static int installCandidates(AugmentModule module,ClassLoader loader) {
        try {
            Class<?> picker=Class.forName(PICKER,false,loader);
            Class<?> candidate=Class.forName("com.android.settingslib.widget.CandidateInfo",false,loader);
            Field entries=memberField(picker,"mInitialEntries"),values=memberField(picker,"mInitialValues");
            if(entries.getType()!=CharSequence[].class||values.getType()!=CharSequence[].class)
                throw new NoSuchFieldException("timeout arrays must be CharSequence[]");
            Method maximum=memberMethod(picker,"getMaxScreenTimeout",Context.class);
            if(maximum.getReturnType()!=Long.class&&maximum.getReturnType()!=long.class)
                throw new NoSuchMethodException("timeout maximum must be long");
            Method key=memberMethod(candidate,"getKey"),enabled=memberMethod(candidate,"isEnabled");
            if(key.getReturnType()!=String.class||enabled.getReturnType()!=boolean.class)
                throw new NoSuchMethodException("timeout candidate identity");
            return OemHooks.methods(module,loader,PICKER,"getCandidates",List.class,0,KEY,chain->{
                Object original=chain.proceed(),owner=chain.getThisObject();
                Context context=FeatureSettings.from(owner);
                try {
                    if(context==null||!(original instanceof List<?>))return original;
                    CharSequence[] labels=(CharSequence[])entries.get(owner),choices=(CharSequence[])values.get(owner);
                    if(!resourceChoices(context,labels,choices)) {
                        record(context,"picker_unavailable;reason=native_arrays");return original;
                    }
                    long limit=(Long)maximum.invoke(owner,context);
                    List<?> rows=(List<?>)original;
                    if(rows.isEmpty()||limit<=600_000L)return original;
                    Set<String> present=new HashSet<>();
                    Class<?> rowType=null;
                    for(Object row:rows) {
                        if(!candidate.isInstance(row)) {
                            record(context,"picker_unavailable;reason=candidate_type");return original;
                        }
                        if(!Boolean.TRUE.equals(enabled.invoke(row)))return original;
                        if(rowType==null)rowType=row.getClass();
                        if(rowType!=row.getClass()) {
                            record(context,"picker_unavailable;reason=mixed_candidate_types");return original;
                        }
                        String value=(String)key.invoke(row);
                        if(!present.add(value)||indexOf(choices,value)<0) {
                            record(context,"picker_unavailable;reason=candidate_keys");return original;
                        }
                    }
                    // Only extend a complete native prefix. Unknown filtering
                    // (including disabled rows) must keep its original policy.
                    for(CharSequence value:choices) {
                        long millis=Long.parseLong(value.toString());
                        if(millis<=600_000L&&millis<=limit&&!present.contains(value.toString()))return original;
                    }
                    Constructor<?> constructor=rowType.getDeclaredConstructor(CharSequence.class,String.class,boolean.class);
                    constructor.setAccessible(true);
                    List<Object> result=new ArrayList<>(rows);
                    for(int i=0;i<choices.length;i++) {
                        String value=choices[i].toString();long millis=Long.parseLong(value);
                        if(millis>600_000L&&millis<=limit&&!present.contains(value))
                            result.add(constructor.newInstance(labels[i],value,true));
                    }
                    record(context,"picker_native;choices="+result.size()+";added="+(result.size()-rows.size())+";maximum_ms="+limit);
                    return result.size()==rows.size()?original:result;
                } catch(ReflectiveOperationException|RuntimeException|LinkageError error) {
                    record(context,"picker_unavailable;exception="+error.getClass().getSimpleName());
                    return original;
                }
            },new Class<?>[0]);
        } catch(ReflectiveOperationException|RuntimeException|LinkageError error) {
            module.logFeatureError("SCREEN_TIMEOUT picker_capability",error);return 0;
        }
    }

    private static Field memberField(Class<?> type,String name)throws NoSuchFieldException {
        for(Class<?> owner=type;owner!=null;owner=owner.getSuperclass())try {
            Field field=owner.getDeclaredField(name);field.setAccessible(true);return field;
        }catch(NoSuchFieldException missing){ }
        throw new NoSuchFieldException(type.getName()+"."+name);
    }
    private static Method memberMethod(Class<?> type,String name,Class<?>... parameters)throws NoSuchMethodException {
        for(Class<?> owner=type;owner!=null;owner=owner.getSuperclass())try {
            Method method=owner.getDeclaredMethod(name,parameters);method.setAccessible(true);return method;
        }catch(NoSuchMethodException missing){ }
        throw new NoSuchMethodException(type.getName()+"."+name);
    }
    private static int indexOf(CharSequence[] values,String value) {
        for(int i=0;i<values.length;i++)if(values[i].toString().equals(value))return i;
        return -1;
    }
    // The same named resources back the parent summary guard. Keep both pages
    // on one value set; missing/changed resources leave native rows untouched.
    //noinspection DiscouragedApi
    private static boolean resourceChoices(Context context,CharSequence[] labels,CharSequence[] values) {
        if(labels==null||values==null||labels.length!=values.length||values.length==0)return false;
        android.content.res.Resources resources=context.getResources();
        int entries=resources.getIdentifier("zte_screen_timeout_entries","array","com.android.settings");
        int choices=resources.getIdentifier("zte_screen_timeout_values","array","com.android.settings");
        if(entries==0||choices==0)return false;
        CharSequence[] nativeLabels=resources.getTextArray(entries),nativeValues=resources.getTextArray(choices);
        if(nativeLabels.length!=labels.length||nativeValues.length!=values.length)return false;
        long previous=0;
        for(int i=0;i<values.length;i++) {
            if(labels[i]==null||labels[i].length()==0||values[i]==null
                    ||!labels[i].toString().contentEquals(nativeLabels[i])||!values[i].toString().contentEquals(nativeValues[i]))return false;
            long value=Long.parseLong(values[i].toString());
            if(value<=previous||value>Integer.MAX_VALUE)return false;
            previous=value;
        }
        return true;
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
