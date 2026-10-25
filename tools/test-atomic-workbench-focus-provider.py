"""Execute the production managed-focus Provider authentication and lock boundary."""
from pathlib import Path
import runpy
import subprocess
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))
JAVA = SUPPORT["SUPPORT"]
ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com/AtomicWorkbenchProvider.java"

STUBS = {
    "android/os/Bundle.java": r'''package android.os;import java.util.*;public class Bundle {
      public final Map<String,Object> values=new HashMap<>();public Bundle(){}public Bundle(Bundle b){values.putAll(b.values);}
      public void putInt(String k,int v){values.put(k,v);}public int getInt(String k,int d){return values.get(k) instanceof Integer?(Integer)values.get(k):d;}
      public void putLong(String k,long v){values.put(k,v);}public long getLong(String k,long d){return values.get(k) instanceof Long?(Long)values.get(k):d;}
      public void putString(String k,String v){values.put(k,v);}public String getString(String k){return getString(k,null);}public String getString(String k,String d){return values.get(k) instanceof String?(String)values.get(k):d;}
      public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}
      public void putBinder(String k,IBinder v){values.put(k,v);}public IBinder getBinder(String k){return (IBinder)values.get(k);}
    }''',
    "android/os/IBinder.java": "package android.os;public interface IBinder {boolean isBinderAlive();}",
    "android/os/Binder.java": "package android.os;public class Binder {public static int uid=0,pid=999;public static int getCallingUid(){return uid;}public static int getCallingPid(){return pid;}}",
    "android/os/Process.java": "package android.os;public class Process {public static final int ROOT_UID=0;public static int uid=10515;public static int myUid(){return uid;}}",
}

HEAD = r'''package ls.augment.com;import android.os.*;import android.os.Process;import java.util.*;
public final class AtomicWorkbenchProvider {
 static Pending pending;static int cases,assertions;
 static final class Live implements IBinder {boolean alive=true;public boolean isBinderAlive(){return alive;}}
 static final class Pending {int uid=10515,userId=0,rootPid=999;long resetGeneration=7,startedAt=876;
  String token="private-session-token";Live endpoint=new Live(),owner=new Live();AtomicWorkbenchFocusBridge focusBridge=new AtomicWorkbenchFocusBridge();}
 static final class ResetWriteFence {static long current=7;static boolean blocked;static long generation(){return current;}static boolean blocked(){return blocked;}}
 static final class AtomicWorkbenchProtocol {static final int VERSION=5;static boolean sameToken(String a,String b){return Objects.equals(a,b);}}
 static final class AtomicWorkbenchFocusBridge {
  int calls;String action;Bundle identity;boolean lockHeld;
  Bundle control(String action,Bundle identity){calls++;this.action=action;this.identity=identity;
   lockHeld=Thread.holdsLock(AtomicWorkbenchProvider.class);Bundle result=new Bundle();result.putBoolean("success",true);return result;}}
 static Bundle query(String action){Bundle b=new Bundle();Pending p=pending;b.putInt("version",5);b.putInt("uid",p.uid);b.putInt("user",p.userId);
  b.putLong("session",p.startedAt);b.putBinder("endpoint",p.endpoint);b.putString("token",p.token);b.putString("focus_action",action);
  b.putInt("window_id",2);b.putInt("display_id",19);b.putString("display_name","DuoAtomic-10515-w2-00000000-0000-0000-0000-000000000019");b.putString("unique_id","virtual:unique19");return b;}
 interface Case{void run()throws Exception;}static void check(boolean b,String m){assertions++;if(!b)throw new AssertionError(m);}
 static void test(String name,Case c)throws Exception{pending=new Pending();Binder.uid=0;Binder.pid=999;android.os.Process.uid=10515;ResetWriteFence.current=7;ResetWriteFence.blocked=false;
  c.run();cases++;System.out.println("PASS focus Provider: "+name);}
 static void reject(String arg,Bundle b){AtomicWorkbenchFocusBridge bridge=pending==null?null:pending.focusBridge;
  try{new AtomicWorkbenchProvider().controlFocus(arg,b);throw new AssertionError("request accepted");}
  catch(SecurityException|IllegalArgumentException expected){assertions++;}if(bridge!=null)check(bridge.calls==0,"rejected request reached window owner");}
'''

