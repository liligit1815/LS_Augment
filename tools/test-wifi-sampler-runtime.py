"""Exercise the production OEM sampler guard with real Java thread lifecycles."""
from pathlib import Path
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
base = runpy.run_path(str(ROOT / 'tools/test-launcher-new-apps-runtime.py'))
module = base['COMMON']['ls/augment/com/hook/AugmentModule.java'].replace(
    'final Map<Method,Hook>', 'boolean deoptimize(Method m){return true;} void logFeatureInfo(String s){} final Map<Method,Hook>')
sources = {
    'ls/augment/com/hook/AugmentModule.java': module,
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;class FeatureSettings {
        static int reports;static Object from(Object c){return c;}static void diagnostic(Object c,String k,String v){reports++;}}''',
    'android/os/Looper.java': '''package android.os;public class Looper {
        final Thread thread;public Looper(Thread t){thread=t;}public Thread getThread(){return thread;}
        public boolean isCurrentThread(){return Thread.currentThread()==thread;}}''',
    'android/os/Handler.java': '''package android.os;public class Handler {final Looper looper;
        public Handler(Looper l){looper=l;}public Looper getLooper(){return looper;}}''',
    'android/os/HandlerThread.java': '''package android.os;public class HandlerThread extends Thread {
        public final Looper retained=new Looper(this);final java.util.concurrent.CountDownLatch stop=new java.util.concurrent.CountDownLatch(1);
        public void run(){try{stop.await();}catch(InterruptedException ignored){}}
        public Looper getLooper(){return isAlive()?retained:null;}public void finish()throws InterruptedException{stop.countDown();join();}}''',
    'com/android/server/SystemService.java': 'package com.android.server;public class SystemService {}',
    'com/android/server/SystemServiceManager.java': '''package com.android.server;public class SystemServiceManager {
        public SystemService startServiceFromJar(String a,String b){return new com.android.server.wifi.WifiService();}}''',
    'com/android/server/wifi/WifiService.java': 'package com.android.server.wifi;public class WifiService extends com.android.server.SystemService {}',
    'com/android/server/wifi/WifiSpeedTestLowLatencyController.java': '''package com.android.server.wifi;
        public class WifiSpeedTestLowLatencyController {
            public android.os.HandlerThread mSampleThread;public android.os.Handler mSampleHandler;
            public int calls;public boolean fail,race;
            public boolean isOnSampleThread()throws Exception{calls++;if(race)mSampleThread.finish();
                if(fail)throw new NullPointerException("unrelated");return mSampleThread.getLooper().isCurrentThread();}
            public void runOnSampleThread(Runnable r){} }
    ''',
    'ls/augment/com/hook/TestWifi.java': '''package ls.augment.com.hook;
        import android.os.*;import java.lang.reflect.*;import com.android.server.wifi.*;
        public class TestWifi {
            static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
            static class Child extends WifiSpeedTestLowLatencyController {}
            static WifiSpeedTestLowLatencyController owner(boolean child){WifiSpeedTestLowLatencyController c=child?new Child():new WifiSpeedTestLowLatencyController();
                c.mSampleThread=new HandlerThread();c.mSampleThread.start();c.mSampleHandler=new Handler(c.mSampleThread.retained);return c;}
            public static void main(String[]args)throws Throwable {
                ClassLoader loader=TestWifi.class.getClassLoader();AugmentModule m=new AugmentModule();
                ClassLoader hidden=new ClassLoader(loader){protected Class<?> loadClass(String n,boolean r)throws ClassNotFoundException{
                    if(n.endsWith("WifiSpeedTestLowLatencyController"))throw new ClassNotFoundException(n);return super.loadClass(n,r);}};
                check(WifiSampleThreadHook.install(m,hidden)==1,"APEX discovery without controller");
                Method start=com.android.server.SystemServiceManager.class.getDeclaredMethod("startServiceFromJar",String.class,String.class);
                check(m.call(new com.android.server.SystemServiceManager(),start,"wifi","apex") instanceof WifiService,"native service returned");
                Method query=WifiSpeedTestLowLatencyController.class.getDeclaredMethod("isOnSampleThread");
                check(m.hooks.containsKey(query),"service classloader installs controller");
                check(WifiSampleThreadHook.install(m,loader)==0,"duplicate install idempotent");
                Field t=WifiSpeedTestLowLatencyController.class.getDeclaredField("mSampleThread"),h=WifiSpeedTestLowLatencyController.class.getDeclaredField("mSampleHandler");
                WifiSpeedTestLowLatencyController c=owner(false);
                check(!WifiSampleThreadHook.terminated(c,t,h),"live thread unchanged");
                check(Boolean.FALSE.equals(m.call(c,query))&&c.calls==1,"healthy native query once");
                c.fail=true;boolean propagated=false;try{m.call(c,query);}catch(NullPointerException e){propagated=e.getMessage().equals("unrelated");}
                check(propagated&&c.calls==2,"unrelated healthy NPE propagated once");c.fail=false;c.mSampleThread.finish();
                check(WifiSampleThreadHook.terminated(c,t,h),"owned terminated thread proven");
                check(Boolean.FALSE.equals(m.call(c,query))&&c.calls==2,"dead thread avoids original null dereference");
                m.call(c,query);check(FeatureSettings.reports==1,"diagnostic bounded");
                WifiSpeedTestLowLatencyController child=owner(true);child.race=true;
                check(Boolean.FALSE.equals(m.call(child,query))&&child.calls==1,"exit between precheck and native query handled for subclass");
                c.mSampleHandler=new Handler(child.mSampleThread.retained);check(!WifiSampleThreadHook.terminated(c,t,h),"foreign handler rejected");
                propagated=false;try{m.call(c,query);}catch(NullPointerException e){propagated=true;}
                check(propagated&&c.calls==3,"ownership mismatch preserves native exception");
                c.mSampleHandler=null;check(!WifiSampleThreadHook.terminated(c,t,h),"null handler rejected");
                c.mSampleThread=new HandlerThread();c.mSampleHandler=new Handler(c.mSampleThread.retained);
                check(!WifiSampleThreadHook.terminated(c,t,h),"never-started thread not treated as terminated");
                c.mSampleThread=null;check(!WifiSampleThreadHook.terminated(c,t,h),"null thread rejected");
                check(!WifiSampleThreadHook.terminated(new Object(),t,h),"invalid owner rejected");
                check(m.errors.isEmpty(),"valid contract no install errors");
                System.out.println("PASS Wi-Fi sampler: "+checks+" lifecycle/ownership/exception/APEX checks");
            }}'''
}

with tempfile.TemporaryDirectory(prefix='duo-wifi-') as folder:
    path = Path(folder)
    for name, source in sources.items():
        target = path / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(source, encoding='utf-8')
    production = ROOT / 'android/app/src/main/java/ls/augment/com/hook/WifiSampleThreadHook.java'
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(path), *map(str, path.rglob('*.java')), str(production)], check=True)
    subprocess.run(['java', '-cp', str(path), 'ls.augment.com.hook.TestWifi'], check=True, timeout=30)

# Unknown OEM structures must fail before publishing any sampler hook.
for variant, controller in {
    'wrong_field': '''public android.os.HandlerThread mSampleThread;public String mSampleHandler;
        public boolean isOnSampleThread(){return false;}public void runOnSampleThread(Runnable r){}''',
    'static_query': '''public android.os.HandlerThread mSampleThread;public android.os.Handler mSampleHandler;
        public static boolean isOnSampleThread(){return false;}public void runOnSampleThread(Runnable r){}''',
    'missing_dispatch': '''public android.os.HandlerThread mSampleThread;public android.os.Handler mSampleHandler;
        public boolean isOnSampleThread(){return false;}''',
    'deopt_denied': '''public android.os.HandlerThread mSampleThread;public android.os.Handler mSampleHandler;
        public boolean isOnSampleThread(){return false;}public void runOnSampleThread(Runnable r){}''',
}.items():
    data=dict(sources)
    if variant=='deopt_denied':
        data['ls/augment/com/hook/AugmentModule.java']=module.replace('boolean deoptimize(Method m){return true;}','boolean deoptimize(Method m){return false;}')
    data['com/android/server/wifi/WifiSpeedTestLowLatencyController.java']='package com.android.server.wifi;public class WifiSpeedTestLowLatencyController {'+controller+'}'
    data['ls/augment/com/hook/TestWifi.java']='''package ls.augment.com.hook;public class TestWifi {
        public static void main(String[]args){AugmentModule m=new AugmentModule();
            WifiSampleThreadHook.install(m,TestWifi.class.getClassLoader());
            if(m.hooks.size()!=1||m.errors.size()!=1||!m.hooks.keySet().iterator().next().getName().equals("startServiceFromJar"))
                throw new AssertionError("partial sampler installed for invalid OEM contract");}}'''
    with tempfile.TemporaryDirectory(prefix='duo-wifi-invalid-') as folder:
        path=Path(folder)
        for name,source in data.items():
            target=path/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(source,encoding='utf-8')
        subprocess.run(['javac','-encoding','UTF-8','-d',str(path),*map(str,path.rglob('*.java')),str(production)],check=True)
        subprocess.run(['java','-cp',str(path),'ls.augment.com.hook.TestWifi'],check=True,timeout=30)
    print('PASS unknown Wi-Fi contract rejected:',variant)
