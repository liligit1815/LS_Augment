"""Exercise the actual review controller and journal/catalog models without Root or a device.

All mutations use an in-memory transport. Android and identity lookup are stubs;
This suite checks the conservative guard, not completed ownership-safe recovery.
HIDDEN previews must fail; VISIBLE confirmation may perform no PackageManager write.
"""
from pathlib import Path
import subprocess
import tempfile
import argparse

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT/'android/app/src/main/java/ls/augment/com'

def member(source, signature):
    start=source.index(signature); begin=source.index('{',start); depth=1; i=begin+1
    # Used only for simple nested model classes, no brace-containing shell text.
    while depth:
        if source[i]=='{': depth+=1
        if source[i]=='}': depth-=1
        i+=1
    return source[start:i]

SOURCES = {
'android/content/Context.java': 'package android.content;public class Context {public Context getApplicationContext(){return this;}}',
'android/os/SystemClock.java': 'package android.os;public class SystemClock {public static long elapsedRealtime(){return ls.augment.com.TestRecoveryController.active.now;}}',
'ls/augment/com/HideRecoveryArchive.java': '''package ls.augment.com;final class HideRecoveryArchive {static RootShell.Result preserve(String text){return TestRecoveryController.active.archive(text);}}''',
'ls/augment/com/HideRecoveryEmergency.java': '''package ls.augment.com;final class HideRecoveryEmergency {static RootShell.Result install(){return TestRecoveryController.active.installEmergency();}}''',
}

