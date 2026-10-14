"""Execute production confirmed/scoped dispatch and batch methods with transport doubles.

This verifies full-selection confirmation, subset authorization, space identities,
queue ordering and the exact targets sent to HideTargetController. It does not
execute Root commands or write phone configuration.
"""
from pathlib import Path
import argparse
import importlib.util
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com"
spec = importlib.util.spec_from_file_location("hide_scope_extract", ROOT / "tools/test-hide-automation-scope.py")
extract = importlib.util.module_from_spec(spec)
spec.loader.exec_module(extract)

FIXTURE = r'''
package ls.augment.com;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.locks.ReentrantLock;
import java.util.function.Consumer;

class AppConfig {
 static final String HIDE_MASTER="master";
 boolean enabled=true;
 boolean getBoolean(String key){return enabled;}
}
class ResetWriteFence {static boolean reset;static boolean stale(long generation){return reset;}}
class AuditLog {static void write(Object context,String action,String message){TestHideScopedActions.locked();}}
class HideUserIdentity {
 static class Snapshot {final boolean success;final String message;
  Snapshot(boolean success){this.success=success;message=success?"":"空间身份变化";}}
}
class HideTargetController {
 static final List<String> commands=new ArrayList<>();static RootHideManager.Target failed;
 static HideTargetController forCheckedBatch(Object context,RootHideManager manager,RootHideManager.RootStatus root){
  TestHideScopedActions.locked();return new HideTargetController();}
 RootHideManager.OperationResult hide(RootHideManager.Target target){return command(target,true);}
 RootHideManager.OperationResult showInConfirmedBatch(RootHideManager.Target target){return command(target,false);}
 private RootHideManager.OperationResult command(RootHideManager.Target target,boolean hide){
  TestHideScopedActions.locked();commands.add((hide?"hide:":"show:")+target.encode());
  return target.equals(failed)?RootHideManager.OperationResult.failure("fixture command failed")
   :RootHideManager.OperationResult.success("fixture observed success");}
}
class RootHideManager {
 static final ReentrantLock ACTION_LOCK=new ReentrantLock();
 static final String RESET_REQUIRED="配置已被重置";
 static final Set<String> PROTECTED;
 enum RootState{GRANTED,DENIED,UNAVAILABLE,TIMEOUT}
 final Object context=new Object();final AppConfig config=new AppConfig();final long actionGeneration=0;
 final Set<Target> saved=new LinkedHashSet<>(),installed=new LinkedHashSet<>();
 final Map<Integer,Long> serials=new LinkedHashMap<>();
 boolean valid=true,conflict;RootState root=RootState.GRANTED;int mirrors,directoryReads;
 RootHideManager(Set<Target> targets){saved.addAll(targets);installed.addAll(targets);
  serials.put(0,100L);serials.put(10,200L);serials.put(999,300L);}
 RootStatus rootStatus(){TestHideScopedActions.locked();return new RootStatus(root,"root unavailable","fixture");}
 HideTargetCodec.Selection selectionStatus(){TestHideScopedActions.locked();
  return HideTargetCodec.parse(valid?HideTargetCodec.encode(saved):"!invalid");}
 Set<Target> targets(){TestHideScopedActions.locked();return new LinkedHashSet<>(saved);}
 static class ConflictState {final boolean conflict;ConflictState(boolean conflict){this.conflict=conflict;}boolean hasConflict(){return conflict;}}
 ConflictState conflictState(){TestHideScopedActions.locked();return new ConflictState(conflict);}
 UserDirectory listUsersResult(boolean prompt){TestHideScopedActions.locked();directoryReads++;
  List<UserRecord> users=new ArrayList<>();for(var entry:serials.entrySet())users.add(new UserRecord(entry.getKey(),entry.getValue(),"fixture"));
  return UserDirectory.success(users);}
 UserResolution resolveCurrentUser(UserDirectory directory){
  return UserResolution.resolve(true,"10",false,"",directory.userIds());}
 Set<Target> userInstalledTargets(Set<Target> requested){TestHideScopedActions.locked();
  Set<Target> result=new LinkedHashSet<>(requested);result.retainAll(installed);return result;}
 HideUserIdentity.Snapshot matchUser(Target target){TestHideScopedActions.locked();
  return new HideUserIdentity.Snapshot(Objects.equals(serials.get(target.userId),target.userSerial));}
 OperationResult syncMirrors(){TestHideScopedActions.locked();mirrors++;return OperationResult.success("mirrored");}
 METHODS
}
public class TestHideScopedActions {
 static int passed;static final RootHideManager.Target A=target(0,100,"org.example.a"),
  B=target(10,200,"org.example.b"),C=target(10,200,"org.example.c"),D=target(999,300,"org.example.d");
 interface Case{void run()throws Exception;}
 static RootHideManager.Target target(int user,long serial,String name){return new RootHideManager.Target(user,serial,name);}
 static Set<RootHideManager.Target> set(RootHideManager.Target... targets){return new LinkedHashSet<>(Arrays.asList(targets));}
 static RootHideManager manager(){return new RootHideManager(set(A,B,C,D));}
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 static void locked(){check(RootHideManager.ACTION_LOCK.isHeldByCurrentThread(),"dispatch escaped action queue lock");}
 static void test(String name,Case run)throws Exception{
  HideTargetController.commands.clear();HideTargetController.failed=null;ResetWriteFence.reset=false;
  run.run();passed++;System.out.println("PASS "+name);}
 static void commands(boolean hide,RootHideManager.Target... targets){
  List<String> expected=new ArrayList<>();for(var target:targets)expected.add((hide?"hide:":"show:")+target.encode());
  check(expected.equals(HideTargetController.commands),"Wrong command targets: "+HideTargetController.commands);}
 static void rejected(RootHideManager manager,RootHideManager.OperationResult result,String message){
  check(!result.success&&result.message.contains(message),"Wrong rejection: "+result.message);
  commands(false);check(manager.mirrors==0&&manager.directoryReads==0,"Rejected request touched action prerequisites or mirrors");}
 public static void main(String[] args)throws Exception{
  test("single target hide keeps complete saved selection",()->{
   var m=manager();var selection=set(A,B,C,D);var progress=new ArrayList<String>();
   check(m.changeConfirmed(true,selection,set(B),progress::add).success,"Single hide failed");commands(true,B);
   check(m.saved.equals(selection)&&m.mirrors==1,"Subset changed selection or omitted summary sync");
   check(progress.stream().anyMatch(s->s.contains("1/1")),"Scoped progress used full selection count");});
  test("space subset show leaves other spaces untouched",()->{
   var m=manager();check(m.changeConfirmed(false,set(A,B,C,D),set(B,C),null).success,"Space show failed");commands(false,B,C);});
  test("explicit subset can span two spaces",()->{
   var m=manager();check(m.changeConfirmed(true,set(A,B,C,D),set(A,D),null).success,"Cross-space hide failed");commands(true,A,D);});
  test("old confirmed overload still acts on whole selection",()->{
   var m=manager();check(m.changeConfirmed(false,set(A,B,C,D),null).success,"Compatible action failed");commands(false,A,B,C,D);});
  test("legacy current-user hide and full show preserve their scopes",()->{
   var m=manager();check(m.hideAll(true).success,"Current-user hide failed");commands(true,B,C);
   HideTargetController.commands.clear();check(m.showAll().success,"Full show failed");commands(false,A,B,C,D);});
  test("unselected app rejects entire subset before writes",()->{
   var m=manager();var other=target(10,200,"org.example.other");
   rejected(m,m.changeConfirmed(false,set(A,B,C,D),set(B,other),null),"不在已确认名单");});
  test("same package in a different user instance is unauthorized",()->{
   var m=manager();rejected(m,m.changeConfirmed(true,set(A,B,C,D),set(target(10,201,B.packageName)),null),"不在已确认名单");});
  test("changed nonrequested target still invalidates full confirmation",()->{
   var m=manager();m.saved.remove(D);rejected(m,m.changeConfirmed(false,set(A,B,C,D),set(B),null),"配置应用已变化");});
  test("empty and null subsets never fall back to whole selection",()->{
   var m=manager();rejected(m,m.changeConfirmed(false,set(A,B,C,D),set(),null),"没有已配置应用");
   rejected(m,m.changeConfirmed(false,set(A,B,C,D),null,null),"操作应用未确认");
   rejected(m,m.changeConfirmed(false,null,set(B),null),"应用名单未确认");});
  test("queued action rechecks full selection after obtaining lock",()->{
   var m=manager();var started=new CountDownLatch(1);var worker=Executors.newSingleThreadExecutor();
   Future<RootHideManager.OperationResult> queued;
   RootHideManager.ACTION_LOCK.lock();
   try{queued=worker.submit(()->{started.countDown();return m.changeConfirmed(false,set(A,B,C,D),set(B),null);});
    check(started.await(5,TimeUnit.SECONDS),"Worker did not start");m.saved.remove(D);
   }finally{RootHideManager.ACTION_LOCK.unlock();}
   try{rejected(m,queued.get(5,TimeUnit.SECONDS),"配置应用已变化");}finally{worker.shutdownNow();}});
  test("request snapshot remains stable if caller mutates original set",()->{
   var m=manager();var selection=set(A,B,C,D);var subset=set(B);
   check(m.changeConfirmed(false,selection,subset,message->{selection.clear();subset.clear();subset.add(A);}).success,"Snapshot action failed");
   commands(false,B);check(m.saved.equals(set(A,B,C,D)),"Caller mutation altered saved selection");});
  test("fresh identity validation rejects a recycled selected space",()->{
   var m=manager();m.serials.put(10,201L);
   var result=m.changeConfirmed(true,set(A,B,C,D),set(B),null);
   check(!result.success&&result.message.contains("空间身份变化"),"Changed identity was accepted");commands(false);});
  test("subset retains protected-app and installed-app validation",()->{
   var protectedApp=target(0,100,"com.android.settings");var m=new RootHideManager(set(protectedApp));
   check(!m.changeConfirmed(false,set(protectedApp),set(protectedApp),null).success,"Protected app action allowed");commands(false);
   m=manager();m.installed.remove(B);check(!m.changeConfirmed(true,set(A,B,C,D),set(B),null).success,"Missing app action allowed");commands(false);});
  test("disabled hiding still permits explicit show",()->{
   var m=manager();m.config.enabled=false;
   rejected(m,m.changeConfirmed(true,set(A,B,C,D),set(B),null),"总开关未启用");
   check(m.changeConfirmed(false,set(A,B,C,D),set(B),null).success,"Recovery unavailable when disabled");commands(false,B);});
  test("transport failure stops subset without expanding or retrying",()->{
   var m=manager();HideTargetController.failed=B;
   check(!m.changeConfirmed(false,set(A,B,C,D),set(B,C),null).success,"Partial failure reported success");commands(false,B);});
  test("reset fence blocks new subset interface",()->{
   var m=manager();ResetWriteFence.reset=true;rejected(m,m.changeConfirmed(false,set(A,B,C,D),set(B),null),"配置已被重置");});
  System.out.println("PASS "+passed+" scoped action cases; production dispatch/batch, offline transport doubles.");
 }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manager-source", type=Path, default=SOURCE / "RootHideManager.java")
    args = parser.parse_args()
    source = args.manager_source.read_text(encoding="utf-8-sig")
    signatures = (
        "    OperationResult hideAll(boolean currentUserOnly)",
        "    OperationResult showAll()",
        "    private OperationResult changeAll(boolean hide, boolean currentUserOnly) {",
        "    private OperationResult changeAll(boolean hide, boolean currentUserOnly, RootStatus checkedRoot) {",
        "    OperationResult changeConfirmed(boolean hide, Set<Target> confirmed,",
        "    OperationResult changeConfirmed(boolean hide, Set<Target> confirmedSelection,",
        "    private OperationResult changeAll(boolean hide, boolean currentUserOnly, RootStatus checkedRoot,\n            Set<Target> confirmed, java.util.function.Consumer<String> progress)",
        "    private OperationResult changeAll(boolean hide, boolean currentUserOnly, RootStatus checkedRoot,\n            Set<Target> confirmed, Set<Target> requested,",
        "    private HideBatchExecutor.Outcome<Target> executeBatch(Set<Target> targets, boolean hide,",
        "    private static void reportProgress(",
        "    static boolean isProtected(",
        "    static {",
        "    static final class Target extends",
        "    static final class UserRecord {",
        "    static final class UserDirectory {",
        "    static final class RootStatus {",
        "    static final class OperationResult {",
    )
    methods = "\n".join(extract.member(source, signature) for signature in signatures)
    java = FIXTURE.replace("METHODS", methods)
    with tempfile.TemporaryDirectory(prefix="lsa-hide-scoped-actions-") as directory:
        fixture = Path(directory) / "TestHideScopedActions.java"
        fixture.write_text(java, encoding="utf-8")
        subprocess.run(["javac", "-encoding", "UTF-8", "--release", "17", "-d", directory, str(fixture),
                        str(SOURCE / "HideTargetCodec.java"), str(SOURCE / "UserResolution.java"),
                        str(SOURCE / "HideBatchExecutor.java")], check=True, timeout=60)
        subprocess.run(["java", "-cp", directory, "ls.augment.com.TestHideScopedActions"], check=True, timeout=30)


if __name__ == "__main__":
    main()
