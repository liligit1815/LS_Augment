"""Exercise the production clock hook with service/configuration lifecycle and missing contracts."""
from pathlib import Path
import os, subprocess, tempfile

ROOT = Path(__file__).resolve().parents[1]
files = {
 'android/os/Looper.java': 'package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}',
 'android/os/Handler.java': '''package android.os;import java.util.*;public class Handler {
 static final List<Runnable> jobs=new ArrayList<>();public Handler(Looper l){}public void post(Runnable r){jobs.add(r);}
 public void removeCallbacks(Runnable r){jobs.removeIf(x->x==r);}public static void flush(){while(!jobs.isEmpty())jobs.remove(0).run();}}''',
 'android/database/ContentObserver.java':'package android.database;public class ContentObserver {public ContentObserver(android.os.Handler h){}public void onChange(boolean b){}}',
 'android/content/ContentResolver.java':'''package android.content;public class ContentResolver {public int observers;
 public void registerContentObserver(Object uri,boolean b,android.database.ContentObserver o){observers++;}
 public void unregisterContentObserver(android.database.ContentObserver o){observers--;}}''',
 'android/content/Context.java':'''package android.content;public class Context {public final ContentResolver resolver=new ContentResolver();
 public static final int RECEIVER_EXPORTED=2;public BroadcastReceiver receiver;public String requiredPermission;
 public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,String permission,android.os.Handler h,int flags){receiver=r;requiredPermission=permission;return null;}
 public void unregisterReceiver(BroadcastReceiver r){if(receiver==r)receiver=null;}
 public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}}''',
 'android/content/Intent.java':'''package android.content;public class Intent {private final String action;public Intent(String a){action=a;}public String getAction(){return action;}}''',
 'android/content/IntentFilter.java':'package android.content;public class IntentFilter {public IntentFilter(String a){}}',
 'android/content/BroadcastReceiver.java':'package android.content;public abstract class BroadcastReceiver {public abstract void onReceive(Context c,Intent i);}',
 'android/app/Service.java':'''package android.app;public class Service extends android.content.Context {public void onCreate(){}public void onDestroy(){}}''',
 'android/provider/Settings.java':'''package android.provider;public class Settings {public static class System {
 public static int value=1;public static int getInt(android.content.ContentResolver r,String k,int d){return value;}
 public static Object getUriFor(String k){return k;}}}''',
 'ls/augment/com/ConfigSchema.java':'package ls.augment.com;public class ConfigSchema {public static final String NATIVE_ISLAND_SELECTED="native";}',
 'ls/augment/com/NativeIslandSceneOptions.java':'package ls.augment.com;public class NativeIslandSceneOptions {public static final String ENABLED="master";public static String key(String id){return id;}}',
 'ls/augment/com/SystemUiOptions.java':'package ls.augment.com;public class SystemUiOptions {public static final String ISLAND="duo";}',
 'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import java.util.*;import android.content.Context;
 class FeatureSettings {static final Map<String,Boolean> values=new HashMap<>();static final List<Runnable> listeners=new ArrayList<>();
 static boolean enabled(Context c,String k){return values.getOrDefault(k,false);}static void diagnostic(Context c,String k,String v){}
 static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}static void removeSnapshotListener(Runnable r){listeners.remove(r);}
 static void change(String k,boolean b){values.put(k,b);for(Runnable r:new ArrayList<>(listeners))r.run();android.os.Handler.flush();}}''',
 'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
 class AugmentModule {static final Map<Method,Callback> hooks=new HashMap<>();int errors;
 interface Callback {Object run(Chain chain)throws Throwable;}
 static class Chain {Method method;Object receiver;Object[] args;Chain(Method m,Object r,Object[] a){method=m;receiver=r;args=a;}
 Object proceed(Object[] a)throws Throwable{return method.invoke(receiver,a);}Object getThisObject(){return receiver;}List<Object> getArgs(){return Arrays.asList(args);}}
 static class Hook {Method method;Hook(Method m){method=m;}Hook intercept(Callback c){hooks.put(method,c);return this;}}
 Hook prepareFeatureHook(Method m,String id,boolean b){return new Hook(m);}void registerFeatureHook(Hook h){}
 void logFeatureInfo(String s){}void logFeatureError(String s,Throwable e){errors++;}
 static Object invoke(Object target,Class<?> type,String name,Class<?>[] signature,Object...args)throws Throwable {
 Method m=type.getMethod(name,signature);Callback c=hooks.get(m);return c==null?m.invoke(target,args):c.run(new Chain(m,target,args));}}
 ''',
 'zte/com/cn/utils/FeatureUtils.java':'''package zte.com.cn.utils;public class FeatureUtils {public static boolean nativeOn,full;
 public static Boolean isSupportLiveIsland(){return nativeOn;}public static Boolean isSupportLiveIslandFullScreen(){return full;}}''',
 'zte/com/cn/timer/CountdownCount.java':'''package zte.com.cn.timer;public class CountdownCount {
 public int state=2;public int getState(){return state;}public String getTimeStrFromSurfaceView(){return "00:01:00";}}''',
 'zte/com/cn/timer/LiveIslandManager.java':'''package zte.com.cn.timer;import android.content.Context;public class LiveIslandManager {
 public static int status=-1;public static String text;public static void updateCountdownStatus(Context c,int n){status=n;}
 public static void updateCountdownCount(Context c,String s){text=s;}}''',
 'zte/com/cn/timer/CountdownNotificationService.java':'''package zte.com.cn.timer;import android.content.Context;
 public class CountdownNotificationService extends android.app.Service {
 public CountdownCount mCountdownCount=new CountdownCount();public int syncs,cancels,arrivals;
 public void updateLiveIslandStateByCountdownStatus(){syncs++;LiveIslandManager.updateCountdownStatus(this,mCountdownCount.state==2?1:mCountdownCount.state==3?2:0);}
 public void cancelTimer(){cancels++;}public void updateLiveIslandState4SystemUI(Context c,int n){}
 public void arriveLiveIsland(Context c,int n){arrivals++;}}
 ''',
 'ls/augment/com/hook/TestClockSource.java':'''package ls.augment.com.hook;
 import zte.com.cn.timer.*;import zte.com.cn.utils.FeatureUtils;import android.os.Handler;import android.content.Context;
 public class TestClockSource {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static final Class<?>[] NONE=new Class<?>[0];
 static boolean gate()throws Throwable{return (Boolean)AugmentModule.invoke(null,FeatureUtils.class,"isSupportLiveIsland",NONE);}
 static CountdownNotificationService create()throws Throwable {CountdownNotificationService s=new CountdownNotificationService();
 AugmentModule.invoke(s,CountdownNotificationService.class,"onCreate",NONE);Handler.flush();return s;}
 public static class WrongService extends android.app.Service {public String mCountdownCount;}
 public static class InheritedService extends CountdownNotificationService {public void cancelTimer(String wrong){throw new AssertionError();}}
 static class FixtureLoader extends ClassLoader {final Class<?> replacement;FixtureLoader(Class<?> r){super(TestClockSource.class.getClassLoader());replacement=r;}
 @Override public Class<?> loadClass(String name)throws ClassNotFoundException{return name.equals("zte.com.cn.timer.CountdownNotificationService")?replacement:super.loadClass(name);}}
 public static void main(String[]args)throws Throwable {
 AugmentModule module=new AugmentModule();NativeIslandClockSource.install(module,TestClockSource.class.getClassLoader());
 check(module.errors==0&&AugmentModule.hooks.size()==4,"all contracts checked before hooks installed");
 CountdownNotificationService s=create();check(!gate()&&s.syncs==0,"default does not enable publisher");
 FeatureSettings.change("countdown",true);FeatureSettings.change("master",true);check(!gate(),"native mode required");
 FeatureSettings.change("native",true);check(gate()&&s.syncs==1,"enable republishes existing real model");
 FeatureSettings.change("countdown",true);check(s.syncs==1,"same configuration does not restart publisher");
 int before=s.cancels;AugmentModule.invoke(s,CountdownNotificationService.class,"arriveLiveIsland",new Class<?>[]{Context.class,int.class},s,1);
 check(s.cancels==before+1&&s.arrivals==1,"duplicate run retires previous island task before scheduling");
 FeatureSettings.change("countdown",false);check(!gate()&&LiveIslandManager.status==0&&"0".equals(LiveIslandManager.text),"off withdraws source and count");
 check(s.syncs==1,"off never resumes timer");FeatureSettings.change("countdown",true);check(s.syncs==2,"reenable reconciles current model once");
 FeatureSettings.change("duo",true);check(!gate(),"Duo engine excludes native completion");FeatureSettings.change("duo",false);
 android.provider.Settings.System.value=0;check(!gate(),"system native switch respected");android.provider.Settings.System.value=1;
 FeatureUtils.full=true;check(!gate(),"full-screen producer retained");FeatureUtils.full=false;
 AugmentModule.invoke(s,CountdownNotificationService.class,"onDestroy",NONE);Handler.flush();
 check(FeatureSettings.listeners.isEmpty()&&s.resolver.observers==0,"destroy releases every listener");
 check(LiveIslandManager.status==0,"destroy clears owned state");
 AugmentModule.hooks.clear();FeatureUtils.nativeOn=true;NativeIslandClockSource.install(module,TestClockSource.class.getClassLoader());
 CountdownNotificationService nativeService=create();check(gate()&&nativeService.syncs==0&&nativeService.cancels==0,"native publisher left intact");
 AugmentModule.invoke(nativeService,CountdownNotificationService.class,"onDestroy",NONE);check(nativeService.cancels==0,"native publisher not cancelled on destroy");
 check(NativeIslandSceneContract.method(InheritedService.class,"cancelTimer",void.class).getDeclaringClass()==CountdownNotificationService.class,
 "inherited signature accepted and wrong overload ignored");
 check(NativeIslandSceneContract.field(WrongService.class,"mCountdownCount",CountdownCount.class)==null,
 "wrong model rejected by the production contract before installation");
 AugmentModule.hooks.clear();FeatureUtils.nativeOn=false;NativeIslandClockSource.install(module,TestClockSource.class.getClassLoader());
 CountdownNotificationService recovering=create();recovering.mCountdownCount.state=3;
 check("android.permission.STATUS_BAR_SERVICE".equals(recovering.requiredPermission),"only platform-authorized senders can request synchronization");
 recovering.receiver.onReceive(recovering,new android.content.Intent(NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION));
 check(LiveIslandManager.status==2&&recovering.mCountdownCount.state==3,"SystemUI restart republishes actual pause without starting timer");
 int syncs=recovering.syncs;recovering.receiver.onReceive(recovering,new android.content.Intent("other"));
 check(recovering.syncs==syncs,"unrelated action cannot resync");
 FeatureSettings.change("countdown",false);recovering.receiver.onReceive(recovering,new android.content.Intent(NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION));
 check(recovering.syncs==syncs&&LiveIslandManager.status==0,"disabled scene cannot be restored by queued recovery request");
 FeatureSettings.change("countdown",true);recovering.mCountdownCount.state=0;
 recovering.receiver.onReceive(recovering,new android.content.Intent(NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION));
 check(LiveIslandManager.status==0,"completed timer is never revived from stale provider state");
 android.content.BroadcastReceiver old=recovering.receiver;AugmentModule.invoke(recovering,CountdownNotificationService.class,"onDestroy",NONE);
 syncs=recovering.syncs;old.onReceive(recovering,new android.content.Intent(NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION));
 check(recovering.receiver==null&&recovering.syncs==syncs,"destroy unregisters receiver and retires queued callbacks");
 System.out.println("PASS native clock source: "+checks+" checks");}}
 '''
}
with tempfile.TemporaryDirectory(prefix='duo-native-clock-') as folder:
    sources=[]
    for name, content in files.items():
        path=Path(folder)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8');sources.append(str(path))
    sources += [str(ROOT/'android/app/src/main/java/ls/augment/com/hook'/name) for name in ['NativeIslandClockSource.java','NativeIslandSceneContract.java','NativeIslandScenePolicy.java']]
    java=Path(os.environ['JAVA_HOME'])/'bin';suffix='.exe' if os.name=='nt' else ''
    subprocess.run([str(java/('javac'+suffix)),'-encoding','UTF-8','-d',folder,*sources],check=True)
    subprocess.run([str(java/('java'+suffix)),'-cp',folder,'ls.augment.com.hook.TestClockSource'],check=True)