TEST = r'''package ls.augment.com;
import java.util.*;import java.nio.charset.StandardCharsets;import java.security.MessageDigest;import java.util.concurrent.*;
public final class TestRecoveryController {
    static final String PKG="com.example.app", ID="a".repeat(64), OTHER="b".repeat(64);
    static final String OP="123e4567-e89b-42d3-a456-426614174000",OWNER="123e4567-e89b-42d3-a456-426614174001";
    static int passed,failed;public static IO active;
    static void check(boolean v,String message){if(!v)throw new AssertionError(message);}
    static void test(String name,Runnable run){try{active=new IO();RootShell.pmCommand="";run.run();check(!RootHideManager.ACTION_LOCK.isLocked(),"leaked lock");passed++;System.out.println("PASS "+name);}catch(Throwable e){failed++;System.out.println("FAIL "+name+": "+e);}}
    static RootShell.Result ok(){return new RootShell.Result(0,"",false);}
    static String sha(byte[] bytes){try{StringBuilder s=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(bytes))s.append(String.format(Locale.ROOT,"%02x",b&255));return s.toString();}catch(Exception e){throw new RuntimeException(e);}}
    static HideRecoveryCatalog.Source raw(String kind,String text){byte[] b=text.getBytes(StandardCharsets.UTF_8);String hash=sha(b);return new HideRecoveryCatalog.Source(kind+":"+hash+".raw",hash,b,"");}
    static HideRecoveryCatalog.Source journal(HideRecoveryJournal.Entry e){byte[] b=(e.encode()+"\n").getBytes(StandardCharsets.UTF_8);return new HideRecoveryCatalog.Source("journal:"+e.operationId+"."+e.stage+".record",sha(b),b,"");}
    static HideRecoveryCatalog.Page page(Collection<HideRecoveryCatalog.Source> sources){
        StringBuilder text=new StringBuilder("LSA_RECOVERY_CATALOG_V1\n");
        for(var s:sources)text.append("S|").append(s.key).append('|').append(s.sha256).append('|').append(s.bytes.length).append("|-|").append(Base64.getEncoder().encodeToString(s.bytes)).append('\n');
        return HideRecoveryCatalog.parseProtocol(text.append("M|-|0\nLSA_RECOVERY_CATALOG_OK").toString());
    }
    static HideRecoveryJournal.Entry entry(){return new HideRecoveryJournal.Entry(OP,OWNER,0,10,42,PKG,ID,123,HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);}
    public static final class IO implements HideRecoveryController.Access {
        final Map<String,HideRecoveryCatalog.Source> sources=new LinkedHashMap<>();
        final Set<RootHideManager.Target> configured=new LinkedHashSet<>();
        final Map<Integer,RootHideManager.State> states=new HashMap<>();
        final List<HideRecoveryJournal.Entry> records=new ArrayList<>();
        List<RootHideManager.UserRecord> currentUsers=new ArrayList<>(Arrays.asList(new RootHideManager.UserRecord(0,"Owner"),new RootHideManager.UserRecord(10,"Work"),new RootHideManager.UserRecord(77,"Clone")));
        long serial=42;public long now=100;String fingerprint=ID, failAt="",changeAt="";int reads,identities,queries,appends,pm,archives,installs;
        RootHideManager.Target lastStateTarget;
        String configuredRaw;
        boolean rootOk=true,usersOk=true,identityOk=true,ownerOk=true,readOk=true,archiveOk=true,installOk=true,syncOk=true,pmThrows,pmNull,throwOnObserved;
        int pmExit;boolean pmTimeout;RootHideManager.State post=RootHideManager.State.VISIBLE;
        Runnable onAppend=()->{},onPM=()->{},onSource=()->{},onClock=()->{};
        IO(){states.put(0,RootHideManager.State.VISIBLE);states.put(10,RootHideManager.State.VISIBLE);states.put(77,RootHideManager.State.VISIBLE);}
        void event(String name){if(failAt.equals(name))throw new IllegalStateException(name);}
        public RootHideManager.RootStatus root(){event("root");return new RootHideManager.RootStatus(rootOk?RootHideManager.RootState.GRANTED:RootHideManager.RootState.DENIED,"root","root");}
        public RootShell.Result installEmergency(){event("install");installs++;return installOk?ok():new RootShell.Result(74,"install failed",false);}
        public RootShell.Result archive(String selection){event("archive");archives++;if(!archiveOk)return new RootShell.Result(74,"archive failed",false);var source=raw("selection",selection.isEmpty()?"":selection+"\n");sources.put(source.key,source);return ok();}
        public Set<RootHideManager.Target> configured(){event("configured");return configured;}
        public String configuredRaw(){return configuredRaw!=null?configuredRaw:HideRecoveryController.Access.super.configuredRaw();}
        public HideRecoveryCatalog.Page read(String cursor){event("read");return readOk?page(new ArrayList<>(sources.values()).subList(0,Math.min(4,sources.size()))):HideRecoveryCatalog.Page.failure("failure");}
        public HideRecoveryCatalog.Page readOne(String key){event("readOne");reads++;onSource.run();var s=sources.get(key);return readOk&&s!=null?page(Collections.singleton(s)):HideRecoveryCatalog.Page.failure("missing");}
        public RootHideManager.UserDirectory users(){event("users");return usersOk?RootHideManager.UserDirectory.success(currentUsers):RootHideManager.UserDirectory.failure("users failed");}
        public HideRecoveryIdentity.Snapshot identity(RootHideManager.Target target){event("identity");identities++;return identityOk?new HideRecoveryIdentity.Snapshot(true,"",serial,fingerprint):HideRecoveryIdentity.Snapshot.failure("identity failed");}
        public RootHideManager.State state(RootHideManager.Target target){event("state");queries++;lastStateTarget=target;return states.getOrDefault(target.userId,RootHideManager.State.ERROR);}
        public HideRecoveryIdentity.Owner owner(){event("owner");return ownerOk?new HideRecoveryIdentity.Owner(true,OWNER,0,""):HideRecoveryIdentity.Owner.failure("owner failed");}
        public RootShell.Result append(List<HideRecoveryJournal.Entry> entries){
            event("append");appends++;if(throwOnObserved&&appends==2)throw new IllegalStateException("observed");
            if(changeAt.equals("append"+appends))return new RootShell.Result(74,"record failed",false);
            check(RootHideManager.ACTION_LOCK.isHeldByCurrentThread(),"unlocked append");
            for(var e:entries){check(HideRecoveryJournal.parse(e.encode())!=null,"invalid entry");records.add(e);}onAppend.run();return ok();
        }
        public RootShell.Result show(RootHideManager.Target target){
            check(RootHideManager.ACTION_LOCK.isHeldByCurrentThread(),"unlocked pm");
            check(records.size()==1&&records.get(0).stage==HideRecoveryJournal.Stage.SHOW_PREPARED,"missing prepared before PM");
            check(reads>=3&&identities>=3&&queries>=3,"fresh checks missing");
            check(target.userId==10||target.userId==77||target.userId==0,"wrong user");
            pm++;states.put(target.userId,post);onPM.run();if(pmThrows)throw new IllegalStateException("transport");if(pmNull)return null;
            return new RootShell.Result(pmExit,"pm result",pmTimeout);
        }
        public RootHideManager.OperationResult sync(){event("sync");return syncOk?RootHideManager.OperationResult.success("synced"):RootHideManager.OperationResult.failure("sync failed");}
        public long now(){event("time");onClock.run();return now;}
        HideRecoveryController controller(){return new HideRecoveryController(this);}
        HideRecoveryController.Row historical(){var s=journal(entry());sources.put(s.key,s);return HideRecoveryController.rows(s).get(0);}
        HideRecoveryController.Row legacy(){var s=raw("backup","10:"+PKG+"\n");sources.put(s.key,s);return HideRecoveryController.rows(s).get(0);}
    }
    static HideRecoveryController.Preview preview(HideRecoveryController c){var p=c.preview(active.historical(),10);check(p.success,p.message);return p;}
    static void zeroPM(){check(active.pm==0,"unexpected PM mutation");}
    public static void main(String[] args){
        test("app data empty can discover Root history without PM",()->{active.historical();var p=active.controller().load("",false);check(p.success&&!p.rows.isEmpty(),p.message);check(active.configured.isEmpty(),"history silently imported");zeroPM();});
        test("configured selection archive readback resolves exact newline hash",()->{active.configured.add(new RootHideManager.Target(10,PKG));var p=active.controller().load("",true);check(p.success&&p.rows.size()==1&&p.rows.get(0).chooseUser,p.message);zeroPM();});
        test("empty current list offers history without hiding it",()->{active.historical();var p=active.controller().load("",true);check(p.success&&p.rows.isEmpty(),p.message);check(active.sources.size()==2,"history altered");zeroPM();});
        for(String step:new String[]{"root","install","archive","configured","read","readOne"})test("load exception "+step,()->{active.configured.add(new RootHideManager.Target(10,PKG));active.failAt=step;var p=active.controller().load("",step.equals("readOne"));check(!p.success,"exception accepted");zeroPM();});
        test("archive failure prevents actionable selection",()->{active.archiveOk=false;check(!active.controller().load("",false).success,"archive failure ignored");zeroPM();});
        test("emergency failure prevents actionable selection",()->{active.installOk=false;check(!active.controller().load("",false).success,"install failure ignored");zeroPM();});
        test("legacy record only confirms an explicitly selected already visible user",()->{var c=active.controller();var row=active.legacy();check(!c.preview(row,-1).success,"default accepted");check(!c.preview(row,13).success,"missing user accepted");var p=c.preview(row,77);check(p.success&&p.target.userId==77,p.message);check(c.show(p).success,"visible confirmation failed");zeroPM();check(active.records.isEmpty(),"confirmation wrote a mutation journal");});
        for(int user:new int[]{0,10,77})test("legacy hidden user "+user+" cannot become recovery authority",()->{active.states.put(user,RootHideManager.State.HIDDEN);var c=active.controller();var p=c.preview(active.legacy(),user);check(!p.success,"legacy hidden preview accepted");check(!c.show(p).success,"failed preview acted");zeroPM();check(active.states.get(user)==RootHideManager.State.HIDDEN,"external hidden state changed");});
        test("journal cannot redirect to another user",()->{var c=active.controller();check(!c.preview(active.historical(),77).success,"redirected journal");zeroPM();});
        test("journal recycled user blocked",()->{active.serial=99;check(!active.controller().preview(active.historical(),10).success,"reused ID accepted");zeroPM();});
        test("journal reinstall identity mismatch blocked",()->{active.fingerprint=OTHER;check(!active.controller().preview(active.historical(),10).success,"changed installation accepted");zeroPM();});
        test("known historical identity cannot degrade to unknown",()->{active.fingerprint="unknown";check(!active.controller().preview(active.historical(),10).success,"identity downgrade accepted");zeroPM();});
        test("legacy unknown visible status does not authorize a state change",()->{active.fingerprint="unknown";var c=active.controller();var p=c.preview(active.legacy(),10);check(p.success,p.message);check(c.show(p).success,"visible no-op failed");zeroPM();check(active.records.isEmpty(),"unknown identity generated mutation receipt");});
        test("legacy unknown hidden identity is rejected rather than treated as new intent",()->{active.fingerprint="unknown";active.states.put(10,RootHideManager.State.HIDDEN);var c=active.controller();check(!c.preview(active.legacy(),10).success,"unknown ownership accepted");zeroPM();});
        for(String step:new String[]{"root","readOne","users","identity","state","time"})test("preview exception "+step,()->{var row=active.historical();active.failAt=step;check(!active.controller().preview(row,10).success,"exception accepted");zeroPM();});
        for(var state:new RootHideManager.State[]{RootHideManager.State.HIDDEN,RootHideManager.State.MISSING,RootHideManager.State.ERROR})test("preview refuses "+state,()->{active.states.put(10,state);check(!active.controller().preview(active.historical(),10).success,"bad state accepted");zeroPM();});
        test("visible confirmation never invokes owner journal or PM",()->{var c=active.controller();check(c.show(preview(c)).success,"visible confirmation failed");zeroPM();check(active.appends==0&&active.records.isEmpty(),"no-op wrote a mutation journal");check(active.states.values().stream().allMatch(s->s==RootHideManager.State.VISIBLE),"another user changed");});
        test("ticket belongs to original controller",()->{var c=active.controller();var p=preview(c);check(!active.controller().show(p).success,"foreign ticket accepted");check(c.show(p).success,"foreign attempt consumed original");zeroPM();});
        test("one-time ticket rejects repeated confirmation",()->{var c=active.controller();var p=preview(c);check(c.show(p).success,"first failed");check(!c.show(p).success,"replay accepted");zeroPM();});
        test("fresh repeated visible confirmation remains a no-op",()->{var c=active.controller();check(c.show(preview(c)).success,"first failed");check(c.show(preview(c)).success,"second failed");zeroPM();check(active.records.isEmpty(),"duplicate mutation records");});
        test("concurrent use of one ticket releases only one confirmation",()->{var c=active.controller();var p=preview(c);ExecutorService pool=Executors.newFixedThreadPool(2);try{var a=pool.submit(()->c.show(p));var b=pool.submit(()->c.show(p));check(a.get().success!=b.get().success,"one ticket accepted twice");zeroPM();}catch(Exception e){throw new RuntimeException(e);}finally{pool.shutdownNow();}});
        test("visible preview becoming hidden stops later manual overwrite",()->{var c=active.controller();var p=preview(c);active.states.put(10,RootHideManager.State.HIDDEN);check(!c.show(p).success,"new hide ignored");zeroPM();check(active.states.get(10)==RootHideManager.State.HIDDEN,"manual hide overwritten");});
        for(String change:new String[]{"source","serial","fingerprint","users","root","identity","expired","clockback"})test("pre-confirm change "+change,()->{
            var c=active.controller();var p=preview(c);
            switch(change){case "source":active.sources.clear();break;case "serial":active.serial++;break;case "fingerprint":active.fingerprint=OTHER;break;case "users":active.currentUsers.clear();break;case "root":active.rootOk=false;break;case "identity":active.identityOk=false;break;case "expired":active.now+=120001;break;case "clockback":active.now--;break;}
            check(!c.show(p).success,"changed "+change+" accepted");zeroPM();
        });
        for(String step:new String[]{"root","readOne","users","identity","state","time"})test("confirmation exception "+step,()->{var c=active.controller();var p=preview(c);active.failAt=step;check(!c.show(p).success,"exception accepted");zeroPM();});
        for(String unused:new String[]{"owner","append","sync"})test("visible confirmation does not need "+unused+" mutation transport",()->{var c=active.controller();var p=preview(c);active.failAt=unused;check(c.show(p).success,"unused mutation dependency invoked");zeroPM();check(active.records.isEmpty(),"mutation journal written");});
        test("same filename changed digest blocked",()->{var c=active.controller();var row=active.historical();var p=c.preview(row,10);byte[] b=journal(entry().observed("HIDDEN",0,false)).bytes;active.sources.put(row.sourceKey,new HideRecoveryCatalog.Source(row.sourceKey,sha(b),b,""));check(!c.show(p).success,"source replaced");zeroPM();});
        test("malformed legacy fragments retained as warning without normalization",()->{var rows=HideRecoveryController.rows(raw("targets","10:"+PKG+"\n010:"+PKG+"\n77:com.example.other\n0:bad\n0:com.example.bad;cmd\n"));check(rows.stream().filter(r->r.actionable).count()==3,"parser allowed invalid or lost valid");check(rows.stream().anyMatch(r->!r.actionable&&r.details.contains("3 项")),"malformed evidence hidden");});
        test("duplicate target rows de-duplicate without dropping raw source",()->{var s=raw("targets","10:"+PKG+";10:"+PKG+"\n");var rows=HideRecoveryController.rows(s);check(rows.size()==1&&rows.get(0).sourceDigest.equals(s.sha256),"duplicate parsed incorrectly");});
        test("old scripts never become executable target rows",()->{check(HideRecoveryController.rows(raw("script","pm unhide --user 0 com.example.app\n")).stream().noneMatch(r->r.actionable),"script became action");});
        test("unreadable raw source remains non-actionable notice",()->{var s=raw("selection","10:"+PKG);var bad=new HideRecoveryCatalog.Source(s.key,s.sha256,s.bytes,"INVALID_UTF8");check(HideRecoveryController.rows(bad).stream().noneMatch(r->r.actionable),"bad source actionable");});
        test("orphan observation does not imply action authority",()->{check(HideRecoveryController.rows(journal(entry().observed("HIDDEN",0,false))).stream().noneMatch(r->r.actionable),"orphan granted action");});
        test("show receipt never authorizes a new hidden-state recovery",()->{var e=new HideRecoveryJournal.Entry(OP,OWNER,0,10,42,PKG,ID,123,HideRecoveryJournal.Stage.SHOW_PREPARED,"HIDDEN",0,false);check(HideRecoveryController.rows(journal(e)).stream().noneMatch(r->r.actionable),"show receipt actionable");});
        test("journal filename and record identity must match",()->{var s=journal(entry());var bad=new HideRecoveryCatalog.Source(s.key.replace("PREPARED","OBSERVED"),s.sha256,s.bytes,"");check(HideRecoveryController.rows(bad).stream().noneMatch(r->r.actionable),"mismatch accepted");});
        test("default Android adapter only confirms visible status without unhide",()->{var c=new HideRecoveryController(new android.content.Context());var p=c.preview(active.legacy(),77);check(p.success,p.message);check(c.show(p).success,"visible adapter confirmation failed");check(RootShell.pmCommand.isEmpty(),"adapter emitted an unhide command");zeroPM();});
        for(String version:new String[]{"v3","p3"})test(version+" raw history retains original serial and read-only row",()->{var s=raw("selection",version+":10:42:"+PKG+"\n");active.sources.put(s.key,s);var rows=HideRecoveryController.rows(s);check(rows.size()==1&&rows.get(0).actionable&&rows.get(0).userSerial==42&&!rows.get(0).chooseUser,"bound source identity lost");var p=active.controller().preview(rows.get(0),10);check(p.success&&p.target.isBound()&&p.target.userSerial==42,p.message);check(active.lastStateTarget.equals(p.target),"state queried another binding");zeroPM();});
        test("configured bound and pending records archive encode rather than display labels",()->{active.configured.add(new RootHideManager.Target(10,42,PKG));active.configured.add(new RootHideManager.Target(10,41,PKG,false));var p=active.controller().load("",true);check(p.success&&p.rows.size()==2,p.message);check(p.rows.stream().anyMatch(r->r.userSerial==42)&&p.rows.stream().anyMatch(r->r.userSerial==41),"archive collapsed serials");String all=new String(active.sources.values().iterator().next().bytes,StandardCharsets.UTF_8);check(all.contains("v3:10:42:")&&all.contains("p3:10:41:"),"archive discarded binding protocol");zeroPM();});
        test("legacy read-only query first obtains current identity then uses a bound target",()->{var c=active.controller();var row=active.legacy();var p=c.preview(row,77);check(p.success&&p.target.userId==77&&p.target.isBound()&&p.target.userSerial==42,p.message);check(active.lastStateTarget.equals(p.target)&&row.userSerial==-1&&active.configured.isEmpty(),"query upgraded legacy source or used unbound target");check(c.show(p).success,"no-op failed");zeroPM();});
        test("unknown live serial stops before state query",()->{active.serial=-1;var p=active.controller().preview(active.legacy(),10);check(!p.success&&active.queries==0,"unknown identity reached state transport");zeroPM();});
        test("pending history with previous serial cannot query recycled space",()->{var s=raw("selection","p3:10:41:"+PKG);active.sources.put(s.key,s);var p=active.controller().preview(HideRecoveryController.rows(s).get(0),10);check(!p.success&&active.queries==0,"pending serial rebound");zeroPM();});
        test("unknown version remains source-backed non-actionable notice",()->{var s=raw("selection","v9:10:42:"+PKG);var rows=HideRecoveryController.rows(s);check(rows.size()==1&&!rows.get(0).actionable&&rows.get(0).sourceDigest.equals(s.sha256),"unknown record lost or activated");zeroPM();});
        test("mixed old new and pending histories keep separate identity rows",()->{var s=raw("selection","10:"+PKG+";v3:10:42:"+PKG+";p3:10:42:"+PKG);var rows=HideRecoveryController.rows(s);check(rows.size()==3&&rows.stream().filter(r->r.userSerial==42).count()==2&&rows.stream().filter(r->r.userSerial==-1).count()==1,"history identity rows collapsed");zeroPM();});
        test("invalid current raw selection is archived and never reported empty",()->{active.configuredRaw="v9:10:42:"+PKG+"\n";var p=active.controller().load("",true);check(p.success&&p.rows.size()==1&&!p.rows.get(0).actionable,p.message);check(active.sources.size()==1&&new String(active.sources.values().iterator().next().bytes,StandardCharsets.UTF_8).equals(active.configuredRaw+"\n"),"current raw not preserved");check(active.configured.isEmpty(),"bad raw became targets");zeroPM();});
        System.out.println("RESULT "+passed+" passed, "+failed+" failed; 0 skipped");
        System.out.println("Limits: verifies a conservative no-PM guard only; ownership-safe restoration remains incomplete. No Android Root or device.");
        if(failed>0)System.exit(1);
    }
}
'''

