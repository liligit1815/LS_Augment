"""Run the production host-only system finish witnesses; no phone or services are used."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-home-hook.py")))
SUPPORT, SOURCES = BASE["SUPPORT"], dict(BASE["SOURCES"])
MODULE = "ls/augment/com/hook/AugmentModule.java"
RECORD = "com/android/server/wm/ActivityRecord.java"
PRODUCTION = ["hook/AtomicWorkbenchHomeHook.java", "AtomicWorkbenchLogPolicy.java"]
SOURCES[MODULE] = SOURCES[MODULE].replace(
    "public int errors;", "public int errors;public boolean failLog;public final List<Throwable> witnesses=new ArrayList<>();public final List<Method> deoptimized=new ArrayList<>();public final List<io.github.libxposed.api.XposedInterface.ExceptionMode> modes=new ArrayList<>();"
).replace(
    "ExceptionMode mode){return this;}", "ExceptionMode mode){modes.add(mode);return this;}"
).replace(
    "void deoptimize(Method m){", "void deoptimize(Method m){deoptimized.add(m);"
).replace(
    "{errors++;logs.add(s);}", "{if(failLog)throw new IllegalStateException(\"private sink failure\");errors++;logs.add(s);witnesses.add(e);}"
).replace(
    "logFeatureInfo(String s){logs.add(s);}", "logFeatureInfo(String s){if(failLog)throw new IllegalStateException();logs.add(s);}"
)
SOURCES["com/android/server/uri/NeededUriGrants.java"] = "package com.android.server.uri;public class NeededUriGrants{}"
SOURCES["io/github/libxposed/FinishBridge.java"] = '''package io.github.libxposed;public class FinishBridge {public static Object invoke(com.android.server.wm.ActivityRecord r,int n)throws Throwable {if(n>0)return invoke(r,n-1);return r.hooks.invoke(r,"makeFinishingLocked",new Class<?>[0]);}}'''
SOURCES["com/android/server/wm/TaskRemover.java"] = '''package com.android.server.wm;public class TaskRemover {public static Object remove(ActivityRecord r)throws Throwable{return io.github.libxposed.FinishBridge.invoke(r,20);}}'''
SOURCES["com/android/server/wm/Task.java"] = SOURCES["com/android/server/wm/Task.java"].replace("public int id=72", "public int mTaskId=4530;public int id=72")
SOURCES[RECORD] = r'''package com.android.server.wm;
public class ActivityRecord {
 public android.content.pm.ActivityInfo info;
 public android.content.ComponentName mActivityComponent;
 public int mUserId=10,display=5,fullCalls,shortCalls,makeCalls;
 public boolean finishing,failMetadata;public RuntimeException nativeFailure;
 public Task task=new Task();public ls.augment.com.hook.AugmentModule hooks;
 public Object seenIntent,seenGrants;public String seenReason;public int seenCode;public boolean seenPause;
 public ActivityRecord(android.content.pm.ActivityInfo i){info=i;mActivityComponent=new android.content.ComponentName(i.packageName,i.name);}
 public Task getTask(){if(failMetadata)throw new IllegalStateException("private metadata");return task;}
 public int getDisplayId(){return display;}
 public int finishIfPossible(int code,android.content.Intent intent,com.android.server.uri.NeededUriGrants grants,String reason,boolean pause)throws Throwable {
  fullCalls++;seenCode=code;seenIntent=intent;seenGrants=grants;seenReason=reason;seenPause=pause;
  if(nativeFailure!=null)throw nativeFailure;
  if(!finishing)hooks.invoke(this,"makeFinishingLocked",new Class<?>[0]);return 37;
 }
 public int finishIfPossible(String reason,boolean pause)throws Throwable {shortCalls++;return (Integer)hooks.invoke(this,"finishIfPossible",new Class<?>[]{int.class,android.content.Intent.class,com.android.server.uri.NeededUriGrants.class,String.class,boolean.class},0,null,null,reason,pause);}
 public void makeFinishingLocked(){makeCalls++;if(nativeFailure!=null)throw nativeFailure;finishing=true;}
}'''
SOURCES["ls/augment/com/hook/TestHostFinishObserver.java"] = r'''package ls.augment.com.hook;
import com.android.server.wm.*;import android.content.*;import java.lang.reflect.*;import java.util.*;
public class TestHostFinishObserver {
 static int cases,checks;interface Case{void run()throws Throwable;}
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void test(String n,Case c)throws Throwable{c.run();cases++;System.out.println("PASS host finish observer: "+n);}
 static final Class<?>[] FULL={int.class,Intent.class,com.android.server.uri.NeededUriGrants.class,String.class,boolean.class};
 public static class ChildRecord extends ActivityRecord {ChildRecord(android.content.pm.ActivityInfo i){super(i);}}
 static class F {
  AugmentModule m=new AugmentModule();ActivityRecord r;
  F()throws Throwable {this(false);}
  F(boolean child)throws Throwable {
   Field installed=AtomicWorkbenchHomeHook.class.getDeclaredField("installed");installed.setAccessible(true);installed.set(null,false);
   check(AtomicWorkbenchHomeHook.install(m,F.class.getClassLoader())==6&&AtomicWorkbenchHomeHook.isInstalled(),"optional observer broke original HOME installation");
   android.content.pm.ActivityInfo i=new android.content.pm.ActivityInfo();i.packageName="ls.augment.com";i.name="ls.augment.com.AtomicWorkbenchActivity";
   r=child?new ChildRecord(i):new ActivityRecord(i);r.hooks=m;m.logs.clear();m.witnesses.clear();
  }
  Object full(String reason)throws Throwable{return m.invoke(r,"finishIfPossible",FULL,23,new Intent("private intent"),new com.android.server.uri.NeededUriGrants(),reason,true);}
  long observations(){return m.logs.stream().filter(s->s.startsWith("ATOMIC_NATIVE_HOME_HOST_FINISH ")).count();}
 }
 public static void main(String[] args)throws Throwable {
  if(args.length>0){F f=new F();String missing=args[0];long hooks=f.m.registeredHookIds.stream().filter(s->s.contains(".host_finish.")).count();check(hooks==(missing.equals("full")||missing.equals("make")?1:0),"missing/wrong capability not scoped to optional observer: "+missing);check(f.m.registeredHookIds.contains("atomic_workbench.native_home.home_route")&&f.m.registeredHookIds.contains("atomic_workbench.native_home.before_display_removed"),"existing HOME routes missing");if(missing.equals("full")){f.m.invoke(f.r,"makeFinishingLocked",new Class<?>[0]);check(f.observations()==1&&f.r.makeCalls==1,"independent make observer unavailable");}System.out.println("PASS missing capability: "+missing+"; HOME routes retained");return;}
  test("exact host native full entry proceeds once with identical arguments and result",()->{F f=new F();Intent i=new Intent("private intent");Object grants=new com.android.server.uri.NeededUriGrants();Object result=f.m.invoke(f.r,"finishIfPossible",FULL,23,i,grants,"clear-task-top",true);check(result.equals(37)&&f.r.fullCalls==1&&f.r.makeCalls==1&&f.r.finishing,"native finish changed/replayed");check(f.r.seenCode==23&&f.r.seenIntent==i&&f.r.seenGrants==grants&&f.r.seenReason.equals("clear-task-top")&&f.r.seenPause,"original arguments altered");check(f.observations()==2&&f.m.logs.get(0).contains("reason=clear-task-top;task=4530;user=10;display=5"),"host reason/identity lost or duplicate event");});
  test("short framework entry has no duplicate witness",()->{F f=new F();Object result=f.m.invoke(f.r,"finishIfPossible",new Class<?>[]{String.class,boolean.class},"remove-task",false);check(result.equals(37)&&f.r.shortCalls==1&&f.r.fullCalls==1&&f.r.makeCalls==1&&f.observations()==2,"short entry duplicated witness/native execution");check(f.m.deoptimized.stream().anyMatch(m->m.getName().equals("finishIfPossible")&&m.getParameterCount()==2),"short caller not deoptimized");});
  test("direct task cleanup reaches state transition witness",()->{F f=new F();Object result=f.m.invoke(f.r,"makeFinishingLocked",new Class<?>[0]);check(result==null&&f.r.fullCalls==0&&f.r.makeCalls==1&&f.r.finishing&&f.observations()==1,"direct cleanup changed or not observed");});
  test("caller identity and server caller survive more than twelve hook bridge frames",()->{F f=new F();android.os.Binder.uid=10077;android.os.Binder.pid=456;try{TaskRemover.remove(f.r);check(f.m.logs.get(0).contains("caller_uid=10077;caller_pid=456"),"binder caller lost");Throwable witness=f.m.witnesses.get(0);check(Arrays.stream(witness.getStackTrace()).anyMatch(frame->frame.getClassName().equals("com.android.server.wm.TaskRemover")&&frame.getMethodName().equals("remove")),"server caller clipped behind hook bridges");check(Arrays.stream(witness.getStackTrace()).noneMatch(frame->frame.getClassName().startsWith("io.github.libxposed.")),"hook bridge consumed limited stack");}finally{android.os.Binder.uid=0;android.os.Binder.pid=123;}});
  test("subclass uses typed base record fields",()->{F f=new F(true);f.full("finish-activity");check(f.observations()==2&&f.r.fullCalls==1,"record subclass unsupported");});
  test("foreign package, sibling component, alias and null component stay unobserved",()->{for(ComponentName c:new ComponentName[]{new ComponentName("other","ls.augment.com.AtomicWorkbenchActivity"),new ComponentName("ls.augment.com","ls.augment.com.MainActivity"),new ComponentName("ls.augment.com",".AtomicWorkbenchActivity"),null}){F f=new F();f.r.mActivityComponent=c;f.full("foreign");check(f.r.fullCalls==1&&f.r.makeCalls==1&&f.observations()==0,"foreign activity logged or behavior changed");}});
  test("already finishing record has no repeated observations",()->{F f=new F();f.r.finishing=true;f.full("repeat");f.m.invoke(f.r,"makeFinishingLocked",new Class<?>[0]);check(f.r.fullCalls==1&&f.r.makeCalls==1&&f.observations()==0,"already finishing activity re-observed or blocked");});
  test("detached task retains native behavior and explicit absent task metadata",()->{F f=new F();f.r.task=null;f.full(null);check(f.r.fullCalls==1&&f.r.makeCalls==1&&f.observations()==2&&f.m.logs.get(0).contains("reason=none;task=-1"),"detached record failed");});
  test("throwing metadata lookup cannot interfere with either native entry",()->{F f=new F();f.r.failMetadata=true;f.full("finish-activity");check(f.r.fullCalls==1&&f.r.makeCalls==1&&f.observations()==0,"metadata failure blocked/replayed finish");});
  test("all log sink failures preserve native result and exactly once execution",()->{F f=new F();f.m.failLog=true;check(f.full("finish-activity").equals(37)&&f.r.fullCalls==1&&f.r.makeCalls==1&&f.r.finishing,"logger failure interrupted/replayed finish");});
  test("original exceptions retain identity at both entries",()->{for(String name:new String[]{"finishIfPossible","makeFinishingLocked"}){F f=new F();RuntimeException failure=new IllegalStateException("private native failure");f.r.nativeFailure=failure;Throwable seen=null;try{if(name.equals("finishIfPossible"))f.full("failure");else f.m.invoke(f.r,name,new Class<?>[0]);}catch(Throwable error){seen=error;}check(seen==failure&&f.r.fullCalls+f.r.makeCalls==1&&!f.r.finishing,"original exception replaced/swallowed/replayed");}});
  test("witness stack has no message cause or payload and survives existing telemetry policy",()->{F f=new F();f.full("finish-activity");for(Throwable t:f.m.witnesses){check(t.getMessage()==null&&t.getCause()==null&&t.getSuppressed().length==0&&t.getStackTrace().length>0&&t.getStackTrace().length<=12,"unbounded/raw throwable reached sink");check(!ls.augment.com.AtomicWorkbenchLogPolicy.stack(t).contains("omitted"),"stack rejected by existing policy");}for(String s:f.m.logs){String safe=ls.augment.com.AtomicWorkbenchLogPolicy.safe(s);check(safe.contains("task=4530")&&safe.contains("user=10")&&safe.contains("display=5"),"required identifier dropped by telemetry policy");}});
  test("unsafe reason is redacted before every sink",()->{for(String reason:new String[]{"private user content", "secret=value", "line\ncontent", "x".repeat(97)}){F f=new F();f.full(reason);check(f.m.logs.get(0).contains("reason=redacted;")&&!f.m.logs.get(0).contains(reason),"opaque reason leaked before sanitization");check(f.r.seenReason==reason,"redaction changed actual native reason");}});
  test("installation is idempotent and all finish hooks preserve exceptions",()->{F f=new F();int before=f.m.callbacks.size();check(AtomicWorkbenchHomeHook.install(f.m,F.class.getClassLoader())==6&&before==f.m.callbacks.size(),"repeated installation duplicated hooks");check(f.m.modes.stream().allMatch(mode->mode==io.github.libxposed.api.XposedInterface.ExceptionMode.PASSTHROUGH),"non-passthrough observer");});
  System.out.println("HOST FINISH OBSERVER RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def run(sources, production=PRODUCTION, args=()):
    with tempfile.TemporaryDirectory(prefix="lsa-host-finish-") as directory:
        SUPPORT["compile_run"](Path(directory), sources, production,
                               "ls.augment.com.hook.TestHostFinishObserver", arguments=args)


def main():
    run(SOURCES)
    variants = {
        "full": (RECORD, "public int finishIfPossible(int code", "public int missingFinishIfPossible(int code"),
        "make": (RECORD, "public void makeFinishingLocked()", "public void missingMakeFinishingLocked()"),
        "component_type": (RECORD, "public android.content.ComponentName mActivityComponent;", "public Object mActivityComponent;"),
        "task_type": ("com/android/server/wm/Task.java", "public int mTaskId=4530;", "public long mTaskId=4530;"),
        "display_type": (RECORD, "public int getDisplayId()", "public long getDisplayId()"),
        "static_component": (RECORD, "public android.content.ComponentName mActivityComponent;", "public static android.content.ComponentName mActivityComponent;"),
    }
    for name, (path, old, new) in variants.items():
        sources = dict(SOURCES)
        assert old in sources[path]
        sources[path] = sources[path].replace(old, new)
        run(sources, args=(name,))
    original = (SUPPORT["SRC"] / PRODUCTION[0]).read_text(encoding="utf-8")
    for name, old, new in [
        ("foreign_scope", "PACKAGE.equals(actual.getPackageName())", "true"),
        ("native_replay", "return chain.proceed();\n                    }));\n                    module.deoptimize(method);", "chain.proceed(); return chain.proceed();\n                    }));\n                    module.deoptimize(method);"),
    ]:
        sources = dict(SOURCES)
        assert old in original, name
        sources["ls/augment/com/hook/AtomicWorkbenchHomeHook.java"] = original.replace(old, new)
        try:
            run(sources, production=PRODUCTION[1:])
        except subprocess.CalledProcessError as failure:
            if Path(str(failure.cmd[0])).name.lower() not in ("java", "java.exe"):
                raise
            print(f"PASS negative control rejected: {name}", flush=True)
        else:
            raise AssertionError(f"negative control was not caught: {name}")


if __name__ == "__main__":
    main()
