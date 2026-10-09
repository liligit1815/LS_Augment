"""Execute the island's production foreground query with task-service doubles."""
from pathlib import Path
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
HOOK = ROOT / "android/app/src/main/java/ls/augment/com/hook"
source = (HOOK / "DynamicIslandHook.java").read_text(encoding="utf-8")
adapter = (HOOK / "SystemUiAdapter.java").read_text(encoding="utf-8")


def block(text, marker):
    start = text.index(marker)
    end = text.index("{", start) + 1
    depth = 1
    while depth:
        depth += (text[end] == "{") - (text[end] == "}")
        end += 1
    return text[start:end]


# Execute the production reflection helpers, including their class-specific
# lookup cache. The fixture only supplies the Android classes and live fields.
reflection = """package ls.augment.com.hook;
import java.lang.reflect.*;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;
final class SystemUiAdapter {
// ACCESSORS
// HELPERS
}
""".replace(
    "// ACCESSORS",
    block(adapter, "private static final ClassValue<Accessors> ACCESSORS") + ";\n"
    + block(adapter, "private static final class Accessors"),
).replace(
    "// HELPERS",
    "\n".join(block(adapter, marker) for marker in (
        "static Object field(", "static Object call(", "private static Class<?> box(",
    )),
)

files = {
    "ls/augment/com/hook/SystemUiAdapter.java": reflection,
    "android/app/ActivityTaskManager.java": """package android.app;
public class ActivityTaskManager {
 public static Object service; public static boolean fail; public static int calls;
 public static Object getService(){calls++;if(fail)throw new SecurityException("task query unavailable");return service;}
}
""",
    "android/content/ComponentName.java": """package android.content;
public class ComponentName {
 private final String packageName;
 public ComponentName(String packageName){this.packageName=packageName;}
 public String getPackageName(){return packageName;}
}
""",
    "android/view/Display.java": """package android.view;
public class Display {
 private final int id;public Display(int id){this.id=id;}public int getDisplayId(){return id;}
}
""",
}

