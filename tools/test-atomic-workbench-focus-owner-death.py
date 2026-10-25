"""Execute the real Root dead-owner cleanup proof; never substitutes app or system PIDs."""
from pathlib import Path
import runpy
import subprocess
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))
JAVA = SUPPORT["SUPPORT"]
BUNDLE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-focus-provider.py")))["STUBS"]["android/os/Bundle.java"]
SOURCE = Path(__file__).resolve().parents[1] / "android/app/src/main/java/ls/augment/com/AtomicWorkbenchRoot.java"

STUBS = {
    "android/os/Bundle.java": BUNDLE,
    "android/os/IBinder.java": "package android.os;public interface IBinder{boolean isBinderAlive();}",
    "android/os/Binder.java": "package android.os;public class Binder implements IBinder{public boolean alive=true;public boolean isBinderAlive(){return alive;}}",
    "android/view/Display.java": "package android.view;public class Display{}",
    "android/hardware/display/DisplayManager.java": "package android.hardware.display;public class DisplayManager {public boolean present;public int queries;public android.view.Display getDisplay(int id){queries++;return present?new android.view.Display():null;}}",
    "android/content/Context.java": "package android.content;public class Context {public android.hardware.display.DisplayManager displays=new android.hardware.display.DisplayManager();public <T>T getSystemService(Class<T> c){return c.cast(displays);}}",
    "android/view/WindowManagerGlobal.java": r'''package android.view;public class WindowManagerGlobal {
      public static final Service service=new Service();public static Object getWindowManagerService(){return service;}
      public static class Service{public int mode,calls;public boolean fail;public Runnable after;
       public int getWindowingMode(int display){calls++;if(fail)throw new IllegalStateException("system unavailable");if(after!=null)after.run();return mode;}}
    }''',
}

HEAD = r'''package ls.augment.com;import android.os.*;import android.content.Context;import android.view.WindowManagerGlobal;import java.lang.reflect.Method;
public final class AtomicWorkbenchRoot extends Binder {
 Context context=new Context();IBinder owner=new Binder();int userId,appUid=10515,providerCalls,events;String token="private";long providerSession=123;
 static final class AtomicWorkbenchProtocol {static final int WINDOW_COUNT=4,VERSION=5;}
 static final class AtomicWorkbenchProvider {static final String FOCUS_CONTROL="focus_control";}
 Bundle callWorkbenchProvider(int user,String method,Bundle value){providerCalls++;Bundle b=new Bundle();b.putBoolean("success",true);return b;}
 void lifecycle(String event,String detail,Throwable error){events++;}
 static int cases,assertions;interface Case{void run()throws Exception;}
 static void check(boolean v,String m){assertions++;if(!v)throw new AssertionError(m);}
 static void test(String name,Case body)throws Exception{WindowManagerGlobal.service.calls=0;WindowManagerGlobal.service.mode=0;WindowManagerGlobal.service.fail=false;WindowManagerGlobal.service.after=null;
  body.run();cases++;System.out.println("PASS focus owner death: "+name);}
 static AtomicWorkbenchRoot dead(){var r=new AtomicWorkbenchRoot();((Binder)r.owner).alive=false;return r;}
 static Bundle identity(){Bundle b=new Bundle();b.putInt("window_id",2);b.putInt("display_id",19);b.putString("display_name","DuoAtomic-10515-w2-owned");b.putString("unique_id","original");return b;}
 static void blocked(AtomicWorkbenchRoot r,String action,Bundle q)throws Exception{
  boolean rejected=false;try{r.controlInputFocus(action,q);}catch(Exception expected){rejected=true;}
  check(rejected,"uncertified cleanup accepted");check(r.providerCalls==0,"dead app Provider restarted or stale session used");check(r.events==0,"unconfirmed resources reported removed");}
'''

