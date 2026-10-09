"""Run the production total-reset visibility controller with offline Android/Root doubles.

No device, PackageManager command, real Root process, or real deletion is used.
"""
from pathlib import Path
import subprocess
import tempfile
import os

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
STUBS = {
    'android/content/Context.java': '''package android.content;
public class Context { public Context getApplicationContext(){return this;} }''',
    'ls/augment/com/OfflineTypes.java': r'''
package ls.augment.com;
import android.content.Context;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;
class RootHideManager {
 static final ReentrantLock ACTION_LOCK=new ReentrantLock(); enum RootState {GRANTED,DENIED}
 static class RootStatus { final RootState state=RootState.GRANTED;final String message=""; }
 static class Target extends HideTargetCodec.Entry {Target(int u,long s,String p){super(u,s,p,true);} }
 static class UserRecord { final int userId; final long userSerial; UserRecord(int u,long s){userId=u;userSerial=s;} }
 static class UserDirectory {final boolean success;final List<UserRecord> users;UserDirectory(boolean s,List<UserRecord> u){success=s;users=u;} }
 static class OperationResult {final boolean success;final String message;OperationResult(boolean s,String m){success=s;message=m;}
 static OperationResult success(String m){return new OperationResult(true,m);} static OperationResult failure(String m){return new OperationResult(false,m);} }
 RootHideManager(Context c){} RootStatus rootStatus(){return new RootStatus();}
 UserDirectory userDirectory(){throw new AssertionError();} String currentTargetProblem(Target t){throw new AssertionError();}
 static boolean isProtected(String p){return p.equals("android")||p.equals("com.android.settings");}
}
class AppConfig {static final String HIDE_TARGETS="targets";AppConfig(Context c){}String get(String k){return "";} }
class HideRootClient {String beforeNewOperation(int u,long s,String p){throw new AssertionError();} }
class HideRootProtocol {enum Outcome {RESERVED,CHANGED,NOOP,REJECTED_BEFORE_WRITE,NOT_READY,UNKNOWN_NONCE,RUNNING}
 static class Reply {Outcome outcome;} }
class HideManualClient {HideRootProtocol.Reply status(RootHideManager.Target t,boolean h,String n){throw new AssertionError();}
 HideRootProtocol.Reply retireReserved(RootHideManager.Target t,boolean h,String n){throw new AssertionError();} }
class HideTargetController {static HideTargetController forBatch(Context c,RootHideManager m){return new HideTargetController();}
 static HideTargetStore.Record find(HideTargetStore.Snapshot s,RootHideManager.Target t){throw new AssertionError();}
 RootHideManager.OperationResult showInConfirmedBatch(RootHideManager.Target t){throw new AssertionError();} }
class HideRecoveryIdentity {
 static class Snapshot {final boolean success;final long userSerial;final String packageIdentity,observedState;
 Snapshot(boolean s,long u,String i,String o){success=s;userSerial=u;packageIdentity=i;observedState=o;} }
 static Snapshot read(Context c,RootHideManager.Target t){throw new AssertionError();}
}
''',
}
TEST = r'''
package ls.augment.com;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
public class TestHideTotalReset {
 static final String ID="a".repeat(64), OTHER="b".repeat(64), STAMP="d".repeat(64);
 static int checks,tests;
 static void check(boolean v,String m){checks++;if(!v)throw new AssertionError(m);}
 static void locked(){check(RootHideManager.ACTION_LOCK.isHeldByCurrentThread(),"operation without ACTION_LOCK");}
 static String key(int user,long serial,String pkg){return user+"|"+serial+"|"+pkg;}
 static HideTargetStore.Record record(int u,long s,String p,boolean managed,boolean operation){
  return new HideTargetStore.Record(u,s,p,true,managed,true,HideTargetStore.ObservedState.HIDDEN,5,
   operation?new HideTargetStore.LastOperation("op"+u,1,HideTargetStore.Action.HIDE,HideTargetStore.OperationStatus.SUCCEEDED,"","nonce"+u):null);
 }
 static String digest(byte[] b){try{return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(b));}catch(Exception e){throw new RuntimeException(e);}}
 static RootShell.Result captured(String wire){return new RootShell.Result(0,wire.trim(),false,new RootShell.CapturedOutput(wire.getBytes(StandardCharsets.UTF_8),true,false,false));}
 static HideRecoveryCatalog.Source source(String key,String raw){byte[] b=raw.getBytes(StandardCharsets.UTF_8);return new HideRecoveryCatalog.Source(key,digest(b),b,"");}
 static HideRecoveryCatalog.Page page(List<HideRecoveryCatalog.Source> input,String next){
  StringBuilder s=new StringBuilder("LSA_RECOVERY_CATALOG_V1\n");
  for(var item:input)s.append("S|").append(item.key).append('|').append(item.sha256).append('|').append(item.bytes.length).append("|-|").append(Base64.getEncoder().encodeToString(item.bytes)).append('\n');
  s.append("M|").append(next.isEmpty()?"-":next).append("|0\nLSA_RECOVERY_CATALOG_OK\n");
  var p=HideRecoveryCatalog.parseProtocol(s.toString());check(p.success,"fixture page framing");return p;
 }
 static class Access implements HideResetController.Access {
  List<HideTargetStore.Record> records=new ArrayList<>();
  List<RootHideManager.UserRecord> users=new ArrayList<>(List.of(new RootHideManager.UserRecord(0,0),new RootHideManager.UserRecord(12,44)));
  Map<String,String> state=new HashMap<>(),identity=new HashMap<>();
  Map<String,HideRecoveryCatalog.Page> pages=new HashMap<>();
  String rootProblem="",cached="",pending="",targetProblem="",stamp=STAMP;
  boolean showFails,identityFails,clearFails;int shows,clears;
  Access(){pages.put("",page(List.of(),""));}
  void add(int u,long s,String p,boolean managed,boolean operation,String observed){records.add(record(u,s,p,managed,operation));state.put(key(u,s,p),observed);}
  public String rootProblem(){locked();return rootProblem;}
  public HideTargetStore.ReadResult targets(){locked();var snap=new HideTargetStore.Snapshot(1,records);String raw=snap.encode();
   return new HideTargetStore(op->captured("LSAT_STORE1\nDATA|"+HideTargetStore.sha256(raw)+"|"+Base64.getEncoder().encodeToString(raw.getBytes(StandardCharsets.US_ASCII))+"\nLSAT_STORE_END\n")).read();}
  public HideTargetStore.LegacyResult legacy(){locked();return new HideTargetStore(op->captured("LSAT_STORE1\nABSENT\nLSAT_STORE_END\n")).readLegacyTargets();}
  public String cachedSelection(){locked();return cached;}
  public HideRecoveryCatalog.Page sources(String cursor){locked();return pages.getOrDefault(cursor,HideRecoveryCatalog.Page.failure("bad page"));}
  public RootHideManager.UserDirectory users(){locked();return new RootHideManager.UserDirectory(true,users);}
  public HideRecoveryIdentity.Snapshot identity(RootHideManager.Target t){locked();String k=key(t.userId,t.userSerial,t.packageName);
   return new HideRecoveryIdentity.Snapshot(!identityFails,t.userSerial,identity.getOrDefault(k,ID),state.getOrDefault(k,"VISIBLE"));}
  public String pendingProblem(RootHideManager.Target t){locked();return pending;}
  public String targetProblem(RootHideManager.Target t){locked();return targetProblem;}
  public RootHideManager.OperationResult show(RootHideManager.Target t){locked();shows++;if(showFails)return RootHideManager.OperationResult.failure("unknown command");
   state.put(key(t.userId,t.userSerial,t.packageName),"VISIBLE");return RootHideManager.OperationResult.success("shown");}
  public String storageStamp(){locked();return stamp;}
  public RootShell.Result clearStorage(String expected){locked();check(expected.equals(stamp),"cleanup without exact bytes");clears++;return new RootShell.Result(clearFails?74:0,"clear",false);}
 }
 static void test(String name,java.util.function.Consumer<Access> action){Access a=new Access();action.accept(a);
  check(!RootHideManager.ACTION_LOCK.isLocked(),"lock leaked");tests++;System.out.println("PASS total hide reset: "+name);}
 static void success(Access a,int restored){HideResetController c=new HideResetController(a);var r=c.restoreRecorded(null);
  check(r.success&&r.restoredCount==restored,"restore result "+r.message);check(a.clears==0,"erased before full restoration");
  check(c.clearVerified(r).success&&a.clears==1,"cleanup result");check(!c.clearVerified(r).success&&a.clears==1,"receipt replay");}
 static void failure(Access a){HideResetController c=new HideResetController(a);var r=c.restoreRecorded(null);
  check(!r.success,"unsafe restore accepted");check(!c.clearVerified(r).success&&a.clears==0,"failure erased recovery records");}
 public static void main(String[] args){
  test("empty scope is verified then cleared",a->success(a,0));
  test("all users and deselected records restored",a->{a.add(0,0,"org.example.app",true,true,"HIDDEN");a.add(12,44,"org.example.app",false,true,"HIDDEN");success(a,2);check(a.shows==2,"user or deselected target omitted");});
  test("visible and uninstalled packages never changed",a->{a.add(0,0,"org.example.visible",true,true,"VISIBLE");a.add(12,44,"org.example.removed",false,true,"MISSING");success(a,0);check(a.shows==0,"missing/visible was enabled or installed");});
  test("removed user never receives a command",a->{a.add(42,78,"org.example.old",false,true,"HIDDEN");success(a,0);check(a.shows==0,"removed space changed");});
  test("reused user ID retains records and never changes replacement space",a->{a.add(12,30,"org.example.old",false,true,"HIDDEN");a.state.put(key(12,44,"org.example.old"),"HIDDEN");failure(a);check(a.shows==0,"reused space changed");});
  test("legacy-only hidden selection needs review",a->{a.cached="0:org.example.old";a.state.put(key(0,0,"org.example.old"),"HIDDEN");failure(a);check(a.shows==0,"legacy number became mutation authority");});
  test("modern bound selection accepts the newly confirmed total-reset SHOW",a->{a.add(0,0,"org.example.old",true,false,"HIDDEN");success(a,1);check(a.shows==1,"modern selection blocked because earlier nonce was absent");});
  test("modern bound deselected target remains in the total-reset scope",a->{a.add(12,44,"org.example.old",false,false,"HIDDEN");success(a,1);check(a.shows==1,"deselected modern target omitted");});
  test("legacy duplicate verifies after its bound record",a->{a.add(0,0,"org.example.old",true,true,"HIDDEN");a.cached="0:org.example.old";success(a,1);check(a.shows==1,"duplicate action");});
  test("journal-only original coordinate restored",a->{String nonce="12345678-1234-1234-1234-123456789abc";
   var e=new HideRecoveryJournal.Entry(nonce,"22345678-1234-1234-1234-123456789abc",0,12,44,"org.example.journal",ID,1,HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);
   a.pages.put("",page(List.of(source("journal:"+nonce+".PREPARED.record",e.encode()+"\n")),""));a.state.put(key(12,44,e.packageName),"HIDDEN");success(a,1);});
  test("journal package replacement remains hidden and records retained",a->{String nonce="12345678-1234-1234-1234-123456789abc";
   var e=new HideRecoveryJournal.Entry(nonce,"22345678-1234-1234-1234-123456789abc",0,0,0,"org.example.changed",OTHER,1,HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);
   a.pages.put("",page(List.of(source("journal:"+nonce+".PREPARED.record",e.encode()+"\n")),""));a.state.put(key(0,0,e.packageName),"HIDDEN");failure(a);check(a.shows==0,"different install changed");});
  test("journal-only unknown historical identity requires review",a->{String nonce="12345678-1234-1234-1234-123456789abc";
   var e=new HideRecoveryJournal.Entry(nonce,"22345678-1234-1234-1234-123456789abc",0,0,0,"org.example.unknown","unknown",1,HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);
   a.pages.put("",page(List.of(source("journal:"+nonce+".PREPARED.record",e.encode()+"\n")),""));a.state.put(key(0,0,e.packageName),"HIDDEN");failure(a);check(a.shows==0,"unknown historical install was authorized");});
  test("unreadable later catalog page stops before any SHOW",a->{a.add(0,0,"org.example.app",true,true,"HIDDEN");
   List<HideRecoveryCatalog.Source> s=new ArrayList<>();for(int i=0;i<4;i++){String raw="v3:0:0:org.example.old"+i+"\n";s.add(source("selection:"+digest(raw.getBytes(StandardCharsets.UTF_8))+".raw",raw));}
   a.pages.put("",page(s,s.get(3).key));failure(a);check(a.shows==0,"acted before complete scope");});
  test("pending operation stops without replay",a->{a.add(0,0,"org.example.app",true,true,"HIDDEN");a.pending="prior operation unconfirmed";failure(a);check(a.shows==0,"pending operation raced");});
  test("visible target with still-running HIDE cannot lose its record",a->{a.add(0,0,"org.example.app",true,true,"VISIBLE");a.pending="HIDE still running";failure(a);check(a.shows==0,"running action ignored because snapshot was visible");});
  test("unknown SHOW stops later targets and preserves all records",a->{a.add(0,0,"org.example.first",true,true,"HIDDEN");a.add(12,44,"org.example.second",true,true,"HIDDEN");a.showFails=true;failure(a);check(a.shows==1,"dispatched after unknown");});
  test("Root denial never mutates or clears",a->{a.rootProblem="denied";failure(a);check(a.shows==0,"Root denial changed target");});
  test("current identity failure preserves all records",a->{a.add(0,0,"org.example.app",true,true,"HIDDEN");a.identityFails=true;failure(a);check(a.shows==0,"unverified identity changed");});
  test("storage changes invalidate cleanup receipt",a->{a.add(0,0,"org.example.app",true,true,"VISIBLE");var c=new HideResetController(a);var r=c.restoreRecorded(null);check(r.success,"setup");a.stamp=OTHER;check(!c.clearVerified(r).success&&a.clears==0,"new evidence erased");});
  test("application hidden again invalidates cleanup",a->{a.add(0,0,"org.example.app",true,true,"VISIBLE");var c=new HideResetController(a);var r=c.restoreRecorded(null);check(r.success,"setup");a.state.put(key(0,0,"org.example.app"),"HIDDEN");check(!c.clearVerified(r).success&&a.clears==0,"new hidden state lost");});
  test("foreign receipt cannot authorize cleanup",a->{var c=new HideResetController(a);var r=c.restoreRecorded(null);check(!new HideResetController(a).clearVerified(r).success&&a.clears==0,"foreign receipt accepted");});
  test("cleanup failure is not full success",a->{var c=new HideResetController(a);var r=c.restoreRecorded(null);check(r.success,"setup");a.clearFails=true;check(!c.clearVerified(r).success,"unconfirmed cleanup accepted");});
  String cleanup=HideResetStorage.command(STAMP);check(!cleanup.contains("pm enable")&&!cleanup.contains("install-existing"),"overbroad package reset");
  check(cleanup.contains("[ \"$HASH\" = \"$EXPECTED\" ] || fail records_changed"),"missing exact-byte cleanup gate");
  check(cleanup.contains("/data/adb/ls_augment/v2/*"),"missing fixed root allowlist");
  if(args.length==1)try{java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),cleanup);}catch(Exception e){throw new RuntimeException(e);}
  System.out.println("TOTAL HIDE RESET RESULT "+tests+" cases, "+checks+" assertions passed");
 }
}
'''


