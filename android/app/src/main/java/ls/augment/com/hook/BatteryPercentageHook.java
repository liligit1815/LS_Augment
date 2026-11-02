package ls.augment.com.hook;

import android.content.*;
import android.os.*;
import android.view.View;
import android.widget.TextView;
import java.lang.reflect.*;
import java.util.*;
import ls.augment.com.BatteryPercentagePolicy;
import static ls.augment.com.hook.SystemUiAdapter.field;

/** Shared SystemUI reading and formatting, without changing native battery state. */
final class BatteryPercentageHook {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<View,Method> METERS=new WeakHashMap<>();
    private static final Map<Object,Method> INDICATIONS=new WeakHashMap<>();
    private static final Map<ConnectivityIconSource,Boolean> SOURCES=new WeakHashMap<>();
    private static final Map<View,Width> WIDTHS=new WeakHashMap<>();
    private static Context context;
    private static final class Reading{
        final int level,status,raw;final long rawAt;
        Reading(int level,int status,int raw,long at){this.level=level;this.status=status;this.raw=raw;rawAt=at;}
    }
    private static volatile Reading reading=new Reading(-1,-1,0,0);
    private static boolean queued,refreshing;
    private static final Runnable REFRESH=BatteryPercentageHook::refresh;

    static void install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> type=Class.forName("com.zte.mifavor.views.MFVBatteryViewLayout",false,loader);
            if(!View.class.isAssignableFrom(type))throw new NoSuchMethodException("battery layout is not View");
            Method update=method(type,"updateBatteryLevelText",void.class);
            typedField(type,"mBateryLevel",int.class);
            Field text=typedField(type,"mCurrentUsedBatteryLevelView",TextView.class);
            module.registerFeatureHook(module.prepareFeatureHook(update,"battery.percentage.meter",false).intercept(chain->{
                Object result=chain.proceed();View view=(View)chain.getThisObject();start(view.getContext());METERS.put(view,update);
                Object value=text.get(view);
                if(value!=field(view,"mBatteryLevelInsideView"))restoreWidths(view);
                if(value instanceof TextView){TextView label=(TextView)value;
                    int nativeLevel=(Integer)field(view,"mBateryLevel");String formatted=text(nativeLevel);
                    String old=label.getText().toString();
                    if(!formatted.isEmpty()&&old.matches("[0-9]+(?:[.,][0-9]+)?[%％]?")){
                        String next=formatted+(old.endsWith("%")?"%":old.endsWith("％")?"％":"");
                        if(!old.equals(next))label.setText(next);
                        if(label==field(view,"mBatteryLevelInsideView")){
                            int wanted=next.contains(".")?(int)Math.ceil(label.getPaint().measureText(next))+label.getPaddingLeft()+label.getPaddingRight()+Math.round(6*view.getResources().getDisplayMetrics().density):0;
                            width(label,wanted);Object icon=field(view,"mBatteryIconView");if(icon instanceof View)width((View)icon,wanted);
                        }
                    }
                }
                return result;
            }));
            module.deoptimize(update);
        }catch(ReflectiveOperationException|LinkageError missing){module.logFeatureError("BATTERY_PERCENTAGE_METER_UNAVAILABLE",missing);}
        try{
            Class<?> type=Class.forName("com.android.systemui.statusbar.KeyguardIndicationController",false,loader);
            Method compute=method(type,"computePowerIndication",String.class);
            Method update;
            try{update=method(type,"updateIndicationPublic",void.class,boolean.class);}
            catch(NoSuchMethodException older){update=method(type,"updateIndication",void.class,boolean.class);}
            final Method refreshIndication=update;
            typedField(type,"mContext",Context.class);
            module.registerFeatureHook(module.prepareFeatureHook(compute,"battery.percentage.indication",false).intercept(chain->{
                String result=(String)chain.proceed();Object owner=chain.getThisObject();Object ctx=field(owner,"mContext");
                if(ctx instanceof Context){start((Context)ctx);INDICATIONS.put(owner,refreshIndication);}
                String formatted=text(reading.level);
                return result==null||formatted.isEmpty()?result:result.replaceAll("(?<![0-9.,])[0-9]+(?:[.,][0-9]+)?\\s*[%％]",java.util.regex.Matcher.quoteReplacement(formatted+"%"));
            }));module.deoptimize(compute);
        }catch(ReflectiveOperationException|LinkageError missing){module.logFeatureError("BATTERY_PERCENTAGE_INDICATION_UNAVAILABLE",missing);}
        try{
            Class<?> type=Class.forName("com.zte.utils.SystemuiUtils",false,loader);
            Method getter=type.getDeclaredMethod("getRawBatteryLevel"),setter=type.getDeclaredMethod("setBatteryLevel",int.class);
            if(getter.getReturnType()!=int.class||setter.getReturnType()!=void.class||!Modifier.isStatic(getter.getModifiers())||!Modifier.isStatic(setter.getModifiers()))throw new NoSuchMethodException("raw battery contract");
            module.registerFeatureHook(module.prepareFeatureHook(setter,"battery.percentage.raw",false).intercept(chain->{
                Object result=chain.proceed();int value=(Integer)chain.getArg(0);
                MAIN.post(()->{Reading old=reading;reading=new Reading(old.level,old.status,BatteryPercentagePolicy.validRaw(value,old.level)?value:0,SystemClock.elapsedRealtime());schedule();MAIN.removeCallbacks(EXPIRE);MAIN.postDelayed(EXPIRE,30001);});return result;
            }));module.deoptimize(setter);
        }catch(ReflectiveOperationException|LinkageError missing){module.logFeatureError("BATTERY_PERCENTAGE_PRECISE_SOURCE_UNAVAILABLE",missing);}
    }
    private static final Runnable EXPIRE=()->{Reading old=reading;reading=new Reading(old.level,old.status,0,0);schedule();};
    private static final class Width{int nativeWidth,applied;Width(int width){nativeWidth=width;}}
    private static void restoreWidths(View view){for(String name:new String[]{"mBatteryLevelInsideView","mBatteryIconView"}){Object child=field(view,name);if(child instanceof View)width((View)child,0);}}
    private static void width(View view,int wanted){
        android.view.ViewGroup.LayoutParams lp=view.getLayoutParams();if(lp==null||lp.width<=0)return;
        Width state=WIDTHS.get(view);
        if(state!=null&&lp.width!=state.applied){WIDTHS.remove(view);state=null;}
        if(wanted<=0){if(state!=null){lp.width=state.nativeWidth;WIDTHS.remove(view);view.setLayoutParams(lp);}return;}
        if(state==null){state=new Width(lp.width);WIDTHS.put(view,state);}
        state.applied=Math.max(state.nativeWidth,wanted);
        if(lp.width!=state.applied){lp.width=state.applied;view.setLayoutParams(lp);}
    }
    private static void start(Context ctx){
        if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(()->start(ctx));return;}
        if(context!=null)return;context=ctx.getApplicationContext();if(context==null)context=ctx;
        try{
            Intent sticky=context.registerReceiver(new BroadcastReceiver(){public void onReceive(Context c,Intent i){battery(i);}},new IntentFilter(Intent.ACTION_BATTERY_CHANGED),null,MAIN,Context.RECEIVER_EXPORTED);
            if(sticky!=null)battery(sticky);
            FeatureSettings.addSnapshotListener(context,BatteryPercentageHook::schedule);
        }catch(RuntimeException failure){FeatureSettings.diagnostic(context,"ls_augment_battery_percentage_runtime","battery_receiver_unavailable:"+failure.getClass().getSimpleName());}
    }
    private static void battery(Intent intent){
        if(!Intent.ACTION_BATTERY_CHANGED.equals(intent.getAction()))return;
        int nextStatus=intent.getIntExtra(BatteryManager.EXTRA_STATUS,-1);
        int next=intent.getIntExtra(BatteryManager.EXTRA_LEVEL,-1),scale=intent.getIntExtra(BatteryManager.EXTRA_SCALE,100);
        if(next<0||scale<=0||next>scale)return;
        Reading old=reading;int level=Math.round(next*100f/scale),raw=old.raw;long at=old.rawAt;
        if(old.status!=nextStatus||!BatteryPercentagePolicy.validRaw(raw,level))raw=0;
        if(scale>100){int precise=(int)Math.round(next*10000d/scale);if(BatteryPercentagePolicy.validRaw(precise,level)){raw=precise;at=SystemClock.elapsedRealtime();}}
        reading=new Reading(level,nextStatus,raw,at);
        schedule();
    }
    static String text(int fallback){
        Reading sample=reading;int current=sample.level>=0?sample.level:fallback;
        Context ctx=context;if(ctx==null)return current<0?"":Integer.toString(current);
        int digits=FeatureSettings.integer(ctx,BatteryPercentagePolicy.DIGITS,0,0,2);
        int rule=FeatureSettings.integer(ctx,BatteryPercentagePolicy.RULE,2,0,2);
        int precise=SystemClock.elapsedRealtime()-sample.rawAt<=30000?sample.raw:0;
        return BatteryPercentagePolicy.format(current,precise,digits,rule,sample.status);
    }
    static boolean fractional(int fallback){return text(fallback).contains(".");}
    static void observe(ConnectivityIconSource source,Context ctx){MAIN.post(()->{start(ctx);SOURCES.put(source,Boolean.TRUE);source.refreshBatteryDisplay();});}
    static void forget(ConnectivityIconSource source){MAIN.post(()->SOURCES.remove(source));}
    private static void schedule(){MAIN.post(()->{if(!queued&&!refreshing){queued=true;MAIN.post(REFRESH);}});}
    private static void refresh(){
        queued=false;refreshing=true;
        try{
            for(ConnectivityIconSource source:new ArrayList<>(SOURCES.keySet()))if(source!=null)source.refreshBatteryDisplay();
            for(Map.Entry<View,Method> entry:new ArrayList<>(METERS.entrySet())){
                View view=entry.getKey();if(view==null||!view.isAttachedToWindow()){if(view!=null)restoreWidths(view);METERS.remove(view);continue;}
                try{entry.getValue().invoke(view);IosBatteryHook.apply(view);view.requestLayout();view.invalidate();}catch(ReflectiveOperationException ignored){}
            }
            for(Map.Entry<Object,Method> entry:new ArrayList<>(INDICATIONS.entrySet()))try{entry.getValue().invoke(entry.getKey(),false);}catch(ReflectiveOperationException ignored){}
            Reading sample=reading;
            if(context!=null)FeatureSettings.diagnostic(context,"ls_augment_battery_percentage_runtime","display="+text(sample.level)+";level="+sample.level+";raw="+sample.raw+";status="+sample.status+";source="+(fractional(sample.level)?"oem_hundredths":"system_integer")+";meters="+METERS.size());
        }finally{refreshing=false;}
    }
    private static Method method(Class<?> type,String name,Class<?> result,Class<?>...params)throws ReflectiveOperationException{
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Method m=c.getDeclaredMethod(name,params);if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers()))throw new NoSuchMethodException(name+":type");m.setAccessible(true);return m;}catch(NoSuchMethodException absent){}
        throw new NoSuchMethodException(type.getName()+"."+name);
    }
    private static Field typedField(Class<?> type,String name,Class<?> expected)throws ReflectiveOperationException{
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);if(!expected.isAssignableFrom(f.getType())||Modifier.isStatic(f.getModifiers()))throw new NoSuchFieldException(name+":type");f.setAccessible(true);return f;}catch(NoSuchFieldException absent){}
        throw new NoSuchFieldException(type.getName()+"."+name);
    }
}
