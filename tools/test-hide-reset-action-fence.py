"""Compile the real RootHideManager and ResetWriteFence with isolated transport doubles.

Exercise actions queued behind total reset; no Root command or Android device is used.
"""
from pathlib import Path
from hide_private_test_support import PRIVATE_STORAGE_STUB
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
STUBS = {
    'android/os/Process.java': 'package android.os;public class Process {public static int myUid(){return 10001;}}',
    'ls/augment/com/HidePrivateStorage.java': PRIVATE_STORAGE_STUB,
    'android/content/Context.java': '''package android.content;
public class Context {public static final int MODE_PRIVATE=0;
 public Context getApplicationContext(){return this;}
 public java.io.File getFilesDir(){return new java.io.File("offline-private-files");}
 public SharedPreferences getSharedPreferences(String n,int m){return new SharedPreferences();}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
 public <T> T getSystemService(Class<T> t){return null;}}''',
    'android/content/SharedPreferences.java': '''package android.content;
public class SharedPreferences {public boolean getBoolean(String k,boolean d){return d;}
 public String getString(String k,String d){return d;}public Editor edit(){return new Editor();}
 public static class Editor {public Editor putBoolean(String k,boolean v){return this;}
 public Editor putString(String k,String v){return this;}public void apply(){ls.augment.com.TestHideResetActionFence.mutation("prefs");}}}''',
    'android/content/pm/ApplicationInfo.java': '''package android.content.pm;
public class ApplicationInfo {public static final int FLAG_SYSTEM=1,FLAG_UPDATED_SYSTEM_APP=128;public int flags;
 public CharSequence loadLabel(PackageManager p){return "fixture";}}''',
    'android/content/pm/PackageInfo.java': 'package android.content.pm;public class PackageInfo {public long firstInstallTime=1;}',
    'android/content/pm/PackageManager.java': '''package android.content.pm;
public class PackageManager {public static final int MATCH_DISABLED_COMPONENTS=512,MATCH_UNINSTALLED_PACKAGES=8192;
 public ApplicationInfo getApplicationInfo(String n,int f){return new ApplicationInfo();}
 public PackageInfo getPackageInfo(String n,int f){return new PackageInfo();}}''',
    'android/os/PowerManager.java': 'package android.os;public class PowerManager {public boolean isInteractive(){return false;}}',
}
TEST = r'''
package ls.augment.com;
import android.content.Context;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.*;
class AppConfig {
 static final String DIAGNOSTICS="diagnostics",HIDE_TARGETS="targets",HIDE_MASTER="master",AUTOMATION_ENABLED="automation",AUTOMATION_SCOPE="scope";
 AppConfig(Context c){}String get(String k){return k.equals(HIDE_TARGETS)?"v3:0:0:org.example.old":"all";}
 boolean getBoolean(String k){return true;}void initializeRuntimeMirrorsIfNeeded(){TestHideResetActionFence.mutation("runtime initialization");}
 SaveResult save(Map<String,String> values){TestHideResetActionFence.mutation("config save");return new SaveResult();}
 static class SaveResult {boolean success=true,runtimeSynced=true;String message="";}
}
class ConfigSchema {static String normalize(String k,String v){return v;}}
class RootShell {
 static Result run(String command,Object unused,long timeout,int bound){TestHideResetActionFence.rootReads++;return new Result(0,"uid=0|provider=fixture",false);}
 static class Result {final int exitCode;final String output;final boolean timedOut;
 Result(int c,String o,boolean t){exitCode=c;output=o;timedOut=t;}boolean isSuccess(){return exitCode==0&&!timedOut;}String publicError(){return output;}}
}
class HideTargetStore {
 enum ReadStatus {OK,ABSENT,ERROR}enum ObservedState {VISIBLE,HIDDEN,MISSING,UNKNOWN}
 static int reads;static Snapshot current;
 static class Record {int userId;long userSerial;String packageName;boolean bound,managed;Boolean desiredHidden;ObservedState observedState;long observedAt;Object lastOperation;
 Record(int u,long s,String p,boolean b,boolean m,Boolean h,ObservedState o,long t,Object op){userId=u;userSerial=s;packageName=p;bound=b;managed=m;desiredHidden=h;observedState=o;observedAt=t;lastOperation=op;}
 String key(){return userId+"|"+userSerial+"|"+packageName;}}
 static class Snapshot {final long revision;final List<Record> records;Snapshot(long r,List<Record> rs){revision=r;records=rs;}String encode(){return "fixture:"+revision;}}
 static class ReadResult {ReadStatus status;Snapshot snapshot;String error="";ReadResult(ReadStatus s,Snapshot p){status=s;snapshot=p;}}
 static class LegacyResult {ReadStatus status=ReadStatus.ABSENT;List<HideTargetCodec.Entry> entries=List.of();}
 static class WriteResult {boolean applied=true;String error="";Snapshot snapshot;WriteResult(Snapshot s){snapshot=s;}}
 ReadResult read(){reads++;return new ReadResult(current==null?ReadStatus.ABSENT:ReadStatus.OK,current);}
 LegacyResult readLegacyTargets(){reads++;return new LegacyResult();}
 WriteResult compareAndSet(long r,Snapshot s){TestHideResetActionFence.mutation("independent targets");current=s;return new WriteResult(s);}
}
class HideRecoveryArchive {static RootShell.Result preserve(String s){TestHideResetActionFence.mutation("archive");return new RootShell.Result(0,"",false);}}
class HideRecoveryEmergency {static RootShell.Result install(){TestHideResetActionFence.mutation("emergency");return new RootShell.Result(0,"",false);}
 static RootShell.Result writeTargets(String s){TestHideResetActionFence.mutation("legacy targets");return new RootShell.Result(0,"",false);}}
class HideUserIdentity {static class Snapshot {boolean success=true;long userSerial=0;String message="";}
 static Snapshot read(Context c,int u){return new Snapshot();}static Snapshot match(Context c,int u,long s){Snapshot r=new Snapshot();r.userSerial=s;return r;}}
class HideBatchExecutor {static final int BATCH_SIZE=8;static class Outcome<T>{Set<T> success=new LinkedHashSet<>();Map<T,String> failures=new LinkedHashMap<>();}}
class HidePackageSnapshot {static String command(Set<String> ps){return "snapshot";}
 static class PackageState {RootHideManager.State user(int u){return RootHideManager.State.VISIBLE;}}
 static Map<String,PackageState> parse(String s,Set<String> ps){Map<String,PackageState> rs=new LinkedHashMap<>();for(String p:ps)rs.put(p,new PackageState());return rs;}}
class HideTargetController {static HideTargetController forCheckedBatch(Context c,RootHideManager m,RootHideManager.RootStatus r){return new HideTargetController();}
 RootHideManager.OperationResult hide(RootHideManager.Target t){TestHideResetActionFence.mutation("HIDE");return RootHideManager.OperationResult.success("hide");}
 RootHideManager.OperationResult showInConfirmedBatch(RootHideManager.Target t){TestHideResetActionFence.mutation("SHOW");return RootHideManager.OperationResult.success("show");}}
class RuntimeStateStore {static RootShell.Result publishHidden(Context c,String s,String a){TestHideResetActionFence.mutation("runtime publish");return new RootShell.Result(0,"",false);}}
class AuditLog {static void write(Context c,String event,String m){TestHideResetActionFence.mutation("audit");}}
public class TestHideResetActionFence {
 static int tests,checks,rootReads;static final List<String> mutations=new ArrayList<>();static final Context CONTEXT=new Context();
 public static void mutation(String s){mutations.add(s);}
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message+" mutations="+mutations);}
 static void clean(){rootReads=HideTargetStore.reads=0;mutations.clear();HideTargetStore.current=null;}
 static void rejected(RootHideManager.OperationResult result){check(!result.success&&result.message.contains("重置"),"stale action did not report reset");}
 static void untouched(){check(mutations.isEmpty()&&rootReads==0&&HideTargetStore.reads==0,"stale action reached transport/store");check(!RootHideManager.ACTION_LOCK.isLocked(),"action lock leaked");}
 static void queued(String name,Consumer<RootHideManager> action)throws Exception {
  clean();RootHideManager old=new RootHideManager(CONTEXT);ExecutorService worker=Executors.newSingleThreadExecutor();
  RootHideManager.ACTION_LOCK.lock();Future<?> pending;
  try {
   ResetWriteFence.begin();pending=worker.submit(()->action.accept(old));
   // Wait until production code is queued on ACTION_LOCK, rather than relying on sleeps.
   long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(2);
   while(!RootHideManager.ACTION_LOCK.hasQueuedThreads()&&System.nanoTime()<deadline)Thread.yield();
   check(RootHideManager.ACTION_LOCK.hasQueuedThreads()&&!pending.isDone(),"action did not queue behind reset");
   ResetWriteFence.end();RootHideManager.ACTION_LOCK.unlock();pending.get(2,TimeUnit.SECONDS);untouched();tests++;System.out.println("PASS queued reset action: "+name);
  } finally {ResetWriteFence.end();if(RootHideManager.ACTION_LOCK.isHeldByCurrentThread())RootHideManager.ACTION_LOCK.unlock();worker.shutdownNow();}
 }
 public static void main(String[] args)throws Exception {
  var target=new RootHideManager.Target(0,0,"org.example.old");
  queued("target migration",m->rejected(m.refreshTargets()));
  queued("independent target save",m->rejected(m.saveTargets(Set.of(target),Map.of("setting","old"))));
  queued("runtime observation",m->rejected(m.syncMirrors()));
  queued("single HIDE",m->rejected(m.hide(target)));
  queued("single SHOW",m->rejected(m.show(target)));
  queued("confirmed batch HIDE",m->rejected(m.changeConfirmed(true,Set.of(target),s->{})));
  queued("confirmed batch SHOW",m->rejected(m.changeConfirmed(false,Set.of(target),s->{})));
  queued("confirmed scoped HIDE",m->rejected(m.changeConfirmed(true,Set.of(target),Set.of(target),s->{})));
  queued("confirmed scoped SHOW",m->rejected(m.changeConfirmed(false,Set.of(target),Set.of(target),s->{})));
  queued("tile toggle",m->rejected(m.toggleAll()));
  queued("screen-off automation",m->rejected(m.runScreenOffAutomation()));
  queued("Root probe",m->{var r=m.rootStatus();check(r.state!=RootHideManager.RootState.GRANTED&&r.message.contains("重置"),"stale root probe accepted");});
  queued("explicit Root authorization",m->{var r=m.requestRootStatus();check(r.state!=RootHideManager.RootState.GRANTED&&r.message.contains("重置"),"stale authorization accepted");});
  clean();RootHideManager old=new RootHideManager(CONTEXT);ResetWriteFence.begin();ResetWriteFence.end();
  check(old.rootAuthorizationProblem().contains("重置")&&old.currentTargetProblem(target).contains("重置"),"checked controller bypassed stale manager");untouched();tests++;
  clean();RootHideManager.ACTION_LOCK.lock();ResetWriteFence.begin();
  try {RootHideManager owned=new RootHideManager(CONTEXT);check(owned.refreshTargets().success,"reset-owned fresh manager rejected");check(!mutations.isEmpty(),"fresh owner did not use store");}
  finally {ResetWriteFence.end();RootHideManager.ACTION_LOCK.unlock();}tests++;
  clean();RootHideManager fresh=new RootHideManager(CONTEXT);check(fresh.refreshTargets().success&&!mutations.isEmpty(),"post-reset fresh manager rejected");tests++;
  System.out.println("RESET ACTION FENCE RESULT "+tests+" passed, "+checks+" assertions");
 }
}
'''


def main():
    with tempfile.TemporaryDirectory(prefix='lsa-hide-reset-queue-') as temporary:
        folder = Path(temporary)
        sources = []
        for relative, text in {**STUBS, 'ls/augment/com/TestHideResetActionFence.java': TEST}.items():
            file = folder / relative
            file.parent.mkdir(parents=True, exist_ok=True)
            file.write_text(text, encoding='utf-8')
            sources.append(str(file))
        production = ['RootHideManager.java', 'ResetWriteFence.java', 'HideTargetCodec.java',
                      'UserResolution.java', 'ScreenAutomationPolicy.java']
        subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', temporary,
                        *[str(JAVA / name) for name in production], *sources], check=True, timeout=45)
        subprocess.run(['java', '-Dfile.encoding=UTF-8', '-cp', temporary, 'ls.augment.com.TestHideResetActionFence'], check=True, timeout=30)


if __name__ == '__main__':
    main()
