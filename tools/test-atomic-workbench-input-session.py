"""Exercise the actual read-only Provider session fence; never call Android/phone services."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-focus-provider.py")))
JAVA = BASE["JAVA"]
SOURCE = BASE["SOURCE"]
HEAD = BASE["HEAD"].replace("controlFocus(arg,b)", "inputSession(arg,b)")
HEAD = HEAD.replace('b.putInt("window_id",2);', 'b.putLong("reset_generation",p.resetGeneration);b.putInt("window_id",2);')
TEST = r'''
 static boolean current(Bundle q){return new AtomicWorkbenchProvider().inputSession(null,q).getBoolean("current");}
 public static void main(String[] args)throws Exception{
  test("exact Root session gets only a boolean and never a window callback",()->{Bundle q=query("ignored");
   Bundle result=new AtomicWorkbenchProvider().inputSession(null,q);
   check(result.getBoolean("current"),"live session missing");
   check(result.values.keySet().equals(Set.of("current"))&&pending.focusBridge.calls==0,"credentials/window escaped read-only fence");
   check(q.getLong("session",-1)==pending.startedAt,"query mutated");});
  test("foreign UID rejected",()->{Bundle q=query("");Binder.uid=10515;reject(null,q);});
  test("foreign Root PID rejected",()->{Bundle q=query("");Binder.pid=1000;reject(null,q);});
  test("missing registered PID rejected",()->{Bundle q=query("");pending.rootPid=-1;reject(null,q);});
  test("unknown session rejected",()->{Bundle q=query("");pending=null;reject(null,q);});
  test("missing Root endpoint rejected",()->{Bundle q=query("");pending.endpoint=null;reject(null,q);});
  test("dead Root rejected",()->{Bundle q=query("");pending.endpoint.alive=false;reject(null,q);});
  test("dead application owner rejected",()->{Bundle q=query("");pending.owner.alive=false;reject(null,q);});
  test("wrong credential rejected",()->{Bundle q=query("");q.putString("token","other");reject(null,q);});
  test("replaced endpoint rejected",()->{Bundle q=query("");q.putBinder("endpoint",new Live());reject(null,q);});
  test("wrong session rejected",()->{Bundle q=query("");q.putLong("session",875);reject(null,q);});
  test("wrong protocol rejected",()->{Bundle q=query("");q.putInt("version",4);reject(null,q);});
  test("wrong module UID rejected",()->{Bundle q=query("");q.putInt("uid",10516);reject(null,q);});
  test("wrong user rejected",()->{Bundle q=query("");q.putInt("user",1);reject(null,q);});
  test("Provider process must own the registered UID",()->{Bundle q=query("");android.os.Process.uid=10516;reject(null,q);});
  test("inconsistent internal user rejected",()->{pending.userId=1;reject(null,query(""));});
  test("active reset revokes new editing but never calls focus",()->{Bundle q=query("");ResetWriteFence.blocked=true;
   check(!current(q)&&pending.focusBridge.calls==0,"active reset admitted editor/window call");});
  test("reset generation changes revoke the old session",()->{Bundle q=query("");ResetWriteFence.current=8;
   check(!current(q),"old generation stayed current");q.putLong("reset_generation",8);check(!current(q),"new caller generation revived old owner");});
  test("missing or wrong typed generation cannot become current",()->{Bundle q=query("");q.values.remove("reset_generation");check(!current(q),"missing generation admitted");
   q.putString("reset_generation","7");check(!current(q),"string generation coerced");q.putLong("reset_generation",6);check(!current(q),"wrong generation admitted");});
  test("read fence does not require allocating a focus bridge",()->{pending.focusBridge=null;check(current(query("")),"read allocated or depended on UI window bridge");});
  test("argument and null request rejected",()->{reject("arbitrary",query(""));reject(null,null);});
  System.out.println("INPUT SESSION RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''


def run(source, label):
    member = BASE["SUPPORT"]["member"](source, "private Bundle inputSession(")
    with tempfile.TemporaryDirectory(prefix="duo-input-session-") as temporary:
        work = Path(temporary)
        sources = dict(BASE["STUBS"])
        sources["ls/augment/com/AtomicWorkbenchProvider.java"] = HEAD + member + TEST
        paths = []
        for name, value in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value, encoding="utf-8")
            paths.append(str(path))
        compiled = subprocess.run([JAVA["JAVAC"], "-J-Dfile.encoding=UTF-8", "--release", "17", "-encoding", "UTF-8", "-d", str(work), *paths],
                                  env=JAVA["ENV"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=45)
        if compiled.returncode:
            raise AssertionError(compiled.stderr)
        result = subprocess.run([JAVA["JAVA"], "-cp", str(work), "ls.augment.com.AtomicWorkbenchProvider"],
                                env=JAVA["ENV"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=20)
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
        ('!AtomicWorkbenchProtocol.sameToken(request.token, extras.getString("token"))', "false", "wrong credential"),
        ("!ResetWriteFence.blocked()", "true", "new editing during reset"),
        ("extras.getLong(\"reset_generation\", -1L) == request.resetGeneration", "true", "missing reset generation"),
    ):
        if old not in source:
            raise AssertionError("negative boundary changed: " + label)
        run(source.replace(old, replacement), label)
