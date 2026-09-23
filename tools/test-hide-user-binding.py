"""Offline user-lifetime regressions using complete production backend classes.

Compiles the real manager, codecs, identity readers, recorder, executor, journal,
package snapshot parser and typed Root client/pending store/protocol. Android,
configuration persistence, RootShell, transaction storage I/O and the system
transaction boundary are explicit in-memory models. No adb/su/device is used.
The final boundary case verifies original serial propagation and rejection by
the modeled service; it does not prove actual ART/G or filesystem durability.
"""
from pathlib import Path
import argparse
import contextlib
import datetime
import hashlib
import json
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com"
REAL = ("RootHideManager", "HideUserIdentity", "HideRecoveryIdentity", "HideTargetCodec",
        "HideMutationRecorder", "HideBatchExecutor", "HideRecoveryJournal",
        "HidePackageSnapshot", "UserResolution", "ScreenAutomationPolicy",
        "HideRootClient", "HideRootPendingStore", "HideRootProtocol",
        "HideRestoreGrantLedger", "HideRestoreGrantStore")

STUBS = {
"android/content/SharedPreferences.java": r'''package android.content;
import java.util.*;
public class SharedPreferences {
 public final Map<String,Object> values=new HashMap<>();
 public boolean contains(String k){return values.containsKey(k);}
 public String getString(String k,String d){return (String)values.getOrDefault(k,d);}
 public boolean getBoolean(String k,boolean d){return (boolean)values.getOrDefault(k,d);}
 public Editor edit(){return new Editor();}
 public class Editor {
  public Editor putString(String k,String v){values.put(k,v);return this;}
  public Editor putBoolean(String k,boolean v){values.put(k,v);return this;}
  public boolean commit(){return true;} public void apply(){}
 }
}''',
"android/content/Context.java": r'''package android.content;
import java.util.*; import android.os.*; import android.content.pm.*;
public class Context {
 public static final int MODE_PRIVATE=0;
 public final UserManager users=new UserManager(); public final PowerManager power=new PowerManager();
 public final PackageManager pm=new PackageManager();
 public final Map<String,SharedPreferences> prefs=new HashMap<>();
 public Context getApplicationContext(){return this;}
 public SharedPreferences getSharedPreferences(String n,int m){return prefs.computeIfAbsent(n,k->new SharedPreferences());}
 public <T>T getSystemService(Class<T> c){return c.cast(c==UserManager.class?users:power);}
 public PackageManager getPackageManager(){return pm;}
 public ApplicationInfo getApplicationInfo(){return new ApplicationInfo();}
}''',
"android/os/UserHandle.java": r'''package android.os;
public final class UserHandle {
 public final int id; private UserHandle(int i){id=i;}
 public static UserHandle getUserHandleForUid(int uid){return new UserHandle(uid/100000);}
 public boolean equals(Object x){return x instanceof UserHandle&&id==((UserHandle)x).id;}
 public int hashCode(){return id;}
}''',
"android/os/UserManager.java": r'''package android.os;
import java.util.*;
public class UserManager {
 public final Map<Integer,Long> actual=new LinkedHashMap<>(),cached=new HashMap<>();
 public int reads,reverseReads; public boolean fail,reverseFail; public Runnable afterRead,onEveryRead;
 public long getSerialNumberForUser(UserHandle h){
  reads++;if(fail)throw new SecurityException();long value=cached.getOrDefault(h.id,actual.getOrDefault(h.id,-1L));
  if(afterRead!=null){Runnable r=afterRead;afterRead=null;r.run();}
  if(onEveryRead!=null)onEveryRead.run();return value;
 }
 public UserHandle getUserForSerialNumber(long serial){
  reverseReads++;if(reverseFail)throw new SecurityException();
  for(Map.Entry<Integer,Long> e:actual.entrySet())if(e.getValue()==serial)return UserHandle.getUserHandleForUid(e.getKey()*100000);
  return null;
 }
}''',
"android/os/PowerManager.java": r'''package android.os;
public class PowerManager { public boolean interactive; public boolean isInteractive(){return interactive;} }''',
"android/content/pm/ApplicationInfo.java": r'''package android.content.pm;
public class ApplicationInfo {
 public static final int FLAG_SYSTEM=1,FLAG_UPDATED_SYSTEM_APP=2;
 public int uid=10001,flags;public String packageName="org.example.app";
 public CharSequence loadLabel(PackageManager pm){return packageName;}
}''',
"android/content/pm/PackageInfo.java": r'''package android.content.pm;
public class PackageInfo { public long firstInstallTime=1; }''',
"android/content/pm/PackageManager.java": r'''package android.content.pm;
import java.util.*;
public class PackageManager {
 public static final int MATCH_DISABLED_COMPONENTS=1,MATCH_UNINSTALLED_PACKAGES=2;
 public boolean fail;public final Set<String> system=new HashSet<>();
 public ApplicationInfo getApplicationInfo(String pkg,int flags){
  if(fail)throw new IllegalStateException();ApplicationInfo a=new ApplicationInfo();a.packageName=pkg;
  if(system.contains(pkg))a.flags=ApplicationInfo.FLAG_SYSTEM;return a;
 }
 public PackageInfo getPackageInfo(String pkg,int flags){return new PackageInfo();}
 public List<ApplicationInfo> getInstalledApplications(int flags){return List.of(getApplicationInfo("org.example.app",flags));}
}''',
}

