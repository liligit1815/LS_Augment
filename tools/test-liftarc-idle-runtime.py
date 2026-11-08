"""Exercise production idle gates and diagnostic transitions with offline Android facades."""
from pathlib import Path
import subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
HOOK=ROOT/'android/app/src/main/java/ls/augment/com/hook'
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')

def method(text,marker):
    start=text.index(marker);end=text.index('{',start)+1;depth=1
    while depth:
        depth+=(text[end]=='{')-(text[end]=='}');end+=1
    return text[start:end]

files={
'android/content/Context.java':'package android.content;public class Context{public Object getContentResolver(){return this;}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long elapsedRealtime(){return 123;}}',
'android/os/Process.java':'package android.os;public class Process{public static int myPid(){return 42;}}',
'android/os/Looper.java':'package android.os;public class Looper{static final Looper MAIN=new Looper();public static boolean worker;public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return worker?null:MAIN;}}',
'android/os/Handler.java':'package android.os;public class Handler{public Handler(Looper l){}public boolean post(Runnable r){r.run();return true;}public boolean postDelayed(Runnable r,long delay){return true;}}',
'android/provider/Settings.java':'package android.provider;public class Settings{public static class Global{public static String BOOT_COUNT="boot";public static int getInt(Object c,String k,int d){return 2;}}}',
'org/json/JSONException.java':'package org.json;public class JSONException extends Exception{}',
'org/json/JSONObject.java':'''package org.json;public class JSONObject{
public static int built;java.util.Map<String,Object> data=new java.util.LinkedHashMap<>();public JSONObject(){built++;}
public JSONObject put(String k,Object v)throws JSONException{data.put(k,v);return this;}public String toString(){return data.toString();}}''',
'ls/augment/com/BuildConfig.java':'package ls.augment.com;public class BuildConfig{public static int VERSION_CODE=20745;public static String VERSION_NAME="test";}',
'ls/augment/com/ConfigSnapshot.java':'package ls.augment.com;public class ConfigSnapshot{public long revision=1;public String checksum="a";}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;class FeatureSettings{
static final ls.augment.com.ConfigSnapshot snap=new ls.augment.com.ConfigSnapshot();static String status="";
static ls.augment.com.ConfigSnapshot snapshot(android.content.Context c){return snap;}
static void diagnostic(android.content.Context c,String k,String v){if(k.endsWith("status"))status=v;}
static void diagnosticError(android.content.Context c,String k,String s,Throwable e){}}''',
'ls/augment/com/hook/LiftArcLog.java':'package ls.augment.com.hook;class LiftArcLog{static boolean e(String s,Throwable t){return true;}}',
'ls/augment/com/hook/LiftArcConfig.java':'''package ls.augment.com.hook;class LiftArcConfig{
static final String PREFIX="liftarc_";boolean requested,enabled,ready=true;void pause(){enabled=false;}void refreshEffective(){}
boolean isReady(){return ready;}void bind(android.content.Context c){}}''',
}
controller=(HOOK/'LiftArcController.java').read_text('utf-8')
files['ls/augment/com/hook/LiftArcController.java']='''package ls.augment.com.hook;
import android.os.Looper;
class LiftArcController{
static LiftArcController sInstance;static int sKeyguardState=-1;static boolean sDozing,sBouncerShowing;
static int syncs;Object overlay=new Object();Window window=new Window();
static class Window{android.content.Context c=new android.content.Context();android.content.Context getContext(){return c;}void post(Runnable r){r.run();}}
static LiftArcController obtain(Object w,LiftArcConfig c,Object m){return sInstance!=null&&sInstance.window==w?sInstance:null;}
void ensureInstalled(){overlay=new Object();}void sync(){syncs++;}
'''+ '\n'.join(method(controller,marker) for marker in ['static void onWindowTouchPost(', 'static void onKeyguardState(', 'static void onDozing(', 'static void onBouncer('])+'}'
files['ls/augment/com/hook/LiftArcRuntime.java']=(HOOK/'LiftArcRuntime.java').read_text('utf-8')
files['ls/augment/com/hook/TestIdle.java']='''package ls.augment.com.hook;
public class TestIdle{
static int checks;static void check(boolean v,String message){checks++;if(!v)throw new AssertionError(message);}
public static void main(String[] args)throws Exception{
LiftArcConfig config=new LiftArcConfig();android.content.Context context=new android.content.Context();
LiftArcRuntime.bind(config,context);Thread.sleep(100);LiftArcRuntime.installed(true);LiftArcRuntime.views(true);LiftArcRuntime.unlockReady(true);
int built=org.json.JSONObject.built;
for(int i=0;i<10000;i++){LiftArcRuntime.bind(config,context);LiftArcRuntime.views(true);LiftArcRuntime.unlockReady(true);}
check(org.json.JSONObject.built==built,"stable touch/state callbacks allocate no diagnostic JSON");
config.enabled=true;LiftArcRuntime.publish();check(FeatureSettings.status.contains("state=ready"),"configuration change still publishes ready");
LiftArcRuntime.views(false);check(FeatureSettings.status.contains("state=disabled"),"view loss publishes immediately");
var heartbeat=LiftArcRuntime.class.getDeclaredMethod("publish",boolean.class);heartbeat.setAccessible(true);built=org.json.JSONObject.built;heartbeat.invoke(null,true);
check(org.json.JSONObject.built==built+1,"heartbeat still emits current process witness");
LiftArcController c=new LiftArcController();LiftArcController.sInstance=c;config.enabled=false;
LiftArcController.onKeyguardState(false,false);int syncs=LiftArcController.syncs;
for(int i=0;i<10000;i++){LiftArcController.onWindowTouchPost(c.window,config);LiftArcController.onKeyguardState(false,false);LiftArcController.onDozing(false);LiftArcController.onBouncer(false);}
check(LiftArcController.syncs==syncs,"inactive native drags do not resync effect");
LiftArcController.onDozing(true);LiftArcController.onDozing(false);LiftArcController.onBouncer(true);LiftArcController.onBouncer(false);
LiftArcController.onKeyguardState(true,false);android.os.Looper.worker=true;LiftArcController.onKeyguardState(true,true);android.os.Looper.worker=false;
check(LiftArcController.syncs==syncs+6,"all real state transitions including worker callback synchronize");
config.ready=false;LiftArcController.onWindowTouchPost(c.window,config);check(LiftArcController.syncs==syncs+7,"unavailable configuration retains retry");
config.ready=true;config.requested=config.enabled=true;LiftArcController.onWindowTouchPost(c.window,config);check(LiftArcController.syncs==syncs+8,"enabled effect keeps native touch synchronization");
config.requested=config.enabled=false;c.overlay=null;LiftArcController.onWindowTouchPost(c.window,config);check(c.overlay!=null,"missing overlay still initializes");
System.out.println("PASS LiftArc idle/enable/unknown/state/heartbeat: "+checks+" checks; offline facades");}}
'''
with tempfile.TemporaryDirectory(prefix='duo-lift-idle-') as folder:
    work=Path(folder);sources=[]
    for name,text in files.items():
        p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,'utf-8');sources.append(str(p))
    subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*sources],check=True)
    subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestIdle'],check=True)
