package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.SystemOptions;

/** Removes only ordinary battery-saver refresh constraints. Thermal votes remain native. */
final class BatteryRefreshRateHook {
    private static boolean installed;
    static synchronized void install(AugmentModule module,ClassLoader loader){
        if(installed)return;installed=true;
        installDisplayVotes(module,loader);
        installVendor(module,loader);
    }
    private static boolean enabled(Context context){return FeatureSettings.enabled(context,SystemOptions.BATTERY_KEEP_REFRESH,false);}
    private static void installDisplayVotes(AugmentModule module,ClassLoader loader){
        try{
            Class<?> vote=Class.forName("com.android.server.display.mode.Vote",false,loader);
            Class<?> storage=Class.forName("com.android.server.display.mode.VotesStorage",false,loader);
            Class<?> observer=Class.forName("com.android.server.display.mode.DisplayModeDirector$SettingsObserver",false,loader);
            Class<?> director=Class.forName("com.android.server.display.mode.DisplayModeDirector",false,loader);
            Method name=method(vote,"priorityToString",String.class,true,int.class);
            java.util.Set<Integer> lowPower=new java.util.HashSet<>();
            for(int i=0;i<64;i++){
                Object label=name.invoke(null,i);
                if("PRIORITY_LOW_POWER_MODE".equals(label)||"PRIORITY_LOW_POWER_MODE_RENDER_RATE".equals(label)
                        ||"PRIORITY_LOW_POWER_MODE_MODES".equals(label))lowPower.add(i);
            }
            if(lowPower.isEmpty())throw new NoSuchFieldException("named low-power vote priorities");
            Method update=method(storage,"updateVote",void.class,false,int.class,int.class,vote);
            Method refresh=method(observer,"updateLowPowerModeSettingLocked",void.class,false);
            Field parent=field(observer,"this$0",director),context=field(observer,"mContext",Context.class);
            Field lock=field(director,"mLock",Object.class);
            Field handler=director.getDeclaredField("mHandler");handler.setAccessible(true);
            if(!Handler.class.isAssignableFrom(handler.getType()))throw new NoSuchFieldException("display handler");
            Map<Object,Boolean> observed=Collections.synchronizedMap(new WeakHashMap<>());
            module.registerFeatureHook(module.prepareFeatureHook(update,"battery.refresh.vote",true).intercept(chain->{
                if(lowPower.contains((Integer)chain.getArg(1))&&enabled(FeatureSettings.from(null)))
                    return chain.proceed(new Object[]{chain.getArg(0),chain.getArg(1),null});
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(refresh,"battery.refresh.observe",true).intercept(chain->{
                Object owner=chain.getThisObject();
                if(observed.put(owner,true)==null){
                    Context c=(Context)context.get(owner);
                    java.lang.ref.WeakReference<Object> ref=new java.lang.ref.WeakReference<>(owner);
                    FeatureSettings.addSnapshotListener(c,()->{
                        Object current=ref.get();if(current==null)return;
                        try{Object d=parent.get(current);((Handler)handler.get(d)).post(()->{
                            try{synchronized(lock.get(d)){refresh.invoke(current);}}
                            catch(Throwable e){module.logFeatureError("BATTERY_REFRESH display reapply",e);}
                        });}catch(Throwable e){module.logFeatureError("BATTERY_REFRESH display scheduling",e);}
                    });
                }
                return chain.proceed();
            }));
            module.deoptimize(update);module.deoptimize(refresh);
            module.logFeatureInfo("BATTERY_REFRESH display vote priorities="+lowPower);
        }catch(Throwable e){module.logFeatureError("BATTERY_REFRESH display capability missing",e);}
    }
    private static void installVendor(AugmentModule module,ClassLoader loader){
        try{
            Class<?> type=Class.forName("com.android.server.am.ScreenRefreshRateController",false,loader);
            Field normal=field(type,"isInPowerSaveMode",boolean.class),context=field(type,"mContext",Context.class);
            Field handler=field(type,"mHandler",Handler.class);
            // These independently retained flags confirm that thermal/super-save are separate inputs.
            field(type,"isHighTemperature",boolean.class);field(type,"isInSuperPowerSaveMode",boolean.class);
            Field flag=type.getDeclaredField("FLAG_POWER_SAVE");flag.setAccessible(true);
            if(flag.getType()!=int.class||!Modifier.isStatic(flag.getModifiers())||flag.getInt(null)!=1000)
                throw new NoSuchFieldException("FLAG_POWER_SAVE contract");
            Method update=method(type,"updateFpsForPowerSave",void.class,false,Message.class);
            Method init=method(type,"initController",void.class,false);
            Map<Object,VendorState> states=Collections.synchronizedMap(new WeakHashMap<>());
            module.registerFeatureHook(module.prepareFeatureHook(update,"battery.refresh.vendor",true).intercept(chain->{
                Object owner=chain.getThisObject();Message original=(Message)chain.getArg(0);
                if(original==null||original.arg2!=1000)return chain.proceed();
                VendorState state=states.get(owner);
                if(state==null){state=new VendorState();states.put(owner,state);}
                if(!state.replay)state.nativePowerSave=original.arg1==1;
                Context c=(Context)context.get(owner);
                listen(module,owner,state,c,handler,update);
                if(!enabled(c))return chain.proceed();
                Message copy=Message.obtain(original);copy.arg1=0;
                try{return chain.proceed(new Object[]{copy});}finally{copy.recycle();}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(init,"battery.refresh.vendor.init",true).intercept(chain->{
                Object result=chain.proceed();Object owner=chain.getThisObject();
                VendorState state=states.get(owner);if(state==null){state=new VendorState();states.put(owner,state);}state.nativePowerSave=normal.getBoolean(owner);
                Context c=(Context)context.get(owner);listen(module,owner,state,c,handler,update);
                if(enabled(c))reapply(module,owner,state,handler,update);
                return result;
            }));
            module.deoptimize(init);module.deoptimize(update);
            module.logFeatureInfo("BATTERY_REFRESH vendor normal-save route ready; thermal and super-save retained");
        }catch(Throwable e){module.logFeatureError("BATTERY_REFRESH vendor capability missing",e);}
    }
    private static final class VendorState{boolean nativePowerSave,replay,listening;}
    private static void listen(AugmentModule module,Object owner,VendorState state,Context context,Field handler,Method update){
        if(state.listening)return;
        java.lang.ref.WeakReference<Object> ref=new java.lang.ref.WeakReference<>(owner);
        state.listening=FeatureSettings.addSnapshotListener(context,()->{Object current=ref.get();if(current!=null)reapply(module,current,state,handler,update);});
    }
    private static void reapply(AugmentModule module,Object owner,VendorState state,Field handler,Method update){
        try{Handler h=(Handler)handler.get(owner);if(h==null)return;h.post(()->{
            Message message=Message.obtain();message.arg2=1000;message.arg1=state.nativePowerSave?1:0;state.replay=true;
            try{update.invoke(owner,message);}catch(Throwable e){module.logFeatureError("BATTERY_REFRESH vendor reapply",e);}
            finally{state.replay=false;message.recycle();}
        });}catch(Throwable e){module.logFeatureError("BATTERY_REFRESH vendor scheduling",e);}
    }
    private static Field field(Class<?> type,String name,Class<?> expected)throws ReflectiveOperationException{
        Field field=type.getDeclaredField(name);if(field.getType()!=expected||Modifier.isStatic(field.getModifiers()))throw new NoSuchFieldException(name+" type/static");field.setAccessible(true);return field;
    }
    private static Method method(Class<?> type,String name,Class<?> result,boolean isStatic,Class<?>...args)throws ReflectiveOperationException{
        Method method=type.getDeclaredMethod(name,args);if(method.getReturnType()!=result||Modifier.isStatic(method.getModifiers())!=isStatic)throw new NoSuchMethodException(name+" signature");method.setAccessible(true);return method;
    }
    private BatteryRefreshRateHook(){}
}
