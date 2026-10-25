"""Execute strict production task models; no phone or system Task is accessed."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
JDK = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
JAVAC = str(JDK / "javac.exe") if JDK.exists() else "javac"
JAVA = str(JDK / "java.exe") if JDK.exists() else "java"
PRODUCTION = ["AtomicWorkbenchTaskIdentity.java", "AtomicWorkbenchTaskOperationRequest.java", "AtomicWorkbenchTaskOperationResult.java"]
BUNDLE = r'''package android.os;import java.util.*;public class Bundle {
 private final Map<String,Object> data=new HashMap<>();public Bundle(){}public Bundle(Bundle b){data.putAll(b.data);}
 public Set<String>keySet(){return data.keySet();}public Object get(String key){return data.get(key);}public void remove(String key){data.remove(key);}
 public void putInt(String k,int v){data.put(k,v);}public void putLong(String k,long v){data.put(k,v);}public void putBoolean(String k,boolean v){data.put(k,v);}
 public void putString(String k,String v){data.put(k,v);}public void putBundle(String k,Bundle v){data.put(k,v);}
 public Bundle getBundle(String k){return (Bundle)data.get(k);}public String getString(String k){return (String)data.get(k);}
 public boolean getBoolean(String k){return Boolean.TRUE.equals(data.get(k));}
}'''
TEST = r'''package ls.augment.com;
import android.os.Bundle;import java.lang.reflect.*;import java.util.*;
import static ls.augment.com.AtomicWorkbenchTaskOperationRequest.Action.*;
import static ls.augment.com.AtomicWorkbenchTaskOperationResult.Status.*;
public final class TestTaskModels {
 static int cases,assertions;static final String BOOT="a".repeat(32),GEN="b".repeat(32),OP="c".repeat(32),SHELF="d".repeat(32),NONCE="e".repeat(32);
 static final String SESSION="11111111-1111-1111-1111-111111111111",TARGET="22222222-2222-2222-2222-222222222222";
 interface Run{void run()throws Exception;}static void check(boolean b,String why){assertions++;if(!b)throw new AssertionError(why);}
 static void reject(Run r)throws Exception{boolean caught=false;try{r.run();}catch(IllegalArgumentException e){caught=true;}check(caught,"invalid task model accepted");}
 static void rejectIdentity(Bundle b)throws Exception{reject(()->AtomicWorkbenchTaskIdentity.fromBundle(b));}
 static void rejectRequest(Bundle b)throws Exception{reject(()->AtomicWorkbenchTaskOperationRequest.fromBundle(b));}
 static void rejectResult(Bundle b)throws Exception{reject(()->AtomicWorkbenchTaskOperationResult.fromBundle(b));}
 static void test(String name,Run r)throws Exception{r.run();cases++;System.out.println("PASS task models: "+name);}
 static AtomicWorkbenchTaskIdentity id(int root,int display,String unique){return new AtomicWorkbenchTaskIdentity(BOOT,GEN,42,root,true,10055,0,"app/.Base","app/.Real",display,display==0?"Built-in Screen":"DuoAtomic-10055-w1-"+SESSION,unique);}
 static AtomicWorkbenchTaskOperationRequest req(AtomicWorkbenchTaskOperationRequest.Action action){
  AtomicWorkbenchTaskIdentity identity=id(42,action==RESTORE?0:88,"source-unique");boolean restore=action==RESTORE,end=action==END_TASK;
  return new AtomicWorkbenchTaskOperationRequest(OP,action,identity,1,SESSION,restore?89:end?88:0,restore?"target":end?identity.displayName:"Built-in Screen",
   restore?"target-unique":end?identity.displayUnique:"local:0",restore?2:-1,restore?TARGET:"",SHELF,0,12,1000,6000,end?NONCE:"");
 }
 static AtomicWorkbenchTaskIdentity atTarget(AtomicWorkbenchTaskOperationRequest r){var i=r.identity;return r.action==END_TASK?i:new AtomicWorkbenchTaskIdentity(i.serverBootGeneration,i.taskGeneration,i.taskId,i.rootTaskId,i.leaf,i.uid,i.userId,i.baseComponent,i.realComponent,r.targetDisplayId,r.targetDisplayName,r.targetDisplayUnique);}
 static AtomicWorkbenchTaskOperationResult result(AtomicWorkbenchTaskOperationRequest r){return new AtomicWorkbenchTaskOperationResult(r,COMMITTED,1,atTarget(r),"COMMITTED","SHELVED_REFERENCE","verified",true,true,true,true,true,false,"");}
 public static void main(String[] args)throws Exception{
  test("identity and every fixed action round trip without aliasing",()->{AtomicWorkbenchTaskIdentity id=id(42,88,"vd-88");check(id.equals(AtomicWorkbenchTaskIdentity.fromBundle(id.toBundle())),"identity roundtrip");
   for(var action:AtomicWorkbenchTaskOperationRequest.Action.values()){var r=req(action);var b=r.toBundle();var copy=AtomicWorkbenchTaskOperationRequest.fromBundle(b);
    check(copy.action==action&&copy.identity.equals(r.identity)&&copy.operationId.equals(OP)&&copy.shelfId.equals(SHELF)&&copy.sourceWindowSession.equals(SESSION),"request roundtrip");
    b.putString("operation_id",GEN);b.getBundle("identity").putString("task_generation",OP);check(r.operationId.equals(OP)&&r.identity.taskGeneration.equals(GEN),"bundle mutated immutable object");}
  });
  test("same object survives reparent but exact equality retains root and location",()->{var a=id(42,88,"vd-88");var b=id(99,0,"local:0");check(a.sameTask(b)&&!a.sameLocation(b)&&!a.equals(b),"root incorrectly part of object generation");
   check(!a.sameTask(new AtomicWorkbenchTaskIdentity(BOOT,OP,42,42,true,10055,0,"app/.Base","app/.Real",88,a.displayName,"vd-88")),"recycled task id accepted");
   check(!a.sameLocation(id(42,88,"recycled")),"recycled display accepted");check(a.hashCode()==AtomicWorkbenchTaskIdentity.fromBundle(a.toBundle()).hashCode(),"equality hash mismatch");
  });
  test("ordinary application task with shared system uid remains exact metadata",()->{var i=new AtomicWorkbenchTaskIdentity(BOOT,GEN,42,42,true,1000,0,"zte.com.cn.alarmclock/.Main","zte.com.cn.alarmclock/.Main",88,"vd","unique");
   check(AtomicWorkbenchTaskIdentity.fromBundle(i.toBundle()).equals(i),"uid 1000 identity rejected");var r=new AtomicWorkbenchTaskOperationRequest(OP,SHELVE,i,1,SESSION,0,"Built-in Screen","local:0",-1,"",SHELF,0,12,1000,6000,"");check(AtomicWorkbenchTaskOperationRequest.fromBundle(r.toBundle()).identity.uid==1000,"uid1000 request rejected");
   for(int uid:new int[]{0,999,100000})reject(()->new AtomicWorkbenchTaskIdentity(BOOT,GEN,42,42,true,uid,uid/100000,"app/.Base","app/.Real",88,"vd","unique"));
   reject(()->new AtomicWorkbenchTaskIdentity(BOOT,GEN,42,42,true,101000,0,"app/.Base","app/.Real",88,"vd","unique"));
  });
  test("identity missing unknown null and wrong typed fields all fail closed",()->{Bundle original=id(42,88,"vd").toBundle();for(String key:new ArrayList<>(original.keySet())){Bundle b=new Bundle(original);b.remove(key);rejectIdentity(b);}
   Bundle b=new Bundle(original);b.putString("intent","content://private");rejectIdentity(b);
   b=new Bundle(original);b.putLong("task_id",42);Bundle wrong=b;reject(()->AtomicWorkbenchTaskIdentity.fromBundle(wrong));
   b=new Bundle(original);b.putString("task_generation",null);Bundle nul=b;reject(()->AtomicWorkbenchTaskIdentity.fromBundle(nul));
  });
  test("invalid generations owner components and display are rejected",()->{for(String bad:new String[]{"",GEN.toUpperCase(),"g".repeat(32),"b".repeat(31)})reject(()->new AtomicWorkbenchTaskIdentity(BOOT,bad,42,42,true,10055,0,"app/.Base","app/.Real",88,"vd","unique"));
   reject(()->new AtomicWorkbenchTaskIdentity(BOOT,GEN,42,42,true,1010055,0,"app/.Base","app/.Real",88,"vd","unique"));
   reject(()->new AtomicWorkbenchTaskIdentity(BOOT,GEN,42,42,true,10055,0,"content://x","app/.Real",88,"vd","unique"));
   reject(()->new AtomicWorkbenchTaskIdentity(BOOT,GEN,-1,42,true,10055,0,"app/.Base","app/.Real",88,"vd","unique"));
   reject(()->new AtomicWorkbenchTaskIdentity(BOOT,GEN,42,42,true,10055,0,"app/.Base","app/.Real",88,"vd\ntext","unique"));
  });
  test("request schema exact types and closed action enum",()->{Bundle original=req(SHELVE).toBundle();for(String key:new ArrayList<>(original.keySet())){Bundle b=new Bundle(original);b.remove(key);rejectRequest(b);}
   for(String[] mutation:new String[][]{{"action","OPEN"},{"confirmation_nonce",NONCE},{"source_window_session","wrong"},{"target_window_session",SESSION},{"shelf_id",""}}){Bundle b=new Bundle(original);b.putString(mutation[0],mutation[1]);rejectRequest(b);}
   Bundle b=new Bundle(original);b.putInt("schema",0);Bundle old=b;reject(()->AtomicWorkbenchTaskOperationRequest.fromBundle(old));
   b=new Bundle(original);b.putInt("input_revision",12);Bundle typed=b;reject(()->AtomicWorkbenchTaskOperationRequest.fromBundle(typed));
   b=new Bundle(original);b.putString("uri","content://secret");Bundle extra=b;reject(()->AtomicWorkbenchTaskOperationRequest.fromBundle(extra));
  });
  test("five second freshness is bounded monotonic and checked at use",()->{var r=req(SHELVE);check(r.fresh(1000)&&r.fresh(5999)&&!r.fresh(999)&&!r.fresh(6001),"freshness boundary");reject(()->r.requireFresh(6001));
   for(long[] times:new long[][]{{1000,6001},{-1,10},{6000,1000},{1000,1000},{Long.MAX_VALUE-1,Long.MAX_VALUE}}){Bundle b=r.toBundle();b.putLong("issued_elapsed",times[0]);b.putLong("deadline_elapsed",times[1]);
    if(times[0]==Long.MAX_VALUE-1){check(AtomicWorkbenchTaskOperationRequest.fromBundle(b).fresh(Long.MAX_VALUE),"bounded near-max rejected");}else rejectRequest(b);}
  });
  test("RESTORE requires exact physical source and owned target slot session",()->{for(String key:new String[]{"target_display_id","target_slot","source_slot"}){Bundle b=req(RESTORE).toBundle();b.putInt(key,-1);rejectRequest(b);}
   Bundle b=req(RESTORE).toBundle();b.putBundle("identity",id(42,88,"vd").toBundle());rejectRequest(b);
  });
  test("END confirmation is mandatory action-bound and exact-location bound",()->{Bundle b=req(END_TASK).toBundle();b.putString("confirmation_nonce","");rejectRequest(b);
   b=req(END_TASK).toBundle();b.putString("target_display_unique","recycled");Bundle recycled=b;reject(()->AtomicWorkbenchTaskOperationRequest.fromBundle(recycled));
   b=req(END_TASK).toBundle();b.putString("action","MOVE_OUT");Bundle switched=b;reject(()->AtomicWorkbenchTaskOperationRequest.fromBundle(switched));
   b=req(END_TASK).toBundle();Bundle nonleaf=req(END_TASK).identity.toBundle();nonleaf.putBoolean("leaf",false);b.putBundle("identity",nonleaf);Bundle group=b;reject(()->AtomicWorkbenchTaskOperationRequest.fromBundle(group));
  });
  test("success needs every final proof and explicit committed state",()->{var r=req(SHELVE);var result=result(r);check(result.success&&AtomicWorkbenchTaskOperationResult.fromBundle(result.toBundle()).success,"valid final proof rejected");
   for(String key:new String[]{"mutation_dispatched","position_verified","visibility_verified","store_committed","focus_unchanged"}){Bundle b=result.toBundle();b.putBoolean(key,false);rejectResult(b);}
   Bundle b=result.toBundle();b.putBoolean("success",false);rejectResult(b);
   b=result.toBundle();b.putBoolean("cleanup_pending",true);rejectResult(b);
   b=result.toBundle();b.putString("status","UNCONFIRMED");Bundle lied=b;reject(()->AtomicWorkbenchTaskOperationResult.fromBundle(lied));
   b=result.toBundle();b.putBoolean("operation_unconfirmed",true);Bundle flags=b;reject(()->AtomicWorkbenchTaskOperationResult.fromBundle(flags));
  });
  test("incomplete reply keys and scalar coercions cannot certify success",()->{Bundle original=result(req(SHELVE)).toBundle();for(String key:new ArrayList<>(original.keySet())){Bundle b=new Bundle(original);b.remove(key);rejectResult(b);}
   Bundle b=new Bundle(original);b.putString("success","true");rejectResult(b);
  });
  test("unknown reply retains explicit responsibility without invented identity",()->{var r=req(SHELVE);var unknown=new AtomicWorkbenchTaskOperationResult(r,UNCONFIRMED,0,null,"VERIFY_PENDING","WORKSPACE_OWNED","reply_lost",true,false,false,false,false,true,GEN);
   var copy=AtomicWorkbenchTaskOperationResult.fromBundle(unknown.toBundle());check(!copy.success&&copy.identity==null&&copy.mutationDispatched&&copy.cleanupPending&&copy.toBundle().getBoolean("operation_unconfirmed"),"unknown became empty success");
   reject(()->new AtomicWorkbenchTaskOperationResult(r,COMMITTED,0,null,"COMMITTED","SHELVED_REFERENCE","verified",true,true,true,true,true,false,""));
  });
  test("reply binding checks op action generation and verified target location",()->{var r=req(SHELVE);Bundle correct=result(r).toBundle();check(AtomicWorkbenchTaskOperationResult.fromBundle(correct,r).success,"bound reply rejected");
   for(String key:new String[]{"operation_id","shelf_id","action"}){Bundle b=new Bundle(correct);b.putString(key,key.equals("action")?"MOVE_OUT":GEN);reject(()->AtomicWorkbenchTaskOperationResult.fromBundle(b,r));}
   reject(()->new AtomicWorkbenchTaskOperationResult(r,COMMITTED,1,r.identity,"COMMITTED","SHELVED_REFERENCE","verified",true,true,true,true,true,false,""));
  });
  test("public model state is immutable scalar metadata",()->{for(Class<?> type:new Class<?>[]{AtomicWorkbenchTaskIdentity.class,AtomicWorkbenchTaskOperationRequest.class,AtomicWorkbenchTaskOperationResult.class}){
    check(Modifier.isFinal(type.getModifiers())&&Modifier.isPublic(type.getModifiers()),"not final public");for(Field f:type.getDeclaredFields())if(Modifier.isPublic(f.getModifiers())&&!Modifier.isStatic(f.getModifiers()))check(Modifier.isFinal(f.getModifiers()),"mutable public field:"+f);
    for(Field f:type.getDeclaredFields())check(!f.getType().getName().contains("IBinder")&&!f.getType().getName().contains("Intent")&&!f.getType().getName().contains("Uri")&&!f.getType().isArray()||Modifier.isPrivate(f.getModifiers()),"payload/binder state");
   }
  });
  System.out.println("TASK MODEL RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''


def compile_run(work, sources, production=None, runner="ls.augment.com.TestTaskModels", arguments=(), classpath=None, replacements=None, capture=False):
    files = []
    content_map = dict(sources)
    for name in production or PRODUCTION:
        content_map["ls/augment/com/" + name] = (SRC / name).read_text(encoding="utf-8")
    for name, (old, new) in (replacements or {}).items():
        if old not in content_map[name]:
            raise AssertionError("negative control no longer matches production: " + name)
        content_map[name] = content_map[name].replace(old, new, 1)
    for name, content in content_map.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        files.append(str(path))
    classes = work / "classes"
    command = [JAVAC, "-J-Dfile.encoding=UTF-8", "-J-Dstdout.encoding=UTF-8", "-J-Dstderr.encoding=UTF-8", "--release", "17", "-encoding", "UTF-8", "-d", str(classes)]
    if classpath:
        command += ["-cp", classpath]
    subprocess.run(command + files, check=True, timeout=90, capture_output=capture)
    cp = str(classes) + (os.pathsep + classpath if classpath else "")
    return subprocess.run([JAVA, "-Dfile.encoding=UTF-8", "-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8", "-cp", cp, runner, *map(str, arguments)], check=not capture, timeout=90, capture_output=capture)


def main():
    sources = {"android/os/Bundle.java": BUNDLE, "ls/augment/com/TestTaskModels.java": TEST}
    with tempfile.TemporaryDirectory(prefix="duo-task-models-") as temporary:
        compile_run(Path(temporary) / "base", sources)
        controls = [
            ("AtomicWorkbenchTaskIdentity.java", '&& taskGeneration.equals(other.taskGeneration)', ''),
            ("AtomicWorkbenchTaskIdentity.java", '&& displayUnique.equals(other.displayUnique)', ''),
            ("AtomicWorkbenchTaskIdentity.java", 'if (integer(b,"schema") != SCHEMA)', 'if (false)'),
            ("AtomicWorkbenchTaskIdentity.java", '!b.keySet().equals(new HashSet<>(Arrays.asList(allowed)))', 'false'),
            ("AtomicWorkbenchTaskOperationRequest.java", 'deadlineElapsed-issuedElapsed > MAX_LIFETIME_MS', 'false'),
            ("AtomicWorkbenchTaskOperationRequest.java", 'nowElapsed <= deadlineElapsed', 'true'),
            ("AtomicWorkbenchTaskOperationRequest.java", 'if (action != Action.END_TASK && !confirmationNonce.isEmpty())', 'if (false)'),
            ("AtomicWorkbenchTaskOperationResult.java", 'position && visibility && committed && focus && !pending', 'true'),
            ("AtomicWorkbenchTaskOperationResult.java", 'if (bool(b,"success")!=r.success', 'if (false'),
        ]
        for index, (file, old, new) in enumerate(controls):
            result = compile_run(Path(temporary) / f"negative-{index}", sources,
                replacements={"ls/augment/com/" + file: (old, new)}, capture=True)
            if result.returncode == 0:
                raise AssertionError("negative control escaped: " + file + ": " + old)
            if b"AssertionError" not in result.stderr:
                raise AssertionError("negative control did not fail a runtime assertion: " + result.stderr.decode(errors="replace"))
            print("PASS production negative control:", file, index + 1)
        print(f"TASK MODEL NEGATIVE CONTROLS {len(controls)} passed")


if __name__ == "__main__":
    main()
