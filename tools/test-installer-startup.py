"""Exercise the real installer forwarding hook with deterministic lifecycle/config races."""
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
sources = {
 'android/content/Context.java': 'package android.content; public class Context {}',
 'android/content/ComponentName.java': '''package android.content; public class ComponentName {
 final String name; public ComponentName(String n){name=n;} public String getClassName(){return name;}}''',
 'android/content/Intent.java': '''package android.content; import java.util.*; public class Intent {
 public ComponentName component; public int flags; public String uri,source; public Map<String,Boolean> extras=new HashMap<>();
 public Intent(){} public Intent(Intent x){component=x.component;flags=x.flags;uri=x.uri;source=x.source;extras.putAll(x.extras);}
 public ComponentName getComponent(){return component;} public Intent putExtra(String k,boolean v){extras.put(k,v);return this;}
 public Intent setClassName(Context c,String n){component=new ComponentName(n);return this;}}''',
 'android/os/SystemClock.java': 'package android.os; public class SystemClock {public static long now; public static long elapsedRealtime(){return now;}}',
 'android/os/Looper.java': 'package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}',
 'android/os/Handler.java': '''package android.os; import java.util.*; public class Handler {
 public static List<Runnable> queue=new ArrayList<>(); public Handler(Looper l){}
 public void post(Runnable r){queue.add(r);} public void postDelayed(Runnable r,long t){queue.add(r);}
 public void removeCallbacks(Runnable r){queue.removeIf(x->x==r);}
 public static void tick(){List<Runnable> copy=new ArrayList<>(queue);queue.clear();for(Runnable r:copy)r.run();}}''',
 'android/app/Activity.java': '''package android.app; import android.content.*; import ls.augment.com.hook.OemHooks;
 public class Activity extends Context {public static final int RESULT_CANCELED=0; public boolean finished,destroyed;
 public int launches,result=9; public Intent last; public boolean fail;
 public void startActivity(Intent i){OemHooks.call(this,"startActivity",i);} public void finish(){OemHooks.call(this,"finish");}
 public void onStop(){OemHooks.call(this,"onStop");}
 public boolean isFinishing(){return finished;} public boolean isDestroyed(){return destroyed;} public void setResult(int r){result=r;}
 public void nativeStart(Intent i){if(fail)throw new SecurityException();last=i;launches++;}}
 ''',
 'com/android/packageinstaller/InstallStart.java': '''package com.android.packageinstaller;
 public class InstallStart extends android.app.Activity {public void onCreate(android.content.Intent i){startActivity(i);finish();}}''',
 'ls/augment/com/SystemOptions.java': 'package ls.augment.com; public class SystemOptions {public static String key(String s){return "ls_augment_rm_"+s;}}',
 'ls/augment/com/hook/AugmentModule.java': 'package ls.augment.com.hook; class AugmentModule {}',
 'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook; import android.content.Context;
 class FeatureSettings {static boolean ready,cts;static String diagnostic="";
 static boolean hasVerifiedSnapshot(Context c){return ready;}static boolean enabled(Context c,String k){return cts;}
 static void diagnostic(Context c,String k,String v){diagnostic=v;}}''',
 'ls/augment/com/hook/OemHooks.java': '''package ls.augment.com.hook; import java.util.*; import android.app.Activity; import android.content.Intent;
 public class OemHooks {interface Action{Object invoke(Chain c)throws Throwable;}static Map<String,Action> hooks=new HashMap<>();
 static void methods(AugmentModule m,ClassLoader l,String type,String name,Class<?> r,int argc,String key,Action a){hooks.put(name,a);}
 public static Object call(Activity a,String n,Object...args){try{return hooks.get(n).invoke(new Chain(a,n,args));}
 catch(RuntimeException e){throw e;}catch(Throwable e){throw new AssertionError(e);}}
 static class Chain{Activity owner;String method;Object[] args;Chain(Activity a,String m,Object[] x){owner=a;method=m;args=x;}
 Object getThisObject(){return owner;} Object getArg(int i){return args[i];}Object proceed(){return proceed(args);}
 Object proceed(Object[] x){if(method.equals("finish"))owner.finished=true;else if(method.equals("startActivity"))owner.nativeStart((Intent)x[0]);return null;}}}''',
 'ls/augment/com/hook/InstallerStartupTest.java': '''package ls.augment.com.hook;
 import android.app.*;import android.content.*;import android.os.*;import com.android.packageinstaller.InstallStart;
 public class InstallerStartupTest {
 static void check(boolean v,String m){if(!v)throw new AssertionError(m);}
 static Intent next(String cls){Intent i=new Intent();i.setClassName(null,"com.android.packageinstaller."+cls);
 i.flags=0x2000001;i.uri="content://owned-fixture";i.source="actual.file.provider";return i;}
 static void reset(){FeatureSettings.ready=false;FeatureSettings.cts=false;Handler.queue.clear();SystemClock.now=0;}
 public static void main(String[] x){InstallerStartupHook.install(new AugmentModule(),InstallerStartupTest.class.getClassLoader());
 reset();InstallStart a=new InstallStart();Intent original=next("InstallStaging");a.onCreate(original);
 check(a.launches==0&&!a.finished,"cold forwarding/automatic finish was not deferred");
 Handler.tick();check(a.launches==0,"unknown settings forwarded early");
 FeatureSettings.ready=true;FeatureSettings.cts=true;Handler.tick();
 check(a.launches==1&&a.finished,"ready did not forward exactly once and finish");
 check(Boolean.TRUE.equals(a.last.extras.get("isCtsInstall")),"cold CTS choice lost");
 check(a.last.flags==original.flags&&a.last.uri.equals(original.uri)&&a.last.source.equals(original.source),"source/grants/result flags changed");
 check(original.extras.isEmpty(),"native intent mutated");Handler.tick();check(a.launches==1,"duplicate forward");
 reset();a=new InstallStart();a.onCreate(next("InstallStaging"));a.finish();FeatureSettings.ready=true;Handler.tick();
 check(a.finished&&a.launches==0,"user cancel relaunched installer");
 reset();a=new InstallStart();a.onCreate(next("InstallStaging"));a.onStop();FeatureSettings.ready=true;Handler.tick();
 check(a.finished&&a.launches==0,"backgrounded activity relaunched installer");
 reset();a=new InstallStart();a.onCreate(next("InstallStaging"));a.destroyed=true;FeatureSettings.ready=true;Handler.tick();
 check(a.launches==0,"destroyed activity relaunched");
 reset();a=new InstallStart();original=next("InstallScanning");a.onCreate(original);SystemClock.now=2001;Handler.tick();
 check(a.finished&&a.launches==1&&!a.last.extras.containsKey("isCtsInstall")&&a.last.component.getClassName().endsWith("InstallScanning"),"timeout did not keep native route");
 reset();FeatureSettings.ready=true;FeatureSettings.cts=true;a=new InstallStart();a.onCreate(next("PackageInstallerActivity"));
 check(a.finished&&a.last.component.getClassName().endsWith("CtsPackageInstallerActivity"),"session/package CTS route wrong");
 reset();FeatureSettings.ready=true;a=new InstallStart();original=next("InstallStaging");original.putExtra("isCtsInstall",true);a.onCreate(original);
 check(Boolean.TRUE.equals(a.last.extras.get("isCtsInstall")),"OFF removed native CTS choice");
 reset();Activity other=new Activity();other.startActivity(next("InstallStaging"));check(other.launches==1,"unrelated activity delayed");
 a=new InstallStart();a.onCreate(next("UnknownActivity"));check(a.launches==1&&a.finished,"unknown native route delayed");
 reset();a=new InstallStart();a.fail=true;a.onCreate(next("InstallStaging"));FeatureSettings.ready=true;Handler.tick();
 check(a.finished&&a.result==Activity.RESULT_CANCELED&&a.launches==0,"failed forward did not exit safely");
 System.out.println("Installer startup: cold/warm, cancel/destroy, exact-once, native timeout, CTS routes, source/grants/result preservation and OFF isolation passed");}}
 '''
}
with tempfile.TemporaryDirectory(prefix='ls-installer-startup-') as directory:
    base = Path(directory)
    for name, content in sources.items():
        file = base/name; file.parent.mkdir(parents=True, exist_ok=True); file.write_text(content, encoding='utf-8')
    source = ROOT/'android/app/src/main/java/ls/augment/com/hook/InstallerStartupHook.java'
    subprocess.run([str(JAVA/'javac.exe'), '-encoding', 'UTF-8', '-d', str(base), str(source), *map(str,base.rglob('*.java'))],check=True)
    subprocess.run([str(JAVA/'java.exe'), '-cp', str(base), 'ls.augment.com.hook.InstallerStartupTest'],check=True)
