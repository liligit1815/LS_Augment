package ls.augment.com.hook;

import android.content.Context;
import android.content.ComponentName;
import android.content.pm.ComponentInfo;
import android.content.pm.PackageManager;
import android.provider.Settings;
import android.net.MacAddress;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import io.github.libxposed.api.XposedInterface;
import ls.augment.com.SystemOptions;
import ls.augment.com.SystemRulesPolicy;

/** Framework rules ported as independently gated adapters. */
final class SystemRulesHook {
    private static final ThreadLocal<Boolean> QUIET_NOTIFICATION=ThreadLocal.withInitial(()->false);
    private static final Set<ClassLoader> LOADERS=Collections.newSetFromMap(new WeakHashMap<>());
    private static volatile Object keyguardMonitor;
    private static volatile Field keyguardShowing;
    private static volatile Object assistantOwner;
    private static volatile Context assistantContext;
    private static volatile ClassLoader assistantLoader;
    private static volatile AssistantState assistantState;
    private static final AtomicLong assistantGeneration=new AtomicLong();
    private static final AtomicBoolean assistantPending=new AtomicBoolean(),assistantPolling=new AtomicBoolean(),assistantListening=new AtomicBoolean();
    private static final ScheduledExecutorService ASSISTANT_WORKER=Executors.newSingleThreadScheduledExecutor(task->{Thread thread=new Thread(task,"LSA-AssistantConfig");thread.setDaemon(true);return thread;});
    private static final Runnable ASSISTANT_CHANGED=SystemRulesHook::invalidateAssistant;
    private static final long ASSISTANT_TTL_MS=10_000L;
    private static ContentObserver assistantObserver;
    private static Context observedAssistantContext;
    private static int observedAssistantUser=Integer.MIN_VALUE;
    private static String k(String suffix){return SystemOptions.key(suffix);}
    private SystemRulesHook() { }
    static synchronized int install(AugmentModule module,ClassLoader loader) {
        if(!LOADERS.add(loader))return 0;
        int count=installKeyguardMemory(module,loader)+installAssistantCache(module,loader)+installAudio(module,loader)+installCapture(module,loader);
        // The legacy thermal_notifications key must not bypass temperature updates,
        // listeners or shutdown checks. Keep the entire thermal service unhooked.
        count+=OemHooks.result(module,loader,"com.android.server.locksettings.LockSettingsStrongAuth","rescheduleStrongAuthTimeoutAlarm",void.class,-1,k("strong_auth_timeout"),null);
        count+=OemHooks.methods(module,loader,"com.android.server.locksettings.LockSettingsStrongAuth","requireStrongAuth",void.class,2,k("strong_auth_timeout"),chain->{
            Class<?> constants=Class.forName("com.android.internal.widget.LockPatternUtils",false,loader);
            Object bit=OemHooks.field(constants,"STRONG_AUTH_REQUIRED_AFTER_TIMEOUT");
            if(!(bit instanceof Integer))return chain.proceed();
            int reason=(Integer)chain.getArg(0),filtered=reason&~(Integer)bit;
            if(filtered==reason)return chain.proceed();
            if(filtered==0)return null;
            Object[] args=chain.getArgs().toArray();args[0]=filtered;return chain.proceed(args);
        });
        count+=OemHooks.methods(module,loader,"com.android.server.power.PowerManagerService","getScreenOffTimeoutLocked",long.class,2,k("lock_timeout_enabled"),chain->{
            Object original=chain.proceed();Context c=FeatureSettings.from(chain.getThisObject());
            return Boolean.TRUE.equals(keyguardShowing())?1000L*FeatureSettings.integer(c,k("lock_timeout_seconds"),15,1,86400):original;
        });
        count+=OemHooks.result(module,loader,"com.android.server.wm.AlertWindowNotification","onPostNotification",void.class,0,k("overlay_notification_hide"),null);
        count+=OemHooks.result(module,loader,"com.android.server.pm.ResolveIntentHelper","isCtsTesting",boolean.class,0,k("intent_hijack_disable"),true);
        // Newer ROMs moved the forced APK installer choice into this helper.
        // Return no OEM override so normal priorities and saved defaults decide.
        count+=OemHooks.result(module,loader,"com.android.server.pm.ResolveIntentHelperHook","getPackageInstaller",android.content.pm.ResolveInfo.class,2,k("intent_hijack_disable"),null);
        count+=OemHooks.result(module,loader,"com.android.server.wm.WindowState","getTouchOcclusionMode",int.class,0,k("untrusted_touch_allow"),2);
        // Intercept the JNI publication boundary too: optimized InputMonitor callers can
        // bypass the small WindowState getter. Keep the Java descriptor's native value
        // so a later publication with the option off restores the original policy.
        count+=OemHooks.methods(module,loader,"android.view.SurfaceControl","nativeSetInputWindowInfo",void.class,3,k("untrusted_touch_allow"),chain->{
            Object handle=chain.getArg(2),original=OemHooks.field(handle,"touchOcclusionMode");
            if(!(original instanceof Integer)||((Integer)original<0)||((Integer)original>2))return chain.proceed();
            if(!OemHooks.set(handle,2,"touchOcclusionMode"))return chain.proceed();
            try{return chain.proceed();}finally{OemHooks.set(handle,original,"touchOcclusionMode");}
        });
        for(String type:new String[]{"com.android.server.redmagic.trackclient.ZteTrackManager","com.android.server.datacollection.ZteTrackManager"})
            count+=OemHooks.result(module,loader,type,"init",void.class,1,k("telemetry_disable"),null);
        count+=OemHooks.methods(module,loader,"com.android.server.policy.PhoneWindowManager","powerLongPress",void.class,1,k("power_default_assistant"),chain->{
            Object owner=chain.getThisObject();AssistantState state=assistantState;
            Object user=OemHooks.field(owner,"mCurrentUserId"),behavior=OemHooks.field(owner,"mLongPressOnPowerBehavior");
            assistantTrace("power behavior="+behavior+" cached="+(state!=null)+" allowed="+(state!=null&&state.allowed),null);
            if(state==null||state.owner!=owner||state.generation!=assistantGeneration.get()
                    ||SystemClock.elapsedRealtime()-state.checkedAt>=ASSISTANT_TTL_MS
                    ||!Objects.equals(user,state.user)||!Objects.equals(behavior,state.nativeBehavior)){
                bindAssistant(owner,loader);return chain.proceed();
            }
            if(!state.allowed)return chain.proceed();
            try{
                // Keep the current native assistant dispatch, event time and invocation type.
                OemHooks.invoke(owner,"launchAssistAction",null,-2,chain.getArg(0),6);
                OemHooks.set(owner,true,"mPowerKeyHandled");
                try{OemHooks.invoke(owner,"performHapticFeedback",10002,"Power - Long Press - Go To Assistant");}
                catch(ReflectiveOperationException|RuntimeException ignored){ }
                return null;
            }catch(ReflectiveOperationException|RuntimeException failure){assistantTrace("dispatch failed",failure);return chain.proceed();}
        });
        count+=installNotifications(module,loader);
        count+=OemHooks.result(module,loader,"android.util.apk.ApkSignatureVerifier","getMinimumSignatureSchemeVersionForTargetSdk",int.class,1,k("signature_min_v1"),1);
        count+=installWireless(module,loader);
        count+=OemHooks.methods(module,loader,"com.android.server.SystemServiceManager","loadClassFromLoader",Class.class,2,"",chain->{
            Object result=chain.proceed();String target=String.valueOf(chain.getArg(0));Object next=chain.getArg(1);
            if(next instanceof ClassLoader&&(target.equals("com.android.server.wifi.WifiService")||target.equals("com.android.server.bluetooth.BluetoothService"))){
                ClassLoader actual=result instanceof Class?((Class<?>)result).getClassLoader():(ClassLoader)next;
                if(actual!=null)installWireless(module,actual);
            }
            return result;
        });
        module.logFeatureInfo("RM_FRAMEWORK_REGISTERED count="+count);return count;
    }
    private static int installAudio(AugmentModule module,ClassLoader loader) {
        int n=0;String safe=SystemOptions.NO_SAFE_WARNING;
        for(String method:new String[]{"raiseVolumeDisplaySafeMediaVolume","willDisplayWarningAfterCheckVolume"})
            n+=OemHooks.result(module,loader,"com.android.server.audio.SoundDoseHelper",method,boolean.class,4,safe,false);
        n+=OemHooks.result(module,loader,"com.android.server.audio.SoundDoseHelper","checkSafeMediaVolume",boolean.class,3,safe,false);
        n+=OemHooks.result(module,loader,"com.android.server.audio.SoundDoseHelper","enforceSafeMediaVolume",void.class,-1,safe,null);
        n+=OemHooks.result(module,loader,"com.android.server.audio.SoundDoseHelper","onLowerVolumeToRs1",void.class,0,safe,null);
        n+=OemHooks.result(module,loader,"com.android.server.audio.SoundDoseHelper","getSafeMediaVolumeIndex",int.class,1,safe,-1);
        // Current SoundDoseHelper$1 posts cumulative/momentary exposure warnings here.
        // Suppress the warning UI while leaving dose accounting and callbacks intact.
        n+=OemHooks.result(module,loader,"com.android.server.audio.AudioService$VolumeController","postDisplayCsdWarning",void.class,2,safe,null);
        n+=OemHooks.result(module,loader,"com.android.server.audio.AudioService$VolumeController","postDisplaySafeVolumeWarning",void.class,1,safe,null);
        Map<String,String> streams=new HashMap<>();
        streams.put("ro.config.alarm_vol_steps","alarm");streams.put("ro.config.media_vol_steps","media");
        streams.put("ro.config.notify_vol_steps","notification");streams.put("ro.config.ring_vol_steps","ring");streams.put("ro.config.vc_call_vol_steps","call");
        n+=OemHooks.methods(module,loader,"android.os.SystemProperties","getInt",int.class,2,"",chain->{
            String stream=streams.get(chain.getArg(0));if(stream==null)return chain.proceed();
            Context c=FeatureSettings.from(null);
            boolean constructing=false;
            for(StackTraceElement frame:Thread.currentThread().getStackTrace())
                if(frame.getClassName().equals("com.android.server.audio.AudioService")&&frame.getMethodName().equals("<init>")){constructing=true;break;}
            if(!constructing)return chain.proceed();
            int original=(Integer)chain.proceed();
            boolean enabled=FeatureSettings.enabled(c,k("audio_steps_"+stream+"_enabled"));
            int steps=FeatureSettings.integer(c,k("audio_steps_"+stream),15,1,200);
            // AudioService stores each property directly in MAX_STREAM_VOLUME. The later
            // VolumeStreamState conversion to tenths is internal and must not be applied here.
            int result=enabled?SystemRulesPolicy.audioSteps(steps):original;
            FeatureSettings.diagnostic(c,"ls_augment_audio_steps_boot_"+stream,
                    "ready="+FeatureSettings.hasVerifiedSnapshot(c)+";enabled="+enabled
                    +";original="+original+";requested="+steps+";returned="+result);
            return result;
        });
        java.util.concurrent.ConcurrentHashMap<Integer,Integer> observedMax=new java.util.concurrent.ConcurrentHashMap<>();
        n+=OemHooks.methods(module,loader,"com.android.server.audio.AudioService","getStreamMaxVolume",int.class,1,"",chain->{
            Object result=chain.proceed();Object arg=chain.getArg(0);
            if(arg instanceof Integer&&result instanceof Integer){
                int stream=(Integer)arg;
                if(stream==0||stream==2||stream==3||stream==4||stream==5){
                    Integer previous=observedMax.put(stream,(Integer)result);
                    if(!result.equals(previous))FeatureSettings.diagnostic(FeatureSettings.from(chain.getThisObject()),
                            "ls_augment_audio_steps_observed_"+stream,String.valueOf(result));
                }
            }
            return result;
        });
        return n;
    }
    private static int installNotifications(AugmentModule module,ClassLoader loader) {
        String type="com.android.server.notification.NotificationAttentionHelper",key=k("notification_quiet_unlocked");
        int n=OemHooks.methods(module,loader,type,"buzzBeepBlinkLocked",null,2,key,chain->{
            Object screenOn=OemHooks.field(chain.getThisObject(),"mScreenOn");Boolean showing=keyguardShowing();
            boolean previous=QUIET_NOTIFICATION.get();QUIET_NOTIFICATION.set(screenOn instanceof Boolean&&showing!=null&&SystemRulesPolicy.quietNotification((Boolean)screenOn,showing));
            try{return chain.proceed();}finally{QUIET_NOTIFICATION.set(previous);}
        });
        for(String method:new String[]{"playSound","playVibration","playInCallNotification"})
            n+=OemHooks.methods(module,loader,type,method,null,-1,key,chain->QUIET_NOTIFICATION.get()?OemHooks.defaultResult(((Method)chain.getExecutable()).getReturnType()):chain.proceed());
        return n;
    }
    static int installCapture(AugmentModule module,ClassLoader loader) {
        String key=k("secure_capture");int n=OemHooks.result(module,loader,"com.android.server.wm.WindowState","isSecureLocked",boolean.class,0,key,false);
        for(String owner:new String[]{"android.window.ScreenCapture","android.window.ScreenCaptureInternal","android.view.SurfaceControl"})
            for(String builder:new String[]{"$DisplayCaptureArgs$Builder","$LayerCaptureArgs$Builder"})
                n+=OemHooks.methods(module,loader,owner+builder,"build",null,0,key,chain->{
                    Object result=chain.proceed();OemHooks.set(result,true,"mCaptureSecureLayers");OemHooks.set(result,true,"mAllowProtected");return result;
                });
        // The current one-argument captureLayers path calls nativeCaptureLayers directly;
        // Binder-unparcelled capture arguments need not pass through a local Builder.
        for(String name:new String[]{"captureDisplay","captureLayers"})
            for(int argc:new int[]{1,2})
                n+=OemHooks.methods(module,loader,"android.window.ScreenCapture",name,null,argc,key,chain->{
                    Object args=chain.getArg(0);
                    if(args==null||!(args.getClass().getName().equals("android.window.ScreenCapture$DisplayCaptureArgs")
                            ||args.getClass().getName().equals("android.window.ScreenCapture$LayerCaptureArgs")))return chain.proceed();
                    Object secure=OemHooks.field(args,"mCaptureSecureLayers"),protectedContent=OemHooks.field(args,"mAllowProtected");
                    OemHooks.set(args,true,"mCaptureSecureLayers");OemHooks.set(args,true,"mAllowProtected");
                    try{return chain.proceed();}finally{
                        if(secure instanceof Boolean)OemHooks.set(args,secure,"mCaptureSecureLayers");
                        if(protectedContent instanceof Boolean)OemHooks.set(args,protectedContent,"mAllowProtected");
                    }
                });
        n+=OemHooks.methods(module,loader,"android.view.SurfaceControl$Transaction","setSecure",null,2,key,chain->{
            Object[] args=chain.getArgs().toArray();if(args[1] instanceof Boolean)args[1]=false;return chain.proceed(args);
        });
        n+=OemHooks.result(module,loader,"com.android.server.wm.ActivityTaskManagerService","registerScreenCaptureObserver",void.class,2,key,null);
        n+=OemHooks.result(module,loader,"com.android.server.wm.WindowManagerService","registerScreenRecordingCallback",boolean.class,1,key,false);
        return n;
    }
    private static synchronized int installWireless(AugmentModule module,ClassLoader loader) {
        String wifiStore="com.android.server.wifi.WifiSettingsStore";
        int count=OemHooks.methods(module,loader,wifiStore,"updateAirplaneModeTracker",boolean.class,0,k("airplane_keep_wifi"),chain->{
            Context context=FeatureSettings.from(chain.getThisObject());
            // Intercept the broadcast's state update, whose small sensitivity getter
            // is bypassed on current ROMs. Keep the existing STA/AP state on entry;
            // let the native tracker synchronize normally when airplane mode ends.
            if(context!=null&&Settings.Global.getInt(context.getContentResolver(),Settings.Global.AIRPLANE_MODE_ON,0)!=0)return false;
            return chain.proceed();
        });
        // Older Wi-Fi implementations do not expose the tracker entry point.
        if(count==0)count=OemHooks.result(module,loader,wifiStore,"isAirplaneSensitive",boolean.class,0,k("airplane_keep_wifi"),false);
        count+=OemHooks.methods(module,loader,"com.android.server.bluetooth.BluetoothManagerService","onAirplaneModeChanged",null,1,k("airplane_keep_bluetooth"),chain->{
            if(!Boolean.TRUE.equals(chain.getArg(0)))return chain.proceed();
            Class<?> result=((Method)chain.getExecutable()).getReturnType();
            if(result==void.class)return null;
            // The current Bluetooth APEX converted this callback to kotlin.Unit.
            if(result.getName().equals("kotlin.Unit"))return OemHooks.field(result,"INSTANCE");
            return chain.proceed();
        });
        count+=OemHooks.methods(module,loader,"com.android.server.wifi.WifiCountryCode","setTelephonyCountryCode",null,1,k("wifi_country_enabled"),chain->{
            String value=FeatureSettings.text(FeatureSettings.from(chain.getThisObject()),k("wifi_country"),"CN");
            if(!value.matches("[A-Z]{2}"))return chain.proceed();Object[] args=chain.getArgs().toArray();args[0]=value;return chain.proceed(args);
        });
        for(String[] pair:new String[][]{{"setStaMacAddress","wifi_mac"},{"setApMacAddress","hotspot_mac"}})
            count+=OemHooks.methods(module,loader,"com.android.server.wifi.WifiNative",pair[0],boolean.class,2,k(pair[1]+"_enabled"),chain->{
                String value=SystemOptions.normalizeMac(FeatureSettings.text(FeatureSettings.from(chain.getThisObject()),k(pair[1]),""));
                if(value==null||value.isEmpty())return chain.proceed();Object[] args=chain.getArgs().toArray();
                if(!(args[1] instanceof MacAddress))return chain.proceed();args[1]=MacAddress.fromString(value);return chain.proceed(args);
            });
        return count;
    }
    private static int installKeyguardMemory(AugmentModule module,ClassLoader loader){
        int count=0;String name="com.android.server.policy.keyguard.KeyguardStateMonitor";
        try{
            Class<?> type=Class.forName(name,false,loader);Field showing=type.getDeclaredField("mIsShowing");
            if(showing.getType()!=boolean.class||!java.lang.reflect.Modifier.isVolatile(showing.getModifiers()))return 0;
            showing.setAccessible(true);keyguardShowing=showing;
            for(Constructor<?> constructor:type.getDeclaredConstructors()){
                Class<?>[] args=constructor.getParameterTypes();
                if(args.length!=3||args[0]!=Context.class||!args[1].getName().equals("com.android.internal.policy.IKeyguardService")
                        ||!args[2].getName().equals(name+"$StateCallback"))continue;
                constructor.setAccessible(true);
                module.registerFeatureHook(HookTelemetry.observe(module.hook(constructor),constructor)
                        .setId("ls_augment.api102.rm.keyguard.memory").setExceptionMode(XposedInterface.ExceptionMode.PROTECTIVE)
                        .intercept(chain->{Object result=chain.proceed();keyguardMonitor=chain.getThisObject();return result;}));count++;
            }
            // The current delegate clears its wrapper and resets native keyguard state here.
            // Only a newly constructed monitor may restore our reference; a late callback
            // from the disconnected monitor must never make its old unlocked value valid.
            count+=OemHooks.methods(module,loader,"com.android.server.policy.keyguard.KeyguardServiceDelegate$2","onServiceDisconnected",void.class,1,"",chain->{
                if(((Method)chain.getExecutable()).getParameterTypes()[0]==ComponentName.class)keyguardMonitor=null;
                return chain.proceed();
            });
        }catch(Throwable unavailable){module.logFeatureError("RM_KEYGUARD_MEMORY",unavailable);}
        return count;
    }
    private static Boolean keyguardShowing(){
        Object monitor=keyguardMonitor;Field showing=keyguardShowing;if(monitor==null||showing==null)return null;
        try{return showing.getBoolean(monitor);}catch(IllegalAccessException|IllegalArgumentException unavailable){return null;}
    }
    private static int installAssistantCache(AugmentModule module,ClassLoader loader){
        String type="com.android.server.policy.PhoneWindowManager";int count=0;
        for(String name:new String[]{"init","updateSettings","setLongPressOnPowerBehavior"})
            count+=OemHooks.methods(module,loader,type,name,void.class,-1,"",chain->{
                Object result=chain.proceed();bindAssistant(chain.getThisObject(),loader);return result;
            });
        count+=OemHooks.methods(module,loader,type,"setCurrentUserLw",void.class,1,"",chain->{
            assistantState=null;assistantGeneration.incrementAndGet();
            try{return chain.proceed();}finally{bindAssistant(chain.getThisObject(),loader);}
        });
        return count;
    }
    private static void bindAssistant(Object owner,ClassLoader loader){
        Context context=FeatureSettings.from(owner);if(context==null)return;
        assistantOwner=owner;assistantContext=context;assistantLoader=loader;
        if(assistantListening.compareAndSet(false,true)&&!FeatureSettings.addSnapshotListener(context,ASSISTANT_CHANGED))assistantListening.set(false);
        if(assistantPolling.compareAndSet(false,true))ASSISTANT_WORKER.scheduleWithFixedDelay(SystemRulesHook::requestAssistantRefresh,5,5,TimeUnit.SECONDS);
        invalidateAssistant();
    }
    private static void invalidateAssistant(){assistantState=null;assistantGeneration.incrementAndGet();requestAssistantRefresh();}
    private static void requestAssistantRefresh(){
        Context context=assistantContext;if(context==null||!FeatureSettings.enabled(context,k("power_default_assistant")))return;
        if(!assistantPending.compareAndSet(false,true))return;
        ASSISTANT_WORKER.execute(()->{
            long generation=assistantGeneration.get(),checkedAt=SystemClock.elapsedRealtime();Object owner=assistantOwner;ClassLoader loader=assistantLoader;
            try{
                Object user=OemHooks.field(owner,"mCurrentUserId"),rawBehavior=OemHooks.field(owner,"mLongPressOnPowerBehavior");
                if(!(user instanceof Integer)||!(rawBehavior instanceof Integer)||loader==null)return;
                Object handle=OemHooks.invoke(Class.forName("android.os.UserHandle",false,loader),"of",user);
                Context userContext=(Context)OemHooks.invoke(context,"createContextAsUser",handle,0);
                observeAssistantOnWorker(userContext,(Integer)user);
                boolean allowed=assistantAllowedOnWorker(owner,userContext,loader,(Integer)rawBehavior);
                assistantTrace("refresh user="+user+" behavior="+rawBehavior+" allowed="+allowed,null);
                if(assistantGeneration.get()==generation&&assistantOwner==owner&&Objects.equals(user,OemHooks.field(owner,"mCurrentUserId"))
                        &&Objects.equals(rawBehavior,OemHooks.field(owner,"mLongPressOnPowerBehavior")))
                    assistantState=new AssistantState(owner,(Integer)user,(Integer)rawBehavior,allowed,generation,checkedAt);
            }catch(ReflectiveOperationException|RuntimeException unavailable){
                assistantTrace("refresh failed",unavailable);
                AssistantState current=assistantState;
                if(current!=null&&current.generation==generation)assistantState=null;
            }
            finally{assistantPending.set(false);if(assistantGeneration.get()!=generation)requestAssistantRefresh();}
        });
    }
    private static void observeAssistantOnWorker(Context context,int user){
        if(assistantObserver!=null&&observedAssistantUser==user)return;
        if(assistantObserver!=null&&observedAssistantContext!=null)try{observedAssistantContext.getContentResolver().unregisterContentObserver(assistantObserver);}catch(RuntimeException ignored){ }
        assistantObserver=null;observedAssistantContext=null;observedAssistantUser=Integer.MIN_VALUE;
        Looper main=Looper.getMainLooper();if(main==null)return;
        ContentObserver observer=new ContentObserver(new Handler(main)){@Override public void onChange(boolean selfChange){invalidateAssistant();}};
        try{
            for(String key:new String[]{"assistant","voice_interaction_service","user_setup_complete"})
                context.getContentResolver().registerContentObserver(Settings.Secure.getUriFor(key),false,observer);
            context.getContentResolver().registerContentObserver(Settings.System.getUriFor("clockwork_long_press_to_assistant_enabled"),false,observer);
            context.getContentResolver().registerContentObserver(Settings.Global.getUriFor("device_provisioned"),false,observer);
            assistantObserver=observer;observedAssistantContext=context;observedAssistantUser=user;
        }catch(RuntimeException unavailable){try{context.getContentResolver().unregisterContentObserver(observer);}catch(RuntimeException ignored){ }}
    }
    private static boolean assistantAllowedOnWorker(Object owner,Context userContext,ClassLoader loader,int behavior)throws ReflectiveOperationException{
        if(!SystemRulesPolicy.assistantPowerBehavior(behavior))return false;
        // Mirror the inspected phone's native eligibility gates using one explicit user.
        // Native helpers use USER_CURRENT and could mix users during a concurrent switch.
        if(!Boolean.FALSE.equals(OemHooks.field(owner,"mHasFeatureLeanback"))
                ||!Boolean.FALSE.equals(OemHooks.field(owner,"mHasFeatureAuto")))return false;
        if(!Boolean.FALSE.equals(OemHooks.invoke(Class.forName("android.os.FactoryTest",false,loader),"isLongPressOnPowerOffEnabled")))return false;
        if(behavior==5&&Settings.Global.getInt(userContext.getContentResolver(),"device_provisioned",0)==0)return false;
        if(behavior==4&&Settings.System.getInt(userContext.getContentResolver(),"clockwork_long_press_to_assistant_enabled",1)!=1)return false;
        return Settings.Secure.getInt(userContext.getContentResolver(),"user_setup_complete",0)!=0&&hasDefaultAssistant(userContext);
    }
    private static void assistantTrace(String message,Throwable error){
        if(ls.augment.com.BuildConfig.DEBUG&&android.util.Log.isLoggable("LSA.Assist",android.util.Log.DEBUG))
            android.util.Log.d("LSA.Assist",message,error);
    }
    private static boolean hasDefaultAssistant(Context context){
        if(context==null)return false;
        try{
            String value=Settings.Secure.getString(context.getContentResolver(),"assistant");
            ComponentName component=value==null?null:ComponentName.unflattenFromString(value);
            if(component==null)return false;
            PackageManager pm=context.getPackageManager();ComponentInfo info;
            try{info=pm.getServiceInfo(component,0);}catch(PackageManager.NameNotFoundException noService){info=pm.getActivityInfo(component,0);}
            return info.enabled&&info.applicationInfo.enabled;
        }catch(RuntimeException|PackageManager.NameNotFoundException unavailable){return false;}
    }
    private static final class AssistantState{final Object owner;final int user,nativeBehavior;final boolean allowed;final long generation,checkedAt;AssistantState(Object owner,int user,int behavior,boolean allowed,long generation,long checkedAt){this.owner=owner;this.user=user;this.nativeBehavior=behavior;this.allowed=allowed;this.generation=generation;this.checkedAt=checkedAt;}}
}
