"""Exercise the real SystemRulesHook with JVM service fixtures, without ADB or Gradle."""
import argparse
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java'
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--hook-source', type=Path,
                    default=JAVA / 'ls/augment/com/hook/SystemRulesHook.java',
                    help='SystemRulesHook.java to compile and execute (supports a before-fix snapshot)')
args = parser.parse_args()
hook_source = args.hook_source.resolve()

SOURCES = {
    'android/net/MacAddress.java': 'package android.net; public final class MacAddress {public static MacAddress fromString(String value){return new MacAddress();}}',
    'android/net/Uri.java': 'package android.net; public final class Uri {public static Uri parse(String value){return new Uri();}}',
    'android/os/Looper.java': 'package android.os; public final class Looper {public static Looper getMainLooper(){return new Looper();}}',
    'android/os/Handler.java': 'package android.os; public final class Handler {public Handler(Looper l){}}',
    'android/os/SystemClock.java': 'package android.os;public final class SystemClock {public static volatile long offset;public static long elapsedRealtime(){return System.nanoTime()/1000000+offset;}}',
    'android/os/FactoryTest.java': 'package android.os;import ls.augment.com.hook.TestSystemRulesAsync;public final class FactoryTest {public static volatile boolean enabled;public static boolean isLongPressOnPowerOffEnabled(){TestSystemRulesAsync.io();return enabled;}}',
    'android/os/UserHandle.java': 'package android.os; public final class UserHandle {public final int id;private UserHandle(int id){this.id=id;}public static UserHandle of(int id){return new UserHandle(id);}}',
    'android/database/ContentObserver.java': 'package android.database;import android.os.Handler;public class ContentObserver {public ContentObserver(Handler h){} public void onChange(boolean self){}}',
    'android/content/ContentResolver.java': 'package android.content;import android.net.Uri;import android.database.ContentObserver;import ls.augment.com.hook.TestSystemRulesAsync;public final class ContentResolver {public final int user;public ContentResolver(int user){this.user=user;}public void registerContentObserver(Uri u,boolean d,ContentObserver o){TestSystemRulesAsync.io();}public void unregisterContentObserver(ContentObserver o){TestSystemRulesAsync.io();}}',
    'android/content/Context.java': 'package android.content;import android.os.UserHandle;import android.content.pm.PackageManager;import ls.augment.com.hook.TestSystemRulesAsync;public class Context {public final int user;public Context(){this(0);}public Context(int u){user=u;}public Context createContextAsUser(UserHandle u,int flags){TestSystemRulesAsync.io();return new Context(u.id);}public ContentResolver getContentResolver(){return new ContentResolver(user);}public PackageManager getPackageManager(){return new PackageManager();}}',
    'android/content/ComponentName.java': 'package android.content;public final class ComponentName {public static ComponentName unflattenFromString(String s){return s==null||s.isEmpty()?null:new ComponentName();}}',
    'android/content/pm/ComponentInfo.java': 'package android.content.pm;public class ComponentInfo {public boolean enabled=true;public ApplicationInfo applicationInfo=new ApplicationInfo();public static class ApplicationInfo {public boolean enabled=true;}}',
    'android/content/pm/ResolveInfo.java': 'package android.content.pm;public class ResolveInfo {}',
    'android/content/pm/PackageManager.java': 'package android.content.pm;import android.content.ComponentName;import ls.augment.com.hook.TestSystemRulesAsync;public final class PackageManager {public static class NameNotFoundException extends Exception {}public ComponentInfo getServiceInfo(ComponentName c,int flags)throws NameNotFoundException{TestSystemRulesAsync.io();return new ComponentInfo();}public ComponentInfo getActivityInfo(ComponentName c,int flags)throws NameNotFoundException{TestSystemRulesAsync.io();return new ComponentInfo();}}',
    'android/provider/Settings.java': 'package android.provider;import android.content.ContentResolver;import android.net.Uri;import ls.augment.com.hook.TestSystemRulesAsync;public final class Settings {public static final class Secure {public static String getString(ContentResolver r,String key){return TestSystemRulesAsync.readAssistant(r.user);}public static int getInt(ContentResolver r,String key,int d){TestSystemRulesAsync.io();TestSystemRulesAsync.setupUsers.add(r.user);return 1;}public static Uri getUriFor(String key){return Uri.parse(key);}}public static final class Global {public static final String AIRPLANE_MODE_ON="airplane_mode_on";public static volatile int airplaneMode;public static int getInt(ContentResolver r,String k,int d){if(AIRPLANE_MODE_ON.equals(k)){TestSystemRulesAsync.trackerReads.incrementAndGet();return airplaneMode;}TestSystemRulesAsync.io();return 1;}public static Uri getUriFor(String key){return Uri.parse(key);}}public static final class System {public static int getInt(ContentResolver r,String k,int d){TestSystemRulesAsync.io();TestSystemRulesAsync.behaviorUsers.add(r.user);return 1;}public static Uri getUriFor(String key){return Uri.parse(key);}}}',
    'android/util/Log.java': 'package android.util;public final class Log {public static final int DEBUG=3;public static boolean isLoggable(String tag,int level){return false;}public static int d(String tag,String message,Throwable error){return 0;}}',
    'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public final class BuildConfig {public static final boolean DEBUG=true;}',
    'io/github/libxposed/api/XposedInterface.java': '''package io.github.libxposed.api;import java.lang.reflect.Executable;import java.util.List;public interface XposedInterface {
        enum ExceptionMode {PROTECTIVE} interface HookHandle {} interface Hooker {Object intercept(Chain chain)throws Throwable;}
        interface Chain {Object proceed()throws Throwable;Object proceed(Object[] args)throws Throwable;Object getThisObject();Object getArg(int i);List<Object> getArgs();Executable getExecutable();}
        interface HookBuilder {HookBuilder setId(String id);HookBuilder setExceptionMode(ExceptionMode mode);HookHandle intercept(Hooker hooker);}
    }''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.Executable;import java.util.*;import io.github.libxposed.api.XposedInterface.*;public final class AugmentModule {
        final Map<Executable,Hooker> constructors=new HashMap<>();public HookBuilder hook(Executable target){return new HookBuilder(){public HookBuilder setId(String id){return this;}public HookBuilder setExceptionMode(ExceptionMode mode){return this;}public HookHandle intercept(Hooker h){constructors.put(target,h);return new HookHandle(){};}};}
        void registerFeatureHook(HookHandle h){}void logFeatureInfo(String s){}void logFeatureError(String s,Throwable t){throw new AssertionError(s,t);}
    }''',
    'ls/augment/com/hook/HookTelemetry.java': 'package ls.augment.com.hook;import java.lang.reflect.Executable;import io.github.libxposed.api.XposedInterface.HookBuilder;final class HookTelemetry {static HookBuilder observe(HookBuilder h,Executable e){return h;}}',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import android.content.Context;import java.util.concurrent.CopyOnWriteArrayList;final class FeatureSettings {
        static final java.util.Map<String,String> diagnostics=new java.util.HashMap<>();static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}static boolean hasVerifiedSnapshot(Context c){return true;}
        static volatile boolean on=true,thermalOn=true;static final CopyOnWriteArrayList<Runnable> listeners=new CopyOnWriteArrayList<>();static boolean enabled(Context c,String k){return "thermal_notifications".equals(k)?thermalOn:on;}
        static boolean addSnapshotListener(Context c,Runnable r){listeners.addIfAbsent(r);return true;}static Context from(Object o){Object c=OemHooks.field(o,"mContext");return c instanceof Context?(Context)c:null;}
        static int integer(Context c,String k,int d,int lo,int hi){return 15;}static String text(Context c,String k,String d){return d;}
    }''',
    'ls/augment/com/SystemOptions.java': 'package ls.augment.com;public final class SystemOptions {public static final String NO_SAFE_WARNING="safe";public static String key(String s){return s;}public static String normalizeMac(String s){return s;}}',
    'ls/augment/com/hook/OemHooks.java': r'''package ls.augment.com.hook;
        import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.*;
        final class OemHooks {
            static final Map<String,Hooker> hooks=new HashMap<>();static int methods(AugmentModule m,ClassLoader l,String c,String n,Class<?> rt,int argc,String key,Hooker h){hooks.put(c+"#"+n,chain->key.isEmpty()||FeatureSettings.enabled(FeatureSettings.from(chain.getThisObject()),key)?h.intercept(chain):chain.proceed());return 1;}
            static int result(AugmentModule m,ClassLoader l,String c,String n,Class<?> rt,int argc,String key,Object value){return methods(m,l,c,n,rt,argc,key,chain->value);}
            static Object field(Object o,String... names){if(o==null)return null;for(String n:names)for(Class<?> c=o instanceof Class?(Class<?>)o:o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o instanceof Class?null:o);}catch(ReflectiveOperationException ignored){}return null;}
            static boolean set(Object o,Object value,String... names){if(o==null)return false;for(String n:names)for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);f.set(o,value);return true;}catch(ReflectiveOperationException ignored){}return false;}
            static Object invoke(Object owner,String name,Object... args)throws ReflectiveOperationException {for(Class<?> c=owner instanceof Class?(Class<?>)owner:owner.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&compatible(m.getParameterTypes(),args)){m.setAccessible(true);return m.invoke(owner instanceof Class?null:owner,args);}throw new NoSuchMethodException(name);}
            static boolean compatible(Class<?>[] types,Object[] args){if(types.length!=args.length)return false;for(int i=0;i<types.length;i++){Class<?> t=types[i];if(args[i]==null){if(t.isPrimitive())return false;continue;}if(t.isPrimitive())t=t==int.class?Integer.class:t==long.class?Long.class:t==boolean.class?Boolean.class:t;if(!t.isInstance(args[i]))return false;}return true;}
            static Object defaultResult(Class<?> type){return type==boolean.class?false:null;}
        }
    ''',
    'com/android/internal/policy/IKeyguardService.java': 'package com.android.internal.policy;public interface IKeyguardService {}',
    'com/android/server/policy/keyguard/KeyguardStateMonitor.java': '''package com.android.server.policy.keyguard;import android.content.Context;import com.android.internal.policy.IKeyguardService;public class KeyguardStateMonitor {public interface StateCallback {}public volatile boolean mIsShowing=true;public KeyguardStateMonitor(Context c,IKeyguardService s,StateCallback callback){}public void onShowingStateChanged(boolean showing,int user){mIsShowing=showing;}}''',
    'com/android/server/policy/keyguard/KeyguardServiceDelegate.java': 'package com.android.server.policy.keyguard;import android.content.ComponentName;public class KeyguardServiceDelegate {public static class Connection {public void onServiceDisconnected(ComponentName name){}}}',
    'ls/augment/com/hook/TestSystemRulesAsync.java': r'''
        package ls.augment.com.hook;
        import android.content.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
        import com.android.server.policy.keyguard.*;import io.github.libxposed.api.XposedInterface.*;
        public final class TestSystemRulesAsync {
            static final AtomicInteger wrongThread=new AtomicInteger();static volatile CountDownLatch gate=new CountDownLatch(1),entered=new CountDownLatch(1);
            public static final AtomicInteger trackerReads=new AtomicInteger();
            static final List<Integer> users=new CopyOnWriteArrayList<>();public static final List<Integer> setupUsers=new CopyOnWriteArrayList<>(),behaviorUsers=new CopyOnWriteArrayList<>();static volatile boolean assistantExists=true;
            public static void io(){if(!Thread.currentThread().getName().equals("LSA-AssistantConfig"))wrongThread.incrementAndGet();}
            static void await(CountDownLatch latch){try{if(!latch.await(5,TimeUnit.SECONDS))throw new AssertionError("blocked service timed out");}catch(InterruptedException e){throw new AssertionError(e);}}
            public static String readAssistant(int user){io();users.add(user);entered.countDown();await(gate);return assistantExists?"test/Assistant":"";}
            interface Condition{boolean get()throws Exception;}static void until(Condition c)throws Exception{long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);while(!c.get()){if(System.nanoTime()>deadline)throw new AssertionError("condition timed out");Thread.sleep(5);}}
            static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
            static Object state()throws Exception{Field f=SystemRulesHook.class.getDeclaredField("assistantState");f.setAccessible(true);return f.get(null);}
            static Object monitor()throws Exception{Field f=SystemRulesHook.class.getDeclaredField("keyguardMonitor");f.setAccessible(true);return f.get(null);}
            static final class Owner {
                public final Context mContext=new Context();public int mCurrentUserId=0,mLongPressOnPowerBehavior=5;public boolean mPowerKeyHandled,mScreenOn=true,mHasFeatureLeanback=false,mHasFeatureAuto=false;int launches;
                public void init(){}public void powerLongPress(long time){}public void setCurrentUserLw(int user){mCurrentUserId=user;}
                public int getResolvedLongPressOnPowerBehavior(){io();return mLongPressOnPowerBehavior;}public boolean isUserSetupComplete(){io();return true;}
                public void launchAssistAction(String hint,int user,long time,int invocation){launches++;}public void performHapticFeedback(int effect,String reason){}
                public long getScreenOffTimeoutLocked(long first,long second){return 8000;}public void buzzBeepBlinkLocked(Object a,Object b){}public void playSound(){}
            }
            static final class WifiOwner {
                final Context mContext;boolean trackedAirplane,wifiEnabled=true;int nativeCalls;
                WifiOwner(Context context){mContext=context;}
                public boolean updateAirplaneModeTracker(){nativeCalls++;boolean now=android.provider.Settings.Global.airplaneMode!=0;boolean changed=trackedAirplane!=now;trackedAirplane=now;if(changed&&now)wifiEnabled=false;return changed;}
            }
            // This local fixture observes original-call preservation. It is not Android/OEM thermal code
            // and cannot verify real shutdown, throttling, hardware thresholds, or notification delivery.
            static final class ThermalEvent {
                static final int NONE=0,LIGHT=1,MODERATE=2,SEVERE=3,CRITICAL=4,EMERGENCY=5,SHUTDOWN=6;
                final int status;ThermalEvent(int status){this.status=status;}
            }
            static final class ThermalOwner {
                public final Context mContext=new Context();
                int originalCalls,stateUpdates,callbackCalls,simulatedShutdowns;
                ThermalEvent receivedTemperature,lastTemperature;boolean receivedSendCallback;
                RuntimeException failure;
                public void onTemperatureChanged(ThermalEvent temperature,boolean sendCallback){
                    originalCalls++;receivedTemperature=temperature;receivedSendCallback=sendCallback;
                    if(failure!=null)throw failure;
                    if(temperature.status==ThermalEvent.SHUTDOWN)simulatedShutdowns++;
                    lastTemperature=temperature;stateUpdates++;
                    if(sendCallback)callbackCalls++;
                }
            }
            static final class ThermalCall implements Chain {
                final ThermalOwner owner;final Executable target;final List<Object> args;int proceeded;
                ThermalCall(ThermalOwner owner,ThermalEvent event,boolean sendCallback)throws Exception{
                    this.owner=owner;target=ThermalOwner.class.getDeclaredMethod("onTemperatureChanged",ThermalEvent.class,boolean.class);
                    args=Arrays.asList(event,sendCallback);
                }
                public Object proceed(){return proceed(args.toArray());}
                public Object proceed(Object[] forwarded){
                    proceeded++;owner.onTemperatureChanged((ThermalEvent)forwarded[0],(Boolean)forwarded[1]);return null;
                }
                public Object getThisObject(){return owner;}public Object getArg(int i){return args.get(i);}
                public List<Object> getArgs(){return args;}public Executable getExecutable(){return target;}
            }
            interface Original {Object run()throws Throwable;}
            static final class Call implements Chain {
                final Object owner;final Executable target;final List<Object> args;final Original original;int proceeded;
                Call(Object owner,Executable method,Object[] args,Original original){this.owner=owner;target=method;this.args=Arrays.asList(args);this.original=original;}
                public Object proceed()throws Throwable{proceeded++;return original==null?null:original.run();}public Object proceed(Object[] args)throws Throwable{return proceed();}
                public Object getThisObject(){return owner;}public Object getArg(int i){return args.get(i);}public List<Object> getArgs(){return args;}public Executable getExecutable(){return target;}
            }
            static Call call(Object o,String name,Class<?>[] types,Object... args)throws Exception{return new Call(o,o.getClass().getDeclaredMethod(name,types),args,null);}
            static Object hooked(String owner,String name,Call chain)throws Throwable{return OemHooks.hooks.get(owner+"#"+name).intercept(chain);}
            static final String PWM="com.android.server.policy.PhoneWindowManager",POWER="com.android.server.power.PowerManagerService",NOTIFICATION="com.android.server.notification.NotificationAttentionHelper";
            public static int readAudioBoot()throws Throwable {
                Call original=new Call(null,null,new Object[]{"ro.config.media_vol_steps",15},()->60);
                int value=(Integer)hooked("android.os.SystemProperties","getInt",original);
                check(original.proceeded==1,"audio property original exactly once");return value;
            }
            static void testAudioDiagnostics()throws Throwable {
                FeatureSettings.on=true;
                com.android.server.audio.AudioService enabled=new com.android.server.audio.AudioService();
                check(enabled.steps==15,"boot steps in public units");
                check(FeatureSettings.diagnostics.get("ls_augment_audio_steps_boot_media").contains("original=60;requested=15;returned=15"),"boot witness actual values");
                FeatureSettings.on=false;
                check(new com.android.server.audio.AudioService().steps==60,"disabled boot preserves property");
                check(readAudioBoot()==60,"outside constructor preserves property");
                Owner owner=new Owner();Call max=new Call(owner,null,new Object[]{3},()->30);
                check(hooked("com.android.server.audio.AudioService","getStreamMaxVolume",max).equals(30)&&max.proceeded==1,"max observation preserves result");
                check("30".equals(FeatureSettings.diagnostics.get("ls_augment_audio_steps_observed_3")),"observed max captured");
                RuntimeException failure=new RuntimeException("OEM");
                try { hooked("com.android.server.audio.AudioService","getStreamMaxVolume",new Call(owner,null,new Object[]{3},()->{throw failure;}));throw new AssertionError("exception swallowed"); }
                catch(RuntimeException actual){check(actual==failure,"native audio exception identity");}
                FeatureSettings.on=true;
                System.out.println("PASS audio boot diagnostics: constructor scope, OFF restoration, units, passive max observation and native exception preservation");
            }
            static void testAirplaneTracker()throws Throwable {
                String type="com.android.server.wifi.WifiSettingsStore";Method method=WifiOwner.class.getDeclaredMethod("updateAirplaneModeTracker");
                WifiOwner wifi=new WifiOwner(new Context());android.provider.Settings.Global.airplaneMode=1;
                Call entering=new Call(wifi,method,new Object[]{},wifi::updateAirplaneModeTracker);
                check(Boolean.FALSE.equals(hooked(type,"updateAirplaneModeTracker",entering)),"enabled airplane entry did not suppress tracker change");
                check(entering.proceeded==0&&wifi.nativeCalls==0&&wifi.wifiEnabled&&!wifi.trackedAirplane,"enabled entry changed native Wi-Fi state");
                int reads=trackerReads.get();FeatureSettings.on=false;
                try {
                    Call nativeEntry=new Call(wifi,method,new Object[]{},wifi::updateAirplaneModeTracker);
                    check(Boolean.TRUE.equals(hooked(type,"updateAirplaneModeTracker",nativeEntry)),"disabled option changed native entry result");
                    check(nativeEntry.proceeded==1&&wifi.nativeCalls==1&&!wifi.wifiEnabled&&wifi.trackedAirplane,"disabled option did not execute native airplane entry exactly once");
                    check(trackerReads.get()==reads,"disabled option still read airplane Settings");
                }finally{FeatureSettings.on=true;}
                android.provider.Settings.Global.airplaneMode=0;
                Call leaving=new Call(wifi,method,new Object[]{},wifi::updateAirplaneModeTracker);
                check(Boolean.TRUE.equals(hooked(type,"updateAirplaneModeTracker",leaving)),"enabled airplane exit lost native change result");
                check(leaving.proceeded==1&&wifi.nativeCalls==2&&!wifi.trackedAirplane,"enabled exit did not synchronize tracker exactly once");
                Call unchanged=new Call(wifi,method,new Object[]{},wifi::updateAirplaneModeTracker);
                check(Boolean.FALSE.equals(hooked(type,"updateAirplaneModeTracker",unchanged))&&unchanged.proceeded==1,"unchanged native exit result was replaced");
                android.provider.Settings.Global.airplaneMode=1;WifiOwner unavailable=new WifiOwner(null);reads=trackerReads.get();
                Call unknown=new Call(unavailable,method,new Object[]{},unavailable::updateAirplaneModeTracker);
                check(Boolean.TRUE.equals(hooked(type,"updateAirplaneModeTracker",unknown))&&unknown.proceeded==1,"missing context did not use native tracker");
                check(trackerReads.get()==reads,"missing context read Settings");
                android.provider.Settings.Global.airplaneMode=0;IllegalStateException failure=new IllegalStateException("native failure");
                Call throwsNative=new Call(wifi,method,new Object[]{},()->{throw failure;});
                try {hooked(type,"updateAirplaneModeTracker",throwsNative);throw new AssertionError("native tracker failure swallowed");}
                catch(IllegalStateException expected){check(expected==failure&&throwsNative.proceeded==1,"native failure changed or native tracker repeated");}
            }
            static void testThermalOriginalPreserved()throws Throwable {
                String type="com.android.server.power.ThermalManagerService";
                Hooker installed=OemHooks.hooks.get(type+"#onTemperatureChanged");
                String[] names={"NONE","LIGHT","MODERATE","SEVERE","CRITICAL","EMERGENCY","SHUTDOWN"};
                List<String> failures=new ArrayList<>();int eventCases=0,exceptionCases=0;
                boolean previous=FeatureSettings.thermalOn;
                try {
                    for(boolean oldOption:new boolean[]{false,true}){
                        FeatureSettings.thermalOn=oldOption;
                        for(int status=ThermalEvent.NONE;status<=ThermalEvent.SHUTDOWN;status++)for(boolean sendCallback:new boolean[]{false,true}){
                            String scenario="oldOption="+oldOption+", status="+names[status]+", sendCallback="+sendCallback;
                            ThermalEvent event=new ThermalEvent(status);ThermalOwner owner=new ThermalOwner();
                            ThermalCall call=new ThermalCall(owner,event,sendCallback);Object result=null;Throwable thrown=null;
                            try {result=installed==null?call.proceed():installed.intercept(call);}catch(Throwable error){thrown=error;}
                            if(thrown!=null||result!=null||call.proceeded!=1||owner.originalCalls!=1
                                ||owner.receivedTemperature!=event||owner.receivedSendCallback!=sendCallback
                                ||owner.lastTemperature!=event||owner.stateUpdates!=1
                                ||owner.callbackCalls!=(sendCallback?1:0)
                                ||owner.simulatedShutdowns!=(status==ThermalEvent.SHUTDOWN?1:0)){
                                failures.add(scenario+": original method/result/arguments or fixture effects changed"
                                    +" (proceed="+call.proceeded+", original="+owner.originalCalls+", error="+thrown+")");
                            }
                            eventCases++;
                        }
                        for(boolean sendCallback:new boolean[]{false,true}){
                            ThermalEvent event=new ThermalEvent(ThermalEvent.SHUTDOWN);ThermalOwner owner=new ThermalOwner();
                            IllegalStateException originalFailure=new IllegalStateException("thermal fixture original failure");owner.failure=originalFailure;
                            ThermalCall call=new ThermalCall(owner,event,sendCallback);Throwable thrown=null;
                            try {if(installed==null)call.proceed();else installed.intercept(call);}catch(Throwable error){thrown=error;}
                            if(thrown!=originalFailure||call.proceeded!=1||owner.originalCalls!=1
                                ||owner.receivedTemperature!=event||owner.receivedSendCallback!=sendCallback){
                                failures.add("oldOption="+oldOption+", sendCallback="+sendCallback+": original exception or arguments changed"
                                    +" (proceed="+call.proceeded+", original="+owner.originalCalls+")");
                            }
                            exceptionCases++;
                        }
                    }
                }finally{FeatureSettings.thermalOn=previous;}
                for(String target:OemHooks.hooks.keySet())if(target.startsWith(type+"#"))failures.add("thermal service hook remains registered: "+target);
                System.out.println("Thermal JVM fixture: executed "+eventCases+" severity/old-option/callback cases and "+exceptionCases+" original-exception cases; failures="+failures.size());
                check(failures.isEmpty(),"Thermal original-call preservation regression:\n"+String.join("\n",failures));
                System.out.println("SystemRulesHook: thermal service has no registered hooks; original calls, arguments, results and exceptions preserved. JVM fixtures only; no OEM/hardware validation.");
            }
            public static void main(String[] args)throws Throwable {
                AugmentModule module=new AugmentModule();SystemRulesHook.install(module,TestSystemRulesAsync.class.getClassLoader());Owner owner=new Owner();
                hooked(PWM,"init",call(owner,"init",new Class<?>[]{}));await(entered);
                long start=System.nanoTime();for(int i=0;i<1000;i++){Call power=call(owner,"powerLongPress",new Class<?>[]{long.class},100L);hooked(PWM,"powerLongPress",power);check(power.proceeded==1,"unknown assistant did not use native action");}
                check(System.nanoTime()-start<TimeUnit.SECONDS.toNanos(1),"power hook waited for blocked Settings");check(owner.launches==0,"unknown assistant launched");
                gate.countDown();until(()->state()!=null);Call power=call(owner,"powerLongPress",new Class<?>[]{long.class},100L);hooked(PWM,"powerLongPress",power);
                check(power.proceeded==0&&owner.launches==1&&owner.mPowerKeyHandled,"known assistant did not use native dispatcher");
                gate=new CountDownLatch(1);entered=new CountDownLatch(1);assistantExists=false;
                Call switched=new Call(owner,Owner.class.getDeclaredMethod("setCurrentUserLw",int.class),new Object[]{10},()->{check(state()==null,"old assistant visible during user switch");owner.mCurrentUserId=10;return null;});
                hooked(PWM,"setCurrentUserLw",switched);await(entered);power=call(owner,"powerLongPress",new Class<?>[]{long.class},101L);hooked(PWM,"powerLongPress",power);check(power.proceeded==1&&owner.launches==1,"old user's assistant used while new user unresolved");
                gate.countDown();until(()->state()!=null);check(users.contains(10)&&setupUsers.contains(10),"assistant/setup were not queried as current user");power=call(owner,"powerLongPress",new Class<?>[]{long.class},102L);hooked(PWM,"powerLongPress",power);check(power.proceeded==1,"no default assistant did not fall back");
                Object rejected=state();Field stateField=SystemRulesHook.class.getDeclaredField("assistantState");stateField.setAccessible(true);Field generationField=SystemRulesHook.class.getDeclaredField("assistantGeneration");generationField.setAccessible(true);
                Constructor<?> stateConstructor=rejected.getClass().getDeclaredConstructors()[0];stateConstructor.setAccessible(true);long oldGeneration=((AtomicLong)generationField.get(null)).get()-1;
                stateField.set(null,stateConstructor.newInstance(owner,10,5,true,oldGeneration,android.os.SystemClock.elapsedRealtime()));
                power=call(owner,"powerLongPress",new Class<?>[]{long.class},103L);hooked(PWM,"powerLongPress",power);check(power.proceeded==1&&owner.launches==1,"late old-generation result was used");until(()->state()!=null);
                long generation=((AtomicLong)generationField.get(null)).get();stateField.set(null,stateConstructor.newInstance(owner,10,5,true,generation,android.os.SystemClock.elapsedRealtime()-10001));
                power=call(owner,"powerLongPress",new Class<?>[]{long.class},104L);hooked(PWM,"powerLongPress",power);check(power.proceeded==1&&owner.launches==1,"expired state was used");until(()->state()!=null);
                owner.mLongPressOnPowerBehavior=4;assistantExists=true;hooked(PWM,"init",call(owner,"init",new Class<?>[]{}));until(()->state()!=null);check(behaviorUsers.contains(10),"behavior gate did not use explicit current user");
                power=call(owner,"powerLongPress",new Class<?>[]{long.class},105L);hooked(PWM,"powerLongPress",power);check(power.proceeded==0&&owner.launches==2,"behavior 4 assistant not dispatched");
                Method timeout=Owner.class.getDeclaredMethod("getScreenOffTimeoutLocked",long.class,long.class);
                check(hooked(POWER,"getScreenOffTimeoutLocked",new Call(owner,timeout,new Object[]{1L,2L},()->8000L)).equals(8000L),"unknown keyguard changed timeout");
                Executable constructor=module.constructors.keySet().iterator().next();KeyguardStateMonitor old=new KeyguardStateMonitor(new Context(),null,null);
                module.constructors.get(constructor).intercept(new Call(old,constructor,new Object[]{owner.mContext,null,null},null));
                check(monitor()==old,"monitor constructor was not captured");
                check(hooked(POWER,"getScreenOffTimeoutLocked",new Call(owner,timeout,new Object[]{1L,2L},()->8000L)).equals(15000L),"locked timeout did not read native memory");
                old.onShowingStateChanged(false,10);check(hooked(POWER,"getScreenOffTimeoutLocked",new Call(owner,timeout,new Object[]{1L,2L},()->8000L)).equals(8000L),"unlocked field update not seen immediately");
                Call sound=call(owner,"playSound",new Class<?>[]{});Method buzz=Owner.class.getDeclaredMethod("buzzBeepBlinkLocked",Object.class,Object.class);
                hooked(NOTIFICATION,"buzzBeepBlinkLocked",new Call(owner,buzz,new Object[]{null,null},()->hooked(NOTIFICATION,"playSound",sound)));
                check(sound.proceeded==0,"unlocked notification not quiet");Call directSound=call(owner,"playSound",new Class<?>[]{});hooked(NOTIFICATION,"playSound",directSound);check(directSound.proceeded==1,"quiet state leaked outside notification call");
                KeyguardServiceDelegate.Connection connection=new KeyguardServiceDelegate.Connection();Call disconnected=new Call(connection,connection.getClass().getDeclaredMethod("onServiceDisconnected",ComponentName.class),new Object[]{new ComponentName()},()->{check(monitor()==null,"old monitor visible during disconnect");return null;});
                hooked("com.android.server.policy.keyguard.KeyguardServiceDelegate$2","onServiceDisconnected",disconnected);
                old.onShowingStateChanged(false,10);check(monitor()==null,"late dead-service callback restored old monitor");
                Call unknownSound=call(owner,"playSound",new Class<?>[]{});hooked(NOTIFICATION,"buzzBeepBlinkLocked",new Call(owner,buzz,new Object[]{null,null},()->hooked(NOTIFICATION,"playSound",unknownSound)));check(unknownSound.proceeded==1,"unknown lock state silenced notification");
                KeyguardStateMonitor next=new KeyguardStateMonitor(new Context(),null,null);module.constructors.get(constructor).intercept(new Call(next,constructor,new Object[]{owner.mContext,null,null},null));old.onShowingStateChanged(false,10);
                check(monitor()==next,"old callback replaced reconnected monitor");check(hooked(POWER,"getScreenOffTimeoutLocked",new Call(owner,timeout,new Object[]{1L,2L},()->8000L)).equals(15000L),"new locked monitor not used");
                check(wrongThread.get()==0,"service IPC ran on system hook thread");check(FeatureSettings.listeners.size()==1,"listener registered more than once");
                testAirplaneTracker();
                System.out.println("SystemRulesHook: blocked assistant Settings, current-user isolation, stale/expired results, native keyguard memory, disconnect/reconnect and notification scope passed");
                System.out.println("SystemRulesHook: real airplane tracker adapter entry/exit, disabled option, native result/exception preservation and missing-context fallback passed");
                testThermalOriginalPreserved();
                testAudioDiagnostics();
            }
        }
    ''',
}

SOURCES['com/android/server/audio/AudioService.java'] = 'package com.android.server.audio;public class AudioService {public final int steps;public AudioService()throws Throwable{steps=ls.augment.com.hook.TestSystemRulesAsync.readAudioBoot();}}'

SOURCES['ls/augment/com/hook/SystemRulesHook.java'] = hook_source.read_text(encoding='utf-8')
SOURCES['ls/augment/com/SystemRulesPolicy.java'] = (JAVA / 'ls/augment/com/SystemRulesPolicy.java').read_text(encoding='utf-8')
print(f'Executing production SystemRulesHook.install() from: {hook_source}', flush=True)
print('Android/OemHooks are local JVM fixtures; this is not an OEM or hardware thermal test.', flush=True)

with tempfile.TemporaryDirectory(prefix='ls-system-rules-async-') as directory:
    temporary = Path(directory)
    files = []
    for name, text in SOURCES.items():
        target = temporary / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding='utf-8')
        files.append(str(target))
    classes = temporary / 'classes'
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', str(classes), *files], check=True)
    subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.hook.TestSystemRulesAsync'], check=True, timeout=20)
