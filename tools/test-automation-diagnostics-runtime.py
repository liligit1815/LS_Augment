"""Execute the production screen-off controller against bounded fake Android/provider services."""
from pathlib import Path
import argparse, os, shutil, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
STUBS={
'android/net/Uri.java': 'package android.net; public final class Uri {final String v;private Uri(String s){v=s;}public static Uri parse(String s){return new Uri(s);}public String toString(){return v;}}',
'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle {final Map<String,Object> v=new HashMap<>();public void putString(String k,String x){v.put(k,x);}public String getString(String k){return getString(k,null);}public String getString(String k,String d){Object x=v.get(k);return x instanceof String?(String)x:d;}public void putBoolean(String k,boolean x){v.put(k,x);}public boolean getBoolean(String k){return getBoolean(k,false);}public boolean getBoolean(String k,boolean d){Object x=v.get(k);return x instanceof Boolean?(Boolean)x:d;}public void putLong(String k,long x){v.put(k,x);}public long getLong(String k,long d){Object x=v.get(k);return x instanceof Long?(Long)x:d;}public void putInt(String k,int x){v.put(k,x);}public int getInt(String k,int d){Object x=v.get(k);return x instanceof Integer?(Integer)x:d;}}''',
'android/os/Build.java': 'package android.os;public final class Build {public static final class VERSION {public static int SDK_INT=36;}}',
'android/os/Process.java': 'package android.os;public final class Process {public static int SYSTEM_UID=1000;public static int myUid(){return 1000;}public static int myPid(){return 42;}public static long getStartElapsedRealtime(){return 100;}}',
'android/os/SystemClock.java': 'package android.os;public final class SystemClock {static long value=1000;public static long elapsedRealtimeNanos(){return ++value;}}',
'android/os/Looper.java': 'package android.os;public class Looper {}',
'android/os/HandlerThread.java': 'package android.os;public class HandlerThread {public HandlerThread(String n){}public void start(){}public Looper getLooper(){return new Looper();}}',
'android/os/Handler.java': 'package android.os;public class Handler {public Handler(Looper l){}public void post(Runnable r){r.run();}public void removeCallbacks(Runnable r){ls.augment.com.hook.AutomationHookFixture.scheduled=null;}public void postDelayed(Runnable r,long ms){ls.augment.com.hook.AutomationHookFixture.delays++;ls.augment.com.hook.AutomationHookFixture.lastDelay=ms;ls.augment.com.hook.AutomationHookFixture.scheduled=r;}}',
'android/os/PowerManager.java': 'package android.os;public class PowerManager {public boolean isInteractive(){return !ls.augment.com.hook.AutomationHookFixture.off;}}',
'android/os/UserManager.java': 'package android.os;public class UserManager {public boolean isUserUnlocked(){return ls.augment.com.hook.AutomationHookFixture.unlocked;}}',
'android/database/ContentObserver.java': 'package android.database;public class ContentObserver {public ContentObserver(android.os.Handler h){}public void onChange(boolean b){}}',
'android/content/Intent.java': 'package android.content;public class Intent {public static final String ACTION_SCREEN_ON="on",ACTION_SCREEN_OFF="off",ACTION_USER_UNLOCKED="unlock",ACTION_BOOT_COMPLETED="boot";final String action;public Intent(String a){action=a;}public String getAction(){return action;}}',
'android/content/IntentFilter.java': 'package android.content;public class IntentFilter {public void addAction(String s){}}',
'android/content/BroadcastReceiver.java': 'package android.content;public abstract class BroadcastReceiver {public abstract void onReceive(Context c,Intent i);}',
'android/content/Context.java': '''package android.content;public class Context {public static final int RECEIVER_NOT_EXPORTED=4;final ContentResolver r=new ContentResolver();public ContentResolver getContentResolver(){return r;}public <T>T getSystemService(Class<T> t){return t.cast(t==android.os.PowerManager.class?new android.os.PowerManager():new android.os.UserManager());}public void registerReceiver(BroadcastReceiver b,IntentFilter f,Object p,android.os.Handler h,int flags){}public void registerReceiver(BroadcastReceiver b,IntentFilter f,Object p,android.os.Handler h){}public void unregisterReceiver(BroadcastReceiver b){}}''',
'android/content/ContentResolver.java': '''package android.content;public class ContentResolver {public android.os.Bundle call(android.net.Uri uri,String method,String arg,android.os.Bundle extras){return ls.augment.com.hook.AutomationHookFixture.provider(method,extras);}public void registerContentObserver(android.net.Uri uri,boolean d,android.database.ContentObserver o){}public void unregisterContentObserver(android.database.ContentObserver o){}}''',
'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public class BuildConfig {public static final String VERSION_NAME="fixture";}',
'ls/augment/com/ConfigSchema.java': 'package ls.augment.com;public class ConfigSchema {public static final String HIDE_MASTER="master",AUTOMATION_ENABLED="automatic";public static boolean truthy(String s){return "1".equals(s);}}',
'ls/augment/com/ConfigSnapshot.java': '''package ls.augment.com;public class ConfigSnapshot {public final int schemaVersion=1;public final long revision=2,updatedAt=3;public final String scope="device",checksum="checksum";public static ConfigSnapshot parse(String raw){return "good".equals(raw)?new ConfigSnapshot():null;}public String get(String k){return "master".equals(k)||ls.augment.com.hook.AutomationHookFixture.enabled?"1":"0";}}''',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import android.content.Context;public class FeatureSettings {static void diagnostic(Context c,String key,String value){if(ls.augment.com.AutomationDiagnosticState.OWNER_KEY.equals(key)){AutomationHookFixture.owner=ls.augment.com.AutomationDiagnosticState.Update.parse(value);if(AutomationHookFixture.owner==null)throw new AssertionError("invalid state wire");}}}'''
}
FIXTURE=r'''package ls.augment.com.hook;
import android.content.*;import android.os.Bundle;import java.lang.reflect.*;import java.util.*;
public final class AutomationHookFixture {
 public static boolean off=true,enabled,unlocked=true;public static int delays,actualCalls,queries,checks,snapshotReads;
 public static long lastDelay;public static Runnable scheduled;
 public static ls.augment.com.AutomationDiagnosticState.Update owner;
 static String mode="success";static Bundle snapshot;static Object controller;static Method refresh,verify;
 static String activeRequest,activeEpoch;static final List<String> requests=new ArrayList<>(),epochs=new ArrayList<>();
 static void check(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
 static Bundle good(){Bundle b=new Bundle();b.putBoolean("ok",true);b.putString("snapshot","good");b.putInt("schemaVersion",1);b.putLong("revision",2);b.putLong("updatedAt",3);b.putString("scope","device");b.putString("checksum","checksum");return b;}
 static Bundle reply(String request,String outcome){Bundle b=new Bundle();b.putInt("protocol",1);b.putString("requestId",request);b.putString("outcome",outcome);b.putBoolean("ok","SUCCEEDED".equals(outcome));return b;}
 public static Bundle provider(String method,Bundle extras){
  if("snapshot".equals(method)){snapshotReads++;return snapshot;}
  if("automation_execute".equals(method)){actualCalls++;activeRequest=extras.getString("requestId");activeEpoch=extras.getString("screenEpoch");requests.add(activeRequest);epochs.add(activeEpoch);return "lost".equals(mode)?null:reply(activeRequest,"failed".equals(mode)?"FAILED":"SUCCEEDED");}
  if("automation_query".equals(method)){queries++;check(activeRequest.equals(extras.getString("requestId")),"uncertain request ID remains stable");return "query_success".equals(mode)?reply(activeRequest,"SUCCEEDED"):"query_failed".equals(mode)?reply(activeRequest,"FAILED"):reply(activeRequest,"UNKNOWN_REQUEST");}
  throw new AssertionError(method);
 }
 static void run()throws Exception {try{refresh.invoke(controller,"fixture_event");}catch(InvocationTargetException e){throw new AssertionError(e.getCause());}}
 static void newEpoch(Context c)throws Exception {Field f=controller.getClass().getDeclaredField("receiver");f.setAccessible(true);((BroadcastReceiver)f.get(controller)).onReceive(c,new Intent(Intent.ACTION_SCREEN_ON));}
 public static void main(String[] args)throws Exception {
  snapshot=good();Context c=new Context();ScreenOffAutomationHook.attach(c);
  Field f=ScreenOffAutomationHook.class.getDeclaredField("controller");f.setAccessible(true);controller=f.get(null);
  refresh=controller.getClass().getDeclaredMethod("refreshAndRun",String.class);refresh.setAccessible(true);
  verify=controller.getClass().getDeclaredMethod("verifiedSnapshot",Bundle.class);verify.setAccessible(true);
  check(actualCalls==0&&"READY".equals(owner.bridge)&&"disabled".equals(owner.runtime),"valid disabled snapshot does not execute");
  check(verify.invoke(null,good())!=null,"complete snapshot accepted");
  for(String key:new String[]{"ok","snapshot","schemaVersion","revision","updatedAt","scope","checksum"}){
   Bundle bad=good();if("ok".equals(key))bad.putBoolean(key,false);else if("schemaVersion".equals(key))bad.putInt(key,7);else if("revision".equals(key)||"updatedAt".equals(key))bad.putLong(key,99);else bad.putString(key,"bad");
   check(verify.invoke(null,bad)==null,"invalid envelope rejected: "+key);snapshot=bad;run();check(actualCalls==0&&"FAILED".equals(owner.bridge),"bad snapshot never dispatches: "+key);
  }
  check(verify.invoke(null,new Object[]{null})==null,"null snapshot rejected");
  snapshot=good();run();check("READY".equals(owner.bridge)&&owner.bridgeError.isEmpty()&&!owner.lastBridgeError.isEmpty(),"closed feature recovers bridge and retains failure history");
  check(scheduled==null,"verified disabled snapshot cancels stale bridge retry");
  int reads=snapshotReads;unlocked=false;run();
  check(snapshotReads==reads&&"WAITING_FOR_UNLOCK".equals(owner.bridge)&&owner.bridgeError.isEmpty(),"locked user waits without querying credential-protected Provider or recording a bridge failure");
  check(scheduled!=null&&lastDelay==1000,"unlock wait schedules bounded retry");
  unlocked=true;snapshot=null;
  for(int i=0;i<12;i++){run();check(scheduled!=null&&lastDelay<=30000,"configuration outage continues retry with capped backoff");}
  check(lastDelay==30000&&actualCalls==0,"long configuration outage never spends operation retry budget");
  snapshot=good();run();check("READY".equals(owner.bridge)&&scheduled==null,"configuration recovers after more than six failures");
  enabled=true;mode="lost";run();check(actualCalls==1&&"unknown".equals(owner.runtime),"lost execution reply becomes unknown");
  String uncertainRequest=activeRequest;snapshot=null;
  for(int i=0;i<9;i++)run();
  check(actualCalls==1&&queries==0&&uncertainRequest.equals(activeRequest),"configuration outage after uncertain dispatch never replays actual operation");
  snapshot=good();run();check(actualCalls==1&&queries==1,"bridge recovery queries the existing uncertain request");
  for(int i=0;i<8;i++)run();check(actualCalls==1&&queries==9,"unknown replies only query; no repeated actual operation");
  mode="query_success";run();check(actualCalls==1&&"handled".equals(owner.runtime),"query confirms success without replay");run();check(actualCalls==1,"same screen epoch remains handled");
  newEpoch(c);check(actualCalls==1&&"waiting_screen_off".equals(owner.runtime),"screen-on broadcast cannot dispatch during PowerManager transition");mode="failed";run();check(actualCalls==2,"next screen epoch may execute");
  String retryEpoch=activeEpoch;run();check(actualCalls==3&&!requests.get(1).equals(requests.get(2))&&retryEpoch.equals(activeEpoch),"explicit failure retries with new attempt and stable screen epoch");
  for(int i=0;i<8;i++)run();check(actualCalls==8,"confirmed failure retry is bounded to initial plus six attempts");
  newEpoch(c);mode="lost";run();int before=actualCalls;mode="query_failed";run();check(actualCalls==before,"query first confirms failed request");mode="success";run();check(actualCalls==before+1,"only confirmed query failure permits next attempt");run();check(actualCalls==before+1,"success blocks another operation");
  enabled=false;run();check("disabled".equals(owner.runtime),"disable is runtime state, not an invented execution success");
  System.out.println("PASS production ScreenOffAutomationHook "+checks+" checks; actual attempts="+actualCalls+"; readonly queries="+queries);
 }
}'''

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--jdk',type=Path,help='JDK root directory; defaults to JAVA_HOME or javac/java on PATH')
    args=parser.parse_args()
    jdk=args.jdk or (Path(os.environ['JAVA_HOME']) if os.environ.get('JAVA_HOME') else None)
    suffix='.exe' if os.name=='nt' else ''
    if jdk is not None:
        javac=str(jdk/'bin'/('javac'+suffix));java=str(jdk/'bin'/('java'+suffix))
        if not Path(javac).is_file() or not Path(java).is_file():
            parser.error(f'JDK tools not found under {jdk}/bin; pass --jdk or set JAVA_HOME to a JDK root')
    else:
        javac=shutil.which('javac');java=shutil.which('java')
        if not javac or not java:
            parser.error('JDK required; pass --jdk, set JAVA_HOME, or put javac and java on PATH')
    with tempfile.TemporaryDirectory(prefix='lsa-automation-host-') as tmp:
        base=Path(tmp); sources=[]
        for name,body in STUBS.items():
            path=base/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(body,encoding='utf-8');sources.append(path)
        fixture=base/'ls/augment/com/hook/AutomationHookFixture.java';fixture.write_text(FIXTURE,encoding='utf-8');sources.append(fixture)
        sources += [ROOT/'android/app/src/main/java/ls/augment/com/hook/ScreenOffAutomationHook.java', ROOT/'android/app/src/main/java/ls/augment/com/ScreenAutomationPolicy.java',ROOT/'android/app/src/main/java/ls/augment/com/AutomationDiagnosticState.java']
        subprocess.run([javac,'-encoding','UTF-8','-d',str(base/'classes'),*map(str,sources)],check=True,cwd=ROOT)
        subprocess.run([java,'-cp',str(base/'classes'),'ls.augment.com.hook.AutomationHookFixture'],check=True,cwd=ROOT)

if __name__=='__main__':main()
