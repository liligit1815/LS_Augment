"""Run the real ROM-scoped crash hook and real workbench authentication chain.

Only kill/file-system boundaries are replaced. The fixture preserves the OEM
order: persist crash state, automatic i(context), then process termination.
"""
from pathlib import Path
import runpy
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-native-recents.py")))
SUPPORT, SOURCES = BASE["SUPPORT"], dict(BASE["SOURCES"])
fixture = "ls/augment/com/hook/TestNativeRecents.java"
SOURCES[fixture] = SOURCES[fixture].replace(
    "AtomicWorkbenchQuickstepTargetHook.class}",
    "AtomicWorkbenchQuickstepTargetHook.class,AtomicWorkbenchLauncherCrashHook.class}"
).replace("check(m.callbacks.size()==19,", "check(m.callbacks.size()==21,")
module = "ls/augment/com/hook/AugmentModule.java"
SOURCES[module] = SOURCES[module].replace("public int errors;", "public int errors;public boolean failLog;public Throwable captured;")
SOURCES[module] = SOURCES[module].replace("{errors++;logs.add(s);}", "{if(failLog)throw new IllegalStateException();captured=e;errors++;logs.add(s);}")
SOURCES[module] = SOURCES[module].replace("logFeatureInfo(String s){logs.add(s);}", "logFeatureInfo(String s){if(failLog)throw new IllegalStateException();logs.add(s);}")
SOURCES.update({
    "ls/augment/com/hook/FaultyThreadLocal.java": r'''package ls.augment.com.hook;public class FaultyThreadLocal<T> extends ThreadLocal<T> {static boolean injected,afterSet;static int gets,sets,removes,getAt,setAt,removeAt;public T get(){if(++gets==getAt)throw new OutOfMemoryError("scope get");return super.get();}public void set(T value){if(++sets==setAt){if(afterSet)super.set(value);throw new OutOfMemoryError("scope set");}super.set(value);}public void remove(){if(++removes==removeAt)throw new OutOfMemoryError("scope remove");super.remove();}static void reset(){gets=sets=removes=getAt=setAt=removeAt=0;afterSet=false;}}
''',

    "x1/w.java": '''package x1;public class w {public ls.augment.com.hook.AugmentModule module;public android.content.Context context;public w other;public int clears,kills,persisted,activityState;public boolean failAfter;public void i(android.content.Context c){clears++;}}''',
    "x1/w$a.java": '''package x1;public class w$a implements Thread.UncaughtExceptionHandler {final w b;public w$a(w h){b=h;}public void uncaughtException(Thread t,Throwable error){b.persisted++;b.activityState=1;try{b.module.invoke(b.other==null?b:b.other,"i",new Class<?>[]{android.content.Context.class},b.context);}catch(RuntimeException e){throw e;}catch(Throwable e){throw new AssertionError(e);}b.kills++;if(b.failAfter)throw (RuntimeException)error;}}''',
    "ls/augment/com/hook/TestLauncherCrash.java": r'''package ls.augment.com.hook;
import android.os.*;import android.content.*;import java.lang.reflect.*;
public class TestLauncherCrash {
 static int cases,checks;interface Case{void run()throws Throwable;}static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}static void test(String n,Case c)throws Throwable{c.run();cases++;System.out.println("PASS scoped launcher data protection: "+n);}
 static class F {TestNativeRecents.F f; x1.w h=new x1.w();x1.w$a callback;
  F(boolean input)throws Throwable {f=new TestNativeRecents.F();f.s.pm=new android.content.pm.PackageManager(){public android.content.pm.ApplicationInfo getApplicationInfo(String p,int flags){android.content.pm.ApplicationInfo a=super.getApplicationInfo(p,flags);if(p.equals("launcher"))a.uid=10066;return a;}};h.module=f.m;h.context=f.s;callback=new x1.w$a(h);if(input){f.e.display=88;f.down();}}
  void crash()throws Throwable {f.m.invoke(callback,"uncaughtException",new Class<?>[]{Thread.class,Throwable.class},Thread.currentThread(),new IllegalStateException("not exported user content"));}
 }
 public static void main(String[] args)throws Throwable {
 test("live authenticated injected route prevents only automatic data deletion",()->{F x=new F(true);x.crash();check(x.h.clears==0&&x.h.kills==1&&x.h.persisted==1&&x.h.activityState==1,"OEM original prefs/kill path changed or clear escaped");check(x.f.log("phase=protected"),"protection not diagnosed");});
 test("user explicit clear stays native and does not query workbench provider",()->{F x=new F(true);int reads=x.f.s.resolver.reads;x.f.m.invoke(x.h,"i",new Class<?>[]{Context.class},x.f.s);check(x.h.clears==1&&x.f.s.resolver.reads==reads,"manual reset was blocked or gated");});
 test("original handler return restores scope before later explicit reset",()->{F x=new F(true);x.crash();x.f.m.invoke(x.h,"i",new Class<?>[]{Context.class},x.f.s);check(x.h.clears==1&&x.h.kills==1,"uncaught scope leaked");});
 test("missing Root-published VD identity cannot claim active-session protection",()->{F x=new F(false);x.f.s.resolver.target.putString("display_unique_id",null);x.crash();check(x.h.clears==1&&x.h.kills==1&&x.f.log("main_display_identity_changed"),"unrelated live launcher error was protected");});
 test("session role user host owner and VD reuse boundaries retain OEM policy",()->{for(String key:new String[]{"active","session","display_id","user","host_task_id","owner_uid","updated_elapsed","unique","foreground","process_user","launcher_uid","trusted"}){F x=new F(true);if(key.equals("active"))x.f.s.resolver.target.putBoolean(key,false);else if(key.equals("session"))x.f.s.resolver.target.putLong(key,-1);else if(key.equals("updated_elapsed"))SystemClock.now+=2501;else if(key.equals("unique"))x.f.s.displays.display.unique="different-device";else if(key.equals("foreground"))x.f.host.topActivity=new ComponentName("other","other.Main");else if(key.equals("process_user"))android.os.Process.uid=1010066;else if(key.equals("launcher_uid"))x.f.s.pkg="other";else if(key.equals("trusted"))x.f.s.displays.display.flags=0;else x.f.s.resolver.target.putInt(key,-1);x.crash();check(x.h.clears==1&&x.h.kills==1&&x.f.log("phase=original_clear"),"invalid state blocked OEM clear: "+key);}});
 test("all logger sinks receive only bounded type and safe source frames",()->{F x=new F(true);x.crash();check(x.f.m.captured!=null&&x.f.m.captured.getMessage()==null&&x.f.m.captured.getCause()==null&&x.f.m.captured.getStackTrace().length<=12,"raw throwable message or cause reached logger");check(x.f.log("errorClass=java.lang.IllegalStateException")&&!x.f.log("not exported user content"),"type lost or private message logged");});
 test("Root-confirmed live main app remains protected when HOME is temporarily absent",()->{F x=new F(false);x.f.home.displayId=0;x.crash();check(x.h.clears==0&&x.h.kills==1,"valid Root session incorrectly required HOME visibility");});
 test("provider exception fails open to original automatic policy with stable reason",()->{F x=new F(true);x.f.s.resolver.fail=true;x.crash();check(x.h.clears==1&&x.h.kills==1&&x.f.log("authentication_unavailable"),"auth failure altered handler");});
 test("same-thread unrelated CrashHandler instance cannot inherit clear protection",()->{F x=new F(true);x.h.other=new x1.w();x.crash();check(x.h.other.clears==1&&x.h.kills==1,"different handler inherited scoped authorization");});
 test("unhandled exception and finally are preserved without double handler execution",()->{F x=new F(true);x.h.failAfter=true;IllegalStateException original=new IllegalStateException("original");Throwable seen=null;try{x.f.m.invoke(x.callback,"uncaughtException",new Class<?>[]{Thread.class,Throwable.class},Thread.currentThread(),original);}catch(Throwable e){seen=e;}check(seen==original&&x.h.kills==1&&x.h.persisted==1,"original exception swallowed or handler replayed");x.f.m.invoke(x.h,"i",new Class<?>[]{Context.class},x.f.s);check(x.h.clears==1,"exception leaked ThreadLocal authorization");});
 test("failed telemetry never interrupts OEM termination or protection decision",()->{F x=new F(true);x.f.m.failLog=true;x.crash();check(x.h.clears==0&&x.h.kills==1&&x.h.activityState==1,"logging changed original handler behavior");});
 test("uncaught authorization is confined to handler thread",()->{F x=new F(true);Throwable[] error={null};Thread t=new Thread(()->{try{x.f.m.invoke(x.h,"i",new Class<?>[]{Context.class},x.f.s);}catch(Throwable e){error[0]=e;}});t.start();t.join();if(error[0]!=null)throw error[0];check(x.h.clears==1,"other thread inherited clear scope");});
 if(FaultyThreadLocal.injected){
 test("scope get and clear get failures preserve original handler and clear exactly once",()->{for(int at:new int[]{1,2}){F x=new F(true);FaultyThreadLocal.reset();FaultyThreadLocal.getAt=at;x.crash();check(x.h.clears==1&&x.h.kills==1&&x.h.persisted==1,"get failure interrupted or replayed original handler: "+at);FaultyThreadLocal.reset();}});
 test("scope set failures before and after publication preserve original handler",()->{for(boolean after:new boolean[]{false,true}){F x=new F(true);FaultyThreadLocal.reset();FaultyThreadLocal.setAt=1;FaultyThreadLocal.afterSet=after;x.crash();check(x.h.clears==1&&x.h.kills==1&&x.h.persisted==1,"set failure interrupted original or retained authority");x.f.m.invoke(x.h,"i",new Class<?>[]{Context.class},x.f.s);check(x.h.clears==2,"partial set leaked authority into manual reset");FaultyThreadLocal.reset();}});
 test("failed remove plus failed fallback set leaves an inactive scope",()->{F x=new F(true);FaultyThreadLocal.reset();FaultyThreadLocal.removeAt=1;FaultyThreadLocal.setAt=2;x.crash();check(x.h.clears==0&&x.h.kills==1&&x.h.persisted==1,"cleanup replaced original result");x.f.m.invoke(x.h,"i",new Class<?>[]{Context.class},x.f.s);check(x.h.clears==1,"failed cleanup left active manual-clear protection");FaultyThreadLocal.reset();});
 test("cleanup failure cannot replace the exact original thrown exception",()->{F x=new F(true);x.h.failAfter=true;FaultyThreadLocal.reset();FaultyThreadLocal.removeAt=1;FaultyThreadLocal.setAt=2;IllegalStateException original=new IllegalStateException("same fatal");Throwable seen=null;try{x.f.m.invoke(x.callback,"uncaughtException",new Class<?>[]{Thread.class,Throwable.class},Thread.currentThread(),original);}catch(Throwable e){seen=e;}check(seen==original&&x.h.kills==1&&x.h.persisted==1,"cleanup failure replaced/replayed fatal");FaultyThreadLocal.reset();});
 }
 check(new F(true).f.m.deoptimized.stream().anyMatch(e->e.getDeclaringClass().getName().equals("x1.w$a")),"ROM inlined clear caller not deoptimized");
 System.out.println("LAUNCHER CRASH PROTECTION RESULT "+cases+" cases; "+checks+" assertions; original exception and process termination preserved");
 }
}''',
})


