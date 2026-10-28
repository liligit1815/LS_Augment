"""Exercise the real boot receiver/job/export and Application Direct Boot guard offline."""
from pathlib import Path
import importlib.util
import subprocess
import tempfile
import xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('boot_core',ROOT/'tools/test-boot-crash-evidence.py')
core=importlib.util.module_from_spec(spec);spec.loader.exec_module(core)
SOURCES=dict(core.STUBS)
SOURCES.update({
'ls/augment/com/LogHistory.java':'package ls.augment.com;final class LogHistory {static long cutoff(android.content.Context c){return 0;}}',
'ls/augment/com/TransientCacheMaintenance.java':'package ls.augment.com;final class TransientCacheMaintenance {static void request(android.content.Context c){}}',
'android/content/pm/ApplicationInfo.java':'''package android.content.pm;public class ApplicationInfo{public int uid;public String packageName,deviceProtectedDataDir,sourceDir="/private/module's app.apk";}''',
'android/content/pm/PackageManager.java':'''package android.content.pm;public class PackageManager{public static int hostUid=10352;public ApplicationInfo getApplicationInfo(String name,int flags){ApplicationInfo a=new ApplicationInfo();a.uid=hostUid;a.packageName=name;return a;}}''',
'android/content/Context.java':r'''package android.content;import java.io.*;public class Context{
 public static File root;public static int ceReads;public boolean de;public Context(){}public Context(boolean b){de=b;}
 public File getFilesDir(){if(!de)ceReads++;File f=new File(root,de?"de/files":"ce/files");f.mkdirs();return f;}
 public Context createDeviceProtectedStorageContext(){return new Context(true);}public Context getApplicationContext(){return this;}
 public android.content.pm.ApplicationInfo getApplicationInfo(){return new android.content.pm.ApplicationInfo();}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
 public ContentResolver getContentResolver(){return new ContentResolver();}
 public <T>T getSystemService(Class<T> type){return type.cast(type==android.app.job.JobScheduler.class?android.app.job.JobScheduler.instance:new android.os.UserManager());}
}''',
'android/content/ContentResolver.java':'''package android.content;public class ContentResolver{}''',
'android/content/ComponentName.java':'''package android.content;public class ComponentName{public Class<?> type;public ComponentName(Context c,Class<?> type){this.type=type;}}''',
'android/content/Intent.java':'''package android.content;public class Intent{public static final String ACTION_SHUTDOWN="shutdown",ACTION_BOOT_COMPLETED="boot",ACTION_LOCKED_BOOT_COMPLETED="locked",ACTION_MY_PACKAGE_REPLACED="replaced";String action;public Intent(String a){action=a;}public String getAction(){return action;}}''',
'android/content/BroadcastReceiver.java':r'''package android.content;public abstract class BroadcastReceiver{public static PendingResult pending;public abstract void onReceive(Context c,Intent i);public PendingResult goAsync(){return pending=new PendingResult();}public static class PendingResult{public final java.util.concurrent.CountDownLatch done=new java.util.concurrent.CountDownLatch(1);public void finish(){done.countDown();}}}''',
'android/os/UserManager.java':'''package android.os;public class UserManager{public static boolean unlocked;public boolean isUserUnlocked(){return unlocked;}}''',
'android/provider/Settings.java':'''package android.provider;public class Settings{public static class Global{public static int boot=7;public static int getInt(Object r,String n,int d){return boot;}}}''',
'android/os/PersistableBundle.java':'''package android.os;public class PersistableBundle{java.util.Map<String,String> values=new java.util.HashMap<>();public void putString(String k,String v){values.put(k,v);}public String getString(String k,String d){return values.getOrDefault(k,d);}}''',
'android/os/Bundle.java':'''package android.os;public class Bundle{}''',
'android/app/job/JobInfo.java':r'''package android.app.job;public class JobInfo{public int id;public android.os.PersistableBundle extras;public android.content.ComponentName component;public long deadline;public static class Builder{JobInfo j=new JobInfo();public Builder(int i,android.content.ComponentName c){j.id=i;j.component=c;}public Builder setExtras(android.os.PersistableBundle b){j.extras=b;return this;}public Builder setMinimumLatency(long n){return this;}public Builder setOverrideDeadline(long n){j.deadline=n;return this;}public JobInfo build(){return j;}}}''',
'android/app/job/JobScheduler.java':'''package android.app.job;public class JobScheduler{public static final JobScheduler instance=new JobScheduler();public JobInfo last;public int calls;public int schedule(JobInfo j){last=j;calls++;return 1;}}''',
'android/app/job/JobParameters.java':'''package android.app.job;public class JobParameters{public android.os.PersistableBundle extras;public android.os.PersistableBundle getExtras(){return extras;}}''',
'android/app/job/JobService.java':'''package android.app.job;public abstract class JobService extends android.content.Context{public final java.util.concurrent.CountDownLatch done=new java.util.concurrent.CountDownLatch(1);public abstract boolean onStartJob(JobParameters p);public abstract boolean onStopJob(JobParameters p);public void jobFinished(JobParameters p,boolean retry){done.countDown();}}''',
'android/app/Activity.java':'''package android.app;public class Activity{public boolean isChangingConfigurations(){return false;}}''',
'android/app/Application.java':r'''package android.app;public class Application extends android.content.Context{public static String process="ls.augment.com";public static String getProcessName(){return process;}protected void attachBaseContext(android.content.Context c){}public void onCreate(){}public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks callbacks){}public interface ActivityLifecycleCallbacks{void onActivityStarted(Activity a);void onActivityStopped(Activity a);void onActivityCreated(Activity a,android.os.Bundle b);void onActivityResumed(Activity a);void onActivityPaused(Activity a);void onActivitySaveInstanceState(Activity a,android.os.Bundle b);void onActivityDestroyed(Activity a);}}''',
'ls/augment/com/AppPorts.java':r'''package ls.augment.com;class AppCrashDiagnostics{static void install(Object c){}static void stage(String s){}}class Ports{static int calls;static void used(){calls++;if(android.app.Application.getProcessName().contains("boot_diagnostics"))throw new AssertionError("CE feature initialization during Direct Boot");}}class HidePrivateStorage{static void configure(Object f,boolean b){Ports.used();}}class FrameworkConfigSync{static void initialize(Object c){Ports.used();}}class ModuleScopeService{static void initialize(){Ports.used();}}class ConfigVisibilityGrant{static void refresh(Object c){Ports.used();}}class ScreenAutomation{static void removeLegacyNotification(Object c){Ports.used();}}class HiddenEntrySession{static void lock(){Ports.used();}}class BatteryLifeControl{static void schedule(Object c){Ports.used();}}''',
'ls/augment/com/RootShell.java':r'''package ls.augment.com;class RootShell{
 static int calls,lastLimit;static long lastTimeout;static boolean deny,partial,slow;static volatile boolean interrupted;static final java.util.concurrent.CountDownLatch entered=new java.util.concurrent.CountDownLatch(1);
 static String quote(String v){return "'"+v.replace("'","'\"'\"'")+"'";}
 static class CapturedOutput{boolean complete=true,failed,truncated;}
 static class Result{int exitCode;boolean timedOut;String output;CapturedOutput capture=new CapturedOutput();Result(int c,String s){exitCode=c;output=s;}}
 static Result run(String c,String input,long t,int limit){calls++;lastTimeout=t;lastLimit=limit;entered.countDown();if(input!=null||!c.contains("SystemUiNativeCrashEvidence 0 10352"))throw new AssertionError("unexpected privileged request");if(slow)try{java.lang.Thread.sleep(10000);}catch(InterruptedException e){interrupted=true;java.lang.Thread.currentThread().interrupt();return new Result(130,"interrupted");}
  if(deny)return new Result(1,"private password root denial");Result r=new Result(0,"BOOT_CRASH_EVIDENCE protocol=1 user=0 systemUiUid=10352\nSystemUI safe mode witness\n"+(partial?"":"END_BOOT_CRASH_EVIDENCE"));if(partial){r.capture.complete=false;r.capture.truncated=true;}return r;}
}''',
})
TEST=r'''package ls.augment.com;import java.nio.file.*;import java.io.*;import java.util.concurrent.*;import android.content.*;import android.app.job.*;
public class BootEvidenceLifecycleTest{static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}static String read(){return BootEvidenceArchive.read(new File(Context.root,"de/files/boot-evidence-v1"));}
 public static void main(String[] args)throws Exception{Context.root=Path.of(args[0]).toFile();android.os.Process.uid=10539;Context context=new Context();
  android.app.Application.process=BootEvidenceCapture.PROCESS;new AugmentApplication().onCreate();check(Ports.calls==0&&Context.ceReads==0,"diagnostic Application never initializes CE features");
  DiagnosticBootReceiver receiver=new DiagnosticBootReceiver();int schedules=JobScheduler.instance.calls;receiver.onReceive(context,new Intent("untrusted"));check(JobScheduler.instance.calls==schedules,"unknown broadcasts cannot request Root work");
  receiver.onReceive(context,new Intent(Intent.ACTION_LOCKED_BOOT_COMPLETED));check(JobScheduler.instance.last.extras.getString("phase","").equals("LOCKED_BOOT")&&JobScheduler.instance.last.component.type==DiagnosticCaptureService.class,"locked boot schedules independent diagnostic service");int lockedJob=JobScheduler.instance.last.id;
  JobParameters params=new JobParameters();params.extras=JobScheduler.instance.last.extras;DiagnosticCaptureService service=new DiagnosticCaptureService();check(service.onStartJob(params),"job owns asynchronous work");check(service.done.await(5,TimeUnit.SECONDS),"boot job completes");
  check(Context.ceReads==0&&read().contains("userUnlocked=false")&&read().contains("phase=LOCKED_BOOT"),"locked boot evidence is written only to DE storage");check(RootShell.lastTimeout==20&&RootShell.lastLimit<BootEvidenceArchive.LIMIT,"Root work has bounded time and output");
  receiver.onReceive(context,new Intent(Intent.ACTION_BOOT_COMPLETED));check(JobScheduler.instance.last.id!=lockedJob&&JobScheduler.instance.last.extras.getString("phase","").equals("BOOT"),"post-unlock job does not cancel the locked-boot job");BootEvidenceCapture.capture(context,"BOOT",20);check(read().contains("phase=LOCKED_BOOT")&&read().contains("phase=BOOT"),"locked and unlocked boot snapshots coexist");
  receiver.onReceive(context,new Intent(Intent.ACTION_SHUTDOWN));check(BroadcastReceiver.pending.done.await(5,TimeUnit.SECONDS),"shutdown async receiver always finishes");check(RootShell.lastTimeout==3&&read().contains("phase=SHUTDOWN"),"pre-reboot collection has short explicit budget and a separate retained phase");
  android.provider.Settings.Global.boot=8;android.os.UserManager.unlocked=true;StringBuilder out=new StringBuilder();BootEvidenceCapture.appendForExport(out,context);check(out.toString().contains("BOOT_CRASH_EVIDENCE_CURRENT")&&out.toString().contains("BOOT_CRASH_EVIDENCE_RETAINED"),"real export includes both new collection and history");check(read().contains("bootcount-7")&&read().contains("bootcount-8"),"old boot remains after the next boot export");
  RootShell.partial=true;String partial=BootEvidenceCapture.capture(context,"EXPORT",20);check(partial.contains("captureComplete=false")&&partial.contains("captureTruncated=true")&&partial.contains("sourceResult=INCOMPLETE"),"truncated capture never masquerades as complete");RootShell.partial=false;
  RootShell.deny=true;String denied=BootEvidenceCapture.capture(context,"APP",20);check(denied.contains("valid_protocol=false")&&!denied.contains("private password"),"denied or non-protocol Root output never leaks raw payload");RootShell.deny=false;
  int calls=RootShell.calls;android.content.pm.PackageManager.hostUid=110352;String foreign=BootEvidenceCapture.capture(context,"APP",20);check(RootShell.calls==calls&&foreign.contains("SecurityException"),"cross-user lookup rejected before Root");android.content.pm.PackageManager.hostUid=10352;
  RootShell.slow=true;DiagnosticCaptureService cancelled=new DiagnosticCaptureService();cancelled.onStartJob(params);java.lang.Thread.sleep(50);check(cancelled.onStopJob(params),"stopped job requests retry");for(int n=0;n<30&&!RootShell.interrupted;n++)java.lang.Thread.sleep(10);check(RootShell.interrupted,"stopped Root collection drains");check(read().contains("phase=LOCKED_BOOT")&&!read().contains("sourceResult=UNAVAILABLE;error=Interrupted"),"cancellation retains earlier evidence");RootShell.slow=false;
  Context.ceReads=0;android.app.Application.process="ls.augment.com";new AugmentApplication().onCreate();check(Ports.calls>0&&JobScheduler.instance.last.extras.getString("phase","").equals("APP"),"ordinary app startup prepares a snapshot and retains normal initialization");
  System.out.println("PASS boot evidence lifecycle: "+checks+" assertions (production receiver, job, export and Application)");
 }}'''