TEST = r'''
 public static void main(String[] args)throws Exception{
  test("live owner always uses authenticated bridge even after display loss",()->{var r=new AtomicWorkbenchRoot();check(r.controlInputFocus("close",identity()).getBoolean("success"),"bridge result lost");
   check(r.providerCalls==1&&r.events==0&&WindowManagerGlobal.service.calls==0,"live owner bypassed detach owner");});
  test("dead owner and absent DMS plus absent WMS permit final close",()->{var r=dead();Bundle b=r.controlInputFocus("close",identity());
   check(b.getBoolean("success")&&!b.getBoolean("focus_suspended")&&!b.getBoolean("cleanup_pending"),"removal ack wrong");
   check(r.providerCalls==0&&r.events==1&&r.context.displays.queries==2&&WindowManagerGlobal.service.calls==1,"missing independent proof");});
  test("owner death alone cannot clear live display",()->{var r=dead();r.context.displays.present=true;blocked(r,"close",identity());check(WindowManagerGlobal.service.calls==0,"unnecessary server query");});
  test("DMS removal without WMS removal cannot certify close",()->{for(int mode:new int[]{1,5,6}){var r=dead();WindowManagerGlobal.service.mode=mode;blocked(r,"close",identity());}});
  test("display ID reused between observations remains pending",()->{var r=dead();WindowManagerGlobal.service.after=()->r.context.displays.present=true;
   blocked(r,"close",identity());check(r.context.displays.queries==2,"no second DMS observation");});
  test("unavailable WMS never means absence",()->{var r=dead();WindowManagerGlobal.service.fail=true;blocked(r,"close",identity());});
  test("missing DMS never means absence",()->{var r=dead();r.context.displays=null;blocked(r,"close",identity());});
  test("resume cannot use dead-owner final-close proof",()->{var r=dead();blocked(r,"resume",identity());check(WindowManagerGlobal.service.calls==0,"resume queried release proof");});
  test("suspend cannot use dead-owner final-close proof",()->{var r=dead();blocked(r,"suspend",identity());check(WindowManagerGlobal.service.calls==0,"suspend queried release proof");});
  test("invalid IDs do not query server or clear cleanup",()->{for(int id:new int[]{-1,0}){var r=dead();Bundle q=identity();q.putInt("display_id",id);blocked(r,"close",q);}
   for(int slot:new int[]{-1,4}){var r=dead();Bundle q=identity();q.putInt("window_id",slot);blocked(r,"close",q);}check(WindowManagerGlobal.service.calls==0,"invalid identity reached WMS");});
  test("unbound or null request cannot certify any cleanup",()->{var r=dead();r.owner=null;check(r.confirmDeadFocusOwnerCleanup("close",identity())==null,"unbound owner accepted");
   check(dead().confirmDeadFocusOwnerCleanup("close",null)==null,"missing identity accepted");});
  test("owner becoming alive invalidates final proof",()->{var r=dead();WindowManagerGlobal.service.after=()->((Binder)r.owner).alive=true;
   check(r.confirmDeadFocusOwnerCleanup("close",identity())==null&&r.events==0,"owner liveness not rechecked");});
  System.out.println("FOCUS OWNER DEATH RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''


def run(source, negative=None):
    methods = "\n".join(SUPPORT["member"](source, signature) for signature in (
        "private Bundle controlInputFocus(", "private Bundle confirmDeadFocusOwnerCleanup("))
    with tempfile.TemporaryDirectory(prefix="duo-focus-owner-") as temporary:
        work = Path(temporary)
        files = dict(STUBS)
        files["ls/augment/com/AtomicWorkbenchRoot.java"] = HEAD + methods + TEST
        paths = []
        for name, text in files.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
            paths.append(str(path))
        compile = subprocess.run([JAVA["JAVAC"], "-J-Duser.language=en", "-encoding", "UTF-8", "-d", str(work), *paths], env=JAVA["ENV"], timeout=60, capture_output=True, text=True, errors="replace")
        if compile.returncode:
            raise AssertionError(compile.stderr)
        result = subprocess.run([JAVA["JAVA"], "-Duser.language=en", "-cp", str(work), "ls.augment.com.AtomicWorkbenchRoot"], env=JAVA["ENV"], timeout=20, capture_output=True, text=True, errors="replace")
        if negative:
            if not result.returncode:
                raise AssertionError("negative control escaped: " + negative)
            print("PASS rejected negative control: " + negative)
        else:
            print(result.stdout, end="")
            if result.returncode:
                raise AssertionError(result.stderr)


if __name__ == "__main__":
    source = SOURCE.read_text(encoding="utf-8")
    run(source)
    for old, replacement, label in (
        ('if (!"close".equals(action) || identity == null)', 'if (identity == null)', "allow promotion after owner death"),
        ('!Integer.valueOf(0).equals(mode)', 'false', "ignore live WMS display"),
        ('|| manager.getDisplay(display) != null || bound.isBinderAlive()', '|| bound.isBinderAlive()', "skip second display-ID observation"),
    ):
        if old not in source:
            raise AssertionError("negative boundary changed: " + label)
        run(source.replace(old, replacement), label)
