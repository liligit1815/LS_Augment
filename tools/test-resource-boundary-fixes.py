"""Production cache/repository/recorder regressions with controlled Android and disk edges."""
from pathlib import Path
import ast
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
JDK = Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
JAVAC = str(JDK / 'javac.exe') if (JDK / 'javac.exe').exists() else shutil.which('javac')
JAVA = str(JDK / 'java.exe') if (JDK / 'java.exe').exists() else shutil.which('java')


def literals(script, name):
    tree = ast.parse((ROOT / 'tools' / script).read_text(encoding='utf-8'))
    return next(ast.literal_eval(n.value) for n in tree.body if isinstance(n, ast.Assign)
                and any(isinstance(t, ast.Name) and t.id == name for t in n.targets))


def run(name, production, stubs):
    with tempfile.TemporaryDirectory(prefix='duo-bounds-') as folder:
        paths = [str(SRC / p) for p in production]
        for relative, source in stubs.items():
            p = Path(folder) / relative
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text(source, encoding='utf-8')
            paths.append(str(p))
        subprocess.run([JAVAC, '--release', '17', '-encoding', 'UTF-8', '-d', folder, *paths], check=True)
        subprocess.run([JAVA, '-cp', folder, name, folder], check=True, timeout=30)


CORE = ['AtomicWorkbenchContent' + n + '.java' for n in
        ('Item', 'Policy', 'PermissionState', 'Source', 'Snapshot', 'Repository')]