def main():
    production = ["hook/AtomicWorkbenchQuickstepHook.java", "hook/AtomicWorkbenchQuickstepInputHook.java",
                  "hook/AtomicWorkbenchQuickstepTargetHook.java", "hook/AtomicWorkbenchLauncherCrashHook.java"]
    with tempfile.TemporaryDirectory(prefix="lsa-launcher-crash-") as directory:
        SUPPORT["compile_run"](Path(directory), SOURCES, production, "ls.augment.com.hook.TestLauncherCrash")
    # Replace only the ThreadLocal boundary with a throwing implementation; all
    # production interception/authentication/finally methods remain unchanged.
    fault = dict(SOURCES)
    source = (SUPPORT["SRC"] / production[-1]).read_text(encoding="utf-8")
    assert "UNCAUGHT = new ThreadLocal<>();" in source
    fault["ls/augment/com/hook/AtomicWorkbenchLauncherCrashHook.java"] = source.replace("UNCAUGHT = new ThreadLocal<>();", "UNCAUGHT = new FaultyThreadLocal<>();")
    fault["ls/augment/com/hook/FaultyThreadLocal.java"] = fault["ls/augment/com/hook/FaultyThreadLocal.java"].replace("static boolean injected,", "static boolean injected=true,")
    with tempfile.TemporaryDirectory(prefix="lsa-launcher-crash-fault-") as directory:
        SUPPORT["compile_run"](Path(directory), fault, production[:-1], "ls.augment.com.hook.TestLauncherCrash")


if __name__ == "__main__":
    main()
