"""Exercise the production MTP startup hook across configuration/lifecycle races."""
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
sources = {
 'android/content/Context.java': 'package android.content; public class Context {}',
 'android/content/Intent.java': '''package android.content; public class Intent {
 public boolean unlocked,ptp; public Intent(){} public Intent(Intent x){unlocked=x.unlocked;ptp=x.ptp;}}''',
 'android/os/SystemClock.java': 'package android.os; public class SystemClock {public static long now; public static long elapsedRealtime(){return now;}}',
 'android/os/Looper.java': 'package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}',
 'android/os/Handler.java': '''package android.os; import java.util.*; public class Handler {
 public static List<Runnable> queue=new ArrayList<>(); public Handler(Looper l){}
 public void post(Runnable r){queue.add(r);} public void postDelayed(Runnable r,long t){queue.add(r);}
 public void removeCallbacks(Runnable r){queue.removeIf(x->x==r);}
 public static void tick(){List<Runnable> copy=new ArrayList<>(queue);queue.clear();for(Runnable r:copy)r.run();}}''',
 'android/app/Service.java': '''package android.app; import android.content.*; import ls.augment.com.hook.OemHooks;
 public class Service extends Context {public static final int START_REDELIVER_INTENT=3;
 public int starts,flags,startId,destroys; public Intent last;
 public int onStartCommand(Intent i,int f,int id){return (Integer)OemHooks.call(this,"onStartCommand",i,f,id);}
 public void onDestroy(){OemHooks.call(this,"onDestroy");}}
 ''',
 'ls/augment/com/hook/AugmentModule.java': 'package ls.augment.com.hook; class AugmentModule {}',
 'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook; import android.content.Context;
 class FeatureSettings {static boolean ready;static String diagnostic="";
 static boolean hasVerifiedSnapshot(Context c){return ready;}
 static void diagnostic(Context c,String k,String v){diagnostic=v;}}''',
 'ls/augment/com/hook/OemHooks.java': '''package ls.augment.com.hook; import java.util.*; import android.app.Service; import android.content.Intent;
 public class OemHooks {interface Action{Object invoke(Chain c)throws Throwable;}static Map<String,Action> hooks=new HashMap<>();
 static int methods(AugmentModule m,ClassLoader l,String type,String name,Class<?> r,int argc,String key,Action a){hooks.put(name,a);return 1;}
 public static Object call(Service a,String n,Object...args){try{return hooks.get(n).invoke(new Chain(a,n,args));}
 catch(RuntimeException e){throw e;}catch(Throwable e){throw new AssertionError(e);}}
 static class Chain{Service owner;String method;Object[] args;Chain(Service a,String m,Object[] x){owner=a;method=m;args=x;}
 Object getThisObject(){return owner;} Object getArg(int i){return args[i];}Object proceed(){
 if(method.equals("onDestroy")){owner.destroys++;return null;}
 owner.starts++;owner.last=(Intent)args[0];owner.flags=(Integer)args[1];owner.startId=(Integer)args[2];return 3;}}}''',
 'ls/augment/com/hook/MtpStartupTest.java': '''package ls.augment.com.hook;
 import android.app.*;import android.content.*;import android.os.*;
 public class MtpStartupTest {
 static void check(boolean v,String m){if(!v)throw new AssertionError(m);}
 static void reset(){FeatureSettings.ready=false;Handler.queue.clear();SystemClock.now=0;}
 public static void main(String[] x){MtpStartupHook.install(new AugmentModule(),MtpStartupTest.class.getClassLoader());
 reset();Service a=new Service();Intent i=new Intent();i.unlocked=true;
 check(a.onStartCommand(i,7,12)==3&&a.starts==0,"cold start must defer without blocking/redelivery change");
 Handler.tick();check(a.starts==0,"unverified settings published storage");
 i.unlocked=false;FeatureSettings.ready=true;Handler.tick();
 check(a.starts==1&&a.last.unlocked&&a.flags==7&&a.startId==12,"saved intent/flags/id not preserved");
 Handler.tick();check(a.starts==1,"duplicate start");a.onDestroy();
 reset();a=new Service();a.onStartCommand(new Intent(),1,1);a.onDestroy();FeatureSettings.ready=true;Handler.tick();
 check(a.starts==0&&a.destroys==1,"disconnect/destroy resurrected service");
 reset();a=new Service();a.onStartCommand(new Intent(),1,1);Intent latest=new Intent();latest.ptp=true;
 a.onStartCommand(latest,2,2);FeatureSettings.ready=true;Handler.tick();
 check(a.starts==1&&a.last.ptp&&a.flags==2&&a.startId==2,"newer connection mode did not supersede pending request");a.onDestroy();
 reset();a=new Service();a.onStartCommand(new Intent(),0,1);SystemClock.now=2001;Handler.tick();
 check(a.starts==1&&FeatureSettings.diagnostic.equals("configuration_timeout_native_fallback"),"timeout failed native fallback");a.onDestroy();
 reset();FeatureSettings.ready=true;a=new Service();i=new Intent();a.onStartCommand(i,3,4);
 check(a.starts==1&&a.last==i&&Handler.queue.isEmpty(),"warm saved configuration should proceed directly");
 reset();a=new Service();a.onStartCommand(new Intent(),0,1);FeatureSettings.ready=true;a.onStartCommand(i,3,4);Handler.tick();
 check(a.starts==1&&a.last==i,"ready callback did not cancel older request");
 reset();a=new Service();a.onStartCommand(null,0,1);check(a.starts==1&&Handler.queue.isEmpty(),"null native intent changed");
 System.out.println("MTP startup passed: cold/warm, intent preservation, supersession, destroy, timeout, exact-once and null passthrough");}}
 '''
}
with tempfile.TemporaryDirectory(prefix='ls-mtp-startup-') as directory:
    base = Path(directory)
    for name, content in sources.items():
        file = base/name; file.parent.mkdir(parents=True, exist_ok=True); file.write_text(content, encoding='utf-8')
    source = ROOT/'android/app/src/main/java/ls/augment/com/hook/MtpStartupHook.java'
    subprocess.run([str(JAVA/'javac.exe'), '-encoding', 'UTF-8', '-d', str(base), str(source), *map(str,base.rglob('*.java'))],check=True)
    subprocess.run([str(JAVA/'java.exe'), '-cp', str(base), 'ls.augment.com.hook.MtpStartupTest'],check=True)