run('ls.augment.com.TestResourceBoundaries', CORE + ['LogExportCache.java'], {
'ls/augment/com/AtomicWorkbenchContentStore.java': '''package ls.augment.com;
import java.util.*;import java.util.concurrent.*;import java.io.*;
final class AtomicWorkbenchContentStore {
 static class Stored {final EnumMap<AtomicWorkbenchContentItem.Kind,List<AtomicWorkbenchContentItem>> items=new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
 final EnumMap<AtomicWorkbenchContentItem.Kind,Set<String>> hidden=new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
 final EnumMap<AtomicWorkbenchContentItem.Kind,Long> clearedThrough=new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
 Stored(){for(var k:AtomicWorkbenchContentItem.Kind.values()){items.put(k,List.of());hidden.put(k,Set.of());clearedThrough.put(k,-1L);}}}
 volatile boolean blockRead,blockWrite,fail;CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
 void waitForDisk(boolean block)throws IOException{if(block){entered.countDown();try{if(!release.await(5,TimeUnit.SECONDS))throw new IOException("fixture timeout");}catch(InterruptedException e){throw new IOException(e);}}if(fail)throw new IOException("disk full");}
 Stored read()throws IOException{waitForDisk(blockRead);return new Stored();}void write(Stored d)throws IOException{waitForDisk(blockWrite);}}
''',
'ls/augment/com/TestResourceBoundaries.java': '''package ls.augment.com;
import java.io.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.*;
public class TestResourceBoundaries {
 static int checks;static void yes(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class Source implements AtomicWorkbenchContentSource {
  public Result scan(AtomicWorkbenchContentItem.Kind k){return new Result(List.of(),AtomicWorkbenchContentPermissionState.simple(AtomicWorkbenchContentPermissionState.Scope.FULL),State.READY);}
  public void start(Runnable r){}public void stop(){}public void close(){}}
 static void nonblocking(boolean read)throws Exception{
  AtomicWorkbenchContentStore disk=new AtomicWorkbenchContentStore();disk.blockRead=read;disk.blockWrite=!read;
  ExecutorService io=Executors.newSingleThreadExecutor(),ui=Executors.newSingleThreadExecutor();
  AtomicWorkbenchContentRepository repo=new AtomicWorkbenchContentRepository(new Source(),disk,io,Runnable::run,System::currentTimeMillis);
  try{
   if(!read){io.submit(()->{}).get(2,TimeUnit.SECONDS);repo.recordClipboard("history",1,false,AtomicWorkbenchContentRepository.ClipboardOrigin.USER_READ);}
   yes(disk.entered.await(2,TimeUnit.SECONDS),"production repository reached blocked disk");
   ui.submit(()->{repo.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD);repo.observe(AtomicWorkbenchContentItem.Kind.MEDIA,s->{}).close();repo.setVisible(true);repo.refresh(AtomicWorkbenchContentItem.Kind.MEDIA,true);repo.close();}).get(500,TimeUnit.MILLISECONDS);
   yes(true,"UI lifecycle responsive during "+(read?"restore":"fsync"));
  }finally{disk.release.countDown();repo.close();io.shutdownNow();ui.shutdownNow();}
 }
 public static void main(String[]args)throws Exception{
  nonblocking(true);nonblocking(false);
  AtomicWorkbenchContentStore blocked=new AtomicWorkbenchContentStore();blocked.blockRead=true;
  AtomicWorkbenchContentRepository bounded=new AtomicWorkbenchContentRepository(new Source(),blocked,Runnable::run);
  try{
   yes(blocked.entered.await(2,TimeUnit.SECONDS),"blocked restore starts");
   for(int i=0;i<10000;i++)bounded.recordClipboard("copy-"+i,1,false,AtomicWorkbenchContentRepository.ClipboardOrigin.USER_READ);
   var field=AtomicWorkbenchContentRepository.class.getDeclaredField("ownedWorker");field.setAccessible(true);
   yes(((ThreadPoolExecutor)field.get(bounded)).getQueue().size()<=128,"slow disk cannot accumulate unbounded write commands");
   yes(!bounded.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD).storageAvailable,"queue overload is visible and never runs disk on producer");
  }finally{bounded.close();blocked.release.countDown();}
  File root=Files.createDirectory(Path.of(args[0],"export-cache")).toFile();long now=System.currentTimeMillis();
  File unrelated=new File(root,"keep.txt");Files.writeString(unrelated.toPath(),"user");
  for(int i=0;i<10;i++){File f=new File(root,"duo-log-"+Integer.toHexString(i)+".txt");Files.writeString(f.toPath(),"log");f.setLastModified(now-i*1000);}
  LogExportCache.clean(root,now);yes(root.listFiles(f->f.getName().startsWith("duo-log-")).length==2,"orphan count capped");
  File first=LogExportCache.acquire(root,"duo-log-aa.txt",now);Files.writeString(first.toPath(),"active");first.setLastModified(now-LogExportCache.MAX_AGE_MS-1);
  File second=LogExportCache.acquire(root,"duo-log-bb.txt",now);Files.writeString(second.toPath(),"active");LogExportCache.clean(root,now);
  yes(first.exists()&&second.exists(),"active exports survive age and quota sweep");
  try{LogExportCache.acquire(root,"duo-log-cc.txt",now);throw new AssertionError("third export admitted");}catch(IOException expected){checks++;}
  try{LogExportCache.acquire(root,"../keep.txt",now);throw new AssertionError("path escape");}catch(IOException expected){checks++;}
  LogExportCache.release(first);LogExportCache.release(second);yes(!first.exists()&&!second.exists(),"completion releases temporary files");
  File huge=new File(root,"duo-log-dd.txt");try(RandomAccessFile f=new RandomAccessFile(huge,"rw")){f.setLength(LogExportCache.MAX_FILE_BYTES+1);}
  LogExportCache.clean(root,now+10);yes(!huge.exists()&&unrelated.exists(),"oversized own file removed, unrelated file preserved");
  File expired=new File(root,"duo-log-ee.txt");Files.writeString(expired.toPath(),"abandoned");expired.setLastModified(now-LogExportCache.MAX_AGE_MS);
  LogExportCache.clean(root,now);yes(!expired.exists(),"process-death orphan expires");
  System.out.println("PASS resource boundaries: "+checks+" blocked read/write, lifecycle, leases, quota, age and path checks");
 }
}'''
})