TEST = r'''
 public static void main(String[] args)throws Exception{
  test("exact session forwards one identity without credentials or monitor",()->{Bundle q=query("suspend");q.putString("untrusted_extra","not-forwarded");
   Bundle r=new AtomicWorkbenchProvider().controlFocus(null,q);var bridge=pending.focusBridge;
   check(r.getBoolean("success")&&bridge.calls==1&&"suspend".equals(bridge.action),"not dispatched");
   check(!bridge.lockHeld,"focus callback blocked session monitor");check(bridge.identity.values.keySet().equals(Set.of("window_id","display_id","display_name","unique_id")),"credentials escaped");
   check(bridge.identity.getInt("display_id",-1)==19&&bridge.identity.getInt("window_id",-1)==2,"identity changed");
   q.putString("unique_id","mutated");check("virtual:unique19".equals(bridge.identity.getString("unique_id","")),"caller bundle shared");});
  test("foreign app UID rejected",()->{Bundle q=query("suspend");Binder.uid=10515;reject(null,q);});
  test("other Root PID rejected",()->{Bundle q=query("suspend");Binder.pid=1000;reject(null,q);});
  test("missing registered PID rejected",()->{Bundle q=query("suspend");pending.rootPid=-1;reject(null,q);});
  test("unknown session rejected",()->{Bundle q=query("suspend");pending=null;reject(null,q);});
  test("missing endpoint rejected",()->{Bundle q=query("suspend");pending.endpoint=null;reject(null,q);});
  test("missing managed bridge rejected",()->{Bundle q=query("suspend");pending.focusBridge=null;reject(null,q);});
  test("dead Root rejected",()->{Bundle q=query("close");pending.endpoint.alive=false;reject(null,q);});
  test("dead app owner rejected",()->{Bundle q=query("suspend");pending.owner.alive=false;reject(null,q);});
  test("wrong token rejected",()->{Bundle q=query("suspend");q.putString("token","other");reject(null,q);});
  test("replaced endpoint rejected",()->{Bundle q=query("suspend");q.putBinder("endpoint",new Live());reject(null,q);});
  test("wrong session rejected",()->{Bundle q=query("suspend");q.putLong("session",875);reject(null,q);});
  test("wrong version rejected",()->{Bundle q=query("suspend");q.putInt("version",4);reject(null,q);});
  test("wrong owner UID rejected",()->{Bundle q=query("suspend");q.putInt("uid",10516);reject(null,q);});
  test("wrong user rejected",()->{Bundle q=query("suspend");q.putInt("user",1);reject(null,q);});
  test("internally mismatched owner rejected",()->{pending.userId=1;Bundle q=query("close");reject(null,q);});
  test("wrong managed process UID rejected",()->{Bundle q=query("suspend");android.os.Process.uid=10516;reject(null,q);});
  test("reset generation blocks creation",()->{Bundle q=query("suspend");ResetWriteFence.current=8;reject(null,q);});
  test("active reset blocks creation",()->{Bundle q=query("suspend");ResetWriteFence.blocked=true;reject(null,q);});
  test("reset cannot strand owned removal",()->{for(String a:new String[]{"resume","close"}){ResetWriteFence.current=8;ResetWriteFence.blocked=true;
   check(new AtomicWorkbenchProvider().controlFocus(null,query(a)).getBoolean("success"),"cleanup rejected during reset");}check(pending.focusBridge.calls==2,"cleanup not forwarded");});
  test("unknown actions cannot reach bridge",()->reject(null,query("create_arbitrary_window")));
  test("null or argument payload rejected",()->{reject(null,null);reject("arbitrary",query("suspend"));});
  test("missing identity is passed as invalid defaults for exact owner validation",()->{Bundle q=query("suspend");q.values.remove("display_id");q.values.remove("unique_id");
   new AtomicWorkbenchProvider().controlFocus(null,q);check(pending.focusBridge.identity.getInt("display_id",8)==-1,"missing display promoted to valid");
   check("".equals(pending.focusBridge.identity.getString("unique_id","unexpected")),"missing unique inherited");});
  System.out.println("FOCUS PROVIDER RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''


def run(source, label):
    method = SUPPORT["member"](source, "private Bundle controlFocus(")
    with tempfile.TemporaryDirectory(prefix="duo-focus-provider-") as temporary:
        work = Path(temporary)
        files = dict(STUBS)
        files["ls/augment/com/AtomicWorkbenchProvider.java"] = HEAD + method + TEST
        paths = []
        for name, text in files.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
            paths.append(str(path))
        compiled = subprocess.run([JAVA["JAVAC"], "-J-Dfile.encoding=UTF-8", "-J-Duser.language=en", "--release", "17", "-encoding", "UTF-8", "-d", str(work), *paths], env=JAVA["ENV"], timeout=60, capture_output=True, text=True, encoding="utf-8", errors="replace")
        if compiled.returncode:
            raise AssertionError(compiled.stderr)
        result = subprocess.run([JAVA["JAVA"], "-Dfile.encoding=UTF-8", "-Duser.language=en", "-cp", str(work), "ls.augment.com.AtomicWorkbenchProvider"], env=JAVA["ENV"], timeout=20, capture_output=True, text=True, encoding="utf-8", errors="replace")
        if label == "production":
            print(result.stdout, end="")
            if result.returncode:
                raise AssertionError(result.stderr)
        else:
            if result.returncode == 0:
                raise AssertionError("negative control escaped: " + label)
            print("PASS rejected negative control: " + label)


if __name__ == "__main__":
    source = SOURCE.read_text(encoding="utf-8")
    run(source, "production")
    for old, replacement, label in (
        ("Binder.getCallingPid() != request.rootPid", "false", "foreign Root PID"),
        ("!AtomicWorkbenchProtocol.sameToken(request.token, extras.getString(\"token\"))", "false", "wrong credential"),
        ("return bridge.control(action, identity);", "synchronized (AtomicWorkbenchProvider.class) { return bridge.control(action, identity); }", "focus wait under session monitor"),
    ):
        if old not in source:
            raise AssertionError("negative boundary changed: " + label)
        run(source.replace(old, replacement), label)