def main():
    android='{http://schemas.android.com/apk/res/android}'
    manifest=ET.parse(ROOT/'android/app/src/main/AndroidManifest.xml').getroot()
    application=manifest.find('application')
    for tag,name in [('receiver','.DiagnosticBootReceiver'),('service','.DiagnosticCaptureService')]:
        item=next(n for n in application.findall(tag) if n.get(android+'name')==name)
        assert item.get(android+'directBootAware')=='true' and item.get(android+'process')==':boot_diagnostics'
        assert item.get(android+'exported')=='false'
    assert application.get(android+'directBootAware') is None,'ordinary CE application must not be globally enabled during Direct Boot'
    with tempfile.TemporaryDirectory(prefix='duo-boot-lifecycle-') as temporary:
        folder=Path(temporary);files=[]
        for name,text in {**SOURCES,'ls/augment/com/BootEvidenceLifecycleTest.java':TEST}.items():
            p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,'utf-8');files.append(p)
        files += [core.SRC/(n+'.java') for n in ('CrashStackTrace','SystemUiCrashJournal','BootEvidenceArchive','BootEvidenceCapture','DiagnosticBootReceiver','DiagnosticCaptureService','AugmentApplication')]
        subprocess.run([str(core.JDK/'javac'),'-encoding','UTF-8','--release','17','-d',temporary,*map(str,files)],check=True)
        subprocess.run([str(core.JDK/'java'),'-cp',temporary,'ls.augment.com.BootEvidenceLifecycleTest',str(folder/'data')],check=True,timeout=25)

if __name__=='__main__':main()