health = literals('test-health-private-ledger.py', 'files')
stubs = {k: health[k] for k in ('android/os/Bundle.java', 'android/os/IBinder.java', 'android/os/Binder.java')}
stubs['android/os/Bundle.java'] = stubs['android/os/Bundle.java'].replace('public Bundle(){}', 'public Bundle(){}public int size(){return values.size();}public void clear(){values.clear();}public boolean containsKey(String k){return values.containsKey(k);}')
stubs.update({
'android/os/Process.java': 'package android.os;public class Process {public static int myUid(){return 10100;}}',
'android/os/Looper.java': 'package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}',
'android/os/Handler.java': 'package android.os;public class Handler {public Handler(Looper l){}public void post(Runnable r){r.run();}}',
'android/net/Uri.java': 'package android.net;public class Uri {public static Uri parse(String u){return new Uri();}}',
'android/provider/Settings.java': 'package android.provider;public class Settings {public static class Global {public static String BOOT_COUNT="boot";public static int boot=5;public static int getInt(android.content.ContentResolver r,String k,int d){return boot;}}}',
'android/content/pm/ApplicationInfo.java': 'package android.content.pm;public class ApplicationInfo {public int uid=10002;}',
'android/content/pm/PackageManager.java': 'package android.content.pm;public class PackageManager {public ApplicationInfo getApplicationInfo(String p,int f){return new ApplicationInfo();}}',
'android/content/ContentResolver.java': '''package android.content;public class ContentResolver {
 public static java.util.function.Function<android.os.Bundle,android.os.Bundle> bridge;
 public android.os.Bundle call(android.net.Uri u,String m,String a,android.os.Bundle b){return bridge.apply(b);}}''',
'android/content/SharedPreferences.java': '''package android.content;import java.util.*;public class SharedPreferences {
 final Map<String,Object> data=new HashMap<>();public boolean fail;
 public Map<String,?>getAll(){return new HashMap<>(data);}public boolean contains(String k){return data.containsKey(k);}public String getString(String k,String d){return (String)data.getOrDefault(k,d);}
 public long getLong(String k,long d){return (Long)data.getOrDefault(k,d);}public int getInt(String k,int d){return (Integer)data.getOrDefault(k,d);}public boolean getBoolean(String k,boolean d){return (Boolean)data.getOrDefault(k,d);}
 public Editor edit(){return new Editor();}public class Editor {Map<String,Object> next=new HashMap<>(data);public Editor clear(){next.clear();return this;}public Editor putString(String k,String v){next.put(k,v);return this;}public Editor putLong(String k,long v){next.put(k,v);return this;}public Editor putInt(String k,int v){next.put(k,v);return this;}public Editor putBoolean(String k,boolean v){next.put(k,v);return this;}public boolean commit(){if(fail)return false;data.clear();data.putAll(next);return true;}}}''',
'android/content/Context.java': '''package android.content;public class Context {
 public static final int MODE_PRIVATE=0;final java.util.Map<String,SharedPreferences> prefs=new java.util.HashMap<>();public int deletes;
 public Context getApplicationContext(){return this;}public SharedPreferences getSharedPreferences(String n,int m){return prefs.computeIfAbsent(n,k->new SharedPreferences());}
 public boolean deleteSharedPreferences(String n){deletes++;prefs.remove(n);return true;}public ContentResolver getContentResolver(){return new ContentResolver();}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}}''',
'ls/augment/com/RuntimeEnvironment.java': 'package ls.augment.com;final class RuntimeEnvironment {static int bootCount(android.content.Context c){return android.provider.Settings.Global.boot;}}',
'ls/augment/com/hook/FeatureSettings.java': 'package ls.augment.com.hook;class FeatureSettings {static void diagnostic(android.content.Context c,String k,String v){}}',
'ls/augment/com/hook/RecorderClientFixture.java': '''package ls.augment.com.hook;public class RecorderClientFixture {
 public static android.os.Bundle get(android.content.Context c)throws Exception {var result=new java.util.concurrent.CompletableFuture<android.os.Bundle>();NativeIslandRecoveryClient.request(c,"get",new android.os.Bundle(),result::complete);return result.get(3,java.util.concurrent.TimeUnit.SECONDS);}}''',
'ls/augment/com/TestRecorderStore.java': '''package ls.augment.com;
import android.os.Bundle;import android.content.*;public class TestRecorderStore {
 static int checks;static void yes(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static Bundle call(Context c,Bundle b){return NativeIslandRecoveryStore.call(c,null,b,10002,"com.android.systemui",new String[]{"com.android.systemui"});}
 static Bundle input(String op){Bundle b=new Bundle();b.putString("op",op);return b;}
 public static void main(String[]args)throws Exception{
  Context module=new Context(),host=new Context();Bundle get=call(module,input("get"));yes(get.getBoolean("ok"),"authenticated read");
  yes(!NativeIslandRecoveryStore.call(module,null,input("get"),10003,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"forged uid denied");
  yes(!NativeIslandRecoveryStore.call(module,null,input("get"),110002,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"cross user denied");
  SharedPreferences old=host.getSharedPreferences("ls_augment_native_record_recovery",0);
  old.edit().putInt("status",2).putInt("boot",5).putString("key","recorder").putLong("posted",100).putString("duration","00:01:02").commit();
  ContentResolver.bridge=b->null;yes(ls.augment.com.hook.RecorderClientFixture.get(host)==null&&!old.getAll().isEmpty()&&host.deletes==0,"missing provider retains only recovery copy");
  ContentResolver.bridge=b->call(module,b);Bundle migrated=ls.augment.com.hook.RecorderClientFixture.get(host);
  yes(migrated.getInt("status")==2&&migrated.getString("duration").equals("00:01:02")&&host.deletes==1,"legacy pause migration acknowledged then host prefs deleted");
  Bundle put=new Bundle(migrated);put.clear();put.putString("op","put");put.putString("epoch",migrated.getString("epoch"));put.putInt("status",2);put.putInt("boot",5);put.putString("key","recorder");put.putLong("posted",100);put.putString("duration","00:02:03");put.putString("rawCount","123");
  yes(call(module,put).getBoolean("ok"),"bounded private write");put.putString("key","x".repeat(1025));yes(!call(module,put).getBoolean("ok"),"oversized identity rejected");put.putString("key","recorder");
  module.getSharedPreferences(NativeIslandRecoveryStore.PREFS,0).fail=true;yes(!call(module,put).getBoolean("ok"),"failed durable commit never acknowledged");module.getSharedPreferences(NativeIslandRecoveryStore.PREFS,0).fail=false;
  android.provider.Settings.Global.boot=6;yes(!call(module,input("get")).containsKey("status"),"old boot snapshot cannot revive recorder");android.provider.Settings.Global.boot=5;
  ResetWriteFence.begin();yes(!call(module,put).getBoolean("ok"),"reset blocks writer");yes(NativeIslandRecoveryStore.clearForReset(module),"reset clears private snapshot");ResetWriteFence.end();
  yes(!call(module,put).getBoolean("ok"),"queued pre-reset epoch rejected");
  old=host.getSharedPreferences("ls_augment_native_record_recovery",0);old.edit().putInt("status",2).putInt("boot",5).putString("key","old").putLong("posted",100).putString("duration","00:01:02").commit();
  Bundle after=ls.augment.com.hook.RecorderClientFixture.get(host);yes(after.getBoolean("migrated")&&!after.containsKey("status"),"reset tombstone prevents stale legacy reimport");
  System.out.println("PASS recorder private recovery: "+checks+" auth, migration, commit failure, reboot and reset checks");
 }}'''
})
run('ls.augment.com.TestRecorderStore', ['NativeIslandRecoveryStore.java', 'ResetWriteFence.java',
    'hook/NativeIslandRecoveryClient.java', 'hook/NativeIslandRecordingRecovery.java'], stubs)
run('ls.augment.com.hook.NativeIslandRecordingRecoveryTest', ['hook/NativeIslandRecordingRecovery.java'], {
    'ls/augment/com/hook/NativeIslandRecordingRecoveryTest.java':
        (ROOT / 'tools/tests/NativeIslandRecordingRecoveryTest.java').read_text(encoding='utf-8')})