FIXTURE = r'''
package ls.augment.com;
import android.content.Context;
import java.util.*;
import java.util.regex.*;
import java.lang.reflect.*;

class AppConfig {
 static final String HIDE_TARGETS="targets",HIDE_MASTER="master",DIAGNOSTICS="diagnostics",
 AUTOMATION_ENABLED="auto",AUTOMATION_SCOPE="scope";
 static final Map<String,String> values=new HashMap<>();static int saves;
 AppConfig(Context c){} String get(String k){return values.getOrDefault(k,"");}
 boolean getBoolean(String k){return "true".equals(get(k));}
 void initializeRuntimeMirrorsIfNeeded(){}
 SaveResult save(Map<String,String> data){saves++;values.putAll(data);return new SaveResult();}
 static class SaveResult {boolean success=true,runtimeSynced=true;String message="";}
}
class ConfigSchema {static String normalize(String k,String v){return v;}}
class AuditLog {static void write(Context c,String action,String message){}}
class RuntimeStateStore {
 static String hidden="",aggregate="";static int writes;
 static RootShell.Result publishHidden(Context c,String value,String state){hidden=value;aggregate=state;writes++;return RootShell.ok("");}
}
class HideRecoveryArchive {
 static final List<String> raw=new ArrayList<>();static Runnable after;
 static RootShell.Result preserve(String value){raw.add(value);if(after!=null){Runnable r=after;after=null;r.run();}return RootShell.ok("");}
}
class HideRecoveryEmergency {
 static String root="";static Runnable afterWrite;
 static RootShell.Result install(){return RootShell.ok("");}
 static RootShell.Result writeTargets(String value){root=value;if(afterWrite!=null){Runnable r=afterWrite;afterWrite=null;r.run();}return RootShell.ok("");}
}
class RootShell {
 static int pmCalls,snapshots,identities;static boolean deny,inventoryFail,supplementalInventoryFail,journalDeny,identityUnknown;
 static Runnable afterPrepared,afterSnapshot,afterInventory,beforePm,afterPm;
 static final List<HideRootProtocol.Request> requests=new ArrayList<>();
 static final Map<String,HideRootProtocol.Request> reserved=new LinkedHashMap<>();
 static final Map<String,HideRootProtocol.Outcome> outcomes=new HashMap<>();
 // Fixed operation envelopes are modeled in memory. Real shell/fsync is tested elsewhere.
 static final Map<String,List<String>> slotRecords=new HashMap<>(),slotTerminals=new HashMap<>();
 static final List<HideRecoveryJournal.Entry> journal=new ArrayList<>();
 static final List<String> commands=new ArrayList<>();
 static final Set<String> hidden=new LinkedHashSet<>();
 static final Set<String> missing=new LinkedHashSet<>();
 static String quote(String s){return "'"+s.replace("'","'\"'\"'")+"'";}
 static Result ok(String s){return new Result(0,s,false);}
 static Result wire(int code,String s){return new Result(code,s,false,new CapturedOutput(s.getBytes(java.nio.charset.StandardCharsets.US_ASCII),true,false,false));}
 static String variable(String command,String key){
  Matcher m=Pattern.compile("(?m)^"+key+"='([^']*)'$").matcher(command);
  if(!m.find())throw new AssertionError("missing fixed operation variable "+key);return m.group(1);
 }
 static Result pending(String command){
  String mode=variable(command,"MODE"),key=variable(command,"KEY");
  List<String> rows=slotRecords.computeIfAbsent(key,k->new ArrayList<>()),done=slotTerminals.computeIfAbsent(key,k->new ArrayList<>());
  if(mode.equals("READ"))return wire(0,"LSARTS1\n"+(rows.isEmpty()?"EMPTY":"RECORD|"+rows.get(rows.size()-1)+"\nTERMINAL|"+done.get(done.size()-1))+"\nLSARTS_END\n");
  Matcher m=Pattern.compile("(?m)^SLOT=([0-9]+)$").matcher(command);if(!m.find())throw new AssertionError("slot absent");int slot=Integer.parseInt(m.group(1));
  String record=variable(command,"RECORD"),terminal=variable(command,"TERMINAL");
  if(mode.equals("CLAIM")){
   if(slot!=rows.size()||slot>0&&done.get(slot-1).equals("-"))return new Result(74,"modeled claim rejected",false);
   rows.add(record);done.add("-");return wire(0,"LSARTS1\nCLAIMED|"+record+"\nLSARTS_END\n");
  }
  if(!mode.equals("FINISH")||slot>=rows.size()||!rows.get(slot).equals(record)
    ||!HideRootPendingStore.terminal(terminal)||!done.get(slot).equals("-")&&!done.get(slot).equals(terminal))return new Result(74,"modeled finish rejected",false);
  done.set(slot,terminal);return wire(0,"LSARTS1\nFINISHED|"+record+"|"+terminal+"\nLSARTS_END\n");
 }
 static Result transaction(String command){
  List<String> args=new ArrayList<>();Matcher m=Pattern.compile("'([^']*)'").matcher(command);while(m.find())args.add(m.group(1));
  if(args.size()<5||!args.get(0).equals(HideRootProtocol.COMMAND))throw new AssertionError("invalid typed command");
  HideRootProtocol.Verb verb=HideRootProtocol.Verb.valueOf(args.get(1));
  HideRootProtocol.Request r=new HideRootProtocol.Request(verb,Integer.parseInt(args.get(2)),Long.parseLong(args.get(3)),args.get(4),args.size()==6?args.get(5):null);
  if(!command.equals(r.command()))throw new AssertionError("noncanonical typed request");requests.add(r);
  String nonce=r.nonce;HideRootProtocol.Outcome outcome;
  if(verb==HideRootProtocol.Verb.PREPARE){nonce=java.util.UUID.randomUUID().toString();reserved.put(nonce,r);outcome=HideRootProtocol.Outcome.RESERVED;}
  else if(!reserved.containsKey(nonce))outcome=HideRootProtocol.Outcome.UNKNOWN_NONCE;
  else if(verb==HideRootProtocol.Verb.STATUS)outcome=outcomes.getOrDefault(nonce,HideRootProtocol.Outcome.RESERVED);
  else {
   HideRootProtocol.Request prepared=reserved.get(nonce);
   if(prepared.userId!=r.userId||prepared.serial!=r.serial||!prepared.packageName.equals(r.packageName))outcome=HideRootProtocol.Outcome.NONCE_CONFLICT;
   else if(outcomes.containsKey(nonce))outcome=outcomes.get(nonce);
   else {
    if(beforePm!=null){Runnable callback=beforePm;beforePm=null;callback.run();}
    // This is the explicit service-boundary model, not another client UserManager read.
    Long actual=TestHideUserBinding.ctx.users.actual.get(r.userId);
    if(actual==null||actual.longValue()!=r.serial)outcome=HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE;
    else if(hidden.contains(r.userId+":"+r.packageName))outcome=HideRootProtocol.Outcome.NOOP;
    else {pmCalls++;hidden.add(r.userId+":"+r.packageName);outcome=HideRootProtocol.Outcome.CHANGED;
     if(afterPm!=null){Runnable callback=afterPm;afterPm=null;callback.run();}}
    outcomes.put(nonce,outcome);
   }
  }
  HideRootProtocol.Reply reply=new HideRootProtocol.Reply(r,nonce,outcome);return wire(reply.exitCode(),reply.encode()+"\n");
 }
 static Result run(String command,String input,long timeout,int max){
  commands.add(command);Context c=TestHideUserBinding.ctx;
  if(deny)return new Result(126,"denied",false);
  if(command.startsWith("MODE='"))return pending(command);
  if(command.startsWith("/system/bin/cmd package '"+HideRootProtocol.COMMAND+"'"))return transaction(command);
  if(command.contains("printf 'uid='"))return ok("uid=0|provider=Root");
  if(command.contains("old_pkg=0"))return ok("old_pkg=0;old_module=0");
  if(command.equals("pm list users 2>/dev/null")){
   StringBuilder b=new StringBuilder();for(int id:c.users.actual.keySet())b.append("UserInfo{").append(id).append(":User:0}\n");return ok(b.toString());
  }
  if(command.startsWith("cmd activity")||command.startsWith("am get-current"))return ok("0");
  if(command.contains("pm list packages")){
   if(afterInventory!=null){Runnable r=afterInventory;afterInventory=null;r.run();}
   boolean all=command.contains(" -u ");
   if(inventoryFail||(all&&supplementalInventoryFail))return new Result(1,"failed",false);
   Matcher user=Pattern.compile("--user ([0-9]+)").matcher(command);if(!user.find())throw new AssertionError("inventory user absent");
   String id=user.group(1);StringBuilder inventory=new StringBuilder();
   for(String pkg:List.of("org.example.app","org.example.other"))
    if(!c.pm.system.contains(pkg)&&(all||(!hidden.contains(id+":"+pkg)&&!missing.contains(id+":"+pkg))))inventory.append("package:").append(pkg).append('\n');
   return ok(inventory.toString());
  }
  if(input!=null&&input.startsWith("LSARJ1|")){
   if(journalDeny)return new Result(1,"journal denied",false);
   boolean prepared=false;
   for(String line:input.split("\n")){HideRecoveryJournal.Entry e=HideRecoveryJournal.parse(line);if(e==null)throw new AssertionError("invalid real journal");journal.add(e);prepared|=e.stage==HideRecoveryJournal.Stage.PREPARED;}
   if(prepared&&afterPrepared!=null){Runnable r=afterPrepared;afterPrepared=null;r.run();}
   return ok("LSA_RECOVERY_JOURNAL_OK");
  }
  if(command.contains("LSA_PACKAGE_IDENTITY_END")){
   identities++;if(identityUnknown)return ok("LSA_PACKAGE_IDENTITY_END:0");
   Matcher pkg=Pattern.compile("/system/bin/dumpsys package '([^']+)'").matcher(command);if(!pkg.find())throw new AssertionError("identity package absent");
   // Actual HideRecoveryIdentity parses this finite Android dump shape; it is not a fake hash getter.
   StringBuilder dump=new StringBuilder("Packages:\n  Package ["+pkg.group(1)+"] (abcdef):\n    appId=10001\n");
   for(int id:c.users.actual.keySet())dump.append("    User ").append(id).append(": installed=true\n      firstInstallTime=2025-01-01 00:00:00\n");
   return ok(dump+"LSA_PACKAGE_IDENTITY_END:0");
  }
  if(command.contains("LSA_BEGIN:")){
   snapshots++;StringBuilder b=new StringBuilder();Matcher m=Pattern.compile("LSA_BEGIN:([A-Za-z0-9_.]+):").matcher(command);
   while(m.find()){String pkg=m.group(1);b.append("LSA_BEGIN:").append(pkg).append(":0\n");
    for(int id:c.users.actual.keySet())b.append(" User ").append(id).append(": installed=").append(!missing.contains(id+":"+pkg)).append(" hidden=").append(hidden.contains(id+":"+pkg)).append('\n');
    b.append("LSA_END:").append(pkg).append('\n');}
   if(afterSnapshot!=null){Runnable r=afterSnapshot;afterSnapshot=null;r.run();}return ok(b.toString());
  }
  if(command.contains("/system/bin/pm hide --user ")){
   if(!Boolean.getBoolean("lsa.historical"))throw new AssertionError("production manager emitted removed bare-PM path");
   if(beforePm!=null){Runnable r=beforePm;beforePm=null;r.run();}
   Matcher m=Pattern.compile("/system/bin/pm hide --user ([0-9]+) '([^']+)'").matcher(command);
   while(m.find()){pmCalls++;hidden.add(m.group(1)+":"+m.group(2));}
   if(afterPm!=null){Runnable r=afterPm;afterPm=null;r.run();}return ok("");
  }
  throw new AssertionError("Unmodelled Root command "+command);
 }
 static final class CapturedOutput {
  private final byte[] bytes;final boolean complete,failed,truncated;
  CapturedOutput(byte[] b,boolean c,boolean f,boolean t){bytes=b.clone();complete=c;failed=f;truncated=t;}
  byte[] bytes(){return bytes.clone();}boolean reliable(){return complete&&!failed&&!truncated;}
 }
 static class Result {
  final int exitCode;final String output;final boolean timedOut;final CapturedOutput capture;
  Result(int c,String o,boolean t){this(c,o,t,null);}
  Result(int c,String o,boolean t,CapturedOutput capture){exitCode=c;output=o;timedOut=t;this.capture=capture;}
  boolean isSuccess(){return exitCode==0&&!timedOut;}String publicError(){return output;}
 }
}

public class TestHideUserBinding {
 static Context ctx;static RootHideManager manager;static int passed,failed;
 static final String PKG="org.example.app";
 static void reset(){
  ctx=new Context();ctx.users.actual.put(0,0L);ctx.users.actual.put(12,42L);ctx.users.actual.put(999,10L);
  manager=new RootHideManager(ctx);AppConfig.values.clear();AppConfig.values.put(AppConfig.HIDE_MASTER,"true");
  AppConfig.values.put(AppConfig.AUTOMATION_ENABLED,"true");AppConfig.values.put(AppConfig.AUTOMATION_SCOPE,"all");AppConfig.saves=0;
  RootShell.pmCalls=RootShell.snapshots=RootShell.identities=0;RootShell.deny=RootShell.inventoryFail=RootShell.supplementalInventoryFail=RootShell.journalDeny=RootShell.identityUnknown=false;
  RootShell.afterPrepared=RootShell.afterSnapshot=RootShell.afterInventory=RootShell.beforePm=RootShell.afterPm=null;
  RootShell.journal.clear();RootShell.commands.clear();RootShell.hidden.clear();RootShell.missing.clear();
  RootShell.requests.clear();RootShell.reserved.clear();RootShell.outcomes.clear();RootShell.slotRecords.clear();RootShell.slotTerminals.clear();
  HideRecoveryArchive.raw.clear();HideRecoveryArchive.after=null;HideRecoveryEmergency.afterWrite=null;HideRecoveryEmergency.root="";
  RuntimeStateStore.hidden="old";RuntimeStateStore.aggregate="";RuntimeStateStore.writes=0;
 }
 static RootHideManager.Target bound(int id,long serial){return new RootHideManager.Target(id,serial,PKG);}
 static Set<RootHideManager.Target> set(RootHideManager.Target... t){return new LinkedHashSet<>(Arrays.asList(t));}
 static void select(RootHideManager.Target... t){AppConfig.values.put(AppConfig.HIDE_TARGETS,HideTargetCodec.encode(set(t)));}
 static void check(boolean ok,String msg){if(!ok)throw new AssertionError(msg);}
 static void noWrites(){check(RootShell.pmCalls==0&&RootShell.journal.isEmpty(),"unexpected PM/journal mutation");}
 static void test(String name,Runnable task){reset();try{task.run();passed++;System.out.println("PASS "+name);}catch(Throwable e){failed++;System.out.println("FAIL "+name+": "+e);e.printStackTrace(System.out);}}
 public static void main(String[] args){
  test("zero serial and arbitrary users",()->{for(int id:new int[]{0,12,999})check(HideUserIdentity.read(ctx,id).success,"user rejected "+id);});
  test("forward cached old serial rejected by reverse",()->{ctx.users.cached.put(12,41L);check(!HideUserIdentity.read(ctx,12).success,"old cache authorized");});
  test("removal between forward and reverse",()->{ctx.users.afterRead=()->ctx.users.actual.remove(12);check(!HideUserIdentity.read(ctx,12).success,"split lookup authorized");});
  test("identity missing and permission failures",()->{ctx.users.actual.remove(12);check(!HideUserIdentity.read(ctx,12).success,"missing accepted");ctx.users.fail=true;check(!HideUserIdentity.read(ctx,0).success,"denied became user0");});
  test("reverse failure rejects",()->{ctx.users.reverseFail=true;check(!HideUserIdentity.read(ctx,12).success,"reverse failure accepted");});
  test("overflow never aliases to another user",()->{check(!HideUserIdentity.read(ctx,99999).success&&ctx.users.reads==0,"overflow queried aliased user");});
  test("legacy single and all do not bind",()->{RootHideManager.Target t=new RootHideManager.Target(12,PKG);select(t);check(!manager.hide(t).success&&!manager.hideAll(false).success,"legacy executed");noWrites();check(manager.targets().iterator().next().userSerial==-1,"legacy rebound");});
  test("pending retains original serial but cannot hide",()->{RootHideManager.Target t=new RootHideManager.Target(12,42,PKG,false);select(t);check(!manager.hide(t).success,"pending executed");noWrites();});
  test("recreated user does not inherit hide",()->{RootHideManager.Target t=bound(12,41);select(t);check(!manager.hide(t).success&&!manager.hideAll(false).success,"replacement inherited old selection");noWrites();});
  test("already hidden new user cannot count as success",()->{RootHideManager.Target t=bound(12,41);RootShell.hidden.add(t.toString());check(manager.queryState(t)==RootHideManager.State.ERROR,"replacement state leaked");check(!manager.hide(t).success,"already-hidden shortcut");noWrites();});
  test("snapshot user changes during dump",()->{RootHideManager.Target t=bound(12,42);RootShell.afterSnapshot=()->ctx.users.actual.put(12,43L);check(manager.queryState(t)==RootHideManager.State.ERROR,"old snapshot accepted");noWrites();});
  test("picker preserves captured user lifetime",()->{check(manager.listApps(12,41).isEmpty(),"stale picker rebound");check(!manager.listApps(12,42).isEmpty(),"current picker empty");check(manager.listApps(12,42).get(0).target.userSerial==42,"picker lacks serial");});
  test("picker Root read failure has no bound records",()->{RootShell.inventoryFail=true;check(manager.listApps(0,0).isEmpty(),"fallback created bindable records");});
  test("picker changes while listing",()->{RootShell.afterInventory=()->ctx.users.actual.put(12,43L);check(manager.listApps(12,42).isEmpty(),"changed picker accepted");});
  test("legacy hidden package is an unselected current-space candidate",()->{RootHideManager.Target old=new RootHideManager.Target(12,PKG);select(old);RootShell.hidden.add(old.toString());String raw=AppConfig.values.get(AppConfig.HIDE_TARGETS);RootHideManager.Target candidate=manager.listApps(12,42).stream().filter(a->a.target.packageName.equals(PKG)).findFirst().orElseThrow().target;check(candidate.isBound()&&candidate.userSerial==42&&!manager.targets().contains(candidate),"legacy candidate auto-selected or lacks current identity");check(AppConfig.values.get(AppConfig.HIDE_TARGETS).equals(raw)&&AppConfig.saves==0,"listing rebound legacy storage");noWrites();});
  test("pending hidden package keeps pending storage",()->{RootHideManager.Target old=new RootHideManager.Target(12,42,PKG,false);select(old);RootShell.hidden.add(old.toString());check(manager.listApps(12,42).stream().anyMatch(a->a.target.equals(bound(12,42))),"pending hidden package unavailable");check(manager.targets().contains(old)&&AppConfig.saves==0,"pending silently confirmed");noWrites();});
  test("old serial only supplies package discovery hint",()->{RootHideManager.Target old=bound(12,41);select(old);RootShell.hidden.add(old.toString());check(manager.listApps(12,42).stream().anyMatch(a->a.target.equals(bound(12,42))),"current installed package unavailable after old serial mismatch");check(manager.targets().contains(old)&&!manager.targets().contains(bound(12,42))&&AppConfig.saves==0,"old serial rebound");noWrites();});
  test("pending candidate absent in current user is excluded",()->{select(new RootHideManager.Target(12,PKG));RootShell.missing.add("12:"+PKG);check(manager.listApps(12,42).stream().noneMatch(a->a.target.packageName.equals(PKG)),"-u or local metadata invented current installation");noWrites();});
  test("pending system package is excluded",()->{select(new RootHideManager.Target(12,PKG));RootShell.hidden.add("12:"+PKG);ctx.pm.system.add(PKG);check(manager.listApps(12,42).stream().noneMatch(a->a.target.packageName.equals(PKG)),"system hint became user-app candidate");noWrites();});
  test("pending supplemental Root failure provides no candidate including user zero",()->{select(new RootHideManager.Target(0,PKG));RootShell.hidden.add("0:"+PKG);RootShell.hidden.add("0:org.example.other");RootShell.supplementalInventoryFail=true;check(manager.listApps(0,0).isEmpty(),"Root failure fell back to local metadata");check(AppConfig.saves==0,"failed candidate lookup changed selection");noWrites();});
  test("pending candidate revalidation lifetime change rejects entire picker",()->{select(new RootHideManager.Target(12,PKG));RootShell.hidden.add("12:"+PKG);ctx.users.onEveryRead=()->{if(ctx.users.reads==2)ctx.users.actual.put(12,43L);};check(manager.listApps(12,42).isEmpty(),"replacement candidate leaked into stale picker");check(ctx.users.reads>=2&&AppConfig.saves==0,"revalidation absent or changed selection");noWrites();});
  test("import requires pending and accepts missing users",()->{check(!manager.validateImportTargets(set(bound(12,42))).success,"bound import authorized");RootHideManager.Target t=new RootHideManager.Target(77,123,PKG,false);check(manager.validateImportTargets(set(t)).success,"pending missing import rejected");});
  test("pending save preserves unavailable user without binding",()->{RootHideManager.Target t=new RootHideManager.Target(77,123,PKG,false);select(t);check(manager.saveTargets(set(t)).success,"pending save blocked");check(AppConfig.values.get(AppConfig.HIDE_TARGETS).equals(t.encode()),"pending changed");noWrites();});
  test("stale existing binding is retained on ordinary save",()->{RootHideManager.Target t=bound(12,41);select(t);check(manager.saveTargets(set(t)).success,"stale existing selection discarded");check(manager.targets().contains(t),"stale binding replaced");noWrites();});
  test("new stale binding is rejected before store",()->{check(!manager.saveTargets(set(bound(12,41))).success,"stale new save accepted");check(AppConfig.saves==0&&HideRecoveryArchive.raw.isEmpty(),"new stale writes");});
  test("save archives exact original and new encoded proposal",()->{String old="12:"+PKG;AppConfig.values.put(AppConfig.HIDE_TARGETS,old);RootHideManager.Target t=bound(12,42);check(manager.saveTargets(set(t)).success,"bound save failed");check(HideRecoveryArchive.raw.get(0).equals(old)&&HideRecoveryArchive.raw.get(1).equals(t.encode()),"archive lost original/proposal");});
  test("user replaced during archive prevents private commit",()->{HideRecoveryArchive.after=()->ctx.users.actual.put(12,43L);check(!manager.saveTargets(set(bound(12,42))).success&&AppConfig.saves==0,"archive race saved");noWrites();});
  test("user replaced during root write prevents private commit",()->{HideRecoveryEmergency.afterWrite=()->ctx.users.actual.put(12,43L);check(!manager.saveTargets(set(bound(12,42))).success&&AppConfig.saves==0,"root-write race saved");check(!HideRecoveryArchive.raw.isEmpty(),"race lost records");noWrites();});
  test("unqueryable new target fails instead of being dropped",()->{ctx.pm.fail=true;RootShell.inventoryFail=true;check(!manager.saveTargets(set(bound(12,42))).success&&AppConfig.saves==0,"unknown target silently dropped");});
  test("normal hide records saved lifetime",()->{RootHideManager.Target t=bound(12,42);select(t);check(manager.hide(t).success,"normal hide failed");check(RootShell.pmCalls==1&&RootShell.journal.size()==2,"hide protocol incomplete");for(HideRecoveryJournal.Entry e:RootShell.journal)check(e.userSerial==42,"journal rebound");check(RuntimeStateStore.hidden.equals(t.encode()),"mirror omitted binding");});
  test("unknown package evidence cannot prepare typed hide",()->{RootShell.identityUnknown=true;check(!manager.hide(bound(12,42)).success,"unknown evidence accepted");check(RootShell.requests.isEmpty(),"unknown evidence reached typed PREPARE");noWrites();});
  test("durable prepared user change blocks PM",()->{RootHideManager.Target t=bound(12,42);RootShell.afterPrepared=()->ctx.users.actual.put(12,43L);check(!manager.hide(t).success,"prepared race allowed");check(RootShell.pmCalls==0&&RootShell.journal.size()==1,"prepared not retained");});
  test("prepared persistence denial is zero PM",()->{RootShell.journalDeny=true;check(!manager.hide(bound(12,42)).success,"denied journal allowed");check(RootShell.pmCalls==0,"PM without prepared");});
  test("typed batch retains each original lifetime at service boundary",()->{select(bound(0,0),bound(12,42));RootShell.afterPm=()->ctx.users.actual.put(12,43L);check(!manager.hideAll(false).success,"later target reused earlier check");check(RootShell.pmCalls==1&&!RootShell.hidden.contains("12:"+PKG),"replacement user mutated");List<HideRootProtocol.Request> hide=RootShell.requests.stream().filter(r->r.verb==HideRootProtocol.Verb.HIDE).toList();check(hide.size()==2&&hide.get(0).userId==0&&hide.get(0).serial==0&&hide.get(1).userId==12&&hide.get(1).serial==42,"batch request silently rebound or bypassed typed entry");check(RootShell.outcomes.get(hide.get(1).nonce)==HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE,"service did not reject second lifetime");});
  test("post-PM lifetime mismatch records ERROR and stops",()->{RootHideManager.Target t=bound(12,42);RootShell.afterPm=()->ctx.users.actual.put(12,43L);check(!manager.hide(t).success,"post race reported success");check(RootShell.journal.get(1).state.equals("ERROR"),"post identity not ERROR");});
  test("repeat hidden creates no extra journal",()->{RootHideManager.Target t=bound(12,42);check(manager.hide(t).success&&manager.hide(t).success,"repeat failed");check(RootShell.pmCalls==1&&RootShell.journal.size()==2,"repeat reclaims state");});
  test("same package per-user remains separate",()->{select(bound(0,0),bound(12,42),bound(999,10));check(manager.hideAll(false).success,"multiuser hide failed");check(RootShell.pmCalls==3&&RootShell.journal.size()==6,"user identities collapsed");});
  test("automation refuses stale selection",()->{select(bound(12,41));ctx.getSharedPreferences(AppConfig.DIAGNOSTICS,0).edit().putString("root_last_state","GRANTED").apply();check(!manager.runScreenOffAutomation().success,"automation rebound");noWrites();});
  test("tile toggle reports identity error before deciding action",()->{select(bound(12,41));RootHideManager.OperationResult r=manager.toggleAll();check(!r.success&&!r.reviewRequired,"toggle masked user mismatch as recovery request");noWrites();});
  test("mirror removes stale and pending targets",()->{RootHideManager.Target current=bound(0,0);select(current,bound(12,41),new RootHideManager.Target(999,PKG));RootShell.hidden.add("0:"+PKG);check(!manager.syncMirrors().success,"errors masked");check(RuntimeStateStore.hidden.equals(current.encode())&&RuntimeStateStore.aggregate.equals("ERROR"),"stale mirror retained");});
  test("invalid selection cannot become empty success",()->{AppConfig.values.put(AppConfig.HIDE_TARGETS,"broken-version");check(!manager.selectionStatus().valid&&manager.summary().aggregate==RootHideManager.Aggregate.ERROR,"invalid became empty");check(!manager.hideAll(false).success&&!manager.syncMirrors().success,"invalid operation succeeded");check(RuntimeStateStore.hidden.isEmpty()&&AppConfig.values.get(AppConfig.HIDE_TARGETS).equals("broken-version"),"invalid raw changed or mirror kept");noWrites();});
  test("recovery remains stopped",()->{check(!manager.show(bound(12,42)).success&&!manager.showAll().success&&!manager.emergencyRestore().success,"recovery reopened");noWrites();});
  test("final client check cannot authorize replacement at typed service boundary",()->{RootShell.beforePm=()->ctx.users.actual.put(12,43L);check(!manager.hide(bound(12,42)).success,"replacement reported success");List<HideRootProtocol.Request> hide=RootShell.requests.stream().filter(r->r.verb==HideRootProtocol.Verb.HIDE).toList();check(hide.size()==1&&hide.get(0).userId==12&&hide.get(0).serial==42,"original serial not carried to service");check(RootShell.pmCalls==0&&!RootShell.hidden.contains("12:"+PKG),"replacement mutated despite service rejection");check(RootShell.outcomes.get(hide.get(0).nonce)==HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE,"not an authoritative modeled rejection");check(RootShell.journal.size()==2&&RootShell.journal.get(1).state.equals("ERROR"),"original attempt observation missing");});
  System.out.println("Backend user binding: "+passed+" passed, "+failed+" failed; actual manager/client/store/protocol, modeled transport/service boundary; no ART or fsync proof.");
  if(failed!=0)System.exit(1);
 }
}
'''

