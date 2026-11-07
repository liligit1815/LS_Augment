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
    private static final java.util.Set<Class<?>> vendorTypes=Collections.newSetFromMap(new WeakHashMap<>());
    static synchronized void install(AugmentModule module,ClassLoader loader){
        if(installed)return;installed=true;
        installDisplayVotes(module,loader);
        watchVendorLoader(module,loader);
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
    private static void watchVendorLoader(AugmentModule module,ClassLoader loader){
        try{
            Class<?> manager=Class.forName("com.android.server.SystemServiceManager",false,loader);
            Method load=method(manager,"loadClassFromLoader",Class.class,true,String.class,ClassLoader.class);
            module.registerFeatureHook(module.prepareFeatureHook(load,"battery.refresh.vendor.loader",true).intercept(chain->{
                Object result=chain.proceed();
                if(result instanceof Class<?> service&&service.getName().equals("com.android.server.am.ScreenRefreshRateService"))
                    installVendor(module,service.getClassLoader());
                return result;
            }));
            // Some OEM boot paths pass a Class or an existing SystemService
            // directly, without loadClassFromLoader. Observe those before start.
            for(Method start:manager.getDeclaredMethods()){
                Class<?>[] p=start.getParameterTypes();
                if(!start.getName().equals("startService")||p.length!=1||Modifier.isStatic(start.getModifiers())
                        ||!(p[0]==Class.class||p[0].getName().equals("com.android.server.SystemService")))continue;
                start.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(start,"battery.refresh.vendor.start",true).intercept(chain->{
                    Object input=chain.getArg(0);Class<?> service=input instanceof Class<?> c?c:input==null?null:input.getClass();
                    if(service!=null&&service.getName().equals("com.android.server.am.ScreenRefreshRateService"))installVendor(module,service.getClassLoader());
                    return chain.proceed();
                }));
            }
        }catch(ReflectiveOperationException missing){module.logFeatureInfo("BATTERY_REFRESH vendor loader unavailable: "+missing);}
    }
    private static synchronized void installVendor(AugmentModule module,ClassLoader loader){
        try{
            VendorContract contract=vendorContract(loader);Class<?> type=contract.type;
            if(!vendorTypes.add(type))return;
            Field normal=contract.normal,context=contract.context,handler=contract.handler;
            Method update=contract.update,init=contract.init;
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
            module.logFeatureInfo("BATTERY_REFRESH vendor normal-save route ready; owner="+type.getName()+"; thermal and super-save retained");
        }catch(ClassNotFoundException waiting){module.logFeatureInfo("BATTERY_REFRESH vendor awaiting service loader: "+waiting.getMessage());}
        catch(Throwable e){module.logFeatureError("BATTERY_REFRESH vendor capability missing",e);}
    }
    private static final class VendorContract {
        final Class<?> type;final Field normal,context,handler;final Method update,init;
        VendorContract(Class<?> type,boolean compact)throws ReflectiveOperationException{
            this.type=type;
            normal=field(type,compact?"d":"isInPowerSaveMode",boolean.class);
            context=field(type,compact?"o":"mContext",Context.class);handler=field(type,compact?"p":"mHandler",Handler.class);
            field(type,compact?"f":"isHighTemperature",boolean.class);field(type,compact?"e":"isInSuperPowerSaveMode",boolean.class);
            constant(type,compact?"V1":"FLAG_POWER_SAVE",1000);
            if(compact){constant(type,"W1",1001);constant(type,"Y1",1003);}
            update=method(type,compact?"D4":"updateFpsForPowerSave",void.class,false,Message.class);
            init=method(type,compact?"E1":"initController",void.class,false);
        }
    }
    private static VendorContract vendorContract(ClassLoader loader)throws ReflectiveOperationException{
        try{return new VendorContract(Class.forName("com.android.server.am.ScreenRefreshRateController",false,loader),false);}
        catch(ClassNotFoundException relocated){
            // Derive the controller from the running service, never from a model
            // name or a separately created loader. This verified compact layout
            // has independent normal/super-save/thermal message branches.
            Class<?> service=Class.forName("com.android.server.am.ScreenRefreshRateService",false,loader);
            Method getter=service.getDeclaredMethod("getController");
            if(Modifier.isStatic(getter.getModifiers())||getter.getReturnType()==void.class||getter.getReturnType().isPrimitive())
                throw new NoSuchMethodException("service controller instance getter");
            return new VendorContract(getter.getReturnType(),true);
        }
    }
    private static void constant(Class<?> type,String name,int value)throws ReflectiveOperationException{
        Field f=type.getDeclaredField(name);f.setAccessible(true);
        if(f.getType()!=int.class||!Modifier.isStatic(f.getModifiers())||!Modifier.isFinal(f.getModifiers())||f.getInt(null)!=value)
            throw new NoSuchFieldException(name+" constant contract");
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