def run(controller_source=None, test_source=None):
    sources=dict(SOURCES)
    for name in ('HideRecoveryController.java','HideRecoveryCatalog.java','HideRecoveryJournal.java','HideTargetCodec.java'):
        source=Path(controller_source) if name=='HideRecoveryController.java' and controller_source else SRC/name
        sources['ls/augment/com/'+name]=source.read_text(encoding='utf-8')
    manager=(SRC/'RootHideManager.java').read_text(encoding='utf-8')
    models='\n'.join(member(manager,'    static final class '+name) for name in ('Target','UserRecord','UserDirectory','RootStatus','OperationResult'))
    sources['ls/augment/com/RootHideManager.java']='''package ls.augment.com;import java.util.*;import java.util.concurrent.locks.ReentrantLock;
final class RootHideManager {
 static final ReentrantLock ACTION_LOCK=new ReentrantLock();enum RootState {GRANTED,DENIED,UNAVAILABLE,TIMEOUT}enum State {VISIBLE,HIDDEN,MISSING,ERROR}
 RootHideManager(android.content.Context c){}
 static boolean isValidPackage(String p){return p!=null&&p.length()<=255&&p.matches("[A-Za-z][A-Za-z0-9_]*(?:\\\\.[A-Za-z0-9_]+)+");}
 static boolean isProtected(String p){return p.equals("com.android.systemui");}
 RootStatus rootStatus(){return TestRecoveryController.active.root();}Set<Target> targets(){return TestRecoveryController.active.configured();}
 HideTargetCodec.Selection selectionStatus(){return HideTargetCodec.parse(TestRecoveryController.active.configuredRaw());}
 UserDirectory userDirectory(){return TestRecoveryController.active.users();}State queryState(Target t){return TestRecoveryController.active.state(t);}
 OperationResult syncMirrors(){return TestRecoveryController.active.sync();}
'''+models+'\n}'
    identity=(SRC/'HideRecoveryIdentity.java').read_text(encoding='utf-8')
    sources['ls/augment/com/HideRecoveryIdentity.java']='''package ls.augment.com;final class HideRecoveryIdentity {static final String UNKNOWN="unknown";
 static Owner owner(android.content.Context c){return TestRecoveryController.active.owner();}
 static Snapshot read(android.content.Context c,RootHideManager.Target t){return TestRecoveryController.active.identity(t);}
'''+member(identity,'    static final class Owner {')+'\n'+member(identity,'    static final class Snapshot {')+'\n}'
    shell=(SRC/'RootShell.java').read_text(encoding='utf-8')
    sources['ls/augment/com/RootShell.java']=r'''package ls.augment.com;import java.util.*;
final class RootShell {
 static String pmCommand="";
 static Result run(String command,String stdin,long timeout,int limit){
   if(command.startsWith("/system/bin/pm unhide --user ")){pmCommand=command;String[] words=command.split(" ");return TestRecoveryController.active.show(new RootHideManager.Target(Integer.parseInt(words[3]),words[4].replace("'","")));}
   if(command.contains("LSA_RECOVERY_JOURNAL_OK")){List<HideRecoveryJournal.Entry> entries=new ArrayList<>();for(String row:stdin.split("\n"))entries.add(HideRecoveryJournal.parse(row));var r=TestRecoveryController.active.append(entries);return r.isSuccess()?new Result(0,"LSA_RECOVERY_JOURNAL_OK",false):r;}
   if(command.contains("LSA_RECOVERY_CATALOG_V1")){String marker="SINGLE='";int a=command.indexOf(marker)+marker.length();String key=command.substring(a,command.indexOf("'",a));TestRecoveryController.active.reads++;var s=TestRecoveryController.active.sources.get(key);if(s==null)return new Result(74,"missing",false);String text="LSA_RECOVERY_CATALOG_V1\nS|"+s.key+"|"+s.sha256+"|"+s.bytes.length+"|-|"+Base64.getEncoder().encodeToString(s.bytes)+"\nM|-|0\nLSA_RECOVERY_CATALOG_OK";return new Result(0,text,false);}
   throw new AssertionError("Unexpected transport: "+command);
 }
 static String quote(String value){return "'"+value.replace("'","'\"'\"'")+"'";}
'''+member(shell,'    static final class Result {')+'\n}'
    selected_test = TEST if test_source is None else test_source
    if 'String configuredRaw()' not in sources['ls/augment/com/HideRecoveryController.java']:
        # Old snapshots have no raw-selection Access API. Adapt that storage-only
        # fixture method so negative controls still execute the original Controller.
        selected_test = selected_test.replace('HideRecoveryController.Access.super.configuredRaw()',
                "HideTargetCodec.encode(configured).replace(';', '\\n')")
    sources['ls/augment/com/TestRecoveryController.java']=selected_test
    with tempfile.TemporaryDirectory(prefix='lsa-recovery-controller-') as temp:
        work=Path(temp);paths=[]
        for name,text in sources.items():
            path=work/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text,encoding='utf-8');paths.append(str(path))
        built=subprocess.run(['javac','--release','17','-encoding','UTF-8','-d',str(work/'classes'),*paths],text=True,encoding='utf-8',errors='replace',capture_output=True,timeout=90)
        if built.returncode:print(built.stdout+built.stderr);return built.returncode
        done=subprocess.run(['java','-cp',str(work/'classes'),'ls.augment.com.TestRecoveryController'],text=True,encoding='utf-8',errors='replace',capture_output=True,timeout=90)
        print(done.stdout+done.stderr,end='');return done.returncode

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--controller-source',type=Path,help='Compile this production Controller snapshot instead')
    args=parser.parse_args()
    return run(args.controller_source)

if __name__=='__main__':raise SystemExit(main())