def member(source, signature):
    """Extract an actual member without mistaking comment/string braces for code."""
    start = source.index(signature)
    index = source.index("{", start)
    depth, state = 0, "code"
    while index < len(source):
        char, pair = source[index], source[index:index + 2]
        if state == "line":
            if char == "\n":
                state = "code"
        elif state == "block":
            if pair == "*/":
                state = "code"
                index += 1
        elif state in ('"', "'"):
            if char == "\\":
                index += 1
            elif char == state:
                state = "code"
        elif pair in ("//", "/*"):
            state = "line" if pair == "//" else "block"
            index += 1
        elif char in ('"', "'"):
            state = char
        elif char == "{":
            depth += 1
        elif char == "}":
            depth -= 1
            if depth == 0:
                return source[start:index + 1]
        index += 1
    raise ValueError(f"Unclosed production member: {signature}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--before-manager", type=Path,
                        help="Negative control: run actual old operation members with current identity-bearing model adapters")
    parser.add_argument("--exclude-pending-candidates", action="store_true",
                        help="Fault injection only: restore the bound-only picker predicate, not a historical-source claim")
    parser.add_argument("--evidence-dir", type=Path,
                        help="Keep generated model sources, input copies and raw compiler/JVM outputs in a new directory")
    args = parser.parse_args()
    evidence = args.evidence_dir.resolve() if args.evidence_dir else None
    if evidence:
        evidence.mkdir(parents=True, exist_ok=False)
    source_bytes = {Path(__file__).resolve(): Path(__file__).read_bytes()}
    def load(path):
        path = path.resolve()
        source_bytes[path] = path.read_bytes()
        return source_bytes[path].decode("utf-8-sig")
    sources = dict(STUBS)
    for name in REAL:
        sources[f"ls/augment/com/{name}.java"] = load(SOURCE / f"{name}.java")
    if args.exclude_pending_candidates:
        key = "ls/augment/com/RootHideManager.java"
        predicate = "for (Target target : targets()) if (target.userId == userId && target.isValid()"
        if sources[key].count(predicate) != 1:
            raise ValueError("Picker candidate predicate changed; update fault injection explicitly")
        sources[key] = sources[key].replace(predicate, predicate
                    + " && target.isBound() && target.userSerial == expectedSerial")
        print("FAULT INJECTION: bound-only candidate predicate; this is not execution of a saved historical file.", flush=True)
    if args.before_manager:
        before = load(args.before_manager)
        key = "ls/augment/com/RootHideManager.java"
        for signature in (
            "OperationResult validateImportTargets(Set<Target> desired)",
            "OperationResult saveTargets(Set<Target> desired, Map<String, String> settings)",
            "Map<Target, State> queryStates(Set<Target> requested)",
            "private OperationResult changeAll(boolean hide, boolean currentUserOnly, RootStatus checkedRoot)",
            "private OperationResult changeValidated(Target target, boolean hide,",
            "private HideBatchExecutor.CommandResult recordHide(Set<Target> values)",
            "private RootShell.Result writeHiddenState(Set<Target> values, boolean hidden)",
            "OperationResult syncMirrors()",
        ):
            old = member(before, signature)
            if signature == "private RootShell.Result writeHiddenState(Set<Target> values, boolean hidden)" and signature not in sources[key]:
                # Negative-control source only: the live manager deliberately removed this member.
                end = sources[key].rfind("}")
                sources[key] = sources[key][:end] + "\n    " + old + "\n" + sources[key][end:]
            else:
                sources[key] = sources[key].replace(member(sources[key], signature), old)
        identity = args.before_manager.with_name("HideRecoveryIdentity.java")
        sources["ls/augment/com/HideRecoveryIdentity.java"] = load(identity)
        print("NEGATIVE CONTROL: 8 exact historical operation members plus old complete recovery identity; current model/picker/codec and typed-client field are compatibility adapters. Removed bare-PM member exists only in this generated negative-control source.", flush=True)
    sources["ls/augment/com/TestHideUserBinding.java"] = FIXTURE
    if evidence:
        inputs = []
        for index, (path, data) in enumerate(source_bytes.items()):
            copy = evidence / "input-copies" / f"{index:02d}-{path.name}"
            copy.parent.mkdir(parents=True, exist_ok=True)
            copy.write_bytes(data)
            inputs.append({"path": str(path), "copy": str(copy), "bytes": len(data),
                           "sha256": hashlib.sha256(data).hexdigest()})
        (evidence / "inputs.json").write_text(json.dumps({"inputs": inputs,
            "capturedAt": datetime.datetime.now(datetime.timezone.utc).isoformat()}, indent=2) + "\n", encoding="utf-8")
    folder_context = contextlib.nullcontext(str(evidence / "generated")) if evidence else tempfile.TemporaryDirectory(prefix="hide-user-binding-")
    records = []
    def execute(label, command):
        try:
            process = subprocess.run(command, capture_output=True, timeout=120)
            stdout, stderr, code, timed_out = process.stdout, process.stderr, process.returncode, False
        except subprocess.TimeoutExpired as failure:
            stdout, stderr, code, timed_out = failure.stdout or b"", failure.stderr or b"", None, True
        record = {"label": label, "command": command, "exitCode": code, "timedOut": timed_out}
        if evidence:
            for name, data in (("stdout", stdout), ("stderr", stderr)):
                out = evidence / f"{label}.{name}.bin"
                out.write_bytes(data)
                record[name] = {"path": str(out), "bytes": len(data), "sha256": hashlib.sha256(data).hexdigest()}
            (evidence / f"{label}.json").write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
        print(stdout.decode("utf-8", errors="replace"), end="", flush=True)
        print(stderr.decode("utf-8", errors="replace"), end="", flush=True)
        records.append(record)
        return code, stdout
    with folder_context as directory:
        folder = Path(directory)
        files = []
        for relative, text in sources.items():
            path = folder / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
            files.append(str(path))
        javac_exit, _ = execute("javac", ["javac", "--release", "17", "-encoding", "UTF-8", "-d", str(folder), *files])
        java_exit, output = None, b""
        if javac_exit == 0:
            print("Compiled 13 complete production backend/client/store/protocol classes; Android, storage I/O and service boundary are explicit offline models.", flush=True)
            java_exit, output = execute("jvm", ["java", f"-Dlsa.historical={str(bool(args.before_manager)).lower()}", "-cp", str(folder), "ls.augment.com.TestHideUserBinding"])
        if evidence:
            after = [{"path": str(p), "sha256": hashlib.sha256(p.read_bytes()).hexdigest(),
                      "unchanged": p.read_bytes() == data} for p, data in source_bytes.items()]
            matches = re.findall(rb"Backend user binding: (\d+) passed, (\d+) failed;", output)
            result = {"javacExit": javac_exit, "jvmExit": java_exit,
                "passedScenarios": int(matches[0][0]) if len(matches) == 1 else None,
                "failedScenarios": int(matches[0][1]) if len(matches) == 1 else None,
                "historicalManager": str(args.before_manager) if args.before_manager else None,
                "faultInjection": args.exclude_pending_candidates, "inputAfter": after,
                "allInputsUnchanged": all(row["unchanged"] for row in after),
                "sourceCount": len(sources), "realProductionClassCount": len(REAL),
                "actualArt": False, "actualRootFilesystem": False, "records": records}
            (evidence / "results.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
        if javac_exit != 0 or java_exit != 0:
            raise SystemExit(1)

if __name__ == "__main__":
    main()