harness = """package ls.augment.com.hook;
import java.util.*;
import android.app.ActivityTaskManager;
import android.content.ComponentName;
import android.view.Display;
import static ls.augment.com.hook.SystemUiAdapter.*;
public class TestIslandForegroundRuntime {
 static int checks;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static class Host {Display display=new Display(7);Display getDisplay(){return display;}}
 static class State {Host host=new Host();int ownerUser=0;
 // FOREGROUND
 }
 public static class Service {
  Object result;boolean fail;int calls,max,display;boolean filter,extras;
  public Object getTasks(int max,boolean filter,boolean extras,int display){
   calls++;this.max=max;this.filter=filter;this.extras=extras;this.display=display;
   if(fail)throw new SecurityException("binder query unavailable");return result;
  }
 }
 static class Task {
  public Object topActivity,displayId,userId;
  Task(String packageName,int display,int user){topActivity=new ComponentName(packageName);displayId=display;userId=user;}
 }
 static class InheritedTask extends Task {InheritedTask(String packageName,int display,int user){super(packageName,display,user);}}
 static class MissingTop {public int displayId=7,userId=0;}
 static class MissingDisplay {public ComponentName topActivity=new ComponentName("tv.danmaku.bili");public int userId=0;}
 static class MissingUser {public ComponentName topActivity=new ComponentName("tv.danmaku.bili");public int displayId=7;}
 static void expect(State state,Service service,Object result,String expected,String message){
  ActivityTaskManager.service=service;ActivityTaskManager.fail=false;service.fail=false;service.result=result;
  int before=service.calls;String actual=state.foregroundPackage();
  check(Objects.equals(expected,actual),message+": actual="+actual);
  check(service.calls==before+1&&service.max==1&&!service.filter&&!service.extras
      &&service.display==state.host.display.getDisplayId(),"query requests one leaf task on the status-bar display");
 }
 static List<Object> task(Object value){return Collections.singletonList(value);}
 public static void main(String[] args){
  State state=new State();Service service=new Service();
  Task bili=new Task("tv.danmaku.bili",7,0);
  expect(state,service,task(bili),"tv.danmaku.bili","foreground Bilibili is identified");
  bili.topActivity=new ComponentName("com.android.launcher3");
  expect(state,service,task(bili),"com.android.launcher3","cached reflection reads the new live top activity");
  bili.topActivity=new ComponentName("tv.danmaku.bili");
  bili.userId=10;
  expect(state,service,task(bili),"","a profile with the same package does not suppress owner-user media");
  state.ownerUser=10;
  expect(state,service,task(bili),"tv.danmaku.bili","the owning user may be a secondary user");
  state.ownerUser=0;bili.userId=0;bili.displayId=0;
  expect(state,service,task(bili),null,"foreign display does not identify the status-bar foreground");
  state.host.display=new Display(0);
  expect(state,service,task(bili),"tv.danmaku.bili","query follows a new status-bar display");
  state.host.display=new Display(7);bili.displayId=7;
  expect(state,service,task(new InheritedTask("tv.danmaku.bili",7,0)),"tv.danmaku.bili","inherited task fields are supported");
  expect(state,service,Arrays.asList(bili,new Task("unfocused.app",7,0)),"tv.danmaku.bili","only the focused first task is considered");
  for(Object missing:new Object[]{new MissingTop(),new MissingDisplay(),new MissingUser()})
   expect(state,service,task(missing),null,"missing task fields fail closed");
  for(Object invalid:new Object[]{null,"tv.danmaku.bili",new Object()}){
   bili.topActivity=invalid;expect(state,service,task(bili),null,"unavailable component fails closed");
  }
  bili.topActivity=new ComponentName("tv.danmaku.bili");
  for(Object invalid:new Object[]{null,"7",7L}){
   bili.displayId=invalid;expect(state,service,task(bili),null,"invalid display identity fails closed");
  }
  bili.displayId=7;
  for(Object invalid:new Object[]{null,"0",0L}){
   bili.userId=invalid;expect(state,service,task(bili),null,"invalid user identity fails closed");
  }
  bili.userId=0;
  for(Object invalid:new Object[]{null,new Object(),Collections.emptyList(),task(null)})
   expect(state,service,invalid,null,"unavailable task result never reuses the previous package");
  expect(state,service,task(bili),"tv.danmaku.bili","a successful query recovers after malformed results");
  service.fail=true;
  check(state.foregroundPackage()==null,"task-service exceptions never escape or reuse the previous package");
  service.fail=false;ActivityTaskManager.fail=true;
  check(state.foregroundPackage()==null,"service-lookup exceptions never escape or reuse the previous package");
  ActivityTaskManager.fail=false;ActivityTaskManager.service=new Object();
  check(state.foregroundPackage()==null,"absent getTasks is treated as unknown foreground");
  ActivityTaskManager.service=null;
  check(state.foregroundPackage()==null,"null task service is treated as unknown foreground");
  state.host.display=null;int calls=ActivityTaskManager.calls;
  check(state.foregroundPackage()==null&&ActivityTaskManager.calls==calls,"unattached host with no display skips task queries");
  System.out.println("PASS island production foreground query: "+checks+" checks");
 }
}
""".replace("// FOREGROUND", block(source, "String foregroundPackage("))


with tempfile.TemporaryDirectory(prefix="island-foreground-") as tmp:
    directory = Path(tmp)
    sources = []
    for relative, content in files.items():
        path = directory / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        sources.append(str(path))
    path = directory / "ls/augment/com/hook/TestIslandForegroundRuntime.java"
    path.write_text(harness, encoding="utf-8")
    sources.append(str(path))

    def compile_and_run(content, capture=False):
        path.write_text(content, encoding="utf-8")
        subprocess.run(["javac", "-encoding", "UTF-8", "-d", tmp, *sources], check=True)
        return subprocess.run(
            ["java", "-cp", tmp, "ls.augment.com.hook.TestIslandForegroundRuntime"],
            check=not capture, capture_output=capture, text=True,
        )

    compile_and_run(harness)
    # Reject regressions that would hide media because a task belongs to a
    # different display or a different Android user with the same package.
    for original, replacement, failure in (
        ("||(Integer)taskDisplay!=display.getDisplayId()", "||false",
         "foreign display does not identify the status-bar foreground"),
        ("(Integer)taskUser==ownerUser?", "true?",
         "a profile with the same package does not suppress owner-user media"),
        ('"getTasks",1,false,false,display.getDisplayId()',
         '"getTasks",1,false,false,0',
         "query requests one leaf task on the status-bar display"),
    ):
        mutant = harness.replace(original, replacement, 1)
        if mutant == harness:
            raise AssertionError("Mutation target missing from extracted foreground query: " + original)
        rejected = compile_and_run(mutant, capture=True)
        if rejected.returncode == 0 or failure not in rejected.stderr:
            raise AssertionError("Foreground-query regression was not rejected: " + rejected.stderr)
        print("PASS foreground-query mutant rejected: " + failure)