def main():
    with tempfile.TemporaryDirectory(prefix='lsa-hide-total-reset-') as temporary:
        folder = Path(temporary)
        sources = []
        for relative, text in {**STUBS, 'ls/augment/com/TestHideTotalReset.java': TEST}.items():
            path = folder / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding='utf-8')
            sources.append(str(path))
        production = ['HideResetController.java', 'HideResetStorage.java', 'HideTargetCodec.java',
                      'HideTargetStore.java', 'HideRecoveryCatalog.java', 'HideRecoveryJournal.java',
                      'HideRestoreGrantLedger.java', 'RootShell.java']
        classes = folder / 'classes'
        subprocess.run(['javac', '--release', '17', '-encoding', 'UTF-8', '-d', str(classes),
                        *[str(JAVA / name) for name in production], *sources], check=True, timeout=45)
        script = folder / 'storage.sh'
        subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.TestHideTotalReset', str(script)], check=True, timeout=30)
        shell_fixture(folder, script.read_text(encoding='utf-8'))


def shell_fixture(folder, production):
    """Execute the real allowlist/stamp/delete shell in a fresh temporary directory.

    Root ownership, flock and fsync are doubles; real file reads, inventory, hashes,
    source-change rejection, path allowlisting, and deletion operate only on fixtures.
    """
    shell = Path('C:/Program Files/Git/bin/bash.exe') if os.name == 'nt' else Path('/bin/bash')
    if not shell.exists():
        raise RuntimeError('A local shell is required for the isolated storage fixture')
    sandbox = (folder / 'root-storage').resolve()
    assert sandbox.parent == folder.resolve(), 'Fixture target escaped temporary directory'
    sandbox.mkdir()
    root = sandbox / 'ls_augment/v2'
    root.mkdir(parents=True)
    targets = root / 'manual-targets-v1'
    targets.mkdir()
    (targets / 'document').write_text('fixture target state\n', encoding='ascii')
    (targets / 'lock').write_text('', encoding='ascii')
    journal = root / 'recovery-journal-v1/events'
    journal.mkdir(parents=True)
    (journal / 'fixture.record').write_text('fixture immutable state\n', encoding='ascii')
    unrelated = root / 'runtime.properties'
    unrelated.write_text('must remain\n', encoding='ascii')
    shim = r'''
id() { if [ "$1" = -u ]; then printf '0\n'; else command id "$@"; fi; }
stat() {
  if [ "$1" = -c ] && [ "$2" = '%u:%g:%a' ]; then
    if [ -d "$3" ]; then printf '0:0:700\n'; else printf '0:0:600\n'; fi
  else command stat "$@"; fi
}
flock() { return 0; }
fsync() { return 0; }
'''
    # Both checked absolute roots and the deletion-case guard are replaced together.
    # No source-derived path or selected system package is substituted here.
    posix_sandbox = sandbox.as_posix()
    if os.name == 'nt':
        posix_sandbox = '/' + posix_sandbox[0].lower() + posix_sandbox[2:]
    rewritten = shim + production.replace('/data/adb', posix_sandbox)
    marker = "EXPECTED='" + 'd' * 64 + "'"

    def run(expected):
        assert marker in rewritten
        script = folder / 'fixture-storage.sh'
        script.write_text(rewritten.replace(marker, "EXPECTED='" + expected + "'"), encoding='utf-8', newline='\n')
        syntax = subprocess.run([str(shell), '-n', str(script)], capture_output=True, text=True, timeout=15)
        assert syntax.returncode == 0, syntax.stderr
        return subprocess.run([str(shell), str(script)], capture_output=True, text=True, timeout=15)

    first = run('')
    assert first.returncode == 0, first.stderr
    stamp = first.stdout.strip()
    assert len(stamp) == 64
    second = run('')
    assert second.returncode == 0 and second.stdout.strip() == stamp, second.stderr
    (targets / 'document').write_text('changed fixture state\n', encoding='ascii')
    rejected = run(stamp)
    assert rejected.returncode != 0 and 'records_changed' in rejected.stderr
    assert (targets / 'document').exists() and (journal / 'fixture.record').exists()
    fresh = run('')
    assert fresh.returncode == 0, fresh.stderr
    cleared = run(fresh.stdout.strip())
    assert cleared.returncode == 0 and cleared.stdout.strip() == 'LSA_HIDE_RESET_CLEARED', cleared.stderr
    assert not targets.exists() and not journal.parent.exists()
    assert unrelated.read_text(encoding='ascii') == 'must remain\n'
    print('PASS isolated storage shell: syntax, stable exact stamp, changed-source retention, allowlisted cleanup, unrelated runtime preservation')


if __name__ == '__main__':
    main()
